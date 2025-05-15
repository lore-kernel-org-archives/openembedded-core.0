Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8556C54795
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11023.1747312302710782673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=duT5/Zfh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Xfj/sCnw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010196d3ee1165-684ea1fd-544e-46a8-95f1-333d92a9f875-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312316;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s0DNm6PBZ1Z53bt1J2EuYWpI3yAFPYxizB8oxSKL2h0=;
	b=duT5/ZfhjN6ropfBK1dzWLp8zMd4an6b6t1BWPpiOMg7xENzzT/dg54cJYos+Upz
	YNRCi+CrfGBqBmKJ5S1vWqPiSAi4MsU1/1H/k7n4hLhLQC4xSaieowgPsdxNC3p9O1w
	Va5uojXVMIZLR1J+jW0PRzoQ2kZCiCLc3vRU5hZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312316;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s0DNm6PBZ1Z53bt1J2EuYWpI3yAFPYxizB8oxSKL2h0=;
	b=Xfj/sCnwYIkv9AhjytqEhedUsUaefZGcGCd6/S0oOGIzAw0ZXfj/+HKPTR0SLNaD
	Lv4YaI/LCO8C8nkt6Ynm4NZAaQhRwqo3qjirD1NgXm+Af/6CjB33RWi7yHzvm2b9lB+
	4MfwyZ/+I1Xt8kQaoJ3qIuIRb+H5798sPqlABjHw=
Content-Type: multipart/mixed; boundary="===============8636968900736660384=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 5.0.0 SUCCEEDED
Message-ID: <01010196d3ee1165-684ea1fd-544e-46a8-95f1-333d92a9f875-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216619

--===============8636968900736660384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uritools* to *5.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uritools-upgrade-4.0.3-5.0.0.patch
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
From ff81d9c5cfcafdde0d7c3baa69a1ec3285962642 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 08:25:49 +0000
Subject: [PATCH] python3-uritools: upgrade 4.0.3 -> 5.0.0

---
 ...ols_4.0.3.bb => python3-uritools_5.0.0.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-uritools_4.0.3.bb => python3-uritools_5.0.0.bb} (20%)

diff --git a/meta/recipes-devtools/python/python3-uritools_4.0.3.bb b/meta/recipes-devtools/python/python3-uritools_5.0.0.bb
similarity index 20%
rename from meta/recipes-devtools/python/python3-uritools_4.0.3.bb
rename to meta/recipes-devtools/python/python3-uritools_5.0.0.bb
index 4210407e00..6417886cd1 100644
--- a/meta/recipes-devtools/python/python3-uritools_4.0.3.bb
+++ b/meta/recipes-devtools/python/python3-uritools_5.0.0.bb
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
+# -Copyright (c) 2014-2024 Thomas Kemmer
+# +Copyright (c) 2014-2025 Thomas Kemmer
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of
+#  this software and associated documentation files (the "Software"), to deal in
+# 
+#
+
 SUMMARY = "URI parsing, classification and composition"
 HOMEPAGE = "https://github.com/tkem/uritools/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=539275e657c6b7af026bb908356f7541"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e21bbe53b2730bfe1911cf381b81821e"
 
-SRC_URI[sha256sum] = "ee06a182a9c849464ce9d5fa917539aacc8edd2a4924d1b7aabeeecabcae3bc2"
+SRC_URI[sha256sum] = "68180cad154062bd5b5d9ffcdd464f8de6934414b25462ae807b00b8df9345de"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============8636968900736660384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-uritools: PV changed from "4.0.3" to "5.0.0"
packages/core2-64-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-4.0.3.tar.gz;downloadfilename=uritools-4.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-5.0.0.tar.gz;downloadfilename=uritools-5.0.0.tar.gz"
packages/core2-64-poky-linux/python3-uritools: PKGV changed from 4.0.3 [default] to 5.0.0 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dbg: PV changed from "4.0.3" to "5.0.0"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dbg: PKGV changed from 4.0.3 [default] to 5.0.0 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dev: PV changed from "4.0.3" to "5.0.0"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dev: PKGV changed from 4.0.3 [default] to 5.0.0 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-doc: PV changed from "4.0.3" to "5.0.0"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-doc: PKGV changed from 4.0.3 [default] to 5.0.0 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-locale: PV changed from "4.0.3" to "5.0.0"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-locale: PKGV changed from 4.0.3 [default] to 5.0.0 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-ptest: PV changed from "4.0.3" to "5.0.0"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-ptest: PKGV changed from 4.0.3 [default] to 5.0.0 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-src: PV changed from "4.0.3" to "5.0.0"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-src: PKGV changed from 4.0.3 [default] to 5.0.0 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-staticdev: PV changed from "4.0.3" to "5.0.0"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-staticdev: PKGV changed from 4.0.3 [default] to 5.0.0 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools: PKGSIZE changed from 64483 to 64794 (+0%)
packages/core2-64-poky-linux/python3-uritools/python3-uritools: PV changed from "4.0.3" to "5.0.0"
packages/core2-64-poky-linux/python3-uritools/python3-uritools: PKGV changed from 4.0.3 [default] to 5.0.0 [default]
Changes to packages/core2-64-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.13/site-packages/uritools-4.0.3.dist-info moved to /usr/lib/python3.13/site-packages/uritools-5.0.0.dist-info

--===============8636968900736660384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.13/site-packages/uritools-4.0.3.dist-info moved to /usr/lib/python3.13/site-packages/uritools-5.0.0.dist-info

--===============8636968900736660384==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-4.0.3-5.0.0.patch"

RnJvbSBmZjgxZDljNWNmY2FmZGRlMGQ3YzNiYWE2OWExZWMzMjg1OTYyNjQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDg6MjU6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVyaXRvb2xzOiB1cGdyYWRlIDQuMC4zIC0+IDUuMC4wCgotLS0KIC4uLm9sc180LjAu
My5iYiA9PiBweXRob24zLXVyaXRvb2xzXzUuMC4wLmJifSB8IDI1ICsrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXJpdG9vbHNfNC4wLjMu
YmIgPT4gcHl0aG9uMy11cml0b29sc181LjAuMC5iYn0gKDIwJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNC4wLjMuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNS4wLjAuYmIKc2ltaWxh
cml0eSBpbmRleCAyMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXVyaXRvb2xzXzQuMC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdXJpdG9vbHNfNS4wLjAuYmIKaW5kZXggNDIxMDQwN2UwMC4uNjQxNzg4
NmNkMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVy
aXRvb2xzXzQuMC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My11cml0b29sc181LjAuMC5iYgpAQCAtMSwxMCArMSwzMSBAQAorIyBGSVhNRTogdGhlIExJQ19G
SUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUn
LgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQg
dGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUg
aWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVz
c2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBk
YXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMg
LS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsNiArMSw2IEBACisjICBUaGUgTUlU
IExpY2Vuc2UgKE1JVCkKKyMgIAorIyAtQ29weXJpZ2h0IChjKSAyMDE0LTIwMjQgVGhvbWFzIEtl
bW1lcgorIyArQ29weXJpZ2h0IChjKSAyMDE0LTIwMjUgVGhvbWFzIEtlbW1lcgorIyAgCisjICBQ
ZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNv
biBvYnRhaW5pbmcgYSBjb3B5IG9mCisjICB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRv
Y3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbCBpbgorIyAKKyMKKwog
U1VNTUFSWSA9ICJVUkkgcGFyc2luZywgY2xhc3NpZmljYXRpb24gYW5kIGNvbXBvc2l0aW9uIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3RrZW0vdXJpdG9vbHMvIgogCiBMSUNFTlNF
ID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTUzOTI3NWU2
NTdjNmI3YWYwMjZiYjkwODM1NmY3NTQxIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9ZTIxYmJlNTNiMjczMGJmZTE5MTFjZjM4MWI4MTgyMWUiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJlZTA2YTE4MmE5Yzg0OTQ2NGNlOWQ1ZmE5MTc1MzlhYWNjOGVkZDJhNDkyNGQx
YjdhYWJlZWVjYWJjYWUzYmMyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4MTgwY2FkMTU0MDYy
YmQ1YjVkOWZmY2RkNDY0ZjhkZTY5MzQ0MTRiMjU0NjJhZTgwN2IwMGI4ZGY5MzQ1ZGUiCiAKIGlu
aGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhvbi1weXRl
c3QKIAotLSAKMi40Ny4xCgo=

--===============8636968900736660384==--

