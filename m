Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64685C71136
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:39 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11649.1749026733202619838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NiUyBX4Y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026739; x=1780562739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yt3Idb43IkRZXJQhmsHvQQOQ2xYu8ScSOnAXYvn7Tg8=;
  b=NiUyBX4YWvcekI7IT0iQ4HRRZbob5yveKZdheSJt/pMJ5FcAMItEWR3b
   ac8ps2ofpPCNaFF/wNV0yZlKsWmW+5rjxJAZwzirt4CpGMA7MuF9S5V5b
   L5Aplz+B4Pz/ebGBSI+Rze86ZHKLZ3ua8xfquRPsMeOejBc2g/wQ4sKI7
   1iis2Sn9tp7ap+J3McAHWXGLfaLtspyNDGQC3cv5ao73q1XbxsNE3tfWk
   tCSTIuAiQHRvKfeIXwLcSjEOEeDY0weJ2+XTySnBg21vw/pVjhZjuc67d
   DLwBd5GLYKjPmIHpqTDl0SgfGq54dFbV6nYvE/CGGrat4vx0HMAQPtJKU
   A==;
X-CSE-ConnectionGUID: t1HrnbxNQpOGFW/Hvv/Xyw==
X-CSE-MsgGUID: JproecHCQbiSJlvTnNQK2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="181182737"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="181182737"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:37 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9314CD5051
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5168BD96C9
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:34 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CB5551A009A;
	Wed,  4 Jun 2025 16:45:33 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/45] harfbuzz: upgrade 11.2.0 -> 11.2.1
Date: Wed,  4 Jun 2025 16:44:55 +0800
Message-ID: <20250604084524.864-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217864

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
refreshed for 11.2.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...se-Os-to-compile-hb-subset-plan-layout.cc.patch | 14 +++++++-------
 .../{harfbuzz_11.2.0.bb => harfbuzz_11.2.1.bb}     |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.2.0.bb => harfbuzz_11.2.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
index 299843797b..38ff58fce5 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
@@ -1,4 +1,4 @@
-From 8d876ea19579ee6b687668921c17be423cf7d6c2 Mon Sep 17 00:00:00 2001
+From a4325b6f6ddbebf3ecaee8f3825a2f03096adb6d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 Apr 2025 15:26:09 -0700
 Subject: [PATCH] Use -Os to compile hb-subset-plan-layout.cc
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/src/meson.build b/src/meson.build
-index 3d1c00d..fded728 100644
+index cbe5d9e..d7fc764 100644
 --- a/src/meson.build
 +++ b/src/meson.build
-@@ -393,7 +393,6 @@ hb_subset_sources = files(
+@@ -398,7 +398,6 @@ hb_subset_sources = files(
    'hb-subset-instancer-solver.hh',
    'hb-subset-instancer-solver.cc',
    'hb-subset-plan.cc',
@@ -28,7 +28,7 @@ index 3d1c00d..fded728 100644
    'hb-subset-plan-var.cc',
    'hb-subset-plan.hh',
    'hb-subset-plan-member-list.hh',
-@@ -410,6 +409,10 @@ hb_subset_sources = files(
+@@ -415,6 +414,10 @@ hb_subset_sources = files(
    'hb-subset.hh',
  )
  
@@ -39,7 +39,7 @@ index 3d1c00d..fded728 100644
  hb_subset_headers = files(
    'hb-subset.h',
    'hb-subset-serialize.h'
-@@ -618,6 +621,12 @@ endif
+@@ -629,6 +632,12 @@ endif
  
  darwin_versions = [hb_version_int, '@0@.0.0'.format(hb_version_int)]
  
@@ -52,7 +52,7 @@ index 3d1c00d..fded728 100644
  libharfbuzz = library('harfbuzz', hb_sources,
    include_directories: incconfig,
    dependencies: harfbuzz_deps,
-@@ -645,7 +654,7 @@ defs_list += [harfbuzz_subset_def]
+@@ -656,7 +665,7 @@ defs_list += [harfbuzz_subset_def]
  libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
    include_directories: incconfig,
    dependencies: [m_dep],
@@ -61,7 +61,7 @@ index 3d1c00d..fded728 100644
    cpp_args: cpp_args + extra_hb_cpp_args,
    soversion: hb_so_version,
    version: version,
-@@ -657,7 +666,7 @@ libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
+@@ -668,7 +677,7 @@ libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
  custom_target('harfbuzz-subset.cc',
    build_by_default: true,
    output: 'harfbuzz-subset.cc',
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
index db5a04486c..71eada7f28 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 SRC_URI += "file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch"
-SRC_URI[sha256sum] = "50f7d0a208367e606dbf6eecc5cfbecc01a47be6ee837ae7aff2787e24b09b45"
+SRC_URI[sha256sum] = "093714c8548a285094685f0bdc999e202d666b59eeb3df2ff921ab68b8336a49"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.43.0


