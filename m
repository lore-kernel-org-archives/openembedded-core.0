Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD995CD37AD
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11354.1725172853601720755
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SnwAV1IN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=miAlL3W/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010191ac50a57e-95a5862b-002c-4aab-82f1-07bb1380ebf2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g9rGt72e0HgpVVjnfsjlotL1AXXDQC+kQhymv0ZLCII=;
	b=SnwAV1IN2ZWVu8xZ5dfRxeer4571/suXBZoZnzoXkNYUypSK1fp00USmMHyfi8fs
	k69mTFowhsV188JSoMSavzatIhuk2gZD65A+97MohSqID3UkHJDee5Co0t+SFDrCP9r
	0dTCt5CaYcMn29CsUi6xSwy5w0/4YCr/DvDvisQc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g9rGt72e0HgpVVjnfsjlotL1AXXDQC+kQhymv0ZLCII=;
	b=miAlL3W/NukLefa8kc5bogt4sFSZNPTtx0n6CayNWv7evVyB3l5I7RfvDhHSxucd
	L1R0n+7Of1Y0TEJuJVom4F5PZmP1m9o+C70i6P0VAYon5Z1dEs83kej6EF7cs3pa8f2
	ysNnT2ccimZ8h+Sl0v0tNBY3WVXtXUMxxnW8VEnw=
Content-Type: multipart/mixed; boundary="===============5326712427697503934=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] cmake,cmake-native: upgrading to 3.30.3,3.30.3 SUCCEEDED
Message-ID: <01010191ac50a57e-95a5862b-002c-4aab-82f1-07bb1380ebf2-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204001

--===============5326712427697503934==
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
From a8fa18014f217a81bad58465f65e74fc928a6a6c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Sep 2024 05:41:10 +0000
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
index 7dc07582da..fd8c7fd01d 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 5e624d82c2838fec2f41ebec124f74aacff9e61f Mon Sep 17 00:00:00 2001
+From 71b3d912179a7a5ac2db9e7a83998e5c71bc9785 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 8788cc7964..21b0746e4f 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From b97f7dbb2637c6da772833c93bedc8be77520fb9 Mon Sep 17 00:00:00 2001
+From 8f6fc662af65e0aa5ed994eea4ff8872d1054d5f Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.30.2.bb b/meta/recipes-devtools/cmake/cmake_3.30.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.30.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.30.3.bb
-- 
2.44.0


--===============5326712427697503934==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-cmake-native-upgrade-3.30.2-3.30.3-3.30.2-3.30.patch"

RnJvbSBhOGZhMTgwMTRmMjE3YTgxYmFkNTg0NjVmNjVlNzRmYzkyOGE2YTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBTZXAgMjAyNCAwNTo0MToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlLGNtYWtlLW5hdGl2ZTogdXBncmFkZSAzLjMwLjIgLT4gMy4zMC4zLDMuMzAuMiAtPiAzLjMw
LjMKCi0tLQogLi4uL2NtYWtlL3tjbWFrZS1uYXRpdmVfMy4zMC4yLmJiID0+IGNtYWtlLW5hdGl2
ZV8zLjMwLjMuYmJ9ICAgIHwgMAogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmlu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL2NtYWtlL2NtYWtlLzAwMDEt
Q01ha2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaCAgIHwgMiArLQogLi4uNS1E
aXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwtLnBhdGNo
IHwgMiArLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMzAuMi5iYiA9PiBj
bWFrZV8zLjMwLjMuYmJ9IHwgMAogNSBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZS1u
YXRpdmVfMy4zMC4yLmJiID0+IGNtYWtlLW5hdGl2ZV8zLjMwLjMuYmJ9ICgxMDAlKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS97Y21ha2VfMy4zMC4yLmJiID0+IGNtYWtlXzMu
MzAuMy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtl
L2NtYWtlLW5hdGl2ZV8zLjMwLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21h
a2UtbmF0aXZlXzMuMzAuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjMwLjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS1uYXRpdmVfMy4zMC4zLmJiCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLmluYwppbmRleCBiODhhNGU0YmM2Li4yYzFiMmJlNzc4
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS5pbmMKQEAgLTE5LDcgKzE5LDcgQEAg
Q01BS0VfTUFKT1JfVkVSU0lPTiA9ICIke0AnLicuam9pbihkLmdldFZhcignUFYnKS5zcGxpdCgn
LicpWzA6Ml0pfSIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9jbWFrZS5vcmcvZmlsZXMvdiR7Q01BS0Vf
TUFKT1JfVkVSU0lPTn0vY21ha2UtJHtQVn0udGFyLmd6IFwKICIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjQ2MDc0Yzc4MWVjY2ViYzQzM2U5OGYwYmJmYTI2NWNhM2ZkNDM4MWYyNDVjYTNiMTQw
ZTc3MTE1MzFkNjBkYjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmQ1ZGUxNWI2NzE1MDkxZGY3
ZjU0NDEwMDc0MjUyNjRiZGQ0Nzc4MDlmODAzMzNmZGY5NWY4NDZhYWZmODhlNCIKIAogVVBTVFJF
QU1fQ0hFQ0tfUkVHRVggPSAiY21ha2UtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlTGlz
dHMudHh0LWRpc2FibGUtVVNFX05HSFRUUDIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y21ha2UvY21ha2UvMDAwMS1DTWFrZUxpc3RzLnR4dC1kaXNhYmxlLVVTRV9OR0hUVFAyLnBhdGNo
CmluZGV4IDdkYzA3NTgyZGEuLmZkOGM3ZmQwMWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZS8wMDAxLUNNYWtlTGlzdHMudHh0LWRpc2FibGUtVVNFX05HSFRU
UDIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDEtQ01h
a2VMaXN0cy50eHQtZGlzYWJsZS1VU0VfTkdIVFRQMi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNWU2MjRkODJjMjgzOGZlYzJmNDFlYmVjMTI0Zjc0YWFjZmY5ZTYxZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNzFiM2Q5MTIxNzlhN2E1YWMyZGI5ZTdhODM5OThlNWM3MWJjOTc4
NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5n
LmxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDI4IERlYyAyMDIyIDE3OjUxOjI3ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBkaXNhYmxlIFVTRV9OR0hUVFAyCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UvMDAwNS1EaXNhYmxl
LXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwtLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLzAwMDUtRGlzYWJsZS11c2Utb2YtZXh0MmZz
LWV4dDJfZnMuaC1ieS1jbWFrZS1zLWludGVybmFsLS5wYXRjaAppbmRleCA4Nzg4Y2M3OTY0Li4y
MWIwNzQ2ZTRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2Uv
MDAwNS1EaXNhYmxlLXVzZS1vZi1leHQyZnMtZXh0Ml9mcy5oLWJ5LWNtYWtlLXMtaW50ZXJuYWwt
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZS8wMDA1LURpc2Fi
bGUtdXNlLW9mLWV4dDJmcy1leHQyX2ZzLmgtYnktY21ha2Utcy1pbnRlcm5hbC0ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGI5N2Y3ZGJiMjYzN2M2ZGE3NzI4MzNjOTNiZWRjOGJlNzc1MjBm
YjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhmNmZjNjYyYWY2NWUwYWE1ZWQ5OTRl
ZWE0ZmY4ODcyZDEwNTRkNWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBPdGF2aW8g
U2FsdmFkb3IgPG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPgogRGF0ZTogVGh1LCA1IEp1bCAyMDE4
IDEwOjI4OjA0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgdXNlIG9mIGV4dDJmcy9l
eHQyX2ZzLmggYnkgY21ha2UncyBpbnRlcm5hbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NtYWtlL2NtYWtlXzMuMzAuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFr
ZS9jbWFrZV8zLjMwLjMuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjMwLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjMwLjMuYmIKLS0gCjIuNDQuMAoK

--===============5326712427697503934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/cmake/cmake-bash-completion: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-bash-completion: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-dbg: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGSIZE changed from 1051459208 to 1051519720 (+0%)
packages/core2-64-poky-linux/cmake/cmake-dbg: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-dev: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-dev: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-doc: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-doc: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-locale: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-locale: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-src: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-src: PKGSIZE changed from 10022979 to 10023918 (+0%)
packages/core2-64-poky-linux/cmake/cmake-src: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake-staticdev: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake-staticdev: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake/cmake: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake/cmake: PKGSIZE changed from 41423617 to 41429485 (+0%)
packages/core2-64-poky-linux/cmake/cmake: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/cmake: SRC_URI changed from "https://cmake.org/files/v3.30/cmake-3.30.2.tar.gz" to "https://cmake.org/files/v3.30/cmake-3.30.3.tar.gz"
packages/core2-64-poky-linux/cmake: PV changed from "3.30.2" to "3.30.3"
packages/core2-64-poky-linux/cmake: PKGV changed from 3.30.2 [default] to 3.30.3 [default]
packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9422342 to 9620507 (+2%)

--===============5326712427697503934==--

