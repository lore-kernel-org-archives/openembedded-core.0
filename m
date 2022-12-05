Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91241C47089
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 14:32:35 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.16446.1670250749852501005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 06:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KUL8VwUo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3F751C0007;
	Mon,  5 Dec 2022 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670250747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08bnO/mrv9EFVRd5MHm27CryGyD3Az61xNxqJvxwlbg=;
	b=KUL8VwUoHESyajebdsHuaL8pTKzIBmKsoAgS1wrZtY7boQXy7btfxBTPFKp7ezK53jK14S
	G7DL1xE7+lWQ0XmImze+5gFcS5t5D/n9GlJaWQrPgRRvpm5TKLVp0+B2D60/yOmQp0tKMQ
	dh04ctat9K7CaUNAPNNiEPBnUGdpCnZsilEehItnpXmjKv9sm5P+36tzasRYsbovnj5PUj
	nyKFaa0vU1dD9vhfWzD99ot+yp5jw1YArw3KSnj5CKLzPCf7RnYez5G7vM3xLVbrvaRUop
	n38al/B31moEZG+29iVrmq10g4jnGYvpCcEvS2cMMjSaTkgMML5V/M3WQSDepg==
Date: Mon, 5 Dec 2022 15:32:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
Message-ID: <Y44A+3v1z+4YztFg@mail.local>
References: <20221201173942.1218836-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221201173942.1218836-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 14:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174289

Hello,

This caused:

| FAILED: gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o
| x86_64-poky-linux-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat=
-security -Werror=3Dformat-security --sysroot=3D/home/pokybuild/yocto-worke=
r/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4=
-r0/recipe-sysroot -Igst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p -Igst-libs/g=
st/vaapi -I../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi -I. -I../gstreamer-=
vaapi-1.20.4 -Igst-libs -I../gstreamer-vaapi-1.20.4/gst-libs -I/home/pokybu=
ild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1=
=2E0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/gstreamer-1.0 -I/home/pokyb=
uild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer=
1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/y=
octo-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-va=
api/1.20.4-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yoc=
to-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaap=
i/1.20.4-r0/recipe-sysroot/usr/include/orc-0.4 -I/home/pokybuild/yocto-work=
er/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.=
4-r0/recipe-sysroot/usr/lib/gstreamer-1.0/include -I/home/pokybuild/yocto-w=
orker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.=
20.4-r0/recipe-sysroot/usr/include/libdrm -fdiagnostics-color=3Dalways -D_F=
ILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -fvisibility=3Dhidden -fno-strict-=
aliasing -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/=
home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux=
/gstreamer1.0-vaapi/1.20.4-r0/gstreamer-vaapi-1.20.4=3D/usr/src/debug/gstre=
amer1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/n=
o-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0=
/gstreamer-vaapi-1.20.4=3D/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 -fmac=
ro-prefix-map=3D/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/co=
re2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/build=3D/usr/src/debug/gstre=
amer1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/n=
o-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0=
/build=3D/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/=
home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux=
/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot=3D -fmacro-prefix-map=3D/home/=
pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstr=
eamer1.0-vaapi/1.20.4-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/pokyb=
uild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer=
1.0-vaapi/1.20.4-r0/recipe-sysroot-native=3D -fPIC -pthread -DHAVE_CONFIG_H=
 -DGST_USE_UNSTABLE_API '-DGST_VAAPI_VERSION_ID=3D"1.20.4"' -MD -MQ gst-lib=
s/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o -MF gst-libs/gst=
/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o.d -o gst-libs/gst/vaa=
pi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o -c ../gstreamer-vaapi-1.2=
0.4/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
| In file included from /home/pokybuild/yocto-worker/no-x11/build/build/tmp=
/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/i=
nclude/EGL/egl.h:20,
|                  from ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstvaa=
pidisplay_egl.h:26,
|                  from ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstvaa=
pidisplay_egl.c:24:
| /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-li=
nux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/EGL/eglplatform=
=2Eh:109:10: fatal error: X11/Xlib.h: No such file or directory
|   109 | #include <X11/Xlib.h>
|       |          ^~~~~~~~~~~~
| compilation terminated.
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-6=
4-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.281472:153 ex=
it 1 from 'ninja -v -j 16 -l 52'
| WARNING: Backtrace (BB generated script):
| 	#1: meson_do_compile, /home/pokybuild/yocto-worker/no-x11/build/build/tm=
p/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile=
=2E281472, line 153
| 	#2: do_compile, /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work=
/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.28147=
2, line 148
| 	#3: main, /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2=
-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.281472, lin=
e 157
NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multime=
dia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_compile) failed with exit cod=
e '1'


https://autobuilder.yoctoproject.org/typhoon/#builders/40/builds/6280/steps=
/11/logs/stdio

On 01/12/2022 18:39:42+0100, Markus Volk wrote:
> - remove deprecated xvmc PACKAGECONFIG
> - remove futex.h patch. Code has been reworked, still needed?
>=20
> Note: mesa-22.3.0 will require libperfetto update to v28. Otherwise compi=
lation will fail.
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...fine-__NR_futex-if-it-does-not-exist.patch | 34 -------------------
>  ...k-for-all-linux-host_os-combinations.patch |  7 ++--
>  .../{mesa-gl_22.2.3.bb =3D> mesa-gl_22.3.0.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           |  4 +--
>  .../mesa/{mesa_22.2.3.bb =3D> mesa_22.3.0.bb}   |  0
>  5 files changed, 5 insertions(+), 40 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-futex.h-Define-=
__NR_futex-if-it-does-not-exist.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_22.2.3.bb =3D> mesa-gl_22.3.0=
=2Ebb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_22.2.3.bb =3D> mesa_22.3.0.bb} (=
100%)
>=20
> diff --git a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_fu=
tex-if-it-does-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-fute=
x.h-Define-__NR_futex-if-it-does-not-exist.patch
> deleted file mode 100644
> index e7d92197be..0000000000
> --- a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-=
it-does-not-exist.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 859bfc342d1db9b61c43f30d9aa27cea35ca7599 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 16 Oct 2020 11:03:47 -0700
> -Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
> -
> -__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
> -they only have 64bit variant of time_t. Glibc defines SYS_futex interfac=
e based on
> -__NR_futex, since this is used in applications, such applications start
> -to fail to build for these newer architectures. This patch defines a
> -fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
> -working
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - src/util/futex.h | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/util/futex.h b/src/util/futex.h
> -index 2a2a00c..92fc123 100644
> ---- a/src/util/futex.h
> -+++ b/src/util/futex.h
> -@@ -38,6 +38,10 @@
> - #define SYS_futex SYS_futex_time64
> - #endif
> -=20
> -+#if !defined(SYS_futex) && defined(SYS_futex_time64)
> -+# define SYS_futex SYS_futex_time64
> -+#endif
> -+
> - static inline long sys_futex(void *addr1, int op, int val1, const struc=
t timespec *timeout, void *addr2, int val3)
> - {
> -    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-=
all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/000=
1-meson.build-check-for-all-linux-host_os-combinations.patch
> index ec263ce479..2031ea957a 100644
> --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
> @@ -23,16 +23,16 @@ diff --git a/meson.build b/meson.build
>  index 250b528..b5c98f8 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -173,7 +173,7 @@ with_any_opengl =3D with_opengl or with_gles1 or wit=
h_gles2
> +@@ -173,7 +173,7 @@
>   # Only build shared_glapi if at least one OpenGL API is enabled
>   with_shared_glapi =3D with_shared_glapi and with_any_opengl
>  =20
> --system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
> +-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd',=
 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system())
>  +system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].co=
ntains(host_machine.system()) or host_machine.system().startswith('linux')
>  =20
>   dri_drivers =3D get_option('dri-drivers')
>   if dri_drivers.length() !=3D 0
> -@@ -1091,7 +1091,7 @@ if cc.has_function('reallocarray')
> +@@ -1072,7 +1072,7 @@
>   endif
>  =20
>   # TODO: this is very incomplete
> @@ -41,3 +41,4 @@ index 250b528..b5c98f8 100644
>     pre_args +=3D '-D_GNU_SOURCE'
>   elif host_machine.system() =3D=3D 'sunos'
>     pre_args +=3D '-D__EXTENSIONS__'
> +
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/recipes-=
graphics/mesa/mesa-gl_22.3.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_22.3.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 115621228a..86bd91ff5c 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -17,7 +17,6 @@ PE =3D "2"
>  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
> -           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.pa=
tch \
>             file://0001-util-format-Check-for-NEON-before-using-it.patch \
>             ${NATIVE_PATCHES} \
>             "
> @@ -25,7 +24,7 @@ NATIVE_PATCHES ?=3D ""
>  # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD =
enabled
>  NATIVE_PATCHES:class-native =3D "file://0001-nir-nir_opt_move-fix-ALWAYS=
_INLINE-compiler-error.patch"
> =20
> -SRC_URI[sha256sum] =3D "ee7d026f7b1991dbae0861d359b671145c3a86f2a731353b=
885d2ea2d5c098d6"
> +SRC_URI[sha256sum] =3D "644bf936584548c2b88762111ad58b4aa3e4688874200e5a=
4eb74e53ce301746"
> =20
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> =20
> @@ -97,7 +96,6 @@ PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisable=
d"
>  X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes xrandr"
>  # "x11" requires "opengl"
>  PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
> -PACKAGECONFIG[xvmc] =3D "-Dgallium-xvmc=3Denabled,-Dgallium-xvmc=3Ddisab=
led,libxvmc"
>  PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
> =20
>  PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, xorgproto =
libxshmfence"
> diff --git a/meta/recipes-graphics/mesa/mesa_22.2.3.bb b/meta/recipes-gra=
phics/mesa/mesa_22.3.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_22.2.3.bb
> rename to meta/recipes-graphics/mesa/mesa_22.3.0.bb
> --=20
> 2.34.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174199): https://lists.openembedded.org/g/openembedde=
d-core/message/174199
> Mute This Topic: https://lists.openembedded.org/mt/95388063/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

