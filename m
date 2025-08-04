Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAECC87FCF
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:11:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7082.1754341869809162180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 587B21E4D
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 14:11:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 013D43F673
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 14:11:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-jsonschema: clean up dependencies
Date: Mon,  4 Aug 2025 22:11:06 +0100
Message-ID: <20250804211106.327799-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804211106.327799-1-ross.burton@arm.com>
References: <20250804211106.327799-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 21:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221448

pyrsistent was replaced with rpds in 4.18.0.

zipp doesn't appear to have ever been a dependency, remove. Maybe it was
a transient dependency.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb b/=
meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
index 7a5f4a09a6e..777cc649cc5 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.24.0.bb
@@ -39,9 +39,8 @@ RDEPENDS:${PN} +=3D " \
     python3-netclient \
     python3-numbers \
     python3-pprint \
-    python3-pyrsistent \
     python3-referencing \
-    python3-zipp \
+    python3-rpds-py \
 "
=20
 RDEPENDS:${PN}-tests =3D "${PN}"
--=20
2.43.0


