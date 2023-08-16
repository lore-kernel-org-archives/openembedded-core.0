Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3E3C3DA42
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.173808.1692224344511229190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GjMy5rbU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RPC//b8U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a006e4ed1-0c32a43f-6df2-4ef3-8436-b1458c5f2b1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5mKNyApRsVAPvi8XnSC5UT+rkoWfUFlELZuz+rkZS/c=;
	b=GjMy5rbU/ovpxQJKnVwsfMdxj/hPZyQ5SCfMErqIRbJhaF8GoVDKG9bT6BUjRLZc
	UJY2yT+tOHGHF8C81ndEmA2ihh3LRwK49XCmSR+CVW9g2AUEhzwKd4IIfNZ31nVsQeE
	gUpM2w0+JISFsfhNm6BFnpcTBMSTCsDIoWykwrwQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5mKNyApRsVAPvi8XnSC5UT+rkoWfUFlELZuz+rkZS/c=;
	b=RPC//b8UwMz1240drvaQ/LNzUtoplLnlVsbycEP19fQ1VEnU7e0iUQGfCH24qjNv
	GVi/vwv6wFmoG+/zWwpZY5RIzbthFb1n0QODKagSqXDjaePIqof+N1jw7hSaiCAKB8t
	RvrniHWzpfVetWqgt6fwy7ah3aKu60egABIiHN70=
Content-Type: multipart/mixed; boundary="===============4463632473039301414=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.82.4 SUCCEEDED
Message-ID: <0101018a006e4ed1-0c32a43f-6df2-4ef3-8436-b1458c5f2b1b-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186179

--===============4463632473039301414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.82.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.82.0-6.82.4.patch
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
From c212c020aa064856a8fb1245b84f4b598f965511 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 05:21:31 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.82.0 -> 6.82.4

---
 ...ython3-hypothesis_6.82.0.bb => python3-hypothesis_6.82.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.82.0.bb => python3-hypothesis_6.82.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.82.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.82.4.bb
index 0aeeae1019..d41c4aa4bc 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.82.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ffece8e40a34329e7112f7408f2c45fe587761978fdbc6f4f91bf0d683a7d4d9"
+SRC_URI[sha256sum] = "11f32a66cf361a72f2a36527a15639ea6814d1dbf54782c3a8ea31585d62ab27"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


--===============4463632473039301414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.82.0.tar.gz;downloadfilename=hypothesis-6.82.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.82.4.tar.gz;downloadfilename=hypothesis-6.82.4.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.82.0" to "6.82.4"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.82.0 [default] to 6.82.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.82.0" to "6.82.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.82.0 [default] to 6.82.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.82.0" to "6.82.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.82.0 [default] to 6.82.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.82.0" to "6.82.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.82.0 [default] to 6.82.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.82.0" to "6.82.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.82.0 [default] to 6.82.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.82.0" to "6.82.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.82.0 [default] to 6.82.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.82.0" to "6.82.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.82.0 [default] to 6.82.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.82.0" to "6.82.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.82.0 [default] to 6.82.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2872208 to 2873567 (+0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.82.0" to "6.82.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.82.0 [default] to 6.82.4 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.82.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.82.4.dist-info

--===============4463632473039301414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.82.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.82.4.dist-info

--===============4463632473039301414==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.82.0-6.82.4.patch"

RnJvbSBjMjEyYzAyMGFhMDY0ODU2YThmYjEyNDViODRmNGI1OThmOTY1NTExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDU6MjE6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi44Mi4wIC0+IDYuODIuNAoKLS0tCiAuLi55dGhv
bjMtaHlwb3RoZXNpc182LjgyLjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuODIuNC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNfNi44
Mi4wLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjgyLjQuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44Mi4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44
Mi40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuODIuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44Mi40LmJiCmluZGV4
IDBhZWVhZTEwMTkuLmQ0MWM0YWE0YmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuODIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjgyLjQuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAogICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImZmZWNlOGU0MGEzNDMyOWU3MTEyZjc0MDhmMmM0NWZlNTg3
NzYxOTc4ZmRiYzZmNGY5MWJmMGQ2ODNhN2Q0ZDkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTFm
MzJhNjZjZjM2MWE3MmYyYTM2NTI3YTE1NjM5ZWE2ODE0ZDFkYmY1NDc4MmMzYThlYTMxNTg1ZDYy
YWIyNyIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRycyBcCi0tIAoy
LjM5LjIKCg==

--===============4463632473039301414==--

