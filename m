Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8266C8303F
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8900.1749993299217274675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yHnfo6CR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=R3hgTT6g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019773ba9ac2-3856cc75-b162-4562-b1f5-53cf1c156199-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993298;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZOonej2dTeWsgw1eITdeD1q2ylAl9/ROQoMbxeAGpR8=;
	b=yHnfo6CROr9322iH8C/YPKPz38sdDsnY30gq3XKckXcy1zNIxfwoSfR1u7z90FVJ
	pVh23eZs7Lm0ficmJryZ3q/2b9l3g8CxcnPRTfbVrKLb+b8qeTb+JRuObTosT8pIJ/c
	lgISZCjbtLBxbXYien45bbM875/CM4B0Kj+A4/kA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993298;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZOonej2dTeWsgw1eITdeD1q2ylAl9/ROQoMbxeAGpR8=;
	b=R3hgTT6gH5MmywOYSR3eQrj6y3gAb5co8o+K8BwtBrz5xmX5iRhNQ47Pxxwvg6h2
	b4eyURRtXHt2KajQb6+tWAkhCuZMMbO0fdVweEWerrEANAuklJebimKkiaYOHu8Q8HR
	EMUjn4s96JpKxuXutp5+jwzh07z4jSjL4M2JAv2c=
Content-Type: multipart/mixed; boundary="===============0909847859296534491=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjpeg-turbo: upgrading to 3.1.1 SUCCEEDED
Message-ID: <0101019773ba9ac2-3856cc75-b162-4562-b1f5-53cf1c156199-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218720

--===============0909847859296534491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libjpeg-turbo* to *3.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libjpeg-turbo-upgrade-3.1.0-3.1.1.patch
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
From bdf29a36e6655e6d8733d2179592293552a99b04 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 11:17:32 +0000
Subject: [PATCH] libjpeg-turbo: upgrade 3.1.0 -> 3.1.1

---
 .../jpeg/{libjpeg-turbo_3.1.0.bb => libjpeg-turbo_3.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.1.0.bb => libjpeg-turbo_3.1.1.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb
index a5f1932a90..2b39a4c1d9 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb
@@ -9,7 +9,7 @@ DEPENDS:append:x86-64:class-target = " nasm-native"
 DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "9564c72b1dfd1d6fe6274c5f95a8d989b59854575d4bbee44ade7bc17aa9bc93"
+SRC_URI[sha256sum] = "aadc97ea91f6ef078b0ae3a62bba69e008d9a7db19b34e4ac973b19b71b4217c"
 
 PE = "1"
 
-- 
2.47.1


--===============0909847859296534491==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-3.1.0-3.1.1.patch"

RnJvbSBiZGYyOWEzNmU2NjU1ZTZkODczM2QyMTc5NTkyMjkzNTUyYTk5YjA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTE6MTc6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJqcGVnLXR1cmJvOiB1cGdyYWRlIDMuMS4wIC0+IDMuMS4xCgotLS0KIC4uLi9qcGVnL3tsaWJq
cGVnLXR1cmJvXzMuMS4wLmJiID0+IGxpYmpwZWctdHVyYm9fMy4xLjEuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL3tsaWJqcGVnLXR1cmJvXzMuMS4wLmJiID0+IGxpYmpw
ZWctdHVyYm9fMy4xLjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9q
cGVnL2xpYmpwZWctdHVyYm9fMy4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMS5iYgpp
bmRleCBhNWYxOTMyYTkwLi4yYjM5YTRjMWQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjEuYmIKQEAgLTksNyArOSw3IEBAIERFUEVORFM6
YXBwZW5kOng4Ni02NDpjbGFzcy10YXJnZXQgPSAiIG5hc20tbmF0aXZlIgogREVQRU5EUzphcHBl
bmQ6eDg2OmNsYXNzLXRhcmdldCA9ICIgbmFzbS1uYXRpdmUiCiAKIFNSQ19VUkkgPSAiJHtHSVRI
VUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9LyR7QlB9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI5NTY0YzcyYjFkZmQxZDZmZTYyNzRjNWY5NWE4ZDk4OWI1OTg1NDU3NWQ0YmJlZTQ0
YWRlN2JjMTdhYTliYzkzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFhZGM5N2VhOTFmNmVmMDc4
YjBhZTNhNjJiYmE2OWUwMDhkOWE3ZGIxOWIzNGU0YWM5NzNiMTliNzFiNDIxN2MiCiAKIFBFID0g
IjEiCiAKLS0gCjIuNDcuMQoK

--===============0909847859296534491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libjpeg-turbo/jpeg-tools: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/jpeg-tools: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/libjpeg-turbo: SRC_URI changed from "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.0/libjpeg-turbo-3.1.0.tar.gz" to "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.1/libjpeg-turbo-3.1.1.tar.gz"
packages/core2-64-poky-linux/libjpeg-turbo: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5592728 to 5600568 (+0%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2120262 to 2121742 (+0%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGSIZE changed from 657465 to 661561 (+1%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "3.1.0" to "3.1.1"
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 3.1.0 [default] to 3.1.1 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "3.1.0" to "3.1.1"

--===============0909847859296534491==--

