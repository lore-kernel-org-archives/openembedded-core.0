Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4543CD98DD
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:50:34 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87198.1781337027808661549
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TZpw/LYa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dQaoqQxs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ebff5f1e3-c8821315-cd31-489d-a30f-265b7684bdd4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781337027;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TSDmYGKVV992SRo+TDK2TZhKYwXArcRVTjXzS35xq1A=;
	b=TZpw/LYa/QoIkuTc41gXsjx6WlGnTGECsQzdf69yoUDSgTf4v9nwZ9krOtgVjTat
	xh6glzXFOhEsaKW2FQ2bqSqHUVL5mf3yGobzxU0WcTVr/vxYmZ8KZ2AMYqiQ2A1o3W0
	3Ln5IScn5NawHFb0LHDOfdX0NnpkKvrzODCdPuaM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781337027;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TSDmYGKVV992SRo+TDK2TZhKYwXArcRVTjXzS35xq1A=;
	b=dQaoqQxsPXGjrZdgrhOCmMxOVEcjPpk2RMp06eKaAcTMgEjrJk6Go0G+ab0G1DgY
	Kpuo0LYk4PK/FoOtIm+xEBO/bISR6l2uh85IlQVe94XwAK3LCqr2NRPvNGa33CaasPP
	wRdYsV8EmrOqP1VEjcR4rm2Q1tbocxsYE/FtGz4w=
Content-Type: multipart/mixed; boundary="===============7425605319807149669=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-python: upgrading to 1.28.4 SUCCEEDED
Message-ID: <0101019ebff5f1e3-c8821315-cd31-489d-a30f-265b7684bdd4-000000@us-west-2.amazonses.com>
Date: Sat, 13 Jun 2026 07:50:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.13-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 07:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238663

--===============7425605319807149669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.28.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.28.2-1.28.4.patch
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
From a84c0a03aea1510cbc2ed3285461b9a2dff44b8d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 13 Jun 2026 07:41:47 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.28.2 -> 1.28.4

---
 ...reamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
index 181e3d8ea4..555b310594 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "12fdd8e19af97d797a6b2c195228e6c9edc4cddfa68274912b78ef66068ad822"
+SRC_URI[sha256sum] = "c4eb382720b4443fb801a53418dff0bd4cd7478716d5ced493504a675b4d09fd"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.47.1


--===============7425605319807149669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-python/1.28.2/plugin -> /usr/src/debug/gstreamer1.0-python/1.28.4/plugin, directory renamed /usr/src/debug/gstreamer1.0-python/1.28.2/gi/overrides -> /usr/src/debug/gstreamer1.0-python/1.28.4/gi/overrides
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.28.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.28.4.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-python: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python: PV changed from "1.28.2" to "1.28.4"

--===============7425605319807149669==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.28.2-1.28.4.patch"

RnJvbSBhODRjMGEwM2FlYTE1MTBjYmMyZWQzMjg1NDYxYjlhMmRmZjQ0YjhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTMgSnVuIDIwMjYgMDc6NDE6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjguMiAtPiAxLjI4LjQKCi0tLQogLi4ucmVh
bWVyMS4wLXB5dGhvbl8xLjI4LjIuYmIgPT4gZ3N0cmVhbWVyMS4wLXB5dGhvbl8xLjI4LjQuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcHl0
aG9uXzEuMjguMi5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjguNC5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI4LjIuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI4LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25f
MS4yOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI4LjQuYmIKaW5kZXggMTgxZTNkOGVhNC4uNTU1YjMxMDU5NCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1weXRob25fMS4yOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjguNC5iYgpAQCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9
ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWMzNGRlYWU0ZTM5NWNhMDdlNzI1YWIwMDc2YTVmNzQwIgogCiBTUkNfVVJJID0gImh0dHBz
Oi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BW
fS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTJmZGQ4ZTE5YWY5N2Q3OTdhNmIyYzE5
NTIyOGU2YzllZGM0Y2RkZmE2ODI3NDkxMmI3OGVmNjYwNjhhZDgyMiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJjNGViMzgyNzIwYjQ0NDNmYjgwMWE1MzQxOGRmZjBiZDRjZDc0Nzg3MTZkNWNlZDQ5
MzUwNGE2NzViNGQwOWZkIgogCiBERVBFTkRTID0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZCIK
IFJERVBFTkRTOiR7UE59ICs9ICJnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZSBweXRob24zLXB5Z29iamVjdCIKLS0gCjIuNDcuMQoK

--===============7425605319807149669==--

