Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22C3C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:39 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.10806.1710313778251336825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VbPNTGF4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313779; x=1741849779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cC4lTWZsvQDXYbQNHz0s6zeOK9wAAxVe1Whqw2yUVKs=;
  b=VbPNTGF4wSGCXzXP8jkHJv68HYuCHtw/AnNPNk3XZ8TcvdjOjeQM0Kwa
   jDgpSF+130mL3RMVTCGvYiEiv6GGpt2l1/c3em8+4btqIAU5XyFV8uP/s
   uoxXQTIvEmFEa22dPBetU6UcERF1Mn4uUeSsG6KPpOqK8J+eyOk8q0sA5
   5TVLoETRnwfcO2hXSi5l550m2yLu117J0ds5j3OM2SPx+7nYOA4HBf7iE
   rnwYE4NGyyOVLIYd7L9sLb4b2jO9ysopd9arMdVNH0eug1vMrV1U9XoLc
   Q5Xe+OeJONqOWPb+aXmL2nIFYXP4B83Gph5A6zb2vdTMsyiaftLQsTlWP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="131486904"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="131486904"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EFA09E6005
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 33DF4D5EB0
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B36102235C4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 603F61A006B;
	Wed, 13 Mar 2024 15:09:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/36] shaderc: update 2023.8 -> 2024.0
Date: Wed, 13 Mar 2024 15:08:29 +0800
Message-Id: <1710313714-12541-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--0.415600-10.000000
X-TMASE-MatchedRID: WyUGENwRfaf69udj0zppv0WtyNepX5gAnJdsOLB4zv5fv9SYkzU9kdnf
	JrUSEbFDJMPD8FR5f58F1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0547V5fSMRD1zqvyd
	Cq8nsegumxfziGDG2mm7pfJtrtKhQnmXm2q8T95V8LCAHuMHCRki8rgutezVp6Eb8NHwTaSSETM
	jf6aTOJ9A1IgPHTFOh8P9okCGHeziuyr/sGF0bIJV3j1zTOBYzTfK5j0EZbyu8XrdT+OO1kCMvx
	YNZkZ6i7QHQxPxLQSSAMuqetGVetnyef22ep6XYxlblqLlYqXI+3M0kPCI5PY1tmofOmqfQrpqn
	abnG9erihyDkZfOwU5Rg6+vWVkgA+YWKHiMhtFVHFic+HD7mF14lo3Z59+dc3aycHbHQZzn+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197033

From: Wang Mingyu <wangmy@fujitsu.com>

0001-cmake-disable-building-external-dependencies.patch
refreshed for 2024.0

Changelog:
==========
 - Update dependencies
 - Utilities:
    - Use Python3 explicitly in utility scripts

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...make-disable-building-external-dependencies.patch | 12 ++++++------
 .../shaderc/{shaderc_2023.8.bb => shaderc_2024.0.bb} |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.8.bb => shaderc_2024.0.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
index 4212512034..5c49aa7fd5 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-disable-building-external-dependencies.patch
@@ -1,4 +1,4 @@
-From 792a46ef27ef879a21c9f01a198eae213ea535e6 Mon Sep 17 00:00:00 2001
+From 941f5f5831e7a52c26168f81f25d0470860ca6f1 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 13 Feb 2021 00:45:56 +0000
 Subject: [PATCH] cmake: disable building external dependencies
@@ -15,7 +15,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  2 files changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7bc8f5d..13fc535 100644
+index ffcb54b..cce715e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -62,6 +62,7 @@ else()
@@ -26,7 +26,7 @@ index 7bc8f5d..13fc535 100644
  
  set (CMAKE_CXX_STANDARD 17)
  
-@@ -123,8 +124,14 @@ endif(MSVC)
+@@ -119,8 +120,14 @@ endif(MSVC)
  
  
  # Configure subdirectories.
@@ -43,9 +43,9 @@ index 7bc8f5d..13fc535 100644
  
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
-@@ -136,7 +143,7 @@ endif()
+@@ -132,7 +139,7 @@ endif()
  add_custom_target(build-version
-   ${PYTHON_EXECUTABLE}
+   ${Python_EXECUTABLE}
    ${CMAKE_CURRENT_SOURCE_DIR}/utils/update_build_version.py
 -  ${shaderc_SOURCE_DIR} ${spirv-tools_SOURCE_DIR} ${glslang_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR}/build-version.inc
 +  ${CMAKE_CURRENT_BINARY_DIR}/build-version.inc ${shaderc_SOURCE_DIR} ${spirv-tools_SOURCE_DIR} ${glslang_SOURCE_DIR}
@@ -53,7 +53,7 @@ index 7bc8f5d..13fc535 100644
  
  function(define_pkg_config_file NAME LIBS)
 diff --git a/utils/update_build_version.py b/utils/update_build_version.py
-index 11ee53e..d39e59d 100755
+index b7ce5b8..95b34c5 100755
 --- a/utils/update_build_version.py
 +++ b/utils/update_build_version.py
 @@ -30,6 +30,7 @@ import re
diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.8.bb b/meta/recipes-graphics/shaderc/shaderc_2024.0.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.8.bb
rename to meta/recipes-graphics/shaderc/shaderc_2024.0.bb
index bc7afbdf5e..9975c608ac 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.8.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2024.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "f8a25c591bf5edbb462ca4aea99dcc666f096d13"
+SRCREV = "9f56ca620c07d6c4d119c65c1c1f3f1c584c9985"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.34.1


