Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A96BC35FEC
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.115385.1726410840121439448
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jIO2JUda;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uigF5aJ3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010191f61ad4af-572bffa2-cc37-4b9e-8ae9-91528a40a672-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yYj13dLPflFKdu/4BhoN65kgG9XL/P3iQ92lH0heTj0=;
	b=jIO2JUdamVkwEWCHTf0EI8hxeOU7ij5F8GDyRIshRD0LY92amAzmRlY4onBt9odR
	pokodANmcrK2UAYSluGWtFDrsd2Bf0KxeUVGYQ/+pPjP8GQ6QL3fWzalhVIijKvQy5v
	MWKDQfFJvpeK+GntSZuTG2NStCjvrDt1yH5XUy0M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yYj13dLPflFKdu/4BhoN65kgG9XL/P3iQ92lH0heTj0=;
	b=uigF5aJ3yksqiyFkfrG1UBhO8G94teMJw+cbd1cDOkK0HpRqxSle0S7odRlnTZi8
	RrmL/FCaSZ29drdBG50O7xPJTwxCx9XoKJf7IGRTtKaQV1w7VvcISnhxTv0lk+PZa64
	vNOFjWpbmG8uUszoikrI8WpPq11/Cl6mv7F+1GWk=
Content-Type: multipart/mixed; boundary="===============5383588524732011291=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxi: upgrading to 1.8.2 SUCCEEDED
Message-ID: <01010191f61ad4af-572bffa2-cc37-4b9e-8ae9-91528a40a672-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204502

--===============5383588524732011291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxi* to *1.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxi-upgrade-1.8.1-1.8.2.patch
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
From e65738b46c102f7954207f905c5dc527d2a2a43a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 07:06:15 +0000
Subject: [PATCH] libxi: upgrade 1.8.1 -> 1.8.2

---
 .../xorg-lib/{libxi_1.8.1.bb => libxi_1.8.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.1.bb => libxi_1.8.2.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
index 00bd46ef13..2a86f5fcf0 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb
@@ -18,6 +18,6 @@ PE = "1"
 XORG_PN = "libXi"
 XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "89bfc0e814f288f784202e6e5f9b362b788ccecdeb078670145eacd8749656a7"
+SRC_URI[sha256sum] = "d0e0555e53d6e2114eabfa44226ba162d2708501a25e18d99cfb35c094c6c104"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.0


--===============5383588524732011291==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxi-upgrade-1.8.1-1.8.2.patch"

RnJvbSBlNjU3MzhiNDZjMTAyZjc5NTQyMDdmOTA1YzVkYzUyN2QyYTJhNDNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDc6MDY6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4aTogdXBncmFkZSAxLjguMSAtPiAxLjguMgoKLS0tCiAuLi4veG9yZy1saWIve2xpYnhpXzEu
OC4xLmJiID0+IGxpYnhpXzEuOC4yLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1saWIve2xpYnhpXzEuOC4xLmJiID0+IGxpYnhpXzEuOC4yLmJifSAo
ODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4aV8x
LjguMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4aV8xLjguMi5iYgpz
aW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1saWIvbGlieGlfMS44LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWxpYi9saWJ4aV8xLjguMi5iYgppbmRleCAwMGJkNDZlZjEzLi4yYTg2ZjVmY2YwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGlfMS44LjEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhpXzEuOC4yLmJiCkBAIC0xOCw2ICsx
OCw2IEBAIFBFID0gIjEiCiBYT1JHX1BOID0gImxpYlhpIgogWE9SR19FWFQgPSAidGFyLnh6Igog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODliZmMwZTgxNGYyODhmNzg0MjAyZTZlNWY5YjM2MmI3
ODhjY2VjZGViMDc4NjcwMTQ1ZWFjZDg3NDk2NTZhNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJk
MGUwNTU1ZTUzZDZlMjExNGVhYmZhNDQyMjZiYTE2MmQyNzA4NTAxYTI1ZTE4ZDk5Y2ZiMzVjMDk0
YzZjMTA0IgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0tIAoyLjQ0LjAK
Cg==

--===============5383588524732011291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libxi: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXi-1.8.1.tar.xz" to "https://www.x.org/releases//individual/lib/libXi-1.8.2.tar.xz"
packages/core2-64-poky-linux/libxi: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libxi: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libxi/libxi-dbg: PKGSIZE changed from 1498304 to 1499576 (+0%)
packages/core2-64-poky-linux/libxi/libxi-dbg: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libxi/libxi-dbg: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libxi/libxi-dev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libxi/libxi-dev: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libxi/libxi-doc: PKGSIZE changed from 248510 to 248519 (+0%)
packages/core2-64-poky-linux/libxi/libxi-doc: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libxi/libxi-doc: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libxi/libxi-locale: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libxi/libxi-locale: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libxi/libxi-src: PKGSIZE changed from 382503 to 383175 (+0%)
packages/core2-64-poky-linux/libxi/libxi-src: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libxi/libxi-src: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libxi/libxi-staticdev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libxi/libxi-staticdev: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/libxi/libxi: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/libxi/libxi: PV changed from "1.8.1" to "1.8.2"

--===============5383588524732011291==--

