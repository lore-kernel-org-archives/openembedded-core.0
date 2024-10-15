Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE77D1D89A
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11862.1728994550369274025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=f4t65BVJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=hXrWcYvx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010192901b3662-ae1f4324-288f-4ec5-ae10-4ba52568185d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P6VpIiVJbgFHmARJTQi3vEzwNUF8jQeHe1DI0J1DXVI=;
	b=f4t65BVJmN7znJ+CkOd71n/pQH1mgvUjL1TAtSEmctDcA6OWf/R0so3og3YB4tPb
	N6rasGjTLiq/6wvs/Plx5WJMx0Ab0zjlvqjmYtaBJp7w329vc3PvndsjMBtjjRM5oc3
	aeAiRibKhoD+FaRpA6+FURHiCdvmnPiDgfu4SG9I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P6VpIiVJbgFHmARJTQi3vEzwNUF8jQeHe1DI0J1DXVI=;
	b=hXrWcYvxu5mm/eczX/WirWZOd76V5Xw1Ptn7PPLWLOZ3EyI2yYlnM6Um9+g5NynY
	ZNFDIY3/Ms8JW/Kjo3v9/LEAb8WXH/ALHIOvchasSOUeeeQfYM506EhB4H3W8sXq9AZ
	jRo8OmVAGayvAYwXHtrkxSBbcAkA647XBTBQQ3mw=
Content-Type: multipart/mixed; boundary="===============4026531315082044825=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.115.2 SUCCEEDED
Message-ID: <01010192901b3662-ae1f4324-288f-4ec5-ae10-4ba52568185d-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205839

--===============4026531315082044825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.115.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.112.4-6.115.2.patch
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
From d072af7c9fff96fcc4091ec6ac8663e5a32ea6b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 08:25:08 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.112.4 -> 6.115.2

---
 ...hon3-hypothesis_6.112.4.bb => python3-hypothesis_6.115.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.112.4.bb => python3-hypothesis_6.115.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.115.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.115.2.bb
index 1010348e38..1052a3e345 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.115.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "8fe64e4a6d0862e209e3c36b42037aee9665cb839d619d9281be45345ab7d856"
+SRC_URI[sha256sum] = "6df95ea6cccf950f80e142f43a684d1462e26c5e28ba29ab4eceb8399e207e0b"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.44.1


--===============4026531315082044825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.12/site-packages/hypothesis-6.112.4.dist-info moved to /usr/lib/python3.12/site-packages/hypothesis-6.115.2.dist-info

--===============4026531315082044825==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.112.4-6.115.2.patch"

RnJvbSBkMDcyYWY3YzlmZmY5NmZjYzQwOTFlYzZhYzg2NjNlNWEzMmVhNmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDg6MjU6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xMTIuNCAtPiA2LjExNS4yCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjExMi40LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjExNS4yLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjExMi40LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjExNS4yLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTEyLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjExNS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTEyLjQuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTE1LjIu
YmIKaW5kZXggMTAxMDM0OGUzOC4uMTA1MmEzZTM0NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xMTIuNC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjExNS4yLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZmU2NGU0YTZkMDg2MmUyMDllM2MzNmI0
MjAzN2FlZTk2NjVjYjgzOWQ2MTlkOTI4MWJlNDUzNDVhYjdkODU2IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjZkZjk1ZWE2Y2NjZjk1MGY4MGUxNDJmNDNhNjg0ZDE0NjJlMjZjNWUyOGJhMjlhYjRl
Y2ViODM5OWUyMDdlMGIiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40NC4xCgo=

--===============4026531315082044825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.112.4.tar.gz;downloadfilename=hypothesis-6.112.4.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.115.2.tar.gz;downloadfilename=hypothesis-6.115.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.112.4 [default] to 6.115.2 [default]
packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.112.4" to "6.115.2"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.112.4 [default] to 6.115.2 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.112.4" to "6.115.2"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.112.4 [default] to 6.115.2 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.112.4" to "6.115.2"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.112.4 [default] to 6.115.2 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.112.4" to "6.115.2"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.112.4 [default] to 6.115.2 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.112.4" to "6.115.2"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.112.4 [default] to 6.115.2 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.112.4" to "6.115.2"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.112.4 [default] to 6.115.2 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.112.4" to "6.115.2"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.112.4 [default] to 6.115.2 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.112.4" to "6.115.2"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3128672 to 3129357 (+0%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.112.4 [default] to 6.115.2 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.112.4" to "6.115.2"
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.12/site-packages/hypothesis-6.112.4.dist-info moved to /usr/lib/python3.12/site-packages/hypothesis-6.115.2.dist-info

--===============4026531315082044825==--

