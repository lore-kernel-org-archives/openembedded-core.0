Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web10.10542.1592494916074024845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gDC7jNDb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.65, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f65.google.com with SMTP id u23so4863850otq.10
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nUz1y1etrEjcqXsPYyDtUncsK/fSc7Aw/5991Yq5A70=;
        b=gDC7jNDbzY4yMActpBIdfWLn5sCzW7iJ6ntQHN53l4D/YloKGOjFPMjuNOJrI3f0U5
         ewsVj18hdkKNuGk/XWY27/7AYB+IRCVWuXbE65uHNIOlbv36PZEfKbMg3CwSSu1ZNxg/
         x40A1rGSKgLsvVE2gtcjrh2FS7TNBAwRicNleYFgjnHZ13opiz4kIM+oUZD15tSXEHLr
         qPDC0WUGFam4wMsSf65zaHPZnaPTuNy6HNMGyGl30lp7BBT1Wjcw57ERN46DEqh8eiwc
         94Wfo9b6OiwuDd8MEdAV3XcRfNb7avlEPtfys8pf+deRBtzQhY/Fiyv/j24FkjTngxC1
         SXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nUz1y1etrEjcqXsPYyDtUncsK/fSc7Aw/5991Yq5A70=;
        b=aD6Q+i2bJbMLnsuwp4/GzWX99zx3kqE5K05Js0KRs1gxHF8ip0wwJev1aa80MOP0z9
         Q2OhHk37cJTFv0sLjzh9wCTRF4ZEEESPkwucD4nF8BQGAlmcDHlCU1x6bfALi9J1EO6P
         h3GaFgzj0VG4nUMQeW7KNkoR/aI86B093n0+QOeJUTOAKIhUTJHz1PlPuRVg1er0s8cj
         6GK/ej1WFVCRLaAB3/Zrwv6JhOwntoWXuOc06Wac/zySxx4/1FoAkTe6WprVeb8S0UMd
         g/TWv3GwbGcWOvW9DGSH6PWRKK09ILVtKvplshlQ+81mNAfMF4YdxmgdAownEiAsA6gv
         qIyA==
X-Gm-Message-State: AOAM531aws42DXd2rB6097bAOxAyZopZTfmrpxDmfie+OwLZ94My9Da5
	/qcdZdLt4uwhzOmT9u5mVlTwajtsqxu73A==
X-Google-Smtp-Source: ABdhPJwUg5MVBZ337/IxV1YAuTRC1bX8nXXAePGGGrdrpQb8P/p7WuRVIlPMi+AsRMNeTnAmyz2k/w==
X-Received: by 2002:a9d:3a6:: with SMTP id f35mr3891400otf.299.1592494914800;
        Thu, 18 Jun 2020 08:41:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.41.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:41:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/21] libcomps: update to 0.1.15
Date: Thu, 18 Jun 2020 05:40:35 -1000
Message-Id: <55e2f218de2725d65b2cf231b6e835eb94f8eceb.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Richard Leitner <richard.leitner@skidata.com>

In this update the 0001-Make-__comps_objmrtree_all-static-inline.patch
was mainlined by commit 18f52cb.

Furthermore mainline commit 3237f44 fixes a build problem with the
default "-fno-common" of gcc 10.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90b942d01decbcff3b883ee6fb4bba67fb446817)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Add-crc32.c-to-sources-list.patch    |  9 +++--
 ...-__comps_objmrtree_all-static-inline.patch | 35 -------------------
 ...YTHON_INSTALL_DIR-by-running-python.patch} | 12 ++++---
 .../{libcomps_git.bb => libcomps_0.1.15.bb}   |  6 ++--
 4 files changed, 15 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
 rename meta/recipes-devtools/libcomps/libcomps/{0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch => 0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch} (85%)
 rename meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.15.bb} (74%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
index ff90269a23..f4fb6d3b20 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
@@ -1,7 +1,7 @@
-From 83407aa50e06d967d0a1095a140bd7b0e5d51d27 Mon Sep 17 00:00:00 2001
+From 72065bb2b5881dc224299f302379391aebdfca3d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 21 Nov 2018 13:09:05 +0100
-Subject: [PATCH] Add crc32.c to sources list
+Subject: [PATCH 1/2] Add crc32.c to sources list
 
 Otherwise, there is a missing symbol runtime error under musl C library.
 
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index 6ed25bb..c15c8b2 100644
+index adabb31..b9b96ab 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
 @@ -9,13 +9,13 @@ set (pycomps_SRCDIR ${CMAKE_CURRENT_SOURCE_DIR})
@@ -45,3 +45,6 @@ index d8f5e34..f266067 100644
  
  static uint32_t crc32_tab[] = {
  	0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
deleted file mode 100644
index 88469fb331..0000000000
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 91a324f8771818b81017fdf4daaad0c8c4b6987c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 Mar 2017 11:38:54 -0700
-Subject: [PATCH] Make __comps_objmrtree_all() static inline
-
-This helps compilers to scope the symbol correctly
-and apply the inlining optimizations, clang e.g.
-emits the functions and calls in code which is
-suboptimal, therefore give a little help to compiler
-this function is not used anywhere else to have
-a global scope.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libcomps/src/comps_objmradix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcomps/src/comps_objmradix.c b/libcomps/src/comps_objmradix.c
-index 9be6648..55f7793 100644
---- a/libcomps/src/comps_objmradix.c
-+++ b/libcomps/src/comps_objmradix.c
-@@ -604,7 +604,7 @@ inline void comps_objmrtree_pair_destroy_v(void * pair) {
-     free(pair);
- }
- 
--inline COMPS_HSList* __comps_objmrtree_all(COMPS_ObjMRTree * rt, char keyvalpair) {
-+static inline COMPS_HSList* __comps_objmrtree_all(COMPS_ObjMRTree * rt, char keyvalpair) {
-     COMPS_HSList *to_process, *ret;
-     COMPS_HSListItem *hsit, *oldit;
-     size_t x;
--- 
-2.12.0
-
diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
similarity index 85%
rename from meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
rename to meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 59c09aa70a..3e9102605b 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,20 +1,19 @@
-From b28859ea93110d52d8a87d7b5a6c8796d0d523ed Mon Sep 17 00:00:00 2001
+From 32447a79e24f8e7e9e0150eb747f34116d63ef38 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:22:09 +0200
-Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
+Subject: [PATCH 2/2] Do not set PYTHON_INSTALL_DIR by running python.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  libcomps/src/python/src/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index fa590ae..6913214 100644
+index b9b96ab..6d44567 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
-@@ -117,7 +117,7 @@ IF (SKBUILD)
+@@ -115,7 +115,7 @@ IF (SKBUILD)
      INSTALL(FILES libcomps/__init__.py DESTINATION libcomps/src/python/src/libcomps)
      INSTALL(TARGETS pycomps LIBRARY DESTINATION libcomps/src/python/src/libcomps)
  ELSE ()
@@ -23,3 +22,6 @@ index fa590ae..6913214 100644
  
      INSTALL(FILES ${pycomps_SRCDIR}/libcomps/__init__.py DESTINATION ${PYTHON_INSTALL_DIR}/libcomps)
      #INSTALL(FILES ${pycomps_SRCDIR}/tests/__test.py DESTINATION
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
similarity index 74%
rename from meta/recipes-devtools/libcomps/libcomps_git.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
index 40b60159bc..98c55dca85 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
@@ -3,13 +3,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
-           file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
-           file://0001-Make-__comps_objmrtree_all-static-inline.patch \
            file://0001-Add-crc32.c-to-sources-list.patch \
+           file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-PV = "0.1.14"
-SRCREV = "5a0e04286f3462e3308f2a332eb0f90a66920218"
+SRCREV = "b213f749405d84e989b25e183bcf28ce701696dd"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

