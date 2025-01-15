Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15042C021B4
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:32 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.17866.1736936767313295345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=K2jhb65m;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=TOuaEanZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194697ff673-43aceafc-0492-4c09-a36d-770e6f6484b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936781;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rcyEPAuVsd1J2+Rs8fu3toC90QGQ/HMisZJw03pqcLc=;
	b=K2jhb65mONIn3m40YuxeevamSh+2ANWQNTCqZP8In86SSkWHf5g2+PVYHnvMmbOB
	xzB41QhjilCXqFu7J4Bzzarg9xKzg1ikgaItB+SXFevoW+2EkTwOUifouYFi3SQx7WL
	6yrwPqCJNhQLp97Vn7FMcG4Q9WgWQGGeQMJIajGA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936781;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rcyEPAuVsd1J2+Rs8fu3toC90QGQ/HMisZJw03pqcLc=;
	b=TOuaEanZlQwh2WlWmOVkqu2uqJlthvrcBSpxW6JrxuRWvtxtUpsMrae8OC6ViPZf
	92+gsSi+MZV6mHcOTeyb498RaAHm9GxlteXtvbUF52szUHyyoxU4EahJclWtDw9zpri
	O7kHmt7U7gtLx1ddmPhvO8A1RvcWVD14u7Jmg56k=
Content-Type: multipart/mixed; boundary="===============7998220280887982899=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.24.11 SUCCEEDED
Message-ID: <01010194697ff673-43aceafc-0492-4c09-a36d-770e6f6484b8-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209883

--===============7998220280887982899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.24.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.24.10-1.24.11.patch
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
From 39e70b41f6a768034afa1b088a8533b18df6f768 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 10:05:18 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.24.10 -> 1.24.11

---
 ...amer1.0-python_1.24.10.bb => gstreamer1.0-python_1.24.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.10.bb => gstreamer1.0-python_1.24.11.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.11.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.11.bb
index f682f093eb..4fd1912af1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.11.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "135bcf8b6f1468bc31e5660409fe8ed38109f01dec44743514aa2fa6b3863309"
+SRC_URI[sha256sum] = "f4c8761bfee98508f57e2efd738ef36a99e2f7644860877d54d235a7092cf056"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.44.1


--===============7998220280887982899==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.24.10-1.24.11.patch"

RnJvbSAzOWU3MGI0MWY2YTc2ODAzNGFmYTFiMDg4YTg1MzNiMThkZjZmNzY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMTA6MDU6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjQuMTAgLT4gMS4yNC4xMQoKLS0tCiAuLi5h
bWVyMS4wLXB5dGhvbl8xLjI0LjEwLmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yNC4xMS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1w
eXRob25fMS4yNC4xMC5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjQuMTEuYmJ9ICg5MSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1weXRob25fMS4yNC4xMC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjQuMTEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1w
eXRob25fMS4yNC4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1weXRob25fMS4yNC4xMS5iYgppbmRleCBmNjgyZjA5M2ViLi40ZmQx
OTEyYWYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI0LjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjQuMTEuYmIKQEAgLTgsNyArOCw3IEBA
IExJQ0VOU0UgPSAiTEdQTC0yLjEtb3ItbGF0ZXIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT1jMzRkZWFlNGUzOTVjYTA3ZTcyNWFiMDA3NmE1Zjc0MCIKIAogU1JDX1VS
SSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjLyR7UE5SRUFMfS8ke1BO
UkVBTH0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEzNWJjZjhiNmYxNDY4
YmMzMWU1NjYwNDA5ZmU4ZWQzODEwOWYwMWRlYzQ0NzQzNTE0YWEyZmE2YjM4NjMzMDkiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZjRjODc2MWJmZWU5ODUwOGY1N2UyZWZkNzM4ZWYzNmE5OWUyZjc2
NDQ4NjA4NzdkNTRkMjM1YTcwOTJjZjA1NiIKIAogREVQRU5EUyA9ICJnc3RyZWFtZXIxLjAgZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZSBweXRob24zLXB5Z29iamVjdCIKIFJERVBFTkRTOiR7UE59
ICs9ICJnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZSBweXRob24zLXB5Z29i
amVjdCIKLS0gCjIuNDQuMQoK

--===============7998220280887982899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.24.10 [default] to 1.24.11 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.10.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.11.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-python: PV changed from "1.24.10" to "1.24.11"
packages/core2-64-poky-linux/gstreamer1.0-python: PKGV changed from 1.24.10 [default] to 1.24.11 [default]

--===============7998220280887982899==--

