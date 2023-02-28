Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8F8C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 14:05:49 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.24001.1677593143408030340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 06:05:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout05.t-online.de (Postfix) with SMTP id CC257AFD9
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 15:05:41 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.42.35]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pX0br-2BrXBB0; Tue, 28 Feb 2023 15:05:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] libsdl2: add missing libdecor RDEPEND
Date: Tue, 28 Feb 2023 15:05:26 +0100
Message-Id: <20230228140526.755305-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1677593139-1A7F6D98-4BC6E098/0/0 CLEAN NORMAL
X-TOI-MSGID: 094ef398-bc84-418c-a62c-9699fd14d0b6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 14:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177835

libdecor is dlopen'ed ... add it as RDEPEND to make it work on runtime

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.26.3.bb
index 871bb19712..15054e1ea9 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.26.3.bb
@@ -70,7 +70,7 @@ PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_=
KMSDRM=3DOFF,libdrm virtual/lib
 # The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers,
 #  so we'll just use libusb when it's available.
 PACKAGECONFIG[libusb] =3D ",,libusb1"
-PACKAGECONFIG[libdecor] =3D "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND_L=
IBDECOR=3DOFF,libdecor"
+PACKAGECONFIG[libdecor] =3D "-DSDL_WAYLAND_LIBDECOR=3DON,-DSDL_WAYLAND_L=
IBDECOR=3DOFF,libdecor,libdecor"
 PACKAGECONFIG[opengl]     =3D "-DSDL_OPENGL=3DON,-DSDL_OPENGL=3DOFF,virt=
ual/egl"
 PACKAGECONFIG[pipewire] =3D "-DSDL_PIPEWIRE_SHARED=3DON,-DSDL_PIPEWIRE_S=
HARED=3DOFF,pipewire"
 PACKAGECONFIG[pulseaudio] =3D "-DSDL_PULSEAUDIO=3DON,-DSDL_PULSEAUDIO=3D=
OFF,pulseaudio"
--=20
2.34.1


