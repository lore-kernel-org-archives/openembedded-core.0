Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9542C36013
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.10353.1742048289606926095
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RYaBVzVR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kWh0x/fv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101959a2b5feb-f42975c4-e7b2-435a-b105-da1bf7215120-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cfe/7vAWJn5tCguuICVue1LsrL+M8dMU44n923vqHpo=;
	b=RYaBVzVRdF2UCOyQwsj9IEqHiNEUypHh8IbsD/l/gqJDJj0hCysHkJpalrQ6dhJF
	1/gXEs9ee84CyEYDZN9vegjkm4jVA6FsRx7/dXdh+hTcwfmGwt+gxlxbMTcv/xqWyzl
	EGa9RzGGPREazehPknakvRVsix8KMObfH1zh7SdQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cfe/7vAWJn5tCguuICVue1LsrL+M8dMU44n923vqHpo=;
	b=kWh0x/fvj72sUyY+nNs3S4chKYU85UqdKFUU1TdZe5QXnb//zK996JXWZ0TI92ks
	cUVHsLOI19P/jj4PTUCcKXfAUgihVc5qEKD4bPynYHPOyQ+nqxFRSXglac0YTeVVQqY
	FlLEhRUlQ3ONzu7gvR3BPbKmErNAcTtkM2Eo4p2U=
Content-Type: multipart/mixed; boundary="===============9205954839029023465=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake-native,cmake: upgrading to 3.31.6,3.31.6 SUCCEEDED
Message-ID: <010101959a2b5feb-f42975c4-e7b2-435a-b105-da1bf7215120-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212880

--===============9205954839029023465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *3.31.6,3.31.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-3.31.5-3.31.6-3.31.5-3.31.patch
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
From 201f9dd5db71e01351217991870797a197a94475 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 06:01:51 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 3.31.5 -> 3.31.6,3.31.5 -> 3.31.6

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
index 60dc439c3c..3895c7e03b 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From 4651696a9bac909191d4b2aa8c3b606d716e63e6 Mon Sep 17 00:00:00 2001
+From e4061151ac13bc727512d961a80faca3ceb22b5a Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index df77e54b72..ab78fa26ba 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From fe238e7f4250fd7885e36ac63d346b21ee296d5d Mon Sep 17 00:00:00 2001
+From 061253f390ada0661b30cf8856fa8d8d40a7355d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 757b59a251..7559c52932 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 345e3176a12907fb1cf96913c95975554957b967 Mon Sep 17 00:00:00 2001
+From 8effa783e47e2b574be90733c38b27701e06e929 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.5.bb b/meta/recipes-devtools/cmake/cmake_3.31.6.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.6.bb
-- 
2.44.1


--===============9205954839029023465==
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
packages/core2-64-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-3.31/Modules/Platform/Linker/Windows-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-AppleClang-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNU-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-LLD-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-Swift.cmake /usr/sha
 re/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNUgold-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-Swift.cmake"
packages/core2-64-poky-linux/cmake/cmake: PV changed from "3.31.5" to "3.31.6"
packages/core2-64-poky-linux/cmake/cmake: PKGV changed from 3.31.5 [default] to 3.31.6 [default]
packages/core2-64-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v3.31/cmake-3.31.5.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch" to "https://cmake.org/files/v3.31/cmake-3.31.6.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch"
packages/core2-64-poky-linux/cmake: PV changed from "3.31.5" to "3.31.6"
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

--===============9205954839029023465==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-3.31.5-3.31.6-3.31.5-3.31.patch"

RnJvbSAyMDFmOWRkNWRiNzFlMDEzNTEyMTc5OTE4NzA3OTdhMTk3YTk0NDc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDY6MDE6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZS1uYXRpdmUsY21ha2U6IHVwZ3JhZGUgMy4zMS41IC0+IDMuMzEuNiwzLjMxLjUgLT4gMy4z
MS42CgotLS0KIC4uLi9jbWFrZS97Y21ha2UtbmF0aXZlXzMuMzEuNS5iYiA9PiBjbWFrZS1uYXRp
dmVfMy4zMS42LmJifSAgICB8IDAKIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5p
bmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLjEtQ01ha2VEZXRlcm1pbmVD
b21waWxlckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaCB8IDIgKy0KIC4uLi9j
bWFrZS9jbWFrZS8wMDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2gg
ICB8IDIgKy0KIC4uLjUtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1z
LWludGVybmFsLS5wYXRjaCB8IDIgKy0KIC4uLi9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFr
ZV8zLjMxLjUuYmIgPT4gY21ha2VfMy4zMS42LmJifSB8IDAKIDYgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS97Y21ha2UtbmF0aXZlXzMuMzEuNS5iYiA9PiBjbWFrZS1uYXRpdmVfMy4zMS42LmJi
fSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMzEu
NS5iYiA9PiBjbWFrZV8zLjMxLjYuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfMy4zMS41LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMxLjYuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfMy4z
MS41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZl
XzMuMzEuNi5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5kZXggNzAzYjAz
N2YwOS4uYjNjYzEwYWUwMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCkBA
IC0yMCw3ICsyMCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9jbWFrZS5vcmcvZmlsZXMvdiR7Q01B
S0VfTUFKT1JfVkVSU0lPTn0vY21ha2UtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtQ01ha2VEZXRlcm1pbmVDb21waWxlckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1m
bC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY2ZmI1M2Ex
NDU2NDhiZTU2YjQ2ZmE5ZThjY2FkZTNhNGQwZGZjOTJlNDAxZTUyY2U3NmJkYWQxZmVhNDNkMjci
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjUzNDI3ZjBmNTAxNDc1MGFhZmZmMjI3MjdmYjJhYTYw
YzZjNzMyY2E5MTgwOGNmYjc4Y2UyMmRkZDllNTVmMCIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVgg
PSAiY21ha2UtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJtaW5lQ29tcGlsZXJB
QkktU3RyaXAtcGlwZS1mcm9tLWNvbXBpbGUtZmwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVyQUJJLVN0cmlwLXBpcGUt
ZnJvbS1jb21waWxlLWZsLnBhdGNoCmluZGV4IDYwZGM0MzljM2MuLjM4OTVjN2UwM2IgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJt
aW5lQ29tcGlsZXJBQkktU3RyaXAtcGlwZS1mcm9tLWNvbXBpbGUtZmwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVDb21waWxl
ckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNDY1MTY5NmE5YmFjOTA5MTkxZDRiMmFhOGMzYjYwNmQ3MTZlNjNlNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZTQwNjExNTFhYzEzYmM3Mjc1MTJkOTYxYTgwZmFjYTNjZWIyMmI1
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBoaWxpcCBMb3JlbnogPHBoaWxpcC5s
b3JlbnpAYm13LmRlPgogRGF0ZTogTW9uLCAzIEp1biAyMDI0IDEzOjE5OjI0ICswMjAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIENNYWtlRGV0ZXJtaW5lQ29tcGlsZXJBQkk6IFN0cmlwIC1waXBlIGZyb20g
Y29tcGlsZSBmbGFncwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUt
VVNFX05HSFRUUDIucGF0Y2gKaW5kZXggZGY3N2U1NGI3Mi4uYWI3OGZhMjZiYSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VMaXN0cy50eHQt
ZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21h
a2UvY21ha2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBmZTIzOGU3ZjQyNTBmZDc4ODVlMzZhYzYzZDM0NmIyMWVlMjk2
ZDVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNjEyNTNmMzkwYWRhMDY2MWIzMGNm
ODg1NmZhOGQ4ZDQwYTczNTVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdx
aW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjggRGVjIDIw
MjIgMTc6NTE6MjcgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gQ01ha2VMaXN0cy50eHQ6IGRpc2Fi
bGUgVVNFX05HSFRUUDIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9j
bWFrZS8wMDA1LURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRl
cm5hbC0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwNS1EaXNh
YmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwtLnBhdGNoCmlu
ZGV4IDc1N2I1OWEyNTEuLjc1NTljNTI5MzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZS8wMDA1LURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnkt
Y21ha2Utcy1pbnRlcm5hbC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlLzAwMDUtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWlu
dGVybmFsLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzQ1ZTMxNzZhMTI5MDdmYjFjZjk2
OTEzYzk1OTc1NTU0OTU3Yjk2NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOGVmZmE3
ODNlNDdlMmI1NzRiZTkwNzMzYzM4YjI3NzAxZTA2ZTkyOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IE90YXZpbyBTYWx2YWRvciA8b3RhdmlvQG9zc3lzdGVtcy5jb20uYnI+CiBEYXRl
OiBUaHUsIDUgSnVsIDIwMTggMTA6Mjg6MDQgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlzYWJs
ZSB1c2Ugb2YgZXh0MmZzL2V4dDJfZnMuaCBieSBjbWFrZSdzIGludGVybmFsCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMS41LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuNS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzMuMzEuNi5iYgotLSAK
Mi40NC4xCgo=

--===============9205954839029023465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/cmake/cmake: FILELIST: added "/usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-CXX.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsStore-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNU-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-LLD-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/WindowsPhone-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-Swift
 .cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-LLD-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-GNU-C.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Apple-AppleClang-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Windows-MSVC-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-GNUgold-Swift.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Haiku-ASM.cmake /usr/share/cmake-3.31/Modules/Platform/Linker/Linux-Swift.cmake"
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

--===============9205954839029023465==--

