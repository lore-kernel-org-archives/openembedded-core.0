Return-Path: <esa.jaaskela@suomi24.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1D3C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 18:16:41 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4390.1783448199271241575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: illegal base64 data at input byte 231" header.i=@suomi24.fi header.s=MBO0001 header.b=XXNc+bbQ;
 spf=pass (domain: suomi24.fi, ip: 80.241.56.152, mailfrom: esa.jaaskela@suomi24.fi)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gvqDg23N6zKvyK;
	Tue, 07 Jul 2026 20:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suomi24.fi; s=MBO0001;
	t=1783448195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+7ynNYdo2Un/aDdAiszEEUNW90jv2YU+tPHXoh1UEHU=;
	b=XXNc+bbQ058AvTsj0PtySQx3FvNRd1/2zEwYB6wkNOEqjqT0Ql9G8NBHHwjc5arKE+lOgK
	sJ2O5VV1QnD2iS3xAjp4kAuSQJpDdbPYR2bXNeqw15cmILW00Ab5NOZd0zwpD74H5nV9Ag
	LLk4rh7oYPP9+82OXX24PIa5AOWP5b4gSdvNe9NNQpPigUv3wQWNykYrVg5sKpQR5NvQHg
	c1Sa8SwUJfOj7M7YvpqYbp1DvvTL/OzkTRqPBeIyjvEFc9V5xaE1xFXBvphpQwXZ9Wso1y
	6SM2T5Ufm/qIfPJCSg0ELRvMni6PrwyLvuXz42WJ9buT2aYsskHtrUQih1t4Nw==
From: Esa Jaaskela <esa.jaaskela@suomi24.fi>
To: openembedded-core@lists.openembedded.org
Cc: Esa Jaaskela <esa.jaaskela@suomi24.fi>
Subject: [scarthgap][PATCH] linux-yocto/6.6: update CVE exclusions (6.6.142)
Date: Tue,  7 Jul 2026 21:16:18 +0300
Message-ID: <20260707181619.3428508-1-esa.jaaskela@suomi24.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 18:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240406

Regenerated to fix this warning:
WARNING: linux-yocto-6.6.142+git-r0 do_cve_check: Kernel CVE status needs=
 updating: generated for 6.6.127 but kernel is 6.6.142

$ ./meta/recipes-kernel/linux/generate-cve-exclusions.py .../cvelistV5/ 6=
.6.142 > meta/recipes-kernel/linux/cve-exclusion_6.6.inc

Generated at 2026-07-07 17:39:10.952928+00:00 for kernel version 6.6.142
From cvelistV5 cve_2026-07-07_1600Z

Signed-off-by: Esa Jaaskela <esa.jaaskela@suomi24.fi>
---
 .../linux/cve-exclusion_6.6.inc               | 3418 +++++++++++++----
 1 file changed, 2668 insertions(+), 750 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recip=
es-kernel/linux/cve-exclusion_6.6.inc
index fcd38c56ae..2a194e7c84 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,17 +1,19 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-05-27 12:02:49.732909+00:00 for kernel version 6.6.1=
27
-# From cvelistV5 cve_2026-05-27_0900Z
+# Generated at 2026-07-07 17:39:10.952928+00:00 for kernel version 6.6.1=
42
+# From cvelistV5 cve_2026-07-07_1600Z
=20
=20
 python check_kernel_cve_status_version() {
-    this_version =3D "6.6.127"
+    this_version =3D "6.6.142"
     kernel_version =3D d.getVar("LINUX_VERSION")
     if kernel_version !=3D this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
 }
 do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
=20
+# CVE-2018-10902 has no known resolution
+
 CVE_STATUS[CVE-2019-25160] =3D "fixed-version: Fixed from version 5.0"
=20
 CVE_STATUS[CVE-2019-25162] =3D "fixed-version: Fixed from version 6.0"
@@ -6634,7 +6636,7 @@ CVE_STATUS[CVE-2023-52918] =3D "cpe-stable-backport=
: Backported in 6.6.48"
=20
 CVE_STATUS[CVE-2023-52919] =3D "fixed-version: Fixed from version 6.6"
=20
-# CVE-2023-52920 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2023-52920] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2023-52921] =3D "fixed-version: Fixed from version 6.5"
=20
@@ -9030,7 +9032,7 @@ CVE_STATUS[CVE-2023-54326] =3D "fixed-version: Fixe=
d from version 6.5"
=20
 CVE_STATUS[CVE-2023-7324] =3D "fixed-version: Fixed from version 6.3"
=20
-# CVE-2024-14027 may need backporting (fixed from 6.6.133)
+CVE_STATUS[CVE-2024-14027] =3D "cpe-stable-backport: Backported in 6.6.1=
33"
=20
 CVE_STATUS[CVE-2024-26581] =3D "cpe-stable-backport: Backported in 6.6.1=
7"
=20
@@ -9874,7 +9876,7 @@ CVE_STATUS[CVE-2024-27020] =3D "cpe-stable-backport=
: Backported in 6.6.29"
=20
 CVE_STATUS[CVE-2024-27021] =3D "fixed-version: only affects 6.8 onwards"
=20
-# CVE-2024-27022 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2024-27022] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2024-27023] =3D "cpe-stable-backport: Backported in 6.6.1=
9"
=20
@@ -11942,7 +11944,7 @@ CVE_STATUS[CVE-2024-43823] =3D "cpe-stable-backpo=
rt: Backported in 6.6.44"
=20
 CVE_STATUS[CVE-2024-43825] =3D "cpe-stable-backport: Backported in 6.6.4=
4"
=20
-# CVE-2024-43826 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2024-43826] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2024-43827] =3D "fixed-version: only affects 6.8 onwards"
=20
@@ -12346,7 +12348,7 @@ CVE_STATUS[CVE-2024-46689] =3D "cpe-stable-backpo=
rt: Backported in 6.6.49"
=20
 CVE_STATUS[CVE-2024-46690] =3D "fixed-version: only affects 6.9 onwards"
=20
-# CVE-2024-46691 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2024-46691] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2024-46692] =3D "cpe-stable-backport: Backported in 6.6.4=
9"
=20
@@ -14482,7 +14484,7 @@ CVE_STATUS[CVE-2024-56645] =3D "cpe-stable-backpo=
rt: Backported in 6.6.66"
=20
 CVE_STATUS[CVE-2024-56646] =3D "fixed-version: only affects 6.9 onwards"
=20
-# CVE-2024-56647 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2024-56647] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2024-56648] =3D "cpe-stable-backport: Backported in 6.6.6=
6"
=20
@@ -15258,7 +15260,7 @@ CVE_STATUS[CVE-2025-21680] =3D "cpe-stable-backpo=
rt: Backported in 6.6.74"
=20
 CVE_STATUS[CVE-2025-21681] =3D "cpe-stable-backport: Backported in 6.6.7=
4"
=20
-# CVE-2025-21682 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-21682] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-21683] =3D "cpe-stable-backport: Backported in 6.6.7=
4"
=20
@@ -15368,7 +15370,7 @@ CVE_STATUS[CVE-2025-21737] =3D "fixed-version: on=
ly affects 6.10 onwards"
=20
 CVE_STATUS[CVE-2025-21738] =3D "cpe-stable-backport: Backported in 6.6.7=
8"
=20
-# CVE-2025-21739 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2025-21739] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2025-21741] =3D "cpe-stable-backport: Backported in 6.6.7=
8"
=20
@@ -15392,7 +15394,7 @@ CVE_STATUS[CVE-2025-21750] =3D "cpe-stable-backpo=
rt: Backported in 6.6.78"
=20
 CVE_STATUS[CVE-2025-21751] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-CVE_STATUS[CVE-2025-21752] =3D "fixed-version: only affects 6.6.130 onwa=
rds"
+# CVE-2025-21752 may need backporting (fixed from 6.7)
=20
 CVE_STATUS[CVE-2025-21753] =3D "cpe-stable-backport: Backported in 6.6.7=
8"
=20
@@ -16128,7 +16130,7 @@ CVE_STATUS[CVE-2025-22123] =3D "fixed-version: on=
ly affects 6.9 onwards"
=20
 # CVE-2025-22124 may need backporting (fixed from 6.7)
=20
-# CVE-2025-22125 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2025-22125] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2025-22126] =3D "cpe-stable-backport: Backported in 6.6.8=
8"
=20
@@ -16140,7 +16142,7 @@ CVE_STATUS[CVE-2025-22128] =3D "fixed-version: on=
ly affects 6.8 onwards"
=20
 # CVE-2025-23130 needs backporting (fixed from 6.15)
=20
-# CVE-2025-23131 needs backporting (fixed from 6.15)
+# CVE-2025-23131 may need backporting (fixed from 6.6.144)
=20
 # CVE-2025-23132 needs backporting (fixed from 6.15)
=20
@@ -17030,7 +17032,7 @@ CVE_STATUS[CVE-2025-38162] =3D "cpe-stable-backpo=
rt: Backported in 6.6.125"
=20
 CVE_STATUS[CVE-2025-38163] =3D "cpe-stable-backport: Backported in 6.6.9=
4"
=20
-# CVE-2025-38164 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-38164] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-38165] =3D "cpe-stable-backport: Backported in 6.6.9=
4"
=20
@@ -17548,7 +17550,7 @@ CVE_STATUS[CVE-2025-38424] =3D "cpe-stable-backpo=
rt: Backported in 6.6.95"
=20
 CVE_STATUS[CVE-2025-38425] =3D "cpe-stable-backport: Backported in 6.6.9=
5"
=20
-# CVE-2025-38426 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-38426] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-38427] =3D "cpe-stable-backport: Backported in 6.6.9=
5"
=20
@@ -17758,7 +17760,7 @@ CVE_STATUS[CVE-2025-38529] =3D "cpe-stable-backpo=
rt: Backported in 6.6.100"
=20
 CVE_STATUS[CVE-2025-38530] =3D "cpe-stable-backport: Backported in 6.6.1=
00"
=20
-# CVE-2025-38531 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2025-38531] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2025-38532] =3D "cpe-stable-backport: Backported in 6.6.1=
00"
=20
@@ -17802,8 +17804,6 @@ CVE_STATUS[CVE-2025-38551] =3D "fixed-version: on=
ly affects 6.11.2 onwards"
=20
 CVE_STATUS[CVE-2025-38552] =3D "cpe-stable-backport: Backported in 6.6.1=
01"
=20
-CVE_STATUS[CVE-2025-38553] =3D "cpe-stable-backport: Backported in 6.6.1=
02"
-
 CVE_STATUS[CVE-2025-38554] =3D "fixed-version: only affects 6.15 onwards=
"
=20
 CVE_STATUS[CVE-2025-38555] =3D "cpe-stable-backport: Backported in 6.6.1=
02"
@@ -17864,7 +17864,7 @@ CVE_STATUS[CVE-2025-38581] =3D "cpe-stable-backpo=
rt: Backported in 6.6.102"
=20
 CVE_STATUS[CVE-2025-38583] =3D "cpe-stable-backport: Backported in 6.6.1=
02"
=20
-# CVE-2025-38584 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2025-38584] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 # CVE-2025-38585 needs backporting (fixed from 6.17)
=20
@@ -18100,7 +18100,7 @@ CVE_STATUS[CVE-2025-38702] =3D "cpe-stable-backpo=
rt: Backported in 6.6.103"
=20
 CVE_STATUS[CVE-2025-38703] =3D "fixed-version: only affects 6.8 onwards"
=20
-# CVE-2025-38704 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-38704] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2025-38705 needs backporting (fixed from 6.17)
=20
@@ -18112,7 +18112,7 @@ CVE_STATUS[CVE-2025-38708] =3D "cpe-stable-backpo=
rt: Backported in 6.6.103"
=20
 CVE_STATUS[CVE-2025-38709] =3D "cpe-stable-backport: Backported in 6.6.1=
09"
=20
-# CVE-2025-38710 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2025-38710] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2025-38711] =3D "cpe-stable-backport: Backported in 6.6.1=
03"
=20
@@ -18318,7 +18318,7 @@ CVE_STATUS[CVE-2025-39745] =3D "fixed-version: on=
ly affects 6.14 onwards"
=20
 # CVE-2025-39747 needs backporting (fixed from 6.17)
=20
-# CVE-2025-39748 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-39748] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-39749] =3D "cpe-stable-backport: Backported in 6.6.1=
03"
=20
@@ -18348,7 +18348,7 @@ CVE_STATUS[CVE-2025-39761] =3D "cpe-stable-backpo=
rt: Backported in 6.6.103"
=20
 CVE_STATUS[CVE-2025-39763] =3D "cpe-stable-backport: Backported in 6.6.1=
03"
=20
-# CVE-2025-39764 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-39764] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-39765] =3D "fixed-version: only affects 6.12 onwards=
"
=20
@@ -18674,7 +18674,7 @@ CVE_STATUS[CVE-2025-39928] =3D "fixed-version: on=
ly affects 6.13 onwards"
=20
 CVE_STATUS[CVE-2025-39929] =3D "cpe-stable-backport: Backported in 6.6.1=
08"
=20
-CVE_STATUS[CVE-2025-39930] =3D "fixed-version: only affects 6.6.130 onwa=
rds"
+CVE_STATUS[CVE-2025-39930] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2025-39931] =3D "cpe-stable-backport: Backported in 6.6.1=
08"
=20
@@ -18776,7 +18776,7 @@ CVE_STATUS[CVE-2025-39979] =3D "fixed-version: on=
ly affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2025-39980] =3D "cpe-stable-backport: Backported in 6.6.1=
09"
=20
-# CVE-2025-39981 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2025-39981] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2025-39982] =3D "cpe-stable-backport: Backported in 6.6.1=
09"
=20
@@ -19082,7 +19082,7 @@ CVE_STATUS[CVE-2025-40133] =3D "fixed-version: on=
ly affects 6.12 onwards"
=20
 CVE_STATUS[CVE-2025-40134] =3D "cpe-stable-backport: Backported in 6.6.1=
12"
=20
-# CVE-2025-40135 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-40135] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2025-40136 needs backporting (fixed from 6.18)
=20
@@ -19110,7 +19110,7 @@ CVE_STATUS[CVE-2025-40148] =3D "fixed-version: on=
ly affects 6.16 onwards"
=20
 CVE_STATUS[CVE-2025-40149] =3D "cpe-stable-backport: Backported in 6.6.1=
21"
=20
-# CVE-2025-40150 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-40150] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-40151] =3D "fixed-version: only affects 6.17 onwards=
"
=20
@@ -19236,7 +19236,7 @@ CVE_STATUS[CVE-2025-40211] =3D "cpe-stable-backpo=
rt: Backported in 6.6.117"
=20
 CVE_STATUS[CVE-2025-40212] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-CVE_STATUS[CVE-2025-40213] =3D "fixed-version: only affects 6.6.140 onwa=
rds"
+# CVE-2025-40213 may need backporting (fixed from 6.7)
=20
 CVE_STATUS[CVE-2025-40214] =3D "cpe-stable-backport: Backported in 6.6.1=
17"
=20
@@ -19248,7 +19248,7 @@ CVE_STATUS[CVE-2025-40217] =3D "fixed-version: on=
ly affects 6.11 onwards"
=20
 CVE_STATUS[CVE-2025-40218] =3D "cpe-stable-backport: Backported in 6.6.1=
13"
=20
-# CVE-2025-40219 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-40219] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2025-40220] =3D "cpe-stable-backport: Backported in 6.6.1=
15"
=20
@@ -19294,7 +19294,7 @@ CVE_STATUS[CVE-2025-40240] =3D "cpe-stable-backpo=
rt: Backported in 6.6.115"
=20
 CVE_STATUS[CVE-2025-40241] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2025-40242 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2025-40242] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2025-40243] =3D "cpe-stable-backport: Backported in 6.6.1=
15"
=20
@@ -19614,7 +19614,7 @@ CVE_STATUS[CVE-2025-68204] =3D "cpe-stable-backpo=
rt: Backported in 6.6.118"
=20
 CVE_STATUS[CVE-2025-68205] =3D "fixed-version: only affects 6.17 onwards=
"
=20
-# CVE-2025-68206 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-68206] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-68207] =3D "fixed-version: only affects 6.12.37 onwa=
rds"
=20
@@ -19678,7 +19678,7 @@ CVE_STATUS[CVE-2025-68237] =3D "cpe-stable-backpo=
rt: Backported in 6.6.118"
=20
 CVE_STATUS[CVE-2025-68238] =3D "cpe-stable-backport: Backported in 6.6.1=
18"
=20
-# CVE-2025-68239 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-68239] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-68240] =3D "fixed-version: only affects 6.12 onwards=
"
=20
@@ -19764,7 +19764,7 @@ CVE_STATUS[CVE-2025-68294] =3D "fixed-version: on=
ly affects 6.15 onwards"
=20
 CVE_STATUS[CVE-2025-68295] =3D "cpe-stable-backport: Backported in 6.6.1=
19"
=20
-# CVE-2025-68296 needs backporting (fixed from 6.18)
+# CVE-2025-68296 may need backporting (fixed from 6.6.143)
=20
 CVE_STATUS[CVE-2025-68297] =3D "cpe-stable-backport: Backported in 6.6.1=
19"
=20
@@ -19802,7 +19802,7 @@ CVE_STATUS[CVE-2025-68313] =3D "fixed-version: on=
ly affects 6.8 onwards"
=20
 CVE_STATUS[CVE-2025-68314] =3D "fixed-version: only affects 6.17 onwards=
"
=20
-# CVE-2025-68315 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2025-68315] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2025-68316] =3D "fixed-version: only affects 6.13 onwards=
"
=20
@@ -19840,7 +19840,7 @@ CVE_STATUS[CVE-2025-68332] =3D "cpe-stable-backpo=
rt: Backported in 6.6.120"
=20
 CVE_STATUS[CVE-2025-68333] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-# CVE-2025-68334 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-68334] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-68335] =3D "cpe-stable-backport: Backported in 6.6.1=
20"
=20
@@ -19958,7 +19958,7 @@ CVE_STATUS[CVE-2025-68734] =3D "cpe-stable-backpo=
rt: Backported in 6.6.117"
=20
 CVE_STATUS[CVE-2025-68735] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2025-68736 needs backporting (fixed from 6.19)
+# CVE-2025-68736 may need backporting (fixed from 6.6.143)
=20
 CVE_STATUS[CVE-2025-68737] =3D "fixed-version: only affects 6.18 onwards=
"
=20
@@ -20022,7 +20022,7 @@ CVE_STATUS[CVE-2025-68766] =3D "cpe-stable-backpo=
rt: Backported in 6.6.120"
=20
 CVE_STATUS[CVE-2025-68767] =3D "cpe-stable-backport: Backported in 6.6.1=
20"
=20
-# CVE-2025-68768 needs backporting (fixed from 6.19)
+# CVE-2025-68768 may need backporting (fixed from 6.6.143)
=20
 CVE_STATUS[CVE-2025-68769] =3D "cpe-stable-backport: Backported in 6.6.1=
20"
=20
@@ -20304,7 +20304,7 @@ CVE_STATUS[CVE-2025-71150] =3D "cpe-stable-backpo=
rt: Backported in 6.6.120"
=20
 CVE_STATUS[CVE-2025-71151] =3D "cpe-stable-backport: Backported in 6.6.1=
20"
=20
-# CVE-2025-71152 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71152] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-71153] =3D "cpe-stable-backport: Backported in 6.6.1=
20"
=20
@@ -20322,7 +20322,7 @@ CVE_STATUS[CVE-2025-71159] =3D "fixed-version: on=
ly affects 6.18 onwards"
=20
 CVE_STATUS[CVE-2025-71160] =3D "cpe-stable-backport: Backported in 6.6.1=
21"
=20
-# CVE-2025-71161 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71161] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-71162] =3D "cpe-stable-backport: Backported in 6.6.1=
22"
=20
@@ -20336,7 +20336,7 @@ CVE_STATUS[CVE-2025-71182] =3D "cpe-stable-backpo=
rt: Backported in 6.6.121"
=20
 CVE_STATUS[CVE-2025-71183] =3D "cpe-stable-backport: Backported in 6.6.1=
21"
=20
-# CVE-2025-71184 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71184] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-71185] =3D "cpe-stable-backport: Backported in 6.6.1=
22"
=20
@@ -20374,13 +20374,13 @@ CVE_STATUS[CVE-2025-71201] =3D "fixed-version: =
only affects 6.14 onwards"
=20
 # CVE-2025-71202 needs backporting (fixed from 6.19)
=20
-# CVE-2025-71203 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71203] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-71204] =3D "cpe-stable-backport: Backported in 6.6.1=
24"
=20
 CVE_STATUS[CVE-2025-71220] =3D "cpe-stable-backport: Backported in 6.6.1=
24"
=20
-# CVE-2025-71221 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71221] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2025-71222] =3D "cpe-stable-backport: Backported in 6.6.1=
24"
=20
@@ -20412,17 +20412,17 @@ CVE_STATUS[CVE-2025-71237] =3D "cpe-stable-back=
port: Backported in 6.6.125"
=20
 CVE_STATUS[CVE-2025-71238] =3D "cpe-stable-backport: Backported in 6.6.1=
27"
=20
-# CVE-2025-71239 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71239] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2025-71265 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71265] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2025-71266 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71266] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2025-71267 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71267] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2025-71268] =3D "cpe-stable-backport: Backported in 6.6.1=
24"
=20
-# CVE-2025-71269 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2025-71269] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2025-71270] =3D "cpe-stable-backport: Backported in 6.6.1=
24"
=20
@@ -20432,33 +20432,33 @@ CVE_STATUS[CVE-2025-71271] =3D "fixed-version: =
only affects 6.13 onwards"
=20
 # CVE-2025-71273 needs backporting (fixed from 7.0)
=20
-# CVE-2025-71274 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71274] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2025-71285 needs backporting (fixed from 7.0)
=20
-# CVE-2025-71286 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71286] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2025-71287 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71287] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2025-71288 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71288] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2025-71289 needs backporting (fixed from 7.0)
=20
 CVE_STATUS[CVE-2025-71290] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2025-71291 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71291] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2025-71292 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71292] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2025-71293] =3D "fixed-version: only affects 6.18 onwards=
"
=20
 CVE_STATUS[CVE-2025-71294] =3D "fixed-version: only affects 6.7 onwards"
=20
-# CVE-2025-71295 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71295] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2025-71296] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2025-71297 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71297] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2025-71298] =3D "fixed-version: only affects 6.16 onwards=
"
=20
@@ -20470,6 +20470,30 @@ CVE_STATUS[CVE-2025-71301] =3D "fixed-version: o=
nly affects 6.16 onwards"
=20
 CVE_STATUS[CVE-2025-71302] =3D "fixed-version: only affects 6.10 onwards=
"
=20
+CVE_STATUS[CVE-2025-71303] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2025-71304] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2025-71305] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2025-71306] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2025-71307] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2025-71308] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2025-71309] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2025-71311] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2025-71312] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2025-71313 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2025-71314] =3D "fixed-version: only affects 6.10 onwards=
"
+
+# CVE-2025-71315 needs backporting (fixed from 6.19)
+
 CVE_STATUS[CVE-2026-22976] =3D "cpe-stable-backport: Backported in 6.6.1=
21"
=20
 CVE_STATUS[CVE-2026-22977] =3D "cpe-stable-backport: Backported in 6.6.1=
21"
@@ -20526,7 +20550,7 @@ CVE_STATUS[CVE-2026-23002] =3D "fixed-version: on=
ly affects 6.12 onwards"
=20
 CVE_STATUS[CVE-2026-23003] =3D "cpe-stable-backport: Backported in 6.6.1=
22"
=20
-# CVE-2026-23004 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23004] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23005] =3D "cpe-stable-backport: Backported in 6.6.1=
22"
=20
@@ -20618,13 +20642,13 @@ CVE_STATUS[CVE-2026-23048] =3D "fixed-version: =
only affects 6.18 onwards"
=20
 CVE_STATUS[CVE-2026-23049] =3D "cpe-stable-backport: Backported in 6.6.1=
22"
=20
-# CVE-2026-23050 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23050] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23051] =3D "fixed-version: only affects 6.14 onwards=
"
=20
 CVE_STATUS[CVE-2026-23052] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-23053 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23053] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23054] =3D "cpe-stable-backport: Backported in 6.6.1=
22"
=20
@@ -20650,7 +20674,7 @@ CVE_STATUS[CVE-2026-23064] =3D "cpe-stable-backpo=
rt: Backported in 6.6.122"
=20
 CVE_STATUS[CVE-2026-23065] =3D "fixed-version: only affects 6.8 onwards"
=20
-# CVE-2026-23066 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23066] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23067] =3D "fixed-version: only affects 6.16 onwards=
"
=20
@@ -20754,7 +20778,7 @@ CVE_STATUS[CVE-2026-23116] =3D "cpe-stable-backpo=
rt: Backported in 6.6.122"
=20
 CVE_STATUS[CVE-2026-23117] =3D "fixed-version: only affects 6.18.2 onwar=
ds"
=20
-# CVE-2026-23118 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23118] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23119] =3D "cpe-stable-backport: Backported in 6.6.1=
22"
=20
@@ -20794,7 +20818,7 @@ CVE_STATUS[CVE-2026-23136] =3D "cpe-stable-backpo=
rt: Backported in 6.6.121"
=20
 # CVE-2026-23137 needs backporting (fixed from 6.19)
=20
-# CVE-2026-23138 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23138] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23139] =3D "cpe-stable-backport: Backported in 6.6.1=
21"
=20
@@ -20826,13 +20850,13 @@ CVE_STATUS[CVE-2026-23152] =3D "fixed-version: =
only affects 6.7 onwards"
=20
 CVE_STATUS[CVE-2026-23153] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-23154 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23154] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23155] =3D "cpe-stable-backport: Backported in 6.6.1=
23"
=20
 CVE_STATUS[CVE-2026-23156] =3D "cpe-stable-backport: Backported in 6.6.1=
23"
=20
-# CVE-2026-23157 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23157] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23158] =3D "fixed-version: only affects 6.11 onwards=
"
=20
@@ -20860,7 +20884,7 @@ CVE_STATUS[CVE-2026-23169] =3D "cpe-stable-backpo=
rt: Backported in 6.6.125"
=20
 CVE_STATUS[CVE-2026-23170] =3D "cpe-stable-backport: Backported in 6.6.1=
23"
=20
-# CVE-2026-23171 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-23171] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2026-23172] =3D "cpe-stable-backport: Backported in 6.6.1=
23"
=20
@@ -20972,7 +20996,7 @@ CVE_STATUS[CVE-2026-23225] =3D "fixed-version: on=
ly affects 6.19 onwards"
=20
 # CVE-2026-23226 needs backporting (fixed from 7.0)
=20
-# CVE-2026-23227 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23227] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23228] =3D "cpe-stable-backport: Backported in 6.6.1=
25"
=20
@@ -20980,7 +21004,7 @@ CVE_STATUS[CVE-2026-23229] =3D "cpe-stable-backpo=
rt: Backported in 6.6.125"
=20
 CVE_STATUS[CVE-2026-23230] =3D "cpe-stable-backport: Backported in 6.6.1=
25"
=20
-# CVE-2026-23231 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-23231] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-23232] =3D "fixed-version: only affects 6.19 onwards=
"
=20
@@ -21002,15 +21026,15 @@ CVE_STATUS[CVE-2026-23238] =3D "cpe-stable-back=
port: Backported in 6.6.127"
=20
 CVE_STATUS[CVE-2026-23241] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2026-23242 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-23242] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-23243 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-23243] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-23244 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23244] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23245 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23245] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23246 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23246] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2026-23247 needs backporting (fixed from 7.0)
=20
@@ -21024,11 +21048,11 @@ CVE_STATUS[CVE-2026-23251] =3D "fixed-version: =
only affects 6.10 onwards"
=20
 CVE_STATUS[CVE-2026-23252] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2026-23253 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23253] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23254] =3D "cpe-stable-backport: Backported in 6.6.1=
24"
=20
-# CVE-2026-23255 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23255] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-23256] =3D "cpe-stable-backport: Backported in 6.6.1=
24"
=20
@@ -21054,119 +21078,119 @@ CVE_STATUS[CVE-2026-23266] =3D "cpe-stable-ba=
ckport: Backported in 6.6.127"
=20
 CVE_STATUS[CVE-2026-23267] =3D "cpe-stable-backport: Backported in 6.6.1=
27"
=20
-# CVE-2026-23268 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23268] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23269 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23269] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23270 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23270] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23271 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23271] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23272 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-23272] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
=20
-# CVE-2026-23273 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-23273] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-23274 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23274] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23275] =3D "fixed-version: only affects 6.13 onwards=
"
=20
 # CVE-2026-23276 needs backporting (fixed from 7.0)
=20
-# CVE-2026-23277 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23277] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23278 needs backporting (fixed from 7.0)
+# CVE-2026-23278 may need backporting (fixed from 6.6.144)
=20
-# CVE-2026-23279 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23279] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23280] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-23281 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23281] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23282] =3D "fixed-version: only affects 6.17 onwards=
"
=20
 CVE_STATUS[CVE-2026-23283] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-23284 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23284] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23285 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23285] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23286 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23286] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23287 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23287] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23288] =3D "fixed-version: only affects 6.19.4 onwar=
ds"
=20
-# CVE-2026-23289 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23289] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23290 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23290] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23291 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23291] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23292 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23292] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23293 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23293] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23294] =3D "fixed-version: only affects 6.18 onwards=
"
=20
 CVE_STATUS[CVE-2026-23295] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-23296 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23296] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23297] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2026-23298 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23298] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23299] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-23300 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23300] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23301] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-23302 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23302] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-23303 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23303] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23304 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23304] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23305] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-23306 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23306] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23307 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23307] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23308 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23308] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23309 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23309] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23310 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23310] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23311] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-23312 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23312] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23313 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23313] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-23314] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-23315 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23315] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23316] =3D "fixed-version: only affects 6.11 onwards=
"
=20
-# CVE-2026-23317 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23317] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23318 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23318] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23319 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23319] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23321 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23321] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23322] =3D "fixed-version: only affects 6.18 onwards=
"
=20
 CVE_STATUS[CVE-2026-23323] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-23324 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23324] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23325 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23325] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23326] =3D "fixed-version: only affects 6.13 onwards=
"
=20
@@ -21176,39 +21200,39 @@ CVE_STATUS[CVE-2026-23328] =3D "fixed-version: =
only affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2026-23329] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-23330 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23330] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-23331] =3D "fixed-version: only affects 6.13 onwards=
"
=20
 CVE_STATUS[CVE-2026-23332] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-23334 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23334] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23335 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23335] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23336 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23336] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23337] =3D "fixed-version: only affects 6.19 onwards=
"
=20
 CVE_STATUS[CVE-2026-23338] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-23339 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23339] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23340 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23340] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23341] =3D "fixed-version: only affects 6.19.4 onwar=
ds"
=20
 CVE_STATUS[CVE-2026-23342] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-23343 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23343] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23344] =3D "fixed-version: only affects 6.19 onwards=
"
=20
 CVE_STATUS[CVE-2026-23345] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2026-23346 needs backporting (fixed from 7.0)
+# CVE-2026-23346 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-23347 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23347] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2026-23348 needs backporting (fixed from 7.0)
=20
@@ -21216,9 +21240,9 @@ CVE_STATUS[CVE-2026-23349] =3D "fixed-version: on=
ly affects 6.18 onwards"
=20
 CVE_STATUS[CVE-2026-23350] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-23351 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23351] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23352 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23352] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23353] =3D "fixed-version: only affects 6.19 onwards=
"
=20
@@ -21226,43 +21250,43 @@ CVE_STATUS[CVE-2026-23354] =3D "fixed-version: =
only affects 6.9 onwards"
=20
 CVE_STATUS[CVE-2026-23355] =3D "fixed-version: only affects 6.18.14 onwa=
rds"
=20
-# CVE-2026-23356 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23356] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23357 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23357] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23358] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-23359 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23359] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23360 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-23360] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 # CVE-2026-23361 needs backporting (fixed from 7.0)
=20
-# CVE-2026-23362 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23362] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23363] =3D "fixed-version: only affects 6.7 onwards"
=20
-# CVE-2026-23364 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23364] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23365 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23365] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23366] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-23367 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23367] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23368 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23368] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23369] =3D "fixed-version: only affects 6.7 onwards"
=20
-# CVE-2026-23370 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23370] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2026-23371 needs backporting (fixed from 7.0)
=20
-# CVE-2026-23372 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23372] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23373] =3D "fixed-version: only affects 6.9 onwards"
=20
-# CVE-2026-23374 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23374] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-23375] =3D "fixed-version: only affects 6.8 onwards"
=20
@@ -21270,15 +21294,15 @@ CVE_STATUS[CVE-2026-23376] =3D "fixed-version: =
only affects 6.17.3 onwards"
=20
 # CVE-2026-23377 needs backporting (fixed from 7.0)
=20
-# CVE-2026-23378 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23378] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23379 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23379] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23380] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2026-23381 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23381] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23382 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23382] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2026-23383 needs backporting (fixed from 7.0)
=20
@@ -21286,63 +21310,63 @@ CVE_STATUS[CVE-2026-23384] =3D "fixed-version: =
only affects 6.18 onwards"
=20
 CVE_STATUS[CVE-2026-23385] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2026-23386 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23386] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23387 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23387] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23388 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23388] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23389 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23389] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-23390] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-# CVE-2026-23391 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23391] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23392 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23392] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2026-23393 needs backporting (fixed from 7.0)
=20
-# CVE-2026-23394 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-23394] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
=20
-# CVE-2026-23395 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23395] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23396 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23396] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23397 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23397] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23398 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23398] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23399 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23399] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-23400] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-23401 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-23401] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-23402] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-23403 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23403] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23404 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23404] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23405 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23405] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23406 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23406] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23407 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23407] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23408 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23408] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23409 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23409] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23410 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23410] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23411 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23411] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23412 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23412] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23413 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23413] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23414 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-23414] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-23415] =3D "fixed-version: only affects 6.16 onwards=
"
=20
@@ -21352,13 +21376,13 @@ CVE_STATUS[CVE-2026-23417] =3D "fixed-version: =
only affects 6.9 onwards"
=20
 CVE_STATUS[CVE-2026-23418] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2026-23419 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23419] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23420 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23420] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23421] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-23422 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23422] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23423] =3D "fixed-version: only affects 6.13 onwards=
"
=20
@@ -21366,11 +21390,11 @@ CVE_STATUS[CVE-2026-23424] =3D "fixed-version: =
only affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2026-23425] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2026-23426 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23426] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23427 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23427] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23428 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23428] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23429] =3D "fixed-version: only affects 6.18.7 onwar=
ds"
=20
@@ -21382,7 +21406,7 @@ CVE_STATUS[CVE-2026-23432] =3D "fixed-version: on=
ly affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-23433] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-23434 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23434] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23435] =3D "fixed-version: only affects 6.18.2 onwar=
ds"
=20
@@ -21390,67 +21414,67 @@ CVE_STATUS[CVE-2026-23436] =3D "fixed-version: =
only affects 6.13 onwards"
=20
 CVE_STATUS[CVE-2026-23437] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2026-23438 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23438] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23439 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23439] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23440 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23440] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23441 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23441] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23442 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23442] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-23443 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23443] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23444 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23444] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-23445] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2026-23446 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23446] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23447 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23447] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23448 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23448] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23449 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23449] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23450 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23450] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23451] =3D "fixed-version: only affects 6.18.19 onwa=
rds"
=20
-# CVE-2026-23452 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23452] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23453] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-23454 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23454] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23455 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23455] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23456 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23456] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23457 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23457] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23458 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23458] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23459] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2026-23460 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23460] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23461 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23461] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23462 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23462] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23463 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23463] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23464] =3D "fixed-version: only affects 6.8 onwards"
=20
-# CVE-2026-23465 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23465] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-23466] =3D "fixed-version: only affects 6.12 onwards=
"
=20
 CVE_STATUS[CVE-2026-23467] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-23468 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-23468] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2026-23469] =3D "fixed-version: only affects 6.8 onwards"
=20
@@ -21458,101 +21482,101 @@ CVE_STATUS[CVE-2026-23470] =3D "fixed-version=
: only affects 6.8 onwards"
=20
 # CVE-2026-23472 needs backporting (fixed from 7.0)
=20
-# CVE-2026-23474 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23474] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-23475 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23475] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31389 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31389] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31390] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-31391 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31391] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31392 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31392] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31393 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31393] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31394] =3D "fixed-version: only affects 6.11 onwards=
"
=20
 CVE_STATUS[CVE-2026-31395] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2026-31396 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31396] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31397] =3D "fixed-version: only affects 6.16 onwards=
"
=20
 CVE_STATUS[CVE-2026-31398] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-31399 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31399] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31400 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31400] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31401] =3D "fixed-version: only affects 6.11 onwards=
"
=20
-# CVE-2026-31402 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31402] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31403 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31403] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31404] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2026-31405 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31405] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31406] =3D "fixed-version: only affects 6.11 onwards=
"
=20
-# CVE-2026-31407 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31407] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31408 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31408] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31409 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31409] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2026-31410 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31411 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-31411] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-31412 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31412] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31413] =3D "fixed-version: only affects 6.12.75 onwa=
rds"
=20
-# CVE-2026-31414 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31414] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31415 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31415] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31416 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31416] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31417 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31417] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31418 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31418] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31419 needs backporting (fixed from 7.0)
+# CVE-2026-31419 may need backporting (fixed from 6.6.143)
=20
 # CVE-2026-31420 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31421 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31421] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31422 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31422] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31423 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31423] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31424 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31424] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31425 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31425] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31426 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31426] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31427 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31427] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31428 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31428] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31429 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31429] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31430 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31430] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31431 may need backporting (fixed from 6.6.137)
+CVE_STATUS[CVE-2026-31431] =3D "cpe-stable-backport: Backported in 6.6.1=
37"
=20
-# CVE-2026-31432 needs backporting (fixed from 7.0)
+# CVE-2026-31432 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-31433 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31433] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31434 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31434] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31435] =3D "fixed-version: only affects 6.12 onwards=
"
=20
@@ -21562,45 +21586,45 @@ CVE_STATUS[CVE-2026-31437] =3D "fixed-version: =
only affects 6.18.17 onwards"
=20
 CVE_STATUS[CVE-2026-31438] =3D "fixed-version: only affects 6.8 onwards"
=20
-# CVE-2026-31439 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31439] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31440 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31440] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-31441 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31441] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31442] =3D "fixed-version: only affects 6.14 onwards=
"
=20
 CVE_STATUS[CVE-2026-31443] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-CVE_STATUS[CVE-2026-31444] =3D "fixed-version: only affects 6.6.130 onwa=
rds"
+CVE_STATUS[CVE-2026-31444] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31445] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-31446 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31446] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31447 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31447] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31448 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31448] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31449 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31449] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-31450 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31450] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31451 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31451] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31452 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31452] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31453 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31453] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31454 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31454] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31455 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31455] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31456] =3D "fixed-version: only affects 6.12 onwards=
"
=20
 CVE_STATUS[CVE-2026-31457] =3D "fixed-version: only affects 6.17 onwards=
"
=20
-# CVE-2026-31458 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31458] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31459] =3D "fixed-version: only affects 6.17.6 onwar=
ds"
=20
@@ -21612,17 +21636,17 @@ CVE_STATUS[CVE-2026-31461] =3D "fixed-version: =
only affects 6.13 onwards"
=20
 CVE_STATUS[CVE-2026-31463] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31464 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31464] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31465] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-31466 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31466] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31467 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31467] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31468] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31469 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31469] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31470] =3D "fixed-version: only affects 6.7 onwards"
=20
@@ -21630,117 +21654,117 @@ CVE_STATUS[CVE-2026-31471] =3D "fixed-version=
: only affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2026-31472] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2026-31473 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31473] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31474 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31474] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31475] =3D "fixed-version: only affects 6.14.9 onwar=
ds"
=20
-# CVE-2026-31476 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31476] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31477 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31477] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31478 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31478] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31479] =3D "fixed-version: only affects 6.8 onwards"
=20
-# CVE-2026-31480 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31480] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31481] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31482 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31482] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31483 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31483] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31484] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31485 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31485] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31486 needs backporting (fixed from 7.0)
+# CVE-2026-31486 may need backporting (fixed from 6.6.143)
=20
 # CVE-2026-31487 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31488 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31488] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-31489 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31489] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2026-31490] =3D "fixed-version: only affects 6.19 onwards=
"
=20
 CVE_STATUS[CVE-2026-31491] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-31492 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31492] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 # CVE-2026-31493 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31494 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31494] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31495 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31495] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31496 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31496] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31497 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31497] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31498 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31498] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31499] =3D "fixed-version: only affects 6.12.20 onwa=
rds"
=20
-# CVE-2026-31500 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31500] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31501] =3D "fixed-version: only affects 6.15 onwards=
"
=20
 # CVE-2026-31502 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31503 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31503] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31504 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31504] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 # CVE-2026-31505 needs backporting (fixed from 7.0)
=20
 # CVE-2026-31506 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31507 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31507] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31508 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31508] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31509 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31509] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31510 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31510] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31511] =3D "fixed-version: only affects 6.12.59 onwa=
rds"
=20
-# CVE-2026-31512 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31512] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31513] =3D "fixed-version: only affects 6.12.75 onwa=
rds"
=20
 CVE_STATUS[CVE-2026-31514] =3D "fixed-version: only affects 6.12.75 onwa=
rds"
=20
-# CVE-2026-31515 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31515] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 # CVE-2026-31516 needs backporting (fixed from 7.0)
=20
 CVE_STATUS[CVE-2026-31517] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2026-31518 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31518] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31519 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31519] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31520 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31520] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31521 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31521] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31522 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31522] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31523 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31523] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31524 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31524] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31525 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31525] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31526] =3D "fixed-version: only affects 6.7 onwards"
=20
-# CVE-2026-31527 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31527] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
=20
-# CVE-2026-31528 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31528] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31529] =3D "fixed-version: only affects 6.19 onwards=
"
=20
@@ -21748,9 +21772,9 @@ CVE_STATUS[CVE-2026-31529] =3D "fixed-version: on=
ly affects 6.19 onwards"
=20
 # CVE-2026-31531 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31532 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31532] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31533 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31533] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2026-31535] =3D "fixed-version: only affects 6.18 onwards=
"
=20
@@ -21762,37 +21786,37 @@ CVE_STATUS[CVE-2026-31538] =3D "fixed-version: =
only affects 6.18 onwards"
=20
 CVE_STATUS[CVE-2026-31539] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-31540 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31540] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31541] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-31542 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31542] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31543] =3D "fixed-version: only affects 6.16 onwards=
"
=20
 CVE_STATUS[CVE-2026-31544] =3D "fixed-version: only affects 6.17 onwards=
"
=20
-# CVE-2026-31545 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31545] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31546 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31546] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31547] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31548 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31548] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31549 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31549] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31550 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31550] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31551 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31551] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31552 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31552] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-31553] =3D "fixed-version: only affects 6.19 onwards=
"
=20
 CVE_STATUS[CVE-2026-31554] =3D "fixed-version: only affects 6.7 onwards"
=20
-# CVE-2026-31555 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31555] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31556] =3D "fixed-version: only affects 6.8 onwards"
=20
@@ -21808,13 +21832,13 @@ CVE_STATUS[CVE-2026-31561] =3D "fixed-version: =
only affects 6.9 onwards"
=20
 CVE_STATUS[CVE-2026-31562] =3D "fixed-version: only affects 6.9 onwards"
=20
-# CVE-2026-31563 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31563] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31564] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31565 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31565] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31566 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31566] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31567] =3D "fixed-version: only affects 6.17.8 onwar=
ds"
=20
@@ -21822,7 +21846,7 @@ CVE_STATUS[CVE-2026-31567] =3D "fixed-version: on=
ly affects 6.17.8 onwards"
=20
 CVE_STATUS[CVE-2026-31569] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2026-31570 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31570] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-31571] =3D "fixed-version: only affects 6.15 onwards=
"
=20
@@ -21834,113 +21858,113 @@ CVE_STATUS[CVE-2026-31574] =3D "fixed-version=
: only affects 7.0 onwards"
=20
 CVE_STATUS[CVE-2026-31575] =3D "fixed-version: only affects 6.7 onwards"
=20
-# CVE-2026-31576 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31576] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31577 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31577] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31578 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31578] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31579 needs backporting (fixed from 7.1rc1)
+# CVE-2026-31579 needs backporting (fixed from 7.1)
=20
-# CVE-2026-31580 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31580] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31581 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31581] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-31582] =3D "fixed-version: only affects 6.7 onwards"
=20
-# CVE-2026-31583 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31583] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31584 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31584] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31585 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31585] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31586 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31586] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31587 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31587] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31588 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31588] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-31589] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2026-31590 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31590] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-31591] =3D "fixed-version: only affects 6.11 onwards=
"
=20
-# CVE-2026-31592 needs backporting (fixed from 7.1rc1)
+# CVE-2026-31592 needs backporting (fixed from 7.1)
=20
 CVE_STATUS[CVE-2026-31593] =3D "fixed-version: only affects 6.11 onwards=
"
=20
-# CVE-2026-31594 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31594] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31595 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31595] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31596 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31596] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31597 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31597] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31598 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31598] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31599 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31599] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-31600] =3D "fixed-version: only affects 6.18 onwards=
"
=20
 CVE_STATUS[CVE-2026-31601] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31602 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31602] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31603 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31603] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31604 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31604] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31605 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31605] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31606 needs backporting (fixed from 7.1rc1)
+# CVE-2026-31606 needs backporting (fixed from 7.1)
=20
-# CVE-2026-31607 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31607] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-31608] =3D "fixed-version: only affects 6.18.11 onwa=
rds"
=20
 CVE_STATUS[CVE-2026-31609] =3D "fixed-version: only affects 6.18.11 onwa=
rds"
=20
-# CVE-2026-31610 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31610] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31611 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31611] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31612 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31612] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31613 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-31613] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
=20
-# CVE-2026-31614 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31614] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31615 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31615] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31616 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31616] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31617 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31617] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31618 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31618] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31619 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31619] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-31620] =3D "fixed-version: only affects 6.18 onwards=
"
=20
 CVE_STATUS[CVE-2026-31621] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31622 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31622] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31623 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31623] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31624 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31624] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31625 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31625] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31626 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31626] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31627 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31627] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31628 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31628] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31629 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31629] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 # CVE-2026-31630 needs backporting (fixed from 7.0)
=20
@@ -21950,23 +21974,23 @@ CVE_STATUS[CVE-2026-31632] =3D "fixed-version: =
only affects 6.16 onwards"
=20
 CVE_STATUS[CVE-2026-31633] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-31634 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31634] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2026-31635] =3D "fixed-version: only affects 6.16 onwards=
"
=20
 CVE_STATUS[CVE-2026-31636] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-31637 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31637] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31638 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31638] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31639 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31639] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2026-31640] =3D "fixed-version: only affects 6.16 onwards=
"
=20
 CVE_STATUS[CVE-2026-31641] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-31642 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31642] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2026-31643] =3D "fixed-version: only affects 6.16 onwards=
"
=20
@@ -21974,17 +21998,17 @@ CVE_STATUS[CVE-2026-31644] =3D "fixed-version: =
only affects 6.12 onwards"
=20
 # CVE-2026-31645 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31646 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31646] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2026-31647] =3D "fixed-version: only affects 6.9 onwards"
=20
-# CVE-2026-31648 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31648] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31649 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31649] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2026-31650] =3D "fixed-version: only affects 6.17 onwards=
"
=20
-# CVE-2026-31651 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31651] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2026-31652] =3D "fixed-version: only affects 6.17 onwards=
"
=20
@@ -21992,75 +22016,73 @@ CVE_STATUS[CVE-2026-31653] =3D "fixed-version: =
only affects 6.17 onwards"
=20
 CVE_STATUS[CVE-2026-31654] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31655 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31655] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31656 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31656] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31657 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31657] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31658 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31658] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31659 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31659] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31660 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31660] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31661 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31661] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31662 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31662] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 # CVE-2026-31663 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31664 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31664] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31665 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31665] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2026-31666] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2026-31667 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31667] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31668 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31668] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31669 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31669] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31670 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31670] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31671 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31671] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31672 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31672] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
-# CVE-2026-31673 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31673] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31674 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31674] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31675 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31675] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31676 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31676] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 # CVE-2026-31677 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31678 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31678] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31679 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31679] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-31680 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31680] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31681 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31681] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31682 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31682] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31683 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31683] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-31684 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31684] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31685 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31685] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31686 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31686] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-31687] =3D "cpe-stable-backport: Backported in 6.6.1=
26"
=20
-# CVE-2026-31688 needs backporting (fixed from 7.0)
-
-# CVE-2026-31689 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31689] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2026-31690] =3D "fixed-version: only affects 6.15 onwards=
"
=20
@@ -22068,63 +22090,63 @@ CVE_STATUS[CVE-2026-31691] =3D "fixed-version: =
only affects 6.14 onwards"
=20
 # CVE-2026-31692 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31693 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-31693] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-31694 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31694] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-31695 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31695] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31696 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31696] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31697 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31697] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31698 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31698] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31699 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31699] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31700 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31700] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31701 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31701] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31702 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31702] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-31703] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-31704 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31704] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31705 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31705] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31706 needs backporting (fixed from 7.1rc1)
+# CVE-2026-31706 needs backporting (fixed from 7.1)
=20
-# CVE-2026-31707 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-31707] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
=20
-# CVE-2026-31708 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31708] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31709 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31709] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2026-31710] =3D "fixed-version: only affects 7.0 onwards"
=20
-# CVE-2026-31711 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31711] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31712 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31712] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2026-31713] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-31714 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31714] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31715 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31715] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-31716 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31716] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-31717 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-31717] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
=20
-# CVE-2026-31718 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31718] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2026-31719] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-31720 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31720] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31721 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31721] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 # CVE-2026-31722 needs backporting (fixed from 7.0)
=20
@@ -22134,15 +22156,15 @@ CVE_STATUS[CVE-2026-31719] =3D "fixed-version: =
only affects 6.15 onwards"
=20
 # CVE-2026-31725 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31726 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31726] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31727] =3D "fixed-version: only affects 6.12.78 onwa=
rds"
=20
-# CVE-2026-31728 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31728] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 # CVE-2026-31729 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31730 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31730] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31731] =3D "fixed-version: only affects 6.8 onwards"
=20
@@ -22156,15 +22178,15 @@ CVE_STATUS[CVE-2026-31735] =3D "fixed-version: =
only affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-31736] =3D "fixed-version: only affects 6.11 onwards=
"
=20
-# CVE-2026-31737 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31737] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31738 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31738] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31739] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2026-31740 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31740] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31741 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31741] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31742] =3D "fixed-version: only affects 6.18.20 onwa=
rds"
=20
@@ -22176,39 +22198,39 @@ CVE_STATUS[CVE-2026-31745] =3D "fixed-version: =
only affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-31746] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-31747 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31747] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31748 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31748] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31749 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31749] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31750] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31751 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31751] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31752 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31752] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31753] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31754 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31754] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31755 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31755] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31756 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31756] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31757] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-31758 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31758] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31759 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31759] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31760] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2026-31761 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31761] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31762 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31762] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31763 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31763] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31764] =3D "fixed-version: only affects 6.19 onwards=
"
=20
@@ -22218,17 +22240,17 @@ CVE_STATUS[CVE-2026-31766] =3D "fixed-version: =
only affects 6.16 onwards"
=20
 # CVE-2026-31767 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31768 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31768] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31769] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2026-31770 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31770] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 # CVE-2026-31771 needs backporting (fixed from 7.0)
=20
 CVE_STATUS[CVE-2026-31772] =3D "fixed-version: only affects 6.12.2 onwar=
ds"
=20
-# CVE-2026-31773 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31773] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31774] =3D "fixed-version: only affects 6.10 onwards=
"
=20
@@ -22238,13 +22260,13 @@ CVE_STATUS[CVE-2026-31776] =3D "fixed-version: =
only affects 6.19 onwards"
=20
 # CVE-2026-31777 needs backporting (fixed from 7.0)
=20
-# CVE-2026-31778 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31778] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31779 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31779] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31780 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31780] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-31781 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31781] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-31782] =3D "fixed-version: only affects 6.16 onwards=
"
=20
@@ -22254,11 +22276,11 @@ CVE_STATUS[CVE-2026-31784] =3D "fixed-version: =
only affects 6.17 onwards"
=20
 CVE_STATUS[CVE-2026-31785] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-31786 may need backporting (fixed from 6.6.137)
+CVE_STATUS[CVE-2026-31786] =3D "cpe-stable-backport: Backported in 6.6.1=
37"
=20
-# CVE-2026-31787 may need backporting (fixed from 6.6.137)
+CVE_STATUS[CVE-2026-31787] =3D "cpe-stable-backport: Backported in 6.6.1=
37"
=20
-# CVE-2026-31788 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31788] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43004] =3D "fixed-version: only affects 6.15 onwards=
"
=20
@@ -22266,181 +22288,181 @@ CVE_STATUS[CVE-2026-43005] =3D "fixed-version=
: only affects 6.17 onwards"
=20
 CVE_STATUS[CVE-2026-43006] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43007 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43007] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-43008] =3D "fixed-version: only affects 6.19 onwards=
"
=20
 # CVE-2026-43009 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43010 needs backporting (fixed from 7.0)
+# CVE-2026-43010 may need backporting (fixed from 6.6.144)
=20
-# CVE-2026-43011 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43011] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-43012] =3D "fixed-version: only affects 6.12.9 onwar=
ds"
=20
-# CVE-2026-43013 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43013] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43014 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43014] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43015 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43015] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43016 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43016] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43017 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43017] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43018 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43018] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43019 needs backporting (fixed from 7.0)
+# CVE-2026-43019 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43020 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43020] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-43021] =3D "fixed-version: only affects 6.19 onwards=
"
=20
 # CVE-2026-43022 may need backporting (fixed from 6.7)
=20
-# CVE-2026-43023 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43023] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43024 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43024] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43025 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43025] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43026 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43026] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43027 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43027] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43028 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43028] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 # CVE-2026-43029 may need backporting (fixed from 6.7)
=20
-# CVE-2026-43030 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43030] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-43031] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43032 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43032] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43033 may need backporting (fixed from 6.6.137)
+CVE_STATUS[CVE-2026-43033] =3D "cpe-stable-backport: Backported in 6.6.1=
37"
=20
 CVE_STATUS[CVE-2026-43034] =3D "fixed-version: only affects 6.8 onwards"
=20
-# CVE-2026-43035 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43035] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 # CVE-2026-43036 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43037 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43037] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43038 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43038] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-43039] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43040 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43040] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43041 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43041] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 # CVE-2026-43042 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43043 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43043] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43044 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43044] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-43045] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43046 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43046] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43047 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43047] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 # CVE-2026-43048 needs backporting (fixed from 7.0)
=20
 # CVE-2026-43049 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43050 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43050] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43051 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43051] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43052 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43052] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
=20
 # CVE-2026-43053 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43054 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43054] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-43055] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-43056 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43056] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43057 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43057] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43058 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43058] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-43059] =3D "fixed-version: only affects 6.12.59 onwa=
rds"
=20
-# CVE-2026-43060 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43060] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43061 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43061] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43062 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43062] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43063] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2026-43064 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-43064] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-43065 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-43065] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-43066 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-43066] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-43067 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43067] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43068 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-43068] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
-# CVE-2026-43069 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-43069] =3D "cpe-stable-backport: Backported in 6.6.1=
31"
=20
 CVE_STATUS[CVE-2026-43070] =3D "fixed-version: only affects 6.18.17 onwa=
rds"
=20
-# CVE-2026-43071 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43071] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43072 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43072] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43073 needs backporting (fixed from 7.1rc1)
+# CVE-2026-43073 needs backporting (fixed from 7.1)
=20
-# CVE-2026-43074 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43074] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43075 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43075] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43076 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43076] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43077 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43077] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43078 may need backporting (fixed from 6.6.137)
+CVE_STATUS[CVE-2026-43078] =3D "cpe-stable-backport: Backported in 6.6.1=
37"
=20
-# CVE-2026-43079 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43079] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43080 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43080] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43081 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43081] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43082 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43082] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 # CVE-2026-43083 needs backporting (fixed from 7.0)
=20
 CVE_STATUS[CVE-2026-43084] =3D "fixed-version: only affects 6.12.75 onwa=
rds"
=20
-# CVE-2026-43085 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43085] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43086 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43086] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-43087] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43088 needs backporting (fixed from 7.0)
+# CVE-2026-43088 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43089 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43089] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-43090] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-# CVE-2026-43091 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43091] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43092 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43092] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43093 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43093] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43094 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43094] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-43095] =3D "fixed-version: only affects 6.17 onwards=
"
=20
@@ -22448,9 +22470,9 @@ CVE_STATUS[CVE-2026-43096] =3D "fixed-version: on=
ly affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-43097] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43098 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43098] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43099 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43099] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-43100] =3D "fixed-version: only affects 6.18 onwards=
"
=20
@@ -22458,11 +22480,11 @@ CVE_STATUS[CVE-2026-43100] =3D "fixed-version: =
only affects 6.18 onwards"
=20
 CVE_STATUS[CVE-2026-43102] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43103 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43103] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43104 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43104] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43105 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43105] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-43106] =3D "fixed-version: only affects 6.19 onwards=
"
=20
@@ -22470,37 +22492,35 @@ CVE_STATUS[CVE-2026-43106] =3D "fixed-version: =
only affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-43108] =3D "fixed-version: only affects 6.11 onwards=
"
=20
-# CVE-2026-43109 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43109] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-43110 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43110] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43111 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43111] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43112 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43112] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43113 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43113] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
-# CVE-2026-43114 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43114] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 # CVE-2026-43115 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43116 needs backporting (fixed from 7.0)
+# CVE-2026-43116 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43117 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43117] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 # CVE-2026-43118 needs backporting (fixed from 7.0)
=20
 # CVE-2026-43119 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43120 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43120] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-43121] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-CVE_STATUS[CVE-2026-43122] =3D "fixed-version: only affects 6.18 onwards=
"
-
-# CVE-2026-43123 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43123] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43124 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43124] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43125 needs backporting (fixed from 7.0)
=20
@@ -22508,55 +22528,55 @@ CVE_STATUS[CVE-2026-43122] =3D "fixed-version: =
only affects 6.18 onwards"
=20
 # CVE-2026-43127 may need backporting (fixed from 6.7)
=20
-# CVE-2026-43128 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43128] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43129 needs backporting (fixed from 7.0)
+# CVE-2026-43129 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43130 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43130] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43131] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43132 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43132] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43133 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43133] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43134 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43134] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43135 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43135] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43136 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43136] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43137 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-43137] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
=20
 CVE_STATUS[CVE-2026-43138] =3D "fixed-version: only affects 6.9 onwards"
=20
-# CVE-2026-43139 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43139] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43140 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43140] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43141 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43141] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43142] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43143 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43143] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43144] =3D "fixed-version: only affects 6.13 onwards=
"
=20
-# CVE-2026-43145 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43145] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43146] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43147 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43147] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43148 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43148] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43149 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43149] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43150 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43150] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43151] =3D "fixed-version: only affects 6.18.3 onwar=
ds"
=20
-# CVE-2026-43152 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43152] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43153 needs backporting (fixed from 7.0)
=20
@@ -22564,21 +22584,21 @@ CVE_STATUS[CVE-2026-43154] =3D "fixed-version: =
only affects 6.18 onwards"
=20
 CVE_STATUS[CVE-2026-43155] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-43156 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43156] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43157 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43157] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43158 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43158] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43159 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43159] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43160] =3D "fixed-version: only affects 6.17 onwards=
"
=20
 # CVE-2026-43161 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43162 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43162] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43163 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43163] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43164] =3D "fixed-version: only affects 6.18 onwards=
"
=20
@@ -22586,19 +22606,19 @@ CVE_STATUS[CVE-2026-43165] =3D "fixed-version: =
only affects 6.13 onwards"
=20
 CVE_STATUS[CVE-2026-43166] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43167 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43167] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43168 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43168] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43169] =3D "fixed-version: only affects 6.7 onwards"
=20
-# CVE-2026-43170 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43170] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43171 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43171] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43172 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43173 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43173] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43174] =3D "fixed-version: only affects 6.15 onwards=
"
=20
@@ -22612,27 +22632,27 @@ CVE_STATUS[CVE-2026-43178] =3D "fixed-version: =
only affects 6.12.70 onwards"
=20
 CVE_STATUS[CVE-2026-43179] =3D "fixed-version: only affects 6.17 onwards=
"
=20
-# CVE-2026-43180 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43180] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43181] =3D "fixed-version: only affects 6.17 onwards=
"
=20
-# CVE-2026-43182 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43182] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43183 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43183] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43184 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43184] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43185 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43186 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43186] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43187 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43187] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43188] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43189 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43189] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43190 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43190] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43191] =3D "fixed-version: only affects 6.7 onwards"
=20
@@ -22640,11 +22660,11 @@ CVE_STATUS[CVE-2026-43192] =3D "fixed-version: =
only affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-43193] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43194 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43194] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43195] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-43196 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43196] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43197 needs backporting (fixed from 7.0)
=20
@@ -22652,99 +22672,99 @@ CVE_STATUS[CVE-2026-43195] =3D "fixed-version: =
only affects 6.16 onwards"
=20
 # CVE-2026-43199 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43200 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43200] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43201] =3D "fixed-version: only affects 6.12.63 onwa=
rds"
=20
-# CVE-2026-43202 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43202] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43203 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43203] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43204 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43205 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43205] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43206 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43206] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43207 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43207] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43208] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-43209 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43209] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43210] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-# CVE-2026-43211 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43211] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43212 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43212] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43213 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43214 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43214] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43215 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43215] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43216 needs backporting (fixed from 7.0)
=20
 CVE_STATUS[CVE-2026-43217] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43218 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43218] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43219 needs backporting (fixed from 7.0)
+# CVE-2026-43219 may need backporting (fixed from 6.6.143)
=20
-CVE_STATUS[CVE-2026-43220] =3D "fixed-version: only affects 6.6.128 onwa=
rds"
+CVE_STATUS[CVE-2026-43220] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-43221 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43221] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43222 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43222] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43223 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43223] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43224] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-43225 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43225] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43226 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43226] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43227 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43227] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43228] =3D "fixed-version: only affects 6.18 onwards=
"
=20
 CVE_STATUS[CVE-2026-43229] =3D "fixed-version: only affects 6.8 onwards"
=20
-# CVE-2026-43230 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43230] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43231 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43231] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43232 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43232] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43233 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43233] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43234 needs backporting (fixed from 7.0)
=20
 CVE_STATUS[CVE-2026-43235] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-43236 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43236] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43237] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-43238 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43238] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43239 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43239] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43240 may need backporting (fixed from 6.6.128)
+# CVE-2026-43240 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43241 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43241] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43242 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43242] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43243] =3D "fixed-version: only affects 6.11 onwards=
"
=20
 # CVE-2026-43244 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43245 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-43245] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
=20
-# CVE-2026-43246 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43246] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43247] =3D "fixed-version: only affects 6.13 onwards=
"
=20
@@ -22754,19 +22774,19 @@ CVE_STATUS[CVE-2026-43247] =3D "fixed-version: =
only affects 6.13 onwards"
=20
 # CVE-2026-43250 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43251 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43251] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43252 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43252] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43253 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43253] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43254] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-43255 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43255] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43256 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43256] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43257 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43257] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43258 needs backporting (fixed from 7.0)
=20
@@ -22774,67 +22794,67 @@ CVE_STATUS[CVE-2026-43259] =3D "fixed-version: =
only affects 6.15 onwards"
=20
 CVE_STATUS[CVE-2026-43260] =3D "fixed-version: only affects 6.11 onwards=
"
=20
-# CVE-2026-43261 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43261] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43262 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43262] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43263] =3D "fixed-version: only affects 6.8 onwards"
=20
-# CVE-2026-43264 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43264] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43265 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43265] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43266 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43266] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43267] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-43268 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43268] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43269 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43269] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43270 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43270] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43271 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43271] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43272] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-# CVE-2026-43273 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43273] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43274] =3D "fixed-version: only affects 6.14 onwards=
"
=20
-# CVE-2026-43275 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43275] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43276] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-43277 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43277] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43278 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43278] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43279 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43279] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43280] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-43281 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43281] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43282] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-43283 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43283] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43284 may need backporting (fixed from 6.6.138)
+CVE_STATUS[CVE-2026-43284] =3D "cpe-stable-backport: Backported in 6.6.1=
38"
=20
 CVE_STATUS[CVE-2026-43285] =3D "fixed-version: only affects 6.18 onwards=
"
=20
 CVE_STATUS[CVE-2026-43286] =3D "fixed-version: only affects 6.14.8 onwar=
ds"
=20
-# CVE-2026-43287 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43287] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43288 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43288] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43289 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43289] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43290] =3D "fixed-version: only affects 6.17 onwards=
"
=20
-# CVE-2026-43291 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43291] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43292] =3D "fixed-version: only affects 6.9 onwards"
=20
@@ -22842,9 +22862,9 @@ CVE_STATUS[CVE-2026-43293] =3D "fixed-version: on=
ly affects 6.10 onwards"
=20
 # CVE-2026-43294 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43295 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43295] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43296 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43296] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43297] =3D "fixed-version: only affects 6.8 onwards"
=20
@@ -22856,11 +22876,11 @@ CVE_STATUS[CVE-2026-43300] =3D "fixed-version: =
only affects 6.7 onwards"
=20
 CVE_STATUS[CVE-2026-43301] =3D "fixed-version: only affects 6.8 onwards"
=20
-# CVE-2026-43302 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43302] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43303 needs backporting (fixed from 7.0)
+# CVE-2026-43303 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43304 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43304] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 CVE_STATUS[CVE-2026-43305] =3D "fixed-version: only affects 6.19 onwards=
"
=20
@@ -22874,23 +22894,23 @@ CVE_STATUS[CVE-2026-43307] =3D "fixed-version: =
only affects 6.12 onwards"
=20
 # CVE-2026-43310 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43311 needs backporting (fixed from 7.0)
+# CVE-2026-43311 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43312 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43312] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43313 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43313] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43314 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43314] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43315 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43315] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
-# CVE-2026-43316 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43316] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
=20
 # CVE-2026-43317 needs backporting (fixed from 7.0)
=20
 # CVE-2026-43318 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43319 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43319] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
=20
 CVE_STATUS[CVE-2026-43320] =3D "fixed-version: only affects 6.10.13 onwa=
rds"
=20
@@ -22900,49 +22920,49 @@ CVE_STATUS[CVE-2026-43322] =3D "fixed-version: =
only affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-43323] =3D "fixed-version: only affects 6.12.78 onwa=
rds"
=20
-# CVE-2026-43324 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43324] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-43325] =3D "fixed-version: only affects 6.9 onwards"
=20
 CVE_STATUS[CVE-2026-43326] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-# CVE-2026-43327 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43327] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43328 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43328] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43329 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43329] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43330 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43330] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43331 needs backporting (fixed from 7.0)
+# CVE-2026-43331 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43332 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43332] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43333 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43333] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43334 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43334] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 CVE_STATUS[CVE-2026-43335] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43336 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-43336] =3D "cpe-stable-backport: Backported in 6.6.1=
35"
=20
 CVE_STATUS[CVE-2026-43337] =3D "fixed-version: only affects 6.11.3 onwar=
ds"
=20
 # CVE-2026-43338 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43339 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43339] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43340 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43340] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43341 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43341] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43342 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43342] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
-# CVE-2026-43343 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43343] =3D "cpe-stable-backport: Backported in 6.6.1=
34"
=20
 # CVE-2026-43344 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43345 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43345] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-43346] =3D "fixed-version: only affects 6.12.11 onwa=
rds"
=20
@@ -22952,7 +22972,7 @@ CVE_STATUS[CVE-2026-43348] =3D "fixed-version: on=
ly affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-43349] =3D "fixed-version: only affects 6.18.13 onwa=
rds"
=20
-# CVE-2026-43350 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43350] =3D "cpe-stable-backport: Backported in 6.6.1=
36"
=20
 CVE_STATUS[CVE-2026-43351] =3D "fixed-version: only affects 6.14 onwards=
"
=20
@@ -22962,71 +22982,71 @@ CVE_STATUS[CVE-2026-43351] =3D "fixed-version: =
only affects 6.14 onwards"
=20
 CVE_STATUS[CVE-2026-43354] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-# CVE-2026-43355 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43355] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43356] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43357 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43357] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43358] =3D "fixed-version: only affects 6.16.4 onwar=
ds"
=20
-# CVE-2026-43359 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43359] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43360 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43360] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43361 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43361] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43362 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43362] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43363 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43363] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43364] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-43365 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43365] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43366 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43366] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43367] =3D "fixed-version: only affects 6.18.16 onwa=
rds"
=20
-# CVE-2026-43368 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43368] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43369] =3D "fixed-version: only affects 6.18.16 onwa=
rds"
=20
-# CVE-2026-43370 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43370] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43371 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43371] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43372 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43372] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43373 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43373] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43374] =3D "fixed-version: only affects 6.9 onwards"
=20
 CVE_STATUS[CVE-2026-43375] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43376 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43376] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43377 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43377] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43378 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43378] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43379 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43379] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43380 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43380] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43381 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43381] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43382 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43382] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43383 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43383] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43384] =3D "fixed-version: only affects 6.7 onwards"
=20
 CVE_STATUS[CVE-2026-43385] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43386 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43386] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43387 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43387] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43388] =3D "fixed-version: only affects 6.14 onwards=
"
=20
@@ -23046,7 +23066,7 @@ CVE_STATUS[CVE-2026-43395] =3D "fixed-version: on=
ly affects 6.8 onwards"
=20
 CVE_STATUS[CVE-2026-43396] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-43397 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43397] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43398] =3D "fixed-version: only affects 6.16 onwards=
"
=20
@@ -23062,27 +23082,27 @@ CVE_STATUS[CVE-2026-43403] =3D "fixed-version: =
only affects 6.12 onwards"
=20
 CVE_STATUS[CVE-2026-43404] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43405 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43405] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43406 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43406] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43407 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43407] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43408] =3D "fixed-version: only affects 6.12.48 onwa=
rds"
=20
-# CVE-2026-43409 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43409] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43410] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43411 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43411] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43412 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43412] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43413 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43413] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2026-43414 may need backporting (fixed from 6.7)
=20
-# CVE-2026-43415 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43415] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2026-43416 needs backporting (fixed from 7.0)
=20
@@ -23090,33 +23110,29 @@ CVE_STATUS[CVE-2026-43417] =3D "fixed-version: =
only affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-43418] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43419 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43419] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43420 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43420] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43421 needs backporting (fixed from 7.0)
+# CVE-2026-43421 may need backporting (fixed from 6.6.143)
=20
-CVE_STATUS[CVE-2026-43422] =3D "fixed-version: only affects 6.18.17 onwa=
rds"
+CVE_STATUS[CVE-2026-43424] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-CVE_STATUS[CVE-2026-43423] =3D "fixed-version: only affects 6.18.17 onwa=
rds"
+CVE_STATUS[CVE-2026-43425] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43424 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43426] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43425 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43427] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43426 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43428] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43427 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43429] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43428 may need backporting (fixed from 6.6.130)
-
-# CVE-2026-43429 may need backporting (fixed from 6.6.130)
-
-# CVE-2026-43430 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43430] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43431] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43432 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43432] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43433] =3D "fixed-version: only affects 6.18 onwards=
"
=20
@@ -23124,17 +23140,17 @@ CVE_STATUS[CVE-2026-43434] =3D "fixed-version: =
only affects 6.18 onwards"
=20
 CVE_STATUS[CVE-2026-43435] =3D "fixed-version: only affects 6.18 onwards=
"
=20
-# CVE-2026-43436 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43436] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43437 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43437] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43438] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-# CVE-2026-43439 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43439] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43440] =3D "fixed-version: only affects 6.18.16 onwa=
rds"
=20
-# CVE-2026-43441 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43441] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43442] =3D "fixed-version: only affects 6.19 onwards=
"
=20
@@ -23142,35 +23158,35 @@ CVE_STATUS[CVE-2026-43442] =3D "fixed-version: =
only affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-43444] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-# CVE-2026-43445 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43445] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43446] =3D "fixed-version: only affects 6.19 onwards=
"
=20
 CVE_STATUS[CVE-2026-43447] =3D "fixed-version: only affects 6.15 onwards=
"
=20
-# CVE-2026-43448 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43448] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43449 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43449] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43450 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43450] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43451 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43451] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43452 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43452] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43453 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43453] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43454] =3D "fixed-version: only affects 6.16 onwards=
"
=20
-# CVE-2026-43455 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43455] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 # CVE-2026-43456 needs backporting (fixed from 7.0)
=20
-# CVE-2026-43457 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43457] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43458 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43458] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43459 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43459] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43460] =3D "fixed-version: only affects 6.14 onwards=
"
=20
@@ -23184,27 +23200,27 @@ CVE_STATUS[CVE-2026-43463] =3D "fixed-version: =
only affects 6.7.3 onwards"
=20
 # CVE-2026-43465 may need backporting (fixed from 6.7)
=20
-# CVE-2026-43466 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43466] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43467] =3D "fixed-version: only affects 6.12.56 onwa=
rds"
=20
-# CVE-2026-43468 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43468] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43469 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43469] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43470] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2026-43471 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43471] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43472 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43472] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43473 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43473] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43474] =3D "fixed-version: only affects 6.17 onwards=
"
=20
-# CVE-2026-43475 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43475] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43476 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43476] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43477] =3D "fixed-version: only affects 6.16 onwards=
"
=20
@@ -23212,15 +23228,15 @@ CVE_STATUS[CVE-2026-43478] =3D "fixed-version: =
only affects 6.19 onwards"
=20
 CVE_STATUS[CVE-2026-43479] =3D "fixed-version: only affects 6.17 onwards=
"
=20
-# CVE-2026-43480 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43480] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43481] =3D "fixed-version: only affects 6.13 onwards=
"
=20
 CVE_STATUS[CVE-2026-43482] =3D "fixed-version: only affects 6.12 onwards=
"
=20
-# CVE-2026-43483 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43483] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
-# CVE-2026-43484 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43484] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43485] =3D "fixed-version: only affects 6.7 onwards"
=20
@@ -23228,45 +23244,1947 @@ CVE_STATUS[CVE-2026-43486] =3D "fixed-version=
: only affects 6.9 onwards"
=20
 CVE_STATUS[CVE-2026-43487] =3D "fixed-version: only affects 6.9 onwards"
=20
-# CVE-2026-43488 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43488] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
=20
 CVE_STATUS[CVE-2026-43489] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43490 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-43490] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
=20
-# CVE-2026-43491 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43491] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-43492 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43492] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-43493 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43493] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-43494 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-43494] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
=20
-# CVE-2026-43495 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43495] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-43496 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43496] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
-# CVE-2026-43497 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43497] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
=20
 CVE_STATUS[CVE-2026-43498] =3D "fixed-version: only affects 6.19 onwards=
"
=20
-# CVE-2026-43499 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43499] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-43500] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-43501] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-43502] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-43503] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-45834] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45835] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45836] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45837] =3D "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-45838] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-45839] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-45840] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-45841] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-45842] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-45843] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-45844] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-45845] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-45846] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-45847] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45848] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45849] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+# CVE-2026-45850 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-45851] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45852] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45853] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-45854] =3D "fixed-version: only affects 6.15 onwards=
"
+
+# CVE-2026-45855 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45856] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45857] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45858] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
+
+# CVE-2026-45859 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-45860] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+# CVE-2026-45861 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45862] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45863] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-45864] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45865] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45866] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45867] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45868] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45869] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45870] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45871] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45872] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45873] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45874] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-45875] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45876] =3D "fixed-version: only affects 6.13 onwards=
"
+
+# CVE-2026-45877 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45878] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45879] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45880] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45881] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45882] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-45883] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45884] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-45885] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45886] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45887] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-45888] =3D "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-45889] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-45890] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45891] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45892] =3D "fixed-version: Fixed from version 6.1.16=
8"
+
+# CVE-2026-45893 needs backporting (fixed from 7.0)
+
+# CVE-2026-45894 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45895] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45896] =3D "fixed-version: only affects 6.17 onwards=
"
+
+# CVE-2026-45897 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-45898] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-45899] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
+
+CVE_STATUS[CVE-2026-45900] =3D "fixed-version: only affects 6.11 onwards=
"
+
+# CVE-2026-45901 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-45902] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45903] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2026-45904] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45905] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45906] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-45907] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-45908] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-45909] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-45910] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45911] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
+
+CVE_STATUS[CVE-2026-45912] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45913] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45914] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45915] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45916] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+# CVE-2026-45917 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45918] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-45919] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45920] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
+
+CVE_STATUS[CVE-2026-45921] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45922] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-45923] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45924] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
+
+CVE_STATUS[CVE-2026-45925] =3D "fixed-version: only affects 6.12.18 onwa=
rds"
+
+CVE_STATUS[CVE-2026-45926] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-45927] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-45928] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-45929] =3D "fixed-version: only affects 6.16 onwards=
"
+
+# CVE-2026-45930 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-45931] =3D "fixed-version: only affects 6.14 onwards=
"
+
+# CVE-2026-45932 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45933] =3D "fixed-version: only affects 6.11 onwards=
"
+
+# CVE-2026-45934 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45935] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45936] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45937] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-45938] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-45939] =3D "fixed-version: only affects 6.13 onwards=
"
+
+# CVE-2026-45940 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45941] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45942] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
+
+# CVE-2026-45943 needs backporting (fixed from 7.0)
+
+# CVE-2026-45944 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45945] =3D "fixed-version: only affects 6.13 onwards=
"
+
+CVE_STATUS[CVE-2026-45946] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45947] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45948] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+# CVE-2026-45949 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45950] =3D "fixed-version: only affects 6.10 onwards=
"
+
+CVE_STATUS[CVE-2026-45951] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2026-45952] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-45953] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-45954] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45955] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-45956] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
+
+CVE_STATUS[CVE-2026-45957] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45958] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
+
+CVE_STATUS[CVE-2026-45959] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-45960] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+# CVE-2026-45961 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45962] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+# CVE-2026-45963 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45964] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45965] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45966] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-45967] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-45968] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45969] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45970] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45971] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-45972] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45973] =3D "fixed-version: only affects 6.12.2 onwar=
ds"
+
+CVE_STATUS[CVE-2026-45974] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45975] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-45976] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45977] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-45978] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45979] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-45980] =3D "fixed-version: only affects 6.14.9 onwar=
ds"
+
+CVE_STATUS[CVE-2026-45981] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45982] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45983] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45984] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-45985] =3D "cpe-stable-backport: Backported in 6.6.1=
30"
+
+CVE_STATUS[CVE-2026-45986] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45987] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45988] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45989] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45990] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-45991] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45993] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45994] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45995] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-45996] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45997] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45998] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-45999] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46000] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46001] =3D "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-46002] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46003] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46004] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46005] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46006] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46007] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46008] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2026-46009] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46010] =3D "fixed-version: only affects 6.16.9 onwar=
ds"
+
+CVE_STATUS[CVE-2026-46011] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46012] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46013] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2026-46014 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46015] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46016] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46017 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46018] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46019] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46020] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-46021] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46022] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46023] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46024] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46025] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2026-46026] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46027] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46028] =3D "cpe-stable-backport: Backported in 6.6.1=
37"
+
+CVE_STATUS[CVE-2026-46029] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46030] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46031] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46032 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46033] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46034] =3D "fixed-version: only affects 6.10 onwards=
"
+
+CVE_STATUS[CVE-2026-46035] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46036] =3D "fixed-version: only affects 6.10 onwards=
"
+
+CVE_STATUS[CVE-2026-46037] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46038] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46039] =3D "fixed-version: only affects 6.16.9 onwar=
ds"
+
+CVE_STATUS[CVE-2026-46040] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46041] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46042] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-46043] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46044 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46045] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46046] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46047] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46048] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46049] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46050] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46051] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46052] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46053] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46054 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46055] =3D "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-46056] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46057] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-46058] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46059 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46060] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-46061] =3D "fixed-version: only affects 6.12.31 onwa=
rds"
+
+CVE_STATUS[CVE-2026-46062] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46063] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46064] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46065] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46066 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46067] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-46068] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-46069] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46070] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46071 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46072] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46073] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46074] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-46075] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46076 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46077] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46078] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46079] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46080] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46081] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-46082] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46083] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46084] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46085] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46086] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46087] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-46088] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46089] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46090 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46091] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46092 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46093] =3D "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-46094] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46095] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46096] =3D "fixed-version: only affects 6.18.3 onwar=
ds"
+
+CVE_STATUS[CVE-2026-46097] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-46098] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46099] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46100] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-46101] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46102] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46103] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46104] =3D "fixed-version: only affects 6.13 onwards=
"
+
+CVE_STATUS[CVE-2026-46105] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-46106] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46107] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46108] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46109] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46110] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46111] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46112] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46113] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46114] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46115] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46116] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46117] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-46118] =3D "fixed-version: only affects 6.18.32 onwa=
rds"
+
+CVE_STATUS[CVE-2026-46119] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46120] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46121] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46122] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46123] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46124] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46125] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46126] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-46127] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46128] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46129] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46130 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-46131] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46132] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46133] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46134] =3D "fixed-version: only affects 6.14 onwards=
"
+
+# CVE-2026-46135 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46136] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46137] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-46138] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46139] =3D "fixed-version: only affects 6.12.23 onwa=
rds"
+
+# CVE-2026-46140 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46141] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46142] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46143] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46144] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-46145] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-46146] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46147 needs backporting (fixed from 7.1)
+
+# CVE-2026-46148 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46149] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46150] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46151] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46152] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46153 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46154] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46155] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46156] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46157 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46158] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+CVE_STATUS[CVE-2026-46159] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46160] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-46161] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46162] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-46163] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46164] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-46165] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46166] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-46167] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46168] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46169] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46170] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+# CVE-2026-46171 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46172] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46173] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46174] =3D "cpe-stable-backport: Backported in 6.6.1=
39"
+
+# CVE-2026-46175 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46176] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46177] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46178] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46179] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46180] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46181 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46182] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46183] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-46184] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46185] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46186] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46187] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46188] =3D "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-46189] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46190] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46191] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46192] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-46193] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46194] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46195] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46196] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46197] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46198] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46199] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46200 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46201] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-46202] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-46203] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46204] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46205] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46206] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46207] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46208] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46209] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46210] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46211] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-46212] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46213] =3D "fixed-version: only affects 6.15.6 onwar=
ds"
+
+CVE_STATUS[CVE-2026-46214] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46215] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46216] =3D "fixed-version: only affects 6.10 onwards=
"
+
+CVE_STATUS[CVE-2026-46218] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46219] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46220] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46221] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46222] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-46223] =3D "fixed-version: only affects 6.19.12 onwa=
rds"
+
+CVE_STATUS[CVE-2026-46224] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46225] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46226] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46227] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46228] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-46229] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46230] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46231] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46232] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46233] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46234] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46235] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46236] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46238] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46239] =3D "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-46240] =3D "fixed-version: only affects 6.18.16 onwa=
rds"
+
+# CVE-2026-46241 needs backporting (fixed from 7.1)
+
+# CVE-2026-46242 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46243] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+CVE_STATUS[CVE-2026-46244] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+# CVE-2026-46245 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-46246] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46247] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46248] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-46249] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46250] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46251] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+# CVE-2026-46252 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46253] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+# CVE-2026-46254 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-46255] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46256] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-46257] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-46258] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-46259] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46260] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46261] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46262] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46263] =3D "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-46264] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-46265] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46266] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46267] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46268] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-46269] =3D "fixed-version: only affects 6.15.10 onwa=
rds"
+
+CVE_STATUS[CVE-2026-46270] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46271] =3D "fixed-version: only affects 6.16 onwards=
"
+
+# CVE-2026-46272 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-46273] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46274] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-46275] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+CVE_STATUS[CVE-2026-46276] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46277] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-46278] =3D "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-46279] =3D "fixed-version: only affects 6.10 onwards=
"
+
+CVE_STATUS[CVE-2026-46280] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46281] =3D "fixed-version: only affects 6.18 onwards=
"
+
+# CVE-2026-46282 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46283] =3D "fixed-version: only affects 6.10 onwards=
"
+
+CVE_STATUS[CVE-2026-46284] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-46285] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46286] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46287] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46288] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-46289] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46290] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-46291] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46292] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-46293] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46294] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46295] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-46296] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46297] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-46298] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46299] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46300] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-46301] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-46302 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46303] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46304] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46305] =3D "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-46306] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46307] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46308] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46309] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-46310] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-46311] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-46312] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+CVE_STATUS[CVE-2026-46313] =3D "fixed-version: only affects 6.10 onwards=
"
+
+# CVE-2026-46314 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46315] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46316] =3D "fixed-version: only affects 6.10 onwards=
"
+
+CVE_STATUS[CVE-2026-46317] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-46318] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-46319] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-46320 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-46321 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-46322 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-46323] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+# CVE-2026-46324 needs backporting (fixed from 7.1)
+
+# CVE-2026-46325 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-46326] =3D "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-46327] =3D "fixed-version: only affects 6.12.34 onwa=
rds"
+
+CVE_STATUS[CVE-2026-46328] =3D "cpe-stable-backport: Backported in 6.6.1=
28"
+
+CVE_STATUS[CVE-2026-46329] =3D "fixed-version: only affects 6.12 onwards=
"
+
+# CVE-2026-46330 needs backporting (fixed from 7.0)
+
+# CVE-2026-46331 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46332] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-46333] =3D "cpe-stable-backport: Backported in 6.6.1=
39"
+
+CVE_STATUS[CVE-2026-52904] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-52905] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-52906] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-52907] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2026-52908 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52909 may need backporting (fixed from 6.6.144)
+
+# CVE-2026-52910 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52911] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52912] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+# CVE-2026-52913 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52914] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+CVE_STATUS[CVE-2026-52915] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+CVE_STATUS[CVE-2026-52916] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+# CVE-2026-52917 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52918] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+CVE_STATUS[CVE-2026-52919] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+CVE_STATUS[CVE-2026-52920] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52921] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+CVE_STATUS[CVE-2026-52922] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+# CVE-2026-52923 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52924 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52925] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52926] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+# CVE-2026-52927 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52928 may need backporting (fixed from 6.6.144)
+
+# CVE-2026-52929 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52930 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52931] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+CVE_STATUS[CVE-2026-52932] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-52933] =3D "cpe-stable-backport: Backported in 6.6.1=
40"
+
+# CVE-2026-52934 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52935 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52936] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-52937 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52938] =3D "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-52939 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52940] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-52941] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
+
+# CVE-2026-52942 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52943 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52944 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52945] =3D "fixed-version: only affects 6.15.3 onwar=
ds"
+
+# CVE-2026-52946 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52947 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52948 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52949] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-52950] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-52951] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-52952] =3D "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-52953 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52954] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52955] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-52956 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52957] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52958] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52959] =3D "fixed-version: only affects 6.13.8 onwar=
ds"
+
+CVE_STATUS[CVE-2026-52960] =3D "fixed-version: only affects 6.15 onwards=
"
+
+# CVE-2026-52961 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52962] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52963] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52964] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52965] =3D "fixed-version: only affects 6.13 onwards=
"
+
+CVE_STATUS[CVE-2026-52966] =3D "fixed-version: only affects 6.18.32 onwa=
rds"
+
+CVE_STATUS[CVE-2026-52967] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52968] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52969] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52970] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52971] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-52972] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52973] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-52974] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52975] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52976] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-52977] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52978] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-52979] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-52980] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-52981] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52982] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52983] =3D "fixed-version: only affects 6.12.91 onwa=
rds"
+
+CVE_STATUS[CVE-2026-52984] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52985] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52986] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52987] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2026-52988 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52989] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-52990 needs backporting (fixed from 7.1)
+
+# CVE-2026-52991 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52992] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52993] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52994] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-52995] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52996] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52997] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-52998] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-52999] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53000 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53001] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53002] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53003] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53004] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53005 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53006] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53007] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-53008] =3D "fixed-version: only affects 6.18 onwards=
"
+
+# CVE-2026-53009 needs backporting (fixed from 7.1)
+
+# CVE-2026-53010 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-53011] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53012] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53013] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53014] =3D "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-53015 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53016] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53017 needs backporting (fixed from 7.1)
+
+# CVE-2026-53018 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53019] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-53020] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53021] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53022] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53023] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53024 needs backporting (fixed from 7.1)
+
+# CVE-2026-53025 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53026] =3D "fixed-version: only affects 6.18.4 onwar=
ds"
+
+# CVE-2026-53027 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53028] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-53029] =3D "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53030] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-53031] =3D "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-53032] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53033] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53034] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53035] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53036] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53037] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53038] =3D "fixed-version: only affects 6.10 onwards=
"
+
+CVE_STATUS[CVE-2026-53039] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53040] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53041] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53042] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-53043] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53044] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-53045] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53046] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53047] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53048] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53049] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53050] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53051] =3D "fixed-version: only affects 6.12.2 onwar=
ds"
+
+CVE_STATUS[CVE-2026-53052] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53053 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53054] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-53055] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-53056] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53057] =3D "fixed-version: only affects 6.13 onwards=
"
+
+CVE_STATUS[CVE-2026-53058] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53059] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53060] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53061] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53062] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53063] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53064] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53065] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53066] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53067] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-53068] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53069] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53070 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53071] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53072] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53073] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53074] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53075] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53076] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53077] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53078 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53079] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2026-53080 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53081] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-53082] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53083] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53084] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-53085] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-53086] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53087] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-53088] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53089 needs backporting (fixed from 7.1)
+
+# CVE-2026-53090 needs backporting (fixed from 7.1)
+
+# CVE-2026-53091 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53092] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-53093] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53094] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53095] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-53096] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53097 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53098] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53099] =3D "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53100] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2026-53101] =3D "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-53102 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53103] =3D "fixed-version: only affects 6.11.2 onwar=
ds"
+
+CVE_STATUS[CVE-2026-53104] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53105] =3D "fixed-version: only affects 6.11 onwards=
"
+
+# CVE-2026-53106 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53107] =3D "fixed-version: only affects 6.18.16 onwa=
rds"
+
+# CVE-2026-53108 needs backporting (fixed from 7.1)
+
+# CVE-2026-53109 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53110] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53111] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53112] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53113 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53114] =3D "fixed-version: only affects 6.14 onwards=
"
+
+# CVE-2026-53115 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53116] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53117] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53118 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53119] =3D "fixed-version: only affects 6.11 onwards=
"
+
+# CVE-2026-53120 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53121] =3D "fixed-version: only affects 6.14 onwards=
"
+
+# CVE-2026-53122 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53123] =3D "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-53124] =3D "fixed-version: only affects 6.14.6 onwar=
ds"
+
+CVE_STATUS[CVE-2026-53125] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-53126] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53127] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53128] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53129 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53130] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53131 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53132 needs backporting (fixed from 7.1)
+
+# CVE-2026-53133 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53134 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53135 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53136 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53137 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53138 may need backporting (fixed from 6.6.144)
+
+# CVE-2026-53139 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-53140] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53141] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2026-53142] =3D "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-53143 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53144 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53145] =3D "fixed-version: only affects 6.18.32 onwa=
rds"
+
+# CVE-2026-53146 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53147 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53148 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53149 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53150 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53151 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-53152] =3D "fixed-version: only affects 6.12.78 onwa=
rds"
+
+CVE_STATUS[CVE-2026-53153] =3D "fixed-version: only affects 6.13 onwards=
"
+
+# CVE-2026-53154 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53155] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2026-53156 needs backporting (fixed from 7.1)
+
+# CVE-2026-53157 may need backporting (fixed from 6.6.144)
+
+# CVE-2026-53158 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53159 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53160 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53161 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53162] =3D "fixed-version: only affects 6.16 onwards=
"
+
+# CVE-2026-53163 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-53164] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-53165] =3D "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-53166 may need backporting (fixed from 6.7)
+
+# CVE-2026-53167 may need backporting (fixed from 6.6.144)
+
+# CVE-2026-53168 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53169] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53170] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53171] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53172] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53173] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53174] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53175] =3D "fixed-version: only affects 6.12.93 onwa=
rds"
+
+# CVE-2026-53176 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53177 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53178 needs backporting (fixed from 7.1)
+
+# CVE-2026-53179 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53180] =3D "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-53181 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53182 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53183 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53184 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53185 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53186 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53187] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-53188] =3D "fixed-version: only affects 6.15 onwards=
"
+
+# CVE-2026-53189 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53190 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53191] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-53192] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-53193] =3D "fixed-version: only affects 6.12 onwards=
"
+
+# CVE-2026-53194 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53195 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53196 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53197] =3D "fixed-version: only affects 6.14 onwards=
"
+
+# CVE-2026-53198 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53199 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53200] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53201] =3D "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53202] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53203] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-53204] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53205] =3D "fixed-version: only affects 6.12.30 onwa=
rds"
+
+CVE_STATUS[CVE-2026-53206] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2026-53207 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53208 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53209 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53210] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53211] =3D "fixed-version: only affects 6.18 onwards=
"
+
+# CVE-2026-53212 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53213 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53214 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53215 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53216 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53217 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53218 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53219 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53220 needs backporting (fixed from 7.1)
+
+# CVE-2026-53221 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53222] =3D "fixed-version: only affects 6.18 onwards=
"
+
+# CVE-2026-53223 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53224 needs backporting (fixed from 7.1)
+
+# CVE-2026-53225 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53226 needs backporting (fixed from 7.1)
+
+# CVE-2026-53227 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53228 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53229 needs backporting (fixed from 7.1)
+
+# CVE-2026-53230 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53231] =3D "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-53232 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53233] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-53234] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-53235] =3D "fixed-version: only affects 6.10 onwards=
"
+
+# CVE-2026-53236 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53237 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53238 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53239 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53240] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2026-53241] =3D "fixed-version: only affects 6.10 onwards=
"
+
+# CVE-2026-53242 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53243] =3D "fixed-version: only affects 7.0.10 onwar=
ds"
+
+CVE_STATUS[CVE-2026-53244] =3D "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-53245 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53246 needs backporting (fixed from 7.1)
+
+# CVE-2026-53247 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53248] =3D "fixed-version: only affects 6.15 onwards=
"
+
+# CVE-2026-53249 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53250] =3D "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53251] =3D "fixed-version: only affects 6.12.2 onwar=
ds"
+
+# CVE-2026-53252 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53253 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53254 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53255 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53256 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53257] =3D "fixed-version: only affects 6.16 onwards=
"
+
+# CVE-2026-53258 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53259] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-53260] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-53261] =3D "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-53262 needs backporting (fixed from 7.1)
+
+# CVE-2026-53263 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53264 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53265 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53266 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53267 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53268 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53269 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53270 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53271 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53272 needs backporting (fixed from 7.1)
+
+# CVE-2026-53273 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53274 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53275 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53276] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53277] =3D "fixed-version: only affects 6.12 onwards=
"
+
+CVE_STATUS[CVE-2026-53278] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53279] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53280] =3D "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53281] =3D "fixed-version: only affects 6.12.57 onwa=
rds"
+
+CVE_STATUS[CVE-2026-53282] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2026-53283] =3D "fixed-version: only affects 6.16 onwards=
"
+
+# CVE-2026-53284 needs backporting (fixed from 7.1)
+
+# CVE-2026-53285 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53286] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-53287] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53288] =3D "fixed-version: only affects 6.12.54 onwa=
rds"
+
+CVE_STATUS[CVE-2026-53289] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53290] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-53291] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53292 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53293] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53294] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53295] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53296] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+# CVE-2026-53297 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53298] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-53299] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53300] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-53301] =3D "fixed-version: only affects 6.13 onwards=
"
+
+CVE_STATUS[CVE-2026-53302] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-53303] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53304] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53305] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-53306] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53307] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-53308] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-53309] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53310] =3D "fixed-version: only affects 6.17 onwards=
"
+
+CVE_STATUS[CVE-2026-53311] =3D "fixed-version: only affects 6.16 onwards=
"
+
+CVE_STATUS[CVE-2026-53312] =3D "fixed-version: only affects 6.13 onwards=
"
+
+# CVE-2026-53313 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53314] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53315] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53316] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2026-53317 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53318] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-53319] =3D "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53320] =3D "cpe-stable-backport: Backported in 6.6.1=
41"
+
+CVE_STATUS[CVE-2026-53321] =3D "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-53322] =3D "fixed-version: only affects 6.19 onwards=
"
+
+CVE_STATUS[CVE-2026-53323] =3D "fixed-version: only affects 6.15 onwards=
"
+
+CVE_STATUS[CVE-2026-53324] =3D "fixed-version: only affects 6.13 onwards=
"
+
+# CVE-2026-53325 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-53326] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2026-53327 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-53328] =3D "fixed-version: only affects 6.12 onwards=
"
+
+# CVE-2026-53329 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53330 needs backporting (fixed from 7.1)
+
+# CVE-2026-53331 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53332 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53333] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-53334] =3D "fixed-version: only affects 6.18 onwards=
"
+
+CVE_STATUS[CVE-2026-53335] =3D "fixed-version: only affects 6.18 onwards=
"
+
+# CVE-2026-53336 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53337 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53338] =3D "fixed-version: only affects 6.16 onwards=
"
+
+# CVE-2026-53339 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53340] =3D "fixed-version: only affects 6.14 onwards=
"
+
+CVE_STATUS[CVE-2026-53341] =3D "fixed-version: only affects 6.11 onwards=
"
+
+CVE_STATUS[CVE-2026-53342] =3D "fixed-version: only affects 6.16 onwards=
"
+
+# CVE-2026-53343 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53344] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2026-53345 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53346] =3D "fixed-version: only affects 6.12 onwards=
"
+
+# CVE-2026-53347 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53348] =3D "fixed-version: only affects 6.19 onwards=
"
+
+# CVE-2026-53349 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53350 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53351] =3D "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-53352 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53353 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43500 may need backporting (fixed from 6.6.140)
+# CVE-2026-53354 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43501 may need backporting (fixed from 6.6.140)
+# CVE-2026-53355 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43502 may need backporting (fixed from 6.6.140)
+# CVE-2026-53356 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-43503 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-53357] =3D "cpe-stable-backport: Backported in 6.6.1=
42"
=20
-# CVE-2026-45834 may need backporting (fixed from 6.6.140)
+# CVE-2026-53358 may need backporting (fixed from 6.6.143)
=20
-# CVE-2026-45835 may need backporting (fixed from 6.6.140)
+# CVE-2026-53359 may need backporting (fixed from 6.6.144)
=20
-# CVE-2026-45836 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-53360] =3D "fixed-version: only affects 6.10 onwards=
"
=20
-# CVE-2026-46300 may need backporting (fixed from 6.6.141)
+# CVE-2026-53361 may need backporting (fixed from 6.6.144)
=20
-# CVE-2026-46333 may need backporting (fixed from 6.6.139)
+# CVE-2026-53362 may need backporting (fixed from 6.6.144)
=20
--=20
2.47.3


