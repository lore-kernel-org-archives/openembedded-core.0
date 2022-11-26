Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5303BC43217
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 11:32:25 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.68426.1669462335642438890
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 03:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id 04AEB11318
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 12:31:58 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oytPY-2pgsMr0; Sat, 26 Nov 2022 12:31:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] libsdl2: update 2.24.2 -> 2.26.0
Date: Sat, 26 Nov 2022 12:31:48 +0100
Message-Id: <20221126113148.1124930-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669462316-4D45FB8C-E40A11C1/0/0 CLEAN NORMAL
X-TOI-MSGID: b576ace0-7a2f-4d23-8ff1-4683957aedbe
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 11:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173792

- add PACKAGECONFIG for libdecor
- add PACKAGECONFIG for pipewire
- remove native patch, CMakeLists.txt has been reworked,
  still needed ?

In addition to lots of bug fixes, here are the major changes in this rele=
ase:

General:

    Updated OpenGL headers to the latest API from The Khronos Group Inc.
    Added SDL_GetWindowSizeInPixels() to get the window size in pixels, w=
hich may differ from the window coordinate size for windows with high-DPI=
 support
    Added simulated vsync synchronization for the software renderer
    Added the mouse position to SDL_MouseWheelEvent
    Added SDL_ResetHints() to reset all hints to their default values
    Added SDL_GetJoystickGUIDInfo() to get device information encoded in =
a joystick GUID
    Added the hint SDL_HINT_JOYSTICK_HIDAPI_XBOX_360 to control whether t=
he HIDAPI driver for XBox 360 controllers should be used
    Added the hint SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_PLAYER_LED to contro=
l whether the player LEDs should be lit to indicate which player is assoc=
iated with an Xbox 360 controller
    Added the hint SDL_HINT_JOYSTICK_HIDAPI_XBOX_360_WIRELESS to control =
whether the HIDAPI driver for XBox 360 wireless controllers should be use=
d
    Added the hint SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE to control whether t=
he HIDAPI driver for XBox One controllers should be used
    Added the hint SDL_HINT_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED to control =
the brightness of the XBox One guide button LED
    Added support for PS3 controllers to the HIDAPI driver, enabled by de=
fault on macOS, controlled by the SDL_HINT_JOYSTICK_HIDAPI_PS3 hint
    Added support for Nintendo Wii controllers to the HIDAPI driver, not =
enabled by default, controlled by the SDL_HINT_JOYSTICK_HIDAPI_WII hint
    Added the hint SDL_HINT_JOYSTICK_HIDAPI_WII_PLAYER_LED to control whe=
ther the player LED should be lit on the Nintendo Wii controllers
    Added the hint SDL_HINT_JOYSTICK_HIDAPI_VERTICAL_JOY_CONS to control =
whether Nintendo Switch Joy-Con controllers will be in vertical mode when=
 using the HIDAPI driver
    Added access to the individual left and right gyro sensors of the com=
bined Joy-Cons controller
    Added a microsecond timestamp to SDL_SensorEvent and SDL_ControllerSe=
nsorEvent, when the hardware provides that information
    Added SDL_SensorGetDataWithTimestamp() and SDL_GameControllerGetSenso=
rDataWithTimestamp() to retrieve the last sensor data with the associated=
 microsecond timestamp
    Added the hint SDL_HINT_HIDAPI_IGNORE_DEVICES to have the SDL HID API=
 ignore specific devices
    SDL_GetRevision() now includes more information about the SDL build, =
including the git commit hash if available

Windows:

    Added the hint SDL_HINT_MOUSE_RELATIVE_SYSTEM_SCALE to control whethe=
r the system mouse acceleration curve is used for relative mouse motion

macOS:

    Implemented vsync synchronization on macOS 12

Linux:

    Added SDL_SetPrimarySelectionText(), SDL_GetPrimarySelectionText(), a=
nd SDL_HasPrimarySelectionText() to interact with the X11 primary selecti=
on clipboard
    Added the hint SDL_HINT_VIDEO_WAYLAND_EMULATE_MOUSE_WARP to control w=
hether mouse pointer warp emulation is enabled under Wayland

Android:

    Enabled IME soft keyboard input
    Added version checking to make sure the SDL Java and C code are compa=
tible

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...d-in-native-OE-builds-by-not-looking.patch | 36 -------------------
 .../{libsdl2_2.24.2.bb =3D> libsdl2_2.26.0.bb}  | 10 +++---
 2 files changed, 5 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-li=
bunwind-in-native-OE-builds-by-not-looking.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.24.2.bb =3D> libsdl2_2.2=
6.0.bb} (91%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind=
-in-native-OE-builds-by-not-looking.patch b/meta/recipes-graphics/libsdl2=
/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
deleted file mode 100644
index f34b870e74..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-nat=
ive-OE-builds-by-not-looking.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 77093de6a12c24a60fc447698900d18d0a3943af Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <crg7475@mailbox.org>
-Date: Fri, 18 Mar 2022 12:06:23 +0100
-Subject: [PATCH] Disable libunwind in native OE builds by not looking fo=
r
- libunwind
-
-This is a workaround for this build error:
-
-| -- Checking for one of the modules 'libunwind'
-| CMake Error at [...]/build/tmp/work/x86_64-linux/libsdl2-native/2.0.20=
-r0/recipe-sysroot-native/usr/share/cmake-3.22/Modules/FindPkgConfig.cmak=
e:890 (message):
-|   None of the required 'libunwind' found
-| Call Stack (most recent call first):
-|   CMakeLists.txt:1367 (pkg_search_module)
-
-By not looking for the libunwind header, the rest of the libunwind
-specific bits in the CMake build script are disabled.
-
-Upstream-Status: Inappropriate [OE specific]
-
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7617205..d9b1522 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -952,7 +952,7 @@ if(SDL_LIBC)
-     check_include_file(sys/types.h HAVE_SYS_TYPES_H)
-     foreach(_HEADER
-             stdio.h stdlib.h stddef.h stdarg.h malloc.h memory.h string=
.h limits.h float.h
--            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.=
h signal.h libunwind.h)
-+            strings.h wchar.h inttypes.h stdint.h ctype.h math.h iconv.=
h signal.h)
-       string(TOUPPER "HAVE_${_HEADER}" _UPPER)
-       string(REPLACE "." "_" _HAVE_H ${_UPPER})
-       check_include_file("${_HEADER}" ${_HAVE_H})
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.24.2.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.26.0.bb
similarity index 91%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.24.2.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.26.0.bb
index ce5a8aa8f2..3dda082593 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.24.2.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.26.0.bb
@@ -21,13 +21,11 @@ LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('P=
ACKAGECONFIG', 'arm-neon', 'f
=20
 PROVIDES =3D "virtual/libsdl2"
=20
-SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
-           "
-SRC_URI:append:class-native =3D " file://0001-Disable-libunwind-in-nativ=
e-OE-builds-by-not-looking.patch"
+SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
=20
 S =3D "${WORKDIR}/SDL2-${PV}"
=20
-SRC_URI[sha256sum] =3D "b35ef0a802b09d90ed3add0dcac0e95820804202914f5bb7=
b0feb710f1a1329f"
+SRC_URI[sha256sum] =3D "8000d7169febce93c84b6bdf376631f8179132fd69f7015d=
4dadb8b9c2bdb295"
=20
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-=
is-even
=20
@@ -59,7 +57,7 @@ PACKAGECONFIG:class-native =3D "x11 ${PACKAGECONFIG_GL}=
"
 PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)} ${PACKAGECONFIG_GL}"
 PACKAGECONFIG ??=3D " \
     ${PACKAGECONFIG_GL} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11 =
vulkan', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio pipe=
wire x11 vulkan', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', =
'', d)} \
     ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
 "
@@ -72,7 +70,9 @@ PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_=
KMSDRM=3DOFF,libdrm virtual/lib
 # The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers,
 #  so we'll just use libusb when it's available.
 PACKAGECONFIG[libusb] =3D ",,libusb1"
+PACKAGECONFIG[libdecor] =3D "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND_L=
IBDECOR=3DOFF,libdecor"
 PACKAGECONFIG[opengl]     =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/egl"
+PACKAGECONFIG[pipewire] =3D "-DSDL_PIPEWIRE_SHARED=3DON,-DSDL_PIPEWIRE_S=
HARED=3DOFF,pipewire"
 PACKAGECONFIG[pulseaudio] =3D "-DSDL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3D=
OFF,pulseaudio"
 PACKAGECONFIG[vulkan]    =3D "-DSDL_VULKAN=3DON,-DSDL_VULKAN=3DOFF"
 PACKAGECONFIG[wayland]    =3D "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DOFF,wa=
yland-native wayland wayland-protocols libxkbcommon"
--=20
2.34.1


