Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2527C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 16:32:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12347.1749141142633780329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 09:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C17C21688
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 09:32:04 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E93E63F673
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 09:32:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: refresh CVE exclusion list for 6.12.31
Date: Thu,  5 Jun 2025 17:32:19 +0100
Message-ID: <20250605163219.1202465-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 16:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218073

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.12.inc              | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/reci=
pes-kernel/linux/cve-exclusion_6.12.inc
index d33880eae0f..199ea019d5b 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-05-29 10:54:43.823437+00:00 for kernel version 6.12.=
30
-# From cvelistV5 cve_2025-05-29_1000Z-1-g4f2590b715f
+# Generated at 2025-06-05 16:29:20.725105+00:00 for kernel version 6.12.=
31
+# From cvelistV5 cve_2025-06-05_1600Z
=20
=20
 python check_kernel_cve_status_version() {
-    this_version =3D "6.12.30"
+    this_version =3D "6.12.31"
     kernel_version =3D d.getVar("LINUX_VERSION")
     if kernel_version !=3D this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
@@ -5054,8 +5054,6 @@ CVE_STATUS[CVE-2023-53023] =3D "fixed-version: Fixe=
d from version 6.2"
=20
 CVE_STATUS[CVE-2023-53024] =3D "fixed-version: Fixed from version 6.2"
=20
-CVE_STATUS[CVE-2023-53025] =3D "fixed-version: Fixed from version 6.2"
-
 CVE_STATUS[CVE-2023-53026] =3D "fixed-version: Fixed from version 6.2"
=20
 CVE_STATUS[CVE-2023-53028] =3D "fixed-version: Fixed from version 6.1.8"
@@ -12564,8 +12562,6 @@ CVE_STATUS[CVE-2025-37780] =3D "cpe-stable-backpo=
rt: Backported in 6.12.25"
=20
 CVE_STATUS[CVE-2025-37781] =3D "cpe-stable-backport: Backported in 6.12.=
25"
=20
-CVE_STATUS[CVE-2025-37782] =3D "cpe-stable-backport: Backported in 6.12.=
25"
-
 CVE_STATUS[CVE-2025-37783] =3D "fixed-version: only affects 6.14 onwards=
"
=20
 CVE_STATUS[CVE-2025-37784] =3D "cpe-stable-backport: Backported in 6.12.=
25"
@@ -12660,8 +12656,6 @@ CVE_STATUS[CVE-2025-37830] =3D "cpe-stable-backpo=
rt: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37831] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
-CVE_STATUS[CVE-2025-37832] =3D "cpe-stable-backport: Backported in 6.12.=
26"
-
 CVE_STATUS[CVE-2025-37833] =3D "cpe-stable-backport: Backported in 6.12.=
26"
=20
 CVE_STATUS[CVE-2025-37834] =3D "cpe-stable-backport: Backported in 6.12.=
26"
@@ -12978,6 +12972,20 @@ CVE_STATUS[CVE-2025-37991] =3D "cpe-stable-backp=
ort: Backported in 6.12.28"
=20
 CVE_STATUS[CVE-2025-37992] =3D "cpe-stable-backport: Backported in 6.12.=
30"
=20
+CVE_STATUS[CVE-2025-37993] =3D "cpe-stable-backport: Backported in 6.12.=
29"
+
+CVE_STATUS[CVE-2025-37994] =3D "cpe-stable-backport: Backported in 6.12.=
29"
+
+CVE_STATUS[CVE-2025-37995] =3D "cpe-stable-backport: Backported in 6.12.=
29"
+
+CVE_STATUS[CVE-2025-37996] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2025-37997] =3D "cpe-stable-backport: Backported in 6.12.=
29"
+
+CVE_STATUS[CVE-2025-37998] =3D "cpe-stable-backport: Backported in 6.12.=
29"
+
+CVE_STATUS[CVE-2025-37999] =3D "cpe-stable-backport: Backported in 6.12.=
29"
+
 CVE_STATUS[CVE-2025-38049] =3D "cpe-stable-backport: Backported in 6.12.=
23"
=20
 # CVE-2025-38104 needs backporting (fixed from 6.15)
--=20
2.43.0


