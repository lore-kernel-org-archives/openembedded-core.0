Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6590AC021B5
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.42633.1738416054411068661
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HwxYH4FL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dUa4BXB4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010194c1abdde4-e60f1f50-ab08-4ddf-96ee-20ef34b98c42-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416053;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hc8SfWOMLQ+44l6BXYn938Qk7SRYtifvQ81NpnGt2h8=;
	b=HwxYH4FLqIl+JTt3ssl5MpbxxcfhXurrFbHEtxdFE0pMGkIREualBVkj32SPStZV
	ZgrLhuEZVvw+/PvFeSsnwptfp1OMZq99X5+ZpSZB5gKFw3rXh6mXhyjV7ZXqDJDWNz+
	t/ZnszHc04eVytybT1WsnSoBK04kla19hh1qAxqc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416053;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hc8SfWOMLQ+44l6BXYn938Qk7SRYtifvQ81NpnGt2h8=;
	b=dUa4BXB4Dsg3gXNpNwl/3CIGKD6Dq/HFu5/w3DnLTiTkkOm5wRigaOT7bnFY0miH
	4amvNOL+RKSI++aPdoJyGitSCyBjYJ0NIp0aH+KoUqGhva5u7vqDPqVINaauvY5jQeD
	YmAojOaF9x5semA2iAzk8Yvr0qVO2fRXLuZMXzug=
Content-Type: multipart/mixed; boundary="===============6914672745216510768=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rdflib: upgrading to 7.1.3 SUCCEEDED
Message-ID: <01010194c1abdde4-e60f1f50-ab08-4ddf-96ee-20ef34b98c42-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210540

--===============6914672745216510768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rdflib* to *7.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rdflib-upgrade-7.1.1-7.1.3.patch
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
From 977fe59064aed5982c16cde5b1e40dba9c068112 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:28:08 +0000
Subject: [PATCH] python3-rdflib: upgrade 7.1.1 -> 7.1.3

---
 ...dflib_7.1.1.bb => python3-rdflib_7.1.3.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.1.1.bb => python3-rdflib_7.1.3.bb} (34%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb b/meta/recipes-devtools/python/python3-rdflib_7.1.3.bb
similarity index 34%
rename from meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.1.3.bb
index da4b777ff5..0c339b7c75 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.1.3.bb
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
+SRC_URI[sha256sum] = "f3dcb4c106a8cd9e060d92f43d593d09ebc3d07adc244f4c7315856a12e383ee"
 
 inherit pypi python_poetry_core
 
-- 
2.44.1


--===============6914672745216510768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-rdflib: PV changed from "7.1.1" to "7.1.3"
packages/core2-64-poky-linux/python3-rdflib: PKGV changed from 7.1.1 [default] to 7.1.3 [default]
packages/core2-64-poky-linux/python3-rdflib: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rdflib/rdflib-7.1.1.tar.gz;downloadfilename=rdflib-7.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/r/rdflib/rdflib-7.1.3.tar.gz;downloadfilename=rdflib-7.1.3.tar.gz"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-dbg: PV changed from "7.1.1" to "7.1.3"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-dbg: PKGV changed from 7.1.1 [default] to 7.1.3 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-dev: PV changed from "7.1.1" to "7.1.3"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-dev: PKGV changed from 7.1.1 [default] to 7.1.3 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-doc: PV changed from "7.1.1" to "7.1.3"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-doc: PKGV changed from 7.1.1 [default] to 7.1.3 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-locale: PV changed from "7.1.1" to "7.1.3"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-locale: PKGV changed from 7.1.1 [default] to 7.1.3 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-src: PV changed from "7.1.1" to "7.1.3"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-src: PKGV changed from 7.1.1 [default] to 7.1.3 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-staticdev: PV changed from "7.1.1" to "7.1.3"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib-staticdev: PKGV changed from 7.1.1 [default] to 7.1.3 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib: PV changed from "7.1.1" to "7.1.3"
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib: PKGV changed from 7.1.1 [default] to 7.1.3 [default]
packages/core2-64-poky-linux/python3-rdflib/python3-rdflib: PKGSIZE changed from 3775478 to 3794661 (+1%)
Changes to packages/core2-64-poky-linux/python3-rdflib (sysroot):
  /usr/lib/python3.13/site-packages/rdflib-7.1.1.dist-info moved to /usr/lib/python3.13/site-packages/rdflib-7.1.3.dist-info

--===============6914672745216510768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-rdflib (sysroot):
  /usr/lib/python3.13/site-packages/rdflib-7.1.1.dist-info moved to /usr/lib/python3.13/site-packages/rdflib-7.1.3.dist-info

--===============6914672745216510768==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rdflib-upgrade-7.1.1-7.1.3.patch"

RnJvbSA5NzdmZTU5MDY0YWVkNTk4MmMxNmNkZTViMWU0MGRiYTljMDY4MTEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODoyODowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcmRmbGliOiB1cGdyYWRlIDcuMS4xIC0+IDcuMS4zCgotLS0KIC4uLmRmbGliXzcuMS4x
LmJiID0+IHB5dGhvbjMtcmRmbGliXzcuMS4zLmJifSB8IDI1ICsrKysrKysrKysrKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcmRmbGliXzcuMS4xLmJiID0+
IHB5dGhvbjMtcmRmbGliXzcuMS4zLmJifSAoMzQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZGZsaWJfNy4xLjEuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmRmbGliXzcuMS4zLmJiCnNpbWlsYXJpdHkgaW5kZXgg
MzQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZGZs
aWJfNy4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1yZGZsaWJfNy4xLjMuYmIKaW5kZXggZGE0Yjc3N2ZmNS4uMGMzMzliN2M3NSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJkZmxpYl83LjEuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmRmbGliXzcuMS4zLmJi
CkBAIC0xLDEwICsxLDMxIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMg
aGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcg
aXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4
dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1t
YXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1V
cGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFy
cyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysg
TElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgIEJTRCAzLUNsYXVzZSBMaWNlbnNlCisjICAK
KyMgLUNvcHlyaWdodCAoYykgMjAwMi0yMDI0LCBSREZMaWIgVGVhbQorIyArQ29weXJpZ2h0IChj
KSAyMDAyLTIwMjUsIFJERkxpYiBUZWFtCisjICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisj
ICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRo
IG9yIHdpdGhvdXQKKyMgCisjCisKIFNVTU1BUlkgPSAiUkRGTGliIGlzIGEgcHVyZSBQeXRob24g
cGFja2FnZSBmb3Igd29ya2luZyB3aXRoIFJERiIKIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHVi
LmNvbS9SREZMaWIvcmRmbGliIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0g
IkJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWUx
ZWZkZTI1ZTQ1OTA1N2E4MTU2NDliMThjYmVmYTVlIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9NzAwNmU5NzM0ODZjNDcwMDU1NmY2ZDU4Y2JhMGFiNmMiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICIxNjRkZTg2YmQzNTY0NTU4ODAyY2E5ODNkODRmNjYxNmE0YTFhNDIw
YzdhMTdhODE1MmY1MDE2MDc2YjI5MTNlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYzZGNiNGMx
MDZhOGNkOWUwNjBkOTJmNDNkNTkzZDA5ZWJjM2QwN2FkYzI0NGY0YzczMTU4NTZhMTJlMzgzZWUi
CiAKIGluaGVyaXQgcHlwaSBweXRob25fcG9ldHJ5X2NvcmUKIAotLSAKMi40NC4xCgo=

--===============6914672745216510768==--

