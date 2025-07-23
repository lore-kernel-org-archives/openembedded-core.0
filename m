Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC32CC87FCD
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 03:29:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5789.1753241379196815036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 20:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9299fc1790=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N2oOVH1483565
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:38 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqu9nf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 22 Jul 2025 20:29:24 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 22 Jul 2025 20:29:24 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 3/6] mtools: upgrade 4.0.45 -> 4.0.46
Date: Wed, 23 Jul 2025 11:29:30 +0800
Message-ID: <20250723032933.546382-3-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723032933.546382-1-jinfeng.wang.cn@windriver.com>
References: <20250723032933.546382-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mepbxObNTeSnAw62Cs5aIecRW3czmZ5x
X-Proofpoint-ORIG-GUID: mepbxObNTeSnAw62Cs5aIecRW3czmZ5x
X-Authority-Analysis: v=2.4 cv=AbqxH2XG c=1 sm=1 tr=0 ts=68805722 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=omOdbC7AAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=Js0LpgGrAAAA:8 a=aKtN9b3b-FiV9TudpjgA:9
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=queAGc4so_Lf9sPBW2Va:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAyNyBTYWx0ZWRfX6b/KxexosirZ
 qDOpnYIt+zaZApKaEFkKXOOZtYAF7goHe9I3TOpEZp8NTyAJwBpeKQdZPNIwgzzRcWd1+Ie/F58
 uUzf9HIXG3ELbi9AZ/nG/oSfeQ55JO04wSrI6cgLSyOlPjXzLf5fAugNsKbrTc7DeFhCoXvoXVh
 cMUc4eTyMCwMkN4gR+gGG/1YpJsMjjr8avOzN00D189T3Sd4aEro0CRgbJjI5PSLxUAi7QP4miY
 wi29Lp91NHoupx67NS30l7pPZQmoFcfhLeUaqMapy/zWzCPPHVS73NMuMFhRwTyGm48b+lg4pwZ
 etbYkw5d7wYpA++De1/n8dpq59GUIFlLdth9WtpOvzGc9JcOryMwQftfSZyePSuhfLstKqlwrXW
 hZUnIvCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220781

From: Wang Mingyu <wangmy@fujitsu.com>

clang_UNUSED.patch
mtools-makeinfo.patch
refreshed for 4.0.46

Changelog:
=============
- iconv buffer overflow fixes
- removed references to mread and mwrite (obsolete subcommands
from mcopy)
- documented mdoctorfat, and addressed 2 bugs/oversights
- removed references to obsolete mread and mwrite
- portability fixes (dietlibc and MacOS X) & simplification

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: f5a5b2372669d8be4ae3f19ed6892264ea3999d0)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../mtools/mtools/clang_UNUSED.patch             |  6 +++---
 .../mtools/mtools/mtools-makeinfo.patch          | 16 ++++++++--------
 .../{mtools_4.0.45.bb => mtools_4.0.46.bb}       |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.45.bb => mtools_4.0.46.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 20a6d1b8b3..1420d84b86 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From c72d075cb0c3a65ef17621c7ed1ffac35ca3b68e Mon Sep 17 00:00:00 2001
+From 6654edfb1eee416b58bcb6490658f80071a353c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysincludes.h b/sysincludes.h
-index e16ab45..8d285d4 100644
+index 6b322ff..48daecd 100644
 --- a/sysincludes.h
 +++ b/sysincludes.h
-@@ -98,7 +98,7 @@ typedef void *caddr_t;
+@@ -85,7 +85,7 @@ ac_cv_func_setpgrp_void=yes ../mtools/configure --build=i386-linux-gnu --host=i3
  #if defined __GNUC__ && defined __STDC__
  /* gcc -traditional doesn't have PACKED, UNUSED and NORETURN */
  # define PACKED __attribute__ ((packed))
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 3771f94c59..8c80040f91 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From 184b76e9742ff89f90a066edb0f46b4a150351cf Mon Sep 17 00:00:00 2001
+From fd1e84c66852c2c906ee292aad942b4bfbd9e306 Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
@@ -6,11 +6,11 @@ Subject: [PATCH] mtools: imported from OE
 Upstream-Status: Inappropriate [licensing]
 ---
  Makefile.in  | 11 ++++++-----
- configure.in | 27 +++++++++++++++++++++++++++
+ configure.ac | 27 +++++++++++++++++++++++++++
  2 files changed, 33 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 5db50d7..92ad461 100644
+index 7b305b0..70c8c74 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -26,10 +26,11 @@ USERCFLAGS =
@@ -38,11 +38,11 @@ index 5db50d7..92ad461 100644
  
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
-diff --git a/configure.in b/configure.in
-index 1de916e..fd6cb08 100644
---- a/configure.in
-+++ b/configure.in
-@@ -32,6 +32,33 @@ AC_CANONICAL_TARGET
+diff --git a/configure.ac b/configure.ac
+index de108a8..0fd9ef0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -33,6 +33,33 @@ AC_CANONICAL_TARGET
  AC_C_CONST
  AC_C_INLINE
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.45.bb b/meta/recipes-devtools/mtools/mtools_4.0.46.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.45.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.46.bb
index 34040d7a0d..1173718662 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.45.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.46.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "0b008a96bd0efe0e542fa4383d469af66bc4a93394990b103730a8160a67d618"
+SRC_URI[sha256sum] = "9aad8dd859f88fb7787924ec47590192d3abf7bad6c840509c854290d6bc16c0"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.34.1


