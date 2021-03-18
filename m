Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.4378.1616038499410002019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 20:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 34/64-60958-16AC2506; Thu, 18 Mar 2021 03:34:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRWlGSWpSXmKPExsViZ8MxRTfhVFC
  CwYUlJhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aC3bfYCh7KVPTP/8vawDhBsouRi0NIYDOT
  xNxX+1i7GDmBnBOMElO25YPYbAKaEr1btjB2MXJwiAjoSVz9JwoSZhZQl7i0roUFxBYW8JG4e
  eMgO4jNIqAqcez9FmYQm1fAVWLW4dOMILaEgILElIfvweKcAm4SN5/3M0OscpWYduMEE0S9oM
  TJmU9YIOZLSBx88YIZoldRYvblZhYIu0piTcc0tgmM/LOQtMxC0rKAkWkVo0VSUWZ6RkluYma
  OrqGBga6hoZGuoaWFrpGhqV5ilW6SXmqpbnlqcYmuoV5iebFecWVuck6KXl5qySZGYDCmFBy7
  voPx6usPeocYJTmYlER5RdcHJQjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4FU+CZQTLEpNT61Iy
  8wBRgZMWoKDR0mE9+URoDRvcUFibnFmOkTqFGMsx7ufixcxc7xZuwRIvgWTbffuAsl2MDlzwc
  HVzByzwOT99kNA8gGIFGLJy89LlRLnNQfZKQAyNKM0D24lLAlcYpSVEuZlZGBgEOIpSC3KzSx
  BlX/FKM7BqCTMe/QE0BSezLwSuMteAR3NBHR0BD/Y0SWJCCmpBibDZwvTjEVesanGGadtvBGS
  8WHL9Ic6Z9eUGz94sk7PO0d//Z9t7Rz2gRvTLtxUW7+oebe65uS8zXXhiyxmxfhVfHKcyM/5/
  Ei22d4I5ZrHmvcVWrazhOyxyZ2Scf+mSp2sd0nML5viJ908tS9uskyVkIyfvzbIVV5gjf7eXJ
  uv/3/P2FjD6PWgKyng++HlR5Ife2z4oOl96tzBYPvpF2yY7R/c0H8tU/NnzqX9L7kXbbybGyT
  /5fh/86Ktbzjz9fWUWiW45ig9qXdunpKzvaAtav1b7g+7VtzxY1DznGR4OiOvavbGg7HVF5f0
  Cb6VS6mTOxy5M7i74oVmAcdTfm6n4DllC9701eXXbefhu6nEUpyRaKjFXFScCACCvM4/fQMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-26.tower-287.messagelabs.com!1616038496!430688!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20181 invoked from network); 18 Mar 2021 03:34:56 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-26.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Mar 2021 03:34:56 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12I3Yo02006298
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 03:34:56 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 03:34:52 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 2/3] vulkan-loader: upgrade 1.2.162.0 -> 1.2.170.0
Date: Thu, 18 Mar 2021 11:34:39 +0800
Message-ID: <1616038480-24925-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616038480-24925-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1616038480-24925-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
removed since it is included in 1.2.170.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...name-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch | 40 -------------------
 ....2.162.0.bb => vulkan-loader_1.2.170.0.bb} |  5 ++-
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.162.0.bb => vulkan-loader_1.2.170.0.bb} (88%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch b/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
deleted file mode 100644
index 26b1a40f26..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5ae24ece75f2caa69216da7075334711642f5588 Mon Sep 17 00:00:00 2001
-From: Michel Zou <xantares09@hotmail.com>
-Date: Wed, 16 Dec 2020 15:03:23 +0100
-Subject: [PATCH] Rename LIB_SUFFIX to VULKAN_LIB_SUFFIX
-
-Closes #527
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-Loader/commit/66a23ac8c566299343668f094de50798a5f4a0e4]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- loader/CMakeLists.txt | 2 +-
- loader/vulkan.pc.in   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/loader/CMakeLists.txt b/loader/CMakeLists.txt
-index 659511855..ba9f460f1 100644
---- a/loader/CMakeLists.txt
-+++ b/loader/CMakeLists.txt
-@@ -327,7 +327,7 @@ if(PKG_CONFIG_FOUND)
-         set(PRIVATE_LIBS "${PRIVATE_LIBS} -l${LIB}")
-     endforeach()
-     if(WIN32)
--        set(LIB_SUFFIX "-1")
-+        set(VULKAN_LIB_SUFFIX "-1")
-     endif ()
-     configure_file("vulkan.pc.in" "vulkan.pc" @ONLY)
-     install(FILES "${CMAKE_CURRENT_BINARY_DIR}/vulkan.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
-diff --git a/loader/vulkan.pc.in b/loader/vulkan.pc.in
-index fc17cb1f3..44049ee34 100644
---- a/loader/vulkan.pc.in
-+++ b/loader/vulkan.pc.in
-@@ -6,7 +6,7 @@ includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
- Name: @CMAKE_PROJECT_NAME@
- Description: Vulkan Loader
- Version: @VK_API_VERSION@
--Libs: -L${libdir} -lvulkan@LIB_SUFFIX@
-+Libs: -L${libdir} -lvulkan@VULKAN_LIB_SUFFIX@
- Libs.private: @PRIVATE_LIBS@
- Cflags: -I${includedir}
- 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
similarity index 88%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
index d39e7af975..6b6ed06dbb 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
@@ -10,9 +10,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git \
-           file://0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch \
            "
-SRCREV = "7a313093b5c4af964d50a5a64e73d7df6152ea3f"
+SRCREV = "c5678a03db383fd0dc5bfb8e9a383043bdbcb57b"
 
 S = "${WORKDIR}/git"
 
@@ -27,6 +26,8 @@ EXTRA_OECMAKE = "\
                  -DBUILD_TESTS=OFF \
                  -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
                  -DASSEMBLER_WORKS=FALSE \
+                 -DVulkanHeaders_INCLUDE_DIR=${STAGING_INCDIR} \
+                 -DVulkanRegistry_DIR=${RECIPE_SYSROOT}/${datadir} \
                  "
 
 # must choose x11 or wayland or both
-- 
2.25.1

