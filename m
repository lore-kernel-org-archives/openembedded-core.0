Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE2074778
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 06:26:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2018 23:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,338,1534834800"; d="scan'208";a="75300207"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.255])
	by fmsmga007.fm.intel.com with ESMTP; 03 Oct 2018 23:26:47 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 14:26:45 +0800
Message-Id: <20181004062645.5994-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] e2fsprogs: fix stray quote in test configuration
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
X-List-Received-Date: Thu, 04 Oct 2018 06:26:47 -0000

Introduced during the last recipe upgrade and was causing tests to fail.

Fixes [YOCTO #12946]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../e2fsprogs/e2fsprogs/ptest.patch           | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index 64a791dfab..4e6b6292e1 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,7 +1,18 @@
+From b8842065ad621a03a971dfd50db862c5bffdeb49 Mon Sep 17 00:00:00 2001
+From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
+Date: Sat, 18 Apr 2015 17:58:17 +0300
+Subject: [PATCH] e2fsprogs: add ptest
+
 Upstream-Status: Inappropriate
 
+---
+ tests/Makefile.in    |  4 ++--
+ tests/test_config    | 32 ++++++++++++++++----------------
+ tests/test_script.in |  2 +-
+ 3 files changed, 19 insertions(+), 19 deletions(-)
+
 diff --git a/tests/Makefile.in b/tests/Makefile.in
-index 8c4d204..e021af3 100644
+index 8c4d2048..e021af32 100644
 --- a/tests/Makefile.in
 +++ b/tests/Makefile.in
 @@ -19,7 +19,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
@@ -23,7 +34,7 @@ index 8c4d204..e021af3 100644
  	@chmod +x-w test_script
  
 diff --git a/tests/test_config b/tests/test_config
-index 1f146ca..52c453f 100644
+index 1f146ca2..05125f9c 100644
 --- a/tests/test_config
 +++ b/tests/test_config
 @@ -3,16 +3,16 @@
@@ -47,7 +58,7 @@ index 1f146ca..52c453f 100644
 +CHATTR="$USE_VALGRIND chattr"
 +LSATTR="$USE_VALGRIND lsattr"
 +E2IMAGE="$USE_VALGRIND e2image"
-+E2IMAGE_EXE=/sbin/e2image"
++E2IMAGE_EXE="/sbin/e2image"
 +DEBUGFS="$USE_VALGRIND debugfs"
 +DEBUGFS_EXE="/sbin/debugfs"
  TEST_BITS="test_data.tmp"
@@ -75,7 +86,7 @@ index 1f146ca..52c453f 100644
  LD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${LD_LIBRARY_PATH}
  DYLD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${DYLD_LIBRARY_PATH}
 diff --git a/tests/test_script.in b/tests/test_script.in
-index 9959e30..442999d 100644
+index 9959e308..442999db 100644
 --- a/tests/test_script.in
 +++ b/tests/test_script.in
 @@ -39,7 +39,7 @@ for i; do
-- 
2.17.1


