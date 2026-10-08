Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2648BCA600E
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 05:25:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9309.1791437151929746842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 22:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TnjFx5Oq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ylk6lx4Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a119f99af7-c95285c2-cb33-4089-b1a2-1f89955a7cdc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791437151;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=iO84HV7vmdcwA8xyWx54TveQVzsaU1/RrZaJAV0dI+A=;
	b=TnjFx5Oq8xR6t1JHoIcuJs2pWAy74IduWT5lOS+IM/5Ii5jvTvgugaVUdxECZAC2
	7LNNIg6WBSq9DzLcVzFCJlksb2Hwk2ZgJYHm2/xPJKOhUEY1vs55wjcoQqEofJg4Yyu
	2cjtlvVHbCF5fcTRpapQMAPMenEhvySIfAPP8PDw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791437151;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=iO84HV7vmdcwA8xyWx54TveQVzsaU1/RrZaJAV0dI+A=;
	b=ylk6lx4Ym7TNIcONYSE0natre6trRqskktGt3/k/zMeLtLZSuEMtqLaxgf6SrDld
	uL0rkRxiCmZoHX1yxL6p/UQYX1FBU+RIX2dnsBLcW5/Z+7JalFCbZ/2NXali2pEGBdW
	wYE/E7rky1y2hv9ed4KA3i30DmKFfnPNdt/NBf0g=
Content-Type: multipart/mixed; boundary="===============5597035682915124576=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libevdev: upgrading to 1.14.0 SUCCEEDED
Message-ID: <010101a119f99af7-c95285c2-cb33-4089-b1a2-1f89955a7cdc-000000@us-west-2.amazonses.com>
Date: Thu, 8 Oct 2026 05:25:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.08-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 05:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247408

--===============5597035682915124576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libevdev* to *1.14.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libevdev-upgrade-1.13.7-1.14.0.patch
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
From 59b1ded0dacd71e1fc1fdec056ce928688970fd6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 8 Oct 2026 05:25:44 +0000
Subject: [PATCH] libevdev: upgrade 1.13.7 -> 1.14.0

---
 .../libevdev/{libevdev_1.13.7.bb => libevdev_1.14.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.7.bb => libevdev_1.14.0.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.7.bb b/meta/recipes-support/libevdev/libevdev_1.14.0.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.7.bb
rename to meta/recipes-support/libevdev/libevdev_1.14.0.bb
index 79e383c55b..dedc101db9 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.7.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.14.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46"
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0caf824971108f15bb2ad356433bae198d7d3bf1e82d43f63626e069e060bfa6"
+SRC_URI[sha256sum] = "5a0966c7110648665983848bad696c7acba614a2160d2865d535397101007332"
 
 inherit meson pkgconfig
 
-- 
2.47.1


--===============5597035682915124576==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libevdev-upgrade-1.13.7-1.14.0.patch"

RnJvbSA1OWIxZGVkMGRhY2Q3MWUxZmMxZmRlYzA1NmNlOTI4Njg4OTcwZmQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOCBPY3QgMjAyNiAwNToyNTo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmV2ZGV2OiB1cGdyYWRlIDEuMTMuNyAtPiAxLjE0LjAKCi0tLQogLi4uL2xpYmV2ZGV2L3tsaWJl
dmRldl8xLjEzLjcuYmIgPT4gbGliZXZkZXZfMS4xNC4wLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliZXZkZXYve2xpYmV2ZGV2XzEuMTMuNy5iYiA9PiBsaWJldmRldl8x
LjE0LjAuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZk
ZXYvbGliZXZkZXZfMS4xMy43LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZXZkZXYvbGli
ZXZkZXZfMS4xNC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmV2ZGV2L2xpYmV2ZGV2XzEuMTMuNy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliZXZkZXYvbGliZXZkZXZfMS4xNC4wLmJiCmluZGV4IDc5ZTM4M2M1
NWIuLmRlZGMxMDFkYjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmV2ZGV2
L2xpYmV2ZGV2XzEuMTMuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJldmRldi9s
aWJldmRldl8xLjE0LjAuYmIKQEAgLTksNyArOSw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ODBjNTUwYjMxOTdiY2I4ZGE3ZDc1NTdl
YmNjM2ZjNDYiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5mcmVlZGVza3RvcC5vcmcvc29mdHdh
cmUvbGliZXZkZXYvJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBjYWY4MjQ5
NzExMDhmMTViYjJhZDM1NjQzM2JhZTE5OGQ3ZDNiZjFlODJkNDNmNjM2MjZlMDY5ZTA2MGJmYTYi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWEwOTY2YzcxMTA2NDg2NjU5ODM4NDhiYWQ2OTZjN2Fj
YmE2MTRhMjE2MGQyODY1ZDUzNTM5NzEwMTAwNzMzMiIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25m
aWcKIAotLSAKMi40Ny4xCgo=

--===============5597035682915124576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libevdev: SRC_URI changed from "http://www.freedesktop.org/software/libevdev/libevdev-1.13.7.tar.xz" to "http://www.freedesktop.org/software/libevdev/libevdev-1.14.0.tar.xz"
packages/x86-64-v3-poky-linux/libevdev: PV changed from "1.13.7" to "1.14.0"
packages/x86-64-v3-poky-linux/libevdev: PKGV changed from 1.13.7 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-dbg: PV changed from "1.13.7" to "1.14.0"
packages/x86-64-v3-poky-linux/libevdev/libevdev-dbg: PKGV changed from 1.13.7 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-dbg: PKGSIZE changed from 245408 to 247816 (+1%)
packages/x86-64-v3-poky-linux/libevdev/libevdev-dev: PV changed from "1.13.7" to "1.14.0"
packages/x86-64-v3-poky-linux/libevdev/libevdev-dev: PKGV changed from 1.13.7 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-dev: PKGSIZE changed from 97576 to 98374 (+1%)
packages/x86-64-v3-poky-linux/libevdev/libevdev-doc: PV changed from "1.13.7" to "1.14.0"
packages/x86-64-v3-poky-linux/libevdev/libevdev-doc: PKGV changed from 1.13.7 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-locale: PV changed from "1.13.7" to "1.14.0"
packages/x86-64-v3-poky-linux/libevdev/libevdev-locale: PKGV changed from 1.13.7 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: PV changed from "1.13.7" to "1.14.0"
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: FILELIST: directory renamed /usr/src/debug/libevdev/1.13.7/include/linux/linux -> /usr/src/debug/libevdev/1.14.0/include/linux/linux, directory renamed /usr/src/debug/libevdev/1.13.7 -> /usr/src/debug/libevdev/1.14.0, directory renamed /usr/src/debug/libevdev/1.13.7/libevdev -> /usr/src/debug/libevdev/1.14.0/libevdev, directory renamed /usr/src/debug/libevdev/1.13.7/tools -> /usr/src/debug/libevdev/1.14.0/tools
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: PKGV changed from 1.13.7 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev-src: PKGSIZE changed from 287187 to 288472 (+0%)
packages/x86-64-v3-poky-linux/libevdev/libevdev-staticdev: PV changed from "1.13.7" to "1.14.0"
packages/x86-64-v3-poky-linux/libevdev/libevdev-staticdev: PKGV changed from 1.13.7 [default] to 1.14.0 [default]
packages/x86-64-v3-poky-linux/libevdev/libevdev: PV changed from "1.13.7" to "1.14.0"
packages/x86-64-v3-poky-linux/libevdev/libevdev: PKGV changed from 1.13.7 [default] to 1.14.0 [default]

--===============5597035682915124576==--

