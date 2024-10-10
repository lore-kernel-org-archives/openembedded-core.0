Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624C8D0D7BC
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:43 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.53383.1728588985625235982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Fao2BTJg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=C6309qWL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019277eef65e-7049b2f6-f290-4570-8e11-4ae3d9e5d159-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728589002;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Rzj5kgoYBMmLC8rJPrHdy+nUjvy91Kve9fQf1lltxZc=;
	b=Fao2BTJgkN9dm0COdxYyVWYHWim1a+OXHckZ6v7elmzOORSK3Y+/rexKAstAmR45
	o32RA6g0gBZGDUl0bbqEFR9xZlb65mtGwhOHezRetCvOOVfIw+Fmt5SZOje2fgxsUgg
	137ASRe0eTwChFh0eFx9X04zwucsfz2/G47bsYY8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728589002;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Rzj5kgoYBMmLC8rJPrHdy+nUjvy91Kve9fQf1lltxZc=;
	b=C6309qWLrWy+U+vULsGueFSwRV6FeLsDRMIFkO+RzqJ5z18vl7HOVE6LI8iOiA5d
	uM/CVIpKMouNjBq4AQ6DIY5ThxL1t++v/yYWVY2L7jj+Knys0i3PRLGQMKM56jd+Ww9
	AyiKbdX5ec+dfmqc/h4LufzaniNZYs1YRJIz5o9k=
Content-Type: multipart/mixed; boundary="===============5721677650764302239=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.114.1 SUCCEEDED
Message-ID: <0101019277eef65e-7049b2f6-f290-4570-8e11-4ae3d9e5d159-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205628

--===============5721677650764302239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.114.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.112.1-6.114.1.patch
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
From 705b5a4756308bec1284c5fb06137e7cf9fe1448 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 13:26:33 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.112.1 -> 6.114.1

---
 ...hon3-hypothesis_6.112.1.bb => python3-hypothesis_6.114.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.112.1.bb => python3-hypothesis_6.114.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.114.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.114.1.bb
index e4b7b53579..9f45382886 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.114.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b070d7a1bb9bd84706c31885c9aeddc138e2b36a9c112a91984f49501c567856"
+SRC_URI[sha256sum] = "15ea6e4bb297276351ada18f172c60049c117a91040154ea620c632cc4c53e88"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.44.1


--===============5721677650764302239==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.112.1-6.114.1.patch"

RnJvbSA3MDViNWE0NzU2MzA4YmVjMTI4NGM1ZmIwNjEzN2U3Y2Y5ZmUxNDQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTM6MjY6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xMTIuMSAtPiA2LjExNC4xCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjExMi4xLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjExNC4xLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjExMi4xLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjExNC4xLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTEyLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjExNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTEyLjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTE0LjEu
YmIKaW5kZXggZTRiN2I1MzU3OS4uOWY0NTM4Mjg4NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMTIuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjExNC4xLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiMDcwZDdhMWJiOWJkODQ3MDZjMzE4ODVj
OWFlZGRjMTM4ZTJiMzZhOWMxMTJhOTE5ODRmNDk1MDFjNTY3ODU2IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjE1ZWE2ZTRiYjI5NzI3NjM1MWFkYTE4ZjE3MmM2MDA0OWMxMTdhOTEwNDAxNTRlYTYy
MGM2MzJjYzRjNTNlODgiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40NC4xCgo=

--===============5721677650764302239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.12/site-packages/hypothesis-6.112.1.dist-info moved to /usr/lib/python3.12/site-packages/hypothesis-6.114.1.dist-info

--===============5721677650764302239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.112.1 [default] to 6.114.1 [default]
packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.112.1" to "6.114.1"
packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.112.1.tar.gz;downloadfilename=hypothesis-6.112.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.114.1.tar.gz;downloadfilename=hypothesis-6.114.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.112.1 [default] to 6.114.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.112.1" to "6.114.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.112.1 [default] to 6.114.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.112.1" to "6.114.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.112.1 [default] to 6.114.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.112.1" to "6.114.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.112.1 [default] to 6.114.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.112.1" to "6.114.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.112.1 [default] to 6.114.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.112.1" to "6.114.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.112.1 [default] to 6.114.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.112.1" to "6.114.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.112.1 [default] to 6.114.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.112.1" to "6.114.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.112.1 [default] to 6.114.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.112.1" to "6.114.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3118803 to 3122544 (+0%)
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.12/site-packages/hypothesis-6.112.1.dist-info moved to /usr/lib/python3.12/site-packages/hypothesis-6.114.1.dist-info

--===============5721677650764302239==--

