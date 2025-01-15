Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FC4C021A1
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.17871.1736936770254010955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=R9cZrzUj;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rNqGcMEV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194697fc838-1cdb9c53-b595-4a10-a9d8-f0f847d83856-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936769;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=76TCyVDtBX7sky0Lax/xZyvFGb1jPC+95SJKM2cnVx8=;
	b=R9cZrzUjeevLLGCPXp1Sla4A7N8eY7dRNL7i3QHyG+NWEkCu9McMANKD1eRe2AsQ
	vs/hScxwOFoYrJupTIndGayFLReVR5SoJv8WTyLGEgerm+nWDoh+gM963YzG0xKopQU
	AauerWDB0ElRRGMmob6rXw2RqJR5RBpy/e5k+gMw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936769;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=76TCyVDtBX7sky0Lax/xZyvFGb1jPC+95SJKM2cnVx8=;
	b=rNqGcMEVQgGWWvwxKj/ApxcY9t8WLIm/ePaBQm2/BMd0Z6oFNvqhMLsCSJVNmyxJ
	BikcskPs36oPw3kYHb8BOA3UHGNH/eAJhyFnjg8PtOAL6MXJxyYEpnK6uPdL/hSoRL+
	eA88rNyuqGgaqzy42aryDHTmEATsZI3Iy90rrN8k=
Content-Type: multipart/mixed; boundary="===============5336211519547266781=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.19.1 SUCCEEDED
Message-ID: <01010194697fc838-1cdb9c53-b595-4a10-a9d8-f0f847d83856-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209844

--===============5336211519547266781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygments* to *2.19.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.19.0-2.19.1.patch
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
From 312e624e48ebc299308fd4e388a8951b2f74b70f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 07:38:43 +0000
Subject: [PATCH] python3-pygments: upgrade 2.19.0 -> 2.19.1

---
 .../{python3-pygments_2.19.0.bb => python3-pygments_2.19.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.19.0.bb => python3-pygments_2.19.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.19.0.bb b/meta/recipes-devtools/python/python3-pygments_2.19.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pygments_2.19.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.19.1.bb
index f1bc845662..de24ed3f11 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.19.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.19.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "afc4146269910d4bdfabcd27c24923137a74d562a23a320a41a55ad303e19783"
+SRC_URI[sha256sum] = "61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f"
 
 inherit pypi
 
-- 
2.44.1


--===============5336211519547266781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pygments: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.19.0.tar.gz;downloadfilename=pygments-2.19.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.19.1.tar.gz;downloadfilename=pygments-2.19.1.tar.gz"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments: PV changed from "2.19.0" to "2.19.1"
packages/core2-64-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.19.0 [default] to 2.19.1 [default]
packages/core2-64-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 8295992 to 8296049 (+0%)
Changes to packages/core2-64-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.13/site-packages/pygments-2.19.0.dist-info moved to /usr/lib/python3.13/site-packages/pygments-2.19.1.dist-info

--===============5336211519547266781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.13/site-packages/pygments-2.19.0.dist-info moved to /usr/lib/python3.13/site-packages/pygments-2.19.1.dist-info

--===============5336211519547266781==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.19.0-2.19.1.patch"

RnJvbSAzMTJlNjI0ZTQ4ZWJjMjk5MzA4ZmQ0ZTM4OGE4OTUxYjJmNzRiNzBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6Mzg6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z21lbnRzOiB1cGdyYWRlIDIuMTkuMCAtPiAyLjE5LjEKCi0tLQogLi4uL3tweXRo
b24zLXB5Z21lbnRzXzIuMTkuMC5iYiA9PiBweXRob24zLXB5Z21lbnRzXzIuMTkuMS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdtZW50c18yLjE5LjAu
YmIgPT4gcHl0aG9uMy1weWdtZW50c18yLjE5LjEuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTkuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdtZW50c18yLjE5LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z21lbnRzXzIuMTkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTkuMS5iYgppbmRleCBmMWJjODQ1NjYyLi5k
ZTI0ZWQzZjExIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlnbWVudHNfMi4xOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWdtZW50c18yLjE5LjEuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiQlNE
LTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzZhMTNj
OTA1MTRlMjg5OWYxZWJhN2Y0MWMzZWU1OTIiCiAKIGluaGVyaXQgcHl0aG9uX2hhdGNobGluZwot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImFmYzQxNDYyNjk5MTBkNGJkZmFiY2QyN2MyNDkyMzEzN2E3
NGQ1NjJhMjNhMzIwYTQxYTU1YWQzMDNlMTk3ODMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjFj
MTZkMmE4NTc2ZGMwNjQ5ZDlmMzllMDg5YjVmMDJiY2QyN2ZiYTEwZDhmYjRkY2MyODE3M2Y3YTQ1
MTUxZiIKIAogaW5oZXJpdCBweXBpCiAKLS0gCjIuNDQuMQoK

--===============5336211519547266781==--

