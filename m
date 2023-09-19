Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35163CE79AA
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 16:31:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14301.1695141078788503467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 09:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30C731FB;
	Tue, 19 Sep 2023 09:31:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 66D543F5A1;
	Tue, 19 Sep 2023 09:31:17 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] linux-yocto: update CVE ignores
Date: Tue, 19 Sep 2023 17:31:15 +0100
Message-Id: <20230919163115.597297-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 16:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187874

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.1.inc               | 52 +++++++++++++++----
 .../linux/cve-exclusion_6.4.inc               | 50 +++++++++++++++---
 2 files changed, 85 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index 41ee8bcad59..90b07f0da5b 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-07 15:29:54.983415+00:00 for version 6.1.51
+# Generated at 2023-09-19 16:30:43.403752+00:00 for version 6.1.51
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.1.51"
@@ -4518,9 +4518,9 @@ CVE_STATUS[CVE-2022-4382] =3D "cpe-stable-backport:=
 Backported in 6.1.8"
=20
 CVE_STATUS[CVE-2022-43945] =3D "fixed-version: Fixed from version 6.1rc1=
"
=20
-# CVE-2022-44032 has no known resolution
+# CVE-2022-44032 needs backporting (fixed from 6.4rc1)
=20
-# CVE-2022-44033 has no known resolution
+# CVE-2022-44033 needs backporting (fixed from 6.4rc1)
=20
 # CVE-2022-44034 has no known resolution
=20
@@ -4532,13 +4532,13 @@ CVE_STATUS[CVE-2022-45869] =3D "fixed-version: Fi=
xed from version 6.1rc7"
=20
 # CVE-2022-45885 has no known resolution
=20
-# CVE-2022-45886 has no known resolution
+CVE_STATUS[CVE-2022-45886] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
=20
-# CVE-2022-45887 has no known resolution
+CVE_STATUS[CVE-2022-45887] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
=20
 # CVE-2022-45888 needs backporting (fixed from 6.2rc1)
=20
-# CVE-2022-45919 has no known resolution
+CVE_STATUS[CVE-2022-45919] =3D "cpe-stable-backport: Backported in 6.1.3=
3"
=20
 CVE_STATUS[CVE-2022-45934] =3D "fixed-version: Fixed from version 6.1"
=20
@@ -4786,7 +4786,7 @@ CVE_STATUS[CVE-2023-23559] =3D "cpe-stable-backport=
: Backported in 6.1.9"
=20
 CVE_STATUS[CVE-2023-23586] =3D "fixed-version: Fixed from version 5.12rc=
1"
=20
-# CVE-2023-2430 needs backporting (fixed from 6.2rc5)
+CVE_STATUS[CVE-2023-2430] =3D "cpe-stable-backport: Backported in 6.1.50=
"
=20
 CVE_STATUS[CVE-2023-2483] =3D "cpe-stable-backport: Backported in 6.1.22=
"
=20
@@ -4794,6 +4794,8 @@ CVE_STATUS[CVE-2023-25012] =3D "cpe-stable-backport=
: Backported in 6.1.16"
=20
 CVE_STATUS[CVE-2023-2513] =3D "fixed-version: Fixed from version 6.0rc1"
=20
+# CVE-2023-25775 needs backporting (fixed from 6.1.53)
+
 CVE_STATUS[CVE-2023-2598] =3D "fixed-version: only affects 6.3rc1 onward=
s"
=20
 # CVE-2023-26242 has no known resolution
@@ -4848,7 +4850,7 @@ CVE_STATUS[CVE-2023-3106] =3D "fixed-version: Fixed=
 from version 4.8rc7"
=20
 # CVE-2023-31082 has no known resolution
=20
-# CVE-2023-31083 has no known resolution
+# CVE-2023-31083 needs backporting (fixed from 6.6rc1)
=20
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
=20
@@ -4962,7 +4964,7 @@ CVE_STATUS[CVE-2023-3611] =3D "cpe-stable-backport:=
 Backported in 6.1.40"
=20
 # CVE-2023-3640 has no known resolution
=20
-# CVE-2023-37453 has no known resolution
+CVE_STATUS[CVE-2023-37453] =3D "fixed-version: only affects 6.3rc1 onwar=
ds"
=20
 # CVE-2023-37454 has no known resolution
=20
@@ -4972,6 +4974,8 @@ CVE_STATUS[CVE-2023-3773] =3D "cpe-stable-backport:=
 Backported in 6.1.47"
=20
 CVE_STATUS[CVE-2023-3776] =3D "cpe-stable-backport: Backported in 6.1.40=
"
=20
+CVE_STATUS[CVE-2023-3777] =3D "cpe-stable-backport: Backported in 6.1.42=
"
+
 CVE_STATUS[CVE-2023-3812] =3D "fixed-version: Fixed from version 6.1rc4"
=20
 CVE_STATUS[CVE-2023-38409] =3D "cpe-stable-backport: Backported in 6.1.2=
5"
@@ -4992,10 +4996,18 @@ CVE_STATUS[CVE-2023-38432] =3D "cpe-stable-backpo=
rt: Backported in 6.1.36"
=20
 CVE_STATUS[CVE-2023-3863] =3D "cpe-stable-backport: Backported in 6.1.39=
"
=20
+CVE_STATUS[CVE-2023-3865] =3D "cpe-stable-backport: Backported in 6.1.36=
"
+
+CVE_STATUS[CVE-2023-3866] =3D "cpe-stable-backport: Backported in 6.1.36=
"
+
+CVE_STATUS[CVE-2023-3867] =3D "cpe-stable-backport: Backported in 6.1.40=
"
+
 CVE_STATUS[CVE-2023-4004] =3D "cpe-stable-backport: Backported in 6.1.42=
"
=20
 # CVE-2023-4010 has no known resolution
=20
+CVE_STATUS[CVE-2023-4015] =3D "cpe-stable-backport: Backported in 6.1.43=
"
+
 CVE_STATUS[CVE-2023-40283] =3D "cpe-stable-backport: Backported in 6.1.4=
5"
=20
 CVE_STATUS[CVE-2023-4128] =3D "cpe-stable-backport: Backported in 6.1.45=
"
@@ -5012,6 +5024,14 @@ CVE_STATUS[CVE-2023-4155] =3D "cpe-stable-backport=
: Backported in 6.1.46"
=20
 CVE_STATUS[CVE-2023-4194] =3D "fixed-version: only affects 6.3rc1 onward=
s"
=20
+CVE_STATUS[CVE-2023-4206] =3D "cpe-stable-backport: Backported in 6.1.45=
"
+
+CVE_STATUS[CVE-2023-4207] =3D "cpe-stable-backport: Backported in 6.1.45=
"
+
+CVE_STATUS[CVE-2023-4208] =3D "cpe-stable-backport: Backported in 6.1.45=
"
+
+# CVE-2023-4244 needs backporting (fixed from 6.5rc7)
+
 CVE_STATUS[CVE-2023-4273] =3D "cpe-stable-backport: Backported in 6.1.45=
"
=20
 CVE_STATUS[CVE-2023-4385] =3D "fixed-version: Fixed from version 5.19rc1=
"
@@ -5024,3 +5044,17 @@ CVE_STATUS[CVE-2023-4394] =3D "fixed-version: Fixe=
d from version 6.0rc3"
=20
 CVE_STATUS[CVE-2023-4459] =3D "fixed-version: Fixed from version 5.18"
=20
+# CVE-2023-4563 needs backporting (fixed from 6.5rc6)
+
+CVE_STATUS[CVE-2023-4569] =3D "cpe-stable-backport: Backported in 6.1.47=
"
+
+CVE_STATUS[CVE-2023-4611] =3D "fixed-version: only affects 6.4rc1 onward=
s"
+
+# CVE-2023-4622 needs backporting (fixed from 6.5rc1)
+
+# CVE-2023-4623 needs backporting (fixed from 6.1.53)
+
+# CVE-2023-4881 needs backporting (fixed from 6.6rc1)
+
+# CVE-2023-4921 needs backporting (fixed from 6.6rc1)
+
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.4.inc
index 5a5eb9a755f..d64ab0092d6 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-07 15:30:03.897686+00:00 for version 6.4.14
+# Generated at 2023-09-19 16:30:35.921888+00:00 for version 6.4.14
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.4.14"
@@ -4518,9 +4518,9 @@ CVE_STATUS[CVE-2022-4382] =3D "fixed-version: Fixed=
 from version 6.2rc5"
=20
 CVE_STATUS[CVE-2022-43945] =3D "fixed-version: Fixed from version 6.1rc1=
"
=20
-# CVE-2022-44032 has no known resolution
+CVE_STATUS[CVE-2022-44032] =3D "fixed-version: Fixed from version 6.4rc1=
"
=20
-# CVE-2022-44033 has no known resolution
+CVE_STATUS[CVE-2022-44033] =3D "fixed-version: Fixed from version 6.4rc1=
"
=20
 # CVE-2022-44034 has no known resolution
=20
@@ -4532,13 +4532,13 @@ CVE_STATUS[CVE-2022-45869] =3D "fixed-version: Fi=
xed from version 6.1rc7"
=20
 # CVE-2022-45885 has no known resolution
=20
-# CVE-2022-45886 has no known resolution
+CVE_STATUS[CVE-2022-45886] =3D "fixed-version: Fixed from version 6.4rc3=
"
=20
-# CVE-2022-45887 has no known resolution
+CVE_STATUS[CVE-2022-45887] =3D "fixed-version: Fixed from version 6.4rc3=
"
=20
 CVE_STATUS[CVE-2022-45888] =3D "fixed-version: Fixed from version 6.2rc1=
"
=20
-# CVE-2022-45919 has no known resolution
+CVE_STATUS[CVE-2022-45919] =3D "fixed-version: Fixed from version 6.4rc3=
"
=20
 CVE_STATUS[CVE-2022-45934] =3D "fixed-version: Fixed from version 6.1"
=20
@@ -4794,6 +4794,8 @@ CVE_STATUS[CVE-2023-25012] =3D "fixed-version: Fixe=
d from version 6.3rc1"
=20
 CVE_STATUS[CVE-2023-2513] =3D "fixed-version: Fixed from version 6.0rc1"
=20
+# CVE-2023-25775 needs backporting (fixed from 6.4.16)
+
 CVE_STATUS[CVE-2023-2598] =3D "fixed-version: Fixed from version 6.4rc1"
=20
 # CVE-2023-26242 has no known resolution
@@ -4848,7 +4850,7 @@ CVE_STATUS[CVE-2023-3106] =3D "fixed-version: Fixed=
 from version 4.8rc7"
=20
 # CVE-2023-31082 has no known resolution
=20
-# CVE-2023-31083 has no known resolution
+# CVE-2023-31083 needs backporting (fixed from 6.6rc1)
=20
 CVE_STATUS[CVE-2023-31084] =3D "fixed-version: Fixed from version 6.4rc3=
"
=20
@@ -4962,7 +4964,7 @@ CVE_STATUS[CVE-2023-3611] =3D "cpe-stable-backport:=
 Backported in 6.4.5"
=20
 # CVE-2023-3640 has no known resolution
=20
-# CVE-2023-37453 has no known resolution
+# CVE-2023-37453 needs backporting (fixed from 6.4.16)
=20
 # CVE-2023-37454 has no known resolution
=20
@@ -4972,6 +4974,8 @@ CVE_STATUS[CVE-2023-3773] =3D "cpe-stable-backport:=
 Backported in 6.4.12"
=20
 CVE_STATUS[CVE-2023-3776] =3D "cpe-stable-backport: Backported in 6.4.5"
=20
+CVE_STATUS[CVE-2023-3777] =3D "cpe-stable-backport: Backported in 6.4.7"
+
 CVE_STATUS[CVE-2023-3812] =3D "fixed-version: Fixed from version 6.1rc4"
=20
 CVE_STATUS[CVE-2023-38409] =3D "fixed-version: Fixed from version 6.3rc7=
"
@@ -4992,10 +4996,18 @@ CVE_STATUS[CVE-2023-38432] =3D "fixed-version: Fi=
xed from version 6.4"
=20
 CVE_STATUS[CVE-2023-3863] =3D "cpe-stable-backport: Backported in 6.4.4"
=20
+CVE_STATUS[CVE-2023-3865] =3D "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-3866] =3D "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-3867] =3D "cpe-stable-backport: Backported in 6.4.5"
+
 CVE_STATUS[CVE-2023-4004] =3D "cpe-stable-backport: Backported in 6.4.7"
=20
 # CVE-2023-4010 has no known resolution
=20
+CVE_STATUS[CVE-2023-4015] =3D "cpe-stable-backport: Backported in 6.4.8"
+
 CVE_STATUS[CVE-2023-40283] =3D "cpe-stable-backport: Backported in 6.4.1=
0"
=20
 CVE_STATUS[CVE-2023-4128] =3D "cpe-stable-backport: Backported in 6.4.10=
"
@@ -5012,6 +5024,14 @@ CVE_STATUS[CVE-2023-4155] =3D "cpe-stable-backport=
: Backported in 6.4.11"
=20
 CVE_STATUS[CVE-2023-4194] =3D "cpe-stable-backport: Backported in 6.4.10=
"
=20
+CVE_STATUS[CVE-2023-4206] =3D "cpe-stable-backport: Backported in 6.4.10=
"
+
+CVE_STATUS[CVE-2023-4207] =3D "cpe-stable-backport: Backported in 6.4.10=
"
+
+CVE_STATUS[CVE-2023-4208] =3D "cpe-stable-backport: Backported in 6.4.10=
"
+
+CVE_STATUS[CVE-2023-4244] =3D "cpe-stable-backport: Backported in 6.4.12=
"
+
 CVE_STATUS[CVE-2023-4273] =3D "cpe-stable-backport: Backported in 6.4.10=
"
=20
 CVE_STATUS[CVE-2023-4385] =3D "fixed-version: Fixed from version 5.19rc1=
"
@@ -5024,3 +5044,17 @@ CVE_STATUS[CVE-2023-4394] =3D "fixed-version: Fixe=
d from version 6.0rc3"
=20
 CVE_STATUS[CVE-2023-4459] =3D "fixed-version: Fixed from version 5.18"
=20
+CVE_STATUS[CVE-2023-4563] =3D "cpe-stable-backport: Backported in 6.4.11=
"
+
+CVE_STATUS[CVE-2023-4569] =3D "cpe-stable-backport: Backported in 6.4.12=
"
+
+CVE_STATUS[CVE-2023-4611] =3D "cpe-stable-backport: Backported in 6.4.8"
+
+# CVE-2023-4622 needs backporting (fixed from 6.5rc1)
+
+# CVE-2023-4623 needs backporting (fixed from 6.4.16)
+
+# CVE-2023-4881 needs backporting (fixed from 6.6rc1)
+
+# CVE-2023-4921 needs backporting (fixed from 6.6rc1)
+
--=20
2.34.1


