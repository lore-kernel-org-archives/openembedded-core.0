Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3F8CFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 06:27:56 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10500.1763965669007735174
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Nov 2025 22:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=c43Wdm/8;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=4160b5489=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1763965669; x=1795501669;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=//hAYgVwUAaU2Pl6oZSO/34Njhl/2dn2i/0gMnIAINE=;
  b=c43Wdm/8f5AlI4FlCwyQv5HlUpFvAC1gmjHTqYatHeKZMlsrdbWgB3Pw
   tty+Jpxa2d2HikTL6d2D2GvTLIZmbEi2a6IGmDRuh8raM4z6gWHudnMR1
   TdnOqhBn4K6/4tyjEEoHbl6DbnPOJhkSJ8PuoBUAqCpZIfiajBTe5Mqq+
   s=;
X-CSE-ConnectionGUID: M145IskVQuGXCmXq6QNxfA==
X-CSE-MsgGUID: yt5aS5RwSQmygZYoYJ6HRA==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 24 Nov 2025 07:27:46 +0100
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw3.muc with
 ESMTP/TLS; 24 Nov 2025 07:27:46 +0100
Received: from smucmp17h.bmwgroup.net (HELO smucmp17h.europe.bmw.corp)
 ([10.30.13.158]) by esabb4.muc with ESMTP/TLS; 24 Nov 2025 07:27:47 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp17h.europe.bmw.corp (2a03:1e80:a15:58f::1:54) with Microsoft SMTP
 Server (version=TLS; Mon, 24 Nov 2025 07:27:46 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 24 Nov 2025 07:27:46 +0100
X-CSE-ConnectionGUID: WmFVeVcASHqWisy/+DbP5A==
X-CSE-MsgGUID: 7X4RRbj9SQ6Ox8VurG4Gow==
X-CSE-ConnectionGUID: ZuG3EpnESS+ycdO8gD5u1Q==
X-CSE-MsgGUID: LrdtxtyzT8GCT7SoW5w2NQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.1.2 -> 4.2.0
Date: Mon, 24 Nov 2025 07:27:29 +0100
Message-ID: <20251124062729.1092070-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16a.europe.bmw.corp (2a03:1e80:a15:58f::1:2a) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 06:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226736

Release notes are available at [0].

License-Update: File name reference updated via [1] due to renaming in [2]

[0]: https://cmake.org/cmake/help/v4.2/release/4.2.html
[1]: https://gitlab.kitware.com/cmake/cmake/-/commit/cf04a5cf275098bb8348a3f7de3bbe50e9b832ff#748a774aa414d3d0082c025e5025208196812e80
[1]: https://github.com/libarchive/libarchive/commit/c26f0377457db392bd57a640e8fe25506120f810#diff-9de61d76392eebe613f97d9d5b429a1337cc79a7ce765c95aa5a4f38d8150b4e

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...-native_4.1.2.bb => cmake-native_4.2.0.bb} |  2 +-
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 .../cmake/cmake/CVE-2025-9301.patch           | 71 -------------------
 .../cmake/{cmake_4.1.2.bb => cmake_4.2.0.bb}  |  2 -
 4 files changed, 2 insertions(+), 75 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.1.2.bb => cmake-native_4.2.0.bb} (96%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
 rename meta/recipes-devtools/cmake/{cmake_4.1.2.bb => cmake_4.2.0.bb} (98%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.1.2.bb b/meta/recipes-devtools/cmake/cmake-native_4.2.0.bb
similarity index 96%
rename from meta/recipes-devtools/cmake/cmake-native_4.1.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.2.0.bb
index 7b90bff52f..128fef8a6e 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.1.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.2.0.bb
@@ -12,7 +12,7 @@ SRC_URI += "file://OEToolchainConfig.cmake \
 LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
 LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
-    file://Utilities/cmlibarchive/COPYING;md5=d499814247adaee08d88080841cb5665 \
+    file://Utilities/cmlibarchive/COPYING;md5=7ce08437ff7f5e24d72e666313ae4084 \
     file://Utilities/cmexpat/COPYING;md5=7b3b078238d0901d3b339289117cb7fb \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
     file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 256275d42b..0dcc5c3f55 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "643f04182b7ba323ab31f526f785134fb79cba3188a852206ef0473fee282a15"
+SRC_URI[sha256sum] = "4104e94657d247c811cb29985405a360b78130b5d51e7f6daceb2447830bd579"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
deleted file mode 100644
index 5e765c6d9d..0000000000
--- a/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 37e27f71bc356d880c908040cd0cb68fa2c371b8 Mon Sep 17 00:00:00 2001
-From: Tyler Yankee <tyler.yankee@kitware.com>
-Date: Wed, 13 Aug 2025 15:22:28 -0400
-Subject: [PATCH] foreach: Explicitly skip replay without iterations
-
-As written, foreach loops with a trailing `IN` (i.e., no loop
-variable(s) given) lead to an assertion error. Handle this case by
-exiting early when we know the loop won't execute anything.
-
-Fixes: #27135
-
-CVE: CVE-2025-9301
-
-Upstream-Status: Backport
-https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8
-
-Signed-off-by: Tyler Yankee <tyler.yankee@kitware.com>
-Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
----
- Source/cmForEachCommand.cxx                  | 3 +++
- Tests/RunCMake/foreach/RunCMakeTest.cmake    | 1 +
- Tests/RunCMake/foreach/TrailingIn-result.txt | 1 +
- Tests/RunCMake/foreach/TrailingIn.cmake      | 5 +++++
- 4 files changed, 10 insertions(+)
- create mode 100644 Tests/RunCMake/foreach/TrailingIn-result.txt
- create mode 100644 Tests/RunCMake/foreach/TrailingIn.cmake
-
-diff --git a/Source/cmForEachCommand.cxx b/Source/cmForEachCommand.cxx
-index 96867e26..8b741183 100644
---- a/Source/cmForEachCommand.cxx
-+++ b/Source/cmForEachCommand.cxx
-@@ -100,6 +100,9 @@ bool cmForEachFunctionBlocker::ArgumentsMatch(cmListFileFunction const& lff,
- bool cmForEachFunctionBlocker::Replay(
-   std::vector<cmListFileFunction> functions, cmExecutionStatus& inStatus)
- {
-+  if (this->Args.size() == this->IterationVarsCount) {
-+    return true;
-+  }
-   return this->ZipLists ? this->ReplayZipLists(functions, inStatus)
-                         : this->ReplayItems(functions, inStatus);
- }
-diff --git a/Tests/RunCMake/foreach/RunCMakeTest.cmake b/Tests/RunCMake/foreach/RunCMakeTest.cmake
-index 15ca4770..acfc742e 100644
---- a/Tests/RunCMake/foreach/RunCMakeTest.cmake
-+++ b/Tests/RunCMake/foreach/RunCMakeTest.cmake
-@@ -22,3 +22,4 @@ run_cmake(foreach-RANGE-invalid-test)
- run_cmake(foreach-RANGE-out-of-range-test)
- run_cmake(foreach-var-scope-CMP0124-OLD)
- run_cmake(foreach-var-scope-CMP0124-NEW)
-+run_cmake(TrailingIn)
-diff --git a/Tests/RunCMake/foreach/TrailingIn-result.txt b/Tests/RunCMake/foreach/TrailingIn-result.txt
-new file mode 100644
-index 00000000..573541ac
---- /dev/null
-+++ b/Tests/RunCMake/foreach/TrailingIn-result.txt
-@@ -0,0 +1 @@
-+0
-diff --git a/Tests/RunCMake/foreach/TrailingIn.cmake b/Tests/RunCMake/foreach/TrailingIn.cmake
-new file mode 100644
-index 00000000..e2b5b2f2
---- /dev/null
-+++ b/Tests/RunCMake/foreach/TrailingIn.cmake
-@@ -0,0 +1,5 @@
-+foreach(v IN)
-+endforeach()
-+
-+foreach(v1 v2 IN)
-+endforeach()
--- 
-2.48.1
-
diff --git a/meta/recipes-devtools/cmake/cmake_4.1.2.bb b/meta/recipes-devtools/cmake/cmake_4.2.0.bb
similarity index 98%
rename from meta/recipes-devtools/cmake/cmake_4.1.2.bb
rename to meta/recipes-devtools/cmake/cmake_4.2.0.bb
index de86625892..cfc5cb1b93 100644
--- a/meta/recipes-devtools/cmake/cmake_4.1.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.2.0.bb
@@ -11,8 +11,6 @@ SRC_URI:append:class-nativesdk = " \
     file://environment.d-cmake.sh \
 "
 
-SRC_URI += "file://CVE-2025-9301.patch"
-
 LICENSE:append = " & BSD-1-Clause & MIT"
 LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \

