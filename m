Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC71788F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 22:10:57 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id h21so7925730wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TegbkBkNpPKStF/B0Ay7jpaBua+Gzem8IaxVx3AWEpM=;
	b=HwlQBKSyYuT8J3i74aTSnGyi3QYXS8LQuzzNb+Tg5I2sPT1S0SL1DjyoHJsoZX/YCm
	VOzVq5Q+hhgiGceI/RgWAWuWtsYAk4VAkOZPypJPWMg0YDZRoo4uJKaNydMuqvopnHNg
	JKKJ21Ck8pU+yBdRMPV8udgo5yLPKS5bZbXRz45hN0qa4wFydrc6Yel8dla1t129jgt9
	EpbT6deRnUEFEbAX8WnzHZUC5TiliR7o7HjTOfSeAETBY29MuM7wq9rR3WUzRbG+0CGO
	Y/Bg6kbiaE4EvokCkkgDeJttz4T6TyJ446O5Gv3wYIjwmdsyCnysdDXeJGVKyFupFCsj
	AHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TegbkBkNpPKStF/B0Ay7jpaBua+Gzem8IaxVx3AWEpM=;
	b=ofup/xkBtGdvMj8LhrAYg91GtNVFQSgB6dlZkfh6jEyy5FCirEnYHOhOnTJtmV/MjS
	I8nKkVvrg9yiF+/uaPTyWgNYhD89N+QeheZT2V2w0VAcrBSkO425GK38fG0i1TusifT3
	VxshcLy7TufS2K9Tyq2YREnXzN/JlaIoZhLMgTVLDa/DJwHwSejRQIK/OOzSTDbBkU6b
	6gqFcATPV2Fu69tcr4mhXNiNomEay/bEHB1f41yPx+Ky9pRpWOn+/OpL9Q6zBUyb1KrW
	stHRAS0X9Jl5pXatpUXChKUsbQgXvZt8O9LzLVmtumCcr/BryQZvq5JvRsKIsbXJNdIr
	MwfA==
X-Gm-Message-State: APf1xPAiPoMdx3MzvMVbOKCIdmRv4jcrqbK3Fg2WXl2rBkVxAVcl8/xf
	h63fNmJHZj8PhgXuDL+YqDxMm0pRuTYPld9QCTzAhg==
X-Google-Smtp-Source: AG47ELsnVxoTTZHWapiXzGPcHS7KbTV0xN+B+Icy4rrWVIVpnrMXgWG4i+9YiSnmZg7jElW5fardEbnNw51PR0DUwN0=
X-Received: by 10.80.186.202 with SMTP id x68mr59242ede.264.1519855858711;
	Wed, 28 Feb 2018 14:10:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.143.162 with HTTP; Wed, 28 Feb 2018 14:10:58 -0800 (PST)
In-Reply-To: <20180228220845.8906-1-francescogiancane8@gmail.com>
References: <20180228220845.8906-1-francescogiancane8@gmail.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Wed, 28 Feb 2018 23:10:58 +0100
Message-ID: <CAEQ58shTvks_toPfkPJUhNNDwrAp31vsOM_9CTVz==DUqBwYYg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] libepoxy: New recipe updated to latest release
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
X-List-Received-Date: Wed, 28 Feb 2018 22:10:58 -0000
Content-Type: multipart/alternative; boundary="94eb2c196f749182b805664d045c"

--94eb2c196f749182b805664d045c
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry again. The patch was based on openembedded-core rather than poky, and
this is why the patchwork failed to apply it.
This should be the last one.

Thanks for the patience,

Francesco Giancane


2018-02-28 23:08 GMT+01:00 Francesco Giancane <francescogiancane8@gmail.com>
:

> libepoxy 1.4.3 did not compile successfully because of
> implicit symbol definitions and link-time errors.
> A new recipe with latest libepoxy release (1.5.0) which
> successfully compiles is provided.
>
> Patch to disable 'dlvsym' has also been forward-ported
> to be applicable to version 1.5.0.
> The patch 'Add-fallback-definition-for-EGL-CAST.patch' is
> mainline now; thus it can be safely removed.
> Also, the patch
> 0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
> is no longer required since mainline fixed this too.
>
> Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
> ---
>  ..._EGL_NO_X11_HEADERS-before-including-eglp.patch | 30
> --------------------
>  ...sible-to-disable-the-use-of-dlvsym-needed.patch | 26 +++++++++--------
>  .../Add-fallback-definition-for-EGL-CAST.patch     | 33
> ----------------------
>  .../{libepoxy_1.4.3.bb => libepoxy_1.5.0.bb}       | 10 +++----
>  4 files changed, 18 insertions(+), 81 deletions(-)
>  delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-Define-
> MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
>  delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/Add-
> fallback-definition-for-EGL-CAST.patch
>  rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.3.bb =>
> libepoxy_1.5.0.bb} (61%)
>
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-
> MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
> b/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-
> MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
> deleted file mode 100644
> index ebe5754a7a..0000000000
> --- a/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-
> MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 62e178ddae24c7633d2a03b129dc52261e0a15bf Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 7 Feb 2018 00:48:03 -0800
> -Subject: [PATCH] Define MESA_EGL_NO_X11_HEADERS before including
> eglplatform.h
> - when X11 is disabled
> -
> -This helps in compiling when GL implementations e.g. mesa use
> -this define to exclude X11 headers
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Submitted [https://github.com/anholt/libepoxy/pull/153]
> -
> - src/dispatch_common.h | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -Index: libepoxy-1.4.3/src/dispatch_common.h
> -===================================================================
> ---- libepoxy-1.4.3.orig/src/dispatch_common.h
> -+++ libepoxy-1.4.3/src/dispatch_common.h
> -@@ -46,6 +46,9 @@
> - #include "epoxy/glx.h"
> - #endif
> - #if PLATFORM_HAS_EGL
> -+#if !PLATFORM_HAS_GLX
> -+#define MESA_EGL_NO_X11_HEADERS 1
> -+#endif
> - #include "epoxy/egl.h"
> - #endif
> - #if PLATFORM_HAS_WGL
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-
> it-possible-to-disable-the-use-of-dlvsym-needed.patch
> b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-
> it-possible-to-disable-the-use-of-dlvsym-needed.patch
> index c2a2fa3453..5bddc12033 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-
> it-possible-to-disable-the-use-of-dlvsym-needed.patch
> +++ b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-
> it-possible-to-disable-the-use-of-dlvsym-needed.patch
> @@ -1,36 +1,38 @@
> -From 7bcefd311cd696955376fe2c5298ec85e8f954ce Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 15 Nov 2017 12:48:27 +0200
> +From 9c964427656ef71210e2c5b48b279857806574e9 Mon Sep 17 00:00:00 2001
> +From: Francesco Giancane <francescogiancane8@gmail.com>
> +Date: Wed, 28 Feb 2018 21:32:24 +0100
>  Subject: [PATCH] Make it possible to disable the use of dlvsym() (needed
> for
>   musl)
>
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +Add a patch to work around absence of dlvsym() on musl
> +(wasn't previously a problem as autotools weren't building tests by
> default)
>
> +Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> +Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
>  ---
>   meson_options.txt | 3 +++
>   test/meson.build  | 6 +++---
>   2 files changed, 6 insertions(+), 3 deletions(-)
>
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 244476a..071f0b6 100644
> +index b5d7c98..aa849c2 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
>  @@ -1,6 +1,9 @@
> - option('enable-docs',
> + option('docs',
>          type: 'boolean', value: false,
>          description: 'Enable generating the Epoxy API reference (depends
> on Doxygen)')
>  +option('has-dlvsym',
>  +       type: 'boolean', value: true,
>  +       description: 'Whether dlvsym() is available (it is not when using
> musl C library)')
> - option('enable-glx',
> + option('glx',
>          type: 'combo',
>          choices: [ 'auto', 'yes', 'no' ],
>  diff --git a/test/meson.build b/test/meson.build
> -index 2340fc6..bc4330b 100644
> +index c5788b4..4c46ae6 100644
>  --- a/test/meson.build
>  +++ b/test/meson.build
> -@@ -86,8 +86,8 @@ if build_glx
> +@@ -92,8 +92,8 @@ if build_glx
>       [ 'glx_has_extension_nocontext', [ 'glx_has_extension_nocontext.c'
> ], [], [], true ],
>       [ 'glx_static', [ 'glx_static.c' ], [ '-DNEEDS_TO_BE_STATIC'], [
> '-static' ], libtype == 'static' ],
>       [ 'glx_shared_znow', [ 'glx_static.c', ], [], [ '-Wl,-z,now' ],
> has_znow ],
> @@ -41,7 +43,7 @@ index 2340fc6..bc4330b 100644
>     ]
>
>     foreach test: glx_tests
> -@@ -108,7 +108,7 @@ if build_glx
> +@@ -114,7 +114,7 @@ if build_glx
>       endif
>     endforeach
>
> @@ -51,5 +53,5 @@ index 2340fc6..bc4330b 100644
>       if build_egl
>         glx_egl_sources = [
>  --
> -2.15.0
> +2.14.3
>
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy/Add-
> fallback-definition-for-EGL-CAST.patch b/meta/recipes-graphics/
> libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
> deleted file mode 100644
> index b9297257dc..0000000000
> --- a/meta/recipes-graphics/libepoxy/libepoxy/Add-
> fallback-definition-for-EGL-CAST.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Add fallback definition for EGL_CAST
> -
> -The EGL API update from d11104f introduced a dependency on the
> -EGL_CAST() macro, provided by an updated eglplatform.h. Given that we
> -don't provide eglplatform.h, add a fallback definition for if we're
> -building against Mesa 17.0.x or similar.
> -
> -https://bugs.gentoo.org/show_bug.cgi?id=623926
> -
> -Upstream-Status: Backport [https://github.com/anholt/libepoxy/commit/
> ebe3a53db1c0bb34e1ca963b95d1f222115f93f8]
> -
> -Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> -
> -Index: libepoxy-1.4.3/src/gen_dispatch.py
> -===================================================================
> ---- libepoxy-1.4.3.orig/src/gen_dispatch.py    2017-06-06
> 04:24:13.000000000 -0500
> -+++ libepoxy-1.4.3/src/gen_dispatch.py 2017-11-06 12:45:43.594966473
> -0600
> -@@ -491,6 +491,15 @@
> -             self.outln('#include "epoxy/gl.h"')
> -             if self.target == "egl":
> -                 self.outln('#include "EGL/eglplatform.h"')
> -+                # Account for older eglplatform.h, which doesn't define
> -+                # the EGL_CAST macro.
> -+                self.outln('#ifndef EGL_CAST')
> -+                self.outln('#if defined(__cplusplus)')
> -+                self.outln('#define EGL_CAST(type, value)
> (static_cast<type>(value))')
> -+                self.outln('#else')
> -+                self.outln('#define EGL_CAST(type, value) ((type)
> (value))')
> -+                self.outln('#endif')
> -+                self.outln('#endif')
> -         else:
> -             # Add some ridiculous inttypes.h redefinitions that are
> -             # from khrplatform.h and not included in the XML.  We
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
> b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
> similarity index 61%
> rename from meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
> rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
> index 8a5cb8f49f..dfdd19248d 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
> @@ -6,12 +6,10 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
>
>  SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/$
> {BP}.tar.xz \
> -           file://Add-fallback-definition-for-EGL-CAST.patch \
>             file://0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
> \
> -           file://0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
> \
>             "
> -SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
> -SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8b
> c7fb2fda074478e329b063c1f872b826f6"
> +SRC_URI[md5sum] = "63fe3847789258254dcd7e3fdb9e7f5e"
> +SRC_URI[sha256sum] = "4c94995398a6ebf691600dda2e9685
> a0cac261414175c2adf4645cdfab42a5d5"
>  UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
>
>  inherit meson pkgconfig distro_features_check
> @@ -20,8 +18,8 @@ REQUIRED_DISTRO_FEATURES = "opengl"
>
>  DEPENDS = "util-macros"
>
> -PACKAGECONFIG[egl] = "-Denable-egl=yes, -Denable-egl=no, virtual/egl"
> -PACKAGECONFIG[x11] = "-Denable-glx=yes, -Denable-glx=no, virtual/libx11"
> +PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
> +PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
>
>  EXTRA_OEMESON_append_libc-musl = " -Dhas-dlvsym=false "
> --
> 2.14.3
>
>

--94eb2c196f749182b805664d045c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Sorry again. The patch was based on=
 openembedded-core rather than poky, and this is why the patchwork failed t=
o apply it.</div><div>This should be the last one.</div><div><br></div><div=
>Thanks for the patience,</div><div class=3D"gmail_extra"><br clear=3D"all"=
><div><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">Francesco Giancan=
e</div><div dir=3D"ltr"><br></div></div></div></div></div></div></div>
<br><div class=3D"gmail_quote">2018-02-28 23:08 GMT+01:00 Francesco Giancan=
e <span dir=3D"ltr">&lt;<a href=3D"mailto:francescogiancane8@gmail.com" tar=
get=3D"_blank">francescogiancane8@gmail.com</a>&gt;</span>:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><span class=3D"">libepoxy 1.4.3 did not compile successf=
ully because of<br>
implicit symbol definitions and link-time errors.<br>
A new recipe with latest libepoxy release (1.5.0) which<br>
successfully compiles is provided.<br>
<br>
</span><span class=3D"">Patch to disable &#39;dlvsym&#39; has also been for=
ward-ported<br>
to be applicable to version 1.5.0.<br>
The patch &#39;Add-fallback-definition-for-<wbr>EGL-CAST.patch&#39; is<br>
mainline now; thus it can be safely removed.<br>
</span>Also, the patch<br>
0001-Define-MESA_EGL_NO_X11_<wbr>HEADERS-before-including-eglp.<wbr>patch<b=
r>
is no longer required since mainline fixed this too.<br>
<span class=3D""><br>
Signed-off-by: Francesco Giancane &lt;<a href=3D"mailto:francescogiancane8@=
gmail.com">francescogiancane8@gmail.com</a>&gt;<br>
---<br>
</span>=C2=A0..._EGL_NO_X11_HEADERS-before-<wbr>including-eglp.patch | 30 -=
-------------------<br>
<span class=3D"">=C2=A0...sible-to-disable-the-use-<wbr>of-dlvsym-needed.pa=
tch | 26 +++++++++--------<br>
=C2=A0.../Add-fallback-definition-<wbr>for-EGL-CAST.patch=C2=A0 =C2=A0 =C2=
=A0| 33 ----------------------<br>
</span>=C2=A0.../{<a href=3D"http://libepoxy_1.4.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libepoxy_1.4.3.bb</a> =3D&gt; <a href=3D"http://libepoxy_1=
.5.0.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 10 +++----<br>
=C2=A04 files changed, 18 insertions(+), 81 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/<wbr>libepoxy/libepoxy/0001-=
Define-<wbr>MESA_EGL_NO_X11_HEADERS-<wbr>before-including-eglp.patch<br>
=C2=A0delete mode 100644 meta/recipes-graphics/<wbr>libepoxy/libepoxy/Add-<=
wbr>fallback-definition-for-EGL-<wbr>CAST.patch<br>
=C2=A0rename meta/recipes-graphics/<wbr>libepoxy/{<a href=3D"http://libepox=
y_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a> =3D&=
gt; <a href=3D"http://libepoxy_1.5.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">libepoxy_1.5.0.bb</a>} (61%)<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>libepoxy/libepoxy/0001-Define-<wbr>=
MESA_EGL_NO_X11_HEADERS-<wbr>before-including-eglp.patch b/meta/recipes-gra=
phics/<wbr>libepoxy/libepoxy/0001-Define-<wbr>MESA_EGL_NO_X11_HEADERS-<wbr>=
before-including-eglp.patch<br>
deleted file mode 100644<br>
index ebe5754a7a..0000000000<br>
--- a/meta/recipes-graphics/<wbr>libepoxy/libepoxy/0001-Define-<wbr>MESA_EG=
L_NO_X11_HEADERS-<wbr>before-including-eglp.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-From 62e178ddae24c7633d2a03b129dc52<wbr>261e0a15bf Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Wed, 7 Feb 2018 00:48:<a href=3D"tel:03%20-0800" value=3D"+39030800"=
>03 -0800</a><br>
-Subject: [PATCH] Define MESA_EGL_NO_X11_HEADERS before including eglplatfo=
rm.h<br>
- when X11 is disabled<br>
-<br>
-This helps in compiling when GL implementations e.g. mesa use<br>
-this define to exclude X11 headers<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/anholt/libepoxy/=
pull/153" rel=3D"noreferrer" target=3D"_blank">https://github.com/anholt/<w=
br>libepoxy/pull/153</a>]<br>
-<br>
- src/dispatch_common.h | 3 +++<br>
- 1 file changed, 3 insertions(+)<br>
-<br>
-Index: libepoxy-1.4.3/src/dispatch_<wbr>common.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libepoxy-1.4.3.orig/src/<wbr>dispatch_common.h<br>
-+++ libepoxy-1.4.3/src/dispatch_<wbr>common.h<br>
-@@ -46,6 +46,9 @@<br>
- #include &quot;epoxy/glx.h&quot;<br>
- #endif<br>
- #if PLATFORM_HAS_EGL<br>
-+#if !PLATFORM_HAS_GLX<br>
-+#define MESA_EGL_NO_X11_HEADERS 1<br>
-+#endif<br>
- #include &quot;epoxy/egl.h&quot;<br>
- #endif<br>
- #if PLATFORM_HAS_WGL<br>
<div><div class=3D"h5">diff --git a/meta/recipes-graphics/<wbr>libepoxy/lib=
epoxy/0001-Make-<wbr>it-possible-to-disable-the-<wbr>use-of-dlvsym-needed.p=
atch b/meta/recipes-graphics/<wbr>libepoxy/libepoxy/0001-Make-<wbr>it-possi=
ble-to-disable-the-<wbr>use-of-dlvsym-needed.patch<br>
index c2a2fa3453..5bddc12033 100644<br>
--- a/meta/recipes-graphics/<wbr>libepoxy/libepoxy/0001-Make-<wbr>it-possib=
le-to-disable-the-<wbr>use-of-dlvsym-needed.patch<br>
+++ b/meta/recipes-graphics/<wbr>libepoxy/libepoxy/0001-Make-<wbr>it-possib=
le-to-disable-the-<wbr>use-of-dlvsym-needed.patch<br>
@@ -1,36 +1,38 @@<br>
-From 7bcefd311cd696955376fe2c5298ec<wbr>85e8f954ce Mon Sep 17 00:00:00 200=
1<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
-Date: Wed, 15 Nov 2017 12:48:27 +0200<br>
+From 9c964427656ef71210e2c5b48b2798<wbr>57806574e9 Mon Sep 17 00:00:00 200=
1<br>
+From: Francesco Giancane &lt;<a href=3D"mailto:francescogiancane8@gmail.co=
m">francescogiancane8@gmail.com</a>&gt;<br>
+Date: Wed, 28 Feb 2018 21:32:24 +0100<br>
=C2=A0Subject: [PATCH] Make it possible to disable the use of dlvsym() (nee=
ded for<br>
=C2=A0 musl)<br>
<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+Add a patch to work around absence of dlvsym() on musl<br>
+(wasn&#39;t previously a problem as autotools weren&#39;t building tests b=
y default)<br>
<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@l=
inux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
+Signed-off-by: Francesco Giancane &lt;<a href=3D"mailto:francescogiancane8=
@gmail.com">francescogiancane8@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 meson_options.txt | 3 +++<br>
=C2=A0 test/meson.build=C2=A0 | 6 +++---<br>
=C2=A0 2 files changed, 6 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/meson_options.txt b/meson_options.txt<br>
-index 244476a..071f0b6 100644<br>
+index b5d7c98..aa849c2 100644<br>
=C2=A0--- a/meson_options.txt<br>
=C2=A0+++ b/meson_options.txt<br>
=C2=A0@@ -1,6 +1,9 @@<br>
- option(&#39;enable-docs&#39;,<br>
+ option(&#39;docs&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type: &#39;boolean&#39;, value: false,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Enable generating the E=
poxy API reference (depends on Doxygen)&#39;)<br>
=C2=A0+option(&#39;has-dlvsym&#39;,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0type: &#39;boolean&#39;, value: true,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Whether dlvsym() is ava=
ilable (it is not when using musl C library)&#39;)<br>
- option(&#39;enable-glx&#39;,<br>
+ option(&#39;glx&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type: &#39;combo&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [ &#39;auto&#39;, &#39;yes&#39;,=
 &#39;no&#39; ],<br>
=C2=A0diff --git a/test/meson.build b/test/meson.build<br>
-index 2340fc6..bc4330b 100644<br>
+index c5788b4..4c46ae6 100644<br>
=C2=A0--- a/test/meson.build<br>
=C2=A0+++ b/test/meson.build<br>
-@@ -86,8 +86,8 @@ if build_glx<br>
+@@ -92,8 +92,8 @@ if build_glx<br>
=C2=A0 =C2=A0 =C2=A0 [ &#39;glx_has_extension_nocontext&#39;, [ &#39;glx_ha=
s_extension_nocontext.<wbr>c&#39; ], [], [], true ],<br>
=C2=A0 =C2=A0 =C2=A0 [ &#39;glx_static&#39;, [ &#39;glx_static.c&#39; ], [ =
&#39;-DNEEDS_TO_BE_STATIC&#39;], [ &#39;-static&#39; ], libtype =3D=3D &#39=
;static&#39; ],<br>
=C2=A0 =C2=A0 =C2=A0 [ &#39;glx_shared_znow&#39;, [ &#39;glx_static.c&#39;,=
 ], [], [ &#39;-Wl,-z,now&#39; ], has_znow ],<br>
@@ -41,7 +43,7 @@ index 2340fc6..bc4330b 100644<br>
=C2=A0 =C2=A0 ]<br>
<br>
=C2=A0 =C2=A0 foreach test: glx_tests<br>
-@@ -108,7 +108,7 @@ if build_glx<br>
+@@ -114,7 +114,7 @@ if build_glx<br>
=C2=A0 =C2=A0 =C2=A0 endif<br>
=C2=A0 =C2=A0 endforeach<br>
<br>
@@ -51,5 +53,5 @@ index 2340fc6..bc4330b 100644<br>
=C2=A0 =C2=A0 =C2=A0 if build_egl<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 glx_egl_sources =3D [<br>
=C2=A0--<br>
-2.15.0<br>
+2.14.3<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>libepoxy/libepoxy/Add-<wbr>fallback=
-definition-for-EGL-<wbr>CAST.patch b/meta/recipes-graphics/<wbr>libepoxy/l=
ibepoxy/Add-<wbr>fallback-definition-for-EGL-<wbr>CAST.patch<br>
deleted file mode 100644<br>
index b9297257dc..0000000000<br>
--- a/meta/recipes-graphics/<wbr>libepoxy/libepoxy/Add-<wbr>fallback-defini=
tion-for-EGL-<wbr>CAST.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-Add fallback definition for EGL_CAST<br>
-<br>
-The EGL API update from d11104f introduced a dependency on the<br>
-EGL_CAST() macro, provided by an updated eglplatform.h. Given that we<br>
-don&#39;t provide eglplatform.h, add a fallback definition for if we&#39;r=
e<br>
-building against Mesa 17.0.x or similar.<br>
-<br>
-<a href=3D"https://bugs.gentoo.org/show_bug.cgi?id=3D623926" rel=3D"norefe=
rrer" target=3D"_blank">https://bugs.gentoo.org/show_<wbr>bug.cgi?id=3D6239=
26</a><br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/anholt/libepoxy/c=
ommit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/anholt/<wbr>libepoxy/commit/<wbr>ebe3a53db1c=
0bb34e1ca963b95d1f2<wbr>22115f93f8</a>]<br>
-<br>
-Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.com">=
tom.hochstein@nxp.com</a>&gt;<br>
-<br>
-Index: libepoxy-1.4.3/src/gen_<wbr>dispatch.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- libepoxy-1.4.3.orig/src/gen_<wbr>dispatch.py=C2=A0 =C2=A0 2017-06-06 0=
4:24:13.000000000 -0500<br>
-+++ libepoxy-1.4.3/src/gen_<wbr>dispatch.py 2017-11-06 12:45:43.594966473 =
-0600<br>
-@@ -491,6 +491,15 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.outln(&#39;#include &=
quot;epoxy/gl.h&quot;&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.target =3D=3D &quo=
t;egl&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.outln(&=
#39;#include &quot;EGL/eglplatform.h&quot;&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Account for old=
er eglplatform.h, which doesn&#39;t define<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the EGL_CAST ma=
cro.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&#39;#=
ifndef EGL_CAST&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&#39;#=
if defined(__cplusplus)&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&#39;#=
define EGL_CAST(type, value) (static_cast&lt;type&gt;(value))&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&#39;#=
else&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&#39;#=
define EGL_CAST(type, value) ((type) (value))&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&#39;#=
endif&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&#39;#=
endif&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Add some ridiculous intt=
ypes.h redefinitions that are<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# from khrplatform.h and n=
ot included in the XML.=C2=A0 We<br>
diff --git a/meta/recipes-graphics/<wbr>libepoxy/<a href=3D"http://libepoxy=
_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a> b/met=
a/recipes-graphics/<wbr>libepoxy/<a href=3D"http://libepoxy_1.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a><br>
</div></div>similarity index 61%<br>
<span class=3D"">rename from meta/recipes-graphics/<wbr>libepoxy/<a href=3D=
"http://libepoxy_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.=
4.3.bb</a><br>
rename to meta/recipes-graphics/<wbr>libepoxy/<a href=3D"http://libepoxy_1.=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a><br>
</span>index 8a5cb8f49f..dfdd19248d 100644<br>
--- a/meta/recipes-graphics/<wbr>libepoxy/<a href=3D"http://libepoxy_1.4.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>libepoxy/<a href=3D"http://libepoxy_1.5.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a><br>
@@ -6,12 +6,10 @@ LICENSE =3D &quot;MIT&quot;<br>
<span class=3D"">=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr=
>58ef4c80d401e07bd9ee8b6b58cf46<wbr>4b&quot;<br>
<br>
</span><span class=3D"">=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.c=
om/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/anholt/${<wbr>BPN}/releases/download/${=
PV}/$<wbr>{BP}.tar.xz</a> \<br>
</span><span class=3D"">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Ad=
d-fallback-<wbr>definition-for-EGL-CAST.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Make-it-possible-<wbr=
>to-disable-the-use-of-dlvsym-<wbr>needed.patch \<br>
</span>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Define-MESA_EG=
L_<wbr>NO_X11_HEADERS-before-<wbr>including-eglp.patch \<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>af4c3ce0fb1143bdc4e43f85695a9b<wbr>ed&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>0b808a06c9685a62fca34b680abb8b<wbr>c7fb2=
fda074478e329b063c1f872b8<wbr>26f6&quot;<br>
</span><span class=3D"">+SRC_URI[md5sum] =3D &quot;<wbr>63fe3847789258254dc=
d7e3fdb9e7f<wbr>5e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>4c94995398a6ebf691600dda2e9685<wbr>a0cac=
261414175c2adf4645cdfab42<wbr>a5d5&quot;<br>
</span><span class=3D"">=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https=
://github.com/anholt/libepoxy/releases" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/anholt/<wbr>libepoxy/releases</a>&quot;<br>
<br>
=C2=A0inherit meson pkgconfig distro_features_check<br>
</span>@@ -20,8 +18,8 @@ REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br=
>
<span class=3D"im HOEnZb"><br>
=C2=A0DEPENDS =3D &quot;util-macros&quot;<br>
<br>
-PACKAGECONFIG[egl] =3D &quot;-Denable-egl=3Dyes, -Denable-egl=3Dno, virtua=
l/egl&quot;<br>
-PACKAGECONFIG[x11] =3D &quot;-Denable-glx=3Dyes, -Denable-glx=3Dno, virtua=
l/libx11&quot;<br>
+PACKAGECONFIG[egl] =3D &quot;-Degl=3Dyes, -Degl=3Dno, virtual/egl&quot;<br=
>
+PACKAGECONFIG[x11] =3D &quot;-Dglx=3Dyes, -Dglx=3Dno, virtual/libx11 virtu=
al/libgl&quot;<br>
</span><span class=3D"im HOEnZb">=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.util=
s.filter(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;x11&#39;, d)} egl&quot;<br>
<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">=C2=A0EXTRA_OEMESON_append_l=
ibc-musl =3D &quot; -Dhas-dlvsym=3Dfalse &quot;<br>
--<br>
2.14.3<br>
<br>
</div></div></blockquote></div><br></div></div>

--94eb2c196f749182b805664d045c--
