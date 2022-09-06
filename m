Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30B2ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 10:59:54 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.2515.1662461987068269222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 03:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout12.t-online.de (Postfix) with SMTP id 6BC7FC4E1
	for <openembedded-core@lists.openembedded.org>;
 Tue,  6 Sep 2022 12:59:43 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.37.201]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oVWIx-3UpKz30; Tue, 6 Sep 2022 12:59:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv5] libsdl2: update 2.0.22 -> 2.24.0
Date: Tue,  6 Sep 2022 12:59:29 +0200
Message-Id: <20220906105929.3025122-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1662461983-01452C5E-153D7051/0/0 CLEAN NORMAL
X-TOI-MSGID: 29040576-a270-4214-b9d9-68fadfdea7da
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 10:59:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170345

In addition to lots of bug fixes, here are the major changes in this rele=
ase:

General:

New version numbering scheme, similar to GLib and Flatpak.
An even number in the minor version (second component) indicates a produc=
tion-ready stable release such as 2.24.0, which would have been 2.0.24 un=
der the old system.
The patchlevel (micro version, third component) indicates a bugfix-only u=
pdate: for example, 2.24.1 would be a bugfix-only release to fix bugs in =
2.24.0, without adding new features.
An odd number in the minor version indicates a prerelease such as 2.23.0.=
 Stable distributions should not use these prereleases.
The patchlevel indicates successive prereleases, for example 2.23.1 and 2=
.23.2 would be prereleases during development of the SDL 2.24.0 stable re=
lease.
Added SDL_GetPointDisplayIndex() and SDL_GetRectDisplayIndex() to get the=
 display associated with a point and rectangle in screen space
Added SDL_bsearch(), SDL_crc16(), and SDL_utf8strnlen() to the stdlib rou=
tines
Added SDL_CPUPauseInstruction() as a macro in SDL_atomic.h
Added SDL_size_mul_overflow() and SDL_size_add_overflow() for better size=
 overflow protection
Added SDL_ResetHint() to reset a hint to the default value
Added SDL_ResetKeyboard() to reset SDL's internal keyboard state, generat=
ing key up events for all currently pressed keys
Added the hint SDL_HINT_MOUSE_RELATIVE_WARP_MOTION to control whether mou=
se warping generates motion events in relative mode. This hint defaults o=
ff.
Added the hint SDL_HINT_TRACKPAD_IS_TOUCH_ONLY to control whether trackpa=
ds are treated as touch devices or mice. By default touchpads are treated=
 as mouse input.
The hint SDL_HINT_JOYSTICK_HIDAPI_JOY_CONS now defaults on
Added support for mini-gamepad mode for Nintendo Joy-Con controllers usin=
g the HIDAPI driver
Added the hint SDL_HINT_JOYSTICK_HIDAPI_COMBINE_JOY_CONS to control wheth=
er Joy-Con controllers are automatically merged into a unified gamepad wh=
en using the HIDAPI driver. This hint defaults on.
The hint SDL_HINT_JOYSTICK_HIDAPI_SWITCH_HOME_LED can be set to a floatin=
g point value to set the brightness of the Home LED on Nintendo Switch co=
ntrollers
Added the hint SDL_HINT_JOYSTICK_HIDAPI_JOYCON_HOME_LED to set the Home L=
ED brightness for the Nintendo Joy-Con controllers. By default the Home L=
ED is not modified.
Added the hint SDL_HINT_JOYSTICK_HIDAPI_SWITCH_PLAYER_LED to control whet=
her the player LED should be lit on the Nintendo Joy-Con controllers
Added support for Nintendo Online classic controllers using the HIDAPI dr=
iver
Added the hint SDL_HINT_JOYSTICK_HIDAPI_NINTENDO_CLASSIC to control wheth=
er the HIDAPI driver for Nintendo Online classic controllers should be us=
ed
Added support for the NVIDIA Shield Controller to the HIDAPI driver, supp=
orting rumble and battery status
Added support for NVIDIA SHIELD controller to the HIDAPI driver, and a hi=
nt SDL_HINT_JOYSTICK_HIDAPI_SHIELD to control whether this is used
Added functions to get the platform dependent name for a joystick or game=
 controller:
SDL_JoystickPathForIndex()
SDL_JoystickPath()
SDL_GameControllerPathForIndex()
SDL_GameControllerPath()
Added SDL_GameControllerGetFirmwareVersion() and SDL_JoystickGetFirmwareV=
ersion(), currently implemented for DualSense(tm) Wireless Controllers us=
ing HIDAPI
Added SDL_JoystickAttachVirtualEx() for extended virtual controller suppo=
rt
Added joystick event SDL_JOYBATTERYUPDATED for when battery status change=
s
Added SDL_GUIDToString() and SDL_GUIDFromString() to convert between SDL =
GUID and string
Added SDL_HasLSX() and SDL_HasLASX() to detect LoongArch SIMD support
Added SDL_GetOriginalMemoryFunctions()
Added SDL_GetDefaultAudioInfo() to get the name and format of the default=
 audio device, currently implemented for PipeWire, PulseAudio, WASAPI, an=
d DirectSound
Added HIDAPI driver for the NVIDIA SHIELD controller (2017 model) to enab=
le support for battery status and rumble
Added support for opening audio devices with 3 or 5 channels (2.1, 4.1). =
All channel counts from Mono to 7.1 are now supported.
Rewrote audio channel converters used by SDL_AudioCVT, based on the chann=
el matrix coefficients used as the default for FAudio voices
SDL log messages are no longer limited to 4K and can be any length
Fixed a long-standing calling convention issue with dynapi affecting Open=
Watcom or OS/2 builds
Windows:

Added initial support for building for Windows and Xbox with Microsoft's =
Game Development Kit (GDK), see docs/README-gdk.md for details
Added a D3D12 renderer implementation and SDL_RenderGetD3D12Device() to r=
etrieve the D3D12 device associated with it
Added the hint SDL_HINT_WINDOWS_DPI_AWARENESS to set whether the applicat=
ion is DPI-aware. This hint must be set before initializing the video sub=
system
Added the hint SDL_HINT_WINDOWS_DPI_SCALING to control whether the SDL co=
ordinates are in DPI-scaled points or pixels
Added the hint SDL_HINT_DIRECTINPUT_ENABLED to control whether the Direct=
Input driver should be used
Added support for SDL_GetAudioDeviceSpec to the DirectSound backend
Linux:

Support for XVidMode has been removed, mode changes are only supported us=
ing the XRandR extension
Added the hint SDL_HINT_VIDEO_WAYLAND_MODE_EMULATION to control whether t=
o expose a set of emulated modes in addition to the native resolution mod=
es available on Wayland
Added the hint SDL_HINT_KMSDRM_DEVICE_INDEX to specify which KMSDRM devic=
e to use if the default is not desired
Added the hint SDL_HINT_LINUX_DIGITAL_HATS to control whether to treat ha=
ts as digital rather than checking to see if they may be analog
Added the hint SDL_HINT_LINUX_HAT_DEADZONES to control whether to use dea=
dzones on analog hats
macOS:

Bumped minimum OS deployment version to macOS 10.9
Added SDL_GL_FLOATBUFFERS to allow Cocoa GL contexts to use EDR
Added the hint SDL_HINT_MAC_OPENGL_ASYNC_DISPATCH to control whether disp=
atching OpenGL context updates should block the dispatching thread until =
the main thread finishes processing. This hint defaults to blocking, whic=
h is the safer option on modern macOS.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ability-to-disable-fb-accel-via-hint.patch | 36 -------------------
 .../{libsdl2_2.0.22.bb =3D> libsdl2_2.24.0.bb}  | 10 +++---
 2 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-video-rest=
ore-ability-to-disable-fb-accel-via-hint.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.22.bb =3D> libsdl2_2.2=
4.0.bb} (93%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-video-restore-abi=
lity-to-disable-fb-accel-via-hint.patch b/meta/recipes-graphics/libsdl2/l=
ibsdl2/0001-video-restore-ability-to-disable-fb-accel-via-hint.patch
deleted file mode 100644
index fc74d30556..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-video-restore-ability-to=
-disable-fb-accel-via-hint.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 14ad91658fd296e34bb9e833281e72c871bfb189 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 3 May 2022 12:31:50 +0200
-Subject: [PATCH] video: restore ability to disable fb accel via hint
-
-Somewhere in code refactoring between .20 and .22 this check
-was lost, and so the hint had no effect anymore.
-
-Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/5611]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/video/SDL_video.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/video/SDL_video.c b/src/video/SDL_video.c
-index 93c803e..cbe7616 100644
---- a/src/video/SDL_video.c
-+++ b/src/video/SDL_video.c
-@@ -2503,6 +2503,14 @@ SDL_CreateWindowFramebuffer(SDL_Window * window)
-     if (!_this->checked_texture_framebuffer) {
-         SDL_bool attempt_texture_framebuffer =3D SDL_TRUE;
-=20
-+        /* See if the user or application wants to specifically disable=
 the framebuffer */
-+        const char *hint =3D SDL_GetHint(SDL_HINT_FRAMEBUFFER_ACCELERAT=
ION);
-+        if (hint) {
-+            if (*hint =3D=3D '0' || SDL_strcasecmp(hint, "false") =3D=3D=
 0) {
-+                attempt_texture_framebuffer =3D SDL_FALSE;
-+            }
-+        }
-+
-         if (_this->is_dummy) {  /* dummy driver never has GPU support, =
of course. */
-             attempt_texture_framebuffer =3D SDL_FALSE;
-         }
---=20
-2.30.2
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.24.0.bb
similarity index 93%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb
index ff3e162c49..d5cbf73df2 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb
@@ -22,13 +22,12 @@ LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('P=
ACKAGECONFIG', 'arm-neon', 'f
 PROVIDES =3D "virtual/libsdl2"
=20
 SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
-           file://0001-video-restore-ability-to-disable-fb-accel-via-hin=
t.patch \
            "
 SRC_URI:append:class-native =3D " file://0001-Disable-libunwind-in-nativ=
e-OE-builds-by-not-looking.patch"
=20
 S =3D "${WORKDIR}/SDL2-${PV}"
=20
-SRC_URI[sha256sum] =3D "fe7cbf3127882e3fc7259a75a0cb585620272c51745d3852=
ab9dd87960697f2e"
+SRC_URI[sha256sum] =3D "91e4c34b1768f92d399b078e171448c6af18cafda743987e=
d2064a28954d6d97"
=20
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-=
is-even
=20
@@ -43,9 +42,7 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -DSD=
L_ARTS=3DOFF \
                  -DSDL_PTHREADS=3DON \
                  -DSDL_RPATH=3DOFF \
                  -DSDL_SNDIO=3DOFF \
-                 -DSDL_X11_XVM=3DOFF \
                  -DSDL_X11_XCURSOR=3DOFF \
-                 -DSDL_X11_XINERAMA=3DOFF \
                  -DSDL_X11_XDBE=3DOFF \
                  -DSDL_X11_XFIXES=3DOFF \
                  -DSDL_X11_XINPUT=3DOFF \
@@ -62,7 +59,7 @@ PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}=
"
 PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)} ${PACKAGECONFIG_GL}"
 PACKAGECONFIG ??=3D " \
     ${PACKAGECONFIG_GL} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11'=
, d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11 =
vulkan', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', =
'', d)} \
     ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
 "
@@ -77,9 +74,12 @@ PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL=
_KMSDRM=3DOFF,libdrm virtual/lib
 PACKAGECONFIG[libusb] =3D ",,libusb1"
 PACKAGECONFIG[opengl]     =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/egl"
 PACKAGECONFIG[pulseaudio] =3D "-DSDL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3D=
OFF,pulseaudio"
+PACKAGECONFIG[vulkan]    =3D "-DSDL_VULKAN=3DON,-DSDL_VULKAN=3DOFF"
 PACKAGECONFIG[wayland]    =3D "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DOFF,wa=
yland-native wayland wayland-protocols libxkbcommon"
 PACKAGECONFIG[x11]        =3D "-DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/li=
bx11 libxext libxrandr libxrender"
=20
 CFLAGS:append:class-native =3D " -DNO_SHARED_MEMORY"
=20
+FILES:${PN} +=3D "${datadir}/licenses/SDL2/LICENSE.txt"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


