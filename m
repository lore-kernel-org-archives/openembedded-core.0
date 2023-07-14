Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939ABC001DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 14:53:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.833.1689346402906153709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 07:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE24B1570;
	Fri, 14 Jul 2023 07:54:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 267893F740;
	Fri, 14 Jul 2023 07:53:21 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] linux-yocto_6.1: ignore backported CVEs
Date: Fri, 14 Jul 2023 15:53:18 +0100
Message-Id: <20230714145319.231385-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 14:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184268

From: Ross Burton <ross.burton@arm.com>

These CVEs have all been fixed in 6.1 point releases.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-kernel/linux/cve-exclusion_6.1.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 49b4159b347..6a0bd19447c 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -542,6 +542,12 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-2235"
 # Fixed in 6.1.16
 CVE_CHECK_IGNORE +=3D "CVE-2023-2985"
=20
+# Backported to 6.1.30
+CVE_CHECK_IGNORE +=3D "CVE-2023-3090"
+
+# Backported to 6.1.35
+CVE_CHECK_IGNORE +=3D "CVE-2023-3117"
+
 # Backported to 6.1.30 as 9a342d4
 CVE_CHECK_IGNORE +=3D "CVE-2023-3141"
=20
@@ -560,6 +566,18 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-3220"
 # Backported to 6.1.28
 CVE_CHECK_IGNORE +=3D "CVE-2023-3268"
=20
+# Backported to 6.1.9
+CVE_CHECK_IGNORE +=3D "CVE-2023-3358"
+
+# Backported to 6.1.11
+CVE_CHECK_IGNORE +=3D "CVE-2023-3359"
+
+# Backported to 6.1.36
+CVE_CHECK_IGNORE +=3D "CVE-2023-3389"
+
+# Backported to 6.1.35
+CVE_CHECK_IGNORE +=3D "CVE-2023-3390"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2023-23005
 # Introduced in version v6.1 7b88bda3761b95856cf97822efe8281c8100067b
 # Patched in kernel since v6.2 4a625ceee8a0ab0273534cb6b432ce6b331db5ee
--=20
2.34.1


