Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13794CAC592
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:37 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.30912.1757937272588024136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rhBF2TgD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cFYVngqV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101994d3a03c0-3c01ba30-20e8-4c17-921b-a21c78bba27d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937271;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pLnpQ+rEozu+uE2qJnZL5wC9AL1HzOGkFSq/KRBnAw4=;
	b=rhBF2TgDvr9Xz0Sm9DiDdIzmrUI8i1MShckZn0dP5+i3JM63D2TErs30iEDNgC2D
	MWRkTVFfhHwtQxzfxtyGonxukvRaFfPBqLYBRhLGRJ9HmCHQYN25bYiEc1E1r/ALXhD
	qec6GodVo91FevVcVbXe4xkCDG/JUskwncDqJEv0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937271;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pLnpQ+rEozu+uE2qJnZL5wC9AL1HzOGkFSq/KRBnAw4=;
	b=cFYVngqV+wFM4HOkxW8CNKXQL0JbHj8A9Tsy3+EAvXJ4J03VpIJF198ZB3Yjye/W
	jyrfICElHztuJhUV4Fo9dA2SUt+A1c7LXkdLm1QQIgC7Z0Wv7inH60y4K1f1Ejo/QJ5
	9Ps9V2c9l9wUJxFqR3QaUp7rsXeit/+fbSlxHd6U=
Content-Type: multipart/mixed; boundary="===============8377567563878905974=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake-native,cmake: upgrading to 4.1.1,4.1.1 SUCCEEDED
Message-ID: <010101994d3a03c0-3c01ba30-20e8-4c17-921b-a21c78bba27d-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223404

--===============8377567563878905974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *4.1.1,4.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-4.1.0-4.1.1-4.1.0-4.1.1.patch
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
From 2877141d024bf5c95f4efb0c34adfb0c19215384 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 05:39:35 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 4.1.0 -> 4.1.1,4.1.0 -> 4.1.1

---
 .../cmake/{cmake-native_4.1.0.bb => cmake-native_4.1.1.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                       | 2 +-
 ...isable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch | 6 +++---
 .../cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch     | 6 +++---
 .../cmake/{cmake_4.1.0.bb => cmake_4.1.1.bb}                | 0
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.1.0.bb => cmake-native_4.1.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.1.0.bb => cmake_4.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.1.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.1.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.1.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index cbeeb31520..e0458cc491 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "81ee8170028865581a8e10eaf055afb620fa4baa0beb6387241241a975033508"
+SRC_URI[sha256sum] = "b29f6f19733aa224b7763507a108a427ed48c688e1faf22b29c44e1c30549282"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
index f31dce5644..9707c2c7c7 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
@@ -1,4 +1,4 @@
-From cf8210696ebbaff14612d845bc98fac447c0e6f5 Mon Sep 17 00:00:00 2001
+From 6aad45f1a96b7fe31d3b95d33eefa820693fd32c Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 158eea2c3e..9fb2c63aef 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From e0a1996a85dcb43d69d3c7daecab4da74599e5ba Mon Sep 17 00:00:00 2001
+From 23a5559244c097292397c9a93b1fdede7e9ad44e Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/cmake/cmake_4.1.0.bb b/meta/recipes-devtools/cmake/cmake_4.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.1.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.1.1.bb
-- 
2.47.1


--===============8377567563878905974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-bash-completion: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1137452960 to 1137380096 (-0%)
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-dbg: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-dev: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-doc: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-locale: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGSIZE changed from 10216894 to 10217311 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake-src: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-src: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake-staticdev: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake/cmake: PKGSIZE changed from 45151449 to 45160138 (+0%)
packages/x86-64-v3-poky-linux/cmake/cmake: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake/cmake: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake: PV changed from "4.1.0" to "4.1.1"
packages/x86-64-v3-poky-linux/cmake: PKGV changed from 4.1.0 [default] to 4.1.1 [default]
packages/x86-64-v3-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v4.1/cmake-4.1.0.tar.gz" to "https://cmake.org/files/v4.1/cmake-4.1.1.tar.gz"

--===============8377567563878905974==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-4.1.0-4.1.1-4.1.0-4.1.1.patch"

RnJvbSAyODc3MTQxZDAyNGJmNWM5NWY0ZWZiMGMzNGFkZmIwYzE5MjE1Mzg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDU6Mzk6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZS1uYXRpdmUsY21ha2U6IHVwZ3JhZGUgNC4xLjAgLT4gNC4xLjEsNC4xLjAgLT4gNC4xLjEK
Ci0tLQogLi4uL2NtYWtlL3tjbWFrZS1uYXRpdmVfNC4xLjAuYmIgPT4gY21ha2UtbmF0aXZlXzQu
MS4xLmJifSAgfCAwCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLmlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMu
aC1ieS1jbWFrZS1zLWludGVybmFsLnBhdGNoIHwgNiArKystLS0KIC4uLi9jbWFrZS8wMDAyLUNN
YWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2ggICAgIHwgNiArKystLS0KIC4u
Li9jbWFrZS97Y21ha2VfNC4xLjAuYmIgPT4gY21ha2VfNC4xLjEuYmJ9ICAgICAgICAgICAgICAg
IHwgMAogNSBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZS1uYXRpdmVfNC4xLjAuYmIg
PT4gY21ha2UtbmF0aXZlXzQuMS4xLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2Uve2NtYWtlXzQuMS4wLmJiID0+IGNtYWtlXzQuMS4xLmJifSAoMTAwJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzQuMS4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV80LjEuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nt
YWtlL2NtYWtlLW5hdGl2ZV80LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLW5hdGl2ZV80LjEuMS5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZS5pbmMKaW5kZXggY2JlZWIzMTUyMC4uZTA0NThjYzQ5MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2UuaW5jCkBAIC0xOSw3ICsxOSw3IEBAIENNQUtFX01BSk9SX1ZFUlNJT04gPSAi
JHtAJy4nLmpvaW4oZC5nZXRWYXIoJ1BWJykuc3BsaXQoJy4nKVswOjJdKX0iCiBTUkNfVVJJID0g
Imh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtFX01BSk9SX1ZFUlNJT059L2NtYWtlLSR7
UFZ9LnRhci5neiBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgxZWU4
MTcwMDI4ODY1NTgxYThlMTBlYWYwNTVhZmI2MjBmYTRiYWEwYmViNjM4NzI0MTI0MWE5NzUwMzM1
MDgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjI5ZjZmMTk3MzNhYTIyNGI3NzYzNTA3YTEwOGE0
MjdlZDQ4YzY4OGUxZmFmMjJiMjljNDRlMWMzMDU0OTI4MiIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVH
RVggPSAiY21ha2UtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLURpc2FibGUtdXNlLW9mLWV4dDJm
cy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZS8wMDAxLURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnkt
Y21ha2Utcy1pbnRlcm5hbC5wYXRjaAppbmRleCBmMzFkY2U1NjQ0Li45NzA3YzJjN2M3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1EaXNhYmxlLXVz
ZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtRGlzYWJsZS11c2Utb2YtZXh0MmZz
LWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBjZjgyMTA2OTZlYmJhZmYxNDYxMmQ4NDViYzk4ZmFjNDQ3YzBlNmY1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA2YWFkNDVmMWE5NmI3ZmUzMWQzYjk1ZDMzZWVmYTgyMDY5M2ZkMzJj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9A
b3NzeXN0ZW1zLmNvbS5icj4KIERhdGU6IFRodSwgNSBKdWwgMjAxOCAxMDoyODowNCAtMDMwMAog
U3ViamVjdDogW1BBVENIXSBEaXNhYmxlIHVzZSBvZiBleHQyZnMvZXh0Ml9mcy5oIGJ5IGNtYWtl
J3MgaW50ZXJuYWwKQEAgLTE4LDEwICsxOCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBPdGF2aW8gU2Fs
dmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9VdGlsaXRpZXMvY21saWJh
cmNoaXZlL0NNYWtlTGlzdHMudHh0IGIvVXRpbGl0aWVzL2NtbGliYXJjaGl2ZS9DTWFrZUxpc3Rz
LnR4dAotaW5kZXggMDRkOTg2YjZlYTdkOGRjMGJkN2U5MDlkNGU3YjRlNzNjOWUzNTQzNy4uMDE0
ZmU3ODA2M2Y3ZDMwYzlhNDk3MGI3Y2YzYWVlYWViMzZiY2RiYyAxMDA2NDQKK2luZGV4IGU2YWI1
ZGU5Li45MTM4ODdiNSAxMDA2NDQKIC0tLSBhL1V0aWxpdGllcy9jbWxpYmFyY2hpdmUvQ01ha2VM
aXN0cy50eHQKICsrKyBiL1V0aWxpdGllcy9jbWxpYmFyY2hpdmUvQ01ha2VMaXN0cy50eHQKLUBA
IC03NDUsMTIgKzc0NSw4IEBAIExBX0NIRUNLX0lOQ0xVREVfRklMRSgiY29weWZpbGUuaCIgSEFW
RV9DT1BZRklMRV9IKQorQEAgLTcyMCwxMiArNzIwLDggQEAgTEFfQ0hFQ0tfSU5DTFVERV9GSUxF
KCJjb3B5ZmlsZS5oIiBIQVZFX0NPUFlGSUxFX0gpCiAgTEFfQ0hFQ0tfSU5DTFVERV9GSUxFKCJk
aXJlY3QuaCIgSEFWRV9ESVJFQ1RfSCkKICBMQV9DSEVDS19JTkNMVURFX0ZJTEUoImRsZmNuLmgi
IEhBVkVfRExGQ05fSCkKICBMQV9DSEVDS19JTkNMVURFX0ZJTEUoImVycm5vLmgiIEhBVkVfRVJS
Tk9fSCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAy
LUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMi1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hU
VFAyLnBhdGNoCmluZGV4IDE1OGVlYTJjM2UuLjlmYjJjNjNhZWYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAyLUNNYWtlTGlzdHMudHh0LWRpc2FibGUt
VVNFX05HSFRUUDIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
LzAwMDItQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gZTBhMTk5NmE4NWRjYjQzZDY5ZDNjN2RhZWNhYjRkYTc0NTk5ZTViYSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjNhNTU1OTI0NGMwOTcyOTIzOTdjOWE5M2IxZmRl
ZGU3ZTlhZDQ0ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoYW5ncWluZyBMaSA8
Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDI4IERlYyAyMDIyIDE3OjUx
OjI3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBkaXNhYmxlIFVTRV9O
R0hUVFAyCkBAIC0yMiwxMCArMjIsMTAgQEAgU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4g
PHRnYW1ibGluQGJheWxpYnJlLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL1V0aWxpdGllcy9jbWN1cmwvQ01ha2VMaXN0
cy50eHQgYi9VdGlsaXRpZXMvY21jdXJsL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA3NWI1MTAyMDU5
ODQ4OTRmZmExMTQ2MWU3YWEwNGQzYzQ3OTcwOWI0Li44MzQ2MzA0MmQ4MmQ5YzdmMTc5MzI3NTNm
NDdjNDdiMTJhZWVjODViIDEwMDY0NAoraW5kZXggZGRjOTc1YzIuLmNmNjBhNDNlIDEwMDY0NAog
LS0tIGEvVXRpbGl0aWVzL2NtY3VybC9DTWFrZUxpc3RzLnR4dAogKysrIGIvVXRpbGl0aWVzL2Nt
Y3VybC9DTWFrZUxpc3RzLnR4dAotQEAgLTEwNSw3ICsxMDUsNyBAQCBzZXQoVVNFX0VDSCBPRkYp
CitAQCAtMTEwLDcgKzExMCw3IEBAIHNldChVU0VfRUNIIE9GRikKICBzZXQoVVNFX0hUVFBTUlIg
T0ZGKQogIHNldChVU0VfTElCSUROMiBPTikKICBzZXQoVVNFX0xJQlJUTVAgT0ZGKQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzQuMS4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlXzQuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAw
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfNC4xLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV80LjEuMS5iYgotLSAK
Mi40Ny4xCgo=

--===============8377567563878905974==--

