Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D56C18E0D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.8641.1698848702993284554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OgB+Q4KK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oXE41aXo;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b8b460424-2380941b-4e75-4132-8edb-3ec0befe0256-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YH8d6rNmNK7ju7otyn8cc7k2OqnihAmHRpfoINoVGjQ=;
	b=OgB+Q4KKr+XKJnGm9MB3eOW1iVqImh1PSalWSS2lB0dYibkvZUaQJRc+8k/XU20G
	h7hfch4UvtHY1ZMf/ApSmb23ya9lo5mY5CK9/LeK0sWx3XsnGLCd1LcbGY6bZq4Ao8P
	4H8+1vlP911uDaaC/Rnw5NKfNHB8yhF1NB7UFFLw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YH8d6rNmNK7ju7otyn8cc7k2OqnihAmHRpfoINoVGjQ=;
	b=oXE41aXoyz+Srdx7SWrDLXsDexOWF30eIiLotkRIgzVR17du9+A1JCGMp2vedOgN
	RH3qTqK4QW3K2rxKWrwdvdA5D0OGF71AcAAjcnhk3/xVyo7XHrYgovjjOST8qf+ZLYl
	Ne+aRAsN020U+4X9+gu4QXlYn2G/4PYXtM5SzKVg=
Content-Type: multipart/mixed; boundary="===============5105922933718132686=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.88.1 SUCCEEDED
Message-ID: <0101018b8b460424-2380941b-4e75-4132-8edb-3ec0befe0256-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189959

--===============5105922933718132686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.88.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.87.4-6.88.1.patch
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
From 40783bcd0b76a8ee4c028cefb32abb8f127d02b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:51:10 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.87.4 -> 6.88.1

---
 ...ython3-hypothesis_6.87.4.bb => python3-hypothesis_6.88.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.87.4.bb => python3-hypothesis_6.88.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.88.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.88.1.bb
index 4f41e2ab1a..e6703f103b 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.88.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "c508779be66e266c45dbf9c1b2713e560dfd89abb044d92eafe91e8b2728af01"
+SRC_URI[sha256sum] = "f4c2c004b9ec3e0e25332ad2cb6b91eba477a855557a7b5c6e79068809ff8b51"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


--===============5105922933718132686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.87.4.tar.gz;downloadfilename=hypothesis-6.87.4.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.88.1.tar.gz;downloadfilename=hypothesis-6.88.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.87.4 [default] to 6.88.1 [default]
packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.87.4" to "6.88.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.87.4 [default] to 6.88.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.87.4" to "6.88.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.87.4 [default] to 6.88.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.87.4" to "6.88.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.87.4 [default] to 6.88.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.87.4" to "6.88.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.87.4 [default] to 6.88.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.87.4" to "6.88.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.87.4 [default] to 6.88.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.87.4" to "6.88.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.87.4 [default] to 6.88.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.87.4" to "6.88.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.87.4 [default] to 6.88.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.87.4" to "6.88.1"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.87.4 [default] to 6.88.1 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2919672 to 2922652 (+0%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.87.4" to "6.88.1"
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.87.4.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.88.1.dist-info

--===============5105922933718132686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.87.4.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.88.1.dist-info

--===============5105922933718132686==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.87.4-6.88.1.patch"

RnJvbSA0MDc4M2JjZDBiNzZhOGVlNGMwMjhjZWZiMzJhYmI4ZjEyN2QwMmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODo1MToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2Ljg3LjQgLT4gNi44OC4xCgotLS0KIC4uLnl0aG9u
My1oeXBvdGhlc2lzXzYuODcuNC5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi44OC4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182Ljg3
LjQuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuODguMS5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljg3LjQu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljg4
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44Ny40LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljg4LjEuYmIKaW5kZXgg
NGY0MWUyYWIxYS4uZTY3MDNmMTAzYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44Ny40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuODguMS5iYgpAQCAtMTMsNyArMTMs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYzUwODc3OWJlNjZlMjY2YzQ1ZGJmOWMxYjI3MTNlNTYwZGZk
ODlhYmIwNDRkOTJlYWZlOTFlOGIyNzI4YWYwMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNGMy
YzAwNGI5ZWMzZTBlMjUzMzJhZDJjYjZiOTFlYmE0NzdhODU1NTU3YTdiNWM2ZTc5MDY4ODA5ZmY4
YjUxIgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIu
MzkuMgoK

--===============5105922933718132686==--

