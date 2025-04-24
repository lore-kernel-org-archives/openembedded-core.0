Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CFCC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:43:26 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.4386.1745527404515770968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout04.t-online.de (Postfix) with SMTP id B8E16218
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 22:43:15 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83Pf-1t33iL0; Thu, 24 Apr 2025 22:43:15 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] mpg123: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:43:08 +0200
Message-ID: <20250424204308.2113998-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745527395-3DFF8936-DAC1E722/0/0 CLEAN NORMAL
X-TOI-MSGID: 46e457a2-066e-482a-ba7b-540e557c939a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 20:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215404

Fix to ensure it would work with both libsdl2 and libsdl2-compat

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb b/meta/reci=
pes-multimedia/mpg123/mpg123_1.32.10.bb
index 82f7b7d332..d559bc6417 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.10.bb
@@ -28,7 +28,7 @@ PACKAGECONFIG[jack] =3D ",,jack"
 PACKAGECONFIG[openal] =3D ",,openal-soft"
 PACKAGECONFIG[portaudio] =3D ",,portaudio-v19"
 PACKAGECONFIG[pulseaudio] =3D "--with-default-audio=3Dpulse,,pulseaudio"
-PACKAGECONFIG[sdl] =3D ",,libsdl2"
+PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2"
=20
 # Following are possible sound output modules:
 # alsa arts coreaudio dummy esd jack nas openal os2 oss portaudio pulse =
sdl sndio sun tinyalsa win32 win32_wasapi
--=20
2.49.0


