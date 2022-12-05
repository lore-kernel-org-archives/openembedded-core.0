Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592A7C4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 20:36:47 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.27675.1670272605659323476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 12:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KVcXpKJq;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id c1so20430247lfi.7
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 12:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iqWsHK6qQ4aND7Q5Z4jjCwU2UOB2+0ouKc/m+cpgOoY=;
        b=KVcXpKJq9vSEp0QUqVZP+XG4p0MUu4qBQ18NDQHnqtC19WC5ZU7cBuLqPhbSGyMxtw
         h0LbLylLSvctUvKaRBO2w6RXK/XiABC8w0rarIK1nDdi/dtKhH/cIJe7Hb2n/KHaWd/R
         5PVXWSQK35bGwJqQZZZ04aH+LTr0b/peluJnBq1+aB6zVusyuwBcdu7270YGrmjYHQjP
         I6RTuAwxFhof52yJkuSBk4ri1yTg5zZ81Q4qe74oFmUqZWWx4MDg+pEDYw0wE2tNt9wg
         ayCtwGEFQUCIBDtICBSg1B3NA3BNZUl1obhwgeiXp3EJw+CfNc+7LE+bdyeyuOa8LkzJ
         UUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqWsHK6qQ4aND7Q5Z4jjCwU2UOB2+0ouKc/m+cpgOoY=;
        b=TrwEExl2I2mPWEPG5+vr6bsICJCN/lrm/nWpFwJZoo5wXZEAXcZkvHlDxzZjykndF6
         vtJScoewvZv0b89PO5xcPBRUhu9MpA3AA3r5IkRodVMfYkdDT8Ep7NRI0Xb5UCDMngO4
         TyyqTzk/V0QqfSfCNvGm9obB8JVfeMhos/j/IKLt9pUTiEYw8nuLCTSqx1i44oB6Wg42
         5j+Ypj3HuGK0OvGrF0h9BRNVGCK/CuFxqm2e6MlQt3EohKK2AWF1ad1YNn4T6x9w1DQt
         ptS90oPTjzmB7mBcLk7dudeWkGH18C9ppS/9pRSYzCMqjrH6m+piftDJnSYCGzQIuR1H
         8cZg==
X-Gm-Message-State: ANoB5pkYh2tHRlQhbI3IiAcIndOesBxAir3o7jB425c03dYiQMYIqJEx
	w3pERsyMP+Aaa5TJaQkHCEefyEn2yOH64ETRGdM=
X-Google-Smtp-Source: AA0mqf5wxDdtqfbfdAy8iAfFo9HeU/QwlJyZAO33MW5AvrNlTgD9o6Si5/vdCkyFz4AbCOF6RoUnHnrYjqXGO9r9Yxg=
X-Received: by 2002:ac2:4c47:0:b0:4a2:4d53:8294 with SMTP id
 o7-20020ac24c47000000b004a24d538294mr25839110lfk.263.1670272603529; Mon, 05
 Dec 2022 12:36:43 -0800 (PST)
MIME-Version: 1.0
References: <20221205201330.2184787-1-f_l_k@t-online.de>
In-Reply-To: <20221205201330.2184787-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 Dec 2022 21:36:32 +0100
Message-ID: <CANNYZj9WoWyq8-ShejbH-5CB0DeoM1YHw9RKOuss=O4t0g-Bew@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gstreamer-vaapi: rename USE_X11 variable
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000036237505ef1aa53a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 20:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174303

--00000000000036237505ef1aa53a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is totally appropriate for upstream submission, please do so.

Alex

On Mon 5. Dec 2022 at 21.13, Markus Volk <f_l_k@t-online.de> wrote:

> Rename USE_X11 to HAVE_X11 to avoid naming conflict with eglplatform.h
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../0001-replace-USE_X11-by-HAVE_X11.patch    | 319 ++++++++++++++++++
>  .../gstreamer/gstreamer1.0-vaapi_1.20.4.bb    |   9 +-
>  2 files changed, 324 insertions(+), 4 deletions(-)
>  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-USE_X11=
-by-HAVE_X11.patch
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-USE_X=
11-by-HAVE_X11.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-USE_X=
11-by-HAVE_X11.patch
> new file mode 100644
> index 0000000000..8cb17a8a0b
> --- /dev/null
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-USE_X=
11-by-HAVE_X11.patch
> @@ -0,0 +1,319 @@
> +From ff9c63505183f7620b68d7d848ad6b16a7497c75 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 5 Dec 2022 20:56:43 +0100
> +Subject: [PATCH] replace USE_X11 by HAVE_X11
> +
> +currently used variable collides with eglplatform.h
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Patch-Status: Inappropriate
> +---
> + ChangeLog                                |  2 +-
> + gst-libs/gst/vaapi/gstvaapidisplay.c     |  2 +-
> + gst-libs/gst/vaapi/gstvaapidisplay_egl.c |  4 ++--
> + gst-libs/gst/vaapi/meson.build           |  4 ++--
> + gst/vaapi/gstvaapipluginutil.c           | 12 ++++++------
> + gst/vaapi/gstvaapisink.c                 |  4 ++--
> + gst/vaapi/gstvaapivideocontext.c         |  4 ++--
> + meson.build                              | 10 +++++-----
> + tests/examples/meson.build               |  2 +-
> + tests/internal/output.c                  |  4 ++--
> + tests/internal/test-display.c            |  4 ++--
> + tests/internal/test-windows.c            |  4 ++--
> + 12 files changed, 28 insertions(+), 28 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 0f769dd..1c54803 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -5905,7 +5905,7 @@
> + 2019-03-30 18:29:31 +0100  Danilo Spinella <danyspin97@protonmail.com>
> +
> +       * gst/vaapi/gstvaapipluginutil.c:
> +-        vaapipluginutil: Fix #endif for USE_X11
> ++        vaapipluginutil: Fix #endif for HAVE_X11
> +
> + 2019-03-29 18:29:51 +0100  V=C3=ADctor Manuel J=C3=A1quez Leal <vjaquez=
@igalia.com
> >
> +
> +diff --git a/gst-libs/gst/vaapi/gstvaapidisplay.c
> b/gst-libs/gst/vaapi/gstvaapidisplay.c
> +index 5bf4b13..324330e 100644
> +--- a/gst-libs/gst/vaapi/gstvaapidisplay.c
> ++++ b/gst-libs/gst/vaapi/gstvaapidisplay.c
> +@@ -115,7 +115,7 @@ gst_vaapi_display_type_get_type (void)
> +   static const GEnumValue display_types[] =3D {
> +     {GST_VAAPI_DISPLAY_TYPE_ANY,
> +         "Auto detection", "any"},
> +-#if USE_X11
> ++#if HAVE_X11
> +     {GST_VAAPI_DISPLAY_TYPE_X11,
> +         "VA/X11 display", "x11"},
> + #endif
> +diff --git a/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
> b/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
> +index fcffecd..06ac70b 100644
> +--- a/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
> ++++ b/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
> +@@ -28,7 +28,7 @@
> + #include "gstvaapiwindow_priv.h"
> + #include "gstvaapitexture_egl.h"
> +
> +-#if USE_X11
> ++#if HAVE_X11
> + #include "gstvaapidisplay_x11.h"
> + #endif
> + #if USE_WAYLAND
> +@@ -110,7 +110,7 @@ gst_vaapi_display_egl_bind_display (GstVaapiDisplay =
*
> base_display,
> +   native_egl_display =3D params->gl_display;
> +
> +   if (!native_vaapi_display) {
> +-#if USE_X11
> ++#if HAVE_X11
> +     if (params->display_type =3D=3D GST_VAAPI_DISPLAY_TYPE_ANY
> +         || params->display_type =3D=3D GST_VAAPI_DISPLAY_TYPE_X11
> +         || params->display_type =3D=3D GST_VAAPI_DISPLAY_TYPE_EGL)
> +diff --git a/gst-libs/gst/vaapi/meson.build
> b/gst-libs/gst/vaapi/meson.build
> +index 2e15063..26bface 100644
> +--- a/gst-libs/gst/vaapi/meson.build
> ++++ b/gst-libs/gst/vaapi/meson.build
> +@@ -126,7 +126,7 @@ if USE_DRM
> +     ]
> + endif
> +
> +-if USE_X11
> ++if HAVE_X11
> +   gstlibvaapi_sources +=3D [
> +       'gstvaapidisplay_x11.c',
> +       'gstvaapiutils_x11.c',
> +@@ -224,7 +224,7 @@ endif
> + if USE_WAYLAND
> +   gstlibvaapi_deps  +=3D [libva_wayland_dep, gstglwayland_dep,
> wayland_client_dep, wayland_protocols_dep]
> + endif
> +-if USE_X11
> ++if HAVE_X11
> +   gstlibvaapi_deps  +=3D [libva_x11_dep, x11_dep, xrandr_dep, gstglx11_=
dep]
> + endif
> +
> +diff --git a/gst/vaapi/gstvaapipluginutil.c
> b/gst/vaapi/gstvaapipluginutil.c
> +index 0c47b75..8bc4419 100644
> +--- a/gst/vaapi/gstvaapipluginutil.c
> ++++ b/gst/vaapi/gstvaapipluginutil.c
> +@@ -29,7 +29,7 @@
> + #if USE_DRM
> + # include <gst/vaapi/gstvaapidisplay_drm.h>
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> + # include <gst/vaapi/gstvaapidisplay_x11.h>
> + #endif
> + #if USE_GLX
> +@@ -80,7 +80,7 @@ static const DisplayMap g_display_map[] =3D {
> +    (GstVaapiDisplayCreateFromHandleFunc)
> +    gst_vaapi_display_glx_new_with_display},
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> +   {"x11",
> +    GST_VAAPI_DISPLAY_TYPE_X11,
> +    gst_vaapi_display_x11_new,
> +@@ -140,7 +140,7 @@ gst_vaapi_get_display_type_from_gl (GstGLDisplayType
> gl_display_type,
> +     GstGLPlatform gl_platform)
> + {
> +   switch (gl_display_type) {
> +-#if USE_X11
> ++#if HAVE_X11
> +     case GST_GL_DISPLAY_TYPE_X11:{
> + #if USE_GLX
> +       if (gl_platform =3D=3D GST_GL_PLATFORM_GLX)
> +@@ -178,7 +178,7 @@ gst_vaapi_get_display_type_from_gl_env (void)
> +   const gchar *const gl_window_type =3D g_getenv ("GST_GL_WINDOW");
> +
> +   if (!gl_window_type) {
> +-#if USE_X11 && GST_GL_HAVE_WINDOW_X11
> ++#if HAVE_X11 && GST_GL_HAVE_WINDOW_X11
> +     return GST_VAAPI_DISPLAY_TYPE_X11;
> + #elif USE_WAYLAND && GST_GL_HAVE_WINDOW_WAYLAND
> +     return GST_VAAPI_DISPLAY_TYPE_WAYLAND;
> +@@ -186,7 +186,7 @@ gst_vaapi_get_display_type_from_gl_env (void)
> +     return GST_VAAPI_DISPLAY_TYPE_EGL;
> + #endif
> +   }
> +-#if USE_X11
> ++#if HAVE_X11
> +   if (g_strcmp0 (gl_window_type, "x11") =3D=3D 0)
> +     return GST_VAAPI_DISPLAY_TYPE_X11;
> + #endif
> +@@ -920,7 +920,7 @@ gst_vaapi_create_test_display (void)
> + #if USE_DRM
> +     GST_VAAPI_DISPLAY_TYPE_DRM,
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> +     GST_VAAPI_DISPLAY_TYPE_X11,
> + #endif
> +   };
> +diff --git a/gst/vaapi/gstvaapisink.c b/gst/vaapi/gstvaapisink.c
> +index 9b5ae98..7b8d267 100644
> +--- a/gst/vaapi/gstvaapisink.c
> ++++ b/gst/vaapi/gstvaapisink.c
> +@@ -212,7 +212,7 @@ gst_vaapisink_backend_drm (void)
> + /* --- X11 Backend
> --- */
> + /*
> ------------------------------------------------------------------------ =
*/
> +
> +-#if USE_X11
> ++#if HAVE_X11
> + #include <gst/vaapi/gstvaapidisplay_x11.h>
> + #include <gst/vaapi/gstvaapiwindow_x11.h>
> +
> +@@ -1032,7 +1032,7 @@ gst_vaapisink_ensure_backend (GstVaapiSink * sink)
> +       sink->backend =3D gst_vaapisink_backend_drm ();
> +       break;
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> +     case GST_VAAPI_DISPLAY_TYPE_X11:
> +       sink->backend =3D gst_vaapisink_backend_x11 ();
> +       break;
> +diff --git a/gst/vaapi/gstvaapivideocontext.c
> b/gst/vaapi/gstvaapivideocontext.c
> +index cc2967b..9c35d78 100644
> +--- a/gst/vaapi/gstvaapivideocontext.c
> ++++ b/gst/vaapi/gstvaapivideocontext.c
> +@@ -28,7 +28,7 @@
> + #if USE_GST_GL_HELPERS
> + # include <gst/gl/gl.h>
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> + #include <gst/vaapi/gstvaapidisplay_x11.h>
> + #endif
> + #if USE_WAYLAND
> +@@ -104,7 +104,7 @@ gst_vaapi_video_context_get_display (GstContext *
> context, gboolean app_context,
> +
> +     if (gst_structure_get (structure, "va-display", G_TYPE_POINTER,
> &va_display,
> +             NULL)) {
> +-#if USE_X11
> ++#if HAVE_X11
> +       Display *x11_display =3D NULL;
> +       if (gst_structure_get (structure, "x11-display", G_TYPE_POINTER,
> +               &x11_display, NULL)) {
> +diff --git a/meson.build b/meson.build
> +index 4917651..cdd364c 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -125,14 +125,14 @@ USE_AV1_DECODER =3D cc.has_header('va/va_dec_av1.h=
',
> dependencies: libva_dep, pref
> + USE_DRM =3D libva_drm_dep.found() and libdrm_dep.found() and
> libudev_dep.found() and get_option('with_drm') !=3D 'no'
> + USE_EGL =3D gmodule_dep.found() and egl_dep.found() and GLES_VERSION_MA=
SK
> !=3D 0 and get_option('with_egl') !=3D 'no'
> + USE_WAYLAND =3D libva_wayland_dep.found() and wayland_client_dep.found(=
)
> and wayland_protocols_dep.found() and wayland_scanner_bin.found() and
> get_option('with_wayland') !=3D 'no' and USE_DRM
> +-USE_X11 =3D libva_x11_dep.found() and x11_dep.found() and
> get_option('with_x11') !=3D 'no'
> +-USE_GLX =3D gl_dep.found() and libdl_dep.found() and
> get_option('with_glx') !=3D 'no' and USE_X11
> ++HAVE_X11 =3D libva_x11_dep.found() and x11_dep.found() and
> get_option('with_x11') !=3D 'no'
> ++USE_GLX =3D gl_dep.found() and libdl_dep.found() and
> get_option('with_glx') !=3D 'no' and HAVE_X11
> +
> + if get_option('with_wayland') =3D=3D 'yes' and not USE_DRM
> +    error('DRM support is required to enable Wayland support')
> + endif
> +
> +-if not (USE_DRM or USE_X11 or USE_WAYLAND)
> ++if not (USE_DRM or HAVE_X11 or USE_WAYLAND)
> +   error('No renderer API found (it is requried either DRM, X11 and/or
> WAYLAND)')
> + endif
> +
> +@@ -143,7 +143,7 @@ if gstgl_dep.found()
> +   # fallback to the same subproject.  On the first failure, meson will
> never
> +   # check the system again even if the fallback never existed.
> +   # Last checked with meson 0.54.3
> +-  if USE_X11
> ++  if HAVE_X11
> +     gstglx11_dep =3D dependency('gstreamer-gl-x11-1.0', version : gst_r=
eq,
> +        fallback : ['gst-plugins-base', 'gstglx11_dep'], required: true)
> +   endif
> +@@ -178,7 +178,7 @@ cdata.set10('USE_GLX', USE_GLX)
> + cdata.set10('USE_VP9_ENCODER', USE_VP9_ENCODER)
> + cdata.set10('USE_AV1_DECODER', USE_AV1_DECODER)
> + cdata.set10('USE_WAYLAND', USE_WAYLAND)
> +-cdata.set10('USE_X11', USE_X11)
> ++cdata.set10('HAVE_X11', HAVE_X11)
> + cdata.set10('HAVE_XKBLIB', cc.has_header('X11/XKBlib.h', dependencies:
> x11_dep))
> + cdata.set10('HAVE_XRANDR', xrandr_dep.found())
> + cdata.set10('USE_GST_GL_HELPERS', gstgl_dep.found())
> +diff --git a/tests/examples/meson.build b/tests/examples/meson.build
> +index e7b1dee..76e9d78 100644
> +--- a/tests/examples/meson.build
> ++++ b/tests/examples/meson.build
> +@@ -12,7 +12,7 @@ foreach example : examples
> +     install: false)
> + endforeach
> +
> +-if USE_X11 and USE_WAYLAND
> ++if HAVE_X11 and USE_WAYLAND
> + if gtk_dep.found()
> +   executable('test-vaapicontext', 'test-vaapicontext.c',
> +     c_args : gstreamer_vaapi_args,
> +diff --git a/tests/internal/output.c b/tests/internal/output.c
> +index 2182d5a..bd1b01c 100644
> +--- a/tests/internal/output.c
> ++++ b/tests/internal/output.c
> +@@ -26,7 +26,7 @@
> + # include <gst/vaapi/gstvaapidisplay_drm.h>
> + # include <gst/vaapi/gstvaapiwindow_drm.h>
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> + # include <gst/vaapi/gstvaapidisplay_x11.h>
> + # include <gst/vaapi/gstvaapiwindow_x11.h>
> + #endif
> +@@ -52,7 +52,7 @@ static const VideoOutputInfo g_video_outputs[] =3D {
> +         gst_vaapi_display_wayland_new,
> +       gst_vaapi_window_wayland_new},
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> +   {"x11",
> +         gst_vaapi_display_x11_new,
> +       gst_vaapi_window_x11_new},
> +diff --git a/tests/internal/test-display.c b/tests/internal/test-display=
.c
> +index e9ec126..612b486 100644
> +--- a/tests/internal/test-display.c
> ++++ b/tests/internal/test-display.c
> +@@ -34,7 +34,7 @@
> + # define DRM_DEVICE_PATH "/dev/dri/card0"
> + # endif
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> + # include <gst/vaapi/gstvaapidisplay_x11.h>
> + #endif
> + #if USE_GLX
> +@@ -273,7 +273,7 @@ main (int argc, char *argv[])
> +   g_print ("\n");
> + #endif
> +
> +-#if USE_X11
> ++#if HAVE_X11
> +   g_print ("#\n");
> +   g_print ("# Create display with gst_vaapi_display_x11_new()\n");
> +   g_print ("#\n");
> +diff --git a/tests/internal/test-windows.c b/tests/internal/test-windows=
.c
> +index b9c9ad1..2fffbcf 100644
> +--- a/tests/internal/test-windows.c
> ++++ b/tests/internal/test-windows.c
> +@@ -29,7 +29,7 @@
> + # include <gst/vaapi/gstvaapidisplay_drm.h>
> + # include <gst/vaapi/gstvaapiwindow_drm.h>
> + #endif
> +-#if USE_X11
> ++#if HAVE_X11
> + # include <gst/vaapi/gstvaapidisplay_x11.h>
> + # include <gst/vaapi/gstvaapiwindow_x11.h>
> + #endif
> +@@ -138,7 +138,7 @@ main (int argc, char *argv[])
> +   gst_object_unref (display);
> + #endif
> +
> +-#if USE_X11
> ++#if HAVE_X11
> +   display =3D gst_vaapi_display_x11_new (NULL);
> +   if (!display)
> +     g_error ("could not create Gst/VA display");
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-vaapi_1.20.4.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-vaapi_1.20.4.bb
> index 81ec23d26e..8f45fd41d3 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
> @@ -9,7 +9,10 @@ REALPN =3D "gstreamer-vaapi"
>  LICENSE =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c"
>
> -SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
> +SRC_URI =3D " \
> +
> https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
> +    file://0001-replace-USE_X11-by-HAVE_X11.patch \
> +"
>
>  SRC_URI[sha256sum] =3D
> "ab12596144c05506e9782374c5d2cdfb3069fca89908d6de360d947bb77fd06a"
>
> @@ -32,9 +35,7 @@ PACKAGES =3D+ "${PN}-tests"
>  # and BSP layers to pick either glx, egl, or no GL. By default,
>  # try detecting X11 first, and if found (with OpenGL), use GLX,
>  # otherwise try to check if EGL can be used.
> -PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11
> opengl', 'glx', \
> -                        bb.utils.contains('DISTRO_FEATURES',
>  'opengl', 'egl', \
> -
>  '', d), d)}"
> +PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'glx', '', d)} egl"
>
>  PACKAGECONFIG ??=3D "drm encoders \
>                     ${PACKAGECONFIG_GL} \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174302):
> https://lists.openembedded.org/g/openembedded-core/message/174302
> Mute This Topic: https://lists.openembedded.org/mt/95477995/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000036237505ef1aa53a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is totally appropriate for upstream submission, plea=
se do so.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n 5. Dec 2022 at 21.13, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de=
">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Rename USE_X11=
 to HAVE_X11 to avoid naming conflict with eglplatform.h<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../0001-replace-USE_X11-by-HAVE_X11.patch=C2=A0 =C2=A0 | 319 +++++++=
+++++++++++<br>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-vaapi_1.20.4.bb" rel=3D"=
noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.20.4.bb</a>=C2=A0 =C2=A0=
 |=C2=A0 =C2=A09 +-<br>
=C2=A02 files changed, 324 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaa=
pi/0001-replace-USE_X11-by-HAVE_X11.patch<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-repl=
ace-USE_X11-by-HAVE_X11.patch b/meta/recipes-multimedia/gstreamer/gstreamer=
1.0-vaapi/0001-replace-USE_X11-by-HAVE_X11.patch<br>
new file mode 100644<br>
index 0000000000..8cb17a8a0b<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-replace-USE=
_X11-by-HAVE_X11.patch<br>
@@ -0,0 +1,319 @@<br>
+From ff9c63505183f7620b68d7d848ad6b16a7497c75 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Mon, 5 Dec 2022 20:56:43 +0100<br>
+Subject: [PATCH] replace USE_X11 by HAVE_X11<br>
+<br>
+currently used variable collides with eglplatform.h<br>
+<br>
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
+<br>
+Patch-Status: Inappropriate<br>
+---<br>
+ ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
+ gst-libs/gst/vaapi/gstvaapidisplay.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
+ gst-libs/gst/vaapi/gstvaapidisplay_egl.c |=C2=A0 4 ++--<br>
+ gst-libs/gst/vaapi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 ++--<br>
+ gst/vaapi/gstvaapipluginutil.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
12 ++++++------<br>
+ gst/vaapi/gstvaapisink.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
+ gst/vaapi/gstvaapivideocontext.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 4 ++--<br>
+ meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
+ tests/examples/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
+ tests/internal/output.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
+ tests/internal/test-display.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
+ tests/internal/test-windows.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
+ 12 files changed, 28 insertions(+), 28 deletions(-)<br>
+<br>
+diff --git a/ChangeLog b/ChangeLog<br>
+index 0f769dd..1c54803 100644<br>
+--- a/ChangeLog<br>
++++ b/ChangeLog<br>
+@@ -5905,7 +5905,7 @@<br>
+ 2019-03-30 18:29:31 +0100=C2=A0 Danilo Spinella &lt;<a href=3D"mailto:dan=
yspin97@protonmail.com" target=3D"_blank">danyspin97@protonmail.com</a>&gt;=
<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* gst/vaapi/gstvaapipluginutil.c:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vaapipluginutil: Fix #endif for USE_X11<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 vaapipluginutil: Fix #endif for HAVE_X11<br>
+ <br>
+ 2019-03-29 18:29:51 +0100=C2=A0 V=C3=ADctor Manuel J=C3=A1quez Leal &lt;<=
a href=3D"mailto:vjaquez@igalia.com" target=3D"_blank">vjaquez@igalia.com</=
a>&gt;<br>
+ <br>
+diff --git a/gst-libs/gst/vaapi/gstvaapidisplay.c b/gst-libs/gst/vaapi/gst=
vaapidisplay.c<br>
+index 5bf4b13..324330e 100644<br>
+--- a/gst-libs/gst/vaapi/gstvaapidisplay.c<br>
++++ b/gst-libs/gst/vaapi/gstvaapidisplay.c<br>
+@@ -115,7 +115,7 @@ gst_vaapi_display_type_get_type (void)<br>
+=C2=A0 =C2=A0static const GEnumValue display_types[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0{GST_VAAPI_DISPLAY_TYPE_ANY,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Auto detection&quot;, &quot;any&qu=
ot;},<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0 =C2=A0{GST_VAAPI_DISPLAY_TYPE_X11,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;VA/X11 display&quot;, &quot;x11&qu=
ot;},<br>
+ #endif<br>
+diff --git a/gst-libs/gst/vaapi/gstvaapidisplay_egl.c b/gst-libs/gst/vaapi=
/gstvaapidisplay_egl.c<br>
+index fcffecd..06ac70b 100644<br>
+--- a/gst-libs/gst/vaapi/gstvaapidisplay_egl.c<br>
++++ b/gst-libs/gst/vaapi/gstvaapidisplay_egl.c<br>
+@@ -28,7 +28,7 @@<br>
+ #include &quot;gstvaapiwindow_priv.h&quot;<br>
+ #include &quot;gstvaapitexture_egl.h&quot;<br>
+ <br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+ #include &quot;gstvaapidisplay_x11.h&quot;<br>
+ #endif<br>
+ #if USE_WAYLAND<br>
+@@ -110,7 +110,7 @@ gst_vaapi_display_egl_bind_display (GstVaapiDisplay * =
base_display,<br>
+=C2=A0 =C2=A0native_egl_display =3D params-&gt;gl_display;<br>
+ <br>
+=C2=A0 =C2=A0if (!native_vaapi_display) {<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0 =C2=A0if (params-&gt;display_type =3D=3D GST_VAAPI_DISPLAY_T=
YPE_ANY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| params-&gt;display_type =3D=3D GST_VA=
API_DISPLAY_TYPE_X11<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| params-&gt;display_type =3D=3D GST_VA=
API_DISPLAY_TYPE_EGL)<br>
+diff --git a/gst-libs/gst/vaapi/meson.build b/gst-libs/gst/vaapi/meson.bui=
ld<br>
+index 2e15063..26bface 100644<br>
+--- a/gst-libs/gst/vaapi/meson.build<br>
++++ b/gst-libs/gst/vaapi/meson.build<br>
+@@ -126,7 +126,7 @@ if USE_DRM<br>
+=C2=A0 =C2=A0 =C2=A0]<br>
+ endif<br>
+ <br>
+-if USE_X11<br>
++if HAVE_X11<br>
+=C2=A0 =C2=A0gstlibvaapi_sources +=3D [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gstvaapidisplay_x11.c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gstvaapiutils_x11.c&#39;,<br>
+@@ -224,7 +224,7 @@ endif<br>
+ if USE_WAYLAND<br>
+=C2=A0 =C2=A0gstlibvaapi_deps=C2=A0 +=3D [libva_wayland_dep, gstglwayland_=
dep, wayland_client_dep, wayland_protocols_dep]<br>
+ endif<br>
+-if USE_X11<br>
++if HAVE_X11<br>
+=C2=A0 =C2=A0gstlibvaapi_deps=C2=A0 +=3D [libva_x11_dep, x11_dep, xrandr_d=
ep, gstglx11_dep]<br>
+ endif<br>
+ <br>
+diff --git a/gst/vaapi/gstvaapipluginutil.c b/gst/vaapi/gstvaapipluginutil=
.c<br>
+index 0c47b75..8bc4419 100644<br>
+--- a/gst/vaapi/gstvaapipluginutil.c<br>
++++ b/gst/vaapi/gstvaapipluginutil.c<br>
+@@ -29,7 +29,7 @@<br>
+ #if USE_DRM<br>
+ # include &lt;gst/vaapi/gstvaapidisplay_drm.h&gt;<br>
+ #endif<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+ # include &lt;gst/vaapi/gstvaapidisplay_x11.h&gt;<br>
+ #endif<br>
+ #if USE_GLX<br>
+@@ -80,7 +80,7 @@ static const DisplayMap g_display_map[] =3D {<br>
+=C2=A0 =C2=A0 (GstVaapiDisplayCreateFromHandleFunc)<br>
+=C2=A0 =C2=A0 gst_vaapi_display_glx_new_with_display},<br>
+ #endif<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0{&quot;x11&quot;,<br>
+=C2=A0 =C2=A0 GST_VAAPI_DISPLAY_TYPE_X11,<br>
+=C2=A0 =C2=A0 gst_vaapi_display_x11_new,<br>
+@@ -140,7 +140,7 @@ gst_vaapi_get_display_type_from_gl (GstGLDisplayType g=
l_display_type,<br>
+=C2=A0 =C2=A0 =C2=A0GstGLPlatform gl_platform)<br>
+ {<br>
+=C2=A0 =C2=A0switch (gl_display_type) {<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0 =C2=A0case GST_GL_DISPLAY_TYPE_X11:{<br>
+ #if USE_GLX<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gl_platform =3D=3D GST_GL_PLATFORM_GLX)<br>
+@@ -178,7 +178,7 @@ gst_vaapi_get_display_type_from_gl_env (void)<br>
+=C2=A0 =C2=A0const gchar *const gl_window_type =3D g_getenv (&quot;GST_GL_=
WINDOW&quot;);<br>
+ <br>
+=C2=A0 =C2=A0if (!gl_window_type) {<br>
+-#if USE_X11 &amp;&amp; GST_GL_HAVE_WINDOW_X11<br>
++#if HAVE_X11 &amp;&amp; GST_GL_HAVE_WINDOW_X11<br>
+=C2=A0 =C2=A0 =C2=A0return GST_VAAPI_DISPLAY_TYPE_X11;<br>
+ #elif USE_WAYLAND &amp;&amp; GST_GL_HAVE_WINDOW_WAYLAND<br>
+=C2=A0 =C2=A0 =C2=A0return GST_VAAPI_DISPLAY_TYPE_WAYLAND;<br>
+@@ -186,7 +186,7 @@ gst_vaapi_get_display_type_from_gl_env (void)<br>
+=C2=A0 =C2=A0 =C2=A0return GST_VAAPI_DISPLAY_TYPE_EGL;<br>
+ #endif<br>
+=C2=A0 =C2=A0}<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0if (g_strcmp0 (gl_window_type, &quot;x11&quot;) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0return GST_VAAPI_DISPLAY_TYPE_X11;<br>
+ #endif<br>
+@@ -920,7 +920,7 @@ gst_vaapi_create_test_display (void)<br>
+ #if USE_DRM<br>
+=C2=A0 =C2=A0 =C2=A0GST_VAAPI_DISPLAY_TYPE_DRM,<br>
+ #endif<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0 =C2=A0GST_VAAPI_DISPLAY_TYPE_X11,<br>
+ #endif<br>
+=C2=A0 =C2=A0};<br>
+diff --git a/gst/vaapi/gstvaapisink.c b/gst/vaapi/gstvaapisink.c<br>
+index 9b5ae98..7b8d267 100644<br>
+--- a/gst/vaapi/gstvaapisink.c<br>
++++ b/gst/vaapi/gstvaapisink.c<br>
+@@ -212,7 +212,7 @@ gst_vaapisink_backend_drm (void)<br>
+ /* --- X11 Backend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- */<br>
+ /* ----------------------------------------------------------------------=
-- */<br>
+ <br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+ #include &lt;gst/vaapi/gstvaapidisplay_x11.h&gt;<br>
+ #include &lt;gst/vaapi/gstvaapiwindow_x11.h&gt;<br>
+ <br>
+@@ -1032,7 +1032,7 @@ gst_vaapisink_ensure_backend (GstVaapiSink * sink)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sink-&gt;backend =3D gst_vaapisink_backend_drm =
();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+ #endif<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0 =C2=A0case GST_VAAPI_DISPLAY_TYPE_X11:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sink-&gt;backend =3D gst_vaapisink_backend_x11 =
();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+diff --git a/gst/vaapi/gstvaapivideocontext.c b/gst/vaapi/gstvaapivideocon=
text.c<br>
+index cc2967b..9c35d78 100644<br>
+--- a/gst/vaapi/gstvaapivideocontext.c<br>
++++ b/gst/vaapi/gstvaapivideocontext.c<br>
+@@ -28,7 +28,7 @@<br>
+ #if USE_GST_GL_HELPERS<br>
+ # include &lt;gst/gl/gl.h&gt;<br>
+ #endif<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+ #include &lt;gst/vaapi/gstvaapidisplay_x11.h&gt;<br>
+ #endif<br>
+ #if USE_WAYLAND<br>
+@@ -104,7 +104,7 @@ gst_vaapi_video_context_get_display (GstContext * cont=
ext, gboolean app_context,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (gst_structure_get (structure, &quot;va-display&quo=
t;, G_TYPE_POINTER, &amp;va_display,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL)) {<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Display *x11_display =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gst_structure_get (structure, &quot;x11-dis=
play&quot;, G_TYPE_POINTER,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;x11_display, N=
ULL)) {<br>
+diff --git a/meson.build b/meson.build<br>
+index 4917651..cdd364c 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -125,14 +125,14 @@ USE_AV1_DECODER =3D cc.has_header(&#39;va/va_dec_av1=
.h&#39;, dependencies: libva_dep, pref<br>
+ USE_DRM =3D libva_drm_dep.found() and libdrm_dep.found() and libudev_dep.=
found() and get_option(&#39;with_drm&#39;) !=3D &#39;no&#39;<br>
+ USE_EGL =3D gmodule_dep.found() and egl_dep.found() and GLES_VERSION_MASK=
 !=3D 0 and get_option(&#39;with_egl&#39;) !=3D &#39;no&#39;<br>
+ USE_WAYLAND =3D libva_wayland_dep.found() and wayland_client_dep.found() =
and wayland_protocols_dep.found() and wayland_scanner_bin.found() and get_o=
ption(&#39;with_wayland&#39;) !=3D &#39;no&#39; and USE_DRM<br>
+-USE_X11 =3D libva_x11_dep.found() and x11_dep.found() and get_option(&#39=
;with_x11&#39;) !=3D &#39;no&#39;<br>
+-USE_GLX =3D gl_dep.found() and libdl_dep.found() and get_option(&#39;with=
_glx&#39;) !=3D &#39;no&#39; and USE_X11<br>
++HAVE_X11 =3D libva_x11_dep.found() and x11_dep.found() and get_option(&#3=
9;with_x11&#39;) !=3D &#39;no&#39;<br>
++USE_GLX =3D gl_dep.found() and libdl_dep.found() and get_option(&#39;with=
_glx&#39;) !=3D &#39;no&#39; and HAVE_X11<br>
+ <br>
+ if get_option(&#39;with_wayland&#39;) =3D=3D &#39;yes&#39; and not USE_DR=
M<br>
+=C2=A0 =C2=A0 error(&#39;DRM support is required to enable Wayland support=
&#39;)<br>
+ endif<br>
+ <br>
+-if not (USE_DRM or USE_X11 or USE_WAYLAND)<br>
++if not (USE_DRM or HAVE_X11 or USE_WAYLAND)<br>
+=C2=A0 =C2=A0error(&#39;No renderer API found (it is requried either DRM, =
X11 and/or WAYLAND)&#39;)<br>
+ endif<br>
+ <br>
+@@ -143,7 +143,7 @@ if gstgl_dep.found()<br>
+=C2=A0 =C2=A0# fallback to the same subproject.=C2=A0 On the first failure=
, meson will never<br>
+=C2=A0 =C2=A0# check the system again even if the fallback never existed.<=
br>
+=C2=A0 =C2=A0# Last checked with meson 0.54.3<br>
+-=C2=A0 if USE_X11<br>
++=C2=A0 if HAVE_X11<br>
+=C2=A0 =C2=A0 =C2=A0gstglx11_dep =3D dependency(&#39;gstreamer-gl-x11-1.0&=
#39;, version : gst_req,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fallback : [&#39;gst-plugins-base&#39;, &#39;g=
stglx11_dep&#39;], required: true)<br>
+=C2=A0 =C2=A0endif<br>
+@@ -178,7 +178,7 @@ cdata.set10(&#39;USE_GLX&#39;, USE_GLX)<br>
+ cdata.set10(&#39;USE_VP9_ENCODER&#39;, USE_VP9_ENCODER)<br>
+ cdata.set10(&#39;USE_AV1_DECODER&#39;, USE_AV1_DECODER)<br>
+ cdata.set10(&#39;USE_WAYLAND&#39;, USE_WAYLAND)<br>
+-cdata.set10(&#39;USE_X11&#39;, USE_X11)<br>
++cdata.set10(&#39;HAVE_X11&#39;, HAVE_X11)<br>
+ cdata.set10(&#39;HAVE_XKBLIB&#39;, cc.has_header(&#39;X11/XKBlib.h&#39;, =
dependencies: x11_dep))<br>
+ cdata.set10(&#39;HAVE_XRANDR&#39;, xrandr_dep.found())<br>
+ cdata.set10(&#39;USE_GST_GL_HELPERS&#39;, gstgl_dep.found())<br>
+diff --git a/tests/examples/meson.build b/tests/examples/meson.build<br>
+index e7b1dee..76e9d78 100644<br>
+--- a/tests/examples/meson.build<br>
++++ b/tests/examples/meson.build<br>
+@@ -12,7 +12,7 @@ foreach example : examples<br>
+=C2=A0 =C2=A0 =C2=A0install: false)<br>
+ endforeach<br>
+ <br>
+-if USE_X11 and USE_WAYLAND<br>
++if HAVE_X11 and USE_WAYLAND<br>
+ if gtk_dep.found()<br>
+=C2=A0 =C2=A0executable(&#39;test-vaapicontext&#39;, &#39;test-vaapicontex=
t.c&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0c_args : gstreamer_vaapi_args,<br>
+diff --git a/tests/internal/output.c b/tests/internal/output.c<br>
+index 2182d5a..bd1b01c 100644<br>
+--- a/tests/internal/output.c<br>
++++ b/tests/internal/output.c<br>
+@@ -26,7 +26,7 @@<br>
+ # include &lt;gst/vaapi/gstvaapidisplay_drm.h&gt;<br>
+ # include &lt;gst/vaapi/gstvaapiwindow_drm.h&gt;<br>
+ #endif<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+ # include &lt;gst/vaapi/gstvaapidisplay_x11.h&gt;<br>
+ # include &lt;gst/vaapi/gstvaapiwindow_x11.h&gt;<br>
+ #endif<br>
+@@ -52,7 +52,7 @@ static const VideoOutputInfo g_video_outputs[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst_vaapi_display_wayland_new,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gst_vaapi_window_wayland_new},<br>
+ #endif<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0{&quot;x11&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst_vaapi_display_x11_new,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gst_vaapi_window_x11_new},<br>
+diff --git a/tests/internal/test-display.c b/tests/internal/test-display.c=
<br>
+index e9ec126..612b486 100644<br>
+--- a/tests/internal/test-display.c<br>
++++ b/tests/internal/test-display.c<br>
+@@ -34,7 +34,7 @@<br>
+ # define DRM_DEVICE_PATH &quot;/dev/dri/card0&quot;<br>
+ # endif<br>
+ #endif<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+ # include &lt;gst/vaapi/gstvaapidisplay_x11.h&gt;<br>
+ #endif<br>
+ #if USE_GLX<br>
+@@ -273,7 +273,7 @@ main (int argc, char *argv[])<br>
+=C2=A0 =C2=A0g_print (&quot;\n&quot;);<br>
+ #endif<br>
+ <br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0g_print (&quot;#\n&quot;);<br>
+=C2=A0 =C2=A0g_print (&quot;# Create display with gst_vaapi_display_x11_ne=
w()\n&quot;);<br>
+=C2=A0 =C2=A0g_print (&quot;#\n&quot;);<br>
+diff --git a/tests/internal/test-windows.c b/tests/internal/test-windows.c=
<br>
+index b9c9ad1..2fffbcf 100644<br>
+--- a/tests/internal/test-windows.c<br>
++++ b/tests/internal/test-windows.c<br>
+@@ -29,7 +29,7 @@<br>
+ # include &lt;gst/vaapi/gstvaapidisplay_drm.h&gt;<br>
+ # include &lt;gst/vaapi/gstvaapiwindow_drm.h&gt;<br>
+ #endif<br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+ # include &lt;gst/vaapi/gstvaapidisplay_x11.h&gt;<br>
+ # include &lt;gst/vaapi/gstvaapiwindow_x11.h&gt;<br>
+ #endif<br>
+@@ -138,7 +138,7 @@ main (int argc, char *argv[])<br>
+=C2=A0 =C2=A0gst_object_unref (display);<br>
+ #endif<br>
+ <br>
+-#if USE_X11<br>
++#if HAVE_X11<br>
+=C2=A0 =C2=A0display =3D gst_vaapi_display_x11_new (NULL);<br>
+=C2=A0 =C2=A0if (!display)<br>
+=C2=A0 =C2=A0 =C2=A0g_error (&quot;could not create Gst/VA display&quot;);=
<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-vaapi_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi=
_1.20.4.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstrea=
mer1.0-vaapi_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-v=
aapi_1.20.4.bb</a><br>
index 81ec23d26e..8f45fd41d3 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-vaap=
i_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.20.4=
.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-vaap=
i_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-vaapi_1.20.4=
.bb</a><br>
@@ -9,7 +9,10 @@ REALPN =3D &quot;gstreamer-vaapi&quot;<br>
=C2=A0LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.LIB;md5=3D4fbd65380cdd25595=
1079008b364516c&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/$%7BREA=
LPN%7D/$%7BREALPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank"=
>https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz</a>=
&quot;<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 <a href=3D"https://gstreamer.freedesktop.org/src/$%7BREALPN%=
7D/$%7BREALPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz</a> \<b=
r>
+=C2=A0 =C2=A0 file://0001-replace-USE_X11-by-HAVE_X11.patch \<br>
+&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ab12596144c05506e9782374c5d2cdfb3069fca8=
9908d6de360d947bb77fd06a&quot;<br>
<br>
@@ -32,9 +35,7 @@ PACKAGES =3D+ &quot;${PN}-tests&quot;<br>
=C2=A0# and BSP layers to pick either glx, egl, or no GL. By default,<br>
=C2=A0# try detecting X11 first, and if found (with OpenGL), use GLX,<br>
=C2=A0# otherwise try to check if EGL can be used.<br>
-PACKAGECONFIG_GL ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;x11 opengl&#39;, &#39;glx&#39;, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=C2=A0 =C2=A0 =C2=A0=
&#39;opengl&#39;, &#39;egl&#39;, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;, d), d)}&quot;<br>
+PACKAGECONFIG_GL ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;x11&#39;, &#39;glx&#39;, &#39;&#39;, d)} egl&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;drm encoders \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PAC=
KAGECONFIG_GL} \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174302): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174302" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/174302</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95477995/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95477995/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000036237505ef1aa53a--

