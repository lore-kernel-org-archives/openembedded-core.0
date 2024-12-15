Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24039E77188
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:40 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.33340.1734254975608843039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=czM+Btte;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ptmJtgA9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010193c9a6e459-a56bd6ca-5f41-4911-8b99-99d7c08812f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mTbqUFixM2eE7FgcfI9AFpvk6JYdGAbKZPfE7hghEWg=;
	b=czM+BtteDeSfhf19yrGeSJIuS6AkEaZJzINlM0Dr3f265QcshrU9scReNAIBLLKV
	bjFRtgDHQLmtVWdlOJjNtuoERxHBB1AQpSssywza0qsoPBH/rDpoCnY5MjVM4nyQJ4i
	Z29ITryQbAOZR8xQpD0iQqa4YsMuvOlD5afWiCJ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mTbqUFixM2eE7FgcfI9AFpvk6JYdGAbKZPfE7hghEWg=;
	b=ptmJtgA9gOV6S7Q1lbi1k8GcAyl59rYT/3zxOYXI4Vzn8LcUIWUcaRKRJPo9SZVT
	P4fa6YQ0rcpfHPEhNlSaS/atX6c58xQFjwx4cTRDRgl4+IN63zXrlalLvFnSNfuy/6M
	xF0dDpchqL5bKxBmcFaglFxXaiEI7ZK+1U1/mkEs=
Content-Type: multipart/mixed; boundary="===============1124671624227917031=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 3.31.2,3.31.2 SUCCEEDED
Message-ID: <01010193c9a6e459-a56bd6ca-5f41-4911-8b99-99d7c08812f6-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208702

--===============1124671624227917031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *3.31.2,3.31.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-3.31.0-3.31.2-3.31.0-3.31.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 11c27a955413b0c87ce266870f40109652b7bc72 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 05:49:18 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 3.31.0 -> 3.31.2,3.31.0 -> 3.31.2

---
 .../cmake/{cmake-native_3.31.0.bb => cmake-native_3.31.2.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 2 +-
 ...CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch | 2 +-
 ...Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 4 ++--
 .../cmake/{cmake_3.31.0.bb => cmake_3.31.2.bb}                | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.0.bb => cmake-native_3.31.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.0.bb => cmake_3.31.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d32e2084ef..080b7a352b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "300b71db6d69dcc1ab7c5aae61cbc1aa2778a3e00cbd918bc720203e311468c3"
+SRC_URI[sha256sum] = "42abb3f48f37dbd739cdfeb19d3712db0c5935ed5c2aef6c340f9ae9114238a2"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index 57d5f08149..b487568217 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From 29046e1308bec72cc21b0b00e979906f5a1fb63f Mon Sep 17 00:00:00 2001
+From 6964c1a5a37ae4f611ee02a89db8bf200c054ec1 Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 87efbd993d..11b7e80ba3 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 80655318696091d27d131e8c4a48140e37e73366 Mon Sep 17 00:00:00 2001
+From 3b311543d466b68b183e8f8d3d2c9f1884759a8c Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 9071d0f559..cdcdd1ae4e 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 2b8f6d4a5fddb5212ce07f0c61f5a3edbf5187d4 Mon Sep 17 00:00:00 2001
+From 6cc5b4bb6b2972546a3b35b6b8a9177d0bc1f171 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
@@ -18,7 +18,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index feeaa3b7..c301fb25 100644
+index 4e4b49c1..50e9a733 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
 @@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.0.bb b/meta/recipes-devtools/cmake/cmake_3.31.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.0.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.2.bb
-- 
2.44.1


--===============1124671624227917031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cmake/cmake-bash-completion: PV changed from "3.31.0" to "3.31.2"
packages/core2-64-poky-linux/cmake/cmake-bash-completion: PKGV changed from 3.31.0 [default] to 3.31.2 [default]
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1104562944 to 1104703288 (+0%)
packages/core2-64-poky-linux/cmake/cmake-dbg: PV changed from "3.31.0" to "3.31.2"
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGV changed from 3.31.0 [default] to 3.31.2 [default]
packages/core2-64-poky-linux/cmake/cmake-dev: PV changed from "3.31.0" to "3.31.2"
packages/core2-64-poky-linux/cmake/cmake-dev: PKGV changed from 3.31.0 [default] to 3.31.2 [default]
packages/core2-64-poky-linux/cmake/cmake-doc: PV changed from "3.31.0" to "3.31.2"
packages/core2-64-poky-linux/cmake/cmake-doc: PKGV changed from 3.31.0 [default] to 3.31.2 [default]
packages/core2-64-poky-linux/cmake/cmake-locale: PV changed from "3.31.0" to "3.31.2"
packages/core2-64-poky-linux/cmake/cmake-locale: PKGV changed from 3.31.0 [default] to 3.31.2 [default]
packages/core2-64-poky-linux/cmake/cmake-src: PKGSIZE changed from 10297839 to 10300743 (+0%)
packages/core2-64-poky-linux/cmake/cmake-src: PV changed from "3.31.0" to "3.31.2"
packages/core2-64-poky-linux/cmake/cmake-src: PKGV changed from 3.31.0 [default] to 3.31.2 [default]
packages/core2-64-poky-linux/cmake/cmake-staticdev: PV changed from "3.31.0" to "3.31.2"
packages/core2-64-poky-linux/cmake/cmake-staticdev: PKGV changed from 3.31.0 [default] to 3.31.2 [default]
packages/core2-64-poky-linux/cmake/cmake: PKGSIZE changed from 43177650 to 43201980 (+0%)
packages/core2-64-poky-linux/cmake/cmake: PV changed from "3.31.0" to "3.31.2"
packages/core2-64-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake /usr/share/cmake-3.31/Mo
 dules/Platform/Linker/WindowsStore-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake /usr/share/cmake-3.31/Modules/Platfo
 rm/Linker/WindowsStore-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake"
packages/core2-64-poky-linux/cmake/cmake: PKGV changed from 3.31.0 [default] to 3.31.2 [default]
packages/core2-64-poky-linux/cmake: PV changed from "3.31.0" to "3.31.2"
packages/core2-64-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v3.31/cmake-3.31.0.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch" to "https://cmake.org/files/v3.31/cmake-3.31.2.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch"
packages/core2-64-poky-linux/cmake: PKGV changed from 3.31.0 [default] to 3.31.2 [default]
Changes to packages/core2-64-poky-linux/cmake (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake was added
packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9424302 to 9622467 (+2%)
Changes to packages/x86_64-linux/cmake-native (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake was added

--===============1124671624227917031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake /us
 r/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake /usr/share/cmake-3.31
 /Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake"
Changes to packages/core2-64-poky-linux/cmake (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake was added
Changes to packages/x86_64-linux/cmake-native (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake was added

--===============1124671624227917031==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-3.31.0-3.31.2-3.31.0-3.31.patch"

RnJvbSAxMWMyN2E5NTU0MTNiMGM4N2NlMjY2ODcwZjQwMTA5NjUyYjdiYzcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDU6NDk6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZSxjbWFrZS1uYXRpdmU6IHVwZ3JhZGUgMy4zMS4wIC0+IDMuMzEuMiwzLjMxLjAgLT4gMy4z
MS4yCgotLS0KIC4uLi9jbWFrZS97Y21ha2UtbmF0aXZlXzMuMzEuMC5iYiA9PiBjbWFrZS1uYXRp
dmVfMy4zMS4yLmJifSAgfCAwCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uQ01ha2VEZXRlcm1pbmVDb21waWxl
ckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaCB8IDIgKy0KIC4uLi9jbWFrZS9j
bWFrZS8wMDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2ggfCAyICst
CiAuLi5EaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwt
LnBhdGNoIHwgNCArKy0tCiAuLi4vY21ha2Uve2NtYWtlXzMuMzEuMC5iYiA9PiBjbWFrZV8zLjMx
LjIuYmJ9ICAgICAgICAgICAgICAgIHwgMAogNiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tj
bWFrZS1uYXRpdmVfMy4zMS4wLmJiID0+IGNtYWtlLW5hdGl2ZV8zLjMxLjIuYmJ9ICgxMDAlKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2VfMy4zMS4wLmJiID0+IGNt
YWtlXzMuMzEuMi5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMxLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21h
a2UvY21ha2UtbmF0aXZlXzMuMzEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMxLjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfMy4zMS4yLmJi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwppbmRleCBkMzJlMjA4NGVmLi4wODBi
N2EzNTJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKQEAgLTIwLDcgKzIw
LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9W
RVJTSU9OfS9jbWFrZS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1DTWFr
ZURldGVybWluZUNvbXBpbGVyQUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZsLnBhdGNoIFwK
ICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzAwYjcxZGI2ZDY5ZGNjMWFi
N2M1YWFlNjFjYmMxYWEyNzc4YTNlMDBjYmQ5MThiYzcyMDIwM2UzMTE0NjhjMyIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI0MmFiYjNmNDhmMzdkYmQ3MzljZGZlYjE5ZDM3MTJkYjBjNTkzNWVkNWMy
YWVmNmMzNDBmOWFlOTExNDIzOGEyIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVDb21waWxlckFCSS1TdHJpcC1w
aXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9j
bWFrZS8wMDAxLUNNYWtlRGV0ZXJtaW5lQ29tcGlsZXJBQkktU3RyaXAtcGlwZS1mcm9tLWNvbXBp
bGUtZmwucGF0Y2gKaW5kZXggNTdkNWYwODE0OS4uYjQ4NzU2ODIxNyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVDb21waWxl
ckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVyQUJJLVN0cmlw
LXBpcGUtZnJvbS1jb21waWxlLWZsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyOTA0NmUx
MzA4YmVjNzJjYzIxYjBiMDBlOTc5OTA2ZjVhMWZiNjNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA2OTY0YzFhNWEzN2FlNGY2MTFlZTAyYTg5ZGI4YmYyMDBjMDU0ZWMxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGhpbGlwIExvcmVueiA8cGhpbGlwLmxvcmVuekBibXcu
ZGU+CiBEYXRlOiBNb24sIDMgSnVuIDIwMjQgMTM6MTk6MjQgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gQ01ha2VEZXRlcm1pbmVDb21waWxlckFCSTogU3RyaXAgLXBpcGUgZnJvbSBjb21waWxlIGZs
YWdzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1D
TWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQ
Mi5wYXRjaAppbmRleCA4N2VmYmQ5OTNkLi4xMWI3ZTgwYmEzIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVT
RV9OR0hUVFAyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8w
MDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDgwNjU1MzE4Njk2MDkxZDI3ZDEzMWU4YzRhNDgxNDBlMzdlNzMzNjYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNiMzExNTQzZDQ2NmI2OGIxODNlOGY4ZDNkMmM5ZjE4
ODQ3NTlhOGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNo
YW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyOCBEZWMgMjAyMiAxNzo1MToy
NyArMDgwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDogZGlzYWJsZSBVU0VfTkdI
VFRQMgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDUt
RGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDA1LURpc2FibGUtdXNlLW9m
LWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC0ucGF0Y2gKaW5kZXggOTA3MWQw
ZjU1OS4uY2RjZGQxYWU0ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlLzAwMDUtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWlu
dGVybmFsLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAw
NS1EaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwtLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyYjhmNmQ0YTVmZGRiNTIxMmNlMDdmMGM2MWY1YTNl
ZGJmNTE4N2Q0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2Y2M1YjRiYjZiMjk3MjU0
NmEzYjM1YjZiOGE5MTc3ZDBiYzFmMTcxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
T3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4KIERhdGU6IFRodSwgNSBK
dWwgMjAxOCAxMDoyODowNCAtMDMwMAogU3ViamVjdDogW1BBVENIXSBEaXNhYmxlIHVzZSBvZiBl
eHQyZnMvZXh0Ml9mcy5oIGJ5IGNtYWtlJ3MgaW50ZXJuYWwKQEAgLTE4LDcgKzE4LDcgQEAgU2ln
bmVkLW9mZi1ieTogT3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4KICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvVXRpbGl0aWVzL2NtbGliYXJjaGl2ZS9DTWFrZUxpc3RzLnR4dCBiL1V0aWxpdGllcy9j
bWxpYmFyY2hpdmUvQ01ha2VMaXN0cy50eHQKLWluZGV4IGZlZWFhM2I3Li5jMzAxZmIyNSAxMDA2
NDQKK2luZGV4IDRlNGI0OWMxLi41MGU5YTczMyAxMDA2NDQKIC0tLSBhL1V0aWxpdGllcy9jbWxp
YmFyY2hpdmUvQ01ha2VMaXN0cy50eHQKICsrKyBiL1V0aWxpdGllcy9jbWxpYmFyY2hpdmUvQ01h
a2VMaXN0cy50eHQKIEBAIC03NDUsMTIgKzc0NSw4IEBAIExBX0NIRUNLX0lOQ0xVREVfRklMRSgi
Y29weWZpbGUuaCIgSEFWRV9DT1BZRklMRV9IKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFr
ZS9jbWFrZV8zLjMxLjIuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjMxLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjMxLjIuYmIKLS0gCjIuNDQuMQoK

--===============1124671624227917031==--

