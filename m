Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E0CC54E58
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.36630.1709330716679427090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YgpDc6HQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CR1Vn/ZM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018dfc0cd579-1b939fee-de9b-4134-8764-3989e5e7dce8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XQOC+GEfFiTrczu/B04Cnyz0vIiHF01pmLjw8ACrBco=;
	b=YgpDc6HQnI1LsPvpaCHUNHU3BvYCVpHofoBqQ7BO+jNBuIzIQezNjJ2T87wNapc8
	mOWtRVnnVr1a8ousx+Q6+TtY28XT6ZA3JJgQSgq3+mjd22231+qUTq1l/h3JoJjv9V0
	4xcQjs7sVxIifRZRhQg4Tge9e5yzcob6adjzjdaM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XQOC+GEfFiTrczu/B04Cnyz0vIiHF01pmLjw8ACrBco=;
	b=CR1Vn/ZMMaFN9jAbnbvutwXA/BNCqdJ3PJjcz9nB7aRLwkFnvWTHWEu+L1feM5M5
	jaT4W7b9ICdk6T/D0ptIhDDL1A2dNQx4HQjWnhAkTKb1uPOcsDxQATlbmgx/KVhZNZS
	9ncvjdGxOgPliOL1n/3MiM0GbCdS1wdJmHmWfl1Q=
Content-Type: multipart/mixed; boundary="===============2344013085045519880=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.98.15 SUCCEEDED
Message-ID: <0101018dfc0cd579-1b939fee-de9b-4134-8764-3989e5e7dce8-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196482

--===============2344013085045519880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.98.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.98.12-6.98.15.patch
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
From 2e6824bfb58608a42c2d6c51354a3e451f8ea778 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 12:35:18 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.98.12 -> 6.98.15

---
 ...hon3-hypothesis_6.98.12.bb => python3-hypothesis_6.98.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.98.12.bb => python3-hypothesis_6.98.15.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.98.12.bb b/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.98.12.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb
index a74c3af401..a17abe58c0 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.98.12.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "584ef03a847464b0d14a63e53fcc3335a75b1f1eb3bcc770a03ff950ee4e279e"
+SRC_URI[sha256sum] = "1e31210951511b24ce8b3b6e04d791c466385a30ac3af571bf2223954b025d77"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.42.0


--===============2344013085045519880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.98.12.tar.gz;downloadfilename=hypothesis-6.98.12.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.98.15.tar.gz;downloadfilename=hypothesis-6.98.15.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.98.12 [default] to 6.98.15 [default]
packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.98.12" to "6.98.15"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.98.12" to "6.98.15"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.98.12 [default] to 6.98.15 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.98.12" to "6.98.15"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.98.12 [default] to 6.98.15 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.98.12" to "6.98.15"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.98.12 [default] to 6.98.15 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.98.12" to "6.98.15"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.98.12 [default] to 6.98.15 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.98.12" to "6.98.15"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.98.12 [default] to 6.98.15 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.98.12" to "6.98.15"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.98.12 [default] to 6.98.15 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.98.12" to "6.98.15"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.98.12 [default] to 6.98.15 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.98.12" to "6.98.15"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2956806 to 2963374 (+0%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.98.12 [default] to 6.98.15 [default]
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.12/site-packages/hypothesis-6.98.12.dist-info moved to /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info

--===============2344013085045519880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.12/site-packages/hypothesis-6.98.12.dist-info moved to /usr/lib/python3.12/site-packages/hypothesis-6.98.15.dist-info

--===============2344013085045519880==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.98.12-6.98.15.patch"

RnJvbSAyZTY4MjRiZmI1ODYwOGE0MmMyZDZjNTEzNTRhM2U0NTFmOGVhNzc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMjozNToxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2Ljk4LjEyIC0+IDYuOTguMTUKCi0tLQogLi4uaG9u
My1oeXBvdGhlc2lzXzYuOTguMTIuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuOTguMTUuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lzXzYu
OTguMTIuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuOTguMTUuYmJ9ICg5MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi45
OC4xMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
XzYuOTguMTUuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi45OC4xMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi45OC4xNS5i
YgppbmRleCBhNzRjM2FmNDAxLi5hMTdhYmU1OGMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljk4LjEyLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuOTguMTUuYmIKQEAg
LTEzLDcgKzEzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAog
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU4NGVmMDNhODQ3NDY0YjBkMTRhNjNlNTNm
Y2MzMzM1YTc1YjFmMWViM2JjYzc3MGEwM2ZmOTUwZWU0ZTI3OWUiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMWUzMTIxMDk1MTUxMWIyNGNlOGIzYjZlMDRkNzkxYzQ2NjM4NWEzMGFjM2FmNTcxYmYy
MjIzOTU0YjAyNWQ3NyIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRy
cyBcCi0tIAoyLjQyLjAKCg==

--===============2344013085045519880==--

