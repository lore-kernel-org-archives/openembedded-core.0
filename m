Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 360F3701AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 16:15:55 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so4445001wib.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FDQYXd0vpr6w4zRnbGFB3acteBxu9C+YHFyysjGk8y8=;
	b=wLlTt4sSBXpIdhSHWQUJoVr8nt79TqV7Ah2dGfApdHpydOPbnXxrTXESXCoCQZ851S
	Y+/K4ldqqEAGKv/b7xd7VfDYOVIx5Wj2+XVmOhNSp9vppUEEEYec8Zor45iFqljPiXIH
	JFQmPG7JpvLdwGUOJ2fueKjhyz3EqeJCJaTj8WQKjv9vIUTlulTNXOkbjHVDTOBRihqR
	0ssCeIWSy+XaEImyDxxFvZHVL2U9zdK4iOeuoLj5VhABpC0/Ls8s0DE2AQZZiAESVT4Y
	9Ddvc2bsJeIUxl7UPbV+dS5mMN3mNpsbmbaxwWFyYGCUT4VI4asrDKAdeo9kc+CsDHEl
	k3tg==
X-Received: by 10.180.73.109 with SMTP id k13mr18163833wiv.11.1406823355026;
	Thu, 31 Jul 2014 09:15:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm14356233wjx.26.2014.07.31.09.15.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jul 2014 09:15:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jul 2014 18:16:17 +0200
Message-Id: <1406823377-25184-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH] mesa-demos: upgrade to 8.2.0 and allow building without GLEW/GLU
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jul 2014 16:15:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-mesa-demos-Add-missing-data-files.patch   |  33 +-
 ...s-Use-DEMOS_DATA_DIR-to-locate-data-files.patch | 234 ------------
 ...mplement-with-AC_WITH-glut-so-that-withou.patch |  54 +++
 ...llow-to-disable-demos-which-require-GLEW-.patch | 420 +++++++++++++++++++++
 ...4-Use-DEMOS_DATA_DIR-to-locate-data-files.patch | 234 ++++++++++++
 ...hen-EGL_MESA_screen_surface-extension-isn.patch | 267 +++++++++++++
 ...ay-for-EGL_MESA_screen_surface-extension-.patch |  41 ++
 .../0007-Install-few-more-test-programs.patch      |  74 ++++
 ...dd-few-missing-.glsl-.vert-.frag-files-to.patch | 101 +++++
 ...glsl-perf-Install-.glsl-.vert-.frag-files.patch |  73 ++++
 .../egl-mesa-screen-surface-build-fix.patch        | 257 -------------
 .../mesa-demos/egl-mesa-screen-surface-query.patch |  35 --
 meta/recipes-graphics/mesa/mesa-demos/glut.patch   |  46 ---
 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb     |  53 ---
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |  53 +++
 15 files changed, 1334 insertions(+), 641 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0005-Fix-build-when-EGL_MESA_screen_surface-extension-isn.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0006-Query-display-for-EGL_MESA_screen_surface-extension-.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-build-fix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-query.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/glut.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Add-missing-data-files.patch b/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Add-missing-data-files.patch
index c785103..93ee9c2 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Add-missing-data-files.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Add-missing-data-files.patch
@@ -1,7 +1,7 @@
-From 87f9a62329d7c5f4d351fbb63a41f2a1935fb2f1 Mon Sep 17 00:00:00 2001
+From b695c3a3fa3f4cd48c13aa26542110de27075518 Mon Sep 17 00:00:00 2001
 From: Drew Moseley <drew_moseley@mentor.com>
 Date: Mon, 12 May 2014 15:22:32 -0400
-Subject: [PATCH] mesa-demos: Add missing data files.
+Subject: [PATCH 1/9] mesa-demos: Add missing data files.
 
 Add some data files that are present in the git repository:
    http://cgit.freedesktop.org/mesa/demos/tree/?id=mesa-demos-8.1.0
@@ -10,20 +10,21 @@ but not in the release tarball
 
 Upstream-Status: Backport
 Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/fpglsl/depth-read.glsl      |    4 +
- src/fpglsl/infinite-loop.glsl   |    7 +
- src/glsl/CH11-bumpmaptex.frag   |   47 +++++++
- src/glsl/blinking-teapot.frag   |   31 +++++
- src/glsl/blinking-teapot.vert   |   16 +++
- src/glsl/convolution.frag       |   21 +++
- src/glsl/simplex-noise.glsl     |  279 +++++++++++++++++++++++++++++++++++++++
- src/glsl/skinning.vert          |   24 ++++
- src/perf/glslstateschange1.frag |   19 +++
- src/perf/glslstateschange1.vert |   14 ++
- src/perf/glslstateschange2.frag |   17 +++
- src/perf/glslstateschange2.vert |   14 ++
- src/vpglsl/infinite-loop.glsl   |    8 ++
+ src/fpglsl/depth-read.glsl      |   4 +
+ src/fpglsl/infinite-loop.glsl   |   7 +
+ src/glsl/CH11-bumpmaptex.frag   |  47 +++++++
+ src/glsl/blinking-teapot.frag   |  31 +++++
+ src/glsl/blinking-teapot.vert   |  16 +++
+ src/glsl/convolution.frag       |  21 +++
+ src/glsl/simplex-noise.glsl     | 279 ++++++++++++++++++++++++++++++++++++++++
+ src/glsl/skinning.vert          |  24 ++++
+ src/perf/glslstateschange1.frag |  19 +++
+ src/perf/glslstateschange1.vert |  14 ++
+ src/perf/glslstateschange2.frag |  17 +++
+ src/perf/glslstateschange2.vert |  14 ++
+ src/vpglsl/infinite-loop.glsl   |   8 ++
  13 files changed, 501 insertions(+)
  create mode 100644 src/fpglsl/depth-read.glsl
  create mode 100644 src/fpglsl/infinite-loop.glsl
@@ -619,5 +620,5 @@ index 0000000..bc7ae4b
 +   gl_FrontColor = sum;
 +}
 -- 
-1.7.9.5
+2.0.0
 
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Use-DEMOS_DATA_DIR-to-locate-data-files.patch b/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
deleted file mode 100644
index c89f878..0000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From bc7fa67d13e8032601df5cf04e15c53a7204dcd7 Mon Sep 17 00:00:00 2001
-From: Drew Moseley <drew_moseley@mentor.com>
-Date: Fri, 9 May 2014 11:50:24 -0400
-Subject: [PATCH] mesa-demos: Use DEMOS_DATA_DIR to locate data files
-
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=78496]
-Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
----
- src/glsl/bezier.c           |    2 +-
- src/glsl/blinking-teapot.c  |    4 ++--
- src/glsl/brick.c            |    4 ++--
- src/glsl/bump.c             |    6 +++---
- src/glsl/convolutions.c     |    2 +-
- src/glsl/mandelbrot.c       |    4 ++--
- src/glsl/multitex.c         |    4 ++--
- src/glsl/simplex-noise.c    |    2 +-
- src/glsl/skinning.c         |    4 ++--
- src/glsl/texdemo1.c         |    8 ++++----
- src/glsl/toyball.c          |    4 ++--
- src/objviewer/objview.c     |   12 ++++++------
- src/perf/glslstateschange.c |    8 ++++----
- 13 files changed, 32 insertions(+), 32 deletions(-)
-
-diff --git a/src/glsl/bezier.c b/src/glsl/bezier.c
-index 0b56bc1..e01603d 100644
---- a/src/glsl/bezier.c
-+++ b/src/glsl/bezier.c
-@@ -13,7 +13,7 @@
- #include "glut_wrap.h"
- #include "shaderutil.h"
- 
--static const char *filename = "bezier.geom";
-+static const char *filename = DEMOS_DATA_DIR "bezier.geom";
- 
- static GLuint fragShader;
- static GLuint vertShader;
-diff --git a/src/glsl/blinking-teapot.c b/src/glsl/blinking-teapot.c
-index e3bf24d..7662b1f 100644
---- a/src/glsl/blinking-teapot.c
-+++ b/src/glsl/blinking-teapot.c
-@@ -63,8 +63,8 @@ init_opengl (void)
-      exit(1);
-   }     
- 
--  vshad_id = CompileShaderFile (GL_VERTEX_SHADER, "blinking-teapot.vert");
--  fshad_id = CompileShaderFile (GL_FRAGMENT_SHADER, "blinking-teapot.frag");
-+  vshad_id = CompileShaderFile (GL_VERTEX_SHADER, DEMOS_DATA_DIR "blinking-teapot.vert");
-+  fshad_id = CompileShaderFile (GL_FRAGMENT_SHADER, DEMOS_DATA_DIR "blinking-teapot.frag");
-   prog_id = LinkShaders (vshad_id, fshad_id);
- 
-   UseProgram (prog_id);
-diff --git a/src/glsl/brick.c b/src/glsl/brick.c
-index 3021856..fe5f190 100644
---- a/src/glsl/brick.c
-+++ b/src/glsl/brick.c
-@@ -14,8 +14,8 @@
- #include "shaderutil.h"
- 
- 
--static char *FragProgFile = "CH06-brick.frag";
--static char *VertProgFile = "CH06-brick.vert";
-+static char *FragProgFile = DEMOS_DATA_DIR "CH06-brick.frag";
-+static char *VertProgFile = DEMOS_DATA_DIR "CH06-brick.vert";
- 
- /* program/shader objects */
- static GLuint fragShader;
-diff --git a/src/glsl/bump.c b/src/glsl/bump.c
-index 59f62cd..3a1b20a 100644
---- a/src/glsl/bump.c
-+++ b/src/glsl/bump.c
-@@ -15,9 +15,9 @@
- #include "readtex.h"
- 
- 
--static char *FragProgFile = "CH11-bumpmap.frag";
--static char *FragTexProgFile = "CH11-bumpmaptex.frag";
--static char *VertProgFile = "CH11-bumpmap.vert";
-+static char *FragProgFile = DEMOS_DATA_DIR "CH11-bumpmap.frag";
-+static char *FragTexProgFile = DEMOS_DATA_DIR "CH11-bumpmaptex.frag";
-+static char *VertProgFile = DEMOS_DATA_DIR "CH11-bumpmap.vert";
- static char *TextureFile = DEMOS_DATA_DIR "tile.rgb";
- 
- /* program/shader objects */
-diff --git a/src/glsl/convolutions.c b/src/glsl/convolutions.c
-index a120cfe..9312f00 100644
---- a/src/glsl/convolutions.c
-+++ b/src/glsl/convolutions.c
-@@ -340,7 +340,7 @@ static void init(void)
- 
-    menuInit();
-    readTexture(textureLocation);
--   createProgram("convolution.vert", "convolution.frag");
-+   createProgram(DEMOS_DATA_DIR "convolution.vert", DEMOS_DATA_DIR "convolution.frag");
- 
-    glEnable(GL_TEXTURE_2D);
-    glClearColor(1.0, 1.0, 1.0, 1.0);
-diff --git a/src/glsl/mandelbrot.c b/src/glsl/mandelbrot.c
-index 31ede1d..ab34a0f 100644
---- a/src/glsl/mandelbrot.c
-+++ b/src/glsl/mandelbrot.c
-@@ -14,8 +14,8 @@
- #include "shaderutil.h"
- 
- 
--static char *FragProgFile = "CH18-mandel.frag";
--static char *VertProgFile = "CH18-mandel.vert";
-+static char *FragProgFile = DEMOS_DATA_DIR "CH18-mandel.frag";
-+static char *VertProgFile = DEMOS_DATA_DIR "CH18-mandel.vert";
- 
- /* program/shader objects */
- static GLuint fragShader;
-diff --git a/src/glsl/multitex.c b/src/glsl/multitex.c
-index 262ea50..546bd27 100644
---- a/src/glsl/multitex.c
-+++ b/src/glsl/multitex.c
-@@ -35,8 +35,8 @@
- 
- static const char *Demo = "multitex";
- 
--static const char *VertFile = "multitex.vert";
--static const char *FragFile = "multitex.frag";
-+static const char *VertFile = DEMOS_DATA_DIR "multitex.vert";
-+static const char *FragFile = DEMOS_DATA_DIR "multitex.frag";
- 
- static const char *TexFiles[2] = 
-    {
-diff --git a/src/glsl/simplex-noise.c b/src/glsl/simplex-noise.c
-index 13fdd5d..885f01e 100644
---- a/src/glsl/simplex-noise.c
-+++ b/src/glsl/simplex-noise.c
-@@ -169,7 +169,7 @@ SpecialKey(int key, int x, int y)
- static void
- Init(void)
- {
--   const char *filename = "simplex-noise.glsl";
-+   const char *filename = DEMOS_DATA_DIR "simplex-noise.glsl";
-    char noiseText[10000];
-    FILE *f;
-    int len;
-diff --git a/src/glsl/skinning.c b/src/glsl/skinning.c
-index bf38d77..536d475 100644
---- a/src/glsl/skinning.c
-+++ b/src/glsl/skinning.c
-@@ -20,8 +20,8 @@
- #define M_PI 3.1415926535
- #endif
- 
--static char *FragProgFile = "skinning.frag";
--static char *VertProgFile = "skinning.vert";
-+static char *FragProgFile = DEMOS_DATA_DIR "skinning.frag";
-+static char *VertProgFile = DEMOS_DATA_DIR "skinning.vert";
- 
- /* program/shader objects */
- static GLuint fragShader;
-diff --git a/src/glsl/texdemo1.c b/src/glsl/texdemo1.c
-index 6cde239..a082342 100644
---- a/src/glsl/texdemo1.c
-+++ b/src/glsl/texdemo1.c
-@@ -35,11 +35,11 @@
- 
- static const char *Demo = "texdemo1";
- 
--static const char *ReflectVertFile = "reflect.vert";
--static const char *CubeFragFile = "cubemap.frag";
-+static const char *ReflectVertFile = DEMOS_DATA_DIR "reflect.vert";
-+static const char *CubeFragFile = DEMOS_DATA_DIR "cubemap.frag";
- 
--static const char *SimpleVertFile = "simple.vert";
--static const char *SimpleTexFragFile = "shadowtex.frag";
-+static const char *SimpleVertFile = DEMOS_DATA_DIR "simple.vert";
-+static const char *SimpleTexFragFile = DEMOS_DATA_DIR "shadowtex.frag";
- 
- static const char *GroundImage = DEMOS_DATA_DIR "tile.rgb";
- 
-diff --git a/src/glsl/toyball.c b/src/glsl/toyball.c
-index 5f27951..4e7e832 100644
---- a/src/glsl/toyball.c
-+++ b/src/glsl/toyball.c
-@@ -14,8 +14,8 @@
- #include "shaderutil.h"
- 
- 
--static char *FragProgFile = "CH11-toyball.frag";
--static char *VertProgFile = "CH11-toyball.vert";
-+static char *FragProgFile = DEMOS_DATA_DIR "CH11-toyball.frag";
-+static char *VertProgFile = DEMOS_DATA_DIR "CH11-toyball.vert";
- 
- /* program/shader objects */
- static GLuint fragShader;
-diff --git a/src/objviewer/objview.c b/src/objviewer/objview.c
-index 6def726..78a6acf 100644
---- a/src/objviewer/objview.c
-+++ b/src/objviewer/objview.c
-@@ -162,12 +162,12 @@ init_model(void)
- static void
- init_skybox(void)
- {
--   SkyboxTex = LoadSkyBoxCubeTexture("alpine_east.rgb",
--                                     "alpine_west.rgb",
--                                     "alpine_up.rgb",
--                                     "alpine_down.rgb",
--                                     "alpine_south.rgb",
--                                     "alpine_north.rgb");
-+   SkyboxTex = LoadSkyBoxCubeTexture(DEMOS_DATA_DIR "alpine_east.rgb",
-+                                     DEMOS_DATA_DIR "alpine_west.rgb",
-+                                     DEMOS_DATA_DIR "alpine_up.rgb",
-+                                     DEMOS_DATA_DIR "alpine_down.rgb",
-+                                     DEMOS_DATA_DIR "alpine_south.rgb",
-+                                     DEMOS_DATA_DIR "alpine_north.rgb");
-    glmSpecularTexture(Model, SkyboxTex);
- }
- 
-diff --git a/src/perf/glslstateschange.c b/src/perf/glslstateschange.c
-index 7422b78..dbf8332 100644
---- a/src/perf/glslstateschange.c
-+++ b/src/perf/glslstateschange.c
-@@ -33,10 +33,10 @@
- #include "glmain.h"
- #include "common.h"
- 
--static const char *VertFile1 = "glslstateschange1.vert";
--static const char *FragFile1 = "glslstateschange1.frag";
--static const char *VertFile2 = "glslstateschange2.vert";
--static const char *FragFile2 = "glslstateschange2.frag";
-+static const char *VertFile1 = DEMOS_DATA_DIR "glslstateschange1.vert";
-+static const char *FragFile1 = DEMOS_DATA_DIR "glslstateschange1.frag";
-+static const char *VertFile2 = DEMOS_DATA_DIR "glslstateschange2.vert";
-+static const char *FragFile2 = DEMOS_DATA_DIR "glslstateschange2.frag";
- static struct uniform_info Uniforms1[] = {
-    { "tex1",  1, GL_SAMPLER_2D, { 0, 0, 0, 0 }, -1 },
-    { "tex2",  1, GL_SAMPLER_2D, { 1, 0, 0, 0 }, -1 },
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch b/meta/recipes-graphics/mesa/mesa-demos/0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch
new file mode 100644
index 0000000..c96af12
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch
@@ -0,0 +1,54 @@
+From 36829a8d7ad2888515fbee95c2a70b3d636d7538 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 9 Jul 2014 14:30:33 +0200
+Subject: [PATCH 2/9] Correctly implement with AC_WITH(glut) so that
+ --without-glut works.
+
+---
+ configure.ac | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c4ee12b..9445424 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -67,21 +67,25 @@ DEMO_CFLAGS="$DEMO_CFLAGS $GL_CFLAGS"
+ DEMO_LIBS="$DEMO_LIBS $GL_LIBS"
+ 
+ dnl Check for GLUT
+-GLUT_CFLAGS=""
+-GLUT_LIBS=-lglut
+-glut_enabled=yes
++glut_enabled=no
+ AC_ARG_WITH([glut],
+ 	[AS_HELP_STRING([--with-glut=DIR],
+ 			[glut install directory])],
+ 	[GLUT_CFLAGS="-I$withval/include"
+-	 GLUT_LIBS="-L$withval/lib -lglut"])
+-AC_CHECK_HEADER([GL/glut.h],
+-		[],
+-		[glut_enabled=no])
+-AC_CHECK_LIB([glut],
+-		[glutInit],
+-		[],
+-		[glut_enabled=no])
++	 GLUT_LIBS="-L$withval/lib -lglut"],
++	[GLUT_CFLAGS=""
++	 GLUT_LIBS="-lglut"]
++        )
++AS_IF([test "x$with_glut" != xno],
++      [AC_CHECK_HEADER([GL/glut.h],
++                       [],
++                       [glut_enabled=no])
++       AC_CHECK_LIB([glut],
++                    [glutInit],
++                    [],
++                    [glut_enabled=no])
++       glut_enabled=yes
++])
+ 
+ dnl Check for FreeGLUT 2.6 or later
+ AC_EGREP_HEADER([glutInitContextProfile],
+-- 
+2.0.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
new file mode 100644
index 0000000..e02f1ab
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
@@ -0,0 +1,420 @@
+From b25e9c675cf560b8b037dc855c6b3b1d09957867 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 9 Jul 2014 14:23:41 +0200
+Subject: [PATCH 3/9] configure: Allow to disable demos which require GLEW or
+ GLU
+
+* in some systems without X11 support we don't have GLEW, but
+  mesa-demos are still useful
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac                  | 49 ++++++++++++++++++++---------
+ src/Makefile.am               | 14 ++++++---
+ src/demos/Makefile.am         | 73 ++++++++++++++++++++++++-------------------
+ src/egl/Makefile.am           |  8 +++--
+ src/egl/opengles1/Makefile.am | 44 +++++++++++++++-----------
+ src/egl/opengles2/Makefile.am | 33 ++++++++++---------
+ 6 files changed, 135 insertions(+), 86 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9445424..bc4c8d1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -93,25 +93,44 @@ AC_EGREP_HEADER([glutInitContextProfile],
+ 		[AC_DEFINE(HAVE_FREEGLUT)],
+ 		[])
+ 
+-dnl Check for GLEW
+-PKG_CHECK_MODULES(GLEW, [glew >= 1.5.4])
+-DEMO_CFLAGS="$DEMO_CFLAGS $GLEW_CFLAGS"
+-DEMO_LIBS="$DEMO_LIBS $GLEW_LIBS"
++AC_ARG_ENABLE([glew],
++    [AS_HELP_STRING([--enable-glew],
++        [build demos which require glew @<:@default=yes@:>@])],
++    [enable_glew="$enableval"],
++    [enable_glew=yes]
++)
++
++if test "x$enable_glew" = xyes; then
++    dnl Check for GLEW
++    PKG_CHECK_MODULES(GLEW, [glew >= 1.5.4], [glew_enabled=yes], [glew_enabled=no])
++    DEMO_CFLAGS="$DEMO_CFLAGS $GLEW_CFLAGS"
++    DEMO_LIBS="$DEMO_LIBS $GLEW_LIBS"
++fi
+ 
+ # LIBS was set by AC_CHECK_LIB above
+ LIBS=""
+ 
+-PKG_CHECK_MODULES(GLU, [glu], [],
+-		  [AC_CHECK_HEADER([GL/glu.h],
+-				   [],
+-		  		   AC_MSG_ERROR([GLU not found]))
+-		   AC_CHECK_LIB([GLU],
+-				[gluBeginCurve],
+-				[GLU_LIBS=-lGLU],
+-				AC_MSG_ERROR([GLU required])) ])
++AC_ARG_ENABLE([glu],
++    [AS_HELP_STRING([--enable-glu],
++        [build demos which require glu @<:@default=yes@:>@])],
++    [enable_glu="$enableval"],
++    [enable_glu=yes]
++)
+ 
+-DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
+-DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
++if test "x$enable_glu" = xyes; then
++    PKG_CHECK_MODULES(GLU, [glu], [],
++                     [AC_CHECK_HEADER([GL/glu.h],
++                                      [],
++                                      AC_MSG_ERROR([GLU not found]))
++                      AC_CHECK_LIB([GLU],
++                                   [gluBeginCurve],
++                                   [GLU_LIBS=-lGLU
++				    glu_enabled=yes],
++                                   AC_MSG_ERROR([GLU required])) ])
++
++    DEMO_CFLAGS="$DEMO_CFLAGS $GLU_CFLAGS"
++    DEMO_LIBS="$DEMO_LIBS $GLU_LIBS"
++fi
+ 
+ AC_ARG_ENABLE([egl],
+     [AS_HELP_STRING([--enable-egl],
+@@ -304,6 +323,8 @@ AC_SUBST([WAYLAND_CFLAGS])
+ AC_SUBST([WAYLAND_LIBS])
+ 
+ 
++AM_CONDITIONAL(HAVE_GLU, test "x$glu_enabled" = "xyes")
++AM_CONDITIONAL(HAVE_GLEW, test "x$glew_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_EGL, test "x$egl_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_GLESV1, test "x$glesv1_enabled" = "xyes")
+ AM_CONDITIONAL(HAVE_GLESV2, test "x$glesv2_enabled" = "xyes")
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 1647d64..754c47c 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -23,14 +23,13 @@
+ #    Eric Anholt <eric@anholt.net>
+ 
+ SUBDIRS = \
+-	util \
+ 	data \
+ 	demos \
+ 	egl \
+ 	fp \
+ 	fpglsl \
+ 	glsl \
+-        gs \
++	gs \
+ 	objviewer \
+ 	osdemos \
+ 	perf \
+@@ -40,8 +39,13 @@ SUBDIRS = \
+ 	slang \
+ 	tests \
+ 	tools \
+-	trivial \
+-	vp \
+-	vpglsl \
+ 	wgl \
+ 	xdemos
++
++if HAVE_GLEW
++SUBDIRS += \
++	vp \
++	vpglsl \
++	util \
++	trivial
++endif
+diff --git a/src/demos/Makefile.am b/src/demos/Makefile.am
+index 41603fa..ab1e3ab 100644
+--- a/src/demos/Makefile.am
++++ b/src/demos/Makefile.am
+@@ -30,91 +30,100 @@ AM_LDFLAGS = \
+ 	$(DEMO_LIBS) \
+ 	$(GLUT_LIBS)
+ 
++bin_PROGRAMS =
++
+ if HAVE_GLUT
+-bin_PROGRAMS = \
++if HAVE_GLEW
++bin_PROGRAMS += \
+ 	arbfplight \
+ 	arbfslight \
+ 	arbocclude \
+ 	arbocclude2 \
+-	bounce \
+-	clearspd \
+ 	copypix \
+ 	cubemap \
+ 	cuberender \
+ 	dinoshade \
+-	dissolve \
+-	drawpix \
+ 	engine \
+ 	fbo_firecube \
+ 	fbotexture \
+-	fire \
+ 	fogcoord \
+ 	fplight \
+ 	fslight \
++	gloss \
++	isosurf \
++	multiarb \
++	paltex \
++	pointblast \
++	projtex \
++	shadowtex \
++	spriteblast \
++	stex3d \
++	textures \
++	vao_demo \
++	winpos
++
++copypix_LDADD = ../util/libutil.la
++cubemap_LDADD = ../util/libutil.la
++cuberender_LDADD = ../util/libutil.la
++engine_LDADD = ../util/libutil.la
++fbo_firecube_LDADD = ../util/libutil.la
++gloss_LDADD = ../util/libutil.la
++isosurf_LDADD = ../util/libutil.la
++multiarb_LDADD = ../util/libutil.la
++projtex_LDADD = ../util/libutil.la
++textures_LDADD = ../util/libutil.la
++winpos_LDADD = ../util/libutil.la
++endif
++
++if HAVE_GLU
++bin_PROGRAMS += \
++	bounce \
++	clearspd \
++	dissolve \
++	drawpix \
++	fire \
+ 	gamma \
+ 	gearbox \
+ 	gears \
+ 	geartrain \
+ 	glinfo \
+-	gloss \
+ 	gltestperf \
+ 	ipers \
+-	isosurf \
+ 	lodbias \
+ 	morph3d \
+-	multiarb \
+-	paltex \
+ 	pixeltest \
+-	pointblast \
+-	projtex \
+ 	ray \
+ 	readpix \
+ 	reflect \
+ 	renormal \
+-	shadowtex \
+ 	singlebuffer \
+ 	spectex \
+-	spriteblast \
+-	stex3d \
+ 	teapot \
+ 	terrain \
+ 	tessdemo \
+ 	texcyl \
+ 	texenv \
+-	textures \
+ 	trispd \
+ 	tunnel2 \
+-	tunnel \
+-	vao_demo \
+-	winpos
+-endif
++	tunnel
+ 
+ tunnel_SOURCES = \
+ 	tunnel.c \
+ 	tunneldat.h
+ 
+-copypix_LDADD = ../util/libutil.la
+-cubemap_LDADD = ../util/libutil.la
+-cuberender_LDADD = ../util/libutil.la
+-drawpix_LDADD = ../util/libutil.la
+ dissolve_LDADD = ../util/libutil.la
+-engine_LDADD = ../util/libutil.la
+-fbo_firecube_LDADD = ../util/libutil.la
++drawpix_LDADD = ../util/libutil.la
+ fire_LDADD = ../util/libutil.la
+-gloss_LDADD = ../util/libutil.la
+ ipers_LDADD = ../util/libutil.la
+-isosurf_LDADD = ../util/libutil.la
+ lodbias_LDADD = ../util/libutil.la
+-multiarb_LDADD = ../util/libutil.la
+-projtex_LDADD = ../util/libutil.la
+ readpix_LDADD = ../util/libutil.la
+ reflect_LDADD = ../util/libutil.la
+ teapot_LDADD = ../util/libutil.la
+ texcyl_LDADD = ../util/libutil.la
+-textures_LDADD = ../util/libutil.la
+ tunnel_LDADD = ../util/libutil.la
+ tunnel2_LDADD = ../util/libutil.la
+-winpos_LDADD = ../util/libutil.la
++endif
++endif
+ 
+ EXTRA_DIST = \
+ 	README
+diff --git a/src/egl/Makefile.am b/src/egl/Makefile.am
+index d64a49e..4fe1ca8 100644
+--- a/src/egl/Makefile.am
++++ b/src/egl/Makefile.am
+@@ -24,8 +24,12 @@
+ 
+ SUBDIRS = \
+ 	eglut \
+-	opengl \
+-	openvg \
+ 	opengles1 \
+ 	opengles2 \
+ 	oes_vg
++
++if HAVE_GLU
++SUBDIRS += \
++	opengl \
++	openvg
++endif
+diff --git a/src/egl/opengles1/Makefile.am b/src/egl/opengles1/Makefile.am
+index 7a9828d..3455e75 100644
+--- a/src/egl/opengles1/Makefile.am
++++ b/src/egl/opengles1/Makefile.am
+@@ -36,28 +36,43 @@ AM_LDFLAGS = \
+ 	$(EGL_LIBS) \
+ 	-lm
+ 
++noinst_PROGRAMS =
++
+ if HAVE_EGL
+ if HAVE_GLESV1
+-noinst_PROGRAMS = \
+-	bindtex \
+-	clear \
++noinst_PROGRAMS += \
+ 	drawtex_screen \
++	gears_screen \
++	torus_screen \
++	tri_screen
++
++drawtex_screen_SOURCES = drawtex.c
++gears_screen_SOURCES = gears.c
++torus_screen_SOURCES = torus.c
++tri_screen_SOURCES = tri.c
++
++drawtex_screen_LDADD = ../eglut/libeglut_screen.la
++gears_screen_LDADD = ../eglut/libeglut_screen.la
++torus_screen_LDADD = ../eglut/libeglut_screen.la
++tri_screen_LDADD = ../eglut/libeglut_screen.la
++
++if HAVE_X11
++noinst_PROGRAMS += \
++	clear
++
++bin_PROGRAMS = \
++	bindtex \
+ 	drawtex_x11 \
+ 	eglfbdev \
+ 	es1_info \
+-	gears_screen \
+ 	gears_x11 \
+ 	msaa \
+ 	pbuffer\
+ 	render_tex \
+ 	texture_from_pixmap \
+-	torus_screen \
+ 	torus_x11 \
+-	tri_screen \
+ 	tri_x11 \
+ 	two_win
+-endif
+-endif
+ 
+ bindtex_LDADD = $(X11_LIBS)
+ es1_info_LDADD = $(X11_LIBS)
+@@ -71,22 +86,15 @@ two_win_LDADD = $(X11_LIBS)
+ clear_LDADD = ../eglut/libeglut_x11.la $(EGL_LIBS) $(X11_LIBS)
+ clear_LDFLAGS =
+ 
+-drawtex_screen_SOURCES = drawtex.c
+-gears_screen_SOURCES = gears.c
+-torus_screen_SOURCES = torus.c
+-tri_screen_SOURCES = tri.c
+-
+ drawtex_x11_SOURCES = drawtex.c
+ gears_x11_SOURCES = gears.c
+ torus_x11_SOURCES = torus.c
+ tri_x11_SOURCES = tri.c
+ 
+-drawtex_screen_LDADD = ../eglut/libeglut_screen.la
+-gears_screen_LDADD = ../eglut/libeglut_screen.la
+-torus_screen_LDADD = ../eglut/libeglut_screen.la
+-tri_screen_LDADD = ../eglut/libeglut_screen.la
+-
+ drawtex_x11_LDADD = ../eglut/libeglut_x11.la
+ gears_x11_LDADD = ../eglut/libeglut_x11.la
+ torus_x11_LDADD = ../eglut/libeglut_x11.la
+ tri_x11_LDADD = ../eglut/libeglut_x11.la
++endif
++endif
++endif
+diff --git a/src/egl/opengles2/Makefile.am b/src/egl/opengles2/Makefile.am
+index 41c1b80..74af460 100644
+--- a/src/egl/opengles2/Makefile.am
++++ b/src/egl/opengles2/Makefile.am
+@@ -36,26 +36,29 @@ AM_LDFLAGS = \
+ if HAVE_EGL
+ if HAVE_GLESV2
+ bin_PROGRAMS = \
+-	es2_info \
+-	es2gears_screen \
+-	es2gears_x11 \
+-	es2tri
++	es2gears_screen
++
++es2gears_screen_SOURCES = es2gears.c
++es2gears_screen_LDADD = ../eglut/libeglut_screen.la
++
+ if HAVE_WAYLAND
+ bin_PROGRAMS += es2gears_wayland
+-endif
+-endif
+-endif
+ 
+-es2_info_LDADD = $(X11_LIBS)
+-es2tri_LDADD = $(X11_LIBS)
++es2gears_wayland_SOURCES = es2gears.c
++es2gears_wayland_LDADD = ../eglut/libeglut_wayland.la
++endif
+ 
+-es2gears_screen_SOURCES = es2gears.c
++if HAVE_X11
++bin_PROGRAMS += \
++	es2tri \
++	es2_info \
++	es2gears_x11
+ 
++es2_info_LDADD = $(X11_LIBS)
+ es2gears_x11_SOURCES = es2gears.c
+-
+-es2gears_screen_LDADD = ../eglut/libeglut_screen.la
+-
+ es2gears_x11_LDADD = ../eglut/libeglut_x11.la
++es2tri_LDADD = $(X11_LIBS)
++endif
++endif
++endif
+ 
+-es2gears_wayland_SOURCES = es2gears.c
+-es2gears_wayland_LDADD = ../eglut/libeglut_wayland.la
+-- 
+2.0.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch b/meta/recipes-graphics/mesa/mesa-demos/0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
new file mode 100644
index 0000000..f77b97f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch
@@ -0,0 +1,234 @@
+From 5e10108d76a59abac21c7e540bcfd2ddaccca2cb Mon Sep 17 00:00:00 2001
+From: Drew Moseley <drew_moseley@mentor.com>
+Date: Fri, 9 May 2014 11:50:24 -0400
+Subject: [PATCH 4/9] Use DEMOS_DATA_DIR to locate data files
+
+Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=78496]
+Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
+---
+ src/glsl/bezier.c           |  2 +-
+ src/glsl/blinking-teapot.c  |  4 ++--
+ src/glsl/brick.c            |  4 ++--
+ src/glsl/bump.c             |  6 +++---
+ src/glsl/convolutions.c     |  2 +-
+ src/glsl/mandelbrot.c       |  4 ++--
+ src/glsl/multitex.c         |  4 ++--
+ src/glsl/simplex-noise.c    |  2 +-
+ src/glsl/skinning.c         |  4 ++--
+ src/glsl/texdemo1.c         |  8 ++++----
+ src/glsl/toyball.c          |  4 ++--
+ src/objviewer/objview.c     | 12 ++++++------
+ src/perf/glslstateschange.c |  8 ++++----
+ 13 files changed, 32 insertions(+), 32 deletions(-)
+
+diff --git a/src/glsl/bezier.c b/src/glsl/bezier.c
+index 0b56bc1..e01603d 100644
+--- a/src/glsl/bezier.c
++++ b/src/glsl/bezier.c
+@@ -13,7 +13,7 @@
+ #include "glut_wrap.h"
+ #include "shaderutil.h"
+ 
+-static const char *filename = "bezier.geom";
++static const char *filename = DEMOS_DATA_DIR "bezier.geom";
+ 
+ static GLuint fragShader;
+ static GLuint vertShader;
+diff --git a/src/glsl/blinking-teapot.c b/src/glsl/blinking-teapot.c
+index e3bf24d..7662b1f 100644
+--- a/src/glsl/blinking-teapot.c
++++ b/src/glsl/blinking-teapot.c
+@@ -63,8 +63,8 @@ init_opengl (void)
+      exit(1);
+   }     
+ 
+-  vshad_id = CompileShaderFile (GL_VERTEX_SHADER, "blinking-teapot.vert");
+-  fshad_id = CompileShaderFile (GL_FRAGMENT_SHADER, "blinking-teapot.frag");
++  vshad_id = CompileShaderFile (GL_VERTEX_SHADER, DEMOS_DATA_DIR "blinking-teapot.vert");
++  fshad_id = CompileShaderFile (GL_FRAGMENT_SHADER, DEMOS_DATA_DIR "blinking-teapot.frag");
+   prog_id = LinkShaders (vshad_id, fshad_id);
+ 
+   UseProgram (prog_id);
+diff --git a/src/glsl/brick.c b/src/glsl/brick.c
+index 3021856..fe5f190 100644
+--- a/src/glsl/brick.c
++++ b/src/glsl/brick.c
+@@ -14,8 +14,8 @@
+ #include "shaderutil.h"
+ 
+ 
+-static char *FragProgFile = "CH06-brick.frag";
+-static char *VertProgFile = "CH06-brick.vert";
++static char *FragProgFile = DEMOS_DATA_DIR "CH06-brick.frag";
++static char *VertProgFile = DEMOS_DATA_DIR "CH06-brick.vert";
+ 
+ /* program/shader objects */
+ static GLuint fragShader;
+diff --git a/src/glsl/bump.c b/src/glsl/bump.c
+index 59f62cd..3a1b20a 100644
+--- a/src/glsl/bump.c
++++ b/src/glsl/bump.c
+@@ -15,9 +15,9 @@
+ #include "readtex.h"
+ 
+ 
+-static char *FragProgFile = "CH11-bumpmap.frag";
+-static char *FragTexProgFile = "CH11-bumpmaptex.frag";
+-static char *VertProgFile = "CH11-bumpmap.vert";
++static char *FragProgFile = DEMOS_DATA_DIR "CH11-bumpmap.frag";
++static char *FragTexProgFile = DEMOS_DATA_DIR "CH11-bumpmaptex.frag";
++static char *VertProgFile = DEMOS_DATA_DIR "CH11-bumpmap.vert";
+ static char *TextureFile = DEMOS_DATA_DIR "tile.rgb";
+ 
+ /* program/shader objects */
+diff --git a/src/glsl/convolutions.c b/src/glsl/convolutions.c
+index a120cfe..9312f00 100644
+--- a/src/glsl/convolutions.c
++++ b/src/glsl/convolutions.c
+@@ -340,7 +340,7 @@ static void init(void)
+ 
+    menuInit();
+    readTexture(textureLocation);
+-   createProgram("convolution.vert", "convolution.frag");
++   createProgram(DEMOS_DATA_DIR "convolution.vert", DEMOS_DATA_DIR "convolution.frag");
+ 
+    glEnable(GL_TEXTURE_2D);
+    glClearColor(1.0, 1.0, 1.0, 1.0);
+diff --git a/src/glsl/mandelbrot.c b/src/glsl/mandelbrot.c
+index 31ede1d..ab34a0f 100644
+--- a/src/glsl/mandelbrot.c
++++ b/src/glsl/mandelbrot.c
+@@ -14,8 +14,8 @@
+ #include "shaderutil.h"
+ 
+ 
+-static char *FragProgFile = "CH18-mandel.frag";
+-static char *VertProgFile = "CH18-mandel.vert";
++static char *FragProgFile = DEMOS_DATA_DIR "CH18-mandel.frag";
++static char *VertProgFile = DEMOS_DATA_DIR "CH18-mandel.vert";
+ 
+ /* program/shader objects */
+ static GLuint fragShader;
+diff --git a/src/glsl/multitex.c b/src/glsl/multitex.c
+index 262ea50..546bd27 100644
+--- a/src/glsl/multitex.c
++++ b/src/glsl/multitex.c
+@@ -35,8 +35,8 @@
+ 
+ static const char *Demo = "multitex";
+ 
+-static const char *VertFile = "multitex.vert";
+-static const char *FragFile = "multitex.frag";
++static const char *VertFile = DEMOS_DATA_DIR "multitex.vert";
++static const char *FragFile = DEMOS_DATA_DIR "multitex.frag";
+ 
+ static const char *TexFiles[2] = 
+    {
+diff --git a/src/glsl/simplex-noise.c b/src/glsl/simplex-noise.c
+index 13fdd5d..885f01e 100644
+--- a/src/glsl/simplex-noise.c
++++ b/src/glsl/simplex-noise.c
+@@ -169,7 +169,7 @@ SpecialKey(int key, int x, int y)
+ static void
+ Init(void)
+ {
+-   const char *filename = "simplex-noise.glsl";
++   const char *filename = DEMOS_DATA_DIR "simplex-noise.glsl";
+    char noiseText[10000];
+    FILE *f;
+    int len;
+diff --git a/src/glsl/skinning.c b/src/glsl/skinning.c
+index bf38d77..536d475 100644
+--- a/src/glsl/skinning.c
++++ b/src/glsl/skinning.c
+@@ -20,8 +20,8 @@
+ #define M_PI 3.1415926535
+ #endif
+ 
+-static char *FragProgFile = "skinning.frag";
+-static char *VertProgFile = "skinning.vert";
++static char *FragProgFile = DEMOS_DATA_DIR "skinning.frag";
++static char *VertProgFile = DEMOS_DATA_DIR "skinning.vert";
+ 
+ /* program/shader objects */
+ static GLuint fragShader;
+diff --git a/src/glsl/texdemo1.c b/src/glsl/texdemo1.c
+index 6cde239..a082342 100644
+--- a/src/glsl/texdemo1.c
++++ b/src/glsl/texdemo1.c
+@@ -35,11 +35,11 @@
+ 
+ static const char *Demo = "texdemo1";
+ 
+-static const char *ReflectVertFile = "reflect.vert";
+-static const char *CubeFragFile = "cubemap.frag";
++static const char *ReflectVertFile = DEMOS_DATA_DIR "reflect.vert";
++static const char *CubeFragFile = DEMOS_DATA_DIR "cubemap.frag";
+ 
+-static const char *SimpleVertFile = "simple.vert";
+-static const char *SimpleTexFragFile = "shadowtex.frag";
++static const char *SimpleVertFile = DEMOS_DATA_DIR "simple.vert";
++static const char *SimpleTexFragFile = DEMOS_DATA_DIR "shadowtex.frag";
+ 
+ static const char *GroundImage = DEMOS_DATA_DIR "tile.rgb";
+ 
+diff --git a/src/glsl/toyball.c b/src/glsl/toyball.c
+index 5f27951..4e7e832 100644
+--- a/src/glsl/toyball.c
++++ b/src/glsl/toyball.c
+@@ -14,8 +14,8 @@
+ #include "shaderutil.h"
+ 
+ 
+-static char *FragProgFile = "CH11-toyball.frag";
+-static char *VertProgFile = "CH11-toyball.vert";
++static char *FragProgFile = DEMOS_DATA_DIR "CH11-toyball.frag";
++static char *VertProgFile = DEMOS_DATA_DIR "CH11-toyball.vert";
+ 
+ /* program/shader objects */
+ static GLuint fragShader;
+diff --git a/src/objviewer/objview.c b/src/objviewer/objview.c
+index 6def726..78a6acf 100644
+--- a/src/objviewer/objview.c
++++ b/src/objviewer/objview.c
+@@ -162,12 +162,12 @@ init_model(void)
+ static void
+ init_skybox(void)
+ {
+-   SkyboxTex = LoadSkyBoxCubeTexture("alpine_east.rgb",
+-                                     "alpine_west.rgb",
+-                                     "alpine_up.rgb",
+-                                     "alpine_down.rgb",
+-                                     "alpine_south.rgb",
+-                                     "alpine_north.rgb");
++   SkyboxTex = LoadSkyBoxCubeTexture(DEMOS_DATA_DIR "alpine_east.rgb",
++                                     DEMOS_DATA_DIR "alpine_west.rgb",
++                                     DEMOS_DATA_DIR "alpine_up.rgb",
++                                     DEMOS_DATA_DIR "alpine_down.rgb",
++                                     DEMOS_DATA_DIR "alpine_south.rgb",
++                                     DEMOS_DATA_DIR "alpine_north.rgb");
+    glmSpecularTexture(Model, SkyboxTex);
+ }
+ 
+diff --git a/src/perf/glslstateschange.c b/src/perf/glslstateschange.c
+index 7422b78..dbf8332 100644
+--- a/src/perf/glslstateschange.c
++++ b/src/perf/glslstateschange.c
+@@ -33,10 +33,10 @@
+ #include "glmain.h"
+ #include "common.h"
+ 
+-static const char *VertFile1 = "glslstateschange1.vert";
+-static const char *FragFile1 = "glslstateschange1.frag";
+-static const char *VertFile2 = "glslstateschange2.vert";
+-static const char *FragFile2 = "glslstateschange2.frag";
++static const char *VertFile1 = DEMOS_DATA_DIR "glslstateschange1.vert";
++static const char *FragFile1 = DEMOS_DATA_DIR "glslstateschange1.frag";
++static const char *VertFile2 = DEMOS_DATA_DIR "glslstateschange2.vert";
++static const char *FragFile2 = DEMOS_DATA_DIR "glslstateschange2.frag";
+ static struct uniform_info Uniforms1[] = {
+    { "tex1",  1, GL_SAMPLER_2D, { 0, 0, 0, 0 }, -1 },
+    { "tex2",  1, GL_SAMPLER_2D, { 1, 0, 0, 0 }, -1 },
+-- 
+2.0.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0005-Fix-build-when-EGL_MESA_screen_surface-extension-isn.patch b/meta/recipes-graphics/mesa/mesa-demos/0005-Fix-build-when-EGL_MESA_screen_surface-extension-isn.patch
new file mode 100644
index 0000000..aac2a37
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0005-Fix-build-when-EGL_MESA_screen_surface-extension-isn.patch
@@ -0,0 +1,267 @@
+From 453353a221de9c64479f4372565d2cd8591b36cc Mon Sep 17 00:00:00 2001
+From: Frank Binns <frank.binns@imgtec.com>
+Date: Fri, 29 Jun 2012 11:26:04 +0100
+Subject: [PATCH 5/9] Fix build when EGL_MESA_screen_surface extension isn't
+ present
+
+The EGL demos won't build against EGL implementations that don't support
+the EGL_MESA_screen_surface extension. Fix this, in most cases, by
+wrapping relevant bits of code in #ifdef EGL_MESA_screen_surface.
+
+Signed-off-by: Frank Binns <frank.binns@imgtec.com>
+
+Applied and fixed up in Yocto by...
+
+Integrated-by: Tom Zanussi <tom.zanussi@linux.intel.com>
+
+Upstream-Status: Pending
+---
+ src/egl/eglut/eglut.c        |  9 +++++++--
+ src/egl/eglut/eglut_screen.c | 14 ++++++++++++++
+ src/egl/opengl/demo1.c       |  2 ++
+ src/egl/opengl/demo2.c       |  7 ++++++-
+ src/egl/opengl/demo3.c       |  7 ++++++-
+ 5 files changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/src/egl/eglut/eglut.c b/src/egl/eglut/eglut.c
+index 2ee6f15..f6a2ad4 100644
+--- a/src/egl/eglut/eglut.c
++++ b/src/egl/eglut/eglut.c
+@@ -76,8 +76,9 @@ _eglutNow(void)
+ static void
+ _eglutDestroyWindow(struct eglut_window *win)
+ {
+-   if (_eglut->surface_type != EGL_PBUFFER_BIT &&
+-       _eglut->surface_type != EGL_SCREEN_BIT_MESA)
++
++   if (_eglut->surface_type == EGL_WINDOW_BIT ||
++       _eglut->surface_type == EGL_PIXMAP_BIT)
+       eglDestroySurface(_eglut->dpy, win->surface);
+ 
+    _eglutNativeFiniWindow(win);
+@@ -175,7 +176,9 @@ _eglutCreateWindow(const char *title, int x, int y, int w, int h)
+             win->config, win->native.u.pixmap, NULL);
+       break;
+    case EGL_PBUFFER_BIT:
++#ifdef EGL_MESA_screen_surface
+    case EGL_SCREEN_BIT_MESA:
++#endif
+       win->surface = win->native.u.surface;
+       break;
+    default:
+@@ -289,8 +292,10 @@ eglutDestroyWindow(int win)
+    if (window->index != win)
+       return;
+ 
++#ifdef EGL_MESA_screen_surface
+    /* XXX it causes some bug in st/egl KMS backend */
+    if ( _eglut->surface_type != EGL_SCREEN_BIT_MESA)
++#endif
+       eglMakeCurrent(_eglut->dpy, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
+ 
+    _eglutDestroyWindow(_eglut->current);
+diff --git a/src/egl/eglut/eglut_screen.c b/src/egl/eglut/eglut_screen.c
+index 021a8f1..094a4e2 100644
+--- a/src/egl/eglut/eglut_screen.c
++++ b/src/egl/eglut/eglut_screen.c
+@@ -35,26 +35,33 @@
+ 
+ #define MAX_MODES 100
+ 
++#ifdef EGL_MESA_screen_surface
+ static EGLScreenMESA kms_screen;
+ static EGLModeMESA kms_mode;
+ static EGLint kms_width, kms_height;
++#endif
+ 
+ void
+ _eglutNativeInitDisplay(void)
+ {
++#ifdef EGL_MESA_screen_surface
+    _eglut->native_dpy = EGL_DEFAULT_DISPLAY;
+    _eglut->surface_type = EGL_SCREEN_BIT_MESA;
++#endif
+ }
+ 
+ void
+ _eglutNativeFiniDisplay(void)
+ {
++#ifdef EGL_MESA_screen_surface
+    kms_screen = 0;
+    kms_mode = 0;
+    kms_width = 0;
+    kms_height = 0;
++#endif
+ }
+ 
++#ifdef EGL_MESA_screen_surface
+ static void
+ init_kms(void)
+ {
+@@ -94,19 +101,23 @@ init_kms(void)
+    kms_width = width;
+    kms_height = height;
+ }
++#endif
+ 
+ void
+ _eglutNativeInitWindow(struct eglut_window *win, const char *title,
+                        int x, int y, int w, int h)
+ {
++#ifdef EGL_MESA_screen_surface
+    EGLint surf_attribs[16];
+    EGLint i;
++#endif
+    const char *exts;
+ 
+    exts = eglQueryString(_eglut->dpy, EGL_EXTENSIONS);
+    if (!exts || !strstr(exts, "EGL_MESA_screen_surface"))
+       _eglutFatal("EGL_MESA_screen_surface is not supported\n");
+ 
++#ifdef EGL_MESA_screen_surface
+    init_kms();
+ 
+    i = 0;
+@@ -128,14 +139,17 @@ _eglutNativeInitWindow(struct eglut_window *win, const char *title,
+ 
+    win->native.width = kms_width;
+    win->native.height = kms_height;
++#endif
+ }
+ 
+ void
+ _eglutNativeFiniWindow(struct eglut_window *win)
+ {
++#ifdef EGL_MESA_screen_surface
+    eglShowScreenSurfaceMESA(_eglut->dpy,
+          kms_screen, EGL_NO_SURFACE, 0);
+    eglDestroySurface(_eglut->dpy, win->native.u.surface);
++#endif
+ }
+ 
+ void
+diff --git a/src/egl/opengl/demo1.c b/src/egl/opengl/demo1.c
+index d892734..3a3564c 100644
+--- a/src/egl/opengl/demo1.c
++++ b/src/egl/opengl/demo1.c
+@@ -18,6 +18,7 @@
+ static void
+ TestScreens(EGLDisplay dpy)
+ {
++#ifdef EGL_MESA_screen_surface
+ #define MAX 8
+    EGLScreenMESA screens[MAX];
+    EGLint numScreens;
+@@ -28,6 +29,7 @@ TestScreens(EGLDisplay dpy)
+    for (i = 0; i < numScreens; i++) {
+       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
+    }
++#endif
+ }
+ 
+ /**
+diff --git a/src/egl/opengl/demo2.c b/src/egl/opengl/demo2.c
+index 505b474..bfef59e 100644
+--- a/src/egl/opengl/demo2.c
++++ b/src/egl/opengl/demo2.c
+@@ -16,6 +16,7 @@
+ 
+ /*#define FRONTBUFFER*/
+ 
++#ifdef EGL_MESA_screen_surface
+ static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2,
+                           GLfloat r, GLfloat g, GLfloat b)
+ {
+@@ -95,12 +96,13 @@ TestScreens(EGLDisplay dpy)
+       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
+    }
+ }
+-
++#endif
+ 
+ int
+ main(int argc, char *argv[])
+ {
+    int maj, min;
++#ifdef EGL_MESA_screen_surface
+    EGLContext ctx;
+    EGLSurface pbuffer, screen_surf;
+    EGLConfig configs[10];
+@@ -115,6 +117,7 @@ main(int argc, char *argv[])
+    EGLModeMESA mode;
+    EGLScreenMESA screen;
+    EGLint count;
++#endif
+ 
+    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
+    assert(d);
+@@ -132,6 +135,7 @@ main(int argc, char *argv[])
+       exit(1);
+    }
+ 
++#ifdef EGL_MESA_screen_surface
+    eglGetConfigs(d, configs, 10, &numConfigs);
+    printf("Got %d EGL configs:\n", numConfigs);
+    for (i = 0; i < numConfigs; i++) {
+@@ -211,6 +215,7 @@ main(int argc, char *argv[])
+    eglDestroySurface(d, pbuffer);
+    eglDestroyContext(d, ctx);
+    eglTerminate(d);
++#endif
+ 
+    return 0;
+ }
+diff --git a/src/egl/opengl/demo3.c b/src/egl/opengl/demo3.c
+index f84ca23..31b5d8b 100644
+--- a/src/egl/opengl/demo3.c
++++ b/src/egl/opengl/demo3.c
+@@ -46,7 +46,7 @@ GLubyte OpenGL_bits[] = {
+    0x3e, 0x00, 0x00, 0xf8, 0x0c, 0x00, 
+ };
+ 
+-
++#ifdef EGL_MESA_screen_surface
+ static void Init(void)
+ {
+ 
+@@ -551,11 +551,13 @@ write_ppm(const char *filename, const GLubyte *buffer, int width, int height)
+       fclose(f);
+    }
+ }
++#endif
+ 
+ int
+ main(int argc, char *argv[])
+ {
+    int maj, min;
++#ifdef EGL_MESA_screen_surface
+    EGLContext ctx;
+    EGLSurface screen_surf;
+    EGLConfig configs[10];
+@@ -566,6 +568,7 @@ main(int argc, char *argv[])
+    const GLubyte *bitmap;
+    EGLint screenAttribs[32];
+    EGLint i;
++#endif
+ 
+    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
+    assert(d);
+@@ -583,6 +586,7 @@ main(int argc, char *argv[])
+       exit(1);
+    }
+ 
++#ifdef EGL_MESA_screen_surface
+    eglGetConfigs(d, configs, 10, &numConfigs);
+    eglGetScreensMESA(d, &screen, 1, &count);
+    eglGetModesMESA(d, screen, &mode, 1, &count);
+@@ -642,6 +646,7 @@ main(int argc, char *argv[])
+    eglDestroySurface(d, screen_surf);
+    eglDestroyContext(d, ctx);
+    eglTerminate(d);
++#endif
+ 
+    return 0;
+ }
+-- 
+2.0.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0006-Query-display-for-EGL_MESA_screen_surface-extension-.patch b/meta/recipes-graphics/mesa/mesa-demos/0006-Query-display-for-EGL_MESA_screen_surface-extension-.patch
new file mode 100644
index 0000000..12e0805
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0006-Query-display-for-EGL_MESA_screen_surface-extension-.patch
@@ -0,0 +1,41 @@
+From 6a19dba1d275579c73e7763b0554410ff4e1e650 Mon Sep 17 00:00:00 2001
+From: Frank Binns <frank.binns@imgtec.com>
+Date: Fri, 29 Jun 2012 12:00:26 +0100
+Subject: [PATCH 6/9] Query display for EGL_MESA_screen_surface extension
+ before using it
+
+This code makes heavy use of the EGL_MESA_screen_surface extension so
+check the display to determine if it's supported by the underlying EGL
+implementation. If it doesn't then bail.
+
+Signed-off-by: Frank Binns <frank.binns@imgtec.com>
+
+Applied and fixed up in Yocto by...
+
+Integrated-by: Tom Zanussi <tom.zanussi@linux.intel.com>
+
+Upstream-Status: Pending
+---
+ src/egl/opengl/demo1.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/egl/opengl/demo1.c b/src/egl/opengl/demo1.c
+index 3a3564c..06e2138 100644
+--- a/src/egl/opengl/demo1.c
++++ b/src/egl/opengl/demo1.c
+@@ -110,6 +110,12 @@ main(int argc, char *argv[])
+    printf("EGL version = %d.%d\n", maj, min);
+    printf("EGL_VENDOR = %s\n", eglQueryString(d, EGL_VENDOR));
+ 
++   if (!strstr(eglQueryString(d, EGL_EXTENSIONS),
++               "EGL_MESA_screen_surface")) {
++      printf("EGL_MESA_screen_surface is not supported\n");
++      exit(1);
++   }
++
+    eglGetConfigs(d, NULL, 0, &numConfigs);
+    configs = malloc(sizeof(*configs) *numConfigs);
+    eglGetConfigs(d, configs, numConfigs, &numConfigs);
+-- 
+2.0.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch b/meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch
new file mode 100644
index 0000000..89d2fac
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0007-Install-few-more-test-programs.patch
@@ -0,0 +1,74 @@
+From d930b2da57f7c9efb80c8cef8f8adad15bbbc0d3 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 10 Jul 2014 14:30:52 +0200
+Subject: [PATCH 7/9] Install few more test programs
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/egl/opengl/Makefile.am    |  2 +-
+ src/egl/opengles1/Makefile.am | 10 ++++------
+ src/egl/openvg/Makefile.am    |  2 +-
+ 3 files changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/src/egl/opengl/Makefile.am b/src/egl/opengl/Makefile.am
+index 0c7228f..87b2f1a 100644
+--- a/src/egl/opengl/Makefile.am
++++ b/src/egl/opengl/Makefile.am
+@@ -50,7 +50,7 @@ endif
+ endif
+ 
+ if HAVE_EGL
+-noinst_PROGRAMS = \
++bin_PROGRAMS = \
+ 	demo1 \
+ 	demo2 \
+ 	demo3 \
+diff --git a/src/egl/opengles1/Makefile.am b/src/egl/opengles1/Makefile.am
+index 3455e75..516e516 100644
+--- a/src/egl/opengles1/Makefile.am
++++ b/src/egl/opengles1/Makefile.am
+@@ -36,11 +36,11 @@ AM_LDFLAGS = \
+ 	$(EGL_LIBS) \
+ 	-lm
+ 
+-noinst_PROGRAMS =
++bin_PROGRAMS =
+ 
+ if HAVE_EGL
+ if HAVE_GLESV1
+-noinst_PROGRAMS += \
++bin_PROGRAMS += \
+ 	drawtex_screen \
+ 	gears_screen \
+ 	torus_screen \
+@@ -57,10 +57,8 @@ torus_screen_LDADD = ../eglut/libeglut_screen.la
+ tri_screen_LDADD = ../eglut/libeglut_screen.la
+ 
+ if HAVE_X11
+-noinst_PROGRAMS += \
+-	clear
+-
+-bin_PROGRAMS = \
++bin_PROGRAMS += \
++	clear \
+ 	bindtex \
+ 	drawtex_x11 \
+ 	eglfbdev \
+diff --git a/src/egl/openvg/Makefile.am b/src/egl/openvg/Makefile.am
+index 7318a43..b545225 100644
+--- a/src/egl/openvg/Makefile.am
++++ b/src/egl/openvg/Makefile.am
+@@ -49,7 +49,7 @@ endif
+ 
+ if HAVE_EGL
+ if HAVE_VG
+-noinst_PROGRAMS = \
++bin_PROGRAMS = \
+ 	lion_screen \
+ 	sp_screen \
+ 	$(EGL_X11_DEMOS)
+-- 
+2.0.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch b/meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch
new file mode 100644
index 0000000..a608575
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch
@@ -0,0 +1,101 @@
+From 0b6f95f9b8ece22e9856c150e4be29fd86eaf546 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 10 Jul 2014 14:29:27 +0200
+Subject: [PATCH 8/9] glsl, perf: Add few missing .glsl, .vert, .frag files to
+ EXTRA_DATA
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/fpglsl/Makefile.am |  2 ++
+ src/glsl/Makefile.am   | 10 ++++++++--
+ src/perf/Makefile.am   |  6 ++++++
+ src/vpglsl/Makefile.am |  1 +
+ 4 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/src/fpglsl/Makefile.am b/src/fpglsl/Makefile.am
+index 47c1039..fd43c91 100644
+--- a/src/fpglsl/Makefile.am
++++ b/src/fpglsl/Makefile.am
+@@ -39,10 +39,12 @@ noinst_PROGRAMS = \
+ endif
+ 
+ EXTRA_DIST = \
++	depth-read.glsl \
+ 	dowhile2.glsl \
+ 	dowhile.glsl \
+ 	forbreak.glsl \
+ 	for.glsl \
++	infinite-loop.glsl \
+ 	mov.glsl \
+ 	mov-imm.glsl \
+ 	simpleif.glsl \
+diff --git a/src/glsl/Makefile.am b/src/glsl/Makefile.am
+index 4faa8db..079a29d 100644
+--- a/src/glsl/Makefile.am
++++ b/src/glsl/Makefile.am
+@@ -37,7 +37,7 @@ AM_LDFLAGS = \
+ if HAVE_GLUT
+ bin_PROGRAMS = \
+ 	array \
+-        bezier \
++	bezier \
+ 	bitmap \
+ 	brick \
+ 	bump \
+@@ -123,12 +123,16 @@ EXTRA_DIST = \
+ 	CH06-brick.vert \
+ 	CH11-bumpmap.frag \
+ 	CH11-bumpmap.vert \
++	CH11-bumpmaptex.frag \
+ 	CH11-toyball.frag \
+ 	CH11-toyball.vert \
+ 	CH18-mandel.frag \
+ 	CH18-mandel.vert \
+-        bezier.geom \
++	bezier.geom \
+ 	brick.shtest \
++	blinking-teapot.frag \
++	blinking-teapot.vert \
++	convolution.frag \
+ 	convolution.vert \
+ 	cubemap.frag \
+ 	mandelbrot.shtest \
+@@ -138,5 +142,7 @@ EXTRA_DIST = \
+ 	reflect.vert \
+ 	shadowtex.frag \
+ 	simple.vert \
++	simplex-noise.glsl \
+ 	skinning.frag \
++	skinning.vert \
+ 	toyball.shtest
+diff --git a/src/perf/Makefile.am b/src/perf/Makefile.am
+index 5363c58..c5cca8d 100644
+--- a/src/perf/Makefile.am
++++ b/src/perf/Makefile.am
+@@ -57,3 +57,9 @@ bin_PROGRAMS = \
+ endif
+ 
+ glslstateschange_LDADD = libperf.la ../util/libutil.la
++
++EXTRA_DIST = \
++	glslstateschange1.frag \
++	glslstateschange1.vert \
++	glslstateschange2.frag \
++	glslstateschange2.vert
+diff --git a/src/vpglsl/Makefile.am b/src/vpglsl/Makefile.am
+index 4a85ed4..48b08f4 100644
+--- a/src/vpglsl/Makefile.am
++++ b/src/vpglsl/Makefile.am
+@@ -44,6 +44,7 @@ EXTRA_DIST = \
+ 	func2.glsl \
+ 	ifelse.glsl \
+ 	if.glsl \
++	infinite-loop.glsl \
+ 	mov.glsl \
+ 	nestedifs.glsl \
+ 	nestedswizzle.glsl \
+-- 
+2.0.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch b/meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch
new file mode 100644
index 0000000..1262dee
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch
@@ -0,0 +1,73 @@
+From c8c3de5417d6b6c7d7579c528c0cab718f4bfdb6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 10 Jul 2014 14:48:12 +0200
+Subject: [PATCH 9/9] glsl, perf: Install .glsl, .vert, .frag files
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/fpglsl/Makefile.am | 3 ++-
+ src/glsl/Makefile.am   | 3 ++-
+ src/perf/Makefile.am   | 3 ++-
+ src/vpglsl/Makefile.am | 3 ++-
+ 4 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/src/fpglsl/Makefile.am b/src/fpglsl/Makefile.am
+index fd43c91..2bf51de 100644
+--- a/src/fpglsl/Makefile.am
++++ b/src/fpglsl/Makefile.am
+@@ -38,7 +38,8 @@ noinst_PROGRAMS = \
+ 	fp-tri
+ endif
+ 
+-EXTRA_DIST = \
++demosdatadir=$(datadir)/$(PACKAGE)/
++dist_demosdata_DATA= \
+ 	depth-read.glsl \
+ 	dowhile2.glsl \
+ 	dowhile.glsl \
+diff --git a/src/glsl/Makefile.am b/src/glsl/Makefile.am
+index 079a29d..f66ec29 100644
+--- a/src/glsl/Makefile.am
++++ b/src/glsl/Makefile.am
+@@ -118,7 +118,8 @@ vert_or_frag_only_LDADD = ../util/libutil.la
+ vert_tex_LDADD = ../util/libutil.la
+ vsraytrace_LDADD = ../util/libutil.la
+ 
+-EXTRA_DIST = \
++demosdatadir=$(datadir)/$(PACKAGE)/
++dist_demosdata_DATA= \
+ 	CH06-brick.frag \
+ 	CH06-brick.vert \
+ 	CH11-bumpmap.frag \
+diff --git a/src/perf/Makefile.am b/src/perf/Makefile.am
+index c5cca8d..140256d 100644
+--- a/src/perf/Makefile.am
++++ b/src/perf/Makefile.am
+@@ -58,7 +58,8 @@ endif
+ 
+ glslstateschange_LDADD = libperf.la ../util/libutil.la
+ 
+-EXTRA_DIST = \
++demosdatadir=$(datadir)/$(PACKAGE)/
++dist_demosdata_DATA= \
+ 	glslstateschange1.frag \
+ 	glslstateschange1.vert \
+ 	glslstateschange2.frag \
+diff --git a/src/vpglsl/Makefile.am b/src/vpglsl/Makefile.am
+index 48b08f4..5526867 100644
+--- a/src/vpglsl/Makefile.am
++++ b/src/vpglsl/Makefile.am
+@@ -38,7 +38,8 @@ noinst_PROGRAMS = \
+ 	vp-tris
+ endif
+ 
+-EXTRA_DIST = \
++demosdatadir=$(datadir)/$(PACKAGE)/
++dist_demosdata_DATA= \
+ 	for.glsl \
+ 	func.glsl \
+ 	func2.glsl \
+-- 
+2.0.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-build-fix.patch b/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-build-fix.patch
deleted file mode 100644
index 46a3e98..0000000
--- a/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-build-fix.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From ab76f645e29b0a603ff95d88f976bc35ab6301ee Mon Sep 17 00:00:00 2001
-From: Frank Binns <frank.binns@imgtec.com>
-Date: Fri, 29 Jun 2012 11:26:04 +0100
-Subject: [PATCH 1/2] mesa-demos: Fix build when EGL_MESA_screen_surface
- extension isn't present
-
-The EGL demos won't build against EGL implementations that don't support 
-the EGL_MESA_screen_surface extension. Fix this, in most cases, by 
-wrapping relevant bits of code in #ifdef EGL_MESA_screen_surface.
-
-Signed-off-by: Frank Binns <frank.binns@imgtec.com>
-
-Applied and fixed up in Yocto by...
-
-Integrated-by: Tom Zanussi <tom.zanussi@linux.intel.com>
-
-Upstream-Status: Pending
-
-Index: mesa-demos-8.0.1/src/egl/eglut/eglut.c
-===================================================================
---- mesa-demos-8.0.1.orig/src/egl/eglut/eglut.c
-+++ mesa-demos-8.0.1/src/egl/eglut/eglut.c
-@@ -51,8 +51,9 @@ _eglutNow(void)
- static void
- _eglutDestroyWindow(struct eglut_window *win)
- {
--   if (_eglut->surface_type != EGL_PBUFFER_BIT &&
--       _eglut->surface_type != EGL_SCREEN_BIT_MESA)
-+
-+   if (_eglut->surface_type == EGL_WINDOW_BIT ||
-+       _eglut->surface_type == EGL_PIXMAP_BIT)
-       eglDestroySurface(_eglut->dpy, win->surface);
- 
-    _eglutNativeFiniWindow(win);
-@@ -150,7 +151,9 @@ _eglutCreateWindow(const char *title, in
-             win->config, win->native.u.pixmap, NULL);
-       break;
-    case EGL_PBUFFER_BIT:
-+#ifdef EGL_MESA_screen_surface
-    case EGL_SCREEN_BIT_MESA:
-+#endif
-       win->surface = win->native.u.surface;
-       break;
-    default:
-@@ -264,8 +267,10 @@ eglutDestroyWindow(int win)
-    if (window->index != win)
-       return;
- 
-+#ifdef EGL_MESA_screen_surface
-    /* XXX it causes some bug in st/egl KMS backend */
-    if ( _eglut->surface_type != EGL_SCREEN_BIT_MESA)
-+#endif
-       eglMakeCurrent(_eglut->dpy, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
- 
-    _eglutDestroyWindow(_eglut->current);
-Index: mesa-demos-8.0.1/src/egl/eglut/eglut_screen.c
-===================================================================
---- mesa-demos-8.0.1.orig/src/egl/eglut/eglut_screen.c
-+++ mesa-demos-8.0.1/src/egl/eglut/eglut_screen.c
-@@ -10,26 +10,33 @@
- 
- #define MAX_MODES 100
- 
-+#ifdef EGL_MESA_screen_surface
- static EGLScreenMESA kms_screen;
- static EGLModeMESA kms_mode;
- static EGLint kms_width, kms_height;
-+#endif
- 
- void
- _eglutNativeInitDisplay(void)
- {
-+#ifdef EGL_MESA_screen_surface
-    _eglut->native_dpy = EGL_DEFAULT_DISPLAY;
-    _eglut->surface_type = EGL_SCREEN_BIT_MESA;
-+#endif
- }
- 
- void
- _eglutNativeFiniDisplay(void)
- {
-+#ifdef EGL_MESA_screen_surface
-    kms_screen = 0;
-    kms_mode = 0;
-    kms_width = 0;
-    kms_height = 0;
-+#endif
- }
- 
-+#ifdef EGL_MESA_screen_surface
- static void
- init_kms(void)
- {
-@@ -69,19 +76,23 @@ init_kms(void)
-    kms_width = width;
-    kms_height = height;
- }
-+#endif
- 
- void
- _eglutNativeInitWindow(struct eglut_window *win, const char *title,
-                        int x, int y, int w, int h)
- {
-+#ifdef EGL_MESA_screen_surface
-    EGLint surf_attribs[16];
-    EGLint i;
-+#endif
-    const char *exts;
- 
-    exts = eglQueryString(_eglut->dpy, EGL_EXTENSIONS);
-    if (!exts || !strstr(exts, "EGL_MESA_screen_surface"))
-       _eglutFatal("EGL_MESA_screen_surface is not supported\n");
- 
-+#ifdef EGL_MESA_screen_surface
-    init_kms();
- 
-    i = 0;
-@@ -103,14 +114,17 @@ _eglutNativeInitWindow(struct eglut_wind
- 
-    win->native.width = kms_width;
-    win->native.height = kms_height;
-+#endif
- }
- 
- void
- _eglutNativeFiniWindow(struct eglut_window *win)
- {
-+#ifdef EGL_MESA_screen_surface
-    eglShowScreenSurfaceMESA(_eglut->dpy,
-          kms_screen, EGL_NO_SURFACE, 0);
-    eglDestroySurface(_eglut->dpy, win->native.u.surface);
-+#endif
- }
- 
- void
-Index: mesa-demos-8.0.1/src/egl/opengl/demo1.c
-===================================================================
---- mesa-demos-8.0.1.orig/src/egl/opengl/demo1.c
-+++ mesa-demos-8.0.1/src/egl/opengl/demo1.c
-@@ -18,6 +18,7 @@
- static void
- TestScreens(EGLDisplay dpy)
- {
-+#ifdef EGL_MESA_screen_surface
- #define MAX 8
-    EGLScreenMESA screens[MAX];
-    EGLint numScreens;
-@@ -28,6 +29,7 @@ TestScreens(EGLDisplay dpy)
-    for (i = 0; i < numScreens; i++) {
-       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
-    }
-+#endif
- }
- 
- /**
-Index: mesa-demos-8.0.1/src/egl/opengl/demo2.c
-===================================================================
---- mesa-demos-8.0.1.orig/src/egl/opengl/demo2.c
-+++ mesa-demos-8.0.1/src/egl/opengl/demo2.c
-@@ -16,6 +16,7 @@
- 
- /*#define FRONTBUFFER*/
- 
-+#ifdef EGL_MESA_screen_surface
- static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2,
-                           GLfloat r, GLfloat g, GLfloat b)
- {
-@@ -95,12 +96,13 @@ TestScreens(EGLDisplay dpy)
-       printf(" Screen %d handle: %d\n", i, (int) screens[i]);
-    }
- }
--
-+#endif
- 
- int
- main(int argc, char *argv[])
- {
-    int maj, min;
-+#ifdef EGL_MESA_screen_surface
-    EGLContext ctx;
-    EGLSurface pbuffer, screen_surf;
-    EGLConfig configs[10];
-@@ -115,6 +117,7 @@ main(int argc, char *argv[])
-    EGLModeMESA mode;
-    EGLScreenMESA screen;
-    EGLint count;
-+#endif
- 
-    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
-    assert(d);
-@@ -132,6 +135,7 @@ main(int argc, char *argv[])
-       exit(1);
-    }
- 
-+#ifdef EGL_MESA_screen_surface
-    eglGetConfigs(d, configs, 10, &numConfigs);
-    printf("Got %d EGL configs:\n", numConfigs);
-    for (i = 0; i < numConfigs; i++) {
-@@ -211,6 +215,7 @@ main(int argc, char *argv[])
-    eglDestroySurface(d, pbuffer);
-    eglDestroyContext(d, ctx);
-    eglTerminate(d);
-+#endif
- 
-    return 0;
- }
-Index: mesa-demos-8.0.1/src/egl/opengl/demo3.c
-===================================================================
---- mesa-demos-8.0.1.orig/src/egl/opengl/demo3.c
-+++ mesa-demos-8.0.1/src/egl/opengl/demo3.c
-@@ -46,7 +46,7 @@ GLubyte OpenGL_bits[] = {
-    0x3e, 0x00, 0x00, 0xf8, 0x0c, 0x00, 
- };
- 
--
-+#ifdef EGL_MESA_screen_surface
- static void Init(void)
- {
- 
-@@ -551,11 +551,13 @@ write_ppm(const char *filename, const GL
-       fclose(f);
-    }
- }
-+#endif
- 
- int
- main(int argc, char *argv[])
- {
-    int maj, min;
-+#ifdef EGL_MESA_screen_surface
-    EGLContext ctx;
-    EGLSurface screen_surf;
-    EGLConfig configs[10];
-@@ -566,6 +568,7 @@ main(int argc, char *argv[])
-    const GLubyte *bitmap;
-    EGLint screenAttribs[32];
-    EGLint i;
-+#endif
- 
-    EGLDisplay d = eglGetDisplay(EGL_DEFAULT_DISPLAY);
-    assert(d);
-@@ -583,6 +586,7 @@ main(int argc, char *argv[])
-       exit(1);
-    }
- 
-+#ifdef EGL_MESA_screen_surface
-    eglGetConfigs(d, configs, 10, &numConfigs);
-    eglGetScreensMESA(d, &screen, 1, &count);
-    eglGetModesMESA(d, screen, &mode, 1, &count);
-@@ -642,6 +646,7 @@ main(int argc, char *argv[])
-    eglDestroySurface(d, screen_surf);
-    eglDestroyContext(d, ctx);
-    eglTerminate(d);
-+#endif
- 
-    return 0;
- }
diff --git a/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-query.patch b/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-query.patch
deleted file mode 100644
index 7953708..0000000
--- a/meta/recipes-graphics/mesa/mesa-demos/egl-mesa-screen-surface-query.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cf90a5c0c173d017a80cde057da57c365b3b1a40 Mon Sep 17 00:00:00 2001
-From: Frank Binns <frank.binns@imgtec.com>
-Date: Fri, 29 Jun 2012 12:00:26 +0100
-Subject: [PATCH 2/2] mesa-demos: Query display for EGL_MESA_screen_surface
- extension before using it
-
-This code makes heavy use of the EGL_MESA_screen_surface extension so 
-check the display to determine if it's supported by the underlying EGL 
-implementation. If it doesn't then bail.
-
-Signed-off-by: Frank Binns <frank.binns@imgtec.com>
-
-Applied and fixed up in Yocto by...
-
-Integrated-by: Tom Zanussi <tom.zanussi@linux.intel.com>
-
-Upstream-Status: Pending
-
-Index: mesa-demos-8.0.1/src/egl/opengl/demo1.c
-===================================================================
---- mesa-demos-8.0.1.orig/src/egl/opengl/demo1.c
-+++ mesa-demos-8.0.1/src/egl/opengl/demo1.c
-@@ -110,6 +110,12 @@ main(int argc, char *argv[])
-    printf("EGL version = %d.%d\n", maj, min);
-    printf("EGL_VENDOR = %s\n", eglQueryString(d, EGL_VENDOR));
- 
-+   if (!strstr(eglQueryString(d, EGL_EXTENSIONS),
-+               "EGL_MESA_screen_surface")) {
-+      printf("EGL_MESA_screen_surface is not supported\n");
-+      exit(1);
-+   }
-+
-    eglGetConfigs(d, NULL, 0, &numConfigs);
-    configs = malloc(sizeof(*configs) *numConfigs);
-    eglGetConfigs(d, configs, numConfigs, &numConfigs);
diff --git a/meta/recipes-graphics/mesa/mesa-demos/glut.patch b/meta/recipes-graphics/mesa/mesa-demos/glut.patch
deleted file mode 100644
index 84b6d4f..0000000
--- a/meta/recipes-graphics/mesa/mesa-demos/glut.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Correctly implement with AC_WITH(glut) so that --without-glut works.
-
-Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=57013]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Index: mesa-demos-8.0.1/configure.ac
-===================================================================
---- mesa-demos-8.0.1.orig/configure.ac	2010-07-13 19:52:41.000000000 +0100
-+++ mesa-demos-8.0.1/configure.ac	2012-11-12 12:49:54.940054571 +0000
-@@ -65,21 +65,25 @@
- DEMO_LIBS="$DEMO_LIBS $GL_LIBS"
- 
- dnl Check for GLUT
--GLUT_CFLAGS=""
--GLUT_LIBS=-lglut
--glut_enabled=yes
-+glut_enabled=no
- AC_ARG_WITH([glut],
- 	[AS_HELP_STRING([--with-glut=DIR],
- 			[glut install directory])],
- 	[GLUT_CFLAGS="-I$withval/include"
--	 GLUT_LIBS="-L$withval/lib -lglut"])
--AC_CHECK_HEADER([GL/glut.h],
--		[],
--		[glut_enabled=no])
--AC_CHECK_LIB([glut],
--		[glutInit],
--		[],
--		[glut_enabled=no])
-+	 GLUT_LIBS="-L$withval/lib -lglut"],
-+	[GLUT_CFLAGS=""
-+	 GLUT_LIBS="-lglut"]
-+        )
-+AS_IF([test "x$with_glut" != xno],
-+      [AC_CHECK_HEADER([GL/glut.h],
-+                       [],
-+                       [glut_enabled=no])
-+       AC_CHECK_LIB([glut],
-+                    [glutInit],
-+                    [],
-+                    [glut_enabled=no])
-+       glut_enabled=yes
-+])
- 
- GLEW_CFLAGS=""
- GLEW_LIBS="-lGLEW"
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
deleted file mode 100644
index f95b0a3..0000000
--- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Mesa demo applications"
-DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
-These applications can be used for Mesa validation and benchmarking."
-HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-SECTION = "x11"
-
-LICENSE = "MIT & PD"
-LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
-                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
-
-DEPENDS = "virtual/libgl glew"
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
-        file://glut.patch \
-        file://egl-mesa-screen-surface-build-fix.patch \
-        file://egl-mesa-screen-surface-query.patch \
-        file://0001-mesa-demos-Add-missing-data-files.patch \
-        file://0001-mesa-demos-Use-DEMOS_DATA_DIR-to-locate-data-files.patch"
-
-SRC_URI[md5sum] = "9df33ba69a26bbfbc7c8148602e59542"
-SRC_URI[sha256sum] = "9703fa0646b32a1e68d2abf5628f936f77bf97c69ffcaac90de380820a87a828"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 \
-                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-
-# The Wayland code doesn't work with Wayland 1.0, so disable it for now
-#${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
-
-EXTRA_OECONF = "--with-system-data-files"
-
-PACKAGECONFIG[drm] = "--enable-libdrm,--disable-libdrm,libdrm"
-PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
-PACKAGECONFIG[freetype2] = "--enable-freetype2,--disable-freetype2,freetype"
-PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgl"
-PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,virtual/libgles1"
-PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[glut] = "--with-glut=${STAGING_EXECPREFIXDIR},--without-glut,"
-PACKAGECONFIG[osmesa] = "--enable-osmesa,--disable-osmesa,"
-PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libvg"
-PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11"
-
-do_install_append () {
-    install -m 0644 ${S}/src/perf/*.frag \
-                    ${S}/src/perf/*.vert \
-                    ${S}/src/glsl/*.frag \
-                    ${S}/src/glsl/*.vert \
-                    ${S}/src/glsl/*.geom \
-                    ${S}/src/glsl/*.glsl ${D}${datadir}/${BPN}
-}
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
new file mode 100644
index 0000000..1caa50b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Mesa demo applications"
+DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
+These applications can be used for Mesa validation and benchmarking."
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+
+LICENSE = "MIT & PD"
+LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
+                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
+    file://0001-mesa-demos-Add-missing-data-files.patch \
+    file://0002-Correctly-implement-with-AC_WITH-glut-so-that-withou.patch \
+    file://0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch \
+    file://0004-Use-DEMOS_DATA_DIR-to-locate-data-files.patch \
+    file://0005-Fix-build-when-EGL_MESA_screen_surface-extension-isn.patch \
+    file://0006-Query-display-for-EGL_MESA_screen_surface-extension-.patch \
+    file://0007-Install-few-more-test-programs.patch \
+    file://0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch \
+    file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \
+"
+SRC_URI[md5sum] = "72613a2c8c013716db02e3ff59d29061"
+SRC_URI[sha256sum] = "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 glu \
+                  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glew', '', d)}"
+
+# The Wayland code doesn't work with Wayland 1.0, so disable it for now
+#${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
+
+EXTRA_OECONF = "--with-system-data-files"
+
+PACKAGECONFIG[drm] = "--enable-libdrm,--disable-libdrm,libdrm"
+PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
+PACKAGECONFIG[freetype2] = "--enable-freetype2,--disable-freetype2,freetype"
+PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgl"
+PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,virtual/libgles1"
+PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,virtual/libgles2"
+PACKAGECONFIG[glut] = "--with-glut=${STAGING_EXECPREFIXDIR},--without-glut,"
+PACKAGECONFIG[osmesa] = "--enable-osmesa,--disable-osmesa,"
+PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libvg"
+PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11"
+PACKAGECONFIG[glew] = "--enable-glew,--disable-glew,glew"
+PACKAGECONFIG[glu] = "--enable-glu,--disable-glu,virtual/libgl"
+
+do_install_append() {
+    # it can be completely empty when all PACKAGECONFIG options are disabled
+    rmdir --ignore-fail-on-non-empty ${D}${bindir}
+}
-- 
2.0.2


