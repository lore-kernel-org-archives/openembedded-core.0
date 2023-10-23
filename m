Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8762FC00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 14:06:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.121837.1698069958445006066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 07:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01E3D2F4;
	Mon, 23 Oct 2023 07:06:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BD5B3F64C;
	Mon, 23 Oct 2023 07:05:57 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][master nanbield] linux-yocto: update CVE exclusions
Date: Mon, 23 Oct 2023 15:05:53 +0100
Message-Id: <20231023140553.2791015-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 14:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189624

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.1.inc               | 46 ++++++++++++++++---
 .../linux/cve-exclusion_6.5.inc               | 40 ++++++++++++++--
 2 files changed, 77 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 6af53b0d750..3f708b0cc51 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-10-14 12:24:32.747058+00:00 for version 6.1.57
+# Generated at 2023-10-23 14:03:17.479563+00:00 for version 6.1.57
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
@@ -5050,23 +5068,39 @@ CVE_STATUS[CVE-2023-4389] =3D "fixed-version: Fix=
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
+# CVE-2023-45898 needs backporting (fixed from 6.6rc1)
+
+# CVE-2023-4610 has no known resolution
+
 CVE_STATUS[CVE-2023-4611] =3D "fixed-version: only affects 6.4rc1 onward=
s"
=20
 # CVE-2023-4622 needs backporting (fixed from 6.5rc1)
=20
 CVE_STATUS[CVE-2023-4623] =3D "cpe-stable-backport: Backported in 6.1.53=
"
=20
+CVE_STATUS[CVE-2023-4732] =3D "fixed-version: Fixed from version 5.14rc1=
"
+
 CVE_STATUS[CVE-2023-4881] =3D "cpe-stable-backport: Backported in 6.1.54=
"
=20
 CVE_STATUS[CVE-2023-4921] =3D "cpe-stable-backport: Backported in 6.1.54=
"
=20
 # CVE-2023-5158 has no known resolution
=20
-# CVE-2023-5197 needs backporting (fixed from 6.6rc3)
+CVE_STATUS[CVE-2023-5197] =3D "cpe-stable-backport: Backported in 6.1.56=
"
+
+CVE_STATUS[CVE-2023-5345] =3D "cpe-stable-backport: Backported in 6.1.56=
"
=20
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.5.inc
index dbcfdcd31c7..69cf7908441 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-10-14 12:24:32.683888+00:00 for version 6.5.7
+# Generated at 2023-10-23 14:03:24.529766+00:00 for version 6.5.7
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
@@ -5050,18 +5068,32 @@ CVE_STATUS[CVE-2023-4389] =3D "fixed-version: Fix=
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
+# CVE-2023-4610 has no known resolution
+
 CVE_STATUS[CVE-2023-4611] =3D "fixed-version: Fixed from version 6.5rc4"
=20
 CVE_STATUS[CVE-2023-4622] =3D "fixed-version: Fixed from version 6.5rc1"
=20
 # CVE-2023-4623 needs backporting (fixed from 6.6rc1)
=20
+CVE_STATUS[CVE-2023-4732] =3D "fixed-version: Fixed from version 5.14rc1=
"
+
 # CVE-2023-4881 needs backporting (fixed from 6.6rc1)
=20
 # CVE-2023-4921 needs backporting (fixed from 6.6rc1)
@@ -5070,3 +5102,5 @@ CVE_STATUS[CVE-2023-4622] =3D "fixed-version: Fixed=
 from version 6.5rc1"
=20
 # CVE-2023-5197 needs backporting (fixed from 6.6rc3)
=20
+# CVE-2023-5345 needs backporting (fixed from 6.6rc4)
+
--=20
2.34.1


