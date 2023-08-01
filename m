Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F8FC00528
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:29:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.17704.1690907328533334860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZoiDRhmE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VDfbFVrV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189b1ee530f-d79f6e07-2e63-48c4-9f71-ea9905006ddf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m81PTm9YindKtJ/EtQnvpSfUWRYeJhEUnGPee/f4Mlc=;
	b=ZoiDRhmEzNLYx8voxO+U9PhQxqWNu2YMhdI6tznqHP+CR1nxx4MTf1lsu7MP729n
	guxbFYU5CO6AgKf0pcfOgWe/1tqtT5VsGb7HwUPpZYsc6HEeFtFFqgP2pGdLCRve5TL
	5bNhepe8DiQGMXWQetmjvmovbvU4hprDqfHMHP4Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m81PTm9YindKtJ/EtQnvpSfUWRYeJhEUnGPee/f4Mlc=;
	b=VDfbFVrVezHmKPrtrkJS+wuBMpqynfReLi1JwK5L8IwPByuTOH+/eCul2alozEiG
	F2hWscnA8clIWEXYJbOkSn/qLlro+lrkpS7svsW2Z4qSW/aTmNhLJTqIJ74lGzNgTit
	YtdwwDpJ5PUF0UrbRv70Btxyg51EvE50KsOf3iYA=
Content-Type: multipart/mixed; boundary="===============3854467871981537729=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xxhash: upgrading to 0.8.2 SUCCEEDED
Message-ID: <01010189b1ee530f-d79f6e07-2e63-48c4-9f71-ea9905006ddf-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185352

--===============3854467871981537729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xxhash* to *0.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xxhash-upgrade-0.8.1-0.8.2.patch
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
From 557b94c0a35b6db782da67bf12f9915bcd4724e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 16:28:46 +0000
Subject: [PATCH] xxhash: upgrade 0.8.1 -> 0.8.2

---
 .../{xxhash_0.8.1.bb => xxhash_0.8.2.bb}      | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)
 rename meta/recipes-support/xxhash/{xxhash_0.8.1.bb => xxhash_0.8.2.bb} (48%)

diff --git a/meta/recipes-support/xxhash/xxhash_0.8.1.bb b/meta/recipes-support/xxhash/xxhash_0.8.2.bb
similarity index 48%
rename from meta/recipes-support/xxhash/xxhash_0.8.1.bb
rename to meta/recipes-support/xxhash/xxhash_0.8.2.bb
index 222ba7b77c..02a24df7af 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.1.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.2.bb
@@ -1,16 +1,36 @@
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
+# @@ -1,5 +1,5 @@
+#  xxHash Library
+# -Copyright (c) 2012-2020 Yann Collet
+# +Copyright (c) 2012-2021 Yann Collet
+#  All rights reserved.
+#  
+#  BSD 2-Clause License (https://www.opensource.org/licenses/bsd-license.php)
+# 
+#
+
 SUMMARY = "Extremely fast non-cryptographic hash algorithm"
 DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
 working at speeds close to RAM limits."
 HOMEPAGE = "http://www.xxhash.com/"
 LICENSE = "BSD-2-Clause & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cdfe7764d5685d8e08b3df302885d7f3 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=13be6b481ff5616f77dda971191bb29b \
                     file://cli/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                   "
+                    "
 
 SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-SRCREV = "35b0373c697b5f160d3db26b1cbb45a0d5ba788c"
+SRCREV = "bbb27a5efb85b92a0486cf361a8635715a53f6ba"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============3854467871981537729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xxhash: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/xxhash: PV changed from "0.8.1" to "0.8.2"
Changes to packages/core2-32-poky-linux/xxhash (sysroot):
  /usr/lib/libxxhash.so.0 changed symlink target from libxxhash.so.0.8.1 to libxxhash.so.0.8.2
  /usr/lib/libxxhash.so changed symlink target from libxxhash.so.0.8.1 to libxxhash.so.0.8.2
  /usr/lib/libxxhash.so.0.8.1 moved to /usr/lib/libxxhash.so.0.8.2
packages/core2-32-poky-linux/xxhash/xxhash-dbg: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/xxhash/xxhash-dbg: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/xxhash/xxhash-dbg: FILELIST: removed "/usr/lib/.debug/libxxhash.so.0.8.1", added "/usr/lib/.debug/libxxhash.so.0.8.2"
packages/core2-32-poky-linux/xxhash/xxhash-dbg: PKGSIZE changed from 785884 to 614764 (-22%)
packages/core2-32-poky-linux/xxhash/xxhash-dev: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/xxhash/xxhash-dev: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/xxhash/xxhash-dev: PKGSIZE changed from 212472 to 255922 (+20%)
packages/core2-32-poky-linux/xxhash/xxhash-doc: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/xxhash/xxhash-doc: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/xxhash/xxhash-doc: PKGSIZE changed from 4604 to 4854 (+5%)
packages/core2-32-poky-linux/xxhash/xxhash-locale: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/xxhash/xxhash-locale: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/xxhash/xxhash-src: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/xxhash/xxhash-src: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/xxhash/xxhash-src: PKGSIZE changed from 324796 to 376585 (+16%)
packages/core2-32-poky-linux/xxhash/xxhash-staticdev: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/xxhash/xxhash-staticdev: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/xxhash/xxhash-staticdev: PKGSIZE changed from 329822 to 247154 (-25%)
packages/core2-32-poky-linux/xxhash/xxhash: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/xxhash/xxhash: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/xxhash/xxhash: FILELIST: removed "/usr/lib/libxxhash.so.0.8.1", added "/usr/lib/libxxhash.so.0.8.2"
packages/core2-32-poky-linux/xxhash/xxhash: PKGSIZE changed from 162612 to 158516 (-3%)

--===============3854467871981537729==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xxhash-upgrade-0.8.1-0.8.2.patch"

RnJvbSA1NTdiOTRjMGEzNWI2ZGI3ODJkYTY3YmYxMmY5OTE1YmNkNDcyNGU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAxNjoyODo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh4
aGFzaDogdXBncmFkZSAwLjguMSAtPiAwLjguMgoKLS0tCiAuLi4ve3h4aGFzaF8wLjguMS5iYiA9
PiB4eGhhc2hfMC44LjIuYmJ9ICAgICAgfCAyNiArKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC94eGhhc2gve3h4aGFzaF8wLjguMS5iYiA9PiB4eGhhc2hfMC44LjIuYmJ9
ICg0OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQveHhoYXNoL3h4aGFzaF8w
LjguMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3h4aGFzaC94eGhhc2hfMC44LjIuYmIKc2lt
aWxhcml0eSBpbmRleCA0OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQveHhoYXNo
L3h4aGFzaF8wLjguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQveHhoYXNoL3h4
aGFzaF8wLjguMi5iYgppbmRleCAyMjJiYTdiNzdjLi4wMmEyNGRmN2FmIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC94eGhhc2gveHhoYXNoXzAuOC4xLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L3h4aGFzaC94eGhhc2hfMC44LjIuYmIKQEAgLTEsMTYgKzEsMzYgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDUgKzEs
NSBAQAorIyAgeHhIYXNoIExpYnJhcnkKKyMgLUNvcHlyaWdodCAoYykgMjAxMi0yMDIwIFlhbm4g
Q29sbGV0CisjICtDb3B5cmlnaHQgKGMpIDIwMTItMjAyMSBZYW5uIENvbGxldAorIyAgQWxsIHJp
Z2h0cyByZXNlcnZlZC4KKyMgIAorIyAgQlNEIDItQ2xhdXNlIExpY2Vuc2UgKGh0dHBzOi8vd3d3
Lm9wZW5zb3VyY2Uub3JnL2xpY2Vuc2VzL2JzZC1saWNlbnNlLnBocCkKKyMgCisjCisKIFNVTU1B
UlkgPSAiRXh0cmVtZWx5IGZhc3Qgbm9uLWNyeXB0b2dyYXBoaWMgaGFzaCBhbGdvcml0aG0iCiBE
RVNDUklQVElPTiA9ICJ4eEhhc2ggaXMgYW4gZXh0cmVtZWx5IGZhc3Qgbm9uLWNyeXB0b2dyYXBo
aWMgaGFzaCBhbGdvcml0aG0sIFwKIHdvcmtpbmcgYXQgc3BlZWRzIGNsb3NlIHRvIFJBTSBsaW1p
dHMuIgogSE9NRVBBR0UgPSAiaHR0cDovL3d3dy54eGhhc2guY29tLyIKIExJQ0VOU0UgPSAiQlNE
LTItQ2xhdXNlICYgR1BMLTIuMC1vbmx5IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9Y2RmZTc3NjRkNTY4NWQ4ZTA4YjNkZjMwMjg4NWQ3ZjMgXAorTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTNiZTZiNDgxZmY1NjE2Zjc3ZGRhOTcxMTkxYmIy
OWIgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY2xpL0NPUFlJTkc7bWQ1PWIyMzRlZTRk
NjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwKLSAgICAgICAgICAgICAgICAgICAiCisgICAgICAg
ICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0N5YW40OTczL3h4
SGFzaC5naXQ7YnJhbmNoPXJlbGVhc2U7cHJvdG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19H
SVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi1TUkNSRVYgPSAiMzViMDM3
M2M2OTdiNWYxNjBkM2RiMjZiMWNiYjQ1YTBkNWJhNzg4YyIKK1NSQ1JFViA9ICJiYmIyN2E1ZWZi
ODViOTJhMDQ4NmNmMzYxYTg2MzU3MTVhNTNmNmJhIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0Igog
Ci0tIAoyLjM5LjIKCg==

--===============3854467871981537729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/xxhash (sysroot):
  /usr/lib/libxxhash.so.0 changed symlink target from libxxhash.so.0.8.1 to libxxhash.so.0.8.2
  /usr/lib/libxxhash.so changed symlink target from libxxhash.so.0.8.1 to libxxhash.so.0.8.2
  /usr/lib/libxxhash.so.0.8.1 moved to /usr/lib/libxxhash.so.0.8.2
packages/core2-32-poky-linux/xxhash/xxhash-dbg: PKGSIZE changed from 785884 to 614764 (-22%)
packages/core2-32-poky-linux/xxhash/xxhash-dev: PKGSIZE changed from 212472 to 255922 (+20%)
packages/core2-32-poky-linux/xxhash/xxhash-src: PKGSIZE changed from 324796 to 376585 (+16%)
packages/core2-32-poky-linux/xxhash/xxhash-staticdev: PKGSIZE changed from 329822 to 247154 (-25%)
packages/core2-32-poky-linux/xxhash/xxhash: FILELIST: removed "/usr/lib/libxxhash.so.0.8.1", added "/usr/lib/libxxhash.so.0.8.2"

--===============3854467871981537729==--

