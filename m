Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66ECC369B1
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:23 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.18056.1743511397743106468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OhjwWLkH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IUbNjBif;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010195f160a36e-75381c59-8e95-4f7b-a6c9-e45eec7660d4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lDWRQ9NrCHmsxhSkveJAXYiFDsXDt5ezAHla1C0rgso=;
	b=OhjwWLkH2KB5crHk2UMBILTyGEr9Y8B5GSKu32Xq5J/4AYceBKX13sgPDAF7z56/
	TxHjLXG2F2K3RD44jKR64LbyYiuQIH6zXwvW3Xp1sg9VNod7oSZW9D2/2VBOEx1xcQb
	LIr473F1SI9uhgnFlropOkjzl/8jKz7GX1ooNwBA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lDWRQ9NrCHmsxhSkveJAXYiFDsXDt5ezAHla1C0rgso=;
	b=IUbNjBifE8NJvzZGbju48MtJsM7HU8GwzCpmAEF5fgfW9PiPXy6A4XOkjRVPAucC
	my7tXlN/7Qb4uscwpMchKSHig+VJjwe04tSpnzLIf5H5EZCWk34j2PQEfVyVJ5IRVF5
	01bThfCoda5a3kpeu0CqFBHJ0lMwnbG/YkpPQZUo=
Content-Type: multipart/mixed; boundary="===============4059277147052457316=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyparsing: upgrading to 3.2.3 SUCCEEDED
Message-ID: <01010195f160a36e-75381c59-8e95-4f7b-a6c9-e45eec7660d4-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214064

--===============4059277147052457316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyparsing* to *3.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyparsing-upgrade-3.2.1-3.2.3.patch
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
From 21fb274635bd8d735e7534b4ee5a4b4da8fc0a64 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 09:11:21 +0000
Subject: [PATCH] python3-pyparsing: upgrade 3.2.1 -> 3.2.3

---
 .../{python3-pyparsing_3.2.1.bb => python3-pyparsing_3.2.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.2.1.bb => python3-pyparsing_3.2.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb
index ab4eba129a..459b01fd94 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "61980854fd66de3a90028d679a954d5f2623e83144b5afe5ee86f43d762e5f0a"
+SRC_URI[sha256sum] = "b9c13f1ab8b3b542f72e28f634bad4de758ab3ce4546e4301970ad6fa77c38be"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============4059277147052457316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pyparsing-3.2.3.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.1.dist-info -> /usr/lib/python3.13/site-packages/pyparsing-3.2.3.dist-info, added "/usr/lib/python3.13/site-packages/pyparsing/tools/__init__.py /usr/lib/python3.13/site-packages/pyparsing/tools/cvt_pyparsing_pep8_names.py /usr/lib/python3.13/site-packages/pyparsing/tools/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pyparsing/tools/__pycache__/cvt_pyparsing_pep8_names.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.13/site-packages/pyparsing-3.2.1.dist-info moved to /usr/lib/python3.13/site-packages/pyparsing-3.2.3.dist-info
  /usr/lib/python3.13/site-packages/pyparsing/tools was added
  /usr/lib/python3.13/site-packages/pyparsing/tools/cvt_pyparsing_pep8_names.py was added
  /usr/lib/python3.13/site-packages/pyparsing/tools/__init__.py was added
  /usr/lib/python3.13/site-packages/pyparsing/tools/__pycache__ was added
  /usr/lib/python3.13/site-packages/pyparsing/tools/__pycache__/cvt_pyparsing_pep8_names.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pyparsing/tools/__pycache__/__init__.cpython-313.pyc was added

--===============4059277147052457316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyparsing: PV changed from "3.2.1" to "3.2.3"
packages/core2-64-poky-linux/python3-pyparsing: PKGV changed from 3.2.1 [default] to 3.2.3 [default]
packages/core2-64-poky-linux/python3-pyparsing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.2.1.tar.gz;downloadfilename=pyparsing-3.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.2.3.tar.gz;downloadfilename=pyparsing-3.2.3.tar.gz"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PV changed from "3.2.1" to "3.2.3"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PKGV changed from 3.2.1 [default] to 3.2.3 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dev: PV changed from "3.2.1" to "3.2.3"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-dev: PKGV changed from 3.2.1 [default] to 3.2.3 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-doc: PV changed from "3.2.1" to "3.2.3"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-doc: PKGV changed from 3.2.1 [default] to 3.2.3 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-locale: PV changed from "3.2.1" to "3.2.3"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-locale: PKGV changed from 3.2.1 [default] to 3.2.3 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-src: PV changed from "3.2.1" to "3.2.3"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-src: PKGV changed from 3.2.1 [default] to 3.2.3 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PV changed from "3.2.1" to "3.2.3"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PKGV changed from 3.2.1 [default] to 3.2.3 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PV changed from "3.2.1" to "3.2.3"
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PKGV changed from 3.2.1 [default] to 3.2.3 [default]
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: PKGSIZE changed from 879886 to 903032 (+3%)
packages/core2-64-poky-linux/python3-pyparsing/python3-pyparsing: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.1.dist-info -> /usr/lib/python3.13/site-packages/pyparsing-3.2.3.dist-info, directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pyparsing-3.2.3.dist-info/licenses, added "/usr/lib/python3.13/site-packages/pyparsing/tools/__pycache__/cvt_pyparsing_pep8_names.cpython-313.pyc /usr/lib/python3.13/site-packages/pyparsing/tools/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pyparsing/tools/cvt_pyparsing_pep8_names.py /usr/lib/python3.13/site-packages/pyparsing/tools/__init__.py"
Changes to packages/core2-64-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.13/site-packages/pyparsing-3.2.1.dist-info moved to /usr/lib/python3.13/site-packages/pyparsing-3.2.3.dist-info
  /usr/lib/python3.13/site-packages/pyparsing/tools was added
  /usr/lib/python3.13/site-packages/pyparsing/tools/cvt_pyparsing_pep8_names.py was added
  /usr/lib/python3.13/site-packages/pyparsing/tools/__init__.py was added
  /usr/lib/python3.13/site-packages/pyparsing/tools/__pycache__ was added
  /usr/lib/python3.13/site-packages/pyparsing/tools/__pycache__/cvt_pyparsing_pep8_names.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pyparsing/tools/__pycache__/__init__.cpython-313.pyc was added

--===============4059277147052457316==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyparsing-upgrade-3.2.1-3.2.3.patch"

RnJvbSAyMWZiMjc0NjM1YmQ4ZDczNWU3NTM0YjRlZTVhNGI0ZGE4ZmMwYTY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAwOToxMToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlwYXJzaW5nOiB1cGdyYWRlIDMuMi4xIC0+IDMuMi4zCgotLS0KIC4uLi97cHl0aG9u
My1weXBhcnNpbmdfMy4yLjEuYmIgPT4gcHl0aG9uMy1weXBhcnNpbmdfMy4yLjMuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlwYXJzaW5nXzMuMi4xLmJi
ID0+IHB5dGhvbjMtcHlwYXJzaW5nXzMuMi4zLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXBhcnNpbmdfMy4yLjEuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMi4zLmJiCnNpbWls
YXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weXBhcnNpbmdfMy4yLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1weXBhcnNpbmdfMy4yLjMuYmIKaW5kZXggYWI0ZWJhMTI5YS4uNDU5
YjAxZmQ5NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXB5cGFyc2luZ18zLjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHlwYXJzaW5nXzMuMi4zLmJiCkBAIC0xMCw3ICsxMCw3IEBAIEJVR1RSQUNLRVIgPSAi
aHR0cHM6Ly9naXRodWIuY29tL3B5cGFyc2luZy9weXBhcnNpbmcvaXNzdWVzIgogTElDRU5TRSA9
ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT02NTdhNTY2MjMz
ODg4NTEzZTFmMDdiYTEzZTJmNDdmMSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYxOTgwODU0
ZmQ2NmRlM2E5MDAyOGQ2NzlhOTU0ZDVmMjYyM2U4MzE0NGI1YWZlNWVlODZmNDNkNzYyZTVmMGEi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjljMTNmMWFiOGIzYjU0MmY3MmUyOGY2MzRiYWQ0ZGU3
NThhYjNjZTQ1NDZlNDMwMTk3MGFkNmZhNzdjMzhiZSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9m
bGl0X2NvcmUKIAotLSAKMi40Ny4xCgo=

--===============4059277147052457316==--

