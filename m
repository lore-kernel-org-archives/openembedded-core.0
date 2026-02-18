Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C8AE9A05D
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1390.1771440099760607578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WN5vigmL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QDiPpatV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720ed968-18664721-e3f0-46cf-ad90-20360651118b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fpaYpLMYGqeRPV/T2bj4LwkZdPGf1hdlsXzNKAOlTFs=;
	b=WN5vigmLH8kvwA2pJ053ZusHE4zlVu23dabBjDl7VbEkI101FpPmupMVilMS7D2H
	FPqiolrcBYPpBJv/oHyVa50HkUzq89HAM4eR+f7S16ZieexB1q8YMCqTxZveLb4yWEU
	FXlKbrODvW9fnJt3eZLx6WlWEs8UoFDpNc4NaNWQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440101;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fpaYpLMYGqeRPV/T2bj4LwkZdPGf1hdlsXzNKAOlTFs=;
	b=QDiPpatViahcmN3+oBpODR+40QNuQB/rUJdfxEJsunqI5Tj/gJx1g50UeRsW8S5U
	bFD2X6/BWMykDN0FeIWB9fiUzi3uUny/349l4fkbwYqsjsYNt+aEKOA67h+2GpGz7iw
	cyVnR5u+iHO19eIdw0V5CIKkWyiNXggAYY25VGls=
Content-Type: multipart/mixed; boundary="===============5055743008300074170=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.10.2 SUCCEEDED
Message-ID: <0101019c720ed968-18664721-e3f0-46cf-ad90-20360651118b-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231350

--===============5055743008300074170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-markdown* to *3.10.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.10.1-3.10.2.patch
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
From 55fccd682eb12477e140a73c993f5e6d9ee32f05 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 13:06:14 +0000
Subject: [PATCH] python3-markdown: upgrade 3.10.1 -> 3.10.2

---
 .../{python3-markdown_3.10.1.bb => python3-markdown_3.10.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.10.1.bb => python3-markdown_3.10.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.10.1.bb b/meta/recipes-devtools/python/python3-markdown_3.10.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.10.1.bb
rename to meta/recipes-devtools/python/python3-markdown_3.10.2.bb
index 91dac7abd1..6a35e0def8 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.10.1.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.10.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1c19c10bd5c14ac948c53d0d762a04e2fa35a6d58a6b7b1e6bfcbe6fefc0001a"
+SRC_URI[sha256sum] = "994d51325d25ad8aa7ce4ebaec003febcce822c3f8c911e3b17c52f7f589f950"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.1


--===============5055743008300074170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.1.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.10.1.dist-info moved to /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info

--===============5055743008300074170==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.10.1-3.10.2.patch"

RnJvbSA1NWZjY2Q2ODJlYjEyNDc3ZTE0MGE3M2M5OTNmNWU2ZDllZTMyZjA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTM6MDY6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmtkb3duOiB1cGdyYWRlIDMuMTAuMSAtPiAzLjEwLjIKCi0tLQogLi4uL3tweXRo
b24zLW1hcmtkb3duXzMuMTAuMS5iYiA9PiBweXRob24zLW1hcmtkb3duXzMuMTAuMi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXJrZG93bl8zLjEwLjEu
YmIgPT4gcHl0aG9uMy1tYXJrZG93bl8zLjEwLjIuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTAuMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjEwLjIuYmIKc2lt
aWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLW1hcmtkb3duXzMuMTAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW1hcmtkb3duXzMuMTAuMi5iYgppbmRleCA5MWRhYzdhYmQxLi42
YTM1ZTBkZWY4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbWFya2Rvd25fMy4xMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1tYXJrZG93bl8zLjEwLjIuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PWVjNThjZGY3Y2ZlZDA2YTIxZjdhOTM2MjYyN2E1
NDgwIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMWMxOWMxMGJkNWMxNGFjOTQ4YzUzZDBkNzYyYTA0ZTJmYTM1YTZk
NThhNmI3YjFlNmJmY2JlNmZlZmMwMDAxYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5OTRkNTEz
MjVkMjVhZDhhYTdjZTRlYmFlYzAwM2ZlYmNjZTgyMmMzZjhjOTExZTNiMTdjNTJmN2Y1ODlmOTUw
IgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuNDcuMQoK

--===============5055743008300074170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-markdown: PV changed from "3.10.1" to "3.10.2"
packages/x86-64-v3-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.10.1.tar.gz;downloadfilename=markdown-3.10.1.tar.gz" to "https://files.pythonhosted.org/packages/source/m/markdown/markdown-3.10.2.tar.gz;downloadfilename=markdown-3.10.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-markdown: PKGV changed from 3.10.1 [default] to 3.10.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.10.1" to "3.10.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.10.1 [default] to 3.10.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.10.1" to "3.10.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.10.1 [default] to 3.10.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.10.1" to "3.10.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.10.1 [default] to 3.10.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.10.1" to "3.10.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.10.1 [default] to 3.10.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.10.1" to "3.10.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.10.1 [default] to 3.10.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.10.1" to "3.10.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.10.1 [default] to 3.10.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: FILELIST: directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/markdown-3.10.1.dist-info -> /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PV changed from "3.10.1" to "3.10.2"
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.10.1 [default] to 3.10.2 [default]
packages/x86-64-v3-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 750446 to 754773 (+1%)
Changes to packages/x86-64-v3-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.14/site-packages/markdown-3.10.1.dist-info moved to /usr/lib/python3.14/site-packages/markdown-3.10.2.dist-info

--===============5055743008300074170==--

