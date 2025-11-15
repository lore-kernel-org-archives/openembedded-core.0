Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19ADCEBF8C
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:41 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11935.1763224717932252001
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=0SXGzA8F;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JnitpV/g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a8862143b-5f4b6e35-1628-48d1-81f7-e66d7c4e9b3f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nVOmc77rZCoJYckxI/zbRBWOLmR1Mc/jn6ObGW8xa6I=;
	b=0SXGzA8FgqbZFkorGiD8IXIcyC0Y/n7LX+h+9sfHoUIZrcgdrjTEiLDoYEboUUs4
	afVHr1z21YZptMq8SIFWlqF7V5QJKyxxX+I+xRsTY89v0v8pkaSzpXZwjqXcYjwd5RJ
	N9JXq6Ak7PZUjG8DBCOGtre4zx/+3uS6L7uh77I0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nVOmc77rZCoJYckxI/zbRBWOLmR1Mc/jn6ObGW8xa6I=;
	b=JnitpV/gSzIsgkGHIRP/XLZ7VtGUhpjCH7Fft3qGmc0yqT9fAG+YnrkyhUJIF4O/
	jXbQYadwwTnUp28jWAHz4Bd2Fk1iUblAaWPn7yUV0GRT3AcwvBiIyw+00YDQgonDm0S
	ZAwesFuAs1IgUP8+wZNgy5AVhLxKCCT7RZI4Cm6M=
Content-Type: multipart/mixed; boundary="===============6977870394388332508=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libdnf: upgrading to 0.75.0 FAILED
Message-ID: <0101019a8862143b-5f4b6e35-1628-48d1-81f7-e66d7c4e9b3f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226343

--===============6977870394388332508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdnf* to *0.75.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libdnf-upgrade-0.74.0-0.75.0.patch
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
From a98bf0986426cc0a2f8a564fb820612b7c42d505 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 09:30:27 +0000
Subject: [PATCH] libdnf: upgrade 0.74.0 -> 0.75.0

---
 ...or-both-libsolv-and-libsolvext-libdn.patch |  6 +--
 .../0001-drop-FindPythonInstDir.cmake.patch   |  2 +-
 ...ables-with-pkg-config-cmake-s-own-mo.patch |  6 +--
 .../libdnf/libdnf/armarch.patch               |  2 +-
 .../libdnf/libdnf/optional-check.patch        | 52 -------------------
 .../{libdnf_0.74.0.bb => libdnf_0.75.0.bb}    |  3 +-
 6 files changed, 9 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/optional-check.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.74.0.bb => libdnf_0.75.0.bb} (94%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 54b1262672..9443f26e55 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From cd8a24156cefab80b673af233f66ff44c1b7c458 Mon Sep 17 00:00:00 2001
+From b7f19bb8f3251c555896c2a683ba35df421d250c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a6f14318..60c66e94 100644
+index 5db8a5dc..9fe5d58e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -51,7 +51,7 @@ endif()
+@@ -55,7 +55,7 @@ endif()
  
  
  # build dependencies
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
index 850a862979..4ec90fea46 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
@@ -1,4 +1,4 @@
-From 5150fd9be924d2e9e74b2db664229423a4a00238 Mon Sep 17 00:00:00 2001
+From e18501767eb8c7a8d614617667534d5b38e3df12 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 1 Jun 2021 10:23:59 +0800
 Subject: [PATCH] drop FindPythonInstDir.cmake
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index f55870802f..fc51fdc769 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From a921a92f334a2a30741b906c206e041cef2d904d Mon Sep 17 00:00:00 2001
+From adb89c51a35e8bacec916797ad26b89a6dcba656 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c6bd46a6..a6f14318 100644
+index e5fcb08b..5db8a5dc 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -51,7 +51,8 @@ endif()
+@@ -55,7 +55,8 @@ endif()
  
  
  # build dependencies
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
index 8a36f87227..4c3dee8885 100644
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
@@ -1,4 +1,4 @@
-From baf4fc9f157e4c08c67d1a577b0f1e10f213a642 Mon Sep 17 00:00:00 2001
+From 26ab2df33e8f769f290bff728f80b6a0e58c3e49 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 9 Nov 2023 10:29:31 +0000
 Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
diff --git a/meta/recipes-devtools/libdnf/libdnf/optional-check.patch b/meta/recipes-devtools/libdnf/libdnf/optional-check.patch
deleted file mode 100644
index 9228b0560f..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/optional-check.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From a4abd42a6b92f6aa16490c0f482bf08c4a6c2864 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 18 Sep 2025 11:23:33 +0100
-Subject: [PATCH] Move libcheck dependency to tests/
-
-If we're not building the tests then there's no point in depending on
-libcheck, so move the pkg_check_modules() call to tests/CMakeLists.
-
-Upstream-Status: Backport [https://github.com/rpm-software-management/libdnf/commit/6a127aec78d2ef837776e0e5a8e3636101a54ab0]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- CMakeLists.txt       | 1 -
- tests/CMakeLists.txt | 7 +++----
- 2 files changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a489ea73..d1969899 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -59,7 +59,6 @@ find_package(LibSolv 0.7.21 REQUIRED COMPONENTS ext)
- 
- 
- # build dependencies via pkg-config
--pkg_check_modules(CHECK REQUIRED check)
- pkg_check_modules(GLIB REQUIRED gio-unix-2.0>=2.46.0)
- include_directories(${GLIB_INCLUDE_DIRS})
- pkg_check_modules(JSONC REQUIRED json-c)
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index e4909682..78743f4e 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -1,3 +1,6 @@
-+pkg_check_modules(CHECK REQUIRED check)
-+pkg_check_modules(CPPUNIT REQUIRED cppunit)
-+
- add_subdirectory(libdnf/conf)
- add_subdirectory(libdnf/module/modulemd)
- add_subdirectory(libdnf/module)
-@@ -7,10 +10,6 @@ add_subdirectory(libdnf/sack)
- add_subdirectory(hawkey)
- add_subdirectory(libdnf)
- 
--
--
--pkg_check_modules(CPPUNIT REQUIRED cppunit)
--
- set(LIBDNF_TEST_SOURCES
-     ${LIBDNF_TEST_SOURCES}
-     ${CMAKE_CURRENT_SOURCE_DIR}/run_tests.cpp
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
similarity index 94%
rename from meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
index 720e7d6e6f..570fccd9c3 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb
@@ -9,10 +9,9 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://armarch.patch \
-           file://optional-check.patch \
            "
 
-SRCREV = "91a0bf9aada36a722855051526f012e0b5ab1af9"
+SRCREV = "d39573195e24b43687587a8d83b9f6ac274e2412"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0 libsolv librepo rpm libmodulemd json-c swig-native util-linux"
-- 
2.47.1


--===============6977870394388332508==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdnf-upgrade-0.74.0-0.75.0.patch"

RnJvbSBhOThiZjA5ODY0MjZjYzBhMmY4YTU2NGZiODIwNjEyYjdjNDJkNTA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDk6MzA6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkbmY6IHVwZ3JhZGUgMC43NC4wIC0+IDAuNzUuMAoKLS0tCiAuLi5vci1ib3RoLWxpYnNvbHYt
YW5kLWxpYnNvbHZleHQtbGliZG4ucGF0Y2ggfCAgNiArLS0KIC4uLi8wMDAxLWRyb3AtRmluZFB5
dGhvbkluc3REaXIuY21ha2UucGF0Y2ggICB8ICAyICstCiAuLi5hYmxlcy13aXRoLXBrZy1jb25m
aWctY21ha2Utcy1vd24tbW8ucGF0Y2ggfCAgNiArLS0KIC4uLi9saWJkbmYvbGliZG5mL2FybWFy
Y2gucGF0Y2ggICAgICAgICAgICAgICB8ICAyICstCiAuLi4vbGliZG5mL2xpYmRuZi9vcHRpb25h
bC1jaGVjay5wYXRjaCAgICAgICAgfCA1MiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4ve2xpYmRu
Zl8wLjc0LjAuYmIgPT4gbGliZG5mXzAuNzUuMC5iYn0gICAgfCAgMyArLQogNiBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDYyIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mL29wdGlvbmFsLWNoZWNrLnBhdGNo
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi97bGliZG5mXzAuNzQuMC5iYiA9
PiBsaWJkbmZfMC43NS4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9saWJkbmYvbGliZG5mLzAwMDEtR2V0LXBhcmFtZXRlcnMtZm9yLWJvdGgtbGlic29sdi1h
bmQtbGlic29sdmV4dC1saWJkbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYv
bGliZG5mLzAwMDEtR2V0LXBhcmFtZXRlcnMtZm9yLWJvdGgtbGlic29sdi1hbmQtbGlic29sdmV4
dC1saWJkbi5wYXRjaAppbmRleCA1NGIxMjYyNjcyLi45NDQzZjI2ZTU1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAxLUdldC1wYXJhbWV0ZXJzLWZv
ci1ib3RoLWxpYnNvbHYtYW5kLWxpYnNvbHZleHQtbGliZG4ucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1HZXQtcGFyYW1ldGVycy1mb3ItYm90aC1s
aWJzb2x2LWFuZC1saWJzb2x2ZXh0LWxpYmRuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBj
ZDhhMjQxNTZjZWZhYjgwYjY3M2FmMjMzZjY2ZmY0NGMxYjdjNDU4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBiN2YxOWJiOGYzMjUxYzU1NTg5NmMyYTY4M2JhMzVkZjQyMWQyNTBjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDcgRmViIDIwMTcgMTI6MTY6MDMgKzAyMDAKIFN1
YmplY3Q6IFtQQVRDSF0gR2V0IHBhcmFtZXRlcnMgZm9yIGJvdGggbGlic29sdiBhbmQgbGlic29s
dmV4dCAobGliZG5mIGlzCkBAIC0xMiwxMCArMTIsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4
dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCBhNmYxNDMxOC4uNjBjNjZlOTQgMTAwNjQ0CitpbmRl
eCA1ZGI4YTVkYy4uOWZlNWQ1OGUgMTAwNjQ0CiAtLS0gYS9DTWFrZUxpc3RzLnR4dAogKysrIGIv
Q01ha2VMaXN0cy50eHQKLUBAIC01MSw3ICs1MSw3IEBAIGVuZGlmKCkKK0BAIC01NSw3ICs1NSw3
IEBAIGVuZGlmKCkKICAKICAKICAjIGJ1aWxkIGRlcGVuZGVuY2llcwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1kcm9wLUZpbmRQeXRob25JbnN0
RGlyLmNtYWtlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAw
MS1kcm9wLUZpbmRQeXRob25JbnN0RGlyLmNtYWtlLnBhdGNoCmluZGV4IDg1MGE4NjI5NzkuLjRl
YzkwZmVhNDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5m
LzAwMDEtZHJvcC1GaW5kUHl0aG9uSW5zdERpci5jbWFrZS5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAxLWRyb3AtRmluZFB5dGhvbkluc3REaXIuY21h
a2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDUxNTBmZDliZTkyNGQyZTllNzRiMmRiNjY0
MjI5NDIzYTRhMDAyMzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUxODUwMTc2N2Vi
OGM3YThkNjE0NjE3NjY3NTM0ZDViMzhlM2RmMTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDEg
SnVuIDIwMjEgMTA6MjM6NTkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZHJvcCBGaW5kUHl0aG9u
SW5zdERpci5jbWFrZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9s
aWJkbmYvMDAwNC1TZXQtbGlic29sdi12YXJpYWJsZXMtd2l0aC1wa2ctY29uZmlnLWNtYWtlLXMt
b3duLW1vLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwNC1T
ZXQtbGlic29sdi12YXJpYWJsZXMtd2l0aC1wa2ctY29uZmlnLWNtYWtlLXMtb3duLW1vLnBhdGNo
CmluZGV4IGY1NTg3MDgwMmYuLmZjNTFmZGM3NjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDQtU2V0LWxpYnNvbHYtdmFyaWFibGVzLXdpdGgtcGtn
LWNvbmZpZy1jbWFrZS1zLW93bi1tby5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGliZG5mL2xpYmRuZi8wMDA0LVNldC1saWJzb2x2LXZhcmlhYmxlcy13aXRoLXBrZy1jb25maWct
Y21ha2Utcy1vd24tbW8ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE5MjFhOTJmMzM0YTJh
MzA3NDFiOTA2YzIwNmUwNDFjZWYyZDkwNGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGFkYjg5YzUxYTM1ZThiYWNlYzkxNjc5N2FkMjZiODlhNmRjYmE2NTYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MjQ6NTAgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gU2V0IGxpYnNvbHYgdmFyaWFibGVzIHdpdGggcGtnLWNvbmZpZyAoY21ha2UncyBvd24gbW9k
dWxlCkBAIC0xMiwxMCArMTIsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxp
c3RzLnR4dAotaW5kZXggYzZiZDQ2YTYuLmE2ZjE0MzE4IDEwMDY0NAoraW5kZXggZTVmY2IwOGIu
LjVkYjhhNWRjIDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMu
dHh0Ci1AQCAtNTEsNyArNTEsOCBAQCBlbmRpZigpCitAQCAtNTUsNyArNTUsOCBAQCBlbmRpZigp
CiAgCiAgCiAgIyBidWlsZCBkZXBlbmRlbmNpZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9saWJkbmYvbGliZG5mL2FybWFyY2gucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbGliZG5mL2xpYmRuZi9hcm1hcmNoLnBhdGNoCmluZGV4IDhhMzZmODcyMjcuLjRjM2RlZTg4
ODUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mL2FybWFy
Y2gucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvYXJtYXJj
aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmFmNGZjOWYxNTdlNGMwOGM2N2QxYTU3N2Iw
ZjFlMTBmMjEzYTY0MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjZhYjJkZjMzZThm
NzY5ZjI5MGJmZjcyOGY4MGI2YTBlNThjM2U0OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgog
RGF0ZTogVGh1LCA5IE5vdiAyMDIzIDEwOjI5OjMxICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxp
YmRuZjogRml4IGFybSBhcmNoIG1hcHBpbmcgaXNzdWVzIGZvciBxZW11YXJtdjUKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mL29wdGlvbmFsLWNoZWNrLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvb3B0aW9uYWwtY2hlY2su
cGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDkyMjhiMDU2MGYuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvb3B0aW9uYWwtY2hl
Y2sucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw1MiArMCwwIEBACi1Gcm9tIGE0YWJkNDJhNmI5
MmY2YWExNjQ5MGMwZjQ4MmJmMDhjNGE2YzI4NjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLURhdGU6IFRodSwgMTggU2Vw
IDIwMjUgMTE6MjM6MzMgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gTW92ZSBsaWJjaGVjayBkZXBl
bmRlbmN5IHRvIHRlc3RzLwotCi1JZiB3ZSdyZSBub3QgYnVpbGRpbmcgdGhlIHRlc3RzIHRoZW4g
dGhlcmUncyBubyBwb2ludCBpbiBkZXBlbmRpbmcgb24KLWxpYmNoZWNrLCBzbyBtb3ZlIHRoZSBw
a2dfY2hlY2tfbW9kdWxlcygpIGNhbGwgdG8gdGVzdHMvQ01ha2VMaXN0cy4KLQotVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2Vt
ZW50L2xpYmRuZi9jb21taXQvNmExMjdhZWM3OGQyZWY4Mzc3NzZlMGU1YThlMzYzNjEwMWE1NGFi
MF0KLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotLS0t
Ci0gQ01ha2VMaXN0cy50eHQgICAgICAgfCAxIC0KLSB0ZXN0cy9DTWFrZUxpc3RzLnR4dCB8IDcg
KysrLS0tLQotIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQotCi1kaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXgg
YTQ4OWVhNzMuLmQxOTY5ODk5IDEwMDY0NAotLS0tIGEvQ01ha2VMaXN0cy50eHQKLSsrKyBiL0NN
YWtlTGlzdHMudHh0Ci1AQCAtNTksNyArNTksNiBAQCBmaW5kX3BhY2thZ2UoTGliU29sdiAwLjcu
MjEgUkVRVUlSRUQgQ09NUE9ORU5UUyBleHQpCi0gCi0gCi0gIyBidWlsZCBkZXBlbmRlbmNpZXMg
dmlhIHBrZy1jb25maWcKLS1wa2dfY2hlY2tfbW9kdWxlcyhDSEVDSyBSRVFVSVJFRCBjaGVjaykK
LSBwa2dfY2hlY2tfbW9kdWxlcyhHTElCIFJFUVVJUkVEIGdpby11bml4LTIuMD49Mi40Ni4wKQot
IGluY2x1ZGVfZGlyZWN0b3JpZXMoJHtHTElCX0lOQ0xVREVfRElSU30pCi0gcGtnX2NoZWNrX21v
ZHVsZXMoSlNPTkMgUkVRVUlSRUQganNvbi1jKQotZGlmZiAtLWdpdCBhL3Rlc3RzL0NNYWtlTGlz
dHMudHh0IGIvdGVzdHMvQ01ha2VMaXN0cy50eHQKLWluZGV4IGU0OTA5NjgyLi43ODc0M2Y0ZSAx
MDA2NDQKLS0tLSBhL3Rlc3RzL0NNYWtlTGlzdHMudHh0Ci0rKysgYi90ZXN0cy9DTWFrZUxpc3Rz
LnR4dAotQEAgLTEsMyArMSw2IEBACi0rcGtnX2NoZWNrX21vZHVsZXMoQ0hFQ0sgUkVRVUlSRUQg
Y2hlY2spCi0rcGtnX2NoZWNrX21vZHVsZXMoQ1BQVU5JVCBSRVFVSVJFRCBjcHB1bml0KQotKwot
IGFkZF9zdWJkaXJlY3RvcnkobGliZG5mL2NvbmYpCi0gYWRkX3N1YmRpcmVjdG9yeShsaWJkbmYv
bW9kdWxlL21vZHVsZW1kKQotIGFkZF9zdWJkaXJlY3RvcnkobGliZG5mL21vZHVsZSkKLUBAIC03
LDEwICsxMCw2IEBAIGFkZF9zdWJkaXJlY3RvcnkobGliZG5mL3NhY2spCi0gYWRkX3N1YmRpcmVj
dG9yeShoYXdrZXkpCi0gYWRkX3N1YmRpcmVjdG9yeShsaWJkbmYpCi0gCi0tCi0tCi0tcGtnX2No
ZWNrX21vZHVsZXMoQ1BQVU5JVCBSRVFVSVJFRCBjcHB1bml0KQotLQotIHNldChMSUJETkZfVEVT
VF9TT1VSQ0VTCi0gICAgICR7TElCRE5GX1RFU1RfU09VUkNFU30KLSAgICAgJHtDTUFLRV9DVVJS
RU5UX1NPVVJDRV9ESVJ9L3J1bl90ZXN0cy5jcHAKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mXzAuNzQuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mXzAuNzUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZl8wLjc0LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mXzAuNzUuMC5i
YgppbmRleCA3MjBlN2Q2ZTZmLi41NzBmY2NkOWMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbGliZG5mL2xpYmRuZl8wLjc0LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYmRuZi9saWJkbmZfMC43NS4wLmJiCkBAIC05LDEwICs5LDkgQEAgU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2xpYmRuZjticmFuY2g9ZG5m
LTQtbWFzdGVyO3AKICAgICAgICAgICAgZmlsZTovLzAwMDEtR2V0LXBhcmFtZXRlcnMtZm9yLWJv
dGgtbGlic29sdi1hbmQtbGlic29sdmV4dC1saWJkbi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLWRyb3AtRmluZFB5dGhvbkluc3REaXIuY21ha2UucGF0Y2ggXAogICAgICAgICAgICBm
aWxlOi8vYXJtYXJjaC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly9vcHRpb25hbC1jaGVjay5w
YXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gIjkxYTBiZjlhYWRhMzZhNzIyODU1MDUx
NTI2ZjAxMmUwYjVhYjFhZjkiCitTUkNSRVYgPSAiZDM5NTczMTk1ZTI0YjQzNjg3NTg3YThkODNi
OWY2YWMyNzRlMjQxMiIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPig/
ITRcLjkwKVxkKyhcLlxkKykrKSIKIAogREVQRU5EUyA9ICJnbGliLTIuMCBsaWJzb2x2IGxpYnJl
cG8gcnBtIGxpYm1vZHVsZW1kIGpzb24tYyBzd2lnLW5hdGl2ZSB1dGlsLWxpbnV4IgotLSAKMi40
Ny4xCgo=

--===============6977870394388332508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libdnf: SRC_URI changed from "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;protocol=https file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch file://0001-drop-FindPythonInstDir.cmake.patch file://armarch.patch file://optional-check.patch" to "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;protocol=https file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch file://0001-drop-FindPythonInstDir.cmake.patch file://armarch.patch"
packages/x86-64-v3-poky-linux/libdnf: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-dbg: PKGSIZE changed from 59766720 to 60398680 (+1%)
packages/x86-64-v3-poky-linux/libdnf/libdnf-dbg: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-dbg: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-dev: PKGSIZE changed from 213936 to 213988 (+0%)
packages/x86-64-v3-poky-linux/libdnf/libdnf-dev: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-dev: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-doc: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-doc: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-as: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-as: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-bg: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-bg: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-bn-in: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-bn-in: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-bn: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-bn: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ca: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ca: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-cs: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-cs: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-da: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-da: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-de: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-de: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-el: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-el: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-es: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-es: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-eu: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-eu: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-fa: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-fa: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-fi: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-fi: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-fil: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-fil: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-fr: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-fr: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-fur: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-fur: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-gu: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-gu: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-hi: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-hi: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-hu: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-hu: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ia: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ia: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-id: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-id: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-is: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-is: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-it: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-it: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ja: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ja: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ka: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ka: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-kn: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-kn: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ko: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ko: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-mai: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-mai: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ml: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ml: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-mr: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-mr: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-nb: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-nb: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-nl: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-nl: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-or: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-or: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-pa: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-pa: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-pl: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-pl: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-pt-br: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-pt-br: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-pt: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-pt: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ru: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ru: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-si: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-si: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-sk: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-sk: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-sq: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-sq: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-sr+latin: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-sr+latin: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-sr: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-sr: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-sv: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-sv: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ta: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-ta: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-te: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-te: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-th: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-th: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-tr: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-tr: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-uk: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-uk: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-zh-cn: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-zh-cn: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-zh-tw: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-locale-zh-tw: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-src: PKGSIZE changed from 7394364 to 7411940 (+0%)
packages/x86-64-v3-poky-linux/libdnf/libdnf-src: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-src: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf-staticdev: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf-staticdev: PV changed from "0.74.0" to "0.75.0"
packages/x86-64-v3-poky-linux/libdnf/libdnf: PKGSIZE changed from 5821429 to 5858935 (+1%)
packages/x86-64-v3-poky-linux/libdnf/libdnf: PKGV changed from 0.74.0 [default] to 0.75.0 [default]
packages/x86-64-v3-poky-linux/libdnf/libdnf: PV changed from "0.74.0" to "0.75.0"
Changes to packages/x86-64-v3-poky-linux/libdnf (sysroot):
  /usr/lib/python3.13/site-packages/libdnf-0.74.0.dist-info moved to /usr/lib/python3.13/site-packages/libdnf-0.75.0.dist-info
Changes to packages/x86_64-linux/binutils-cross-x86_64 (sysroot):
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-addr2line was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-as was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++filt was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-elfedit was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gprof was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.bfd was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objcopy was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-readelf was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-size was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strings was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/libdep.so was added
  /usr/lib/x86_64-poky-linux/ldscripts was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xder was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xscer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xser was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xswer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xder was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xscer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xser was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xswer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xder was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xscer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xser was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xswer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xder was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xscer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xser was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xswer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/stamp was added
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-addr2line was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-as was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++filt was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-elfedit was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gprof was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objcopy was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objdump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-readelf was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-size was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strings was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/libdep.so was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xder was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xscer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xser was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xswer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xder was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xscer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xser was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xswer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xder was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xscer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xser was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xswer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xder was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xscer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xser was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xswer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/stamp was removed
Changes to packages/x86_64-linux/gcc-cross-x86_64 (sysroot):
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-cpp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-15.2.0 was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-dump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-tool was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-lto-dump was added
  /usr/libexec/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1plus was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/collect2 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/g++-mapper-server was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixincl was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc.sh was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/liblto_plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto-wrapper was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gengtype was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/strip was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/x86_64-poky-linux/gcc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/adxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ammintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxavx512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxbf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxcomplexintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxmovrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtf32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtileintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtransposeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2copyintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512cdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512dqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vldqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxneconvertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cet.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cldemoteintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clflushoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clwbintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clzerointrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cpuid.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cross-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/emmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/enqcmdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/f16cintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/float.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fma4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fxsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/gfniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/hresetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ia32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/immintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/iso646.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/keylockerintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lwpintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lzcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm3dnow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm_malloc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movdirintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/nmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pconfigintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pkuintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/popcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath_weak.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/raointintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rdseedintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rtmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/serializeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sgxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sha512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/shaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm3intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/smmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdalign.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdatomic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdbool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdckdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stddef.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdfix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint-gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdnoreturn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/syslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tbmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/uintrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/unwind.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/usermsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vaesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/varargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/waitpkgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86gprintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xopintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavecintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xtestintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/macro_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders.conf was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gtype.state was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/addresses.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/align.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/all-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/access-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analysis-plan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-language.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-logging.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-selftests.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/bar-chart.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-details.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-event.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/complexity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/constraint-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/diagnostic-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/engine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/event-loc-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/exploded-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/feasible-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/function-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/inlining-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/known-function-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/pending-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-point.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-state.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/ranges.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/record-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/sm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/state-purge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/store.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/supergraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/svalue.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/symbol.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/trimmed-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ansidecl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/array-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/asan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attribs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-host.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/avoid-store-forwarding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/backend.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/basic-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/b-header-vars was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-types.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/calls.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ccmp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c/c-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfganal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfghooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cgraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cif-code.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/color-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/conditions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/configargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/elfos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/biarch64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/convert.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coretypes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coverage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/operators.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppdefault.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cpplib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/crc-verification.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cselib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ctfc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/data-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ddg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/debug.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/defaults.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/df.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dfp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-buffer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-sarif.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-highlight-colors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-label-effects.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-macro-unwinding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-output-file.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/digraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dojump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dominance.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/domwalk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/double-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dump-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dumpfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2codeview.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/edit-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/errors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/escaped_string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/et-forest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/except.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/explow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expmed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-find.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/filenames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fixed-value.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flag-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function-abi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-io.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/generic-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gengtype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/genrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gensupport.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-lower-bitint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-phi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/glimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphite.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphviz.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsstruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyms.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hashtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-table.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hwint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ifcvt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/inchash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/incpath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/input.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-addr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-codes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-opinit.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/intl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-cp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-locality-cloning.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-strub.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/is-a.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json-parsing.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/label-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lazy-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lcm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics++.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libiberty.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libsarifreplay.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limitx.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/line-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lockfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-compress.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-ltrans-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/make-unique.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/md5.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memmodel.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memory-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mode-classes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mux-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-expand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-general.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-offload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-selectors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/options.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-problem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/output.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pair-fusion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/passes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass-instances.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass_manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pointer-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/prefix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-format-impl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile-count.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op-mixed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-md.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/real.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/realmpfr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/recog.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regcprop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reg-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regrename.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/resource.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlanal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-error.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sanitizer.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sarif-spec-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sched-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sese.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/signop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/simple-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sparseset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sreal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/statistics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stmt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stor-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stringpool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/substring-locations.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/system.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-globals.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-insns.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/targhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/text-range-label.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm_p.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm-preds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/toplev.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tracer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/trans-mem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-affine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-check.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-eh.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-nested.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-sra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/treestruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tristate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsystem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typeclass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ubsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/unique-argv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/valtrack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-prof.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-relation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/varasm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vr-values.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/xcoff.h was added
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-cpp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-15.2.0 was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-dump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-tool was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-lto-dump was removed
  /usr/libexec/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1plus was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/collect2 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/g++-mapper-server was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixincl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/liblto_plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto-wrapper was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gengtype was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/strip was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/x86_64-poky-linux-musl/gcc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/adxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ammintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxavx512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxbf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxmovrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtf32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtileintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtransposeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2copyintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512cdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512dqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cet.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cldemoteintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clflushoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clwbintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clzerointrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cpuid.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cross-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/emmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/enqcmdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/f16cintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/float.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fma4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fxsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/gfniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/hresetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ia32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/immintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/iso646.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/keylockerintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lwpintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lzcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm3dnow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm_malloc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movdirintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/nmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pconfigintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pkuintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/popcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath_weak.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/raointintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rdseedintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rtmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/serializeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sgxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sha512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/shaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm3intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/smmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdalign.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdatomic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdbool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdckdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stddef.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdfix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint-gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdnoreturn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/syslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tbmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/uintrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/unwind.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/usermsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vaesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/varargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/waitpkgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86gprintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xopintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavecintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xtestintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/macro_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gtype.state was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/addresses.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/align.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/all-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/access-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analysis-plan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-language.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-logging.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-selftests.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/bar-chart.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-details.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-event.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/complexity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/constraint-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/diagnostic-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/engine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/event-loc-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/exploded-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/feasible-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/function-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/inlining-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/known-function-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/pending-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-point.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-state.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/ranges.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/record-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/sm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/state-purge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/store.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/supergraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/svalue.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/symbol.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/trimmed-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/array-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/asan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attribs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-host.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/avoid-store-forwarding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/backend.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/basic-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/b-header-vars was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/calls.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ccmp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c/c-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfganal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cgraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cif-code.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/color-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/conditions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/configargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/biarch64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/convert.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coretypes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coverage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cpplib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/crc-verification.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cselib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ctfc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ddg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/debug.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/defaults.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/df.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dfp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-buffer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-sarif.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-highlight-colors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-label-effects.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-macro-unwinding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-output-file.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/digraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dojump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dominance.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/domwalk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/double-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dump-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2codeview.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/edit-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/errors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/et-forest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/except.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/explow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expmed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-find.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/filenames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flag-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function-abi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/generic-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gengtype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/genrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gensupport.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-lower-bitint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-phi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/glimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphite.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphviz.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyms.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hashtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-table.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hwint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/inchash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/incpath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/input.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-opinit.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/intl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-cp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-locality-cloning.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-strub.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/is-a.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json-parsing.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/label-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lazy-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lcm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics++.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libiberty.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libsarifreplay.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limitx.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/line-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lockfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-ltrans-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/make-unique.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/md5.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memmodel.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memory-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-general.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-selectors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/options.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/output.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pair-fusion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/passes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/prefix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-format-impl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile-count.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op-mixed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-md.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/real.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/recog.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regcprop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regrename.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/resource.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sarif-spec-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sched-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sese.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/signop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/simple-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sparseset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sreal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/statistics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stmt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stringpool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/system.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-globals.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-insns.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/targhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/text-range-label.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm_p.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/toplev.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tracer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-check.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/treestruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tristate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsystem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typeclass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ubsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/unique-argv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/valtrack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-prof.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-relation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/varasm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vr-values.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/xcoff.h was removed

--===============6977870394388332508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (0 cached, 947 parsed). 1945 targets, 54 skipped, 0 masked, 0 errors.
Removing 71 recipes from the qemux86_64 sysroot...done.
Removing 58 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-1b0364cd42bd1c8c7515b52b9c3487231f838ed0"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:1b0364cd42bd1c8c7515b52b9c3487231f838ed0"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 548 Local 535 Mirrors 0 Missed 13 Current 252 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 260 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 263 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 264 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 308 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 319 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libsolv/libsolv_0.7.35.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_populate_lic_setscene)
NOTE: recipe librepo-1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsolv-0.7.35-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmodulemd-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdnf-0.75.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe librepo-1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmodulemd-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 336 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libsolv-0.7.35-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 344 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libsolv/libsolv_0.7.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libsolv/libsolv_0.7.35.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_create_spdx_setscene)
NOTE: recipe libdnf-0.75.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 347 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_recipe_qa_setscene)
NOTE: recipe librepo-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librepo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodulemd-2.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodulemd-2.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsolv-0.7.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.35-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libdnf-0.75.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe librepo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 355 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libmodulemd-2.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_create_spdx_setscene)
NOTE: recipe libdnf-0.75.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsolv-0.7.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodulemd-2.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 364 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe librepo-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gpgme-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/librepo/librepo_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsolv-0.7.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 381 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 385 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: recipe gpgme-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librepo-1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 398 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gpgme-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 399 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 421 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librepo-1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 431 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libsolv/libsolv_0.7.35.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-1_4.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmodulemd-2.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 441 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rpm-1_4.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 479 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 480 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gpgme-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 481 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gpgme/gpgme_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsolv-0.7.35-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodulemd-2.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-1_4.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 487 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 488 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.4.8.bb:do_packagedata_setscene)
NOTE: recipe gpgme-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libassuan-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.35-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 989 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_fetch)
NOTE: Running setscene task 491 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe gpgme-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 502 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdnf-0.75.0-r0: task do_fetch: Started
NOTE: recipe libassuan-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libassuan/libassuan_3.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 509 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1093 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 518 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libassuan-3.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lua-5.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 521 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 527 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libdnf-0.75.0-r0: task do_fetch: Succeeded
NOTE: recipe libassuan-3.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 530 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 532 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe lua-5.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 539 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 543 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 546 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.4.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 551 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 553 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 564 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.4.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 566 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 572 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lua-5.4.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 576 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 579 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 584 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 592 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 593 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 597 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 602 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 606 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 608 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 619 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 622 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 623 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 641 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 644 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 646 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 648 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 661 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 666 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 669 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 670 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 672 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 674 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 677 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 679 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 680 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 682 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 688 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 692 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 695 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 696 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 697 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 699 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 703 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 704 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 711 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 718 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 719 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 729 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 734 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 737 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 739 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 742 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1372 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_unpack)
NOTE: Running task 1376 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1377 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdnf-0.75.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1394 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1401 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1402 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 769 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libdnf-0.75.0-r0: task do_unpack: Succeeded
NOTE: Running task 1403 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1404 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdnf-0.75.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdnf-0.75.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 771 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 775 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running task 1407 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1408 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_generate_toolchain_file)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libdnf-0.75.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdnf-0.75.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libdnf-0.75.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe libdnf-0.75.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_deploy_source_date_epoch unihash changed to 797d88e59b7d5c89ca588392f1289e356f5b798ea557767eac150dcc1892e616
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 784 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1424 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 799 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2060 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2203 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_collect_spdx_deps)
NOTE: recipe libdnf-0.75.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdnf-0.75.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2204 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.75.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdnf-0.75.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2205 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_configure)
NOTE: recipe libdnf-0.75.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe libdnf-0.75.0-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2223 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_compile)
NOTE: recipe libdnf-0.75.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysr
 oot/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong  
 -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wuni
 nitialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/log.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/log.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/log.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/log.cpp
| [2/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysr
 oot/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong  
 -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wuni
 nitialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-advisorypkg.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-advisorypkg.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-advisorypkg.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-advisorypkg.cpp
| [3/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysr
 oot/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong  
 -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wuni
 nitialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-advisory.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-advisory.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-advisory.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-advisory.cpp
| [4/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysr
 oot/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong  
 -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wuni
 nitialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/nsvcap.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/nsvcap.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/nsvcap.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/nsvcap.cpp
| [5/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysr
 oot/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong  
 -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wuni
 nitialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/nevra.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/nevra.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/nevra.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/nevra.cpp
| [6/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysr
 oot/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong  
 -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wuni
 nitialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/hy-selector.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/hy-selector.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/hy-selector.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/hy-selector.cpp
| [7/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysr
 oot/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong  
 -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wuni
 nitialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/hy-util.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/hy-util.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/hy-util.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/hy-util.cpp
| [8/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysr
 oot/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong  
 -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wuni
 nitialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/hy-query.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/hy-query.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/hy-query.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/hy-query.cpp
| [9/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysr
 oot/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong  
 -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wuni
 nitialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-db.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-db.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-db.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-db.cpp
| [10/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/hy-packageset.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/hy-packageset.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/hy-packageset.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/hy-packageset.cpp
| [11/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-reldep.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-reldep.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-reldep.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-reldep.cpp
| [12/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-reldep-list.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-reldep-list.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-reldep-list.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-reldep-list.cpp
| [13/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-advisoryref.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-advisoryref.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-advisoryref.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-advisoryref.cpp
| [14/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/hy-subject.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/hy-subject.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/hy-subject.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/hy-subject.cpp
| [15/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-keyring.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-keyring.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-keyring.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-keyring.cpp
| [16/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/hy-goal.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/hy-goal.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/hy-goal.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/hy-goal.cpp
| [17/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-conf.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-conf.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-conf.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-conf.cpp
| [18/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-lock.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-lock.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-lock.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-lock.cpp
| [19/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-packagedelta.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-packagedelta.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-packagedelta.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-packagedelta.cpp
| [20/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/hy-package.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/hy-package.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/hy-package.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/hy-package.cpp
| [21/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/hy-iutil.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/hy-iutil.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/hy-iutil.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/hy-iutil.cpp
| [22/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-utils.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-utils.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-utils.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-utils.cpp
| [23/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-rpmts.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-rpmts.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-rpmts.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-rpmts.cpp
| [24/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-package.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-package.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-package.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-package.cpp
| [25/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/Item.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/Item.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/Item.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/Item.cpp
| [26/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-repo-loader.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-repo-loader.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-repo-loader.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo-loader.cpp
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo-loader.cpp: In function 'gboolean dnf_repo_loader_get_repos_removable(DnfRepoLoader*, GError**)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo-loader.cpp:249:31: warning: 'GList* g_unix_mounts_get(guint64*)' is deprecated: Use 'g_unix_mount_entries_get' instead [-Wdeprecated-declarations]
|   249 |     mounts = g_unix_mounts_get(NULL);
|       |              ~~~~~~~~~~~~~~~~~^~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo-loader.cpp:37:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/gio-unix-2.0/gio/gunixmounts.h:199:16: note: declared here
|   199 | GList *        g_unix_mounts_get                    (guint64            *time_read);
|       |                ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo-loader.cpp:252:38: warning: 'gboolean g_unix_mount_is_readonly(GUnixMountEntry*)' is deprecated: Use 'g_unix_mount_entry_is_readonly' instead [-Wdeprecated-declarations]
|   252 |         if (!g_unix_mount_is_readonly(e))
|       |              ~~~~~~~~~~~~~~~~~~~~~~~~^~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/gio-unix-2.0/gio/gunixmounts.h:125:16: note: declared here
|   125 | gboolean       g_unix_mount_is_readonly             (GUnixMountEntry    *mount_entry);
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo-loader.cpp:254:47: warning: 'const char* g_unix_mount_get_fs_type(GUnixMountEntry*)' is deprecated: Use 'g_unix_mount_entry_get_fs_type' instead [-Wdeprecated-declarations]
|   254 |         if (g_strcmp0(g_unix_mount_get_fs_type(e), "iso9660") != 0)
|       |                       ~~~~~~~~~~~~~~~~~~~~~~~~^~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/gio-unix-2.0/gio/gunixmounts.h:115:16: note: declared here
|   115 | const char *   g_unix_mount_get_fs_type             (GUnixMountEntry    *mount_entry);
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo-loader.cpp:257:78: warning: 'const char* g_unix_mount_get_mount_path(GUnixMountEntry*)' is deprecated: Use 'g_unix_mount_entry_get_mount_path' instead [-Wdeprecated-declarations]
|   257 |                                                   g_unix_mount_get_mount_path(e),
|       |                                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/gio-unix-2.0/gio/gunixmounts.h:100:16: note: declared here
|   100 | const char *   g_unix_mount_get_mount_path          (GUnixMountEntry    *mount_entry);
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo-loader.cpp:264:35: warning: 'void g_unix_mount_free(GUnixMountEntry*)' is deprecated: Use 'g_unix_mount_entry_free' instead [-Wdeprecated-declarations]
|   264 |     g_list_foreach(mounts,(GFunc) g_unix_mount_free, NULL);
|       |                                   ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/gio-unix-2.0/gio/gunixmounts.h:78:16: note: declared here
|    78 | void           g_unix_mount_free                    (GUnixMountEntry    *mount_entry);
|       |                ^~~~~~~~~~~~~~~~~
| [27/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-state.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-state.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-state.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-state.cpp
| [28/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-goal.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-goal.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-goal.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-goal.cpp
| [29/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-repo.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-repo.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-repo.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo.cpp
| FAILED: [code=1] libdnf/CMakeFiles/libdnf.dir/dnf-repo.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/
 include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong  -O2 -D_F
 ORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wuninitializ
 ed -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-repo.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-repo.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-repo.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo.cpp
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo.cpp: In function 'void dnf_repo_conf_load_overrides(DnfRepo*, const char*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-repo.cpp:971:50: error: 'FNM_EXTMATCH' was not declared in this scope; did you mean 'FNM_NOMATCH'?
|   971 |             if (fnmatch(repo_id_pattern, repoId, FNM_EXTMATCH) != 0) {
|       |                                                  ^~~~~~~~~~~~
|       |                                                  FNM_NOMATCH
| [30/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/TransactionItemReason.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/TransactionItemReason.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/TransactionItemReason.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/TransactionItemReason.cpp
| [31/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/private/Repo.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/private/Repo.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/private/Repo.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/private/Repo.cpp
| [32/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/TransactionItem.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/TransactionItem.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/TransactionItem.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/TransactionItem.cpp
| [33/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/Transaction.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/Transaction.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/Transaction.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/Transaction.cpp
| [34/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/CompsEnvironmentItem.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/CompsEnvironmentItem.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/CompsEnvironmentItem.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/CompsEnvironmentItem.cpp
| [35/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-sack.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-sack.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-sack.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-sack.cpp
| [36/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/private/Transaction.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/private/Transaction.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/private/Transaction.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/private/Transaction.cpp
| [37/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/CompsGroupItem.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/CompsGroupItem.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/CompsGroupItem.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/CompsGroupItem.cpp
| [38/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-transaction.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-transaction.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-transaction.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-transaction.cpp
| [39/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/RPMItem.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/RPMItem.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/RPMItem.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/RPMItem.cpp
| [40/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/MergedTransaction.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/MergedTransaction.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/MergedTransaction.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/MergedTransaction.cpp
| [41/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/Swdb.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/Swdb.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/Swdb.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/Swdb.cpp
| [42/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/goal/Goal.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/goal/Goal.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/goal/Goal.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/goal/Goal.cpp
| [43/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/transaction/Transformer.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/transaction/Transformer.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/transaction/Transformer.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction/Transformer.cpp
| [44/185] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot -DDNF5_CONF_DROP_IN -DDNF5_CONF_REPOS_OVERRIDE -DGETTEXT_DOMAIN=\"libdnf\" -DG_LOG_DOMAIN=\"libdnf\" -DLIBDNF_UNSTABLE_API -DLIBSOLV_SOLVABLE_PREPEND_DEP -DPACKAGE_VERSION=\"0.75.0\" -DTESTDATADIR=\"/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/data/tests\" -Dlibdnf_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/utils -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sys
 root/usr/include/gio-unix-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libmount -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/blkid -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/glib-2.0 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/lib/glib-2.0/include -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/json-c -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot/usr/include/libxml2 -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/transaction -m64 -march=x86-64-v3 -fstack-protector-strong 
  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot  -O2 -g  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build=/usr/src/debug/libdnf/0.75.0  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot=  -ffile-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++11 -Wmissing-declarations -fPIC -Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings -Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare -Wtype-limits -Wun
 initialized -Wall -Wl,--as-needed -MD -MT libdnf/CMakeFiles/libdnf.dir/dnf-context.cpp.o -MF libdnf/CMakeFiles/libdnf.dir/dnf-context.cpp.o.d -o libdnf/CMakeFiles/libdnf.dir/dnf-context.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/sources/libdnf-0.75.0/libdnf/dnf-context.cpp
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/temp/run.do_compile.1769734:173 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/temp/run.do_compile.1769734, line 173
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/temp/run.do_compile.1769734, line 160
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/temp/run.do_compile.1769734, line 155
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/temp/run.do_compile.1769734, line 186
NOTE: recipe libdnf-0.75.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2212 tasks of which 2194 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115093000.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115093000.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/temp/log.do_compile.1769734
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: libdnf-0.75.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/temp/run.do_compile.1769734' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libdnf/0.75.0/temp/log.do_compile.1769734
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libdnf/libdnf_0.75.0.bb:do_compile) failed with exit code '1'

--===============6977870394388332508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/libdnf (sysroot):
  /usr/lib/python3.13/site-packages/libdnf-0.74.0.dist-info moved to /usr/lib/python3.13/site-packages/libdnf-0.75.0.dist-info
Changes to packages/x86_64-linux/binutils-cross-x86_64 (sysroot):
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-addr2line was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-as was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++filt was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-elfedit was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gprof was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.bfd was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objcopy was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-readelf was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-size was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strings was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/libdep.so was added
  /usr/lib/x86_64-poky-linux/ldscripts was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xder was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xscer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xser was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xswer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xder was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xscer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xser was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xswer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xder was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xscer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xser was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xswer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdcer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xder was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xscer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xser was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xswer was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xwer was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xer was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/stamp was added
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-addr2line was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-as was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++filt was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-elfedit was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gprof was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objcopy was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objdump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-readelf was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-size was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strings was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/libdep.so was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xder was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xscer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xser was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xswer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xder was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xscer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xser was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xswer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xder was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xscer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xser was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xswer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdcer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xder was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xscer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xser was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xswer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xwer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xer was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/stamp was removed
Changes to packages/x86_64-linux/gcc-cross-x86_64 (sysroot):
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-cpp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-15.2.0 was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-dump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-tool was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-lto-dump was added
  /usr/libexec/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1plus was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/collect2 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/g++-mapper-server was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixincl was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc.sh was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/liblto_plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto-wrapper was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gengtype was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/strip was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/x86_64-poky-linux/gcc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/adxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ammintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxavx512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxbf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxcomplexintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxmovrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtf32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtileintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtransposeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2copyintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512cdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512dqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vldqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxneconvertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cet.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cldemoteintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clflushoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clwbintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clzerointrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cpuid.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cross-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/emmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/enqcmdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/f16cintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/float.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fma4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fxsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/gfniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/hresetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ia32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/immintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/iso646.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/keylockerintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lwpintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lzcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm3dnow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm_malloc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movdirintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/nmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pconfigintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pkuintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/popcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath_weak.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/raointintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rdseedintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rtmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/serializeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sgxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sha512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/shaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm3intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/smmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdalign.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdatomic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdbool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdckdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stddef.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdfix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint-gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdnoreturn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/syslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tbmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/uintrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/unwind.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/usermsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vaesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/varargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/waitpkgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86gprintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xopintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavecintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xtestintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/macro_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders.conf was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gtype.state was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/addresses.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/align.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/all-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/access-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analysis-plan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-language.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-logging.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-selftests.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/bar-chart.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-details.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-event.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/complexity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/constraint-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/diagnostic-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/engine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/event-loc-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/exploded-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/feasible-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/function-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/inlining-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/known-function-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/pending-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-point.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-state.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/ranges.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/record-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/sm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/state-purge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/store.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/supergraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/svalue.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/symbol.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/trimmed-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ansidecl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/array-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/asan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attribs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-host.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/avoid-store-forwarding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/backend.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/basic-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/b-header-vars was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-types.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/calls.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ccmp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c/c-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfganal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfghooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cgraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cif-code.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/color-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/conditions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/configargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/elfos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/biarch64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/convert.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coretypes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coverage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/operators.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppdefault.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cpplib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/crc-verification.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cselib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ctfc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/data-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ddg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/debug.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/defaults.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/df.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dfp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-buffer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-sarif.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-highlight-colors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-label-effects.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-macro-unwinding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-output-file.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/digraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dojump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dominance.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/domwalk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/double-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dump-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dumpfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2codeview.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/edit-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/errors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/escaped_string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/et-forest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/except.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/explow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expmed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-find.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/filenames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fixed-value.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flag-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function-abi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-io.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/generic-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gengtype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/genrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gensupport.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-lower-bitint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-phi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/glimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphite.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphviz.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsstruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyms.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hashtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-table.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hwint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ifcvt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/inchash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/incpath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/input.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-addr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-codes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-opinit.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/intl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-cp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-locality-cloning.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-strub.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/is-a.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json-parsing.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/label-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lazy-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lcm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics++.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libiberty.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libsarifreplay.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limitx.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/line-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lockfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-compress.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-ltrans-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/make-unique.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/md5.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memmodel.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memory-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mode-classes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mux-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-expand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-general.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-offload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-selectors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/options.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-problem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/output.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pair-fusion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/passes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass-instances.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass_manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pointer-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/prefix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-format-impl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile-count.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op-mixed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-md.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/real.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/realmpfr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/recog.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regcprop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reg-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regrename.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/resource.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlanal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-error.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sanitizer.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sarif-spec-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sched-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sese.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/signop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/simple-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sparseset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sreal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/statistics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stmt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stor-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stringpool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/substring-locations.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/system.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-globals.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-insns.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/targhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/text-range-label.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm_p.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm-preds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/toplev.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tracer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/trans-mem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-affine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-check.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-eh.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-nested.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-sra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/treestruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tristate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsystem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typeclass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ubsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/unique-argv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/valtrack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-prof.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-relation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/varasm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vr-values.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/xcoff.h was added
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-cpp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-15.2.0 was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-dump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-tool was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-lto-dump was removed
  /usr/libexec/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1plus was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/collect2 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/g++-mapper-server was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixincl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/liblto_plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto-wrapper was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gengtype was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/strip was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/x86_64-poky-linux-musl/gcc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/adxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ammintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxavx512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxbf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxmovrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtf32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtileintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtransposeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2copyintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512cdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512dqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cet.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cldemoteintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clflushoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clwbintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clzerointrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cpuid.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cross-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/emmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/enqcmdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/f16cintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/float.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fma4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fxsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/gfniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/hresetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ia32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/immintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/iso646.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/keylockerintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lwpintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lzcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm3dnow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm_malloc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movdirintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/nmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pconfigintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pkuintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/popcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath_weak.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/raointintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rdseedintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rtmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/serializeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sgxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sha512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/shaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm3intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/smmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdalign.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdatomic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdbool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdckdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stddef.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdfix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint-gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdnoreturn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/syslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tbmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/uintrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/unwind.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/usermsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vaesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/varargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/waitpkgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86gprintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xopintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavecintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xtestintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/macro_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gtype.state was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/addresses.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/align.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/all-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/access-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analysis-plan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-language.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-logging.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-selftests.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/bar-chart.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-details.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-event.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/complexity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/constraint-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/diagnostic-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/engine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/event-loc-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/exploded-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/feasible-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/function-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/inlining-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/known-function-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/pending-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-point.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-state.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/ranges.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/record-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/sm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/state-purge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/store.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/supergraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/svalue.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/symbol.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/trimmed-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/array-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/asan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attribs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-host.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/avoid-store-forwarding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/backend.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/basic-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/b-header-vars was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/calls.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ccmp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c/c-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfganal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cgraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cif-code.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/color-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/conditions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/configargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/biarch64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/convert.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coretypes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coverage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cpplib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/crc-verification.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cselib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ctfc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ddg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/debug.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/defaults.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/df.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dfp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-buffer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-sarif.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-highlight-colors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-label-effects.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-macro-unwinding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-output-file.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/digraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dojump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dominance.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/domwalk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/double-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dump-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2codeview.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/edit-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/errors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/et-forest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/except.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/explow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expmed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-find.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/filenames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flag-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function-abi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/generic-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gengtype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/genrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gensupport.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-lower-bitint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-phi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/glimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphite.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphviz.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyms.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hashtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-table.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hwint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/inchash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/incpath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/input.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-opinit.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/intl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-cp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-locality-cloning.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-strub.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/is-a.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json-parsing.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/label-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lazy-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lcm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics++.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libiberty.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libsarifreplay.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limitx.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/line-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lockfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-ltrans-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/make-unique.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/md5.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memmodel.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memory-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-general.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-selectors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/options.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/output.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pair-fusion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/passes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/prefix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-format-impl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile-count.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op-mixed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-md.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/real.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/recog.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regcprop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regrename.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/resource.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sarif-spec-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sched-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sese.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/signop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/simple-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sparseset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sreal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/statistics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stmt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stringpool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/system.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-globals.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-insns.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/targhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/text-range-label.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm_p.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/toplev.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tracer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-check.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/treestruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tristate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsystem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typeclass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ubsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/unique-argv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/valtrack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-prof.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-relation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/varasm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vr-values.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/xcoff.h was removed

--===============6977870394388332508==--

