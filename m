Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D70C7731CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 10:07:15 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aycfD-00030b-F8 from Awais_Belal@mentor.com ;
	Fri, 06 May 2016 03:07:16 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.95]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Fri, 6 May 2016 11:07:14 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [[PATCH v2 1/2] mesa-demos: remove demos using
	obsolete screen surface
Thread-Index: AQHRphLyNKM1AV0ZiUi9vY0hImUSmJ+rseHy
Date: Fri, 6 May 2016 10:07:14 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FBB6670@EU-MBX-03.mgc.mentorg.com>
References: <1462353116-7481-1-git-send-email-awais_belal@mentor.com>,
	<CAJTo0Lbs7hF90EF1nNJBJgP57zbt1pcz7=hTMiVjRPVe1q12ow@mail.gmail.com>
In-Reply-To: <CAJTo0Lbs7hF90EF1nNJBJgP57zbt1pcz7=hTMiVjRPVe1q12ow@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [[PATCH v2 1/2] mesa-demos: remove demos using obsolete screen surface
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
X-List-Received-Date: Fri, 06 May 2016 10:07:16 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2021B186DC632746BD5A3CE32F12BD28011FBB6670EUMBX03mgcmen_"

--_000_2021B186DC632746BD5A3CE32F12BD28011FBB6670EUMBX03mgcmen_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

These can be found at: https://github.com/abelal/openembedded-core/tree/mes=
a_updates

BR,
Awais
________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Wednesday, May 04, 2016 7:40 PM
To: Belal, Awais
Cc: OE-core
Subject: Re: [OE-core] [[PATCH v2 1/2] mesa-demos: remove demos using obsol=
ete screen surface

Can you push these patches to a branch?  For some reason git-am isn't able =
to parse the patch.

Ross

On 4 May 2016 at 10:11, Awais Belal <awais_belal@mentor.com<mailto:awais_be=
lal@mentor.com>> wrote:
The mesa surface EGL_MESA_screen_surface was obsoleted
and then dropped from mesa some time ago. Drop demos
depending on this.

Signed-off-by: Awais Belal <awais_belal@mentor.com<mailto:awais_belal@mento=
r.com>>
---
 ...dependant-on-obsolete-MESA_screen_surface.patch | 1592 ++++++++++++++++=
++++
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb<http://mesa-demos_8.2.0.bb>=
     |    1 +
 2 files changed, 1593 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-d=
ependant-on-obsolete-MESA_screen_surface.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependan=
t-on-obsolete-MESA_screen_surface.patch b/meta/recipes-graphics/mesa/mesa-d=
emos/0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch
new file mode 100644
index 0000000..a2621ce
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependant-on-ob=
solete-MESA_screen_surface.patch
@@ -0,0 +1,1592 @@
+commit 74443c6ee79f3251f643ea05e94df58183e37d0d
+Author: Matt Turner <mattst88@gmail.com<mailto:mattst88@gmail.com>>
+Date:   Fri Aug 28 15:57:38 2015 -0700
+
+    egl: Remove demos using EGL_MESA_screen_surface.
+
+    The remnants of the extension were removed from Mesa in commit 7a58262=
e.
+
+    Reviewed-by: Andreas Boll <andreas.boll.dev@gmail.com<mailto:andreas.b=
oll.dev@gmail.com>>
+    Tested-by: Andreas Boll <andreas.boll.dev@gmail.com<mailto:andreas.bol=
l.dev@gmail.com>>
+    Reviewed-by: Marek Ol=9A=E1k <marek.olsak@amd.com<mailto:marek.olsak@a=
md.com>>
+
+Upstream-Status: Backport
+
+diff --git a/src/egl/eglut/Makefile.am b/src/egl/eglut/Makefile.am
+index 2d2f2af..b765069 100644
+--- a/src/egl/eglut/Makefile.am
++++ b/src/egl/eglut/Makefile.am
+@@ -33,17 +33,12 @@ if HAVE_WAYLAND
+ eglut_wayland =3D libeglut_wayland.la<http://libeglut_wayland.la>
+ endif
+
+-noinst_LTLIBRARIES =3D libeglut_screen.la<http://libeglut_screen.la> $(eg=
lut_x11) $(eglut_wayland)
++noinst_LTLIBRARIES =3D $(eglut_x11) $(eglut_wayland)
+ endif
+
+-libeglut_screen_la_SOURCES =3D \
+-      eglut.c \
+-      eglut.h \
+-      eglutint.h \
+-      eglut_screen.c
+-
+ libeglut_x11_la_SOURCES =3D \
+       eglut.c \
++      eglut.h \
+       eglutint.h \
+       eglut_x11.c
+ libeglut_x11_la_CFLAGS =3D $(X11_CFLAGS) $(EGL_CFLAGS)
+@@ -52,6 +47,7 @@ libeglut_x11_la_LIBADD =3D $(X11_LIBS) $(EGL_LIBS)
+
+ libeglut_wayland_la_SOURCES =3D \
+       eglut.c \
++      eglut.h \
+       eglutint.h \
+       eglut_wayland.c
+
+diff --git a/src/egl/eglut/eglut.c b/src/egl/eglut/eglut.c
+index f6a2ad4..58b354a 100644
+--- a/src/egl/eglut/eglut.c
++++ b/src/egl/eglut/eglut.c
+@@ -176,9 +176,6 @@ _eglutCreateWindow(const char *title, int x, int y, in=
t w, int h)
+             win->config, win->native.u.pixmap, NULL);
+       break;
+    case EGL_PBUFFER_BIT:
+-#ifdef EGL_MESA_screen_surface
+-   case EGL_SCREEN_BIT_MESA:
+-#endif
+       win->surface =3D win->native.u.surface;
+       break;
+    default:
+@@ -292,11 +289,7 @@ eglutDestroyWindow(int win)
+    if (window->index !=3D win)
+       return;
+
+-#ifdef EGL_MESA_screen_surface
+-   /* XXX it causes some bug in st/egl KMS backend */
+-   if ( _eglut->surface_type !=3D EGL_SCREEN_BIT_MESA)
+-#endif
+-      eglMakeCurrent(_eglut->dpy, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_=
CONTEXT);
++   eglMakeCurrent(_eglut->dpy, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CON=
TEXT);
+
+    _eglutDestroyWindow(_eglut->current);
+ }
+diff --git a/src/egl/eglut/eglut_screen.c b/src/egl/eglut/eglut_screen.c
+deleted file mode 100644
+index 094a4e2..0000000
+--- a/src/egl/eglut/eglut_screen.c
++++ /dev/null
+@@ -1,194 +0,0 @@
+-/*
+- * Copyright (C) 2010 LunarG Inc.
+- *
+- * Permission is hereby granted, free of charge, to any person obtaining =
a
+- * copy of this software and associated documentation files (the "Softwar=
e"),
+- * to deal in the Software without restriction, including without limitat=
ion
+- * the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
+- * and/or sell copies of the Software, and to permit persons to whom the
+- * Software is furnished to do so, subject to the following conditions:
+- *
+- * The above copyright notice and this permission notice shall be include=
d
+- * in all copies or substantial portions of the Software.
+- *
+- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
+- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
+- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G
+- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+- * DEALINGS IN THE SOFTWARE.
+- *
+- * Authors:
+- *    Chia-I Wu <olv@lunarg.com<mailto:olv@lunarg.com>>
+- */
+-
+-#include <stdio.h>
+-#include <string.h>
+-#include <sys/time.h>
+-
+-#define EGL_EGLEXT_PROTOTYPES
+-#include "EGL/egl.h"
+-#include "EGL/eglext.h"
+-
+-#include "eglutint.h"
+-
+-#define MAX_MODES 100
+-
+-#ifdef EGL_MESA_screen_surface
+-static EGLScreenMESA kms_screen;
+-static EGLModeMESA kms_mode;
+-static EGLint kms_width, kms_height;
+-#endif
+-
+-void
+-_eglutNativeInitDisplay(void)
+-{
+-#ifdef EGL_MESA_screen_surface
+-   _eglut->native_dpy =3D EGL_DEFAULT_DISPLAY;
+-   _eglut->surface_type =3D EGL_SCREEN_BIT_MESA;
+-#endif
+-}
+-
+-void
+-_eglutNativeFiniDisplay(void)
+-{
+-#ifdef EGL_MESA_screen_surface
+-   kms_screen =3D 0;
+-   kms_mode =3D 0;
+-   kms_width =3D 0;
+-   kms_height =3D 0;
+-#endif
+-}
+-
+-#ifdef EGL_MESA_screen_surface
+-static void
+-init_kms(void)
+-{
+-   EGLModeMESA modes[MAX_MODES];
+-   EGLint num_screens, num_modes;
+-   EGLint width, height, best_mode;
+-   EGLint i;
+-
+-   if (!eglGetScreensMESA(_eglut->dpy, &kms_screen, 1, &num_screens) ||
+-         !num_screens)
+-      _eglutFatal("eglGetScreensMESA failed\n");
+-
+-   if (!eglGetModesMESA(_eglut->dpy, kms_screen,
+-            modes, MAX_MODES, &num_modes) || !num_modes)
+-      _eglutFatal("eglGetModesMESA failed!\n");
+-
+-   printf("Found %d modes:\n", num_modes);
+-
+-   best_mode =3D 0;
+-   width =3D 0;
+-   height =3D 0;
+-   for (i =3D 0; i < num_modes; i++) {
+-      EGLint w, h;
+-      eglGetModeAttribMESA(_eglut->dpy, modes[i], EGL_WIDTH, &w);
+-      eglGetModeAttribMESA(_eglut->dpy, modes[i], EGL_HEIGHT, &h);
+-      printf("%3d: %d x %d\n", i, w, h);
+-      if (w > width && h > height) {
+-         width =3D w;
+-         height =3D h;
+-         best_mode =3D i;
+-      }
+-   }
+-
+-   printf("Will use screen size: %d x %d\n", width, height);
+-
+-   kms_mode =3D modes[best_mode];
+-   kms_width =3D width;
+-   kms_height =3D height;
+-}
+-#endif
+-
+-void
+-_eglutNativeInitWindow(struct eglut_window *win, const char *title,
+-                       int x, int y, int w, int h)
+-{
+-#ifdef EGL_MESA_screen_surface
+-   EGLint surf_attribs[16];
+-   EGLint i;
+-#endif
+-   const char *exts;
+-
+-   exts =3D eglQueryString(_eglut->dpy, EGL_EXTENSIONS);
+-   if (!exts || !strstr(exts, "EGL_MESA_screen_surface"))
+-      _eglutFatal("EGL_MESA_screen_surface is not supported\n");
+-
+-#ifdef EGL_MESA_screen_surface
+-   init_kms();
+-
+-   i =3D 0;
+-   surf_attribs[i++] =3D EGL_WIDTH;
+-   surf_attribs[i++] =3D kms_width;
+-   surf_attribs[i++] =3D EGL_HEIGHT;
+-   surf_attribs[i++] =3D kms_height;
+-   surf_attribs[i++] =3D EGL_NONE;
+-
+-   /* create surface */
+-   win->native.u.surface =3D eglCreateScreenSurfaceMESA(_eglut->dpy,
+-         win->config, surf_attribs);
+-   if (win->native.u.surface =3D=3D EGL_NO_SURFACE)
+-      _eglutFatal("eglCreateScreenSurfaceMESA failed\n");
+-
+-   if (!eglShowScreenSurfaceMESA(_eglut->dpy, kms_screen,
+-            win->native.u.surface, kms_mode))
+-      _eglutFatal("eglShowScreenSurfaceMESA failed\n");
+-
+-   win->native.width =3D kms_width;
+-   win->native.height =3D kms_height;
+-#endif
+-}
+-
+-void
+-_eglutNativeFiniWindow(struct eglut_window *win)
+-{
+-#ifdef EGL_MESA_screen_surface
+-   eglShowScreenSurfaceMESA(_eglut->dpy,
+-         kms_screen, EGL_NO_SURFACE, 0);
+-   eglDestroySurface(_eglut->dpy, win->native.u.surface);
+-#endif
+-}
+-
+-void
+-_eglutNativeEventLoop(void)
+-{
+-   int start =3D _eglutNow();
+-   int frames =3D 0;
+-
+-   _eglut->redisplay =3D 1;
+-
+-   while (1) {
+-      struct eglut_window *win =3D _eglut->current;
+-      int now =3D _eglutNow();
+-
+-      if (now - start > 5000) {
+-         double elapsed =3D (double) (now - start) / 1000.0;
+-
+-         printf("%d frames in %3.1f seconds =3D %6.3f FPS\n",
+-               frames, elapsed, frames / elapsed);
+-         fflush(stdout);
+-
+-         start =3D now;
+-         frames =3D 0;
+-
+-         /* send escape */
+-         if (win->keyboard_cb)
+-            win->keyboard_cb(27);
+-      }
+-
+-      if (_eglut->idle_cb)
+-         _eglut->idle_cb();
+-
+-      if (_eglut->redisplay) {
+-         _eglut->redisplay =3D 0;
+-
+-         if (win->display_cb)
+-            win->display_cb();
+-         eglSwapBuffers(_eglut->dpy, win->surface);
+-         frames++;
+-      }
+-   }
+-}
+diff --git a/src/egl/opengl/Makefile.am b/src/egl/opengl/Makefile.am
+index 87b2f1a..3e48141 100644
+--- a/src/egl/opengl/Makefile.am
++++ b/src/egl/opengl/Makefile.am
+@@ -51,20 +51,12 @@ endif
+
+ if HAVE_EGL
+ bin_PROGRAMS =3D \
+-      demo1 \
+-      demo2 \
+-      demo3 \
+       eglinfo \
+-      eglgears_screen \
+-      egltri_screen \
+       peglgears \
+       $(EGL_DRM_DEMOS) \
+       $(EGL_X11_DEMOS)
+ endif
+
+-egltri_screen_SOURCES =3D egltri.c
+-eglgears_screen_SOURCES =3D eglgears.c
+-
+ egltri_x11_SOURCES =3D egltri.c
+ eglgears_x11_SOURCES =3D eglgears.c
+
+@@ -73,9 +65,6 @@ egltri_x11_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS)
+ xeglgears_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS)
+ xeglthreads_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS) -pthread
+
+-eglgears_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_scr=
een.la>
+-egltri_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_scree=
n.la>
+-
+ eglgears_x11_LDADD =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la>
+ egltri_x11_LDADD =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la>
+
+diff --git a/src/egl/opengl/demo1.c b/src/egl/opengl/demo1.c
+deleted file mode 100644
+index 06e2138..0000000
+--- a/src/egl/opengl/demo1.c
++++ /dev/null
+@@ -1,155 +0,0 @@
+-/*
+- * Exercise EGL API functions
+- */
+-
+-#define EGL_EGLEXT_PROTOTYPES
+-
+-#include <EGL/egl.h>
+-#include <EGL/eglext.h>
+-#include <assert.h>
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <string.h>
+-
+-
+-/**
+- * Test EGL_MESA_screen_surface functions
+- */
+-static void
+-TestScreens(EGLDisplay dpy)
+-{
+-#ifdef EGL_MESA_screen_surface
+-#define MAX 8
+-   EGLScreenMESA screens[MAX];
+-   EGLint numScreens;
+-   EGLint i;
+-
+-   eglGetScreensMESA(dpy, screens, MAX, &numScreens);
+-   printf("Found %d screens\n", numScreens);
+-   for (i =3D 0; i < numScreens; i++) {
+-      printf(" Screen %d handle: %d\n", i, (int) screens[i]);
+-   }
+-#endif
+-}
+-
+-/**
+- * Print table of all available configurations.
+- */
+-static void
+-PrintConfigs(EGLDisplay d, EGLConfig *configs, EGLint numConfigs)
+-{
+-   EGLint i;
+-
+-   printf("Configurations:\n");
+-   printf("     bf lv d st colorbuffer dp st   supported \n");
+-   printf("  id sz  l b ro  r  g  b  a th cl   surfaces  \n");
+-   printf("----------------------------------------------\n");
+-   for (i =3D 0; i < numConfigs; i++) {
+-      EGLint id, size, level;
+-      EGLint red, green, blue, alpha;
+-      EGLint depth, stencil;
+-      EGLint surfaces;
+-      EGLint doubleBuf =3D 1, stereo =3D 0;
+-      char surfString[100] =3D "";
+-
+-      eglGetConfigAttrib(d, configs[i], EGL_CONFIG_ID, &id);
+-      eglGetConfigAttrib(d, configs[i], EGL_BUFFER_SIZE, &size);
+-      eglGetConfigAttrib(d, configs[i], EGL_LEVEL, &level);
+-
+-      eglGetConfigAttrib(d, configs[i], EGL_RED_SIZE, &red);
+-      eglGetConfigAttrib(d, configs[i], EGL_GREEN_SIZE, &green);
+-      eglGetConfigAttrib(d, configs[i], EGL_BLUE_SIZE, &blue);
+-      eglGetConfigAttrib(d, configs[i], EGL_ALPHA_SIZE, &alpha);
+-      eglGetConfigAttrib(d, configs[i], EGL_DEPTH_SIZE, &depth);
+-      eglGetConfigAttrib(d, configs[i], EGL_STENCIL_SIZE, &stencil);
+-      eglGetConfigAttrib(d, configs[i], EGL_SURFACE_TYPE, &surfaces);
+-
+-      if (surfaces & EGL_WINDOW_BIT)
+-         strcat(surfString, "win,");
+-      if (surfaces & EGL_PBUFFER_BIT)
+-         strcat(surfString, "pb,");
+-      if (surfaces & EGL_PIXMAP_BIT)
+-         strcat(surfString, "pix,");
+-      if (strlen(surfString) > 0)
+-         surfString[strlen(surfString) - 1] =3D 0;
+-
+-      printf("0x%02x %2d %2d %c  %c %2d %2d %2d %2d %2d %2d   %-12s\n",
+-             id, size, level,
+-             doubleBuf ? 'y' : '.',
+-             stereo ? 'y' : '.',
+-             red, green, blue, alpha,
+-             depth, stencil, surfString);
+-   }
+-}
+-
+-
+-
+-int
+-main(int argc, char *argv[])
+-{
+-   int maj, min;
+-   EGLContext ctx;
+-   EGLSurface pbuffer;
+-   EGLConfig *configs;
+-   EGLint numConfigs;
+-   EGLBoolean b;
+-   const EGLint pbufAttribs[] =3D {
+-      EGL_WIDTH, 500,
+-      EGL_HEIGHT, 500,
+-      EGL_NONE
+-   };
+-
+-   EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);
+-   assert(d);
+-
+-   if (!eglInitialize(d, &maj, &min)) {
+-      printf("demo: eglInitialize failed\n");
+-      exit(1);
+-   }
+-
+-   printf("EGL version =3D %d.%d\n", maj, min);
+-   printf("EGL_VENDOR =3D %s\n", eglQueryString(d, EGL_VENDOR));
+-
+-   if (!strstr(eglQueryString(d, EGL_EXTENSIONS),
+-               "EGL_MESA_screen_surface")) {
+-      printf("EGL_MESA_screen_surface is not supported\n");
+-      exit(1);
+-   }
+-
+-   eglGetConfigs(d, NULL, 0, &numConfigs);
+-   configs =3D malloc(sizeof(*configs) *numConfigs);
+-   eglGetConfigs(d, configs, numConfigs, &numConfigs);
+-
+-   PrintConfigs(d, configs, numConfigs);
+-
+-   eglBindAPI(EGL_OPENGL_API);
+-   ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, NULL);
+-   if (ctx =3D=3D EGL_NO_CONTEXT) {
+-      printf("failed to create context\n");
+-      return 0;
+-   }
+-
+-   pbuffer =3D eglCreatePbufferSurface(d, configs[0], pbufAttribs);
+-   if (pbuffer =3D=3D EGL_NO_SURFACE) {
+-      printf("failed to create pbuffer\n");
+-      return 0;
+-   }
+-
+-   free(configs);
+-
+-   b =3D eglMakeCurrent(d, pbuffer, pbuffer, ctx);
+-   if (!b) {
+-      printf("make current failed\n");
+-      return 0;
+-   }
+-
+-   b =3D eglMakeCurrent(d, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT=
);
+-
+-   TestScreens(d);
+-
+-   eglDestroySurface(d, pbuffer);
+-   eglDestroyContext(d, ctx);
+-   eglTerminate(d);
+-
+-   return 0;
+-}
+diff --git a/src/egl/opengl/demo2.c b/src/egl/opengl/demo2.c
+deleted file mode 100644
+index bfef59e..0000000
+--- a/src/egl/opengl/demo2.c
++++ /dev/null
+@@ -1,221 +0,0 @@
+-/*
+- * Exercise EGL API functions
+- */
+-
+-#define EGL_EGLEXT_PROTOTYPES
+-
+-#include <assert.h>
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <string.h>
+-#include <unistd.h>
+-
+-#include <EGL/egl.h>
+-#include <EGL/eglext.h>
+-#include "gl_wrap.h"
+-
+-/*#define FRONTBUFFER*/
+-
+-#ifdef EGL_MESA_screen_surface
+-static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2,
+-                          GLfloat r, GLfloat g, GLfloat b)
+-{
+-   GLfloat v[4][2], c[4][4];
+-   int i;
+-
+-   v[0][0] =3D x1;   v[0][1] =3D y1;
+-   v[1][0] =3D x2;   v[1][1] =3D y1;
+-   v[2][0] =3D x2;   v[2][1] =3D y2;
+-   v[3][0] =3D x1;   v[3][1] =3D y2;
+-
+-   for (i =3D 0; i < 4; i++) {
+-      c[i][0] =3D r;
+-      c[i][1] =3D g;
+-      c[i][2] =3D b;
+-      c[i][3] =3D 1.0;
+-   }
+-
+-   glVertexPointer(2, GL_FLOAT, 0, v);
+-   glColorPointer(4, GL_FLOAT, 0, c);
+-   glEnableClientState(GL_VERTEX_ARRAY);
+-   glEnableClientState(GL_COLOR_ARRAY);
+-
+-   glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
+-
+-   glDisableClientState(GL_VERTEX_ARRAY);
+-   glDisableClientState(GL_COLOR_ARRAY);
+-}
+-
+-
+-static void redraw(EGLDisplay dpy, EGLSurface surf, int rot)
+-{
+-   GLfloat r, g, b;
+-
+-   printf("Redraw event\n");
+-
+-   glClearColor( rand()/(float)RAND_MAX,
+-               rand()/(float)RAND_MAX,
+-               rand()/(float)RAND_MAX,
+-               1);
+-
+-   glClear( GL_COLOR_BUFFER_BIT );
+-
+-   r =3D rand()/(float)RAND_MAX;
+-   g =3D rand()/(float)RAND_MAX;
+-   b =3D rand()/(float)RAND_MAX;
+-
+-   glPushMatrix();
+-   glRotatef(rot, 0, 0, 1);
+-   glScalef(.5, .5, .5);
+-   _subset_Rectf( -1, -1, 1, 1, r, g, b );
+-   glPopMatrix();
+-
+-#ifdef FRONTBUFFER
+-   glFlush();
+-#else
+-   eglSwapBuffers( dpy, surf );
+-#endif
+-   glFinish();
+-}
+-
+-
+-/**
+- * Test EGL_MESA_screen_surface functions
+- */
+-static void
+-TestScreens(EGLDisplay dpy)
+-{
+-#define MAX 8
+-   EGLScreenMESA screens[MAX];
+-   EGLint numScreens;
+-   EGLint i;
+-
+-   eglGetScreensMESA(dpy, screens, MAX, &numScreens);
+-   printf("Found %d screens\n", numScreens);
+-   for (i =3D 0; i < numScreens; i++) {
+-      printf(" Screen %d handle: %d\n", i, (int) screens[i]);
+-   }
+-}
+-#endif
+-
+-int
+-main(int argc, char *argv[])
+-{
+-   int maj, min;
+-#ifdef EGL_MESA_screen_surface
+-   EGLContext ctx;
+-   EGLSurface pbuffer, screen_surf;
+-   EGLConfig configs[10];
+-   EGLint numConfigs, i;
+-   EGLBoolean b;
+-   const EGLint pbufAttribs[] =3D {
+-      EGL_WIDTH, 500,
+-      EGL_HEIGHT, 500,
+-      EGL_NONE
+-   };
+-   EGLint screenAttribs[32];
+-   EGLModeMESA mode;
+-   EGLScreenMESA screen;
+-   EGLint count;
+-#endif
+-
+-   EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);
+-   assert(d);
+-
+-   if (!eglInitialize(d, &maj, &min)) {
+-      printf("demo: eglInitialize failed\n");
+-      exit(1);
+-   }
+-
+-   printf("EGL version =3D %d.%d\n", maj, min);
+-   printf("EGL_VENDOR =3D %s\n", eglQueryString(d, EGL_VENDOR));
+-   if (!strstr(eglQueryString(d, EGL_EXTENSIONS),
+-               "EGL_MESA_screen_surface")) {
+-      printf("EGL_MESA_screen_surface is not supported\n");
+-      exit(1);
+-   }
+-
+-#ifdef EGL_MESA_screen_surface
+-   eglGetConfigs(d, configs, 10, &numConfigs);
+-   printf("Got %d EGL configs:\n", numConfigs);
+-   for (i =3D 0; i < numConfigs; i++) {
+-      EGLint id, red, depth;
+-      eglGetConfigAttrib(d, configs[i], EGL_CONFIG_ID, &id);
+-      eglGetConfigAttrib(d, configs[i], EGL_RED_SIZE, &red);
+-      eglGetConfigAttrib(d, configs[i], EGL_DEPTH_SIZE, &depth);
+-      printf("%2d:  Red Size =3D %d  Depth Size =3D %d\n", id, red, depth=
);
+-   }
+-
+-   eglGetScreensMESA(d, &screen, 1, &count);
+-   eglGetModesMESA(d, screen, &mode, 1, &count);
+-
+-   eglBindAPI(EGL_OPENGL_API);
+-   ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, NULL);
+-   if (ctx =3D=3D EGL_NO_CONTEXT) {
+-      printf("failed to create context\n");
+-      return 0;
+-   }
+-
+-   pbuffer =3D eglCreatePbufferSurface(d, configs[0], pbufAttribs);
+-   if (pbuffer =3D=3D EGL_NO_SURFACE) {
+-      printf("failed to create pbuffer\n");
+-      return 0;
+-   }
+-
+-   b =3D eglMakeCurrent(d, pbuffer, pbuffer, ctx);
+-   if (!b) {
+-      printf("make current failed\n");
+-      return 0;
+-   }
+-
+-   b =3D eglMakeCurrent(d, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT=
);
+-
+-   i =3D 0;
+-   screenAttribs[i++] =3D EGL_WIDTH;
+-   eglGetModeAttribMESA(d, mode, EGL_WIDTH, &screenAttribs[i++]);
+-   screenAttribs[i++] =3D EGL_HEIGHT;
+-   eglGetModeAttribMESA(d, mode, EGL_HEIGHT, &screenAttribs[i++]);
+-   screenAttribs[i] =3D EGL_NONE;
+-
+-   screen_surf =3D eglCreateScreenSurfaceMESA(d, configs[0], screenAttrib=
s);
+-   if (screen_surf =3D=3D EGL_NO_SURFACE) {
+-      printf("failed to create screen surface\n");
+-      return 0;
+-   }
+-
+-   eglShowScreenSurfaceMESA(d, screen, screen_surf, mode);
+-
+-   b =3D eglMakeCurrent(d, screen_surf, screen_surf, ctx);
+-   if (!b) {
+-      printf("make current failed\n");
+-      return 0;
+-   }
+-
+-   glViewport(0, 0, 1024, 768);
+-
+-   glClearColor( 0,
+-               1.0,
+-               0,
+-               1);
+-
+-   glClear( GL_COLOR_BUFFER_BIT );
+-
+-
+-   TestScreens(d);
+-
+-   glShadeModel( GL_FLAT );
+-
+-   for (i =3D 0; i < 6; i++) {
+-      redraw(d, screen_surf, i*10 );
+-
+-      printf("sleep(1)\n");
+-      sleep(1);
+-   }
+-
+-   eglDestroySurface(d, pbuffer);
+-   eglDestroyContext(d, ctx);
+-   eglTerminate(d);
+-#endif
+-
+-   return 0;
+-}
+diff --git a/src/egl/opengl/demo3.c b/src/egl/opengl/demo3.c
+deleted file mode 100644
+index 31b5d8b..0000000
+--- a/src/egl/opengl/demo3.c
++++ /dev/null
+@@ -1,652 +0,0 @@
+-/*
+- * Exercise EGL API functions
+- */
+-
+-#define EGL_EGLEXT_PROTOTYPES
+-
+-#include <EGL/egl.h>
+-#include <EGL/eglext.h>
+-#include "gl_wrap.h"
+-#include <assert.h>
+-#include <stdio.h>
+-#include <stdlib.h>
+-#include <string.h>
+-#include <unistd.h>
+-
+-
+-
+-#define PIXEL_CENTER(x) ((long)(x) + 0.5)
+-
+-#define GAP 10
+-#define ROWS 3
+-#define COLS 4
+-
+-#define OPENGL_WIDTH 48
+-#define OPENGL_HEIGHT 13
+-
+-
+-GLenum rgb, doubleBuffer, windType;
+-GLint windW, windH;
+-
+-GLenum mode1, mode2;
+-GLint boxW, boxH;
+-GLubyte OpenGL_bits[] =3D {
+-   0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
+-   0x7f, 0xfb, 0xff, 0xff, 0xff, 0x01,
+-   0x7f, 0xfb, 0xff, 0xff, 0xff, 0x01,
+-   0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
+-   0x3e, 0x8f, 0xb7, 0xf9, 0xfc, 0x01,
+-   0x63, 0xdb, 0xb0, 0x8d, 0x0d, 0x00,
+-   0x63, 0xdb, 0xb7, 0x8d, 0x0d, 0x00,
+-   0x63, 0xdb, 0xb6, 0x8d, 0x0d, 0x00,
+-   0x63, 0x8f, 0xf3, 0xcc, 0x0d, 0x00,
+-   0x63, 0x00, 0x00, 0x0c, 0x4c, 0x0a,
+-   0x63, 0x00, 0x00, 0x0c, 0x4c, 0x0e,
+-   0x63, 0x00, 0x00, 0x8c, 0xed, 0x0e,
+-   0x3e, 0x00, 0x00, 0xf8, 0x0c, 0x00,
+-};
+-
+-#ifdef EGL_MESA_screen_surface
+-static void Init(void)
+-{
+-
+-    mode1 =3D GL_TRUE;
+-    mode2 =3D GL_TRUE;
+-}
+-
+-static void Reshape(int width, int height)
+-{
+-
+-    windW =3D (GLint)width;
+-    windH =3D (GLint)height;
+-}
+-
+-#if 0
+-static void RotateColorMask(void)
+-{
+-    static GLint rotation =3D 0;
+-
+-    rotation =3D (rotation + 1) & 0x3;
+-    switch (rotation) {
+-      case 0:
+-      glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);
+-      glIndexMask( 0xff );
+-      break;
+-      case 1:
+-      glColorMask(GL_FALSE, GL_TRUE, GL_TRUE, GL_TRUE);
+-      glIndexMask(0xFE);
+-      break;
+-      case 2:
+-      glColorMask(GL_TRUE, GL_FALSE, GL_TRUE, GL_TRUE);
+-      glIndexMask(0xFD);
+-      break;
+-      case 3:
+-      glColorMask(GL_TRUE, GL_TRUE, GL_FALSE, GL_TRUE);
+-      glIndexMask(0xFB);
+-      break;
+-    }
+-}
+-#endif
+-
+-static void Viewport(GLint row, GLint column)
+-{
+-    GLint x, y;
+-
+-    boxW =3D (windW - (COLS + 1) * GAP) / COLS;
+-    boxH =3D (windH - (ROWS + 1) * GAP) / ROWS;
+-
+-    x =3D GAP + column * (boxW + GAP);
+-    y =3D GAP + row * (boxH + GAP);
+-
+-    glViewport(x, y, boxW, boxH);
+-
+-    glMatrixMode(GL_PROJECTION);
+-    glLoadIdentity();
+-    glOrtho(-boxW/2, boxW/2, -boxH/2, boxH/2, 0.0, 1.0);
+-    glMatrixMode(GL_MODELVIEW);
+-
+-    glEnable(GL_SCISSOR_TEST);
+-    glScissor(x, y, boxW, boxH);
+-}
+-
+-enum {
+-    COLOR_BLACK =3D 0,
+-    COLOR_RED,
+-    COLOR_GREEN,
+-    COLOR_YELLOW,
+-    COLOR_BLUE,
+-    COLOR_MAGENTA,
+-    COLOR_CYAN,
+-    COLOR_WHITE
+-};
+-
+-static float RGBMap[9][3] =3D {
+-    {0, 0, 0},
+-    {1, 0, 0},
+-    {0, 1, 0},
+-    {1, 1, 0},
+-    {0, 0, 1},
+-    {1, 0, 1},
+-    {0, 1, 1},
+-    {1, 1, 1},
+-    {0.5, 0.5, 0.5}
+-};
+-
+-static void SetColor(int c)
+-{
+-     glColor3fv(RGBMap[c]);
+-}
+-
+-static void Point(void)
+-{
+-    GLint i;
+-
+-    glBegin(GL_POINTS);
+-      SetColor(COLOR_WHITE);
+-      glVertex2i(0, 0);
+-      for (i =3D 1; i < 8; i++) {
+-          GLint j =3D i * 2;
+-          SetColor(COLOR_BLACK+i);
+-          glVertex2i(-j, -j);
+-          glVertex2i(-j, 0);
+-          glVertex2i(-j, j);
+-          glVertex2i(0, j);
+-          glVertex2i(j, j);
+-          glVertex2i(j, 0);
+-          glVertex2i(j, -j);
+-          glVertex2i(0, -j);
+-      }
+-    glEnd();
+-}
+-
+-static void Lines(void)
+-{
+-    GLint i;
+-
+-    glPushMatrix();
+-
+-    glTranslatef(-12, 0, 0);
+-    for (i =3D 1; i < 8; i++) {
+-      SetColor(COLOR_BLACK+i);
+-      glBegin(GL_LINES);
+-          glVertex2i(-boxW/4, -boxH/4);
+-          glVertex2i(boxW/4, boxH/4);
+-      glEnd();
+-      glTranslatef(4, 0, 0);
+-    }
+-
+-    glPopMatrix();
+-
+-    glBegin(GL_LINES);
+-      glVertex2i(0, 0);
+-    glEnd();
+-}
+-
+-static void LineStrip(void)
+-{
+-
+-    glBegin(GL_LINE_STRIP);
+-      SetColor(COLOR_RED);
+-      glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(-boxH/4));
+-      SetColor(COLOR_GREEN);
+-      glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(boxH/4));
+-      SetColor(COLOR_BLUE);
+-      glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(boxH/4));
+-      SetColor(COLOR_WHITE);
+-      glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(-boxH/4));
+-    glEnd();
+-
+-    glBegin(GL_LINE_STRIP);
+-      glVertex2i(0, 0);
+-    glEnd();
+-}
+-
+-static void LineLoop(void)
+-{
+-
+-    glBegin(GL_LINE_LOOP);
+-      SetColor(COLOR_RED);
+-      glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(-boxH/4));
+-      SetColor(COLOR_GREEN);
+-      glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(boxH/4));
+-      SetColor(COLOR_BLUE);
+-      glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(boxH/4));
+-      SetColor(COLOR_WHITE);
+-      glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(-boxH/4));
+-    glEnd();
+-
+-    glEnable(GL_LOGIC_OP);
+-    glLogicOp(GL_XOR);
+-
+-    glEnable(GL_BLEND);
+-    glBlendFunc(GL_ONE, GL_ONE);
+-
+-    SetColor(COLOR_MAGENTA);
+-    glBegin(GL_LINE_LOOP);
+-      glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(-boxH/8));
+-      glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(boxH/8));
+-    glEnd();
+-    glBegin(GL_LINE_LOOP);
+-      glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(boxH/8+5));
+-      glVertex2f(PIXEL_CENTER(boxW/8), PIXEL_CENTER(boxH/8+5));
+-    glEnd();
+-    glDisable(GL_LOGIC_OP);
+-    glDisable(GL_BLEND);
+-
+-    SetColor(COLOR_GREEN);
+-    glBegin(GL_POINTS);
+-      glVertex2i(0, 0);
+-    glEnd();
+-
+-    glBegin(GL_LINE_LOOP);
+-      glVertex2i(0, 0);
+-    glEnd();
+-}
+-
+-static void Bitmap(void)
+-{
+-
+-    glBegin(GL_LINES);
+-      SetColor(COLOR_GREEN);
+-      glVertex2i(-boxW/2, 0);
+-      glVertex2i(boxW/2, 0);
+-      glVertex2i(0, -boxH/2);
+-      glVertex2i(0, boxH/2);
+-      SetColor(COLOR_RED);
+-      glVertex2i(0, -3);
+-      glVertex2i(0, -3+OPENGL_HEIGHT);
+-      SetColor(COLOR_BLUE);
+-      glVertex2i(0, -3);
+-      glVertex2i(OPENGL_WIDTH, -3);
+-    glEnd();
+-
+-    SetColor(COLOR_GREEN);
+-
+-    glPixelStorei(GL_UNPACK_LSB_FIRST, GL_TRUE);
+-    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
+-
+-    glRasterPos2i(0, 0);
+-    glBitmap(OPENGL_WIDTH, OPENGL_HEIGHT, 0, 3, 0.0, 0.0, OpenGL_bits);
+-}
+-
+-static void Triangles(void)
+-{
+-
+-    glBegin(GL_TRIANGLES);
+-      SetColor(COLOR_GREEN);
+-      glVertex2i(-boxW/4, -boxH/4);
+-      SetColor(COLOR_RED);
+-      glVertex2i(-boxW/8, -boxH/16);
+-      SetColor(COLOR_BLUE);
+-      glVertex2i(boxW/8, -boxH/16);
+-
+-      SetColor(COLOR_GREEN);
+-      glVertex2i(-boxW/4, boxH/4);
+-      SetColor(COLOR_RED);
+-      glVertex2i(-boxW/8, boxH/16);
+-      SetColor(COLOR_BLUE);
+-      glVertex2i(boxW/8, boxH/16);
+-    glEnd();
+-
+-    glBegin(GL_TRIANGLES);
+-      glVertex2i(0, 0);
+-      glVertex2i(-100, 100);
+-    glEnd();
+-}
+-
+-static void TriangleStrip(void)
+-{
+-
+-    glBegin(GL_TRIANGLE_STRIP);
+-      SetColor(COLOR_GREEN);
+-      glVertex2i(-boxW/4, -boxH/4);
+-      SetColor(COLOR_RED);
+-      glVertex2i(-boxW/4, boxH/4);
+-      SetColor(COLOR_BLUE);
+-      glVertex2i(0, -boxH/4);
+-      SetColor(COLOR_WHITE);
+-      glVertex2i(0, boxH/4);
+-      SetColor(COLOR_CYAN);
+-      glVertex2i(boxW/4, -boxH/4);
+-      SetColor(COLOR_YELLOW);
+-      glVertex2i(boxW/4, boxH/4);
+-    glEnd();
+-
+-    glBegin(GL_TRIANGLE_STRIP);
+-      glVertex2i(0, 0);
+-      glVertex2i(-100, 100);
+-    glEnd();
+-}
+-
+-static void TriangleFan(void)
+-{
+-    GLint vx[8][2];
+-    GLint x0, y0, x1, y1, x2, y2, x3, y3;
+-    GLint i;
+-
+-    y0 =3D -boxH/4;
+-    y1 =3D y0 + boxH/2/3;
+-    y2 =3D y1 + boxH/2/3;
+-    y3 =3D boxH/4;
+-    x0 =3D -boxW/4;
+-    x1 =3D x0 + boxW/2/3;
+-    x2 =3D x1 + boxW/2/3;
+-    x3 =3D boxW/4;
+-
+-    vx[0][0] =3D x0; vx[0][1] =3D y1;
+-    vx[1][0] =3D x0; vx[1][1] =3D y2;
+-    vx[2][0] =3D x1; vx[2][1] =3D y3;
+-    vx[3][0] =3D x2; vx[3][1] =3D y3;
+-    vx[4][0] =3D x3; vx[4][1] =3D y2;
+-    vx[5][0] =3D x3; vx[5][1] =3D y1;
+-    vx[6][0] =3D x2; vx[6][1] =3D y0;
+-    vx[7][0] =3D x1; vx[7][1] =3D y0;
+-
+-    glBegin(GL_TRIANGLE_FAN);
+-      SetColor(COLOR_WHITE);
+-      glVertex2i(0, 0);
+-      for (i =3D 0; i < 8; i++) {
+-          SetColor(COLOR_WHITE-i);
+-          glVertex2iv(vx[i]);
+-      }
+-    glEnd();
+-
+-    glBegin(GL_TRIANGLE_FAN);
+-      glVertex2i(0, 0);
+-      glVertex2i(-100, 100);
+-    glEnd();
+-}
+-
+-static void Rect(void)
+-{
+-
+-    SetColor(COLOR_GREEN);
+-    glRecti(-boxW/4, -boxH/4, boxW/4, boxH/4);
+-}
+-
+-static void PolygonFunc(void)
+-{
+-    GLint vx[8][2];
+-    GLint x0, y0, x1, y1, x2, y2, x3, y3;
+-    GLint i;
+-
+-    y0 =3D -boxH/4;
+-    y1 =3D y0 + boxH/2/3;
+-    y2 =3D y1 + boxH/2/3;
+-    y3 =3D boxH/4;
+-    x0 =3D -boxW/4;
+-    x1 =3D x0 + boxW/2/3;
+-    x2 =3D x1 + boxW/2/3;
+-    x3 =3D boxW/4;
+-
+-    vx[0][0] =3D x0; vx[0][1] =3D y1;
+-    vx[1][0] =3D x0; vx[1][1] =3D y2;
+-    vx[2][0] =3D x1; vx[2][1] =3D y3;
+-    vx[3][0] =3D x2; vx[3][1] =3D y3;
+-    vx[4][0] =3D x3; vx[4][1] =3D y2;
+-    vx[5][0] =3D x3; vx[5][1] =3D y1;
+-    vx[6][0] =3D x2; vx[6][1] =3D y0;
+-    vx[7][0] =3D x1; vx[7][1] =3D y0;
+-
+-    glBegin(GL_POLYGON);
+-      for (i =3D 0; i < 8; i++) {
+-          SetColor(COLOR_WHITE-i);
+-          glVertex2iv(vx[i]);
+-      }
+-    glEnd();
+-
+-    glBegin(GL_POLYGON);
+-      glVertex2i(0, 0);
+-      glVertex2i(100, 100);
+-    glEnd();
+-}
+-
+-static void Quads(void)
+-{
+-
+-    glBegin(GL_QUADS);
+-      SetColor(COLOR_GREEN);
+-      glVertex2i(-boxW/4, -boxH/4);
+-      SetColor(COLOR_RED);
+-      glVertex2i(-boxW/8, -boxH/16);
+-      SetColor(COLOR_BLUE);
+-      glVertex2i(boxW/8, -boxH/16);
+-      SetColor(COLOR_WHITE);
+-      glVertex2i(boxW/4, -boxH/4);
+-
+-      SetColor(COLOR_GREEN);
+-      glVertex2i(-boxW/4, boxH/4);
+-      SetColor(COLOR_RED);
+-      glVertex2i(-boxW/8, boxH/16);
+-      SetColor(COLOR_BLUE);
+-      glVertex2i(boxW/8, boxH/16);
+-      SetColor(COLOR_WHITE);
+-      glVertex2i(boxW/4, boxH/4);
+-    glEnd();
+-
+-    glBegin(GL_QUADS);
+-      glVertex2i(0, 0);
+-      glVertex2i(100, 100);
+-      glVertex2i(-100, 100);
+-    glEnd();
+-}
+-
+-static void QuadStrip(void)
+-{
+-
+-    glBegin(GL_QUAD_STRIP);
+-      SetColor(COLOR_GREEN);
+-      glVertex2i(-boxW/4, -boxH/4);
+-      SetColor(COLOR_RED);
+-      glVertex2i(-boxW/4, boxH/4);
+-      SetColor(COLOR_BLUE);
+-      glVertex2i(0, -boxH/4);
+-      SetColor(COLOR_WHITE);
+-      glVertex2i(0, boxH/4);
+-      SetColor(COLOR_CYAN);
+-      glVertex2i(boxW/4, -boxH/4);
+-      SetColor(COLOR_YELLOW);
+-      glVertex2i(boxW/4, boxH/4);
+-    glEnd();
+-
+-    glBegin(GL_QUAD_STRIP);
+-      glVertex2i(0, 0);
+-      glVertex2i(100, 100);
+-      glVertex2i(-100, 100);
+-    glEnd();
+-}
+-
+-static void Draw(EGLDisplay dpy, EGLSurface surf)
+-{
+-
+-    glViewport(0, 0, windW, windH);
+-    glDisable(GL_SCISSOR_TEST);
+-
+-    glPushAttrib(GL_COLOR_BUFFER_BIT);
+-
+-    glColorMask(1, 1, 1, 1);
+-    glIndexMask(~0);
+-
+-    glClearColor(0.0, 0.0, 0.0, 0.0);
+-    glClear(GL_COLOR_BUFFER_BIT);
+-
+-    glPopAttrib();
+-
+-    if (mode1) {
+-      glShadeModel(GL_SMOOTH);
+-    } else {
+-      glShadeModel(GL_FLAT);
+-    }
+-
+-    if (mode2) {
+-      glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
+-    } else {
+-      glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
+-    }
+-
+-    Viewport(0, 0); Point();
+-    Viewport(0, 1); Lines();
+-    Viewport(0, 2); LineStrip();
+-    Viewport(0, 3); LineLoop();
+-
+-    Viewport(1, 0); Bitmap();
+-
+-    Viewport(1, 1); TriangleFan();
+-    Viewport(1, 2); Triangles();
+-    Viewport(1, 3); TriangleStrip();
+-
+-    Viewport(2, 0); Rect();
+-    Viewport(2, 1); PolygonFunc();
+-    Viewport(2, 2); Quads();
+-    Viewport(2, 3); QuadStrip();
+-
+-    glFlush();
+-
+-    if (doubleBuffer) {
+-      eglSwapBuffers(dpy, surf);
+-    }
+-}
+-
+-static void
+-write_ppm(const char *filename, const GLubyte *buffer, int width, int hei=
ght)
+-{
+-   const int binary =3D 0;
+-   FILE *f =3D fopen( filename, "w" );
+-   if (f) {
+-      int i, x, y;
+-      const GLubyte *ptr =3D buffer;
+-      if (binary) {
+-         fprintf(f,"P6\n");
+-         fprintf(f,"# ppm-file created by osdemo.c\n");
+-         fprintf(f,"%i %i\n", width,height);
+-         fprintf(f,"255\n");
+-         fclose(f);
+-         f =3D fopen( filename, "ab" );  /* reopen in binary append mode =
*/
+-         for (y=3Dheight-1; y>=3D0; y--) {
+-            for (x=3D0; x<width; x++) {
+-               i =3D (y*width + x) * 4;
+-               fputc(ptr[i], f);   /* write red */
+-               fputc(ptr[i+1], f); /* write green */
+-               fputc(ptr[i+2], f); /* write blue */
+-            }
+-         }
+-      }
+-      else {
+-         /*ASCII*/
+-         int counter =3D 0;
+-         fprintf(f,"P3\n");
+-         fprintf(f,"# ascii ppm file created by osdemo.c\n");
+-         fprintf(f,"%i %i\n", width, height);
+-         fprintf(f,"255\n");
+-         for (y=3Dheight-1; y>=3D0; y--) {
+-            for (x=3D0; x<width; x++) {
+-               i =3D (y*width + x) * 4;
+-               fprintf(f, " %3d %3d %3d", ptr[i], ptr[i+1], ptr[i+2]);
+-               counter++;
+-               if (counter % 5 =3D=3D 0)
+-                  fprintf(f, "\n");
+-            }
+-         }
+-      }
+-      fclose(f);
+-   }
+-}
+-#endif
+-
+-int
+-main(int argc, char *argv[])
+-{
+-   int maj, min;
+-#ifdef EGL_MESA_screen_surface
+-   EGLContext ctx;
+-   EGLSurface screen_surf;
+-   EGLConfig configs[10];
+-   EGLScreenMESA screen;
+-   EGLModeMESA mode;
+-   EGLint numConfigs, count;
+-   EGLBoolean b;
+-   const GLubyte *bitmap;
+-   EGLint screenAttribs[32];
+-   EGLint i;
+-#endif
+-
+-   EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);
+-   assert(d);
+-
+-   if (!eglInitialize(d, &maj, &min)) {
+-      printf("demo: eglInitialize failed\n");
+-      exit(1);
+-   }
+-
+-   printf("EGL version =3D %d.%d\n", maj, min);
+-   printf("EGL_VENDOR =3D %s\n", eglQueryString(d, EGL_VENDOR));
+-   if (!strstr(eglQueryString(d, EGL_EXTENSIONS),
+-               "EGL_MESA_screen_surface")) {
+-      printf("EGL_MESA_screen_surface is not supported\n");
+-      exit(1);
+-   }
+-
+-#ifdef EGL_MESA_screen_surface
+-   eglGetConfigs(d, configs, 10, &numConfigs);
+-   eglGetScreensMESA(d, &screen, 1, &count);
+-   eglGetModesMESA(d, screen, &mode, 1, &count);
+-
+-   eglBindAPI(EGL_OPENGL_API);
+-   ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, NULL);
+-   if (ctx =3D=3D EGL_NO_CONTEXT) {
+-      printf("failed to create context\n");
+-      return 0;
+-   }
+-
+-   i =3D 0;
+-   screenAttribs[i++] =3D EGL_WIDTH;
+-   eglGetModeAttribMESA(d, mode, EGL_WIDTH, &screenAttribs[i++]);
+-   screenAttribs[i++] =3D EGL_HEIGHT;
+-   eglGetModeAttribMESA(d, mode, EGL_HEIGHT, &screenAttribs[i++]);
+-   screenAttribs[i] =3D EGL_NONE;
+-
+-   screen_surf =3D eglCreateScreenSurfaceMESA(d, configs[0], screenAttrib=
s);
+-   if (screen_surf =3D=3D EGL_NO_SURFACE) {
+-      printf("failed to create screen surface\n");
+-      return 0;
+-   }
+-
+-   eglShowScreenSurfaceMESA(d, screen, screen_surf, mode);
+-
+-   b =3D eglMakeCurrent(d, screen_surf, screen_surf, ctx);
+-   if (!b) {
+-      printf("make current failed\n");
+-      return 0;
+-   }
+-   glViewport(0, 0, 1024, 768);
+-
+-
+-   Init();
+-   Reshape(1024, 768);
+-
+-   /* some drivers crash when rendering to front buffer */
+-#if 0
+-   glDrawBuffer( GL_FRONT );
+-   glClearColor( 0, 1.0, 0, 1);
+-
+-   glClear( GL_COLOR_BUFFER_BIT );
+-#endif
+-
+-   doubleBuffer =3D 1;
+-   glDrawBuffer( GL_BACK );
+-
+-   Draw(d, screen_surf);
+-   sleep(2);
+-
+-   /* TODO EGL_KHR_lock_surface */
+-   bitmap =3D NULL;
+-   if (bitmap)
+-      write_ppm("dump.ppm", bitmap, 1024, 768);
+-
+-   eglDestroySurface(d, screen_surf);
+-   eglDestroyContext(d, ctx);
+-   eglTerminate(d);
+-#endif
+-
+-   return 0;
+-}
+diff --git a/src/egl/opengl/eglinfo.c b/src/egl/opengl/eglinfo.c
+index 8e82e73..1f79fef 100644
+--- a/src/egl/opengl/eglinfo.c
++++ b/src/egl/opengl/eglinfo.c
+@@ -93,10 +93,6 @@ PrintConfigs(EGLDisplay d)
+          strcat(surfString, "pb,");
+       if (surfaces & EGL_PIXMAP_BIT)
+          strcat(surfString, "pix,");
+-#ifdef EGL_MESA_screen_surface
+-      if (surfaces & EGL_SCREEN_BIT_MESA)
+-         strcat(surfString, "scrn,");
+-#endif
+       if (strlen(surfString) > 0)
+          surfString[strlen(surfString) - 1] =3D 0;
+
+@@ -117,45 +113,6 @@ PrintConfigs(EGLDisplay d)
+ }
+
+
+-/**
+- * Print table of all available configurations.
+- */
+-static void
+-PrintModes(EGLDisplay d)
+-{
+-#ifdef EGL_MESA_screen_surface
+-   const char *extensions =3D eglQueryString(d, EGL_EXTENSIONS);
+-   if (strstr(extensions, "EGL_MESA_screen_surface")) {
+-      EGLScreenMESA screens[MAX_SCREENS];
+-      EGLint numScreens =3D 1, scrn;
+-      EGLModeMESA modes[MAX_MODES];
+-
+-      eglGetScreensMESA(d, screens, MAX_SCREENS, &numScreens);
+-      printf("Number of Screens: %d\n\n", numScreens);
+-
+-      for (scrn =3D 0; scrn < numScreens; scrn++) {
+-         EGLint numModes, i;
+-
+-         eglGetModesMESA(d, screens[scrn], modes, MAX_MODES, &numModes);
+-
+-         printf("Screen %d Modes:\n", scrn);
+-         printf("  id  width height refresh  name\n");
+-         printf("-----------------------------------------\n");
+-         for (i =3D 0; i < numModes; i++) {
+-            EGLint id, w, h, r;
+-            const char *str;
+-            eglGetModeAttribMESA(d, modes[i], EGL_MODE_ID_MESA, &id);
+-            eglGetModeAttribMESA(d, modes[i], EGL_WIDTH, &w);
+-            eglGetModeAttribMESA(d, modes[i], EGL_HEIGHT, &h);
+-            eglGetModeAttribMESA(d, modes[i], EGL_REFRESH_RATE_MESA, &r);
+-            str =3D eglQueryModeStringMESA(d, modes[i]);
+-            printf("0x%02x %5d  %5d   %.3f  %s\n", id, w, h, r / 1000.0, =
str);
+-         }
+-      }
+-   }
+-#endif
+-}
+-
+ static void
+ PrintExtensions(EGLDisplay d)
+ {
+@@ -215,8 +172,6 @@ main(int argc, char *argv[])
+
+    PrintConfigs(d);
+
+-   PrintModes(d);
+-
+    eglTerminate(d);
+
+    return 0;
+diff --git a/src/egl/opengles1/Makefile.am b/src/egl/opengles1/Makefile.am
+index 516e516..1cc2e1f 100644
+--- a/src/egl/opengles1/Makefile.am
++++ b/src/egl/opengles1/Makefile.am
+@@ -38,24 +38,6 @@ AM_LDFLAGS =3D \
+
+ bin_PROGRAMS =3D
+
+-if HAVE_EGL
+-if HAVE_GLESV1
+-bin_PROGRAMS +=3D \
+-      drawtex_screen \
+-      gears_screen \
+-      torus_screen \
+-      tri_screen
+-
+-drawtex_screen_SOURCES =3D drawtex.c
+-gears_screen_SOURCES =3D gears.c
+-torus_screen_SOURCES =3D torus.c
+-tri_screen_SOURCES =3D tri.c
+-
+-drawtex_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_scre=
en.la>
+-gears_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_screen=
.la>
+-torus_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_screen=
.la>
+-tri_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_screen.l=
a>
+-
+ if HAVE_X11
+ bin_PROGRAMS +=3D \
+       clear \
+@@ -94,5 +76,3 @@ gears_x11_LDADD =3D ../eglut/libeglut_x11.la<http://libe=
glut_x11.la>
+ torus_x11_LDADD =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la>
+ tri_x11_LDADD =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la>
+ endif
+-endif
+-endif
+diff --git a/src/egl/opengles2/Makefile.am b/src/egl/opengles2/Makefile.am
+index 74af460..422cb03 100644
+--- a/src/egl/opengles2/Makefile.am
++++ b/src/egl/opengles2/Makefile.am
+@@ -33,13 +33,7 @@ AM_LDFLAGS =3D \
+       $(EGL_LIBS) \
+       -lm
+
+-if HAVE_EGL
+-if HAVE_GLESV2
+-bin_PROGRAMS =3D \
+-      es2gears_screen
+-
+-es2gears_screen_SOURCES =3D es2gears.c
+-es2gears_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_scr=
een.la>
++bin_PROGRAMS =3D
+
+ if HAVE_WAYLAND
+ bin_PROGRAMS +=3D es2gears_wayland
+@@ -59,6 +53,4 @@ es2gears_x11_SOURCES =3D es2gears.c
+ es2gears_x11_LDADD =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la>
+ es2tri_LDADD =3D $(X11_LIBS)
+ endif
+-endif
+-endif
+
+diff --git a/src/egl/openvg/Makefile.am b/src/egl/openvg/Makefile.am
+index b545225..5fd1cf8 100644
+--- a/src/egl/openvg/Makefile.am
++++ b/src/egl/openvg/Makefile.am
+@@ -50,21 +50,13 @@ endif
+ if HAVE_EGL
+ if HAVE_VG
+ bin_PROGRAMS =3D \
+-      lion_screen \
+-      sp_screen \
+       $(EGL_X11_DEMOS)
+ endif
+ endif
+
+-lion_screen_SOURCES =3D lion.c lion-render.c lion-render.h
+-sp_screen_SOURCES =3D sp.c
+-
+ lion_x11_SOURCES =3D lion.c lion-render.c lion-render.h
+ sp_x11_SOURCES =3D sp.c
+
+-lion_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_screen.=
la>
+-sp_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_screen.la=
>
+-
+ lion_x11_LDADD =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la>
+ sp_x11_LDADD =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la>
+
+diff --git a/src/egl/openvg/Makefile.in b/src/egl/openvg/Makefile.in
+index 99e9288..3652fbb 100644
+--- a/src/egl/openvg/Makefile.in
++++ b/src/egl/openvg/Makefile.in
+@@ -108,8 +108,6 @@ host_triplet =3D @host@
+ @HAVE_FREETYPE2_TRUE@@HAVE_X11_TRUE@am__append_1 =3D \
+ @HAVE_FREETYPE2_TRUE@@HAVE_X11_TRUE@  text
+
+-@HAVE_EGL_TRUE@@HAVE_VG_TRUE@noinst_PROGRAMS =3D lion_screen$(EXEEXT) \
+-@HAVE_EGL_TRUE@@HAVE_VG_TRUE@ sp_screen$(EXEEXT) \
+ @HAVE_EGL_TRUE@@HAVE_VG_TRUE@ $(am__EXEEXT_2)
+ subdir =3D src/egl/openvg
+ DIST_COMMON =3D $(srcdir)/Makefile.in $(srcdir)/Makefile.am \
+@@ -128,9 +126,6 @@ CONFIG_CLEAN_VPATH_FILES =3D
+ @HAVE_X11_TRUE@am__EXEEXT_2 =3D lion_x11$(EXEEXT) sp_x11$(EXEEXT) \
+ @HAVE_X11_TRUE@       $(am__EXEEXT_1)
+ PROGRAMS =3D $(noinst_PROGRAMS)
+-am_lion_screen_OBJECTS =3D lion.$(OBJEXT) lion-render.$(OBJEXT)
+-lion_screen_OBJECTS =3D $(am_lion_screen_OBJECTS)
+-lion_screen_DEPENDENCIES =3D ../eglut/libeglut_screen.la<http://libeglut_=
screen.la>
+ AM_V_lt =3D $(am__v_lt_@AM_V@)
+ am__v_lt_ =3D $(am__v_lt_@AM_DEFAULT_V@)
+ am__v_lt_0 =3D --silent
+@@ -138,9 +133,6 @@ am__v_lt_1 =3D
+ am_lion_x11_OBJECTS =3D lion.$(OBJEXT) lion-render.$(OBJEXT)
+ lion_x11_OBJECTS =3D $(am_lion_x11_OBJECTS)
+ lion_x11_DEPENDENCIES =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la=
>
+-am_sp_screen_OBJECTS =3D sp.$(OBJEXT)
+-sp_screen_OBJECTS =3D $(am_sp_screen_OBJECTS)
+-sp_screen_DEPENDENCIES =3D ../eglut/libeglut_screen.la<http://libeglut_sc=
reen.la>
+ am_sp_x11_OBJECTS =3D sp.$(OBJEXT)
+ sp_x11_OBJECTS =3D $(am_sp_x11_OBJECTS)
+ sp_x11_DEPENDENCIES =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la>
+@@ -184,10 +176,10 @@ AM_V_CCLD =3D $(am__v_CCLD_@AM_V@)
+ am__v_CCLD_ =3D $(am__v_CCLD_@AM_DEFAULT_V@)
+ am__v_CCLD_0 =3D @echo "  CCLD    " $@;
+ am__v_CCLD_1 =3D
+-SOURCES =3D $(lion_screen_SOURCES) $(lion_x11_SOURCES) \
+-      $(sp_screen_SOURCES) $(sp_x11_SOURCES) $(text_SOURCES)
+-DIST_SOURCES =3D $(lion_screen_SOURCES) $(lion_x11_SOURCES) \
+-      $(sp_screen_SOURCES) $(sp_x11_SOURCES) $(text_SOURCES)
++SOURCES =3D $(lion_x11_SOURCES) \
++      $(sp_x11_SOURCES) $(text_SOURCES)
++DIST_SOURCES =3D $(lion_x11_SOURCES) \
++      $(sp_x11_SOURCES) $(text_SOURCES)
+ RECURSIVE_TARGETS =3D all-recursive check-recursive cscopelist-recursive =
\
+       ctags-recursive dvi-recursive html-recursive info-recursive \
+       install-data-recursive install-dvi-recursive \
+@@ -423,12 +415,8 @@ AM_LDFLAGS =3D \
+       -lm
+
+ @HAVE_X11_TRUE@EGL_X11_DEMOS =3D lion_x11 sp_x11 $(am__append_1)
+-lion_screen_SOURCES =3D lion.c lion-render.c lion-render.h
+-sp_screen_SOURCES =3D sp.c
+ lion_x11_SOURCES =3D lion.c lion-render.c lion-render.h
+ sp_x11_SOURCES =3D sp.c
+-lion_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_screen.=
la>
+-sp_screen_LDADD =3D ../eglut/libeglut_screen.la<http://libeglut_screen.la=
>
+ lion_x11_LDADD =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la>
+ sp_x11_LDADD =3D ../eglut/libeglut_x11.la<http://libeglut_x11.la>
+ text_SOURCES =3D text.c
+@@ -481,18 +469,10 @@ clean-noinstPROGRAMS:
+       echo " rm -f" $$list; \
+       rm -f $$list
+
+-lion_screen$(EXEEXT): $(lion_screen_OBJECTS) $(lion_screen_DEPENDENCIES) =
$(EXTRA_lion_screen_DEPENDENCIES)
+-      @rm -f lion_screen$(EXEEXT)
+-      $(AM_V_CCLD)$(LINK) $(lion_screen_OBJECTS) $(lion_screen_LDADD) $(L=
IBS)
+-
+ lion_x11$(EXEEXT): $(lion_x11_OBJECTS) $(lion_x11_DEPENDENCIES) $(EXTRA_l=
ion_x11_DEPENDENCIES)
+       @rm -f lion_x11$(EXEEXT)
+       $(AM_V_CCLD)$(LINK) $(lion_x11_OBJECTS) $(lion_x11_LDADD) $(LIBS)
+
+-sp_screen$(EXEEXT): $(sp_screen_OBJECTS) $(sp_screen_DEPENDENCIES) $(EXTR=
A_sp_screen_DEPENDENCIES)
+-      @rm -f sp_screen$(EXEEXT)
+-      $(AM_V_CCLD)$(LINK) $(sp_screen_OBJECTS) $(sp_screen_LDADD) $(LIBS)
+-
+ sp_x11$(EXEEXT): $(sp_x11_OBJECTS) $(sp_x11_DEPENDENCIES) $(EXTRA_sp_x11_=
DEPENDENCIES)
+       @rm -f sp_x11$(EXEEXT)
+       $(AM_V_CCLD)$(LINK) $(sp_x11_OBJECTS) $(sp_x11_LDADD) $(LIBS)
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb<http://mesa-dem=
os_8.2.0.bb> b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb<http://mesa-d=
emos_8.2.0.bb>
index 557b8c6..2df9bba 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb<http://mesa-demos_8.2.=
0.bb>
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb<http://mesa-demos_8.2.=
0.bb>
@@ -20,6 +20,7 @@ SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/demos/${P=
V}/${BPN}-${PV}.tar.bz2 \
     file://0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch=
 \
     file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \
     file://0010-sharedtex_mt-fix-rendering-thread-hang.patch \
+    file://0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch=
 \
 "
 SRC_URI[md5sum] =3D "72613a2c8c013716db02e3ff59d29061"
 SRC_URI[sha256sum] =3D "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a97=
74d0952f90ba92"
--
1.9.1


--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.ope=
nembedded.org>
http://lists.openembedded.org/mailman/listinfo/openembedded-core



--_000_2021B186DC632746BD5A3CE32F12BD28011FBB6670EUMBX03mgcmen_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi Ross,<br>
<br>
These can be found at: https://github.com/abelal/openembedded-core/tree/mes=
a_updates<br>
<div><br>
<div style=3D"font-family:Tahoma; font-size:13px"><font face=3D"Tahoma"></f=
ont>
<div style=3D"font-size:13px">
<div><font face=3D"Tahoma" size=3D"2"><span lang=3D"en-US">
<div style=3D"margin:0">BR,</div>
<div style=3D"margin:0"><i>Awais</i></div>
</span></font></div>
</div>
<font face=3D"Tahoma"></font></div>
</div>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div style=3D"direction: ltr;" id=3D"divRpF490895"><font color=3D"#000000" =
face=3D"Tahoma" size=3D"2"><b>From:</b> Burton, Ross [ross.burton@intel.com=
]<br>
<b>Sent:</b> Wednesday, May 04, 2016 7:40 PM<br>
<b>To:</b> Belal, Awais<br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [[PATCH v2 1/2] mesa-demos: remove demos usin=
g obsolete screen surface<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">Can you push these patches to a branch?&nbsp; For some rea=
son git-am isn't able to parse the patch.
<div><br>
</div>
<div>Ross</div>
</div>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 4 May 2016 at 10:11, Awais Belal <span dir=3D=
"ltr">&lt;<a href=3D"mailto:awais_belal@mentor.com" target=3D"_blank">awais=
_belal@mentor.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
The mesa surface EGL_MESA_screen_surface was obsoleted<br>
and then dropped from mesa some time ago. Drop demos<br>
depending on this.<br>
<br>
Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com" ta=
rget=3D"_blank">awais_belal@mentor.com</a>&gt;<br>
---<br>
&nbsp;...dependant-on-obsolete-MESA_screen_surface.patch | 1592 &#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;<br>
&nbsp;meta/recipes-graphics/mesa/<a href=3D"http://mesa-demos_8.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-demos_8.2.0.bb</a>&nbsp; &nbsp; &nbs=
p;|&nbsp; &nbsp; 1 &#43;<br>
&nbsp;2 files changed, 1593 insertions(&#43;)<br>
&nbsp;create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0011-drop-de=
mos-dependant-on-obsolete-MESA_screen_surface.patch<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependan=
t-on-obsolete-MESA_screen_surface.patch b/meta/recipes-graphics/mesa/mesa-d=
emos/0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch<br>
new file mode 100644<br>
index 0000000..a2621ce<br>
--- /dev/null<br>
&#43;&#43;&#43; b/meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dep=
endant-on-obsolete-MESA_screen_surface.patch<br>
@@ -0,0 &#43;1,1592 @@<br>
&#43;commit 74443c6ee79f3251f643ea05e94df58183e37d0d<br>
&#43;Author: Matt Turner &lt;<a href=3D"mailto:mattst88@gmail.com" target=
=3D"_blank">mattst88@gmail.com</a>&gt;<br>
&#43;Date:&nbsp; &nbsp;Fri Aug 28 15:57:38 2015 -0700<br>
&#43;<br>
&#43;&nbsp; &nbsp; egl: Remove demos using EGL_MESA_screen_surface.<br>
&#43;<br>
&#43;&nbsp; &nbsp; The remnants of the extension were removed from Mesa in =
commit 7a58262e.<br>
&#43;<br>
&#43;&nbsp; &nbsp; Reviewed-by: Andreas Boll &lt;<a href=3D"mailto:andreas.=
boll.dev@gmail.com" target=3D"_blank">andreas.boll.dev@gmail.com</a>&gt;<br=
>
&#43;&nbsp; &nbsp; Tested-by: Andreas Boll &lt;<a href=3D"mailto:andreas.bo=
ll.dev@gmail.com" target=3D"_blank">andreas.boll.dev@gmail.com</a>&gt;<br>
&#43;&nbsp; &nbsp; Reviewed-by: Marek Ol=9A=E1k &lt;<a href=3D"mailto:marek=
.olsak@amd.com" target=3D"_blank">marek.olsak@amd.com</a>&gt;<br>
&#43;<br>
&#43;Upstream-Status: Backport<br>
&#43;<br>
&#43;diff --git a/src/egl/eglut/Makefile.am b/src/egl/eglut/Makefile.am<br>
&#43;index 2d2f2af..b765069 100644<br>
&#43;--- a/src/egl/eglut/Makefile.am<br>
&#43;&#43;&#43;&#43; b/src/egl/eglut/Makefile.am<br>
&#43;@@ -33,17 &#43;33,12 @@ if HAVE_WAYLAND<br>
&#43; eglut_wayland =3D <a href=3D"http://libeglut_wayland.la" rel=3D"noref=
errer" target=3D"_blank">
libeglut_wayland.la</a><br>
&#43; endif<br>
&#43;<br>
&#43;-noinst_LTLIBRARIES =3D <a href=3D"http://libeglut_screen.la" rel=3D"n=
oreferrer" target=3D"_blank">
libeglut_screen.la</a> $(eglut_x11) $(eglut_wayland)<br>
&#43;&#43;noinst_LTLIBRARIES =3D $(eglut_x11) $(eglut_wayland)<br>
&#43; endif<br>
&#43;<br>
&#43;-libeglut_screen_la_SOURCES =3D \<br>
&#43;-&nbsp; &nbsp; &nbsp; eglut.c \<br>
&#43;-&nbsp; &nbsp; &nbsp; eglut.h \<br>
&#43;-&nbsp; &nbsp; &nbsp; eglutint.h \<br>
&#43;-&nbsp; &nbsp; &nbsp; eglut_screen.c<br>
&#43;-<br>
&#43; libeglut_x11_la_SOURCES =3D \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;eglut.c \<br>
&#43;&#43;&nbsp; &nbsp; &nbsp; eglut.h \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;eglutint.h \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;eglut_x11.c<br>
&#43; libeglut_x11_la_CFLAGS =3D $(X11_CFLAGS) $(EGL_CFLAGS)<br>
&#43;@@ -52,6 &#43;47,7 @@ libeglut_x11_la_LIBADD =3D $(X11_LIBS) $(EGL_LIB=
S)<br>
&#43;<br>
&#43; libeglut_wayland_la_SOURCES =3D \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;eglut.c \<br>
&#43;&#43;&nbsp; &nbsp; &nbsp; eglut.h \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;eglutint.h \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;eglut_wayland.c<br>
&#43;<br>
&#43;diff --git a/src/egl/eglut/eglut.c b/src/egl/eglut/eglut.c<br>
&#43;index f6a2ad4..58b354a 100644<br>
&#43;--- a/src/egl/eglut/eglut.c<br>
&#43;&#43;&#43;&#43; b/src/egl/eglut/eglut.c<br>
&#43;@@ -176,9 &#43;176,6 @@ _eglutCreateWindow(const char *title, int x, i=
nt y, int w, int h)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;win-&gt;config, win-&g=
t;native.u.pixmap, NULL);<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;break;<br>
&#43;&nbsp; &nbsp; case EGL_PBUFFER_BIT:<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;case EGL_SCREEN_BIT_MESA:<br>
&#43;-#endif<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;win-&gt;surface =3D win-&gt;native.u.surfac=
e;<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;break;<br>
&#43;&nbsp; &nbsp; default:<br>
&#43;@@ -292,11 &#43;289,7 @@ eglutDestroyWindow(int win)<br>
&#43;&nbsp; &nbsp; if (window-&gt;index !=3D win)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;return;<br>
&#43;<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;/* XXX it causes some bug in st/egl KMS backend */<br>
&#43;-&nbsp; &nbsp;if ( _eglut-&gt;surface_type !=3D EGL_SCREEN_BIT_MESA)<b=
r>
&#43;-#endif<br>
&#43;-&nbsp; &nbsp; &nbsp; eglMakeCurrent(_eglut-&gt;dpy, EGL_NO_SURFACE, E=
GL_NO_SURFACE, EGL_NO_CONTEXT);<br>
&#43;&#43;&nbsp; &nbsp;eglMakeCurrent(_eglut-&gt;dpy, EGL_NO_SURFACE, EGL_N=
O_SURFACE, EGL_NO_CONTEXT);<br>
&#43;<br>
&#43;&nbsp; &nbsp; _eglutDestroyWindow(_eglut-&gt;current);<br>
&#43; }<br>
&#43;diff --git a/src/egl/eglut/eglut_screen.c b/src/egl/eglut/eglut_screen=
.c<br>
&#43;deleted file mode 100644<br>
&#43;index 094a4e2..0000000<br>
&#43;--- a/src/egl/eglut/eglut_screen.c<br>
&#43;&#43;&#43;&#43; /dev/null<br>
&#43;@@ -1,194 &#43;0,0 @@<br>
&#43;-/*<br>
&#43;- * Copyright (C) 2010 LunarG Inc.<br>
&#43;- *<br>
&#43;- * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&#43;- * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&#43;- * to deal in the Software without restriction, including without lim=
itation<br>
&#43;- * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&#43;- * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&#43;- * Software is furnished to do so, subject to the following condition=
s:<br>
&#43;- *<br>
&#43;- * The above copyright notice and this permission notice shall be inc=
luded<br>
&#43;- * in all copies or substantial portions of the Software.<br>
&#43;- *<br>
&#43;- * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&#43;- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&#43;- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO =
EVENT SHALL<br>
&#43;- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&#43;- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING<br>
&#43;- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHE=
R<br>
&#43;- * DEALINGS IN THE SOFTWARE.<br>
&#43;- *<br>
&#43;- * Authors:<br>
&#43;- *&nbsp; &nbsp; Chia-I Wu &lt;<a href=3D"mailto:olv@lunarg.com" targe=
t=3D"_blank">olv@lunarg.com</a>&gt;<br>
&#43;- */<br>
&#43;-<br>
&#43;-#include &lt;stdio.h&gt;<br>
&#43;-#include &lt;string.h&gt;<br>
&#43;-#include &lt;sys/time.h&gt;<br>
&#43;-<br>
&#43;-#define EGL_EGLEXT_PROTOTYPES<br>
&#43;-#include &quot;EGL/egl.h&quot;<br>
&#43;-#include &quot;EGL/eglext.h&quot;<br>
&#43;-<br>
&#43;-#include &quot;eglutint.h&quot;<br>
&#43;-<br>
&#43;-#define MAX_MODES 100<br>
&#43;-<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-static EGLScreenMESA kms_screen;<br>
&#43;-static EGLModeMESA kms_mode;<br>
&#43;-static EGLint kms_width, kms_height;<br>
&#43;-#endif<br>
&#43;-<br>
&#43;-void<br>
&#43;-_eglutNativeInitDisplay(void)<br>
&#43;-{<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;_eglut-&gt;native_dpy =3D EGL_DEFAULT_DISPLAY;<br>
&#43;-&nbsp; &nbsp;_eglut-&gt;surface_type =3D EGL_SCREEN_BIT_MESA;<br>
&#43;-#endif<br>
&#43;-}<br>
&#43;-<br>
&#43;-void<br>
&#43;-_eglutNativeFiniDisplay(void)<br>
&#43;-{<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;kms_screen =3D 0;<br>
&#43;-&nbsp; &nbsp;kms_mode =3D 0;<br>
&#43;-&nbsp; &nbsp;kms_width =3D 0;<br>
&#43;-&nbsp; &nbsp;kms_height =3D 0;<br>
&#43;-#endif<br>
&#43;-}<br>
&#43;-<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-static void<br>
&#43;-init_kms(void)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp;EGLModeMESA modes[MAX_MODES];<br>
&#43;-&nbsp; &nbsp;EGLint num_screens, num_modes;<br>
&#43;-&nbsp; &nbsp;EGLint width, height, best_mode;<br>
&#43;-&nbsp; &nbsp;EGLint i;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;if (!eglGetScreensMESA(_eglut-&gt;dpy, &amp;kms_screen, =
1, &amp;num_screens) ||<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;!num_screens)<br>
&#43;-&nbsp; &nbsp; &nbsp; _eglutFatal(&quot;eglGetScreensMESA failed\n&quo=
t;);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;if (!eglGetModesMESA(_eglut-&gt;dpy, kms_screen,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; modes, MAX_MODES, &amp;num_=
modes) || !num_modes)<br>
&#43;-&nbsp; &nbsp; &nbsp; _eglutFatal(&quot;eglGetModesMESA failed!\n&quot=
;);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;printf(&quot;Found %d modes:\n&quot;, num_modes);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;best_mode =3D 0;<br>
&#43;-&nbsp; &nbsp;width =3D 0;<br>
&#43;-&nbsp; &nbsp;height =3D 0;<br>
&#43;-&nbsp; &nbsp;for (i =3D 0; i &lt; num_modes; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; EGLint w, h;<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetModeAttribMESA(_eglut-&gt;dpy, modes[i], E=
GL_WIDTH, &amp;w);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetModeAttribMESA(_eglut-&gt;dpy, modes[i], E=
GL_HEIGHT, &amp;h);<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;%3d: %d x %d\n&quot;, i, w, h);<br>
&#43;-&nbsp; &nbsp; &nbsp; if (w &gt; width &amp;&amp; h &gt; height) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;width =3D w;<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;height =3D h;<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;best_mode =3D i;<br>
&#43;-&nbsp; &nbsp; &nbsp; }<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;printf(&quot;Will use screen size: %d x %d\n&quot;, widt=
h, height);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;kms_mode =3D modes[best_mode];<br>
&#43;-&nbsp; &nbsp;kms_width =3D width;<br>
&#43;-&nbsp; &nbsp;kms_height =3D height;<br>
&#43;-}<br>
&#43;-#endif<br>
&#43;-<br>
&#43;-void<br>
&#43;-_eglutNativeInitWindow(struct eglut_window *win, const char *title,<b=
r>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;int x, int y, int w, int h)<br>
&#43;-{<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;EGLint surf_attribs[16];<br>
&#43;-&nbsp; &nbsp;EGLint i;<br>
&#43;-#endif<br>
&#43;-&nbsp; &nbsp;const char *exts;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;exts =3D eglQueryString(_eglut-&gt;dpy, EGL_EXTENSIONS);=
<br>
&#43;-&nbsp; &nbsp;if (!exts || !strstr(exts, &quot;EGL_MESA_screen_surface=
&quot;))<br>
&#43;-&nbsp; &nbsp; &nbsp; _eglutFatal(&quot;EGL_MESA_screen_surface is not=
 supported\n&quot;);<br>
&#43;-<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;init_kms();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;i =3D 0;<br>
&#43;-&nbsp; &nbsp;surf_attribs[i&#43;&#43;] =3D EGL_WIDTH;<br>
&#43;-&nbsp; &nbsp;surf_attribs[i&#43;&#43;] =3D kms_width;<br>
&#43;-&nbsp; &nbsp;surf_attribs[i&#43;&#43;] =3D EGL_HEIGHT;<br>
&#43;-&nbsp; &nbsp;surf_attribs[i&#43;&#43;] =3D kms_height;<br>
&#43;-&nbsp; &nbsp;surf_attribs[i&#43;&#43;] =3D EGL_NONE;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;/* create surface */<br>
&#43;-&nbsp; &nbsp;win-&gt;native.u.surface =3D eglCreateScreenSurfaceMESA(=
_eglut-&gt;dpy,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;win-&gt;config, surf_attribs);<br>
&#43;-&nbsp; &nbsp;if (win-&gt;native.u.surface =3D=3D EGL_NO_SURFACE)<br>
&#43;-&nbsp; &nbsp; &nbsp; _eglutFatal(&quot;eglCreateScreenSurfaceMESA fai=
led\n&quot;);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;if (!eglShowScreenSurfaceMESA(_eglut-&gt;dpy, kms_screen=
,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; win-&gt;native.u.surface, k=
ms_mode))<br>
&#43;-&nbsp; &nbsp; &nbsp; _eglutFatal(&quot;eglShowScreenSurfaceMESA faile=
d\n&quot;);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;win-&gt;native.width =3D kms_width;<br>
&#43;-&nbsp; &nbsp;win-&gt;native.height =3D kms_height;<br>
&#43;-#endif<br>
&#43;-}<br>
&#43;-<br>
&#43;-void<br>
&#43;-_eglutNativeFiniWindow(struct eglut_window *win)<br>
&#43;-{<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;eglShowScreenSurfaceMESA(_eglut-&gt;dpy,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kms_screen, EGL_NO_SURFACE, 0);<br>
&#43;-&nbsp; &nbsp;eglDestroySurface(_eglut-&gt;dpy, win-&gt;native.u.surfa=
ce);<br>
&#43;-#endif<br>
&#43;-}<br>
&#43;-<br>
&#43;-void<br>
&#43;-_eglutNativeEventLoop(void)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp;int start =3D _eglutNow();<br>
&#43;-&nbsp; &nbsp;int frames =3D 0;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;_eglut-&gt;redisplay =3D 1;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;while (1) {<br>
&#43;-&nbsp; &nbsp; &nbsp; struct eglut_window *win =3D _eglut-&gt;current;=
<br>
&#43;-&nbsp; &nbsp; &nbsp; int now =3D _eglutNow();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; if (now - start &gt; 5000) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;double elapsed =3D (double) (now - =
start) / 1000.0;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printf(&quot;%d frames in %3.1f sec=
onds =3D %6.3f FPS\n&quot;,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;frames, elapse=
d, frames / elapsed);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fflush(stdout);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;start =3D now;<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;frames =3D 0;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* send escape */<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (win-&gt;keyboard_cb)<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; win-&gt;keyboard_cb(27);<br=
>
&#43;-&nbsp; &nbsp; &nbsp; }<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; if (_eglut-&gt;idle_cb)<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_eglut-&gt;idle_cb();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; if (_eglut-&gt;redisplay) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_eglut-&gt;redisplay =3D 0;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (win-&gt;display_cb)<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; win-&gt;display_cb();<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;eglSwapBuffers(_eglut-&gt;dpy, win-=
&gt;surface);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;frames&#43;&#43;;<br>
&#43;-&nbsp; &nbsp; &nbsp; }<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-}<br>
&#43;diff --git a/src/egl/opengl/Makefile.am b/src/egl/opengl/Makefile.am<b=
r>
&#43;index 87b2f1a..3e48141 100644<br>
&#43;--- a/src/egl/opengl/Makefile.am<br>
&#43;&#43;&#43;&#43; b/src/egl/opengl/Makefile.am<br>
&#43;@@ -51,20 &#43;51,12 @@ endif<br>
&#43;<br>
&#43; if HAVE_EGL<br>
&#43; bin_PROGRAMS =3D \<br>
&#43;-&nbsp; &nbsp; &nbsp; demo1 \<br>
&#43;-&nbsp; &nbsp; &nbsp; demo2 \<br>
&#43;-&nbsp; &nbsp; &nbsp; demo3 \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;eglinfo \<br>
&#43;-&nbsp; &nbsp; &nbsp; eglgears_screen \<br>
&#43;-&nbsp; &nbsp; &nbsp; egltri_screen \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;peglgears \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;$(EGL_DRM_DEMOS) \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;$(EGL_X11_DEMOS)<br>
&#43; endif<br>
&#43;<br>
&#43;-egltri_screen_SOURCES =3D egltri.c<br>
&#43;-eglgears_screen_SOURCES =3D eglgears.c<br>
&#43;-<br>
&#43; egltri_x11_SOURCES =3D egltri.c<br>
&#43; eglgears_x11_SOURCES =3D eglgears.c<br>
&#43;<br>
&#43;@@ -73,9 &#43;65,6 @@ egltri_x11_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS)=
<br>
&#43; xeglgears_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS)<br>
&#43; xeglthreads_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS) -pthread<br>
&#43;<br>
&#43;-eglgears_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.=
la" rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43;-egltri_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la=
" rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43;-<br>
&#43; eglgears_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" re=
l=3D"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43; egltri_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=
=3D"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43;<br>
&#43;diff --git a/src/egl/opengl/demo1.c b/src/egl/opengl/demo1.c<br>
&#43;deleted file mode 100644<br>
&#43;index 06e2138..0000000<br>
&#43;--- a/src/egl/opengl/demo1.c<br>
&#43;&#43;&#43;&#43; /dev/null<br>
&#43;@@ -1,155 &#43;0,0 @@<br>
&#43;-/*<br>
&#43;- * Exercise EGL API functions<br>
&#43;- */<br>
&#43;-<br>
&#43;-#define EGL_EGLEXT_PROTOTYPES<br>
&#43;-<br>
&#43;-#include &lt;EGL/egl.h&gt;<br>
&#43;-#include &lt;EGL/eglext.h&gt;<br>
&#43;-#include &lt;assert.h&gt;<br>
&#43;-#include &lt;stdio.h&gt;<br>
&#43;-#include &lt;stdlib.h&gt;<br>
&#43;-#include &lt;string.h&gt;<br>
&#43;-<br>
&#43;-<br>
&#43;-/**<br>
&#43;- * Test EGL_MESA_screen_surface functions<br>
&#43;- */<br>
&#43;-static void<br>
&#43;-TestScreens(EGLDisplay dpy)<br>
&#43;-{<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-#define MAX 8<br>
&#43;-&nbsp; &nbsp;EGLScreenMESA screens[MAX];<br>
&#43;-&nbsp; &nbsp;EGLint numScreens;<br>
&#43;-&nbsp; &nbsp;EGLint i;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglGetScreensMESA(dpy, screens, MAX, &amp;numScreens);<b=
r>
&#43;-&nbsp; &nbsp;printf(&quot;Found %d screens\n&quot;, numScreens);<br>
&#43;-&nbsp; &nbsp;for (i =3D 0; i &lt; numScreens; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot; Screen %d handle: %d\n&quot;, i, (=
int) screens[i]);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-#endif<br>
&#43;-}<br>
&#43;-<br>
&#43;-/**<br>
&#43;- * Print table of all available configurations.<br>
&#43;- */<br>
&#43;-static void<br>
&#43;-PrintConfigs(EGLDisplay d, EGLConfig *configs, EGLint numConfigs)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp;EGLint i;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;printf(&quot;Configurations:\n&quot;);<br>
&#43;-&nbsp; &nbsp;printf(&quot;&nbsp; &nbsp; &nbsp;bf lv d st colorbuffer =
dp st&nbsp; &nbsp;supported \n&quot;);<br>
&#43;-&nbsp; &nbsp;printf(&quot;&nbsp; id sz&nbsp; l b ro&nbsp; r&nbsp; g&n=
bsp; b&nbsp; a th cl&nbsp; &nbsp;surfaces&nbsp; \n&quot;);<br>
&#43;-&nbsp; &nbsp;printf(&quot;-------------------------------------------=
---\n&quot;);<br>
&#43;-&nbsp; &nbsp;for (i =3D 0; i &lt; numConfigs; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; EGLint id, size, level;<br>
&#43;-&nbsp; &nbsp; &nbsp; EGLint red, green, blue, alpha;<br>
&#43;-&nbsp; &nbsp; &nbsp; EGLint depth, stencil;<br>
&#43;-&nbsp; &nbsp; &nbsp; EGLint surfaces;<br>
&#43;-&nbsp; &nbsp; &nbsp; EGLint doubleBuf =3D 1, stereo =3D 0;<br>
&#43;-&nbsp; &nbsp; &nbsp; char surfString[100] =3D &quot;&quot;;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_CONFIG_ID,=
 &amp;id);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_BUFFER_SIZ=
E, &amp;size);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_LEVEL, &am=
p;level);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_RED_SIZE, =
&amp;red);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_GREEN_SIZE=
, &amp;green);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_BLUE_SIZE,=
 &amp;blue);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_ALPHA_SIZE=
, &amp;alpha);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_DEPTH_SIZE=
, &amp;depth);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_STENCIL_SI=
ZE, &amp;stencil);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_SURFACE_TY=
PE, &amp;surfaces);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; if (surfaces &amp; EGL_WINDOW_BIT)<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;strcat(surfString, &quot;win,&quot;=
);<br>
&#43;-&nbsp; &nbsp; &nbsp; if (surfaces &amp; EGL_PBUFFER_BIT)<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;strcat(surfString, &quot;pb,&quot;)=
;<br>
&#43;-&nbsp; &nbsp; &nbsp; if (surfaces &amp; EGL_PIXMAP_BIT)<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;strcat(surfString, &quot;pix,&quot;=
);<br>
&#43;-&nbsp; &nbsp; &nbsp; if (strlen(surfString) &gt; 0)<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;surfString[strlen(surfString) - 1] =
=3D 0;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;0x%02x %2d %2d %c&nbsp; %c %2d %2d =
%2d %2d %2d %2d&nbsp; &nbsp;%-12s\n&quot;,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;id, size, level,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;doubleBuf ? 'y' : '.'=
,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;stereo ? 'y' : '.',<b=
r>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;red, green, blue, alp=
ha,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;depth, stencil, surfS=
tring);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-}<br>
&#43;-<br>
&#43;-<br>
&#43;-<br>
&#43;-int<br>
&#43;-main(int argc, char *argv[])<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp;int maj, min;<br>
&#43;-&nbsp; &nbsp;EGLContext ctx;<br>
&#43;-&nbsp; &nbsp;EGLSurface pbuffer;<br>
&#43;-&nbsp; &nbsp;EGLConfig *configs;<br>
&#43;-&nbsp; &nbsp;EGLint numConfigs;<br>
&#43;-&nbsp; &nbsp;EGLBoolean b;<br>
&#43;-&nbsp; &nbsp;const EGLint pbufAttribs[] =3D {<br>
&#43;-&nbsp; &nbsp; &nbsp; EGL_WIDTH, 500,<br>
&#43;-&nbsp; &nbsp; &nbsp; EGL_HEIGHT, 500,<br>
&#43;-&nbsp; &nbsp; &nbsp; EGL_NONE<br>
&#43;-&nbsp; &nbsp;};<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);<br>
&#43;-&nbsp; &nbsp;assert(d);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;if (!eglInitialize(d, &amp;maj, &amp;min)) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;demo: eglInitialize failed\n&quot;)=
;<br>
&#43;-&nbsp; &nbsp; &nbsp; exit(1);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;printf(&quot;EGL version =3D %d.%d\n&quot;, maj, min);<b=
r>
&#43;-&nbsp; &nbsp;printf(&quot;EGL_VENDOR =3D %s\n&quot;, eglQueryString(d=
, EGL_VENDOR));<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;if (!strstr(eglQueryString(d, EGL_EXTENSIONS),<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;EGL_MESA=
_screen_surface&quot;)) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;EGL_MESA_screen_surface is not supp=
orted\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; exit(1);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglGetConfigs(d, NULL, 0, &amp;numConfigs);<br>
&#43;-&nbsp; &nbsp;configs =3D malloc(sizeof(*configs) *numConfigs);<br>
&#43;-&nbsp; &nbsp;eglGetConfigs(d, configs, numConfigs, &amp;numConfigs);<=
br>
&#43;-<br>
&#43;-&nbsp; &nbsp;PrintConfigs(d, configs, numConfigs);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglBindAPI(EGL_OPENGL_API);<br>
&#43;-&nbsp; &nbsp;ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, =
NULL);<br>
&#43;-&nbsp; &nbsp;if (ctx =3D=3D EGL_NO_CONTEXT) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;failed to create context\n&quot;);<=
br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;pbuffer =3D eglCreatePbufferSurface(d, configs[0], pbufA=
ttribs);<br>
&#43;-&nbsp; &nbsp;if (pbuffer =3D=3D EGL_NO_SURFACE) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;failed to create pbuffer\n&quot;);<=
br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;free(configs);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;b =3D eglMakeCurrent(d, pbuffer, pbuffer, ctx);<br>
&#43;-&nbsp; &nbsp;if (!b) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;make current failed\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;b =3D eglMakeCurrent(d, EGL_NO_SURFACE, EGL_NO_SURFACE, =
EGL_NO_CONTEXT);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;TestScreens(d);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglDestroySurface(d, pbuffer);<br>
&#43;-&nbsp; &nbsp;eglDestroyContext(d, ctx);<br>
&#43;-&nbsp; &nbsp;eglTerminate(d);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;return 0;<br>
&#43;-}<br>
&#43;diff --git a/src/egl/opengl/demo2.c b/src/egl/opengl/demo2.c<br>
&#43;deleted file mode 100644<br>
&#43;index bfef59e..0000000<br>
&#43;--- a/src/egl/opengl/demo2.c<br>
&#43;&#43;&#43;&#43; /dev/null<br>
&#43;@@ -1,221 &#43;0,0 @@<br>
&#43;-/*<br>
&#43;- * Exercise EGL API functions<br>
&#43;- */<br>
&#43;-<br>
&#43;-#define EGL_EGLEXT_PROTOTYPES<br>
&#43;-<br>
&#43;-#include &lt;assert.h&gt;<br>
&#43;-#include &lt;stdio.h&gt;<br>
&#43;-#include &lt;stdlib.h&gt;<br>
&#43;-#include &lt;string.h&gt;<br>
&#43;-#include &lt;unistd.h&gt;<br>
&#43;-<br>
&#43;-#include &lt;EGL/egl.h&gt;<br>
&#43;-#include &lt;EGL/eglext.h&gt;<br>
&#43;-#include &quot;gl_wrap.h&quot;<br>
&#43;-<br>
&#43;-/*#define FRONTBUFFER*/<br>
&#43;-<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat=
 y2,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; GLfloat r, GLfloat g, GLfloat b)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp;GLfloat v[4][2], c[4][4];<br>
&#43;-&nbsp; &nbsp;int i;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;v[0][0] =3D x1;&nbsp; &nbsp;v[0][1] =3D y1;<br>
&#43;-&nbsp; &nbsp;v[1][0] =3D x2;&nbsp; &nbsp;v[1][1] =3D y1;<br>
&#43;-&nbsp; &nbsp;v[2][0] =3D x2;&nbsp; &nbsp;v[2][1] =3D y2;<br>
&#43;-&nbsp; &nbsp;v[3][0] =3D x1;&nbsp; &nbsp;v[3][1] =3D y2;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;for (i =3D 0; i &lt; 4; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; c[i][0] =3D r;<br>
&#43;-&nbsp; &nbsp; &nbsp; c[i][1] =3D g;<br>
&#43;-&nbsp; &nbsp; &nbsp; c[i][2] =3D b;<br>
&#43;-&nbsp; &nbsp; &nbsp; c[i][3] =3D 1.0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glVertexPointer(2, GL_FLOAT, 0, v);<br>
&#43;-&nbsp; &nbsp;glColorPointer(4, GL_FLOAT, 0, c);<br>
&#43;-&nbsp; &nbsp;glEnableClientState(GL_VERTEX_ARRAY);<br>
&#43;-&nbsp; &nbsp;glEnableClientState(GL_COLOR_ARRAY);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glDrawArrays(GL_TRIANGLE_FAN, 0, 4);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glDisableClientState(GL_VERTEX_ARRAY);<br>
&#43;-&nbsp; &nbsp;glDisableClientState(GL_COLOR_ARRAY);<br>
&#43;-}<br>
&#43;-<br>
&#43;-<br>
&#43;-static void redraw(EGLDisplay dpy, EGLSurface surf, int rot)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp;GLfloat r, g, b;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;printf(&quot;Redraw event\n&quot;);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glClearColor( rand()/(float)RAND_MAX,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rand()/(float)=
RAND_MAX,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rand()/(float)=
RAND_MAX,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glClear( GL_COLOR_BUFFER_BIT );<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;r =3D rand()/(float)RAND_MAX;<br>
&#43;-&nbsp; &nbsp;g =3D rand()/(float)RAND_MAX;<br>
&#43;-&nbsp; &nbsp;b =3D rand()/(float)RAND_MAX;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glPushMatrix();<br>
&#43;-&nbsp; &nbsp;glRotatef(rot, 0, 0, 1);<br>
&#43;-&nbsp; &nbsp;glScalef(.5, .5, .5);<br>
&#43;-&nbsp; &nbsp;_subset_Rectf( -1, -1, 1, 1, r, g, b );<br>
&#43;-&nbsp; &nbsp;glPopMatrix();<br>
&#43;-<br>
&#43;-#ifdef FRONTBUFFER<br>
&#43;-&nbsp; &nbsp;glFlush();<br>
&#43;-#else<br>
&#43;-&nbsp; &nbsp;eglSwapBuffers( dpy, surf );<br>
&#43;-#endif<br>
&#43;-&nbsp; &nbsp;glFinish();<br>
&#43;-}<br>
&#43;-<br>
&#43;-<br>
&#43;-/**<br>
&#43;- * Test EGL_MESA_screen_surface functions<br>
&#43;- */<br>
&#43;-static void<br>
&#43;-TestScreens(EGLDisplay dpy)<br>
&#43;-{<br>
&#43;-#define MAX 8<br>
&#43;-&nbsp; &nbsp;EGLScreenMESA screens[MAX];<br>
&#43;-&nbsp; &nbsp;EGLint numScreens;<br>
&#43;-&nbsp; &nbsp;EGLint i;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglGetScreensMESA(dpy, screens, MAX, &amp;numScreens);<b=
r>
&#43;-&nbsp; &nbsp;printf(&quot;Found %d screens\n&quot;, numScreens);<br>
&#43;-&nbsp; &nbsp;for (i =3D 0; i &lt; numScreens; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot; Screen %d handle: %d\n&quot;, i, (=
int) screens[i]);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-}<br>
&#43;-#endif<br>
&#43;-<br>
&#43;-int<br>
&#43;-main(int argc, char *argv[])<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp;int maj, min;<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;EGLContext ctx;<br>
&#43;-&nbsp; &nbsp;EGLSurface pbuffer, screen_surf;<br>
&#43;-&nbsp; &nbsp;EGLConfig configs[10];<br>
&#43;-&nbsp; &nbsp;EGLint numConfigs, i;<br>
&#43;-&nbsp; &nbsp;EGLBoolean b;<br>
&#43;-&nbsp; &nbsp;const EGLint pbufAttribs[] =3D {<br>
&#43;-&nbsp; &nbsp; &nbsp; EGL_WIDTH, 500,<br>
&#43;-&nbsp; &nbsp; &nbsp; EGL_HEIGHT, 500,<br>
&#43;-&nbsp; &nbsp; &nbsp; EGL_NONE<br>
&#43;-&nbsp; &nbsp;};<br>
&#43;-&nbsp; &nbsp;EGLint screenAttribs[32];<br>
&#43;-&nbsp; &nbsp;EGLModeMESA mode;<br>
&#43;-&nbsp; &nbsp;EGLScreenMESA screen;<br>
&#43;-&nbsp; &nbsp;EGLint count;<br>
&#43;-#endif<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);<br>
&#43;-&nbsp; &nbsp;assert(d);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;if (!eglInitialize(d, &amp;maj, &amp;min)) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;demo: eglInitialize failed\n&quot;)=
;<br>
&#43;-&nbsp; &nbsp; &nbsp; exit(1);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;printf(&quot;EGL version =3D %d.%d\n&quot;, maj, min);<b=
r>
&#43;-&nbsp; &nbsp;printf(&quot;EGL_VENDOR =3D %s\n&quot;, eglQueryString(d=
, EGL_VENDOR));<br>
&#43;-&nbsp; &nbsp;if (!strstr(eglQueryString(d, EGL_EXTENSIONS),<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;EGL_MESA=
_screen_surface&quot;)) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;EGL_MESA_screen_surface is not supp=
orted\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; exit(1);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;eglGetConfigs(d, configs, 10, &amp;numConfigs);<br>
&#43;-&nbsp; &nbsp;printf(&quot;Got %d EGL configs:\n&quot;, numConfigs);<b=
r>
&#43;-&nbsp; &nbsp;for (i =3D 0; i &lt; numConfigs; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; EGLint id, red, depth;<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_CONFIG_ID,=
 &amp;id);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_RED_SIZE, =
&amp;red);<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetConfigAttrib(d, configs[i], EGL_DEPTH_SIZE=
, &amp;depth);<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;%2d:&nbsp; Red Size =3D %d&nbsp; De=
pth Size =3D %d\n&quot;, id, red, depth);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglGetScreensMESA(d, &amp;screen, 1, &amp;count);<br>
&#43;-&nbsp; &nbsp;eglGetModesMESA(d, screen, &amp;mode, 1, &amp;count);<br=
>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglBindAPI(EGL_OPENGL_API);<br>
&#43;-&nbsp; &nbsp;ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, =
NULL);<br>
&#43;-&nbsp; &nbsp;if (ctx =3D=3D EGL_NO_CONTEXT) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;failed to create context\n&quot;);<=
br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;pbuffer =3D eglCreatePbufferSurface(d, configs[0], pbufA=
ttribs);<br>
&#43;-&nbsp; &nbsp;if (pbuffer =3D=3D EGL_NO_SURFACE) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;failed to create pbuffer\n&quot;);<=
br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;b =3D eglMakeCurrent(d, pbuffer, pbuffer, ctx);<br>
&#43;-&nbsp; &nbsp;if (!b) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;make current failed\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;b =3D eglMakeCurrent(d, EGL_NO_SURFACE, EGL_NO_SURFACE, =
EGL_NO_CONTEXT);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;i =3D 0;<br>
&#43;-&nbsp; &nbsp;screenAttribs[i&#43;&#43;] =3D EGL_WIDTH;<br>
&#43;-&nbsp; &nbsp;eglGetModeAttribMESA(d, mode, EGL_WIDTH, &amp;screenAttr=
ibs[i&#43;&#43;]);<br>
&#43;-&nbsp; &nbsp;screenAttribs[i&#43;&#43;] =3D EGL_HEIGHT;<br>
&#43;-&nbsp; &nbsp;eglGetModeAttribMESA(d, mode, EGL_HEIGHT, &amp;screenAtt=
ribs[i&#43;&#43;]);<br>
&#43;-&nbsp; &nbsp;screenAttribs[i] =3D EGL_NONE;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;screen_surf =3D eglCreateScreenSurfaceMESA(d, configs[0]=
, screenAttribs);<br>
&#43;-&nbsp; &nbsp;if (screen_surf =3D=3D EGL_NO_SURFACE) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;failed to create screen surface\n&q=
uot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglShowScreenSurfaceMESA(d, screen, screen_surf, mode);<=
br>
&#43;-<br>
&#43;-&nbsp; &nbsp;b =3D eglMakeCurrent(d, screen_surf, screen_surf, ctx);<=
br>
&#43;-&nbsp; &nbsp;if (!b) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;make current failed\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glViewport(0, 0, 1024, 768);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glClearColor( 0,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1.0,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0,<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glClear( GL_COLOR_BUFFER_BIT );<br>
&#43;-<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;TestScreens(d);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glShadeModel( GL_FLAT );<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;for (i =3D 0; i &lt; 6; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; redraw(d, screen_surf, i*10 );<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;sleep(1)\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; sleep(1);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglDestroySurface(d, pbuffer);<br>
&#43;-&nbsp; &nbsp;eglDestroyContext(d, ctx);<br>
&#43;-&nbsp; &nbsp;eglTerminate(d);<br>
&#43;-#endif<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;return 0;<br>
&#43;-}<br>
&#43;diff --git a/src/egl/opengl/demo3.c b/src/egl/opengl/demo3.c<br>
&#43;deleted file mode 100644<br>
&#43;index 31b5d8b..0000000<br>
&#43;--- a/src/egl/opengl/demo3.c<br>
&#43;&#43;&#43;&#43; /dev/null<br>
&#43;@@ -1,652 &#43;0,0 @@<br>
&#43;-/*<br>
&#43;- * Exercise EGL API functions<br>
&#43;- */<br>
&#43;-<br>
&#43;-#define EGL_EGLEXT_PROTOTYPES<br>
&#43;-<br>
&#43;-#include &lt;EGL/egl.h&gt;<br>
&#43;-#include &lt;EGL/eglext.h&gt;<br>
&#43;-#include &quot;gl_wrap.h&quot;<br>
&#43;-#include &lt;assert.h&gt;<br>
&#43;-#include &lt;stdio.h&gt;<br>
&#43;-#include &lt;stdlib.h&gt;<br>
&#43;-#include &lt;string.h&gt;<br>
&#43;-#include &lt;unistd.h&gt;<br>
&#43;-<br>
&#43;-<br>
&#43;-<br>
&#43;-#define PIXEL_CENTER(x) ((long)(x) &#43; 0.5)<br>
&#43;-<br>
&#43;-#define GAP 10<br>
&#43;-#define ROWS 3<br>
&#43;-#define COLS 4<br>
&#43;-<br>
&#43;-#define OPENGL_WIDTH 48<br>
&#43;-#define OPENGL_HEIGHT 13<br>
&#43;-<br>
&#43;-<br>
&#43;-GLenum rgb, doubleBuffer, windType;<br>
&#43;-GLint windW, windH;<br>
&#43;-<br>
&#43;-GLenum mode1, mode2;<br>
&#43;-GLint boxW, boxH;<br>
&#43;-GLubyte OpenGL_bits[] =3D {<br>
&#43;-&nbsp; &nbsp;0x00, 0x03, 0x00, 0x00, 0x00, 0x00,<br>
&#43;-&nbsp; &nbsp;0x7f, 0xfb, 0xff, 0xff, 0xff, 0x01,<br>
&#43;-&nbsp; &nbsp;0x7f, 0xfb, 0xff, 0xff, 0xff, 0x01,<br>
&#43;-&nbsp; &nbsp;0x00, 0x03, 0x00, 0x00, 0x00, 0x00,<br>
&#43;-&nbsp; &nbsp;0x3e, 0x8f, 0xb7, 0xf9, 0xfc, 0x01,<br>
&#43;-&nbsp; &nbsp;0x63, 0xdb, 0xb0, 0x8d, 0x0d, 0x00,<br>
&#43;-&nbsp; &nbsp;0x63, 0xdb, 0xb7, 0x8d, 0x0d, 0x00,<br>
&#43;-&nbsp; &nbsp;0x63, 0xdb, 0xb6, 0x8d, 0x0d, 0x00,<br>
&#43;-&nbsp; &nbsp;0x63, 0x8f, 0xf3, 0xcc, 0x0d, 0x00,<br>
&#43;-&nbsp; &nbsp;0x63, 0x00, 0x00, 0x0c, 0x4c, 0x0a,<br>
&#43;-&nbsp; &nbsp;0x63, 0x00, 0x00, 0x0c, 0x4c, 0x0e,<br>
&#43;-&nbsp; &nbsp;0x63, 0x00, 0x00, 0x8c, 0xed, 0x0e,<br>
&#43;-&nbsp; &nbsp;0x3e, 0x00, 0x00, 0xf8, 0x0c, 0x00,<br>
&#43;-};<br>
&#43;-<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-static void Init(void)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; mode1 =3D GL_TRUE;<br>
&#43;-&nbsp; &nbsp; mode2 =3D GL_TRUE;<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void Reshape(int width, int height)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; windW =3D (GLint)width;<br>
&#43;-&nbsp; &nbsp; windH =3D (GLint)height;<br>
&#43;-}<br>
&#43;-<br>
&#43;-#if 0<br>
&#43;-static void RotateColorMask(void)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp; static GLint rotation =3D 0;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; rotation =3D (rotation &#43; 1) &amp; 0x3;<br>
&#43;-&nbsp; &nbsp; switch (rotation) {<br>
&#43;-&nbsp; &nbsp; &nbsp; case 0:<br>
&#43;-&nbsp; &nbsp; &nbsp; glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);=
<br>
&#43;-&nbsp; &nbsp; &nbsp; glIndexMask( 0xff );<br>
&#43;-&nbsp; &nbsp; &nbsp; break;<br>
&#43;-&nbsp; &nbsp; &nbsp; case 1:<br>
&#43;-&nbsp; &nbsp; &nbsp; glColorMask(GL_FALSE, GL_TRUE, GL_TRUE, GL_TRUE)=
;<br>
&#43;-&nbsp; &nbsp; &nbsp; glIndexMask(0xFE);<br>
&#43;-&nbsp; &nbsp; &nbsp; break;<br>
&#43;-&nbsp; &nbsp; &nbsp; case 2:<br>
&#43;-&nbsp; &nbsp; &nbsp; glColorMask(GL_TRUE, GL_FALSE, GL_TRUE, GL_TRUE)=
;<br>
&#43;-&nbsp; &nbsp; &nbsp; glIndexMask(0xFD);<br>
&#43;-&nbsp; &nbsp; &nbsp; break;<br>
&#43;-&nbsp; &nbsp; &nbsp; case 3:<br>
&#43;-&nbsp; &nbsp; &nbsp; glColorMask(GL_TRUE, GL_TRUE, GL_FALSE, GL_TRUE)=
;<br>
&#43;-&nbsp; &nbsp; &nbsp; glIndexMask(0xFB);<br>
&#43;-&nbsp; &nbsp; &nbsp; break;<br>
&#43;-&nbsp; &nbsp; }<br>
&#43;-}<br>
&#43;-#endif<br>
&#43;-<br>
&#43;-static void Viewport(GLint row, GLint column)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp; GLint x, y;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; boxW =3D (windW - (COLS &#43; 1) * GAP) / COLS;<br>
&#43;-&nbsp; &nbsp; boxH =3D (windH - (ROWS &#43; 1) * GAP) / ROWS;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; x =3D GAP &#43; column * (boxW &#43; GAP);<br>
&#43;-&nbsp; &nbsp; y =3D GAP &#43; row * (boxH &#43; GAP);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glViewport(x, y, boxW, boxH);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glMatrixMode(GL_PROJECTION);<br>
&#43;-&nbsp; &nbsp; glLoadIdentity();<br>
&#43;-&nbsp; &nbsp; glOrtho(-boxW/2, boxW/2, -boxH/2, boxH/2, 0.0, 1.0);<br=
>
&#43;-&nbsp; &nbsp; glMatrixMode(GL_MODELVIEW);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glEnable(GL_SCISSOR_TEST);<br>
&#43;-&nbsp; &nbsp; glScissor(x, y, boxW, boxH);<br>
&#43;-}<br>
&#43;-<br>
&#43;-enum {<br>
&#43;-&nbsp; &nbsp; COLOR_BLACK =3D 0,<br>
&#43;-&nbsp; &nbsp; COLOR_RED,<br>
&#43;-&nbsp; &nbsp; COLOR_GREEN,<br>
&#43;-&nbsp; &nbsp; COLOR_YELLOW,<br>
&#43;-&nbsp; &nbsp; COLOR_BLUE,<br>
&#43;-&nbsp; &nbsp; COLOR_MAGENTA,<br>
&#43;-&nbsp; &nbsp; COLOR_CYAN,<br>
&#43;-&nbsp; &nbsp; COLOR_WHITE<br>
&#43;-};<br>
&#43;-<br>
&#43;-static float RGBMap[9][3] =3D {<br>
&#43;-&nbsp; &nbsp; {0, 0, 0},<br>
&#43;-&nbsp; &nbsp; {1, 0, 0},<br>
&#43;-&nbsp; &nbsp; {0, 1, 0},<br>
&#43;-&nbsp; &nbsp; {1, 1, 0},<br>
&#43;-&nbsp; &nbsp; {0, 0, 1},<br>
&#43;-&nbsp; &nbsp; {1, 0, 1},<br>
&#43;-&nbsp; &nbsp; {0, 1, 1},<br>
&#43;-&nbsp; &nbsp; {1, 1, 1},<br>
&#43;-&nbsp; &nbsp; {0.5, 0.5, 0.5}<br>
&#43;-};<br>
&#43;-<br>
&#43;-static void SetColor(int c)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp; &nbsp;glColor3fv(RGBMap[c]);<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void Point(void)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp; GLint i;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_POINTS);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_WHITE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; for (i =3D 1; i &lt; 8; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; GLint j =3D i * 2;<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SetColor(COLOR_BLACK&#43;i);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2i(-j, -j);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2i(-j, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2i(-j, j);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2i(0, j);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2i(j, j);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2i(j, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2i(j, -j);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2i(0, -j);<br>
&#43;-&nbsp; &nbsp; &nbsp; }<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void Lines(void)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp; GLint i;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glPushMatrix();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glTranslatef(-12, 0, 0);<br>
&#43;-&nbsp; &nbsp; for (i =3D 1; i &lt; 8; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_BLACK&#43;i);<br>
&#43;-&nbsp; &nbsp; &nbsp; glBegin(GL_LINES);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2i(-boxW/4, -boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2i(boxW/4, boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; glEnd();<br>
&#43;-&nbsp; &nbsp; &nbsp; glTranslatef(4, 0, 0);<br>
&#43;-&nbsp; &nbsp; }<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glPopMatrix();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_LINES);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void LineStrip(void)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_LINE_STRIP);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_RED);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(-=
boxH/4));<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(b=
oxH/4));<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_BLUE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(bo=
xH/4));<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_WHITE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(-b=
oxH/4));<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_LINE_STRIP);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void LineLoop(void)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_LINE_LOOP);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_RED);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(-=
boxH/4));<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(b=
oxH/4));<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_BLUE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(bo=
xH/4));<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_WHITE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(-b=
oxH/4));<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glEnable(GL_LOGIC_OP);<br>
&#43;-&nbsp; &nbsp; glLogicOp(GL_XOR);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glEnable(GL_BLEND);<br>
&#43;-&nbsp; &nbsp; glBlendFunc(GL_ONE, GL_ONE);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; SetColor(COLOR_MAGENTA);<br>
&#43;-&nbsp; &nbsp; glBegin(GL_LINE_LOOP);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(-=
boxH/8));<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(b=
oxH/8));<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-&nbsp; &nbsp; glBegin(GL_LINE_LOOP);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(b=
oxH/8&#43;5));<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2f(PIXEL_CENTER(boxW/8), PIXEL_CENTER(bo=
xH/8&#43;5));<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-&nbsp; &nbsp; glDisable(GL_LOGIC_OP);<br>
&#43;-&nbsp; &nbsp; glDisable(GL_BLEND);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; glBegin(GL_POINTS);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_LINE_LOOP);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void Bitmap(void)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_LINES);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/2, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/2, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, -boxH/2);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, boxH/2);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_RED);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, -3);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, -3&#43;OPENGL_HEIGHT);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_BLUE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, -3);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(OPENGL_WIDTH, -3);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glPixelStorei(GL_UNPACK_LSB_FIRST, GL_TRUE);<br>
&#43;-&nbsp; &nbsp; glPixelStorei(GL_UNPACK_ALIGNMENT, 1);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glRasterPos2i(0, 0);<br>
&#43;-&nbsp; &nbsp; glBitmap(OPENGL_WIDTH, OPENGL_HEIGHT, 0, 3, 0.0, 0.0, O=
penGL_bits);<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void Triangles(void)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_TRIANGLES);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/4, -boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_RED);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/8, -boxH/16);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_BLUE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/8, -boxH/16);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/4, boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_RED);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/8, boxH/16);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_BLUE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/8, boxH/16);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_TRIANGLES);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-100, 100);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void TriangleStrip(void)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_TRIANGLE_STRIP);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/4, -boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_RED);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/4, boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_BLUE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, -boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_WHITE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_CYAN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/4, -boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_YELLOW);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/4, boxH/4);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_TRIANGLE_STRIP);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-100, 100);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void TriangleFan(void)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp; GLint vx[8][2];<br>
&#43;-&nbsp; &nbsp; GLint x0, y0, x1, y1, x2, y2, x3, y3;<br>
&#43;-&nbsp; &nbsp; GLint i;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; y0 =3D -boxH/4;<br>
&#43;-&nbsp; &nbsp; y1 =3D y0 &#43; boxH/2/3;<br>
&#43;-&nbsp; &nbsp; y2 =3D y1 &#43; boxH/2/3;<br>
&#43;-&nbsp; &nbsp; y3 =3D boxH/4;<br>
&#43;-&nbsp; &nbsp; x0 =3D -boxW/4;<br>
&#43;-&nbsp; &nbsp; x1 =3D x0 &#43; boxW/2/3;<br>
&#43;-&nbsp; &nbsp; x2 =3D x1 &#43; boxW/2/3;<br>
&#43;-&nbsp; &nbsp; x3 =3D boxW/4;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; vx[0][0] =3D x0; vx[0][1] =3D y1;<br>
&#43;-&nbsp; &nbsp; vx[1][0] =3D x0; vx[1][1] =3D y2;<br>
&#43;-&nbsp; &nbsp; vx[2][0] =3D x1; vx[2][1] =3D y3;<br>
&#43;-&nbsp; &nbsp; vx[3][0] =3D x2; vx[3][1] =3D y3;<br>
&#43;-&nbsp; &nbsp; vx[4][0] =3D x3; vx[4][1] =3D y2;<br>
&#43;-&nbsp; &nbsp; vx[5][0] =3D x3; vx[5][1] =3D y1;<br>
&#43;-&nbsp; &nbsp; vx[6][0] =3D x2; vx[6][1] =3D y0;<br>
&#43;-&nbsp; &nbsp; vx[7][0] =3D x1; vx[7][1] =3D y0;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_TRIANGLE_FAN);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_WHITE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; 8; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SetColor(COLOR_WHITE-i);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2iv(vx[i]);<br>
&#43;-&nbsp; &nbsp; &nbsp; }<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_TRIANGLE_FAN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-100, 100);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void Rect(void)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; glRecti(-boxW/4, -boxH/4, boxW/4, boxH/4);<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void PolygonFunc(void)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp; GLint vx[8][2];<br>
&#43;-&nbsp; &nbsp; GLint x0, y0, x1, y1, x2, y2, x3, y3;<br>
&#43;-&nbsp; &nbsp; GLint i;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; y0 =3D -boxH/4;<br>
&#43;-&nbsp; &nbsp; y1 =3D y0 &#43; boxH/2/3;<br>
&#43;-&nbsp; &nbsp; y2 =3D y1 &#43; boxH/2/3;<br>
&#43;-&nbsp; &nbsp; y3 =3D boxH/4;<br>
&#43;-&nbsp; &nbsp; x0 =3D -boxW/4;<br>
&#43;-&nbsp; &nbsp; x1 =3D x0 &#43; boxW/2/3;<br>
&#43;-&nbsp; &nbsp; x2 =3D x1 &#43; boxW/2/3;<br>
&#43;-&nbsp; &nbsp; x3 =3D boxW/4;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; vx[0][0] =3D x0; vx[0][1] =3D y1;<br>
&#43;-&nbsp; &nbsp; vx[1][0] =3D x0; vx[1][1] =3D y2;<br>
&#43;-&nbsp; &nbsp; vx[2][0] =3D x1; vx[2][1] =3D y3;<br>
&#43;-&nbsp; &nbsp; vx[3][0] =3D x2; vx[3][1] =3D y3;<br>
&#43;-&nbsp; &nbsp; vx[4][0] =3D x3; vx[4][1] =3D y2;<br>
&#43;-&nbsp; &nbsp; vx[5][0] =3D x3; vx[5][1] =3D y1;<br>
&#43;-&nbsp; &nbsp; vx[6][0] =3D x2; vx[6][1] =3D y0;<br>
&#43;-&nbsp; &nbsp; vx[7][0] =3D x1; vx[7][1] =3D y0;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_POLYGON);<br>
&#43;-&nbsp; &nbsp; &nbsp; for (i =3D 0; i &lt; 8; i&#43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SetColor(COLOR_WHITE-i);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; glVertex2iv(vx[i]);<br>
&#43;-&nbsp; &nbsp; &nbsp; }<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_POLYGON);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(100, 100);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void Quads(void)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_QUADS);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/4, -boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_RED);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/8, -boxH/16);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_BLUE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/8, -boxH/16);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_WHITE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/4, -boxH/4);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/4, boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_RED);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/8, boxH/16);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_BLUE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/8, boxH/16);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_WHITE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/4, boxH/4);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_QUADS);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(100, 100);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-100, 100);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void QuadStrip(void)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_QUAD_STRIP);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_GREEN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/4, -boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_RED);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-boxW/4, boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_BLUE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, -boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_WHITE);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_CYAN);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/4, -boxH/4);<br>
&#43;-&nbsp; &nbsp; &nbsp; SetColor(COLOR_YELLOW);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(boxW/4, boxH/4);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glBegin(GL_QUAD_STRIP);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(0, 0);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(100, 100);<br>
&#43;-&nbsp; &nbsp; &nbsp; glVertex2i(-100, 100);<br>
&#43;-&nbsp; &nbsp; glEnd();<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void Draw(EGLDisplay dpy, EGLSurface surf)<br>
&#43;-{<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glViewport(0, 0, windW, windH);<br>
&#43;-&nbsp; &nbsp; glDisable(GL_SCISSOR_TEST);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glPushAttrib(GL_COLOR_BUFFER_BIT);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glColorMask(1, 1, 1, 1);<br>
&#43;-&nbsp; &nbsp; glIndexMask(~0);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glClearColor(0.0, 0.0, 0.0, 0.0);<br>
&#43;-&nbsp; &nbsp; glClear(GL_COLOR_BUFFER_BIT);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glPopAttrib();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; if (mode1) {<br>
&#43;-&nbsp; &nbsp; &nbsp; glShadeModel(GL_SMOOTH);<br>
&#43;-&nbsp; &nbsp; } else {<br>
&#43;-&nbsp; &nbsp; &nbsp; glShadeModel(GL_FLAT);<br>
&#43;-&nbsp; &nbsp; }<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; if (mode2) {<br>
&#43;-&nbsp; &nbsp; &nbsp; glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);<br>
&#43;-&nbsp; &nbsp; } else {<br>
&#43;-&nbsp; &nbsp; &nbsp; glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);<br>
&#43;-&nbsp; &nbsp; }<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; Viewport(0, 0); Point();<br>
&#43;-&nbsp; &nbsp; Viewport(0, 1); Lines();<br>
&#43;-&nbsp; &nbsp; Viewport(0, 2); LineStrip();<br>
&#43;-&nbsp; &nbsp; Viewport(0, 3); LineLoop();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; Viewport(1, 0); Bitmap();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; Viewport(1, 1); TriangleFan();<br>
&#43;-&nbsp; &nbsp; Viewport(1, 2); Triangles();<br>
&#43;-&nbsp; &nbsp; Viewport(1, 3); TriangleStrip();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; Viewport(2, 0); Rect();<br>
&#43;-&nbsp; &nbsp; Viewport(2, 1); PolygonFunc();<br>
&#43;-&nbsp; &nbsp; Viewport(2, 2); Quads();<br>
&#43;-&nbsp; &nbsp; Viewport(2, 3); QuadStrip();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; glFlush();<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; if (doubleBuffer) {<br>
&#43;-&nbsp; &nbsp; &nbsp; eglSwapBuffers(dpy, surf);<br>
&#43;-&nbsp; &nbsp; }<br>
&#43;-}<br>
&#43;-<br>
&#43;-static void<br>
&#43;-write_ppm(const char *filename, const GLubyte *buffer, int width, int=
 height)<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp;const int binary =3D 0;<br>
&#43;-&nbsp; &nbsp;FILE *f =3D fopen( filename, &quot;w&quot; );<br>
&#43;-&nbsp; &nbsp;if (f) {<br>
&#43;-&nbsp; &nbsp; &nbsp; int i, x, y;<br>
&#43;-&nbsp; &nbsp; &nbsp; const GLubyte *ptr =3D buffer;<br>
&#43;-&nbsp; &nbsp; &nbsp; if (binary) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(f,&quot;P6\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(f,&quot;# ppm-file created =
by osdemo.c\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(f,&quot;%i %i\n&quot;, widt=
h,height);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(f,&quot;255\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fclose(f);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;f =3D fopen( filename, &quot;ab&quo=
t; );&nbsp; /* reopen in binary append mode */<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (y=3Dheight-1; y&gt;=3D0; y--) =
{<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (x=3D0; x&lt;width; x&#=
43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D (y*width=
 &#43; x) * 4;<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fputc(ptr[i], =
f);&nbsp; &nbsp;/* write red */<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fputc(ptr[i&#4=
3;1], f); /* write green */<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fputc(ptr[i&#4=
3;2], f); /* write blue */<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
&#43;-&nbsp; &nbsp; &nbsp; }<br>
&#43;-&nbsp; &nbsp; &nbsp; else {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*ASCII*/<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int counter =3D 0;<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(f,&quot;P3\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(f,&quot;# ascii ppm file cr=
eated by osdemo.c\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(f,&quot;%i %i\n&quot;, widt=
h, height);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(f,&quot;255\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (y=3Dheight-1; y&gt;=3D0; y--) =
{<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (x=3D0; x&lt;width; x&#=
43;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i =3D (y*width=
 &#43; x) * 4;<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(f, &qu=
ot; %3d %3d %3d&quot;, ptr[i], ptr[i&#43;1], ptr[i&#43;2]);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;counter&#43;&#=
43;;<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (counter % =
5 =3D=3D 0)<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fprint=
f(f, &quot;\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
&#43;-&nbsp; &nbsp; &nbsp; }<br>
&#43;-&nbsp; &nbsp; &nbsp; fclose(f);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-}<br>
&#43;-#endif<br>
&#43;-<br>
&#43;-int<br>
&#43;-main(int argc, char *argv[])<br>
&#43;-{<br>
&#43;-&nbsp; &nbsp;int maj, min;<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;EGLContext ctx;<br>
&#43;-&nbsp; &nbsp;EGLSurface screen_surf;<br>
&#43;-&nbsp; &nbsp;EGLConfig configs[10];<br>
&#43;-&nbsp; &nbsp;EGLScreenMESA screen;<br>
&#43;-&nbsp; &nbsp;EGLModeMESA mode;<br>
&#43;-&nbsp; &nbsp;EGLint numConfigs, count;<br>
&#43;-&nbsp; &nbsp;EGLBoolean b;<br>
&#43;-&nbsp; &nbsp;const GLubyte *bitmap;<br>
&#43;-&nbsp; &nbsp;EGLint screenAttribs[32];<br>
&#43;-&nbsp; &nbsp;EGLint i;<br>
&#43;-#endif<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);<br>
&#43;-&nbsp; &nbsp;assert(d);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;if (!eglInitialize(d, &amp;maj, &amp;min)) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;demo: eglInitialize failed\n&quot;)=
;<br>
&#43;-&nbsp; &nbsp; &nbsp; exit(1);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;printf(&quot;EGL version =3D %d.%d\n&quot;, maj, min);<b=
r>
&#43;-&nbsp; &nbsp;printf(&quot;EGL_VENDOR =3D %s\n&quot;, eglQueryString(d=
, EGL_VENDOR));<br>
&#43;-&nbsp; &nbsp;if (!strstr(eglQueryString(d, EGL_EXTENSIONS),<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;EGL_MESA=
_screen_surface&quot;)) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;EGL_MESA_screen_surface is not supp=
orted\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; exit(1);<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;eglGetConfigs(d, configs, 10, &amp;numConfigs);<br>
&#43;-&nbsp; &nbsp;eglGetScreensMESA(d, &amp;screen, 1, &amp;count);<br>
&#43;-&nbsp; &nbsp;eglGetModesMESA(d, screen, &amp;mode, 1, &amp;count);<br=
>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglBindAPI(EGL_OPENGL_API);<br>
&#43;-&nbsp; &nbsp;ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, =
NULL);<br>
&#43;-&nbsp; &nbsp;if (ctx =3D=3D EGL_NO_CONTEXT) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;failed to create context\n&quot;);<=
br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;i =3D 0;<br>
&#43;-&nbsp; &nbsp;screenAttribs[i&#43;&#43;] =3D EGL_WIDTH;<br>
&#43;-&nbsp; &nbsp;eglGetModeAttribMESA(d, mode, EGL_WIDTH, &amp;screenAttr=
ibs[i&#43;&#43;]);<br>
&#43;-&nbsp; &nbsp;screenAttribs[i&#43;&#43;] =3D EGL_HEIGHT;<br>
&#43;-&nbsp; &nbsp;eglGetModeAttribMESA(d, mode, EGL_HEIGHT, &amp;screenAtt=
ribs[i&#43;&#43;]);<br>
&#43;-&nbsp; &nbsp;screenAttribs[i] =3D EGL_NONE;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;screen_surf =3D eglCreateScreenSurfaceMESA(d, configs[0]=
, screenAttribs);<br>
&#43;-&nbsp; &nbsp;if (screen_surf =3D=3D EGL_NO_SURFACE) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;failed to create screen surface\n&q=
uot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglShowScreenSurfaceMESA(d, screen, screen_surf, mode);<=
br>
&#43;-<br>
&#43;-&nbsp; &nbsp;b =3D eglMakeCurrent(d, screen_surf, screen_surf, ctx);<=
br>
&#43;-&nbsp; &nbsp;if (!b) {<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;make current failed\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; return 0;<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-&nbsp; &nbsp;glViewport(0, 0, 1024, 768);<br>
&#43;-<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;Init();<br>
&#43;-&nbsp; &nbsp;Reshape(1024, 768);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;/* some drivers crash when rendering to front buffer */<=
br>
&#43;-#if 0<br>
&#43;-&nbsp; &nbsp;glDrawBuffer( GL_FRONT );<br>
&#43;-&nbsp; &nbsp;glClearColor( 0, 1.0, 0, 1);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;glClear( GL_COLOR_BUFFER_BIT );<br>
&#43;-#endif<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;doubleBuffer =3D 1;<br>
&#43;-&nbsp; &nbsp;glDrawBuffer( GL_BACK );<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;Draw(d, screen_surf);<br>
&#43;-&nbsp; &nbsp;sleep(2);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;/* TODO EGL_KHR_lock_surface */<br>
&#43;-&nbsp; &nbsp;bitmap =3D NULL;<br>
&#43;-&nbsp; &nbsp;if (bitmap)<br>
&#43;-&nbsp; &nbsp; &nbsp; write_ppm(&quot;dump.ppm&quot;, bitmap, 1024, 76=
8);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;eglDestroySurface(d, screen_surf);<br>
&#43;-&nbsp; &nbsp;eglDestroyContext(d, ctx);<br>
&#43;-&nbsp; &nbsp;eglTerminate(d);<br>
&#43;-#endif<br>
&#43;-<br>
&#43;-&nbsp; &nbsp;return 0;<br>
&#43;-}<br>
&#43;diff --git a/src/egl/opengl/eglinfo.c b/src/egl/opengl/eglinfo.c<br>
&#43;index 8e82e73..1f79fef 100644<br>
&#43;--- a/src/egl/opengl/eglinfo.c<br>
&#43;&#43;&#43;&#43; b/src/egl/opengl/eglinfo.c<br>
&#43;@@ -93,10 &#43;93,6 @@ PrintConfigs(EGLDisplay d)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; strcat(surfString, &quot;pb,&quot;)=
;<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;if (surfaces &amp; EGL_PIXMAP_BIT)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; strcat(surfString, &quot;pix,&quot;=
);<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp; &nbsp; if (surfaces &amp; EGL_SCREEN_BIT_MESA)<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;strcat(surfString, &quot;scrn,&quot=
;);<br>
&#43;-#endif<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;if (strlen(surfString) &gt; 0)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; surfString[strlen(surfString) - 1] =
=3D 0;<br>
&#43;<br>
&#43;@@ -117,45 &#43;113,6 @@ PrintConfigs(EGLDisplay d)<br>
&#43; }<br>
&#43;<br>
&#43;<br>
&#43;-/**<br>
&#43;- * Print table of all available configurations.<br>
&#43;- */<br>
&#43;-static void<br>
&#43;-PrintModes(EGLDisplay d)<br>
&#43;-{<br>
&#43;-#ifdef EGL_MESA_screen_surface<br>
&#43;-&nbsp; &nbsp;const char *extensions =3D eglQueryString(d, EGL_EXTENSI=
ONS);<br>
&#43;-&nbsp; &nbsp;if (strstr(extensions, &quot;EGL_MESA_screen_surface&quo=
t;)) {<br>
&#43;-&nbsp; &nbsp; &nbsp; EGLScreenMESA screens[MAX_SCREENS];<br>
&#43;-&nbsp; &nbsp; &nbsp; EGLint numScreens =3D 1, scrn;<br>
&#43;-&nbsp; &nbsp; &nbsp; EGLModeMESA modes[MAX_MODES];<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; eglGetScreensMESA(d, screens, MAX_SCREENS, &amp;=
numScreens);<br>
&#43;-&nbsp; &nbsp; &nbsp; printf(&quot;Number of Screens: %d\n\n&quot;, nu=
mScreens);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; for (scrn =3D 0; scrn &lt; numScreens; scrn&#43;=
&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;EGLint numModes, i;<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;eglGetModesMESA(d, screens[scrn], m=
odes, MAX_MODES, &amp;numModes);<br>
&#43;-<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printf(&quot;Screen %d Modes:\n&quo=
t;, scrn);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printf(&quot;&nbsp; id&nbsp; width =
height refresh&nbsp; name\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printf(&quot;----------------------=
-------------------\n&quot;);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for (i =3D 0; i &lt; numModes; i&#4=
3;&#43;) {<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; EGLint id, w, h, r;<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const char *str;<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eglGetModeAttribMESA(d, mod=
es[i], EGL_MODE_ID_MESA, &amp;id);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eglGetModeAttribMESA(d, mod=
es[i], EGL_WIDTH, &amp;w);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eglGetModeAttribMESA(d, mod=
es[i], EGL_HEIGHT, &amp;h);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eglGetModeAttribMESA(d, mod=
es[i], EGL_REFRESH_RATE_MESA, &amp;r);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; str =3D eglQueryModeStringM=
ESA(d, modes[i]);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; printf(&quot;0x%02x %5d&nbs=
p; %5d&nbsp; &nbsp;%.3f&nbsp; %s\n&quot;, id, w, h, r / 1000.0, str);<br>
&#43;-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
&#43;-&nbsp; &nbsp; &nbsp; }<br>
&#43;-&nbsp; &nbsp;}<br>
&#43;-#endif<br>
&#43;-}<br>
&#43;-<br>
&#43; static void<br>
&#43; PrintExtensions(EGLDisplay d)<br>
&#43; {<br>
&#43;@@ -215,8 &#43;172,6 @@ main(int argc, char *argv[])<br>
&#43;<br>
&#43;&nbsp; &nbsp; PrintConfigs(d);<br>
&#43;<br>
&#43;-&nbsp; &nbsp;PrintModes(d);<br>
&#43;-<br>
&#43;&nbsp; &nbsp; eglTerminate(d);<br>
&#43;<br>
&#43;&nbsp; &nbsp; return 0;<br>
&#43;diff --git a/src/egl/opengles1/Makefile.am b/src/egl/opengles1/Makefil=
e.am<br>
&#43;index 516e516..1cc2e1f 100644<br>
&#43;--- a/src/egl/opengles1/Makefile.am<br>
&#43;&#43;&#43;&#43; b/src/egl/opengles1/Makefile.am<br>
&#43;@@ -38,24 &#43;38,6 @@ AM_LDFLAGS =3D \<br>
&#43;<br>
&#43; bin_PROGRAMS =3D<br>
&#43;<br>
&#43;-if HAVE_EGL<br>
&#43;-if HAVE_GLESV1<br>
&#43;-bin_PROGRAMS &#43;=3D \<br>
&#43;-&nbsp; &nbsp; &nbsp; drawtex_screen \<br>
&#43;-&nbsp; &nbsp; &nbsp; gears_screen \<br>
&#43;-&nbsp; &nbsp; &nbsp; torus_screen \<br>
&#43;-&nbsp; &nbsp; &nbsp; tri_screen<br>
&#43;-<br>
&#43;-drawtex_screen_SOURCES =3D drawtex.c<br>
&#43;-gears_screen_SOURCES =3D gears.c<br>
&#43;-torus_screen_SOURCES =3D torus.c<br>
&#43;-tri_screen_SOURCES =3D tri.c<br>
&#43;-<br>
&#43;-drawtex_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.l=
a" rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43;-gears_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la"=
 rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43;-torus_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la"=
 rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43;-tri_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" r=
el=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43;-<br>
&#43; if HAVE_X11<br>
&#43; bin_PROGRAMS &#43;=3D \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;clear \<br>
&#43;@@ -94,5 &#43;76,3 @@ gears_x11_LDADD =3D ../eglut/<a href=3D"http://l=
ibeglut_x11.la" rel=3D"noreferrer" target=3D"_blank">libeglut_x11.la</a><br=
>
&#43; torus_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=
=3D"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43; tri_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D"=
noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43; endif<br>
&#43;-endif<br>
&#43;-endif<br>
&#43;diff --git a/src/egl/opengles2/Makefile.am b/src/egl/opengles2/Makefil=
e.am<br>
&#43;index 74af460..422cb03 100644<br>
&#43;--- a/src/egl/opengles2/Makefile.am<br>
&#43;&#43;&#43;&#43; b/src/egl/opengles2/Makefile.am<br>
&#43;@@ -33,13 &#43;33,7 @@ AM_LDFLAGS =3D \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;$(EGL_LIBS) \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;-lm<br>
&#43;<br>
&#43;-if HAVE_EGL<br>
&#43;-if HAVE_GLESV2<br>
&#43;-bin_PROGRAMS =3D \<br>
&#43;-&nbsp; &nbsp; &nbsp; es2gears_screen<br>
&#43;-<br>
&#43;-es2gears_screen_SOURCES =3D es2gears.c<br>
&#43;-es2gears_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.=
la" rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43;&#43;bin_PROGRAMS =3D<br>
&#43;<br>
&#43; if HAVE_WAYLAND<br>
&#43; bin_PROGRAMS &#43;=3D es2gears_wayland<br>
&#43;@@ -59,6 &#43;53,4 @@ es2gears_x11_SOURCES =3D es2gears.c<br>
&#43; es2gears_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" re=
l=3D"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43; es2tri_LDADD =3D $(X11_LIBS)<br>
&#43; endif<br>
&#43;-endif<br>
&#43;-endif<br>
&#43;<br>
&#43;diff --git a/src/egl/openvg/Makefile.am b/src/egl/openvg/Makefile.am<b=
r>
&#43;index b545225..5fd1cf8 100644<br>
&#43;--- a/src/egl/openvg/Makefile.am<br>
&#43;&#43;&#43;&#43; b/src/egl/openvg/Makefile.am<br>
&#43;@@ -50,21 &#43;50,13 @@ endif<br>
&#43; if HAVE_EGL<br>
&#43; if HAVE_VG<br>
&#43; bin_PROGRAMS =3D \<br>
&#43;-&nbsp; &nbsp; &nbsp; lion_screen \<br>
&#43;-&nbsp; &nbsp; &nbsp; sp_screen \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;$(EGL_X11_DEMOS)<br>
&#43; endif<br>
&#43; endif<br>
&#43;<br>
&#43;-lion_screen_SOURCES =3D lion.c lion-render.c lion-render.h<br>
&#43;-sp_screen_SOURCES =3D sp.c<br>
&#43;-<br>
&#43; lion_x11_SOURCES =3D lion.c lion-render.c lion-render.h<br>
&#43; sp_x11_SOURCES =3D sp.c<br>
&#43;<br>
&#43;-lion_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" =
rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43;-sp_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" re=
l=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43;-<br>
&#43; lion_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D=
"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43; sp_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D"n=
oreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43;<br>
&#43;diff --git a/src/egl/openvg/Makefile.in b/src/egl/openvg/Makefile.in<b=
r>
&#43;index 99e9288..3652fbb 100644<br>
&#43;--- a/src/egl/openvg/Makefile.in<br>
&#43;&#43;&#43;&#43; b/src/egl/openvg/Makefile.in<br>
&#43;@@ -108,8 &#43;108,6 @@ host_triplet =3D @host@<br>
&#43; @HAVE_FREETYPE2_TRUE@@HAVE_X11_TRUE@am__append_1 =3D \<br>
&#43; @HAVE_FREETYPE2_TRUE@@HAVE_X11_TRUE@&nbsp; text<br>
&#43;<br>
&#43;-@HAVE_EGL_TRUE@@HAVE_VG_TRUE@noinst_PROGRAMS =3D lion_screen$(EXEEXT)=
 \<br>
&#43;-@HAVE_EGL_TRUE@@HAVE_VG_TRUE@ sp_screen$(EXEEXT) \<br>
&#43; @HAVE_EGL_TRUE@@HAVE_VG_TRUE@ $(am__EXEEXT_2)<br>
&#43; subdir =3D src/egl/openvg<br>
&#43; DIST_COMMON =3D $(srcdir)/Makefile.in $(srcdir)/Makefile.am \<br>
&#43;@@ -128,9 &#43;126,6 @@ CONFIG_CLEAN_VPATH_FILES =3D<br>
&#43; @HAVE_X11_TRUE@am__EXEEXT_2 =3D lion_x11$(EXEEXT) sp_x11$(EXEEXT) \<b=
r>
&#43; @HAVE_X11_TRUE@&nbsp; &nbsp; &nbsp; &nbsp;$(am__EXEEXT_1)<br>
&#43; PROGRAMS =3D $(noinst_PROGRAMS)<br>
&#43;-am_lion_screen_OBJECTS =3D lion.$(OBJEXT) lion-render.$(OBJEXT)<br>
&#43;-lion_screen_OBJECTS =3D $(am_lion_screen_OBJECTS)<br>
&#43;-lion_screen_DEPENDENCIES =3D ../eglut/<a href=3D"http://libeglut_scre=
en.la" rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43; AM_V_lt =3D $(am__v_lt_@AM_V@)<br>
&#43; am__v_lt_ =3D $(am__v_lt_@AM_DEFAULT_V@)<br>
&#43; am__v_lt_0 =3D --silent<br>
&#43;@@ -138,9 &#43;133,6 @@ am__v_lt_1 =3D<br>
&#43; am_lion_x11_OBJECTS =3D lion.$(OBJEXT) lion-render.$(OBJEXT)<br>
&#43; lion_x11_OBJECTS =3D $(am_lion_x11_OBJECTS)<br>
&#43; lion_x11_DEPENDENCIES =3D ../eglut/<a href=3D"http://libeglut_x11.la"=
 rel=3D"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43;-am_sp_screen_OBJECTS =3D sp.$(OBJEXT)<br>
&#43;-sp_screen_OBJECTS =3D $(am_sp_screen_OBJECTS)<br>
&#43;-sp_screen_DEPENDENCIES =3D ../eglut/<a href=3D"http://libeglut_screen=
.la" rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43; am_sp_x11_OBJECTS =3D sp.$(OBJEXT)<br>
&#43; sp_x11_OBJECTS =3D $(am_sp_x11_OBJECTS)<br>
&#43; sp_x11_DEPENDENCIES =3D ../eglut/<a href=3D"http://libeglut_x11.la" r=
el=3D"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43;@@ -184,10 &#43;176,10 @@ AM_V_CCLD =3D $(am__v_CCLD_@AM_V@)<br>
&#43; am__v_CCLD_ =3D $(am__v_CCLD_@AM_DEFAULT_V@)<br>
&#43; am__v_CCLD_0 =3D @echo &quot;&nbsp; CCLD&nbsp; &nbsp; &quot; $@;<br>
&#43; am__v_CCLD_1 =3D<br>
&#43;-SOURCES =3D $(lion_screen_SOURCES) $(lion_x11_SOURCES) \<br>
&#43;-&nbsp; &nbsp; &nbsp; $(sp_screen_SOURCES) $(sp_x11_SOURCES) $(text_SO=
URCES)<br>
&#43;-DIST_SOURCES =3D $(lion_screen_SOURCES) $(lion_x11_SOURCES) \<br>
&#43;-&nbsp; &nbsp; &nbsp; $(sp_screen_SOURCES) $(sp_x11_SOURCES) $(text_SO=
URCES)<br>
&#43;&#43;SOURCES =3D $(lion_x11_SOURCES) \<br>
&#43;&#43;&nbsp; &nbsp; &nbsp; $(sp_x11_SOURCES) $(text_SOURCES)<br>
&#43;&#43;DIST_SOURCES =3D $(lion_x11_SOURCES) \<br>
&#43;&#43;&nbsp; &nbsp; &nbsp; $(sp_x11_SOURCES) $(text_SOURCES)<br>
&#43; RECURSIVE_TARGETS =3D all-recursive check-recursive cscopelist-recurs=
ive \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;ctags-recursive dvi-recursive html-recursiv=
e info-recursive \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;install-data-recursive install-dvi-recursiv=
e \<br>
&#43;@@ -423,12 &#43;415,8 @@ AM_LDFLAGS =3D \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;-lm<br>
&#43;<br>
&#43; @HAVE_X11_TRUE@EGL_X11_DEMOS =3D lion_x11 sp_x11 $(am__append_1)<br>
&#43;-lion_screen_SOURCES =3D lion.c lion-render.c lion-render.h<br>
&#43;-sp_screen_SOURCES =3D sp.c<br>
&#43; lion_x11_SOURCES =3D lion.c lion-render.c lion-render.h<br>
&#43; sp_x11_SOURCES =3D sp.c<br>
&#43;-lion_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" =
rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43;-sp_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" re=
l=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
&#43; lion_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D=
"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43; sp_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D"n=
oreferrer" target=3D"_blank">libeglut_x11.la</a><br>
&#43; text_SOURCES =3D text.c<br>
&#43;@@ -481,18 &#43;469,10 @@ clean-noinstPROGRAMS:<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;echo &quot; rm -f&quot; $$list; \<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;rm -f $$list<br>
&#43;<br>
&#43;-lion_screen$(EXEEXT): $(lion_screen_OBJECTS) $(lion_screen_DEPENDENCI=
ES) $(EXTRA_lion_screen_DEPENDENCIES)<br>
&#43;-&nbsp; &nbsp; &nbsp; @rm -f lion_screen$(EXEEXT)<br>
&#43;-&nbsp; &nbsp; &nbsp; $(AM_V_CCLD)$(LINK) $(lion_screen_OBJECTS) $(lio=
n_screen_LDADD) $(LIBS)<br>
&#43;-<br>
&#43; lion_x11$(EXEEXT): $(lion_x11_OBJECTS) $(lion_x11_DEPENDENCIES) $(EXT=
RA_lion_x11_DEPENDENCIES)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;@rm -f lion_x11$(EXEEXT)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;$(AM_V_CCLD)$(LINK) $(lion_x11_OBJECTS) $(l=
ion_x11_LDADD) $(LIBS)<br>
&#43;<br>
&#43;-sp_screen$(EXEEXT): $(sp_screen_OBJECTS) $(sp_screen_DEPENDENCIES) $(=
EXTRA_sp_screen_DEPENDENCIES)<br>
&#43;-&nbsp; &nbsp; &nbsp; @rm -f sp_screen$(EXEEXT)<br>
&#43;-&nbsp; &nbsp; &nbsp; $(AM_V_CCLD)$(LINK) $(sp_screen_OBJECTS) $(sp_sc=
reen_LDADD) $(LIBS)<br>
&#43;-<br>
&#43; sp_x11$(EXEEXT): $(sp_x11_OBJECTS) $(sp_x11_DEPENDENCIES) $(EXTRA_sp_=
x11_DEPENDENCIES)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;@rm -f sp_x11$(EXEEXT)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;$(AM_V_CCLD)$(LINK) $(sp_x11_OBJECTS) $(sp_=
x11_LDADD) $(LIBS)<br>
&#43;<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-demos_8.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-demos_8.2.0.bb</a> b/meta/rec=
ipes-graphics/mesa/<a href=3D"http://mesa-demos_8.2.0.bb" rel=3D"noreferrer=
" target=3D"_blank">mesa-demos_8.2.0.bb</a><br>
index 557b8c6..2df9bba 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-demos_8.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-demos_8.2.0.bb</a><br>
&#43;&#43;&#43; b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-demos_8=
.2.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-demos_8.2.0.bb</a><br>
@@ -20,6 &#43;20,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.or=
g/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_=
blank">ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2<=
/a> \<br>
&nbsp; &nbsp; &nbsp;file://0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag=
-files-to.patch \<br>
&nbsp; &nbsp; &nbsp;file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.p=
atch \<br>
&nbsp; &nbsp; &nbsp;file://0010-sharedtex_mt-fix-rendering-thread-hang.patc=
h \<br>
&#43;&nbsp; &nbsp; file://0011-drop-demos-dependant-on-obsolete-MESA_screen=
_surface.patch \<br>
&nbsp;&quot;<br>
&nbsp;SRC_URI[md5sum] =3D &quot;72613a2c8c013716db02e3ff59d29061&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda=
5879221a9774d0952f90ba92&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span><br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br>
</blockquote>
</div>
<br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_2021B186DC632746BD5A3CE32F12BD28011FBB6670EUMBX03mgcmen_--
