Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D459FC4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 19:18:16 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.25193.1670267887233116879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 11:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qEcsm8nm;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id c1so20128694lfi.7
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 11:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzagaHx+/2JsdzghMIpvjl3ICc7f97quApyx8KJojJs=;
        b=qEcsm8nmYRXOZQyoESboBjFbaHg8fe/KK27kmZrkgvUuGgVDaYAFyz33hovyRWq2EX
         Kf9tjT9+7F8KvzBHbSVrkNUuuRN8N5nGR9/iKQLNRgbjTU43LlmNprB51pHYWGqt1KiA
         AXVfQ1CzN1RyFCvsCKszNkEngEpb5pKMMM7QGxlBUl5oPQ5SOC6xnLWC36jajg4uYwfd
         v4NXyWIIcc5IUD33e0qMykRvoXALhCye0xWmvMIL4gJNC/uQITCQ6K+o1ugCpI2IbQCG
         H82ML2TRiuXlJT7RNQHMfxcPniTpA6qSHISUbkXxmDW51wzhP1EmHago9IOm0i0e1hOg
         mc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzagaHx+/2JsdzghMIpvjl3ICc7f97quApyx8KJojJs=;
        b=sK7e8VpJY4t6f3Iv6WpEk8YoPCM/nHNR15L75ZRaWzr6iIaqWKUat8DjokxiVJZbXq
         b5AKVuEKdA63Ez6g+ZMe2Per16hAL9QXoDECoJPAX9BpckFnLwKfQWEMVA4Mq0NjuhQe
         OsmLXz0jtSj2tEiikxnvZPoGmdwIfgGvQEDHaJIcyYgU6pMThiGZEC44Al4bfC/e1f/0
         kxBJXVMI1a2/njqO/F1VjrTUIbI5Y+h02tRfS6iSG6YpoUKli4BKB01iUQX3/IvdibTr
         FGIZNaIYHk3kzjHRk17k5aJ2yPYMxdvjejFkhmfhtL1oywn4W7G+MwpCU20wiFcbOXKG
         vM8A==
X-Gm-Message-State: ANoB5pmI6ebdD65SH3r3zUZNk9vb1BZBRfYKA/T78X3w9+t74gpgl6SJ
	561jcq2tfbkh7WO9dS3RFHvi5f4lhlIexQ5puN4=
X-Google-Smtp-Source: AA0mqf4Xvpe3p5ejnK/AcoOJxWCoXSaj/Pv3OcLnYtyfNoZFxjC2kVx3CyBTQr0tGVqIHEzwi+ijQi8nCutvGZyXl4U=
X-Received: by 2002:a05:6512:6d3:b0:4b5:62e4:bff2 with SMTP id
 u19-20020a05651206d300b004b562e4bff2mr3321015lff.492.1670267885352; Mon, 05
 Dec 2022 11:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20221201173942.1218836-1-f_l_k@t-online.de> <Y44A+3v1z+4YztFg@mail.local>
 <CAMKF1soJqh4VNJCDAq=VMgFfatiwwtUdYSsGtZCSwDVuOH4ckw@mail.gmail.com> <6BMFMR.8PMB5H9B5CRG1@t-online.de>
In-Reply-To: <6BMFMR.8PMB5H9B5CRG1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 Dec 2022 20:17:53 +0100
Message-ID: <CANNYZj9EirdvYtf6T4XwNqetq7p1rQv=9jKiu3oHwUUwQMja8w@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Markus Volk <f_l_k@t-online.de>
Cc: Khem Raj <raj.khem@gmail.com>, alexandre.belloni@bootlin.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 19:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174298

We don't use the monorepo, we use source tarballs and in them vaapi
continues to be provided separately:
https://gstreamer.freedesktop.org/src/gstreamer-vaapi/

Alex

On Mon, 5 Dec 2022 at 20:04, Markus Volk <f_l_k@t-online.de> wrote:
>
> Wouldn't it be best if we just removed the gstreamer-1.0-vaapi recipe. Gi=
tlab repo says:
>
> ARCHIVED REPOSITORY: Hardware-accelerated video decoding, encoding and pr=
ocessing on Intel graphics through VA-API
>
> This code has been moved to the GStreamer mono repo, please submit new is=
sues and merge requests there!
>
> Like I understand it, the code has been merged into gstreamer1.0 and can =
be enabled by
>
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/meson_opti=
ons.txt#L13
>
>
> Am Mo, 5. Dez 2022 um 09:23:21 -0800 schrieb Khem Raj <raj.khem@gmail.com=
>:
>
> On Mon, Dec 5, 2022 at 6:32 AM Alexandre Belloni via lists.openembedded.o=
rg <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello, This caused: | FAILED: gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/g=
stvaapidisplay_egl.c.o | x86_64-poky-linux-gcc -m64 -march=3Dcore2 -mtune=
=3Dcore2 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOUR=
CE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/ho=
me/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/g=
streamer1.0-vaapi/1.20.4-r0/recipe-sysroot -Igst-libs/gst/vaapi/libgstlibva=
api-1.0.a.p -Igst-libs/gst/vaapi -I../gstreamer-vaapi-1.20.4/gst-libs/gst/v=
aapi -I. -I../gstreamer-vaapi-1.20.4 -Igst-libs -I../gstreamer-vaapi-1.20.4=
/gst-libs -I/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-=
64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/gstre=
amer-1.0 -I/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-6=
4-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/glib-2=
.0 -I/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky=
-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/lib/glib-2.0/include=
 -I/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-l=
inux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/orc-0.4 -I/hom=
e/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gs=
treamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/lib/gstreamer-1.0/include -I/=
home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux=
/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/libdrm -fdiagnosti=
cs-color=3Dalways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -fvisibility=
=3Dhidden -fno-strict-aliasing -O2 -pipe -g -feliminate-unused-debug-types =
-fmacro-prefix-map=3D/home/pokybuild/yocto-worker/no-x11/build/build/tmp/wo=
rk/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/gstreamer-vaapi-1.20.4=
=3D/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/home/p=
okybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstre=
amer1.0-vaapi/1.20.4-r0/gstreamer-vaapi-1.20.4=3D/usr/src/debug/gstreamer1.=
0-vaapi/1.20.4-r0 -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/no-x11/=
build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/build=
=3D/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/home/p=
okybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstre=
amer1.0-vaapi/1.20.4-r0/build=3D/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0=
 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/no-x11/build/build/tmp/w=
ork/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot=3D -fma=
cro-prefix-map=3D/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/c=
ore2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot=3D -fdebug-p=
refix-map=3D/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-=
64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot-native=3D -fPIC -=
pthread -DHAVE_CONFIG_H -DGST_USE_UNSTABLE_API '-DGST_VAAPI_VERSION_ID=3D"1=
.20.4"' -MD -MQ gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_e=
gl.c.o -MF gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.=
o.d -o gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o -c=
 ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstvaapidisplay_egl.c | In fi=
le included from /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/c=
ore2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/=
EGL/egl.h:20, | from ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstvaapid=
isplay_egl.h:26, | from ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstvaa=
pidisplay_egl.c:24: | /home/pokybuild/yocto-worker/no-x11/build/build/tmp/w=
ork/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/inc=
lude/EGL/eglplatform.h:109:10: fatal error: X11/Xlib.h: No such file or dir=
ectory | 109 | #include <X11/Xlib.h> | | ^~~~~~~~~~~~
>
> for no-x11 builds gstreamer1.0-vaapi needs to pass -UUSE_X11 maybe, the c=
ode where we were tweaking. https://git.yoctoproject.org/poky/tree/meta/rec=
ipes-graphics/mesa/mesa.inc#n38 is removed from upstream.
>
> | compilation terminated. | ninja: build stopped: subcommand failed. | WA=
RNING: /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-po=
ky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.281472:153 exit 1=
 from 'ninja -v -j 16 -l 52' | WARNING: Backtrace (BB generated script): | =
#1: meson_do_compile, /home/pokybuild/yocto-worker/no-x11/build/build/tmp/w=
ork/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.28=
1472, line 153 | #2: do_compile, /home/pokybuild/yocto-worker/no-x11/build/=
build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do=
_compile.281472, line 148 | #3: main, /home/pokybuild/yocto-worker/no-x11/b=
uild/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/r=
un.do_compile.281472, line 157 NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: t=
ask do_compile: Failed ERROR: Task (/home/pokybuild/yocto-worker/no-x11/bui=
ld/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_compil=
e) failed with exit code '1' https://autobuilder.yoctoproject.org/typhoon/#=
builders/40/builds/6280/steps/11/logs/stdio On 01/12/2022 18:39:42+0100, Ma=
rkus Volk wrote: > - remove deprecated xvmc PACKAGECONFIG > - remove futex.=
h patch. Code has been reworked, still needed? > > Note: mesa-22.3.0 will r=
equire libperfetto update to v28. Otherwise compilation will fail. > > Sign=
ed-off-by: Markus Volk <f_l_k@t-online.de> > --- > ...fine-__NR_futex-if-it=
-does-not-exist.patch | 34 ------------------- > ...k-for-all-linux-host_os=
-combinations.patch | 7 ++-- > .../{mesa-gl_22.2.3.bb =3D> mesa-gl_22.3.0.b=
b} | 0 > meta/recipes-graphics/mesa/mesa.inc | 4 +-- > .../mesa/{mesa_22.2.=
3.bb =3D> mesa_22.3.0.bb} | 0 > 5 files changed, 5 insertions(+), 40 deleti=
ons(-) > delete mode 100644 meta/recipes-graphics/mesa/files/0001-futex.h-D=
efine-__NR_futex-if-it-does-not-exist.patch > rename meta/recipes-graphics/=
mesa/{mesa-gl_22.2.3.bb =3D> mesa-gl_22.3.0.bb} (100%) > rename meta/recipe=
s-graphics/mesa/{mesa_22.2.3.bb =3D> mesa_22.3.0.bb} (100%) > > diff --git =
a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-doe=
s-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__=
NR_futex-if-it-does-not-exist.patch > deleted file mode 100644 > index e7d9=
2197be..0000000000 > --- a/meta/recipes-graphics/mesa/files/0001-futex.h-De=
fine-__NR_futex-if-it-does-not-exist.patch > +++ /dev/null > @@ -1,34 +0,0 =
@@ > -From 859bfc342d1db9b61c43f30d9aa27cea35ca7599 Mon Sep 17 00:00:00 200=
1 > -From: Khem Raj <raj.khem@gmail.com> > -Date: Fri, 16 Oct 2020 11:03:47=
 -0700 > -Subject: [PATCH] futex.h: Define __NR_futex if it does not exist =
> - > -__NR_futex is not defines by newer architectures e.g. arc, riscv32 a=
s > -they only have 64bit variant of time_t. Glibc defines SYS_futex interf=
ace based on > -__NR_futex, since this is used in applications, such applic=
ations start > -to fail to build for these newer architectures. This patch =
defines a > -fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex =
keeps > -working > - > -Upstream-Status: Pending > -Signed-off-by: Khem Raj=
 <raj.khem@gmail.com> > - > ---- > - src/util/futex.h | 4 ++++ > - 1 file c=
hanged, 4 insertions(+) > - > -diff --git a/src/util/futex.h b/src/util/fut=
ex.h > -index 2a2a00c..92fc123 100644 > ---- a/src/util/futex.h > -+++ b/sr=
c/util/futex.h > -@@ -38,6 +38,10 @@ > - #define SYS_futex SYS_futex_time64=
 > - #endif > - > -+#if !defined(SYS_futex) && defined(SYS_futex_time64) > =
-+# define SYS_futex SYS_futex_time64 > -+#endif > -+ > - static inline lon=
g sys_futex(void *addr1, int op, int val1, const struct timespec *timeout, =
void *addr2, int val3) > - { > - return syscall(SYS_futex, addr1, op, val1,=
 timeout, addr2, val3); > diff --git a/meta/recipes-graphics/mesa/files/000=
1-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes=
-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch > index ec263ce479..2031ea957a 100644 > --- a/meta/recipes-graphi=
cs/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.pat=
ch > +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-=
linux-host_os-combinations.patch > @@ -23,16 +23,16 @@ diff --git a/meson.b=
uild b/meson.build > index 250b528..b5c98f8 100644 > --- a/meson.build > ++=
+ b/meson.build > -@@ -173,7 +173,7 @@ with_any_opengl =3D with_opengl or w=
ith_gles1 or with_gles2 > +@@ -173,7 +173,7 @@ > # Only build shared_glapi =
if at least one OpenGL API is enabled > with_shared_glapi =3D with_shared_g=
lapi and with_any_opengl > > --system_has_kms_drm =3D ['openbsd', 'netbsd',=
 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos'].contains(host_ma=
chine.system()) > +-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd',=
 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_ma=
chine.system()) > +system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', =
'dragonfly'].contains(host_machine.system()) or host_machine.system().start=
swith('linux') > > dri_drivers =3D get_option('dri-drivers') > if dri_drive=
rs.length() !=3D 0 > -@@ -1091,7 +1091,7 @@ if cc.has_function('reallocarra=
y') > +@@ -1072,7 +1072,7 @@ > endif > > # TODO: this is very incomplete > =
@@ -41,3 +41,4 @@ index 250b528..b5c98f8 100644 > pre_args +=3D '-D_GNU_SOU=
RCE' > elif host_machine.system() =3D=3D 'sunos' > pre_args +=3D '-D__EXTEN=
SIONS__' > + > diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/=
meta/recipes-graphics/mesa/mesa-gl_22.3.0.bb > similarity index 100% > rena=
me from meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb > rename to meta/recip=
es-graphics/mesa/mesa-gl_22.3.0.bb > diff --git a/meta/recipes-graphics/mes=
a/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc > index 115621228a..86bd91=
ff5c 100644 > --- a/meta/recipes-graphics/mesa/mesa.inc > +++ b/meta/recipe=
s-graphics/mesa/mesa.inc > @@ -17,7 +17,6 @@ PE =3D "2" > SRC_URI =3D "http=
s://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \ > file://0001-meson.bu=
ild-check-for-all-linux-host_os-combinations.patch \ > file://0001-meson-mi=
sdetects-64bit-atomics-on-mips-clang.patch \ > - file://0001-futex.h-Define=
-__NR_futex-if-it-does-not-exist.patch \ > file://0001-util-format-Check-fo=
r-NEON-before-using-it.patch \ > ${NATIVE_PATCHES} \ > " > @@ -25,7 +24,7 @=
@ NATIVE_PATCHES ?=3D "" > # required by mesa-native on Ubuntu 18.04 with g=
cc 7.5 when DEBUG_BUILD enabled > NATIVE_PATCHES:class-native =3D "file://0=
001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch" > > -SRC_URI[s=
ha256sum] =3D "ee7d026f7b1991dbae0861d359b671145c3a86f2a731353b885d2ea2d5c0=
98d6" > +SRC_URI[sha256sum] =3D "644bf936584548c2b88762111ad58b4aa3e4688874=
200e5a4eb74e53ce301746" > > UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\=
d+(\.\d+)+)" > > @@ -97,7 +96,6 @@ PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,=
-Dgbm=3Ddisabled" > X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86=
vm libxdamage libxfixes xrandr" > # "x11" requires "opengl" > PACKAGECONFIG=
[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}" > -PACKAGECONFIG[xvmc] =3D "-Dgal=
lium-xvmc=3Denabled,-Dgallium-xvmc=3Ddisabled,libxvmc" > PACKAGECONFIG[wayl=
and] =3D ",,wayland-native wayland libdrm wayland-protocols" > > PACKAGECON=
FIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, xorgproto libxshmfence"=
 > diff --git a/meta/recipes-graphics/mesa/mesa_22.2.3.bb b/meta/recipes-gr=
aphics/mesa/mesa_22.3.0.bb > similarity index 100% > rename from meta/recip=
es-graphics/mesa/mesa_22.2.3.bb > rename to meta/recipes-graphics/mesa/mesa=
_22.3.0.bb > -- > 2.34.1 > > > > -- Alexandre Belloni, co-owner and COO, Bo=
otlin Embedded Linux and Kernel engineering https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174296): https://lists.openembedded.org/g/openembedde=
d-core/message/174296
> Mute This Topic: https://lists.openembedded.org/mt/95388063/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

