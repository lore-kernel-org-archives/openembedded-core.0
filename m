Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC247C5B545
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:07 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.131430.1723748334567722935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RnjCrQ6v;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VLPmXcDY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019157683986-19bde71e-cd6c-4f98-a68d-2a6a4c1fae54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eKCTreCIhaRz5Ekp/tLB5sz+RHMQ1J/NWFvJi4NBT3I=;
	b=RnjCrQ6vbJdZmXABMHOmaWsxz9lCV50H2yaeIBINUhTsUPYObV1D/xIDsmXJ2ld8
	qXvegRi39KSMFIqnWjyqVaVkuyBjz3lE/N5zgEjZH9WwHknafwKvHE5k6SC5ajXIreq
	HxChRS+iz886IUeh37YCThW2x9SSzUnGKvSJO9EI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eKCTreCIhaRz5Ekp/tLB5sz+RHMQ1J/NWFvJi4NBT3I=;
	b=VLPmXcDYHO7WPYcRQkiTVbZvyoEx5D1IdmkS9uUNjlIBsZTL57sKoif4C9lIxGZD
	tNWLGYLmGIatEKP7yvOF4OEsbSjhJGUt0i2cIllItUmK2K84TM5oM/WZbQuUVHYHIXN
	nFtqgWyG4dB6DjMgrjZwYMHejSZXHja7frtXoHGw=
Content-Type: multipart/mixed; boundary="===============2168037942778311425=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-babel: upgrading to 2.16.0 SUCCEEDED
Message-ID: <0101019157683986-19bde71e-cd6c-4f98-a68d-2a6a4c1fae54-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203378

--===============2168037942778311425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-babel* to *2.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-babel-upgrade-2.15.0-2.16.0.patch
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
From bcc19a9cf3be661d2875174103c1929af9ad9400 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 11:15:28 +0000
Subject: [PATCH] python3-babel: upgrade 2.15.0 -> 2.16.0

---
 .../python/{python3-babel_2.15.0.bb => python3-babel_2.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-babel_2.15.0.bb => python3-babel_2.16.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.15.0.bb b/meta/recipes-devtools/python/python3-babel_2.16.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-babel_2.15.0.bb
rename to meta/recipes-devtools/python/python3-babel_2.16.0.bb
index c8a0d23100..929d7e9983 100644
--- a/meta/recipes-devtools/python/python3-babel_2.15.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.16.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7ebed8cd9f4ff11f547e3afd024a28c"
 
-SRC_URI[sha256sum] = "8daf0e265d05768bc6c7a314cf1321e9a123afc328cc635c18622a2f30a04413"
+SRC_URI[sha256sum] = "d1f3554ca26605fe173f3de0c65f750f5a42f924499bf134de6423582298e316"
 
 inherit pypi setuptools3
 
-- 
2.44.0


--===============2168037942778311425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-babel/python3-babel: FILELIST: directory renamed /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info -> /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info, added "/usr/lib/python3.12/site-packages/babel/messages/__pycache__/_compat.cpython-312.pyc /usr/lib/python3.12/site-packages/babel/messages/_compat.py"
Changes to packages/core2-64-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/babel/messages/_compat.py was added
  /usr/lib/python3.12/site-packages/babel/messages/__pycache__/_compat.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/WHEEL was removed

--===============2168037942778311425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-babel: PV changed from "2.15.0" to "2.16.0"
packages/core2-64-poky-linux/python3-babel: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/babel/babel-2.15.0.tar.gz;downloadfilename=babel-2.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/babel/babel-2.16.0.tar.gz;downloadfilename=babel-2.16.0.tar.gz"
packages/core2-64-poky-linux/python3-babel: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-dbg: PV changed from "2.15.0" to "2.16.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-dbg: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-dev: PV changed from "2.15.0" to "2.16.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-dev: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-doc: PV changed from "2.15.0" to "2.16.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-doc: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-locale: PV changed from "2.15.0" to "2.16.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-locale: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-src: PV changed from "2.15.0" to "2.16.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-src: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel-staticdev: PV changed from "2.15.0" to "2.16.0"
packages/core2-64-poky-linux/python3-babel/python3-babel-staticdev: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel: PV changed from "2.15.0" to "2.16.0"
packages/core2-64-poky-linux/python3-babel/python3-babel: FILELIST: directory renamed /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info -> /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info, added "/usr/lib/python3.12/site-packages/babel/messages/__pycache__/_compat.cpython-312.pyc /usr/lib/python3.12/site-packages/babel/messages/_compat.py"
packages/core2-64-poky-linux/python3-babel/python3-babel: PKGV changed from 2.15.0 [default] to 2.16.0 [default]
packages/core2-64-poky-linux/python3-babel/python3-babel: PKGSIZE changed from 29543174 to 29422038 (-0%)
Changes to packages/core2-64-poky-linux/python3-babel (sysroot):
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/entry_points.txt was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/babel-2.16.0.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/babel/messages/_compat.py was added
  /usr/lib/python3.12/site-packages/babel/messages/__pycache__/_compat.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/Babel-2.15.0.dist-info/WHEEL was removed

--===============2168037942778311425==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-babel-upgrade-2.15.0-2.16.0.patch"

RnJvbSBiY2MxOWE5Y2YzYmU2NjFkMjg3NTE3NDEwM2MxOTI5YWY5YWQ5NDAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTE6MTU6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJhYmVsOiB1cGdyYWRlIDIuMTUuMCAtPiAyLjE2LjAKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1iYWJlbF8yLjE1LjAuYmIgPT4gcHl0aG9uMy1iYWJlbF8yLjE2LjAuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1iYWJlbF8yLjE1LjAuYmIgPT4g
cHl0aG9uMy1iYWJlbF8yLjE2LjAuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVsXzIuMTUuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1iYWJlbF8yLjE2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVs
XzIuMTUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWJhYmVsXzIuMTYuMC5iYgppbmRleCBjOGEwZDIzMTAwLi45MjlkN2U5OTgzIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmFiZWxfMi4xNS4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iYWJlbF8yLjE2LjAuYmIK
QEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHA6Ly9iYWJlbC5lZGdld2FsbC5vcmcvIgog
TElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFO21kNT1lN2ViZWQ4Y2Q5ZjRmZjExZjU0N2UzYWZkMDI0YTI4YyIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjhkYWYwZTI2NWQwNTc2OGJjNmM3YTMxNGNmMTMyMWU5YTEyM2FmYzMyOGNjNjM1
YzE4NjIyYTJmMzBhMDQ0MTMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDFmMzU1NGNhMjY2MDVm
ZTE3M2YzZGUwYzY1Zjc1MGY1YTQyZjkyNDQ5OWJmMTM0ZGU2NDIzNTgyMjk4ZTMxNiIKIAogaW5o
ZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuNDQuMAoK

--===============2168037942778311425==--

