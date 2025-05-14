Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB8FC3ABD9
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 07:17:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.96726.1747207028626340148
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 00:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72290b1e6d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E4oG1e014178
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:17:07 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbc8rpgp-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:17:07 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 14 May 2025 00:17:03 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 14 May 2025 00:17:03 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <liezhi.yang@windriver.com>
Subject: [PATCH 2/2] coreutils: Drop 0001-local.mk-fix-cross-compiling-problem.patch
Date: Wed, 14 May 2025 00:17:04 -0700
Message-ID: <dd20c0e70eef5d5a9504363a67e12a4c5cac9735.1747206852.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747206852.git.liezhi.yang@windriver.com>
References: <cover.1747206852.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DE_1ATjFw4DAWrb9QuPzFPtIl0xQXjbk
X-Proofpoint-ORIG-GUID: DE_1ATjFw4DAWrb9QuPzFPtIl0xQXjbk
X-Authority-Analysis: v=2.4 cv=IIACChvG c=1 sm=1 tr=0 ts=68244373 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=3SBlwN17MHap7KN7nAoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA2MiBTYWx0ZWRfX4FUbLVih+qza PaYTufKGaXpZuSezDco6sM1jLCpm/4gaXnkD0fEI5jckGZiBQNjnscdmrZaToPB9fhKYJWpwKye i3Id+1i4+uNqlR+Q14JE1m+b4B7OxTJyGl3NB9VHYQR5Cs7SwayxS5c5GvbTJtQk5hWRcmyd+Mg
 sRlUMOkRaUVvV7HoHR0vqp59fp7uQNpEy9mPjwSfBMIOckOgzEzbmU8DJ80GcC2ajZGXXRKC8Om Sb6uWzUJkI5RVwGcoS89uoUx/UB2/EB/t7CqRGdxx6BZ1elzJho4nSqsIPzjx2zAT+o5Ci5Rqvf 0/kLlYxT6grshXQRDxGsQIexJD4C5tOOXzSdH0C/Qj+P4Q1zHzkwfLRfTb24QemklUzZUehhkxs
 QLDwoBqoMZbAdY6M8dD7U3X52e8ieK0qoq2mWlNn2f07orp/nEx91XQVYfaHiYXhJo9+5Vmw
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1011 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 07:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216481

From: Robert Yang <liezhi.yang@windriver.com>

The patch is used for fixing:
| Makefile:3418: *** Recursive variable 'INSTALL' references itself (eventually).  Stop.

Now the code and check and set that correctly:
if CROSS_COMPILING
cu_install_program = @INSTALL@
else
cu_install_program = src/ginstall
endif

So just drop the patch.

And also remove the ginstall hack to fix ptest case failure when single-binary
is enabled, I can't find the reason on why it was needed from git log.

Fixed:
install: missing file operand
Try 'install --help' for more information.

* Reproducer:
DISTRO_FEATURES:append = " ptest"
EXTRA_IMAGE_FEATURES:append = " ptest-pkgs"
IMAGE_INSTALL:append = " coreutils"
PACKAGECONFIG:append:pn-coreutils = " single-binary"

$ bitbake core-image-sato
$ runqemu tmp/deploy/images/qemux86-64/ nographic kvm

On target:
$ cd /usr/lib/coreutils/ptest
$ ./run-ptest
============================================================================
Testsuite summary for GNU coreutils 9.6
============================================================================
TOTAL: 655
PASS:  529
SKIP:  126
XFAIL: 0
FAIL:  0
XPASS: 0
ERROR: 0
============================================================================
make[1]: Leaving directory '/usr/lib/coreutils/ptest'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...local.mk-fix-cross-compiling-problem.patch | 26 -------------------
 meta/recipes-core/coreutils/coreutils_9.6.bb  |  3 ---
 2 files changed, 29 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch b/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
deleted file mode 100644
index 97a6357ab9..0000000000
--- a/meta/recipes-core/coreutils/coreutils/0001-local.mk-fix-cross-compiling-problem.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 7cb2d20cfa2a27191255031d231cd41917dcffe8 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 26 Dec 2016 16:10:35 +0800
-Subject: [PATCH] local.mk: fix cross compiling problem
-
-We meet the following error when cross compiling.
-| Makefile:3418: *** Recursive variable 'INSTALL' references itself (eventually).  Stop.
-This patch fixes this problem.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/local.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/local.mk b/src/local.mk
-index 96ee941..cdd47d6 100644
---- a/src/local.mk
-+++ b/src/local.mk
-@@ -704,4 +704,4 @@ cu_install_program = @INSTALL@
- else
- cu_install_program = src/ginstall
- endif
--INSTALL = $(cu_install_program) -c
-+INSTALL_PROGRAM = $(cu_install_program)
diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index c9fd3719d5..1b18d250d2 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -15,7 +15,6 @@ inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
-           file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://intermittent-testfailure.patch \
            file://0001-ls-fix-crash-with-context.patch \
            file://0001-cksum-port-to-32-bit-uint_fast32_t.patch \
@@ -184,7 +183,6 @@ RRECOMMENDS:${PN}-dev += "${DEVDEPS}"
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests
-    sed -i 's/ginstall/install/g'  `grep -R ginstall ${D}${PTEST_PATH}/tests | awk -F: '{print $1}' | uniq`
     install -d ${D}${PTEST_PATH}/build-aux
     install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
     install -Dm 0644 ${B}/lib/config.h ${D}${PTEST_PATH}/lib/config.h
@@ -198,7 +196,6 @@ do_install_ptest () {
     sed -i '/^abs_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
     sed -i '/^abs_top_builddir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
     sed -i '/^abs_top_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
-    sed -i '/^built_programs/s/ginstall/install/g' ${D}${PTEST_PATH}/Makefile
     sed -i '/^CC =/s/ --sysroot=.*recipe-sysroot/ /g' ${D}${PTEST_PATH}/Makefile
     sed -i '/^BUILD_LDFLAGS =/d' ${D}${PTEST_PATH}/Makefile
     chmod -R 777 ${D}${PTEST_PATH}
-- 
2.49.0


