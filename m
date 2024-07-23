Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8BEC3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45927.1721746302619252609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A123C1476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:07 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D017F3F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:41 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/37] python3: add dependency on -compression to -core
Date: Tue, 23 Jul 2024 15:51:01 +0100
Message-Id: <20240723145137.74198-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202368

importlib.metadata is part of -core, but that will import zipfile which
is part of -compression.

Obviously this shows that our packaging of the Python modules is not
optimal.  I plan to follow up with a redesign of the splitting which
focuses on simply pulling out the larger or esoteric modules and
having a more featureful core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 46092d40040..292c5bbc5da 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -216,7 +216,7 @@
     },
     "core": {
         "summary": "Python interpreter and core modules",
-        "rdepends": [],
+        "rdepends": ["compression"],
         "files": [
             "${bindir}/python${PYTHON_MAJMIN}",
             "${bindir}/python${PYTHON_MAJMIN}.real",
--=20
2.34.1


