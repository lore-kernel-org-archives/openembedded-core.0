Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7801EC27C6E
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:10 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.13438.1713248039062028111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LnK1cPet;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YeAboYm7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018ee58a6e3a-6bd9b3c6-22fe-4240-975d-ce41471bc71d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/aP3zPHspY9ixbh5l8j63HzcrKtjJ3ic9LMZg/MwP1o=;
	b=LnK1cPetW9eQ1I2KhNKg8ro80Q0Q1JitoDE0J0zp1eNDaIC0CXOXxWHuC8PNqivm
	PPrDxHTSrLWpQXDoj8ZDSIHeno/KXF+9lD+m5DzoYNdWnULA97QJMYIhp1tFJEiOu85
	Bv1oaVGSfvMG6DureMc5wgwByqH0i8vJEXN2CLk8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/aP3zPHspY9ixbh5l8j63HzcrKtjJ3ic9LMZg/MwP1o=;
	b=YeAboYm70QvfCTuG1tt3GaCy6IB6/FVTMNGi9G9bLD/jkjkQYaRKfwyKLdihndVp
	0EMu9m19UT//qV9x2WkLb4sIB/vReX/Qjd1JBobp8ph/iBdfoUtp2fZM+RDm616Venp
	9GxvwMtJsD9NOhz+/zTmvFybekuhZV5fQm2DfQgI=
Content-Type: multipart/mixed; boundary="===============0801280296024562205=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 7.1.0 SUCCEEDED
Message-ID: <0101018ee58a6e3a-6bd9b3c6-22fe-4240-975d-ce41471bc71d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198289

--===============0801280296024562205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *7.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-7.0.1-7.1.0.patch
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
From 29f929dd02c73542ca02a398d991887e025b178d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:13:29 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 7.0.1 -> 7.1.0

---
 ...ib-metadata_7.0.1.bb => python3-importlib-metadata_7.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_7.0.1.bb => python3-importlib-metadata_7.1.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb
index 0d3f0a5001..fdb37cecef 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "f238736bb06590ae52ac1fab06a3a9ef1d8dce2b7a35b5ab329371d6c8f5d2cc"
+SRC_URI[sha256sum] = "b78938b926ee8d5f020fc4772d487045805a55ddbad2ecf21c6d60938dc7fcd2"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.42.0


--===============0801280296024562205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata: FILELIST: directory renamed /usr/lib/python3.12/site-packages/importlib_metadata-7.0.1.dist-info -> /usr/lib/python3.12/site-packages/importlib_metadata-7.1.0.dist-info, removed "/usr/lib/python3.12/site-packages/importlib_metadata/__pycache__/_py39compat.cpython-312.pyc /usr/lib/python3.12/site-packages/importlib_metadata/_py39compat.py", added "/usr/lib/python3.12/site-packages/importlib_metadata/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/importlib_metadata/compat/__pycache__/py39.cpython-312.pyc /usr/lib/python3.12/site-packages/importlib_metadata/compat/py39.py /usr/lib/python3.12/site-packages/importlib_metadata/compat/__init__.py"
Changes to packages/core2-64-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.12/site-packages/importlib_metadata-7.0.1.dist-info moved to /usr/lib/python3.12/site-packages/importlib_metadata-7.1.0.dist-info
  /usr/lib/python3.12/site-packages/importlib_metadata/compat was added
  /usr/lib/python3.12/site-packages/importlib_metadata/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/importlib_metadata/compat/py39.py was added
  /usr/lib/python3.12/site-packages/importlib_metadata/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/importlib_metadata/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/importlib_metadata/compat/__pycache__/py39.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/importlib_metadata/_py39compat.py was removed
  /usr/lib/python3.12/site-packages/importlib_metadata/__pycache__/_py39compat.cpython-312.pyc was removed

--===============0801280296024562205==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-7.0.1-7.1.0.patch"

RnJvbSAyOWY5MjlkZDAyYzczNTQyY2EwMmEzOThkOTkxODg3ZTAyNWIxNzhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6MTM6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWltcG9ydGxpYi1tZXRhZGF0YTogdXBncmFkZSA3LjAuMSAtPiA3LjEuMAoKLS0tCiAu
Li5pYi1tZXRhZGF0YV83LjAuMS5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV83LjEu
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWltcG9ydGxp
Yi1tZXRhZGF0YV83LjAuMS5iYiA9PiBweXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV83LjEuMC5i
Yn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtaW1wb3J0bGliLW1ldGFkYXRhXzcuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV83LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW1w
b3J0bGliLW1ldGFkYXRhXzcuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaW1wb3J0bGliLW1ldGFkYXRhXzcuMS4wLmJiCmluZGV4IDBkM2YwYTUw
MDEuLmZkYjM3Y2VjZWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1pbXBvcnRsaWItbWV0YWRhdGFfNy4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWltcG9ydGxpYi1tZXRhZGF0YV83LjEuMC5iYgpAQCAtOCw3
ICs4LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIFBZUElf
UEFDS0FHRSA9ICJpbXBvcnRsaWJfbWV0YWRhdGEiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICIv
aW1wb3J0bGliLW1ldGFkYXRhLyg/UDxwdmVyPihcZCtbXC5cLV9dKikrKS8iCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJmMjM4NzM2YmIwNjU5MGFlNTJhYzFmYWIwNmEzYTllZjFkOGRjZTJiN2Ez
NWI1YWIzMjkzNzFkNmM4ZjVkMmNjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI3ODkzOGI5MjZl
ZThkNWYwMjBmYzQ3NzJkNDg3MDQ1ODA1YTU1ZGRiYWQyZWNmMjFjNmQ2MDkzOGRjN2ZjZDIiCiAK
IFMgPSAiJHtXT1JLRElSfS9pbXBvcnRsaWJfbWV0YWRhdGEtJHtQVn0iCiAKLS0gCjIuNDIuMAoK

--===============0801280296024562205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-importlib-metadata: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-7.0.1.tar.gz;downloadfilename=importlib_metadata-7.0.1.tar.gz" to "https://files.pythonhosted.org/packages/source/i/importlib_metadata/importlib_metadata-7.1.0.tar.gz;downloadfilename=importlib_metadata-7.1.0.tar.gz"
packages/core2-64-poky-linux/python3-importlib-metadata: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata: PV changed from "7.0.1" to "7.1.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dbg: PV changed from "7.0.1" to "7.1.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-dev: PV changed from "7.0.1" to "7.1.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-doc: PV changed from "7.0.1" to "7.1.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-locale: PV changed from "7.0.1" to "7.1.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-src: PV changed from "7.0.1" to "7.1.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata-staticdev: PV changed from "7.0.1" to "7.1.0"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGSIZE changed from 139687 to 145178 (+4%)
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PKGV changed from 7.0.1 [default] to 7.1.0 [default]
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata: FILELIST: directory renamed /usr/lib/python3.12/site-packages/importlib_metadata-7.0.1.dist-info -> /usr/lib/python3.12/site-packages/importlib_metadata-7.1.0.dist-info, removed "/usr/lib/python3.12/site-packages/importlib_metadata/__pycache__/_py39compat.cpython-312.pyc /usr/lib/python3.12/site-packages/importlib_metadata/_py39compat.py", added "/usr/lib/python3.12/site-packages/importlib_metadata/compat/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/importlib_metadata/compat/py39.py /usr/lib/python3.12/site-packages/importlib_metadata/compat/__pycache__/py39.cpython-312.pyc /usr/lib/python3.12/site-packages/importlib_metadata/compat/__init__.py"
packages/core2-64-poky-linux/python3-importlib-metadata/python3-importlib-metadata: PV changed from "7.0.1" to "7.1.0"
Changes to packages/core2-64-poky-linux/python3-importlib-metadata (sysroot):
  /usr/lib/python3.12/site-packages/importlib_metadata-7.0.1.dist-info moved to /usr/lib/python3.12/site-packages/importlib_metadata-7.1.0.dist-info
  /usr/lib/python3.12/site-packages/importlib_metadata/compat was added
  /usr/lib/python3.12/site-packages/importlib_metadata/compat/__init__.py was added
  /usr/lib/python3.12/site-packages/importlib_metadata/compat/py39.py was added
  /usr/lib/python3.12/site-packages/importlib_metadata/compat/__pycache__ was added
  /usr/lib/python3.12/site-packages/importlib_metadata/compat/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/importlib_metadata/compat/__pycache__/py39.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/importlib_metadata/_py39compat.py was removed
  /usr/lib/python3.12/site-packages/importlib_metadata/__pycache__/_py39compat.cpython-312.pyc was removed

--===============0801280296024562205==--

