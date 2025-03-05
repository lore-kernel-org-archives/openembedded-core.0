Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04ACFC282DE
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 17:54:15 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.239.1741197246089845314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 09:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout11.t-online.de (Postfix) with SMTP id 7A9EA67B
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Mar 2025 18:53:56 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.117]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tpswL-3pV1wP0; Wed, 5 Mar 2025 18:53:53 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libsdl2: update 2.30.12 -> 2.32.2
Date: Wed,  5 Mar 2025 18:54:31 +0100
Message-ID: <20250305175432.2040027-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741197233-8B7FD9FB-0A4EA41B/0/0 CLEAN NORMAL
X-TOI-MSGID: 59c1ec49-94f2-4d7e-bfb0-f3b6898f8536
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 17:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212345

SDL 3.0 recommended!

The SDL development team is focusing efforts on SDL3 and making sdl2-comp=
at a drop-in replacement for SDL2.
If you run into issues with SDL2, please consider upgrading to SDL3 or tr=
ying out sdl2-compat. We have made
significant improvements across all platforms and your issue may already =
be resolved.

2.32.2:
This is a stable bugfix release, with the following changes:

    Fixed stack overflow when setting thread debug names on Windows
    Fixed flushing audio forever in some cases when recording PulseAudio =
on Linux
    Fixed a crash when initializing with controllers connected on macOS
    Added SDL_HINT_JOYSTICK_HAPTIC_AXES to specify how many haptic axes a=
 device has

2.32.0:
This is a stable bugfix release, with the following changes:

    Allow destroying a window and its renderer in either order
    Added cursor-shape-v1 protocol support on Wayland
    Fixed full immersive mode in Android 9 and higher
    Improved event processing latency when gamepad/sensor is open
    Added SDL_HINT_APPLE_RWFROMFILE_USE_RESOURCES to control whether SDL =
tries to open files from the app's resource directory on macOS
    Fixed conditional effect playback on Moza Racing devices
    Fixed input for Thrustmaster PlayStation wheels when hid-tmff2 is ins=
talled
    Enabled direct VRAM access when using the window surface API on PSP
    Improved window surface support on Nintendo 3DS
    Fixed condition variable implementation on Nintendo 3DS
    Fixed byte order detection on Solaris
    Implemented SDL_TriggerBreakpoint() on aarch64-w64-mingw32

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsdl2/{libsdl2_2.30.12.bb =3D> libsdl2_2.32.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.12.bb =3D> libsdl2_2.=
32.2.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb b/meta/reci=
pes-graphics/libsdl2/libsdl2_2.32.2.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
index b0ad55e314..2b28b3dfa9 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.2.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.t=
ar.gz"
=20
 S =3D "${WORKDIR}/SDL2-${PV}"
=20
-SRC_URI[sha256sum] =3D "ac356ea55e8b9dd0b2d1fa27da40ef7e238267ccf9324704=
850d5d47375b48ea"
+SRC_URI[sha256sum] =3D "c5f30c427fd8107ee4a400c84d4447dd211352512eaf0b6e=
89cc6a50a2821922"
=20
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-=
is-even
=20
--=20
2.48.1


