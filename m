Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA73D41D79
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.82409.1731403504840031146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RBnjk3ej;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403506; x=1762939506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gYRyrzCZGJBjil1WZ3rerrXag0PHVxsok6n3XbFvEcw=;
  b=RBnjk3ejY4+GzaRCRXy0FudNb7S6jlxyKDoDNPaRALmMpXI2OC9k706G
   QOnyExmWhD4UnZo/DbPVRKYHLX8rmMW7jsD+0qpBCdlidDVRQv4SsWuVF
   qQHvF5XpS2p0eiTZuFQKMc9r3qaqddMH20QvJz9PvD+bud9LruGiC+zmE
   /1FJO9JENqqr5hus6xTnHDAIB5Hk898LGyyaeF/GIgU14A7iry7GYFuiv
   S1enzD+e3srCWHBD8VK26LNuMuSMuJC1u2B0M8rEE1A7sc/PCcEDjHIow
   Ko3nu97I8U3BdukXSV+jrQBrVv0bFSMxOIA2uutD4vJmLcpRtd+FH/8IY
   Q==;
X-CSE-ConnectionGUID: rsLoXAo5Tlm0SZtG9b1OpA==
X-CSE-MsgGUID: pCTUGy4xSfWOfuuVBfmh0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="179257922"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="179257922"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 81737E428E
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C1ACF31EC
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A3A5020071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5164C1A000A;
	Tue, 12 Nov 2024 17:25:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/47] glslang: upgrade 1.3.290.0 -> 1.3.296.0
Date: Tue, 12 Nov 2024 17:24:04 +0800
Message-Id: <1731403483-21399-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--1.614300-10.000000
X-TMASE-MatchedRID: OIStEy/X03Cjz0nOeth/yTo39wOA02LhpxAd6mi1Ga0Nx/6rqr35uPea
	4uH4Y9hv0tPgxIiOqXCvJYCsbEmye/XNEkgZOg/ORLmyB39u44/adxdoSnXyVl4a0aNSuN1VXWj
	vA8TpWFiZ0VJ3wZ8pO2tF9sTtzaRRw88BlnG/Jd9SvcZUjrkaFs78PItWKHEPHyBgmbm07MQv6f
	xIpbEpi5aKhemuA7pOVmYFlGxygJQrqSb6h39QPGBLcedPqO9/aZATGA5/BXjdtCoZAk3E1IO3H
	yUMPRbHVZb3m5KO5Mp0BmoH+/Y0TDW/8wKq0mg1b/oIJuUAIuGysgEcy57Z3N9RlPzeVuQQ1vZ7
	s3YIVDL7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBmyTBaqiJvcvn+2qfQyWg3KWL6
	m3iilWGUVI5FRUThesAOQUYGwh4kzPB7mzXyiQzsKXyzHgcEbwEM6ofA+CGObKItl61J/yZ+inT
	K0bC9eKrauXd3MZDUbNX2gaPQdl8xGc/XLZlCgCbJVCrnr3B3GnuLfjjLoBuYlxL67Zz7hVl70E
	y60GJbjO0NuaYxgYR3c759kXrP9yFfgMjdo+laZbXP29aXx5lPJnXL2yNYdkuo847l05tDEzMyA
	msz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206994

From: Wang Mingyu <wangmy@fujitsu.com>

0001-generate-glslang-pkg-config.patch
refreshed for 1.3.296.0

Changelog:
===========
* Explicitly export all symbols that are part of the public API and hide other symbols by default
* Allow building glslang without the SPIR-V backend using the new ENABLE_SPIRV build option
* Add setResourceSetBinding method to the API
* Add interface to get the GLSL IO mapper and resolver
* Allow compute derivative modes when the workgroup dimensions are spec constants
* Improve debug location of branch/return instructions
* Silence preprocessor '#' error reporting in inactive #if/#ifdef/#elif/#else blocks
* Apply GLSL memory decorations to top-level OpVariable
* Move definition of GLSLANG_EXPORT to visibility.h
* Merge ancillary libraries into main glslang library and stub originals
* Add public setSourceFile and addSourceText methods to TShader class
* Add type checks for hitObjectNV
* Add optimizerAllowExpandedIDBound to SpvOptions
* Add SpvTools.h back to public headers
* Add cross-stage check for missing outputs
* Fix HLSL offsets for non-buffers
* Add types and functions for IO mapping to API
* Add function to set preprocessed code to API
* Add set/get version functions to API
* Expose setGlobalUniform functions to API
* Don't emit debug instructions before an OpPhi
* Add command-line and API option to enable reporting column location for compiler errors
* Improve location aliasing checks
* Support constant expression calculated by matrixCompMult
* Fix crash caused by atomicCounter() use without arguments
* Fix multi-line function call line numbers
* Add line info to OpDebugDeclare for function parameters
* Fix HLSL OpDebugFunction file name
* Fix duplicate decorations
* Enable compilation of glslang without thread support for WASI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch  | 6 +++---
 .../glslang/{glslang_1.3.290.0.bb => glslang_1.3.296.0.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.290.0.bb => glslang_1.3.296.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index f8c0fc64c8..04dab67773 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 0311dfd63ea41abb45aaf0f4ccc674f574ce639e Mon Sep 17 00:00:00 2001
+From df6111570ada81d3968043decb5eee16dc5f9fa1 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 8d4b1e9c..717c6d47 100644
+index 47925d8d..d90191c3 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -235,6 +235,8 @@ if(GLSLANG_ENABLE_INSTALL)
+@@ -255,6 +255,8 @@ if(GLSLANG_ENABLE_INSTALL)
          install(TARGETS MachineIndependent EXPORT glslang-targets)
          install(TARGETS GenericCodeGen EXPORT glslang-targets)
      endif()
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
index d6ee46de1e..3b66e3544c 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.290.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.296.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "fa9c3deb49e035a8abcabe366f26aac010f6cbfb"
+SRCREV = "46ef757e048e760b46601e6e77ae0cb72c97bd2f"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.34.1


