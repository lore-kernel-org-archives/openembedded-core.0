Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.19130.1608974901695664265
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BjQaYLhY;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id cm17so5579653edb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mS/6+BvFQehO7rghrXUrF9/eQPAevAK/eDVUuB/wkac=;
        b=BjQaYLhYFToPwHtrUUkWmPcaC9WIpXC5uDKXMV6AcmY+4PYzP2aYN5D/eegHO8fxMo
         jiR3TG5+SLa858UzMK7d9UyXinfs8J6PTEedSDv26JON6h+HnVvSXBMcgcGXAYUMzTA9
         GgnaQkLfkbvsr83KPI1HQgQA1fsuDUZ3La5fA62zRs6mPi1TTXTMFuti4ca3NBQKZdGw
         eGbeuq6BR8ca3VHi421vJI848xWlulEY89u0V+GH6tWgJAjgTk55X9mrIqAOlWmAp43Q
         q6jl4D6NvAegJbiz/otRWGntO8miFiSgIEPBjKeBn+OxRLLKzSuDdcdwSIN4T0PoKG+b
         A2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mS/6+BvFQehO7rghrXUrF9/eQPAevAK/eDVUuB/wkac=;
        b=E/1VAhWB8Qla7nPtfkyajTOL+O1WTGk/WzDW+169e/amb3+ahEZRVdSOZOmnH6xKhs
         N0XbT4LSUUs9mGcl0zn2DcogKjFE/DUvOnRHbjqQ0iTXSqqrDeG0VRL9AB9HcRVg2b3E
         1/7zFpwoQbj4MgJ/qhEcA8tIxs8NeV/ccpLmfmQAmyaAtd7rry5JLlkAAjjPd8M7PW13
         n99MHseE0T5rOxwaeg+cWfrmvD08nuPSF5NuJSh0JRMgBafpRIqtMDQASjcZyer/zxAR
         ZXlZFAehi8R/pRg21X4e1e/7DJEjV5nKckkP7Zq3Lv5GZHuGdGKGfb3upJQI7sZmFihM
         bykg==
X-Gm-Message-State: AOAM531EOJEuGoPtuaJfQfq7oUjmNtUtelnBTIK4afpOltKHk26xW3kS
	BZ+NFsxh5FO9Ka56J6m0ewG3v8cQbt0=
X-Google-Smtp-Source: ABdhPJwnGIPAyZaOH1T5ayfu5QyrIcZtB/hIdzOQ4/eSZrtqPqa5VhM3N+2bfoZLD2WE5mQRk3sD7A==
X-Received: by 2002:a05:6402:1593:: with SMTP id c19mr35282339edv.269.1608974900336;
        Sat, 26 Dec 2020 01:28:20 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:19 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 48/48] zstd: update 1.4.5 -> 1.4.8
Date: Sat, 26 Dec 2020 10:27:32 +0100
Message-Id: <20201226092732.52323-48-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Fix-legacy-build-after-2103.patch    | 27 -------
 ...rt-all-wildcard-file-list-expansions.patch | 80 +++++++++++++++++++
 .../zstd/{zstd_1.4.5.bb => zstd_1.4.8.bb}     |  6 +-
 3 files changed, 83 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
 create mode 100644 meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
 rename meta/recipes-extended/zstd/{zstd_1.4.5.bb => zstd_1.4.8.bb} (84%)

diff --git a/meta/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch b/meta/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
deleted file mode 100644
index c701554b8b..0000000000
--- a/meta/recipes-extended/zstd/zstd/0001-Fix-legacy-build-after-2103.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 93cec0c1d6d0be8dd3a9d01d3e7f2099f1728df7 Mon Sep 17 00:00:00 2001
-From: Orivej Desh <orivej@gmx.fr>
-Date: Fri, 22 May 2020 12:48:02 +0000
-Subject: [PATCH] Fix legacy build after #2103
-
-Upstream-Status: Backport
-Signed-of-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- lib/legacy/zstd_v04.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/legacy/zstd_v04.c b/lib/legacy/zstd_v04.c
-index 56bf45222498..19fda8980abf 100644
---- a/lib/legacy/zstd_v04.c
-+++ b/lib/legacy/zstd_v04.c
-@@ -74,7 +74,7 @@ extern "C" {
- /*-*************************************
- *  Debug
- ***************************************/
--#include "debug.h"
-+#include "../common/debug.h"
- #ifndef assert
- #  define assert(condition) ((void)0)
- #endif
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
new file mode 100644
index 0000000000..178124a2ef
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
@@ -0,0 +1,80 @@
+From 8d01b0753162681dcdbb7cf56f1e393c261e3eb0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 23 Dec 2020 19:14:32 +0100
+Subject: [PATCH] Makefile: sort all wildcard file list expansions
+
+Otherwise the order is non-deterministic and breaks
+reproducible builds.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ programs/Makefile   | 10 +++++-----
+ tests/Makefile      |  4 ++--
+ tests/fuzz/Makefile |  2 +-
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/programs/Makefile b/programs/Makefile
+index 8641d0ee..26fee45f 100644
+--- a/programs/Makefile
++++ b/programs/Makefile
+@@ -72,11 +72,11 @@ ZSTDLEGACY_DIR := $(ZSTDDIR)/legacy
+ 
+ vpath %.c $(ZSTDLIB_COMMON) $(ZSTDLIB_COMPRESS) $(ZSTDLIB_DECOMPRESS) $(ZDICT_DIR) $(ZSTDLEGACY_DIR)
+ 
+-ZSTDLIB_COMMON_C := $(wildcard $(ZSTDLIB_COMMON)/*.c)
+-ZSTDLIB_COMPRESS_C := $(wildcard $(ZSTDLIB_COMPRESS)/*.c)
+-ZSTDLIB_DECOMPRESS_C := $(wildcard $(ZSTDLIB_DECOMPRESS)/*.c)
++ZSTDLIB_COMMON_C := $(sort $(wildcard $(ZSTDLIB_COMMON)/*.c))
++ZSTDLIB_COMPRESS_C := $(sort $(wildcard $(ZSTDLIB_COMPRESS)/*.c))
++ZSTDLIB_DECOMPRESS_C := $(sort $(wildcard $(ZSTDLIB_DECOMPRESS)/*.c))
+ ZSTDLIB_CORE_SRC := $(ZSTDLIB_DECOMPRESS_C) $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C)
+-ZDICT_SRC := $(wildcard $(ZDICT_DIR)/*.c)
++ZDICT_SRC := $(sort $(wildcard $(ZDICT_DIR)/*.c))
+ 
+ ZSTD_LEGACY_SUPPORT ?= 5
+ ZSTDLEGACY_SRC :=
+@@ -91,7 +91,7 @@ ZSTDLIB_FULL_SRC = $(sort $(ZSTDLIB_CORE_SRC) $(ZSTDLEGACY_SRC) $(ZDICT_SRC))
+ ZSTDLIB_LOCAL_SRC := $(notdir $(ZSTDLIB_FULL_SRC))
+ ZSTDLIB_LOCAL_OBJ := $(ZSTDLIB_LOCAL_SRC:.c=.o)
+ 
+-ZSTD_CLI_SRC := $(wildcard *.c)
++ZSTD_CLI_SRC := $(sort $(wildcard *.c))
+ ZSTD_CLI_OBJ := $(ZSTD_CLI_SRC:.c=.o)
+ 
+ ZSTD_ALL_SRC := $(ZSTDLIB_LOCAL_SRC) $(ZSTD_CLI_SRC)
+diff --git a/tests/Makefile b/tests/Makefile
+index 42bc353c..5f5654f0 100644
+--- a/tests/Makefile
++++ b/tests/Makefile
+@@ -49,7 +49,7 @@ ZSTD_FILES  := $(ZSTDDECOMP_FILES) $(ZSTDCOMMON_FILES) $(ZSTDCOMP_FILES)
+ ZBUFF_FILES := $(ZSTDDIR)/deprecated/*.c
+ ZDICT_FILES := $(ZSTDDIR)/dictBuilder/*.c
+ 
+-ZSTD_F1 := $(wildcard $(ZSTD_FILES))
++ZSTD_F1 := $(sort $(wildcard $(ZSTD_FILES)))
+ ZSTD_OBJ1 := $(subst $(ZSTDDIR)/common/,zstdm_,$(ZSTD_F1))
+ ZSTD_OBJ2 := $(subst $(ZSTDDIR)/compress/,zstdc_,$(ZSTD_OBJ1))
+ ZSTD_OBJ3 := $(subst $(ZSTDDIR)/decompress/,zstdd_,$(ZSTD_OBJ2))
+@@ -212,7 +212,7 @@ bigdict: $(ZSTDMT_OBJECTS) $(PRGDIR)/datagen.c bigdict.c
+ invalidDictionaries : $(ZSTD_OBJECTS) invalidDictionaries.c
+ 
+ legacy : CPPFLAGS += -I$(ZSTDDIR)/legacy -DZSTD_LEGACY_SUPPORT=4
+-legacy : $(ZSTD_FILES) $(wildcard $(ZSTDDIR)/legacy/*.c) legacy.c
++legacy : $(ZSTD_FILES) $(sort $(wildcard $(ZSTDDIR)/legacy/*.c)) legacy.c
+ 
+ decodecorpus : LDLIBS += -lm
+ decodecorpus : $(filter-out zstdc_zstd_compress.o, $(ZSTD_OBJECTS)) $(ZDICT_FILES) $(PRGDIR)/util.c $(PRGDIR)/timefn.c decodecorpus.c
+diff --git a/tests/fuzz/Makefile b/tests/fuzz/Makefile
+index 36232a8c..574fe877 100644
+--- a/tests/fuzz/Makefile
++++ b/tests/fuzz/Makefile
+@@ -58,7 +58,7 @@ FUZZ_SRC       := \
+ 	$(ZSTDCOMP_SRC) \
+ 	$(ZSTDDICT_SRC) \
+ 	$(ZSTDLEGACY_SRC)
+-FUZZ_SRC := $(wildcard $(FUZZ_SRC))
++FUZZ_SRC := $(sort $(wildcard $(FUZZ_SRC)))
+ 
+ FUZZ_D_OBJ1 := $(subst $(ZSTDDIR)/common/,d_lib_common_,$(FUZZ_SRC))
+ FUZZ_D_OBJ2 := $(subst $(ZSTDDIR)/compress/,d_lib_compress_,$(FUZZ_D_OBJ1))
diff --git a/meta/recipes-extended/zstd/zstd_1.4.5.bb b/meta/recipes-extended/zstd/zstd_1.4.8.bb
similarity index 84%
rename from meta/recipes-extended/zstd/zstd_1.4.5.bb
rename to meta/recipes-extended/zstd/zstd_1.4.8.bb
index cd0b471e17..10a6334cb7 100644
--- a/meta/recipes-extended/zstd/zstd_1.4.5.bb
+++ b/meta/recipes-extended/zstd/zstd_1.4.8.bb
@@ -9,11 +9,11 @@ LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1 \
-           file://0001-Fix-legacy-build-after-2103.patch \
+SRC_URI = "git://github.com/facebook/zstd.git;branch=release \
+           file://0001-Makefile-sort-all-wildcard-file-list-expansions.patch \
            "
 
-SRCREV = "b706286adbba780006a47ef92df0ad7a785666b6"
+SRCREV = "97a3da1df009d4dc67251de0c4b1c9d7fe286fc1"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.29.2

