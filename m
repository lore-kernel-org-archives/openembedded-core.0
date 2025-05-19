Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158BEC54795
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 08:10:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.46128.1747642209654608882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 01:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=723466fbd7=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J70bN0005894
	for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 08:10:08 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46phe8sp1h-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 08:10:08 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 19 May 2025 01:09:54 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 19 May 2025 01:09:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/4] libgcrypt: upgrade 1.11.0 -> 1.11.1
Date: Mon, 19 May 2025 16:10:00 +0800
Message-ID: <20250519081000.2298461-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519081000.2298461-1-hongxu.jia@windriver.com>
References: <20250519081000.2298461-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0RmCC1_k_3JFpvaKegfFQu-2IN_2RlfW
X-Proofpoint-ORIG-GUID: 0RmCC1_k_3JFpvaKegfFQu-2IN_2RlfW
X-Authority-Analysis: v=2.4 cv=arGyCTZV c=1 sm=1 tr=0 ts=682ae760 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=57SyGIRnAAAA:8 a=7CQSdrXTAAAA:8 a=U5hnmAXBDlkzuYqGqjMA:9
 a=_PE9Q_0Z8bzuyU0-:21 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA3NiBTYWx0ZWRfXxP3MeMu7WXJT M87B5tu+efemm1wLl5YoK8+hzjCRoGR+uhynLpvZYyNic9p+4Fb5sqGaQ7kSbRq7RagQqhGNy9i R4xbS7heGeeATd/0QnquD9i70O+/+YMFPwDyy2SLSIW0haWOAUWmPXflp9NvFbwmmHtazT2ww+s
 Kh0MXUq+TSdzjgnqmJEmyh+lDrTLLzMO8HKbtI6TUhjZWRd1sMo5bBH17IMAchbkMxLkHxhkGer E0Ujt1crNSUFKs2OKmfbgd087bLLiFa61bynFqpCKH/PrPVhV4fj2Dh1LR/XBhhtWKbfot2cXzE sZYU8WSZTbgbGnt4fGpDRzBPv7Uf4oroSDV9Fo79pbZ8UUGPW+YWwA6Md43SHQMU0H1adlLbPkA
 vJO9F8SNWZktwt9qih2RZhNSX4LjiX1MFky8rvd3F2b6FRFxY/P+5AHNhlzWJp2BF01dpTGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505190076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 08:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216825

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...01-libgcrypt-fix-m4-file-for-oe-core.patch |  8 +--
 ...ilding-error-with-O2-in-sysroot-path.patch | 49 -------------------
 ...m-fix-undefined-reference-to-pthread.patch |  9 ++--
 .../libgcrypt/files/no-bench-slope.patch      | 10 ++--
 .../libgcrypt/files/no-native-gpg-error.patch | 10 +++-
 ...ibgcrypt_1.11.0.bb => libgcrypt_1.11.1.bb} |  3 +-
 6 files changed, 23 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.11.0.bb => libgcrypt_1.11.1.bb} (91%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index 9615611f6eb..7b840644d4e 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From bcfd89abdb5110b93314297120412d4c7f2da313 Mon Sep 17 00:00:00 2001
+From fcb53181b18c00083a8b08625db74829cfd6b4b2 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
@@ -11,13 +11,12 @@ settings.
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
 ---
  src/libgcrypt.m4 | 90 +++---------------------------------------------
  1 file changed, 4 insertions(+), 86 deletions(-)
 
 diff --git a/src/libgcrypt.m4 b/src/libgcrypt.m4
-index 353df81b6d..b195e22894 100644
+index 353df81..b195e22 100644
 --- a/src/libgcrypt.m4
 +++ b/src/libgcrypt.m4
 @@ -116,41 +116,6 @@ dnl
@@ -144,6 +143,3 @@ index 353df81b6d..b195e22894 100644
      ifelse([$3], , :, [$3])
    fi
    AC_SUBST(LIBGCRYPT_CFLAGS)
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
deleted file mode 100644
index 78b02eda9d2..00000000000
--- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From e96df0c82e086bf348753d2d0fa37fa6191b4b14 Mon Sep 17 00:00:00 2001
-From: "simit.ghane" <simit.ghane@lge.com>
-Date: Tue, 11 Jun 2024 07:22:28 +0530
-Subject: [PATCH] random:cipher: handle substitution in sed command
-
-Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=e96df0c82e086bf348753d2d0fa37fa6191b4b14]
-
-* cipher/Makefile.am (o_flag_munging): Add 'g' flag for first sed
-expression.
-* random/Makefile.am (o_flag_munging): Likewise.
---
-
-It was there earlier and accidentally removed from
-Makefile.am of cipher and random
-
-Signed-off-by: simit.ghane <simit.ghane@lge.com>
-[jk: add changelog to commit message]
-Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
----
- cipher/Makefile.am | 2 +-
- random/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index ea9014cc98..149c9f2101 100644
---- a/cipher/Makefile.am
-+++ b/cipher/Makefile.am
-@@ -169,7 +169,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
- 
- 
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /' -e 's/[[:blank:]]-Ofast/ -O1 /g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
- else
- o_flag_munging = cat
- endif
-diff --git a/random/Makefile.am b/random/Makefile.am
-index c7100ef8b8..a42e430649 100644
---- a/random/Makefile.am
-+++ b/random/Makefile.am
-@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
- 
- # The rndjent module needs to be compiled without optimization.  */
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /' -e 's/[[:blank:]]-Ofast/ -O0 /g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
- else
- o_flag_munging = cat
- endif
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index 4233fa7877f..ccf4e18910b 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From 9182bc2dc676858a823c477d8f45a578b8c4f69f Mon Sep 17 00:00:00 2001
+From c7a99e7a15f1f703ac90fc2a16b2c2115a66a996 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 12 Jun 2016 04:44:29 -0400
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
@@ -9,16 +9,15 @@ Add missing '-lpthread' to CFLAGS
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  tests/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index e6953fd..f47e1d3 100644
+index 3170a58..9a9e1c2 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -76,7 +76,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -93,7 +93,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -27,7 +26,7 @@ index e6953fd..f47e1d3 100644
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
  
  # Build a version of the test driver for the build platform.
-@@ -95,7 +95,7 @@ else
+@@ -112,7 +112,7 @@ else
  xtestsuite_libs = ../src/.libs/libgcrypt.so*
  xtestsuite_driver = testdrv
  t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index ed65ed4e67c..44aac1913e1 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,3 +1,8 @@
+From eb3a5bc4d5a212da64c0f9396c7f31f83aa6f36c Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 9 Sep 2022 11:13:37 +0100
+Subject: [PATCH] libgcrypt: disable bench-slope test case
+
 The bench-slope test appears to be aborting fairly frequently, which causes
 failures on the autobuilder.
 
@@ -10,10 +15,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index bfca4c2314..5a755f512e 100644
+index 634b718..1e9dddb 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
-@@ -77,7 +77,6 @@ static struct {
+@@ -76,7 +76,6 @@ static struct {
     { "t-x448"      },
     { "t-ed448"     },
     { "benchmark"   },
@@ -21,4 +26,3 @@ index bfca4c2314..5a755f512e 100644
     { "hashtest-6g", "hashtest", "--hugeblock --gigs 6 SHA1 SHA256 SHA512 "
                                                       "SHA3-512 SM3 BLAKE2S_256 "
                                                       "BLAKE2B_512 CRC32 "
-
diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
index b9a607863d3..98874ce12a9 100644
--- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -1,11 +1,19 @@
+From ede03b847038afc294e206ca345d12d75bbba844 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 26 Aug 2022 15:23:37 +0100
+Subject: [PATCH] libgcrypt: rewrite ptest
+
 Don't depend on a native libgpg-error to build the test driver, as it's
 an optional dependency for some C annotations.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/testdrv.c | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index 0ccde326..6d6abd57 100644
+index bfca4c2..634b718 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
 @@ -32,7 +32,6 @@
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
similarity index 91%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
index ea1f34e8cea..e51a20e5bfb 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
@@ -20,13 +20,12 @@ DEPENDS = "libgpg-error"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-libgcrypt-fix-m4-file-for-oe-core.patch \
-           file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "09120c9867ce7f2081d6aaa1775386b98c2f2f246135761aae47d81f58685b9c"
+SRC_URI[sha256sum] = "24e91c9123a46c54e8371f3a3a2502f1198f2893fbfbf59af95bc1c21499b00e"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.34.1


