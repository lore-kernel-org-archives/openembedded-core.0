Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E2EC4332F
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 12:43:04 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web09.27204.1653309779221586237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 05:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout09.t-online.de (Postfix) with SMTP id 678703D8B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 14:42:57 +0200 (CEST)
Received: from localhost.localdomain ([79.219.229.214]) by fwd87.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nt7Oh-0ZMhzJ0; Mon, 23 May 2022 14:42:56 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCHv6 5/5] libsdl2: add PACKAGECONFIG options
Date: Mon, 23 May 2022 14:42:40 +0200
Message-Id: <20220523124240.1649817-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523124240.1649817-1-f_l_k@t-online.de>
References: <20220523124240.1649817-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653309776-00000271-32C02839/0/0 CLEAN NORMAL
X-TOI-MSGID: 614bb3ea-b4a4-4d25-ab63-c66c7c24c071
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 12:43:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166016

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.22.bb
index 7206b2d2d8..48a294fbbc 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
@@ -58,7 +58,7 @@ PACKAGECONFIG_GL ?=3D "${@bb.utils.filter('DISTRO_FEATU=
RES', 'opengl gles2', d)}"
=20
 PACKAGECONFIG ??=3D " \
     ${PACKAGECONFIG_GL} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11 =
wayland', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pipewire pulsea=
udio x11 wayland', d)} \
     ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
 "
 PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib=
,"
@@ -67,10 +67,12 @@ PACKAGECONFIG[directfb]   =3D "-DSDL_DIRECTFB=3DON,-D=
SDL_DIRECTFB=3DOFF,directfb,direc
 PACKAGECONFIG[gles2]      =3D "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,=
virtual/libgles2"
 PACKAGECONFIG[jack]       =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack"
 PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libd=
rm virtual/libgbm"
+PACKAGECONFIG[libdecor]   =3D "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND=
_LIBDECOR=3DOFF,libdecor,libdecor"
 # The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers,
 #  so we'll just use libusb when it's available.
 PACKAGECONFIG[libusb] =3D ",,libusb1"
 PACKAGECONFIG[opengl]     =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/egl"
+PACKAGECONFIG[pipewire]   =3D "-DSDL_PIPEWIRE=3DON,-DSDL_PIPEWIRE=3DOFF,=
pipewire"
 PACKAGECONFIG[pulseaudio] =3D "-DSDL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3D=
OFF,pulseaudio"
 PACKAGECONFIG[wayland]    =3D "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DOFF,wa=
yland-native wayland wayland-protocols libxkbcommon"
 PACKAGECONFIG[x11]        =3D "-DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/li=
bx11 libxext libxrandr libxrender"
--=20
2.25.1


