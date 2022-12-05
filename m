Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB56C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 19:08:36 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.24983.1670267308044875945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 11:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S/yT6vyJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1442977d77dso13462533fac.6
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 11:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7b8r9xM+yZum1GH5minWHjDWFChqsP4sWS3Y4+t/II=;
        b=S/yT6vyJDGHr8ecdRhy1Xgowuzvi+FfDvQy1t2AzJyrm2lYHolYfalACkzwrdBmb6O
         HaINTukEGFDKRju3rp6IXeVYvXsxBAP28nQAvVe4F24ogb41VLI1j6IG5amMieqJfErG
         NOBaS4jzRgRSS7zCViQn4iy1Bu4B6n4DwdRNAvJ0KQjaTbugcXrfwNCkrFJamhEHtc9X
         bDeHIPt5FgMBerppBe1hFR9ZZV+ZLOaGW9SITMJoWhWsl9UhwSFBbXIUQ/vqQWjFbgsH
         wh2CSiskuKtZIlDzTbi9ZR8np5Gy+3JrfKRQxVRwdx7mjBQzvW3YHcboYAPqLfFQMTRQ
         YABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7b8r9xM+yZum1GH5minWHjDWFChqsP4sWS3Y4+t/II=;
        b=MErg19rxZLgyCIVjL+t2oL90+VWQxPxrAiW79rvwnzoXFC0VZlYn0RaLCXuSt9XnRp
         bavYsTPeiXQudL9oN96NmFDsySfa3QhqMNUtsDZ5cJk+boUg4CsBiw2WNieBcQ42zjBZ
         9uKzVlhRciS5C19i+mTDG3mAAEhELPDSwBxjo+/Y0pkhJaH8eyQBeCIJIWqt5B+V3b9Z
         kxsA0atfByanqzrT04nEBArhJsVqVJLjG9uCfu/E2aHogijlqIiurQ9MRrWe0YsMPBYs
         6k4+3KhkmcLUWjISmWYfqUQbm0GqJOpjdItWnggg04Hq9uL3XtSIg7ufG7Ob5WVtQWW6
         QH9Q==
X-Gm-Message-State: ANoB5pn36i0OKnFFr+lEHmEY78eACNzwqiazdPRczsdT5OjTBwKWeyjn
	K1DnjgRUUv/Owfb0kWpN3zTVqfg5ogMmL6/6SG4=
X-Google-Smtp-Source: AA0mqf5i6XzaUQohwCNrVYN3NLEYQRM86ByCx23tZ2QQKTIxVInU/ZnnzOJcS9kyCU9kGUrZh/dHIhvgY+gBUpOm6eU=
X-Received: by 2002:a05:6870:1784:b0:13b:1e05:a73d with SMTP id
 r4-20020a056870178400b0013b1e05a73dmr48667436oae.55.1670267307151; Mon, 05
 Dec 2022 11:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20221201173942.1218836-1-f_l_k@t-online.de> <Y44A+3v1z+4YztFg@mail.local>
 <CAMKF1soJqh4VNJCDAq=VMgFfatiwwtUdYSsGtZCSwDVuOH4ckw@mail.gmail.com> <6BMFMR.8PMB5H9B5CRG1@t-online.de>
In-Reply-To: <6BMFMR.8PMB5H9B5CRG1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2022 11:08:01 -0800
Message-ID: <CAMKF1sr57t_JUxZx1YrZnaR8KFp6h=NzaPwb7SRP7fXb+qEz_g@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Markus Volk <f_l_k@t-online.de>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 19:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174297

On Mon, Dec 5, 2022 at 11:04 AM Markus Volk <f_l_k@t-online.de> wrote:
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

yes I think that would be preferred.

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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#174294): https://lists.openemb=
edded.org/g/openembedded-core/message/174294 Mute This Topic: https://lists=
.openembedded.org/mt/95388063/3618223 Group Owner: openembedded-core+owner@=
lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/openem=
bedded-core/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

