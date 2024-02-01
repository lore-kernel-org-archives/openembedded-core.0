Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DBCC48BEB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2160.1706810406469666672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gHAlBQ5e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FG1HFype;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d65d3fb2b-dfb2e0dd-ef26-428d-b57c-3da88fca3cf7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GGAEdQnon1EJkivWeiE3b7L7UAcjesO4M4MZNfQFqW0=;
	b=gHAlBQ5eSUlmnDjWD4ue6Vl+lsF2wH0yHZ2qe5YDwS9E5kLTqELgCGYq9InsLq9E
	VlD8kGo4af5nArIkxuDjj48xpVMiI81cBSk/r37yBV7/zvlgN7KoUA3xtzJ+HIg7XyX
	YPiNJwtDStGI0acDIP9prjrsULKoULOd8nUL0ud0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GGAEdQnon1EJkivWeiE3b7L7UAcjesO4M4MZNfQFqW0=;
	b=FG1HFyperxPVV6yNISwQBwZR9QLt1pejDICXYNAl2Xzl5FLpYemY7suicVhKmKai
	ZBHMsuVnwANfcRFaGYWDQgyriFgErSFoB02scs7nH0gN8R3v2xq6+Cdjn1QD7ws7tZR
	9TuFIv7905LXs0LpR3xU7sIVHlCm4Cu6KMix2HkI=
Content-Type: multipart/mixed; boundary="===============4669824873741426233=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.22.9 SUCCEEDED
Message-ID: <0101018d65d3fb2b-dfb2e0dd-ef26-428d-b57c-3da88fca3cf7-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194701

--===============4669824873741426233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.22.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.22.8-1.22.9.patch
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
From fce03a20dfb49bdbbe02b078d58cdc2e5dbbe38d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 15:07:38 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.22.8 -> 1.22.9

---
 ...reamer1.0-python_1.22.8.bb => gstreamer1.0-python_1.22.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.8.bb => gstreamer1.0-python_1.22.9.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.8.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.8.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.9.bb
index fc182af976..e086fa6866 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.8.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.9.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d5cb8f144054a2a110e6672bd512e4b15d5b1b8d9879c192b9723535efb70b8f"
+SRC_URI[sha256sum] = "3f9d5c6ffefda268703744b592a6b3983aa6723273b1220ecbcb62c2a5800009"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.42.0


--===============4669824873741426233==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.22.8-1.22.9.patch"

RnJvbSBmY2UwM2EyMGRmYjQ5YmRiYmUwMmIwNzhkNThjZGMyZTVkYmJlMzhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxNTowNzozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1weXRob246IHVwZ3JhZGUgMS4yMi44IC0+IDEuMjIuOQoKLS0tCiAuLi5yZWFt
ZXIxLjAtcHl0aG9uXzEuMjIuOC5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjIuOS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1weXRo
b25fMS4yMi44LmJiID0+IGdzdHJlYW1lcjEuMC1weXRob25fMS4yMi45LmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
cHl0aG9uXzEuMjIuOC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjIuOS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXB5dGhvbl8x
LjIyLjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtcHl0aG9uXzEuMjIuOS5iYgppbmRleCBmYzE4MmFmOTc2Li5lMDg2ZmE2ODY2IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjIyLjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMC1weXRob25fMS4yMi45LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNFID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9YzM0ZGVhZTRlMzk1Y2EwN2U3MjVhYjAwNzZhNWY3NDAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6
Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNWNiOGYxNDQwNTRhMmExMTBlNjY3MmJk
NTEyZTRiMTVkNWIxYjhkOTg3OWMxOTJiOTcyMzUzNWVmYjcwYjhmIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjNmOWQ1YzZmZmVmZGEyNjg3MDM3NDRiNTkyYTZiMzk4M2FhNjcyMzI3M2IxMjIwZWNi
Y2I2MmMyYTU4MDAwMDkiCiAKIERFUEVORFMgPSAiZ3N0cmVhbWVyMS4wIGdzdHJlYW1lcjEuMC1w
bHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCiBSREVQRU5EUzoke1BOfSArPSAiZ3N0cmVh
bWVyMS4wIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UgcHl0aG9uMy1weWdvYmplY3QiCi0tIAoy
LjQyLjAKCg==

--===============4669824873741426233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: PV changed from "1.22.8" to "1.22.9"
packages/core2-64-poky-linux/gstreamer1.0-python: PKGV changed from 1.22.8 [default] to 1.22.9 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.8.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.9.tar.xz"

--===============4669824873741426233==--

