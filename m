Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AC3C021A2
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.17871.1736936770254010955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aCLtJSsr;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kJZZtH6X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194697fcb25-272c0b32-7ce7-40af-a01e-51542c94d9a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jfRwZKbGGVg0CAnXTHGPo7zNefZaf2li7s/9Y8Hyl0Y=;
	b=aCLtJSsrVfzBSvFpw5L3C7J9P611tWsm262NhJcg5TMpZWOVjPoMsPoIcgHo/YBp
	U9FvuqpgJAOazIG0umUjSHkJq7VdaVh5ND30n1OuU68H+0TQjVWKLXurallrj+2xWg5
	YcAKpxmAi5G9AGu6PiZdAiDmRKa/fRtdQDyXoPt4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jfRwZKbGGVg0CAnXTHGPo7zNefZaf2li7s/9Y8Hyl0Y=;
	b=kJZZtH6XjuQhYl3LGE4yz5Mzr/8Aj9FqZ+Mto1Lv4804sVuvpKZ4rafxxuEUxBK/
	FtjVdA5/wY028Nch44e7T39e70xGUNS2E1xps1l8M38aP3Snc0+FXIl6bw8RGS8aIEC
	SpvqRiO5NMMJvjdSpwJbuxdXGJTkNIrG9+Q9TF4w=
Content-Type: multipart/mixed; boundary="===============4375990251941725409=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rdflib: upgrading to 7.1.2 SUCCEEDED
Message-ID: <01010194697fcb25-272c0b32-7ce7-40af-a01e-51542c94d9a1-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209845

--===============4375990251941725409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rdflib* to *7.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rdflib-upgrade-7.1.1-7.1.2.patch
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
From 31925af7963d3d1dd030843756166a3116e044e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 07:44:46 +0000
Subject: [PATCH] python3-rdflib: upgrade 7.1.1 -> 7.1.2

---
 ...dflib_7.1.1.bb => python3-rdflib_7.1.2.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.1.1.bb => python3-rdflib_7.1.2.bb} (34%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb b/meta/recipes-devtools/python/python3-rdflib_7.1.2.bb
similarity index 34%
rename from meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.1.2.bb
index da4b777ff5..253a4bf1f6 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.1.2.bb
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
+#  BSD 3-Clause License
+#  
+# -Copyright (c) 2002-2024, RDFLib Team
+# +Copyright (c) 2002-2025, RDFLib Team
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "RDFLib is a pure Python package for working with RDF"
 HOMEPAGE = "https://github.com/RDFLib/rdflib"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e1efde25e459057a815649b18cbefa5e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7006e973486c4700556f6d58cba0ab6c"
 
-SRC_URI[sha256sum] = "164de86bd3564558802ca983d84f6616a4a1a420c7a17a8152f5016076b2913e"
+SRC_URI[sha256sum] = "4fc8f6d50b199dc38fbc5256370f038c1cedca6102ccbde4e37c0fd2b7f36e65"
 
 inherit pypi python_poetry_core
 
-- 
2.44.1


--===============4375990251941725409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-rdflib: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-64-poky-linux/python3-rdflib: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rdflib/rdflib-7.1.1.tar.gz;downloadfilename=rdflib-7.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/r/rdflib/rdflib-7.1.2.tar.gz;downloadfilename=rdflib-7.1.2.tar.gz"
packages/core2-64-poky-linux/python3-rdflib: PV changed from "7.1.1" to "7.1.2"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-dbg: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-dbg: PV changed from "7.1.1" to "7.1.2"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-dev: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-dev: PV changed from "7.1.1" to "7.1.2"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-doc: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-doc: PV changed from "7.1.1" to "7.1.2"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-locale: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-locale: PV changed from "7.1.1" to "7.1.2"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-src: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-src: PV changed from "7.1.1" to "7.1.2"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-staticdev: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-staticdev: PV changed from "7.1.1" to "7.1.2"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib: PKGV changed from 7.1.1 [default] to 7.1.2 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib: PKGSIZE changed from 3775478 to 3809710 (+1%)
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib: FILELIST: directory renamed /usr/lib/python3.13/site-packages/rdflib-7.1.1.dist-info -> /usr/lib/python3.13/site-packages/rdflib-7.1.2.dist-info, added "/usr/lib/python3.13/site-packages/rdflib/__pycache__/t.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/t.py"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib: PV changed from "7.1.1" to "7.1.2"
Changes to packages/core2-64-poky-linux/python3-rdflib (sysroot):
  /usr/lib/python3.13/site-packages/rdflib-7.1.1.dist-info moved to /usr/lib/python3.13/site-packages/rdflib-7.1.2.dist-info
  /usr/lib/python3.13/site-packages/rdflib/__pycache__/t.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/t.py was added

--===============4375990251941725409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-rdflib/python3-rdflib: FILELIST: directory renamed /usr/lib/python3.13/site-packages/rdflib-7.1.1.dist-info -> /usr/lib/python3.13/site-packages/rdflib-7.1.2.dist-info, added "/usr/lib/python3.13/site-packages/rdflib/__pycache__/t.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/t.py"
Changes to packages/core2-64-poky-linux/python3-rdflib (sysroot):
  /usr/lib/python3.13/site-packages/rdflib-7.1.1.dist-info moved to /usr/lib/python3.13/site-packages/rdflib-7.1.2.dist-info
  /usr/lib/python3.13/site-packages/rdflib/__pycache__/t.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/t.py was added

--===============4375990251941725409==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rdflib-upgrade-7.1.1-7.1.2.patch"

RnJvbSAzMTkyNWFmNzk2M2QzZDFkZDAzMDg0Mzc1NjE2NmEzMTE2ZTA0NGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDc6NDQ6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJkZmxpYjogdXBncmFkZSA3LjEuMSAtPiA3LjEuMgoKLS0tCiAuLi5kZmxpYl83LjEu
MS5iYiA9PiBweXRob24zLXJkZmxpYl83LjEuMi5iYn0gfCAyNSArKysrKysrKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJkZmxpYl83LjEuMS5iYiA9
PiBweXRob24zLXJkZmxpYl83LjEuMi5iYn0gKDM0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmRmbGliXzcuMS4xLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJkZmxpYl83LjEuMi5iYgpzaW1pbGFyaXR5IGluZGV4
IDM0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmRm
bGliXzcuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcmRmbGliXzcuMS4yLmJiCmluZGV4IGRhNGI3NzdmZjUuLjI1M2E0YmYxZjYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZGZsaWJfNy4xLjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJkZmxpYl83LjEuMi5i
YgpAQCAtMSwxMCArMSwzMSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysr
IExJQ0VOU0UKKyMgQEAgLTEsNiArMSw2IEBACisjICBCU0QgMy1DbGF1c2UgTGljZW5zZQorIyAg
CisjIC1Db3B5cmlnaHQgKGMpIDIwMDItMjAyNCwgUkRGTGliIFRlYW0KKyMgK0NvcHlyaWdodCAo
YykgMjAwMi0yMDI1LCBSREZMaWIgVGVhbQorIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAor
IyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0
aCBvciB3aXRob3V0CisjIAorIworCiBTVU1NQVJZID0gIlJERkxpYiBpcyBhIHB1cmUgUHl0aG9u
IHBhY2thZ2UgZm9yIHdvcmtpbmcgd2l0aCBSREYiCiBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vUkRGTGliL3JkZmxpYiIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9
ICJCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1l
MWVmZGUyNWU0NTkwNTdhODE1NjQ5YjE4Y2JlZmE1ZSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTcwMDZlOTczNDg2YzQ3MDA1NTZmNmQ1OGNiYTBhYjZjIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMTY0ZGU4NmJkMzU2NDU1ODgwMmNhOTgzZDg0ZjY2MTZhNGExYTQy
MGM3YTE3YTgxNTJmNTAxNjA3NmIyOTEzZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZmM4ZjZk
NTBiMTk5ZGMzOGZiYzUyNTYzNzBmMDM4YzFjZWRjYTYxMDJjY2JkZTRlMzdjMGZkMmI3ZjM2ZTY1
IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3BvZXRyeV9jb3JlCiAKLS0gCjIuNDQuMQoK

--===============4375990251941725409==--

