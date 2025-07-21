Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE201C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:48:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41251.1753105680059950546
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92971a342b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L6t2E31250193
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:47:59 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0sttu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:47:59 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 21 Jul 2025 06:47:47 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 21 Jul 2025 06:47:47 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] e2fsprogs: 1.47.1 -> 1.47.3
Date: Mon, 21 Jul 2025 06:48:00 -0700
Message-ID: <0d519f7e190e5ee58ed27cec1fec99af3c88bbf5.1753105314.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1753105314.git.liezhi.yang@windriver.com>
References: <cover.1753105314.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfXzhakSiiNtbUL
 YI/5+d/wBUtdakeqcJ+ncihTVRd/8qgaISGH7pmP2EowoopNryuE7UnOPfYat17bGpKcPTuFEme
 CXjAdLS3RLsnkTIgiJCDACssPmK8/ACntPpnnYszgqZyEdeaPpB9SMW6We4r+mPemRbBmKQG6M+
 f+aT4I3PxF/oR0DMxBIczFpn761GH6Ju91jnCx0p4Lj21BdYqQTItXTV0zQNqYvIQazQ/t7cY7f
 Tx4SgPj8RoYI7P5cIqbk+t1K0wW01Jrryu85Ur1rWisdEwP3/r750R8LX0lwSnuMSX0OERwV2+s
 Hu8KC8/e7tUA7ypztGmhitOpDJi2DXxGti9/IrAm4lVeCeBm8z/pLMAmDUQjNuZtsckWzq/QOJB
 TLRzZQ4f
X-Proofpoint-ORIG-GUID: 9mQ2BbofhNXcoDbezJ38h0W8raKA1ZIa
X-Proofpoint-GUID: 9mQ2BbofhNXcoDbezJ38h0W8raKA1ZIa
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687e450f cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=cmWlzMUdAAAA:8 a=pGLkceISAAAA:8 a=L7H8brqWqyyW7fCVVVcA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=93ApFmx_MQ_BoSUK457J:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220696

From: Robert Yang <liezhi.yang@windriver.com>

* Remove backported patch 0001-libext2fs-fix-std-c23-build-failure.patch
* Fixed QA Issue:
  ERROR: e2fsprogs-1.47.2-r0 do_package_qa: QA Issue: File /usr/lib/e2fsprogs/ptest/test/test_one in package e2fsprogs-ptest contains reference to TMPDIR [buildpaths]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-libext2fs-fix-std-c23-build-failure.patch | 42 -------------------
 ...2fsprogs_1.47.1.bb => e2fsprogs_1.47.2.bb} |  8 ++--
 2 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.1.bb => e2fsprogs_1.47.2.bb} (96%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
deleted file mode 100644
index 01ab9d5afb..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 72dcef02bee9924c4d5b3dc6e7ef4d07becebcc6 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Fri, 22 Nov 2024 12:36:32 +0000
-Subject: [PATCH] libext2fs: fix -std=c23 build failure
-
-gcc-15 switched to -std=c23 by default:
-
-    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
-
-As a result `e2fsprogs` fails the build so only typedef int bool
-for __STDC_VERSION__ <= 201710L (C17)
-
-    ../../../lib/ext2fs/tdb.c:113:13: error: two or more data types in declaration specifiers
-    ../../../lib/ext2fs/tdb.c:113:1: warning: useless type name in empty declaration
-      113 | typedef int bool;
-          | ^~~~~~~
-
-https://github.com/tytso/e2fsprogs/issues/202
-
-Upstream-Status: Backport [https://github.com/tytso/e2fsprogs/commit/49fd04d77b3244c6c6990be41142168eef373aef]
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Link: https://lore.kernel.org/r/Z0B60JhdvT9bpSQ6@6f91903e89da
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/ext2fs/tdb.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/lib/ext2fs/tdb.c b/lib/ext2fs/tdb.c
-index b07b2917..98dc95d8 100644
---- a/lib/ext2fs/tdb.c
-+++ b/lib/ext2fs/tdb.c
-@@ -110,7 +110,9 @@ static char *rep_strdup(const char *s)
- #endif
- #endif
- 
-+#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
- typedef int bool;
-+#endif
- 
- #include "tdb.h"
- 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb
similarity index 96%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb
index 022b016f12..5a04591af0 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.2.bb
@@ -4,14 +4,13 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-libext2fs-fix-std-c23-build-failure.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
            file://quiet-debugfs.patch \
            "
 
-SRCREV = "b571b9b4240739a982e8bca62cfc914a3b50190a"
+SRCREV = "da631e117dcf8797bfda0f48bdaa05ac0fbcf7af"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
@@ -119,7 +118,7 @@ ALTERNATIVE:${PN}-tune2fs = "tune2fs"
 ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
 
 RDEPENDS:e2fsprogs-e2scrub = "bash"
-RDEPENDS:${PN}-ptest += "coreutils procps bash bzip2 diffutils perl sed"
+RDEPENDS:${PN}-ptest += "coreutils procps bash bzip2 diffutils perl sed grep"
 RDEPENDS:${PN}-ptest += "e2fsprogs-badblocks e2fsprogs-dumpe2fs e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-resize2fs e2fsprogs-tune2fs"
 
 do_compile_ptest() {
@@ -134,7 +133,8 @@ do_install_ptest() {
 	sed -e 's!../e2fsck/e2fsck!e2fsck!g' \
 	    -e 's!../misc/tune2fs!tune2fs!g' -i ${D}${PTEST_PATH}/test/*/expect*
 	sed -e 's!../e2fsck/e2fsck!${base_sbindir}/e2fsck!g' -i ${D}${PTEST_PATH}/test/*/script
-	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/test/test_script ${D}${PTEST_PATH}/test/test_one
+	sed -i -e 's#@PTEST_PATH@#${PTEST_PATH}#g' -e 's#^EGREP=.*#EGREP="grep -E"#' \
+        ${D}${PTEST_PATH}/test/test_script ${D}${PTEST_PATH}/test/test_one
 
 	# Remove various files
 	find "${D}${PTEST_PATH}" -type f \
-- 
2.49.0


