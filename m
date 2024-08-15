Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3F0C52D7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.131089.1723748333419773361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PR2UoiJ/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=xN4ECsr9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010191576833ab-64066788-6e9c-4406-a233-129bf79cb452-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I99zkn/NYU9u+YlILK59oeZIEDN7qfrrqYKCkFH3Qas=;
	b=PR2UoiJ/y4YxhFOft6VjCWSoX3FOQ3wErYSlGuTSmOHlV+F8M+ukeXKbi/8c/qUg
	GKG8suyFsDAYgi5RvejplU8NIFtxHNQkY7aHXCr4HPhHOPskGWwM93jSgJ4dI82WGO/
	mCJzi/i3/yK+HySas72s5MqAezFV0z9IMLorOPcw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I99zkn/NYU9u+YlILK59oeZIEDN7qfrrqYKCkFH3Qas=;
	b=xN4ECsr9lK47eYOU1xA4KQJ1o81Poiv9GvGnY078WCyuA8lw6ODl+eP6GiIlpWBP
	Z0rXcnx70WnsYzEMy4xT1JmAcrv2zzNWAwss1M+YgEYhKQKmY/Rr2z/O9+dY/bhfBsu
	ZpmewkRo0g5DV7E2hZu3ygOvjDU6Kcl7gf7le0Ic=
Content-Type: multipart/mixed; boundary="===============8832500694646403100=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake-native,cmake: upgrading to 3.30.2,3.30.2 SUCCEEDED
Message-ID: <01010191576833ab-64066788-6e9c-4406-a233-129bf79cb452-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203341

--===============8832500694646403100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake-native,cmake* to *3.30.2,3.30.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-native-cmake-upgrade-3.30.1-3.30.2-3.30.1-3.30.patch
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
From 51505e963348277122d586c9dbd9100987bda1b2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 06:17:18 +0000
Subject: [PATCH] cmake-native,cmake: upgrade 3.30.1 -> 3.30.2,3.30.1 -> 3.30.2

---
 .../{cmake-native_3.30.1.bb => cmake-native_3.30.2.bb}     | 0
 meta/recipes-devtools/cmake/cmake.inc                      | 2 +-
 .../cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch    | 7 ++-----
 ...able-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 2 +-
 .../cmake/{cmake_3.30.1.bb => cmake_3.30.2.bb}             | 0
 5 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.30.1.bb => cmake-native_3.30.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.30.1.bb => cmake_3.30.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.30.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.30.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.30.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.30.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 604a22a2f0..b88a4e4bc6 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "df9b3c53e3ce84c3c1b7c253e5ceff7d8d1f084ff0673d048f260e04ccb346e1"
+SRC_URI[sha256sum] = "46074c781eccebc433e98f0bbfa265ca3fd4381f245ca3b140e7711531d60db2"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 090f441f0f..7dc07582da 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From a2cd906c36a04c8ce5a0095ae53892902b30d728 Mon Sep 17 00:00:00 2001
+From 5e624d82c2838fec2f41ebec124f74aacff9e61f Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -22,7 +22,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index b766aee425..34ae7d2a39 100644
+index b766aee4..34ae7d2a 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
 @@ -94,7 +94,7 @@ set(USE_ECH OFF)
@@ -34,6 +34,3 @@ index b766aee425..34ae7d2a39 100644
  set(USE_NGTCP2 OFF)
  set(USE_OPENSSL_QUIC OFF)
  set(USE_QUICHE OFF)
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index af164084d0..8788cc7964 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 2d3f6933f78d393514a48f8222ac8c3c39cb5fc7 Mon Sep 17 00:00:00 2001
+From b97f7dbb2637c6da772833c93bedc8be77520fb9 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.30.1.bb b/meta/recipes-devtools/cmake/cmake_3.30.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.30.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.30.2.bb
-- 
2.44.0


--===============8832500694646403100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cmake/cmake-bash-completion: PKGV changed from 3.30.1 [default] to 3.30.2 [default]
packages/core2-64-poky-linux/cmake/cmake-bash-completion: PV changed from "3.30.1" to "3.30.2"
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1051464672 to 1051459208 (-0%)
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGV changed from 3.30.1 [default] to 3.30.2 [default]
packages/core2-64-poky-linux/cmake/cmake-dbg: PV changed from "3.30.1" to "3.30.2"
packages/core2-64-poky-linux/cmake/cmake-dev: PKGV changed from 3.30.1 [default] to 3.30.2 [default]
packages/core2-64-poky-linux/cmake/cmake-dev: PV changed from "3.30.1" to "3.30.2"
packages/core2-64-poky-linux/cmake/cmake-doc: PKGV changed from 3.30.1 [default] to 3.30.2 [default]
packages/core2-64-poky-linux/cmake/cmake-doc: PV changed from "3.30.1" to "3.30.2"
packages/core2-64-poky-linux/cmake/cmake-locale: PKGV changed from 3.30.1 [default] to 3.30.2 [default]
packages/core2-64-poky-linux/cmake/cmake-locale: PV changed from "3.30.1" to "3.30.2"
packages/core2-64-poky-linux/cmake/cmake-src: PKGSIZE changed from 10022920 to 10022979 (+0%)
packages/core2-64-poky-linux/cmake/cmake-src: PKGV changed from 3.30.1 [default] to 3.30.2 [default]
packages/core2-64-poky-linux/cmake/cmake-src: PV changed from "3.30.1" to "3.30.2"
packages/core2-64-poky-linux/cmake/cmake-staticdev: PKGV changed from 3.30.1 [default] to 3.30.2 [default]
packages/core2-64-poky-linux/cmake/cmake-staticdev: PV changed from "3.30.1" to "3.30.2"
packages/core2-64-poky-linux/cmake/cmake: PKGSIZE changed from 41422116 to 41423617 (+0%)
packages/core2-64-poky-linux/cmake/cmake: PKGV changed from 3.30.1 [default] to 3.30.2 [default]
packages/core2-64-poky-linux/cmake/cmake: PV changed from "3.30.1" to "3.30.2"
packages/core2-64-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v3.30/cmake-3.30.1.tar.gz" to "https://cmake.org/files/v3.30/cmake-3.30.2.tar.gz"
packages/core2-64-poky-linux/cmake: PKGV changed from 3.30.1 [default] to 3.30.2 [default]
packages/core2-64-poky-linux/cmake: PV changed from "3.30.1" to "3.30.2"
packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9422342 to 9620507 (+2%)

--===============8832500694646403100==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-native-cmake-upgrade-3.30.1-3.30.2-3.30.1-3.30.patch"

RnJvbSA1MTUwNWU5NjMzNDgyNzcxMjJkNTg2YzlkYmQ5MTAwOTg3YmRhMWIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMDY6MTc6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZS1uYXRpdmUsY21ha2U6IHVwZ3JhZGUgMy4zMC4xIC0+IDMuMzAuMiwzLjMwLjEgLT4gMy4z
MC4yCgotLS0KIC4uLi97Y21ha2UtbmF0aXZlXzMuMzAuMS5iYiA9PiBjbWFrZS1uYXRpdmVfMy4z
MC4yLmJifSAgICAgfCAwCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jICAg
ICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL2NtYWtlLzAwMDEtQ01ha2VMaXN0cy50eHQt
ZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCAgICB8IDcgKystLS0tLQogLi4uYWJsZS11c2Utb2Yt
ZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLS5wYXRjaCB8IDIgKy0KIC4uLi9j
bWFrZS97Y21ha2VfMy4zMC4xLmJiID0+IGNtYWtlXzMuMzAuMi5iYn0gICAgICAgICAgICAgfCAw
CiA1IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlLW5hdGl2ZV8zLjMwLjEuYmIgPT4g
Y21ha2UtbmF0aXZlXzMuMzAuMi5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NtYWtlL3tjbWFrZV8zLjMwLjEuYmIgPT4gY21ha2VfMy4zMC4yLmJifSAoMTAwJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzMuMzAu
MS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfMy4zMC4yLmJi
CnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2UtbmF0aXZlXzMuMzAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMwLjIuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uv
Y21ha2UuaW5jCmluZGV4IDYwNGEyMmEyZjAuLmI4OGE0ZTRiYzYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2NtYWtlL2NtYWtlLmluYwpAQCAtMTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9O
ID0gIiR7QCcuJy5qb2luKGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VS
SSA9ICJodHRwczovL2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFr
ZS0ke1BWfS50YXIuZ3ogXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGY5YjNjNTNlM2Nl
ODRjM2MxYjdjMjUzZTVjZWZmN2Q4ZDFmMDg0ZmYwNjczZDA0OGYyNjBlMDRjY2IzNDZlMSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI0NjA3NGM3ODFlY2NlYmM0MzNlOThmMGJiZmEyNjVjYTNmZDQz
ODFmMjQ1Y2EzYjE0MGU3NzExNTMxZDYwZGIyIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJj
bWFrZS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0Vf
TkdIVFRQMi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNN
YWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2gKaW5kZXggMDkwZjQ0MWYwZi4u
N2RjMDc1ODJkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
LzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1kaXNhYmxl
LVVTRV9OR0hUVFAyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMmNkOTA2YzM2YTA0Yzhj
ZTVhMDA5NWFlNTM4OTI5MDJiMzBkNzI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1
ZTYyNGQ4MmMyODM4ZmVjMmY0MWViZWMxMjRmNzRhYWNmZjllNjFmIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4K
IERhdGU6IFdlZCwgMjggRGVjIDIwMjIgMTc6NTE6MjcgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
Q01ha2VMaXN0cy50eHQ6IGRpc2FibGUgVVNFX05HSFRUUDIKQEAgLTIyLDcgKzIyLDcgQEAgU2ln
bmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L1V0aWxpdGllcy9jbWN1cmwvQ01ha2VMaXN0cy50eHQgYi9VdGlsaXRpZXMvY21jdXJsL0NNYWtl
TGlzdHMudHh0Ci1pbmRleCBiNzY2YWVlNDI1Li4zNGFlN2QyYTM5IDEwMDY0NAoraW5kZXggYjc2
NmFlZTQuLjM0YWU3ZDJhIDEwMDY0NAogLS0tIGEvVXRpbGl0aWVzL2NtY3VybC9DTWFrZUxpc3Rz
LnR4dAogKysrIGIvVXRpbGl0aWVzL2NtY3VybC9DTWFrZUxpc3RzLnR4dAogQEAgLTk0LDcgKzk0
LDcgQEAgc2V0KFVTRV9FQ0ggT0ZGKQpAQCAtMzQsNiArMzQsMyBAQCBpbmRleCBiNzY2YWVlNDI1
Li4zNGFlN2QyYTM5IDEwMDY0NAogIHNldChVU0VfTkdUQ1AyIE9GRikKICBzZXQoVVNFX09QRU5T
U0xfUVVJQyBPRkYpCiAgc2V0KFVTRV9RVUlDSEUgT0ZGKQotLS0gCi0yLjM5LjIKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDUtRGlzYWJsZS11c2Ut
b2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDA1LURpc2FibGUtdXNlLW9mLWV4dDJmcy1leHQy
X2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC0ucGF0Y2gKaW5kZXggYWYxNjQwODRkMC4uODc4OGNj
Nzk2NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDUt
RGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwNS1EaXNhYmxlLXVz
ZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwtLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSAyZDNmNjkzM2Y3OGQzOTM1MTRhNDhmODIyMmFjOGMzYzM5Y2I1ZmM3IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiOTdmN2RiYjI2MzdjNmRhNzcyODMzYzkzYmVk
YzhiZTc3NTIwZmI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT3RhdmlvIFNhbHZh
ZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4KIERhdGU6IFRodSwgNSBKdWwgMjAxOCAxMDoy
ODowNCAtMDMwMAogU3ViamVjdDogW1BBVENIXSBEaXNhYmxlIHVzZSBvZiBleHQyZnMvZXh0Ml9m
cy5oIGJ5IGNtYWtlJ3MgaW50ZXJuYWwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZV8zLjMwLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21h
a2VfMy4zMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMC4yLmJiCi0tIAoyLjQ0LjAKCg==

--===============8832500694646403100==--

