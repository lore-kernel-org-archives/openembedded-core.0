Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web08.1816.1614817789311015930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 16:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 26/8F-41911-BF920406; Thu, 04 Mar 2021 00:29:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MRqvtL0yH
  B4PAvA4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePj9+csBcekK3o/PmJsYHwt0cXIxSEksIlJ
  4ujyu4wQznFGiYlHpjF3MXJysAloSvRu2QKU4OAQEdCTuPpPFCTMLKAucWldCwuILSxgI7Fi2
  xdGEJtFQEVicdMUMJtXwFVi+o6DTCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZogaRYnZl5
  tZIOwqiTUd09gmMPLOQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGusa6hpYmeolVuol
  6qaW6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMAASylkPrSD8cnrD3qHGCU5mJREeQ98sU8Q
  4kvKT6nMSCzOiC8qzUktPsQow8GhJMHbAwxZIcGi1PTUirTMHGCww6QlOHiURHjV1IDSvMUFi
  bnFmekQqVOMuhzvfi5exCzEkpeflyolzntMA6hIAKQoozQPbgQs8i4xykoJ8zIyMDAI8RSkFu
  VmlqDKv2IU52BUEubtB7mEJzOvBG7TK6AjmICOmOVmB3JESSJCSqqByXbF5or92tl7glyjlQS
  0r8kuYLtusWHJktknIxbyvDT1CJf78emskNaPBAOWST+XnNq/q0yy2WH6BumWiXO49/yd++Lb
  MccCoY9nE58rnd8v+tEycv0q0UJ/K/fj3ZKsMY/euq41D55jo9fVtio/9taBxT9f/2Fy9Ml/o
  m3J/jv75QXnvOutPWXzvXIELU8L3BUJl8laZHuB69YzXoHanZyXXl5yvj57mft/4407ajVj2c
  WDZp98IS9gosE5qyF9/g4H/x9tMpJfXL+3r/57l+Xh+hnP3n4NrmssLWcvv9SyRmv3rkNHf/Z
  1yIoY9+2Ydkwl6uxdjSK/4/uSf/KcaL73MPCnqH6mvVjM0awjF5RYijMSDbWYi4oTAdpktJs3
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-226.messagelabs.com!1614817786!199826!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5866 invoked from network); 4 Mar 2021 00:29:46 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-16.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2021 00:29:46 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1240TjHd009223
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 00:29:45 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 00:29:44 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] shaderc: upgrade 2020.4 -> 2020.5
Date: Thu, 4 Mar 2021 08:29:38 +0800
Message-ID: <1614817778-40426-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

0003-cmake-add-option-to-skip-build-the-examples.patch removed since it
is included in 2020.5

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...dd-option-to-skip-build-the-examples.patch | 47 -------------------
 .../{shaderc_2020.4.bb => shaderc_2020.5.bb}  |  3 +-
 2 files changed, 1 insertion(+), 49 deletions(-)
 delete mode 100644 meta/recipes-graphics/shaderc/files/0003-cmake-add-option-to-skip-build-the-examples.patch
 rename meta/recipes-graphics/shaderc/{shaderc_2020.4.bb => shaderc_2020.5.bb} (88%)

diff --git a/meta/recipes-graphics/shaderc/files/0003-cmake-add-option-to-skip-build-the-examples.patch b/meta/recipes-graphics/shaderc/files/0003-cmake-add-option-to-skip-build-the-examples.patch
deleted file mode 100644
index 43f9edc031..0000000000
--- a/meta/recipes-graphics/shaderc/files/0003-cmake-add-option-to-skip-build-the-examples.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From f1064e4b6cfc5955bc7e2b036f2d05540da9f09b Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sat, 13 Feb 2021 00:45:56 +0000
-Subject: [PATCH 3/3] cmake: add option to skip build the examples
-
-Upstream-Status: Backport [https://github.com/google/shaderc/commit/8d081127ee28ff5df8123c994c00bc66a57e9e9c]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- CMakeLists.txt | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b358f6b..d8a5405 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -40,6 +40,16 @@ else()
-   message(STATUS "Configuring Shaderc to avoid building tests.")
- endif()
- 
-+option(SHADERC_SKIP_EXAMPLES "Skip building examples" ${SHADERC_SKIP_EXAMPLES})
-+if(NOT ${SHADERC_SKIP_EXAMPLES})
-+  set(SHADERC_ENABLE_EXAMPLES ON)
-+endif()
-+if(${SHADERC_ENABLE_EXAMPLES})
-+  message(STATUS "Configuring Shaderc to build examples.")
-+else()
-+  message(STATUS "Configuring Shaderc to avoid building examples.")
-+endif()
-+
- option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
- option(BUILD_EXTERNAL "Build external dependencies in /third_party" ON)
- 
-@@ -114,7 +124,9 @@ endif()
- add_subdirectory(libshaderc_util)
- add_subdirectory(libshaderc)
- add_subdirectory(glslc)
--add_subdirectory(examples)
-+if(${SHADERC_ENABLE_EXAMPLES})
-+    add_subdirectory(examples)
-+endif()
- 
- add_custom_target(build-version
-   ${PYTHON_EXECUTABLE}
--- 
-2.30.1
-
diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb b/meta/recipes-graphics/shaderc/shaderc_2020.5.bb
similarity index 88%
rename from meta/recipes-graphics/shaderc/shaderc_2020.4.bb
rename to meta/recipes-graphics/shaderc/shaderc_2020.5.bb
index 73aa0ee969..ce51aab034 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.5.bb
@@ -6,11 +6,10 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "0dbd899941a43ffd55df527d65128b3b66e75c9c"
+SRCREV = "f3e39a7eed682faececb73f0b85717f2f44ee9ba"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-           file://0003-cmake-add-option-to-skip-build-the-examples.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.25.1

