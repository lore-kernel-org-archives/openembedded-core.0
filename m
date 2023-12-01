Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E28BC25B08
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.22201.1701436492147119151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DNWz3OWP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qh4kzjYY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018c258485ad-89057295-de47-43ac-a0c7-4a54b8acc12c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uKG+0L+vtsVhSPo4bKqJkt8XdS2hRvcOPc8cuKICsgU=;
	b=DNWz3OWPWc5gcERoHDWibP/+cvwe0psfZG/xPIyc0D3ShF1Hf3AtZCX5+P6Ft343
	9Ap5KMTQAzMrMOtozmVaCDRKkiL4oFIgk0gniI/osOxamluC0U2tWv3uVLyen9M/Utp
	FPM/mK9wB+z2FR+29gApWNzzQv7TkXOFkW16caJA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uKG+0L+vtsVhSPo4bKqJkt8XdS2hRvcOPc8cuKICsgU=;
	b=qh4kzjYYvSL79fNDt4za6UHDP5MZ73+Tj0mocqIP2JViRwn9mJaq0hwJosYSpHK5
	rRc4gMwT08cqFHaBY0uWno16+DxVk11zJ0hgo/lXkmnXDyl3FtFGfjW+gmuC9/fzBdB
	kNaiDaN9hb0D7/L3VjU16GZoRLMpidnD80w7udc8=
Content-Type: multipart/mixed; boundary="===============7318094511444810134=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.91.0 SUCCEEDED
Message-ID: <0101018c258485ad-89057295-de47-43ac-a0c7-4a54b8acc12c-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191619

--===============7318094511444810134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.91.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.90.0-6.91.0.patch
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
From e37a0fcac6d143a842f7822e0da0375f2d480b36 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 08:46:21 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.90.0 -> 6.91.0

---
 ...ython3-hypothesis_6.90.0.bb => python3-hypothesis_6.91.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.90.0.bb => python3-hypothesis_6.91.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.90.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.91.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.90.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.91.0.bb
index 1760bb37a2..d7b786fbe4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.90.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.91.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "0ab33900b9362318bd03d911a77a0dda8629c1877420074d87ae466919f6e4c0"
+SRC_URI[sha256sum] = "a9f61a2bcfc342febcc1d04b80a99e789c57b700f91cbd43bbdb5d651af385cd"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


--===============7318094511444810134==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.90.0-6.91.0.patch"

RnJvbSBlMzdhMGZjYWM2ZDE0M2E4NDJmNzgyMmUwZGEwMzc1ZjJkNDgwYjM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwODo0NjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjkwLjAgLT4gNi45MS4wCgotLS0KIC4uLnl0aG9u
My1oeXBvdGhlc2lzXzYuOTAuMC5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi45MS4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182Ljkw
LjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuOTEuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjkwLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljkx
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi45MC4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjkxLjAuYmIKaW5kZXgg
MTc2MGJiMzdhMi4uZDdiNzg2ZmJlNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi45MC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuOTEuMC5iYgpAQCAtMTMsNyArMTMs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMGFiMzM5MDBiOTM2MjMxOGJkMDNkOTExYTc3YTBkZGE4NjI5
YzE4Nzc0MjAwNzRkODdhZTQ2NjkxOWY2ZTRjMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhOWY2
MWEyYmNmYzM0MmZlYmNjMWQwNGI4MGE5OWU3ODljNTdiNzAwZjkxY2JkNDNiYmRiNWQ2NTFhZjM4
NWNkIgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIu
MzkuMgoK

--===============7318094511444810134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-hypothesis: PV changed from "6.90.0" to "6.91.0"
packages/core2-64-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.90.0.tar.gz;downloadfilename=hypothesis-6.90.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.91.0.tar.gz;downloadfilename=hypothesis-6.91.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-64-poky-linux/python3-hypothesis: PKGV changed from 6.90.0 [default] to 6.91.0 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.90.0" to "6.91.0"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.90.0 [default] to 6.91.0 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.90.0" to "6.91.0"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.90.0 [default] to 6.91.0 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.90.0" to "6.91.0"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.90.0 [default] to 6.91.0 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.90.0" to "6.91.0"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.90.0 [default] to 6.91.0 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.90.0" to "6.91.0"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.90.0 [default] to 6.91.0 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.90.0" to "6.91.0"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.90.0 [default] to 6.91.0 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.90.0" to "6.91.0"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.90.0 [default] to 6.91.0 [default]
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2952633 to 2951732 (-0%)
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.90.0" to "6.91.0"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.90.0.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.91.0.dist-info, removed "/usr/lib/python3.11/site-packages/hypothesis/internal/__pycache__/lazyformat.cpython-311.pyc /usr/lib/python3.11/site-packages/hypothesis/internal/lazyformat.py"
packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.90.0 [default] to 6.91.0 [default]
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.90.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.91.0.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/internal/lazyformat.py was removed
  /usr/lib/python3.11/site-packages/hypothesis/internal/__pycache__/lazyformat.cpython-311.pyc was removed

--===============7318094511444810134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.90.0.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.91.0.dist-info, removed "/usr/lib/python3.11/site-packages/hypothesis/internal/lazyformat.py /usr/lib/python3.11/site-packages/hypothesis/internal/__pycache__/lazyformat.cpython-311.pyc"
Changes to packages/core2-64-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.90.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.91.0.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/internal/lazyformat.py was removed
  /usr/lib/python3.11/site-packages/hypothesis/internal/__pycache__/lazyformat.cpython-311.pyc was removed

--===============7318094511444810134==--

