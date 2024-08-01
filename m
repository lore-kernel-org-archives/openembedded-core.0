Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63072C54751
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:13 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.75751.1722536828607117782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZDy5FTq6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IDfs/Xy+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f322109-202b5e83-999d-472a-9119-ea3f64ff38eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536829;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mViErEeC4F6Ni+zVE4Be7EHNIGGZCFq06vgrB7/DHXQ=;
	b=ZDy5FTq6GXqy0fXpqLYQjObERKOajUhZ6Y+Dc2Uth1iPG0xg0dZx4Ng2fks2A6zU
	vyAd+5foD/RK7bSh2P4GN666A8GlGCtV6v9iGzY5r5A5vlcz6GSupAjIQ5SBhfcQ2nD
	rG0KHiHUUIWnbeDsUrHPmCi0zDaz7zDLt7UWTITc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536829;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mViErEeC4F6Ni+zVE4Be7EHNIGGZCFq06vgrB7/DHXQ=;
	b=IDfs/Xy+Z/AS3Tt/PbwFmp2pUetqbDDCpyHd1//AhsJ0zXMJ2JTyaj1gkjvBl/Z8
	Suj9+RWXhVkyC5uBoR8H7ut3ob3ITJO6TFmg1LtwA9ei4aN7rp5JWJ9t0ZVcpMS5qfc
	JsyGtcqW7YpYbC0sapJyyZbpTkAaDpVn0457vVLQ=
Content-Type: multipart/mixed; boundary="===============6143851617310499922=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 4.0.3 SUCCEEDED
Message-ID: <010101910f322109-202b5e83-999d-472a-9119-ea3f64ff38eb-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202820

--===============6143851617310499922==
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
From 429ffe8a3ec8a7cc6d337e06ce66fde5fc74f64e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 11:15:58 +0000
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


--===============6143851617310499922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.12/site-packages/uritools-4.0.2.dist-info moved to /usr/lib/python3.12/site-packages/uritools-4.0.3.dist-info

--===============6143851617310499922==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-4.0.2-4.0.3.patch"

RnJvbSA0MjlmZmU4YTNlYzhhN2NjNmQzMzdlMDZjZTY2ZmRlNWZjNzRmNjRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMToxNTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJpdG9vbHM6IHVwZ3JhZGUgNC4wLjIgLT4gNC4wLjMKCi0tLQogLi4ub2xzXzQuMC4y
LmJiID0+IHB5dGhvbjMtdXJpdG9vbHNfNC4wLjMuYmJ9IHwgMjUgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cml0b29sc180LjAuMi5i
YiA9PiBweXRob24zLXVyaXRvb2xzXzQuMC4zLmJifSAoMzElKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc180LjAuMi5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc180LjAuMy5iYgpzaW1pbGFy
aXR5IGluZGV4IDMxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJpdG9vbHNfNC4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy11cml0b29sc180LjAuMy5iYgppbmRleCA2OTNkMTk3NGJlLi4xOWJjZTdi
ZWVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJp
dG9vbHNfNC4wLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXVyaXRvb2xzXzQuMC4zLmJiCkBAIC0xLDEwICsxLDMxIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJ
TEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScu
CisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0
aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBp
ZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNz
YWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRh
dGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAt
LS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgIFRoZSBNSVQg
TGljZW5zZSAoTUlUKQorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMTQtMjAyMiBUaG9tYXMgS2Vt
bWVyCisjICtDb3B5cmlnaHQgKGMpIDIwMTQtMjAyNCBUaG9tYXMgS2VtbWVyCisjICAKKyMgIFBl
cm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29u
IG9idGFpbmluZyBhIGNvcHkgb2YKKyMgIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9j
dW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluCisjIAorIworCiBT
VU1NQVJZID0gIlVSSSBwYXJzaW5nLCBjbGFzc2lmaWNhdGlvbiBhbmQgY29tcG9zaXRpb24iCiBI
T01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vdGtlbS91cml0b29scy8iCiAKIExJQ0VOU0Ug
PSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MWVjNTUzNTNj
ODBjNjYyZTQyNTVmODg4OWEwY2E1NTgiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT01MzkyNzVlNjU3YzZiN2FmMDI2YmI5MDgzNTZmNzU0MSIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjA0ZGYyYjc4N2QwZWI3NjIwMGU4MzE5MzgyYTAzNTYyZmJmZTQ3NDFmZDY2YzE1
NTA2YjA4ZDNiODIxMWQ1NzMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWUwNmExODJhOWM4NDk0
NjRjZTlkNWZhOTE3NTM5YWFjYzhlZGQyYTQ5MjRkMWI3YWFiZWVlY2FiY2FlM2JjMiIKIAogU1JD
X1VSSSArPSAiZmlsZTovL3J1bi1wdGVzdCIKIAotLSAKMi40NC4wCgo=

--===============6143851617310499922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-uritools: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-4.0.2.tar.gz;downloadfilename=uritools-4.0.2.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-4.0.3.tar.gz;downloadfilename=uritools-4.0.3.tar.gz file://run-ptest"
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

--===============6143851617310499922==--

