Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D6CC0218E
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.17873.1736936771296281950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WaNK7bQp;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=19ogc1Mx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194697fcc0c-cfb35ed4-75d2-40fd-bf3b-3bb19c388588-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1YOYrW1GiYISd4MeWO/kKuCtgUz9ytQNjAqEVHl5XHg=;
	b=WaNK7bQpkiPSDmg80QGqgnxPTwIezuceBYmxy5SeP4XCO/1NhRE+Cz8e2YNiSWHw
	1cZqozzQU5ecsjuPlQf2iiQ4yaVnooTPW+/2mdoDmkNe3Gv4OPC5cR6dBr7r1U9U1W2
	7N0cCKN3UZg0TkwUVvzZuSjBvzivhrS3gffbrov4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1YOYrW1GiYISd4MeWO/kKuCtgUz9ytQNjAqEVHl5XHg=;
	b=19ogc1MxS/k/Z17DFVIP0dqGr5546AoLQ7kcYZW4/C7jRjYqvEi3miv9mzvc2xvb
	t4YiI3Z94cXyaSRs7fxcgnSzNWxr2xf6YfOvuGYMJCzwDhWa4YSRFdN85ZNLsh+gLdd
	SC8a5EIM/lsKjgtumm1y2g0FmwZBXOi0h9g5fVIw=
Content-Type: multipart/mixed; boundary="===============6015611324609931310=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2025.1.10.15 SUCCEEDED
Message-ID: <01010194697fcc0c-cfb35ed4-75d2-40fd-bf3b-3bb19c388588-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209848

--===============6015611324609931310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-trove-classifiers* to *2025.1.10.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2024.10.21.16-2025.patch
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
From 35a6bea9ecb24b17c6cfa11652c3c131b16ac623 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 07:55:18 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2024.10.21.16 ->
 2025.1.10.15

---
 ...24.10.21.16.bb => python3-trove-classifiers_2025.1.10.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.10.21.16.bb => python3-trove-classifiers_2025.1.10.15.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2025.1.10.15.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2025.1.10.15.bb
index b63d39b784..9a27def298 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.10.21.16.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2025.1.10.15.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "17cbd055d67d5e9d9de63293a8732943fabc21574e4c7b74edf112b4928cf5f3"
+SRC_URI[sha256sum] = "be2c7d25e46cd39d5c7151acd389584df3919f61890f5f163c8ee2090ff71e7f"
 
 PYPI_PACKAGE = "trove_classifiers"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.44.1


--===============6015611324609931310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2024.10.21.16.tar.gz;downloadfilename=trove_classifiers-2024.10.21.16.tar.gz" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2025.1.10.15.tar.gz;downloadfilename=trove_classifiers-2025.1.10.15.tar.gz"
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2024.10.21.16" to "2025.1.10.15"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2024.10.21.16 [default] to 2025.1.10.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2024.10.21.16" to "2025.1.10.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2024.10.21.16 [default] to 2025.1.10.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2024.10.21.16" to "2025.1.10.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2024.10.21.16 [default] to 2025.1.10.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2024.10.21.16" to "2025.1.10.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2024.10.21.16 [default] to 2025.1.10.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2024.10.21.16" to "2025.1.10.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2024.10.21.16 [default] to 2025.1.10.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2024.10.21.16" to "2025.1.10.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2024.10.21.16 [default] to 2025.1.10.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2024.10.21.16" to "2025.1.10.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2024.10.21.16 [default] to 2025.1.10.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2024.10.21.16" to "2025.1.10.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2024.10.21.16 [default] to 2025.1.10.15 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2024.10.21.16" to "2025.1.10.15"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 92657 to 92884 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2024.10.21.16 [default] to 2025.1.10.15 [default]
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/WHEEL was removed

--===============6015611324609931310==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2024.10.21.16-2025.patch"

RnJvbSAzNWE2YmVhOWVjYjI0YjE3YzZjZmExMTY1MmMzYzEzMWIxNmFjNjIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6NTU6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjQuMTAuMjEuMTYgLT4KIDIwMjUu
MS4xMC4xNQoKLS0tCiAuLi4yNC4xMC4yMS4xNi5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZp
ZXJzXzIwMjUuMS4xMC4xNS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuMTAuMjEuMTYuYmIgPT4gcHl0aG9uMy10cm92
ZS1jbGFzc2lmaWVyc18yMDI1LjEuMTAuMTUuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuMTAu
MjEuMTYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xh
c3NpZmllcnNfMjAyNS4xLjEwLjE1LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDI0LjEwLjIxLjE2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNS4xLjEwLjE1LmJiCmluZGV4IGI2M2QzOWI3ODQu
LjlhMjdkZWYyOTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjEwLjIxLjE2LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI1LjEuMTAuMTUu
YmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3Ry
b3ZlLWNsYXNzaWZpZXJzIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjci
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxN2NiZDA1NWQ2N2Q1ZTlkOWRlNjMyOTNhODczMjk0
M2ZhYmMyMTU3NGU0YzdiNzRlZGYxMTJiNDkyOGNmNWYzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImJlMmM3ZDI1ZTQ2Y2QzOWQ1YzcxNTFhY2QzODk1ODRkZjM5MTlmNjE4OTBmNWYxNjNjOGVlMjA5
MGZmNzFlN2YiCiAKIFBZUElfUEFDS0FHRSA9ICJ0cm92ZV9jbGFzc2lmaWVycyIKIFVQU1RSRUFN
X0NIRUNLX1BZUElfUEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCi0tIAoyLjQ0LjEKCg==

--===============6015611324609931310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.1.10.15.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2024.10.21.16.dist-info/WHEEL was removed

--===============6015611324609931310==--

