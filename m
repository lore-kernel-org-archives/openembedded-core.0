Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E09CD1280
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:35:23 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7887.1711413316904058813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jqbz4IpZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413320; x=1742949320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QCHkPvEDkAP/BNr4tFZPOJj/hONewQF9YENzz/+QZnM=;
  b=jqbz4IpZON55YzEiv1vRbT8OT4z3bS78HvZ15GXrH22HsnajIXTWg4DK
   u07zi9ARA0G73YySdzZ1JqnrEmK2RrX6glY5SU27FALNC66zXg+EYDEGR
   qfFlYeXOww3HFUUgjroXEBAJYT8wZ87AslL1Qo1033OnwFAQLpLAB9Zs4
   3QPFBp8aCrGZ4PIbuBVizBhpB8a2PVQyVs0tMPPCHSOJ83FWOQl5aDAJP
   m3KSu0VsIN5XAYh2r9AxDL2CXiKytCObuSEO0T9aSW6dvgy+NERZ0wnwJ
   4PqdTcPrRNtFhUX6Brl6fGqvNQu3Qkze9DqdioExn9HOV9sDWP/mfw4s5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="140943733"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="140943733"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:35:18 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F37F3D5A4E
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E235D4241
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B1C0620097CE1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5EBA71A006A;
	Tue, 26 Mar 2024 08:35:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 07/34] glslang: upgrade 1.3.275.0 -> 1.3.280.0
Date: Tue, 26 Mar 2024 08:34:25 +0800
Message-Id: <1711413292-3025-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--7.919100-10.000000
X-TMASE-MatchedRID: N25sXaafkGCjz0nOeth/yTo39wOA02LhpxAd6mi1Ga3k6Qbi+9i6DwzK
	NF0GZctoEFRfkXUcAJkaN/0v2D4OIWrs+r6+nS7OOyPKih4RyshS5VVMJCvrajVZZXdn1jdTCX4
	fIBw+J7vOG+e9aAIpHuNBEQL/tCTjQ0UBIVa+8PVrzsINdopFUhniLo7qSg5vopx6eBZcyAjQGF
	lKOB0iJH9X1FnDz9RDCryRGLW3p0MbO59FK9BdmJAk4Vz6rKorVJjlf6wjKQeU8ftiyKjZrdMjj
	wb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNlVHM/F6YkvQ/xRB6OGnb2v+aPQT1cxlGRK7L
	DEHcSORLcbphQzsYtLhX/lUQGcew7GX0c1UlalyDIpcBQ49iRP7KE7XIKgt8tE8mz+ry/JT4e/Z
	QnTz3TpF+zAANQJy4Lmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0Ubv+efAnnZBiL6nKAI
	YoU8L4h0UTnrIANlF0EZ413A/3oF4mL8qgAJv73I7sipFWLtLL2ZLzVteDkQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197496

From: Wang Mingyu <wangmy@fujitsu.com>

0001-generate-glslang-pkg-config.patch
refreshed for 1.3.280.0.

Changelog:
==========
* Add a new --abosute-path command-line option to output absolute paths in error messages
* Support GL_EXT_control_flow_attributes2
* Support GL_ARB_shading_language_include
* Fix HLSL built-in passthrough via inout
* Enable -Wimplicit-fallthrough and fix warnings
* Fix -Wmissing_field_initializer warnings
* Document supported dependencies in known_good.json
* Clear spirv vector before use
* Emit debug info for accelerationStructure and rayQuery variables
* Support NV_shader_atomic_fp16_vector
* Support GL_EXT_expect_assume_support
* Allow external control of whether glslang will be tested or installed
* Improve debug source and line info
* Support GL_KHR_shader_subgroup_rotate
* Add SPIRV-Tools-opt dependency if ENABLE_OPT
* Support EXT_shader_quad_control
* Add OpAssumeTrueKHR and OpExpectKHR
* Support GL_EXT_maximal_reconvergence
* Remove generation of deprecated Target.cmake files
* Fix array size of gl_SampleMask and gl_SampleMaskIn
* Support GL_ARB_texture_multisample_extension
* Emit DebugTypePointer when non-semantic debug info is enabled

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glslang/0001-generate-glslang-pkg-config.patch     | 10 +++++-----
 .../{glslang_1.3.275.0.bb => glslang_1.3.280.0.bb}     |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.275.0.bb => glslang_1.3.280.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 316a57fa4a..e6bb6ec8e3 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 4cede5edcff96134baf35953d58595c4aa5f1fc5 Mon Sep 17 00:00:00 2001
+From fc33f1cf032a15c07044ef932bc991c346d62d62 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -15,12 +15,12 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 37eecaad..6974935c 100644
+index e4690f09..8e660bc5 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -251,6 +251,8 @@ if(PROJECT_IS_TOP_LEVEL)
-         ")
-         install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glslangTargets.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
+@@ -233,6 +233,8 @@ if(GLSLANG_ENABLE_INSTALL)
+         install(TARGETS MachineIndependent EXPORT glslang-targets)
+         install(TARGETS GenericCodeGen EXPORT glslang-targets)
      endif()
 +    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/glslang.pc.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc @ONLY)
 +    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
index 2fd1e72a26..637082c719 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "a91631b260cba3f22858d6c6827511e636c2458a"
+SRCREV = "ee2f5d09eaf8f4e8d0d598bd2172fce290d4ca60"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.34.1


