Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F271C30653
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:41 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.42229.1717263217979766766
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fMIb1QG/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=J3F7+vzp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018fd4dd3572-a6642a41-3e50-4ca4-8b81-90db663acc17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EQiBLm/mxv3hxEGnb1HgvOFHJsD3M0MkIH25W/nQNqM=;
	b=fMIb1QG/lFDWaJYEIbaTMZgMqSx/7SsFFG2TXQvgEFrzgtKtIKh2YVRLXXl9sRLS
	6d88ANPevJDF6IbKg2YTCCzqweDSvzmiZWVCKpBqABLEtbHWzxIyYhXUgfLTmBT1M7E
	LuFEX/U0w6zE+L66aBChsFP4sT1/KNFwgM9CaZhM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EQiBLm/mxv3hxEGnb1HgvOFHJsD3M0MkIH25W/nQNqM=;
	b=J3F7+vzpuD3FmNy+/3PG1uNAJy4fW7arHoei3AlajMbGvtQzM9urpItJVyEdXu4r
	b0rO7YkpHG+I5ihaKsxN1hce+vDd//s0V7DVnN3Z/oYAy1FgXn0uCitHTxZzRtk7x1Y
	afNJSVgi/4F8ZuVKB75L1STjlzKjUxcjmjQMCHWk=
Content-Type: multipart/mixed; boundary="===============2863542695997622779=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 4.0.3 SUCCEEDED
Message-ID: <0101018fd4dd3572-a6642a41-3e50-4ca4-8b81-90db663acc17-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200131

--===============2863542695997622779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-uritools* to *4.0.3* has Succeeded.

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
From 57b5f5cc9c0d861d16218b8bd3b8576ba941a36a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 09:41:36 +0000
Subject: [PATCH] python3-uritools: upgrade 4.0.2 -> 4.0.3

---
 ...ols_4.0.2.bb => python3-uritools_4.0.3.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-uritools_4.0.2.bb => python3-uritools_4.0.3.bb} (17%)

diff --git a/meta/recipes-devtools/python/python3-uritools_4.0.2.bb b/meta/recipes-devtools/python/python3-uritools_4.0.3.bb
similarity index 17%
rename from meta/recipes-devtools/python/python3-uritools_4.0.2.bb
rename to meta/recipes-devtools/python/python3-uritools_4.0.3.bb
index 5ffedccb85..e09c2acf6d 100644
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
 
 inherit setuptools3 pypi
 
-- 
2.44.0


--===============2863542695997622779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-uritools: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uritools/uritools-4.0.2.tar.gz;downloadfilename=uritools-4.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/u/uritools/uritools-4.0.3.tar.gz;downloadfilename=uritools-4.0.3.tar.gz"
packages/core2-64-poky-linux/python3-uritools: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dbg: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dbg: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dev: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-dev: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-doc: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-doc: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-locale: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-locale: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-src: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-src: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools-staticdev: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools-staticdev: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
packages/core2-64-poky-linux/python3-uritools/python3-uritools: PV changed from "4.0.2" to "4.0.3"
packages/core2-64-poky-linux/python3-uritools/python3-uritools: PKGV changed from 4.0.2 [default] to 4.0.3 [default]
Changes to packages/core2-64-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.12/site-packages/uritools-4.0.2.dist-info moved to /usr/lib/python3.12/site-packages/uritools-4.0.3.dist-info

--===============2863542695997622779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.12/site-packages/uritools-4.0.2.dist-info moved to /usr/lib/python3.12/site-packages/uritools-4.0.3.dist-info

--===============2863542695997622779==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-4.0.2-4.0.3.patch"

RnJvbSA1N2I1ZjVjYzljMGQ4NjFkMTYyMThiOGJkM2I4NTc2YmE5NDFhMzZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAwOTo0MTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJpdG9vbHM6IHVwZ3JhZGUgNC4wLjIgLT4gNC4wLjMKCi0tLQogLi4ub2xzXzQuMC4y
LmJiID0+IHB5dGhvbjMtdXJpdG9vbHNfNC4wLjMuYmJ9IHwgMjUgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cml0b29sc180LjAuMi5i
YiA9PiBweXRob24zLXVyaXRvb2xzXzQuMC4zLmJifSAoMTclKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc180LjAuMi5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc180LjAuMy5iYgpzaW1pbGFy
aXR5IGluZGV4IDE3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJpdG9vbHNfNC4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy11cml0b29sc180LjAuMy5iYgppbmRleCA1ZmZlZGNjYjg1Li5lMDljMmFj
ZjZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJp
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
NjRjZTlkNWZhOTE3NTM5YWFjYzhlZGQyYTQ5MjRkMWI3YWFiZWVlY2FiY2FlM2JjMiIKIAogaW5o
ZXJpdCBzZXR1cHRvb2xzMyBweXBpCiAKLS0gCjIuNDQuMAoK

--===============2863542695997622779==--

