Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.301.1615826521017597028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4A05638C1329
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zstd: upgrading to 1.4.9 SUCCEEDED
Message-ID: <MADEUP.166C91A90B2453F9.17966@lists.openembedded.org>
X-Groupsio-MsgNum: 149499
Content-Type: multipart/mixed; boundary="===============4045297228196600059=="

--===============4045297228196600059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zstd* to *1.4.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-zstd-upgrade-1.4.8-1.4.9.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4045297228196600059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/zstd: PV changed from "1.4.8" to "1.4.9"
packages/core2-32-poky-linux/zstd: PKGV changed from 1.4.8 [default] to 1.4.9 [default]
Changes to packages/core2-32-poky-linux/zstd (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.4.8 to libzstd.so.1.4.9
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.4.8 to libzstd.so.1.4.9
  /usr/lib/libzstd.so.1.4.8 moved to /usr/lib/libzstd.so.1.4.9
packages/core2-32-poky-linux/zstd/zstd-dbg: PKGSIZE changed from 12087232 to 12421032 (+3%)
packages/core2-32-poky-linux/zstd/zstd-dbg: PV changed from "1.4.8" to "1.4.9"
packages/core2-32-poky-linux/zstd/zstd-dbg: PKGV changed from 1.4.8 [default] to 1.4.9 [default]
packages/core2-32-poky-linux/zstd/zstd-dbg: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"
packages/core2-32-poky-linux/zstd/zstd-dev: PKGSIZE changed from 161044 to 163579 (+2%)
packages/core2-32-poky-linux/zstd/zstd-dev: PV changed from "1.4.8" to "1.4.9"
packages/core2-32-poky-linux/zstd/zstd-dev: PKGV changed from 1.4.8 [default] to 1.4.9 [default]
packages/core2-32-poky-linux/zstd/zstd-dev: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"
packages/core2-32-poky-linux/zstd/zstd-doc: PV changed from "1.4.8" to "1.4.9"
packages/core2-32-poky-linux/zstd/zstd-doc: PKGV changed from 1.4.8 [default] to 1.4.9 [default]
packages/core2-32-poky-linux/zstd/zstd-doc: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"
packages/core2-32-poky-linux/zstd/zstd-locale: PV changed from "1.4.8" to "1.4.9"
packages/core2-32-poky-linux/zstd/zstd-locale: PKGV changed from 1.4.8 [default] to 1.4.9 [default]
packages/core2-32-poky-linux/zstd/zstd-locale: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"
packages/core2-32-poky-linux/zstd/zstd-src: PKGSIZE changed from 2552959 to 2588703 (+1%)
packages/core2-32-poky-linux/zstd/zstd-src: PV changed from "1.4.8" to "1.4.9"
packages/core2-32-poky-linux/zstd/zstd-src: PKGV changed from 1.4.8 [default] to 1.4.9 [default]
packages/core2-32-poky-linux/zstd/zstd-src: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"
packages/core2-32-poky-linux/zstd/zstd-staticdev: PKGSIZE changed from 5018098 to 5019710 (+0%)
packages/core2-32-poky-linux/zstd/zstd-staticdev: PV changed from "1.4.8" to "1.4.9"
packages/core2-32-poky-linux/zstd/zstd-staticdev: PKGV changed from 1.4.8 [default] to 1.4.9 [default]
packages/core2-32-poky-linux/zstd/zstd-staticdev: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"
packages/core2-32-poky-linux/zstd/zstd: PKGSIZE changed from 1776335 to 1796815 (+1%)
packages/core2-32-poky-linux/zstd/zstd: PV changed from "1.4.8" to "1.4.9"
packages/core2-32-poky-linux/zstd/zstd: PKGV changed from 1.4.8 [default] to 1.4.9 [default]
packages/core2-32-poky-linux/zstd/zstd: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"

--===============4045297228196600059==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-zstd-upgrade-1.4.8-1.4.9.patch"

From 9bb433c915c72b9528b05bd8a6b15c9ccece6831 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 07:24:13 +0000
Subject: [PATCH] zstd: upgrade 1.4.8 -> 1.4.9

---
 ...rt-all-wildcard-file-list-expansions.patch | 19 ++++++++++---------
 .../zstd/{zstd_1.4.8.bb => zstd_1.4.9.bb}     |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/zstd/{zstd_1.4.8.bb => zstd_1.4.9.bb} (95%)

diff --git a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
index 178124a2ef..cd0835cdbe 100644
--- a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
+++ b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
@@ -1,4 +1,4 @@
-From 8d01b0753162681dcdbb7cf56f1e393c261e3eb0 Mon Sep 17 00:00:00 2001
+From 21547a41a6c5d8d843389a95d237c7afc07befe3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 Dec 2020 19:14:32 +0100
 Subject: [PATCH] Makefile: sort all wildcard file list expansions
@@ -8,6 +8,7 @@ reproducible builds.
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  programs/Makefile   | 10 +++++-----
  tests/Makefile      |  4 ++--
@@ -15,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/programs/Makefile b/programs/Makefile
-index 8641d0ee..26fee45f 100644
+index 936f3c80..b8200fae 100644
 --- a/programs/Makefile
 +++ b/programs/Makefile
-@@ -72,11 +72,11 @@ ZSTDLEGACY_DIR := $(ZSTDDIR)/legacy
+@@ -74,11 +74,11 @@ ZSTDLEGACY_DIR := $(ZSTDDIR)/legacy
  
  vpath %.c $(ZSTDLIB_COMMON) $(ZSTDLIB_COMPRESS) $(ZSTDLIB_DECOMPRESS) $(ZDICT_DIR) $(ZSTDLEGACY_DIR)
  
@@ -34,17 +35,17 @@ index 8641d0ee..26fee45f 100644
  
  ZSTD_LEGACY_SUPPORT ?= 5
  ZSTDLEGACY_SRC :=
-@@ -91,7 +91,7 @@ ZSTDLIB_FULL_SRC = $(sort $(ZSTDLIB_CORE_SRC) $(ZSTDLEGACY_SRC) $(ZDICT_SRC))
- ZSTDLIB_LOCAL_SRC := $(notdir $(ZSTDLIB_FULL_SRC))
+@@ -93,7 +93,7 @@ ZSTDLIB_FULL_SRC = $(sort $(ZSTDLIB_CORE_SRC) $(ZSTDLEGACY_SRC) $(ZDICT_SRC))
+ ZSTDLIB_LOCAL_SRC = $(notdir $(ZSTDLIB_FULL_SRC))
  ZSTDLIB_LOCAL_OBJ := $(ZSTDLIB_LOCAL_SRC:.c=.o)
  
 -ZSTD_CLI_SRC := $(wildcard *.c)
 +ZSTD_CLI_SRC := $(sort $(wildcard *.c))
  ZSTD_CLI_OBJ := $(ZSTD_CLI_SRC:.c=.o)
  
- ZSTD_ALL_SRC := $(ZSTDLIB_LOCAL_SRC) $(ZSTD_CLI_SRC)
+ ZSTD_ALL_SRC = $(ZSTDLIB_LOCAL_SRC) $(ZSTD_CLI_SRC)
 diff --git a/tests/Makefile b/tests/Makefile
-index 42bc353c..5f5654f0 100644
+index f0605057..74a90b0f 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
 @@ -49,7 +49,7 @@ ZSTD_FILES  := $(ZSTDDECOMP_FILES) $(ZSTDCOMMON_FILES) $(ZSTDCOMP_FILES)
@@ -56,7 +57,7 @@ index 42bc353c..5f5654f0 100644
  ZSTD_OBJ1 := $(subst $(ZSTDDIR)/common/,zstdm_,$(ZSTD_F1))
  ZSTD_OBJ2 := $(subst $(ZSTDDIR)/compress/,zstdc_,$(ZSTD_OBJ1))
  ZSTD_OBJ3 := $(subst $(ZSTDDIR)/decompress/,zstdd_,$(ZSTD_OBJ2))
-@@ -212,7 +212,7 @@ bigdict: $(ZSTDMT_OBJECTS) $(PRGDIR)/datagen.c bigdict.c
+@@ -211,7 +211,7 @@ bigdict: $(ZSTDMT_OBJECTS) $(PRGDIR)/datagen.c bigdict.c
  invalidDictionaries : $(ZSTD_OBJECTS) invalidDictionaries.c
  
  legacy : CPPFLAGS += -I$(ZSTDDIR)/legacy -DZSTD_LEGACY_SUPPORT=4
@@ -66,7 +67,7 @@ index 42bc353c..5f5654f0 100644
  decodecorpus : LDLIBS += -lm
  decodecorpus : $(filter-out zstdc_zstd_compress.o, $(ZSTD_OBJECTS)) $(ZDICT_FILES) $(PRGDIR)/util.c $(PRGDIR)/timefn.c decodecorpus.c
 diff --git a/tests/fuzz/Makefile b/tests/fuzz/Makefile
-index 36232a8c..574fe877 100644
+index f3a561de..68a29ef0 100644
 --- a/tests/fuzz/Makefile
 +++ b/tests/fuzz/Makefile
 @@ -58,7 +58,7 @@ FUZZ_SRC       := \
diff --git a/meta/recipes-extended/zstd/zstd_1.4.8.bb b/meta/recipes-extended/zstd/zstd_1.4.9.bb
similarity index 95%
rename from meta/recipes-extended/zstd/zstd_1.4.8.bb
rename to meta/recipes-extended/zstd/zstd_1.4.9.bb
index 10a6334cb7..b86fdf8b2d 100644
--- a/meta/recipes-extended/zstd/zstd_1.4.8.bb
+++ b/meta/recipes-extended/zstd/zstd_1.4.9.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/facebook/zstd.git;branch=release \
            file://0001-Makefile-sort-all-wildcard-file-list-expansions.patch \
            "
 
-SRCREV = "97a3da1df009d4dc67251de0c4b1c9d7fe286fc1"
+SRCREV = "e4558ffd1dc49399faf4ee5d85abed4386b4dcf5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


--===============4045297228196600059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/zstd (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.4.8 to libzstd.so.1.4.9
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.4.8 to libzstd.so.1.4.9
  /usr/lib/libzstd.so.1.4.8 moved to /usr/lib/libzstd.so.1.4.9
packages/core2-32-poky-linux/zstd/zstd-dev: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"
packages/core2-32-poky-linux/zstd/zstd-doc: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"
packages/core2-32-poky-linux/zstd/zstd-locale: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"
packages/core2-32-poky-linux/zstd/zstd-staticdev: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"
packages/core2-32-poky-linux/zstd/zstd: FILELIST: removed "/usr/lib/libzstd.so.1.4.8", added "/usr/lib/libzstd.so.1.4.9"

--===============4045297228196600059==--
