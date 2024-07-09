Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC814C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 17:06:58 +0000 (UTC)
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net [83.102.40.154])
 by mx.groups.io with SMTP id smtpd.web11.1268.1720544812686533013
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 10:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.154, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 8CF3510BC3;
	Tue,  9 Jul 2024 20:06:49 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id 1hO1tEC0oGWH; Tue,  9 Jul 2024 20:06:49 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 467AF10C77;
	Tue,  9 Jul 2024 20:06:49 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id 0E2123FF6;
	Tue,  9 Jul 2024 20:06:46 +0300 (EEST)
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 1/2] mesa: Fix missing leading whitespace with ':append'
Date: Tue,  9 Jul 2024 20:06:26 +0300
Message-Id: <20240709170627.81755-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 17:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201668

From: Niko Mauno <niko.mauno@vaisala.com>

By adding a leading space character in the value field of appended
BitBake variable, we avoid the risk of inadvertent string
concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 272d57c749..d56def2916 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -91,7 +91,7 @@ PACKAGECONFIG =3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
=20
-PACKAGECONFIG:append:class-native =3D "gallium-llvm r600"
+PACKAGECONFIG:append:class-native =3D " gallium-llvm r600"
=20
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
--=20
2.39.2


