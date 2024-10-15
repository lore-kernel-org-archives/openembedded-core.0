Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6DCD1D88B
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.11857.1728994543862801378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VkOmQWCL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=BO6oTvkv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010192901b4041-00353fd4-7fb2-4ead-9741-83a9f2de0be6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994558;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y0xOlQnLsvhnsGJWwpVuHGZeBZcyO9pVatJd4PLgFCc=;
	b=VkOmQWCLGvX60H7CPqhLm2FqtdoUjpM5g6i2sjTr8J/HrXmm2PRkX0kGZdsyiYrk
	a4TwC4tMG7IIgGsBAFz5XwqKfofH8jtOdY/7bmymNescpKddMJMP5L+KYN72pZWi4Al
	4quDBzdRq0zFufknw+RQ0GND3nbACMz7O1IjsWIY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994558;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y0xOlQnLsvhnsGJWwpVuHGZeBZcyO9pVatJd4PLgFCc=;
	b=BO6oTvkvKM6UY48ElCWyfiNyLWCGe7QDrAAaFbIC3bdRBwzqwfDoMOHUEKc4em8u
	oF6IrJ+c3SKFA2xdRRY3Ud5vzAFi0CY+h6NZakgEEIIn/6AZUaXJ5Hz2SjKb8u1Lm9C
	D6IQrBEFJEMxYFQzeQ9bqVBooaVPH6CI2UeOA4lI=
Content-Type: multipart/mixed; boundary="===============4726038439927296326=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyparsing: upgrading to 3.2.0 SUCCEEDED
Message-ID: <01010192901b4041-00353fd4-7fb2-4ead-9741-83a9f2de0be6-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205848

--===============4726038439927296326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyparsing* to *3.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyparsing-upgrade-3.1.4-3.2.0.patch
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
From 9f8b39f1e61507cf609c7d9990b82768bd556073 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 08:45:45 +0000
Subject: [PATCH] python3-pyparsing: upgrade 3.1.4 -> 3.2.0

---
 .../{python3-pyparsing_3.1.4.bb => python3-pyparsing_3.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.1.4.bb => python3-pyparsing_3.2.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.1.4.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.1.4.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
index f256b047e3..de28d71fab 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "f86ec8d1a83f11977c9a6ea7598e8c27fc5cddfa5b07ea2241edbbde1d7bc032"
+SRC_URI[sha256sum] = "cbf74e27246d595d9a74b186b810f6fbb86726dbf3b9532efb343f6d7294fe9c"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.44.1


--===============4726038439927296326==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyparsing-upgrade-3.1.4-3.2.0.patch"

RnJvbSA5ZjhiMzlmMWU2MTUwN2NmNjA5YzdkOTk5MGI4Mjc2OGJkNTU2MDczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDg6NDU6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5cGFyc2luZzogdXBncmFkZSAzLjEuNCAtPiAzLjIuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtcHlwYXJzaW5nXzMuMS40LmJiID0+IHB5dGhvbjMtcHlwYXJzaW5nXzMuMi4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5cGFyc2luZ18zLjEuNC5i
YiA9PiBweXRob24zLXB5cGFyc2luZ18zLjIuMC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMS40LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5cGFyc2luZ18zLjIuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlwYXJzaW5nXzMuMS40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMi4wLmJiCmluZGV4IGYyNTZiMDQ3ZTMuLmRl
MjhkNzFmYWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1weXBhcnNpbmdfMy4xLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5cGFyc2luZ18zLjIuMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBCVUdUUkFDS0VSID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9weXBhcnNpbmcvcHlwYXJzaW5nL2lzc3VlcyIKIExJQ0VOU0Ug
PSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NjU3YTU2NjIz
Mzg4ODUxM2UxZjA3YmExM2UyZjQ3ZjEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmODZlYzhk
MWE4M2YxMTk3N2M5YTZlYTc1OThlOGMyN2ZjNWNkZGZhNWIwN2VhMjI0MWVkYmJkZTFkN2JjMDMy
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNiZjc0ZTI3MjQ2ZDU5NWQ5YTc0YjE4NmI4MTBmNmZi
Yjg2NzI2ZGJmM2I5NTMyZWZiMzQzZjZkNzI5NGZlOWMiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VY
ID0gInB5cGFyc2luZy0oP1A8cHZlcj4uKilcLnRhciIKIAotLSAKMi40NC4xCgo=

--===============4726038439927296326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.12/site-packages/pyparsing-3.1.4.dist-info moved to /usr/lib/python3.12/site-packages/pyparsing-3.2.0.dist-info

--===============4726038439927296326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyparsing: PV changed from "3.1.4" to "3.2.0"
packages/core2-64-poky-linux/python3-pyparsing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.1.4.tar.gz;downloadfilename=pyparsing-3.1.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.2.0.tar.gz;downloadfilename=pyparsing-3.2.0.tar.gz"
packages/core2-64-poky-linux/python3-pyparsing: PKGV changed from 3.1.4 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PV changed from "3.1.4" to "3.2.0"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PKGV changed from 3.1.4 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dev: PV changed from "3.1.4" to "3.2.0"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dev: PKGV changed from 3.1.4 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-doc: PV changed from "3.1.4" to "3.2.0"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-doc: PKGV changed from 3.1.4 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-locale: PV changed from "3.1.4" to "3.2.0"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-locale: PKGV changed from 3.1.4 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-src: PV changed from "3.1.4" to "3.2.0"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-src: PKGV changed from 3.1.4 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PV changed from "3.1.4" to "3.2.0"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PKGV changed from 3.1.4 [default] to 3.2.0 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PKGSIZE changed from 863672 to 879628 (+2%)
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PV changed from "3.1.4" to "3.2.0"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PKGV changed from 3.1.4 [default] to 3.2.0 [default]
Changes to packages/core2-64-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.12/site-packages/pyparsing-3.1.4.dist-info moved to /usr/lib/python3.12/site-packages/pyparsing-3.2.0.dist-info

--===============4726038439927296326==--

