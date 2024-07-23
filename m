Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D468C52D71
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45930.1721746303656428526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C50881476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 002B23F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/37] python3-setuptools: RDEPEND on python3-unixadmin
Date: Tue, 23 Jul 2024 15:51:03 +0100
Message-Id: <20240723145137.74198-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202370

setuptools/command/register.py uses the getpass module.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-setuptools_70.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb b/=
meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
index 291601ca983..72a8d7bc3c9 100644
--- a/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
@@ -32,6 +32,7 @@ RDEPENDS:${PN} =3D "\
     python3-stringold \
     python3-threading \
     python3-unittest \
+    python3-unixadmin \
     python3-xml \
 "
=20
--=20
2.34.1


