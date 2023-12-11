Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B25BC46CC5
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 14:49:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10204.1702306191530165722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 06:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PyuRJ4nT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07098ab644=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBBK2qB024290
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 06:49:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=olj9JNuXxGvxfBRv4BUTuegdpcxJ9nN+N1A+n31mwkE=; b=
	PyuRJ4nTv0dBuKWJOPjhayN9VvrPs1BWU7pDQF2hF12USo3DhJbhJvtRm+9GXOPT
	33yW1c+LC9bJ191fBxO+3iYUM6vehPtVDhG9Wann57iIlfzk8XGMlvjvUKkfqTW6
	34F76GsdIVRJ0gc2zwPA10OG7C5PSO7b5lV3hbJwpYb2M8NzIvT9CzYKRmA1Mnil
	VNsx/gxRBsn4llRATSx2YypxR9JTmp6Dtkn5xNn4dInEQbSkmHxYAJF9VV57RfxM
	drmrOPZlkXBZRCJvMccFBHMLUV82rnaWyTwmAkxjXQhUVOQoJyNsQ1eesFzE/l2t
	nhlRXFod2cxGjlMkzSjbxA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uwyxj8843-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 06:49:51 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 06:49:55 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 06:49:55 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 1/1] nfs-utils: Upgrade 2.6.3 -> 2.6.4
Date: Mon, 11 Dec 2023 06:49:50 -0800
Message-ID: <fbf5151e16f5c406e752c3e221d8ebdb5286c7be.1702306082.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702306082.git.liezhi.yang@windriver.com>
References: <cover.1702306082.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MJ5v7RLo8S1DQZOVQTWINrS0DsNbjMnC
X-Proofpoint-GUID: MJ5v7RLo8S1DQZOVQTWINrS0DsNbjMnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 14:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192172

From: Robert Yang <liezhi.yang@windriver.com>

* Remove backported patch 0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch.
* Add 0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch to fix build with musl

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...event-and-libsqlite3-checked-when-nf.patch | 80 -------------------
 ...nclude-unistd.h-to-compile-with-musl.patch | 34 ++++++++
 ...{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} |  8 +-
 3 files changed, 38 insertions(+), 84 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} (94%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
deleted file mode 100644
index 5afc714f190..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From b62a3fe424026b73ec6b1934483b16863c7dff23 Mon Sep 17 00:00:00 2001
-From: Wiktor Jaskulski <wjaskulski@adva.com>
-Date: Thu, 11 May 2023 15:28:23 -0400
-Subject: [PATCH] configure.ac: libevent and libsqlite3 checked when nfsv4 is
- disabled
-
-Upstream-Status: Backport
-(http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bc4a5deef9f820c55fdac3c0070364c17cd91cca)
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- configure.ac | 38 +++++++++++++++-----------------------
- 1 file changed, 15 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4ade528d..519cacbf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -335,42 +335,34 @@ AC_CHECK_HEADER(rpc/rpc.h, ,
-                 AC_MSG_ERROR([Header file rpc/rpc.h not found - maybe try building with --enable-tirpc]))
- CPPFLAGS="${nfsutils_save_CPPFLAGS}"
- 
-+dnl check for libevent libraries and headers
-+AC_LIBEVENT
-+
-+dnl Check for sqlite3
-+AC_SQLITE3_VERS
-+
-+case $libsqlite3_cv_is_recent in
-+yes) ;;
-+unknown)
-+   dnl do not fail when cross-compiling
-+   AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
-+*)
-+   AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
-+esac
-+
- if test "$enable_nfsv4" = yes; then
--  dnl check for libevent libraries and headers
--  AC_LIBEVENT
- 
-   dnl check for the keyutils libraries and headers
-   AC_KEYUTILS
- 
--  dnl Check for sqlite3
--  AC_SQLITE3_VERS
--
-   if test "$enable_nfsdcld" = "yes"; then
- 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
- 		AC_MSG_ERROR([Cannot find header needed for nfsdcld]))
--
--    case $libsqlite3_cv_is_recent in
--    yes) ;;
--    unknown)
--      dnl do not fail when cross-compiling
--      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
--    *)
--      AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
--    esac
-   fi
- 
-   if test "$enable_nfsdcltrack" = "yes"; then
- 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
- 		AC_MSG_ERROR([Cannot find header needed for nfsdcltrack]))
--
--    case $libsqlite3_cv_is_recent in
--    yes) ;;
--    unknown)
--      dnl do not fail when cross-compiling
--      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
--    *)
--      AC_MSG_ERROR([nfsdcltrack requires sqlite-devel]) ;;
--    esac
-   fi
- 
- else
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
new file mode 100644
index 00000000000..8607b64cb1f
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch
@@ -0,0 +1,34 @@
+From 45597a58e98f351b18db8444292b1cf6dd0cd810 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sat, 9 Dec 2023 23:34:08 -0800
+Subject: [PATCH] reexport.h: Include unistd.h to compile with musl
+
+Fixed error when compile with musl
+reexport.c: In function 'reexpdb_init':
+reexport.c:62:17: error: implicit declaration of function 'sleep' [-Werror=implicit-function-declaration]
+   62 |                 sleep(1);
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ support/reexport/reexport.h | 1 +
+ 1 files changed, 1 insertions(+)
+
+diff --git a/support/reexport/reexport.h b/support/reexport/reexport.h
+index 85fd59c..02f8684 100644
+--- a/support/reexport/reexport.h
++++ b/support/reexport/reexport.h
+@@ -1,6 +1,8 @@
+ #ifndef REEXPORT_H
+ #define REEXPORT_H
+ 
++#include <unistd.h>
++
+ #include "nfslib.h"
+ 
+ enum {
+-- 
+2.42.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
similarity index 94%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
index 35cf6af6d46..2f2644f9a83 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
@@ -30,11 +30,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://bugfix-adjust-statd-service-name.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
-           file://0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch \
-	   file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
-	   file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
+           file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
+           file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
+           file://0001-reexport.h-Include-unistd.h-to-compile-with-musl.patch \
            "
-SRC_URI[sha256sum] = "38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1"
+SRC_URI[sha256sum] = "01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.42.0


