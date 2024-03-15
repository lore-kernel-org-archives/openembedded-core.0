Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B085C54E8C
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1236.1710522010877365333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JYTl/Xzz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ejToueJP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018e430e8dcd-9fc033de-7550-4279-96ff-c02beb7f71c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AxwKxTvTuxZ2+87V60h9B5c1AdBK+dsiw1YZ/tuwNdE=;
	b=JYTl/XzzdeOey5ijduAj6HrKo8ooaoDtiPatUBh4Sb+5TaGMVSE8hSno2Y0/7BK5
	zpmUKJ+++NmLRCRJdNxfN6jn98MYADV3PfHUc8iNYNBVezPTeJx4yoVsKBSGH4H82vu
	QJXozrmkmsEucaw5CX/HlKyTSFncEVsR5CKbl3hQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AxwKxTvTuxZ2+87V60h9B5c1AdBK+dsiw1YZ/tuwNdE=;
	b=ejToueJPWmRIrQhqW4pQJZFFKqH+/hf6a7px3o3oA4V7DEIHdeN9HQFAMejCPCOV
	T5k+nkm7k85SjYhZJcloulQXDTe465pHmyf7eVamAra+9sTa2toVhqX3GwNpMIQPcLd
	1tuFDB/oWQXRcSTlWakrSEhl63lGgPAzJWFTbxMQ=
Content-Type: multipart/mixed; boundary="===============0608555755715278381=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-libarchive-c: upgrading to 5.1 SUCCEEDED
Message-ID: <0101018e430e8dcd-9fc033de-7550-4279-96ff-c02beb7f71c0-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197159

--===============0608555755715278381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-libarchive-c* to *5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-libarchive-c-upgrade-5.0-5.1.patch
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
From 5f77eede528124e50f640837e4d28a0eeced3367 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 08:07:11 +0000
Subject: [PATCH] python3-libarchive-c: upgrade 5.0 -> 5.1

---
 ...{python3-libarchive-c_5.0.bb => python3-libarchive-c_5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_5.0.bb => python3-libarchive-c_5.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 6ac86fc7a1..4e318e52f4 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d673f56673d87ec740d1a328fa205cafad1d60f5daca4685594deb039d32b159"
+SRC_URI[sha256sum] = "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
 
 RDEPENDS:${PN} += "\
   libarchive \
-- 
2.42.0


--===============0608555755715278381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-libarchive-c: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.0.tar.gz;downloadfilename=libarchive-c-5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.1.tar.gz;downloadfilename=libarchive-c-5.1.tar.gz"
packages/core2-64-poky-linux/python3-libarchive-c: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-dbg: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-dbg: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-dev: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-dev: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-doc: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-doc: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-locale: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-locale: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-src: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-src: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-staticdev: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c-staticdev: PV changed from "5.0" to "5.1"
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c: PKGV changed from 5.0 [default] to 5.1 [default]
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c: PKGSIZE changed from 118730 to 118715 (-0%)
packages/core2-64-poky-linux/python3-libarchive-c/python3-libarchive-c: PV changed from "5.0" to "5.1"
Changes to packages/core2-64-poky-linux/python3-libarchive-c (sysroot):
  /usr/lib/python3.12/site-packages/libarchive_c-5.0.dist-info moved to /usr/lib/python3.12/site-packages/libarchive_c-5.1.dist-info

--===============0608555755715278381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-libarchive-c (sysroot):
  /usr/lib/python3.12/site-packages/libarchive_c-5.0.dist-info moved to /usr/lib/python3.12/site-packages/libarchive_c-5.1.dist-info

--===============0608555755715278381==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-libarchive-c-upgrade-5.0-5.1.patch"

RnJvbSA1Zjc3ZWVkZTUyODEyNGU1MGY2NDA4MzdlNGQyOGEwZWVjZWQzMzY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDg6MDc6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWxpYmFyY2hpdmUtYzogdXBncmFkZSA1LjAgLT4gNS4xCgotLS0KIC4uLntweXRob24z
LWxpYmFyY2hpdmUtY181LjAuYmIgPT4gcHl0aG9uMy1saWJhcmNoaXZlLWNfNS4xLmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMC5i
YiA9PiBweXRob24zLWxpYmFyY2hpdmUtY181LjEuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWxpYmFyY2hpdmUtY181LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtbGliYXJjaGl2ZS1jXzUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWxpYmFyY2hpdmUtY181LjEuYmIKaW5kZXggNmFjODZmYzdh
MS4uNGUzMThlNTJmNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWxpYmFyY2hpdmUtY181LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWxpYmFyY2hpdmUtY181LjEuYmIKQEAgLTksNyArOSw3IEBAIFBZUElfUEFD
S0FHRSA9ICJsaWJhcmNoaXZlLWMiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZDY3M2Y1NjY3M2Q4N2VjNzQwZDFhMzI4ZmEyMDVjYWZhZDFkNjBm
NWRhY2E0Njg1NTk0ZGViMDM5ZDMyYjE1OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3YmNjZTI0
ZWE2YzBmYTNiYzYyNDY4NDc2YzZkMmY2MjY0MTU2ZGIyZjA0ODc4YTM3MjAyN2MxMDYxNWEyNzIx
IgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICBsaWJhcmNoaXZlIFwKLS0gCjIuNDIuMAoK

--===============0608555755715278381==--

