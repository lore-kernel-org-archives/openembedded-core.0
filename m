Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5C8C021A5
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.42711.1738416044240252461
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J15MOV43;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=KeZhMoZ3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010194c1abb562-b24398e1-f38f-4afd-809b-d0e1b3873a20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=k5wNUw6TygE/24TywwVdV3agYKZyYfYyK4BQxJ77kAI=;
	b=J15MOV43tDITa57ZeHpZ1/I3n2w2u8e54vlR7QHkIW1iOwI2AOmL5ALSZjjltiET
	1ZPEzKPsjnNjC8spSEE5lf2KksNaAp/OSanYCkphVZzgPaWxJ1M1PLiV/oLo5H9Nd5d
	tLDxnq5LvlReittXojKllBfhvLopp+zjU6llDGcE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=k5wNUw6TygE/24TywwVdV3agYKZyYfYyK4BQxJ77kAI=;
	b=KeZhMoZ3vm/4+RihCcdnrz84AbxMYsu+et7QF5yB63dKD+IT5vVg0icmuZIzjPcr
	tGnUT71Qcc2Klg5bYp5wG3ravsHUKPteBBnAyqZEGCmrhV+h/B0jt5m4RX9aeR+9FEO
	uovsE24Er8372fq5LYslWJyrytJsgbmrbgHeBnPo=
Content-Type: multipart/mixed; boundary="===============2381924693120318302=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 3.31.5,3.31.5 SUCCEEDED
Message-ID: <01010194c1abb562-b24398e1-f38f-4afd-809b-d0e1b3873a20-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210509

--===============2381924693120318302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *3.31.5,3.31.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-3.31.4-3.31.5-3.31.4-3.31.patch
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
From 5621ed80f345e35ecf72f508acaa6a56a7f05da0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 05:38:14 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 3.31.4 -> 3.31.5,3.31.4 -> 3.31.5

---
 .../cmake/{cmake-native_3.31.4.bb => cmake-native_3.31.5.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 ...1-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch   | 2 +-
 ...5-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 2 +-
 .../recipes-devtools/cmake/{cmake_3.31.4.bb => cmake_3.31.5.bb} | 0
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.4.bb => cmake-native_3.31.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.4.bb => cmake_3.31.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index f1410a2c4b..703b037f09 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "a6130bfe75f5ba5c73e672e34359f7c0a1931521957e8393a5c2922c8b0f7f25"
+SRC_URI[sha256sum] = "66fb53a145648be56b46fa9e8ccade3a4d0dfc92e401e52ce76bdad1fea43d27"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index cf00964a9c..60dc439c3c 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From 969b2d07ad955fdc117bf2ea30305a5b2e74ea76 Mon Sep 17 00:00:00 2001
+From 4651696a9bac909191d4b2aa8c3b606d716e63e6 Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index a01e3fe8c7..df77e54b72 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 8faeaefaf00f8d443511077b82624a8bd19cf725 Mon Sep 17 00:00:00 2001
+From fe238e7f4250fd7885e36ac63d346b21ee296d5d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 95ae9108aa..757b59a251 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From c0ca5859788189a81c53face2ab5eaeadc1236b4 Mon Sep 17 00:00:00 2001
+From 345e3176a12907fb1cf96913c95975554957b967 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.4.bb b/meta/recipes-devtools/cmake/cmake_3.31.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.4.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.5.bb
-- 
2.44.1


--===============2381924693120318302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cmake/cmake-bash-completion: PKGV changed from 3.31.4 [default] to 3.31.5 [default]
packages/core2-64-poky-linux/cmake/cmake-bash-completion: PV changed from "3.31.4" to "3.31.5"
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1104668624 to 1104679672 (+0%)
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGV changed from 3.31.4 [default] to 3.31.5 [default]
packages/core2-64-poky-linux/cmake/cmake-dbg: PV changed from "3.31.4" to "3.31.5"
packages/core2-64-poky-linux/cmake/cmake-dev: PKGV changed from 3.31.4 [default] to 3.31.5 [default]
packages/core2-64-poky-linux/cmake/cmake-dev: PV changed from "3.31.4" to "3.31.5"
packages/core2-64-poky-linux/cmake/cmake-doc: PKGV changed from 3.31.4 [default] to 3.31.5 [default]
packages/core2-64-poky-linux/cmake/cmake-doc: PV changed from "3.31.4" to "3.31.5"
packages/core2-64-poky-linux/cmake/cmake-locale: PKGV changed from 3.31.4 [default] to 3.31.5 [default]
packages/core2-64-poky-linux/cmake/cmake-locale: PV changed from "3.31.4" to "3.31.5"
packages/core2-64-poky-linux/cmake/cmake-src: PKGSIZE changed from 10299827 to 10300253 (+0%)
packages/core2-64-poky-linux/cmake/cmake-src: PKGV changed from 3.31.4 [default] to 3.31.5 [default]
packages/core2-64-poky-linux/cmake/cmake-src: PV changed from "3.31.4" to "3.31.5"
packages/core2-64-poky-linux/cmake/cmake-staticdev: PKGV changed from 3.31.4 [default] to 3.31.5 [default]
packages/core2-64-poky-linux/cmake/cmake-staticdev: PV changed from "3.31.4" to "3.31.5"
packages/core2-64-poky-linux/cmake/cmake: PKGSIZE changed from 43198977 to 43203338 (+0%)
packages/core2-64-poky-linux/cmake/cmake: PKGV changed from 3.31.4 [default] to 3.31.5 [default]
packages/core2-64-poky-linux/cmake/cmake: PV changed from "3.31.4" to "3.31.5"
packages/core2-64-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v3.31/cmake-3.31.4.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch" to "https://cmake.org/files/v3.31/cmake-3.31.5.tar.gz file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch"
packages/core2-64-poky-linux/cmake: PKGV changed from 3.31.4 [default] to 3.31.5 [default]
packages/core2-64-poky-linux/cmake: PV changed from "3.31.4" to "3.31.5"

--===============2381924693120318302==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-3.31.4-3.31.5-3.31.4-3.31.patch"

RnJvbSA1NjIxZWQ4MGYzNDVlMzVlY2Y3MmY1MDhhY2FhNmE1NmE3ZjA1ZGEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNTozODoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLGNtYWtlLW5hdGl2ZTogdXBncmFkZSAzLjMxLjQgLT4gMy4zMS41LDMuMzEuNCAtPiAzLjMx
LjUKCi0tLQogLi4uL2NtYWtlL3tjbWFrZS1uYXRpdmVfMy4zMS40LmJiID0+IGNtYWtlLW5hdGl2
ZV8zLjMxLjUuYmJ9ICAgIHwgMAogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmlu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uMS1DTWFrZURldGVybWluZUNv
bXBpbGVyQUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZsLnBhdGNoIHwgMiArLQogLi4uL2Nt
YWtlL2NtYWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCAg
IHwgMiArLQogLi4uNS1EaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMt
aW50ZXJuYWwtLnBhdGNoIHwgMiArLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtl
XzMuMzEuNC5iYiA9PiBjbWFrZV8zLjMxLjUuYmJ9IHwgMAogNiBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL3tjbWFrZS1uYXRpdmVfMy4zMS40LmJiID0+IGNtYWtlLW5hdGl2ZV8zLjMxLjUuYmJ9
ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2VfMy4zMS40
LmJiID0+IGNtYWtlXzMuMzEuNS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMxLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzMuMzEuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMx
LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVf
My4zMS41LmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2Uu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwppbmRleCBmMTQxMGEy
YzRiLi43MDNiMDM3ZjA5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uv
Y21ha2UuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKQEAg
LTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2NtYWtlLm9yZy9maWxlcy92JHtDTUFL
RV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVyQUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZs
LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTYxMzBiZmU3
NWY1YmE1YzczZTY3MmUzNDM1OWY3YzBhMTkzMTUyMTk1N2U4MzkzYTVjMjkyMmM4YjBmN2YyNSIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NmZiNTNhMTQ1NjQ4YmU1NmI0NmZhOWU4Y2NhZGUzYTRk
MGRmYzkyZTQwMWU1MmNlNzZiZGFkMWZlYTQzZDI3IgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJjbWFrZS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1pbmVDb21waWxlckFC
SS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlRGV0ZXJtaW5lQ29tcGlsZXJBQkktU3RyaXAtcGlwZS1m
cm9tLWNvbXBpbGUtZmwucGF0Y2gKaW5kZXggY2YwMDk2NGE5Yy4uNjBkYzQzOWMzYyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VEZXRlcm1p
bmVDb21waWxlckFCSS1TdHJpcC1waXBlLWZyb20tY29tcGlsZS1mbC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZURldGVybWluZUNvbXBpbGVy
QUJJLVN0cmlwLXBpcGUtZnJvbS1jb21waWxlLWZsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA5NjliMmQwN2FkOTU1ZmRjMTE3YmYyZWEzMDMwNWE1YjJlNzRlYTc2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA0NjUxNjk2YTliYWM5MDkxOTFkNGIyYWE4YzNiNjA2ZDcxNmU2M2U2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGhpbGlwIExvcmVueiA8cGhpbGlwLmxv
cmVuekBibXcuZGU+CiBEYXRlOiBNb24sIDMgSnVuIDIwMjQgMTM6MTk6MjQgKzAyMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gQ01ha2VEZXRlcm1pbmVDb21waWxlckFCSTogU3RyaXAgLXBpcGUgZnJvbSBj
b21waWxlIGZsYWdzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21h
a2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1V
U0VfTkdIVFRQMi5wYXRjaAppbmRleCBhMDFlM2ZlOGM3Li5kZjc3ZTU0YjcyIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1k
aXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFr
ZS9jbWFrZS8wMDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDhmYWVhZWZhZjAwZjhkNDQzNTExMDc3YjgyNjI0YThiZDE5Y2Y3
MjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZlMjM4ZTdmNDI1MGZkNzg4NWUzNmFj
NjNkMzQ2YjIxZWUyOTZkNWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGFuZ3Fp
bmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyOCBEZWMgMjAy
MiAxNzo1MToyNyArMDgwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDogZGlzYWJs
ZSBVU0VfTkdIVFRQMgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLzAwMDUtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVy
bmFsLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDA1LURpc2Fi
bGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC0ucGF0Y2gKaW5k
ZXggOTVhZTkxMDhhYS4uNzU3YjU5YTI1MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NtYWtlL2NtYWtlLzAwMDUtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1j
bWFrZS1zLWludGVybmFsLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uv
Y21ha2UvMDAwNS1EaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50
ZXJuYWwtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMGNhNTg1OTc4ODE4OWE4MWM1M2Zh
Y2UyYWI1ZWFlYWRjMTIzNmI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNDVlMzE3
NmExMjkwN2ZiMWNmOTY5MTNjOTU5NzU1NTQ5NTdiOTY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogT3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4KIERhdGU6
IFRodSwgNSBKdWwgMjAxOCAxMDoyODowNCAtMDMwMAogU3ViamVjdDogW1BBVENIXSBEaXNhYmxl
IHVzZSBvZiBleHQyZnMvZXh0Ml9mcy5oIGJ5IGNtYWtlJ3MgaW50ZXJuYWwKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjMxLjQuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMS41LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMS40LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMS41LmJiCi0tIAoy
LjQ0LjEKCg==

--===============2381924693120318302==--

