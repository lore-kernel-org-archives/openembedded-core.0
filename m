Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418E1C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 12:18:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5198.1745583488123802572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 05:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6210385b2d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PBGAvg018199
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:18:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhauqru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 05:18:07 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 25 Apr 2025 05:18:07 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 25 Apr 2025 05:18:05 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  1/3] perlcross: update 1.5.2 -> 1.6
Date: Fri, 25 Apr 2025 12:18:01 +0000
Message-ID: <20250425121803.767765-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: G9yweC5yOZQk7BdAlc_IQVddGL984HO4
X-Proofpoint-ORIG-GUID: G9yweC5yOZQk7BdAlc_IQVddGL984HO4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA4OCBTYWx0ZWRfX/EmppaEOTEil giuBgf38YoZmsbtm74J8fcE+TgcdVml/4xvPBigD3VVTND8dLbRaQ87VDm6kcI+xhfQfldiU4Lk sud4uTynu/G5ktSGFlbM+BEpospBO0KyhZPmFCAmXqkfGMiX48AKVhOIb37OpfDebylIC+OZTkP
 DTUO2b8gqutzEnwtKRtjcJt+goTFXKN4hgGAKtu1zCVU+6t192IZRnAy7A6KVLojL3Y+so6bvdG p5vCmfUeQzf0P/AHIlHlPm8lKP7MLjeHL7r1kHArfklZprYRbKiLygGJLVqSFXDRM+qUFIyzWyB M1nO3eIYobd0OjRVp+fkPdAErRAMl7Ge/ci8W6yc01AyqwQGUTXPpV6UwkP3c8k6GPLhSmrCGP/
 i+HSoqeNkSzgkagckaTAIbgeKaMk+WQkKUnPT15UNf7xVN9np9d8iPRKtYRC4/QL7wNGGpYF
X-Authority-Analysis: v=2.4 cv=Sa33duRu c=1 sm=1 tr=0 ts=680b7d7f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=9dNmoeHalSepfzKadXwA:9
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504250088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 12:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215468

From: Alexander Kanavin <alex@linutronix.de>

(From OE-Core rev: dee97a3d3127eeba77bc6be05dea25f89aa734e5)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...ile-check-the-file-if-patched-or-not.patch |  3 +-
 ...oss-add-LDFLAGS-when-linking-libperl.patch |  9 ++--
 .../perl-cross/files/determinism.patch        | 41 +++++++++++--------
 .../{perlcross_1.5.2.bb => perlcross_1.6.bb}  |  2 +-
 4 files changed, 29 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.5.2.bb => perlcross_1.6.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
index 4e9153ebf1..7efee733c6 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
@@ -1,4 +1,4 @@
-From 3eb33dce6e3c93e1b3efcc9649f871100adada30 Mon Sep 17 00:00:00 2001
+From d0292a4f91ca22f8919a0f13d8961f98743bdbf1 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Fri, 2 Jul 2021 09:08:21 +0000
 Subject: [PATCH] Makefile: check the file if patched or not
@@ -9,7 +9,6 @@ one time.
 Upstream-Status: Inappropriate (OE-specific)
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
index 6c3f08c432..6d387fe66a 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
@@ -1,4 +1,4 @@
-From f824cbec9ac8f113a4ae35d57bd18625d415a71b Mon Sep 17 00:00:00 2001
+From c4ebb6d11d690185f66a3f0a591f193fd6611122 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Nov 2018 15:37:40 +0100
 Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 01644cd..be811a7 100644
+index 4b80079..c6d6042 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -180,7 +180,7 @@ endif
+@@ -191,7 +191,7 @@ endif
  
  ifeq ($(useshrplib),true)
  $(LIBPERL):
@@ -22,6 +22,3 @@ index 01644cd..be811a7 100644
  else
  $(LIBPERL):
  	$(AR) cru $@ $(filter %$o,$^)
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/meta/recipes-devtools/perl-cross/files/determinism.patch
index e9bf752bcb..ef11b12a35 100644
--- a/meta/recipes-devtools/perl-cross/files/determinism.patch
+++ b/meta/recipes-devtools/perl-cross/files/determinism.patch
@@ -1,4 +1,7 @@
-Fixes to make the perl build reproducible:
+From 8fd84d6d760b21bad2c499b572951cc3f2235953 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 5 Feb 2020 23:54:02 +0000
+Subject: [PATCH] Fixes to make the perl build reproducible:
 
 a) Remove the \n from configure_attr.sh since it gets quoted differently depending on
    whether the shell is bash or dash which can cause the test result to be incorrect.
@@ -8,7 +11,7 @@ b) Sort the order of the module lists from configure_mods.sh since otherwise
    the result isn't the same leading to makefile differences.
    Reported upstream: https://github.com/arsv/perl-cross/issues/88
 
-c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst 
+c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst
    there for good measure)
    This needs to go to upstream perl (not done)
 
@@ -20,12 +23,26 @@ RP 2020/2/7
 
 Upstream-Status: Pending [75% submitted]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+---
+ cnf/configure         | 2 +-
+ cnf/configure_mods.sh | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: perl-5.30.1/cnf/configure_mods.sh
-===================================================================
---- perl-5.30.1.orig/cnf/configure_mods.sh
-+++ perl-5.30.1/cnf/configure_mods.sh
-@@ -82,7 +82,7 @@ extonlyif() {
+diff --git a/cnf/configure b/cnf/configure
+index 2f451c6..86bc865 100755
+--- a/cnf/configure
++++ b/cnf/configure
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+
+ base=${0%/*}; test -z "$base" && base=.
+
+diff --git a/cnf/configure_mods.sh b/cnf/configure_mods.sh
+index d4ef5a7..8e88b48 100644
+--- a/cnf/configure_mods.sh
++++ b/cnf/configure_mods.sh
+@@ -108,7 +108,7 @@ extonlyif() {
  }
  
  definetrimspaces() {
@@ -34,13 +51,3 @@ Index: perl-5.30.1/cnf/configure_mods.sh
  	define $1 "$v"
  }
  
-Index: perl-5.30.1/cnf/configure
-===================================================================
---- perl-5.30.1.orig/cnf/configure
-+++ perl-5.30.1/cnf/configure
-@@ -1,4 +1,4 @@
--#!/bin/sh
-+#!/bin/bash
- 
- base=${0%/*}; test -z "$base" && base=.
- 
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.6.bb
index b41c182fad..295dd0cfc1 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90"
+SRC_URI[perl-cross.sha256sum] = "5abf198ee50ce9e69eb68fede68c87f65241caa744e4203e97490fa59b45ed69"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.40.0


