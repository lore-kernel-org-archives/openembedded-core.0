Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37027CAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 16:22:37 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.2925.1758039754235690660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 09:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout12.t-online.de (Postfix) with SMTP id F0DA4E74E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 18:22:31 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.62]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uyYRr-2FBDlJ0; Tue, 16 Sep 2025 18:22:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] ffmpeg: make ffmpeg provide virtual/ffmpeg
Date: Tue, 16 Sep 2025 18:21:52 +0200
Message-ID: <20250916162152.3861331-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1758039751-04FF698D-F2D8ED1B/0/0 CLEAN NORMAL
X-TOI-MSGID: 35f552e4-01c4-4981-a833-fae9d9e10d46
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 16:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223574

let ffmpeg provide virtual/ffmpeg

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_8.0.bb
index ecaced7690..f147b3d109 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb
@@ -32,7 +32,7 @@ ARM_INSTRUCTION_SET:armv5 =3D "arm"
 ARM_INSTRUCTION_SET:armv6 =3D "arm"
=20
 # Should be API compatible with libav (which was a fork of ffmpeg)
-PROVIDES =3D "libav"
+PROVIDES =3D "libav virtual/ffmpeg"
=20
 DEPENDS:append:x86 =3D " nasm-native"
 DEPENDS:append:x86-64 =3D " nasm-native"
--=20
2.50.1


