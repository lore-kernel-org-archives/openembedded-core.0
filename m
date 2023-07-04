Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C40FEB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 14:07:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.59356.1688479674402415096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 07:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4A52150C;
	Tue,  4 Jul 2023 07:08:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D738B3F73F;
	Tue,  4 Jul 2023 07:07:52 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] linux-yocto/cve-exclusion: ignore more backported CVEs
Date: Tue,  4 Jul 2023 15:07:48 +0100
Message-Id: <20230704140748.3685070-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230704140748.3685070-1-ross.burton@arm.com>
References: <20230704140748.3685070-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 14:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183834

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.1.inc               | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 6717cbeeebb..49b4159b347 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -13,6 +13,9 @@ CVE_CHECK_IGNORE +=3D "CVE-2019-3819"
 # Fixed with 5.2
 CVE_CHECK_IGNORE +=3D "CVE-2019-3887"
=20
+# This is specific to aufs, which is not in linux-yocto
+CVE_CHECK_IGNORE +=3D "CVE-2020-11935"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2020-27784
 # Introduced in version v4.1 b26394bd567e5ebe57ec4dee7fe6cd14023c96e9
 #=C2=A0Patched in kernel since v5.10	e8d5f92b8d30bb4ade76494490c3c065e12=
411b1
@@ -336,6 +339,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2022-42896"
 #  * https://lore.kernel.org/all/CAODzB9q3OBD0k6W2bcWrSZo2jC3EvV0PrLyWmO=
07rxR4nQgkJA@mail.gmail.com/T/
 CVE_CHECK_IGNORE +=3D "CVE-2022-38457 CVE-2022-40133"
=20
+# Backported to 6.1.33
+CVE_CHECK_IGNORE +=3D "CVE-2022-48425"
=20
 # 2023
=20
@@ -514,6 +519,9 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-1998"
 # Fixed in 6.1.27
 CVE_CHECK_IGNORE +=3D "CVE-2023-2002"
=20
+# Backported to 6.1.33
+CVE_CHECK_IGNORE +=3D "CVE-2023-2124"
+
 # https://www.linuxkernelcves.com/cves/CVE-2023-2156
 # Fixed in 6.1.26
 CVE_CHECK_IGNORE +=3D "CVE-2023-2156"
@@ -537,6 +545,21 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-2985"
 # Backported to 6.1.30 as 9a342d4
 CVE_CHECK_IGNORE +=3D "CVE-2023-3141"
=20
+# Backported to 6.1.11
+CVE_CHECK_IGNORE +=3D "CVE-2023-3161"
+
+# Backported to 6.1.33
+CVE_CHECK_IGNORE +=3D "CVE-2023-3212"
+
+# Only in 6.2.0 to 6.2.14, and 6.3.0 to 6.3.1
+CVE_CHECK_IGNORE +=3D "CVE-2023-3312"
+
+# Backported to 6.1.16
+CVE_CHECK_IGNORE +=3D "CVE-2023-3220"
+
+# Backported to 6.1.28
+CVE_CHECK_IGNORE +=3D "CVE-2023-3268"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2023-23005
 # Introduced in version v6.1 7b88bda3761b95856cf97822efe8281c8100067b
 # Patched in kernel since v6.2 4a625ceee8a0ab0273534cb6b432ce6b331db5ee
@@ -551,6 +574,9 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-23005"
 # Fixed with 6.1.2
 CVE_CHECK_IGNORE +=3D "CVE-2023-28328"
=20
+# Only in 6.3-rc
+CVE_CHECK_IGNORE +=3D "CVE-2023-28464"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2023-28466
 # Introduced in version v4.13 3c4d7559159bfe1e3b94df3a657b2cda3a34e218
 # Patched in kernel since v6.3-rc2 49c47cc21b5b7a3d8deb18fc57b0aa2ab1286=
962
@@ -590,3 +616,21 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-33288"
 # https://www.linuxkernelcves.com/cves/CVE-2023-34256
 # Fixed in 6.1.29
 CVE_CHECK_IGNORE +=3D "CVE-2023-34256"
+
+# Backported to 6.1.28
+CVE_CHECK_IGNORE +=3D "CVE-2023-35823"
+
+# Backported to 6.1.28
+CVE_CHECK_IGNORE +=3D "CVE-2023-35824"
+
+# Backported to 6.1.28
+CVE_CHECK_IGNORE +=3D "CVE-2023-35826"
+
+# Backported to 6.1.28
+CVE_CHECK_IGNORE +=3D "CVE-2023-35828"
+
+# Backported to 6.1.28
+CVE_CHECK_IGNORE +=3D "CVE-2023-35829"
+
+# Backported to 6.1.33
+CVE_CHECK_IGNORE +=3D "CVE-2023-35788"
--=20
2.34.1


