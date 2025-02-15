Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70512C021A4
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:10 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8049.1739623329945473569
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=B+WvGTcL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QiUmrdmZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019509a16e1d-c6b38222-38d2-4fe2-9bc1-3442e4c14e4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1i1ASBCrxoxtB7UTrkog91uayBNv0iojL6q8LQpGYxY=;
	b=B+WvGTcL+tIYoCQgp0HdQiVrsYgQVRNHu5LoQd5jPqOF11q1PHBh5YQMNc7QrZIu
	jrSGHOEEFPN+X0pdD5nSi1YNeDRqqO3LhHlal2KZ+AEaojPMGkQMMR+9/7e1zSofFAy
	GyPl9bI2hdvlmexC2gGVAJNr9Ls0RmAQPbYVwHyQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1i1ASBCrxoxtB7UTrkog91uayBNv0iojL6q8LQpGYxY=;
	b=QiUmrdmZV2F8MWFvM9r+ulYgI3hc4QZforRnj9PlBNhiTmYrgLEnkwxJIg2tdzkZ
	Gmwd9MoirvFSdO1R83KATI3DqM4mOh9EyBaQjHNxmVLTu2JDI3dtMh6eXqu/ys3QMGp
	vwHh47vVV/mdApyjFoluepkRfLB7hBAfC1Gj0u2Q=
Content-Type: multipart/mixed; boundary="===============6491867604357768028=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xhost: upgrading to 1.0.10 SUCCEEDED
Message-ID: <0101019509a16e1d-c6b38222-38d2-4fe2-9bc1-3442e4c14e4d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211399

--===============6491867604357768028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xhost* to *1.0.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xhost-upgrade-1.0.9-1.0.10.patch
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
From 7e7c6e70d271e35fbba92d756694d34759aee73d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 06:00:36 +0000
Subject: [PATCH] xhost: upgrade 1.0.9 -> 1.0.10

---
 .../xorg-app/{xhost_1.0.9.bb => xhost_1.0.10.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.9.bb => xhost_1.0.10.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-app/xhost_1.0.9.bb b/meta/recipes-graphics/xorg-app/xhost_1.0.10.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-app/xhost_1.0.9.bb
rename to meta/recipes-graphics/xorg-app/xhost_1.0.10.bb
index d54e6cae65..0c112e6ea3 100644
--- a/meta/recipes-graphics/xorg-app/xhost_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-app/xhost_1.0.10.bb
@@ -15,7 +15,7 @@ PE = "1"
 
 SRC_URI_EXT = "xz"
 
-SRC_URI[sha256sum] = "ea86b531462035b19a2e5e01ef3d9a35cca7d984086645e2fc844d8f0e346645"
+SRC_URI[sha256sum] = "a8afd70059479c712948b895e41c35a4a8bfcede3ba2d5a4b855c88bbb725be1"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.44.1


--===============6491867604357768028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xhost: PV changed from "1.0.9" to "1.0.10"
packages/core2-64-poky-linux/xhost: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/core2-64-poky-linux/xhost: SRC_URI changed from "https://www.x.org/releases//individual/app/xhost-1.0.9.tar.xz" to "https://www.x.org/releases//individual/app/xhost-1.0.10.tar.xz"
packages/core2-64-poky-linux/xhost/xhost-dbg: PV changed from "1.0.9" to "1.0.10"
packages/core2-64-poky-linux/xhost/xhost-dbg: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/core2-64-poky-linux/xhost/xhost-dbg: PKGSIZE changed from 38776 to 38528 (-1%)
packages/core2-64-poky-linux/xhost/xhost-dev: PV changed from "1.0.9" to "1.0.10"
packages/core2-64-poky-linux/xhost/xhost-dev: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/core2-64-poky-linux/xhost/xhost-doc: PV changed from "1.0.9" to "1.0.10"
packages/core2-64-poky-linux/xhost/xhost-doc: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/core2-64-poky-linux/xhost/xhost-doc: PKGSIZE changed from 7903 to 7921 (+0%)
packages/core2-64-poky-linux/xhost/xhost-locale: PV changed from "1.0.9" to "1.0.10"
packages/core2-64-poky-linux/xhost/xhost-locale: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/core2-64-poky-linux/xhost/xhost-src: PV changed from "1.0.9" to "1.0.10"
packages/core2-64-poky-linux/xhost/xhost-src: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/core2-64-poky-linux/xhost/xhost-src: PKGSIZE changed from 23456 to 23501 (+0%)
packages/core2-64-poky-linux/xhost/xhost-staticdev: PV changed from "1.0.9" to "1.0.10"
packages/core2-64-poky-linux/xhost/xhost-staticdev: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/core2-64-poky-linux/xhost/xhost: PV changed from "1.0.9" to "1.0.10"
packages/core2-64-poky-linux/xhost/xhost: PKGV changed from 1.0.9 [default] to 1.0.10 [default]
packages/core2-64-poky-linux/xhost/xhost: PKGSIZE changed from 22568 to 18472 (-18%)

--===============6491867604357768028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xhost/xhost: PKGSIZE changed from 22568 to 18472 (-18%)

--===============6491867604357768028==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xhost-upgrade-1.0.9-1.0.10.patch"

RnJvbSA3ZTdjNmU3MGQyNzFlMzVmYmJhOTJkNzU2Njk0ZDM0NzU5YWVlNzNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDY6MDA6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
aG9zdDogdXBncmFkZSAxLjAuOSAtPiAxLjAuMTAKCi0tLQogLi4uL3hvcmctYXBwL3t4aG9zdF8x
LjAuOS5iYiA9PiB4aG9zdF8xLjAuMTAuYmJ9ICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctYXBwL3t4aG9zdF8xLjAuOS5iYiA9PiB4aG9zdF8xLjAuMTAuYmJ9
ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hob3N0
XzEuMC45LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hob3N0XzEuMC4xMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1hcHAveGhvc3RfMS4wLjkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWFwcC94aG9zdF8xLjAuMTAuYmIKaW5kZXggZDU0ZTZjYWU2NS4uMGMxMTJlNmVhMyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hob3N0XzEuMC45LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94aG9zdF8xLjAuMTAuYmIKQEAgLTE1
LDcgKzE1LDcgQEAgUEUgPSAiMSIKIAogU1JDX1VSSV9FWFQgPSAieHoiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJlYTg2YjUzMTQ2MjAzNWIxOWEyZTVlMDFlZjNkOWEzNWNjYTdkOTg0MDg2NjQ1
ZTJmYzg0NGQ4ZjBlMzQ2NjQ1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE4YWZkNzAwNTk0Nzlj
NzEyOTQ4Yjg5NWU0MWMzNWE0YThiZmNlZGUzYmEyZDVhNGI4NTVjODhiYmI3MjViZTEiCiAKIFBB
Q0tBR0VDT05GSUcgPz89ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdp
cHY2JywgZCl9IgogUEFDS0FHRUNPTkZJR1tpcHY2XSA9ICItLWVuYWJsZS1pcHY2LC0tZGlzYWJs
ZS1pcHY2LCIKLS0gCjIuNDQuMQoK

--===============6491867604357768028==--

