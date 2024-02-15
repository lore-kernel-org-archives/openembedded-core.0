Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D956C54E58
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:33 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20344.1708018346947489622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e2BqqiXt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=he/mrtaD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018dadd3a9eb-c31a72d1-96ea-4e0f-9957-e488be377751-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=6V/77jM7MKJ++Dl5XrYCjy+I5DRBxzYc7fKuGf7H4qs=;
	b=e2BqqiXtcoDMwTI7+5hs5ZcyVoyYG122ltBx3bnXVpWXIF7zaYpHnR8pUQnz1o9S
	SOh1kH1fF34DhzKP6JkdbnIHRhHu3ijHy49LKi7kLDrcyW7aA6wLaY7+LUqyLTlnRHf
	DafLFG2cbA/1Zww13w7ThUlma1g43aXnEONlBA5E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=6V/77jM7MKJ++Dl5XrYCjy+I5DRBxzYc7fKuGf7H4qs=;
	b=he/mrtaD+kZQCQHpaTEf91LbuP2urenvImPIcM8HrfrT+ORs/Jo5eQssda2mAAC5
	ppabQcZH5SrzCZ4tcl6bHxb7QRLRznC5jIoRcn8Ff70BcUiktUDZHEqXhQrrXx0FNwd
	AquWhtzOG8YmmKvxwNxryoLKSZqMwqZiOtqI7+tw=
Content-Type: multipart/mixed; boundary="===============8786181614919899775=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xprop: upgrading to 1.2.7 SUCCEEDED
Message-ID: <0101018dadd3a9eb-c31a72d1-96ea-4e0f-9957-e488be377751-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195646

--===============8786181614919899775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xprop* to *1.2.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xprop-upgrade-1.2.6-1.2.7.patch
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
From 48e0253043f0ae5731cb83e0ddc619b579e73b22 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 14:17:17 +0000
Subject: [PATCH] xprop: upgrade 1.2.6 -> 1.2.7

---
 .../xorg-app/{xprop_1.2.6.bb => xprop_1.2.7.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.6.bb => xprop_1.2.7.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.6.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.7.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.6.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.7.bb
index 438a897f1e..96e364b2b3 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.6.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.7.bb
@@ -15,4 +15,4 @@ DEPENDS += "libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "580b8525b12ecc0144aa16c88b0aafa76d2e799b44c8c6c50f9ce92788b5586e"
+SRC_URI[sha256sum] = "4436e3148bb91a162406230d9f736a49ca8b50b74790015dc15d78d6ce8e825f"
-- 
2.42.0


--===============8786181614919899775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xprop: SRC_URI changed from "https://www.x.org/releases//individual/app/xprop-1.2.6.tar.xz" to "https://www.x.org/releases//individual/app/xprop-1.2.7.tar.xz"
packages/core2-64-poky-linux/xprop: PV changed from "1.2.6" to "1.2.7"
packages/core2-64-poky-linux/xprop: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/core2-64-poky-linux/xprop/xprop-dbg: PV changed from "1.2.6" to "1.2.7"
packages/core2-64-poky-linux/xprop/xprop-dbg: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/core2-64-poky-linux/xprop/xprop-dev: PV changed from "1.2.6" to "1.2.7"
packages/core2-64-poky-linux/xprop/xprop-dev: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/core2-64-poky-linux/xprop/xprop-doc: PV changed from "1.2.6" to "1.2.7"
packages/core2-64-poky-linux/xprop/xprop-doc: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/core2-64-poky-linux/xprop/xprop-locale: PV changed from "1.2.6" to "1.2.7"
packages/core2-64-poky-linux/xprop/xprop-locale: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/core2-64-poky-linux/xprop/xprop-src: PKGSIZE changed from 71371 to 71380 (+0%)
packages/core2-64-poky-linux/xprop/xprop-src: PV changed from "1.2.6" to "1.2.7"
packages/core2-64-poky-linux/xprop/xprop-src: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/core2-64-poky-linux/xprop/xprop-staticdev: PV changed from "1.2.6" to "1.2.7"
packages/core2-64-poky-linux/xprop/xprop-staticdev: PKGV changed from 1.2.6 [default] to 1.2.7 [default]
packages/core2-64-poky-linux/xprop/xprop: PV changed from "1.2.6" to "1.2.7"
packages/core2-64-poky-linux/xprop/xprop: PKGV changed from 1.2.6 [default] to 1.2.7 [default]

--===============8786181614919899775==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xprop-upgrade-1.2.6-1.2.7.patch"

RnJvbSA0OGUwMjUzMDQzZjBhZTU3MzFjYjgzZTBkZGM2MTliNTc5ZTczYjIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTQ6MTc6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
cHJvcDogdXBncmFkZSAxLjIuNiAtPiAxLjIuNwoKLS0tCiAuLi4veG9yZy1hcHAve3hwcm9wXzEu
Mi42LmJiID0+IHhwcm9wXzEuMi43LmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1hcHAve3hwcm9wXzEuMi42LmJiID0+IHhwcm9wXzEuMi43LmJifSAo
ODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94cHJvcF8x
LjIuNi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94cHJvcF8xLjIuNy5iYgpz
aW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1hcHAveHByb3BfMS4yLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWFwcC94cHJvcF8xLjIuNy5iYgppbmRleCA0MzhhODk3ZjFlLi45NmUzNjRiMmIzIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHByb3BfMS4yLjYuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hwcm9wXzEuMi43LmJiCkBAIC0xNSw0ICsx
NSw0IEBAIERFUEVORFMgKz0gImxpYnhtdSIKIFBFID0gIjEiCiAKIFNSQ19VUklfRVhUID0gInh6
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU4MGI4NTI1YjEyZWNjMDE0NGFhMTZjODhiMGFhZmE3
NmQyZTc5OWI0NGM4YzZjNTBmOWNlOTI3ODhiNTU4NmUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NDQzNmUzMTQ4YmI5MWExNjI0MDYyMzBkOWY3MzZhNDljYThiNTBiNzQ3OTAwMTVkYzE1ZDc4ZDZj
ZThlODI1ZiIKLS0gCjIuNDIuMAoK

--===============8786181614919899775==--

