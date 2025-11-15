Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A91FCED24D
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12114.1763224714400114300
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=svwcC8oO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gwqA+dC1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a88622100-f136252f-a95f-45af-9656-8ac801a1266e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=07uY/ImTNPp9fY8tFGEl64kYRGV23COjjQzaXcGKRZc=;
	b=svwcC8oOxbT8GlVTDORj1GXGlDSIWDbShG8uK7PyES+kxQ1LXsJ4oTkBnnVk9/kj
	OJ65nBGskJT6hFoECfkcSMa5L/7ud1xgYb/uxxjxr/HEnHj6rNlwLrmgbnJJ/6V7rRA
	dtmy4fTy5Tdb31/rOURtciLFACBzA2E7+5JANca8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=07uY/ImTNPp9fY8tFGEl64kYRGV23COjjQzaXcGKRZc=;
	b=gwqA+dC1of1NxS8LSURMIosrYbwcYNBbY/H2sGNisFvQh7+CgBWhFwrBxNAKEOdr
	+as7BaDkm1AQwUVm9xiLfNLHotWT57mRffDm87Xmx4CM9LOp3eiAHZ4GeJpYugSKQeQ
	iz64cFV8aEiNA1MmugnncZRePJiQzPJVmW9QoVwQ=
Content-Type: multipart/mixed; boundary="===============6068343762432938907=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.3.0 SUCCEEDED
Message-ID: <0101019a88622100-f136252f-a95f-45af-9656-8ac801a1266e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226350

--===============6068343762432938907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.2.2-8.3.0.patch
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
From 70dd3b9fbbc428fef8c577adba244dc31f2f9312 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 10:05:18 +0000
Subject: [PATCH] python3-click: upgrade 8.2.2 -> 8.3.0

---
 .../python/{python3-click_8.2.2.bb => python3-click_8.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.2.2.bb => python3-click_8.3.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.2.2.bb b/meta/recipes-devtools/python/python3-click_8.3.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.2.2.bb
rename to meta/recipes-devtools/python/python3-click_8.3.0.bb
index 9710e8a71c..4794c06e7b 100644
--- a/meta/recipes-devtools/python/python3-click_8.2.2.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "068616e6ef9705a07b6db727cb9c248f4eb9dae437a30239f56fa94b18b852ef"
+SRC_URI[sha256sum] = "e7b8232224eba16f4ebe410c25ced9f7875cb5f3263ffc93cc3e8da705e229c4"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============6068343762432938907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-click: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.2.2.tar.gz;downloadfilename=click-8.2.2.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.3.0.tar.gz;downloadfilename=click-8.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-click: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/prompts.rst /usr/lib/python3-click/ptest/docs/setuptools.rst /usr/lib/python3-click/ptest/docs/shell-completion.rst /usr/lib/python3-click/ptest/docs/quickstart.rst", added "/usr/lib/python3-click/ptest/docs/setuptools.md /usr/lib/python3-click/ptest/docs/prompts.md /usr/lib/python3-click/ptest/docs/shell-completion.md /usr/lib/python3-click/ptest/docs/quickstart.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 411734 to 462323 (+12%)
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGV changed from 8.2.2 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.13/site-packages/click-8.2.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/click-8.3.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/click-8.2.2.dist-info -> /usr/lib/python3.13/site-packages/click-8.3.0.dist-info, added "/usr/lib/python3.13/site-packages/click/__pycache__/_utils.cpython-313.pyc /usr/lib/python3.13/site-packages/click/_utils.py"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PV changed from "8.2.2" to "8.3.0"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGSIZE changed from 809363 to 825549 (+2%)
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.2.2.dist-info moved to /usr/lib/python3.13/site-packages/click-8.3.0.dist-info
  /usr/lib/python3.13/site-packages/click/__pycache__/_utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/click/_utils.py was added

--===============6068343762432938907==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.2.2-8.3.0.patch"

RnJvbSA3MGRkM2I5ZmJiYzQyOGZlZjhjNTc3YWRiYTI0NGRjMzFmMmY5MzEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTA6MDU6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNsaWNrOiB1cGdyYWRlIDguMi4yIC0+IDguMy4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtY2xpY2tfOC4yLjIuYmIgPT4gcHl0aG9uMy1jbGlja184LjMuMC5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2xpY2tfOC4yLjIuYmIgPT4gcHl0
aG9uMy1jbGlja184LjMuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4yLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMi4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tf
OC4zLjAuYmIKaW5kZXggOTcxMGU4YTcxYy4uNDc5NGMwNmU3YiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMi4yLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjMuMC5iYgpAQCAtOCw3ICs4
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL2NsaWNrLnBvY29vLm9yZy8iCiBMSUNFTlNFID0gIkJT
RC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0x
ZmE5ODIzMmZkNjQ1NjA4OTM3YTBmZGM4MmU5OTliOCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjA2ODYxNmU2ZWY5NzA1YTA3YjZkYjcyN2NiOWMyNDhmNGViOWRhZTQzN2EzMDIzOWY1NmZhOTRi
MThiODUyZWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTdiODIzMjIyNGViYTE2ZjRlYmU0MTBj
MjVjZWQ5Zjc4NzVjYjVmMzI2M2ZmYzkzY2MzZThkYTcwNWUyMjljNCIKIAogaW5oZXJpdCBweXBp
IHB5dGhvbl9mbGl0X2NvcmUgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============6068343762432938907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/quickstart.rst /usr/lib/python3-click/ptest/docs/shell-completion.rst /usr/lib/python3-click/ptest/docs/setuptools.rst /usr/lib/python3-click/ptest/docs/prompts.rst", added "/usr/lib/python3-click/ptest/docs/shell-completion.md /usr/lib/python3-click/ptest/docs/quickstart.md /usr/lib/python3-click/ptest/docs/prompts.md /usr/lib/python3-click/ptest/docs/setuptools.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 411734 to 462323 (+12%)
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.13/site-packages/click-8.2.2.dist-info -> /usr/lib/python3.13/site-packages/click-8.3.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/click-8.2.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/click-8.3.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/click/_utils.py /usr/lib/python3.13/site-packages/click/__pycache__/_utils.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.13/site-packages/click-8.2.2.dist-info moved to /usr/lib/python3.13/site-packages/click-8.3.0.dist-info
  /usr/lib/python3.13/site-packages/click/__pycache__/_utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/click/_utils.py was added

--===============6068343762432938907==--

