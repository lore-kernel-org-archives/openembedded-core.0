Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72378C02194
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:08 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.17868.1736936768131134260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=V6Zcad7B;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=RAlPNMUK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194697fbfb3-81ae04bc-1794-4577-9156-dc4b1117cf4b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936767;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=C0Yxaro5O+/fwbNBCuJdq3Ym4u67++WoyAe/xoOg2Kw=;
	b=V6Zcad7BXvRzZKeqTSVBBJG9Uh5oA+/kEsEHnUVXImORdi3G8uYT3xuYfluzjfpa
	/MOfjM3vAdJtAeV4j8yOTBKw2F9qWM5ix2AMfRaMzZhFkoSYntN0JmcFv88M5arP0Ns
	nXQQQvfseNATJk0knW1CUbwBydmjjGp0YSpNlx3M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936767;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=C0Yxaro5O+/fwbNBCuJdq3Ym4u67++WoyAe/xoOg2Kw=;
	b=RAlPNMUKD9cAuUqdt/4wHPFLKhO22SYgsJa5IhCkSIFKXLtxc6ML2SFqCFqmcxcd
	SE8kQNc07q9HbBpy73iundq8T+XpAYKKot7OYz2n/R3OouBA1yx2p6kqtEx0BzqIIdE
	vTD+4feJDDfjqTm4TesVxMV5xAzy4arHWR4xsNYk=
Content-Type: multipart/mixed; boundary="===============2067804930793194671=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.123.17 SUCCEEDED
Message-ID: <01010194697fbfb3-81ae04bc-1794-4577-9156-dc4b1117cf4b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209839

--===============2067804930793194671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.123.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.123.2-6.123.17.patch
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
From 75d3e5d5f70bb7aba2989edacb2f6506f906fa96 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 07:28:22 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.123.2 -> 6.123.17

---
 ...on3-hypothesis_6.123.2.bb => python3-hypothesis_6.123.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.123.2.bb => python3-hypothesis_6.123.17.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.123.17.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.123.17.bb
index 5f13a6ca8b..a11f73874f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.123.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.123.17.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "02c25552783764146b191c69eef69d8375827b58a75074055705ab8fdbc95fc5"
+SRC_URI[sha256sum] = "5850893975b4f08e893ddc10f1d468bc7e011d59703f70fe06a10161e426e602"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.44.1


--===============2067804930793194671==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.123.2-6.123.17.patch"

RnJvbSA3NWQzZTVkNWY3MGJiN2FiYTI5ODllZGFjYjJmNjUwNmY5MDZmYTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6Mjg6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xMjMuMiAtPiA2LjEyMy4xNwoKLS0tCiAuLi5v
bjMtaHlwb3RoZXNpc182LjEyMy4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjEyMy4xNy5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNf
Ni4xMjMuMi5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi4xMjMuMTcuYmJ9ICg5MSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNf
Ni4xMjMuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhl
c2lzXzYuMTIzLjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTIzLjIuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTIz
LjE3LmJiCmluZGV4IDVmMTNhNmNhOGIuLmExMWY3Mzg3NGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTIzLjIuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMjMuMTcu
YmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUu
cHkgXAogICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAyYzI1NTUyNzgzNzY0MTQ2YjE5
MWM2OWVlZjY5ZDgzNzU4MjdiNThhNzUwNzQwNTU3MDVhYjhmZGJjOTVmYzUiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNTg1MDg5Mzk3NWI0ZjA4ZTg5M2RkYzEwZjFkNDY4YmM3ZTAxMWQ1OTcwM2Y3
MGZlMDZhMTAxNjFlNDI2ZTYwMiIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9u
My1hdHRycyBcCi0tIAoyLjQ0LjEKCg==

--===============2067804930793194671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.123.2" to "6.123.17"
packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.123.2.tar.gz;downloadfilename=hypothesis-6.123.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.123.17.tar.gz;downloadfilename=hypothesis-6.123.17.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.123.2 [default] to 6.123.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.123.2" to "6.123.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.123.2 [default] to 6.123.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.123.2" to "6.123.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.123.2 [default] to 6.123.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.123.2" to "6.123.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.123.2 [default] to 6.123.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.123.2" to "6.123.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.123.2 [default] to 6.123.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.123.2" to "6.123.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.123.2 [default] to 6.123.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.123.2" to "6.123.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.123.2 [default] to 6.123.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.123.2" to "6.123.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.123.2 [default] to 6.123.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.123.2" to "6.123.17"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.123.2 [default] to 6.123.17 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3204677 to 3204270 (-0%)
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info/WHEEL was removed

--===============2067804930793194671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.17.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/hypothesis-6.123.2.dist-info/WHEEL was removed

--===============2067804930793194671==--

