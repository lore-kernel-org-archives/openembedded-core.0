Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4B39A6FF5B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 14:40:38 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id f89so55885376ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LTx/TSWz5ocaAbDS/RDXFh/BGNwC7fDSrzaqGrhwqeU=;
	b=dtPHnbFVULRO0XMzhbC6SdT6DElveUCqrpiDM3r0ANvNGDZRirJJGx9S+AOAC/5JdH
	OrUur3Ms7PGpAat0950K7x+RgZk3Ul/MHzPIwptCbi33QcZFCI9gSxrx2WFbRdN5iQPU
	gQONeuotNCfRt2HZLkTfFWIPnzrTfT2eCOAHqsULMBWqc1ovdCNlyig2gZM1k5rhk0lk
	aEfqNhmVmX+U1dm1SgQTR2KcKp9LR/9AAxOqsyx4F22l1tWDpwZUB3ilaYjB5WTZCLIQ
	oKwEt7CIULL+jfX+4W8zj9kybhxjAFQdXMy664TVarcalY4B0UqUYEkfSFZgBvcM0QoR
	Rk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LTx/TSWz5ocaAbDS/RDXFh/BGNwC7fDSrzaqGrhwqeU=;
	b=HxTgbdlXDdEEPgkva50RvSV80YrG4KQM32IGh6xlCWhXUYAcpI7hjxnPnQcEX25uTu
	iFVmoSytnhrPUEW2zyDnXHvRTeqToRLng0t3j12/HLNoj9EPvAlIaLlHkH8j6SP1aNaX
	K57HRtpFySCNi7pT7v1KeEf6Pc809WpPf5q1SdyXypp5eBK+WV4mdxan/6EPB1BuWSxt
	3deydXcRo7fpXW6hidfXvxN9SKCUhUn7xyU9dUhtKec8UQ337tvavn9l9xl9uNJRE1Hp
	F27W/71FPKUP/V0GUbYmHFH9lwIc4dgCeNvwpuQXZSzZeEvRqXAGsRUHalyDTGYefxlk
	9ENg==
X-Gm-Message-State: AOPr4FV58zP0fOafNf/9pMXAY7s4IhXEZ41UH6PQXNIw/TTCAw1kFtEzeXikvjGkiR9OjdwxPJ001fa271KVbZWe
X-Received: by 10.107.51.213 with SMTP id z204mr10329583ioz.148.1462372839185; 
	Wed, 04 May 2016 07:40:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Wed, 4 May 2016 07:40:19 -0700 (PDT)
In-Reply-To: <1462353116-7481-1-git-send-email-awais_belal@mentor.com>
References: <1462353116-7481-1-git-send-email-awais_belal@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 May 2016 15:40:19 +0100
Message-ID: <CAJTo0Lbs7hF90EF1nNJBJgP57zbt1pcz7=hTMiVjRPVe1q12ow@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
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
X-List-Received-Date: Wed, 04 May 2016 14:40:39 -0000
Content-Type: multipart/alternative; boundary=001a11440cd09bf05a05320535de

--001a11440cd09bf05a05320535de
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Can you push these patches to a branch?  For some reason git-am isn't able
to parse the patch.

Ross

On 4 May 2016 at 10:11, Awais Belal <awais_belal@mentor.com> wrote:

> The mesa surface EGL_MESA_screen_surface was obsoleted
> and then dropped from mesa some time ago. Drop demos
> depending on this.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  ...dependant-on-obsolete-MESA_screen_surface.patch | 1592
> ++++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |    1 +
>  2 files changed, 1593 insertions(+)
>  create mode 100644
> meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependant-on-obsole=
te-MESA_screen_surface.patch
>
> diff --git
> a/meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependant-on-obso=
lete-MESA_screen_surface.patch
> b/meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependant-on-obso=
lete-MESA_screen_surface.patch
> new file mode 100644
> index 0000000..a2621ce
> --- /dev/null
> +++
> b/meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependant-on-obso=
lete-MESA_screen_surface.patch
> @@ -0,0 +1,1592 @@
> +commit 74443c6ee79f3251f643ea05e94df58183e37d0d
> +Author: Matt Turner <mattst88@gmail.com>
> +Date:   Fri Aug 28 15:57:38 2015 -0700
> +
> +    egl: Remove demos using EGL_MESA_screen_surface.
> +
> +    The remnants of the extension were removed from Mesa in commit
> 7a58262e.
> +
> +    Reviewed-by: Andreas Boll <andreas.boll.dev@gmail.com>
> +    Tested-by: Andreas Boll <andreas.boll.dev@gmail.com>
> +    Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> +
> +Upstream-Status: Backport
> +
> +diff --git a/src/egl/eglut/Makefile.am b/src/egl/eglut/Makefile.am
> +index 2d2f2af..b765069 100644
> +--- a/src/egl/eglut/Makefile.am
> ++++ b/src/egl/eglut/Makefile.am
> +@@ -33,17 +33,12 @@ if HAVE_WAYLAND
> + eglut_wayland =3D libeglut_wayland.la
> + endif
> +
> +-noinst_LTLIBRARIES =3D libeglut_screen.la $(eglut_x11) $(eglut_wayland)
> ++noinst_LTLIBRARIES =3D $(eglut_x11) $(eglut_wayland)
> + endif
> +
> +-libeglut_screen_la_SOURCES =3D \
> +-      eglut.c \
> +-      eglut.h \
> +-      eglutint.h \
> +-      eglut_screen.c
> +-
> + libeglut_x11_la_SOURCES =3D \
> +       eglut.c \
> ++      eglut.h \
> +       eglutint.h \
> +       eglut_x11.c
> + libeglut_x11_la_CFLAGS =3D $(X11_CFLAGS) $(EGL_CFLAGS)
> +@@ -52,6 +47,7 @@ libeglut_x11_la_LIBADD =3D $(X11_LIBS) $(EGL_LIBS)
> +
> + libeglut_wayland_la_SOURCES =3D \
> +       eglut.c \
> ++      eglut.h \
> +       eglutint.h \
> +       eglut_wayland.c
> +
> +diff --git a/src/egl/eglut/eglut.c b/src/egl/eglut/eglut.c
> +index f6a2ad4..58b354a 100644
> +--- a/src/egl/eglut/eglut.c
> ++++ b/src/egl/eglut/eglut.c
> +@@ -176,9 +176,6 @@ _eglutCreateWindow(const char *title, int x, int y,
> int w, int h)
> +             win->config, win->native.u.pixmap, NULL);
> +       break;
> +    case EGL_PBUFFER_BIT:
> +-#ifdef EGL_MESA_screen_surface
> +-   case EGL_SCREEN_BIT_MESA:
> +-#endif
> +       win->surface =3D win->native.u.surface;
> +       break;
> +    default:
> +@@ -292,11 +289,7 @@ eglutDestroyWindow(int win)
> +    if (window->index !=3D win)
> +       return;
> +
> +-#ifdef EGL_MESA_screen_surface
> +-   /* XXX it causes some bug in st/egl KMS backend */
> +-   if ( _eglut->surface_type !=3D EGL_SCREEN_BIT_MESA)
> +-#endif
> +-      eglMakeCurrent(_eglut->dpy, EGL_NO_SURFACE, EGL_NO_SURFACE,
> EGL_NO_CONTEXT);
> ++   eglMakeCurrent(_eglut->dpy, EGL_NO_SURFACE, EGL_NO_SURFACE,
> EGL_NO_CONTEXT);
> +
> +    _eglutDestroyWindow(_eglut->current);
> + }
> +diff --git a/src/egl/eglut/eglut_screen.c b/src/egl/eglut/eglut_screen.c
> +deleted file mode 100644
> +index 094a4e2..0000000
> +--- a/src/egl/eglut/eglut_screen.c
> ++++ /dev/null
> +@@ -1,194 +0,0 @@
> +-/*
> +- * Copyright (C) 2010 LunarG Inc.
> +- *
> +- * Permission is hereby granted, free of charge, to any person obtainin=
g
> a
> +- * copy of this software and associated documentation files (the
> "Software"),
> +- * to deal in the Software without restriction, including without
> limitation
> +- * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> +- * and/or sell copies of the Software, and to permit persons to whom th=
e
> +- * Software is furnished to do so, subject to the following conditions:
> +- *
> +- * The above copyright notice and this permission notice shall be
> included
> +- * in all copies or substantial portions of the Software.
> +- *
> +- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> +- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> +- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
> SHALL
> +- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> +- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> +- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> +- * DEALINGS IN THE SOFTWARE.
> +- *
> +- * Authors:
> +- *    Chia-I Wu <olv@lunarg.com>
> +- */
> +-
> +-#include <stdio.h>
> +-#include <string.h>
> +-#include <sys/time.h>
> +-
> +-#define EGL_EGLEXT_PROTOTYPES
> +-#include "EGL/egl.h"
> +-#include "EGL/eglext.h"
> +-
> +-#include "eglutint.h"
> +-
> +-#define MAX_MODES 100
> +-
> +-#ifdef EGL_MESA_screen_surface
> +-static EGLScreenMESA kms_screen;
> +-static EGLModeMESA kms_mode;
> +-static EGLint kms_width, kms_height;
> +-#endif
> +-
> +-void
> +-_eglutNativeInitDisplay(void)
> +-{
> +-#ifdef EGL_MESA_screen_surface
> +-   _eglut->native_dpy =3D EGL_DEFAULT_DISPLAY;
> +-   _eglut->surface_type =3D EGL_SCREEN_BIT_MESA;
> +-#endif
> +-}
> +-
> +-void
> +-_eglutNativeFiniDisplay(void)
> +-{
> +-#ifdef EGL_MESA_screen_surface
> +-   kms_screen =3D 0;
> +-   kms_mode =3D 0;
> +-   kms_width =3D 0;
> +-   kms_height =3D 0;
> +-#endif
> +-}
> +-
> +-#ifdef EGL_MESA_screen_surface
> +-static void
> +-init_kms(void)
> +-{
> +-   EGLModeMESA modes[MAX_MODES];
> +-   EGLint num_screens, num_modes;
> +-   EGLint width, height, best_mode;
> +-   EGLint i;
> +-
> +-   if (!eglGetScreensMESA(_eglut->dpy, &kms_screen, 1, &num_screens) ||
> +-         !num_screens)
> +-      _eglutFatal("eglGetScreensMESA failed\n");
> +-
> +-   if (!eglGetModesMESA(_eglut->dpy, kms_screen,
> +-            modes, MAX_MODES, &num_modes) || !num_modes)
> +-      _eglutFatal("eglGetModesMESA failed!\n");
> +-
> +-   printf("Found %d modes:\n", num_modes);
> +-
> +-   best_mode =3D 0;
> +-   width =3D 0;
> +-   height =3D 0;
> +-   for (i =3D 0; i < num_modes; i++) {
> +-      EGLint w, h;
> +-      eglGetModeAttribMESA(_eglut->dpy, modes[i], EGL_WIDTH, &w);
> +-      eglGetModeAttribMESA(_eglut->dpy, modes[i], EGL_HEIGHT, &h);
> +-      printf("%3d: %d x %d\n", i, w, h);
> +-      if (w > width && h > height) {
> +-         width =3D w;
> +-         height =3D h;
> +-         best_mode =3D i;
> +-      }
> +-   }
> +-
> +-   printf("Will use screen size: %d x %d\n", width, height);
> +-
> +-   kms_mode =3D modes[best_mode];
> +-   kms_width =3D width;
> +-   kms_height =3D height;
> +-}
> +-#endif
> +-
> +-void
> +-_eglutNativeInitWindow(struct eglut_window *win, const char *title,
> +-                       int x, int y, int w, int h)
> +-{
> +-#ifdef EGL_MESA_screen_surface
> +-   EGLint surf_attribs[16];
> +-   EGLint i;
> +-#endif
> +-   const char *exts;
> +-
> +-   exts =3D eglQueryString(_eglut->dpy, EGL_EXTENSIONS);
> +-   if (!exts || !strstr(exts, "EGL_MESA_screen_surface"))
> +-      _eglutFatal("EGL_MESA_screen_surface is not supported\n");
> +-
> +-#ifdef EGL_MESA_screen_surface
> +-   init_kms();
> +-
> +-   i =3D 0;
> +-   surf_attribs[i++] =3D EGL_WIDTH;
> +-   surf_attribs[i++] =3D kms_width;
> +-   surf_attribs[i++] =3D EGL_HEIGHT;
> +-   surf_attribs[i++] =3D kms_height;
> +-   surf_attribs[i++] =3D EGL_NONE;
> +-
> +-   /* create surface */
> +-   win->native.u.surface =3D eglCreateScreenSurfaceMESA(_eglut->dpy,
> +-         win->config, surf_attribs);
> +-   if (win->native.u.surface =3D=3D EGL_NO_SURFACE)
> +-      _eglutFatal("eglCreateScreenSurfaceMESA failed\n");
> +-
> +-   if (!eglShowScreenSurfaceMESA(_eglut->dpy, kms_screen,
> +-            win->native.u.surface, kms_mode))
> +-      _eglutFatal("eglShowScreenSurfaceMESA failed\n");
> +-
> +-   win->native.width =3D kms_width;
> +-   win->native.height =3D kms_height;
> +-#endif
> +-}
> +-
> +-void
> +-_eglutNativeFiniWindow(struct eglut_window *win)
> +-{
> +-#ifdef EGL_MESA_screen_surface
> +-   eglShowScreenSurfaceMESA(_eglut->dpy,
> +-         kms_screen, EGL_NO_SURFACE, 0);
> +-   eglDestroySurface(_eglut->dpy, win->native.u.surface);
> +-#endif
> +-}
> +-
> +-void
> +-_eglutNativeEventLoop(void)
> +-{
> +-   int start =3D _eglutNow();
> +-   int frames =3D 0;
> +-
> +-   _eglut->redisplay =3D 1;
> +-
> +-   while (1) {
> +-      struct eglut_window *win =3D _eglut->current;
> +-      int now =3D _eglutNow();
> +-
> +-      if (now - start > 5000) {
> +-         double elapsed =3D (double) (now - start) / 1000.0;
> +-
> +-         printf("%d frames in %3.1f seconds =3D %6.3f FPS\n",
> +-               frames, elapsed, frames / elapsed);
> +-         fflush(stdout);
> +-
> +-         start =3D now;
> +-         frames =3D 0;
> +-
> +-         /* send escape */
> +-         if (win->keyboard_cb)
> +-            win->keyboard_cb(27);
> +-      }
> +-
> +-      if (_eglut->idle_cb)
> +-         _eglut->idle_cb();
> +-
> +-      if (_eglut->redisplay) {
> +-         _eglut->redisplay =3D 0;
> +-
> +-         if (win->display_cb)
> +-            win->display_cb();
> +-         eglSwapBuffers(_eglut->dpy, win->surface);
> +-         frames++;
> +-      }
> +-   }
> +-}
> +diff --git a/src/egl/opengl/Makefile.am b/src/egl/opengl/Makefile.am
> +index 87b2f1a..3e48141 100644
> +--- a/src/egl/opengl/Makefile.am
> ++++ b/src/egl/opengl/Makefile.am
> +@@ -51,20 +51,12 @@ endif
> +
> + if HAVE_EGL
> + bin_PROGRAMS =3D \
> +-      demo1 \
> +-      demo2 \
> +-      demo3 \
> +       eglinfo \
> +-      eglgears_screen \
> +-      egltri_screen \
> +       peglgears \
> +       $(EGL_DRM_DEMOS) \
> +       $(EGL_X11_DEMOS)
> + endif
> +
> +-egltri_screen_SOURCES =3D egltri.c
> +-eglgears_screen_SOURCES =3D eglgears.c
> +-
> + egltri_x11_SOURCES =3D egltri.c
> + eglgears_x11_SOURCES =3D eglgears.c
> +
> +@@ -73,9 +65,6 @@ egltri_x11_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS)
> + xeglgears_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS)
> + xeglthreads_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS) -pthread
> +
> +-eglgears_screen_LDADD =3D ../eglut/libeglut_screen.la
> +-egltri_screen_LDADD =3D ../eglut/libeglut_screen.la
> +-
> + eglgears_x11_LDADD =3D ../eglut/libeglut_x11.la
> + egltri_x11_LDADD =3D ../eglut/libeglut_x11.la
> +
> +diff --git a/src/egl/opengl/demo1.c b/src/egl/opengl/demo1.c
> +deleted file mode 100644
> +index 06e2138..0000000
> +--- a/src/egl/opengl/demo1.c
> ++++ /dev/null
> +@@ -1,155 +0,0 @@
> +-/*
> +- * Exercise EGL API functions
> +- */
> +-
> +-#define EGL_EGLEXT_PROTOTYPES
> +-
> +-#include <EGL/egl.h>
> +-#include <EGL/eglext.h>
> +-#include <assert.h>
> +-#include <stdio.h>
> +-#include <stdlib.h>
> +-#include <string.h>
> +-
> +-
> +-/**
> +- * Test EGL_MESA_screen_surface functions
> +- */
> +-static void
> +-TestScreens(EGLDisplay dpy)
> +-{
> +-#ifdef EGL_MESA_screen_surface
> +-#define MAX 8
> +-   EGLScreenMESA screens[MAX];
> +-   EGLint numScreens;
> +-   EGLint i;
> +-
> +-   eglGetScreensMESA(dpy, screens, MAX, &numScreens);
> +-   printf("Found %d screens\n", numScreens);
> +-   for (i =3D 0; i < numScreens; i++) {
> +-      printf(" Screen %d handle: %d\n", i, (int) screens[i]);
> +-   }
> +-#endif
> +-}
> +-
> +-/**
> +- * Print table of all available configurations.
> +- */
> +-static void
> +-PrintConfigs(EGLDisplay d, EGLConfig *configs, EGLint numConfigs)
> +-{
> +-   EGLint i;
> +-
> +-   printf("Configurations:\n");
> +-   printf("     bf lv d st colorbuffer dp st   supported \n");
> +-   printf("  id sz  l b ro  r  g  b  a th cl   surfaces  \n");
> +-   printf("----------------------------------------------\n");
> +-   for (i =3D 0; i < numConfigs; i++) {
> +-      EGLint id, size, level;
> +-      EGLint red, green, blue, alpha;
> +-      EGLint depth, stencil;
> +-      EGLint surfaces;
> +-      EGLint doubleBuf =3D 1, stereo =3D 0;
> +-      char surfString[100] =3D "";
> +-
> +-      eglGetConfigAttrib(d, configs[i], EGL_CONFIG_ID, &id);
> +-      eglGetConfigAttrib(d, configs[i], EGL_BUFFER_SIZE, &size);
> +-      eglGetConfigAttrib(d, configs[i], EGL_LEVEL, &level);
> +-
> +-      eglGetConfigAttrib(d, configs[i], EGL_RED_SIZE, &red);
> +-      eglGetConfigAttrib(d, configs[i], EGL_GREEN_SIZE, &green);
> +-      eglGetConfigAttrib(d, configs[i], EGL_BLUE_SIZE, &blue);
> +-      eglGetConfigAttrib(d, configs[i], EGL_ALPHA_SIZE, &alpha);
> +-      eglGetConfigAttrib(d, configs[i], EGL_DEPTH_SIZE, &depth);
> +-      eglGetConfigAttrib(d, configs[i], EGL_STENCIL_SIZE, &stencil);
> +-      eglGetConfigAttrib(d, configs[i], EGL_SURFACE_TYPE, &surfaces);
> +-
> +-      if (surfaces & EGL_WINDOW_BIT)
> +-         strcat(surfString, "win,");
> +-      if (surfaces & EGL_PBUFFER_BIT)
> +-         strcat(surfString, "pb,");
> +-      if (surfaces & EGL_PIXMAP_BIT)
> +-         strcat(surfString, "pix,");
> +-      if (strlen(surfString) > 0)
> +-         surfString[strlen(surfString) - 1] =3D 0;
> +-
> +-      printf("0x%02x %2d %2d %c  %c %2d %2d %2d %2d %2d %2d   %-12s\n",
> +-             id, size, level,
> +-             doubleBuf ? 'y' : '.',
> +-             stereo ? 'y' : '.',
> +-             red, green, blue, alpha,
> +-             depth, stencil, surfString);
> +-   }
> +-}
> +-
> +-
> +-
> +-int
> +-main(int argc, char *argv[])
> +-{
> +-   int maj, min;
> +-   EGLContext ctx;
> +-   EGLSurface pbuffer;
> +-   EGLConfig *configs;
> +-   EGLint numConfigs;
> +-   EGLBoolean b;
> +-   const EGLint pbufAttribs[] =3D {
> +-      EGL_WIDTH, 500,
> +-      EGL_HEIGHT, 500,
> +-      EGL_NONE
> +-   };
> +-
> +-   EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);
> +-   assert(d);
> +-
> +-   if (!eglInitialize(d, &maj, &min)) {
> +-      printf("demo: eglInitialize failed\n");
> +-      exit(1);
> +-   }
> +-
> +-   printf("EGL version =3D %d.%d\n", maj, min);
> +-   printf("EGL_VENDOR =3D %s\n", eglQueryString(d, EGL_VENDOR));
> +-
> +-   if (!strstr(eglQueryString(d, EGL_EXTENSIONS),
> +-               "EGL_MESA_screen_surface")) {
> +-      printf("EGL_MESA_screen_surface is not supported\n");
> +-      exit(1);
> +-   }
> +-
> +-   eglGetConfigs(d, NULL, 0, &numConfigs);
> +-   configs =3D malloc(sizeof(*configs) *numConfigs);
> +-   eglGetConfigs(d, configs, numConfigs, &numConfigs);
> +-
> +-   PrintConfigs(d, configs, numConfigs);
> +-
> +-   eglBindAPI(EGL_OPENGL_API);
> +-   ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, NULL);
> +-   if (ctx =3D=3D EGL_NO_CONTEXT) {
> +-      printf("failed to create context\n");
> +-      return 0;
> +-   }
> +-
> +-   pbuffer =3D eglCreatePbufferSurface(d, configs[0], pbufAttribs);
> +-   if (pbuffer =3D=3D EGL_NO_SURFACE) {
> +-      printf("failed to create pbuffer\n");
> +-      return 0;
> +-   }
> +-
> +-   free(configs);
> +-
> +-   b =3D eglMakeCurrent(d, pbuffer, pbuffer, ctx);
> +-   if (!b) {
> +-      printf("make current failed\n");
> +-      return 0;
> +-   }
> +-
> +-   b =3D eglMakeCurrent(d, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTE=
XT);
> +-
> +-   TestScreens(d);
> +-
> +-   eglDestroySurface(d, pbuffer);
> +-   eglDestroyContext(d, ctx);
> +-   eglTerminate(d);
> +-
> +-   return 0;
> +-}
> +diff --git a/src/egl/opengl/demo2.c b/src/egl/opengl/demo2.c
> +deleted file mode 100644
> +index bfef59e..0000000
> +--- a/src/egl/opengl/demo2.c
> ++++ /dev/null
> +@@ -1,221 +0,0 @@
> +-/*
> +- * Exercise EGL API functions
> +- */
> +-
> +-#define EGL_EGLEXT_PROTOTYPES
> +-
> +-#include <assert.h>
> +-#include <stdio.h>
> +-#include <stdlib.h>
> +-#include <string.h>
> +-#include <unistd.h>
> +-
> +-#include <EGL/egl.h>
> +-#include <EGL/eglext.h>
> +-#include "gl_wrap.h"
> +-
> +-/*#define FRONTBUFFER*/
> +-
> +-#ifdef EGL_MESA_screen_surface
> +-static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y=
2,
> +-                          GLfloat r, GLfloat g, GLfloat b)
> +-{
> +-   GLfloat v[4][2], c[4][4];
> +-   int i;
> +-
> +-   v[0][0] =3D x1;   v[0][1] =3D y1;
> +-   v[1][0] =3D x2;   v[1][1] =3D y1;
> +-   v[2][0] =3D x2;   v[2][1] =3D y2;
> +-   v[3][0] =3D x1;   v[3][1] =3D y2;
> +-
> +-   for (i =3D 0; i < 4; i++) {
> +-      c[i][0] =3D r;
> +-      c[i][1] =3D g;
> +-      c[i][2] =3D b;
> +-      c[i][3] =3D 1.0;
> +-   }
> +-
> +-   glVertexPointer(2, GL_FLOAT, 0, v);
> +-   glColorPointer(4, GL_FLOAT, 0, c);
> +-   glEnableClientState(GL_VERTEX_ARRAY);
> +-   glEnableClientState(GL_COLOR_ARRAY);
> +-
> +-   glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
> +-
> +-   glDisableClientState(GL_VERTEX_ARRAY);
> +-   glDisableClientState(GL_COLOR_ARRAY);
> +-}
> +-
> +-
> +-static void redraw(EGLDisplay dpy, EGLSurface surf, int rot)
> +-{
> +-   GLfloat r, g, b;
> +-
> +-   printf("Redraw event\n");
> +-
> +-   glClearColor( rand()/(float)RAND_MAX,
> +-               rand()/(float)RAND_MAX,
> +-               rand()/(float)RAND_MAX,
> +-               1);
> +-
> +-   glClear( GL_COLOR_BUFFER_BIT );
> +-
> +-   r =3D rand()/(float)RAND_MAX;
> +-   g =3D rand()/(float)RAND_MAX;
> +-   b =3D rand()/(float)RAND_MAX;
> +-
> +-   glPushMatrix();
> +-   glRotatef(rot, 0, 0, 1);
> +-   glScalef(.5, .5, .5);
> +-   _subset_Rectf( -1, -1, 1, 1, r, g, b );
> +-   glPopMatrix();
> +-
> +-#ifdef FRONTBUFFER
> +-   glFlush();
> +-#else
> +-   eglSwapBuffers( dpy, surf );
> +-#endif
> +-   glFinish();
> +-}
> +-
> +-
> +-/**
> +- * Test EGL_MESA_screen_surface functions
> +- */
> +-static void
> +-TestScreens(EGLDisplay dpy)
> +-{
> +-#define MAX 8
> +-   EGLScreenMESA screens[MAX];
> +-   EGLint numScreens;
> +-   EGLint i;
> +-
> +-   eglGetScreensMESA(dpy, screens, MAX, &numScreens);
> +-   printf("Found %d screens\n", numScreens);
> +-   for (i =3D 0; i < numScreens; i++) {
> +-      printf(" Screen %d handle: %d\n", i, (int) screens[i]);
> +-   }
> +-}
> +-#endif
> +-
> +-int
> +-main(int argc, char *argv[])
> +-{
> +-   int maj, min;
> +-#ifdef EGL_MESA_screen_surface
> +-   EGLContext ctx;
> +-   EGLSurface pbuffer, screen_surf;
> +-   EGLConfig configs[10];
> +-   EGLint numConfigs, i;
> +-   EGLBoolean b;
> +-   const EGLint pbufAttribs[] =3D {
> +-      EGL_WIDTH, 500,
> +-      EGL_HEIGHT, 500,
> +-      EGL_NONE
> +-   };
> +-   EGLint screenAttribs[32];
> +-   EGLModeMESA mode;
> +-   EGLScreenMESA screen;
> +-   EGLint count;
> +-#endif
> +-
> +-   EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);
> +-   assert(d);
> +-
> +-   if (!eglInitialize(d, &maj, &min)) {
> +-      printf("demo: eglInitialize failed\n");
> +-      exit(1);
> +-   }
> +-
> +-   printf("EGL version =3D %d.%d\n", maj, min);
> +-   printf("EGL_VENDOR =3D %s\n", eglQueryString(d, EGL_VENDOR));
> +-   if (!strstr(eglQueryString(d, EGL_EXTENSIONS),
> +-               "EGL_MESA_screen_surface")) {
> +-      printf("EGL_MESA_screen_surface is not supported\n");
> +-      exit(1);
> +-   }
> +-
> +-#ifdef EGL_MESA_screen_surface
> +-   eglGetConfigs(d, configs, 10, &numConfigs);
> +-   printf("Got %d EGL configs:\n", numConfigs);
> +-   for (i =3D 0; i < numConfigs; i++) {
> +-      EGLint id, red, depth;
> +-      eglGetConfigAttrib(d, configs[i], EGL_CONFIG_ID, &id);
> +-      eglGetConfigAttrib(d, configs[i], EGL_RED_SIZE, &red);
> +-      eglGetConfigAttrib(d, configs[i], EGL_DEPTH_SIZE, &depth);
> +-      printf("%2d:  Red Size =3D %d  Depth Size =3D %d\n", id, red, dep=
th);
> +-   }
> +-
> +-   eglGetScreensMESA(d, &screen, 1, &count);
> +-   eglGetModesMESA(d, screen, &mode, 1, &count);
> +-
> +-   eglBindAPI(EGL_OPENGL_API);
> +-   ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, NULL);
> +-   if (ctx =3D=3D EGL_NO_CONTEXT) {
> +-      printf("failed to create context\n");
> +-      return 0;
> +-   }
> +-
> +-   pbuffer =3D eglCreatePbufferSurface(d, configs[0], pbufAttribs);
> +-   if (pbuffer =3D=3D EGL_NO_SURFACE) {
> +-      printf("failed to create pbuffer\n");
> +-      return 0;
> +-   }
> +-
> +-   b =3D eglMakeCurrent(d, pbuffer, pbuffer, ctx);
> +-   if (!b) {
> +-      printf("make current failed\n");
> +-      return 0;
> +-   }
> +-
> +-   b =3D eglMakeCurrent(d, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTE=
XT);
> +-
> +-   i =3D 0;
> +-   screenAttribs[i++] =3D EGL_WIDTH;
> +-   eglGetModeAttribMESA(d, mode, EGL_WIDTH, &screenAttribs[i++]);
> +-   screenAttribs[i++] =3D EGL_HEIGHT;
> +-   eglGetModeAttribMESA(d, mode, EGL_HEIGHT, &screenAttribs[i++]);
> +-   screenAttribs[i] =3D EGL_NONE;
> +-
> +-   screen_surf =3D eglCreateScreenSurfaceMESA(d, configs[0],
> screenAttribs);
> +-   if (screen_surf =3D=3D EGL_NO_SURFACE) {
> +-      printf("failed to create screen surface\n");
> +-      return 0;
> +-   }
> +-
> +-   eglShowScreenSurfaceMESA(d, screen, screen_surf, mode);
> +-
> +-   b =3D eglMakeCurrent(d, screen_surf, screen_surf, ctx);
> +-   if (!b) {
> +-      printf("make current failed\n");
> +-      return 0;
> +-   }
> +-
> +-   glViewport(0, 0, 1024, 768);
> +-
> +-   glClearColor( 0,
> +-               1.0,
> +-               0,
> +-               1);
> +-
> +-   glClear( GL_COLOR_BUFFER_BIT );
> +-
> +-
> +-   TestScreens(d);
> +-
> +-   glShadeModel( GL_FLAT );
> +-
> +-   for (i =3D 0; i < 6; i++) {
> +-      redraw(d, screen_surf, i*10 );
> +-
> +-      printf("sleep(1)\n");
> +-      sleep(1);
> +-   }
> +-
> +-   eglDestroySurface(d, pbuffer);
> +-   eglDestroyContext(d, ctx);
> +-   eglTerminate(d);
> +-#endif
> +-
> +-   return 0;
> +-}
> +diff --git a/src/egl/opengl/demo3.c b/src/egl/opengl/demo3.c
> +deleted file mode 100644
> +index 31b5d8b..0000000
> +--- a/src/egl/opengl/demo3.c
> ++++ /dev/null
> +@@ -1,652 +0,0 @@
> +-/*
> +- * Exercise EGL API functions
> +- */
> +-
> +-#define EGL_EGLEXT_PROTOTYPES
> +-
> +-#include <EGL/egl.h>
> +-#include <EGL/eglext.h>
> +-#include "gl_wrap.h"
> +-#include <assert.h>
> +-#include <stdio.h>
> +-#include <stdlib.h>
> +-#include <string.h>
> +-#include <unistd.h>
> +-
> +-
> +-
> +-#define PIXEL_CENTER(x) ((long)(x) + 0.5)
> +-
> +-#define GAP 10
> +-#define ROWS 3
> +-#define COLS 4
> +-
> +-#define OPENGL_WIDTH 48
> +-#define OPENGL_HEIGHT 13
> +-
> +-
> +-GLenum rgb, doubleBuffer, windType;
> +-GLint windW, windH;
> +-
> +-GLenum mode1, mode2;
> +-GLint boxW, boxH;
> +-GLubyte OpenGL_bits[] =3D {
> +-   0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
> +-   0x7f, 0xfb, 0xff, 0xff, 0xff, 0x01,
> +-   0x7f, 0xfb, 0xff, 0xff, 0xff, 0x01,
> +-   0x00, 0x03, 0x00, 0x00, 0x00, 0x00,
> +-   0x3e, 0x8f, 0xb7, 0xf9, 0xfc, 0x01,
> +-   0x63, 0xdb, 0xb0, 0x8d, 0x0d, 0x00,
> +-   0x63, 0xdb, 0xb7, 0x8d, 0x0d, 0x00,
> +-   0x63, 0xdb, 0xb6, 0x8d, 0x0d, 0x00,
> +-   0x63, 0x8f, 0xf3, 0xcc, 0x0d, 0x00,
> +-   0x63, 0x00, 0x00, 0x0c, 0x4c, 0x0a,
> +-   0x63, 0x00, 0x00, 0x0c, 0x4c, 0x0e,
> +-   0x63, 0x00, 0x00, 0x8c, 0xed, 0x0e,
> +-   0x3e, 0x00, 0x00, 0xf8, 0x0c, 0x00,
> +-};
> +-
> +-#ifdef EGL_MESA_screen_surface
> +-static void Init(void)
> +-{
> +-
> +-    mode1 =3D GL_TRUE;
> +-    mode2 =3D GL_TRUE;
> +-}
> +-
> +-static void Reshape(int width, int height)
> +-{
> +-
> +-    windW =3D (GLint)width;
> +-    windH =3D (GLint)height;
> +-}
> +-
> +-#if 0
> +-static void RotateColorMask(void)
> +-{
> +-    static GLint rotation =3D 0;
> +-
> +-    rotation =3D (rotation + 1) & 0x3;
> +-    switch (rotation) {
> +-      case 0:
> +-      glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);
> +-      glIndexMask( 0xff );
> +-      break;
> +-      case 1:
> +-      glColorMask(GL_FALSE, GL_TRUE, GL_TRUE, GL_TRUE);
> +-      glIndexMask(0xFE);
> +-      break;
> +-      case 2:
> +-      glColorMask(GL_TRUE, GL_FALSE, GL_TRUE, GL_TRUE);
> +-      glIndexMask(0xFD);
> +-      break;
> +-      case 3:
> +-      glColorMask(GL_TRUE, GL_TRUE, GL_FALSE, GL_TRUE);
> +-      glIndexMask(0xFB);
> +-      break;
> +-    }
> +-}
> +-#endif
> +-
> +-static void Viewport(GLint row, GLint column)
> +-{
> +-    GLint x, y;
> +-
> +-    boxW =3D (windW - (COLS + 1) * GAP) / COLS;
> +-    boxH =3D (windH - (ROWS + 1) * GAP) / ROWS;
> +-
> +-    x =3D GAP + column * (boxW + GAP);
> +-    y =3D GAP + row * (boxH + GAP);
> +-
> +-    glViewport(x, y, boxW, boxH);
> +-
> +-    glMatrixMode(GL_PROJECTION);
> +-    glLoadIdentity();
> +-    glOrtho(-boxW/2, boxW/2, -boxH/2, boxH/2, 0.0, 1.0);
> +-    glMatrixMode(GL_MODELVIEW);
> +-
> +-    glEnable(GL_SCISSOR_TEST);
> +-    glScissor(x, y, boxW, boxH);
> +-}
> +-
> +-enum {
> +-    COLOR_BLACK =3D 0,
> +-    COLOR_RED,
> +-    COLOR_GREEN,
> +-    COLOR_YELLOW,
> +-    COLOR_BLUE,
> +-    COLOR_MAGENTA,
> +-    COLOR_CYAN,
> +-    COLOR_WHITE
> +-};
> +-
> +-static float RGBMap[9][3] =3D {
> +-    {0, 0, 0},
> +-    {1, 0, 0},
> +-    {0, 1, 0},
> +-    {1, 1, 0},
> +-    {0, 0, 1},
> +-    {1, 0, 1},
> +-    {0, 1, 1},
> +-    {1, 1, 1},
> +-    {0.5, 0.5, 0.5}
> +-};
> +-
> +-static void SetColor(int c)
> +-{
> +-     glColor3fv(RGBMap[c]);
> +-}
> +-
> +-static void Point(void)
> +-{
> +-    GLint i;
> +-
> +-    glBegin(GL_POINTS);
> +-      SetColor(COLOR_WHITE);
> +-      glVertex2i(0, 0);
> +-      for (i =3D 1; i < 8; i++) {
> +-          GLint j =3D i * 2;
> +-          SetColor(COLOR_BLACK+i);
> +-          glVertex2i(-j, -j);
> +-          glVertex2i(-j, 0);
> +-          glVertex2i(-j, j);
> +-          glVertex2i(0, j);
> +-          glVertex2i(j, j);
> +-          glVertex2i(j, 0);
> +-          glVertex2i(j, -j);
> +-          glVertex2i(0, -j);
> +-      }
> +-    glEnd();
> +-}
> +-
> +-static void Lines(void)
> +-{
> +-    GLint i;
> +-
> +-    glPushMatrix();
> +-
> +-    glTranslatef(-12, 0, 0);
> +-    for (i =3D 1; i < 8; i++) {
> +-      SetColor(COLOR_BLACK+i);
> +-      glBegin(GL_LINES);
> +-          glVertex2i(-boxW/4, -boxH/4);
> +-          glVertex2i(boxW/4, boxH/4);
> +-      glEnd();
> +-      glTranslatef(4, 0, 0);
> +-    }
> +-
> +-    glPopMatrix();
> +-
> +-    glBegin(GL_LINES);
> +-      glVertex2i(0, 0);
> +-    glEnd();
> +-}
> +-
> +-static void LineStrip(void)
> +-{
> +-
> +-    glBegin(GL_LINE_STRIP);
> +-      SetColor(COLOR_RED);
> +-      glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(-boxH/4));
> +-      SetColor(COLOR_GREEN);
> +-      glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(boxH/4));
> +-      SetColor(COLOR_BLUE);
> +-      glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(boxH/4));
> +-      SetColor(COLOR_WHITE);
> +-      glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(-boxH/4));
> +-    glEnd();
> +-
> +-    glBegin(GL_LINE_STRIP);
> +-      glVertex2i(0, 0);
> +-    glEnd();
> +-}
> +-
> +-static void LineLoop(void)
> +-{
> +-
> +-    glBegin(GL_LINE_LOOP);
> +-      SetColor(COLOR_RED);
> +-      glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(-boxH/4));
> +-      SetColor(COLOR_GREEN);
> +-      glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(boxH/4));
> +-      SetColor(COLOR_BLUE);
> +-      glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(boxH/4));
> +-      SetColor(COLOR_WHITE);
> +-      glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(-boxH/4));
> +-    glEnd();
> +-
> +-    glEnable(GL_LOGIC_OP);
> +-    glLogicOp(GL_XOR);
> +-
> +-    glEnable(GL_BLEND);
> +-    glBlendFunc(GL_ONE, GL_ONE);
> +-
> +-    SetColor(COLOR_MAGENTA);
> +-    glBegin(GL_LINE_LOOP);
> +-      glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(-boxH/8));
> +-      glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(boxH/8));
> +-    glEnd();
> +-    glBegin(GL_LINE_LOOP);
> +-      glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(boxH/8+5));
> +-      glVertex2f(PIXEL_CENTER(boxW/8), PIXEL_CENTER(boxH/8+5));
> +-    glEnd();
> +-    glDisable(GL_LOGIC_OP);
> +-    glDisable(GL_BLEND);
> +-
> +-    SetColor(COLOR_GREEN);
> +-    glBegin(GL_POINTS);
> +-      glVertex2i(0, 0);
> +-    glEnd();
> +-
> +-    glBegin(GL_LINE_LOOP);
> +-      glVertex2i(0, 0);
> +-    glEnd();
> +-}
> +-
> +-static void Bitmap(void)
> +-{
> +-
> +-    glBegin(GL_LINES);
> +-      SetColor(COLOR_GREEN);
> +-      glVertex2i(-boxW/2, 0);
> +-      glVertex2i(boxW/2, 0);
> +-      glVertex2i(0, -boxH/2);
> +-      glVertex2i(0, boxH/2);
> +-      SetColor(COLOR_RED);
> +-      glVertex2i(0, -3);
> +-      glVertex2i(0, -3+OPENGL_HEIGHT);
> +-      SetColor(COLOR_BLUE);
> +-      glVertex2i(0, -3);
> +-      glVertex2i(OPENGL_WIDTH, -3);
> +-    glEnd();
> +-
> +-    SetColor(COLOR_GREEN);
> +-
> +-    glPixelStorei(GL_UNPACK_LSB_FIRST, GL_TRUE);
> +-    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
> +-
> +-    glRasterPos2i(0, 0);
> +-    glBitmap(OPENGL_WIDTH, OPENGL_HEIGHT, 0, 3, 0.0, 0.0, OpenGL_bits);
> +-}
> +-
> +-static void Triangles(void)
> +-{
> +-
> +-    glBegin(GL_TRIANGLES);
> +-      SetColor(COLOR_GREEN);
> +-      glVertex2i(-boxW/4, -boxH/4);
> +-      SetColor(COLOR_RED);
> +-      glVertex2i(-boxW/8, -boxH/16);
> +-      SetColor(COLOR_BLUE);
> +-      glVertex2i(boxW/8, -boxH/16);
> +-
> +-      SetColor(COLOR_GREEN);
> +-      glVertex2i(-boxW/4, boxH/4);
> +-      SetColor(COLOR_RED);
> +-      glVertex2i(-boxW/8, boxH/16);
> +-      SetColor(COLOR_BLUE);
> +-      glVertex2i(boxW/8, boxH/16);
> +-    glEnd();
> +-
> +-    glBegin(GL_TRIANGLES);
> +-      glVertex2i(0, 0);
> +-      glVertex2i(-100, 100);
> +-    glEnd();
> +-}
> +-
> +-static void TriangleStrip(void)
> +-{
> +-
> +-    glBegin(GL_TRIANGLE_STRIP);
> +-      SetColor(COLOR_GREEN);
> +-      glVertex2i(-boxW/4, -boxH/4);
> +-      SetColor(COLOR_RED);
> +-      glVertex2i(-boxW/4, boxH/4);
> +-      SetColor(COLOR_BLUE);
> +-      glVertex2i(0, -boxH/4);
> +-      SetColor(COLOR_WHITE);
> +-      glVertex2i(0, boxH/4);
> +-      SetColor(COLOR_CYAN);
> +-      glVertex2i(boxW/4, -boxH/4);
> +-      SetColor(COLOR_YELLOW);
> +-      glVertex2i(boxW/4, boxH/4);
> +-    glEnd();
> +-
> +-    glBegin(GL_TRIANGLE_STRIP);
> +-      glVertex2i(0, 0);
> +-      glVertex2i(-100, 100);
> +-    glEnd();
> +-}
> +-
> +-static void TriangleFan(void)
> +-{
> +-    GLint vx[8][2];
> +-    GLint x0, y0, x1, y1, x2, y2, x3, y3;
> +-    GLint i;
> +-
> +-    y0 =3D -boxH/4;
> +-    y1 =3D y0 + boxH/2/3;
> +-    y2 =3D y1 + boxH/2/3;
> +-    y3 =3D boxH/4;
> +-    x0 =3D -boxW/4;
> +-    x1 =3D x0 + boxW/2/3;
> +-    x2 =3D x1 + boxW/2/3;
> +-    x3 =3D boxW/4;
> +-
> +-    vx[0][0] =3D x0; vx[0][1] =3D y1;
> +-    vx[1][0] =3D x0; vx[1][1] =3D y2;
> +-    vx[2][0] =3D x1; vx[2][1] =3D y3;
> +-    vx[3][0] =3D x2; vx[3][1] =3D y3;
> +-    vx[4][0] =3D x3; vx[4][1] =3D y2;
> +-    vx[5][0] =3D x3; vx[5][1] =3D y1;
> +-    vx[6][0] =3D x2; vx[6][1] =3D y0;
> +-    vx[7][0] =3D x1; vx[7][1] =3D y0;
> +-
> +-    glBegin(GL_TRIANGLE_FAN);
> +-      SetColor(COLOR_WHITE);
> +-      glVertex2i(0, 0);
> +-      for (i =3D 0; i < 8; i++) {
> +-          SetColor(COLOR_WHITE-i);
> +-          glVertex2iv(vx[i]);
> +-      }
> +-    glEnd();
> +-
> +-    glBegin(GL_TRIANGLE_FAN);
> +-      glVertex2i(0, 0);
> +-      glVertex2i(-100, 100);
> +-    glEnd();
> +-}
> +-
> +-static void Rect(void)
> +-{
> +-
> +-    SetColor(COLOR_GREEN);
> +-    glRecti(-boxW/4, -boxH/4, boxW/4, boxH/4);
> +-}
> +-
> +-static void PolygonFunc(void)
> +-{
> +-    GLint vx[8][2];
> +-    GLint x0, y0, x1, y1, x2, y2, x3, y3;
> +-    GLint i;
> +-
> +-    y0 =3D -boxH/4;
> +-    y1 =3D y0 + boxH/2/3;
> +-    y2 =3D y1 + boxH/2/3;
> +-    y3 =3D boxH/4;
> +-    x0 =3D -boxW/4;
> +-    x1 =3D x0 + boxW/2/3;
> +-    x2 =3D x1 + boxW/2/3;
> +-    x3 =3D boxW/4;
> +-
> +-    vx[0][0] =3D x0; vx[0][1] =3D y1;
> +-    vx[1][0] =3D x0; vx[1][1] =3D y2;
> +-    vx[2][0] =3D x1; vx[2][1] =3D y3;
> +-    vx[3][0] =3D x2; vx[3][1] =3D y3;
> +-    vx[4][0] =3D x3; vx[4][1] =3D y2;
> +-    vx[5][0] =3D x3; vx[5][1] =3D y1;
> +-    vx[6][0] =3D x2; vx[6][1] =3D y0;
> +-    vx[7][0] =3D x1; vx[7][1] =3D y0;
> +-
> +-    glBegin(GL_POLYGON);
> +-      for (i =3D 0; i < 8; i++) {
> +-          SetColor(COLOR_WHITE-i);
> +-          glVertex2iv(vx[i]);
> +-      }
> +-    glEnd();
> +-
> +-    glBegin(GL_POLYGON);
> +-      glVertex2i(0, 0);
> +-      glVertex2i(100, 100);
> +-    glEnd();
> +-}
> +-
> +-static void Quads(void)
> +-{
> +-
> +-    glBegin(GL_QUADS);
> +-      SetColor(COLOR_GREEN);
> +-      glVertex2i(-boxW/4, -boxH/4);
> +-      SetColor(COLOR_RED);
> +-      glVertex2i(-boxW/8, -boxH/16);
> +-      SetColor(COLOR_BLUE);
> +-      glVertex2i(boxW/8, -boxH/16);
> +-      SetColor(COLOR_WHITE);
> +-      glVertex2i(boxW/4, -boxH/4);
> +-
> +-      SetColor(COLOR_GREEN);
> +-      glVertex2i(-boxW/4, boxH/4);
> +-      SetColor(COLOR_RED);
> +-      glVertex2i(-boxW/8, boxH/16);
> +-      SetColor(COLOR_BLUE);
> +-      glVertex2i(boxW/8, boxH/16);
> +-      SetColor(COLOR_WHITE);
> +-      glVertex2i(boxW/4, boxH/4);
> +-    glEnd();
> +-
> +-    glBegin(GL_QUADS);
> +-      glVertex2i(0, 0);
> +-      glVertex2i(100, 100);
> +-      glVertex2i(-100, 100);
> +-    glEnd();
> +-}
> +-
> +-static void QuadStrip(void)
> +-{
> +-
> +-    glBegin(GL_QUAD_STRIP);
> +-      SetColor(COLOR_GREEN);
> +-      glVertex2i(-boxW/4, -boxH/4);
> +-      SetColor(COLOR_RED);
> +-      glVertex2i(-boxW/4, boxH/4);
> +-      SetColor(COLOR_BLUE);
> +-      glVertex2i(0, -boxH/4);
> +-      SetColor(COLOR_WHITE);
> +-      glVertex2i(0, boxH/4);
> +-      SetColor(COLOR_CYAN);
> +-      glVertex2i(boxW/4, -boxH/4);
> +-      SetColor(COLOR_YELLOW);
> +-      glVertex2i(boxW/4, boxH/4);
> +-    glEnd();
> +-
> +-    glBegin(GL_QUAD_STRIP);
> +-      glVertex2i(0, 0);
> +-      glVertex2i(100, 100);
> +-      glVertex2i(-100, 100);
> +-    glEnd();
> +-}
> +-
> +-static void Draw(EGLDisplay dpy, EGLSurface surf)
> +-{
> +-
> +-    glViewport(0, 0, windW, windH);
> +-    glDisable(GL_SCISSOR_TEST);
> +-
> +-    glPushAttrib(GL_COLOR_BUFFER_BIT);
> +-
> +-    glColorMask(1, 1, 1, 1);
> +-    glIndexMask(~0);
> +-
> +-    glClearColor(0.0, 0.0, 0.0, 0.0);
> +-    glClear(GL_COLOR_BUFFER_BIT);
> +-
> +-    glPopAttrib();
> +-
> +-    if (mode1) {
> +-      glShadeModel(GL_SMOOTH);
> +-    } else {
> +-      glShadeModel(GL_FLAT);
> +-    }
> +-
> +-    if (mode2) {
> +-      glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
> +-    } else {
> +-      glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
> +-    }
> +-
> +-    Viewport(0, 0); Point();
> +-    Viewport(0, 1); Lines();
> +-    Viewport(0, 2); LineStrip();
> +-    Viewport(0, 3); LineLoop();
> +-
> +-    Viewport(1, 0); Bitmap();
> +-
> +-    Viewport(1, 1); TriangleFan();
> +-    Viewport(1, 2); Triangles();
> +-    Viewport(1, 3); TriangleStrip();
> +-
> +-    Viewport(2, 0); Rect();
> +-    Viewport(2, 1); PolygonFunc();
> +-    Viewport(2, 2); Quads();
> +-    Viewport(2, 3); QuadStrip();
> +-
> +-    glFlush();
> +-
> +-    if (doubleBuffer) {
> +-      eglSwapBuffers(dpy, surf);
> +-    }
> +-}
> +-
> +-static void
> +-write_ppm(const char *filename, const GLubyte *buffer, int width, int
> height)
> +-{
> +-   const int binary =3D 0;
> +-   FILE *f =3D fopen( filename, "w" );
> +-   if (f) {
> +-      int i, x, y;
> +-      const GLubyte *ptr =3D buffer;
> +-      if (binary) {
> +-         fprintf(f,"P6\n");
> +-         fprintf(f,"# ppm-file created by osdemo.c\n");
> +-         fprintf(f,"%i %i\n", width,height);
> +-         fprintf(f,"255\n");
> +-         fclose(f);
> +-         f =3D fopen( filename, "ab" );  /* reopen in binary append mod=
e */
> +-         for (y=3Dheight-1; y>=3D0; y--) {
> +-            for (x=3D0; x<width; x++) {
> +-               i =3D (y*width + x) * 4;
> +-               fputc(ptr[i], f);   /* write red */
> +-               fputc(ptr[i+1], f); /* write green */
> +-               fputc(ptr[i+2], f); /* write blue */
> +-            }
> +-         }
> +-      }
> +-      else {
> +-         /*ASCII*/
> +-         int counter =3D 0;
> +-         fprintf(f,"P3\n");
> +-         fprintf(f,"# ascii ppm file created by osdemo.c\n");
> +-         fprintf(f,"%i %i\n", width, height);
> +-         fprintf(f,"255\n");
> +-         for (y=3Dheight-1; y>=3D0; y--) {
> +-            for (x=3D0; x<width; x++) {
> +-               i =3D (y*width + x) * 4;
> +-               fprintf(f, " %3d %3d %3d", ptr[i], ptr[i+1], ptr[i+2]);
> +-               counter++;
> +-               if (counter % 5 =3D=3D 0)
> +-                  fprintf(f, "\n");
> +-            }
> +-         }
> +-      }
> +-      fclose(f);
> +-   }
> +-}
> +-#endif
> +-
> +-int
> +-main(int argc, char *argv[])
> +-{
> +-   int maj, min;
> +-#ifdef EGL_MESA_screen_surface
> +-   EGLContext ctx;
> +-   EGLSurface screen_surf;
> +-   EGLConfig configs[10];
> +-   EGLScreenMESA screen;
> +-   EGLModeMESA mode;
> +-   EGLint numConfigs, count;
> +-   EGLBoolean b;
> +-   const GLubyte *bitmap;
> +-   EGLint screenAttribs[32];
> +-   EGLint i;
> +-#endif
> +-
> +-   EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);
> +-   assert(d);
> +-
> +-   if (!eglInitialize(d, &maj, &min)) {
> +-      printf("demo: eglInitialize failed\n");
> +-      exit(1);
> +-   }
> +-
> +-   printf("EGL version =3D %d.%d\n", maj, min);
> +-   printf("EGL_VENDOR =3D %s\n", eglQueryString(d, EGL_VENDOR));
> +-   if (!strstr(eglQueryString(d, EGL_EXTENSIONS),
> +-               "EGL_MESA_screen_surface")) {
> +-      printf("EGL_MESA_screen_surface is not supported\n");
> +-      exit(1);
> +-   }
> +-
> +-#ifdef EGL_MESA_screen_surface
> +-   eglGetConfigs(d, configs, 10, &numConfigs);
> +-   eglGetScreensMESA(d, &screen, 1, &count);
> +-   eglGetModesMESA(d, screen, &mode, 1, &count);
> +-
> +-   eglBindAPI(EGL_OPENGL_API);
> +-   ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, NULL);
> +-   if (ctx =3D=3D EGL_NO_CONTEXT) {
> +-      printf("failed to create context\n");
> +-      return 0;
> +-   }
> +-
> +-   i =3D 0;
> +-   screenAttribs[i++] =3D EGL_WIDTH;
> +-   eglGetModeAttribMESA(d, mode, EGL_WIDTH, &screenAttribs[i++]);
> +-   screenAttribs[i++] =3D EGL_HEIGHT;
> +-   eglGetModeAttribMESA(d, mode, EGL_HEIGHT, &screenAttribs[i++]);
> +-   screenAttribs[i] =3D EGL_NONE;
> +-
> +-   screen_surf =3D eglCreateScreenSurfaceMESA(d, configs[0],
> screenAttribs);
> +-   if (screen_surf =3D=3D EGL_NO_SURFACE) {
> +-      printf("failed to create screen surface\n");
> +-      return 0;
> +-   }
> +-
> +-   eglShowScreenSurfaceMESA(d, screen, screen_surf, mode);
> +-
> +-   b =3D eglMakeCurrent(d, screen_surf, screen_surf, ctx);
> +-   if (!b) {
> +-      printf("make current failed\n");
> +-      return 0;
> +-   }
> +-   glViewport(0, 0, 1024, 768);
> +-
> +-
> +-   Init();
> +-   Reshape(1024, 768);
> +-
> +-   /* some drivers crash when rendering to front buffer */
> +-#if 0
> +-   glDrawBuffer( GL_FRONT );
> +-   glClearColor( 0, 1.0, 0, 1);
> +-
> +-   glClear( GL_COLOR_BUFFER_BIT );
> +-#endif
> +-
> +-   doubleBuffer =3D 1;
> +-   glDrawBuffer( GL_BACK );
> +-
> +-   Draw(d, screen_surf);
> +-   sleep(2);
> +-
> +-   /* TODO EGL_KHR_lock_surface */
> +-   bitmap =3D NULL;
> +-   if (bitmap)
> +-      write_ppm("dump.ppm", bitmap, 1024, 768);
> +-
> +-   eglDestroySurface(d, screen_surf);
> +-   eglDestroyContext(d, ctx);
> +-   eglTerminate(d);
> +-#endif
> +-
> +-   return 0;
> +-}
> +diff --git a/src/egl/opengl/eglinfo.c b/src/egl/opengl/eglinfo.c
> +index 8e82e73..1f79fef 100644
> +--- a/src/egl/opengl/eglinfo.c
> ++++ b/src/egl/opengl/eglinfo.c
> +@@ -93,10 +93,6 @@ PrintConfigs(EGLDisplay d)
> +          strcat(surfString, "pb,");
> +       if (surfaces & EGL_PIXMAP_BIT)
> +          strcat(surfString, "pix,");
> +-#ifdef EGL_MESA_screen_surface
> +-      if (surfaces & EGL_SCREEN_BIT_MESA)
> +-         strcat(surfString, "scrn,");
> +-#endif
> +       if (strlen(surfString) > 0)
> +          surfString[strlen(surfString) - 1] =3D 0;
> +
> +@@ -117,45 +113,6 @@ PrintConfigs(EGLDisplay d)
> + }
> +
> +
> +-/**
> +- * Print table of all available configurations.
> +- */
> +-static void
> +-PrintModes(EGLDisplay d)
> +-{
> +-#ifdef EGL_MESA_screen_surface
> +-   const char *extensions =3D eglQueryString(d, EGL_EXTENSIONS);
> +-   if (strstr(extensions, "EGL_MESA_screen_surface")) {
> +-      EGLScreenMESA screens[MAX_SCREENS];
> +-      EGLint numScreens =3D 1, scrn;
> +-      EGLModeMESA modes[MAX_MODES];
> +-
> +-      eglGetScreensMESA(d, screens, MAX_SCREENS, &numScreens);
> +-      printf("Number of Screens: %d\n\n", numScreens);
> +-
> +-      for (scrn =3D 0; scrn < numScreens; scrn++) {
> +-         EGLint numModes, i;
> +-
> +-         eglGetModesMESA(d, screens[scrn], modes, MAX_MODES, &numModes)=
;
> +-
> +-         printf("Screen %d Modes:\n", scrn);
> +-         printf("  id  width height refresh  name\n");
> +-         printf("-----------------------------------------\n");
> +-         for (i =3D 0; i < numModes; i++) {
> +-            EGLint id, w, h, r;
> +-            const char *str;
> +-            eglGetModeAttribMESA(d, modes[i], EGL_MODE_ID_MESA, &id);
> +-            eglGetModeAttribMESA(d, modes[i], EGL_WIDTH, &w);
> +-            eglGetModeAttribMESA(d, modes[i], EGL_HEIGHT, &h);
> +-            eglGetModeAttribMESA(d, modes[i], EGL_REFRESH_RATE_MESA, &r=
);
> +-            str =3D eglQueryModeStringMESA(d, modes[i]);
> +-            printf("0x%02x %5d  %5d   %.3f  %s\n", id, w, h, r / 1000.0=
,
> str);
> +-         }
> +-      }
> +-   }
> +-#endif
> +-}
> +-
> + static void
> + PrintExtensions(EGLDisplay d)
> + {
> +@@ -215,8 +172,6 @@ main(int argc, char *argv[])
> +
> +    PrintConfigs(d);
> +
> +-   PrintModes(d);
> +-
> +    eglTerminate(d);
> +
> +    return 0;
> +diff --git a/src/egl/opengles1/Makefile.am b/src/egl/opengles1/Makefile.=
am
> +index 516e516..1cc2e1f 100644
> +--- a/src/egl/opengles1/Makefile.am
> ++++ b/src/egl/opengles1/Makefile.am
> +@@ -38,24 +38,6 @@ AM_LDFLAGS =3D \
> +
> + bin_PROGRAMS =3D
> +
> +-if HAVE_EGL
> +-if HAVE_GLESV1
> +-bin_PROGRAMS +=3D \
> +-      drawtex_screen \
> +-      gears_screen \
> +-      torus_screen \
> +-      tri_screen
> +-
> +-drawtex_screen_SOURCES =3D drawtex.c
> +-gears_screen_SOURCES =3D gears.c
> +-torus_screen_SOURCES =3D torus.c
> +-tri_screen_SOURCES =3D tri.c
> +-
> +-drawtex_screen_LDADD =3D ../eglut/libeglut_screen.la
> +-gears_screen_LDADD =3D ../eglut/libeglut_screen.la
> +-torus_screen_LDADD =3D ../eglut/libeglut_screen.la
> +-tri_screen_LDADD =3D ../eglut/libeglut_screen.la
> +-
> + if HAVE_X11
> + bin_PROGRAMS +=3D \
> +       clear \
> +@@ -94,5 +76,3 @@ gears_x11_LDADD =3D ../eglut/libeglut_x11.la
> + torus_x11_LDADD =3D ../eglut/libeglut_x11.la
> + tri_x11_LDADD =3D ../eglut/libeglut_x11.la
> + endif
> +-endif
> +-endif
> +diff --git a/src/egl/opengles2/Makefile.am b/src/egl/opengles2/Makefile.=
am
> +index 74af460..422cb03 100644
> +--- a/src/egl/opengles2/Makefile.am
> ++++ b/src/egl/opengles2/Makefile.am
> +@@ -33,13 +33,7 @@ AM_LDFLAGS =3D \
> +       $(EGL_LIBS) \
> +       -lm
> +
> +-if HAVE_EGL
> +-if HAVE_GLESV2
> +-bin_PROGRAMS =3D \
> +-      es2gears_screen
> +-
> +-es2gears_screen_SOURCES =3D es2gears.c
> +-es2gears_screen_LDADD =3D ../eglut/libeglut_screen.la
> ++bin_PROGRAMS =3D
> +
> + if HAVE_WAYLAND
> + bin_PROGRAMS +=3D es2gears_wayland
> +@@ -59,6 +53,4 @@ es2gears_x11_SOURCES =3D es2gears.c
> + es2gears_x11_LDADD =3D ../eglut/libeglut_x11.la
> + es2tri_LDADD =3D $(X11_LIBS)
> + endif
> +-endif
> +-endif
> +
> +diff --git a/src/egl/openvg/Makefile.am b/src/egl/openvg/Makefile.am
> +index b545225..5fd1cf8 100644
> +--- a/src/egl/openvg/Makefile.am
> ++++ b/src/egl/openvg/Makefile.am
> +@@ -50,21 +50,13 @@ endif
> + if HAVE_EGL
> + if HAVE_VG
> + bin_PROGRAMS =3D \
> +-      lion_screen \
> +-      sp_screen \
> +       $(EGL_X11_DEMOS)
> + endif
> + endif
> +
> +-lion_screen_SOURCES =3D lion.c lion-render.c lion-render.h
> +-sp_screen_SOURCES =3D sp.c
> +-
> + lion_x11_SOURCES =3D lion.c lion-render.c lion-render.h
> + sp_x11_SOURCES =3D sp.c
> +
> +-lion_screen_LDADD =3D ../eglut/libeglut_screen.la
> +-sp_screen_LDADD =3D ../eglut/libeglut_screen.la
> +-
> + lion_x11_LDADD =3D ../eglut/libeglut_x11.la
> + sp_x11_LDADD =3D ../eglut/libeglut_x11.la
> +
> +diff --git a/src/egl/openvg/Makefile.in b/src/egl/openvg/Makefile.in
> +index 99e9288..3652fbb 100644
> +--- a/src/egl/openvg/Makefile.in
> ++++ b/src/egl/openvg/Makefile.in
> +@@ -108,8 +108,6 @@ host_triplet =3D @host@
> + @HAVE_FREETYPE2_TRUE@@HAVE_X11_TRUE@am__append_1 =3D \
> + @HAVE_FREETYPE2_TRUE@@HAVE_X11_TRUE@  text
> +
> +-@HAVE_EGL_TRUE@@HAVE_VG_TRUE@noinst_PROGRAMS =3D lion_screen$(EXEEXT) \
> +-@HAVE_EGL_TRUE@@HAVE_VG_TRUE@ sp_screen$(EXEEXT) \
> + @HAVE_EGL_TRUE@@HAVE_VG_TRUE@ $(am__EXEEXT_2)
> + subdir =3D src/egl/openvg
> + DIST_COMMON =3D $(srcdir)/Makefile.in $(srcdir)/Makefile.am \
> +@@ -128,9 +126,6 @@ CONFIG_CLEAN_VPATH_FILES =3D
> + @HAVE_X11_TRUE@am__EXEEXT_2 =3D lion_x11$(EXEEXT) sp_x11$(EXEEXT) \
> + @HAVE_X11_TRUE@       $(am__EXEEXT_1)
> + PROGRAMS =3D $(noinst_PROGRAMS)
> +-am_lion_screen_OBJECTS =3D lion.$(OBJEXT) lion-render.$(OBJEXT)
> +-lion_screen_OBJECTS =3D $(am_lion_screen_OBJECTS)
> +-lion_screen_DEPENDENCIES =3D ../eglut/libeglut_screen.la
> + AM_V_lt =3D $(am__v_lt_@AM_V@)
> + am__v_lt_ =3D $(am__v_lt_@AM_DEFAULT_V@)
> + am__v_lt_0 =3D --silent
> +@@ -138,9 +133,6 @@ am__v_lt_1 =3D
> + am_lion_x11_OBJECTS =3D lion.$(OBJEXT) lion-render.$(OBJEXT)
> + lion_x11_OBJECTS =3D $(am_lion_x11_OBJECTS)
> + lion_x11_DEPENDENCIES =3D ../eglut/libeglut_x11.la
> +-am_sp_screen_OBJECTS =3D sp.$(OBJEXT)
> +-sp_screen_OBJECTS =3D $(am_sp_screen_OBJECTS)
> +-sp_screen_DEPENDENCIES =3D ../eglut/libeglut_screen.la
> + am_sp_x11_OBJECTS =3D sp.$(OBJEXT)
> + sp_x11_OBJECTS =3D $(am_sp_x11_OBJECTS)
> + sp_x11_DEPENDENCIES =3D ../eglut/libeglut_x11.la
> +@@ -184,10 +176,10 @@ AM_V_CCLD =3D $(am__v_CCLD_@AM_V@)
> + am__v_CCLD_ =3D $(am__v_CCLD_@AM_DEFAULT_V@)
> + am__v_CCLD_0 =3D @echo "  CCLD    " $@;
> + am__v_CCLD_1 =3D
> +-SOURCES =3D $(lion_screen_SOURCES) $(lion_x11_SOURCES) \
> +-      $(sp_screen_SOURCES) $(sp_x11_SOURCES) $(text_SOURCES)
> +-DIST_SOURCES =3D $(lion_screen_SOURCES) $(lion_x11_SOURCES) \
> +-      $(sp_screen_SOURCES) $(sp_x11_SOURCES) $(text_SOURCES)
> ++SOURCES =3D $(lion_x11_SOURCES) \
> ++      $(sp_x11_SOURCES) $(text_SOURCES)
> ++DIST_SOURCES =3D $(lion_x11_SOURCES) \
> ++      $(sp_x11_SOURCES) $(text_SOURCES)
> + RECURSIVE_TARGETS =3D all-recursive check-recursive cscopelist-recursiv=
e \
> +       ctags-recursive dvi-recursive html-recursive info-recursive \
> +       install-data-recursive install-dvi-recursive \
> +@@ -423,12 +415,8 @@ AM_LDFLAGS =3D \
> +       -lm
> +
> + @HAVE_X11_TRUE@EGL_X11_DEMOS =3D lion_x11 sp_x11 $(am__append_1)
> +-lion_screen_SOURCES =3D lion.c lion-render.c lion-render.h
> +-sp_screen_SOURCES =3D sp.c
> + lion_x11_SOURCES =3D lion.c lion-render.c lion-render.h
> + sp_x11_SOURCES =3D sp.c
> +-lion_screen_LDADD =3D ../eglut/libeglut_screen.la
> +-sp_screen_LDADD =3D ../eglut/libeglut_screen.la
> + lion_x11_LDADD =3D ../eglut/libeglut_x11.la
> + sp_x11_LDADD =3D ../eglut/libeglut_x11.la
> + text_SOURCES =3D text.c
> +@@ -481,18 +469,10 @@ clean-noinstPROGRAMS:
> +       echo " rm -f" $$list; \
> +       rm -f $$list
> +
> +-lion_screen$(EXEEXT): $(lion_screen_OBJECTS) $(lion_screen_DEPENDENCIES=
)
> $(EXTRA_lion_screen_DEPENDENCIES)
> +-      @rm -f lion_screen$(EXEEXT)
> +-      $(AM_V_CCLD)$(LINK) $(lion_screen_OBJECTS) $(lion_screen_LDADD)
> $(LIBS)
> +-
> + lion_x11$(EXEEXT): $(lion_x11_OBJECTS) $(lion_x11_DEPENDENCIES)
> $(EXTRA_lion_x11_DEPENDENCIES)
> +       @rm -f lion_x11$(EXEEXT)
> +       $(AM_V_CCLD)$(LINK) $(lion_x11_OBJECTS) $(lion_x11_LDADD) $(LIBS)
> +
> +-sp_screen$(EXEEXT): $(sp_screen_OBJECTS) $(sp_screen_DEPENDENCIES)
> $(EXTRA_sp_screen_DEPENDENCIES)
> +-      @rm -f sp_screen$(EXEEXT)
> +-      $(AM_V_CCLD)$(LINK) $(sp_screen_OBJECTS) $(sp_screen_LDADD) $(LIB=
S)
> +-
> + sp_x11$(EXEEXT): $(sp_x11_OBJECTS) $(sp_x11_DEPENDENCIES)
> $(EXTRA_sp_x11_DEPENDENCIES)
> +       @rm -f sp_x11$(EXEEXT)
> +       $(AM_V_CCLD)$(LINK) $(sp_x11_OBJECTS) $(sp_x11_LDADD) $(LIBS)
> +
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
> b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
> index 557b8c6..2df9bba 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
> @@ -20,6 +20,7 @@ SRC_URI =3D "
> ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
>
>  file://0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch \
>      file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \
>      file://0010-sharedtex_mt-fix-rendering-thread-hang.patch \
> +
> file://0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch \
>  "
>  SRC_URI[md5sum] =3D "72613a2c8c013716db02e3ff59d29061"
>  SRC_URI[sha256sum] =3D
> "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92"
> --
> 1.9.1
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11440cd09bf05a05320535de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you push these patches to a branch?=C2=A0 For some rea=
son git-am isn&#39;t able to parse the patch.<div><br></div><div>Ross</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 4 May 20=
16 at 10:11, Awais Belal <span dir=3D"ltr">&lt;<a href=3D"mailto:awais_bela=
l@mentor.com" target=3D"_blank">awais_belal@mentor.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">The mesa surface EGL_MESA_screen_surfac=
e was obsoleted<br>
and then dropped from mesa some time ago. Drop demos<br>
depending on this.<br>
<br>
Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com">aw=
ais_belal@mentor.com</a>&gt;<br>
---<br>
=C2=A0...dependant-on-obsolete-MESA_screen_surface.patch | 1592 +++++++++++=
+++++++++<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa-demos_8.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-demos_8.2.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A02 files changed, 1593 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0011-drop-de=
mos-dependant-on-obsolete-MESA_screen_surface.patch<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependan=
t-on-obsolete-MESA_screen_surface.patch b/meta/recipes-graphics/mesa/mesa-d=
emos/0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch<br>
new file mode 100644<br>
index 0000000..a2621ce<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependant-on-ob=
solete-MESA_screen_surface.patch<br>
@@ -0,0 +1,1592 @@<br>
+commit 74443c6ee79f3251f643ea05e94df58183e37d0d<br>
+Author: Matt Turner &lt;<a href=3D"mailto:mattst88@gmail.com">mattst88@gma=
il.com</a>&gt;<br>
+Date:=C2=A0 =C2=A0Fri Aug 28 15:57:38 2015 -0700<br>
+<br>
+=C2=A0 =C2=A0 egl: Remove demos using EGL_MESA_screen_surface.<br>
+<br>
+=C2=A0 =C2=A0 The remnants of the extension were removed from Mesa in comm=
it 7a58262e.<br>
+<br>
+=C2=A0 =C2=A0 Reviewed-by: Andreas Boll &lt;<a href=3D"mailto:andreas.boll=
.dev@gmail.com">andreas.boll.dev@gmail.com</a>&gt;<br>
+=C2=A0 =C2=A0 Tested-by: Andreas Boll &lt;<a href=3D"mailto:andreas.boll.d=
ev@gmail.com">andreas.boll.dev@gmail.com</a>&gt;<br>
+=C2=A0 =C2=A0 Reviewed-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:mar=
ek.olsak@amd.com">marek.olsak@amd.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+diff --git a/src/egl/eglut/Makefile.am b/src/egl/eglut/Makefile.am<br>
+index 2d2f2af..b765069 100644<br>
+--- a/src/egl/eglut/Makefile.am<br>
++++ b/src/egl/eglut/Makefile.am<br>
+@@ -33,17 +33,12 @@ if HAVE_WAYLAND<br>
+ eglut_wayland =3D <a href=3D"http://libeglut_wayland.la" rel=3D"noreferre=
r" target=3D"_blank">libeglut_wayland.la</a><br>
+ endif<br>
+<br>
+-noinst_LTLIBRARIES =3D <a href=3D"http://libeglut_screen.la" rel=3D"noref=
errer" target=3D"_blank">libeglut_screen.la</a> $(eglut_x11) $(eglut_waylan=
d)<br>
++noinst_LTLIBRARIES =3D $(eglut_x11) $(eglut_wayland)<br>
+ endif<br>
+<br>
+-libeglut_screen_la_SOURCES =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 eglut.c \<br>
+-=C2=A0 =C2=A0 =C2=A0 eglut.h \<br>
+-=C2=A0 =C2=A0 =C2=A0 eglutint.h \<br>
+-=C2=A0 =C2=A0 =C2=A0 eglut_screen.c<br>
+-<br>
+ libeglut_x11_la_SOURCES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0eglut.c \<br>
++=C2=A0 =C2=A0 =C2=A0 eglut.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0eglutint.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0eglut_x11.c<br>
+ libeglut_x11_la_CFLAGS =3D $(X11_CFLAGS) $(EGL_CFLAGS)<br>
+@@ -52,6 +47,7 @@ libeglut_x11_la_LIBADD =3D $(X11_LIBS) $(EGL_LIBS)<br>
+<br>
+ libeglut_wayland_la_SOURCES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0eglut.c \<br>
++=C2=A0 =C2=A0 =C2=A0 eglut.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0eglutint.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0eglut_wayland.c<br>
+<br>
+diff --git a/src/egl/eglut/eglut.c b/src/egl/eglut/eglut.c<br>
+index f6a2ad4..58b354a 100644<br>
+--- a/src/egl/eglut/eglut.c<br>
++++ b/src/egl/eglut/eglut.c<br>
+@@ -176,9 +176,6 @@ _eglutCreateWindow(const char *title, int x, int y, in=
t w, int h)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0win-&gt;config, win-&gt;na=
tive.u.pixmap, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case EGL_PBUFFER_BIT:<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0case EGL_SCREEN_BIT_MESA:<br>
+-#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0win-&gt;surface =3D win-&gt;native.u.surface;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 default:<br>
+@@ -292,11 +289,7 @@ eglutDestroyWindow(int win)<br>
+=C2=A0 =C2=A0 if (window-&gt;index !=3D win)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0/* XXX it causes some bug in st/egl KMS backend */<br>
+-=C2=A0 =C2=A0if ( _eglut-&gt;surface_type !=3D EGL_SCREEN_BIT_MESA)<br>
+-#endif<br>
+-=C2=A0 =C2=A0 =C2=A0 eglMakeCurrent(_eglut-&gt;dpy, EGL_NO_SURFACE, EGL_N=
O_SURFACE, EGL_NO_CONTEXT);<br>
++=C2=A0 =C2=A0eglMakeCurrent(_eglut-&gt;dpy, EGL_NO_SURFACE, EGL_NO_SURFAC=
E, EGL_NO_CONTEXT);<br>
+<br>
+=C2=A0 =C2=A0 _eglutDestroyWindow(_eglut-&gt;current);<br>
+ }<br>
+diff --git a/src/egl/eglut/eglut_screen.c b/src/egl/eglut/eglut_screen.c<b=
r>
+deleted file mode 100644<br>
+index 094a4e2..0000000<br>
+--- a/src/egl/eglut/eglut_screen.c<br>
++++ /dev/null<br>
+@@ -1,194 +0,0 @@<br>
+-/*<br>
+- * Copyright (C) 2010 LunarG Inc.<br>
+- *<br>
+- * Permission is hereby granted, free of charge, to any person obtaining =
a<br>
+- * copy of this software and associated documentation files (the &quot;So=
ftware&quot;),<br>
+- * to deal in the Software without restriction, including without limitat=
ion<br>
+- * the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,<br>
+- * and/or sell copies of the Software, and to permit persons to whom the<=
br>
+- * Software is furnished to do so, subject to the following conditions:<b=
r>
+- *<br>
+- * The above copyright notice and this permission notice shall be include=
d<br>
+- * in all copies or substantial portions of the Software.<br>
+- *<br>
+- * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KI=
ND, EXPRESS OR<br>
+- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,<br>
+- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.=C2=A0 IN NO EVEN=
T SHALL<br>
+- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER<br>
+- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G<br>
+- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER<br=
>
+- * DEALINGS IN THE SOFTWARE.<br>
+- *<br>
+- * Authors:<br>
+- *=C2=A0 =C2=A0 Chia-I Wu &lt;<a href=3D"mailto:olv@lunarg.com">olv@lunar=
g.com</a>&gt;<br>
+- */<br>
+-<br>
+-#include &lt;stdio.h&gt;<br>
+-#include &lt;string.h&gt;<br>
+-#include &lt;sys/time.h&gt;<br>
+-<br>
+-#define EGL_EGLEXT_PROTOTYPES<br>
+-#include &quot;EGL/egl.h&quot;<br>
+-#include &quot;EGL/eglext.h&quot;<br>
+-<br>
+-#include &quot;eglutint.h&quot;<br>
+-<br>
+-#define MAX_MODES 100<br>
+-<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-static EGLScreenMESA kms_screen;<br>
+-static EGLModeMESA kms_mode;<br>
+-static EGLint kms_width, kms_height;<br>
+-#endif<br>
+-<br>
+-void<br>
+-_eglutNativeInitDisplay(void)<br>
+-{<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0_eglut-&gt;native_dpy =3D EGL_DEFAULT_DISPLAY;<br>
+-=C2=A0 =C2=A0_eglut-&gt;surface_type =3D EGL_SCREEN_BIT_MESA;<br>
+-#endif<br>
+-}<br>
+-<br>
+-void<br>
+-_eglutNativeFiniDisplay(void)<br>
+-{<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0kms_screen =3D 0;<br>
+-=C2=A0 =C2=A0kms_mode =3D 0;<br>
+-=C2=A0 =C2=A0kms_width =3D 0;<br>
+-=C2=A0 =C2=A0kms_height =3D 0;<br>
+-#endif<br>
+-}<br>
+-<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-static void<br>
+-init_kms(void)<br>
+-{<br>
+-=C2=A0 =C2=A0EGLModeMESA modes[MAX_MODES];<br>
+-=C2=A0 =C2=A0EGLint num_screens, num_modes;<br>
+-=C2=A0 =C2=A0EGLint width, height, best_mode;<br>
+-=C2=A0 =C2=A0EGLint i;<br>
+-<br>
+-=C2=A0 =C2=A0if (!eglGetScreensMESA(_eglut-&gt;dpy, &amp;kms_screen, 1, &=
amp;num_screens) ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!num_screens)<br>
+-=C2=A0 =C2=A0 =C2=A0 _eglutFatal(&quot;eglGetScreensMESA failed\n&quot;);=
<br>
+-<br>
+-=C2=A0 =C2=A0if (!eglGetModesMESA(_eglut-&gt;dpy, kms_screen,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modes, MAX_MODES, &amp;num_mode=
s) || !num_modes)<br>
+-=C2=A0 =C2=A0 =C2=A0 _eglutFatal(&quot;eglGetModesMESA failed!\n&quot;);<=
br>
+-<br>
+-=C2=A0 =C2=A0printf(&quot;Found %d modes:\n&quot;, num_modes);<br>
+-<br>
+-=C2=A0 =C2=A0best_mode =3D 0;<br>
+-=C2=A0 =C2=A0width =3D 0;<br>
+-=C2=A0 =C2=A0height =3D 0;<br>
+-=C2=A0 =C2=A0for (i =3D 0; i &lt; num_modes; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 EGLint w, h;<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetModeAttribMESA(_eglut-&gt;dpy, modes[i], EGL_W=
IDTH, &amp;w);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetModeAttribMESA(_eglut-&gt;dpy, modes[i], EGL_H=
EIGHT, &amp;h);<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;%3d: %d x %d\n&quot;, i, w, h);<br>
+-=C2=A0 =C2=A0 =C2=A0 if (w &gt; width &amp;&amp; h &gt; height) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0width =3D w;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0height =3D h;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0best_mode =3D i;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0printf(&quot;Will use screen size: %d x %d\n&quot;, width, h=
eight);<br>
+-<br>
+-=C2=A0 =C2=A0kms_mode =3D modes[best_mode];<br>
+-=C2=A0 =C2=A0kms_width =3D width;<br>
+-=C2=A0 =C2=A0kms_height =3D height;<br>
+-}<br>
+-#endif<br>
+-<br>
+-void<br>
+-_eglutNativeInitWindow(struct eglut_window *win, const char *title,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int x, int y, int w, int h)<br>
+-{<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0EGLint surf_attribs[16];<br>
+-=C2=A0 =C2=A0EGLint i;<br>
+-#endif<br>
+-=C2=A0 =C2=A0const char *exts;<br>
+-<br>
+-=C2=A0 =C2=A0exts =3D eglQueryString(_eglut-&gt;dpy, EGL_EXTENSIONS);<br>
+-=C2=A0 =C2=A0if (!exts || !strstr(exts, &quot;EGL_MESA_screen_surface&quo=
t;))<br>
+-=C2=A0 =C2=A0 =C2=A0 _eglutFatal(&quot;EGL_MESA_screen_surface is not sup=
ported\n&quot;);<br>
+-<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0init_kms();<br>
+-<br>
+-=C2=A0 =C2=A0i =3D 0;<br>
+-=C2=A0 =C2=A0surf_attribs[i++] =3D EGL_WIDTH;<br>
+-=C2=A0 =C2=A0surf_attribs[i++] =3D kms_width;<br>
+-=C2=A0 =C2=A0surf_attribs[i++] =3D EGL_HEIGHT;<br>
+-=C2=A0 =C2=A0surf_attribs[i++] =3D kms_height;<br>
+-=C2=A0 =C2=A0surf_attribs[i++] =3D EGL_NONE;<br>
+-<br>
+-=C2=A0 =C2=A0/* create surface */<br>
+-=C2=A0 =C2=A0win-&gt;native.u.surface =3D eglCreateScreenSurfaceMESA(_egl=
ut-&gt;dpy,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0win-&gt;config, surf_attribs);<br>
+-=C2=A0 =C2=A0if (win-&gt;native.u.surface =3D=3D EGL_NO_SURFACE)<br>
+-=C2=A0 =C2=A0 =C2=A0 _eglutFatal(&quot;eglCreateScreenSurfaceMESA failed\=
n&quot;);<br>
+-<br>
+-=C2=A0 =C2=A0if (!eglShowScreenSurfaceMESA(_eglut-&gt;dpy, kms_screen,<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 win-&gt;native.u.surface, kms_m=
ode))<br>
+-=C2=A0 =C2=A0 =C2=A0 _eglutFatal(&quot;eglShowScreenSurfaceMESA failed\n&=
quot;);<br>
+-<br>
+-=C2=A0 =C2=A0win-&gt;native.width =3D kms_width;<br>
+-=C2=A0 =C2=A0win-&gt;native.height =3D kms_height;<br>
+-#endif<br>
+-}<br>
+-<br>
+-void<br>
+-_eglutNativeFiniWindow(struct eglut_window *win)<br>
+-{<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0eglShowScreenSurfaceMESA(_eglut-&gt;dpy,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kms_screen, EGL_NO_SURFACE, 0);<br>
+-=C2=A0 =C2=A0eglDestroySurface(_eglut-&gt;dpy, win-&gt;native.u.surface);=
<br>
+-#endif<br>
+-}<br>
+-<br>
+-void<br>
+-_eglutNativeEventLoop(void)<br>
+-{<br>
+-=C2=A0 =C2=A0int start =3D _eglutNow();<br>
+-=C2=A0 =C2=A0int frames =3D 0;<br>
+-<br>
+-=C2=A0 =C2=A0_eglut-&gt;redisplay =3D 1;<br>
+-<br>
+-=C2=A0 =C2=A0while (1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 struct eglut_window *win =3D _eglut-&gt;current;<br>
+-=C2=A0 =C2=A0 =C2=A0 int now =3D _eglutNow();<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (now - start &gt; 5000) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0double elapsed =3D (double) (now - star=
t) / 1000.0;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;%d frames in %3.1f seconds=
 =3D %6.3f FPS\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frames, elapsed, f=
rames / elapsed);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fflush(stdout);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start =3D now;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frames =3D 0;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* send escape */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (win-&gt;keyboard_cb)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 win-&gt;keyboard_cb(27);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (_eglut-&gt;idle_cb)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_eglut-&gt;idle_cb();<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (_eglut-&gt;redisplay) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_eglut-&gt;redisplay =3D 0;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (win-&gt;display_cb)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 win-&gt;display_cb();<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eglSwapBuffers(_eglut-&gt;dpy, win-&gt;=
surface);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0frames++;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0}<br>
+-}<br>
+diff --git a/src/egl/opengl/Makefile.am b/src/egl/opengl/Makefile.am<br>
+index 87b2f1a..3e48141 100644<br>
+--- a/src/egl/opengl/Makefile.am<br>
++++ b/src/egl/opengl/Makefile.am<br>
+@@ -51,20 +51,12 @@ endif<br>
+<br>
+ if HAVE_EGL<br>
+ bin_PROGRAMS =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 demo1 \<br>
+-=C2=A0 =C2=A0 =C2=A0 demo2 \<br>
+-=C2=A0 =C2=A0 =C2=A0 demo3 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0eglinfo \<br>
+-=C2=A0 =C2=A0 =C2=A0 eglgears_screen \<br>
+-=C2=A0 =C2=A0 =C2=A0 egltri_screen \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0peglgears \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(EGL_DRM_DEMOS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(EGL_X11_DEMOS)<br>
+ endif<br>
+<br>
+-egltri_screen_SOURCES =3D egltri.c<br>
+-eglgears_screen_SOURCES =3D eglgears.c<br>
+-<br>
+ egltri_x11_SOURCES =3D egltri.c<br>
+ eglgears_x11_SOURCES =3D eglgears.c<br>
+<br>
+@@ -73,9 +65,6 @@ egltri_x11_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS)<br>
+ xeglgears_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS)<br>
+ xeglthreads_LDFLAGS =3D $(AM_LDFLAGS) $(X11_LIBS) -pthread<br>
+<br>
+-eglgears_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" =
rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+-egltri_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" re=
l=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+-<br>
+ eglgears_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D=
"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
+ egltri_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D"n=
oreferrer" target=3D"_blank">libeglut_x11.la</a><br>
+<br>
+diff --git a/src/egl/opengl/demo1.c b/src/egl/opengl/demo1.c<br>
+deleted file mode 100644<br>
+index 06e2138..0000000<br>
+--- a/src/egl/opengl/demo1.c<br>
++++ /dev/null<br>
+@@ -1,155 +0,0 @@<br>
+-/*<br>
+- * Exercise EGL API functions<br>
+- */<br>
+-<br>
+-#define EGL_EGLEXT_PROTOTYPES<br>
+-<br>
+-#include &lt;EGL/egl.h&gt;<br>
+-#include &lt;EGL/eglext.h&gt;<br>
+-#include &lt;assert.h&gt;<br>
+-#include &lt;stdio.h&gt;<br>
+-#include &lt;stdlib.h&gt;<br>
+-#include &lt;string.h&gt;<br>
+-<br>
+-<br>
+-/**<br>
+- * Test EGL_MESA_screen_surface functions<br>
+- */<br>
+-static void<br>
+-TestScreens(EGLDisplay dpy)<br>
+-{<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-#define MAX 8<br>
+-=C2=A0 =C2=A0EGLScreenMESA screens[MAX];<br>
+-=C2=A0 =C2=A0EGLint numScreens;<br>
+-=C2=A0 =C2=A0EGLint i;<br>
+-<br>
+-=C2=A0 =C2=A0eglGetScreensMESA(dpy, screens, MAX, &amp;numScreens);<br>
+-=C2=A0 =C2=A0printf(&quot;Found %d screens\n&quot;, numScreens);<br>
+-=C2=A0 =C2=A0for (i =3D 0; i &lt; numScreens; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot; Screen %d handle: %d\n&quot;, i, (int)=
 screens[i]);<br>
+-=C2=A0 =C2=A0}<br>
+-#endif<br>
+-}<br>
+-<br>
+-/**<br>
+- * Print table of all available configurations.<br>
+- */<br>
+-static void<br>
+-PrintConfigs(EGLDisplay d, EGLConfig *configs, EGLint numConfigs)<br>
+-{<br>
+-=C2=A0 =C2=A0EGLint i;<br>
+-<br>
+-=C2=A0 =C2=A0printf(&quot;Configurations:\n&quot;);<br>
+-=C2=A0 =C2=A0printf(&quot;=C2=A0 =C2=A0 =C2=A0bf lv d st colorbuffer dp s=
t=C2=A0 =C2=A0supported \n&quot;);<br>
+-=C2=A0 =C2=A0printf(&quot;=C2=A0 id sz=C2=A0 l b ro=C2=A0 r=C2=A0 g=C2=A0=
 b=C2=A0 a th cl=C2=A0 =C2=A0surfaces=C2=A0 \n&quot;);<br>
+-=C2=A0 =C2=A0printf(&quot;----------------------------------------------\=
n&quot;);<br>
+-=C2=A0 =C2=A0for (i =3D 0; i &lt; numConfigs; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 EGLint id, size, level;<br>
+-=C2=A0 =C2=A0 =C2=A0 EGLint red, green, blue, alpha;<br>
+-=C2=A0 =C2=A0 =C2=A0 EGLint depth, stencil;<br>
+-=C2=A0 =C2=A0 =C2=A0 EGLint surfaces;<br>
+-=C2=A0 =C2=A0 =C2=A0 EGLint doubleBuf =3D 1, stereo =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 char surfString[100] =3D &quot;&quot;;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_CONFIG_ID, &am=
p;id);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_BUFFER_SIZE, &=
amp;size);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_LEVEL, &amp;le=
vel);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_RED_SIZE, &amp=
;red);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_GREEN_SIZE, &a=
mp;green);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_BLUE_SIZE, &am=
p;blue);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_ALPHA_SIZE, &a=
mp;alpha);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_DEPTH_SIZE, &a=
mp;depth);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_STENCIL_SIZE, =
&amp;stencil);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_SURFACE_TYPE, =
&amp;surfaces);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 if (surfaces &amp; EGL_WINDOW_BIT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(surfString, &quot;win,&quot;);<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 if (surfaces &amp; EGL_PBUFFER_BIT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(surfString, &quot;pb,&quot;);<br=
>
+-=C2=A0 =C2=A0 =C2=A0 if (surfaces &amp; EGL_PIXMAP_BIT)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(surfString, &quot;pix,&quot;);<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 if (strlen(surfString) &gt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0surfString[strlen(surfString) - 1] =3D =
0;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;0x%02x %2d %2d %c=C2=A0 %c %2d %2d %2d =
%2d %2d %2d=C2=A0 =C2=A0%-12s\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id, size, level,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0doubleBuf ? &#39;y&#39; :=
 &#39;.&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stereo ? &#39;y&#39; : &#=
39;.&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0red, green, blue, alpha,<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depth, stencil, surfStrin=
g);<br>
+-=C2=A0 =C2=A0}<br>
+-}<br>
+-<br>
+-<br>
+-<br>
+-int<br>
+-main(int argc, char *argv[])<br>
+-{<br>
+-=C2=A0 =C2=A0int maj, min;<br>
+-=C2=A0 =C2=A0EGLContext ctx;<br>
+-=C2=A0 =C2=A0EGLSurface pbuffer;<br>
+-=C2=A0 =C2=A0EGLConfig *configs;<br>
+-=C2=A0 =C2=A0EGLint numConfigs;<br>
+-=C2=A0 =C2=A0EGLBoolean b;<br>
+-=C2=A0 =C2=A0const EGLint pbufAttribs[] =3D {<br>
+-=C2=A0 =C2=A0 =C2=A0 EGL_WIDTH, 500,<br>
+-=C2=A0 =C2=A0 =C2=A0 EGL_HEIGHT, 500,<br>
+-=C2=A0 =C2=A0 =C2=A0 EGL_NONE<br>
+-=C2=A0 =C2=A0};<br>
+-<br>
+-=C2=A0 =C2=A0EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);<br>
+-=C2=A0 =C2=A0assert(d);<br>
+-<br>
+-=C2=A0 =C2=A0if (!eglInitialize(d, &amp;maj, &amp;min)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;demo: eglInitialize failed\n&quot;);<br=
>
+-=C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0printf(&quot;EGL version =3D %d.%d\n&quot;, maj, min);<br>
+-=C2=A0 =C2=A0printf(&quot;EGL_VENDOR =3D %s\n&quot;, eglQueryString(d, EG=
L_VENDOR));<br>
+-<br>
+-=C2=A0 =C2=A0if (!strstr(eglQueryString(d, EGL_EXTENSIONS),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;EGL_MESA_scr=
een_surface&quot;)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;EGL_MESA_screen_surface is not supporte=
d\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0eglGetConfigs(d, NULL, 0, &amp;numConfigs);<br>
+-=C2=A0 =C2=A0configs =3D malloc(sizeof(*configs) *numConfigs);<br>
+-=C2=A0 =C2=A0eglGetConfigs(d, configs, numConfigs, &amp;numConfigs);<br>
+-<br>
+-=C2=A0 =C2=A0PrintConfigs(d, configs, numConfigs);<br>
+-<br>
+-=C2=A0 =C2=A0eglBindAPI(EGL_OPENGL_API);<br>
+-=C2=A0 =C2=A0ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, NULL=
);<br>
+-=C2=A0 =C2=A0if (ctx =3D=3D EGL_NO_CONTEXT) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;failed to create context\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0pbuffer =3D eglCreatePbufferSurface(d, configs[0], pbufAttri=
bs);<br>
+-=C2=A0 =C2=A0if (pbuffer =3D=3D EGL_NO_SURFACE) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;failed to create pbuffer\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0free(configs);<br>
+-<br>
+-=C2=A0 =C2=A0b =3D eglMakeCurrent(d, pbuffer, pbuffer, ctx);<br>
+-=C2=A0 =C2=A0if (!b) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;make current failed\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0b =3D eglMakeCurrent(d, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_=
NO_CONTEXT);<br>
+-<br>
+-=C2=A0 =C2=A0TestScreens(d);<br>
+-<br>
+-=C2=A0 =C2=A0eglDestroySurface(d, pbuffer);<br>
+-=C2=A0 =C2=A0eglDestroyContext(d, ctx);<br>
+-=C2=A0 =C2=A0eglTerminate(d);<br>
+-<br>
+-=C2=A0 =C2=A0return 0;<br>
+-}<br>
+diff --git a/src/egl/opengl/demo2.c b/src/egl/opengl/demo2.c<br>
+deleted file mode 100644<br>
+index bfef59e..0000000<br>
+--- a/src/egl/opengl/demo2.c<br>
++++ /dev/null<br>
+@@ -1,221 +0,0 @@<br>
+-/*<br>
+- * Exercise EGL API functions<br>
+- */<br>
+-<br>
+-#define EGL_EGLEXT_PROTOTYPES<br>
+-<br>
+-#include &lt;assert.h&gt;<br>
+-#include &lt;stdio.h&gt;<br>
+-#include &lt;stdlib.h&gt;<br>
+-#include &lt;string.h&gt;<br>
+-#include &lt;unistd.h&gt;<br>
+-<br>
+-#include &lt;EGL/egl.h&gt;<br>
+-#include &lt;EGL/eglext.h&gt;<br>
+-#include &quot;gl_wrap.h&quot;<br>
+-<br>
+-/*#define FRONTBUFFER*/<br>
+-<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-static void _subset_Rectf(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2,=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 GLfloat r, GLfloat g, GLfloat b)<br>
+-{<br>
+-=C2=A0 =C2=A0GLfloat v[4][2], c[4][4];<br>
+-=C2=A0 =C2=A0int i;<br>
+-<br>
+-=C2=A0 =C2=A0v[0][0] =3D x1;=C2=A0 =C2=A0v[0][1] =3D y1;<br>
+-=C2=A0 =C2=A0v[1][0] =3D x2;=C2=A0 =C2=A0v[1][1] =3D y1;<br>
+-=C2=A0 =C2=A0v[2][0] =3D x2;=C2=A0 =C2=A0v[2][1] =3D y2;<br>
+-=C2=A0 =C2=A0v[3][0] =3D x1;=C2=A0 =C2=A0v[3][1] =3D y2;<br>
+-<br>
+-=C2=A0 =C2=A0for (i =3D 0; i &lt; 4; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 c[i][0] =3D r;<br>
+-=C2=A0 =C2=A0 =C2=A0 c[i][1] =3D g;<br>
+-=C2=A0 =C2=A0 =C2=A0 c[i][2] =3D b;<br>
+-=C2=A0 =C2=A0 =C2=A0 c[i][3] =3D 1.0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0glVertexPointer(2, GL_FLOAT, 0, v);<br>
+-=C2=A0 =C2=A0glColorPointer(4, GL_FLOAT, 0, c);<br>
+-=C2=A0 =C2=A0glEnableClientState(GL_VERTEX_ARRAY);<br>
+-=C2=A0 =C2=A0glEnableClientState(GL_COLOR_ARRAY);<br>
+-<br>
+-=C2=A0 =C2=A0glDrawArrays(GL_TRIANGLE_FAN, 0, 4);<br>
+-<br>
+-=C2=A0 =C2=A0glDisableClientState(GL_VERTEX_ARRAY);<br>
+-=C2=A0 =C2=A0glDisableClientState(GL_COLOR_ARRAY);<br>
+-}<br>
+-<br>
+-<br>
+-static void redraw(EGLDisplay dpy, EGLSurface surf, int rot)<br>
+-{<br>
+-=C2=A0 =C2=A0GLfloat r, g, b;<br>
+-<br>
+-=C2=A0 =C2=A0printf(&quot;Redraw event\n&quot;);<br>
+-<br>
+-=C2=A0 =C2=A0glClearColor( rand()/(float)RAND_MAX,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rand()/(float)RAND=
_MAX,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rand()/(float)RAND=
_MAX,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01);<br>
+-<br>
+-=C2=A0 =C2=A0glClear( GL_COLOR_BUFFER_BIT );<br>
+-<br>
+-=C2=A0 =C2=A0r =3D rand()/(float)RAND_MAX;<br>
+-=C2=A0 =C2=A0g =3D rand()/(float)RAND_MAX;<br>
+-=C2=A0 =C2=A0b =3D rand()/(float)RAND_MAX;<br>
+-<br>
+-=C2=A0 =C2=A0glPushMatrix();<br>
+-=C2=A0 =C2=A0glRotatef(rot, 0, 0, 1);<br>
+-=C2=A0 =C2=A0glScalef(.5, .5, .5);<br>
+-=C2=A0 =C2=A0_subset_Rectf( -1, -1, 1, 1, r, g, b );<br>
+-=C2=A0 =C2=A0glPopMatrix();<br>
+-<br>
+-#ifdef FRONTBUFFER<br>
+-=C2=A0 =C2=A0glFlush();<br>
+-#else<br>
+-=C2=A0 =C2=A0eglSwapBuffers( dpy, surf );<br>
+-#endif<br>
+-=C2=A0 =C2=A0glFinish();<br>
+-}<br>
+-<br>
+-<br>
+-/**<br>
+- * Test EGL_MESA_screen_surface functions<br>
+- */<br>
+-static void<br>
+-TestScreens(EGLDisplay dpy)<br>
+-{<br>
+-#define MAX 8<br>
+-=C2=A0 =C2=A0EGLScreenMESA screens[MAX];<br>
+-=C2=A0 =C2=A0EGLint numScreens;<br>
+-=C2=A0 =C2=A0EGLint i;<br>
+-<br>
+-=C2=A0 =C2=A0eglGetScreensMESA(dpy, screens, MAX, &amp;numScreens);<br>
+-=C2=A0 =C2=A0printf(&quot;Found %d screens\n&quot;, numScreens);<br>
+-=C2=A0 =C2=A0for (i =3D 0; i &lt; numScreens; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot; Screen %d handle: %d\n&quot;, i, (int)=
 screens[i]);<br>
+-=C2=A0 =C2=A0}<br>
+-}<br>
+-#endif<br>
+-<br>
+-int<br>
+-main(int argc, char *argv[])<br>
+-{<br>
+-=C2=A0 =C2=A0int maj, min;<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0EGLContext ctx;<br>
+-=C2=A0 =C2=A0EGLSurface pbuffer, screen_surf;<br>
+-=C2=A0 =C2=A0EGLConfig configs[10];<br>
+-=C2=A0 =C2=A0EGLint numConfigs, i;<br>
+-=C2=A0 =C2=A0EGLBoolean b;<br>
+-=C2=A0 =C2=A0const EGLint pbufAttribs[] =3D {<br>
+-=C2=A0 =C2=A0 =C2=A0 EGL_WIDTH, 500,<br>
+-=C2=A0 =C2=A0 =C2=A0 EGL_HEIGHT, 500,<br>
+-=C2=A0 =C2=A0 =C2=A0 EGL_NONE<br>
+-=C2=A0 =C2=A0};<br>
+-=C2=A0 =C2=A0EGLint screenAttribs[32];<br>
+-=C2=A0 =C2=A0EGLModeMESA mode;<br>
+-=C2=A0 =C2=A0EGLScreenMESA screen;<br>
+-=C2=A0 =C2=A0EGLint count;<br>
+-#endif<br>
+-<br>
+-=C2=A0 =C2=A0EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);<br>
+-=C2=A0 =C2=A0assert(d);<br>
+-<br>
+-=C2=A0 =C2=A0if (!eglInitialize(d, &amp;maj, &amp;min)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;demo: eglInitialize failed\n&quot;);<br=
>
+-=C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0printf(&quot;EGL version =3D %d.%d\n&quot;, maj, min);<br>
+-=C2=A0 =C2=A0printf(&quot;EGL_VENDOR =3D %s\n&quot;, eglQueryString(d, EG=
L_VENDOR));<br>
+-=C2=A0 =C2=A0if (!strstr(eglQueryString(d, EGL_EXTENSIONS),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;EGL_MESA_scr=
een_surface&quot;)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;EGL_MESA_screen_surface is not supporte=
d\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0eglGetConfigs(d, configs, 10, &amp;numConfigs);<br>
+-=C2=A0 =C2=A0printf(&quot;Got %d EGL configs:\n&quot;, numConfigs);<br>
+-=C2=A0 =C2=A0for (i =3D 0; i &lt; numConfigs; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 EGLint id, red, depth;<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_CONFIG_ID, &am=
p;id);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_RED_SIZE, &amp=
;red);<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetConfigAttrib(d, configs[i], EGL_DEPTH_SIZE, &a=
mp;depth);<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;%2d:=C2=A0 Red Size =3D %d=C2=A0 Depth =
Size =3D %d\n&quot;, id, red, depth);<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0eglGetScreensMESA(d, &amp;screen, 1, &amp;count);<br>
+-=C2=A0 =C2=A0eglGetModesMESA(d, screen, &amp;mode, 1, &amp;count);<br>
+-<br>
+-=C2=A0 =C2=A0eglBindAPI(EGL_OPENGL_API);<br>
+-=C2=A0 =C2=A0ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, NULL=
);<br>
+-=C2=A0 =C2=A0if (ctx =3D=3D EGL_NO_CONTEXT) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;failed to create context\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0pbuffer =3D eglCreatePbufferSurface(d, configs[0], pbufAttri=
bs);<br>
+-=C2=A0 =C2=A0if (pbuffer =3D=3D EGL_NO_SURFACE) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;failed to create pbuffer\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0b =3D eglMakeCurrent(d, pbuffer, pbuffer, ctx);<br>
+-=C2=A0 =C2=A0if (!b) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;make current failed\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0b =3D eglMakeCurrent(d, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_=
NO_CONTEXT);<br>
+-<br>
+-=C2=A0 =C2=A0i =3D 0;<br>
+-=C2=A0 =C2=A0screenAttribs[i++] =3D EGL_WIDTH;<br>
+-=C2=A0 =C2=A0eglGetModeAttribMESA(d, mode, EGL_WIDTH, &amp;screenAttribs[=
i++]);<br>
+-=C2=A0 =C2=A0screenAttribs[i++] =3D EGL_HEIGHT;<br>
+-=C2=A0 =C2=A0eglGetModeAttribMESA(d, mode, EGL_HEIGHT, &amp;screenAttribs=
[i++]);<br>
+-=C2=A0 =C2=A0screenAttribs[i] =3D EGL_NONE;<br>
+-<br>
+-=C2=A0 =C2=A0screen_surf =3D eglCreateScreenSurfaceMESA(d, configs[0], sc=
reenAttribs);<br>
+-=C2=A0 =C2=A0if (screen_surf =3D=3D EGL_NO_SURFACE) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;failed to create screen surface\n&quot;=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0eglShowScreenSurfaceMESA(d, screen, screen_surf, mode);<br>
+-<br>
+-=C2=A0 =C2=A0b =3D eglMakeCurrent(d, screen_surf, screen_surf, ctx);<br>
+-=C2=A0 =C2=A0if (!b) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;make current failed\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0glViewport(0, 0, 1024, 768);<br>
+-<br>
+-=C2=A0 =C2=A0glClearColor( 0,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.0,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01);<br>
+-<br>
+-=C2=A0 =C2=A0glClear( GL_COLOR_BUFFER_BIT );<br>
+-<br>
+-<br>
+-=C2=A0 =C2=A0TestScreens(d);<br>
+-<br>
+-=C2=A0 =C2=A0glShadeModel( GL_FLAT );<br>
+-<br>
+-=C2=A0 =C2=A0for (i =3D 0; i &lt; 6; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 redraw(d, screen_surf, i*10 );<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;sleep(1)\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 sleep(1);<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0eglDestroySurface(d, pbuffer);<br>
+-=C2=A0 =C2=A0eglDestroyContext(d, ctx);<br>
+-=C2=A0 =C2=A0eglTerminate(d);<br>
+-#endif<br>
+-<br>
+-=C2=A0 =C2=A0return 0;<br>
+-}<br>
+diff --git a/src/egl/opengl/demo3.c b/src/egl/opengl/demo3.c<br>
+deleted file mode 100644<br>
+index 31b5d8b..0000000<br>
+--- a/src/egl/opengl/demo3.c<br>
++++ /dev/null<br>
+@@ -1,652 +0,0 @@<br>
+-/*<br>
+- * Exercise EGL API functions<br>
+- */<br>
+-<br>
+-#define EGL_EGLEXT_PROTOTYPES<br>
+-<br>
+-#include &lt;EGL/egl.h&gt;<br>
+-#include &lt;EGL/eglext.h&gt;<br>
+-#include &quot;gl_wrap.h&quot;<br>
+-#include &lt;assert.h&gt;<br>
+-#include &lt;stdio.h&gt;<br>
+-#include &lt;stdlib.h&gt;<br>
+-#include &lt;string.h&gt;<br>
+-#include &lt;unistd.h&gt;<br>
+-<br>
+-<br>
+-<br>
+-#define PIXEL_CENTER(x) ((long)(x) + 0.5)<br>
+-<br>
+-#define GAP 10<br>
+-#define ROWS 3<br>
+-#define COLS 4<br>
+-<br>
+-#define OPENGL_WIDTH 48<br>
+-#define OPENGL_HEIGHT 13<br>
+-<br>
+-<br>
+-GLenum rgb, doubleBuffer, windType;<br>
+-GLint windW, windH;<br>
+-<br>
+-GLenum mode1, mode2;<br>
+-GLint boxW, boxH;<br>
+-GLubyte OpenGL_bits[] =3D {<br>
+-=C2=A0 =C2=A00x00, 0x03, 0x00, 0x00, 0x00, 0x00,<br>
+-=C2=A0 =C2=A00x7f, 0xfb, 0xff, 0xff, 0xff, 0x01,<br>
+-=C2=A0 =C2=A00x7f, 0xfb, 0xff, 0xff, 0xff, 0x01,<br>
+-=C2=A0 =C2=A00x00, 0x03, 0x00, 0x00, 0x00, 0x00,<br>
+-=C2=A0 =C2=A00x3e, 0x8f, 0xb7, 0xf9, 0xfc, 0x01,<br>
+-=C2=A0 =C2=A00x63, 0xdb, 0xb0, 0x8d, 0x0d, 0x00,<br>
+-=C2=A0 =C2=A00x63, 0xdb, 0xb7, 0x8d, 0x0d, 0x00,<br>
+-=C2=A0 =C2=A00x63, 0xdb, 0xb6, 0x8d, 0x0d, 0x00,<br>
+-=C2=A0 =C2=A00x63, 0x8f, 0xf3, 0xcc, 0x0d, 0x00,<br>
+-=C2=A0 =C2=A00x63, 0x00, 0x00, 0x0c, 0x4c, 0x0a,<br>
+-=C2=A0 =C2=A00x63, 0x00, 0x00, 0x0c, 0x4c, 0x0e,<br>
+-=C2=A0 =C2=A00x63, 0x00, 0x00, 0x8c, 0xed, 0x0e,<br>
+-=C2=A0 =C2=A00x3e, 0x00, 0x00, 0xf8, 0x0c, 0x00,<br>
+-};<br>
+-<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-static void Init(void)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 mode1 =3D GL_TRUE;<br>
+-=C2=A0 =C2=A0 mode2 =3D GL_TRUE;<br>
+-}<br>
+-<br>
+-static void Reshape(int width, int height)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 windW =3D (GLint)width;<br>
+-=C2=A0 =C2=A0 windH =3D (GLint)height;<br>
+-}<br>
+-<br>
+-#if 0<br>
+-static void RotateColorMask(void)<br>
+-{<br>
+-=C2=A0 =C2=A0 static GLint rotation =3D 0;<br>
+-<br>
+-=C2=A0 =C2=A0 rotation =3D (rotation + 1) &amp; 0x3;<br>
+-=C2=A0 =C2=A0 switch (rotation) {<br>
+-=C2=A0 =C2=A0 =C2=A0 case 0:<br>
+-=C2=A0 =C2=A0 =C2=A0 glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glIndexMask( 0xff );<br>
+-=C2=A0 =C2=A0 =C2=A0 break;<br>
+-=C2=A0 =C2=A0 =C2=A0 case 1:<br>
+-=C2=A0 =C2=A0 =C2=A0 glColorMask(GL_FALSE, GL_TRUE, GL_TRUE, GL_TRUE);<br=
>
+-=C2=A0 =C2=A0 =C2=A0 glIndexMask(0xFE);<br>
+-=C2=A0 =C2=A0 =C2=A0 break;<br>
+-=C2=A0 =C2=A0 =C2=A0 case 2:<br>
+-=C2=A0 =C2=A0 =C2=A0 glColorMask(GL_TRUE, GL_FALSE, GL_TRUE, GL_TRUE);<br=
>
+-=C2=A0 =C2=A0 =C2=A0 glIndexMask(0xFD);<br>
+-=C2=A0 =C2=A0 =C2=A0 break;<br>
+-=C2=A0 =C2=A0 =C2=A0 case 3:<br>
+-=C2=A0 =C2=A0 =C2=A0 glColorMask(GL_TRUE, GL_TRUE, GL_FALSE, GL_TRUE);<br=
>
+-=C2=A0 =C2=A0 =C2=A0 glIndexMask(0xFB);<br>
+-=C2=A0 =C2=A0 =C2=A0 break;<br>
+-=C2=A0 =C2=A0 }<br>
+-}<br>
+-#endif<br>
+-<br>
+-static void Viewport(GLint row, GLint column)<br>
+-{<br>
+-=C2=A0 =C2=A0 GLint x, y;<br>
+-<br>
+-=C2=A0 =C2=A0 boxW =3D (windW - (COLS + 1) * GAP) / COLS;<br>
+-=C2=A0 =C2=A0 boxH =3D (windH - (ROWS + 1) * GAP) / ROWS;<br>
+-<br>
+-=C2=A0 =C2=A0 x =3D GAP + column * (boxW + GAP);<br>
+-=C2=A0 =C2=A0 y =3D GAP + row * (boxH + GAP);<br>
+-<br>
+-=C2=A0 =C2=A0 glViewport(x, y, boxW, boxH);<br>
+-<br>
+-=C2=A0 =C2=A0 glMatrixMode(GL_PROJECTION);<br>
+-=C2=A0 =C2=A0 glLoadIdentity();<br>
+-=C2=A0 =C2=A0 glOrtho(-boxW/2, boxW/2, -boxH/2, boxH/2, 0.0, 1.0);<br>
+-=C2=A0 =C2=A0 glMatrixMode(GL_MODELVIEW);<br>
+-<br>
+-=C2=A0 =C2=A0 glEnable(GL_SCISSOR_TEST);<br>
+-=C2=A0 =C2=A0 glScissor(x, y, boxW, boxH);<br>
+-}<br>
+-<br>
+-enum {<br>
+-=C2=A0 =C2=A0 COLOR_BLACK =3D 0,<br>
+-=C2=A0 =C2=A0 COLOR_RED,<br>
+-=C2=A0 =C2=A0 COLOR_GREEN,<br>
+-=C2=A0 =C2=A0 COLOR_YELLOW,<br>
+-=C2=A0 =C2=A0 COLOR_BLUE,<br>
+-=C2=A0 =C2=A0 COLOR_MAGENTA,<br>
+-=C2=A0 =C2=A0 COLOR_CYAN,<br>
+-=C2=A0 =C2=A0 COLOR_WHITE<br>
+-};<br>
+-<br>
+-static float RGBMap[9][3] =3D {<br>
+-=C2=A0 =C2=A0 {0, 0, 0},<br>
+-=C2=A0 =C2=A0 {1, 0, 0},<br>
+-=C2=A0 =C2=A0 {0, 1, 0},<br>
+-=C2=A0 =C2=A0 {1, 1, 0},<br>
+-=C2=A0 =C2=A0 {0, 0, 1},<br>
+-=C2=A0 =C2=A0 {1, 0, 1},<br>
+-=C2=A0 =C2=A0 {0, 1, 1},<br>
+-=C2=A0 =C2=A0 {1, 1, 1},<br>
+-=C2=A0 =C2=A0 {0.5, 0.5, 0.5}<br>
+-};<br>
+-<br>
+-static void SetColor(int c)<br>
+-{<br>
+-=C2=A0 =C2=A0 =C2=A0glColor3fv(RGBMap[c]);<br>
+-}<br>
+-<br>
+-static void Point(void)<br>
+-{<br>
+-=C2=A0 =C2=A0 GLint i;<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_POINTS);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_WHITE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 for (i =3D 1; i &lt; 8; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GLint j =3D i * 2;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLACK+i);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2i(-j, -j);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2i(-j, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2i(-j, j);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2i(0, j);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2i(j, j);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2i(j, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2i(j, -j);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2i(0, -j);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-}<br>
+-<br>
+-static void Lines(void)<br>
+-{<br>
+-=C2=A0 =C2=A0 GLint i;<br>
+-<br>
+-=C2=A0 =C2=A0 glPushMatrix();<br>
+-<br>
+-=C2=A0 =C2=A0 glTranslatef(-12, 0, 0);<br>
+-=C2=A0 =C2=A0 for (i =3D 1; i &lt; 8; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLACK+i);<br>
+-=C2=A0 =C2=A0 =C2=A0 glBegin(GL_LINES);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/4, -boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/4, boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 glEnd();<br>
+-=C2=A0 =C2=A0 =C2=A0 glTranslatef(4, 0, 0);<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 glPopMatrix();<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_LINES);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-}<br>
+-<br>
+-static void LineStrip(void)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_LINE_STRIP);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_RED);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(-boxH=
/4));<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(boxH/=
4));<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(boxH/4=
));<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_WHITE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(-boxH/=
4));<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_LINE_STRIP);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-}<br>
+-<br>
+-static void LineLoop(void)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_LINE_LOOP);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_RED);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(-boxH=
/4));<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(-boxW/4), PIXEL_CENTER(boxH/=
4));<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(boxH/4=
));<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_WHITE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(boxW/4), PIXEL_CENTER(-boxH/=
4));<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-<br>
+-=C2=A0 =C2=A0 glEnable(GL_LOGIC_OP);<br>
+-=C2=A0 =C2=A0 glLogicOp(GL_XOR);<br>
+-<br>
+-=C2=A0 =C2=A0 glEnable(GL_BLEND);<br>
+-=C2=A0 =C2=A0 glBlendFunc(GL_ONE, GL_ONE);<br>
+-<br>
+-=C2=A0 =C2=A0 SetColor(COLOR_MAGENTA);<br>
+-=C2=A0 =C2=A0 glBegin(GL_LINE_LOOP);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(-boxH=
/8));<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(boxH/=
8));<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-=C2=A0 =C2=A0 glBegin(GL_LINE_LOOP);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(-boxW/8), PIXEL_CENTER(boxH/=
8+5));<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2f(PIXEL_CENTER(boxW/8), PIXEL_CENTER(boxH/8=
+5));<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-=C2=A0 =C2=A0 glDisable(GL_LOGIC_OP);<br>
+-=C2=A0 =C2=A0 glDisable(GL_BLEND);<br>
+-<br>
+-=C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 glBegin(GL_POINTS);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_LINE_LOOP);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-}<br>
+-<br>
+-static void Bitmap(void)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_LINES);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/2, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/2, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, -boxH/2);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, boxH/2);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_RED);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, -3);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, -3+OPENGL_HEIGHT);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, -3);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(OPENGL_WIDTH, -3);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-<br>
+-=C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-<br>
+-=C2=A0 =C2=A0 glPixelStorei(GL_UNPACK_LSB_FIRST, GL_TRUE);<br>
+-=C2=A0 =C2=A0 glPixelStorei(GL_UNPACK_ALIGNMENT, 1);<br>
+-<br>
+-=C2=A0 =C2=A0 glRasterPos2i(0, 0);<br>
+-=C2=A0 =C2=A0 glBitmap(OPENGL_WIDTH, OPENGL_HEIGHT, 0, 3, 0.0, 0.0, OpenG=
L_bits);<br>
+-}<br>
+-<br>
+-static void Triangles(void)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_TRIANGLES);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/4, -boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_RED);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/8, -boxH/16);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/8, -boxH/16);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/4, boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_RED);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/8, boxH/16);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/8, boxH/16);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_TRIANGLES);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-100, 100);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-}<br>
+-<br>
+-static void TriangleStrip(void)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_TRIANGLE_STRIP);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/4, -boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_RED);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/4, boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, -boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_WHITE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_CYAN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/4, -boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_YELLOW);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/4, boxH/4);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_TRIANGLE_STRIP);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-100, 100);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-}<br>
+-<br>
+-static void TriangleFan(void)<br>
+-{<br>
+-=C2=A0 =C2=A0 GLint vx[8][2];<br>
+-=C2=A0 =C2=A0 GLint x0, y0, x1, y1, x2, y2, x3, y3;<br>
+-=C2=A0 =C2=A0 GLint i;<br>
+-<br>
+-=C2=A0 =C2=A0 y0 =3D -boxH/4;<br>
+-=C2=A0 =C2=A0 y1 =3D y0 + boxH/2/3;<br>
+-=C2=A0 =C2=A0 y2 =3D y1 + boxH/2/3;<br>
+-=C2=A0 =C2=A0 y3 =3D boxH/4;<br>
+-=C2=A0 =C2=A0 x0 =3D -boxW/4;<br>
+-=C2=A0 =C2=A0 x1 =3D x0 + boxW/2/3;<br>
+-=C2=A0 =C2=A0 x2 =3D x1 + boxW/2/3;<br>
+-=C2=A0 =C2=A0 x3 =3D boxW/4;<br>
+-<br>
+-=C2=A0 =C2=A0 vx[0][0] =3D x0; vx[0][1] =3D y1;<br>
+-=C2=A0 =C2=A0 vx[1][0] =3D x0; vx[1][1] =3D y2;<br>
+-=C2=A0 =C2=A0 vx[2][0] =3D x1; vx[2][1] =3D y3;<br>
+-=C2=A0 =C2=A0 vx[3][0] =3D x2; vx[3][1] =3D y3;<br>
+-=C2=A0 =C2=A0 vx[4][0] =3D x3; vx[4][1] =3D y2;<br>
+-=C2=A0 =C2=A0 vx[5][0] =3D x3; vx[5][1] =3D y1;<br>
+-=C2=A0 =C2=A0 vx[6][0] =3D x2; vx[6][1] =3D y0;<br>
+-=C2=A0 =C2=A0 vx[7][0] =3D x1; vx[7][1] =3D y0;<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_TRIANGLE_FAN);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_WHITE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 8; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_WHITE-i);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2iv(vx[i]);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_TRIANGLE_FAN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-100, 100);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-}<br>
+-<br>
+-static void Rect(void)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 glRecti(-boxW/4, -boxH/4, boxW/4, boxH/4);<br>
+-}<br>
+-<br>
+-static void PolygonFunc(void)<br>
+-{<br>
+-=C2=A0 =C2=A0 GLint vx[8][2];<br>
+-=C2=A0 =C2=A0 GLint x0, y0, x1, y1, x2, y2, x3, y3;<br>
+-=C2=A0 =C2=A0 GLint i;<br>
+-<br>
+-=C2=A0 =C2=A0 y0 =3D -boxH/4;<br>
+-=C2=A0 =C2=A0 y1 =3D y0 + boxH/2/3;<br>
+-=C2=A0 =C2=A0 y2 =3D y1 + boxH/2/3;<br>
+-=C2=A0 =C2=A0 y3 =3D boxH/4;<br>
+-=C2=A0 =C2=A0 x0 =3D -boxW/4;<br>
+-=C2=A0 =C2=A0 x1 =3D x0 + boxW/2/3;<br>
+-=C2=A0 =C2=A0 x2 =3D x1 + boxW/2/3;<br>
+-=C2=A0 =C2=A0 x3 =3D boxW/4;<br>
+-<br>
+-=C2=A0 =C2=A0 vx[0][0] =3D x0; vx[0][1] =3D y1;<br>
+-=C2=A0 =C2=A0 vx[1][0] =3D x0; vx[1][1] =3D y2;<br>
+-=C2=A0 =C2=A0 vx[2][0] =3D x1; vx[2][1] =3D y3;<br>
+-=C2=A0 =C2=A0 vx[3][0] =3D x2; vx[3][1] =3D y3;<br>
+-=C2=A0 =C2=A0 vx[4][0] =3D x3; vx[4][1] =3D y2;<br>
+-=C2=A0 =C2=A0 vx[5][0] =3D x3; vx[5][1] =3D y1;<br>
+-=C2=A0 =C2=A0 vx[6][0] =3D x2; vx[6][1] =3D y0;<br>
+-=C2=A0 =C2=A0 vx[7][0] =3D x1; vx[7][1] =3D y0;<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_POLYGON);<br>
+-=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 8; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_WHITE-i);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glVertex2iv(vx[i]);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_POLYGON);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(100, 100);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-}<br>
+-<br>
+-static void Quads(void)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_QUADS);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/4, -boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_RED);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/8, -boxH/16);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/8, -boxH/16);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_WHITE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/4, -boxH/4);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/4, boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_RED);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/8, boxH/16);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/8, boxH/16);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_WHITE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/4, boxH/4);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_QUADS);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(100, 100);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-100, 100);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-}<br>
+-<br>
+-static void QuadStrip(void)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_QUAD_STRIP);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_GREEN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/4, -boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_RED);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-boxW/4, boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_BLUE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, -boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_WHITE);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_CYAN);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/4, -boxH/4);<br>
+-=C2=A0 =C2=A0 =C2=A0 SetColor(COLOR_YELLOW);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(boxW/4, boxH/4);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-<br>
+-=C2=A0 =C2=A0 glBegin(GL_QUAD_STRIP);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(0, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(100, 100);<br>
+-=C2=A0 =C2=A0 =C2=A0 glVertex2i(-100, 100);<br>
+-=C2=A0 =C2=A0 glEnd();<br>
+-}<br>
+-<br>
+-static void Draw(EGLDisplay dpy, EGLSurface surf)<br>
+-{<br>
+-<br>
+-=C2=A0 =C2=A0 glViewport(0, 0, windW, windH);<br>
+-=C2=A0 =C2=A0 glDisable(GL_SCISSOR_TEST);<br>
+-<br>
+-=C2=A0 =C2=A0 glPushAttrib(GL_COLOR_BUFFER_BIT);<br>
+-<br>
+-=C2=A0 =C2=A0 glColorMask(1, 1, 1, 1);<br>
+-=C2=A0 =C2=A0 glIndexMask(~0);<br>
+-<br>
+-=C2=A0 =C2=A0 glClearColor(0.0, 0.0, 0.0, 0.0);<br>
+-=C2=A0 =C2=A0 glClear(GL_COLOR_BUFFER_BIT);<br>
+-<br>
+-=C2=A0 =C2=A0 glPopAttrib();<br>
+-<br>
+-=C2=A0 =C2=A0 if (mode1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 glShadeModel(GL_SMOOTH);<br>
+-=C2=A0 =C2=A0 } else {<br>
+-=C2=A0 =C2=A0 =C2=A0 glShadeModel(GL_FLAT);<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 if (mode2) {<br>
+-=C2=A0 =C2=A0 =C2=A0 glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);<br>
+-=C2=A0 =C2=A0 } else {<br>
+-=C2=A0 =C2=A0 =C2=A0 glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 Viewport(0, 0); Point();<br>
+-=C2=A0 =C2=A0 Viewport(0, 1); Lines();<br>
+-=C2=A0 =C2=A0 Viewport(0, 2); LineStrip();<br>
+-=C2=A0 =C2=A0 Viewport(0, 3); LineLoop();<br>
+-<br>
+-=C2=A0 =C2=A0 Viewport(1, 0); Bitmap();<br>
+-<br>
+-=C2=A0 =C2=A0 Viewport(1, 1); TriangleFan();<br>
+-=C2=A0 =C2=A0 Viewport(1, 2); Triangles();<br>
+-=C2=A0 =C2=A0 Viewport(1, 3); TriangleStrip();<br>
+-<br>
+-=C2=A0 =C2=A0 Viewport(2, 0); Rect();<br>
+-=C2=A0 =C2=A0 Viewport(2, 1); PolygonFunc();<br>
+-=C2=A0 =C2=A0 Viewport(2, 2); Quads();<br>
+-=C2=A0 =C2=A0 Viewport(2, 3); QuadStrip();<br>
+-<br>
+-=C2=A0 =C2=A0 glFlush();<br>
+-<br>
+-=C2=A0 =C2=A0 if (doubleBuffer) {<br>
+-=C2=A0 =C2=A0 =C2=A0 eglSwapBuffers(dpy, surf);<br>
+-=C2=A0 =C2=A0 }<br>
+-}<br>
+-<br>
+-static void<br>
+-write_ppm(const char *filename, const GLubyte *buffer, int width, int hei=
ght)<br>
+-{<br>
+-=C2=A0 =C2=A0const int binary =3D 0;<br>
+-=C2=A0 =C2=A0FILE *f =3D fopen( filename, &quot;w&quot; );<br>
+-=C2=A0 =C2=A0if (f) {<br>
+-=C2=A0 =C2=A0 =C2=A0 int i, x, y;<br>
+-=C2=A0 =C2=A0 =C2=A0 const GLubyte *ptr =3D buffer;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (binary) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(f,&quot;P6\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(f,&quot;# ppm-file created by o=
sdemo.c\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(f,&quot;%i %i\n&quot;, width,he=
ight);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(f,&quot;255\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(f);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D fopen( filename, &quot;ab&quot; )=
;=C2=A0 /* reopen in binary append mode */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (y=3Dheight-1; y&gt;=3D0; y--) {<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (x=3D0; x&lt;width; x++) {<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D (y*width + x=
) * 4;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fputc(ptr[i], f);=
=C2=A0 =C2=A0/* write red */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fputc(ptr[i+1], f)=
; /* write green */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fputc(ptr[i+2], f)=
; /* write blue */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*ASCII*/<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int counter =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(f,&quot;P3\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(f,&quot;# ascii ppm file create=
d by osdemo.c\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(f,&quot;%i %i\n&quot;, width, h=
eight);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(f,&quot;255\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (y=3Dheight-1; y&gt;=3D0; y--) {<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (x=3D0; x&lt;width; x++) {<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D (y*width + x=
) * 4;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(f, &quot; =
%3d %3d %3d&quot;, ptr[i], ptr[i+1], ptr[i+2]);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter++;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (counter % 5 =
=3D=3D 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(f,=
 &quot;\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 fclose(f);<br>
+-=C2=A0 =C2=A0}<br>
+-}<br>
+-#endif<br>
+-<br>
+-int<br>
+-main(int argc, char *argv[])<br>
+-{<br>
+-=C2=A0 =C2=A0int maj, min;<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0EGLContext ctx;<br>
+-=C2=A0 =C2=A0EGLSurface screen_surf;<br>
+-=C2=A0 =C2=A0EGLConfig configs[10];<br>
+-=C2=A0 =C2=A0EGLScreenMESA screen;<br>
+-=C2=A0 =C2=A0EGLModeMESA mode;<br>
+-=C2=A0 =C2=A0EGLint numConfigs, count;<br>
+-=C2=A0 =C2=A0EGLBoolean b;<br>
+-=C2=A0 =C2=A0const GLubyte *bitmap;<br>
+-=C2=A0 =C2=A0EGLint screenAttribs[32];<br>
+-=C2=A0 =C2=A0EGLint i;<br>
+-#endif<br>
+-<br>
+-=C2=A0 =C2=A0EGLDisplay d =3D eglGetDisplay(EGL_DEFAULT_DISPLAY);<br>
+-=C2=A0 =C2=A0assert(d);<br>
+-<br>
+-=C2=A0 =C2=A0if (!eglInitialize(d, &amp;maj, &amp;min)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;demo: eglInitialize failed\n&quot;);<br=
>
+-=C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0printf(&quot;EGL version =3D %d.%d\n&quot;, maj, min);<br>
+-=C2=A0 =C2=A0printf(&quot;EGL_VENDOR =3D %s\n&quot;, eglQueryString(d, EG=
L_VENDOR));<br>
+-=C2=A0 =C2=A0if (!strstr(eglQueryString(d, EGL_EXTENSIONS),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;EGL_MESA_scr=
een_surface&quot;)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;EGL_MESA_screen_surface is not supporte=
d\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0eglGetConfigs(d, configs, 10, &amp;numConfigs);<br>
+-=C2=A0 =C2=A0eglGetScreensMESA(d, &amp;screen, 1, &amp;count);<br>
+-=C2=A0 =C2=A0eglGetModesMESA(d, screen, &amp;mode, 1, &amp;count);<br>
+-<br>
+-=C2=A0 =C2=A0eglBindAPI(EGL_OPENGL_API);<br>
+-=C2=A0 =C2=A0ctx =3D eglCreateContext(d, configs[0], EGL_NO_CONTEXT, NULL=
);<br>
+-=C2=A0 =C2=A0if (ctx =3D=3D EGL_NO_CONTEXT) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;failed to create context\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0i =3D 0;<br>
+-=C2=A0 =C2=A0screenAttribs[i++] =3D EGL_WIDTH;<br>
+-=C2=A0 =C2=A0eglGetModeAttribMESA(d, mode, EGL_WIDTH, &amp;screenAttribs[=
i++]);<br>
+-=C2=A0 =C2=A0screenAttribs[i++] =3D EGL_HEIGHT;<br>
+-=C2=A0 =C2=A0eglGetModeAttribMESA(d, mode, EGL_HEIGHT, &amp;screenAttribs=
[i++]);<br>
+-=C2=A0 =C2=A0screenAttribs[i] =3D EGL_NONE;<br>
+-<br>
+-=C2=A0 =C2=A0screen_surf =3D eglCreateScreenSurfaceMESA(d, configs[0], sc=
reenAttribs);<br>
+-=C2=A0 =C2=A0if (screen_surf =3D=3D EGL_NO_SURFACE) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;failed to create screen surface\n&quot;=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-<br>
+-=C2=A0 =C2=A0eglShowScreenSurfaceMESA(d, screen, screen_surf, mode);<br>
+-<br>
+-=C2=A0 =C2=A0b =3D eglMakeCurrent(d, screen_surf, screen_surf, ctx);<br>
+-=C2=A0 =C2=A0if (!b) {<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;make current failed\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
+-=C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0glViewport(0, 0, 1024, 768);<br>
+-<br>
+-<br>
+-=C2=A0 =C2=A0Init();<br>
+-=C2=A0 =C2=A0Reshape(1024, 768);<br>
+-<br>
+-=C2=A0 =C2=A0/* some drivers crash when rendering to front buffer */<br>
+-#if 0<br>
+-=C2=A0 =C2=A0glDrawBuffer( GL_FRONT );<br>
+-=C2=A0 =C2=A0glClearColor( 0, 1.0, 0, 1);<br>
+-<br>
+-=C2=A0 =C2=A0glClear( GL_COLOR_BUFFER_BIT );<br>
+-#endif<br>
+-<br>
+-=C2=A0 =C2=A0doubleBuffer =3D 1;<br>
+-=C2=A0 =C2=A0glDrawBuffer( GL_BACK );<br>
+-<br>
+-=C2=A0 =C2=A0Draw(d, screen_surf);<br>
+-=C2=A0 =C2=A0sleep(2);<br>
+-<br>
+-=C2=A0 =C2=A0/* TODO EGL_KHR_lock_surface */<br>
+-=C2=A0 =C2=A0bitmap =3D NULL;<br>
+-=C2=A0 =C2=A0if (bitmap)<br>
+-=C2=A0 =C2=A0 =C2=A0 write_ppm(&quot;dump.ppm&quot;, bitmap, 1024, 768);<=
br>
+-<br>
+-=C2=A0 =C2=A0eglDestroySurface(d, screen_surf);<br>
+-=C2=A0 =C2=A0eglDestroyContext(d, ctx);<br>
+-=C2=A0 =C2=A0eglTerminate(d);<br>
+-#endif<br>
+-<br>
+-=C2=A0 =C2=A0return 0;<br>
+-}<br>
+diff --git a/src/egl/opengl/eglinfo.c b/src/egl/opengl/eglinfo.c<br>
+index 8e82e73..1f79fef 100644<br>
+--- a/src/egl/opengl/eglinfo.c<br>
++++ b/src/egl/opengl/eglinfo.c<br>
+@@ -93,10 +93,6 @@ PrintConfigs(EGLDisplay d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcat(surfString, &quot;pb,&quot;);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (surfaces &amp; EGL_PIXMAP_BIT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcat(surfString, &quot;pix,&quot;);<b=
r>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0 =C2=A0 if (surfaces &amp; EGL_SCREEN_BIT_MESA)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcat(surfString, &quot;scrn,&quot;);<=
br>
+-#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strlen(surfString) &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 surfString[strlen(surfString) - 1] =3D =
0;<br>
+<br>
+@@ -117,45 +113,6 @@ PrintConfigs(EGLDisplay d)<br>
+ }<br>
+<br>
+<br>
+-/**<br>
+- * Print table of all available configurations.<br>
+- */<br>
+-static void<br>
+-PrintModes(EGLDisplay d)<br>
+-{<br>
+-#ifdef EGL_MESA_screen_surface<br>
+-=C2=A0 =C2=A0const char *extensions =3D eglQueryString(d, EGL_EXTENSIONS)=
;<br>
+-=C2=A0 =C2=A0if (strstr(extensions, &quot;EGL_MESA_screen_surface&quot;))=
 {<br>
+-=C2=A0 =C2=A0 =C2=A0 EGLScreenMESA screens[MAX_SCREENS];<br>
+-=C2=A0 =C2=A0 =C2=A0 EGLint numScreens =3D 1, scrn;<br>
+-=C2=A0 =C2=A0 =C2=A0 EGLModeMESA modes[MAX_MODES];<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 eglGetScreensMESA(d, screens, MAX_SCREENS, &amp;numS=
creens);<br>
+-=C2=A0 =C2=A0 =C2=A0 printf(&quot;Number of Screens: %d\n\n&quot;, numScr=
eens);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 for (scrn =3D 0; scrn &lt; numScreens; scrn++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EGLint numModes, i;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eglGetModesMESA(d, screens[scrn], modes=
, MAX_MODES, &amp;numModes);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Screen %d Modes:\n&quot;, =
scrn);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;=C2=A0 id=C2=A0 width heig=
ht refresh=C2=A0 name\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;--------------------------=
---------------\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; numModes; i++) {<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EGLint id, w, h, r;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *str;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eglGetModeAttribMESA(d, modes[i=
], EGL_MODE_ID_MESA, &amp;id);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eglGetModeAttribMESA(d, modes[i=
], EGL_WIDTH, &amp;w);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eglGetModeAttribMESA(d, modes[i=
], EGL_HEIGHT, &amp;h);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eglGetModeAttribMESA(d, modes[i=
], EGL_REFRESH_RATE_MESA, &amp;r);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str =3D eglQueryModeStringMESA(=
d, modes[i]);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;0x%02x %5d=C2=A0 %=
5d=C2=A0 =C2=A0%.3f=C2=A0 %s\n&quot;, id, w, h, r / 1000.0, str);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0}<br>
+-#endif<br>
+-}<br>
+-<br>
+ static void<br>
+ PrintExtensions(EGLDisplay d)<br>
+ {<br>
+@@ -215,8 +172,6 @@ main(int argc, char *argv[])<br>
+<br>
+=C2=A0 =C2=A0 PrintConfigs(d);<br>
+<br>
+-=C2=A0 =C2=A0PrintModes(d);<br>
+-<br>
+=C2=A0 =C2=A0 eglTerminate(d);<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+diff --git a/src/egl/opengles1/Makefile.am b/src/egl/opengles1/Makefile.am=
<br>
+index 516e516..1cc2e1f 100644<br>
+--- a/src/egl/opengles1/Makefile.am<br>
++++ b/src/egl/opengles1/Makefile.am<br>
+@@ -38,24 +38,6 @@ AM_LDFLAGS =3D \<br>
+<br>
+ bin_PROGRAMS =3D<br>
+<br>
+-if HAVE_EGL<br>
+-if HAVE_GLESV1<br>
+-bin_PROGRAMS +=3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 drawtex_screen \<br>
+-=C2=A0 =C2=A0 =C2=A0 gears_screen \<br>
+-=C2=A0 =C2=A0 =C2=A0 torus_screen \<br>
+-=C2=A0 =C2=A0 =C2=A0 tri_screen<br>
+-<br>
+-drawtex_screen_SOURCES =3D drawtex.c<br>
+-gears_screen_SOURCES =3D gears.c<br>
+-torus_screen_SOURCES =3D torus.c<br>
+-tri_screen_SOURCES =3D tri.c<br>
+-<br>
+-drawtex_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" r=
el=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+-gears_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" rel=
=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+-torus_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" rel=
=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+-tri_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" rel=
=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+-<br>
+ if HAVE_X11<br>
+ bin_PROGRAMS +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clear \<br>
+@@ -94,5 +76,3 @@ gears_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_=
x11.la" rel=3D"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
+ torus_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D"no=
referrer" target=3D"_blank">libeglut_x11.la</a><br>
+ tri_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D"nore=
ferrer" target=3D"_blank">libeglut_x11.la</a><br>
+ endif<br>
+-endif<br>
+-endif<br>
+diff --git a/src/egl/opengles2/Makefile.am b/src/egl/opengles2/Makefile.am=
<br>
+index 74af460..422cb03 100644<br>
+--- a/src/egl/opengles2/Makefile.am<br>
++++ b/src/egl/opengles2/Makefile.am<br>
+@@ -33,13 +33,7 @@ AM_LDFLAGS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(EGL_LIBS) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-lm<br>
+<br>
+-if HAVE_EGL<br>
+-if HAVE_GLESV2<br>
+-bin_PROGRAMS =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 es2gears_screen<br>
+-<br>
+-es2gears_screen_SOURCES =3D es2gears.c<br>
+-es2gears_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" =
rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
++bin_PROGRAMS =3D<br>
+<br>
+ if HAVE_WAYLAND<br>
+ bin_PROGRAMS +=3D es2gears_wayland<br>
+@@ -59,6 +53,4 @@ es2gears_x11_SOURCES =3D es2gears.c<br>
+ es2gears_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D=
"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
+ es2tri_LDADD =3D $(X11_LIBS)<br>
+ endif<br>
+-endif<br>
+-endif<br>
+<br>
+diff --git a/src/egl/openvg/Makefile.am b/src/egl/openvg/Makefile.am<br>
+index b545225..5fd1cf8 100644<br>
+--- a/src/egl/openvg/Makefile.am<br>
++++ b/src/egl/openvg/Makefile.am<br>
+@@ -50,21 +50,13 @@ endif<br>
+ if HAVE_EGL<br>
+ if HAVE_VG<br>
+ bin_PROGRAMS =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 lion_screen \<br>
+-=C2=A0 =C2=A0 =C2=A0 sp_screen \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(EGL_X11_DEMOS)<br>
+ endif<br>
+ endif<br>
+<br>
+-lion_screen_SOURCES =3D lion.c lion-render.c lion-render.h<br>
+-sp_screen_SOURCES =3D sp.c<br>
+-<br>
+ lion_x11_SOURCES =3D lion.c lion-render.c lion-render.h<br>
+ sp_x11_SOURCES =3D sp.c<br>
+<br>
+-lion_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" rel=
=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+-sp_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" rel=3D=
"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+-<br>
+ lion_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D"nor=
eferrer" target=3D"_blank">libeglut_x11.la</a><br>
+ sp_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D"noref=
errer" target=3D"_blank">libeglut_x11.la</a><br>
+<br>
+diff --git a/src/egl/openvg/Makefile.in b/src/egl/openvg/Makefile.in<br>
+index 99e9288..3652fbb 100644<br>
+--- a/src/egl/openvg/Makefile.in<br>
++++ b/src/egl/openvg/Makefile.in<br>
+@@ -108,8 +108,6 @@ host_triplet =3D @host@<br>
+ @HAVE_FREETYPE2_TRUE@@HAVE_X11_TRUE@am__append_1 =3D \<br>
+ @HAVE_FREETYPE2_TRUE@@HAVE_X11_TRUE@=C2=A0 text<br>
+<br>
+-@HAVE_EGL_TRUE@@HAVE_VG_TRUE@noinst_PROGRAMS =3D lion_screen$(EXEEXT) \<b=
r>
+-@HAVE_EGL_TRUE@@HAVE_VG_TRUE@ sp_screen$(EXEEXT) \<br>
+ @HAVE_EGL_TRUE@@HAVE_VG_TRUE@ $(am__EXEEXT_2)<br>
+ subdir =3D src/egl/openvg<br>
+ DIST_COMMON =3D $(srcdir)/Makefile.in $(srcdir)/Makefile.am \<br>
+@@ -128,9 +126,6 @@ CONFIG_CLEAN_VPATH_FILES =3D<br>
+ @HAVE_X11_TRUE@am__EXEEXT_2 =3D lion_x11$(EXEEXT) sp_x11$(EXEEXT) \<br>
+ @HAVE_X11_TRUE@=C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__EXEEXT_1)<br>
+ PROGRAMS =3D $(noinst_PROGRAMS)<br>
+-am_lion_screen_OBJECTS =3D lion.$(OBJEXT) lion-render.$(OBJEXT)<br>
+-lion_screen_OBJECTS =3D $(am_lion_screen_OBJECTS)<br>
+-lion_screen_DEPENDENCIES =3D ../eglut/<a href=3D"http://libeglut_screen.l=
a" rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+ AM_V_lt =3D $(am__v_lt_@AM_V@)<br>
+ am__v_lt_ =3D $(am__v_lt_@AM_DEFAULT_V@)<br>
+ am__v_lt_0 =3D --silent<br>
+@@ -138,9 +133,6 @@ am__v_lt_1 =3D<br>
+ am_lion_x11_OBJECTS =3D lion.$(OBJEXT) lion-render.$(OBJEXT)<br>
+ lion_x11_OBJECTS =3D $(am_lion_x11_OBJECTS)<br>
+ lion_x11_DEPENDENCIES =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=
=3D"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
+-am_sp_screen_OBJECTS =3D sp.$(OBJEXT)<br>
+-sp_screen_OBJECTS =3D $(am_sp_screen_OBJECTS)<br>
+-sp_screen_DEPENDENCIES =3D ../eglut/<a href=3D"http://libeglut_screen.la"=
 rel=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+ am_sp_x11_OBJECTS =3D sp.$(OBJEXT)<br>
+ sp_x11_OBJECTS =3D $(am_sp_x11_OBJECTS)<br>
+ sp_x11_DEPENDENCIES =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=
=3D"noreferrer" target=3D"_blank">libeglut_x11.la</a><br>
+@@ -184,10 +176,10 @@ AM_V_CCLD =3D $(am__v_CCLD_@AM_V@)<br>
+ am__v_CCLD_ =3D $(am__v_CCLD_@AM_DEFAULT_V@)<br>
+ am__v_CCLD_0 =3D @echo &quot;=C2=A0 CCLD=C2=A0 =C2=A0 &quot; $@;<br>
+ am__v_CCLD_1 =3D<br>
+-SOURCES =3D $(lion_screen_SOURCES) $(lion_x11_SOURCES) \<br>
+-=C2=A0 =C2=A0 =C2=A0 $(sp_screen_SOURCES) $(sp_x11_SOURCES) $(text_SOURCE=
S)<br>
+-DIST_SOURCES =3D $(lion_screen_SOURCES) $(lion_x11_SOURCES) \<br>
+-=C2=A0 =C2=A0 =C2=A0 $(sp_screen_SOURCES) $(sp_x11_SOURCES) $(text_SOURCE=
S)<br>
++SOURCES =3D $(lion_x11_SOURCES) \<br>
++=C2=A0 =C2=A0 =C2=A0 $(sp_x11_SOURCES) $(text_SOURCES)<br>
++DIST_SOURCES =3D $(lion_x11_SOURCES) \<br>
++=C2=A0 =C2=A0 =C2=A0 $(sp_x11_SOURCES) $(text_SOURCES)<br>
+ RECURSIVE_TARGETS =3D all-recursive check-recursive cscopelist-recursive =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctags-recursive dvi-recursive html-recursive in=
fo-recursive \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install-data-recursive install-dvi-recursive \<=
br>
+@@ -423,12 +415,8 @@ AM_LDFLAGS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-lm<br>
+<br>
+ @HAVE_X11_TRUE@EGL_X11_DEMOS =3D lion_x11 sp_x11 $(am__append_1)<br>
+-lion_screen_SOURCES =3D lion.c lion-render.c lion-render.h<br>
+-sp_screen_SOURCES =3D sp.c<br>
+ lion_x11_SOURCES =3D lion.c lion-render.c lion-render.h<br>
+ sp_x11_SOURCES =3D sp.c<br>
+-lion_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" rel=
=3D"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+-sp_screen_LDADD =3D ../eglut/<a href=3D"http://libeglut_screen.la" rel=3D=
"noreferrer" target=3D"_blank">libeglut_screen.la</a><br>
+ lion_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D"nor=
eferrer" target=3D"_blank">libeglut_x11.la</a><br>
+ sp_x11_LDADD =3D ../eglut/<a href=3D"http://libeglut_x11.la" rel=3D"noref=
errer" target=3D"_blank">libeglut_x11.la</a><br>
+ text_SOURCES =3D text.c<br>
+@@ -481,18 +469,10 @@ clean-noinstPROGRAMS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot; rm -f&quot; $$list; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $$list<br>
+<br>
+-lion_screen$(EXEEXT): $(lion_screen_OBJECTS) $(lion_screen_DEPENDENCIES) =
$(EXTRA_lion_screen_DEPENDENCIES)<br>
+-=C2=A0 =C2=A0 =C2=A0 @rm -f lion_screen$(EXEEXT)<br>
+-=C2=A0 =C2=A0 =C2=A0 $(AM_V_CCLD)$(LINK) $(lion_screen_OBJECTS) $(lion_sc=
reen_LDADD) $(LIBS)<br>
+-<br>
+ lion_x11$(EXEEXT): $(lion_x11_OBJECTS) $(lion_x11_DEPENDENCIES) $(EXTRA_l=
ion_x11_DEPENDENCIES)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@rm -f lion_x11$(EXEEXT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_CCLD)$(LINK) $(lion_x11_OBJECTS) $(lion_=
x11_LDADD) $(LIBS)<br>
+<br>
+-sp_screen$(EXEEXT): $(sp_screen_OBJECTS) $(sp_screen_DEPENDENCIES) $(EXTR=
A_sp_screen_DEPENDENCIES)<br>
+-=C2=A0 =C2=A0 =C2=A0 @rm -f sp_screen$(EXEEXT)<br>
+-=C2=A0 =C2=A0 =C2=A0 $(AM_V_CCLD)$(LINK) $(sp_screen_OBJECTS) $(sp_screen=
_LDADD) $(LIBS)<br>
+-<br>
+ sp_x11$(EXEEXT): $(sp_x11_OBJECTS) $(sp_x11_DEPENDENCIES) $(EXTRA_sp_x11_=
DEPENDENCIES)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@rm -f sp_x11$(EXEEXT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(AM_V_CCLD)$(LINK) $(sp_x11_OBJECTS) $(sp_x11_=
LDADD) $(LIBS)<br>
+<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-demos_8.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-demos_8.2.0.bb</a> b/meta/rec=
ipes-graphics/mesa/<a href=3D"http://mesa-demos_8.2.0.bb" rel=3D"noreferrer=
" target=3D"_blank">mesa-demos_8.2.0.bb</a><br>
index 557b8c6..2df9bba 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-demos_8.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-demos_8.2.0.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-demos_8.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-demos_8.2.0.bb</a><br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.org/pu=
b/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blan=
k">ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0file://0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag=
-files-to.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0file://0010-sharedtex_mt-fix-rendering-thread-hang.patc=
h \<br>
+=C2=A0 =C2=A0 file://0011-drop-demos-dependant-on-obsolete-MESA_screen_sur=
face.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;72613a2c8c013716db02e3ff59d29061&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda=
5879221a9774d0952f90ba92&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br></div>

--001a11440cd09bf05a05320535de--
