Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB06C35FE8
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:06 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.115625.1726410839505721212
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NUUXtvXZ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0zRd5CWT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010191f61ad202-f5de2d38-ebde-4761-be74-106d4c190bad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XxfgG1eHXriLBaVBO7iif3q9R4ghf0O5+AKo8TAsd6s=;
	b=NUUXtvXZ6Dd882mEHt5sqvLRUll3bRk6SBvcBCgcFHQAtaoHY1X+FiSEtGN8ETPw
	EmEMwXtMqSu6zPTRqG06zl2lXS6n8pRm2NqqXum5HOyBMYOoje+p2htIry5j7T1EiFJ
	1wKKBUWAK1aeVAHhcMQZy1Pk+NmN3kuxl2SfMUmE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XxfgG1eHXriLBaVBO7iif3q9R4ghf0O5+AKo8TAsd6s=;
	b=0zRd5CWTBrbqIjCwtKaZlBGmlarMxmfKpJ23evLhPDBj+YwhdacqxEi2VQL2lngT
	eU0tlXrkJCQ92sCLmRP2cbYM+fmkuVSpoQvhlbFFJT2x2RYzAbAjARUHXAN/ZsaLDOb
	nFvWGPbwP6MmYAyrdrI5PXBhdl/O+t8tYo26TyoI=
Content-Type: multipart/mixed; boundary="===============3109847862036360747=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 3.30.3,3.30.3 SUCCEEDED
Message-ID: <01010191f61ad202-f5de2d38-ebde-4761-be74-106d4c190bad-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204500

--===============3109847862036360747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cmake,cmake-native* to *3.30.3,3.30.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cmake-cmake-native-upgrade-3.30.2-3.30.3-3.30.2-3.30.patch
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
From c629391479563ee1a42c207d92483b1419e3c67a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 05:48:45 +0000
Subject: [PATCH] cmake,cmake-native: upgrade 3.30.2 -> 3.30.3,3.30.2 -> 3.30.3

---
 .../cmake/{cmake-native_3.30.2.bb => cmake-native_3.30.3.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch   | 2 +-
 ...5-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 2 +-
 .../recipes-devtools/cmake/{cmake_3.30.2.bb => cmake_3.30.3.bb} | 0
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.30.2.bb => cmake-native_3.30.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.30.2.bb => cmake_3.30.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.30.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.30.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.30.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.30.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index b88a4e4bc6..2c1b2be778 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "46074c781eccebc433e98f0bbfa265ca3fd4381f245ca3b140e7711531d60db2"
+SRC_URI[sha256sum] = "6d5de15b6715091df7f5441007425264bdd477809f80333fdf95f846aaff88e4"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 7dc07582da..cff2a5d0ab 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 5e624d82c2838fec2f41ebec124f74aacff9e61f Mon Sep 17 00:00:00 2001
+From b7ca2c7a6066f441cecf785028e476eebc6fc572 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 8788cc7964..1e33ed4c02 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From b97f7dbb2637c6da772833c93bedc8be77520fb9 Mon Sep 17 00:00:00 2001
+From 97410241fc8fd3aa86e7b464d7f31d63ca2a438b Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.30.2.bb b/meta/recipes-devtools/cmake/cmake_3.30.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.30.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.30.3.bb
-- 
2.44.0


--===============3109847862036360747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cmake/cmake-bash-completion: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-bash-completion: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1051459208 to 1051519720 (+0%)
packages/core2-64-poky-linux/cmake/cmake-dbg: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-dev: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-dev: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-doc: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-doc: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-locale: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-locale: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-src: PKGSIZE changed from 10022979 to 10023918 (+0%)
packages/core2-64-poky-linux/cmake/cmake-src: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-src: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-staticdev: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-staticdev: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake: PKGSIZE changed from 41423617 to 41429485 (+0%)
packages/core2-64-poky-linux/cmake/cmake: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v3.30/cmake-3.30.2.tar.gz" to "https://cmake.org/files/v3.30/cmake-3.30.3.tar.gz"
packages/core2-64-poky-linux/cmake: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake: PKGV changed from 3.30.2 [default] to 3.30.3 [default]

--===============3109847862036360747==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-3.30.2-3.30.3-3.30.2-3.30.patch"

RnJvbSBjNjI5MzkxNDc5NTYzZWUxYTQyYzIwN2Q5MjQ4M2IxNDE5ZTNjNjdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDU6NDg6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZSxjbWFrZS1uYXRpdmU6IHVwZ3JhZGUgMy4zMC4yIC0+IDMuMzAuMywzLjMwLjIgLT4gMy4z
MC4zCgotLS0KIC4uLi9jbWFrZS97Y21ha2UtbmF0aXZlXzMuMzAuMi5iYiA9PiBjbWFrZS1uYXRp
dmVfMy4zMC4zLmJifSAgICB8IDAKIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5p
bmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9jbWFrZS9jbWFrZS8wMDAx
LUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2ggICB8IDIgKy0KIC4uLjUt
RGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLS5wYXRj
aCB8IDIgKy0KIC4uLi9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjMwLjIuYmIgPT4g
Y21ha2VfMy4zMC4zLmJifSB8IDAKIDUgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2Ut
bmF0aXZlXzMuMzAuMi5iYiA9PiBjbWFrZS1uYXRpdmVfMy4zMC4zLmJifSAoMTAwJSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMzAuMi5iYiA9PiBjbWFrZV8z
LjMwLjMuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFr
ZS9jbWFrZS1uYXRpdmVfMy4zMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLW5hdGl2ZV8zLjMwLjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfMy4zMC4yLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzMuMzAuMy5iYgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKaW5kZXggYjg4YTRlNGJjNi4uMmMxYjJiZTc3
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYworKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCkBAIC0xOSw3ICsxOSw3IEBA
IENNQUtFX01BSk9SX1ZFUlNJT04gPSAiJHtAJy4nLmpvaW4oZC5nZXRWYXIoJ1BWJykuc3BsaXQo
Jy4nKVswOjJdKX0iCiBTUkNfVVJJID0gImh0dHBzOi8vY21ha2Uub3JnL2ZpbGVzL3Yke0NNQUtF
X01BSk9SX1ZFUlNJT059L2NtYWtlLSR7UFZ9LnRhci5neiBcCiAiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI0NjA3NGM3ODFlY2NlYmM0MzNlOThmMGJiZmEyNjVjYTNmZDQzODFmMjQ1Y2EzYjE0
MGU3NzExNTMxZDYwZGIyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZkNWRlMTViNjcxNTA5MWRm
N2Y1NDQxMDA3NDI1MjY0YmRkNDc3ODA5ZjgwMzMzZmRmOTVmODQ2YWFmZjg4ZTQiCiAKIFVQU1RS
RUFNX0NIRUNLX1JFR0VYID0gImNtYWtlLSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZUxp
c3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlLzAwMDEtQ01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRj
aAppbmRleCA3ZGMwNzU4MmRhLi5jZmYyYTVkMGFiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hU
VFAyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNN
YWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDVlNjI0ZDgyYzI4MzhmZWMyZjQxZWJlYzEyNGY3NGFhY2ZmOWU2MWYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGI3Y2EyYzdhNjA2NmY0NDFjZWNmNzg1MDI4ZTQ3NmVlYmM2ZmM1
NzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWlu
Zy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyOCBEZWMgMjAyMiAxNzo1MToyNyArMDgw
MAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDogZGlzYWJsZSBVU0VfTkdIVFRQMgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDUtRGlzYWJs
ZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDA1LURpc2FibGUtdXNlLW9mLWV4dDJm
cy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC0ucGF0Y2gKaW5kZXggODc4OGNjNzk2NC4u
MWUzM2VkNGMwMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtl
LzAwMDUtRGlzYWJsZS11c2Utb2YtZXh0MmZzLWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFs
LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwNS1EaXNh
YmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwtLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBiOTdmN2RiYjI2MzdjNmRhNzcyODMzYzkzYmVkYzhiZTc3NTIw
ZmI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5NzQxMDI0MWZjOGZkM2FhODZlN2I0
NjRkN2YzMWQ2M2NhMmE0MzhiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT3Rhdmlv
IFNhbHZhZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4KIERhdGU6IFRodSwgNSBKdWwgMjAx
OCAxMDoyODowNCAtMDMwMAogU3ViamVjdDogW1BBVENIXSBEaXNhYmxlIHVzZSBvZiBleHQyZnMv
ZXh0Ml9mcy5oIGJ5IGNtYWtlJ3MgaW50ZXJuYWwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZV8zLjMwLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21h
a2UvY21ha2VfMy4zMC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMC4yLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2VfMy4zMC4zLmJiCi0tIAoyLjQ0LjAKCg==

--===============3109847862036360747==--

