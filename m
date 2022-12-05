Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F26C4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 17:23:56 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.21648.1670261028801093648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 09:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PjGPlXbQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-144b21f5e5fso2278676fac.12
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 09:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xTtTSo079wL8u8AM4B6qzWpCIaLi25ihAwbEZDcJbk=;
        b=PjGPlXbQv6pfA5rPn3L263KWI8JKF3SPAvHPLlE0rVCPnNVqhidEca6gjKHZ/E0NEs
         vpqAK6TQqQE3EzIjtsl+9RaRUDuDP9HQElxvQw5y0mBVaULR5zbDcvV+jF+3B9LKUWTs
         nRijrC3kfBRxcO0p8etrUBMwrJsLmFR5EcMP1YriPyTcTiDKvqlmWZTLj1ZMzTPvnBCk
         7kum9VlkLmq6XKNOhu574vPMnQZn16S9rPXpUNDWieQd14FcF/020HF2CosLiMH08AcO
         cxXT9p6bOUgdII/it4xCPftmnD0j8D0loasqvlTBmX9HzgkePn3B3a4A4l182oKNiza/
         eYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xTtTSo079wL8u8AM4B6qzWpCIaLi25ihAwbEZDcJbk=;
        b=5hm9L0q8RlK3ZT9XOxNIuFjTw/T/Oux0DGEcfcwYTy139ePywRYV4GhjT9GNM7XTVi
         fLupfvaA+5h8FOZpD6Li4mVTH4t+Ksaf7k6M69AtO+X8N6udK8qOwuVLQKQPM848xWEi
         5WsbdP/aGWjl0DbO0fCU4rMS9Dru9Uuf4zWM4OyeQOVJCL3l1KssKSWj2Imv9rLCYzCU
         noZgnNMgzRqpUZi/SYvqi/kFOhvKgpd72d2LHjfLRtt+OKGlXUnJUnJyTDMmT6RLMF5I
         qffEGrovOvmsLx0csLKjLSslE8ByIuDyjaX+Yjc1EF1TUsHi7tEkmyfr4hRNZ8/C0WqA
         ixSg==
X-Gm-Message-State: ANoB5pk+86AV8MvUwo5BCgVji4m/A9x3NcAHR0HwcQhYfoDX/l735pR2
	ooFb7k9w68yb83RcF8f8Vx0QMv8ZiDb/nuvELjQ=
X-Google-Smtp-Source: AA0mqf6zU2vz7rLyeKQifKH4iHwC/f/DkRMaR5LnzHrBoSlhFNl5WzI7GK9gDsgcmWH8Yu0v42TBqgMKc9PIy87mcJM=
X-Received: by 2002:a05:6871:4199:b0:142:d126:dc55 with SMTP id
 lc25-20020a056871419900b00142d126dc55mr36259589oab.262.1670261027856; Mon, 05
 Dec 2022 09:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20221201173942.1218836-1-f_l_k@t-online.de> <Y44A+3v1z+4YztFg@mail.local>
In-Reply-To: <Y44A+3v1z+4YztFg@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2022 09:23:21 -0800
Message-ID: <CAMKF1soJqh4VNJCDAq=VMgFfatiwwtUdYSsGtZCSwDVuOH4ckw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: alexandre.belloni@bootlin.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 17:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174294

On Mon, Dec 5, 2022 at 6:32 AM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> This caused:
>
> | FAILED: gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c=
.o
> | x86_64-poky-linux-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmat=
h=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wforma=
t-security -Werror=3Dformat-security --sysroot=3D/home/pokybuild/yocto-work=
er/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.=
4-r0/recipe-sysroot -Igst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p -Igst-libs/=
gst/vaapi -I../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi -I. -I../gstreamer=
-vaapi-1.20.4 -Igst-libs -I../gstreamer-vaapi-1.20.4/gst-libs -I/home/pokyb=
uild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer=
1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/gstreamer-1.0 -I/home/pokybu=
ild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1=
.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yo=
cto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaa=
pi/1.20.4-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yoct=
o-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi=
/1.20.4-r0/recipe-sysroot/usr/include/orc-0.4 -I/home/pokybuild/yocto-worke=
r/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4=
-r0/recipe-sysroot/usr/lib/gstreamer-1.0/include -I/home/pokybuild/yocto-wo=
rker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.2=
0.4-r0/recipe-sysroot/usr/include/libdrm -fdiagnostics-color=3Dalways -D_FI=
LE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -fvisibility=3Dhidden -fno-strict-a=
liasing -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/h=
ome/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/=
gstreamer1.0-vaapi/1.20.4-r0/gstreamer-vaapi-1.20.4=3D/usr/src/debug/gstrea=
mer1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/no=
-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/=
gstreamer-vaapi-1.20.4=3D/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 -fmacr=
o-prefix-map=3D/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/cor=
e2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/build=3D/usr/src/debug/gstrea=
mer1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/no=
-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/=
build=3D/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/h=
ome/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/=
gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot=3D -fmacro-prefix-map=3D/home/p=
okybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstre=
amer1.0-vaapi/1.20.4-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/pokybu=
ild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1=
.0-vaapi/1.20.4-r0/recipe-sysroot-native=3D -fPIC -pthread -DHAVE_CONFIG_H =
-DGST_USE_UNSTABLE_API '-DGST_VAAPI_VERSION_ID=3D"1.20.4"' -MD -MQ gst-libs=
/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o -MF gst-libs/gst/=
vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o.d -o gst-libs/gst/vaap=
i/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o -c ../gstreamer-vaapi-1.20=
.4/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
> | In file included from /home/pokybuild/yocto-worker/no-x11/build/build/t=
mp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr=
/include/EGL/egl.h:20,
> |                  from ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstv=
aapidisplay_egl.h:26,
> |                  from ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstv=
aapidisplay_egl.c:24:
> | /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-=
linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/EGL/eglplatfo=
rm.h:109:10: fatal error: X11/Xlib.h: No such file or directory
> |   109 | #include <X11/Xlib.h>
> |       |          ^~~~~~~~~~~~

for no-x11 builds gstreamer1.0-vaapi needs to pass -UUSE_X11 maybe,
the code where we were tweaking.

https://git.yoctoproject.org/poky/tree/meta/recipes-graphics/mesa/mesa.inc#=
n38

is removed from upstream.

> | compilation terminated.
> | ninja: build stopped: subcommand failed.
> | WARNING: /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2=
-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.281472:153 =
exit 1 from 'ninja -v -j 16 -l 52'
> | WARNING: Backtrace (BB generated script):
> |       #1: meson_do_compile, /home/pokybuild/yocto-worker/no-x11/build/b=
uild/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_=
compile.281472, line 153
> |       #2: do_compile, /home/pokybuild/yocto-worker/no-x11/build/build/t=
mp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compil=
e.281472, line 148
> |       #3: main, /home/pokybuild/yocto-worker/no-x11/build/build/tmp/wor=
k/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.2814=
72, line 157
> NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Failed
> ERROR: Task (/home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multi=
media/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_compile) failed with exit c=
ode '1'
>
>
> https://autobuilder.yoctoproject.org/typhoon/#builders/40/builds/6280/ste=
ps/11/logs/stdio
>
> On 01/12/2022 18:39:42+0100, Markus Volk wrote:
> > - remove deprecated xvmc PACKAGECONFIG
> > - remove futex.h patch. Code has been reworked, still needed?
> >
> > Note: mesa-22.3.0 will require libperfetto update to v28. Otherwise com=
pilation will fail.
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  ...fine-__NR_futex-if-it-does-not-exist.patch | 34 -------------------
> >  ...k-for-all-linux-host_os-combinations.patch |  7 ++--
> >  .../{mesa-gl_22.2.3.bb =3D> mesa-gl_22.3.0.bb}  |  0
> >  meta/recipes-graphics/mesa/mesa.inc           |  4 +--
> >  .../mesa/{mesa_22.2.3.bb =3D> mesa_22.3.0.bb}   |  0
> >  5 files changed, 5 insertions(+), 40 deletions(-)
> >  delete mode 100644 meta/recipes-graphics/mesa/files/0001-futex.h-Defin=
e-__NR_futex-if-it-does-not-exist.patch
> >  rename meta/recipes-graphics/mesa/{mesa-gl_22.2.3.bb =3D> mesa-gl_22.3=
.0.bb} (100%)
> >  rename meta/recipes-graphics/mesa/{mesa_22.2.3.bb =3D> mesa_22.3.0.bb}=
 (100%)
> >
> > diff --git a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_=
futex-if-it-does-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-fu=
tex.h-Define-__NR_futex-if-it-does-not-exist.patch
> > deleted file mode 100644
> > index e7d92197be..0000000000
> > --- a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-i=
f-it-does-not-exist.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -From 859bfc342d1db9b61c43f30d9aa27cea35ca7599 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Fri, 16 Oct 2020 11:03:47 -0700
> > -Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
> > -
> > -__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
> > -they only have 64bit variant of time_t. Glibc defines SYS_futex interf=
ace based on
> > -__NR_futex, since this is used in applications, such applications star=
t
> > -to fail to build for these newer architectures. This patch defines a
> > -fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
> > -working
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> > ----
> > - src/util/futex.h | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/src/util/futex.h b/src/util/futex.h
> > -index 2a2a00c..92fc123 100644
> > ---- a/src/util/futex.h
> > -+++ b/src/util/futex.h
> > -@@ -38,6 +38,10 @@
> > - #define SYS_futex SYS_futex_time64
> > - #endif
> > -
> > -+#if !defined(SYS_futex) && defined(SYS_futex_time64)
> > -+# define SYS_futex SYS_futex_time64
> > -+#endif
> > -+
> > - static inline long sys_futex(void *addr1, int op, int val1, const str=
uct timespec *timeout, void *addr2, int val3)
> > - {
> > -    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
> > diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-fo=
r-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0=
001-meson.build-check-for-all-linux-host_os-combinations.patch
> > index ec263ce479..2031ea957a 100644
> > --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-l=
inux-host_os-combinations.patch
> > +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-l=
inux-host_os-combinations.patch
> > @@ -23,16 +23,16 @@ diff --git a/meson.build b/meson.build
> >  index 250b528..b5c98f8 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -173,7 +173,7 @@ with_any_opengl =3D with_opengl or with_gles1 or w=
ith_gles2
> > +@@ -173,7 +173,7 @@
> >   # Only build shared_glapi if at least one OpenGL API is enabled
> >   with_shared_glapi =3D with_shared_glapi and with_any_opengl
> >
> > --system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd=
', 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
> > +-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd=
', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()=
)
> >  +system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].=
contains(host_machine.system()) or host_machine.system().startswith('linux'=
)
> >
> >   dri_drivers =3D get_option('dri-drivers')
> >   if dri_drivers.length() !=3D 0
> > -@@ -1091,7 +1091,7 @@ if cc.has_function('reallocarray')
> > +@@ -1072,7 +1072,7 @@
> >   endif
> >
> >   # TODO: this is very incomplete
> > @@ -41,3 +41,4 @@ index 250b528..b5c98f8 100644
> >     pre_args +=3D '-D_GNU_SOURCE'
> >   elif host_machine.system() =3D=3D 'sunos'
> >     pre_args +=3D '-D__EXTENSIONS__'
> > +
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/recipe=
s-graphics/mesa/mesa-gl_22.3.0.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
> > rename to meta/recipes-graphics/mesa/mesa-gl_22.3.0.bb
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index 115621228a..86bd91ff5c 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -17,7 +17,6 @@ PE =3D "2"
> >  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >             file://0001-meson.build-check-for-all-linux-host_os-combina=
tions.patch \
> >             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.pa=
tch \
> > -           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.=
patch \
> >             file://0001-util-format-Check-for-NEON-before-using-it.patc=
h \
> >             ${NATIVE_PATCHES} \
> >             "
> > @@ -25,7 +24,7 @@ NATIVE_PATCHES ?=3D ""
> >  # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUIL=
D enabled
> >  NATIVE_PATCHES:class-native =3D "file://0001-nir-nir_opt_move-fix-ALWA=
YS_INLINE-compiler-error.patch"
> >
> > -SRC_URI[sha256sum] =3D "ee7d026f7b1991dbae0861d359b671145c3a86f2a73135=
3b885d2ea2d5c098d6"
> > +SRC_URI[sha256sum] =3D "644bf936584548c2b88762111ad58b4aa3e4688874200e=
5a4eb74e53ce301746"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> >
> > @@ -97,7 +96,6 @@ PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisab=
led"
> >  X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage l=
ibxfixes xrandr"
> >  # "x11" requires "opengl"
> >  PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
> > -PACKAGECONFIG[xvmc] =3D "-Dgallium-xvmc=3Denabled,-Dgallium-xvmc=3Ddis=
abled,libxvmc"
> >  PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-pr=
otocols"
> >
> >  PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, xorgprot=
o libxshmfence"
> > diff --git a/meta/recipes-graphics/mesa/mesa_22.2.3.bb b/meta/recipes-g=
raphics/mesa/mesa_22.3.0.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa_22.2.3.bb
> > rename to meta/recipes-graphics/mesa/mesa_22.3.0.bb
> > --
> > 2.34.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174289): https://lists.openembedded.org/g/openembedde=
d-core/message/174289
> Mute This Topic: https://lists.openembedded.org/mt/95388063/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

