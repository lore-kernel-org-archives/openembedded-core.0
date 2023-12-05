Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506CAC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 13:23:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.100223.1701782597185078027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 05:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC807139F;
	Tue,  5 Dec 2023 05:24:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CBC503F5A1;
	Tue,  5 Dec 2023 05:23:15 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] linux-yocto: update CVE exclusions
Date: Tue,  5 Dec 2023 13:23:11 +0000
Message-Id: <20231205132311.2485515-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 13:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191818

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.1.inc               | 26 +++++++++++++++----
 .../linux/cve-exclusion_6.5.inc               | 22 +++++++++++++---
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 1216e0c2ddd..1e366481ff6 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-11-09 17:12:27.365962+00:00 for version 6.1.61
+# Generated at 2023-12-05 13:22:34.961692+00:00 for version 6.1.65
=20
 python check_kernel_cve_status_version() {
-    this_version =3D "6.1.61"
+    this_version =3D "6.1.65"
     kernel_version =3D d.getVar("LINUX_VERSION")
     if kernel_version !=3D this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
@@ -4524,7 +4524,7 @@ CVE_STATUS[CVE-2022-43945] =3D "fixed-version: Fixe=
d from version 6.1rc1"
=20
 # CVE-2022-44033 needs backporting (fixed from 6.4rc1)
=20
-# CVE-2022-44034 has no known resolution
+# CVE-2022-44034 needs backporting (fixed from 6.4rc1)
=20
 # CVE-2022-4543 has no known resolution
=20
@@ -5016,6 +5016,10 @@ CVE_STATUS[CVE-2023-39193] =3D "cpe-stable-backpor=
t: Backported in 6.1.53"
=20
 CVE_STATUS[CVE-2023-39194] =3D "cpe-stable-backport: Backported in 6.1.4=
7"
=20
+CVE_STATUS[CVE-2023-39197] =3D "cpe-stable-backport: Backported in 6.1.3=
9"
+
+CVE_STATUS[CVE-2023-39198] =3D "cpe-stable-backport: Backported in 6.1.4=
7"
+
 CVE_STATUS[CVE-2023-4004] =3D "cpe-stable-backport: Backported in 6.1.42=
"
=20
 # CVE-2023-4010 has no known resolution
@@ -5104,7 +5108,7 @@ CVE_STATUS[CVE-2023-4881] =3D "cpe-stable-backport:=
 Backported in 6.1.54"
=20
 CVE_STATUS[CVE-2023-4921] =3D "cpe-stable-backport: Backported in 6.1.54=
"
=20
-# CVE-2023-5090 needs backporting (fixed from 6.6rc7)
+CVE_STATUS[CVE-2023-5090] =3D "cpe-stable-backport: Backported in 6.1.62=
"
=20
 CVE_STATUS[CVE-2023-5158] =3D "cpe-stable-backport: Backported in 6.1.57=
"
=20
@@ -5114,7 +5118,19 @@ CVE_STATUS[CVE-2023-5197] =3D "cpe-stable-backport=
: Backported in 6.1.56"
=20
 CVE_STATUS[CVE-2023-5345] =3D "cpe-stable-backport: Backported in 6.1.56=
"
=20
-# CVE-2023-5633 needs backporting (fixed from 6.6rc6)
+CVE_STATUS[CVE-2023-5633] =3D "fixed-version: only affects 6.2 onwards"
=20
 CVE_STATUS[CVE-2023-5717] =3D "cpe-stable-backport: Backported in 6.1.60=
"
=20
+# CVE-2023-5972 needs backporting (fixed from 6.6rc7)
+
+# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
+
+CVE_STATUS[CVE-2023-6111] =3D "fixed-version: only affects 6.6rc3 onward=
s"
+
+# CVE-2023-6121 needs backporting (fixed from 6.7rc3)
+
+CVE_STATUS[CVE-2023-6176] =3D "cpe-stable-backport: Backported in 6.1.54=
"
+
+# CVE-2023-6238 has no known resolution
+
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.5.inc
index b4086d436c4..6304d80844c 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
@@ -1,9 +1,9 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-11-09 17:13:01.267965+00:00 for version 6.5.10
+# Generated at 2023-12-05 13:22:43.339114+00:00 for version 6.5.13
=20
 python check_kernel_cve_status_version() {
-    this_version =3D "6.5.10"
+    this_version =3D "6.5.13"
     kernel_version =3D d.getVar("LINUX_VERSION")
     if kernel_version !=3D this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
@@ -4524,7 +4524,7 @@ CVE_STATUS[CVE-2022-44032] =3D "fixed-version: Fixe=
d from version 6.4rc1"
=20
 CVE_STATUS[CVE-2022-44033] =3D "fixed-version: Fixed from version 6.4rc1=
"
=20
-# CVE-2022-44034 has no known resolution
+CVE_STATUS[CVE-2022-44034] =3D "fixed-version: Fixed from version 6.4rc1=
"
=20
 # CVE-2022-4543 has no known resolution
=20
@@ -5016,6 +5016,10 @@ CVE_STATUS[CVE-2023-39193] =3D "cpe-stable-backpor=
t: Backported in 6.5.3"
=20
 CVE_STATUS[CVE-2023-39194] =3D "fixed-version: Fixed from version 6.5rc7=
"
=20
+CVE_STATUS[CVE-2023-39197] =3D "fixed-version: Fixed from version 6.5rc1=
"
+
+CVE_STATUS[CVE-2023-39198] =3D "fixed-version: Fixed from version 6.5rc7=
"
+
 CVE_STATUS[CVE-2023-4004] =3D "fixed-version: Fixed from version 6.5rc3"
=20
 # CVE-2023-4010 has no known resolution
@@ -5118,3 +5122,15 @@ CVE_STATUS[CVE-2023-5633] =3D "cpe-stable-backport=
: Backported in 6.5.8"
=20
 CVE_STATUS[CVE-2023-5717] =3D "cpe-stable-backport: Backported in 6.5.9"
=20
+CVE_STATUS[CVE-2023-5972] =3D "cpe-stable-backport: Backported in 6.5.9"
+
+CVE_STATUS[CVE-2023-6039] =3D "fixed-version: Fixed from version 6.5rc5"
+
+CVE_STATUS[CVE-2023-6111] =3D "fixed-version: only affects 6.6rc3 onward=
s"
+
+# CVE-2023-6121 needs backporting (fixed from 6.7rc3)
+
+CVE_STATUS[CVE-2023-6176] =3D "cpe-stable-backport: Backported in 6.5.4"
+
+# CVE-2023-6238 has no known resolution
+
--=20
2.34.1


