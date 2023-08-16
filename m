Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAB5C3065A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.173806.1692224344387589699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BAYwVBdv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ph4QQ96s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a006e4ea0-c09d16ac-29ec-49af-bab0-5b373d3337d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BaievPWBfeNZ+xyizDm8TmTdOENUCYS22jWMdtWNjZs=;
	b=BAYwVBdv0AdN4ouIxVSLPMIfmSgwOMKYp5Hfv+9qD6eSfxQ0SBNapN1GXot3KK3N
	HIOTssLj0yHit0tCqz3X7a0p/sq9ujl/PakAbNIUGz3UBGE+0SaMbxd9IZzKnvg0IJc
	N7hbEwUV6BVWXEfV286OfgQAiwv12WnzUvB0yQks=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BaievPWBfeNZ+xyizDm8TmTdOENUCYS22jWMdtWNjZs=;
	b=ph4QQ96sQm71upPU+nkkMceKGVhlb8xTVJtRJbg8UwhCbP7GAsk7CdfGT6VhX3Jr
	30NthPxDQEaI2jXTnYw0UjmUTkMHf4WIzRM8wZP0DomxVFeCO9NqeZd+pDSl/cNMc+N
	87mG3BW8XqLPVP9scmEaEpq4TlcgWtjSVA0QrgqA=
Content-Type: multipart/mixed; boundary="===============6883795670639081188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.0.1 SUCCEEDED
Message-ID: <0101018a006e4ea0-c09d16ac-29ec-49af-bab0-5b373d3337d9-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186174

--===============6883795670639081188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pkgconf* to *2.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-1.9.5-2.0.1.patch
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
From f45ce42a57fa2866314a4166db72419a818fa974 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 04:01:09 +0000
Subject: [PATCH] pkgconf: upgrade 1.9.5 -> 2.0.1

---
 .../pkgconf/{pkgconf_1.9.5.bb => pkgconf_2.0.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.9.5.bb => pkgconf_2.0.1.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.0.1.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.0.1.bb
index ab1d1c84e8..146f5d05d9 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.9.5.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.0.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "1ac1656debb27497563036f7bffc281490f83f9b8457c0d60bcfb638fb6b6171"
+SRC_URI[sha256sum] = "3238af7473740844e5159dd8fb6540603e3fbcebf60beb3c8a426cdca2e29c51"
 
 inherit autotools
 
-- 
2.39.2


--===============6883795670639081188==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-1.9.5-2.0.1.patch"

RnJvbSBmNDVjZTQyYTU3ZmEyODY2MzE0YTQxNjZkYjcyNDE5YTgxOGZhOTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDQ6MDE6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDEuOS41IC0+IDIuMC4xCgotLS0KIC4uLi9wa2djb25mL3twa2djb25m
XzEuOS41LmJiID0+IHBrZ2NvbmZfMi4wLjEuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzEuOS41LmJiID0+IHBrZ2NvbmZfMi4wLjEu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8xLjkuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4w
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8xLjkuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjAuMS5iYgppbmRleCBhYjFkMWM4NGU4Li4xNDZmNWQwNWQ5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzEuOS41
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4wLjEuYmIK
QEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTovL3BrZy1jb25maWctbmF0
aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwKICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIxYWMxNjU2ZGViYjI3NDk3NTYzMDM2ZjdiZmZjMjgxNDkwZjgzZjliODQ1N2Mw
ZDYwYmNmYjYzOGZiNmI2MTcxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMyMzhhZjc0NzM3NDA4
NDRlNTE1OWRkOGZiNjU0MDYwM2UzZmJjZWJmNjBiZWIzYzhhNDI2Y2RjYTJlMjljNTEiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzCiAKLS0gCjIuMzkuMgoK

--===============6883795670639081188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pkgconf: PKGV changed from 1.9.5 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/pkgconf: PV changed from "1.9.5" to "2.0.1"
packages/core2-32-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-1.9.5.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.0.1.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 257348 to 258668 (+1%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PV changed from "1.9.5" to "2.0.1"
packages/core2-32-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 1.9.5 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24019 to 24161 (+1%)
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PV changed from "1.9.5" to "2.0.1"
packages/core2-32-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 1.9.5 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 29208 to 29202 (-0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PV changed from "1.9.5" to "2.0.1"
packages/core2-32-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 1.9.5 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PV changed from "1.9.5" to "2.0.1"
packages/core2-32-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 1.9.5 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 268524 to 269282 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PV changed from "1.9.5" to "2.0.1"
packages/core2-32-poky-linux/pkgconf/pkgconf-src: PKGV changed from 1.9.5 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "1.9.5" to "2.0.1"
packages/core2-32-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 1.9.5 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 150517 to 150601 (+0%)
packages/core2-32-poky-linux/pkgconf/pkgconf: PV changed from "1.9.5" to "2.0.1"
packages/core2-32-poky-linux/pkgconf/pkgconf: PKGV changed from 1.9.5 [default] to 2.0.1 [default]

--===============6883795670639081188==--

