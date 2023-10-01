Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F494E74913
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.65014.1696183990434144514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N/76QArs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DEmdsIUM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018aec71b834-b3565ce5-a9f1-4aaf-8368-43dfb4401772-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UY/MohnnbE2qFf7Ii8N6HZ5r/so1p1dg2xQ5xxBvcRw=;
	b=N/76QArsNNDli/j4gnF1UmfFYOPdHsw56JoRC99AQI/SJzEDbmCo+TSX90WWej8M
	LncxmqmoU1N11+jto4LbqPFxr5nLZWe+ni8zv4nNo7DBHh4NTKj6CkQ0pNiJ+OIlST2
	RfB0UnvurB6j6D39NvMXpDVgo3b9mGB39+pj/rcI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UY/MohnnbE2qFf7Ii8N6HZ5r/so1p1dg2xQ5xxBvcRw=;
	b=DEmdsIUM55EKs0mNRIKNsoLjJ9lvefXKVQlQQGMrjLW26/nUoVSmoN6WAt+fLAlv
	MujhN+jt2fGWjc4wxhTUD9elnUGAixbt+GbWRwJ7YX3Td202kVUJgRaHihKb8KJxIXJ
	ZYAXmfxiobBHe/s6uwbW0cVF5cIaxCL+rjon9jYo=
Content-Type: multipart/mixed; boundary="===============4014181265514521110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.87.0 SUCCEEDED
Message-ID: <0101018aec71b834-b3565ce5-a9f1-4aaf-8368-43dfb4401772-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188530

--===============4014181265514521110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.87.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.86.2-6.87.0.patch
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
From cd0ff4a60ea743eeb672dfdb06036ffae5e380f1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 09:52:21 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.86.2 -> 6.87.0

---
 ...ython3-hypothesis_6.86.2.bb => python3-hypothesis_6.87.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.86.2.bb => python3-hypothesis_6.87.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.87.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.87.0.bb
index 6ec1457e46..b236f4613b 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.87.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "e5d75d70f5a4fc372cddf03ec6141237a0a270ed106aeb2156a4984f06d37b0f"
+SRC_URI[sha256sum] = "2cc23c9bb1ee38f64ee19dda9acc6be9a1be947f6bd841d5efb9793a7ecf1415"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


--===============4014181265514521110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.86.2" to "6.87.0"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.86.2 [default] to 6.87.0 [default]
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.86.2.tar.gz;downloadfilename=hypothesis-6.86.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.87.0.tar.gz;downloadfilename=hypothesis-6.87.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.86.2" to "6.87.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.86.2 [default] to 6.87.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.86.2" to "6.87.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.86.2 [default] to 6.87.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.86.2" to "6.87.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.86.2 [default] to 6.87.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.86.2" to "6.87.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.86.2 [default] to 6.87.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.86.2" to "6.87.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.86.2 [default] to 6.87.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.86.2" to "6.87.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.86.2 [default] to 6.87.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.86.2" to "6.87.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.86.2 [default] to 6.87.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.86.2" to "6.87.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.86.2 [default] to 6.87.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2923008 to 2920811 (-0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.86.2.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.87.0.dist-info, removed "/usr/lib/python3.11/site-packages/hypothesis/executors.py /usr/lib/python3.11/site-packages/hypothesis/__pycache__/executors.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.86.2.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.87.0.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/executors.py was removed
  /usr/lib/python3.11/site-packages/hypothesis/__pycache__/executors.cpython-311.pyc was removed

--===============4014181265514521110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.86.2-6.87.0.patch"

RnJvbSBjZDBmZjRhNjBlYTc0M2VlYjY3MmRmZGIwNjAzNmZmYWU1ZTM4MGYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwOTo1MjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2Ljg2LjIgLT4gNi44Ny4wCgotLS0KIC4uLnl0aG9u
My1oeXBvdGhlc2lzXzYuODYuMi5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi44Ny4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182Ljg2
LjIuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuODcuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljg2LjIu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljg3
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44Ni4yLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljg3LjAuYmIKaW5kZXgg
NmVjMTQ1N2U0Ni4uYjIzNmY0NjEzYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi44Ni4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuODcuMC5iYgpAQCAtMTMsNyArMTMs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZTVkNzVkNzBmNWE0ZmMzNzJjZGRmMDNlYzYxNDEyMzdhMGEy
NzBlZDEwNmFlYjIxNTZhNDk4NGYwNmQzN2IwZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyY2My
M2M5YmIxZWUzOGY2NGVlMTlkZGE5YWNjNmJlOWExYmU5NDdmNmJkODQxZDVlZmI5NzkzYTdlY2Yx
NDE1IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIu
MzkuMgoK

--===============4014181265514521110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.86.2.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.87.0.dist-info, removed "/usr/lib/python3.11/site-packages/hypothesis/executors.py /usr/lib/python3.11/site-packages/hypothesis/__pycache__/executors.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.86.2.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.87.0.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/executors.py was removed
  /usr/lib/python3.11/site-packages/hypothesis/__pycache__/executors.cpython-311.pyc was removed

--===============4014181265514521110==--

