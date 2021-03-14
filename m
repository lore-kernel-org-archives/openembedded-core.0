Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.7632.1615737045686826928
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 08:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12EFoZtA001668
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 08:50:36 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 14 Mar 2021 08:50:35 -0700
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Sun, 14 Mar 2021 08:50:35 -0700
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] zstd: upgrade 1.4.8 -> 1.4.9
Date: Sun, 14 Mar 2021 11:50:34 -0400
Message-ID: <20210314155034.411781-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Shave fuzz off the Makefile-sort-all-wildcard-file-list-expansions patch

CHANGELOG:

    v1.4.9  (Mar 1, 2021)
    bug: Use `umask()` to Constrain Created File Permissions (#2495, @felixhandte)
    bug: Make Simple Single-Pass Functions Ignore Advanced Parameters (#2498, @terrelln)
    api: Add (De)Compression Tracing Functionality (#2482, @terrelln)
    api: Support References to Multiple DDicts (#2446, @senhuang42)
    api: Add Function to Generate Skippable Frame (#2439, @senhuang42)
    perf: New Algorithms for the Long Distance Matcher (#2483, @mpu)
    perf: Performance Improvements for Long Distance Matcher (#2464, @mpu)
    perf: Don't Shrink Window Log when Streaming with a Dictionary (#2451, @terrelln)
    cli: Fix `--output-dir-mirror`'s Rejection of `..`-Containing Paths (#2512, @felixhandte)
    cli: Allow Input From Console When `-f`/`--force` is Passed (#2466, @felixhandte)
    cli: Improve Help Message (#2500, @senhuang42)
    tests: Remove Flaky Tests (#2455, #2486, #2445, @Cyan4973)
    tests: Correctly Invoke md5 Utility on NetBSD (#2492, @niacat)
    tests: Avoid Using `stat -c` on NetBSD (#2513, @felixhandte)
    build: Zstd CLI Can Now be Linked to Dynamic `libzstd` (#2457, #2454 @Cyan4973)
    build: Hide and Avoid Using Static-Only Symbols (#2501, #2504, @skitt)
    build: CMake: Enable Only C for lib/ and programs/ Projects (#2498, @concatime)
    build: CMake: Use `configure_file()` to Create the `.pc` File (#2462, @lazka)
    build: Fix Fuzzer Compiler Detection & Update UBSAN Flags (#2503, @terrelln)
    build: Add Guards for `_LARGEFILE_SOURCE` and `_LARGEFILE64_SOURCE` (#2444, @indygreg)
    build: Improve `zlibwrapper` Makefile (#2437, @Cyan4973)
    contrib: Add `recover_directory` Program (#2473, @terrelln)
    doc: Change License Year to 2021 (#2452 & #2465, @terrelln & @senhuang42)
    doc: Fix Typos (#2459, @ThomasWaldmann)

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...rt-all-wildcard-file-list-expansions.patch | 19 ++++++++++---------
 .../zstd/{zstd_1.4.8.bb => zstd_1.4.9.bb}     |  2 +-
 2 files changed, 11 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/zstd/{zstd_1.4.8.bb => zstd_1.4.9.bb} (95%)

diff --git a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
index 178124a2ef..b5ffb95b71 100644
--- a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
+++ b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
@@ -1,4 +1,4 @@
-From 8d01b0753162681dcdbb7cf56f1e393c261e3eb0 Mon Sep 17 00:00:00 2001
+From 986c7917aef632745cb3388a86a2f62347d5a0a5 Mon Sep 17 00:00:00 2001
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
2.27.0

