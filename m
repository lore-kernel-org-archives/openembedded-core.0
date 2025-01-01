Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CAFE7719E
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11487.1735723937668325027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cq4ELcPo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oPnw8byI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019421356b04-291ab081-3d5a-4ba8-ab14-21dbfcf0d2a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723937;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LVQILCZvXehyo9TPPJCLIqNDGTjGdnbWIvzZpsT707M=;
	b=cq4ELcPojaiu/z1ww5cvgHBtYr1HGsmWxgyUwLBHMPq2d6hJmK5vvHcDKvC5JTGr
	r5j9iY8s0dyrv6EnIt8An38GRqfjQcgt2L10f09+/E7OwOQ84lyFTTd6OnpxSBh7pgv
	68OmQRYI6TkKMlMPzYjx0imfjJbcmSybxvNJ5brY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723937;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LVQILCZvXehyo9TPPJCLIqNDGTjGdnbWIvzZpsT707M=;
	b=oPnw8byI3SB+vaBuAjb2eKh1TXKjAzGz8hqotedEQzOBBZQVlz422hIZ3P3zc8ji
	oHALq1hSY/pYSfn7QP/sOuPd+2+AwzTqGVusRrzppeceFu7LAfljVAN0EOyZQejKO2g
	YIEpcQnTq59xb3BE2qwSXwWno9VMkJZeIDzOIyN0=
Content-Type: multipart/mixed; boundary="===============6297417316729788908=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake-native,cmake: upgrading to 3.31.3,3.31.3 SUCCEEDED
Message-ID: <0101019421356b04-291ab081-3d5a-4ba8-ab14-21dbfcf0d2a7-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209196

--===============6297417316729788908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *3.31.3,3.31.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-3.31.0-3.31.3-3.31.0-3.31.patch
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
From 1639c32dae515cb7f382b0b9a2e29767cf7c68b1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 05:50:07 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 3.31.0 -> 3.31.3,3.31.0 -> 3.31.3

---
 .../cmake/{cmake-native_3.31.0.bb => cmake-native_3.31.3.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 2 +-
 ...CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch | 2 +-
 ...Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 4 ++--
 .../cmake/{cmake_3.31.0.bb => cmake_3.31.3.bb}                | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.0.bb => cmake-native_3.31.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.0.bb => cmake_3.31.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d32e2084ef..14cd9ffc5e 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "300b71db6d69dcc1ab7c5aae61cbc1aa2778a3e00cbd918bc720203e311468c3"
+SRC_URI[sha256sum] = "fac45bc6d410b49b3113ab866074888d6c9e9dc81a141874446eb239ac38cb87"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index 57d5f08149..68c1020a42 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From 29046e1308bec72cc21b0b00e979906f5a1fb63f Mon Sep 17 00:00:00 2001
+From d6e3cb98ffa81c6234ad5a563354ef5f442e1bb3 Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 87efbd993d..fe3bf33c60 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 80655318696091d27d131e8c4a48140e37e73366 Mon Sep 17 00:00:00 2001
+From 3f9b36a52f12e8f8860cf4337acc9a9514a2095b Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 9071d0f559..ea4c76f99f 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 2b8f6d4a5fddb5212ce07f0c61f5a3edbf5187d4 Mon Sep 17 00:00:00 2001
+From 7a4c1ed7b4dd038ef99c4a82e1d27743b2801757 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.0.bb b/meta/recipes-devtools/cmake/cmake_3.31.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.0.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.3.bb
-- 
2.44.1


--===============6297417316729788908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cmake/cmake-bash-completion: PKGV changed from 3.31.0 [default] to 3.31.3 [default]
packages/core2-64-poky-linux/cmake/cmake-bash-completion: PV changed from "3.31.0" to "3.31.3"
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1104562944 to 1104749440 (+0%)
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGV changed from 3.31.0 [default] to 3.31.3 [default]
packages/core2-64-poky-linux/cmake/cmake-dbg: PV changed from "3.31.0" to "3.31.3"
packages/core2-64-poky-linux/cmake/cmake-dev: PKGV changed from 3.31.0 [default] to 3.31.3 [default]
packages/core2-64-poky-linux/cmake/cmake-dev: PV changed from "3.31.0" to "3.31.3"
packages/core2-64-poky-linux/cmake/cmake-doc: PKGV changed from 3.31.0 [default] to 3.31.3 [default]
packages/core2-64-poky-linux/cmake/cmake-doc: PV changed from "3.31.0" to "3.31.3"
packages/core2-64-poky-linux/cmake/cmake-locale: PKGV changed from 3.31.0 [default] to 3.31.3 [default]
packages/core2-64-poky-linux/cmake/cmake-locale: PV changed from "3.31.0" to "3.31.3"
packages/core2-64-poky-linux/cmake/cmake-src: PKGSIZE changed from 10297839 to 10301438 (+0%)
packages/core2-64-poky-linux/cmake/cmake-src: PKGV changed from 3.31.0 [default] to 3.31.3 [default]
packages/core2-64-poky-linux/cmake/cmake-src: PV changed from "3.31.0" to "3.31.3"
packages/core2-64-poky-linux/cmake/cmake-staticdev: PKGV changed from 3.31.0 [default] to 3.31.3 [default]
packages/core2-64-poky-linux/cmake/cmake-staticdev: PV changed from "3.31.0" to "3.31.3"
packages/core2-64-poky-linux/cmake/cmake: PKGSIZE changed from 43177650 to 43202449 (+0%)
packages/core2-64-poky-linux/cmake/cmake: PKGV changed from 3.31.0 [default] to 3.31.3 [default]
packages/core2-64-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake /usr/share/cmake-3.31/Mod
 ules/Platform/Linker/Android-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmake /
 usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake"
packages/core2-64-poky-linux/cmake/cmake: PV changed from "3.31.0" to "3.31.3"
packages/core2-64-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v3.31/cmake-3.31.0.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch" to "https://cmake.org/files/v3.31/cmake-3.31.3.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch"
packages/core2-64-poky-linux/cmake: PKGV changed from 3.31.0 [default] to 3.31.3 [default]
packages/core2-64-poky-linux/cmake: PV changed from "3.31.0" to "3.31.3"
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

--===============6297417316729788908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-C.cmak
 e /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsCE-MSVC-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-MSVC-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsKernelModeDriver-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-ASM.cmake /us
 r/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Android-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-C.cmake"
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

--===============6297417316729788908==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-3.31.0-3.31.3-3.31.0-3.31.patch"

RnJvbSAxNjM5YzMyZGFlNTE1Y2I3ZjM4MmIwYjlhMmUyOTc2N2NmN2M2OGIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNTo1MDowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLW5hdGl2ZSxjbWFrZTogdXBncmFkZSAzLjMxLjAgLT4gMy4zMS4zLDMuMzEuMCAtPiAzLjMx
LjMKCi0tLQogLi4uL2NtYWtlL3tjbWFrZS1uYXRpdmVfMy4zMS4wLmJiID0+IGNtYWtlLW5hdGl2
ZV8zLjMxLjMuYmJ9ICB8IDAKIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi5DTWFrZURldGVybWluZUNvbXBpbGVy
QUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZsLnBhdGNoIHwgMiArLQogLi4uL2NtYWtlL2Nt
YWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCB8IDIgKy0K
IC4uLkRpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC0u
cGF0Y2ggfCA0ICsrLS0KIC4uLi9jbWFrZS97Y21ha2VfMy4zMS4wLmJiID0+IGNtYWtlXzMuMzEu
My5iYn0gICAgICAgICAgICAgICAgfCAwCiA2IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2Nt
YWtlLW5hdGl2ZV8zLjMxLjAuYmIgPT4gY21ha2UtbmF0aXZlXzMuMzEuMy5iYn0gKDEwMCUpCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjMxLjAuYmIgPT4gY21h
a2VfMy4zMS4zLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2UtbmF0aXZlXzMuMzEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFr
ZS9jbWFrZS1uYXRpdmVfMy4zMS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzMuMzEuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMxLjMuYmIK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmluZGV4IGQzMmUyMDg0ZWYuLjE0Y2Q5
ZmZjNWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwpAQCAtMjAsNyArMjAs
NyBAQCBTUkNfVVJJID0gImh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZF
UlNJT059L2NtYWtlLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUNNYWtl
RGV0ZXJtaW5lQ29tcGlsZXJBQkktU3RyaXAtcGlwZS1mcm9tLWNvbXBpbGUtZmwucGF0Y2ggXAog
ICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMDBiNzFkYjZkNjlkY2MxYWI3
YzVhYWU2MWNiYzFhYTI3NzhhM2UwMGNiZDkxOGJjNzIwMjAzZTMxMTQ2OGMzIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImZhYzQ1YmM2ZDQxMGI0OWIzMTEzYWI4NjYwNzQ4ODhkNmM5ZTlkYzgxYTE0
MTg3NDQ0NmViMjM5YWMzOGNiODciCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImNtYWtlLSg/
UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVyQUJJLVN0cmlwLXBp
cGUtZnJvbS1jb21waWxlLWZsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVDb21waWxlckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGls
ZS1mbC5wYXRjaAppbmRleCA1N2Q1ZjA4MTQ5Li42OGMxMDIwYTQyIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVy
QUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJtaW5lQ29tcGlsZXJBQkktU3RyaXAt
cGlwZS1mcm9tLWNvbXBpbGUtZmwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI5MDQ2ZTEz
MDhiZWM3MmNjMjFiMGIwMGU5Nzk5MDZmNWExZmI2M2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGQ2ZTNjYjk4ZmZhODFjNjIzNGFkNWE1NjMzNTRlZjVmNDQyZTFiYjMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBQaGlsaXAgTG9yZW56IDxwaGlsaXAubG9yZW56QGJtdy5k
ZT4KIERhdGU6IE1vbiwgMyBKdW4gMjAyNCAxMzoxOToyNCArMDIwMAogU3ViamVjdDogW1BBVENI
XSBDTWFrZURldGVybWluZUNvbXBpbGVyQUJJOiBTdHJpcCAtcGlwZSBmcm9tIGNvbXBpbGUgZmxh
Z3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNN
YWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAy
LnBhdGNoCmluZGV4IDg3ZWZiZDk5M2QuLmZlM2JmMzNjNjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNF
X05HSFRUUDIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAw
MDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gODA2NTUzMTg2OTYwOTFkMjdkMTMxZThjNGE0ODE0MGUzN2U3MzM2NiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2Y5YjM2YTUyZjEyZThmODg2MGNmNDMzN2FjYzlhOTUx
NGEyMDk1YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoYW5ncWluZyBMaSA8Y2hh
bmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDI4IERlYyAyMDIyIDE3OjUxOjI3
ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBkaXNhYmxlIFVTRV9OR0hU
VFAyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwNS1E
aXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwtLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDUtRGlzYWJsZS11c2Utb2Yt
ZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLS5wYXRjaAppbmRleCA5MDcxZDBm
NTU5Li5lYTRjNzZmOTlmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uv
Y21ha2UvMDAwNS1EaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50
ZXJuYWwtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDA1
LURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC0ucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJiOGY2ZDRhNWZkZGI1MjEyY2UwN2YwYzYxZjVhM2Vk
YmY1MTg3ZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdhNGMxZWQ3YjRkZDAzOGVm
OTljNGE4MmUxZDI3NzQzYjI4MDE3NTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBP
dGF2aW8gU2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPgogRGF0ZTogVGh1LCA1IEp1
bCAyMDE4IDEwOjI4OjA0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgdXNlIG9mIGV4
dDJmcy9leHQyX2ZzLmggYnkgY21ha2UncyBpbnRlcm5hbApAQCAtMTgsNyArMTgsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBPdGF2aW8gU2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPgogIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1n
aXQgYS9VdGlsaXRpZXMvY21saWJhcmNoaXZlL0NNYWtlTGlzdHMudHh0IGIvVXRpbGl0aWVzL2Nt
bGliYXJjaGl2ZS9DTWFrZUxpc3RzLnR4dAotaW5kZXggZmVlYWEzYjcuLmMzMDFmYjI1IDEwMDY0
NAoraW5kZXggNGU0YjQ5YzEuLjUwZTlhNzMzIDEwMDY0NAogLS0tIGEvVXRpbGl0aWVzL2NtbGli
YXJjaGl2ZS9DTWFrZUxpc3RzLnR4dAogKysrIGIvVXRpbGl0aWVzL2NtbGliYXJjaGl2ZS9DTWFr
ZUxpc3RzLnR4dAogQEAgLTc0NSwxMiArNzQ1LDggQEAgTEFfQ0hFQ0tfSU5DTFVERV9GSUxFKCJj
b3B5ZmlsZS5oIiBIQVZFX0NPUFlGSUxFX0gpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2VfMy4zMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlXzMuMzEuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuMy5iYgotLSAKMi40NC4xCgo=

--===============6297417316729788908==--

