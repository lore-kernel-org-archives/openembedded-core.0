Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCBDC52D1D
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45842.1721746306557117857
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CFBD1476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC6343F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/37] python3-websockets: remove unused imports
Date: Tue, 23 Jul 2024 15:51:08 +0100
Message-Id: <20240723145137.74198-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202375

These modules are not imported by websockets.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-websockets_12.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-websockets_12.0.bb b/me=
ta/recipes-devtools/python/python3-websockets_12.0.bb
index 1bebcb4ce65..a04c63f6af1 100644
--- a/meta/recipes-devtools/python/python3-websockets_12.0.bb
+++ b/meta/recipes-devtools/python/python3-websockets_12.0.bb
@@ -12,6 +12,4 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 RDEPENDS:${PN} =3D " \
     python3-asyncio \
-    python3-profile \
-    python3-zipp \
 "
--=20
2.34.1


