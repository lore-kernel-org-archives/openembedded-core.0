Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFB2C282C6
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.7160.1740828314893885034
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PlgjI2L9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zehqeBfc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019551740990-2ced073b-d3fb-4127-8a9c-834b321375df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828314;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dIBKiuxKf81Oa8a6zUMNdKL+tKQ/Dnyr1pxZef2aLhw=;
	b=PlgjI2L96WpxS9coN6sUflcyn3x/fdwEgEQQslqyT579QdMAGAvDwmVFT4sP4c0Y
	B58RNSIfdglrh+dhAFRh7lgoqOdeVeXDUtzavf3dCPn9YKjKWhyQ2YusQ2wVMHzi1DL
	X0Glox4Mx8Xj/mdSDkqJUCFmtYg9FC5z3NmSDIeA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828314;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dIBKiuxKf81Oa8a6zUMNdKL+tKQ/Dnyr1pxZef2aLhw=;
	b=zehqeBfc3TKcjIRSj2kgBo2OqooXzhS91IrkkdE1tIEuX4Cc7RH4a7IWrB/1J8rP
	wu9fs6/OpJmlZivf4H13KS77aKzZJoxLjtpiLXo+xH0OV5QDmqGrluyM3Zjhj8tl0Qj
	UXIJtj8jTtggBc9CXEw6/Ud6fAKD+AlLpJHNI8a8=
Content-Type: multipart/mixed; boundary="===============9044009514878074228=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 3.31.6,3.31.6 SUCCEEDED
Message-ID: <0101019551740990-2ced073b-d3fb-4127-8a9c-834b321375df-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212096

--===============9044009514878074228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *3.31.6,3.31.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-3.31.5-3.31.6-3.31.5-3.31.patch
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
From f89a6f86b8f75f250a2d81f717746152cb01e8eb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 05:43:39 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 3.31.5 -> 3.31.6,3.31.5 -> 3.31.6

---
 .../cmake/{cmake-native_3.31.5.bb => cmake-native_3.31.6.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 ...1-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch   | 2 +-
 ...5-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 2 +-
 .../recipes-devtools/cmake/{cmake_3.31.5.bb => cmake_3.31.6.bb} | 0
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.5.bb => cmake-native_3.31.6.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.5.bb => cmake_3.31.6.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 703b037f09..b3cc10ae02 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "66fb53a145648be56b46fa9e8ccade3a4d0dfc92e401e52ce76bdad1fea43d27"
+SRC_URI[sha256sum] = "653427f0f5014750aafff22727fb2aa60c6c732ca91808cfb78ce22ddd9e55f0"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index 60dc439c3c..05978e7928 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From 4651696a9bac909191d4b2aa8c3b606d716e63e6 Mon Sep 17 00:00:00 2001
+From 8fbb45368b1eba10d67b5eaf6b4312616e61f4e2 Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index df77e54b72..4eb3dfd32f 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From fe238e7f4250fd7885e36ac63d346b21ee296d5d Mon Sep 17 00:00:00 2001
+From b21de10dbf1a5eff82c2c59fa5f375e4faf311bd Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 757b59a251..27ec6fe44f 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 345e3176a12907fb1cf96913c95975554957b967 Mon Sep 17 00:00:00 2001
+From 09b49833229fbac85511e08ac28c90e92f74dc7f Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.5.bb b/meta/recipes-devtools/cmake/cmake_3.31.6.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.6.bb
-- 
2.44.1


--===============9044009514878074228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cmake/cmake-bash-completion: PV changed from "3.31.5" to "3.31.6"
packages/core2-64-poky-linux/cmake/cmake-bash-completion: PKGV changed from 3.31.5 [default] to 3.31.6 [default]
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1110450920 to 1110559368 (+0%)
packages/core2-64-poky-linux/cmake/cmake-dbg: PV changed from "3.31.5" to "3.31.6"
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGV changed from 3.31.5 [default] to 3.31.6 [default]
packages/core2-64-poky-linux/cmake/cmake-dev: PV changed from "3.31.5" to "3.31.6"
packages/core2-64-poky-linux/cmake/cmake-dev: PKGV changed from 3.31.5 [default] to 3.31.6 [default]
packages/core2-64-poky-linux/cmake/cmake-doc: PV changed from "3.31.5" to "3.31.6"
packages/core2-64-poky-linux/cmake/cmake-doc: PKGV changed from 3.31.5 [default] to 3.31.6 [default]
packages/core2-64-poky-linux/cmake/cmake-locale: PV changed from "3.31.5" to "3.31.6"
packages/core2-64-poky-linux/cmake/cmake-locale: PKGV changed from 3.31.5 [default] to 3.31.6 [default]
packages/core2-64-poky-linux/cmake/cmake-src: PKGSIZE changed from 10300253 to 10299822 (-0%)
packages/core2-64-poky-linux/cmake/cmake-src: PV changed from "3.31.5" to "3.31.6"
packages/core2-64-poky-linux/cmake/cmake-src: PKGV changed from 3.31.5 [default] to 3.31.6 [default]
packages/core2-64-poky-linux/cmake/cmake-staticdev: PV changed from "3.31.5" to "3.31.6"
packages/core2-64-poky-linux/cmake/cmake-staticdev: PKGV changed from 3.31.5 [default] to 3.31.6 [default]
packages/core2-64-poky-linux/cmake/cmake: PKGSIZE changed from 43227914 to 43236383 (+0%)
packages/core2-64-poky-linux/cmake/cmake: PV changed from "3.31.5" to "3.31.6"
packages/core2-64-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNU-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-LLD-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNUgold-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-CXX.cm
 ake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-AppleClang-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-Swift.cmake"
packages/core2-64-poky-linux/cmake/cmake: PKGV changed from 3.31.5 [default] to 3.31.6 [default]
packages/core2-64-poky-linux/cmake: PV changed from "3.31.5" to "3.31.6"
packages/core2-64-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v3.31/cmake-3.31.5.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch" to "https://cmake.org/files/v3.31/cmake-3.31.6.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch"
packages/core2-64-poky-linux/cmake: PKGV changed from 3.31.5 [default] to 3.31.6 [default]
Changes to packages/core2-64-poky-linux/cmake (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-AppleClang-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNUgold-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNU-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-LLD-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-Swift.cmake was added
Changes to packages/x86_64-linux/cmake-native (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-AppleClang-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNUgold-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNU-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-LLD-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-Swift.cmake was added

--===============9044009514878074228==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-3.31.5-3.31.6-3.31.5-3.31.patch"

RnJvbSBmODlhNmY4NmI4Zjc1ZjI1MGEyZDgxZjcxNzc0NjE1MmNiMDFlOGViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNTo0MzozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLGNtYWtlLW5hdGl2ZTogdXBncmFkZSAzLjMxLjUgLT4gMy4zMS42LDMuMzEuNSAtPiAzLjMx
LjYKCi0tLQogLi4uL2NtYWtlL3tjbWFrZS1uYXRpdmVfMy4zMS41LmJiID0+IGNtYWtlLW5hdGl2
ZV8zLjMxLjYuYmJ9ICAgIHwgMAogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmlu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uMS1DTWFrZURldGVybWluZUNv
bXBpbGVyQUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZsLnBhdGNoIHwgMiArLQogLi4uL2Nt
YWtlL2NtYWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCAg
IHwgMiArLQogLi4uNS1EaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMt
aW50ZXJuYWwtLnBhdGNoIHwgMiArLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtl
XzMuMzEuNS5iYiA9PiBjbWFrZV8zLjMxLjYuYmJ9IHwgMAogNiBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL3tjbWFrZS1uYXRpdmVfMy4zMS41LmJiID0+IGNtYWtlLW5hdGl2ZV8zLjMxLjYuYmJ9
ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2VfMy4zMS41
LmJiID0+IGNtYWtlXzMuMzEuNi5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMxLjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzMuMzEuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMx
LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVf
My4zMS42LmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2Uu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwppbmRleCA3MDNiMDM3
ZjA5Li5iM2NjMTBhZTAyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uv
Y21ha2UuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKQEAg
LTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2NtYWtlLm9yZy9maWxlcy92JHtDTUFL
RV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVyQUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZs
LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjZmYjUzYTE0
NTY0OGJlNTZiNDZmYTllOGNjYWRlM2E0ZDBkZmM5MmU0MDFlNTJjZTc2YmRhZDFmZWE0M2QyNyIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NTM0MjdmMGY1MDE0NzUwYWFmZmYyMjcyN2ZiMmFhNjBj
NmM3MzJjYTkxODA4Y2ZiNzhjZTIyZGRkOWU1NWYwIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJjbWFrZS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVDb21waWxlckFC
SS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJtaW5lQ29tcGlsZXJBQkktU3RyaXAtcGlwZS1m
cm9tLWNvbXBpbGUtZmwucGF0Y2gKaW5kZXggNjBkYzQzOWMzYy4uMDU5NzhlNzkyOCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1p
bmVDb21waWxlckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVy
QUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA0NjUxNjk2YTliYWM5MDkxOTFkNGIyYWE4YzNiNjA2ZDcxNmU2M2U2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA4ZmJiNDUzNjhiMWViYTEwZDY3YjVlYWY2YjQzMTI2MTZlNjFmNGUy
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGhpbGlwIExvcmVueiA8cGhpbGlwLmxv
cmVuekBibXcuZGU+CiBEYXRlOiBNb24sIDMgSnVuIDIwMjQgMTM6MTk6MjQgKzAyMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gQ01ha2VEZXRlcm1pbmVDb21waWxlckFCSTogU3RyaXAgLXBpcGUgZnJvbSBj
b21waWxlIGZsYWdzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21h
a2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1V
U0VfTkdIVFRQMi5wYXRjaAppbmRleCBkZjc3ZTU0YjcyLi40ZWIzZGZkMzJmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1k
aXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFr
ZS9jbWFrZS8wMDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGZlMjM4ZTdmNDI1MGZkNzg4NWUzNmFjNjNkMzQ2YjIxZWUyOTZk
NWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGIyMWRlMTBkYmYxYTVlZmY4MmMyYzU5
ZmE1ZjM3NWU0ZmFmMzExYmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGFuZ3Fp
bmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyOCBEZWMgMjAy
MiAxNzo1MToyNyArMDgwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDogZGlzYWJs
ZSBVU0VfTkdIVFRQMgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLzAwMDUtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVy
bmFsLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDA1LURpc2Fi
bGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC0ucGF0Y2gKaW5k
ZXggNzU3YjU5YTI1MS4uMjdlYzZmZTQ0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NtYWtlL2NtYWtlLzAwMDUtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1j
bWFrZS1zLWludGVybmFsLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uv
Y21ha2UvMDAwNS1EaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50
ZXJuYWwtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzNDVlMzE3NmExMjkwN2ZiMWNmOTY5
MTNjOTU5NzU1NTQ5NTdiOTY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwOWI0OTgz
MzIyOWZiYWM4NTUxMWUwOGFjMjhjOTBlOTJmNzRkYzdmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogT3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4KIERhdGU6
IFRodSwgNSBKdWwgMjAxOCAxMDoyODowNCAtMDMwMAogU3ViamVjdDogW1BBVENIXSBEaXNhYmxl
IHVzZSBvZiBleHQyZnMvZXh0Ml9mcy5oIGJ5IGNtYWtlJ3MgaW50ZXJuYWwKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjMxLjUuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMS42LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMS41LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMS42LmJiCi0tIAoy
LjQ0LjEKCg==

--===============9044009514878074228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNU-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-LLD-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-AppleClang-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-Swift
 .cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNUgold-Swift.cmake"
Changes to packages/core2-64-poky-linux/cmake (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-AppleClang-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNUgold-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNU-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-LLD-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-Swift.cmake was added
Changes to packages/x86_64-linux/cmake-native (sysroot):
  /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-AppleClang-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-ASM.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-C.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-CXX.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNUgold-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNU-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-LLD-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-Swift.cmake was added
  /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-Swift.cmake was added

--===============9044009514878074228==--

