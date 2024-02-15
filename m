Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2EBC54ED5
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.20332.1708018345172185094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EMGrDUKR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j4nUOmnh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018dadd3a1f1-db4d9f26-adf1-4c4e-9ed4-c850a69cb0ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cXQDk2S4dvd3No157JeHS25/Dh4R5DPd5OgvGQ9e29k=;
	b=EMGrDUKRTHoOEoTu+l2H24Klgpd7SjEbxovtTgzzU1WWhxGqMk1RdyW8p6EP7eww
	fsSrymwmaJJXr7DCSaRPaUOsBw+RYshgcPToZCRudx2mI0rE4593tgSjRyt71n++MfB
	fX/FMc8Db5Plv9oj/t9G+S+vJprFYTC6fL9G0b5Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cXQDk2S4dvd3No157JeHS25/Dh4R5DPd5OgvGQ9e29k=;
	b=j4nUOmnhHVkb2O8LNPWaJILRRM++5FltZ/0fVFBCC3N3qDDRt8OGdBO37tgi3+hp
	7LSo0+40jCAy4qJNUR0zQEdaJAL2byJhSVwfUUix/ZckGbzOzQxObf9rlbVKzifZi4l
	PQQzOFi59u4r/FHqIpezREyZN4hmdAREMWhCb4Eg=
Content-Type: multipart/mixed; boundary="===============5981554004741055220=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.1.1 SUCCEEDED
Message-ID: <0101018dadd3a1f1-db4d9f26-adf1-4c4e-9ed4-c850a69cb0ed-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195586

--===============5981554004741055220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *2.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.1.0-2.1.1.patch
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
From 3d2ecf7d7089c733871c79c3b91f519e1c76cc2e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 07:53:26 +0000
Subject: [PATCH] pkgconf: upgrade 2.1.0 -> 2.1.1

---
 .../pkgconf/{pkgconf_2.1.0.bb => pkgconf_2.1.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.1.0.bb => pkgconf_2.1.1.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
index 1921f3a086..33d69451bb 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.1.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.1.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "266d5861ee51c52bc710293a1d36622ae16d048d71ec56034a02eb9cf9677761"
+SRC_URI[sha256sum] = "3a224f2accf091b77a5781316e27b9ee3ba82c083cc2e539e08940b68a44fec5"
 
 inherit autotools
 
-- 
2.42.0


--===============5981554004741055220==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.1.0-2.1.1.patch"

RnJvbSAzZDJlY2Y3ZDcwODljNzMzODcxYzc5YzNiOTFmNTE5ZTFjNzZjYzJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDc6NTM6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDIuMS4wIC0+IDIuMS4xCgotLS0KIC4uLi9wa2djb25mL3twa2djb25m
XzIuMS4wLmJiID0+IHBrZ2NvbmZfMi4xLjEuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzIuMS4wLmJiID0+IHBrZ2NvbmZfMi4xLjEu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8yLjEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4x
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjEuMS5iYgppbmRleCAxOTIxZjNhMDg2Li4zM2Q2OTQ1MWJi
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzIuMS4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4xLjEuYmIK
QEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTovL3BrZy1jb25maWctbmF0
aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwKICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIyNjZkNTg2MWVlNTFjNTJiYzcxMDI5M2ExZDM2NjIyYWUxNmQwNDhkNzFlYzU2
MDM0YTAyZWI5Y2Y5Njc3NzYxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhMjI0ZjJhY2NmMDkx
Yjc3YTU3ODEzMTZlMjdiOWVlM2JhODJjMDgzY2MyZTUzOWUwODk0MGI2OGE0NGZlYzUiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzCiAKLS0gCjIuNDIuMAoK

--===============5981554004741055220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pkgconf: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/pkgconf: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.1.0.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.1.1.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 314232 to 315272 (+0%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24354 to 24495 (+1%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 29202 to 29201 (-0%)
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 273448 to 274832 (+1%)
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.1.0" to "2.1.1"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf: PV changed from "2.1.0" to "2.1.1"

--===============5981554004741055220==--

