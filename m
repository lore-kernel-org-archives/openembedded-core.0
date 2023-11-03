Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D2CC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:28:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51798.1699018093823674747
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D920D2F4;
	Fri,  3 Nov 2023 06:28:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD0903F703;
	Fri,  3 Nov 2023 06:28:12 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][nanbield 1/7] linux-yocto: update CVE exclusions
Date: Fri,  3 Nov 2023 13:28:05 +0000
Message-Id: <20231103132811.2074247-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 13:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190154

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.1.inc               | 64 ++++++++++++++++---
 .../linux/cve-exclusion_6.5.inc               | 58 +++++++++++++++--
 2 files changed, 107 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 6af53b0d750..a8df51f321a 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-10-14 12:24:32.747058+00:00 for version 6.1.57
+# Generated at 2023-11-03 13:24:16.070181+00:00 for version 6.1.57
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.1.57"
@@ -3354,7 +3354,7 @@ CVE_STATUS[CVE-2020-27194] =3D "fixed-version: Fixe=
d from version 5.9"
=20
 CVE_STATUS[CVE-2020-2732] =3D "fixed-version: Fixed from version 5.6rc4"
=20
-# CVE-2020-27418 has no known resolution
+CVE_STATUS[CVE-2020-27418] =3D "fixed-version: Fixed from version 5.6rc5=
"
=20
 CVE_STATUS[CVE-2020-27673] =3D "fixed-version: Fixed from version 5.10rc=
1"
=20
@@ -4644,7 +4644,7 @@ CVE_STATUS[CVE-2023-1118] =3D "cpe-stable-backport:=
 Backported in 6.1.16"
=20
 CVE_STATUS[CVE-2023-1192] =3D "cpe-stable-backport: Backported in 6.1.33=
"
=20
-# CVE-2023-1193 has no known resolution
+# CVE-2023-1193 needs backporting (fixed from 6.3rc6)
=20
 CVE_STATUS[CVE-2023-1194] =3D "cpe-stable-backport: Backported in 6.1.34=
"
=20
@@ -4856,7 +4856,7 @@ CVE_STATUS[CVE-2023-3106] =3D "fixed-version: Fixed=
 from version 4.8rc7"
=20
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
=20
-# CVE-2023-31085 has no known resolution
+CVE_STATUS[CVE-2023-31085] =3D "cpe-stable-backport: Backported in 6.1.5=
7"
=20
 CVE_STATUS[CVE-2023-3111] =3D "fixed-version: Fixed from version 6.0rc2"
=20
@@ -4936,6 +4936,8 @@ CVE_STATUS[CVE-2023-34256] =3D "cpe-stable-backport=
: Backported in 6.1.29"
=20
 CVE_STATUS[CVE-2023-34319] =3D "cpe-stable-backport: Backported in 6.1.4=
4"
=20
+CVE_STATUS[CVE-2023-34324] =3D "cpe-stable-backport: Backported in 6.1.5=
7"
+
 CVE_STATUS[CVE-2023-3439] =3D "fixed-version: Fixed from version 5.18rc5=
"
=20
 CVE_STATUS[CVE-2023-35001] =3D "cpe-stable-backport: Backported in 6.1.3=
9"
@@ -4952,7 +4954,7 @@ CVE_STATUS[CVE-2023-35824] =3D "cpe-stable-backport=
: Backported in 6.1.28"
=20
 CVE_STATUS[CVE-2023-35826] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
=20
-# CVE-2023-35827 has no known resolution
+# CVE-2023-35827 needs backporting (fixed from 6.1.59)
=20
 CVE_STATUS[CVE-2023-35828] =3D "cpe-stable-backport: Backported in 6.1.2=
8"
=20
@@ -5004,6 +5006,16 @@ CVE_STATUS[CVE-2023-3866] =3D "cpe-stable-backport=
: Backported in 6.1.36"
=20
 CVE_STATUS[CVE-2023-3867] =3D "cpe-stable-backport: Backported in 6.1.40=
"
=20
+CVE_STATUS[CVE-2023-39189] =3D "cpe-stable-backport: Backported in 6.1.5=
4"
+
+# CVE-2023-39191 needs backporting (fixed from 6.3rc1)
+
+CVE_STATUS[CVE-2023-39192] =3D "cpe-stable-backport: Backported in 6.1.5=
3"
+
+CVE_STATUS[CVE-2023-39193] =3D "cpe-stable-backport: Backported in 6.1.5=
3"
+
+CVE_STATUS[CVE-2023-39194] =3D "cpe-stable-backport: Backported in 6.1.4=
7"
+
 CVE_STATUS[CVE-2023-4004] =3D "cpe-stable-backport: Backported in 6.1.42=
"
=20
 # CVE-2023-4010 has no known resolution
@@ -5012,6 +5024,8 @@ CVE_STATUS[CVE-2023-4015] =3D "cpe-stable-backport:=
 Backported in 6.1.43"
=20
 CVE_STATUS[CVE-2023-40283] =3D "cpe-stable-backport: Backported in 6.1.4=
5"
=20
+# CVE-2023-40791 needs backporting (fixed from 6.5rc6)
+
 CVE_STATUS[CVE-2023-4128] =3D "cpe-stable-backport: Backported in 6.1.45=
"
=20
 CVE_STATUS[CVE-2023-4132] =3D "cpe-stable-backport: Backported in 6.1.39=
"
@@ -5032,7 +5046,7 @@ CVE_STATUS[CVE-2023-4207] =3D "cpe-stable-backport:=
 Backported in 6.1.45"
=20
 CVE_STATUS[CVE-2023-4208] =3D "cpe-stable-backport: Backported in 6.1.45=
"
=20
-# CVE-2023-4244 needs backporting (fixed from 6.5rc7)
+CVE_STATUS[CVE-2023-4244] =3D "cpe-stable-backport: Backported in 6.1.56=
"
=20
 CVE_STATUS[CVE-2023-4273] =3D "cpe-stable-backport: Backported in 6.1.45=
"
=20
@@ -5040,8 +5054,12 @@ CVE_STATUS[CVE-2023-42752] =3D "cpe-stable-backpor=
t: Backported in 6.1.53"
=20
 CVE_STATUS[CVE-2023-42753] =3D "cpe-stable-backport: Backported in 6.1.5=
3"
=20
+CVE_STATUS[CVE-2023-42754] =3D "cpe-stable-backport: Backported in 6.1.5=
6"
+
 CVE_STATUS[CVE-2023-42755] =3D "cpe-stable-backport: Backported in 6.1.5=
5"
=20
+CVE_STATUS[CVE-2023-42756] =3D "fixed-version: only affects 6.4rc6 onwar=
ds"
+
 CVE_STATUS[CVE-2023-4385] =3D "fixed-version: Fixed from version 5.19rc1=
"
=20
 CVE_STATUS[CVE-2023-4387] =3D "fixed-version: Fixed from version 5.18"
@@ -5050,23 +5068,51 @@ CVE_STATUS[CVE-2023-4389] =3D "fixed-version: Fix=
ed from version 5.18rc3"
=20
 CVE_STATUS[CVE-2023-4394] =3D "fixed-version: Fixed from version 6.0rc3"
=20
+CVE_STATUS[CVE-2023-44466] =3D "cpe-stable-backport: Backported in 6.1.4=
0"
+
 CVE_STATUS[CVE-2023-4459] =3D "fixed-version: Fixed from version 5.18"
=20
-# CVE-2023-4563 needs backporting (fixed from 6.5rc6)
+CVE_STATUS[CVE-2023-4563] =3D "cpe-stable-backport: Backported in 6.1.56=
"
=20
 CVE_STATUS[CVE-2023-4569] =3D "cpe-stable-backport: Backported in 6.1.47=
"
=20
+CVE_STATUS[CVE-2023-45862] =3D "cpe-stable-backport: Backported in 6.1.1=
8"
+
+CVE_STATUS[CVE-2023-45863] =3D "cpe-stable-backport: Backported in 6.1.1=
6"
+
+CVE_STATUS[CVE-2023-45871] =3D "cpe-stable-backport: Backported in 6.1.5=
3"
+
+CVE_STATUS[CVE-2023-45898] =3D "fixed-version: only affects 6.5rc1 onwar=
ds"
+
+# CVE-2023-4610 needs backporting (fixed from 6.4)
+
 CVE_STATUS[CVE-2023-4611] =3D "fixed-version: only affects 6.4rc1 onward=
s"
=20
 # CVE-2023-4622 needs backporting (fixed from 6.5rc1)
=20
 CVE_STATUS[CVE-2023-4623] =3D "cpe-stable-backport: Backported in 6.1.53=
"
=20
+# CVE-2023-46813 needs backporting (fixed from 6.1.60)
+
+# CVE-2023-46862 needs backporting (fixed from 6.6)
+
+CVE_STATUS[CVE-2023-4732] =3D "fixed-version: Fixed from version 5.14rc1=
"
+
 CVE_STATUS[CVE-2023-4881] =3D "cpe-stable-backport: Backported in 6.1.54=
"
=20
 CVE_STATUS[CVE-2023-4921] =3D "cpe-stable-backport: Backported in 6.1.54=
"
=20
-# CVE-2023-5158 has no known resolution
+# CVE-2023-5090 needs backporting (fixed from 6.6rc7)
+
+CVE_STATUS[CVE-2023-5158] =3D "cpe-stable-backport: Backported in 6.1.57=
"
+
+# CVE-2023-5178 needs backporting (fixed from 6.1.60)
+
+CVE_STATUS[CVE-2023-5197] =3D "cpe-stable-backport: Backported in 6.1.56=
"
+
+CVE_STATUS[CVE-2023-5345] =3D "cpe-stable-backport: Backported in 6.1.56=
"
+
+# CVE-2023-5633 needs backporting (fixed from 6.6rc6)
=20
-# CVE-2023-5197 needs backporting (fixed from 6.6rc3)
+# CVE-2023-5717 needs backporting (fixed from 6.1.60)
=20
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.5.inc
index dbcfdcd31c7..d48b0e14935 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-10-14 12:24:32.683888+00:00 for version 6.5.7
+# Generated at 2023-11-03 13:24:25.010946+00:00 for version 6.5.7
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.5.7"
@@ -3354,7 +3354,7 @@ CVE_STATUS[CVE-2020-27194] =3D "fixed-version: Fixe=
d from version 5.9"
=20
 CVE_STATUS[CVE-2020-2732] =3D "fixed-version: Fixed from version 5.6rc4"
=20
-# CVE-2020-27418 has no known resolution
+CVE_STATUS[CVE-2020-27418] =3D "fixed-version: Fixed from version 5.6rc5=
"
=20
 CVE_STATUS[CVE-2020-27673] =3D "fixed-version: Fixed from version 5.10rc=
1"
=20
@@ -4644,7 +4644,7 @@ CVE_STATUS[CVE-2023-1118] =3D "fixed-version: Fixed=
 from version 6.3rc1"
=20
 CVE_STATUS[CVE-2023-1192] =3D "fixed-version: Fixed from version 6.4rc1"
=20
-# CVE-2023-1193 has no known resolution
+CVE_STATUS[CVE-2023-1193] =3D "fixed-version: Fixed from version 6.3rc6"
=20
 CVE_STATUS[CVE-2023-1194] =3D "fixed-version: Fixed from version 6.4rc6"
=20
@@ -4856,7 +4856,7 @@ CVE_STATUS[CVE-2023-3106] =3D "fixed-version: Fixed=
 from version 4.8rc7"
=20
 CVE_STATUS[CVE-2023-31084] =3D "fixed-version: Fixed from version 6.4rc3=
"
=20
-# CVE-2023-31085 has no known resolution
+# CVE-2023-31085 needs backporting (fixed from 6.6rc5)
=20
 CVE_STATUS[CVE-2023-3111] =3D "fixed-version: Fixed from version 6.0rc2"
=20
@@ -4936,6 +4936,8 @@ CVE_STATUS[CVE-2023-34256] =3D "fixed-version: Fixe=
d from version 6.4rc2"
=20
 CVE_STATUS[CVE-2023-34319] =3D "fixed-version: Fixed from version 6.5rc6=
"
=20
+# CVE-2023-34324 needs backporting (fixed from 6.6rc6)
+
 CVE_STATUS[CVE-2023-3439] =3D "fixed-version: Fixed from version 5.18rc5=
"
=20
 CVE_STATUS[CVE-2023-35001] =3D "fixed-version: Fixed from version 6.5rc2=
"
@@ -4952,7 +4954,7 @@ CVE_STATUS[CVE-2023-35824] =3D "fixed-version: Fixe=
d from version 6.4rc1"
=20
 CVE_STATUS[CVE-2023-35826] =3D "fixed-version: Fixed from version 6.4rc1=
"
=20
-# CVE-2023-35827 has no known resolution
+# CVE-2023-35827 needs backporting (fixed from 6.6rc6)
=20
 CVE_STATUS[CVE-2023-35828] =3D "fixed-version: Fixed from version 6.4rc1=
"
=20
@@ -5004,6 +5006,16 @@ CVE_STATUS[CVE-2023-3866] =3D "fixed-version: Fixe=
d from version 6.4"
=20
 CVE_STATUS[CVE-2023-3867] =3D "fixed-version: Fixed from version 6.5rc1"
=20
+# CVE-2023-39189 needs backporting (fixed from 6.6rc1)
+
+CVE_STATUS[CVE-2023-39191] =3D "fixed-version: Fixed from version 6.3rc1=
"
+
+# CVE-2023-39192 needs backporting (fixed from 6.6rc1)
+
+# CVE-2023-39193 needs backporting (fixed from 6.6rc1)
+
+CVE_STATUS[CVE-2023-39194] =3D "fixed-version: Fixed from version 6.5rc7=
"
+
 CVE_STATUS[CVE-2023-4004] =3D "fixed-version: Fixed from version 6.5rc3"
=20
 # CVE-2023-4010 has no known resolution
@@ -5012,6 +5024,8 @@ CVE_STATUS[CVE-2023-4015] =3D "fixed-version: Fixed=
 from version 6.5rc4"
=20
 CVE_STATUS[CVE-2023-40283] =3D "fixed-version: Fixed from version 6.5rc1=
"
=20
+CVE_STATUS[CVE-2023-40791] =3D "fixed-version: Fixed from version 6.5rc6=
"
+
 CVE_STATUS[CVE-2023-4128] =3D "fixed-version: Fixed from version 6.5rc5"
=20
 CVE_STATUS[CVE-2023-4132] =3D "fixed-version: Fixed from version 6.5rc1"
@@ -5040,8 +5054,12 @@ CVE_STATUS[CVE-2023-4273] =3D "fixed-version: Fixe=
d from version 6.5rc5"
=20
 # CVE-2023-42753 needs backporting (fixed from 6.6rc1)
=20
+# CVE-2023-42754 needs backporting (fixed from 6.6rc3)
+
 CVE_STATUS[CVE-2023-42755] =3D "fixed-version: Fixed from version 6.3rc1=
"
=20
+# CVE-2023-42756 needs backporting (fixed from 6.6rc3)
+
 CVE_STATUS[CVE-2023-4385] =3D "fixed-version: Fixed from version 5.19rc1=
"
=20
 CVE_STATUS[CVE-2023-4387] =3D "fixed-version: Fixed from version 5.18"
@@ -5050,23 +5068,51 @@ CVE_STATUS[CVE-2023-4389] =3D "fixed-version: Fix=
ed from version 5.18rc3"
=20
 CVE_STATUS[CVE-2023-4394] =3D "fixed-version: Fixed from version 6.0rc3"
=20
+CVE_STATUS[CVE-2023-44466] =3D "fixed-version: Fixed from version 6.5rc2=
"
+
 CVE_STATUS[CVE-2023-4459] =3D "fixed-version: Fixed from version 5.18"
=20
 CVE_STATUS[CVE-2023-4563] =3D "fixed-version: Fixed from version 6.5rc6"
=20
 CVE_STATUS[CVE-2023-4569] =3D "fixed-version: Fixed from version 6.5rc7"
=20
+CVE_STATUS[CVE-2023-45862] =3D "fixed-version: Fixed from version 6.3rc1=
"
+
+CVE_STATUS[CVE-2023-45863] =3D "fixed-version: Fixed from version 6.3rc1=
"
+
+# CVE-2023-45871 needs backporting (fixed from 6.6rc1)
+
+# CVE-2023-45898 needs backporting (fixed from 6.6rc1)
+
+CVE_STATUS[CVE-2023-4610] =3D "fixed-version: Fixed from version 6.4"
+
 CVE_STATUS[CVE-2023-4611] =3D "fixed-version: Fixed from version 6.5rc4"
=20
 CVE_STATUS[CVE-2023-4622] =3D "fixed-version: Fixed from version 6.5rc1"
=20
 # CVE-2023-4623 needs backporting (fixed from 6.6rc1)
=20
+# CVE-2023-46813 needs backporting (fixed from 6.6rc7)
+
+# CVE-2023-46862 needs backporting (fixed from 6.6)
+
+CVE_STATUS[CVE-2023-4732] =3D "fixed-version: Fixed from version 5.14rc1=
"
+
 # CVE-2023-4881 needs backporting (fixed from 6.6rc1)
=20
 # CVE-2023-4921 needs backporting (fixed from 6.6rc1)
=20
-# CVE-2023-5158 has no known resolution
+# CVE-2023-5090 needs backporting (fixed from 6.6rc7)
+
+# CVE-2023-5158 needs backporting (fixed from 6.6rc5)
+
+# CVE-2023-5178 needs backporting (fixed from 6.6rc7)
=20
 # CVE-2023-5197 needs backporting (fixed from 6.6rc3)
=20
+# CVE-2023-5345 needs backporting (fixed from 6.6rc4)
+
+# CVE-2023-5633 needs backporting (fixed from 6.6rc6)
+
+# CVE-2023-5717 needs backporting (fixed from 6.6rc7)
+
--=20
2.34.1


