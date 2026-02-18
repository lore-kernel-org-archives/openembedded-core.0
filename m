Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD81E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:02:51 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10586.1771416160874686768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout09.t-online.de (Postfix) with SMTP id E069838232
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 13:02:03 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.86]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vsgFf-15Tr7p0; Wed, 18 Feb 2026 13:01:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] xinput: allow native build
Date: Wed, 18 Feb 2026 13:01:41 +0100
Message-ID: <20260218120141.100083-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1771416115-117C8AC6-4AA1E6A9/0/0 CLEAN NORMAL
X-TOI-MSGID: a09ab2de-6072-4798-bb93-d05c945c6b9d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 12:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231295

This is required to build x11 support for libsdl3-native

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-app/xinput_1.6.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb b/meta/recipe=
s-graphics/xorg-app/xinput_1.6.4.bb
index 1d406b848c..d70bad7850 100644
--- a/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
+++ b/meta/recipes-graphics/xorg-app/xinput_1.6.4.bb
@@ -10,3 +10,5 @@ DEPENDS +=3D " libxi libxrandr libxinerama"
=20
 SRC_URI_EXT =3D "xz"
 SRC_URI[sha256sum] =3D "ad04d00d656884d133110eeddc34e9c69e626ebebbbab04d=
c95791c2907057c8"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.52.0


