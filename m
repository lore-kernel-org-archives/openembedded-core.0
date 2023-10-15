Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED59CC04E30
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.102704.1697399114456575208
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SIk2nL2+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aKezn4JY;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b34df0791-bc084004-fd7c-41dc-ad94-694545b51457-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CvSW+Yg+5jymJMDgx8eqXlTGuWmp0Bfbi1UxvQ95rtU=;
	b=SIk2nL2+//V45+7hMur+oIEcVMi81fC479ccPE0Ju9ZpNgnPdmuBg6vnnjTIE/XM
	dPgGyObj6h0F4WUjj61t5t8Z75Mr1cRAfpRN8vjQqRo6FXNWQNLT2q4COzPvc/86Lpr
	o8nvaCuR3YgJLZYJbV36uVsBnR2OFBBCUwqWl3SE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CvSW+Yg+5jymJMDgx8eqXlTGuWmp0Bfbi1UxvQ95rtU=;
	b=aKezn4JY/IFBsJ+zqeQd1oodgKOazgScx0X93iWrR5KE5doR/mopLk9npjYYjxEL
	m28KcdN7K/VmeO2aq2wJEP8dd5nliYrJSd9gMZwLbybTV/vUy5nexxiXoUgA56rmUtj
	UMxisj6r9C0NkYJ7b64xN6itBZFWmFtr9HderVDE=
Content-Type: multipart/mixed; boundary="===============5104117408974284963=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cffi: upgrading to 1.16.0 SUCCEEDED
Message-ID: <0101018b34df0791-bc084004-fd7c-41dc-ad94-694545b51457-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189181

--===============5104117408974284963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cffi* to *1.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cffi-upgrade-1.15.1-1.16.0.patch
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
From a6aff54d29a4937d387ef9bbfafb34ec84a92018 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 10:23:30 +0000
Subject: [PATCH] python3-cffi: upgrade 1.15.1 -> 1.16.0

---
 .../python/{python3-cffi_1.15.1.bb => python3-cffi_1.16.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_1.15.1.bb => python3-cffi_1.16.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.15.1.bb b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-cffi_1.15.1.bb
rename to meta/recipes-devtools/python/python3-cffi_1.16.0.bb
index daa290a54e..a351029ef2 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.15.1.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[sha256sum] = "d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9"
+SRC_URI[sha256sum] = "bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa5647806c25e02cc0"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============5104117408974284963==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cffi-upgrade-1.15.1-1.16.0.patch"

RnJvbSBhNmFmZjU0ZDI5YTQ5MzdkMzg3ZWY5YmJmYWZiMzRlYzg0YTkyMDE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTA6MjM6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNmZmk6IHVwZ3JhZGUgMS4xNS4xIC0+IDEuMTYuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWNmZmlfMS4xNS4xLmJiID0+IHB5dGhvbjMtY2ZmaV8xLjE2LjAuYmJ9ICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNmZmlfMS4xNS4xLmJiID0+IHB5
dGhvbjMtY2ZmaV8xLjE2LjAuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmlfMS4xNS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNmZmlfMS4xNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzEuMTUu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNmZmlf
MS4xNi4wLmJiCmluZGV4IGRhYTI5MGE1NGUuLmEzNTEwMjllZjIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZmZpXzEuMTUuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2ZmaV8xLjE2LjAuYmIKQEAgLTQsNyAr
NCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9NTY3N2UyZmRiZjdjZGRhNjFkNmRkMmI1N2RmNTQ3YmYiCiBERVBFTkRTICs9ICJsaWJm
ZmkgJHtQWVRIT05fUE59LXB5Y3BhcnNlciIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ0MDBi
ZmI5YTM3YjEzNTEyNTNjYjQwMjY3MWNlYTdlODliZGVjYzI5NGU4MDE2YTcwN2Y2ZDFkOGFjOTM0
ZjkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmNiM2VmNDNlNTg2NjViYmRhMmZiMTk4Njk4ZmNh
ZTY3NzY0ODNlMGM0YTYzMWFhNTY0NzgwNmMyNWUwMmNjMCIKIAogaW5oZXJpdCBweXBpIHNldHVw
dG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============5104117408974284963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cffi/python3-cffi: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cffi-1.15.1.dist-info -> /usr/lib/python3.11/site-packages/cffi-1.16.0.dist-info, added "/usr/lib/python3.11/site-packages/cffi/_imp_emulation.py /usr/lib/python3.11/site-packages/cffi/__pycache__/_imp_emulation.cpython-311.pyc /usr/lib/python3.11/site-packages/cffi/__pycache__/_shimmed_dist_utils.cpython-311.pyc /usr/lib/python3.11/site-packages/cffi/_shimmed_dist_utils.py"
Changes to packages/core2-32-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.11/site-packages/cffi-1.15.1.dist-info moved to /usr/lib/python3.11/site-packages/cffi-1.16.0.dist-info
  /usr/lib/python3.11/site-packages/cffi/_imp_emulation.py was added
  /usr/lib/python3.11/site-packages/cffi/__pycache__/_imp_emulation.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/cffi/__pycache__/_shimmed_dist_utils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/cffi/_shimmed_dist_utils.py was added

--===============5104117408974284963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cffi: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.15.1.tar.gz;downloadfilename=cffi-1.15.1.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cffi/cffi-1.16.0.tar.gz;downloadfilename=cffi-1.16.0.tar.gz"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dbg: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dbg: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dbg: PKGSIZE changed from 411068 to 411084 (+0%)
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dev: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-dev: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-doc: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-doc: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-locale: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-locale: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-src: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-src: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi-src: PKGSIZE changed from 484006 to 485651 (+0%)
packages/core2-32-poky-linux/python3-cffi/python3-cffi-staticdev: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi-staticdev: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi: PV changed from "1.15.1" to "1.16.0"
packages/core2-32-poky-linux/python3-cffi/python3-cffi: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cffi-1.15.1.dist-info -> /usr/lib/python3.11/site-packages/cffi-1.16.0.dist-info, added "/usr/lib/python3.11/site-packages/cffi/_imp_emulation.py /usr/lib/python3.11/site-packages/cffi/_shimmed_dist_utils.py /usr/lib/python3.11/site-packages/cffi/__pycache__/_imp_emulation.cpython-311.pyc /usr/lib/python3.11/site-packages/cffi/__pycache__/_shimmed_dist_utils.cpython-311.pyc"
packages/core2-32-poky-linux/python3-cffi/python3-cffi: PKGV changed from 1.15.1 [default] to 1.16.0 [default]
packages/core2-32-poky-linux/python3-cffi/python3-cffi: PKGSIZE changed from 1013690 to 1025789 (+1%)
Changes to packages/core2-32-poky-linux/python3-cffi (sysroot):
  /usr/lib/python3.11/site-packages/cffi-1.15.1.dist-info moved to /usr/lib/python3.11/site-packages/cffi-1.16.0.dist-info
  /usr/lib/python3.11/site-packages/cffi/_imp_emulation.py was added
  /usr/lib/python3.11/site-packages/cffi/__pycache__/_imp_emulation.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/cffi/__pycache__/_shimmed_dist_utils.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/cffi/_shimmed_dist_utils.py was added

--===============5104117408974284963==--

