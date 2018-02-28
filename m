Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7B5A78909
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 22:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EED071867B;
	Wed, 28 Feb 2018 23:57:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RxtzEZAidHzO; Wed, 28 Feb 2018 23:57:01 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 04FFD18678;
	Wed, 28 Feb 2018 23:57:01 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D318C1A07F;
	Wed, 28 Feb 2018 23:57:00 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7E0C1A07D;
	Wed, 28 Feb 2018 23:57:00 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 28 Feb 2018 23:57:00 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id BC24721B7;
	Wed, 28 Feb 2018 23:57:00 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 28 Feb 2018 23:57:00 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 28 Feb 2018 23:57:00 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Wed, 28 Feb 2018 23:57:00 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Francesco Giancane <francescogiancane8@gmail.com>
Thread-Topic: [OE-core] [meta-oe][PATCH v3] libepoxy: New recipe updated to
	latest release
Thread-Index: AQHTsODqFWfZplrFDUiXspIgetgUEKO6Z5Ow
Date: Wed, 28 Feb 2018 22:57:00 +0000
Message-ID: <ee96cca916ba401b99a626c2a1d4fe26@XBOX02.axis.com>
References: <20180228220845.8906-1-francescogiancane8@gmail.com>
In-Reply-To: <20180228220845.8906-1-francescogiancane8@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] libepoxy: New recipe updated to	latest release
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
X-List-Received-Date: Wed, 28 Feb 2018 22:57:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Francesco Giancane
> Sent: den 28 februari 2018 23:09
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [meta-oe][PATCH v3] libepoxy: New recipe updated to la=
test release

This isn't in meta-oe, it's in meta. ;)

I suggest changing the subject to:

libepoxy: Update to 1.5.0

since it's not a new recipe, and "latest release" carries a lot=20
less information than the actual version.

> libepoxy 1.4.3 did not compile successfully because of
> implicit symbol definitions and link-time errors.
> A new recipe with latest libepoxy release (1.5.0) which
> successfully compiles is provided.

I'd remove the second sentence. All that information is=20
conveyed by the updated subject anyway.

> Patch to disable 'dlvsym' has also been forward-ported
> to be applicable to version 1.5.0.
> The patch 'Add-fallback-definition-for-EGL-CAST.patch' is
> mainline now; thus it can be safely removed.
> Also, the patch
> 0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
> is no longer required since mainline fixed this too.
>=20
> Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
> ---
>  ..._EGL_NO_X11_HEADERS-before-including-eglp.patch | 30 ----------------=
----
>  ...sible-to-disable-the-use-of-dlvsym-needed.patch | 26 +++++++++-------=
-
>  .../Add-fallback-definition-for-EGL-CAST.patch     | 33 ----------------=
------
>  .../{libepoxy_1.4.3.bb =3D> libepoxy_1.5.0.bb}       | 10 +++----
>  4 files changed, 18 insertions(+), 81 deletions(-)
>  delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-Define-M=
ESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
>  delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-=
definition-for-EGL-CAST.patch
>  rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.3.bb =3D> libepoxy_1=
.5.0.bb} (61%)
>=20
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_EGL=
_NO_X11_HEADERS-before-including-eglp.patch b/meta/recipes-graphics/libepox=
y/libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
> deleted file mode 100644
> index ebe5754a7a..0000000000
> --- a/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_EGL_NO_X11=
_HEADERS-before-including-eglp.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 62e178ddae24c7633d2a03b129dc52261e0a15bf Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 7 Feb 2018 00:48:03 -0800
> -Subject: [PATCH] Define MESA_EGL_NO_X11_HEADERS before including eglplat=
form.h
> - when X11 is disabled
> -
> -This helps in compiling when GL implementations e.g. mesa use
> -this define to exclude X11 headers
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Submitted
> [https://github.com/anholt/libepoxy/pull/153]
> -
> - src/dispatch_common.h | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -Index: libepoxy-1.4.3/src/dispatch_common.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possibl=
e-to-disable-the-use-of-dlvsym-needed.patch b/meta/recipes-graphics/libepox=
y/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
> index c2a2fa3453..5bddc12033 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-di=
sable-the-use-of-dlvsym-needed.patch
> +++ b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-di=
sable-the-use-of-dlvsym-needed.patch
> @@ -1,36 +1,38 @@
> -From 7bcefd311cd696955376fe2c5298ec85e8f954ce Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 15 Nov 2017 12:48:27 +0200
> +From 9c964427656ef71210e2c5b48b279857806574e9 Mon Sep 17 00:00:00 2001
> +From: Francesco Giancane <francescogiancane8@gmail.com>
> +Date: Wed, 28 Feb 2018 21:32:24 +0100
>  Subject: [PATCH] Make it possible to disable the use of dlvsym() (needed=
 for
>   musl)
>=20
> -Upstream-Status: Pending

Don't remove the Upstream-Status.

> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +Add a patch to work around absence of dlvsym() on musl
> +(wasn't previously a problem as autotools weren't building tests by defa=
ult)
>=20
> +Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> +Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
>  ---
>   meson_options.txt | 3 +++
>   test/meson.build  | 6 +++---
>   2 files changed, 6 insertions(+), 3 deletions(-)
>=20
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 244476a..071f0b6 100644
> +index b5d7c98..aa849c2 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
>  @@ -1,6 +1,9 @@
> - option('enable-docs',
> + option('docs',
>          type: 'boolean', value: false,
>          description: 'Enable generating the Epoxy API reference (depends=
 on Doxygen)')
>  +option('has-dlvsym',
>  +       type: 'boolean', value: true,
>  +       description: 'Whether dlvsym() is available (it is not when usin=
g musl C library)')
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
>       [ 'glx_has_extension_nocontext', [ 'glx_has_extension_nocontext.c' =
], [], [], true ],
>       [ 'glx_static', [ 'glx_static.c' ], [ '-DNEEDS_TO_BE_STATIC'], [ '-=
static' ], libtype =3D=3D 'static' ],
>       [ 'glx_shared_znow', [ 'glx_static.c', ], [], [ '-Wl,-z,now' ], has=
_znow ],
> @@ -41,7 +43,7 @@ index 2340fc6..bc4330b 100644
>     ]
>=20
>     foreach test: glx_tests
> -@@ -108,7 +108,7 @@ if build_glx
> +@@ -114,7 +114,7 @@ if build_glx
>       endif
>     endforeach
>=20
> @@ -51,5 +53,5 @@ index 2340fc6..bc4330b 100644
>       if build_egl
>         glx_egl_sources =3D [
>  --
> -2.15.0
> +2.14.3
>=20
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definit=
ion-for-EGL-CAST.patch b/meta/recipes-graphics/libepoxy/libepoxy/Add-fallba=
ck-definition-for-EGL-CAST.patch
> deleted file mode 100644
> index b9297257dc..0000000000
> --- a/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for=
-EGL-CAST.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Add fallback definition for EGL_CAST
> -
> -The EGL API update from d11104f introduced a dependency on the
> -EGL_CAST() macro, provided by an updated eglplatform.h. Given that we
> -don't provide eglplatform.h, add a fallback definition for if we're
> -building against Mesa 17.0.x or similar.
> -
> -https://bugs.gentoo.org/show_bug.cgi?id=3D623926
> -
> -Upstream-Status: Backport [https://github.com/anholt/libepoxy/commit/ebe=
3a53db1c0bb34e1ca963b95d1f222115f93f8]
> -
> -Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> -
> -Index: libepoxy-1.4.3/src/gen_dispatch.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libepoxy-1.4.3.orig/src/gen_dispatch.py	2017-06-06
> 04:24:13.000000000 -0500
> -+++ libepoxy-1.4.3/src/gen_dispatch.py	2017-11-06
> 12:45:43.594966473 -0600
> -@@ -491,6 +491,15 @@
> -             self.outln('#include "epoxy/gl.h"')
> -             if self.target =3D=3D "egl":
> -                 self.outln('#include "EGL/eglplatform.h"')
> -+                # Account for older eglplatform.h, which doesn't define
> -+                # the EGL_CAST macro.
> -+                self.outln('#ifndef EGL_CAST')
> -+                self.outln('#if defined(__cplusplus)')
> -+                self.outln('#define EGL_CAST(type, value) (static_cast<=
type>(value))')
> -+                self.outln('#else')
> -+                self.outln('#define EGL_CAST(type, value) ((type) (valu=
e))')
> -+                self.outln('#endif')
> -+                self.outln('#endif')
> -         else:
> -             # Add some ridiculous inttypes.h redefinitions that are
> -             # from khrplatform.h and not included in the XML.  We
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb b/meta/reci=
pes-graphics/libepoxy/libepoxy_1.5.0.bb
> similarity index 61%
> rename from meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
> rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
> index 8a5cb8f49f..dfdd19248d 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
> @@ -6,12 +6,10 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D58ef4c80d401e07bd9ee8b6b58cf4=
64b"
>=20
>  SRC_URI =3D "https://github.com/anholt/${BPN}/releases/download/${PV}/${=
BP}.tar.xz \
> -           file://Add-fallback-definition-for-EGL-CAST.patch \
>             file://0001-Make-it-possible-to-disable-the-use-of-dlvsym-nee=
ded.patch \
> -           file://0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-e=
glp.patch \
>             "
> -SRC_URI[md5sum] =3D "af4c3ce0fb1143bdc4e43f85695a9bed"
> -SRC_URI[sha256sum] =3D "0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329=
b063c1f872b826f6"
> +SRC_URI[md5sum] =3D "63fe3847789258254dcd7e3fdb9e7f5e"
> +SRC_URI[sha256sum] =3D "4c94995398a6ebf691600dda2e9685a0cac261414175c2ad=
f4645cdfab42a5d5"
>  UPSTREAM_CHECK_URI =3D "https://github.com/anholt/libepoxy/releases"
>=20
>  inherit meson pkgconfig distro_features_check
> @@ -20,8 +18,8 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
>=20
>  DEPENDS =3D "util-macros"
>=20
> -PACKAGECONFIG[egl] =3D "-Denable-egl=3Dyes, -Denable-egl=3Dno, virtual/e=
gl"
> -PACKAGECONFIG[x11] =3D "-Denable-glx=3Dyes, -Denable-glx=3Dno, virtual/l=
ibx11"
> +PACKAGECONFIG[egl] =3D "-Degl=3Dyes, -Degl=3Dno, virtual/egl"
> +PACKAGECONFIG[x11] =3D "-Dglx=3Dyes, -Dglx=3Dno, virtual/libx11 virtual/=
libgl"
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} eg=
l"
>=20
>  EXTRA_OEMESON_append_libc-musl =3D " -Dhas-dlvsym=3Dfalse "
> --
> 2.14.3

//Peter


