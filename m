Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FC7D60059
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4676.1731964628395907172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=YDkJi76e;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=w1DuVgjS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101934122e9ed-29049d20-3018-4de1-a7a1-959e7d6f9c41-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=npaTjZzPfSp+1yy9pdYtHyP/ZfBMoImURACl17LNCiE=;
	b=YDkJi76etaVuk4TY2DMH0PZKClagU+eExqAcW9DEQIlbmkr2Kbp5OFAFaBGK+hBe
	xdVduaVlBzjSW/LWvGnKYQy8+ZlapEFH5mgorKVYnGb35BN91u5Z2eCeH/tKDeN51Vd
	be+h3Z9MUk6CywbTKX0nplpH1WR83X7zkFklJWDc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964627;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=npaTjZzPfSp+1yy9pdYtHyP/ZfBMoImURACl17LNCiE=;
	b=w1DuVgjSXfBOW+4PPdHMFJwCbmsNY0wkcBUq5iwp0p2J5a7FORdPg6fy1kxPhpu2
	zS543mHk8BcsULYHvJO018VpNc6TJEGvNvwcALeJDB+vgNFI0IygTerWrF3Ss6VqNlN
	EChMXMYVEVhdY26gxRNYBla+x91fc18NTlYAjjI8=
Content-Type: multipart/mixed; boundary="===============6930384643353008636=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.118.9 SUCCEEDED
Message-ID: <010101934122e9ed-29049d20-3018-4de1-a7a1-959e7d6f9c41-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207277

--===============6930384643353008636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.118.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.115.3-6.118.9.patch
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
From 44b8af84c787a9a5f3800a727c98ea7f4d798ee0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 21:34:35 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.115.3 -> 6.118.9

---
 ...hon3-hypothesis_6.115.3.bb => python3-hypothesis_6.118.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.115.3.bb => python3-hypothesis_6.118.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.115.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.118.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.115.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.118.9.bb
index c8dc1b08eb..a01e1f00d5 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.115.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.118.9.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "d4efc8c7371bd4ec906d2777f1f18fee5539e47b3d7c7cdc93d1026ad35d9b33"
+SRC_URI[sha256sum] = "751dba75b87f41e8019507e0083f1692d54bf23d18b787c994e6584dbfc28a7e"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.44.1


--===============6930384643353008636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.115.3.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.118.9.dist-info

--===============6930384643353008636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.115.3" to "6.118.9"
packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.115.3.tar.gz;downloadfilename=hypothesis-6.115.3.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.118.9.tar.gz;downloadfilename=hypothesis-6.118.9.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.115.3 [default] to 6.118.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.115.3" to "6.118.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.115.3 [default] to 6.118.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.115.3" to "6.118.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.115.3 [default] to 6.118.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.115.3" to "6.118.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.115.3 [default] to 6.118.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.115.3" to "6.118.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.115.3 [default] to 6.118.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.115.3" to "6.118.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.115.3 [default] to 6.118.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.115.3" to "6.118.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.115.3 [default] to 6.118.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.115.3" to "6.118.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.115.3 [default] to 6.118.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.115.3" to "6.118.9"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.115.3 [default] to 6.118.9 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3145805 to 3164874 (+1%)
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.115.3.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.118.9.dist-info

--===============6930384643353008636==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.115.3-6.118.9.patch"

RnJvbSA0NGI4YWY4NGM3ODdhOWE1ZjM4MDBhNzI3Yzk4ZWE3ZjRkNzk4ZWUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMjE6MzQ6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xMTUuMyAtPiA2LjExOC45CgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjExNS4zLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjExOC45LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjExNS4zLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjExOC45LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTE1LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjExOC45LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTE1LjMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTE4Ljku
YmIKaW5kZXggYzhkYzFiMDhlYi4uYTAxZTFmMDBkNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMTUuMy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjExOC45LmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNGVmYzhjNzM3MWJkNGVjOTA2ZDI3Nzdm
MWYxOGZlZTU1MzllNDdiM2Q3YzdjZGM5M2QxMDI2YWQzNWQ5YjMzIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjc1MWRiYTc1Yjg3ZjQxZTgwMTk1MDdlMDA4M2YxNjkyZDU0YmYyM2QxOGI3ODdjOTk0
ZTY1ODRkYmZjMjhhN2UiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40NC4xCgo=

--===============6930384643353008636==--

