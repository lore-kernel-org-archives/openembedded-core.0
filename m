Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780C4E63C88
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:45 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29186.1769951564187220259
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mozvTT2P;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F+9k8rYT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019c19558e99-be4fbafe-a4b2-401d-87d5-e4a51e0e0d2a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B0g6Wxzldu7NJdr0ErbT90CXv+wGxE6f/oHFiywTIAg=;
	b=mozvTT2Pg9LpR1EUjhu9/yr9oVJRqvd/ZquZZCX4CtFcgb+6z7o8ljFTf/rsHJjc
	CFzNJSZyu5/Oj/JFj7EfbVwZMLpIphDE1BlukHR4UdJnudICPQVqxKvOW76Jrf6uHtk
	uXP3Bj3OU1PpoXc5/oAXGvPD/HN+/2t5n83aJpOA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B0g6Wxzldu7NJdr0ErbT90CXv+wGxE6f/oHFiywTIAg=;
	b=F+9k8rYTFRhjyz5ckNtUOjCTXm99OmVEYBSIYrhZTJEFmxI4P98Q9sKVm8bi7VK1
	WCslYMDmGvbQr5MNS86AEFTZws6NAyKkowzATdiL9dxtOrRN7nZbIFnpCBILytZSLKF
	Xuyw0nLtFbRrpGtaEIDTlbkL0OEWDs8/fjRIlkUo=
Content-Type: multipart/mixed; boundary="===============6146317567301438351=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 4.2.3,4.2.3 SUCCEEDED
Message-ID: <0101019c19558e99-be4fbafe-a4b2-401d-87d5-e4a51e0e0d2a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230262

--===============6146317567301438351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *4.2.3,4.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-4.2.2-4.2.3-4.2.2-4.2.3.patch
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
From f841f6da7b0da7f201df07a8c30ffd16e3a3ff49 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 05:47:50 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 4.2.2 -> 4.2.3,4.2.2 -> 4.2.3

---
 .../cmake/{cmake-native_4.2.2.bb => cmake-native_4.2.3.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 ...01-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch | 2 +-
 .../cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch   | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.2.2.bb => cmake_4.2.3.bb}  | 0
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.2.2.bb => cmake-native_4.2.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.2.2.bb => cmake_4.2.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.2.bb b/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.2.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ee771a1d64..5b8c1922b1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "bbda94dd31636e89eb1cc18f8355f6b01d9193d7676549fba282057e8b730f58"
+SRC_URI[sha256sum] = "7efaccde8c5a6b2968bad6ce0fe60e19b6e10701a12fce948c2bf79bac8a11e9"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
index 0d2de28d5b..7a717f72d8 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
@@ -1,4 +1,4 @@
-From 3d87f9fd1071e548cf9a6718c4ade0bfde812c30 Mon Sep 17 00:00:00 2001
+From d3859840c134012b18e3bca7e4bab60c9bc8efd5 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
index f6b6cfcf41..c03e5e2364 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From d4696e9d78d09366c13ba738e01f833f234b160a Mon Sep 17 00:00:00 2001
+From 811ad63aeff08fb6308203989f6cc664d00a2fa9 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake_4.2.2.bb b/meta/recipes-devtools/cmake/cmake_4.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.2.2.bb
rename to meta/recipes-devtools/cmake/cmake_4.2.3.bb
-- 
2.47.1


--===============6146317567301438351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.2.2 [default] to 4.2.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.2.2" to "4.2.3"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.2.2 [default] to 4.2.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.2.2" to "4.2.3"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1209745960 to 1209745864 (-0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.2.2 [default] to 4.2.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.2.2" to "4.2.3"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.2.2 [default] to 4.2.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.2.2" to "4.2.3"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.2.2 [default] to 4.2.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.2.2" to "4.2.3"
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.2.2 [default] to 4.2.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: FILELIST: directory renamed /usr/src/debug/cmake/4.2.2/Source -> /usr/src/debug/cmake/4.2.3/Source, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/std/cm -> /usr/src/debug/cmake/4.2.3/Utilities/std/cm, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/cmlibuv/include -> /usr/src/debug/cmake/4.2.3/Utilities/cmlibuv/include, directory renamed /usr/src/debug/cmake/4.2.2/Source/CPack -> /usr/src/debug/cmake/4.2.3/Source/CPack, directory renamed /usr/src/debug/cmake/4.2.2/Source/CPack/IFW -> /usr/src/debug/cmake/4.2.3/Source/CPack/IFW, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/cmlibuv/src -> /usr/src/debug/cmake/4.2.3/Utilities/cmlibuv/src, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/cmlibrhash/librhash -> /usr/src/debug/cmake/4.2.3/Utilities/cmlibrhash/librhash, directory renamed /usr/src/debug/cmake/4.2.2/Source/kwsys -> /usr/src/debug/cmake/4.2.3/Source/kwsys, directory renamed /usr/src/debug/cmake/4.2.
 2/Utilities/cmelf -> /usr/src/debug/cmake/4.2.3/Utilities/cmelf, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/std/cmext -> /usr/src/debug/cmake/4.2.3/Utilities/std/cmext, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/cmjsoncpp/src/lib_json -> /usr/src/debug/cmake/4.2.3/Utilities/cmjsoncpp/src/lib_json, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/cmjsoncpp/include/json -> /usr/src/debug/cmake/4.2.3/Utilities/cmjsoncpp/include/json, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/cmlibuv/include/uv -> /usr/src/debug/cmake/4.2.3/Utilities/cmlibuv/include/uv, directory renamed /usr/src/debug/cmake/4.2.2/Source/cmsys -> /usr/src/debug/cmake/4.2.3/Source/cmsys, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/std/cm/bits -> /usr/src/debug/cmake/4.2.3/Utilities/std/cm/bits, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/cmlibarchive/libarchive -> /usr/src/debug/cmake/4.2.3/Utilities/cmlibarchive/libarchive, directory renamed /usr/src/debug
 /cmake/4.2.2/Source/LexerParser -> /usr/src/debug/cmake/4.2.3/Source/LexerParser, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/cmlibuv/src/unix -> /usr/src/debug/cmake/4.2.3/Utilities/cmlibuv/src/unix, directory renamed /usr/src/debug/cmake/4.2.2/Utilities/cmllpkgc -> /usr/src/debug/cmake/4.2.3/Utilities/cmllpkgc, directory renamed /usr/src/debug/cmake/4.2.2/Source/CTest -> /usr/src/debug/cmake/4.2.3/Source/CTest
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.2.2" to "4.2.3"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.2.2 [default] to 4.2.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.2.2" to "4.2.3"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.2.2 [default] to 4.2.3 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.2.2" to "4.2.3"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 47726791 to 47727345 (+0%)
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.2.2 [default] to 4.2.3 [default]
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.2.2" to "4.2.3"
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.2/cmake-4.2.2.tar.gz" to "https://cmake.org/files/v4.2/cmake-4.2.3.tar.gz"

--===============6146317567301438351==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-4.2.2-4.2.3-4.2.2-4.2.3.patch"

RnJvbSBmODQxZjZkYTdiMGRhN2YyMDFkZjA3YThjMzBmZmQxNmUzYTNmZjQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwNTo0Nzo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLGNtYWtlLW5hdGl2ZTogdXBncmFkZSA0LjIuMiAtPiA0LjIuMyw0LjIuMiAtPiA0LjIuMwoK
LS0tCiAuLi4vY21ha2Uve2NtYWtlLW5hdGl2ZV80LjIuMi5iYiA9PiBjbWFrZS1uYXRpdmVfNC4y
LjMuYmJ9ICAgICAgfCAwCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4wMS1EaXNhYmxlLXVzZS1vZi1leHQy
ZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwucGF0Y2ggfCAyICstCiAuLi4vY21ha2Uv
Y21ha2UvMDAwMi1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoICAgfCAy
ICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzQuMi4yLmJiID0+IGNtYWtl
XzQuMi4zLmJifSAgfCAwCiA1IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlLW5hdGl2
ZV80LjIuMi5iYiA9PiBjbWFrZS1uYXRpdmVfNC4yLjMuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2VfNC4yLjIuYmIgPT4gY21ha2VfNC4yLjMuYmJ9
ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1u
YXRpdmVfNC4yLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZl
XzQuMi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuMi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuMi4zLmJiCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLmluYwppbmRleCBlZTc3MWExZDY0Li41YjhjMTkyMmIxIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKQEAgLTE5LDcgKzE5LDcgQEAgQ01BS0VfTUFKT1Jf
VkVSU0lPTiA9ICIke0AnLicuam9pbihkLmdldFZhcignUFYnKS5zcGxpdCgnLicpWzA6Ml0pfSIK
IFNSQ19VUkkgPSAiaHR0cHM6Ly9jbWFrZS5vcmcvZmlsZXMvdiR7Q01BS0VfTUFKT1JfVkVSU0lP
Tn0vY21ha2UtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYmJkYTk0ZGQzMTYzNmU4OWViMWNjMThmODM1NWY2YjAxZDkxOTNkNzY3NjU0OWZiYTI4
MjA1N2U4YjczMGY1OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZWZhY2NkZThjNWE2YjI5Njhi
YWQ2Y2UwZmU2MGUxOWI2ZTEwNzAxYTEyZmNlOTQ4YzJiZjc5YmFjOGExMWU5IgogCiBVUFNUUkVB
TV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtRGlzYWJsZS11
c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4
dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLnBhdGNoCmluZGV4IDBkMmRlMjhkNWIuLjdhNzE3
ZjcyZDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAx
LURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1EaXNhYmxlLXVz
ZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDNkODdmOWZkMTA3MWU1NDhjZjlhNjcxOGM0YWRlMGJmZGU4MTJjMzAgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQzODU5ODQwYzEzNDAxMmIxOGUzYmNhN2U0YmFi
NjBjOWJjOGVmZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBPdGF2aW8gU2FsdmFk
b3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPgogRGF0ZTogVGh1LCA1IEp1bCAyMDE4IDEwOjI4
OjA0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgdXNlIG9mIGV4dDJmcy9leHQyX2Zz
LmggYnkgY21ha2UncyBpbnRlcm5hbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLzAwMDItQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAyLUNNYWtlTGlzdHMudHh0
LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2gKaW5kZXggZjZiNmNmY2Y0MS4uYzAzZTVlMjM2NCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDItQ01ha2VM
aXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2UvMDAwMi1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAy
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNDY5NmU5ZDc4ZDA5MzY2YzEzYmE3MzhlMDFm
ODMzZjIzNGIxNjBhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MTFhZDYzYWVmZjA4
ZmI2MzA4MjAzOTg5ZjZjYzY2NGQwMGEyZmE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwg
MjggRGVjIDIwMjIgMTc6NTE6MjcgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gQ01ha2VMaXN0cy50
eHQ6IGRpc2FibGUgVVNFX05HSFRUUDIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZV80LjIuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZV80LjIuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NtYWtlL2NtYWtlXzQuMi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2VfNC4yLjMuYmIKLS0gCjIuNDcuMQoK

--===============6146317567301438351==--

