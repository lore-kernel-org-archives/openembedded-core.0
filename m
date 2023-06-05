Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C71C77B73
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 16:25:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13368.1685982349028419800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 09:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2629ED75;
	Mon,  5 Jun 2023 09:26:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28ACF3F663;
	Mon,  5 Jun 2023 09:25:48 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH] cve-extra-exclusions: add more linux-yocto CVE ignores
Date: Mon,  5 Jun 2023 17:25:46 +0100
Message-Id: <20230605162546.3012555-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 16:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182394

From: Ross Burton <ross.burton@arm.com>

These CVEs have all been fixed <6.1.30, which is the default linux-yocto
kernel version.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../distro/include/cve-extra-exclusions.inc   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/con=
f/distro/include/cve-extra-exclusions.inc
index 0ca75bae3ef..ff5d381523c 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -555,5 +555,46 @@ CVE_CHECK_IGNORE +=3D "CVE-2019-12067"
 # done about the bug, ignore from an OE perspective.
 CVE_CHECK_IGNORE +=3D "CVE-2020-18974"
=20
+# https://www.linuxkernelcves.com/cves/CVE-2023-0459
+# Fixed in 6.1.14 onwards
+CVE_CHECK_IGNORE +=3D "CVE-2023-0459"
=20
+# https://www.linuxkernelcves.com/cves/CVE-2023-0615
+# Fixed in 6.1 onwards
+CVE_CHECK_IGNORE +=3D "CVE-2023-0615"
=20
+# https://www.linuxkernelcves.com/cves/CVE-2023-1380
+# Fixed in 6.1.27
+CVE_CHECK_IGNORE +=3D "CVE-2023-1380"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-1611
+# Fixed in 6.1.23
+CVE_CHECK_IGNORE +=3D "CVE-2023-1611"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-1855
+# Fixed in 6.1.21
+CVE_CHECK_IGNORE +=3D "CVE-2023-1855"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-1859
+# Fixed in 6.1.25
+CVE_CHECK_IGNORE +=3D "CVE-2023-1859"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-1989
+# Fixed in 6.1.22
+CVE_CHECK_IGNORE +=3D "CVE-2023-1989"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-1990
+# Fixed in 6.1.21
+CVE_CHECK_IGNORE +=3D "CVE-2023-1990"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-1999
+# Fixed in 6.1.16
+CVE_CHECK_IGNORE +=3D "CVE-2023-1998"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-2156
+# Fixed in 6.1.26
+CVE_CHECK_IGNORE +=3D "CVE-2023-2156"
+
+# https://www.linuxkernelcves.com/cves/CVE-2023-2162
+# Fixed in 6.1.11
+CVE_CHECK_IGNORE +=3D "CVE-2023-2162"
--=20
2.34.1


