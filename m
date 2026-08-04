Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DC5C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 06:24:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10865.1785824635534608988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 23:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fhhhEgc+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xyCUC+XL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019fcb716676-4a3f1153-a2e9-4441-ab16-0d7e65cfb844-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785824634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zazms5r1rOeOaQvRhLOBDBoMo9GH8bXaaWqVAXiwRYE=;
	b=fhhhEgc+GoIM+BjD8a0I2v5oUDnnG4Yg1qtpXk+OKfOzUUyTJBHWcr8QalhIff8m
	VunkrLp6S9z6iZKDXEB1ai5LUwgognq3GSuPwgFbyM6s+kWyHj43GdWfPVu5U4g06ie
	gYmSycsMwP3nC06gtNnX0O3eIz6nYLd1YoVXLxNA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785824634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zazms5r1rOeOaQvRhLOBDBoMo9GH8bXaaWqVAXiwRYE=;
	b=xyCUC+XL2qDCUlhTCKeXrMIKa/fOz5XEmrQE+J8eQTtFXutNAOCeZFXfTK9elqyA
	GywXQvdRVRnMiK9Yw2xUbnkH9nKlpXSGQsgBHBm6JdsiSYm533OMSAyLE+FQS/UTRBX
	LeyBV4V5sqjgzCmgf6W1pCZIKac1XBmV94DZyGhk=
Content-Type: multipart/mixed; boundary="===============0856112828310107633=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cffi: upgrading to 2.1.1 SUCCEEDED
Message-ID: <0101019fcb716676-4a3f1153-a2e9-4441-ab16-0d7e65cfb844-000000@us-west-2.amazonses.com>
Date: Tue, 4 Aug 2026 06:23:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.04-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 06:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242702

--===============0856112828310107633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cffi* to *2.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cffi-upgrade-2.1.0-2.1.1.patch
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
From d848898d0e7fface14e84037942cf27eefa15257 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 4 Aug 2026 05:58:24 +0000
Subject: [PATCH] python3-cffi: upgrade 2.1.0 -> 2.1.1

---
 .../python/{python3-cffi_2.1.0.bb => python3-cffi_2.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_2.1.0.bb => python3-cffi_2.1.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cffi_2.1.0.bb b/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cffi_2.1.0.bb
rename to meta/recipes-devtools/python/python3-cffi_2.1.1.bb
index 718e43e339..455732a269 100644
--- a/meta/recipes-devtools/python/python3-cffi_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT-0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c0158ab9b75875f3bb7fea081d388818"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "efc1cdd798b1aaf39b4610bba7aad28c9bea9b910f25c784ccf9ec1fa719d1f9"
+SRC_URI[sha256sum] = "dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.1


--===============0856112828310107633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info -> /usr/lib/python3.14/site-packages/cffi-2.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/cffi-2.1.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info moved to /usr/lib/python3.14/site-packages/cffi-2.1.1.dist-info

--===============0856112828310107633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-cffi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cffi/cffi-2.1.0.tar.gz;downloadfilename=cffi-2.1.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/c/cffi/cffi-2.1.1.tar.gz;downloadfilename=cffi-2.1.1.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-cffi: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/python3-cffi: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dbg: PKGSIZE changed from 656704 to 656888 (+0%)
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dbg: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dbg: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dev: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-dev: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-doc: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-doc: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-locale: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-locale: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-ptest: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-ptest: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: PKGSIZE changed from 485835 to 484721 (-0%)
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: FILELIST: directory renamed /usr/src/debug/python3-cffi/2.1.0/src/c -> /usr/src/debug/python3-cffi/2.1.1/src/c, directory renamed /usr/src/debug/python3-cffi/2.1.0/src/cffi -> /usr/src/debug/python3-cffi/2.1.1/src/cffi
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-src: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-staticdev: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi-staticdev: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: FILELIST: directory renamed /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info -> /usr/lib/python3.14/site-packages/cffi-2.1.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/cffi-2.1.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-cffi/python3-cffi: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.14/site-packages/cffi-2.1.0.dist-info moved to /usr/lib/python3.14/site-packages/cffi-2.1.1.dist-info

--===============0856112828310107633==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cffi-upgrade-2.1.0-2.1.1.patch"

RnJvbSBkODQ4ODk4ZDBlN2ZmYWNlMTRlODQwMzc5NDJjZjI3ZWVmYTE1MjU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNCBBdWcgMjAyNiAwNTo1ODoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2ZmaTogdXBncmFkZSAyLjEuMCAtPiAyLjEuMQoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLWNmZmlfMi4xLjAuYmIgPT4gcHl0aG9uMy1jZmZpXzIuMS4xLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNmZmlfMi4xLjAuYmIgPT4gcHl0aG9u
My1jZmZpXzIuMS4xLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jZmZpXzIuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNmZmlfMi4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmlfMi4xLjAuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzIuMS4xLmJi
CmluZGV4IDcxOGU0M2UzMzkuLjQ1NTczMmEyNjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzIuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzIuMS4xLmJiCkBAIC00LDcgKzQsNyBAQCBMSUNF
TlNFID0gIk1JVC0wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzAx
NThhYjliNzU4NzVmM2JiN2ZlYTA4MWQzODg4MTgiCiBERVBFTkRTICs9ICJsaWJmZmkgcHl0aG9u
My1weWNwYXJzZXIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlZmMxY2RkNzk4YjFhYWYzOWI0
NjEwYmJhN2FhZDI4YzliZWE5YjkxMGYyNWM3ODRjY2Y5ZWMxZmE3MTlkMWY5IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImRkMzFmNTJlYTEwODY1MTNiYjlkZjMwZjhmY2VlOWI4OTE4MzIzYWUwNjdh
M2Q1Yjc4YmM4MjZhMDAwNzEyYmUiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QiCiAK
LS0gCjIuNDcuMQoK

--===============0856112828310107633==--

