Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5789BD5B161
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17383.1765872127805893802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Vv7LD9Pu;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=R6yQ1L0R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e58b1-82f5adfb-1049-4570-8c89-eddd99fd1b72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872130;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KOzbkznfTIjru8D1QAX9LCMJLp6RyD+q9di7gcxUYIQ=;
	b=Vv7LD9PuJmCjQg8q0bkv5wNDxWcbNDTgDPVSL96V4SgK16akfJ2JvBuRU4yNCRs+
	V8HjLUeBeiuGgYsY0/XkX6pn1tyGzPD0cvDlwDSAqO0004Ii8vAzjY2QuIdpzQ2hI2W
	nIm/eNnzzUGNauzmWWBxou58qZr7zou8L8OFOpYI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872130;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KOzbkznfTIjru8D1QAX9LCMJLp6RyD+q9di7gcxUYIQ=;
	b=R6yQ1L0RBUN3y+Sbg1x8F/TQUAiuiOMU3/cN/tVfr1Uo7xHZ7z7IrXCnYE1Gc4gF
	2aKXKlMOt30UgFpQ2SoBGp4K3BQqyPriQoFNYLlJlafMTVFORslRmh8tnOk6Db4qWWC
	Sip1fqr2EknbYhBf9jSv1HjcHfmuIXSm21xhE5iw=
Content-Type: multipart/mixed; boundary="===============4196113693106871839=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake-native,cmake: upgrading to 4.2.1,4.2.1 SUCCEEDED
Message-ID: <0101019b262e58b1-82f5adfb-1049-4570-8c89-eddd99fd1b72-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227765

--===============4196113693106871839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *4.2.1,4.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-4.2.0-4.2.1-4.2.0-4.2.1.patch
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
From d15b83d0923a784a7f5c4c43480e87d19ecfab19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 20:15:59 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 4.2.0 -> 4.2.1,4.2.0 -> 4.2.1

---
 .../cmake/{cmake-native_4.2.0.bb => cmake-native_4.2.1.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                       | 2 +-
 ...isable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch | 6 +++---
 .../cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch     | 6 +++---
 .../cmake/{cmake_4.2.0.bb => cmake_4.2.1.bb}                | 0
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.2.0.bb => cmake-native_4.2.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.2.0.bb => cmake_4.2.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.2.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.2.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 0dcc5c3f55..d120638b1b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "4104e94657d247c811cb29985405a360b78130b5d51e7f6daceb2447830bd579"
+SRC_URI[sha256sum] = "414aacfac54ba0e78e64a018720b64ed6bfca14b587047b8b3489f407a14a070"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
index f31dce5644..0d2de28d5b 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
@@ -1,4 +1,4 @@
-From cf8210696ebbaff14612d845bc98fac447c0e6f5 Mon Sep 17 00:00:00 2001
+From 3d87f9fd1071e548cf9a6718c4ade0bfde812c30 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
@@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index 04d986b6ea7d8dc0bd7e909d4e7b4e73c9e35437..014fe78063f7d30c9a4970b7cf3aeeaeb36bcdbc 100644
+index 9957052d..71a7aeb5 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -734,12 +734,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
diff --git a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 158eea2c3e..f6b6cfcf41 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From e0a1996a85dcb43d69d3c7daecab4da74599e5ba Mon Sep 17 00:00:00 2001
+From d4696e9d78d09366c13ba738e01f833f234b160a Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -22,10 +22,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index 75b510205984894ffa11461e7aa04d3c479709b4..83463042d82d9c7f17932753f47c47b12aeec85b 100644
+index 63d3a4f5..ab5f1c50 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
-@@ -105,7 +105,7 @@ set(USE_ECH OFF)
+@@ -109,7 +109,7 @@ set(USE_ECH OFF)
  set(USE_HTTPSRR OFF)
  set(USE_LIBIDN2 ON)
  set(USE_LIBRTMP OFF)
diff --git a/meta/recipes-devtools/cmake/cmake_4.2.0.bb b/meta/recipes-devtools/cmake/cmake_4.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.2.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.2.1.bb
-- 
2.47.1


--===============4196113693106871839==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-4.2.0-4.2.1-4.2.0-4.2.1.patch"

RnJvbSBkMTViODNkMDkyM2E3ODRhN2Y1YzRjNDM0ODBlODdkMTllY2ZhYjE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjA6MTU6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZS1uYXRpdmUsY21ha2U6IHVwZ3JhZGUgNC4yLjAgLT4gNC4yLjEsNC4yLjAgLT4gNC4yLjEK
Ci0tLQogLi4uL2NtYWtlL3tjbWFrZS1uYXRpdmVfNC4yLjAuYmIgPT4gY21ha2UtbmF0aXZlXzQu
Mi4xLmJifSAgfCAwCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLmlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMu
aC1ieS1jbWFrZS1zLWludGVybmFsLnBhdGNoIHwgNiArKystLS0KIC4uLi9jbWFrZS8wMDAyLUNN
YWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2ggICAgIHwgNiArKystLS0KIC4u
Li9jbWFrZS97Y21ha2VfNC4yLjAuYmIgPT4gY21ha2VfNC4yLjEuYmJ9ICAgICAgICAgICAgICAg
IHwgMAogNSBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZS1uYXRpdmVfNC4yLjAuYmIg
PT4gY21ha2UtbmF0aXZlXzQuMi4xLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2Uve2NtYWtlXzQuMi4wLmJiID0+IGNtYWtlXzQuMi4xLmJifSAoMTAwJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuMi4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjIuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlLW5hdGl2ZV80LjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLW5hdGl2ZV80LjIuMS5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZS5pbmMKaW5kZXggMGRjYzVjM2Y1NS4uZDEyMDYzOGIxYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2UuaW5jCkBAIC0xOSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAi
JHtAJy4nLmpvaW4oZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0g
Imh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7
UFZ9LnRhci5neiBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQxMDRl
OTQ2NTdkMjQ3YzgxMWNiMjk5ODU0MDVhMzYwYjc4MTMwYjVkNTFlN2Y2ZGFjZWIyNDQ3ODMwYmQ1
NzkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDE0YWFjZmFjNTRiYTBlNzhlNjRhMDE4NzIwYjY0
ZWQ2YmZjYTE0YjU4NzA0N2I4YjM0ODlmNDA3YTE0YTA3MCIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVH
RVggPSAiY21ha2UtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLURpc2FibGUtdXNlLW9mLWV4dDJm
cy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZS8wMDAxLURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnkt
Y21ha2Utcy1pbnRlcm5hbC5wYXRjaAppbmRleCBmMzFkY2U1NjQ0Li4wZDJkZTI4ZDViIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1EaXNhYmxlLXVz
ZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtRGlzYWJsZS11c2Utb2YtZXh0MmZz
LWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBjZjgyMTA2OTZlYmJhZmYxNDYxMmQ4NDViYzk4ZmFjNDQ3YzBlNmY1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAzZDg3ZjlmZDEwNzFlNTQ4Y2Y5YTY3MThjNGFkZTBiZmRlODEyYzMw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9A
b3NzeXN0ZW1zLmNvbS5icj4KIERhdGU6IFRodSwgNSBKdWwgMjAxOCAxMDoyODowNCAtMDMwMAog
U3ViamVjdDogW1BBVENIXSBEaXNhYmxlIHVzZSBvZiBleHQyZnMvZXh0Ml9mcy5oIGJ5IGNtYWtl
J3MgaW50ZXJuYWwKQEAgLTE4LDEwICsxOCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBPdGF2aW8gU2Fs
dmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9VdGlsaXRpZXMvY21saWJh
cmNoaXZlL0NNYWtlTGlzdHMudHh0IGIvVXRpbGl0aWVzL2NtbGliYXJjaGl2ZS9DTWFrZUxpc3Rz
LnR4dAotaW5kZXggMDRkOTg2YjZlYTdkOGRjMGJkN2U5MDlkNGU3YjRlNzNjOWUzNTQzNy4uMDE0
ZmU3ODA2M2Y3ZDMwYzlhNDk3MGI3Y2YzYWVlYWViMzZiY2RiYyAxMDA2NDQKK2luZGV4IDk5NTcw
NTJkLi43MWE3YWViNSAxMDA2NDQKIC0tLSBhL1V0aWxpdGllcy9jbWxpYmFyY2hpdmUvQ01ha2VM
aXN0cy50eHQKICsrKyBiL1V0aWxpdGllcy9jbWxpYmFyY2hpdmUvQ01ha2VMaXN0cy50eHQKLUBA
IC03NDUsMTIgKzc0NSw4IEBAIExBX0NIRUNLX0lOQ0xVREVfRklMRSgiY29weWZpbGUuaCIgSEFW
RV9DT1BZRklMRV9IKQorQEAgLTczNCwxMiArNzM0LDggQEAgTEFfQ0hFQ0tfSU5DTFVERV9GSUxF
KCJjb3B5ZmlsZS5oIiBIQVZFX0NPUFlGSUxFX0gpCiAgTEFfQ0hFQ0tfSU5DTFVERV9GSUxFKCJk
aXJlY3QuaCIgSEFWRV9ESVJFQ1RfSCkKICBMQV9DSEVDS19JTkNMVURFX0ZJTEUoImRsZmNuLmgi
IEhBVkVfRExGQ05fSCkKICBMQV9DSEVDS19JTkNMVURFX0ZJTEUoImVycm5vLmgiIEhBVkVfRVJS
Tk9fSCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAy
LUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMi1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hU
VFAyLnBhdGNoCmluZGV4IDE1OGVlYTJjM2UuLmY2YjZjZmNmNDEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAyLUNNYWtlTGlzdHMudHh0LWRpc2FibGUt
VVNFX05HSFRUUDIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
LzAwMDItQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gZTBhMTk5NmE4NWRjYjQzZDY5ZDNjN2RhZWNhYjRkYTc0NTk5ZTViYSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDQ2OTZlOWQ3OGQwOTM2NmMxM2JhNzM4ZTAxZjgz
M2YyMzRiMTYwYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoYW5ncWluZyBMaSA8
Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDI4IERlYyAyMDIyIDE3OjUx
OjI3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBkaXNhYmxlIFVTRV9O
R0hUVFAyCkBAIC0yMiwxMCArMjIsMTAgQEAgU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4g
PHRnYW1ibGluQGJheWxpYnJlLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL1V0aWxpdGllcy9jbWN1cmwvQ01ha2VMaXN0
cy50eHQgYi9VdGlsaXRpZXMvY21jdXJsL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA3NWI1MTAyMDU5
ODQ4OTRmZmExMTQ2MWU3YWEwNGQzYzQ3OTcwOWI0Li44MzQ2MzA0MmQ4MmQ5YzdmMTc5MzI3NTNm
NDdjNDdiMTJhZWVjODViIDEwMDY0NAoraW5kZXggNjNkM2E0ZjUuLmFiNWYxYzUwIDEwMDY0NAog
LS0tIGEvVXRpbGl0aWVzL2NtY3VybC9DTWFrZUxpc3RzLnR4dAogKysrIGIvVXRpbGl0aWVzL2Nt
Y3VybC9DTWFrZUxpc3RzLnR4dAotQEAgLTEwNSw3ICsxMDUsNyBAQCBzZXQoVVNFX0VDSCBPRkYp
CitAQCAtMTA5LDcgKzEwOSw3IEBAIHNldChVU0VfRUNIIE9GRikKICBzZXQoVVNFX0hUVFBTUlIg
T0ZGKQogIHNldChVU0VfTElCSUROMiBPTikKICBzZXQoVVNFX0xJQlJUTVAgT0ZGKQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzQuMi4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzQuMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAw
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfNC4yLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV80LjIuMS5iYgotLSAK
Mi40Ny4xCgo=

--===============4196113693106871839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1210657504 to 1210559416 (-0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/cmake/cmake-src: FILELIST: directory renamed /usr/src/debug/cmake/4.2.0/Utilities/cmjsoncpp/include/json -> /usr/src/debug/cmake/4.2.1/Utilities/cmjsoncpp/include/json, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/cmlibuv/src/unix -> /usr/src/debug/cmake/4.2.1/Utilities/cmlibuv/src/unix, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/cmlibrhash/librhash -> /usr/src/debug/cmake/4.2.1/Utilities/cmlibrhash/librhash, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/cmlibuv/src -> /usr/src/debug/cmake/4.2.1/Utilities/cmlibuv/src, directory renamed /usr/src/debug/cmake/4.2.0/Source/CPack/IFW -> /usr/src/debug/cmake/4.2.1/Source/CPack/IFW, directory renamed /usr/src/debug/cmake/4.2.0/Source/CTest -> /usr/src/debug/cmake/4.2.1/Source/CTest, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/cmlibuv/include/uv -> /usr/src/debug/cmake/4.2.1/Utilities/cmlibuv/include/uv, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/std/cm/bits 
 -> /usr/src/debug/cmake/4.2.1/Utilities/std/cm/bits, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/cmlibarchive/libarchive -> /usr/src/debug/cmake/4.2.1/Utilities/cmlibarchive/libarchive, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/std/cm -> /usr/src/debug/cmake/4.2.1/Utilities/std/cm, directory renamed /usr/src/debug/cmake/4.2.0/Source -> /usr/src/debug/cmake/4.2.1/Source, directory renamed /usr/src/debug/cmake/4.2.0/Source/kwsys -> /usr/src/debug/cmake/4.2.1/Source/kwsys, directory renamed /usr/src/debug/cmake/4.2.0/Source/CPack -> /usr/src/debug/cmake/4.2.1/Source/CPack, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/std/cmext -> /usr/src/debug/cmake/4.2.1/Utilities/std/cmext, directory renamed /usr/src/debug/cmake/4.2.0/Source/cmsys -> /usr/src/debug/cmake/4.2.1/Source/cmsys, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/cmlibuv/include -> /usr/src/debug/cmake/4.2.1/Utilities/cmlibuv/include, directory renamed /usr/src/debug/cmake/4.2.0/Sourc
 e/LexerParser -> /usr/src/debug/cmake/4.2.1/Source/LexerParser, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/cmelf -> /usr/src/debug/cmake/4.2.1/Utilities/cmelf, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/cmllpkgc -> /usr/src/debug/cmake/4.2.1/Utilities/cmllpkgc, directory renamed /usr/src/debug/cmake/4.2.0/Utilities/cmjsoncpp/src/lib_json -> /usr/src/debug/cmake/4.2.1/Utilities/cmjsoncpp/src/lib_json
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGSIZE changed from 10609687 to 10610546 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 47721421 to 47724844 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.2/cmake-4.2.0.tar.gz" to "https://cmake.org/files/v4.2/cmake-4.2.1.tar.gz"
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.2.0 [default] to 4.2.1 [default]
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.2.0" to "4.2.1"
packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9685472 to 9883625 (+2%)

--===============4196113693106871839==--

