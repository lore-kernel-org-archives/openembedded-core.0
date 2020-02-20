Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D016E615FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 02:29:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,462,1574092800"; d="scan'208";a="83594396"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Feb 2020 10:29:39 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 726FA50A9978
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:19:58 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 20 Feb 2020 10:29:36 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 20 Feb 2020 10:29:43 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2020 01:41:34 -0800
Message-ID: <1582191694-130901-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 726FA50A9978.A41D0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] nfs-utils: upgrade 2.4.2 -> 2.4.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Feb 2020 02:29:38 -0000
Content-Type: text/plain

0001-Don-t-build-tools-with-CC_FOR_BUILD.patch
Removed since it is included in 2.4.3.

refresh the following patch:
0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-Don-t-build-tools-with-CC_FOR_BUILD.patch | 40 -------------------
 ...-fix-undefined-function-for-libnsm.a.patch | 12 ++++--
 ...{nfs-utils_2.4.2.bb => nfs-utils_2.4.3.bb} |  5 +--
 3 files changed, 10 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.4.2.bb => nfs-utils_2.4.3.bb} (96%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch
deleted file mode 100644
index 23bc3eaf72..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Don-t-build-tools-with-CC_FOR_BUILD.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 79019d976584c598f8d0a9d8de43c989946f974b Mon Sep 17 00:00:00 2001
-From: Pascal Bach <pascal.bach@siemens.com>
-Date: Wed, 13 Feb 2019 09:28:07 +0100
-Subject: [PATCH] Don't build tools with CC_FOR_BUILD
-
-The tools are intended for the target not for the host.
-
-Upstream-Status: Pending
-
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
----
- tools/locktest/Makefile.am | 1 -
- tools/rpcgen/Makefile.am   | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
-index 3156815..87d0bac 100644
---- a/tools/locktest/Makefile.am
-+++ b/tools/locktest/Makefile.am
-@@ -1,6 +1,5 @@
- ## Process this file with automake to produce Makefile.in
- 
--CC=$(CC_FOR_BUILD)
- LIBTOOL = @LIBTOOL@ --tag=CC
- 
- noinst_PROGRAMS = testlk
-diff --git a/tools/rpcgen/Makefile.am b/tools/rpcgen/Makefile.am
-index 8a9ec89..3e092c9 100644
---- a/tools/rpcgen/Makefile.am
-+++ b/tools/rpcgen/Makefile.am
-@@ -1,6 +1,5 @@
- ## Process this file with automake to produce Makefile.in
- 
--CC=$(CC_FOR_BUILD)
- LIBTOOL = @LIBTOOL@ --tag=CC
- 
- noinst_PROGRAMS = rpcgen
--- 
-2.11.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
index fcb0e99b33..bd350144e3 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch
@@ -28,10 +28,10 @@ Rebase it.
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
  support/misc/Makefile.am |   2 +-
- support/misc/file.c      | 111 ---------------------------------------------------------------------------------------------------------------
+ support/misc/file.c      | 115 ---------------------------------------------------------------------------------------------------------------
  support/misc/misc.c      | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  support/nsm/Makefile.am  |   2 +-
- 4 files changed, 113 insertions(+), 113 deletions(-)
+ 4 files changed, 113 insertions(+), 117 deletions(-)
 
 diff --git a/support/misc/Makefile.am b/support/misc/Makefile.am
 index f9993e3..8b0e9db 100644
@@ -48,10 +48,10 @@ index f9993e3..8b0e9db 100644
  MAINTAINERCLEANFILES = Makefile.in
 diff --git a/support/misc/file.c b/support/misc/file.c
 deleted file mode 100644
-index e7c3819..0000000
+index 06f6bb2..0000000
 --- a/support/misc/file.c
 +++ /dev/null
-@@ -1,111 +0,0 @@
+@@ -1,115 +0,0 @@
 -/*
 - * Copyright 2009 Oracle.  All rights reserved.
 - * Copyright 2017 Red Hat, Inc.  All rights reserved.
@@ -72,6 +72,10 @@ index e7c3819..0000000
 - * along with nfs-utils.  If not, see <http://www.gnu.org/licenses/>.
 - */
 -
+-#ifdef HAVE_CONFIG_H
+-#include <config.h>
+-#endif
+-
 -#include <sys/stat.h>
 -
 -#include <string.h>
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
similarity index 96%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.2.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
index 6647d3428b..42a4ba3dbd 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
@@ -30,11 +30,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://bugfix-adjust-statd-service-name.patch \
            file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
-           file://0001-Don-t-build-tools-with-CC_FOR_BUILD.patch \
            file://clang-warnings.patch \
            "
-SRC_URI[md5sum] = "d427c6b3014e9a04e8498f0598b1c1b9"
-SRC_URI[sha256sum] = "4464737a03d5f73ded2ffefe19d5543ed7b1d6c541985d8acaafdc8025aa1038"
+SRC_URI[md5sum] = "06020c76f531ed97f3145514901e0e7c"
+SRC_URI[sha256sum] = "af65fce5dd8370cff9ead67baac5a6cd69c376dcadfef264dc2c78c904f26599"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.17.1




