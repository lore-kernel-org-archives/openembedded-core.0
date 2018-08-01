Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7398778DCC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 08:03:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7183oZq009120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 01:03:50 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 01:03:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 16:14:04 +0800
Message-ID: <c278c5d25095596395c7a4ab818dc223ab00efa3.1533111205.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533111205.git.liezhi.yang@windriver.com>
References: <cover.1533111205.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] e2fsprogs: 1.44.2 -> 1.44.3
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
X-List-Received-Date: Wed, 01 Aug 2018 08:03:49 -0000
Content-Type: text/plain

Rebased ptest.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/e2fsprogs/ptest.patch                | 49 ++++++++++++----------
 .../{e2fsprogs_1.44.2.bb => e2fsprogs_1.44.3.bb}   |  2 +-
 2 files changed, 29 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.44.2.bb => e2fsprogs_1.44.3.bb} (98%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index 7c4bb39..64a791d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Inappropriate
 
-Index: git/tests/Makefile.in
-===================================================================
---- git.orig/tests/Makefile.in
-+++ git/tests/Makefile.in
-@@ -18,7 +18,7 @@ test_one: $(srcdir)/test_one.in Makefile
+diff --git a/tests/Makefile.in b/tests/Makefile.in
+index 8c4d204..e021af3 100644
+--- a/tests/Makefile.in
++++ b/tests/Makefile.in
+@@ -19,7 +19,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
  	@echo "#!/bin/sh" > test_one
  	@echo "HTREE=y" >> test_one
  	@echo "QUOTA=y" >> test_one
@@ -13,20 +13,20 @@ Index: git/tests/Makefile.in
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
  	@echo "SIZEOF_TIME_T=@SIZEOF_TIME_T@" >> test_one
  	@echo "DD=@DD@" >>test_one
-@@ -28,7 +28,7 @@ test_one: $(srcdir)/test_one.in Makefile
- test_script: test_one test_script.in Makefile mke2fs.conf
+@@ -30,7 +30,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf
  	@echo "Creating test_script..."
+ 	@[ -f test_script ] && chmod u+w test_script || true
  	@echo "#!/bin/sh" > test_script
 -	@echo "SRCDIR=@srcdir@" >> test_script
 +	@echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
  	@cat $(srcdir)/test_script.in >> test_script
- 	@chmod +x test_script
+ 	@chmod +x-w test_script
  
-Index: git/tests/test_config
-===================================================================
---- git.orig/tests/test_config
-+++ git/tests/test_config
-@@ -3,24 +3,24 @@
+diff --git a/tests/test_config b/tests/test_config
+index 1f146ca..52c453f 100644
+--- a/tests/test_config
++++ b/tests/test_config
+@@ -3,16 +3,16 @@
  #
  
  unset LANG LANGUAGE LC_ADDRESS LC_ALL LC_COLLATE LC_CTYPE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME PAGER
@@ -40,8 +40,6 @@ Index: git/tests/test_config
 -E2IMAGE_EXE="../misc/e2image"
 -DEBUGFS="$USE_VALGRIND ../debugfs/debugfs"
 -DEBUGFS_EXE="../debugfs/debugfs"
--TEST_BITS="../debugfs/debugfs"
--RESIZE2FS_EXE="../resize/resize2fs"
 +FSCK="$USE_VALGRIND e2fsck"
 +MKE2FS="$USE_VALGRIND mke2fs"
 +DUMPE2FS="$USE_VALGRIND dumpe2fs"
@@ -49,28 +47,37 @@ Index: git/tests/test_config
 +CHATTR="$USE_VALGRIND chattr"
 +LSATTR="$USE_VALGRIND lsattr"
 +E2IMAGE="$USE_VALGRIND e2image"
-+E2IMAGE_EXE="/sbin/e2image"
++E2IMAGE_EXE=/sbin/e2image"
 +DEBUGFS="$USE_VALGRIND debugfs"
 +DEBUGFS_EXE="/sbin/debugfs"
-+TEST_BITS="/sbin/debugfs"
+ TEST_BITS="test_data.tmp"
+ if [ ! -s $TEST_BITS ]; then
+ 	# create a non-sparse test file if possible, since debugfs may be
+@@ -21,14 +21,14 @@ if [ ! -s $TEST_BITS ]; then
+ 	dd if=/dev/urandom of=$TEST_BITS bs=128k count=1 > /dev/null 2>&1 ||
+ 		TEST_BITS="$DEFBUGFS_EXE"
+ fi
+-RESIZE2FS_EXE="../resize/resize2fs"
 +RESIZE2FS_EXE="/sbin/resize2fs"
  RESIZE2FS="$USE_VALGRIND $RESIZE2FS_EXE"
 -E2UNDO_EXE="../misc/e2undo"
 +E2UNDO_EXE="/sbin/e2undo"
  E2UNDO="$USE_VALGRIND $E2UNDO_EXE"
+-E2MMPSTATUS="$USE_VALGRIND ../misc/dumpe2fs -m"
 -TEST_REL=../tests/progs/test_rel
 -TEST_ICOUNT=../tests/progs/test_icount
 -CRCSUM=../tests/progs/crcsum
++E2MMPSTATUS="$USE_VALGRIND dumpe2fs -m"
 +TEST_REL=./progs/test_rel
 +TEST_ICOUNT=./progs/test_icount
 +CRCSUM=./progs/crcsum
  CLEAN_OUTPUT="sed -f $cmd_dir/filter.sed"
  LD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${LD_LIBRARY_PATH}
  DYLD_LIBRARY_PATH=../lib:../lib/ext2fs:../lib/e2p:../lib/et:../lib/ss:${DYLD_LIBRARY_PATH}
-Index: git/tests/test_script.in
-===================================================================
---- git.orig/tests/test_script.in
-+++ git/tests/test_script.in
+diff --git a/tests/test_script.in b/tests/test_script.in
+index 9959e30..442999d 100644
+--- a/tests/test_script.in
++++ b/tests/test_script.in
 @@ -39,7 +39,7 @@ for i; do
  done
  
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.2.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
similarity index 98%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.2.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
index f2537a5..d7391ee 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.2.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
@@ -12,7 +12,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
                                 file://quiet-debugfs.patch \
 "
 
-SRCREV = "7b9ea51db3be8972c7a17de25be179b18fc9fcde"
+SRCREV = "85e53f42f98d5334914de01e972e9ed44bccd0a5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.7.4


