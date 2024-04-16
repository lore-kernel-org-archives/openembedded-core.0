Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1401C27C52
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.13421.1713248037012121393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TrFfPb/i;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=s5dZDM4D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58a6f8e-f94f0b46-5f25-4b91-acb8-ca2a30359901-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P4idfJ/vCLsRsPkFyu1K2iAahi6ywKukB5zFfK4N6vo=;
	b=TrFfPb/iIfgSKM4V+5n4YBKugXY+/DaX61mEbTnA5wvoK5LRWabmVO4NRH9OFRi5
	wmYlhZM+7RC5XQohFdim2qkk8484QKuEAMEQ2LWRQqfsx/gM8CbGCVeRVMdUNw7AT0T
	Y1yBxO6aioxDmpSU6dqzeLW8WrS3rct5COxhuwbU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P4idfJ/vCLsRsPkFyu1K2iAahi6ywKukB5zFfK4N6vo=;
	b=s5dZDM4Dtl/tBcL94hH2YA+NG7pVd2bJr3fkgUOSYyOjRhpuwd30JJmpFZHlIPNY
	xoDCJE83mKejftPZeljz39S4o8I8cgpER2zTgaER9WzURRcKgmfodUcfid9TB7muGaP
	TJBYO8SWkDkbbLui+Q1FnHCuW4e9MDtwOv2RE9Ig=
Content-Type: multipart/mixed; boundary="===============4039606894819408020=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycparser: upgrading to 2.22 SUCCEEDED
Message-ID: <0101018ee58a6f8e-f94f0b46-5f25-4b91-acb8-ca2a30359901-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198297

--===============4039606894819408020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycparser* to *2.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycparser-upgrade-2.21-2.22.patch
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
From 1cea7e7e792c82b0fdbd99e110ebe4bc257b3329 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:35:27 +0000
Subject: [PATCH] python3-pycparser: upgrade 2.21 -> 2.22

---
 ...rser_2.21.bb => python3-pycparser_2.22.bb} | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycparser_2.21.bb => python3-pycparser_2.22.bb} (21%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.21.bb b/meta/recipes-devtools/python/python3-pycparser_2.22.bb
similarity index 21%
rename from meta/recipes-devtools/python/python3-pycparser_2.21.bb
rename to meta/recipes-devtools/python/python3-pycparser_2.22.bb
index 00deceebf9..64abe47152 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.21.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_2.22.bb
@@ -1,9 +1,39 @@
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
+#  pycparser -- A C parser in Python
+#  
+# -Copyright (c) 2008-2020, Eli Bendersky
+# +Copyright (c) 2008-2022, Eli Bendersky
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without modification,
+# @@ -11,7 +11,7 @@
+#  * Redistributions in binary form must reproduce the above copyright notice, 
+#    this list of conditions and the following disclaimer in the documentation 
+#    and/or other materials provided with the distribution.
+# -* Neither the name of Eli Bendersky nor the names of its contributors may 
+# +* Neither the name of the copyright holder nor the names of its contributors may 
+#    be used to endorse or promote products derived from this software without 
+#    specific prior written permission.
+#  
+# 
+#
+
 SUMMARY = "Parser of the C language, written in pure Python"
 HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c28cdeabcb88f5843d934381b4b4fea"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
 
-SRC_URI[sha256sum] = "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
+SRC_URI[sha256sum] = "491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6"
 
 inherit pypi setuptools3
 
-- 
2.42.0


--===============4039606894819408020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.12/site-packages/pycparser-2.21.dist-info moved to /usr/lib/python3.12/site-packages/pycparser-2.22.dist-info

--===============4039606894819408020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pycparser: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-2.21.tar.gz;downloadfilename=pycparser-2.21.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycparser/pycparser-2.22.tar.gz;downloadfilename=pycparser-2.22.tar.gz"
packages/core2-64-poky-linux/python3-pycparser: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-dbg: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-dbg: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-dev: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-dev: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-doc: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-doc: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-locale: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-locale: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-src: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-src: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-staticdev: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser-staticdev: PKGV changed from 2.21 [default] to 2.22 [default]
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser: PKGSIZE changed from 1192228 to 1200497 (+1%)
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser: PV changed from "2.21" to "2.22"
packages/core2-64-poky-linux/python3-pycparser/python3-pycparser: PKGV changed from 2.21 [default] to 2.22 [default]
Changes to packages/core2-64-poky-linux/python3-pycparser (sysroot):
  /usr/lib/python3.12/site-packages/pycparser-2.21.dist-info moved to /usr/lib/python3.12/site-packages/pycparser-2.22.dist-info

--===============4039606894819408020==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycparser-upgrade-2.21-2.22.patch"

RnJvbSAxY2VhN2U3ZTc5MmM4MmIwZmRiZDk5ZTExMGViZTRiYzI1N2IzMzI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6MzU6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3BhcnNlcjogdXBncmFkZSAyLjIxIC0+IDIuMjIKCi0tLQogLi4ucnNlcl8yLjIx
LmJiID0+IHB5dGhvbjMtcHljcGFyc2VyXzIuMjIuYmJ9IHwgMzQgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNwYXJzZXJfMi4yMS5i
YiA9PiBweXRob24zLXB5Y3BhcnNlcl8yLjIyLmJifSAoMjElKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJfMi4yMS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNwYXJzZXJfMi4yMi5iYgpzaW1pbGFy
aXR5IGluZGV4IDIxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHljcGFyc2VyXzIuMjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weWNwYXJzZXJfMi4yMi5iYgppbmRleCAwMGRlY2VlYmY5Li42NGFiZTQ3
MTUyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlj
cGFyc2VyXzIuMjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5Y3BhcnNlcl8yLjIyLmJiCkBAIC0xLDkgKzEsMzkgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDYgKzEsNiBAQAorIyAgcHljcGFyc2Vy
IC0tIEEgQyBwYXJzZXIgaW4gUHl0aG9uCisjICAKKyMgLUNvcHlyaWdodCAoYykgMjAwOC0yMDIw
LCBFbGkgQmVuZGVyc2t5CisjICtDb3B5cmlnaHQgKGMpIDIwMDgtMjAyMiwgRWxpIEJlbmRlcnNr
eQorIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVz
ZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0IG1vZGlmaWNhdGlv
biwKKyMgQEAgLTExLDcgKzExLDcgQEAKKyMgICogUmVkaXN0cmlidXRpb25zIGluIGJpbmFyeSBm
b3JtIG11c3QgcmVwcm9kdWNlIHRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlLCAKKyMgICAgdGhp
cyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lciBpbiB0aGUg
ZG9jdW1lbnRhdGlvbiAKKyMgICAgYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRo
IHRoZSBkaXN0cmlidXRpb24uCisjIC0qIE5laXRoZXIgdGhlIG5hbWUgb2YgRWxpIEJlbmRlcnNr
eSBub3IgdGhlIG5hbWVzIG9mIGl0cyBjb250cmlidXRvcnMgbWF5IAorIyArKiBOZWl0aGVyIHRo
ZSBuYW1lIG9mIHRoZSBjb3B5cmlnaHQgaG9sZGVyIG5vciB0aGUgbmFtZXMgb2YgaXRzIGNvbnRy
aWJ1dG9ycyBtYXkgCisjICAgIGJlIHVzZWQgdG8gZW5kb3JzZSBvciBwcm9tb3RlIHByb2R1Y3Rz
IGRlcml2ZWQgZnJvbSB0aGlzIHNvZnR3YXJlIHdpdGhvdXQgCisjICAgIHNwZWNpZmljIHByaW9y
IHdyaXR0ZW4gcGVybWlzc2lvbi4KKyMgIAorIyAKKyMKKwogU1VNTUFSWSA9ICJQYXJzZXIgb2Yg
dGhlIEMgbGFuZ3VhZ2UsIHdyaXR0ZW4gaW4gcHVyZSBQeXRob24iCiBIT01FUEFHRSA9ICJodHRw
czovL2dpdGh1Yi5jb20vZWxpYmVuL3B5Y3BhcnNlciIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNl
IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MmMyOGNkZWFiY2I4OGY1
ODQzZDkzNDM4MWI0YjRmZWEiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT05NzYxYzNmZmVlN2JhOTljNjBkY2EwNDA4ZmQzMjYyYiIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImU2NDRmZGVjMTJmNzg3MmY4NmM1OGZmNzkwZGE0NTYyMThiMTBmODYzOTcwMjQ5NTE2ZDYw
YTVlYWNhNzcyMDYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDkxYzhiZTljMDQwZjUzOTBmNWJm
NDRhNWIwNzc1MmJkMDdmNTZlZGY5OTIzODFiMDVjNzAxNDM5ZWVjMTBmNiIKIAogaW5oZXJpdCBw
eXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuNDIuMAoK

--===============4039606894819408020==--

