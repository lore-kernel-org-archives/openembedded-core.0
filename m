Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5130DC54E67
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:34 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20155.1708018344261720170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dMqjkQZC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=goLlo8a5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dadd3aad5-d65cec34-7e73-4085-b1b7-a4fa50d41925-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cFLrqohjrpAcIw67pC0M8isSzAIJK4NB4X3pkZKsSeA=;
	b=dMqjkQZCHo9DIqem2Wsv/FE0buxl/K2DzkRWBO/tZ5xUBDbZG/iEaZ21ubMeDx0V
	OFLrHxPKFrLWdqoVesUH0c5N5DrD/TFty6jvSwgDLet7uz13HP8IuGeAulhyXPKbme3
	R9fVDCpoPSUNGefa/szCeksAkOKTqp4+xbZBQCIE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cFLrqohjrpAcIw67pC0M8isSzAIJK4NB4X3pkZKsSeA=;
	b=goLlo8a5pq3IRxVLLJKUjwSE3S2t5AgTjqHnktezcK/j3gnOdDqPfi/QqidX6r+2
	igI6D1LO5m243QvsIWRd96x2o0lKHeyq3gWFYI2oXKsmuiItKca175/9AD77KwEImH4
	JD807FF9Jh6O1LCVuO7Ql5P4rNTBr4FpkKfueJlo=
Content-Type: multipart/mixed; boundary="===============2876119304060396104=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.22.10 SUCCEEDED
Message-ID: <0101018dadd3aad5-d65cec34-7e73-4085-b1b7-a4fa50d41925-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195633

--===============2876119304060396104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.22.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.22.9-1.22.10.patch
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
From 7da9baccebbdcaf00196c8a9dac24e4f43e3e466 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 14:47:16 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.22.9 -> 1.22.10

---
 ...treamer1.0-libav_1.22.9.bb => gstreamer1.0-libav_1.22.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.9.bb => gstreamer1.0-libav_1.22.10.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.10.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.10.bb
index 10536acc87..818dbf4e5e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "192f7d27d21c1e7c72c339a2647a9b0c247fedc62ea5029115f8c3e22ebb87d8"
+SRC_URI[sha256sum] = "d6dda7aa38a44173278de675ccd92acff0abf473f7bc02e7d1cdd4ce0f3b7642"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.42.0


--===============2876119304060396104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 856816 to 856848 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 500246 to 500358 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.9.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.10.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.22.9" to "1.22.10"

--===============2876119304060396104==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.22.9-1.22.10.patch"

RnJvbSA3ZGE5YmFjY2ViYmRjYWYwMDE5NmM4YTlkYWMyNGU0ZjQzZTNlNDY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTQ6NDc6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yMi45IC0+IDEuMjIuMTAKCi0tLQogLi4udHJl
YW1lcjEuMC1saWJhdl8xLjIyLjkuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjIuMTAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtbGli
YXZfMS4yMi45LmJiID0+IGdzdHJlYW1lcjEuMC1saWJhdl8xLjIyLjEwLmJifSAoOTElKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAt
bGliYXZfMS4yMi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1saWJhdl8xLjIyLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZfMS4y
Mi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjIuMTAuYmIKaW5kZXggMTA1MzZhY2M4Ny4uODE4ZGJmNGU1ZSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1s
aWJhdl8xLjIyLjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1saWJhdl8xLjIyLjEwLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5Zjdh
NzcwIFwKICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVh
bWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTkyZjdkMjdkMjFjMWU3YzcyYzMzOWEyNjQ3YTliMGMy
NDdmZWRjNjJlYTUwMjkxMTVmOGMzZTIyZWJiODdkOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJk
NmRkYTdhYTM4YTQ0MTczMjc4ZGU2NzVjY2Q5MmFjZmYwYWJmNDczZjdiYzAyZTdkMWNkZDRjZTBm
M2I3NjQyIgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjQyLjAK
Cg==

--===============2876119304060396104==--

