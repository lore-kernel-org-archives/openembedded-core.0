Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55539C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 03:21:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.28881.1711509666590874813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 20:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JTWJb1H1;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711509666; x=1743045666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=m1c3jJPvkIEXxzuiYbbv8IlEn4WkBPLzGVtiyCao+yE=;
  b=JTWJb1H1jaqxmh+2XWywhJVfLhJ51FjkAqp3YA1XG51b60u1E7GuEFnP
   5kIc9QoeOwYXgyMHSGLxbS2qTp4AEka0IKJeDRuwUlzO5LIrMft6Sgn8f
   fJEu6tfeo4fRCLpLHJB/ZBXuHLGIJ8sevkrcLPsZ0ThVvaEXe2/Sor2JX
   2LMzms7gELzo/b9BLgcUTb+209q+pebxtYYPVYZKOwcm62cIH7+rz5y2b
   D4nKTA4m4uLuqIHjYCEYKWjLqyLj1NH835OfHDuaCr/aaiJ+kEtSSLe89
   l/UnTtXAux3EZgeqtolVYwCgvz/QacDotx3OLPtddmPQIXjuLppp9ruvo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="141084724"
X-IronPort-AV: E=Sophos;i="6.07,157,1708354800"; 
   d="scan'208";a="141084724"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 12:21:03 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 56527C67E4
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 12:21:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 87A9EE63CD
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 12:21:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 183CA6BF4E
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 12:21:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B91D01A006A;
	Wed, 27 Mar 2024 11:20:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] vulkan: upgrade 1.3.275.0 -> 1.3.280.0
Date: Wed, 27 Mar 2024 11:20:55 +0800
Message-Id: <1711509655-3262-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711509655-3262-1-git-send-email-wangmy@fujitsu.com>
References: <1711509655-3262-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28276.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28276.004
X-TMASE-Result: 10--5.504200-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yTo39wOA02LhILIUtq9brpec2kGz0N2bplfW
	IQC27i4vCNLuPteRDHeeiDAFW6UJG39JXYBaBfzu/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQFH0
	IKehhaoathb+E5jYFPICokZpBcVCcBoT1RsJmrAVB9I5g6XEpi1ff5+SGZ4NkagYFlT7hblGETM
	jf6aTOJ0LU+sPXcOBpphKJ8Hj77B3iczxKARDFCmgws6g0ewz29avse85ISVqBvntZWq2wbU44c
	2/5yddvWyXEB937q1d5OPD8XJFfpB8TzIzimOwP8dA3q/uj/L/EQdG7H66TyHEqm8QYBtMOj594
	WxPERNZNTfLIeH8b/tIlORMkJ4lFIiW38ezLMR4TR/w/RoWRsLSvcBdl3loc3bKktO+XNlbwY3x
	XlodD06QQkeDq8LNrgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 03:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197546

From: Wang Mingyu <wangmy@fujitsu.com>

0001-generate-glslang-pkg-config.patch
refreshed for 1.3.280.0

License-Update:
===============
spirv-headers:License-Update: List all licenses in the root LICENSE file.
vulkan-volk:Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glslang/0001-generate-glslang-pkg-config.patch     | 10 +++++-----
 .../{glslang_1.3.275.0.bb => glslang_1.3.280.0.bb}     |  2 +-
 ...headers_1.3.275.0.bb => spirv-headers_1.3.280.0.bb} |  4 ++--
 ...irv-tools_1.3.275.0.bb => spirv-tools_1.3.280.0.bb} |  2 +-
 ...eaders_1.3.275.0.bb => vulkan-headers_1.3.280.0.bb} |  2 +-
 ...-loader_1.3.275.0.bb => vulkan-loader_1.3.280.0.bb} |  4 ++--
 ...an-tools_1.3.275.0.bb => vulkan-tools_1.3.280.0.bb} |  4 ++--
 ....275.0.bb => vulkan-utility-libraries_1.3.280.0.bb} |  2 +-
 ....275.0.bb => vulkan-validation-layers_1.3.280.0.bb} |  4 ++--
 ...lkan-volk_1.3.275.0.bb => vulkan-volk_1.3.280.0.bb} |  4 ++--
 10 files changed, 19 insertions(+), 19 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.275.0.bb => glslang_1.3.280.0.bb} (96%)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.275.0.bb => spirv-headers_1.3.280.0.bb} (84%)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.275.0.bb => spirv-tools_1.3.280.0.bb} (96%)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.275.0.bb => vulkan-headers_1.3.280.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.275.0.bb => vulkan-loader_1.3.280.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.275.0.bb => vulkan-tools_1.3.280.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.275.0.bb => vulkan-utility-libraries_1.3.280.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.275.0.bb => vulkan-validation-layers_1.3.280.0.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.275.0.bb => vulkan-volk_1.3.280.0.bb} (89%)

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
diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
similarity index 84%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
index 598a8fc209..26bfd9c4fa 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Machine-readable files for the SPIR-V Registry"
 SECTION = "graphics"
 HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "1c6bb2743599e6eb6f37b2969acc0aef812e32e3"
+SRCREV = "8b246ff75c6615ba4532fe4fde20f1be090c3764"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
index 05c6de1b50..d2b6acf946 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "f0cc85efdbbe3a46eae90e0f915dc1509836d0fc"
+SRCREV = "04896c462d9f3f504c99a4698605b6524af813c1"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb
index aacec8cab1..371cc7304d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.280.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "217e93c664ec6704ec2d8c36fa116c1a4a1e2d40"
+SRCREV = "577baa05033cf1d9236b3d078ca4b3269ed87a2b"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb
index 7caed67207..b738771801 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.275;protocol=https"
-SRCREV = "00893b9a03e526aec2c5bf487521d16dfa435229"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.3.280;protocol=https"
+SRCREV = "61a9c50248e09f3a0e0be7ce6f8bb1663855f979"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb
index f86912c903..a7e4a67aaa 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.275.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.280.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
-SRCREV = "c86d42cf9eb620eeac377e3bff46ae342c5cd664"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.280;protocol=https"
+SRCREV = "136976082d0b14dad8b9687982b2a80cc6e6a633"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb
index 759a03926b..3ab31af96a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "4cfc176e3242b4dbdfd3f6c5680c5d8f2cb7db45"
+SRCREV = "a4140c5fd47dcf3a030726a60b293db61cfb54a3"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.280.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.275.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.280.0.bb
index 239589108d..c488309c91 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.275.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.280.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.275;protocol=https"
-SRCREV = "780c65337e111c7385109c7b720d757a778e4fe2"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.280;protocol=https"
+SRCREV = "8506077b9a25a00684e8be24b779733ae1405a54"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.275.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb
similarity index 89%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.275.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb
index f4e6e89aac..2ef12fedf8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.275.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb
@@ -7,10 +7,10 @@ BUGTRACKER = "https://github.com/zeux/volk"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=b2dd098d35668a801190a9d9d47461b0"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "f2a16e3e19c2349b873343b2dc38a1d4c25af23a"
+SRCREV = "01986ac85fa2e5c70df09aeae9c907e27c5d50b2"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


