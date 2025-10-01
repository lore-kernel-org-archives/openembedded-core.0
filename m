Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73B1CCD184
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:12 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.18065.1759325532292667273
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HWxSYzAq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VRGgZPMf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101999ff92e03-09de2cf3-e25c-45b6-88da-6e482df03336-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325531;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NZgEZ1oO9UJW+QGrUObDVchlRXP+uWNN8paGtvC4G+A=;
	b=HWxSYzAqxvrXXrUQ+wZvOkSXS+GPUfo01EcCXJhyKtncaC3BG/UFsPtxQ31RyN2b
	ed7chaiqFUdb6ZmVyoYAdZ+OktfD6fAknJ9gcMy+bfXP5yWYyNXIMwpFSlD/Aa5zZ49
	ugEMbEDDCWMvsewTsFC3qDjlkXLZHBqAfn9pMy2M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325531;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NZgEZ1oO9UJW+QGrUObDVchlRXP+uWNN8paGtvC4G+A=;
	b=VRGgZPMfVH3wViPOZ/s1g8zfZnAji/gJ+63ZlY0O8hEIvOJdrwdS14r3grefOPXA
	u7pvExI/qK/HktB4Wkm67VU16P8+GFA+YffIHQMk+kT31muBIEDuyCjzfu+N3rs5dJ3
	iu9RVQrOydWtzo1fM9y9Y02FFzS2b4ER1BCHrzfE=
Content-Type: multipart/mixed; boundary="===============4208617025937970517=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake-native,cmake: upgrading to 4.1.2,4.1.2 FAILED
Message-ID: <010101999ff92e03-09de2cf3-e25c-45b6-88da-6e482df03336-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224216

--===============4208617025937970517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *4.1.2,4.1.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f cmake /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1940 entries from dependency cache.
Parsing recipes...
Summary: There were 3 ERROR messages, returning a non-zero exit code.

ERROR: /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.1.2.bb: Unable to get checksum for cmake-native SRC_URI entry 0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-4.1.2/poky/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake/poky/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/files/poky/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-4.1.2/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/files/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-4.1.2/x86-64/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake/x86-64/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/files/x86-64/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-4.1.2/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/files/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
ERROR: /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_4.1.1.bb: Unable to get checksum for nativesdk-cmake SRC_URI entry 0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-4.1.1/poky/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake/poky/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/files/poky/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-4.1.1/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/files/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-4.1.1/x86-64/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake/x86-64/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/files/x86-64/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-4.1.1/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/files/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
ERROR: Parsing halted due to errors, see error messages above
ERROR: Failed to start bitbake environment


Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-4.1.1-4.1.2-4.1.1-4.1.2.patch
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
From a2e3ce4f6083f3ede1bce24819a1ee639818030c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 05:59:32 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 4.1.1 -> 4.1.2,4.1.1 -> 4.1.2

---
 ...-native_4.1.1.bb => cmake-native_4.1.2.bb} | 11 +++---
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 ...ext2fs-ext2_fs.h-by-cmake-s-internal.patch |  6 ++--
 ...d-using-undocumented-type-for-CURLOP.patch | 35 -------------------
 ...2-CMakeLists.txt-disable-USE_NGHTTP2.patch |  6 ++--
 5 files changed, 13 insertions(+), 47 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.1.1.bb => cmake-native_4.1.2.bb} (86%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.1.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.1.2.bb
similarity index 86%
rename from meta/recipes-devtools/cmake/cmake-native_4.1.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.1.2.bb
index 7b90bff52f..a306dddf2a 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.1.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.1.2.bb
@@ -3,11 +3,12 @@ inherit native
 
 DEPENDS += "bzip2-replacement-native xz-native zlib-native ncurses-native zstd-native openssl-native"
 
-SRC_URI += "file://OEToolchainConfig.cmake \
-            file://environment.d-cmake.sh \
-            file://0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch \
-            file://0002-CMakeLists.txt-disable-USE_NGHTTP2.patch \
-            "
+SRC_URI += "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+           file://OEToolchainConfig.cmake \
+           file://environment.d-cmake.sh \
+           file://0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch \
+           file://0002-CMakeLists.txt-disable-USE_NGHTTP2.patch \
+           "
 
 LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
 LIC_FILES_CHKSUM:append = " \
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index e86bb3dec1..ddc0f3c7d0 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch \
            "
 
-SRC_URI[sha256sum] = "b29f6f19733aa224b7763507a108a427ed48c688e1faf22b29c44e1c30549282"
+SRC_URI[sha256sum] = "643f04182b7ba323ab31f526f785134fb79cba3188a852206ef0473fee282a15"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
index f31dce5644..97f46fb2dd 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
@@ -1,4 +1,4 @@
-From cf8210696ebbaff14612d845bc98fac447c0e6f5 Mon Sep 17 00:00:00 2001
+From 6ec7e98b4e0217b83d088eebaff321509077a612 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
@@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index 04d986b6ea7d8dc0bd7e909d4e7b4e73c9e35437..014fe78063f7d30c9a4970b7cf3aeeaeb36bcdbc 100644
+index e6ab5de9..913887b5 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -720,12 +720,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch b/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
deleted file mode 100644
index d04d0be795..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c8143074cf3954b1e169904eb9d843cfbe14acc3 Mon Sep 17 00:00:00 2001
-From: Brad King <brad.king@kitware.com>
-Date: Tue, 2 Sep 2025 11:41:10 -0400
-Subject: [PATCH] cmCTestCurl: Avoid using undocumented type for
- CURLOPT_PROXYTYPE values
-
-Since upstream curl commit `1a12663d06` (CURLOPT: bump `CURLPROXY_*`
-enums to `long`, drop casts, 2025-07-28), the `CURLPROXY_*` constants
-are integer literals instead of `enum curl_proxytype`.  It turns out
-that `curl_easy_setopt` has always expected a `long` anyway, and that
-`curl_proxytype` is not documented for public use.
-
-Fixes: #27178
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-Upstream-Status: Backport [https://gitlab.kitware.com/cmake/cmake/-/commit/c8143074cf3954b1e169904eb9d843cfbe14acc3]
----
- Source/CTest/cmCTestCurl.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/CTest/cmCTestCurl.h b/Source/CTest/cmCTestCurl.h
-index 7836f4b9c7..9113890b5a 100644
---- a/Source/CTest/cmCTestCurl.h
-+++ b/Source/CTest/cmCTestCurl.h
-@@ -52,7 +52,7 @@ private:
-   std::vector<std::string> HttpHeaders;
-   std::string HTTPProxyAuth;
-   std::string HTTPProxy;
--  curl_proxytype HTTPProxyType;
-+  long HTTPProxyType;
-   bool UseHttp10 = false;
-   bool Quiet = false;
-   int TimeOutSeconds = 0;
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 158eea2c3e..d5b812244e 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From e0a1996a85dcb43d69d3c7daecab4da74599e5ba Mon Sep 17 00:00:00 2001
+From 5f40532d7d7dd8bc730f7dd367727967ad9edc88 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -22,10 +22,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index 75b510205984894ffa11461e7aa04d3c479709b4..83463042d82d9c7f17932753f47c47b12aeec85b 100644
+index ddc975c2..cf60a43e 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
-@@ -105,7 +105,7 @@ set(USE_ECH OFF)
+@@ -110,7 +110,7 @@ set(USE_ECH OFF)
  set(USE_HTTPSRR OFF)
  set(USE_LIBIDN2 ON)
  set(USE_LIBRTMP OFF)
-- 
2.47.1


--===============4208617025937970517==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-4.1.1-4.1.2-4.1.1-4.1.2.patch"

RnJvbSBhMmUzY2U0ZjYwODNmM2VkZTFiY2UyNDgxOWExZWU2Mzk4MTgwMzBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwNTo1OTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLW5hdGl2ZSxjbWFrZTogdXBncmFkZSA0LjEuMSAtPiA0LjEuMiw0LjEuMSAtPiA0LjEuMgoK
LS0tCiAuLi4tbmF0aXZlXzQuMS4xLmJiID0+IGNtYWtlLW5hdGl2ZV80LjEuMi5iYn0gfCAxMSAr
KystLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICB8ICAy
ICstCiAuLi5leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwucGF0Y2ggfCAgNiAr
Ky0tCiAuLi5kLXVzaW5nLXVuZG9jdW1lbnRlZC10eXBlLWZvci1DVVJMT1AucGF0Y2ggfCAzNSAt
LS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4yLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRU
UDIucGF0Y2ggfCAgNiArKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDQ3
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2Ut
bmF0aXZlXzQuMS4xLmJiID0+IGNtYWtlLW5hdGl2ZV80LjEuMi5iYn0gKDg2JSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1jbUNUZXN0
Q3VybC1Bdm9pZC11c2luZy11bmRvY3VtZW50ZWQtdHlwZS1mb3ItQ1VSTE9QLnBhdGNoCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjEuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfNC4xLjIuYmIKc2lt
aWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlLW5hdGl2ZV80LjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlLW5hdGl2ZV80LjEuMi5iYgppbmRleCA3YjkwYmZmNTJmLi5hMzA2ZGRkZjJhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuMS4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfNC4xLjIu
YmIKQEAgLTMsMTEgKzMsMTIgQEAgaW5oZXJpdCBuYXRpdmUKIAogREVQRU5EUyArPSAiYnppcDIt
cmVwbGFjZW1lbnQtbmF0aXZlIHh6LW5hdGl2ZSB6bGliLW5hdGl2ZSBuY3Vyc2VzLW5hdGl2ZSB6
c3RkLW5hdGl2ZSBvcGVuc3NsLW5hdGl2ZSIKIAotU1JDX1VSSSArPSAiZmlsZTovL09FVG9vbGNo
YWluQ29uZmlnLmNtYWtlIFwKLSAgICAgICAgICAgIGZpbGU6Ly9lbnZpcm9ubWVudC5kLWNtYWtl
LnNoIFwKLSAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQy
X2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC5wYXRjaCBcCi0gICAgICAgICAgICBmaWxlOi8vMDAw
Mi1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoIFwKLSAgICAgICAgICAg
ICIKK1NSQ19VUkkgKz0gImh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZF
UlNJT059L2NtYWtlLSR7UFZ9LnRhci5neiBcCisgICAgICAgICAgIGZpbGU6Ly9PRVRvb2xjaGFp
bkNvbmZpZy5jbWFrZSBcCisgICAgICAgICAgIGZpbGU6Ly9lbnZpcm9ubWVudC5kLWNtYWtlLnNo
IFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMu
aC1ieS1jbWFrZS1zLWludGVybmFsLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDItQ01h
a2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCBcCisgICAgICAgICAgICIKIAog
TElDRU5TRTphcHBlbmQgPSAiICYgQlNELTEtQ2xhdXNlICYgTUlUICYgQlNELTItQ2xhdXNlICYg
Y3VybCIKIExJQ19GSUxFU19DSEtTVU06YXBwZW5kID0gIiBcCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlLmluYwppbmRleCBlODZiYjNkZWMxLi5kZGMwZjNjN2QwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJodHRw
czovL2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50
YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jbUNUZXN0Q3VybC1Bdm9pZC11c2luZy11
bmRvY3VtZW50ZWQtdHlwZS1mb3ItQ1VSTE9QLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYjI5ZjZmMTk3MzNhYTIyNGI3NzYzNTA3YTEwOGE0MjdlZDQ4YzY4
OGUxZmFmMjJiMjljNDRlMWMzMDU0OTI4MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NDNmMDQx
ODJiN2JhMzIzYWIzMWY1MjZmNzg1MTM0ZmI3OWNiYTMxODhhODUyMjA2ZWYwNDczZmVlMjgyYTE1
IgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZlcj5cZCsoXC5cZCspKylc
LnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAw
MDEtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtRGlzYWJsZS11c2Ut
b2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLnBhdGNoCmluZGV4IGYzMWRj
ZTU2NDQuLjk3ZjQ2ZmIyZGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFr
ZS9jbWFrZS8wMDAxLURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1p
bnRlcm5hbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAw
MS1EaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNmODIxMDY5NmViYmFmZjE0NjEyZDg0NWJjOThmYWM0
NDdjMGU2ZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZlYzdlOThiNGUwMjE3Yjgz
ZDA4OGVlYmFmZjMyMTUwOTA3N2E2MTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBP
dGF2aW8gU2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPgogRGF0ZTogVGh1LCA1IEp1
bCAyMDE4IDEwOjI4OjA0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgdXNlIG9mIGV4
dDJmcy9leHQyX2ZzLmggYnkgY21ha2UncyBpbnRlcm5hbApAQCAtMTgsMTAgKzE4LDEwIEBAIFNp
Z25lZC1vZmYtYnk6IE90YXZpbyBTYWx2YWRvciA8b3RhdmlvQG9zc3lzdGVtcy5jb20uYnI+CiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL1V0aWxpdGllcy9jbWxpYmFyY2hpdmUvQ01ha2VMaXN0cy50eHQgYi9VdGlsaXRpZXMv
Y21saWJhcmNoaXZlL0NNYWtlTGlzdHMudHh0Ci1pbmRleCAwNGQ5ODZiNmVhN2Q4ZGMwYmQ3ZTkw
OWQ0ZTdiNGU3M2M5ZTM1NDM3Li4wMTRmZTc4MDYzZjdkMzBjOWE0OTcwYjdjZjNhZWVhZWIzNmJj
ZGJjIDEwMDY0NAoraW5kZXggZTZhYjVkZTkuLjkxMzg4N2I1IDEwMDY0NAogLS0tIGEvVXRpbGl0
aWVzL2NtbGliYXJjaGl2ZS9DTWFrZUxpc3RzLnR4dAogKysrIGIvVXRpbGl0aWVzL2NtbGliYXJj
aGl2ZS9DTWFrZUxpc3RzLnR4dAotQEAgLTc0NSwxMiArNzQ1LDggQEAgTEFfQ0hFQ0tfSU5DTFVE
RV9GSUxFKCJjb3B5ZmlsZS5oIiBIQVZFX0NPUFlGSUxFX0gpCitAQCAtNzIwLDEyICs3MjAsOCBA
QCBMQV9DSEVDS19JTkNMVURFX0ZJTEUoImNvcHlmaWxlLmgiIEhBVkVfQ09QWUZJTEVfSCkKICBM
QV9DSEVDS19JTkNMVURFX0ZJTEUoImRpcmVjdC5oIiBIQVZFX0RJUkVDVF9IKQogIExBX0NIRUNL
X0lOQ0xVREVfRklMRSgiZGxmY24uaCIgSEFWRV9ETEZDTl9IKQogIExBX0NIRUNLX0lOQ0xVREVf
RklMRSgiZXJybm8uaCIgSEFWRV9FUlJOT19IKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtY21DVGVzdEN1cmwtQXZvaWQtdXNpbmctdW5kb2N1bWVu
dGVkLXR5cGUtZm9yLUNVUkxPUC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9j
bWFrZS8wMDAxLWNtQ1Rlc3RDdXJsLUF2b2lkLXVzaW5nLXVuZG9jdW1lbnRlZC10eXBlLWZvci1D
VVJMT1AucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGQwNGQwYmU3OTUuLjAw
MDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtY21D
VGVzdEN1cmwtQXZvaWQtdXNpbmctdW5kb2N1bWVudGVkLXR5cGUtZm9yLUNVUkxPUC5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDM1ICswLDAgQEAKLUZyb20gYzgxNDMwNzRjZjM5NTRiMWUxNjk5
MDRlYjlkODQzY2ZiZTE0YWNjMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEJyYWQg
S2luZyA8YnJhZC5raW5nQGtpdHdhcmUuY29tPgotRGF0ZTogVHVlLCAyIFNlcCAyMDI1IDExOjQx
OjEwIC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0hdIGNtQ1Rlc3RDdXJsOiBBdm9pZCB1c2luZyB1bmRv
Y3VtZW50ZWQgdHlwZSBmb3IKLSBDVVJMT1BUX1BST1hZVFlQRSB2YWx1ZXMKLQotU2luY2UgdXBz
dHJlYW0gY3VybCBjb21taXQgYDFhMTI2NjNkMDZgIChDVVJMT1BUOiBidW1wIGBDVVJMUFJPWFlf
KmAKLWVudW1zIHRvIGBsb25nYCwgZHJvcCBjYXN0cywgMjAyNS0wNy0yOCksIHRoZSBgQ1VSTFBS
T1hZXypgIGNvbnN0YW50cwotYXJlIGludGVnZXIgbGl0ZXJhbHMgaW5zdGVhZCBvZiBgZW51bSBj
dXJsX3Byb3h5dHlwZWAuICBJdCB0dXJucyBvdXQKLXRoYXQgYGN1cmxfZWFzeV9zZXRvcHRgIGhh
cyBhbHdheXMgZXhwZWN0ZWQgYSBgbG9uZ2AgYW55d2F5LCBhbmQgdGhhdAotYGN1cmxfcHJveHl0
eXBlYCBpcyBub3QgZG9jdW1lbnRlZCBmb3IgcHVibGljIHVzZS4KLQotRml4ZXM6ICMyNzE3OAot
U2lnbmVkLW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhp
cy5jb20+Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGxhYi5raXR3YXJl
LmNvbS9jbWFrZS9jbWFrZS8tL2NvbW1pdC9jODE0MzA3NGNmMzk1NGIxZTE2OTkwNGViOWQ4NDNj
ZmJlMTRhY2MzXQotLS0tCi0gU291cmNlL0NUZXN0L2NtQ1Rlc3RDdXJsLmggfCAyICstCi0gMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQg
YS9Tb3VyY2UvQ1Rlc3QvY21DVGVzdEN1cmwuaCBiL1NvdXJjZS9DVGVzdC9jbUNUZXN0Q3VybC5o
Ci1pbmRleCA3ODM2ZjRiOWM3Li45MTEzODkwYjVhIDEwMDY0NAotLS0tIGEvU291cmNlL0NUZXN0
L2NtQ1Rlc3RDdXJsLmgKLSsrKyBiL1NvdXJjZS9DVGVzdC9jbUNUZXN0Q3VybC5oCi1AQCAtNTIs
NyArNTIsNyBAQCBwcml2YXRlOgotICAgc3RkOjp2ZWN0b3I8c3RkOjpzdHJpbmc+IEh0dHBIZWFk
ZXJzOwotICAgc3RkOjpzdHJpbmcgSFRUUFByb3h5QXV0aDsKLSAgIHN0ZDo6c3RyaW5nIEhUVFBQ
cm94eTsKLS0gIGN1cmxfcHJveHl0eXBlIEhUVFBQcm94eVR5cGU7Ci0rICBsb25nIEhUVFBQcm94
eVR5cGU7Ci0gICBib29sIFVzZUh0dHAxMCA9IGZhbHNlOwotICAgYm9vbCBRdWlldCA9IGZhbHNl
OwotICAgaW50IFRpbWVPdXRTZWNvbmRzID0gMDsKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAyLUNNYWtlTGlzdHMudHh0LWRp
c2FibGUtVVNFX05HSFRUUDIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21h
a2UvMDAwMi1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoCmluZGV4IDE1
OGVlYTJjM2UuLmQ1YjgxMjI0NGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZS8wMDAyLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDItQ01ha2VMaXN0cy50
eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTBhMTk5
NmE4NWRjYjQzZDY5ZDNjN2RhZWNhYjRkYTc0NTk5ZTViYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNWY0MDUzMmQ3ZDdkZDhiYzczMGY3ZGQzNjc3Mjc5NjdhZDllZGM4OCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRy
aXZlci5jb20+CiBEYXRlOiBXZWQsIDI4IERlYyAyMDIyIDE3OjUxOjI3ICswODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBkaXNhYmxlIFVTRV9OR0hUVFAyCkBAIC0yMiwxMCAr
MjIsMTAgQEAgU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJl
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL1V0aWxpdGllcy9jbWN1cmwvQ01ha2VMaXN0cy50eHQgYi9VdGlsaXRpZXMv
Y21jdXJsL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA3NWI1MTAyMDU5ODQ4OTRmZmExMTQ2MWU3YWEw
NGQzYzQ3OTcwOWI0Li44MzQ2MzA0MmQ4MmQ5YzdmMTc5MzI3NTNmNDdjNDdiMTJhZWVjODViIDEw
MDY0NAoraW5kZXggZGRjOTc1YzIuLmNmNjBhNDNlIDEwMDY0NAogLS0tIGEvVXRpbGl0aWVzL2Nt
Y3VybC9DTWFrZUxpc3RzLnR4dAogKysrIGIvVXRpbGl0aWVzL2NtY3VybC9DTWFrZUxpc3RzLnR4
dAotQEAgLTEwNSw3ICsxMDUsNyBAQCBzZXQoVVNFX0VDSCBPRkYpCitAQCAtMTEwLDcgKzExMCw3
IEBAIHNldChVU0VfRUNIIE9GRikKICBzZXQoVVNFX0hUVFBTUlIgT0ZGKQogIHNldChVU0VfTElC
SUROMiBPTikKICBzZXQoVVNFX0xJQlJUTVAgT0ZGKQotLSAKMi40Ny4xCgo=

--===============4208617025937970517==--

