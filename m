Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42175D2444B
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:54 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.53399.1728589004371890319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JhE/Z6LN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Lu6i9lBm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019277eefbc4-4c0b1349-dca9-40be-8207-9311c5a59d59-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728589003;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hvbW+ojkU6h2DLmdehpNbIGFk6+01vSk1yoHf1zv8kE=;
	b=JhE/Z6LNVtNXBE39nEYG+wo0Gsq8oM88/ZAJANNQV8fOkmNJecpgClnhTBqBCEKi
	W5EB/i01W6OKRObsJzPKBSC20w2+1InCbz0EyVTcXSng9aNEU9sEofV/lsaQBhuJfin
	UDkodRetOd6ud7n/1+T2xVM0fMqzi+PEX5CCzONE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728589003;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hvbW+ojkU6h2DLmdehpNbIGFk6+01vSk1yoHf1zv8kE=;
	b=Lu6i9lBmaQaZStvSTqo6L2sfySW24i44RYel897kC7kAlQpamOXeM3XtB1rCmsmr
	hi6w++kISoXN4HvOUNnV2Q4A5HDPdJMFDW5zY1VL/1V6fMJjDcI/dY36gdLTWqYai9S
	3sOvzjLyap66QxWBTx8JH0OYmKsCaIt+39IJrYv0=
Content-Type: multipart/mixed; boundary="===============7917291040701059880=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-xmltodict: upgrading to 0.14.1 SUCCEEDED
Message-ID: <0101019277eefbc4-4c0b1349-dca9-40be-8207-9311c5a59d59-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205636

--===============7917291040701059880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-xmltodict* to *0.14.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-xmltodict-upgrade-0.13.0-0.14.1.patch
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
From 0c206d920bd16aff904b615a04c40262c9246ddd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 02:34:33 +0000
Subject: [PATCH] python3-xmltodict: upgrade 0.13.0 -> 0.14.1

---
 ...{python3-xmltodict_0.13.0.bb => python3-xmltodict_0.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_0.13.0.bb => python3-xmltodict_0.14.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb b/meta/recipes-devtools/python/python3-xmltodict_0.14.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
rename to meta/recipes-devtools/python/python3-xmltodict_0.14.1.bb
index e8e275647c..2732715243 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.14.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d037e56"
+SRC_URI[sha256sum] = "338c8431e4fc554517651972d62f06958718f6262b04316917008e8fd677a6b0"
 
 PYPI_PACKAGE = "xmltodict"
 
-- 
2.44.1


--===============7917291040701059880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGSIZE changed from 94219 to 168964 (+79%)
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: FILELIST: added "/usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_xmltodict.cpython-312.pyc /usr/lib/python3-xmltodict/ptest/tests/__init__.py /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_xmltodict.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_dicttoxml.cpython-312.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_dicttoxml.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/__init__.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/__init__.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-xmltodict (sysroot):
  /usr/lib/python3.12/site-packages/xmltodict-0.13.0.dist-info moved to /usr/lib/python3.12/site-packages/xmltodict-0.14.1.dist-info

--===============7917291040701059880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-xmltodict: SRC_URI changed from "https://files.pythonhosted.org/packages/source/x/xmltodict/xmltodict-0.13.0.tar.gz;downloadfilename=xmltodict-0.13.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/x/xmltodict/xmltodict-0.14.1.tar.gz;downloadfilename=xmltodict-0.14.1.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-xmltodict: PKGV changed from 0.13.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/python3-xmltodict: PV changed from "0.13.0" to "0.14.1"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-dbg: PKGV changed from 0.13.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-dbg: PV changed from "0.13.0" to "0.14.1"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-dev: PKGV changed from 0.13.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-dev: PV changed from "0.13.0" to "0.14.1"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-doc: PKGV changed from 0.13.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-doc: PV changed from "0.13.0" to "0.14.1"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-locale: PKGV changed from 0.13.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-locale: PV changed from "0.13.0" to "0.14.1"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGSIZE changed from 94219 to 168964 (+79%)
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: FILELIST: added "/usr/lib/python3-xmltodict/ptest/tests/__init__.py /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_xmltodict.cpython-312.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_dicttoxml.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_dicttoxml.cpython-312.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/__init__.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_xmltodict.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/__init__.cpython-312.pyc"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGV changed from 0.13.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PV changed from "0.13.0" to "0.14.1"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-src: PKGV changed from 0.13.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-src: PV changed from "0.13.0" to "0.14.1"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-staticdev: PKGV changed from 0.13.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-staticdev: PV changed from "0.13.0" to "0.14.1"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict: PKGSIZE changed from 49938 to 49042 (-2%)
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict: PKGV changed from 0.13.0 [default] to 0.14.1 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict: PV changed from "0.13.0" to "0.14.1"
Changes to packages/core2-64-poky-linux/python3-xmltodict (sysroot):
  /usr/lib/python3.12/site-packages/xmltodict-0.13.0.dist-info moved to /usr/lib/python3.12/site-packages/xmltodict-0.14.1.dist-info

--===============7917291040701059880==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-xmltodict-upgrade-0.13.0-0.14.1.patch"

RnJvbSAwYzIwNmQ5MjBiZDE2YWZmOTA0YjYxNWEwNGM0MDI2MmM5MjQ2ZGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDI6MzQ6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXhtbHRvZGljdDogdXBncmFkZSAwLjEzLjAgLT4gMC4xNC4xCgotLS0KIC4uLntweXRo
b24zLXhtbHRvZGljdF8wLjEzLjAuYmIgPT4gcHl0aG9uMy14bWx0b2RpY3RfMC4xNC4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMteG1sdG9kaWN0XzAuMTMu
MC5iYiA9PiBweXRob24zLXhtbHRvZGljdF8wLjE0LjEuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8wLjEzLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteG1sdG9kaWN0XzAuMTQuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMteG1sdG9kaWN0XzAuMTMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8wLjE0LjEuYmIKaW5kZXggZThlMjc1
NjQ3Yy4uMjczMjcxNTI0MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXhtbHRvZGljdF8wLjEzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8wLjE0LjEuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQ
QUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9tYXJ0aW5ibGVjaC94bWx0b2RpY3QiCiBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTAxNDQxZDUw
ZGM3NDQ3NmRiNThhNDFhYzEwY2I5ZmEyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzQxNTk1
YTQ4OGUzZTAxYTg1YTlkODkxMWQ4OTEyZmQ5MjJlZGU1ZmVjYzRkY2U0MzdlYjRiNmM4ZDAzN2U1
NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMzhjODQzMWU0ZmM1NTQ1MTc2NTE5NzJkNjJmMDY5
NTg3MThmNjI2MmIwNDMxNjkxNzAwOGU4ZmQ2NzdhNmIwIgogCiBQWVBJX1BBQ0tBR0UgPSAieG1s
dG9kaWN0IgogCi0tIAoyLjQ0LjEKCg==

--===============7917291040701059880==--

