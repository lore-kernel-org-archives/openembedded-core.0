Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33970D62049
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:32 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.4835.1731964643802447174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bwiJKgyL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZRutEDh1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019341232787-0077cd81-3e74-405d-9ad2-5312d3625e2b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964643;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a/mtWOBZE/mjD4GLLKkINgVPw0WG2JrK1o/khKU93Xk=;
	b=bwiJKgyLg4oIxYqGOKzT9dsk4QTQpX3U7zGvxPAZE9glbU1MjMO3fpRifvER7cu9
	LmsEq0r2PEJaYZZ2PqcSm8bYanX/Un6ZHlcKMUcRtWObZxtnQL1kghC7C5nXfGvD6yl
	QcclRiAZPDOeCuKZh+PlG20243NVFZ+sX3lmiVyU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964643;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a/mtWOBZE/mjD4GLLKkINgVPw0WG2JrK1o/khKU93Xk=;
	b=ZRutEDh1952JcLYY/CVBpYmQ/Lkr6X9RtlQzA2zLGsIVA7tYZ4Unmor5uxYZnlan
	v6S9+41eCkbydz1TzoaVmO9paQAYol73y/yJdJMrHP/3mFi2DeDmNAh35hYi7/LPNvm
	oqGBlbJhmKbDzwXUg0vMP5vIBMIDGWtegrX9kYsE=
Content-Type: multipart/mixed; boundary="===============4521183880484730219=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-xmltodict: upgrading to 0.14.2 SUCCEEDED
Message-ID: <0101019341232787-0077cd81-3e74-405d-9ad2-5312d3625e2b-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207299

--===============4521183880484730219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-xmltodict* to *0.14.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-xmltodict-upgrade-0.13.0-0.14.2.patch
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
From d23d4ec605e8db63aa5c76beaabee0afc02c37a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 04:10:24 +0000
Subject: [PATCH] python3-xmltodict: upgrade 0.13.0 -> 0.14.2

---
 ...{python3-xmltodict_0.13.0.bb => python3-xmltodict_0.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_0.13.0.bb => python3-xmltodict_0.14.2.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
rename to meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
index e8e275647c..e99fa3826e 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_0.14.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d037e56"
+SRC_URI[sha256sum] = "201e7c28bb210e374999d1dde6382923ab0ed1a8a5faeece48ab525b7810a553"
 
 PYPI_PACKAGE = "xmltodict"
 
-- 
2.44.1


--===============4521183880484730219==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-xmltodict-upgrade-0.13.0-0.14.2.patch"

RnJvbSBkMjNkNGVjNjA1ZThkYjYzYWE1Yzc2YmVhYWJlZTBhZmMwMmMzN2EyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDQ6MTA6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXhtbHRvZGljdDogdXBncmFkZSAwLjEzLjAgLT4gMC4xNC4yCgotLS0KIC4uLntweXRo
b24zLXhtbHRvZGljdF8wLjEzLjAuYmIgPT4gcHl0aG9uMy14bWx0b2RpY3RfMC4xNC4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMteG1sdG9kaWN0XzAuMTMu
MC5iYiA9PiBweXRob24zLXhtbHRvZGljdF8wLjE0LjIuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8wLjEzLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteG1sdG9kaWN0XzAuMTQuMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMteG1sdG9kaWN0XzAuMTMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8wLjE0LjIuYmIKaW5kZXggZThlMjc1
NjQ3Yy4uZTk5ZmEzODI2ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXhtbHRvZGljdF8wLjEzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8wLjE0LjIuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQ
QUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9tYXJ0aW5ibGVjaC94bWx0b2RpY3QiCiBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTAxNDQxZDUw
ZGM3NDQ3NmRiNThhNDFhYzEwY2I5ZmEyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzQxNTk1
YTQ4OGUzZTAxYTg1YTlkODkxMWQ4OTEyZmQ5MjJlZGU1ZmVjYzRkY2U0MzdlYjRiNmM4ZDAzN2U1
NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMDFlN2MyOGJiMjEwZTM3NDk5OWQxZGRlNjM4Mjky
M2FiMGVkMWE4YTVmYWVlY2U0OGFiNTI1Yjc4MTBhNTUzIgogCiBQWVBJX1BBQ0tBR0UgPSAieG1s
dG9kaWN0IgogCi0tIAoyLjQ0LjEKCg==

--===============4521183880484730219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: FILELIST: added "/usr/lib/python3-xmltodict/ptest/tests/__init__.py /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_xmltodict.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/__init__.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_xmltodict.cpython-312.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_dicttoxml.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_dicttoxml.cpython-312.pyc"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGSIZE changed from 94219 to 168956 (+79%)
Changes to packages/core2-64-poky-linux/python3-xmltodict (sysroot):
  /usr/lib/python3.13/site-packages/xmltodict-0.13.0.dist-info moved to /usr/lib/python3.13/site-packages/xmltodict-0.14.2.dist-info

--===============4521183880484730219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-xmltodict: PKGV changed from 0.13.0 [default] to 0.14.2 [default]
packages/core2-64-poky-linux/python3-xmltodict: SRC_URI changed from "https://files.pythonhosted.org/packages/source/x/xmltodict/xmltodict-0.13.0.tar.gz;downloadfilename=xmltodict-0.13.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/x/xmltodict/xmltodict-0.14.2.tar.gz;downloadfilename=xmltodict-0.14.2.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-xmltodict: PV changed from "0.13.0" to "0.14.2"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-dbg: PKGV changed from 0.13.0 [default] to 0.14.2 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-dbg: PV changed from "0.13.0" to "0.14.2"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-dev: PKGV changed from 0.13.0 [default] to 0.14.2 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-dev: PV changed from "0.13.0" to "0.14.2"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-doc: PKGV changed from 0.13.0 [default] to 0.14.2 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-doc: PV changed from "0.13.0" to "0.14.2"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-locale: PKGV changed from 0.13.0 [default] to 0.14.2 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-locale: PV changed from "0.13.0" to "0.14.2"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGV changed from 0.13.0 [default] to 0.14.2 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: FILELIST: added "/usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_dicttoxml.cpython-312.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_dicttoxml.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_xmltodict.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/__init__.cpython-311.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/__init__.cpython-312.pyc /usr/lib/python3-xmltodict/ptest/tests/__pycache__/test_xmltodict.cpython-312.pyc /usr/lib/python3-xmltodict/ptest/tests/__init__.py"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PV changed from "0.13.0" to "0.14.2"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-ptest: PKGSIZE changed from 94219 to 168956 (+79%)
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-src: PKGV changed from 0.13.0 [default] to 0.14.2 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-src: PV changed from "0.13.0" to "0.14.2"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-staticdev: PKGV changed from 0.13.0 [default] to 0.14.2 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict-staticdev: PV changed from "0.13.0" to "0.14.2"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict: PKGV changed from 0.13.0 [default] to 0.14.2 [default]
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict: PV changed from "0.13.0" to "0.14.2"
packages/core2-64-poky-linux/python3-xmltodict/python3-xmltodict: PKGSIZE changed from 50249 to 49319 (-2%)
Changes to packages/core2-64-poky-linux/python3-xmltodict (sysroot):
  /usr/lib/python3.13/site-packages/xmltodict-0.13.0.dist-info moved to /usr/lib/python3.13/site-packages/xmltodict-0.14.2.dist-info

--===============4521183880484730219==--

