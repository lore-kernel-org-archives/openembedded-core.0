Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C72C4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 19:04:37 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.24703.1670267068244098988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 11:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id 99E6915EBA;
	Mon,  5 Dec 2022 20:04:24 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.205]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2GlM-4XxjEm0; Mon, 5 Dec 2022 20:04:24 +0100
Date: Mon, 05 Dec 2022 20:04:18 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Message-Id: <6BMFMR.8PMB5H9B5CRG1@t-online.de>
In-Reply-To: 
	<CAMKF1soJqh4VNJCDAq=VMgFfatiwwtUdYSsGtZCSwDVuOH4ckw@mail.gmail.com>
References: <20221201173942.1218836-1-f_l_k@t-online.de>
	<Y44A+3v1z+4YztFg@mail.local>
	<CAMKF1soJqh4VNJCDAq=VMgFfatiwwtUdYSsGtZCSwDVuOH4ckw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-CNwogKDvxD8jILyWGc+V"
X-TOI-EXPURGATEID: 150726::1670267064-EEFF2A26-3B82C32C/0/0 CLEAN NORMAL
X-TOI-MSGID: d2ddc61c-dbf9-452c-bc14-4a370cde9a6b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 19:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174296

--=-CNwogKDvxD8jILyWGc+V
Content-Type: text/plain; charset=us-ascii; format=flowed

Wouldn't it be best if we just removed the gstreamer-1.0-vaapi recipe. 
Gitlab repo says:

*ARCHIVED REPOSITORY*: Hardware-accelerated video decoding, encoding 
and processing on Intel graphics through VA-API

*This code has been moved to the GStreamer mono repo 
<https://gitlab.freedesktop.org/gstreamer/gstreamer>, please submit new 
issues and merge requests there!*

Like I understand it, the code has been merged into gstreamer1.0 and 
can be enabled by

<https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/meson_options.txt#L13>


Am Mo, 5. Dez 2022 um 09:23:21 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> On Mon, Dec 5, 2022 at 6:32 AM Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=bootlin.com@lists.openembedded.org 
> <mailto:alexandre.belloni=bootlin.com@lists.openembedded.org>> wrote:
>> 
>>  Hello,
>> 
>>  This caused:
>> 
>>  | FAILED: 
>> gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o
>>  | x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 
>> -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 
>> -Wformat -Wformat-security -Werror=format-security 
>> --sysroot=/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot 
>> -Igst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p -Igst-libs/gst/vaapi 
>> -I../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi -I. 
>> -I../gstreamer-vaapi-1.20.4 -Igst-libs 
>> -I../gstreamer-vaapi-1.20.4/gst-libs 
>> -I/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/gstreamer-1.0 
>> -I/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/glib-2.0 
>> -I/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/lib/glib-2.0/include 
>> -I/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/orc-0.4 
>> -I/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/lib/gstreamer-1.0/include 
>> -I/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/libdrm 
>> -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall 
>> -Winvalid-pch -fvisibility=hidden -fno-strict-aliasing -O2 -pipe -g 
>> -feliminate-unused-debug-types 
>> -fmacro-prefix-map=/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/gstreamer-vaapi-1.20.4=/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 
>> -fdebug-prefix-map=/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/gstreamer-vaapi-1.20.4=/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 
>> -fmacro-prefix-map=/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/build=/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 
>> -fdebug-prefix-map=/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/build=/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 
>> -fdebug-prefix-map=/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot= 
>> -fmacro-prefix-map=/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot= 
>> -fdebug-prefix-map=/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot-native= 
>> -fPIC -pthread -DHAVE_CONFIG_H -DGST_USE_UNSTABLE_API 
>> '-DGST_VAAPI_VERSION_ID="1.20.4"' -MD -MQ 
>> gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o 
>> -MF 
>> gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o.d 
>> -o gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o 
>> -c ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
>>  | In file included from 
>> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/EGL/egl.h:20,
>>  |                  from 
>> ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstvaapidisplay_egl.h:26,
>>  |                  from 
>> ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstvaapidisplay_egl.c:24:
>>  | 
>> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:109:10: 
>> fatal error: X11/Xlib.h: No such file or directory
>>  |   109 | #include <X11/Xlib.h>
>>  |       |          ^~~~~~~~~~~~
> 
> for no-x11 builds gstreamer1.0-vaapi needs to pass -UUSE_X11 maybe,
> the code where we were tweaking.
> 
> <https://git.yoctoproject.org/poky/tree/meta/recipes-graphics/mesa/mesa.inc#n38>
> 
> is removed from upstream.
> 
>>  | compilation terminated.
>>  | ninja: build stopped: subcommand failed.
>>  | WARNING: 
>> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.281472:153 
>> exit 1 from 'ninja -v -j 16 -l 52'
>>  | WARNING: Backtrace (BB generated script):
>>  |       #1: meson_do_compile, 
>> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.281472, 
>> line 153
>>  |       #2: do_compile, 
>> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.281472, 
>> line 148
>>  |       #3: main, 
>> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.281472, 
>> line 157
>>  NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Failed
>>  ERROR: Task 
>> (/home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_compile) 
>> failed with exit code '1'
>> 
>> 
>>  
>> <https://autobuilder.yoctoproject.org/typhoon/#builders/40/builds/6280/steps/11/logs/stdio>
>> 
>>  On 01/12/2022 18:39:42+0100, Markus Volk wrote:
>>  > - remove deprecated xvmc PACKAGECONFIG
>>  > - remove futex.h patch. Code has been reworked, still needed?
>>  >
>>  > Note: mesa-22.3.0 will require libperfetto update to v28. 
>> Otherwise compilation will fail.
>>  >
>>  > Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  > ---
>>  >  ...fine-__NR_futex-if-it-does-not-exist.patch | 34 
>> -------------------
>>  >  ...k-for-all-linux-host_os-combinations.patch |  7 ++--
>>  >  .../{mesa-gl_22.2.3.bb => mesa-gl_22.3.0.bb}  |  0
>>  >  meta/recipes-graphics/mesa/mesa.inc           |  4 +--
>>  >  .../mesa/{mesa_22.2.3.bb => mesa_22.3.0.bb}   |  0
>>  >  5 files changed, 5 insertions(+), 40 deletions(-)
>>  >  delete mode 100644 
>> meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
>>  >  rename meta/recipes-graphics/mesa/{mesa-gl_22.2.3.bb => 
>> mesa-gl_22.3.0.bb} (100%)
>>  >  rename meta/recipes-graphics/mesa/{mesa_22.2.3.bb => 
>> mesa_22.3.0.bb} (100%)
>>  >
>>  > diff --git 
>> a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch 
>> b/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
>>  > deleted file mode 100644
>>  > index e7d92197be..0000000000
>>  > --- 
>> a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
>>  > +++ /dev/null
>>  > @@ -1,34 +0,0 @@
>>  > -From 859bfc342d1db9b61c43f30d9aa27cea35ca7599 Mon Sep 17 
>> 00:00:00 2001
>>  > -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>>  > -Date: Fri, 16 Oct 2020 11:03:47 -0700
>>  > -Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
>>  > -
>>  > -__NR_futex is not defines by newer architectures e.g. arc, 
>> riscv32 as
>>  > -they only have 64bit variant of time_t. Glibc defines SYS_futex 
>> interface based on
>>  > -__NR_futex, since this is used in applications, such 
>> applications start
>>  > -to fail to build for these newer architectures. This patch 
>> defines a
>>  > -fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex 
>> keeps
>>  > -working
>>  > -
>>  > -Upstream-Status: Pending
>>  > -Signed-off-by: Khem Raj <raj.khem@gmail.com 
>> <mailto:raj.khem@gmail.com>>
>>  > -
>>  > ----
>>  > - src/util/futex.h | 4 ++++
>>  > - 1 file changed, 4 insertions(+)
>>  > -
>>  > -diff --git a/src/util/futex.h b/src/util/futex.h
>>  > -index 2a2a00c..92fc123 100644
>>  > ---- a/src/util/futex.h
>>  > -+++ b/src/util/futex.h
>>  > -@@ -38,6 +38,10 @@
>>  > - #define SYS_futex SYS_futex_time64
>>  > - #endif
>>  > -
>>  > -+#if !defined(SYS_futex) && defined(SYS_futex_time64)
>>  > -+# define SYS_futex SYS_futex_time64
>>  > -+#endif
>>  > -+
>>  > - static inline long sys_futex(void *addr1, int op, int val1, 
>> const struct timespec *timeout, void *addr2, int val3)
>>  > - {
>>  > -    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, 
>> val3);
>>  > diff --git 
>> a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch 
>> b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
>>  > index ec263ce479..2031ea957a 100644
>>  > --- 
>> a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
>>  > +++ 
>> b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
>>  > @@ -23,16 +23,16 @@ diff --git a/meson.build b/meson.build
>>  >  index 250b528..b5c98f8 100644
>>  >  --- a/meson.build
>>  >  +++ b/meson.build
>>  > -@@ -173,7 +173,7 @@ with_any_opengl = with_opengl or with_gles1 
>> or with_gles2
>>  > +@@ -173,7 +173,7 @@
>>  >   # Only build shared_glapi if at least one OpenGL API is enabled
>>  >   with_shared_glapi = with_shared_glapi and with_any_opengl
>>  >
>>  > --system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 
>> 'gnu/kfreebsd', 'dragonfly', 'linux', 
>> 'sunos'].contains(host_machine.system())
>>  > +-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 
>> 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 
>> 'android'].contains(host_machine.system())
>>  >  +system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 
>> 'dragonfly'].contains(host_machine.system()) or 
>> host_machine.system().startswith('linux')
>>  >
>>  >   dri_drivers = get_option('dri-drivers')
>>  >   if dri_drivers.length() != 0
>>  > -@@ -1091,7 +1091,7 @@ if cc.has_function('reallocarray')
>>  > +@@ -1072,7 +1072,7 @@
>>  >   endif
>>  >
>>  >   # TODO: this is very incomplete
>>  > @@ -41,3 +41,4 @@ index 250b528..b5c98f8 100644
>>  >     pre_args += '-D_GNU_SOURCE'
>>  >   elif host_machine.system() == 'sunos'
>>  >     pre_args += '-D__EXTENSIONS__'
>>  > +
>>  > diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb 
>> b/meta/recipes-graphics/mesa/mesa-gl_22.3.0.bb
>>  > similarity index 100%
>>  > rename from meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
>>  > rename to meta/recipes-graphics/mesa/mesa-gl_22.3.0.bb
>>  > diff --git a/meta/recipes-graphics/mesa/mesa.inc 
>> b/meta/recipes-graphics/mesa/mesa.inc
>>  > index 115621228a..86bd91ff5c 100644
>>  > --- a/meta/recipes-graphics/mesa/mesa.inc
>>  > +++ b/meta/recipes-graphics/mesa/mesa.inc
>>  > @@ -17,7 +17,6 @@ PE = "2"
>>  >  SRC_URI = 
>> "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz 
>> <https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz> \
>>  >             
>> file://0001-meson.build-check-for-all-linux-host_os-combinations.patch 
>> <file://0001-meson.build-check-for-all-linux-host_os-combinations.patch/> 
>> \
>>  >             
>> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch 
>> <file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch/> \
>>  > -           
>> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch 
>> <file://0001-futex.h-define-__nr_futex-if-it-does-not-exist.patch/> \
>>  >             
>> file://0001-util-format-Check-for-NEON-before-using-it.patch 
>> <file://0001-util-format-check-for-neon-before-using-it.patch/> \
>>  >             ${NATIVE_PATCHES} \
>>  >             "
>>  > @@ -25,7 +24,7 @@ NATIVE_PATCHES ?= ""
>>  >  # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when 
>> DEBUG_BUILD enabled
>>  >  NATIVE_PATCHES:class-native = 
>> "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch" 
>> <file://0001-nir-nir_opt_move-fix-always_inline-compiler-error.patch/>
>>  >
>>  > -SRC_URI[sha256sum] = 
>> "ee7d026f7b1991dbae0861d359b671145c3a86f2a731353b885d2ea2d5c098d6"
>>  > +SRC_URI[sha256sum] = 
>> "644bf936584548c2b88762111ad58b4aa3e4688874200e5a4eb74e53ce301746"
>>  >
>>  >  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>>  >
>>  > @@ -97,7 +96,6 @@ PACKAGECONFIG[gbm] = 
>> "-Dgbm=enabled,-Dgbm=disabled"
>>  >  X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm 
>> libxdamage libxfixes xrandr"
>>  >  # "x11" requires "opengl"
>>  >  PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
>>  > -PACKAGECONFIG[xvmc] = 
>> "-Dgallium-xvmc=enabled,-Dgallium-xvmc=disabled,libxvmc"
>>  >  PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm 
>> wayland-protocols"
>>  >
>>  >  PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, 
>> xorgproto libxshmfence"
>>  > diff --git a/meta/recipes-graphics/mesa/mesa_22.2.3.bb 
>> b/meta/recipes-graphics/mesa/mesa_22.3.0.bb
>>  > similarity index 100%
>>  > rename from meta/recipes-graphics/mesa/mesa_22.2.3.bb
>>  > rename to meta/recipes-graphics/mesa/mesa_22.3.0.bb
>>  > --
>>  > 2.34.1
>>  >
>> 
>>  >
>>  >
>>  >
>> 
>> 
>>  --
>>  Alexandre Belloni, co-owner and COO, Bootlin
>>  Embedded Linux and Kernel engineering
>>  https://bootlin.com <https://bootlin.com/>
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174294): 
> <https://lists.openembedded.org/g/openembedded-core/message/174294>
> Mute This Topic: <https://lists.openembedded.org/mt/95388063/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-CNwogKDvxD8jILyWGc+V
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Wouldn't it be best if we just rem=
oved the gstreamer-1.0-vaapi recipe. Gitlab repo says:</div><div><br></div>=
<div><div class=3D"home-panel-description-markdown read-more-container" ite=
mprop=3D"description">
<p data-sourcepos=3D"1:1-1:118" dir=3D"auto"><strong>ARCHIVED REPOSITORY</s=
trong>: Hardware-accelerated video decoding, encoding and processing on Int=
el graphics through VA-API</p>
<p data-sourcepos=3D"3:1-3:161" dir=3D"auto"><strong>This code has been mov=
ed to the <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer">GS=
treamer mono repo</a>, please submit new issues and merge requests there!</=
strong></p><p data-sourcepos=3D"3:1-3:161" dir=3D"auto">Like I understand i=
t, the code has been merged into gstreamer1.0 and can be enabled by</p><p d=
ata-sourcepos=3D"3:1-3:161" dir=3D"auto"><a href=3D"https://gitlab.freedesk=
top.org/gstreamer/gstreamer/-/blob/main/meson_options.txt#L13">https://gitl=
ab.freedesktop.org/gstreamer/gstreamer/-/blob/main/meson_options.txt#L13</a=
></p></div></div></div><div id=3D"geary-quote" dir=3D"auto"><br>Am Mo, 5. D=
ez 2022 um 09:23:21 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><=
blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: bre=
ak-spaces;">On Mon, Dec 5, 2022 at 6:32 AM Alexandre Belloni via
lists.openembedded.org
&lt;<a href=3D"mailto:alexandre.belloni=3Dbootlin.com@lists.openembedded.or=
g">alexandre.belloni=3Dbootlin.com@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 Hello,

 This caused:

 | FAILED: gst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.=
o
 | x86_64-poky-linux-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat=
-security -Werror=3Dformat-security --sysroot=3D/home/pokybuild/yocto-worke=
r/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4=
-r0/recipe-sysroot -Igst-libs/gst/vaapi/libgstlibvaapi-1.0.a.p -Igst-libs/g=
st/vaapi -I../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi -I. -I../gstreamer-=
vaapi-1.20.4 -Igst-libs -I../gstreamer-vaapi-1.20.4/gst-libs -I/home/pokybu=
ild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1=
.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/gstreamer-1.0 -I/home/pokybui=
ld/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.=
0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/glib-2.0 -I/home/pokybuild/yoc=
to-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaap=
i/1.20.4-r0/recipe-sysroot/usr/lib/glib-2.0/include -I/home/pokybuild/yocto=
-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/=
1.20.4-r0/recipe-sysroot/usr/include/orc-0.4 -I/home/pokybuild/yocto-worker=
/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-=
r0/recipe-sysroot/usr/lib/gstreamer-1.0/include -I/home/pokybuild/yocto-wor=
ker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20=
.4-r0/recipe-sysroot/usr/include/libdrm -fdiagnostics-color=3Dalways -D_FIL=
E_OFFSET_BITS=3D64 -Wall -Winvalid-pch -fvisibility=3Dhidden -fno-strict-al=
iasing -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3D/ho=
me/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/g=
streamer1.0-vaapi/1.20.4-r0/gstreamer-vaapi-1.20.4=3D/usr/src/debug/gstream=
er1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/no-=
x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/g=
streamer-vaapi-1.20.4=3D/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 -fmacro=
-prefix-map=3D/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core=
2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/build=3D/usr/src/debug/gstream=
er1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/no-=
x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/b=
uild=3D/usr/src/debug/gstreamer1.0-vaapi/1.20.4-r0 -fdebug-prefix-map=3D/ho=
me/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/g=
streamer1.0-vaapi/1.20.4-r0/recipe-sysroot=3D -fmacro-prefix-map=3D/home/po=
kybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstrea=
mer1.0-vaapi/1.20.4-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/home/pokybui=
ld/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/gstreamer1.=
0-vaapi/1.20.4-r0/recipe-sysroot-native=3D -fPIC -pthread -DHAVE_CONFIG_H -=
DGST_USE_UNSTABLE_API '-DGST_VAAPI_VERSION_ID=3D"1.20.4"' -MD -MQ gst-libs/=
gst/vaapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o -MF gst-libs/gst/v=
aapi/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o.d -o gst-libs/gst/vaapi=
/libgstlibvaapi-1.0.a.p/gstvaapidisplay_egl.c.o -c ../gstreamer-vaapi-1.20.=
4/gst-libs/gst/vaapi/gstvaapidisplay_egl.c
 | In file included from /home/pokybuild/yocto-worker/no-x11/build/build/tm=
p/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/=
include/EGL/egl.h:20,
 |                  from ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstva=
apidisplay_egl.h:26,
 |                  from ../gstreamer-vaapi-1.20.4/gst-libs/gst/vaapi/gstva=
apidisplay_egl.c:24:
 | /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-l=
inux/gstreamer1.0-vaapi/1.20.4-r0/recipe-sysroot/usr/include/EGL/eglplatfor=
m.h:109:10: fatal error: X11/Xlib.h: No such file or directory
 |   109 | #include &lt;X11/Xlib.h&gt;
 |       |          ^~~~~~~~~~~~
</blockquote>
for no-x11 builds gstreamer1.0-vaapi needs to pass -UUSE_X11 maybe,
the code where we were tweaking.

<a href=3D"https://git.yoctoproject.org/poky/tree/meta/recipes-graphics/mes=
a/mesa.inc#n38">https://git.yoctoproject.org/poky/tree/meta/recipes-graphic=
s/mesa/mesa.inc#n38</a>

is removed from upstream.

<blockquote> | compilation terminated.
 | ninja: build stopped: subcommand failed.
 | WARNING: /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-=
64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.281472:153 e=
xit 1 from 'ninja -v -j 16 -l 52'
 | WARNING: Backtrace (BB generated script):
 |       #1: meson_do_compile, /home/pokybuild/yocto-worker/no-x11/build/bu=
ild/tmp/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_c=
ompile.281472, line 153
 |       #2: do_compile, /home/pokybuild/yocto-worker/no-x11/build/build/tm=
p/work/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile=
.281472, line 148
 |       #3: main, /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work=
/core2-64-poky-linux/gstreamer1.0-vaapi/1.20.4-r0/temp/run.do_compile.28147=
2, line 157
 NOTE: recipe gstreamer1.0-vaapi-1.20.4-r0: task do_compile: Failed
 ERROR: Task (/home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multim=
edia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb:do_compile) failed with exit co=
de '1'


 <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#builders/40/build=
s/6280/steps/11/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#b=
uilders/40/builds/6280/steps/11/logs/stdio</a>

 On 01/12/2022 18:39:42+0100, Markus Volk wrote:
 &gt; - remove deprecated xvmc PACKAGECONFIG
 &gt; - remove futex.h patch. Code has been reworked, still needed?
 &gt;
 &gt; Note: mesa-22.3.0 will require libperfetto update to v28. Otherwise c=
ompilation will fail.
 &gt;
 &gt; Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f=
_l_k@t-online.de</a>&gt;
 &gt; ---
 &gt;  ...fine-__NR_futex-if-it-does-not-exist.patch | 34 -----------------=
--
 &gt;  ...k-for-all-linux-host_os-combinations.patch |  7 ++--
 &gt;  .../{mesa-gl_22.2.3.bb =3D&gt; mesa-gl_22.3.0.bb}  |  0
 &gt;  meta/recipes-graphics/mesa/mesa.inc           |  4 +--
 &gt;  .../mesa/{mesa_22.2.3.bb =3D&gt; mesa_22.3.0.bb}   |  0
 &gt;  5 files changed, 5 insertions(+), 40 deletions(-)
 &gt;  delete mode 100644 meta/recipes-graphics/mesa/files/0001-futex.h-Def=
ine-__NR_futex-if-it-does-not-exist.patch
 &gt;  rename meta/recipes-graphics/mesa/{mesa-gl_22.2.3.bb =3D&gt; mesa-gl=
_22.3.0.bb} (100%)
 &gt;  rename meta/recipes-graphics/mesa/{mesa_22.2.3.bb =3D&gt; mesa_22.3.=
0.bb} (100%)
 &gt;
 &gt; diff --git a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__N=
R_futex-if-it-does-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-=
futex.h-Define-__NR_futex-if-it-does-not-exist.patch
 &gt; deleted file mode 100644
 &gt; index e7d92197be..0000000000
 &gt; --- a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex=
-if-it-does-not-exist.patch
 &gt; +++ /dev/null
 &gt; @@ -1,34 +0,0 @@
 &gt; -From 859bfc342d1db9b61c43f30d9aa27cea35ca7599 Mon Sep 17 00:00:00 20=
01
 &gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gm=
ail.com</a>&gt;
 &gt; -Date: Fri, 16 Oct 2020 11:03:47 -0700
 &gt; -Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
 &gt; -
 &gt; -__NR_futex is not defines by newer architectures e.g. arc, riscv32 a=
s
 &gt; -they only have 64bit variant of time_t. Glibc defines SYS_futex inte=
rface based on
 &gt; -__NR_futex, since this is used in applications, such applications st=
art
 &gt; -to fail to build for these newer architectures. This patch defines a
 &gt; -fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
 &gt; -working
 &gt; -
 &gt; -Upstream-Status: Pending
 &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">ra=
j.khem@gmail.com</a>&gt;
 &gt; -
 &gt; ----
 &gt; - src/util/futex.h | 4 ++++
 &gt; - 1 file changed, 4 insertions(+)
 &gt; -
 &gt; -diff --git a/src/util/futex.h b/src/util/futex.h
 &gt; -index 2a2a00c..92fc123 100644
 &gt; ---- a/src/util/futex.h
 &gt; -+++ b/src/util/futex.h
 &gt; -@@ -38,6 +38,10 @@
 &gt; - #define SYS_futex SYS_futex_time64
 &gt; - #endif
 &gt; -
 &gt; -+#if !defined(SYS_futex) &amp;&amp; defined(SYS_futex_time64)
 &gt; -+# define SYS_futex SYS_futex_time64
 &gt; -+#endif
 &gt; -+
 &gt; - static inline long sys_futex(void *addr1, int op, int val1, const s=
truct timespec *timeout, void *addr2, int val3)
 &gt; - {
 &gt; -    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3)=
;
 &gt; diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-=
for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files=
/0001-meson.build-check-for-all-linux-host_os-combinations.patch
 &gt; index ec263ce479..2031ea957a 100644
 &gt; --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all=
-linux-host_os-combinations.patch
 &gt; +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all=
-linux-host_os-combinations.patch
 &gt; @@ -23,16 +23,16 @@ diff --git a/meson.build b/meson.build
 &gt;  index 250b528..b5c98f8 100644
 &gt;  --- a/meson.build
 &gt;  +++ b/meson.build
 &gt; -@@ -173,7 +173,7 @@ with_any_opengl =3D with_opengl or with_gles1 or=
 with_gles2
 &gt; +@@ -173,7 +173,7 @@
 &gt;   # Only build shared_glapi if at least one OpenGL API is enabled
 &gt;   with_shared_glapi =3D with_shared_glapi and with_any_opengl
 &gt;
 &gt; --system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreeb=
sd', 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
 &gt; +-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreeb=
sd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system=
())
 &gt;  +system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly'=
].contains(host_machine.system()) or host_machine.system().startswith('linu=
x')
 &gt;
 &gt;   dri_drivers =3D get_option('dri-drivers')
 &gt;   if dri_drivers.length() !=3D 0
 &gt; -@@ -1091,7 +1091,7 @@ if cc.has_function('reallocarray')
 &gt; +@@ -1072,7 +1072,7 @@
 &gt;   endif
 &gt;
 &gt;   # TODO: this is very incomplete
 &gt; @@ -41,3 +41,4 @@ index 250b528..b5c98f8 100644
 &gt;     pre_args +=3D '-D_GNU_SOURCE'
 &gt;   elif host_machine.system() =3D=3D 'sunos'
 &gt;     pre_args +=3D '-D__EXTENSIONS__'
 &gt; +
 &gt; diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/reci=
pes-graphics/mesa/mesa-gl_22.3.0.bb
 &gt; similarity index 100%
 &gt; rename from meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
 &gt; rename to meta/recipes-graphics/mesa/mesa-gl_22.3.0.bb
 &gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graph=
ics/mesa/mesa.inc
 &gt; index 115621228a..86bd91ff5c 100644
 &gt; --- a/meta/recipes-graphics/mesa/mesa.inc
 &gt; +++ b/meta/recipes-graphics/mesa/mesa.inc
 &gt; @@ -17,7 +17,6 @@ PE =3D "2"
 &gt;  SRC_URI =3D "<a href=3D"https://mesa.freedesktop.org/archive/mesa-${=
PV}.tar.xz">https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \
 &gt;             <a href=3D"file://0001-meson.build-check-for-all-linux-ho=
st_os-combinations.patch">file://0001-meson.build-check-for-all-linux-host_=
os-combinations.patch</a> \
 &gt;             <a href=3D"file://0001-meson-misdetects-64bit-atomics-on-=
mips-clang.patch">file://0001-meson-misdetects-64bit-atomics-on-mips-clang.=
patch</a> \
 &gt; -           <a href=3D"file://0001-futex.h-Define-__NR_futex-if-it-do=
es-not-exist.patch">file://0001-futex.h-Define-__NR_futex-if-it-does-not-ex=
ist.patch</a> \
 &gt;             <a href=3D"file://0001-util-format-Check-for-NEON-before-=
using-it.patch">file://0001-util-format-Check-for-NEON-before-using-it.patc=
h</a> \
 &gt;             ${NATIVE_PATCHES} \
 &gt;             "
 &gt; @@ -25,7 +24,7 @@ NATIVE_PATCHES ?=3D ""
 &gt;  # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BU=
ILD enabled
 &gt;  NATIVE_PATCHES:class-native =3D "<a href=3D"file://0001-nir-nir_opt_=
move-fix-ALWAYS_INLINE-compiler-error.patch" "=3D"">file://0001-nir-nir_opt=
_move-fix-ALWAYS_INLINE-compiler-error.patch"</a>
 &gt;
 &gt; -SRC_URI[sha256sum] =3D "ee7d026f7b1991dbae0861d359b671145c3a86f2a731=
353b885d2ea2d5c098d6"
 &gt; +SRC_URI[sha256sum] =3D "644bf936584548c2b88762111ad58b4aa3e468887420=
0e5a4eb74e53ce301746"
 &gt;
 &gt;  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P&lt;pver&gt;\d+(\.\d+)+)"
 &gt;
 &gt; @@ -97,7 +96,6 @@ PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddis=
abled"
 &gt;  X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage=
 libxfixes xrandr"
 &gt;  # "x11" requires "opengl"
 &gt;  PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
 &gt; -PACKAGECONFIG[xvmc] =3D "-Dgallium-xvmc=3Denabled,-Dgallium-xvmc=3Dd=
isabled,libxvmc"
 &gt;  PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-=
protocols"
 &gt;
 &gt;  PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, xorgpr=
oto libxshmfence"
 &gt; diff --git a/meta/recipes-graphics/mesa/mesa_22.2.3.bb b/meta/recipes=
-graphics/mesa/mesa_22.3.0.bb
 &gt; similarity index 100%
 &gt; rename from meta/recipes-graphics/mesa/mesa_22.2.3.bb
 &gt; rename to meta/recipes-graphics/mesa/mesa_22.3.0.bb
 &gt; --
 &gt; 2.34.1
 &gt;

 &gt;
 &gt;
 &gt;


 --
 Alexandre Belloni, co-owner and COO, Bootlin
 Embedded Linux and Kernel engineering
 <a href=3D"https://bootlin.com">https://bootlin.com</a>

=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#174294): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174294">https://lists.openembedded.org/g/openembedd=
ed-core/message/174294</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95388063/3618=
223">https://lists.openembedded.org/mt/95388063/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-CNwogKDvxD8jILyWGc+V--


