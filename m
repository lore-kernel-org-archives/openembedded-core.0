Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAE8CA0FF9
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 05:18:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7973.1756271938159409755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 22:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KuFTuVsh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0334c62af5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57R4vTMN3449704
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 05:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=AoyVeDjR9d7RqNGI09TP9+j5loyYzmXWzM5nmVsbh4k=; b=KuFTuVshkGAp
	bSdIm5mJeCtFXG5OQuRXBLCwIrWoa8UkmQwbzaVWt2du/9jmOG+4ptywrQG7z7aV
	Wq1lradBe9zIFyiPymMHhumDO0k2jpRm6CiU6HKV5thGNeep4rUi2pp/a5SRBFTK
	psgBvL6p8id+jySmtR3GAO3mM/d9Lw2plu4MUZvdSjjUol3rgO0bRdTMjND13SCM
	yNwwwsUQLwQS2NcP+wwTN+bAe62qYIQv0I/ZfMgRzlUqXs1aXcvYV/hjdhfvESs+
	Nn4h9xF6KPJu4FMxw2Dr6tKOYxrt1cUl1yHqROLNg0is7O7JfkjInMPlUbvv0Rb3
	0f4DRfoC3Q==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1c6w3-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 05:18:57 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 26 Aug 2025 22:18:55 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 26 Aug 2025 22:18:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] libgcrypt: 1.11.1 -> 1.11.2
Date: Wed, 27 Aug 2025 13:18:52 +0800
Message-ID: <20250827051852.3900650-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827051852.3900650-1-hongxu.jia@windriver.com>
References: <20250827051852.3900650-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jhY_y28AqT7kf87_uni6j10VeDntNE5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDA0MSBTYWx0ZWRfX2iKZCbFKC6dt
 uGNdSdzGW5/HpbR9wAz07NK81ym67XDzI0x8xCJpUY8SdpqrB1B0bOPM36rQkVRlGz+g1mkpICL
 dUngqMtOuYe81FfNg6ZB5git+QV6G0IZwEyftoGNEyoDyiy8hJAwIbVr5jD592ayM97UBLc2WJX
 0xxa92xzo1MTnIk2U+Uie+sAQFK14UWUDhg5p/LBZFn9ghK3hRDsMreQXIK5yRDvyOUIpTbW7B+
 ZN3v3zXJLB2UYz/6AMt3gTyj24o7jFD22hOn5lWuN9qwqvCAqnpkDBNCx4Ar2yTjgWPCgOQPek9
 8njs+qPY0GWzc3voirvXX0El087lUC2xj2+VHvj8by8A0uTkMLmOHUPtfo2CWg=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ae9541 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=m8ToADvmAAAA:8
 a=K_jn3rh_JhgcPK_JK3AA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: jhY_y28AqT7kf87_uni6j10VeDntNE5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 05:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222494

Refresh patches:
- 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
- 0001-tests-Fix-link-errors-for-t-thread-local.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...s-Fix-link-errors-for-t-thread-local.patch | 20 +++++++++++--------
 ...m-fix-undefined-reference-to-pthread.patch | 17 +++++++++-------
 ...ibgcrypt_1.11.1.bb => libgcrypt_1.11.2.bb} |  2 +-
 3 files changed, 23 insertions(+), 16 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.11.1.bb => libgcrypt_1.11.2.bb} (95%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
index 5ebc3831d4a..8dc2fe328c1 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -1,6 +1,6 @@
-From 746dc1c3837546c1085102e546a83da8d1c773e1 Mon Sep 17 00:00:00 2001
+From 942e232ded48fa08d2bda417ae8ad8c03d644372 Mon Sep 17 00:00:00 2001
 From: Collin Funk <collin.funk1@gmail.com>
-Date: Thu, 1 May 2025 22:20:58 -0700
+Date: Wed, 27 Aug 2025 11:49:06 +0800
 Subject: [PATCH] tests: Fix link errors for t-thread-local.
 
 On platforms where pthread_create is not in libc t-thread-local fails to
@@ -15,20 +15,24 @@ Upstream-Status: Backport [793eda7b258a562757b51c96044b103b638f1a63]
 GnuPG-bug-id: 7634
 Signed-off-by: Collin Funk <collin.funk1@gmail.com>
 Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- tests/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
+ tests/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 9a9e1c2c264a..b80f266f97c2 100644
+index 4800135..f0f7adb 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -94,6 +94,8 @@ t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
- testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -98,7 +98,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
-+t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
+ t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
+-t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
 +t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
  
  # Build a version of the test driver for the build platform.
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index ccf4e18910b..bbd48ebeee3 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,6 +1,6 @@
-From c7a99e7a15f1f703ac90fc2a16b2c2115a66a996 Mon Sep 17 00:00:00 2001
+From a3496435dcc223a914eec5e61e853934fd4eb635 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sun, 12 Jun 2016 04:44:29 -0400
+Date: Wed, 27 Aug 2025 11:46:17 +0800
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
  `pthread_create'
 
@@ -14,19 +14,19 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 3170a58..9a9e1c2 100644
+index 93daf3c..4800135 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -93,7 +93,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -96,7 +96,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
 -t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
 +t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
+ t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
+ t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
- 
- # Build a version of the test driver for the build platform.
-@@ -112,7 +112,7 @@ else
+@@ -117,7 +117,7 @@ else
  xtestsuite_libs = ../src/.libs/libgcrypt.so*
  xtestsuite_driver = testdrv
  t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -35,3 +35,6 @@ index 3170a58..9a9e1c2 100644
  endif
  
  # xcheck uses our new testdrv instead of the automake test runner.
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb
similarity index 95%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb
index 14cbe536473..d0236b58b31 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "24e91c9123a46c54e8371f3a3a2502f1198f2893fbfbf59af95bc1c21499b00e"
+SRC_URI[sha256sum] = "6ba59dd192270e8c1d22ddb41a07d95dcdbc1f0fb02d03c4b54b235814330aac"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.34.1


