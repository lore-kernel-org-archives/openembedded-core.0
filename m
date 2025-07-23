Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88B8C83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 03:29:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5790.1753241379722799110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 20:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9299fc1790=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N2oOVI1483565
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:38 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqu9nf0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 22 Jul 2025 20:29:25 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 22 Jul 2025 20:29:25 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 4/6] mtools: upgrade 4.0.46 -> 4.0.47
Date: Wed, 23 Jul 2025 11:29:31 +0800
Message-ID: <20250723032933.546382-4-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723032933.546382-1-jinfeng.wang.cn@windriver.com>
References: <20250723032933.546382-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: qJvSF9XaoPu8unQ8TGUxhSuQjkCR8gSk
X-Proofpoint-ORIG-GUID: qJvSF9XaoPu8unQ8TGUxhSuQjkCR8gSk
X-Authority-Analysis: v=2.4 cv=AbqxH2XG c=1 sm=1 tr=0 ts=68805722 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=Js0LpgGrAAAA:8 a=5T0K2AKrfK-6g1Xa1HQA:9
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=queAGc4so_Lf9sPBW2Va:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAyNyBTYWx0ZWRfX87nmIwo0UY6C
 nY1pNlF9nFnwWbAJRQn7iL0s8r9PC1OuH9mHhcIaaQRhXKbEqES2QZJIUguWvTX8B0vB6BDiASq
 mxBJcBGlIxXH1LbDdSgaYfO4q0EZ2taTOCbJKjU2FN6808cX6JvvuIE5rC3cIBJAFc/U6pVmJHY
 LrNjGEGkdCD48H6TEC1+p2qCqdWSAp8sVhQ5GaZbqOMmUphmqhhtjBKPi9O3h/ftU4zMR9gNbmB
 Z8lkWCvPqW8LvfSAKBxqjL60PqwOdz6xoQts8D9smL/w8s9PZNi4ZLMX6dB8ooYpgG4EIeC+xYF
 uD19pl93+OsGgi7E/DR7NLhZN0WGzaXJniJcNRpv1f2QfZ4iQHXozMsNrYta05KgCylxGwv02NK
 Vq3qAfz3
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220782

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 14ef270cc003646e6ca97ff3405507f2b9e92736)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 2 +-
 .../mtools/mtools/disable-hardcoded-configs.patch           | 4 ++--
 meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch   | 6 +++---
 .../mtools/{mtools_4.0.46.bb => mtools_4.0.47.bb}           | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.46.bb => mtools_4.0.47.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 1420d84b86..2f3c452420 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From 6654edfb1eee416b58bcb6490658f80071a353c2 Mon Sep 17 00:00:00 2001
+From d8e9cf472f49c8dbb3b0855145974d199a83e8a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 1bed4e7614..1b3c3e003d 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 0953b744b0257e26c170fb6d6b4c0f6210e4ae43 Mon Sep 17 00:00:00 2001
+From 4e51cf33fc34e8e82661b9bc3ab13858a2ffe43d Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -11,7 +11,7 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 358282b..8ebafb4 100644
+index 436c94b..794f098 100644
 --- a/config.c
 +++ b/config.c
 @@ -868,14 +868,6 @@ void read_config(void)
diff --git a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
index 8c80040f91..fb7ba56eec 100644
--- a/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
+++ b/meta/recipes-devtools/mtools/mtools/mtools-makeinfo.patch
@@ -1,4 +1,4 @@
-From fd1e84c66852c2c906ee292aad942b4bfbd9e306 Mon Sep 17 00:00:00 2001
+From b517158e8ffc6a665506007b20708d6c2589cec1 Mon Sep 17 00:00:00 2001
 From: Marcin Juszkiewicz <hrw@openedhand.com>
 Date: Fri, 8 Jun 2007 08:35:12 +0000
 Subject: [PATCH] mtools: imported from OE
@@ -39,10 +39,10 @@ index 7b305b0..70c8c74 100644
  pdf: mtools.pdf
  %.pdf: %.texi sysconfdir.texi
 diff --git a/configure.ac b/configure.ac
-index de108a8..0fd9ef0 100644
+index 37f0d00..c93cfb5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -33,6 +33,33 @@ AC_CANONICAL_TARGET
+@@ -36,6 +36,33 @@ AC_PATH_PROG(INSTALL_INFO, install-info, "")
  AC_C_CONST
  AC_C_INLINE
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.46.bb b/meta/recipes-devtools/mtools/mtools_4.0.47.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.46.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.47.bb
index 1173718662..70d6579621 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.46.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.47.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "9aad8dd859f88fb7787924ec47590192d3abf7bad6c840509c854290d6bc16c0"
+SRC_URI[sha256sum] = "31aa06078cc3f50591b95e71a909c56dd179d87e9cbdc07bf435e595bd7cc7ff"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.34.1


