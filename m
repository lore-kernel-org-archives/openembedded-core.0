Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89328D591DC
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:49 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.4643.1731964601777918275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=c2lJieqP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rQIGUFLz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010193412282be-e43cb6a6-ce27-4097-bc8c-70c5f0e20686-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g0C7+VRGkbxpreW90HxQ9jqfnkViaE3YwQgniEZ2IeE=;
	b=c2lJieqPRyN4oXIR+sMKB3xCKerxGCUOV23rry09ysKKxHuvj6qBtqqHS/I27UsE
	BRXuFNTPkNX0PPB8NDCvPKlHzNCz6uC4MQlpAhW0LT9QZ13GNgUk48DsGKQf2iWicMv
	lxfmQKbHM6ZDqeD9cKYe9au+wb4Ilk19Eu7XY/tg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g0C7+VRGkbxpreW90HxQ9jqfnkViaE3YwQgniEZ2IeE=;
	b=rQIGUFLzlWNiIptgAWmW0Rkix+Pa0ojczXOLuMRval58Z+hzonqGc04FnpRldUMo
	/1EOV8qTYxAOgL1o75tlUWtl5jqQmjuuhuE+OZtbcfTXR4gxLIAbjsUAu5yXJ2rdv55
	DRnvp/Y7PLsWCLRd1gxJOWtaPmDf9uvJ2cc5Plcc=
Content-Type: multipart/mixed; boundary="===============7839962315809903520=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xrandr,xprop: upgrading to 1.5.3,1.2.8 SUCCEEDED
Message-ID: <01010193412282be-e43cb6a6-ce27-4097-bc8c-70c5f0e20686-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207237

--===============7839962315809903520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xrandr,xprop* to *1.5.3,1.2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xrandr-xprop-upgrade-1.5.2-1.5.3-1.2.7-1.2.8.patch
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
From 1ae6a8a4bb8448690c3f23858e4b30bed3b0b0bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Nov 2024 23:06:06 +0000
Subject: [PATCH] xrandr,xprop: upgrade 1.5.2 -> 1.5.3,1.2.7 -> 1.2.8

---
 .../xorg-app/{xprop_1.2.7.bb => xprop_1.2.8.bb}                 | 2 +-
 .../xorg-app/{xrandr_1.5.2.bb => xrandr_1.5.3.bb}               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.7.bb => xprop_1.2.8.bb} (86%)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.5.2.bb => xrandr_1.5.3.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.7.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.8.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.7.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.8.bb
index 96e364b2b3..b9bc3b2892 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.7.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.8.bb
@@ -15,4 +15,4 @@ DEPENDS += "libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "4436e3148bb91a162406230d9f736a49ca8b50b74790015dc15d78d6ce8e825f"
+SRC_URI[sha256sum] = "d689e2adb7ef7b439f6469b51cda8a7daefc83243854c2a3b8f84d0f029d67ee"
diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb b/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb
index 1e29031849..75656af9ea 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb
@@ -12,6 +12,6 @@ DEPENDS += "libxrandr libxrender"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "c8bee4790d9058bacc4b6246456c58021db58a87ddda1a9d0139bf5f18f1f240"
+SRC_URI[sha256sum] = "f8dd7566adb74147fab9964680b6bbadee87cf406a7fcff51718a5e6949b841c"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.1


--===============7839962315809903520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xprop: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xprop: SRC_URI changed from "https://www.x.org/releases//individual/app/xprop-1.2.7.tar.xz" to "https://www.x.org/releases//individual/app/xprop-1.2.8.tar.xz"
packages/core2-64-poky-linux/xprop: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xprop/xprop-dbg: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xprop/xprop-dbg: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xprop/xprop-dbg: PKGSIZE changed from 122280 to 123096 (+1%)
packages/core2-64-poky-linux/xprop/xprop-dev: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xprop/xprop-dev: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xprop/xprop-doc: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xprop/xprop-doc: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xprop/xprop-locale: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xprop/xprop-locale: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xprop/xprop-src: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xprop/xprop-src: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xprop/xprop-src: PKGSIZE changed from 71380 to 71972 (+1%)
packages/core2-64-poky-linux/xprop/xprop-staticdev: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xprop/xprop-staticdev: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xprop/xprop: PKGV changed from 1.2.7 [default] to 1.2.8 [default]
packages/core2-64-poky-linux/xprop/xprop: PV changed from "1.2.7" to "1.2.8"
packages/core2-64-poky-linux/xrandr: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-64-poky-linux/xrandr: SRC_URI changed from "https://www.x.org/releases//individual/app/xrandr-1.5.2.tar.xz" to "https://www.x.org/releases//individual/app/xrandr-1.5.3.tar.xz"
packages/core2-64-poky-linux/xrandr: PV changed from "1.5.2" to "1.5.3"
packages/core2-64-poky-linux/xrandr/xrandr-dbg: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-64-poky-linux/xrandr/xrandr-dbg: PV changed from "1.5.2" to "1.5.3"
packages/core2-64-poky-linux/xrandr/xrandr-dbg: PKGSIZE changed from 179800 to 181896 (+1%)
packages/core2-64-poky-linux/xrandr/xrandr-dev: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-64-poky-linux/xrandr/xrandr-dev: PV changed from "1.5.2" to "1.5.3"
packages/core2-64-poky-linux/xrandr/xrandr-doc: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-64-poky-linux/xrandr/xrandr-doc: PV changed from "1.5.2" to "1.5.3"
packages/core2-64-poky-linux/xrandr/xrandr-locale: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-64-poky-linux/xrandr/xrandr-locale: PV changed from "1.5.2" to "1.5.3"
packages/core2-64-poky-linux/xrandr/xrandr-src: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-64-poky-linux/xrandr/xrandr-src: PV changed from "1.5.2" to "1.5.3"
packages/core2-64-poky-linux/xrandr/xrandr-src: PKGSIZE changed from 109625 to 111036 (+1%)
packages/core2-64-poky-linux/xrandr/xrandr-staticdev: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-64-poky-linux/xrandr/xrandr-staticdev: PV changed from "1.5.2" to "1.5.3"
packages/core2-64-poky-linux/xrandr/xrandr: PKGV changed from 1.5.2 [default] to 1.5.3 [default]
packages/core2-64-poky-linux/xrandr/xrandr: PV changed from "1.5.2" to "1.5.3"

--===============7839962315809903520==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xrandr-xprop-upgrade-1.5.2-1.5.3-1.2.7-1.2.8.patch"

RnJvbSAxYWU2YThhNGJiODQ0ODY5MGMzZjIzODU4ZTRiMzBiZWQzYjBiMGJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTm92IDIwMjQgMjM6MDY6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
cmFuZHIseHByb3A6IHVwZ3JhZGUgMS41LjIgLT4gMS41LjMsMS4yLjcgLT4gMS4yLjgKCi0tLQog
Li4uL3hvcmctYXBwL3t4cHJvcF8xLjIuNy5iYiA9PiB4cHJvcF8xLjIuOC5iYn0gICAgICAgICAg
ICAgICAgIHwgMiArLQogLi4uL3hvcmctYXBwL3t4cmFuZHJfMS41LjIuYmIgPT4geHJhbmRyXzEu
NS4zLmJifSAgICAgICAgICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
YXBwL3t4cHJvcF8xLjIuNy5iYiA9PiB4cHJvcF8xLjIuOC5iYn0gKDg2JSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve3hyYW5kcl8xLjUuMi5iYiA9PiB4cmFuZHJfMS41
LjMuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBw
L3hwcm9wXzEuMi43LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hwcm9wXzEu
Mi44LmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLWFwcC94cHJvcF8xLjIuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctYXBwL3hwcm9wXzEuMi44LmJiCmluZGV4IDk2ZTM2NGIyYjMuLmI5YmMzYjI4OTIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94cHJvcF8xLjIuNy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHByb3BfMS4yLjguYmIKQEAg
LTE1LDQgKzE1LDQgQEAgREVQRU5EUyArPSAibGlieG11IgogUEUgPSAiMSIKIAogU1JDX1VSSV9F
WFQgPSAieHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDQzNmUzMTQ4YmI5MWExNjI0MDYyMzBk
OWY3MzZhNDljYThiNTBiNzQ3OTAwMTVkYzE1ZDc4ZDZjZThlODI1ZiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJkNjg5ZTJhZGI3ZWY3YjQzOWY2NDY5YjUxY2RhOGE3ZGFlZmM4MzI0Mzg1NGMyYTNi
OGY4NGQwZjAyOWQ2N2VlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
YXBwL3hyYW5kcl8xLjUuMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94cmFu
ZHJfMS41LjMuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctYXBwL3hyYW5kcl8xLjUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctYXBwL3hyYW5kcl8xLjUuMy5iYgppbmRleCAxZTI5MDMxODQ5Li43NTY1
NmFmOWVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveHJhbmRy
XzEuNS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94cmFuZHJfMS41
LjMuYmIKQEAgLTEyLDYgKzEyLDYgQEAgREVQRU5EUyArPSAibGlieHJhbmRyIGxpYnhyZW5kZXIi
CiBQRSA9ICIxIgogCiBTUkNfVVJJX0VYVCA9ICJ4eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJj
OGJlZTQ3OTBkOTA1OGJhY2M0YjYyNDY0NTZjNTgwMjFkYjU4YTg3ZGRkYTFhOWQwMTM5YmY1ZjE4
ZjFmMjQwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY4ZGQ3NTY2YWRiNzQxNDdmYWI5OTY0Njgw
YjZiYmFkZWU4N2NmNDA2YTdmY2ZmNTE3MThhNWU2OTQ5Yjg0MWMiCiAKIEJCQ0xBU1NFWFRFTkQg
PSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDQuMQoK

--===============7839962315809903520==--

