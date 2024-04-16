Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68680C27C5F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.13594.1713248039024288200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aqOKk/Cm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MMrwkTE2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018ee58a6df4-39c410d1-f6d9-4eb8-b180-05ae6a994722-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w4KXwMKR1MzOskgdw/P3ruq253BHJphXOmEv+P8qyFc=;
	b=aqOKk/CmMFQDFvNjis3B4Cx0SIJmM/60oHDCJMwo1UrWht/9vc4JAtUcpOkj1367
	y2dF8aY2/XCpdsC8itSB2IM8rGFGUGtn86AJDuT+i1nmuVJkHy+XA9NnIU2zcrAs3Q9
	y/577owpGXsZQ8yEjjEyV4Yl+/hHKnDAbzso6IM4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w4KXwMKR1MzOskgdw/P3ruq253BHJphXOmEv+P8qyFc=;
	b=MMrwkTE2OrKOfHLPZloKmOGQtBn8fdpPFth0XmFUDJx92d3UOE0JERKONNgjxl1z
	zxFrhM7DdsIwl5+jTX2zYdMvT8CbMRfZoQLK780ZFq5KMcmRqdeZb3kU9v/SIwv8lGI
	RgIQJUxgh51SE2gkYo5J9LzUtmDdSJp48WOSlv8U=
Content-Type: multipart/mixed; boundary="===============4130771944314882879=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.100.1 SUCCEEDED
Message-ID: <0101018ee58a6df4-39c410d1-f6d9-4eb8-b180-05ae6a994722-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198290

--===============4130771944314882879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.100.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.98.15-6.100.1.patch
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
From 2d2c0ade36d9d2d1a14c667dc26e1697514e8b3b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:08:20 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.98.15 -> 6.100.1

---
 ...hon3-hypothesis_6.98.15.bb => python3-hypothesis_6.100.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.98.15.bb => python3-hypothesis_6.100.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb b/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
index a17abe58c0..af7facfe7e 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "1e31210951511b24ce8b3b6e04d791c466385a30ac3af571bf2223954b025d77"
+SRC_URI[sha256sum] = "ebff09d7fa4f1fb6a855a812baf17e578b4481b7b70ec6d96496210d1a4c6c35"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.42.0


--===============4130771944314882879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/LICENSE.txt was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/WHEEL was removed

--===============4130771944314882879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.98.15.tar.gz;downloadfilename=hypothesis-6.98.15.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.100.1.tar.gz;downloadfilename=hypothesis-6.100.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.98.15 [default] to 6.100.1 [default]
packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.98.15" to "6.100.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.98.15 [default] to 6.100.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.98.15" to "6.100.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.98.15 [default] to 6.100.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.98.15" to "6.100.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.98.15 [default] to 6.100.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.98.15" to "6.100.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.98.15 [default] to 6.100.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.98.15" to "6.100.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.98.15 [default] to 6.100.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.98.15" to "6.100.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.98.15 [default] to 6.100.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.98.15" to "6.100.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.98.15 [default] to 6.100.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.98.15" to "6.100.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2964546 to 3044486 (+3%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.98.15 [default] to 6.100.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.98.15" to "6.100.1"
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/LICENSE.txt was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/hypothesis-6.100.1.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/LICENSE.txt was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info/WHEEL was removed

--===============4130771944314882879==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.98.15-6.100.1.patch"

RnJvbSAyZDJjMGFkZTM2ZDlkMmQxYTE0YzY2N2RjMjZlMTY5NzUxNGU4YjNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6MDg6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi45OC4xNSAtPiA2LjEwMC4xCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182Ljk4LjE1LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjEwMC4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
Ljk4LjE1LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjEwMC4xLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
OTguMTUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjEwMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuOTguMTUuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTAwLjEu
YmIKaW5kZXggYTE3YWJlNThjMC4uYWY3ZmFjZmU3ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi45OC4xNS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjEwMC4xLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxZTMxMjEwOTUxNTExYjI0Y2U4YjNiNmUw
NGQ3OTFjNDY2Mzg1YTMwYWMzYWY1NzFiZjIyMjM5NTRiMDI1ZDc3IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImViZmYwOWQ3ZmE0ZjFmYjZhODU1YTgxMmJhZjE3ZTU3OGI0NDgxYjdiNzBlYzZkOTY0
OTYyMTBkMWE0YzZjMzUiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Mi4wCgo=

--===============4130771944314882879==--

