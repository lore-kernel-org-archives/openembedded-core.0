Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D10C54FBE
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.14636.1700059032733415021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dT7ja389;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kTb1OUQ5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018bd36a2cfc-fcad5613-61a3-425b-9e73-31eb42faf13b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pfRU/S1I8pADBmHxvcT/TxRlKjvQO3uJqMVuDqIqCRw=;
	b=dT7ja3898LRf+twj/3sHlZ9mYnjQcV1iF7IEu4I5fC3Gpi19ueSrpOYaqOJ1rvVA
	wMdSq0d5Wn6viumWNGGHegWE/ef9TQ+/AcbytLQewxeuJ8jn3p4rwASiqrWxxpsmOrb
	j3w/0UusN+WVQZtEiCfn29kA8ZqN73NgJOOqgMDk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pfRU/S1I8pADBmHxvcT/TxRlKjvQO3uJqMVuDqIqCRw=;
	b=kTb1OUQ5LjCelO5Elh4N8GdKXxBRgfOyWpD2q9ddlk6ZoBxGWSYgK1TTNdJ9rewH
	h4v38bOFhwvAnve+X08BhtPVuyVNvpzDIr2OWO3TOx+gctzXICu2j0Xwi4kXYWaW+mh
	tmvxAMwHIe1SvGZOEHlEzM2LtwGGBWbgCYJVN6f0=
Content-Type: multipart/mixed; boundary="===============0070532079906986232=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-python: upgrading to 1.22.7 SUCCEEDED
Message-ID: <0101018bd36a2cfc-fcad5613-61a3-425b-9e73-31eb42faf13b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190705

--===============0070532079906986232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-python* to *1.22.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.22.6-1.22.7.patch
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
From 15dbb9c3934652574e734e871ebe9ceda71a176f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 13:24:16 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.22.6 -> 1.22.7

---
 ...reamer1.0-python_1.22.6.bb => gstreamer1.0-python_1.22.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.6.bb => gstreamer1.0-python_1.22.7.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
index addf12c427..a387031635 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "51de2d6d13b12ce095eac97c0b94ee59c2aeba3712bb7462b78c4d57dde176c5"
+SRC_URI[sha256sum] = "1ef8df7608012fa469329799c950ec087737a6dabad3003c230658b58c710172"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.39.2


--===============0070532079906986232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-python: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.6.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.7.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-python: PKGV changed from 1.22.6 [default] to 1.22.7 [default]

--===============0070532079906986232==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.22.6-1.22.7.patch"

RnJvbSAxNWRiYjljMzkzNDY1MjU3NGU3MzRlODcxZWJlOWNlZGE3MWExNzZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTM6MjQ6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjIuNiAtPiAxLjIyLjcKCi0tLQogLi4ucmVh
bWVyMS4wLXB5dGhvbl8xLjIyLjYuYmIgPT4gZ3N0cmVhbWVyMS4wLXB5dGhvbl8xLjIyLjcuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcHl0
aG9uXzEuMjIuNi5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjIuNy5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjIyLjYuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjIyLjcuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25f
MS4yMi42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjIyLjcuYmIKaW5kZXggYWRkZjEyYzQyNy4uYTM4NzAzMTYzNSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1weXRob25fMS4yMi42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjIuNy5iYgpAQCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9
ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWMzNGRlYWU0ZTM5NWNhMDdlNzI1YWIwMDc2YTVmNzQwIgogCiBTUkNfVVJJID0gImh0dHBz
Oi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BW
fS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTFkZTJkNmQxM2IxMmNlMDk1ZWFjOTdj
MGI5NGVlNTljMmFlYmEzNzEyYmI3NDYyYjc4YzRkNTdkZGUxNzZjNSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIxZWY4ZGY3NjA4MDEyZmE0NjkzMjk3OTljOTUwZWMwODc3MzdhNmRhYmFkMzAwM2My
MzA2NThiNThjNzEwMTcyIgogCiBERVBFTkRTID0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IgogUkRFUEVORFM6JHtQTn0gKz0gImdzdHJl
YW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IgotLSAK
Mi4zOS4yCgo=

--===============0070532079906986232==--

