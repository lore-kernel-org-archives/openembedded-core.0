Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07934C83030
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.35170.1751274803700367122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jwBCmYFm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274814; x=1782810814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TRwRRBNzogo3QGA1sUG+V1bd4TDHeeC+iRnsbicg0eY=;
  b=jwBCmYFmMa5qWnfosNqZ0kKTyiLVkhQqt9iLoZN7cSS4Mnic2Yz53OcD
   TGBqQMHMR93y7/RNCV8uUriCocLTJHdhfgIQ38OaExwdYezB9Lfasyp09
   0nIms3pDUBTnrazfjIHTP+ujjClYBzOknYceVr3zsag0hY/8DUkuhhiix
   wtA+GWnplxxt2XJd1lCmuUrJ0A8Fri9K+fv3ZSqUovzHqVQY74hqzfqfP
   +z55PUi7jM24oh5HeqMwgnUFxYVK4K8nvATlriqftezboNHI+zJ7g6xu6
   6HSvKSCrrVdDMOkeqZAZVyBowRF6q60P6arUH2WuhtFh3NY7QtewMSVVW
   A==;
X-CSE-ConnectionGUID: hj6ndn9hQ7afjL2Cd1J6Yw==
X-CSE-MsgGUID: SWHiDKFbSKK8pNRco9JAlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="205056034"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="205056034"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:33 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id E703C18A5
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:33 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 65553C006D4
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:33 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C2998BF3CB
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:32 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4F3161A000B;
	Mon, 30 Jun 2025 17:13:32 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/37] shaderc: upgrade 2025.2 -> 2025.3
Date: Mon, 30 Jun 2025 17:13:13 +0800
Message-ID: <20250630091315.1897-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219493

From: Wang Mingyu <wangmy@fujitsu.com>

0001-cmake-disable-building-external-dependencies.patch
refreshed for 2025.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-cmake-disable-building-external-dependencies.patch | 10 +++++-----
 .../shaderc/{shaderc_2025.2.bb => shaderc_2025.3.bb}   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2025.2.bb => shaderc_2025.3.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 07765653bb..77b81635b6 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From ed0e2fad08a3cd3f0a0c70922737d8a6886f484d Mon Sep 17 00:00:00 2001
+From 3db09ee0d0bf6390eb3dcd835bd4ef786188bf16 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -15,10 +15,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index bd6b890..f1ddd74 100644
+index 06f5395..39b8869 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -62,6 +62,7 @@ else()
+@@ -72,6 +72,7 @@ else()
  endif()
  
  option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
@@ -26,7 +26,7 @@ index bd6b890..f1ddd74 100644
  
  set (CMAKE_CXX_STANDARD 17)
  
-@@ -119,8 +120,14 @@ endif(MSVC)
+@@ -129,8 +130,14 @@ endif(MSVC)
  
  
  # Configure subdirectories.
@@ -43,7 +43,7 @@ index bd6b890..f1ddd74 100644
  
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
-@@ -132,7 +139,7 @@ endif()
+@@ -142,7 +149,7 @@ endif()
  add_custom_target(build-version
    ${Python_EXECUTABLE}
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/update_build_version.py
diff --git a/meta/recipes-graphics/shaderc/shaderc_2025.2.bb b/meta/recipes-graphics/shaderc/shaderc_2025.3.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2025.2.bb
rename to meta/recipes-graphics/shaderc/shaderc_2025.3.bb
index 9e56b97830..692e85e56c 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2025.2.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "8c269ee0fe607f2d7cac00c0cb4fa243d6a6ec26"
+SRCREV = "eb0bc20d0c31320fe834e4ee8eb02807292b9703"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.43.0


