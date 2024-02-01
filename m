Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07124C54E5C
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.2160.1706810406469666672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LWUlN6oU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HC1K+HHi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018d65d3f382-7c0150dc-98c6-4cbe-9627-dfd7fc7ba465-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ERX7g5Q4lbIQbFgfmf4N/IgBGRU8Ol6V5Z48LqruI2s=;
	b=LWUlN6oUx+8uokkpqQmEMQoVAcfc29e3iTUQj9MXYvesyqc2uNH1cd2pEeP7KfBv
	E6kkYi3jQPVkDQKY+Uv8+7ElSihTMSYiLvSKukCscXKWTq10zCxnXwbCRefMYJgJfwC
	XOPMr7QFmVBS37JP3Q9nvPn6R6E4OuabqkJ5jvog=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ERX7g5Q4lbIQbFgfmf4N/IgBGRU8Ol6V5Z48LqruI2s=;
	b=HC1K+HHiLT96OJmGQQE4Q3nFLrGp/7WAHERpR/ddRtXr89fpmfIvMXrtLXyTTduu
	u0gPX2BWPU9NUlzr3GCY5klj39DNvGoL63YPV+gvZcSCezMZ0jruVi+ss2FaudMSfsp
	F41YUkJ+UizLqzvMiR2BYiK+AtRz+ZyTcc/6nH2I=
Content-Type: multipart/mixed; boundary="===============4785582225758726781=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2024.1.31 SUCCEEDED
Message-ID: <0101018d65d3f382-7c0150dc-98c6-4cbe-9627-dfd7fc7ba465-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194645

--===============4785582225758726781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2024.1.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2024.1.8-2024.1.31.patch
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
From 8ce308646e30ec5c06f174a0879f93cf53481a65 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 08:39:50 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2024.1.8 -> 2024.1.31

---
 ...fiers_2024.1.8.bb => python3-trove-classifiers_2024.1.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.1.8.bb => python3-trove-classifiers_2024.1.31.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb
index 9e7e61a37e..332ab3bf40 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.31.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "6e36caf430ff6485c4b57a4c6b364a13f6a898d16b9417c6c37467e59c14b05a"
+SRC_URI[sha256sum] = "bfdfe60bbf64985c524416afb637ecc79c558e0beb4b7f52b0039e01044b0229"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.42.0


--===============4785582225758726781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-pluggy-native (sysroot):
  /usr/lib/python3.12/site-packages/pluggy-1.4.0.dist-info moved to /usr/lib/python3.12/site-packages/pluggy-1.3.0.dist-info
  /usr/lib/python3.12/site-packages/pluggy/__pycache__/_warnings.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pluggy/_warnings.py was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was removed

--===============4785582225758726781==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2024.1.8-2024.1.31.patch"

RnJvbSA4Y2UzMDg2NDZlMzBlYzVjMDZmMTc0YTA4NzlmOTNjZjUzNDgxYTY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwODozOTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyNC4xLjggLT4gMjAyNC4xLjMxCgot
LS0KIC4uLmZpZXJzXzIwMjQuMS44LmJiID0+IHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAy
NC4xLjMxLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdHJv
dmUtY2xhc3NpZmllcnNfMjAyNC4xLjguYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDI0LjEuMzEuYmJ9ICg4NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuMS44LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuMS4zMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC4xLjguYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjEu
MzEuYmIKaW5kZXggOWU3ZTYxYTM3ZS4uMzMyYWIzYmY0MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuMS44LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lm
aWVyc18yMDI0LjEuMzEuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0
aHViLmNvbS9weXBhL3Ryb3ZlLWNsYXNzaWZpZXJzIgogTElDRU5TRSA9ICJBcGFjaGUtMi4wIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5
YmQ4OTg2OTY4ZjQzMjciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZTM2Y2FmNDMwZmY2NDg1
YzRiNTdhNGM2YjM2NGExM2Y2YTg5OGQxNmI5NDE3YzZjMzc0NjdlNTljMTRiMDVhIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImJmZGZlNjBiYmY2NDk4NWM1MjQ0MTZhZmI2MzdlY2M3OWM1NThlMGJl
YjRiN2Y1MmIwMDM5ZTAxMDQ0YjAyMjkiCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29s
c19idWlsZF9tZXRhIHB0ZXN0CiAKLS0gCjIuNDIuMAoK

--===============4785582225758726781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2024.1.8.tar.gz;downloadfilename=trove-classifiers-2024.1.8.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2024.1.31.tar.gz;downloadfilename=trove-classifiers-2024.1.31.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2024.1.8" to "2024.1.31"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2024.1.8 [default] to 2024.1.31 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 91544 to 91610 (+0%)
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-pluggy-native (sysroot):
  /usr/lib/python3.12/site-packages/pluggy-1.4.0.dist-info moved to /usr/lib/python3.12/site-packages/pluggy-1.3.0.dist-info
  /usr/lib/python3.12/site-packages/pluggy/__pycache__/_warnings.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/pluggy/_warnings.py was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.31.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.1.8.dist-info/WHEEL was removed

--===============4785582225758726781==--

