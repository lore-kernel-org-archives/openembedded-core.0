Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE15FC87FCE
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 03:29:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5792.1753241382479110773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 20:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9299fc1790=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N15v521212455
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:41 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqmsnxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 22 Jul 2025 20:29:26 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 22 Jul 2025 20:29:26 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 5/6] mtools: upgrade 4.0.47 -> 4.0.48
Date: Wed, 23 Jul 2025 11:29:32 +0800
Message-ID: <20250723032933.546382-5-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723032933.546382-1-jinfeng.wang.cn@windriver.com>
References: <20250723032933.546382-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ofn6_wrOEPcvikoj9JE302hDbu40Zuw7
X-Proofpoint-GUID: ofn6_wrOEPcvikoj9JE302hDbu40Zuw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAyNyBTYWx0ZWRfX59FyL+agHMF6
 0HHf7nQZUNO0NjWsivJjjqwkTK5u/pwbNlZms1mb8Jfg84abg9JKpB8PtdIHkGcCZvjvmmDuuxb
 iUniCFjLE0Pu9k4rSo9glz6ED1IG8XGp7yxK/bt9kD0g/sFg83j4ukNEGUfoqghg+fAFL5PaIDi
 sfkR+bbwAP7Xh+QOq686mFj6mjNOvDM1d9d9JGLPgaolWF9sXLbxpGUFu9Q9a6h8NIYnjL5b0x5
 ZXW3/NZASbgmtB3InidSZkObJwzzECp9+k9pOKraMjw8nIlYJbjqhfmJt/pxvpOCn7RyCm71PAL
 QOLiiT88QZs/l6SWh8/sJVS1JuJfXpM9Mm2+ps7eL9iAzqKUb8AeRQ9YMHsnFeverhilbjOEokj
 UMcXdL3A
X-Authority-Analysis: v=2.4 cv=BbrY0qt2 c=1 sm=1 tr=0 ts=68805725 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=omOdbC7AAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=8V-F4CkzSCtt8Hbkg0AA:9
 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220783

From: Wang Mingyu <wangmy@fujitsu.com>

clang_UNUSED.patch
disable-hardcoded-configs.patch
refreshed for 4.0.48

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 1d5aee7e67cd614073a15b47b832375428865260)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 6 +++---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.47.bb => mtools_4.0.48.bb}           | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.47.bb => mtools_4.0.48.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 2f3c452420..ddf3706f51 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From d8e9cf472f49c8dbb3b0855145974d199a83e8a4 Mon Sep 17 00:00:00 2001
+From 6914c6e15cd15daf1dae81458e5346958c9d5449 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysincludes.h b/sysincludes.h
-index 6b322ff..48daecd 100644
+index 272b316..49ee5ae 100644
 --- a/sysincludes.h
 +++ b/sysincludes.h
-@@ -85,7 +85,7 @@ ac_cv_func_setpgrp_void=yes ../mtools/configure --build=i386-linux-gnu --host=i3
+@@ -98,7 +98,7 @@ ac_cv_func_setpgrp_void=yes ../mtools/configure --build=i386-linux-gnu --host=i3
  #if defined __GNUC__ && defined __STDC__
  /* gcc -traditional doesn't have PACKED, UNUSED and NORETURN */
  # define PACKED __attribute__ ((packed))
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 1b3c3e003d..63992ac547 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 4e51cf33fc34e8e82661b9bc3ab13858a2ffe43d Mon Sep 17 00:00:00 2001
+From 16969d42ec6514883bcee87cc89b3e7864481d7e Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -11,10 +11,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 436c94b..794f098 100644
+index 2433457..3972150 100644
 --- a/config.c
 +++ b/config.c
-@@ -868,14 +868,6 @@ void read_config(void)
+@@ -849,14 +849,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.47.bb b/meta/recipes-devtools/mtools/mtools_4.0.48.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.47.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.48.bb
index 70d6579621..646735f3b3 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.47.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.48.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "31aa06078cc3f50591b95e71a909c56dd179d87e9cbdc07bf435e595bd7cc7ff"
+SRC_URI[sha256sum] = "03c29aac8735dd7154a989fbc29eaf2b506121ae1c3a35cd0bf2a02e94d271a9"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.34.1


