Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99F4C54E83
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:05 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.131416.1723748333739600321
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NPYNXWzY;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3vx48grR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019157683b22-043780a8-c4bf-4e43-858d-18388a293676-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uc1V8KMEm2mfjixOQfm0NVV/Xh0f7ZTufA7Oa87AX4w=;
	b=NPYNXWzYqA7qiGxVYdGXO+PMuNVvAIw65bqSKlwEHy3YqNC+biQyaMXIWVbrINXf
	WrC6I7+EBcxtNm3i0yfThTYSPCAfSzIuZ0hGTDIQ9hE23A6EvkCbzynqzELQVGd/+MR
	ynjUPUARFvABd7JysGKhHuQqxr5ipYMzeceIU4+A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uc1V8KMEm2mfjixOQfm0NVV/Xh0f7ZTufA7Oa87AX4w=;
	b=3vx48grRlHngnnHwN7ebcodXgS0AMAg1rAbNkehukul4rDmA/33Rq+M1NeDdxCFZ
	Nk6m+FDMLIqFvbJTOhiOVhU1pfG4znJ4YKUQekMU5BmwO19QMNoEoxqYf6pu0upIz7o
	FopdM6iGoWymWw5JDo8mAl1azBcBIT/QcP9pj12I=
Content-Type: multipart/mixed; boundary="===============1047096142196313320=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 4.0.3 SUCCEEDED
Message-ID: <0101019157683b22-043780a8-c4bf-4e43-858d-18388a293676-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203381

--===============1047096142196313320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uritools* to *4.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uritools-upgrade-4.0.2-4.0.3.patch
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
From ebb98af08cc807110504670264750be3906cecfd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 12:18:07 +0000
Subject: [PATCH] python3-uritools: upgrade 4.0.2 -> 4.0.3

---
 ...ols_4.0.2.bb => python3-uritools_4.0.3.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-uritools_4.0.2.bb => python3-uritools_4.0.3.bb} (31%)

diff --git a/meta/recipes-devtools/python/python3-uritools_4.0.2.bb b/meta/recipes-devtools/python/python3-uritools_4.0.3.bb
similarity index 31%
rename from meta/recipes-devtools/python/python3-uritools_4.0.2.bb
rename to meta/recipes-devtools/python/python3-uritools_4.0.3.bb
index 693d1974be..19bce7beea 100644
--- a/meta/recipes-devtools/python/python3-uritools_4.0.2.bb
+++ b/meta/recipes-devtools/python/python3-uritools_4.0.3.bb
@@ -1,10 +1,31 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,6 +1,6 @@
+#  The MIT License (MIT)
+#  
+# -Copyright (c) 2014-2022 Thomas Kemmer
+# +Copyright (c) 2014-2024 Thomas Kemmer
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of
+#  this software and associated documentation files (the "Software"), to deal in
+# 
+#
+
 SUMMARY = "URI parsing, classification and composition"
 HOMEPAGE = "https://github.com/tkem/uritools/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1ec55353c80c662e4255f8889a0ca558"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=539275e657c6b7af026bb908356f7541"
 
-SRC_URI[sha256sum] = "04df2b787d0eb76200e8319382a03562fbfe4741fd66c15506b08d3b8211d573"
+SRC_URI[sha256sum] = "ee06a182a9c849464ce9d5fa917539aacc8edd2a4924d1b7aabeeecabcae3bc2"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.44.0


--===============1047096142196313320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.12/site-packages/uritools-4.0.2.dist-info moved to /usr/lib/python3.12/site-packages/uritools-4.0.3.dist-info

--===============1047096142196313320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-4.0.2.tar.gz;downloadfilename=uritools-4.0.2.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-4.0.3.tar.gz;downloadfilename=uritools-4.0.3.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-uritools: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dbg: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dbg: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dev: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dev: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-doc: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-doc: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-locale: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-locale: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-ptest: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-ptest: PKGSIZE changed from 44520 to 46844 (+5%)
packages/core2-64-poky-linux/python3-uritools/python3-uritools-ptest: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-src: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-src: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-staticdev: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-staticdev: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
Changes to packages/core2-64-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.12/site-packages/uritools-4.0.2.dist-info moved to /usr/lib/python3.12/site-packages/uritools-4.0.3.dist-info

--===============1047096142196313320==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-4.0.2-4.0.3.patch"

RnJvbSBlYmI5OGFmMDhjYzgwNzExMDUwNDY3MDI2NDc1MGJlMzkwNmNlY2ZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTI6MTg6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVyaXRvb2xzOiB1cGdyYWRlIDQuMC4yIC0+IDQuMC4zCgotLS0KIC4uLm9sc180LjAu
Mi5iYiA9PiBweXRob24zLXVyaXRvb2xzXzQuMC4zLmJifSB8IDI1ICsrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXJpdG9vbHNfNC4wLjIu
YmIgPT4gcHl0aG9uMy11cml0b29sc180LjAuMy5iYn0gKDMxJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNC4wLjIuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNC4wLjMuYmIKc2ltaWxh
cml0eSBpbmRleCAzMSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXVyaXRvb2xzXzQuMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNC4wLjMuYmIKaW5kZXggNjkzZDE5NzRiZS4uMTliY2U3
YmVlYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVy
aXRvb2xzXzQuMC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My11cml0b29sc180LjAuMy5iYgpAQCAtMSwxMCArMSwzMSBAQAorIyBGSVhNRTogdGhlIExJQ19G
SUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUn
LgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQg
dGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUg
aWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVz
c2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBk
YXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMg
LS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsNiArMSw2IEBACisjICBUaGUgTUlU
IExpY2Vuc2UgKE1JVCkKKyMgIAorIyAtQ29weXJpZ2h0IChjKSAyMDE0LTIwMjIgVGhvbWFzIEtl
bW1lcgorIyArQ29weXJpZ2h0IChjKSAyMDE0LTIwMjQgVGhvbWFzIEtlbW1lcgorIyAgCisjICBQ
ZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNv
biBvYnRhaW5pbmcgYSBjb3B5IG9mCisjICB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRv
Y3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbCBpbgorIyAKKyMKKwog
U1VNTUFSWSA9ICJVUkkgcGFyc2luZywgY2xhc3NpZmljYXRpb24gYW5kIGNvbXBvc2l0aW9uIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3RrZW0vdXJpdG9vbHMvIgogCiBMSUNFTlNF
ID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTFlYzU1MzUz
YzgwYzY2MmU0MjU1Zjg4ODlhMGNhNTU4IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9NTM5Mjc1ZTY1N2M2YjdhZjAyNmJiOTA4MzU2Zjc1NDEiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIwNGRmMmI3ODdkMGViNzYyMDBlODMxOTM4MmEwMzU2MmZiZmU0NzQxZmQ2NmMx
NTUwNmIwOGQzYjgyMTFkNTczIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVlMDZhMTgyYTljODQ5
NDY0Y2U5ZDVmYTkxNzUzOWFhY2M4ZWRkMmE0OTI0ZDFiN2FhYmVlZWNhYmNhZTNiYzIiCiAKIFNS
Q19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QiCiAKLS0gCjIuNDQuMAoK

--===============1047096142196313320==--

