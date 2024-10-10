Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0573CD0D78C
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:42 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.53372.1728588960823120631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AoKsvVvu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=WORIDIug;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019277eeed3f-206dc20e-a3d6-4b40-9b04-cd1831242009-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728589000;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I9pwEEzpD+sGvavu6zDZpkeb9FN4dUhPAZg6ce4bmak=;
	b=AoKsvVvuMXYFLiHEhDutg3SccW83o4Hpu7VYk3HENka4xuglcl8VtnQW6HvFhpmW
	iE7OieiSJOUVpLf5UjEWRUGRNcFWIBPhuZdk4q5mo9WKUcrhqzV0X53MTxOrGFfi9ai
	C4VTgwRmTe9CtnJKzFH5g9reDsZPT1L+yTHMFF4s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728589000;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I9pwEEzpD+sGvavu6zDZpkeb9FN4dUhPAZg6ce4bmak=;
	b=WORIDIuglpU52hjNLbIN/IIc+QYSlXwaMbHL/4BLLLYcN4HGgngO3g7hEgqX94z7
	+r6J9LGpAurkpP56o6YyZRKwJnDQAmX29zHnyd2etq6th7TLQtn8MryYy2AbgSw6yYv
	atdIs6MTUJikeRmT/Q7Bg15bOOcwmmS5T1zBSfWk=
Content-Type: multipart/mixed; boundary="===============6853666511144736308=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.24.8 SUCCEEDED
Message-ID: <0101019277eeed3f-206dc20e-a3d6-4b40-9b04-cd1831242009-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205620

--===============6853666511144736308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.24.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.24.6-1.24.8.patch
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
From 2aa010cc837ed6ec03703b54c89000b8a29ce935 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 16:03:54 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.24.6 -> 1.24.8

---
 ...reamer1.0-python_1.24.6.bb => gstreamer1.0-python_1.24.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.6.bb => gstreamer1.0-python_1.24.8.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.8.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.8.bb
index cf38c2b876..a0ba866e55 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.8.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "692e88820e097b30e5f92d37d0955c709a0a17b27f874a1907405244825bd700"
+SRC_URI[sha256sum] = "0663d0d13f2692f573179c97b7c84e22600d14a2af757fc1740c7c4a3434c7fe"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.44.1


--===============6853666511144736308==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.24.6-1.24.8.patch"

RnJvbSAyYWEwMTBjYzgzN2VkNmVjMDM3MDNiNTRjODkwMDBiOGEyOWNlOTM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTY6MDM6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjQuNiAtPiAxLjI0LjgKCi0tLQogLi4ucmVh
bWVyMS4wLXB5dGhvbl8xLjI0LjYuYmIgPT4gZ3N0cmVhbWVyMS4wLXB5dGhvbl8xLjI0LjguYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcHl0
aG9uXzEuMjQuNi5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjQuOC5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI0LjYuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI0LjguYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25f
MS4yNC42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI0LjguYmIKaW5kZXggY2YzOGMyYjg3Ni4uYTBiYTg2NmU1NSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1weXRob25fMS4yNC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjQuOC5iYgpAQCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9
ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWMzNGRlYWU0ZTM5NWNhMDdlNzI1YWIwMDc2YTVmNzQwIgogCiBTUkNfVVJJID0gImh0dHBz
Oi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BW
fS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjkyZTg4ODIwZTA5N2IzMGU1ZjkyZDM3
ZDA5NTVjNzA5YTBhMTdiMjdmODc0YTE5MDc0MDUyNDQ4MjViZDcwMCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwNjYzZDBkMTNmMjY5MmY1NzMxNzljOTdiN2M4NGUyMjYwMGQxNGEyYWY3NTdmYzE3
NDBjN2M0YTM0MzRjN2ZlIgogCiBERVBFTkRTID0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IgogUkRFUEVORFM6JHtQTn0gKz0gImdzdHJl
YW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IgotLSAK
Mi40NC4xCgo=

--===============6853666511144736308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-python: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.6.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.8.tar.xz"

--===============6853666511144736308==--

