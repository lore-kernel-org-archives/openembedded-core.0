Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6546EC433F5
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 08:49:09 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.3692.1653122944630251914
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 01:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id 6AE196389
	for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 10:49:02 +0200 (CEST)
Received: from localhost.localdomain ([84.163.39.7]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nsKnC-1kogwT0; Sat, 21 May 2022 10:48:58 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2] libsdl2: add PACKAGECONFIG for libusb1 and remove
 obsolete options
Date: Sat, 21 May 2022 10:48:50 +0200
Message-Id: <20220521084850.4514-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653122938-00010BFA-7CA7E010/0/0 CLEAN NORMAL
X-TOI-MSGID: 5d11db91-dfdd-4110-9805-3d77b1dd4302
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 May 2022 08:49:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165960

Support for XVM and Xinerama has been removed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.22.bb
index 7678319770..b112d63784 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
@@ -43,9 +43,7 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -DSD=
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
@@ -72,6 +70,9 @@ PACKAGECONFIG[directfb]   =3D "-DSDL_DIRECTFB=3DON,-DSD=
L_DIRECTFB=3DOFF,directfb,direc
 PACKAGECONFIG[gles2]      =3D "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,=
virtual/libgles2"
 PACKAGECONFIG[jack]       =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack"
 PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libd=
rm virtual/libgbm"
+# The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers,
+#  so we'll just use libusb when it's available.
+PACKAGECONFIG[libusb] =3D ",,libusb1"
 PACKAGECONFIG[opengl]     =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/egl"
 PACKAGECONFIG[pulseaudio] =3D "-DSDL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3D=
OFF,pulseaudio"
 PACKAGECONFIG[wayland]    =3D "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DOFF,wa=
yland-native wayland wayland-protocols libxkbcommon"
--=20
2.25.1


