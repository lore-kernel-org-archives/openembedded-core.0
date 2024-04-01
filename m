Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB31CD129E
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.44664.1711994603608412352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SR6wRi4X;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qW/EQimS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad485db-33deedcb-6719-4477-9bb1-460f86bab284-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994603;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=LMjHVCn2QrzO4X11CHmEQLQHYwCNOSiSs+FizxGsJ08=;
	b=SR6wRi4XBdD6RK90IMFjPnf+o658WEcViKeC7eSH9+L9OHuea+V7VXicokDDwund
	JpoTk/NV9Yk742uJVLinyz9APOMz5IioR5duNAIrNS8EDSTzSwlOw0PM4mByX+QbQNj
	MU0AL84cOUWM5xvol9C0Ny54u0k5DUUF502u4/zI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994603;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=LMjHVCn2QrzO4X11CHmEQLQHYwCNOSiSs+FizxGsJ08=;
	b=qW/EQimSdSI/8M7ac7zTwKEEF0n1d5wA5RxpfNuwFP/n1jZyo1n8zRg+iepCMuqr
	z+eZZZnzHG7oBu/sSKOobYEkhV3rZzAoMq10iBIHk4M0MAaW3/WEEK7fcwdqjlyv/Ix
	4toOD0PckfAN2G44apfgrW6VrK2fp05xp5dp/kkg=
Content-Type: multipart/mixed; boundary="===============3885077684586292941=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xev: upgrading to 1.2.6 SUCCEEDED
Message-ID: <0101018e9ad485db-33deedcb-6719-4477-9bb1-460f86bab284-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197808

--===============3885077684586292941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xev* to *1.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xev-upgrade-1.2.5-1.2.6.patch
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
From 6c28232222d14292f5761ab7f0e6d7a0415b2e69 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 14:39:01 +0000
Subject: [PATCH] xev: upgrade 1.2.5 -> 1.2.6

---
 meta/recipes-graphics/xorg-app/{xev_1.2.5.bb => xev_1.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.5.bb => xev_1.2.6.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.5.bb b/meta/recipes-graphics/xorg-app/xev_1.2.6.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-app/xev_1.2.5.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.6.bb
index 1d2e66b7b4..182aeff1b7 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.6.bb
@@ -12,6 +12,6 @@ PE = "1"
 
 DEPENDS += "libxrandr xorgproto"
 
-SRC_URI[sha256sum] = "c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1"
+SRC_URI[sha256sum] = "61e1c5e008ac9973aca7cdddf36e9df7410e77083b030eb04f4dc737c51807d7"
 
 SRC_URI_EXT = "xz"
-- 
2.42.0


--===============3885077684586292941==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xev-upgrade-1.2.5-1.2.6.patch"

RnJvbSA2YzI4MjMyMjIyZDE0MjkyZjU3NjFhYjdmMGU2ZDdhMDQxNWIyZTY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNDozOTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhl
djogdXBncmFkZSAxLjIuNSAtPiAxLjIuNgoKLS0tCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy1hcHAve3hldl8xLjIuNS5iYiA9PiB4ZXZfMS4yLjYuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctYXBwL3t4ZXZfMS4yLjUuYmIgPT4geGV2XzEuMi42LmJifSAoODQlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZXZfMS4yLjUuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV2XzEuMi42LmJiCnNpbWlsYXJpdHkgaW5k
ZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZXZfMS4y
LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZXZfMS4yLjYu
YmIKaW5kZXggMWQyZTY2YjdiNC4uMTgyYWVmZjFiNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctYXBwL3hldl8xLjIuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy1hcHAveGV2XzEuMi42LmJiCkBAIC0xMiw2ICsxMiw2IEBAIFBFID0gIjEiCiAKIERF
UEVORFMgKz0gImxpYnhyYW5kciB4b3JncHJvdG8iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJj
OTQ2MWE0Mzg5NzE0ZTBmMzM5NzRmOWU3NTkzNGJkYzM4ZDgzNmEwZjA1OWI4ZGMwODljN2NiZjJj
ZTM2ZWMxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYxZTFjNWUwMDhhYzk5NzNhY2E3Y2RkZGYz
NmU5ZGY3NDEwZTc3MDgzYjAzMGViMDRmNGRjNzM3YzUxODA3ZDciCiAKIFNSQ19VUklfRVhUID0g
Inh6IgotLSAKMi40Mi4wCgo=

--===============3885077684586292941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xev: SRC_URI changed from "https://www.x.org/releases//individual/app/xev-1.2.5.tar.xz" to "https://www.x.org/releases//individual/app/xev-1.2.6.tar.xz"
packages/core2-64-poky-linux/xev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-dbg: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-dbg: PKGSIZE changed from 68360 to 67864 (-1%)
packages/core2-64-poky-linux/xev/xev-dbg: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-dev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-dev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-doc: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-doc: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-locale: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-locale: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-src: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-src: PKGSIZE changed from 46810 to 46902 (+0%)
packages/core2-64-poky-linux/xev/xev-src: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-staticdev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-staticdev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev: PKGSIZE changed from 35208 to 35184 (-0%)
packages/core2-64-poky-linux/xev/xev: PV changed from "1.2.5" to "1.2.6"

--===============3885077684586292941==--

