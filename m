Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AADCD13A2
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:30 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2011.1711994602689052832
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U2e2ZLOU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Iwk92Hno;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018e9ad485da-9c3b10e8-320c-4a10-b1ac-07c0e803dfb2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994603;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=RNeM6EODAgXkKQU+Ta+DKBw9vQs6GXr9vuKc94kMY54=;
	b=U2e2ZLOUZUaASqsSXsyl3JFeeeIQpOhFjK7hhUofkbastPzN4dMGaz4REWtv/qvK
	vDA1GMQnxjClzhBir/QaGqtkHR92Nr89ENwPMexag+CMl6gun7kBK2BroGbMFK0mJ9j
	W6sVerJ9xOvAwPxKZf1CTUzFZd/DNXWfuS0d6xWo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994603;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=RNeM6EODAgXkKQU+Ta+DKBw9vQs6GXr9vuKc94kMY54=;
	b=Iwk92HnoQEVMkK0V6s4oCR9UsAJgFZR+A90LEsMt64UabHPayrtEZwzEuzyzMN2Q
	aOnQc+vhZOfddXu04NKS6f9CUbHWCpdFfolf6zYyexZo10PoivVPrxsdc/C5ukdFH+I
	l8oTAGwol5lkGwb0nLa3u3xxKQ9h/DWedlaaiQmU=
Content-Type: multipart/mixed; boundary="===============6575963273948438301=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xauth: upgrading to 1.1.3 SUCCEEDED
Message-ID: <0101018e9ad485da-9c3b10e8-320c-4a10-b1ac-07c0e803dfb2-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197800

--===============6575963273948438301==
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
From facb8a14f3ff35d49881b708a54e8a203f2ac7d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 14:35:52 +0000
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


--===============6575963273948438301==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xauth-upgrade-1.1.2-1.1.3.patch"

RnJvbSBmYWNiOGExNGYzZmYzNWQ0OTg4MWI3MDhhNTRlOGEyMDNmMmFjN2Q2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNDozNTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhh
dXRoOiB1cGdyYWRlIDEuMS4yIC0+IDEuMS4zCgotLS0KIC4uLi94b3JnLWFwcC97eGF1dGhfMS4x
LjIuYmIgPT4geGF1dGhfMS4xLjMuYmJ9ICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWFwcC97eGF1dGhfMS4xLjIuYmIgPT4geGF1dGhfMS4xLjMuYmJ9ICg4
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hhdXRoXzEu
MS4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hhdXRoXzEuMS4zLmJiCnNp
bWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWFwcC94YXV0aF8xLjEuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
YXBwL3hhdXRoXzEuMS4zLmJiCmluZGV4IDFhZDE4ZWY2M2IuLmIwY2EzM2JmNGIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94YXV0aF8xLjEuMi5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGF1dGhfMS4xLjMuYmIKQEAgLTksNyArOSw3
IEBAIERFUEVORFMgKz0gImxpYnhhdSBsaWJ4ZXh0IGxpYnhtdSIKIFBFID0gIjEiCiAKIFNSQ19V
UklfRVhUID0gInh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc4YmE2YWZkMTk1MzZjZWQxZGRk
YjMyNzZjYmE2ZTk1NTVhMjExYjQ2OGEwNmY5NWY2YTk3YzYyZmY4ZWUyMDAiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZTcwNzU0OThiYWUzMzJmOTE3ZjAxZDY2MGY5Yjk0MGMwNzUyYjI1NTZhOGRh
NjFjY2I2MmE0NGQwZmZlOWQzMyIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmZp
bHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCiBQQUNLQUdFQ09ORklHW2lwdjZd
ID0gIi0tZW5hYmxlLWlwdjYsLS1kaXNhYmxlLWlwdjYsIgotLSAKMi40Mi4wCgo=

--===============6575963273948438301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xauth: PKGV changed from 1.1.2 [default] to 1.1.3 [default]
packages/core2-64-poky-linux/xauth: SRC_URI changed from "https://www.x.org/releases//individual/app/xauth-1.1.2.tar.xz" to "https://www.x.org/releases//individual/app/xauth-1.1.3.tar.xz"
packages/core2-64-poky-linux/xauth: PV changed from "1.1.2" to "1.1.3"
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

--===============6575963273948438301==--

