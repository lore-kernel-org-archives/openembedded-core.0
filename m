Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D975C4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 20:13:57 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.26965.1670271228445479488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 12:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 7E6F013536
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 21:13:46 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.205]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2HqO-1In4td0; Mon, 5 Dec 2022 21:13:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gstreamer-vaapi: rename USE_X11 variable
Date: Mon,  5 Dec 2022 21:13:30 +0100
Message-Id: <20221205201330.2184787-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1670271220-6B7FA9DD-9619CB82/0/0 CLEAN NORMAL
X-TOI-MSGID: 8b972f91-62b8-4f6c-a820-37059bd93cba
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 20:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174302

Rename USE_X11 to HAVE_X11 to avoid naming conflict with eglplatform.h

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-replace-USE_X11-by-HAVE_X11.patch    | 319 ++++++++++++++++++
 .../gstreamer/gstreamer1.0-vaapi_1.20.4.bb    |   9 +-
 2 files changed, 324 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/=
0001-replace-USE_X11-by-HAVE_X11.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-re=
place-USE_X11-by-HAVE_X11.patch b/meta/recipes-multimedia/gstreamer/gstre=
amer1.0-vaapi/0001-replace-USE_X11-by-HAVE_X11.patch
new file mode 100644
index 0000000000..8cb17a8a0b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-U=
SE_X11-by-HAVE_X11.patch
@@ -0,0 +1,319 @@
+From ff9c63505183f7620b68d7d848ad6b16a7497c75 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 5 Dec 2022 20:56:43 +0100
+Subject: [PATCH] replace USE_X11 by HAVE_X11
+
+currently used variable collides with eglplatform.h
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Patch-Status: Inappropriate
+---
+ ChangeLog                                |  2 +-
+ gst-libs/gst/vaapi/gstvaapidisplay.c     |  2 +-
+ gst-libs/gst/vaapi/gstvaapidisplay_egl.c |  4 ++--
+ gst-libs/gst/vaapi/meson.build           |  4 ++--
+ gst/vaapi/gstvaapipluginutil.c           | 12 ++++++------
+ gst/vaapi/gstvaapisink.c                 |  4 ++--
+ gst/vaapi/gstvaapivideocontext.c         |  4 ++--
+ meson.build                              | 10 +++++-----
+ tests/examples/meson.build               |  2 +-
+ tests/internal/output.c                  |  4 ++--
+ tests/internal/test-display.c            |  4 ++--
+ tests/internal/test-windows.c            |  4 ++--
+ 12 files changed, 28 insertions(+), 28 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 0f769dd..1c54803 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -5905,7 +5905,7 @@
+ 2019-03-30 18:29:31 +0100  Danilo Spinella <danyspin97@protonmail.com>
+=20
+ 	* gst/vaapi/gstvaapipluginutil.c:
+-	  vaapipluginutil: Fix #endif for USE_X11
++	  vaapipluginutil: Fix #endif for HAVE_X11
+=20
+ 2019-03-29 18:29:51 +0100  V=C3=ADctor Manuel J=C3=A1quez Leal <vjaquez=
@igalia.com>
+=20
+diff --git a/gst-libs/gst/vaapi/gstvaapidisplay.c b/gst-libs/gst/vaapi/g=
stvaapidisplay.c
+index 5bf4b13..324330e 100644
+--- a/gst-libs/gst/vaapi/gstvaapidisplay.c
++++ b/gst-libs/gst/vaapi/gstvaapidisplay.c
+@@ -115,7 +115,7 @@ gst_vaapi_display_type_get_type (void)
+   static const GEnumValue display_types[] =3D {
+     {GST_VAAPI_DISPLAY_TYPE_ANY,
+         "Auto detection", "any"},
+-#if USE_X11
++#if HAVE_X11
+     {GST_VAAPI_DISPLAY_TYPE_X11,
+         "VA/X11 display", "x11"},
+ #endif
+diff --git a/gst-libs/gst/vaapi/gstvaapidisplay_egl.c b/gst-libs/gst/vaa=
pi/gstvaapidisplay_egl.c
+index fcffecd..06ac70b 100644
+--- a/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
++++ b/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
+@@ -28,7 +28,7 @@
+ #include "gstvaapiwindow_priv.h"
+ #include "gstvaapitexture_egl.h"
+=20
+-#if USE_X11
++#if HAVE_X11
+ #include "gstvaapidisplay_x11.h"
+ #endif
+ #if USE_WAYLAND
+@@ -110,7 +110,7 @@ gst_vaapi_display_egl_bind_display (GstVaapiDisplay =
* base_display,
+   native_egl_display =3D params->gl_display;
+=20
+   if (!native_vaapi_display) {
+-#if USE_X11
++#if HAVE_X11
+     if (params->display_type =3D=3D GST_VAAPI_DISPLAY_TYPE_ANY
+         || params->display_type =3D=3D GST_VAAPI_DISPLAY_TYPE_X11
+         || params->display_type =3D=3D GST_VAAPI_DISPLAY_TYPE_EGL)
+diff --git a/gst-libs/gst/vaapi/meson.build b/gst-libs/gst/vaapi/meson.b=
uild
+index 2e15063..26bface 100644
+--- a/gst-libs/gst/vaapi/meson.build
++++ b/gst-libs/gst/vaapi/meson.build
+@@ -126,7 +126,7 @@ if USE_DRM
+     ]
+ endif
+=20
+-if USE_X11
++if HAVE_X11
+   gstlibvaapi_sources +=3D [
+       'gstvaapidisplay_x11.c',
+       'gstvaapiutils_x11.c',
+@@ -224,7 +224,7 @@ endif
+ if USE_WAYLAND
+   gstlibvaapi_deps  +=3D [libva_wayland_dep, gstglwayland_dep, wayland_=
client_dep, wayland_protocols_dep]
+ endif
+-if USE_X11
++if HAVE_X11
+   gstlibvaapi_deps  +=3D [libva_x11_dep, x11_dep, xrandr_dep, gstglx11_=
dep]
+ endif
+=20
+diff --git a/gst/vaapi/gstvaapipluginutil.c b/gst/vaapi/gstvaapipluginut=
il.c
+index 0c47b75..8bc4419 100644
+--- a/gst/vaapi/gstvaapipluginutil.c
++++ b/gst/vaapi/gstvaapipluginutil.c
+@@ -29,7 +29,7 @@
+ #if USE_DRM
+ # include <gst/vaapi/gstvaapidisplay_drm.h>
+ #endif
+-#if USE_X11
++#if HAVE_X11
+ # include <gst/vaapi/gstvaapidisplay_x11.h>
+ #endif
+ #if USE_GLX
+@@ -80,7 +80,7 @@ static const DisplayMap g_display_map[] =3D {
+    (GstVaapiDisplayCreateFromHandleFunc)
+    gst_vaapi_display_glx_new_with_display},
+ #endif
+-#if USE_X11
++#if HAVE_X11
+   {"x11",
+    GST_VAAPI_DISPLAY_TYPE_X11,
+    gst_vaapi_display_x11_new,
+@@ -140,7 +140,7 @@ gst_vaapi_get_display_type_from_gl (GstGLDisplayType=
 gl_display_type,
+     GstGLPlatform gl_platform)
+ {
+   switch (gl_display_type) {
+-#if USE_X11
++#if HAVE_X11
+     case GST_GL_DISPLAY_TYPE_X11:{
+ #if USE_GLX
+       if (gl_platform =3D=3D GST_GL_PLATFORM_GLX)
+@@ -178,7 +178,7 @@ gst_vaapi_get_display_type_from_gl_env (void)
+   const gchar *const gl_window_type =3D g_getenv ("GST_GL_WINDOW");
+=20
+   if (!gl_window_type) {
+-#if USE_X11 && GST_GL_HAVE_WINDOW_X11
++#if HAVE_X11 && GST_GL_HAVE_WINDOW_X11
+     return GST_VAAPI_DISPLAY_TYPE_X11;
+ #elif USE_WAYLAND && GST_GL_HAVE_WINDOW_WAYLAND
+     return GST_VAAPI_DISPLAY_TYPE_WAYLAND;
+@@ -186,7 +186,7 @@ gst_vaapi_get_display_type_from_gl_env (void)
+     return GST_VAAPI_DISPLAY_TYPE_EGL;
+ #endif
+   }
+-#if USE_X11
++#if HAVE_X11
+   if (g_strcmp0 (gl_window_type, "x11") =3D=3D 0)
+     return GST_VAAPI_DISPLAY_TYPE_X11;
+ #endif
+@@ -920,7 +920,7 @@ gst_vaapi_create_test_display (void)
+ #if USE_DRM
+     GST_VAAPI_DISPLAY_TYPE_DRM,
+ #endif
+-#if USE_X11
++#if HAVE_X11
+     GST_VAAPI_DISPLAY_TYPE_X11,
+ #endif
+   };
+diff --git a/gst/vaapi/gstvaapisink.c b/gst/vaapi/gstvaapisink.c
+index 9b5ae98..7b8d267 100644
+--- a/gst/vaapi/gstvaapisink.c
++++ b/gst/vaapi/gstvaapisink.c
+@@ -212,7 +212,7 @@ gst_vaapisink_backend_drm (void)
+ /* --- X11 Backend                                                     =
 --- */
+ /* --------------------------------------------------------------------=
---- */
+=20
+-#if USE_X11
++#if HAVE_X11
+ #include <gst/vaapi/gstvaapidisplay_x11.h>
+ #include <gst/vaapi/gstvaapiwindow_x11.h>
+=20
+@@ -1032,7 +1032,7 @@ gst_vaapisink_ensure_backend (GstVaapiSink * sink)
+       sink->backend =3D gst_vaapisink_backend_drm ();
+       break;
+ #endif
+-#if USE_X11
++#if HAVE_X11
+     case GST_VAAPI_DISPLAY_TYPE_X11:
+       sink->backend =3D gst_vaapisink_backend_x11 ();
+       break;
+diff --git a/gst/vaapi/gstvaapivideocontext.c b/gst/vaapi/gstvaapivideoc=
ontext.c
+index cc2967b..9c35d78 100644
+--- a/gst/vaapi/gstvaapivideocontext.c
++++ b/gst/vaapi/gstvaapivideocontext.c
+@@ -28,7 +28,7 @@
+ #if USE_GST_GL_HELPERS
+ # include <gst/gl/gl.h>
+ #endif
+-#if USE_X11
++#if HAVE_X11
+ #include <gst/vaapi/gstvaapidisplay_x11.h>
+ #endif
+ #if USE_WAYLAND
+@@ -104,7 +104,7 @@ gst_vaapi_video_context_get_display (GstContext * co=
ntext, gboolean app_context,
+=20
+     if (gst_structure_get (structure, "va-display", G_TYPE_POINTER, &va=
_display,
+             NULL)) {
+-#if USE_X11
++#if HAVE_X11
+       Display *x11_display =3D NULL;
+       if (gst_structure_get (structure, "x11-display", G_TYPE_POINTER,
+               &x11_display, NULL)) {
+diff --git a/meson.build b/meson.build
+index 4917651..cdd364c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -125,14 +125,14 @@ USE_AV1_DECODER =3D cc.has_header('va/va_dec_av1.h=
', dependencies: libva_dep, pref
+ USE_DRM =3D libva_drm_dep.found() and libdrm_dep.found() and libudev_de=
p.found() and get_option('with_drm') !=3D 'no'
+ USE_EGL =3D gmodule_dep.found() and egl_dep.found() and GLES_VERSION_MA=
SK !=3D 0 and get_option('with_egl') !=3D 'no'
+ USE_WAYLAND =3D libva_wayland_dep.found() and wayland_client_dep.found(=
) and wayland_protocols_dep.found() and wayland_scanner_bin.found() and g=
et_option('with_wayland') !=3D 'no' and USE_DRM
+-USE_X11 =3D libva_x11_dep.found() and x11_dep.found() and get_option('w=
ith_x11') !=3D 'no'
+-USE_GLX =3D gl_dep.found() and libdl_dep.found() and get_option('with_g=
lx') !=3D 'no' and USE_X11
++HAVE_X11 =3D libva_x11_dep.found() and x11_dep.found() and get_option('=
with_x11') !=3D 'no'
++USE_GLX =3D gl_dep.found() and libdl_dep.found() and get_option('with_g=
lx') !=3D 'no' and HAVE_X11
+=20
+ if get_option('with_wayland') =3D=3D 'yes' and not USE_DRM
+    error('DRM support is required to enable Wayland support')
+ endif
+=20
+-if not (USE_DRM or USE_X11 or USE_WAYLAND)
++if not (USE_DRM or HAVE_X11 or USE_WAYLAND)
+   error('No renderer API found (it is requried either DRM, X11 and/or W=
AYLAND)')
+ endif
+=20
+@@ -143,7 +143,7 @@ if gstgl_dep.found()
+   # fallback to the same subproject.  On the first failure, meson will =
never
+   # check the system again even if the fallback never existed.
+   # Last checked with meson 0.54.3
+-  if USE_X11
++  if HAVE_X11
+     gstglx11_dep =3D dependency('gstreamer-gl-x11-1.0', version : gst_r=
eq,
+        fallback : ['gst-plugins-base', 'gstglx11_dep'], required: true)
+   endif
+@@ -178,7 +178,7 @@ cdata.set10('USE_GLX', USE_GLX)
+ cdata.set10('USE_VP9_ENCODER', USE_VP9_ENCODER)
+ cdata.set10('USE_AV1_DECODER', USE_AV1_DECODER)
+ cdata.set10('USE_WAYLAND', USE_WAYLAND)
+-cdata.set10('USE_X11', USE_X11)
++cdata.set10('HAVE_X11', HAVE_X11)
+ cdata.set10('HAVE_XKBLIB', cc.has_header('X11/XKBlib.h', dependencies: =
x11_dep))
+ cdata.set10('HAVE_XRANDR', xrandr_dep.found())
+ cdata.set10('USE_GST_GL_HELPERS', gstgl_dep.found())
+diff --git a/tests/examples/meson.build b/tests/examples/meson.build
+index e7b1dee..76e9d78 100644
+--- a/tests/examples/meson.build
++++ b/tests/examples/meson.build
+@@ -12,7 +12,7 @@ foreach example : examples
+     install: false)
+ endforeach
+=20
+-if USE_X11 and USE_WAYLAND
++if HAVE_X11 and USE_WAYLAND
+ if gtk_dep.found()
+   executable('test-vaapicontext', 'test-vaapicontext.c',
+     c_args : gstreamer_vaapi_args,
+diff --git a/tests/internal/output.c b/tests/internal/output.c
+index 2182d5a..bd1b01c 100644
+--- a/tests/internal/output.c
++++ b/tests/internal/output.c
+@@ -26,7 +26,7 @@
+ # include <gst/vaapi/gstvaapidisplay_drm.h>
+ # include <gst/vaapi/gstvaapiwindow_drm.h>
+ #endif
+-#if USE_X11
++#if HAVE_X11
+ # include <gst/vaapi/gstvaapidisplay_x11.h>
+ # include <gst/vaapi/gstvaapiwindow_x11.h>
+ #endif
+@@ -52,7 +52,7 @@ static const VideoOutputInfo g_video_outputs[] =3D {
+         gst_vaapi_display_wayland_new,
+       gst_vaapi_window_wayland_new},
+ #endif
+-#if USE_X11
++#if HAVE_X11
+   {"x11",
+         gst_vaapi_display_x11_new,
+       gst_vaapi_window_x11_new},
+diff --git a/tests/internal/test-display.c b/tests/internal/test-display=
.c
+index e9ec126..612b486 100644
+--- a/tests/internal/test-display.c
++++ b/tests/internal/test-display.c
+@@ -34,7 +34,7 @@
+ # define DRM_DEVICE_PATH "/dev/dri/card0"
+ # endif
+ #endif
+-#if USE_X11
++#if HAVE_X11
+ # include <gst/vaapi/gstvaapidisplay_x11.h>
+ #endif
+ #if USE_GLX
+@@ -273,7 +273,7 @@ main (int argc, char *argv[])
+   g_print ("\n");
+ #endif
+=20
+-#if USE_X11
++#if HAVE_X11
+   g_print ("#\n");
+   g_print ("# Create display with gst_vaapi_display_x11_new()\n");
+   g_print ("#\n");
+diff --git a/tests/internal/test-windows.c b/tests/internal/test-windows=
.c
+index b9c9ad1..2fffbcf 100644
+--- a/tests/internal/test-windows.c
++++ b/tests/internal/test-windows.c
+@@ -29,7 +29,7 @@
+ # include <gst/vaapi/gstvaapidisplay_drm.h>
+ # include <gst/vaapi/gstvaapiwindow_drm.h>
+ #endif
+-#if USE_X11
++#if HAVE_X11
+ # include <gst/vaapi/gstvaapidisplay_x11.h>
+ # include <gst/vaapi/gstvaapiwindow_x11.h>
+ #endif
+@@ -138,7 +138,7 @@ main (int argc, char *argv[])
+   gst_object_unref (display);
+ #endif
+=20
+-#if USE_X11
++#if HAVE_X11
+   display =3D gst_vaapi_display_x11_new (NULL);
+   if (!display)
+     g_error ("could not create Gst/VA display");
+--=20
+2.34.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
index 81ec23d26e..8f45fd41d3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
@@ -9,7 +9,10 @@ REALPN =3D "gstreamer-vaapi"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b=
364516c"
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-$=
{PV}.tar.xz"
+SRC_URI =3D " \
+    https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.=
xz \
+    file://0001-replace-USE_X11-by-HAVE_X11.patch \
+"
=20
 SRC_URI[sha256sum] =3D "ab12596144c05506e9782374c5d2cdfb3069fca89908d6de=
360d947bb77fd06a"
=20
@@ -32,9 +35,7 @@ PACKAGES =3D+ "${PN}-tests"
 # and BSP layers to pick either glx, egl, or no GL. By default,
 # try detecting X11 first, and if found (with OpenGL), use GLX,
 # otherwise try to check if EGL can be used.
-PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11 open=
gl', 'glx', \
-                        bb.utils.contains('DISTRO_FEATURES',     'opengl=
', 'egl', \
-                                                                       '=
', d), d)}"
+PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'g=
lx', '', d)} egl"
=20
 PACKAGECONFIG ??=3D "drm encoders \
                    ${PACKAGECONFIG_GL} \
--=20
2.34.1


