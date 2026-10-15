Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39492CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33251.1792043050254488348
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sS1dIs9l;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3xUpCukc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a13e16e158-0f4423ed-1aa3-4918-90cc-3549a649cd94-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792043049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RTRrUMeL5qiQfdlnqpBBk2wy63WpZLxIn3g8lVWkU3Y=;
	b=sS1dIs9lca+2mQseRe7rHxWP0AISC8Sn0KH9nclPrjdDYg3Z6l61bhSW7Ph5xRas
	XYQXoB88VGtF8p1FP4WDUU4OS2Cpa2XfPQH/5tE4Y/mBa4H8bBXHMWgMONa++97yrJv
	WNujqn2qt6nATBVmO5o7WQ9l0b14WoGIFIniVQ9w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792043049;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RTRrUMeL5qiQfdlnqpBBk2wy63WpZLxIn3g8lVWkU3Y=;
	b=3xUpCukcxQDvj6FaPV+tkQ9+g/ojG6m4DZelyfJhUtmWzGQBZhtpdGXnOPNHNQAZ
	WGUgSuUvMtCx7R9YkYPA+FeUG+a9S1fnH0LBFL7j8YGX6rYFTVPyvKbNJ+SN/W6bk3g
	KeTMy2pGw0WnnkC3Fj4qIg8wEgorNq3raTrvseBQ=
Content-Type: multipart/mixed; boundary="===============5829854595726206575=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libzip: upgrading to 1.12.1 SUCCEEDED
Message-ID: <010101a13e16e158-0f4423ed-1aa3-4918-90cc-3549a649cd94-000000@us-west-2.amazonses.com>
Date: Thu, 15 Oct 2026 05:44:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247862

--===============5829854595726206575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libzip* to *1.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libzip-upgrade-1.12-1.12.1.patch
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
From e4e0db471535c603b728d185df2130f04465662c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Oct 2026 05:40:30 +0000
Subject: [PATCH] libzip: upgrade 1.12 -> 1.12.1

# 1.12.1 [2026-10-14]
---
 .../libzip/{libzip_1.12.bb => libzip_1.12.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libzip/{libzip_1.12.bb => libzip_1.12.1.bb} (93%)

diff --git a/meta/recipes-extended/libzip/libzip_1.12.bb b/meta/recipes-extended/libzip/libzip_1.12.1.bb
similarity index 93%
rename from meta/recipes-extended/libzip/libzip_1.12.bb
rename to meta/recipes-extended/libzip/libzip_1.12.1.bb
index 37071592b7..95bac993f9 100644
--- a/meta/recipes-extended/libzip/libzip_1.12.bb
+++ b/meta/recipes-extended/libzip/libzip_1.12.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e6fcea978dc627f41e0bada0de889ec4"
 DEPENDS = "zlib bzip2"
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
-SRC_URI[sha256sum] = "376908d0f0fda13180a19fdc4f7062a1abfb59e09ca07a392d361253b8e60c2b"
+SRC_URI[sha256sum] = "c40062022a1963c80573d48f6070792297cecd7c6bffe3aefcac0d8b9bee8913"
 
 inherit cmake
 
-- 
2.47.1


--===============5829854595726206575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libzip/libzip-doc: PKGSIZE changed from 0 to 950998 (+100%)

--===============5829854595726206575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libzip-changelog.txt"

# 1.12.1 [2026-10-14]

--===============5829854595726206575==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libzip-upgrade-1.12-1.12.1.patch"

RnJvbSBlNGUwZGI0NzE1MzVjNjAzYjcyOGQxODVkZjIxMzBmMDQ0NjU2NjJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgT2N0IDIwMjYgMDU6NDA6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ6aXA6IHVwZ3JhZGUgMS4xMiAtPiAxLjEyLjEKCiMgMS4xMi4xIFsyMDI2LTEwLTE0XQotLS0K
IC4uLi9saWJ6aXAve2xpYnppcF8xLjEyLmJiID0+IGxpYnppcF8xLjEyLjEuYmJ9ICAgICAgICAg
ICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ6aXAve2xpYnppcF8xLjEyLmJi
ID0+IGxpYnppcF8xLjEyLjEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2xpYnppcC9saWJ6aXBfMS4xMi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ6
aXAvbGliemlwXzEuMTIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGliemlwL2xpYnppcF8xLjEyLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGliemlwL2xpYnppcF8xLjEyLjEuYmIKaW5kZXggMzcwNzE1OTJiNy4u
OTViYWM5OTNmOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnppcC9saWJ6
aXBfMS4xMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliemlwL2xpYnppcF8xLjEy
LjEuYmIKQEAgLTEzLDcgKzEzLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9ZTZmY2VhOTc4ZGM2MjdmNDFlMGJhZGEwZGU4ODllYzQiCiBERVBFTkRTID0gInpsaWIg
YnppcDIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9saWJ6aXAub3JnL2Rvd25sb2FkL2xpYnppcC0k
e1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzc2OTA4ZDBmMGZkYTEzMTgwYTE5
ZmRjNGY3MDYyYTFhYmZiNTllMDljYTA3YTM5MmQzNjEyNTNiOGU2MGMyYiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJjNDAwNjIwMjJhMTk2M2M4MDU3M2Q0OGY2MDcwNzkyMjk3Y2VjZDdjNmJmZmUz
YWVmY2FjMGQ4YjliZWU4OTEzIgogCiBpbmhlcml0IGNtYWtlCiAKLS0gCjIuNDcuMQoK

--===============5829854595726206575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libzip: PKGV changed from 1.12 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libzip: PV changed from "1.12" to "1.12.1"
packages/x86-64-v3-poky-linux/libzip: SRC_URI changed from "https://libzip.org/download/libzip-1.12.tar.xz" to "https://libzip.org/download/libzip-1.12.1.tar.xz"
packages/x86-64-v3-poky-linux/libzip/libzip-dbg: PKGV changed from 1.12 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-dbg: PV changed from "1.12" to "1.12.1"
packages/x86-64-v3-poky-linux/libzip/libzip-dbg: PKGSIZE changed from 922344 to 922592 (+0%)
packages/x86-64-v3-poky-linux/libzip/libzip-dev: PKGV changed from 1.12 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-dev: PV changed from "1.12" to "1.12.1"
packages/x86-64-v3-poky-linux/libzip/libzip-dev: PKGSIZE changed from 56908 to 56914 (+0%)
packages/x86-64-v3-poky-linux/libzip/libzip-doc: PKGV changed from 1.12 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-doc: PV changed from "1.12" to "1.12.1"
packages/x86-64-v3-poky-linux/libzip/libzip-doc: PKGSIZE changed from 0 to 950998 (+100%)
packages/x86-64-v3-poky-linux/libzip/libzip-locale: PKGV changed from 1.12 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-locale: PV changed from "1.12" to "1.12.1"
packages/x86-64-v3-poky-linux/libzip/libzip-src: PKGV changed from 1.12 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-src: PV changed from "1.12" to "1.12.1"
packages/x86-64-v3-poky-linux/libzip/libzip-src: PKGSIZE changed from 764577 to 765138 (+0%)
packages/x86-64-v3-poky-linux/libzip/libzip-src: FILELIST: directory renamed /usr/src/debug/libzip/1.12/lib -> /usr/src/debug/libzip/1.12.1/lib, directory renamed /usr/src/debug/libzip/1.12/src -> /usr/src/debug/libzip/1.12.1/src, directory renamed /usr/src/debug/libzip/1.12 -> /usr/src/debug/libzip/1.12.1
packages/x86-64-v3-poky-linux/libzip/libzip-staticdev: PKGV changed from 1.12 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libzip/libzip-staticdev: PV changed from "1.12" to "1.12.1"
packages/x86-64-v3-poky-linux/libzip/libzip: PKGV changed from 1.12 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libzip/libzip: PV changed from "1.12" to "1.12.1"

--===============5829854595726206575==--

