Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014EACA1012
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 06:21:07 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.1960.1757139659642569274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 23:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout10.t-online.de (Postfix) with SMTP id 3AAFA38555
	for <openembedded-core@lists.openembedded.org>; Sat,  6 Sep 2025 08:20:57 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.234.138]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uumI0-3gfXZB0; Sat, 6 Sep 2025 08:20:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] mesa: update 25.2.0 -> 25.2.2
Date: Sat,  6 Sep 2025 08:20:34 +0200
Message-ID: <20250906062034.667458-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757139644-02FFA921-E5F5F01F/0/0 CLEAN NORMAL
X-TOI-MSGID: a470aab4-633e-4705-9cc7-bdeb9f72131e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Sep 2025 06:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223040

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index a848a2ad8c..8b2aa57db5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.=
xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.p=
atch \
 "
=20
-SRC_URI[sha256sum] =3D "7c726b21c074d14d31d253d638b741422f3c0a497ce7f1b4=
aaaa917d10bd8d4f"
-PV =3D "25.2.0"
+SRC_URI[sha256sum] =3D "43d7abcd4aa8049d8fd75538344a374104765e81e17b4a63=
14cee2c0160e4412"
+PV =3D "25.2.2"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.50.1


