Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29ABC3DA5A
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.18603.1718475798752928871
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iKs3nfc5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NmCMndGU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101901d23be50-bb7f5fa8-1a2e-4b2a-8325-7f7313e1bf79-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ld2j5DIXKYE+uAaXgf/WGoqTtEdQ3K4X6zudv/RIWfc=;
	b=iKs3nfc5KXysN9gw/FnuKjwC1fZRAC91WRjlalc7G8etzNAerqj+y7CceCq855lF
	u/j8F0LAORPkckrLoUju50jwR9FmfEDEwaBSuxSk+3rcN2tx9mAc88OYM439p0eAQnS
	sp9CHkkwpxnfrFosZI+QzuK7/8xaAdOxbAg/JRfs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ld2j5DIXKYE+uAaXgf/WGoqTtEdQ3K4X6zudv/RIWfc=;
	b=NmCMndGUYn1JOK69RzxhutdYmR6rxs9L2vtOiBszsZBrQo1U1f99lDDDJiL1Morh
	2vogiGD2vtSzijK1dIZS+T5p72NpGSLtGQaXSHKomo5rf+GQ1wtDVE4ixup23cE0LHp
	J3rJg4GIz1rBSQ9NxSnzECgUXOicS4nn10GppExQ=
Content-Type: multipart/mixed; boundary="===============1658594473362694548=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.24.4 SUCCEEDED
Message-ID: <010101901d23be50-bb7f5fa8-1a2e-4b2a-8325-7f7313e1bf79-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200740

--===============1658594473362694548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.24.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.24.3-1.24.4.patch
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
From e92947d5f9ace629c63fe67789dff4c804cf19e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 15:46:26 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.24.3 -> 1.24.4

---
 ...reamer1.0-python_1.24.3.bb => gstreamer1.0-python_1.24.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.3.bb => gstreamer1.0-python_1.24.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
index 5fbf860741..6f05863486 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ecdb3e2ba94ea2c82b93a8c715d5a7e04f9726a8838c0a6b17694928fd1e8595"
+SRC_URI[sha256sum] = "5510358316eb5c965829a393714b4d88306033cd64db3eae8cc62b41ae80a392"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.44.0


--===============1658594473362694548==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.24.3-1.24.4.patch"

RnJvbSBlOTI5NDdkNWY5YWNlNjI5YzYzZmU2Nzc4OWRmZjRjODA0Y2YxOWUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTU6NDY6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjQuMyAtPiAxLjI0LjQKCi0tLQogLi4ucmVh
bWVyMS4wLXB5dGhvbl8xLjI0LjMuYmIgPT4gZ3N0cmVhbWVyMS4wLXB5dGhvbl8xLjI0LjQuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcHl0
aG9uXzEuMjQuMy5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjQuNC5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI0LjMuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI0LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25f
MS4yNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI0LjQuYmIKaW5kZXggNWZiZjg2MDc0MS4uNmYwNTg2MzQ4NiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1weXRob25fMS4yNC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjQuNC5iYgpAQCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9
ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWMzNGRlYWU0ZTM5NWNhMDdlNzI1YWIwMDc2YTVmNzQwIgogCiBTUkNfVVJJID0gImh0dHBz
Oi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BW
fS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWNkYjNlMmJhOTRlYTJjODJiOTNhOGM3
MTVkNWE3ZTA0Zjk3MjZhODgzOGMwYTZiMTc2OTQ5MjhmZDFlODU5NSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI1NTEwMzU4MzE2ZWI1Yzk2NTgyOWEzOTM3MTRiNGQ4ODMwNjAzM2NkNjRkYjNlYWU4
Y2M2MmI0MWFlODBhMzkyIgogCiBERVBFTkRTID0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IgogUkRFUEVORFM6JHtQTn0gKz0gImdzdHJl
YW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IgotLSAK
Mi40NC4wCgo=

--===============1658594473362694548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.24.3 [default] to 1.24.4 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: PV changed from "1.24.3" to "1.24.4"
packages/core2-64-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.24.4.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-python: PKGV changed from 1.24.3 [default] to 1.24.4 [default]

--===============1658594473362694548==--

