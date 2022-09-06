Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F051C38145
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 10:02:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.2191.1662458531588473077
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 03:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LWUWcptK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EBEBDFF80D;
	Tue,  6 Sep 2022 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662458529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qO/sq72NfUuqPulM8afJbJtj2o8qQj/Jqg1ln2lli+M=;
	b=LWUWcptKZUKxUcbO7I4/Skdn/IzrNbNc6QGVqTuZcHCeIoRWMtlKmUpzMmg9NOxrFrKjb9
	0uqfXIaTV1MBcnnkt2rCoTRg1kEIT0d4AtZCGTpEqxurkVeJvDb3vgweZVaDQdwTv0dLrO
	/K2y5weYpXSbzPWGNzyGAKl9FJHO/V3ujeaa5qVge/UUqmH34sNlmvu2a1gpWurVEoYcGw
	e60cW+otMWg96a7+vNlAMi9FkNBO5B5Gb8Y3AOZSvDAVhvEmigucGoEPIb+5WcvsisJ58f
	gUS6eevQzcnYNuKBZ9dbl4+KKAUnkkzk9DNhCpcMta1lOTD7WxxvlY3QO3Fw5A==
Date: Tue, 6 Sep 2022 12:02:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv4] libsdl2: update 2.0.22 -> 2.24.0
Message-ID: <YxcaoKV6sz+dCbGL@mail.local>
References: <20220906074315.195684-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220906074315.195684-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 10:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170340

Hello,

This causes the following failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/5835/step=
s/12/logs/stdio

| [247/457] /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i6=
86-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/recipe-sysroot=
-native/usr/bin/i686-w64-mingw32/i686-w64-mingw32-gcc -DDLL_EXPORT -DUSING_=
GENERATED_CONFIG_H -I/home/pokybuild/yocto-worker/meta-mingw/build/build/tm=
p/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/build=
/include -I/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i68=
6-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/build/include-c=
onfig- --sysroot=3D/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/=
work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/recipe-=
sysroot  -O2 -pipe -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/meta-m=
ingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libs=
dl2/2.24.0-r0/SDL2-2.24.0=3D/usr/src/debug/nativesdk-libsdl2/2.24.0-r0  -fd=
ebug-prefix-map=3D/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/w=
ork/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/SDL2-2.2=
4.0=3D/usr/src/debug/nativesdk-libsdl2/2.24.0-r0  -fmacro-prefix-map=3D/hom=
e/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-min=
gw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/build=3D/usr/src/debug/natives=
dk-libsdl2/2.24.0-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/met=
a-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-l=
ibsdl2/2.24.0-r0/build=3D/usr/src/debug/nativesdk-libsdl2/2.24.0-r0  -fdebu=
g-prefix-map=3D/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work=
/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/recipe-sysr=
oot=3D  -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/meta-mingw/build/=
build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-=
r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/met=
a-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-l=
ibsdl2/2.24.0-r0/recipe-sysroot-native=3D  -idirafter "/home/pokybuild/yoct=
o-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32=
/nativesdk-libsdl2/2.24.0-r0/SDL2-2.24.0/src/video/khronos"  -Wall -fno-str=
ict-aliasing -Werror=3Ddeclaration-after-statement -Wdeclaration-after-stat=
ement -fvisibility=3Dhidden -Wshadow -fdiagnostics-color=3Dalways -mmmx -m3=
dnow -msse -mfpmath=3D387  -DSDL_BUILD_MAJOR_VERSION=3D2 -DSDL_BUILD_MINOR_=
VERSION=3D24 -DSDL_BUILD_MICRO_VERSION=3D0 -MD -MT CMakeFiles/SDL2.dir/src/=
video/windows/SDL_windowsvideo.c.obj -MF CMakeFiles/SDL2.dir/src/video/wind=
ows/SDL_windowsvideo.c.obj.d -o CMakeFiles/SDL2.dir/src/video/windows/SDL_w=
indowsvideo.c.obj -c /home/pokybuild/yocto-worker/meta-mingw/build/build/tm=
p/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/SDL2-=
2.24.0/src/video/windows/SDL_windowsvideo.c
| FAILED: CMakeFiles/SDL2.dir/src/video/windows/SDL_windowsvideo.c.obj
| /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-natives=
dk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/recipe-sysroot-native/us=
r/bin/i686-w64-mingw32/i686-w64-mingw32-gcc -DDLL_EXPORT -DUSING_GENERATED_=
CONFIG_H -I/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i68=
6-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/build/include -=
I/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesd=
k-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/build/include-config- --s=
ysroot=3D/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-=
nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/recipe-sysroot  -=
O2 -pipe -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/meta-mingw/build=
/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0=
-r0/SDL2-2.24.0=3D/usr/src/debug/nativesdk-libsdl2/2.24.0-r0  -fdebug-prefi=
x-map=3D/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-n=
ativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/SDL2-2.24.0=3D/usr=
/src/debug/nativesdk-libsdl2/2.24.0-r0  -fmacro-prefix-map=3D/home/pokybuil=
d/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-m=
ingw32/nativesdk-libsdl2/2.24.0-r0/build=3D/usr/src/debug/nativesdk-libsdl2=
/2.24.0-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/meta-mingw/bu=
ild/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.2=
4.0-r0/build=3D/usr/src/debug/nativesdk-libsdl2/2.24.0-r0  -fdebug-prefix-m=
ap=3D/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nati=
vesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/recipe-sysroot=3D  -f=
macro-prefix-map=3D/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/=
work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/recipe-=
sysroot=3D  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/meta-mingw/bu=
ild/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.2=
4.0-r0/recipe-sysroot-native=3D  -idirafter "/home/pokybuild/yocto-worker/m=
eta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk=
-libsdl2/2.24.0-r0/SDL2-2.24.0/src/video/khronos"  -Wall -fno-strict-aliasi=
ng -Werror=3Ddeclaration-after-statement -Wdeclaration-after-statement -fvi=
sibility=3Dhidden -Wshadow -fdiagnostics-color=3Dalways -mmmx -m3dnow -msse=
 -mfpmath=3D387  -DSDL_BUILD_MAJOR_VERSION=3D2 -DSDL_BUILD_MINOR_VERSION=3D=
24 -DSDL_BUILD_MICRO_VERSION=3D0 -MD -MT CMakeFiles/SDL2.dir/src/video/wind=
ows/SDL_windowsvideo.c.obj -MF CMakeFiles/SDL2.dir/src/video/windows/SDL_wi=
ndowsvideo.c.obj.d -o CMakeFiles/SDL2.dir/src/video/windows/SDL_windowsvide=
o.c.obj -c /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i68=
6-nativesdk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/SDL2-2.24.0/src=
/video/windows/SDL_windowsvideo.c
| /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-natives=
dk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/SDL2-2.24.0/src/video/wi=
ndows/SDL_windowsvideo.c: In function 'WIN_CreateDevice':
| /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-natives=
dk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/SDL2-2.24.0/src/video/wi=
ndows/SDL_windowsvideo.c:247:38: error: 'WIN_GL_GetDrawableSize' undeclared=
 (first use in this function); did you mean 'WIN_GetDrawableSize'?
|   247 |     device->Vulkan_GetDrawableSize =3D WIN_GL_GetDrawableSize;
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~
|       |                                      WIN_GetDrawableSize
| /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-natives=
dk-mingw32-w64-mingw32/nativesdk-libsdl2/2.24.0-r0/SDL2-2.24.0/src/video/wi=
ndows/SDL_windowsvideo.c:247:38: note: each undeclared identifier is report=
ed only once for each function it appears in



On 06/09/2022 09:43:15+0200, Markus Volk wrote:
> In addition to lots of bug fixes, here are the major changes in this rele=
ase:
>=20
> General:
>=20
> New version numbering scheme, similar to GLib and Flatpak.
> An even number in the minor version (second component) indicates a produc=
tion-ready stable release such as 2.24.0, which would have been 2.0.24 unde=
r the old system.
> The patchlevel (micro version, third component) indicates a bugfix-only u=
pdate: for example, 2.24.1 would be a bugfix-only release to fix bugs in 2.=
24.0, without adding new features.
> An odd number in the minor version indicates a prerelease such as 2.23.0.=
 Stable distributions should not use these prereleases.
> The patchlevel indicates successive prereleases, for example 2.23.1 and 2=
=2E23.2 would be prereleases during development of the SDL 2.24.0 stable re=
lease.
> Added SDL_GetPointDisplayIndex() and SDL_GetRectDisplayIndex() to get the=
 display associated with a point and rectangle in screen space
> Added SDL_bsearch(), SDL_crc16(), and SDL_utf8strnlen() to the stdlib rou=
tines
> Added SDL_CPUPauseInstruction() as a macro in SDL_atomic.h
> Added SDL_size_mul_overflow() and SDL_size_add_overflow() for better size=
 overflow protection
> Added SDL_ResetHint() to reset a hint to the default value
> Added SDL_ResetKeyboard() to reset SDL's internal keyboard state, generat=
ing key up events for all currently pressed keys
> Added the hint SDL_HINT_MOUSE_RELATIVE_WARP_MOTION to control whether mou=
se warping generates motion events in relative mode. This hint defaults off.
> Added the hint SDL_HINT_TRACKPAD_IS_TOUCH_ONLY to control whether trackpa=
ds are treated as touch devices or mice. By default touchpads are treated a=
s mouse input.
> The hint SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS now defaults on
> Added support for mini-gamepad mode for Nintendo Joy-Con controllers usin=
g the HIDAPI driver
> Added the hint SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS to control wheth=
er Joy-Con controllers are automatically merged into a unified gamepad when=
 using the HIDAPI driver. This hint defaults on.
> The hint SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED can be set to a floatin=
g point value to set the brightness of the Home LED on Nintendo Switch cont=
rollers
> Added the hint SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED to set the Home L=
ED brightness for the Nintendo Joy-Con controllers. By default the Home LED=
 is not modified.
> Added the hint SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED to control whet=
her the player LED should be lit on the Nintendo Joy-Con controllers
> Added support for Nintendo Online classic controllers using the HIDAPI dr=
iver
> Added the hint SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC to control wheth=
er the HIDAPI driver for Nintendo Online classic controllers should be used
> Added support for the NVIDIA Shield Controller to the HIDAPI driver, supp=
orting rumble and battery status
> Added support for NVIDIA SHIELD controller to the HIDAPI driver, and a hi=
nt SDL_HINT_JOYSTICK_HIDAPI_SHIELD to control whether this is used
> Added functions to get the platform dependent name for a joystick or game=
 controller:
> SDL_JoystickPathForIndex()
> SDL_JoystickPath()
> SDL_GameControllerPathForIndex()
> SDL_GameControllerPath()
> Added SDL_GameControllerGetFirmwareVersion() and SDL_JoystickGetFirmwareV=
ersion(), currently implemented for DualSense(tm) Wireless Controllers usin=
g HIDAPI
> Added SDL_JoystickAttachVirtualEx() for extended virtual controller suppo=
rt
> Added joystick event SDL_JOYBATTERYUPDATED for when battery status changes
> Added SDL_GUIDToString() and SDL_GUIDFromString() to convert between SDL =
GUID and string
> Added SDL_HasLSX() and SDL_HasLASX() to detect LoongArch SIMD support
> Added SDL_GetOriginalMemoryFunctions()
> Added SDL_GetDefaultAudioInfo() to get the name and format of the default=
 audio device, currently implemented for PipeWire, PulseAudio, WASAPI, and =
DirectSound
> Added HIDAPI driver for the NVIDIA SHIELD controller (2017 model) to enab=
le support for battery status and rumble
> Added support for opening audio devices with 3 or 5 channels (2.1, 4.1). =
All channel counts from Mono to 7.1 are now supported.
> Rewrote audio channel converters used by SDL_AudioCVT, based on the chann=
el matrix coefficients used as the default for FAudio voices
> SDL log messages are no longer limited to 4K and can be any length
> Fixed a long-standing calling convention issue with dynapi affecting Open=
Watcom or OS/2 builds
> Windows:
>=20
> Added initial support for building for Windows and Xbox with Microsoft's =
Game Development Kit (GDK), see docs/README-gdk.md for details
> Added a D3D12 renderer implementation and SDL_RenderGetD3D12Device() to r=
etrieve the D3D12 device associated with it
> Added the hint SDL_HINT_WINDOWS_DPI_AWARENESS to set whether the applicat=
ion is DPI-aware. This hint must be set before initializing the video subsy=
stem
> Added the hint SDL_HINT_WINDOWS_DPI_SCALING to control whether the SDL co=
ordinates are in DPI-scaled points or pixels
> Added the hint SDL_HINT_DIRECTINPUT_ENABLED to control whether the Direct=
Input driver should be used
> Added support for SDL_GetAudioDeviceSpec to the DirectSound backend
> Linux:
>=20
> Support for XVidMode has been removed, mode changes are only supported us=
ing the XRandR extension
> Added the hint SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION to control whether t=
o expose a set of emulated modes in addition to the native resolution modes=
 available on Wayland
> Added the hint SDL_HINT_KMSDRM_DEVICE_INDEX to specify which KMSDRM devic=
e to use if the default is not desired
> Added the hint SDL_HINT_LINUX_DIGITAL_HATS to control whether to treat ha=
ts as digital rather than checking to see if they may be analog
> Added the hint SDL_HINT_LINUX_HAT_DEADZONES to control whether to use dea=
dzones on analog hats
> macOS:
>=20
> Bumped minimum OS deployment version to macOS 10.9
> Added SDL_GL_FLOATBUFFERS to allow Cocoa GL contexts to use EDR
> Added the hint SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH to control whether disp=
atching OpenGL context updates should block the dispatching thread until th=
e main thread finishes processing. This hint defaults to blocking, which is=
 the safer option on modern macOS.
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...ability-to-disable-fb-accel-via-hint.patch | 36 -------------------
>  .../{libsdl2_2.0.22.bb =3D> libsdl2_2.24.0.bb}  |  7 ++--
>  2 files changed, 3 insertions(+), 40 deletions(-)
>  delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-video-rest=
ore-ability-to-disable-fb-accel-via-hint.patch
>  rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.22.bb =3D> libsdl2_2.2=
4.0.bb} (93%)
>=20
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-video-restore-abi=
lity-to-disable-fb-accel-via-hint.patch b/meta/recipes-graphics/libsdl2/lib=
sdl2/0001-video-restore-ability-to-disable-fb-accel-via-hint.patch
> deleted file mode 100644
> index fc74d30556..0000000000
> --- a/meta/recipes-graphics/libsdl2/libsdl2/0001-video-restore-ability-to=
-disable-fb-accel-via-hint.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 14ad91658fd296e34bb9e833281e72c871bfb189 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Tue, 3 May 2022 12:31:50 +0200
> -Subject: [PATCH] video: restore ability to disable fb accel via hint
> -
> -Somewhere in code refactoring between .20 and .22 this check
> -was lost, and so the hint had no effect anymore.
> -
> -Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/5611]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - src/video/SDL_video.c | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/src/video/SDL_video.c b/src/video/SDL_video.c
> -index 93c803e..cbe7616 100644
> ---- a/src/video/SDL_video.c
> -+++ b/src/video/SDL_video.c
> -@@ -2503,6 +2503,14 @@ SDL_CreateWindowFramebuffer(SDL_Window * window)
> -     if (!_this->checked_texture_framebuffer) {
> -         SDL_bool attempt_texture_framebuffer =3D SDL_TRUE;
> -=20
> -+        /* See if the user or application wants to specifically disable=
 the framebuffer */
> -+        const char *hint =3D SDL_GetHint(SDL_HINT_FRAMEBUFFER_ACCELERAT=
ION);
> -+        if (hint) {
> -+            if (*hint =3D=3D '0' || SDL_strcasecmp(hint, "false") =3D=
=3D 0) {
> -+                attempt_texture_framebuffer =3D SDL_FALSE;
> -+            }
> -+        }
> -+
> -         if (_this->is_dummy) {  /* dummy driver never has GPU support, =
of course. */
> -             attempt_texture_framebuffer =3D SDL_FALSE;
> -         }
> ---=20
> -2.30.2
> -
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.24.0.bb
> similarity index 93%
> rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> rename to meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb
> index ff3e162c49..fd484a0b52 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb
> @@ -22,13 +22,12 @@ LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('P=
ACKAGECONFIG', 'arm-neon', 'f
>  PROVIDES =3D "virtual/libsdl2"
> =20
>  SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> -           file://0001-video-restore-ability-to-disable-fb-accel-via-hin=
t.patch \
>             "
>  SRC_URI:append:class-native =3D " file://0001-Disable-libunwind-in-nativ=
e-OE-builds-by-not-looking.patch"
> =20
>  S =3D "${WORKDIR}/SDL2-${PV}"
> =20
> -SRC_URI[sha256sum] =3D "fe7cbf3127882e3fc7259a75a0cb585620272c51745d3852=
ab9dd87960697f2e"
> +SRC_URI[sha256sum] =3D "91e4c34b1768f92d399b078e171448c6af18cafda743987e=
d2064a28954d6d97"
> =20
>  inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-=
is-even
> =20
> @@ -43,9 +42,7 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -DSD=
L_ARTS=3DOFF \
>                   -DSDL_PTHREADS=3DON \
>                   -DSDL_RPATH=3DOFF \
>                   -DSDL_SNDIO=3DOFF \
> -                 -DSDL_X11_XVM=3DOFF \
>                   -DSDL_X11_XCURSOR=3DOFF \
> -                 -DSDL_X11_XINERAMA=3DOFF \
>                   -DSDL_X11_XDBE=3DOFF \
>                   -DSDL_X11_XFIXES=3DOFF \
>                   -DSDL_X11_XINPUT=3DOFF \
> @@ -82,4 +79,6 @@ PACKAGECONFIG[x11]        =3D "-DSDL_X11=3DON,-DSDL_X11=
=3DOFF,virtual/libx11 libxext l
> =20
>  CFLAGS:append:class-native =3D " -DNO_SHARED_MEMORY"
> =20
> +FILES:${PN} +=3D "${datadir}/licenses/SDL2/LICENSE.txt"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.34.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170336): https://lists.openembedded.org/g/openembedde=
d-core/message/170336
> Mute This Topic: https://lists.openembedded.org/mt/93496236/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

