Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.11641.1621204379514592312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YY6RGPY7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id h4so4435388wrt.12
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qSj0OgWwmODFbbrnpUwnWyMlk678j1QHr1JcOxWGmC8=;
        b=YY6RGPY7ubEX4tXwObyAu1HFtx8POt/BgShpMEQHrpOlxPM1cuf4stMm/Hy4Dw+hl2
         suu6UUlI0HwvxiOOUiPQ4xfGB0MEVdPFuukAThTqo0c7877+7wriLGVPyXNA4QXHuZ81
         Zvo1M49n+mm1c6dLpljySAIClXK7N+pXHp9YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qSj0OgWwmODFbbrnpUwnWyMlk678j1QHr1JcOxWGmC8=;
        b=HRbs98Z/plW4jyy7t1+CMHkXWBEqTLc3ydfKKNQmnX8CqK5JfPu8y2ILUs5XbE9ZM9
         62qArHCu3ZXCCMasEOSCBRZB8YaFbMKL7K8lD3PDAF7tox6NrTIQeoqxYfvxB/c3Ndae
         bVxbu8jwW1mmVaDxcC6qTMg2Ig2A8Rr6/1IFD/AElBkJP1AMzb9hwtoBwCGtyAZw7gnW
         atE2y14vPwIl2GyU3uGIo9ufxE2RlGE6g+Rhdnh0yPrrOo1x9wTo9fOiVAZx04OBr3nl
         pt04J3GzRTOHjC1133O01yaupQm7O+RfqHAEGPMtj+jdLhc/YOVQwMRzw8FYqjkbmT0K
         pmdA==
X-Gm-Message-State: AOAM5307fGcQGwe3i9wox5blzPmoJszQOvThNA+Q4t2FJ5+cIkSF0gxL
	KDL/gTMZjJjfFMwgGdxwz3TiskWxoJ6EOw==
X-Google-Smtp-Source: ABdhPJy8azdP9/7V6AAeYM23RTuHHYU40+OexKS7hNexrbqupOFiaUpV7sJFbd718S7Z1q7CQJCCXw==
X-Received: by 2002:a05:6000:1c1:: with SMTP id t1mr69889966wrx.421.1621204378068;
        Sun, 16 May 2021 15:32:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/27] zstd: upgrade 1.4.9 -> 1.5.0
Date: Sun, 16 May 2021 23:32:38 +0100
Message-Id: <20210516223247.2401235-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-sort-all-wildcard-file-list-expansions.patch | 16 ++++++++--------
 .../zstd/{zstd_1.4.9.bb => zstd_1.5.0.bb}        |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/zstd/{zstd_1.4.9.bb => zstd_1.5.0.bb} (95%)

diff --git a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
index b5ffb95b713..37c5ff0cc06 100644
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
index b86fdf8b2d5..9c950207431 100644
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
2.30.2

