Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A16C3DA7F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13583.1713248037832778467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AVUt6JRu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VZscyebr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018ee58a9b26-452f261b-f0f2-4ebd-bd85-0c56e88ef756-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ZM96kfTFee1LCc+kXwRfkz6t42XtEdLe5LIhHRtQXlM=;
	b=AVUt6JRu7PVbf9NX61T2yP9EuN7dcfPWrB5oIycBSW4JhShVZelAW+sNILYtF1/J
	gDsAM1r9hS14oyKuCudfmclP/KOJ4tbmn5T+17b/nexSKn9sias4xQIn/QZ/R3+iTlm
	KRuo8iZ9etyTBd3UiqpcRrEZ/wWhQxnF9vh1ByK0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ZM96kfTFee1LCc+kXwRfkz6t42XtEdLe5LIhHRtQXlM=;
	b=VZscyebrCOGeKujkSTllwemnE+A+i7wO0Y7EX5Y+Yhq+y7cvki8aNUicUju64eOt
	a7485Fe+V+nYRNXMkSfeNF9AD28HaPf8coBkXY7j+/HUboY6mwXAKfFTV+6k/jhjM5q
	Qj0kq0BL2APr7kDLXkhptwRQ1LcwXEqRj7Q/I1Kw=
Content-Type: multipart/mixed; boundary="===============4380080265611418187=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xauth: upgrading to 1.1.3 SUCCEEDED
Message-ID: <0101018ee58a9b26-452f261b-f0f2-4ebd-bd85-0c56e88ef756-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198373

--===============4380080265611418187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xauth* to *1.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xauth-upgrade-1.1.2-1.1.3.patch
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
From f5dfcaf8b538c8dcc1476cde34c5d36ae3ccab19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 00:16:01 +0000
Subject: [PATCH] xauth: upgrade 1.1.2 -> 1.1.3

---
 .../xorg-app/{xauth_1.1.2.bb => xauth_1.1.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.1.2.bb => xauth_1.1.3.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.1.2.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.3.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xauth_1.1.2.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.3.bb
index 1ad18ef63b..b0ca33bf4b 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.3.bb
@@ -9,7 +9,7 @@ DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "78ba6afd19536ced1dddb3276cba6e9555a211b468a06f95f6a97c62ff8ee200"
+SRC_URI[sha256sum] = "e7075498bae332f917f01d660f9b940c0752b2556a8da61ccb62a44d0ffe9d33"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.42.0


--===============4380080265611418187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xauth: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xauth: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xauth: SRC_URI changed from "https://www.x.org/releases//individual/app/xauth-1.1.2.tar.xz" to "https://www.x.org/releases//individual/app/xauth-1.1.3.tar.xz"
packages/core2-64-poky-linux/xauth/xauth-dbg: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xauth/xauth-dbg: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xauth/xauth-dbg: PKGSIZE changed from 107856 to 109528 (+2%)
packages/core2-64-poky-linux/xauth/xauth-dev: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xauth/xauth-dev: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xauth/xauth-doc: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xauth/xauth-doc: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xauth/xauth-doc: PKGSIZE changed from 11391 to 11403 (+0%)
packages/core2-64-poky-linux/xauth/xauth-locale: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xauth/xauth-locale: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xauth/xauth-src: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xauth/xauth-src: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xauth/xauth-src: PKGSIZE changed from 75989 to 75716 (-0%)
packages/core2-64-poky-linux/xauth/xauth-staticdev: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xauth/xauth-staticdev: PV changed from "1.1.2" to "1.1.3"
packages/core2-64-poky-linux/xauth/xauth: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xauth/xauth: PV changed from "1.1.2" to "1.1.3"

--===============4380080265611418187==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xauth-upgrade-1.1.2-1.1.3.patch"

RnJvbSBmNWRmY2FmOGI1MzhjOGRjYzE0NzZjZGUzNGM1ZDM2YWUzY2NhYjE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDA6MTY6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
YXV0aDogdXBncmFkZSAxLjEuMiAtPiAxLjEuMwoKLS0tCiAuLi4veG9yZy1hcHAve3hhdXRoXzEu
MS4yLmJiID0+IHhhdXRoXzEuMS4zLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1hcHAve3hhdXRoXzEuMS4yLmJiID0+IHhhdXRoXzEuMS4zLmJifSAo
ODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94YXV0aF8x
LjEuMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94YXV0aF8xLjEuMy5iYgpz
aW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1hcHAveGF1dGhfMS4xLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWFwcC94YXV0aF8xLjEuMy5iYgppbmRleCAxYWQxOGVmNjNiLi5iMGNhMzNiZjRiIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGF1dGhfMS4xLjIuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hhdXRoXzEuMS4zLmJiCkBAIC05LDcgKzks
NyBAQCBERVBFTkRTICs9ICJsaWJ4YXUgbGlieGV4dCBsaWJ4bXUiCiBQRSA9ICIxIgogCiBTUkNf
VVJJX0VYVCA9ICJ4eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3OGJhNmFmZDE5NTM2Y2VkMWRk
ZGIzMjc2Y2JhNmU5NTU1YTIxMWI0NjhhMDZmOTVmNmE5N2M2MmZmOGVlMjAwIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImU3MDc1NDk4YmFlMzMyZjkxN2YwMWQ2NjBmOWI5NDBjMDc1MmIyNTU2YThk
YTYxY2NiNjJhNDRkMGZmZTlkMzMiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIke0BiYi51dGlscy5m
aWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywgZCl9IgogUEFDS0FHRUNPTkZJR1tpcHY2
XSA9ICItLWVuYWJsZS1pcHY2LC0tZGlzYWJsZS1pcHY2LCIKLS0gCjIuNDIuMAoK

--===============4380080265611418187==--

