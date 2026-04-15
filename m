Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C41F4212F
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19818.1776261877443292947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GX3amklv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BLJpoZGr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d91754bae-025b4c71-9c94-488e-b654-1fee5f0264da-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tfW67otnRsIrGAuD5AKkNgK7LG0YgyQzSgztE3Lntyo=;
	b=GX3amklvnuX9MVsgFSTfT2tCSrsN/dxeSl4YBEKhsquxjNofSQGfPiIis38vmYA0
	hBWo5gzXmv8jDHnAZU6z8IaDuiq1QJzcKpV53iM3A5TWi6xPFEeAgK2DigPhrGWkrr6
	K27LU0mITRBKsQBCrXvYIdTSWgMecW4EfLkLKkmM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261876;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tfW67otnRsIrGAuD5AKkNgK7LG0YgyQzSgztE3Lntyo=;
	b=BLJpoZGr/aVdyUwJIoTuVEYN1rh7HjxTJLDZVpFYfpL1VFq+atDaBU3rywJlicHg
	gdN+hrrmy/FqdiNj2r/PL2HuAvwapagBKz7uLvWJeQy2h00+XR3E3ThOUmtMMw+dJqX
	Em2CDOVfgOOegqLaIz+8bxavXlq6SOQpCVARN+3I=
Content-Type: multipart/mixed; boundary="===============4728588278204920230=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.152.1 SUCCEEDED
Message-ID: <0101019d91754bae-025b4c71-9c94-488e-b654-1fee5f0264da-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235231

--===============4728588278204920230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.152.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.151.9-6.152.1.patch
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
From 22c9160c6128b0f3a39ddf56a0952c121d45601b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 07:36:53 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.151.9 -> 6.152.1

---
 ...hon3-hypothesis_6.151.9.bb => python3-hypothesis_6.152.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.151.9.bb => python3-hypothesis_6.152.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb b/meta/recipes-devtools/python/python3-hypothesis_6.152.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.152.1.bb
index 157e4a2ee0..06f7e41121 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.151.9.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.152.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2f284428dda6c3c48c580de0e18470ff9c7f5ef628a647ee8002f38c3f9097ca"
+SRC_URI[sha256sum] = "4f4ed934eee295dd84ee97592477d23e8dc03e9f12ae0ee30a4e7c9ef3fca3b0"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============4728588278204920230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.152.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.152.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.152.1.dist-info

--===============4728588278204920230==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.151.9-6.152.1.patch"

RnJvbSAyMmM5MTYwYzYxMjhiMGYzYTM5ZGRmNTZhMDk1MmMxMjFkNDU2MDFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDc6MzY6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTEuOSAtPiA2LjE1Mi4xCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1MS45LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1Mi4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1MS45LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1Mi4xLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTUxLjkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE1Mi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUxLjkuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUyLjEu
YmIKaW5kZXggMTU3ZTRhMmVlMC4uMDZmN2U0MTEyMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTEuOS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE1Mi4xLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyZjI4NDQyOGRkYTZjM2M0OGM1ODBkZTBl
MTg0NzBmZjljN2Y1ZWY2MjhhNjQ3ZWU4MDAyZjM4YzNmOTA5N2NhIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjRmNGVkOTM0ZWVlMjk1ZGQ4NGVlOTc1OTI0NzdkMjNlOGRjMDNlOWYxMmFlMGVlMzBh
NGU3YzllZjNmY2EzYjAiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============4728588278204920230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.151.9.tar.gz;downloadfilename=hypothesis-6.151.9.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.152.1.tar.gz;downloadfilename=hypothesis-6.152.1.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.151.9 [default] to 6.152.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.151.9" to "6.152.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.151.9 [default] to 6.152.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.151.9" to "6.152.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.151.9 [default] to 6.152.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.151.9" to "6.152.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.151.9 [default] to 6.152.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.151.9" to "6.152.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.151.9 [default] to 6.152.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.151.9" to "6.152.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.151.9 [default] to 6.152.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.151.9" to "6.152.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.151.9 [default] to 6.152.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.151.9" to "6.152.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.151.9 [default] to 6.152.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.151.9" to "6.152.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.151.9 [default] to 6.152.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.151.9" to "6.152.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3834994 to 3844961 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.152.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.152.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.151.9.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.152.1.dist-info

--===============4728588278204920230==--

