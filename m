Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A7DC5B552
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 10:58:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18047.1748516293740934171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 03:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E771A22D7
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 03:57:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1CD093F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 03:58:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto: refresh CVE exclusions
Date: Thu, 29 May 2025 11:58:08 +0100
Message-ID: <20250529105808.1943410-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529105808.1943410-1-ross.burton@arm.com>
References: <20250529105808.1943410-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 10:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217409

As we upgraded the kernel, the exclusions need to be updated too.

This marks many CVEs as resolved.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.12.inc              | 246 +++++++++---------
 1 file changed, 122 insertions(+), 124 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/reci=
pes-kernel/linux/cve-exclusion_6.12.inc
index 120b1b5ef70..d33880eae0f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,9 +1,11 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-05-24 12:18:11.126849+00:00 for version 6.12.27
+# Generated at 2025-05-29 10:54:43.823437+00:00 for kernel version 6.12.=
30
+# From cvelistV5 cve_2025-05-29_1000Z-1-g4f2590b715f
+
=20
 python check_kernel_cve_status_version() {
-    this_version =3D "6.12.27"
+    this_version =3D "6.12.30"
     kernel_version =3D d.getVar("LINUX_VERSION")
     if kernel_version !=3D this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
@@ -6894,8 +6896,6 @@ CVE_STATUS[CVE-2024-36905] =3D "fixed-version: Fixe=
d from version 6.9"
=20
 CVE_STATUS[CVE-2024-36906] =3D "fixed-version: Fixed from version 6.9"
=20
-# CVE-2024-36907 has no known resolution
-
 CVE_STATUS[CVE-2024-36908] =3D "fixed-version: Fixed from version 6.9"
=20
 CVE_STATUS[CVE-2024-36909] =3D "fixed-version: Fixed from version 6.9"
@@ -11412,15 +11412,15 @@ CVE_STATUS[CVE-2024-58090] =3D "cpe-stable-back=
port: Backported in 6.12.18"
=20
 CVE_STATUS[CVE-2024-58092] =3D "cpe-stable-backport: Backported in 6.12.=
22"
=20
-# CVE-2024-58093 needs backporting (fixed from 6.15rc1)
+# CVE-2024-58093 needs backporting (fixed from 6.15)
=20
-# CVE-2024-58094 needs backporting (fixed from 6.15rc1)
+# CVE-2024-58094 needs backporting (fixed from 6.15)
=20
-# CVE-2024-58095 needs backporting (fixed from 6.15rc1)
+# CVE-2024-58095 needs backporting (fixed from 6.15)
=20
-# CVE-2024-58096 needs backporting (fixed from 6.15rc1)
+# CVE-2024-58096 needs backporting (fixed from 6.15)
=20
-# CVE-2024-58097 needs backporting (fixed from 6.15rc1)
+# CVE-2024-58097 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2024-58098] =3D "cpe-stable-backport: Backported in 6.12.=
25"
=20
@@ -12354,39 +12354,39 @@ CVE_STATUS[CVE-2025-22099] =3D "fixed-version: =
only affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2025-22100] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2025-22101 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22101 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22102 may need backporting (fixed from 6.12.30)
+CVE_STATUS[CVE-2025-22102] =3D "cpe-stable-backport: Backported in 6.12.=
30"
=20
-# CVE-2025-22103 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22103 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22104 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22104 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22105 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22105 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22106 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22106 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22107 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22107 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22108 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22108 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22109 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22109 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-22110] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2025-22111 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22111 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-22112] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2025-22113 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22113 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-22114] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2025-22115 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22115 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22116 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22116 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22117 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22117 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-22118] =3D "fixed-version: only affects 6.13 onwards=
"
=20
@@ -12394,39 +12394,39 @@ CVE_STATUS[CVE-2025-22119] =3D "fixed-version: =
only affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2025-22120] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
-# CVE-2025-22121 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22121 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22122 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22122 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22123 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22123 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22124 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22124 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22125 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22125 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-22126] =3D "cpe-stable-backport: Backported in 6.12.=
25"
=20
-# CVE-2025-22127 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22127 needs backporting (fixed from 6.15)
=20
-# CVE-2025-22128 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22128 needs backporting (fixed from 6.15)
=20
-# CVE-2025-23129 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23129 needs backporting (fixed from 6.15)
=20
-# CVE-2025-23130 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23130 needs backporting (fixed from 6.15)
=20
-# CVE-2025-23131 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23131 needs backporting (fixed from 6.15)
=20
-# CVE-2025-23132 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23132 needs backporting (fixed from 6.15)
=20
-# CVE-2025-23133 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23133 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-23134] =3D "cpe-stable-backport: Backported in 6.12.=
23"
=20
-# CVE-2025-23135 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23135 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-23136] =3D "cpe-stable-backport: Backported in 6.12.=
23"
=20
-# CVE-2025-23137 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23137 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-23138] =3D "cpe-stable-backport: Backported in 6.12.=
23"
=20
@@ -12460,7 +12460,7 @@ CVE_STATUS[CVE-2025-23153] =3D "fixed-version: on=
ly affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2025-23154] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
-# CVE-2025-23155 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23155 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-23156] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
@@ -12488,13 +12488,13 @@ CVE_STATUS[CVE-2025-37741] =3D "cpe-stable-back=
port: Backported in 6.12.24"
=20
 CVE_STATUS[CVE-2025-37742] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
-# CVE-2025-37743 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37743 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-37744] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
 CVE_STATUS[CVE-2025-37745] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
-# CVE-2025-37746 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37746 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-37747] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
@@ -12508,8 +12508,6 @@ CVE_STATUS[CVE-2025-37751] =3D "fixed-version: on=
ly affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2025-37752] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
-CVE_STATUS[CVE-2025-37753] =3D "fixed-version: only affects 6.15rc1 onwa=
rds"
-
 CVE_STATUS[CVE-2025-37754] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
 CVE_STATUS[CVE-2025-37755] =3D "cpe-stable-backport: Backported in 6.12.=
24"
@@ -12606,7 +12604,7 @@ CVE_STATUS[CVE-2025-37801] =3D "cpe-stable-backpo=
rt: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37802] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
-# CVE-2025-37803 needs backporting (fixed from 6.15rc2)
+# CVE-2025-37803 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-37805] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
@@ -12640,7 +12638,7 @@ CVE_STATUS[CVE-2025-37819] =3D "cpe-stable-backpo=
rt: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37820] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
-# CVE-2025-37821 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37821] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
 CVE_STATUS[CVE-2025-37822] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
@@ -12680,7 +12678,7 @@ CVE_STATUS[CVE-2025-37840] =3D "cpe-stable-backpo=
rt: Backported in 6.12.24"
=20
 CVE_STATUS[CVE-2025-37841] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
-# CVE-2025-37842 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37842 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-37843] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
@@ -12706,7 +12704,7 @@ CVE_STATUS[CVE-2025-37853] =3D "cpe-stable-backpo=
rt: Backported in 6.12.24"
=20
 CVE_STATUS[CVE-2025-37854] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
-# CVE-2025-37855 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37855 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-37856] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
@@ -12716,7 +12714,7 @@ CVE_STATUS[CVE-2025-37858] =3D "cpe-stable-backpo=
rt: Backported in 6.12.24"
=20
 CVE_STATUS[CVE-2025-37859] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
-# CVE-2025-37860 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37860 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-37861] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
@@ -12756,7 +12754,7 @@ CVE_STATUS[CVE-2025-37878] =3D "cpe-stable-backpo=
rt: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37879] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
-# CVE-2025-37880 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37880 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-37881] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
@@ -12776,99 +12774,97 @@ CVE_STATUS[CVE-2025-37888] =3D "cpe-stable-back=
port: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37889] =3D "cpe-stable-backport: Backported in 6.12.=
20"
=20
-# CVE-2025-37890 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37890] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37891 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37891] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
 CVE_STATUS[CVE-2025-37892] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
 CVE_STATUS[CVE-2025-37893] =3D "cpe-stable-backport: Backported in 6.12.=
23"
=20
-# CVE-2025-37894 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37894] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37895 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37895] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
 CVE_STATUS[CVE-2025-37896] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2025-37897 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37897] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
 CVE_STATUS[CVE-2025-37898] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2025-37899 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37899] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37900 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37900] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37901 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37901] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-CVE_STATUS[CVE-2025-37902] =3D "fixed-version: only affects 6.15rc5 onwa=
rds"
-
-# CVE-2025-37903 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37903] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
 CVE_STATUS[CVE-2025-37904] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2025-37905 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37905] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37906 needs backporting (fixed from 6.15rc4)
+# CVE-2025-37906 needs backporting (fixed from 6.15)
=20
-# CVE-2025-37907 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37907] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37908 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37908] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37909 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37909] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37910 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37910] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37911 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37911] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37912 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37912] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37913 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37913] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37914 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37914] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37915 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37915] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37916 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37916] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37917 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37917] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37918 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37918] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37919 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37919] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37920 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37920] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37921 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37921] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37922 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37922] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37923 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37923] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37924 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37924] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37925 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37925 needs backporting (fixed from 6.15)
=20
-# CVE-2025-37926 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37926] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37927 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37927] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37928 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37928] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37929 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37929] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37930 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37930] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37931 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37931] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37932 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37932] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37933 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37933] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37934 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37934] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37935 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37935] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37936 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37936] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
 CVE_STATUS[CVE-2025-37937] =3D "cpe-stable-backport: Backported in 6.12.=
23"
=20
@@ -12888,63 +12884,63 @@ CVE_STATUS[CVE-2025-37944] =3D "cpe-stable-back=
port: Backported in 6.12.25"
=20
 CVE_STATUS[CVE-2025-37945] =3D "cpe-stable-backport: Backported in 6.12.=
24"
=20
-# CVE-2025-37946 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37946] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37947 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37947] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37948 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37948] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37949 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37949] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
 CVE_STATUS[CVE-2025-37950] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2025-37951 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37951] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37952 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37952] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37953 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37953] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37954 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37954] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37955 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37955] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37956 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37956] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37957 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37957] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37958 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37958] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37959 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37959] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37960 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37960] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37961 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37961] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37962 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37962] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37963 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37963] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37964 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37964] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37965 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37965] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
 CVE_STATUS[CVE-2025-37966] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2025-37967 may need backporting (fixed from 6.12.30)
+CVE_STATUS[CVE-2025-37967] =3D "cpe-stable-backport: Backported in 6.12.=
30"
=20
-# CVE-2025-37968 may need backporting (fixed from 6.12.30)
+CVE_STATUS[CVE-2025-37968] =3D "cpe-stable-backport: Backported in 6.12.=
30"
=20
-# CVE-2025-37969 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37969] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37970 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37970] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37971 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37971] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37972 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37972] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37973 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37973] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
-# CVE-2025-37974 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37974] =3D "cpe-stable-backport: Backported in 6.12.=
29"
=20
 CVE_STATUS[CVE-2025-37975] =3D "cpe-stable-backport: Backported in 6.12.=
25"
=20
@@ -12964,7 +12960,7 @@ CVE_STATUS[CVE-2025-37982] =3D "cpe-stable-backpo=
rt: Backported in 6.12.25"
=20
 CVE_STATUS[CVE-2025-37983] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
-# CVE-2025-37984 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37984 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-37985] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
@@ -12976,13 +12972,15 @@ CVE_STATUS[CVE-2025-37988] =3D "cpe-stable-back=
port: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37989] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
-# CVE-2025-37990 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37990] =3D "cpe-stable-backport: Backported in 6.12.=
28"
=20
-# CVE-2025-37991 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37991] =3D "cpe-stable-backport: Backported in 6.12.=
28"
+
+CVE_STATUS[CVE-2025-37992] =3D "cpe-stable-backport: Backported in 6.12.=
30"
=20
 CVE_STATUS[CVE-2025-38049] =3D "cpe-stable-backport: Backported in 6.12.=
23"
=20
-# CVE-2025-38104 needs backporting (fixed from 6.15rc1)
+# CVE-2025-38104 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-38152] =3D "cpe-stable-backport: Backported in 6.12.=
23"
=20
@@ -13008,11 +13006,11 @@ CVE_STATUS[CVE-2025-39930] =3D "fixed-version: =
only affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2025-39989] =3D "cpe-stable-backport: Backported in 6.12.=
23"
=20
-# CVE-2025-40014 needs backporting (fixed from 6.15rc1)
+# CVE-2025-40014 needs backporting (fixed from 6.15)
=20
 CVE_STATUS[CVE-2025-40114] =3D "cpe-stable-backport: Backported in 6.12.=
23"
=20
-# CVE-2025-40325 needs backporting (fixed from 6.15rc1)
+# CVE-2025-40325 needs backporting (fixed from 6.15)
=20
 # CVE-2025-40364 has no known resolution
=20
--=20
2.43.0


