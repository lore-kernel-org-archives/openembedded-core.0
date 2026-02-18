Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8986CE9A04E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:46 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1385.1771440096850223046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eAGQTXrL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JoziaRR/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c720ec3d9-fbc6621a-a0d5-4800-94df-bb6a03cf2443-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440096;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nd7EIN576PyMU+cL+2ApbtZlqe0oloGl8HZQ5YdHvgw=;
	b=eAGQTXrLh4YoVscIpDVxAb1THf4W10JqmWSKE/PNyNHXAyiaYWZidNbE08Gm3nM2
	WgZcwsKdfSv7BjRqeYqBtdDc0QuVc2ZCknLBUxe6Ww+OyALdG+oQTtIVKTihOvDRjDG
	XI2Ju1+QL1Lsev4VNAk3DNk9/ErX3p3aGUwIIcWs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440096;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nd7EIN576PyMU+cL+2ApbtZlqe0oloGl8HZQ5YdHvgw=;
	b=JoziaRR/ixriAsw6EEz36kHc5gcgst5EMeSdELcP1gpqibi8I9T0bcgIKu86vPr2
	4SZLdmNYWxYCpW1oRG1nV1ytVs6Gewb3WTKrDW5F0FDISMvBmiAo+F8RkeJop2ggRD0
	eDyzipiDn5OLXv1Xyy6Gq2mwcqOuqJDXkbmYwk5k=
Content-Type: multipart/mixed; boundary="===============0129596143179850731=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xauth: upgrading to 1.1.5 SUCCEEDED
Message-ID: <0101019c720ec3d9-fbc6621a-a0d5-4800-94df-bb6a03cf2443-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231327

--===============0129596143179850731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xauth* to *1.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xauth-upgrade-1.1.4-1.1.5.patch
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
From dff3a931950cd29f6bedd1eefeab14ffa0d0c35b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 10:47:56 +0000
Subject: [PATCH] xauth: upgrade 1.1.4 -> 1.1.5

---
 .../xorg-app/{xauth_1.1.4.bb => xauth_1.1.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.1.4.bb => xauth_1.1.5.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
index 919457bca6..8660d17ff0 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
@@ -9,7 +9,7 @@ DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "e9318141464ad7b4dc0f8564a580f0d20f977c85a388cc40d5a766206151c690"
+SRC_URI[sha256sum] = "a4000e2f441facebf569026bedecc23ba262cc6927be52070abe0002625cfbe0"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.47.1


--===============0129596143179850731==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xauth-upgrade-1.1.4-1.1.5.patch"

RnJvbSBkZmYzYTkzMTk1MGNkMjlmNmJlZGQxZWVmZWFiMTRmZmEwZDBjMzViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTA6NDc6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
YXV0aDogdXBncmFkZSAxLjEuNCAtPiAxLjEuNQoKLS0tCiAuLi4veG9yZy1hcHAve3hhdXRoXzEu
MS40LmJiID0+IHhhdXRoXzEuMS41LmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1hcHAve3hhdXRoXzEuMS40LmJiID0+IHhhdXRoXzEuMS41LmJifSAo
ODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94YXV0aF8x
LjEuNC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94YXV0aF8xLjEuNS5iYgpz
aW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1hcHAveGF1dGhfMS4xLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWFwcC94YXV0aF8xLjEuNS5iYgppbmRleCA5MTk0NTdiY2E2Li44NjYwZDE3ZmYwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGF1dGhfMS4xLjQuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hhdXRoXzEuMS41LmJiCkBAIC05LDcgKzks
NyBAQCBERVBFTkRTICs9ICJsaWJ4YXUgbGlieGV4dCBsaWJ4bXUiCiBQRSA9ICIxIgogCiBTUkNf
VVJJX0VYVCA9ICJ4eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlOTMxODE0MTQ2NGFkN2I0ZGMw
Zjg1NjRhNTgwZjBkMjBmOTc3Yzg1YTM4OGNjNDBkNWE3NjYyMDYxNTFjNjkwIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImE0MDAwZTJmNDQxZmFjZWJmNTY5MDI2YmVkZWNjMjNiYTI2MmNjNjkyN2Jl
NTIwNzBhYmUwMDAyNjI1Y2ZiZTAiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIke0BiYi51dGlscy5m
aWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywgZCl9IgogUEFDS0FHRUNPTkZJR1tpcHY2
XSA9ICItLWVuYWJsZS1pcHY2LC0tZGlzYWJsZS1pcHY2LCIKLS0gCjIuNDcuMQoK

--===============0129596143179850731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xauth: SRC_URI changed from "https://www.x.org/releases//individual/app/xauth-1.1.4.tar.xz" to "https://www.x.org/releases//individual/app/xauth-1.1.5.tar.xz"
packages/x86-64-v3-poky-linux/xauth: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PKGSIZE changed from 118720 to 119328 (+1%)
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-dev: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-dev: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PKGSIZE changed from 11403 to 12018 (+5%)
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-locale: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-locale: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-src: PKGSIZE changed from 76373 to 76741 (+0%)
packages/x86-64-v3-poky-linux/xauth/xauth-src: FILELIST: directory renamed /usr/src/debug/xauth/1.1.4 -> /usr/src/debug/xauth/1.1.5
packages/x86-64-v3-poky-linux/xauth/xauth-src: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-src: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-staticdev: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-staticdev: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth: PKGV changed from 1.1.4 [default] to 1.1.5 [default]

--===============0129596143179850731==--

