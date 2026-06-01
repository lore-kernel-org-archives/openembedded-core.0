Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95010CD8C81
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1556.1780328132416134511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AyeYJbyn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2jV+qdCW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e83d36b94-7cf9c2ad-0be0-4c85-a285-0ee5345908d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9VPIgifn/B3HsAUssuSDDiXtTm0eL/M8HowIiTcDQmw=;
	b=AyeYJbynzOQGFkhdecFKWf2mjzCg5180lu1VU+yyduZjDxO8fGRKdKaqLLPKKLPj
	pX3VeM5PdG0+tvGxjmq4Kpy6hYLv01P/juiZ/p7ObE48BUUdNyKwvKegAd6n0SlGeCH
	9aq+ku6NFGOJI3OYE4hdTjwebCwCzfj60uHa58bc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328131;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9VPIgifn/B3HsAUssuSDDiXtTm0eL/M8HowIiTcDQmw=;
	b=2jV+qdCW0r5r3+xROQg49l4IQKRnYzidjaH8w+U30SVSLHtALzlzt+E2shHTOiXV
	XSi8XHf1iAtPmX1E+Q9upRm0By1DgtuX1FslgA3rALKcRECdUmB/iYukAz8NkKuJsOZ
	itmEV9ni5JkV9vOB/gexC5UPUQi2dSRBiXD82qHY=
Content-Type: multipart/mixed; boundary="===============4743421664252383555=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxi: upgrading to 1.8.3 SUCCEEDED
Message-ID: <0101019e83d36b94-7cf9c2ad-0be0-4c85-a285-0ee5345908d4-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237853

--===============4743421664252383555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxi* to *1.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxi-upgrade-1.8.2-1.8.3.patch
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
From 0d1c4c841feb9f33a26e533cc6f424e833ae5d52 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 06:46:37 +0000
Subject: [PATCH] libxi: upgrade 1.8.2 -> 1.8.3

---
 .../xorg-lib/{libxi_1.8.2.bb => libxi_1.8.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.2.bb => libxi_1.8.3.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
index 2a86f5fcf0..d7e778610e 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb
@@ -18,6 +18,6 @@ PE = "1"
 XORG_PN = "libXi"
 XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "d0e0555e53d6e2114eabfa44226ba162d2708501a25e18d99cfb35c094c6c104"
+SRC_URI[sha256sum] = "7ad60056f01af4f786cfe93b3a7707447711626fc8da2637bec71a90409babe5"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============4743421664252383555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxi: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXi-1.8.2.tar.xz" to "https://www.x.org/releases//individual/lib/libXi-1.8.3.tar.xz"
packages/x86-64-v3-poky-linux/libxi: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libxi: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libxi/libxi-dbg: PKGSIZE changed from 1525232 to 1526048 (+0%)
packages/x86-64-v3-poky-linux/libxi/libxi-dbg: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-dbg: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libxi/libxi-dev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-dev: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libxi/libxi-doc: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-doc: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libxi/libxi-locale: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-locale: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libxi/libxi-src: PKGSIZE changed from 383175 to 383772 (+0%)
packages/x86-64-v3-poky-linux/libxi/libxi-src: FILELIST: directory renamed /usr/src/debug/libxi/1.8.2/src -> /usr/src/debug/libxi/1.8.3/src, directory renamed /usr/src/debug/libxi/1.8.2/include/X11/extensions -> /usr/src/debug/libxi/1.8.3/include/X11/extensions
packages/x86-64-v3-poky-linux/libxi/libxi-src: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-src: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libxi/libxi-staticdev: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libxi/libxi-staticdev: PV changed from "1.8.2" to "1.8.3"
packages/x86-64-v3-poky-linux/libxi/libxi: PKGV changed from 1.8.2 [default] to 1.8.3 [default]
packages/x86-64-v3-poky-linux/libxi/libxi: PV changed from "1.8.2" to "1.8.3"

--===============4743421664252383555==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxi-upgrade-1.8.2-1.8.3.patch"

RnJvbSAwZDFjNGM4NDFmZWI5ZjMzYTI2ZTUzM2NjNmY0MjRlODMzYWU1ZDUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNjo0NjozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhpOiB1cGdyYWRlIDEuOC4yIC0+IDEuOC4zCgotLS0KIC4uLi94b3JnLWxpYi97bGlieGlfMS44
LjIuYmIgPT4gbGlieGlfMS44LjMuYmJ9ICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi97bGlieGlfMS44LjIuYmIgPT4gbGlieGlfMS44LjMuYmJ9ICg4
OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhpXzEu
OC4yLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhpXzEuOC4zLmJiCnNp
bWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWxpYi9saWJ4aV8xLjguMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
bGliL2xpYnhpXzEuOC4zLmJiCmluZGV4IDJhODZmNWZjZjAuLmQ3ZTc3ODYxMGUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4aV8xLjguMi5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGlfMS44LjMuYmIKQEAgLTE4LDYgKzE4
LDYgQEAgUEUgPSAiMSIKIFhPUkdfUE4gPSAibGliWGkiCiBYT1JHX0VYVCA9ICJ0YXIueHoiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkMGUwNTU1ZTUzZDZlMjExNGVhYmZhNDQyMjZiYTE2MmQy
NzA4NTAxYTI1ZTE4ZDk5Y2ZiMzVjMDk0YzZjMTA0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdh
ZDYwMDU2ZjAxYWY0Zjc4NmNmZTkzYjNhNzcwNzQ0NzcxMTYyNmZjOGRhMjYzN2JlYzcxYTkwNDA5
YmFiZTUiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDcuMQoK

--===============4743421664252383555==--

