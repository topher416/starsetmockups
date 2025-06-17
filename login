<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Starset Analytics – Login</title>

    <!-- Inter font to match the marketing page vibe -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap"
      rel="stylesheet"
    />

    <style>
      /* RESET */
      *,
      *::before,
      *::after {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      /* COLOR SYSTEM  — borrowed from the marketing page */
      :root {
        --bg-black: #000000;
        --bg-gray-900: #111827;
        --text-white: #ffffff;
        --text-gray-300: #d1d5db;
        --border-color: rgba(131, 140, 248, 0.3);

        /* Gradient palette */
        --coral-orange: #f99062;
        --hot-pink: #f274ba;
        --light-purple: #bd85fc;
        --periwinkle-blue: #838cf8;
      }

      html,
      body {
        height: 100%;
      }

      body {
        font-family: "Inter", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
          sans-serif;
        background: var(--bg-black);
        color: var(--text-white);
        overflow: hidden;
      }

      /* ★ Particle Background */
      #particles {
        position: fixed;
        inset: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        z-index: -1;
      }

      /* ================= LOGIN LAYOUT ================= */
      .login-wrapper {
        height: 100dvh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 1rem;
      }

      .login-card {
        width: 100%;
        max-width: 420px;
        background: rgba(17, 24, 39, 0.85); /* gray‑900 with opacity */
        border: 1px solid var(--border-color);
        border-radius: 0.75rem;
        backdrop-filter: blur(14px);
        padding: 2rem 2rem 2.5rem;
        box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.55);
      }

      .logo {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.5rem;
        margin-bottom: 1.5rem;
        font-size: 1.5rem;
        font-weight: 600;
        background: linear-gradient(
          135deg,
          var(--coral-orange),
          var(--hot-pink),
          var(--light-purple),
          var(--periwinkle-blue)
        );
        -webkit-background-clip: text;
        background-clip: text;
        -webkit-text-fill-color: transparent;
      }

      .logo img {
        height: 56px;
        width: auto;
      }

      form {
        display: grid;
        gap: 1.25rem;
      }

      label {
        display: flex;
        flex-direction: column;
        gap: 0.25rem;
        font-size: 0.875rem;
        color: var(--text-gray-300);
      }

      input[type="email"],
      input[type="password"] {
        padding: 0.75rem 1rem;
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 0.5rem;
        color: var(--text-white);
        font-size: 1rem;
        transition: border 0.25s, box-shadow 0.25s;
      }

      input::placeholder {
        color: rgba(255, 255, 255, 0.35);
      }

      input:focus {
        outline: none;
        border-color: var(--periwinkle-blue);
        box-shadow: 0 0 0 2px rgba(131, 140, 248, 0.4);
      }

      .btn-primary {
        margin-top: 0.5rem;
        width: 100%;
        padding: 0.75rem 1rem;
        font-size: 1rem;
        font-weight: 500;
        border: none;
        border-radius: 0.5rem;
        cursor: pointer;
        background: linear-gradient(
          135deg,
          var(--hot-pink),
          var(--light-purple)
        );
        color: var(--text-white);
        transition: transform 0.25s, box-shadow 0.25s;
      }

      .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(189, 133, 252, 0.35);
      }

      .btn-primary:active {
        transform: translateY(0);
      }

      .secondary-link {
        margin-top: 1rem;
        text-align: center;
        font-size: 0.875rem;
      }

      .secondary-link a {
        color: var(--periwinkle-blue);
        text-decoration: none;
        transition: color 0.25s;
      }

      .secondary-link a:hover {
        color: var(--hot-pink);
      }

      /* Small screen optimizations */
      @media (max-height: 700px) {
        .login-card {
          max-height: calc(100dvh - 2rem);
          overflow-y: auto;
        }
      }
    </style>
  </head>
  <body>
    <!-- ✨ Particle Background Canvas -->
    <canvas id="particles"></canvas>

    <main class="login-wrapper">
      <div class="login-card">
        <div class="logo">
          <!-- Replace with your actual logo path -->
          <img
            src="assets/images/logos/starset-logo.png"
            alt="Starset Analytics logo"
          />
          Starset Analytics
        </div>

        <form action="#" method="post" autocomplete="off">
          <label>
            Email
            <input
              type="email"
              name="email"
              placeholder="you@example.com"
              required
            />
          </label>

          <label>
            Password
            <input
              type="password"
              name="password"
              placeholder="••••••••"
              required
            />
          </label>

          <button type="submit" class="btn-primary">Sign in</button>
        </form>

        <p class="secondary-link">
          Don’t have an account?
          <a href="#">Request access</a>
        </p>
      </div>
    </main>

    <script>
      /* ======= BASIC STAR / PARTICLE BACKGROUND ======= */
      const canvas = document.getElementById("particles");
      const ctx = canvas.getContext("2d");
      let particles = [];

      function resizeCanvas() {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
      }

      function createParticles() {
        particles = [];
        const count = Math.min(120, (canvas.width * canvas.height) / 12000);
        for (let i = 0; i < count; i++) {
          particles.push({
            x: Math.random() * canvas.width,
            y: Math.random() * canvas.height,
            size: Math.random() * 1.5 + 0.5,
            speedX: (Math.random() - 0.5) * 0.3,
            speedY: (Math.random() - 0.5) * 0.3,
            opacity: Math.random() * 0.6 + 0.2,
          });
        }
      }

      function animate() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        particles.forEach((p) => {
          p.x += p.speedX;
          p.y += p.speedY;

          // bounce at edges
          if (p.x < 0 || p.x > canvas.width) p.speedX *= -1;
          if (p.y < 0 || p.y > canvas.height) p.speedY *= -1;

          ctx.beginPath();
          ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
          ctx.fillStyle = `rgba(131, 140, 248, ${p.opacity})`;
          ctx.fill();
        });
        requestAnimationFrame(animate);
      }

      window.addEventListener("resize", () => {
        resizeCanvas();
        createParticles();
      });

      resizeCanvas();
      createParticles();
      animate();
    </script>
  </body>
</html>
