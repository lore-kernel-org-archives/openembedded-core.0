Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE13BC7EE2C
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:45 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.27775.1748786129144655672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OR8deEa6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WmiIuGIb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101972bc6cff7-2117aee3-6671-4657-b08f-1899f0353794-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786139;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h/RQFNs9E/x1mGi4te1XJEX3AT/GLwx/0mY1UGGSmVw=;
	b=OR8deEa65qmMFMwdDHpMk7bB/oTxqoy5D6oYbeGgFo/3ME6A8EDiip7xYWmfXy7x
	w9t9U5l+U2OMt01M14YIQIpawMCpM7bkjeWr+azDeed8ZuZMg0YCFIywRFkZAkr3Dk1
	cocj4YbhbNqxHjOQ2LHtSPWLCQ94W1pP5PE0YXSQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786139;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h/RQFNs9E/x1mGi4te1XJEX3AT/GLwx/0mY1UGGSmVw=;
	b=WmiIuGIblyB5uXDLb1NIi4qynpQRfaxnTY4BaQeIJ35/r/JFm50R8wNqHzjkGjcf
	wpw+chAX4DaSMUTHHS7TOsXV5uvidf6AhAb+jACq1YzFvz6GPBA+eUQ9v788CbPJKyT
	DqmjLPbM8TfPFZ1dRmrAM2Abg/oQvMV0E4UV3q9g=
Content-Type: multipart/mixed; boundary="===============0860889991342627595=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uritools: upgrading to 5.0.0 SUCCEEDED
Message-ID: <010101972bc6cff7-2117aee3-6671-4657-b08f-1899f0353794-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217616

--===============0860889991342627595==
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
From 2089abe50ffe351a5bc56ccc1556d79ff824c373 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 10:08:42 +0000
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


--===============0860889991342627595==
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
packages/core2-64-poky-linux/python3-uritools/python3-uritools: PV changed from "4.0.3" to "5.0.0"
packages/core2-64-poky-linux/python3-uritools/python3-uritools: PKGSIZE changed from 64483 to 64794 (+0%)
packages/core2-64-poky-linux/python3-uritools/python3-uritools: PKGV changed from 4.0.3 [default] to 5.0.0 [default]
Changes to packages/core2-64-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.13/site-packages/uritools-4.0.3.dist-info moved to /usr/lib/python3.13/site-packages/uritools-5.0.0.dist-info

--===============0860889991342627595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-uritools (sysroot):
  /usr/lib/python3.13/site-packages/uritools-4.0.3.dist-info moved to /usr/lib/python3.13/site-packages/uritools-5.0.0.dist-info

--===============0860889991342627595==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uritools-upgrade-4.0.3-5.0.0.patch"

RnJvbSAyMDg5YWJlNTBmZmUzNTFhNWJjNTZjY2MxNTU2ZDc5ZmY4MjRjMzczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMDowODo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJpdG9vbHM6IHVwZ3JhZGUgNC4wLjMgLT4gNS4wLjAKCi0tLQogLi4ub2xzXzQuMC4z
LmJiID0+IHB5dGhvbjMtdXJpdG9vbHNfNS4wLjAuYmJ9IHwgMjUgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cml0b29sc180LjAuMy5i
YiA9PiBweXRob24zLXVyaXRvb2xzXzUuMC4wLmJifSAoMjAlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc180LjAuMy5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cml0b29sc181LjAuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDIwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJpdG9vbHNfNC4wLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy11cml0b29sc181LjAuMC5iYgppbmRleCA0MjEwNDA3ZTAwLi42NDE3ODg2
Y2QxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJp
dG9vbHNfNC4wLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXVyaXRvb2xzXzUuMC4wLmJiCkBAIC0xLDEwICsxLDMxIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJ
TEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScu
CisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0
aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBp
ZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNz
YWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRh
dGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAt
LS0gTElDRU5TRQorIyArKysgTElDRU5TRQorIyBAQCAtMSw2ICsxLDYgQEAKKyMgIFRoZSBNSVQg
TGljZW5zZSAoTUlUKQorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMTQtMjAyNCBUaG9tYXMgS2Vt
bWVyCisjICtDb3B5cmlnaHQgKGMpIDIwMTQtMjAyNSBUaG9tYXMgS2VtbWVyCisjICAKKyMgIFBl
cm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29u
IG9idGFpbmluZyBhIGNvcHkgb2YKKyMgIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9j
dW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluCisjIAorIworCiBT
VU1NQVJZID0gIlVSSSBwYXJzaW5nLCBjbGFzc2lmaWNhdGlvbiBhbmQgY29tcG9zaXRpb24iCiBI
T01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vdGtlbS91cml0b29scy8iCiAKIExJQ0VOU0Ug
PSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NTM5Mjc1ZTY1
N2M2YjdhZjAyNmJiOTA4MzU2Zjc1NDEiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT1lMjFiYmU1M2IyNzMwYmZlMTkxMWNmMzgxYjgxODIxZSIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImVlMDZhMTgyYTljODQ5NDY0Y2U5ZDVmYTkxNzUzOWFhY2M4ZWRkMmE0OTI0ZDFi
N2FhYmVlZWNhYmNhZTNiYzIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjgxODBjYWQxNTQwNjJi
ZDViNWQ5ZmZjZGQ0NjRmOGRlNjkzNDQxNGIyNTQ2MmFlODA3YjAwYjhkZjkzNDVkZSIKIAogaW5o
ZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9uLXB5dGVz
dAogCi0tIAoyLjQ3LjEKCg==

--===============0860889991342627595==--

