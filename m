Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7948CC71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 12:36:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.46570.1693830995420070841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 05:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55ABB1474;
	Mon,  4 Sep 2023 05:37:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE0463F793;
	Mon,  4 Sep 2023 05:36:33 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] linux-yocto: update kernel CVE status
Date: Mon,  4 Sep 2023 13:36:31 +0100
Message-Id: <20230904123631.2978476-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 12:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187173

From: Ross Burton <ross.burton@arm.com>

Handles the following CVEs:

6.1:
- CVE-2022-4098
- CVE-2023-0160
- CVE-2023-20569
- CVE-2023-20588
- CVE-2023-33250
- CVE-2023-34319
- CVE-2023-40283
- CVE-2023-4128
- CVE-2023-4155
- CVE-2023-4194
- CVE-2023-4273
- CVE-2023-4385
- CVE-2023-4387
- CVE-2023-4389

6.4:
- CVE-2022-40982
- CVE-2023-0160
- CVE-2023-20569
- CVE-2023-20588
- CVE-2023-33250
- CVE-2023-34319
- CVE-2023-40283
- CVE-2023-4128
- CVE-2023-4155
- CVE-2023-4194
- CVE-2023-4273
- CVE-2023-4385
- CVE-2023-4387
- CVE-2023-4389
- CVE-2023-4394
- CVE-2023-4459

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/cve-exclusion_6.1.inc               | 40 +++++++++++++------
 .../linux/cve-exclusion_6.4.inc               | 40 +++++++++++++------
 2 files changed, 54 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.1.inc
index ce3a534cf34..b6d733f9bbd 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-08-25 12:42:35.329668 for version 6.1.46"
+# Generated at 2023-09-04 13:17:06.462373 for version 6.1.46
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.1.46"
@@ -3354,6 +3354,8 @@ CVE_STATUS[CVE-2020-27194] =3D "fixed-version: Fixe=
d after version 5.9"
=20
 CVE_STATUS[CVE-2020-2732] =3D "fixed-version: Fixed after version 5.6rc4=
"
=20
+# CVE-2020-27418 has no known resolution
+
 CVE_STATUS[CVE-2020-27673] =3D "fixed-version: Fixed after version 5.10r=
c1"
=20
 CVE_STATUS[CVE-2020-27675] =3D "fixed-version: Fixed after version 5.10r=
c1"
@@ -4460,7 +4462,7 @@ CVE_STATUS[CVE-2022-40768] =3D "fixed-version: Fixe=
d after version 6.1rc1"
=20
 CVE_STATUS[CVE-2022-4095] =3D "fixed-version: Fixed after version 6.0rc4=
"
=20
-# CVE-2022-40982 has no known resolution
+CVE_STATUS[CVE-2022-40982] =3D "cpe-stable-backport: Backported in 6.1.4=
4"
=20
 CVE_STATUS[CVE-2022-41218] =3D "cpe-stable-backport: Backported in 6.1.4=
"
=20
@@ -4588,7 +4590,7 @@ CVE_STATUS[CVE-2023-0047] =3D "fixed-version: Fixed=
 after version 5.16rc1"
=20
 CVE_STATUS[CVE-2023-0122] =3D "fixed-version: Fixed after version 6.0rc4=
"
=20
-# CVE-2023-0160 has no known resolution
+CVE_STATUS[CVE-2023-0160] =3D "cpe-stable-backport: Backported in 6.1.28=
"
=20
 CVE_STATUS[CVE-2023-0179] =3D "cpe-stable-backport: Backported in 6.1.7"
=20
@@ -4702,9 +4704,9 @@ CVE_STATUS[CVE-2023-2008] =3D "fixed-version: Fixed=
 after version 5.19rc4"
=20
 CVE_STATUS[CVE-2023-2019] =3D "fixed-version: Fixed after version 6.0rc1=
"
=20
-# CVE-2023-20569 has no known resolution
+CVE_STATUS[CVE-2023-20569] =3D "cpe-stable-backport: Backported in 6.1.4=
4"
=20
-# CVE-2023-20588 has no known resolution
+CVE_STATUS[CVE-2023-20588] =3D "cpe-stable-backport: Backported in 6.1.4=
5"
=20
 CVE_STATUS[CVE-2023-20593] =3D "cpe-stable-backport: Backported in 6.1.4=
1"
=20
@@ -4900,7 +4902,7 @@ CVE_STATUS[CVE-2023-3317] =3D "fixed-version: only =
affects 6.2rc1 onwards"
=20
 CVE_STATUS[CVE-2023-33203] =3D "cpe-stable-backport: Backported in 6.1.2=
2"
=20
-# CVE-2023-33250 has no known resolution
+CVE_STATUS[CVE-2023-33250] =3D "fixed-version: only affects 6.2rc1 onwar=
ds"
=20
 CVE_STATUS[CVE-2023-33288] =3D "cpe-stable-backport: Backported in 6.1.2=
2"
=20
@@ -4928,7 +4930,7 @@ CVE_STATUS[CVE-2023-34255] =3D "cpe-stable-backport=
: Backported in 6.1.33"
=20
 CVE_STATUS[CVE-2023-34256] =3D "cpe-stable-backport: Backported in 6.1.2=
9"
=20
-# CVE-2023-34319 has no known resolution
+CVE_STATUS[CVE-2023-34319] =3D "cpe-stable-backport: Backported in 6.1.4=
4"
=20
 CVE_STATUS[CVE-2023-3439] =3D "fixed-version: Fixed after version 5.18rc=
5"
=20
@@ -4964,9 +4966,9 @@ CVE_STATUS[CVE-2023-3611] =3D "cpe-stable-backport:=
 Backported in 6.1.40"
=20
 # CVE-2023-37454 has no known resolution
=20
-# CVE-2023-3772 has no known resolution
+# CVE-2023-3772 needs backporting (fixed from 6.1.47)
=20
-# CVE-2023-3773 has no known resolution
+# CVE-2023-3773 needs backporting (fixed from 6.1.47)
=20
 CVE_STATUS[CVE-2023-3776] =3D "cpe-stable-backport: Backported in 6.1.40=
"
=20
@@ -4994,7 +4996,9 @@ CVE_STATUS[CVE-2023-4004] =3D "cpe-stable-backport:=
 Backported in 6.1.42"
=20
 # CVE-2023-4010 has no known resolution
=20
-# CVE-2023-4128 needs backporting (fixed from 6.5rc5)
+CVE_STATUS[CVE-2023-40283] =3D "cpe-stable-backport: Backported in 6.1.4=
5"
+
+CVE_STATUS[CVE-2023-4128] =3D "cpe-stable-backport: Backported in 6.1.45=
"
=20
 CVE_STATUS[CVE-2023-4132] =3D "cpe-stable-backport: Backported in 6.1.39=
"
=20
@@ -5004,9 +5008,19 @@ CVE_STATUS[CVE-2023-4132] =3D "cpe-stable-backport=
: Backported in 6.1.39"
=20
 CVE_STATUS[CVE-2023-4147] =3D "cpe-stable-backport: Backported in 6.1.43=
"
=20
-# CVE-2023-4155 has no known resolution
+CVE_STATUS[CVE-2023-4155] =3D "cpe-stable-backport: Backported in 6.1.46=
"
+
+CVE_STATUS[CVE-2023-4194] =3D "fixed-version: only affects 6.3rc1 onward=
s"
+
+CVE_STATUS[CVE-2023-4273] =3D "cpe-stable-backport: Backported in 6.1.45=
"
+
+CVE_STATUS[CVE-2023-4385] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2023-4387] =3D "fixed-version: Fixed after version 5.18"
+
+CVE_STATUS[CVE-2023-4389] =3D "fixed-version: Fixed after version 5.18rc=
3"
=20
-# CVE-2023-4194 needs backporting (fixed from 6.5rc5)
+CVE_STATUS[CVE-2023-4394] =3D "fixed-version: Fixed after version 6.0rc3=
"
=20
-# CVE-2023-4273 needs backporting (fixed from 6.5rc5)
+CVE_STATUS[CVE-2023-4459] =3D "fixed-version: Fixed after version 5.18"
=20
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.4.inc
index 63f0760b2d3..c17ac91efbe 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-08-25 12:42:28.369507 for version 6.4.11"
+# Generated at 2023-09-04 13:17:16.330789 for version 6.4.11
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.4.11"
@@ -3354,6 +3354,8 @@ CVE_STATUS[CVE-2020-27194] =3D "fixed-version: Fixe=
d after version 5.9"
=20
 CVE_STATUS[CVE-2020-2732] =3D "fixed-version: Fixed after version 5.6rc4=
"
=20
+# CVE-2020-27418 has no known resolution
+
 CVE_STATUS[CVE-2020-27673] =3D "fixed-version: Fixed after version 5.10r=
c1"
=20
 CVE_STATUS[CVE-2020-27675] =3D "fixed-version: Fixed after version 5.10r=
c1"
@@ -4460,7 +4462,7 @@ CVE_STATUS[CVE-2022-40768] =3D "fixed-version: Fixe=
d after version 6.1rc1"
=20
 CVE_STATUS[CVE-2022-4095] =3D "fixed-version: Fixed after version 6.0rc4=
"
=20
-# CVE-2022-40982 has no known resolution
+CVE_STATUS[CVE-2022-40982] =3D "cpe-stable-backport: Backported in 6.4.9=
"
=20
 CVE_STATUS[CVE-2022-41218] =3D "fixed-version: Fixed after version 6.2rc=
1"
=20
@@ -4588,7 +4590,7 @@ CVE_STATUS[CVE-2023-0047] =3D "fixed-version: Fixed=
 after version 5.16rc1"
=20
 CVE_STATUS[CVE-2023-0122] =3D "fixed-version: Fixed after version 6.0rc4=
"
=20
-# CVE-2023-0160 has no known resolution
+CVE_STATUS[CVE-2023-0160] =3D "fixed-version: Fixed after version 6.4rc1=
"
=20
 CVE_STATUS[CVE-2023-0179] =3D "fixed-version: Fixed after version 6.2rc5=
"
=20
@@ -4702,9 +4704,9 @@ CVE_STATUS[CVE-2023-2008] =3D "fixed-version: Fixed=
 after version 5.19rc4"
=20
 CVE_STATUS[CVE-2023-2019] =3D "fixed-version: Fixed after version 6.0rc1=
"
=20
-# CVE-2023-20569 has no known resolution
+CVE_STATUS[CVE-2023-20569] =3D "cpe-stable-backport: Backported in 6.4.9=
"
=20
-# CVE-2023-20588 has no known resolution
+CVE_STATUS[CVE-2023-20588] =3D "cpe-stable-backport: Backported in 6.4.1=
0"
=20
 CVE_STATUS[CVE-2023-20593] =3D "cpe-stable-backport: Backported in 6.4.6=
"
=20
@@ -4900,7 +4902,7 @@ CVE_STATUS[CVE-2023-3317] =3D "fixed-version: Fixed=
 after version 6.3rc6"
=20
 CVE_STATUS[CVE-2023-33203] =3D "fixed-version: Fixed after version 6.3rc=
4"
=20
-# CVE-2023-33250 has no known resolution
+CVE_STATUS[CVE-2023-33250] =3D "cpe-stable-backport: Backported in 6.4.4=
"
=20
 CVE_STATUS[CVE-2023-33288] =3D "fixed-version: Fixed after version 6.3rc=
4"
=20
@@ -4928,7 +4930,7 @@ CVE_STATUS[CVE-2023-34255] =3D "fixed-version: Fixe=
d after version 6.4rc1"
=20
 CVE_STATUS[CVE-2023-34256] =3D "fixed-version: Fixed after version 6.4rc=
2"
=20
-# CVE-2023-34319 has no known resolution
+CVE_STATUS[CVE-2023-34319] =3D "cpe-stable-backport: Backported in 6.4.9=
"
=20
 CVE_STATUS[CVE-2023-3439] =3D "fixed-version: Fixed after version 5.18rc=
5"
=20
@@ -4964,9 +4966,9 @@ CVE_STATUS[CVE-2023-3611] =3D "cpe-stable-backport:=
 Backported in 6.4.5"
=20
 # CVE-2023-37454 has no known resolution
=20
-# CVE-2023-3772 has no known resolution
+# CVE-2023-3772 needs backporting (fixed from 6.4.12)
=20
-# CVE-2023-3773 has no known resolution
+# CVE-2023-3773 needs backporting (fixed from 6.4.12)
=20
 CVE_STATUS[CVE-2023-3776] =3D "cpe-stable-backport: Backported in 6.4.5"
=20
@@ -4994,7 +4996,9 @@ CVE_STATUS[CVE-2023-4004] =3D "cpe-stable-backport:=
 Backported in 6.4.7"
=20
 # CVE-2023-4010 has no known resolution
=20
-# CVE-2023-4128 needs backporting (fixed from 6.5rc5)
+CVE_STATUS[CVE-2023-40283] =3D "cpe-stable-backport: Backported in 6.4.1=
0"
+
+CVE_STATUS[CVE-2023-4128] =3D "cpe-stable-backport: Backported in 6.4.10=
"
=20
 CVE_STATUS[CVE-2023-4132] =3D "cpe-stable-backport: Backported in 6.4.4"
=20
@@ -5004,9 +5008,19 @@ CVE_STATUS[CVE-2023-4134] =3D "cpe-stable-backport=
: Backported in 6.4.4"
=20
 CVE_STATUS[CVE-2023-4147] =3D "cpe-stable-backport: Backported in 6.4.8"
=20
-# CVE-2023-4155 has no known resolution
+CVE_STATUS[CVE-2023-4155] =3D "cpe-stable-backport: Backported in 6.4.11=
"
+
+CVE_STATUS[CVE-2023-4194] =3D "cpe-stable-backport: Backported in 6.4.10=
"
+
+CVE_STATUS[CVE-2023-4273] =3D "cpe-stable-backport: Backported in 6.4.10=
"
+
+CVE_STATUS[CVE-2023-4385] =3D "fixed-version: Fixed after version 5.19rc=
1"
+
+CVE_STATUS[CVE-2023-4387] =3D "fixed-version: Fixed after version 5.18"
+
+CVE_STATUS[CVE-2023-4389] =3D "fixed-version: Fixed after version 5.18rc=
3"
=20
-# CVE-2023-4194 needs backporting (fixed from 6.5rc5)
+CVE_STATUS[CVE-2023-4394] =3D "fixed-version: Fixed after version 6.0rc3=
"
=20
-# CVE-2023-4273 needs backporting (fixed from 6.5rc5)
+CVE_STATUS[CVE-2023-4459] =3D "fixed-version: Fixed after version 5.18"
=20
--=20
2.34.1


