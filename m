Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.4569.1621074783776311507
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8180738C13CF
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zstd: upgrading to 1.5.0 SUCCEEDED
Message-ID: <MADEUP.167F36ED94525114.11165@lists.openembedded.org>
X-Groupsio-MsgNum: 151819
Content-Type: multipart/mixed; boundary="===============3375856019318804660=="

--===============3375856019318804660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zstd* to *1.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-zstd-upgrade-1.4.9-1.5.0.patch
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

--===============3375856019318804660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/zstd (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.4.9 to libzstd.so.1.5.0
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.4.9 to libzstd.so.1.5.0
  /usr/lib/libzstd.so.1.4.9 moved to /usr/lib/libzstd.so.1.5.0
packages/core2-32-poky-linux/zstd/zstd-dbg: PKGSIZE changed from 9898228 to 13482900 (+36%)
packages/core2-32-poky-linux/zstd/zstd-dev: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd-doc: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd-locale: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd-staticdev: PKGSIZE changed from 4561624 to 5925306 (+30%)
packages/core2-32-poky-linux/zstd/zstd-staticdev: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd: PKGSIZE changed from 1805007 to 2202319 (+22%)
packages/core2-32-poky-linux/zstd/zstd: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"

--===============3375856019318804660==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-zstd-upgrade-1.4.9-1.5.0.patch"

From 182fd5246fd266e62a42f339ad5027dd80358788 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 06:20:46 +0000
Subject: [PATCH] zstd: upgrade 1.4.9 -> 1.5.0

---
 ...-sort-all-wildcard-file-list-expansions.patch | 16 ++++++++--------
 .../zstd/{zstd_1.4.9.bb => zstd_1.5.0.bb}        |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/zstd/{zstd_1.4.9.bb => zstd_1.5.0.bb} (95%)

diff --git a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
index b5ffb95b71..37c5ff0cc0 100644
--- a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
+++ b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
@@ -1,4 +1,4 @@
-From 986c7917aef632745cb3388a86a2f62347d5a0a5 Mon Sep 17 00:00:00 2001
+From 77c7963c7a0f1c455f20520d5c7b1ec9b17a44fb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 Dec 2020 19:14:32 +0100
 Subject: [PATCH] Makefile: sort all wildcard file list expansions
@@ -16,7 +16,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/programs/Makefile b/programs/Makefile
-index 936f3c80..b8200fae 100644
+index 599fb02f..2c416467 100644
 --- a/programs/Makefile
 +++ b/programs/Makefile
 @@ -74,11 +74,11 @@ ZSTDLEGACY_DIR := $(ZSTDDIR)/legacy
@@ -45,11 +45,11 @@ index 936f3c80..b8200fae 100644
  
  ZSTD_ALL_SRC = $(ZSTDLIB_LOCAL_SRC) $(ZSTD_CLI_SRC)
 diff --git a/tests/Makefile b/tests/Makefile
-index f0605057..74a90b0f 100644
+index 85553007..b71cdba8 100644
 --- a/tests/Makefile
 +++ b/tests/Makefile
-@@ -49,7 +49,7 @@ ZSTD_FILES  := $(ZSTDDECOMP_FILES) $(ZSTDCOMMON_FILES) $(ZSTDCOMP_FILES)
- ZBUFF_FILES := $(ZSTDDIR)/deprecated/*.c
+@@ -49,7 +49,7 @@ ZSTDDECOMP_FILES := $(ZSTDDIR)/decompress/*.c
+ ZSTD_FILES  := $(ZSTDDECOMP_FILES) $(ZSTDCOMMON_FILES) $(ZSTDCOMP_FILES)
  ZDICT_FILES := $(ZSTDDIR)/dictBuilder/*.c
  
 -ZSTD_F1 := $(wildcard $(ZSTD_FILES))
@@ -57,7 +57,7 @@ index f0605057..74a90b0f 100644
  ZSTD_OBJ1 := $(subst $(ZSTDDIR)/common/,zstdm_,$(ZSTD_F1))
  ZSTD_OBJ2 := $(subst $(ZSTDDIR)/compress/,zstdc_,$(ZSTD_OBJ1))
  ZSTD_OBJ3 := $(subst $(ZSTDDIR)/decompress/,zstdd_,$(ZSTD_OBJ2))
-@@ -211,7 +211,7 @@ bigdict: $(ZSTDMT_OBJECTS) $(PRGDIR)/datagen.c bigdict.c
+@@ -202,7 +202,7 @@ bigdict: $(ZSTDMT_OBJECTS) $(PRGDIR)/datagen.c bigdict.c
  invalidDictionaries : $(ZSTD_OBJECTS) invalidDictionaries.c
  
  legacy : CPPFLAGS += -I$(ZSTDDIR)/legacy -DZSTD_LEGACY_SUPPORT=4
@@ -67,10 +67,10 @@ index f0605057..74a90b0f 100644
  decodecorpus : LDLIBS += -lm
  decodecorpus : $(filter-out zstdc_zstd_compress.o, $(ZSTD_OBJECTS)) $(ZDICT_FILES) $(PRGDIR)/util.c $(PRGDIR)/timefn.c decodecorpus.c
 diff --git a/tests/fuzz/Makefile b/tests/fuzz/Makefile
-index f3a561de..68a29ef0 100644
+index ccb574b7..b1cb2935 100644
 --- a/tests/fuzz/Makefile
 +++ b/tests/fuzz/Makefile
-@@ -58,7 +58,7 @@ FUZZ_SRC       := \
+@@ -62,7 +62,7 @@ FUZZ_SRC       := \
  	$(ZSTDCOMP_SRC) \
  	$(ZSTDDICT_SRC) \
  	$(ZSTDLEGACY_SRC)
diff --git a/meta/recipes-extended/zstd/zstd_1.4.9.bb b/meta/recipes-extended/zstd/zstd_1.5.0.bb
similarity index 95%
rename from meta/recipes-extended/zstd/zstd_1.4.9.bb
rename to meta/recipes-extended/zstd/zstd_1.5.0.bb
index b86fdf8b2d..9c95020743 100644
--- a/meta/recipes-extended/zstd/zstd_1.4.9.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/facebook/zstd.git;branch=release \
            file://0001-Makefile-sort-all-wildcard-file-list-expansions.patch \
            "
 
-SRCREV = "e4558ffd1dc49399faf4ee5d85abed4386b4dcf5"
+SRCREV = "a488ba114ec17ea1054b9057c26a046fc122b3b6"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.27.0


--===============3375856019318804660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/zstd: PKGV changed from 1.4.9 [default] to 1.5.0 [default]
packages/core2-32-poky-linux/zstd: PV changed from "1.4.9" to "1.5.0"
Changes to packages/core2-32-poky-linux/zstd (sysroot):
  /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.4.9 to libzstd.so.1.5.0
  /usr/lib/libzstd.so changed symlink target from libzstd.so.1.4.9 to libzstd.so.1.5.0
  /usr/lib/libzstd.so.1.4.9 moved to /usr/lib/libzstd.so.1.5.0
packages/core2-32-poky-linux/zstd/zstd-dbg: PKGV changed from 1.4.9 [default] to 1.5.0 [default]
packages/core2-32-poky-linux/zstd/zstd-dbg: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd-dbg: PKGSIZE changed from 9898228 to 13482900 (+36%)
packages/core2-32-poky-linux/zstd/zstd-dbg: PV changed from "1.4.9" to "1.5.0"
packages/core2-32-poky-linux/zstd/zstd-dev: PKGV changed from 1.4.9 [default] to 1.5.0 [default]
packages/core2-32-poky-linux/zstd/zstd-dev: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd-dev: PKGSIZE changed from 163579 to 175807 (+7%)
packages/core2-32-poky-linux/zstd/zstd-dev: PV changed from "1.4.9" to "1.5.0"
packages/core2-32-poky-linux/zstd/zstd-doc: PKGV changed from 1.4.9 [default] to 1.5.0 [default]
packages/core2-32-poky-linux/zstd/zstd-doc: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd-doc: PKGSIZE changed from 29357 to 29678 (+1%)
packages/core2-32-poky-linux/zstd/zstd-doc: PV changed from "1.4.9" to "1.5.0"
packages/core2-32-poky-linux/zstd/zstd-locale: PKGV changed from 1.4.9 [default] to 1.5.0 [default]
packages/core2-32-poky-linux/zstd/zstd-locale: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd-locale: PV changed from "1.4.9" to "1.5.0"
packages/core2-32-poky-linux/zstd/zstd-src: PKGV changed from 1.4.9 [default] to 1.5.0 [default]
packages/core2-32-poky-linux/zstd/zstd-src: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd-src: PKGSIZE changed from 2588703 to 2674036 (+3%)
packages/core2-32-poky-linux/zstd/zstd-src: PV changed from "1.4.9" to "1.5.0"
packages/core2-32-poky-linux/zstd/zstd-staticdev: PKGV changed from 1.4.9 [default] to 1.5.0 [default]
packages/core2-32-poky-linux/zstd/zstd-staticdev: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd-staticdev: PKGSIZE changed from 4561624 to 5925306 (+30%)
packages/core2-32-poky-linux/zstd/zstd-staticdev: PV changed from "1.4.9" to "1.5.0"
packages/core2-32-poky-linux/zstd/zstd: PKGV changed from 1.4.9 [default] to 1.5.0 [default]
packages/core2-32-poky-linux/zstd/zstd: FILELIST: removed "/usr/lib/libzstd.so.1.4.9", added "/usr/lib/libzstd.so.1.5.0"
packages/core2-32-poky-linux/zstd/zstd: PKGSIZE changed from 1805007 to 2202319 (+22%)
packages/core2-32-poky-linux/zstd/zstd: PV changed from "1.4.9" to "1.5.0"

--===============3375856019318804660==--
