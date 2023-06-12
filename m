Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4447FC7EE37
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 13:10:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.58508.1686575433857010182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 06:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04BCF1FB;
	Mon, 12 Jun 2023 06:11:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8022F3F587;
	Mon, 12 Jun 2023 06:10:32 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] cve-extra-exclusions: add more ignores for 2023 kernel CVEs
Date: Mon, 12 Jun 2023 14:10:30 +0100
Message-Id: <20230612131031.932073-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 13:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182669

From: Ross Burton <ross.burton@arm.com>

All of these CVEs have been fixed in the kernel point release that we
currently ship, so ignore them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
index ff5d381523c..41d751a7aed 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -591,6 +591,10 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1990"
 # Fixed in 6.1.16
 CVE_CHECK_IGNORE +=3D "CVE-2023-1998"
=20
+# https://www.linuxkernelcves.com/cves/CVE-2023-2002
+# Fixed in 6.1.27
+CVE_CHECK_IGNORE +=3D "CVE-2023-2002"
+
 # https://www.linuxkernelcves.com/cves/CVE-2023-2156
 # Fixed in 6.1.26
 CVE_CHECK_IGNORE +=3D "CVE-2023-2156"
@@ -598,3 +602,51 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-2156"
 # https://www.linuxkernelcves.com/cves/CVE-2023-2162
 # Fixed in 6.1.11
 CVE_CHECK_IGNORE +=3D "CVE-2023-2162"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-2194
+# Fixed with 6.1.22
+CVE_CHECK_IGNORE +=3D "CVE-2023-2194"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-2235
+# Fixed with 6.1.21
+CVE_CHECK_IGNORE +=3D "CVE-2023-2235"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-28328
+# Fixed with 6.1.2
+CVE_CHECK_IGNORE +=3D "CVE-2023-28328"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-2985
+# Fixed in 6.1.16
+CVE_CHECK_IGNORE +=3D "CVE-2023-2985"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-28866
+# Fixed with 6.1.22
+CVE_CHECK_IGNORE +=3D "CVE-2023-28866"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-30456
+# Fixed with 6.1.21
+CVE_CHECK_IGNORE +=3D "CVE-2023-30456"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-30772
+# Fixed with 6.1.22
+CVE_CHECK_IGNORE +=3D "CVE-2023-30772"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-31436
+# Fixed with 6.1.26
+CVE_CHECK_IGNORE +=3D "CVE-2023-31436"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-32233
+# Fixed with 6.1.28
+CVE_CHECK_IGNORE +=3D "CVE-2023-32233"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-33203
+# Fixed with 6.1.22
+CVE_CHECK_IGNORE +=3D "CVE-2023-33203"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-33288
+# Fixed with 6.1.22
+CVE_CHECK_IGNORE +=3D "CVE-2023-33288"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-34256
+# Fixed in 6.1.29
+CVE_CHECK_IGNORE +=3D "CVE-2023-34256"
--=20
2.34.1


