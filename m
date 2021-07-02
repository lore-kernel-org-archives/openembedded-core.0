Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.16075.1625264373022861879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 15:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a13HRXns;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id o5so18524110ejy.7
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 15:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uMeLJNgPZjpjup9pDDxHePCcK6lqCHgD+jGDVthzlxE=;
        b=a13HRXnsIneU0eNaTX+1LqmIxvVE3nKh8z3OMXfkUes2yW4A20LFP/jNBgM8n7bRYn
         7MMVPubx6FNSQHrWNhx/myxWfMAPQnxn3ZHtU5O/0rbmfcV46GZ4cJFdOgsAK6f5wvQ2
         /CQnTsgpSsG/GUkJBEd1ORlOrs3KmzT6hEX/nyHpVjfjT5P4FqlTlHz7leK28zvaxI47
         HNYJ0afQJH+38jmusCOHjBysDW9HJIhR1Kk8Op6D6EZ6PYGdxLbuGDJY7Bb81XrHAPyc
         8E8QDVC73t1RXC48lAdRChx3Ner/czoX7sYmy4RDNT4CxJHNdZITrykb/bSvo/1d5P9A
         ATEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uMeLJNgPZjpjup9pDDxHePCcK6lqCHgD+jGDVthzlxE=;
        b=dsO+AbRRkY4f0gQSzm49HhYs8CwY9aVPpctTmCHpPc6MeNQU1iuNpHXUCDJFq3MK21
         YuTbSx1+Xf7IBVaKPsy7m4mtY6hfO6mdZj62Ug40HenKSJ7JA2imW/FvuNBYFE4d0709
         0m79wsPIqRIme5jGL/yB21Opc/QS/o2BLSrvVDR9V1T2sX4adDMZLQXMGzA4NKDIBh2x
         GY7RDKSULlLFSvZKVQ7akbkZokTllbUtse1j4CjgvgQChd+FWJpQLhxJ9tyRpv9187gY
         Hao7l9gB53jK2mzrmIGPhBCuaRY8Xk3KCzu9SpEPVDE+qrzGQjTfe2i+T2ar6DrH/aP9
         Y4zA==
X-Gm-Message-State: AOAM530Xq+Hd3OrSCAIic4G5lnvA8dHVkexYNSsGOzJsMD877WEm1D9c
	Gw0uF0iGewL4xDnW3+Bo0Y8oa5QOTmYPZg==
X-Google-Smtp-Source: ABdhPJxzxhaVw6B59IX3Zx2dODUQMAFGb94UkCIcXOlRTyOfJj8iM02mmjd7+12ovk4JZl+chGF+0w==
X-Received: by 2002:a17:907:97c8:: with SMTP id js8mr1920539ejc.308.1625264371667;
        Fri, 02 Jul 2021 15:19:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id jx17sm1492414ejc.60.2021.07.02.15.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 15:19:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/4] rt-tests: update 1.10 -> 2.1
Date: Sat,  3 Jul 2021 00:19:22 +0200
Message-Id: <20210702221924.2342084-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702221924.2342084-1-alex.kanavin@gmail.com>
References: <20210702221924.2342084-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 10 ++++------
 .../{hwlatdetect_1.10.bb => hwlatdetect_git.bb}        |  0
 meta/recipes-rt/rt-tests/rt-tests.inc                  |  6 +++---
 .../rt-tests/{rt-tests_1.10.bb => rt-tests_git.bb}     |  0
 4 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_1.10.bb => hwlatdetect_git.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_1.10.bb => rt-tests_git.bb} (100%)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index b177ff7c5f..56556dfe63 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -1,4 +1,4 @@
-From b608a817df2b652cd5fa1b5a7cf14b7d2d8afd5f Mon Sep 17 00:00:00 2001
+From 7b0ab10370cad38e26c5ffaaa55a1fd77fff0f18 Mon Sep 17 00:00:00 2001
 From: Randy Witt <randy.e.witt@intel.com>
 Date: Fri, 16 Oct 2020 16:54:30 -0700
 Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
@@ -9,16 +9,17 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
 Signed-off-by: Randy Witt <randy.e.witt@intel.com>
 
 Upstream-Status: Inappropriate [other]
+
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 636f191..9f57d2c 100644
+index 63cd77c..495d6bb 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
- VERSION = 1.10
+ VERSION = 2.1
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
@@ -26,6 +27,3 @@ index 636f191..9f57d2c 100644
  
  OBJDIR = bld
  
--- 
-2.29.2
-
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.10.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/hwlatdetect_1.10.bb
rename to meta/recipes-rt/rt-tests/hwlatdetect_git.bb
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index e97140add7..5ce4d298b9 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,7 +1,7 @@
-SRCREV = "c9051a36d934503b4673ca5615f631bae36dead0"
-PV = "1.10+git${SRCPV}"
+SRCREV = "667e1aae896f8448615b062d27c818b32cb960ff"
+PV = "2.1"
 PE = "1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.10.bb b/meta/recipes-rt/rt-tests/rt-tests_git.bb
similarity index 100%
rename from meta/recipes-rt/rt-tests/rt-tests_1.10.bb
rename to meta/recipes-rt/rt-tests/rt-tests_git.bb
-- 
2.31.1

