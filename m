Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8464BC54ED8
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:38 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.20334.1708018345349632608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZHJ+h+D+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZnYFoIPq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dadd3a211-a3061fb7-044c-41f7-822e-d94d800251d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rX18BiXAR03ZYD3IOpNlvfU18hvvRuK0lsHELVlK20w=;
	b=ZHJ+h+D+KoflQXSGOiPdRn1UT3uYXYVRdY16xuFvyMvA37ztEZWauEWrQ0HbHDVn
	BaYQ+kScjFQUXaUzXJowHv/1/vA72dQieo/nJTJZw0DsVl0SG5NSd5z6o7VOMMFmBag
	D0CNptmATr2JjufCfcTqME/0DND94vncNlb3A2ns=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rX18BiXAR03ZYD3IOpNlvfU18hvvRuK0lsHELVlK20w=;
	b=ZnYFoIPqScpcr1x17ihYBipjS1aaPDoHRsJPUqN7fpZNHD8WKj2McmbuQ0AOfmNp
	7beZZu6a82kL8Jp1JxXEZCpqHyiDUfcemppaFLzRDMDyehG1e75nLiyF2RfJY/aS0Yo
	zkyhnCuv5OBViK1iRIH3MzfPAWkMjSRPeeFpZYrQ=
Content-Type: multipart/mixed; boundary="===============7257720288222960336=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.17.2 SUCCEEDED
Message-ID: <0101018dadd3a211-a3061fb7-044c-41f7-822e-d94d800251d9-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195590

--===============7257720288222960336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-beartype* to *0.17.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.17.0-0.17.2.patch
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
From 8a0220f259915076dfeb3439437f7bb4e052e9a5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 07:56:05 +0000
Subject: [PATCH] python3-beartype: upgrade 0.17.0 -> 0.17.2

---
 .../{python3-beartype_0.17.0.bb => python3-beartype_0.17.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.17.0.bb => python3-beartype_0.17.2.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.17.0.bb b/meta/recipes-devtools/python/python3-beartype_0.17.2.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-beartype_0.17.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.17.2.bb
index 7b14a3794b..05fd74543b 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.17.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.17.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
 
-SRC_URI[sha256sum] = "3226fbba8c53b4e698acdb47dcaf3c0640151c4d405618c281e6631f4112947d"
+SRC_URI[sha256sum] = "e911e1ae7de4bccd15745f7643609d8732f64de5c2fb844e89cbbed1c5a8d495"
 
 inherit setuptools3 pypi
 
-- 
2.42.0


--===============7257720288222960336==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.17.0-0.17.2.patch"

RnJvbSA4YTAyMjBmMjU5OTE1MDc2ZGZlYjM0Mzk0MzdmN2JiNGUwNTJlOWE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDc6NTY6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJlYXJ0eXBlOiB1cGdyYWRlIDAuMTcuMCAtPiAwLjE3LjIKCi0tLQogLi4uL3tweXRo
b24zLWJlYXJ0eXBlXzAuMTcuMC5iYiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMTcuMi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1iZWFydHlwZV8wLjE3LjAu
YmIgPT4gcHl0aG9uMy1iZWFydHlwZV8wLjE3LjIuYmJ9ICg3NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTcuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iZWFydHlwZV8wLjE3LjIuYmIKc2lt
aWxhcml0eSBpbmRleCA3NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJlYXJ0eXBlXzAuMTcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTcuMi5iYgppbmRleCA3YjE0YTM3OTRiLi4w
NWZkNzQ1NDNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtYmVhcnR5cGVfMC4xNy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1iZWFydHlwZV8wLjE3LjIuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vYmVhcnR5cGUucmVhZHRoZWRvY3MuaW8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWU3MWY5NDI2MWMxYjM5ODk2Y2FjYWNmZWFm
NjA1NjBlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzIyNmZiYmE4YzUzYjRlNjk4YWNkYjQ3
ZGNhZjNjMDY0MDE1MWM0ZDQwNTYxOGMyODFlNjYzMWY0MTEyOTQ3ZCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJlOTExZTFhZTdkZTRiY2NkMTU3NDVmNzY0MzYwOWQ4NzMyZjY0ZGU1YzJmYjg0NGU4
OWNiYmVkMWM1YThkNDk1IgogCiBpbmhlcml0IHNldHVwdG9vbHMzIHB5cGkKIAotLSAKMi40Mi4w
Cgo=

--===============7257720288222960336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-beartype: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-64-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.17.0.tar.gz;downloadfilename=beartype-0.17.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.17.2.tar.gz;downloadfilename=beartype-0.17.2.tar.gz"
packages/core2-64-poky-linux/python3-beartype: PV changed from "0.17.0" to "0.17.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.17.0" to "0.17.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.17.0" to "0.17.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.17.0" to "0.17.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.17.0" to "0.17.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.17.0" to "0.17.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.17.0" to "0.17.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 4449116 to 4478721 (+1%)
packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.12/site-packages/beartype-0.17.0.dist-info -> /usr/lib/python3.12/site-packages/beartype-0.17.2.dist-info, removed "/usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdtype.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484ref.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdref.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/_codescope.py /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdref.py /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdtype.py /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/_codescope.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484ref.py", added "/usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/cod
 escope.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefabc.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdreftest.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefmeta.py /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdreftest.py /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefmake.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefmeta.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/code/codescope.py /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefabc.py /usr/lib/python3.12/site-packages/beartype/_check/checkcache.py /usr/lib/python3.12/site-packages/beartype/_check/__pycache__/checkcache.cpython-312.pyc /
 usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefmake.py /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/__init__.cpython-312.pyc"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.17.0 [default] to 0.17.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PV changed from "0.17.0" to "0.17.2"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.12/site-packages/beartype-0.17.0.dist-info moved to /usr/lib/python3.12/site-packages/beartype-0.17.2.dist-info
  /usr/lib/python3.12/site-packages/beartype/_check/checkcache.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/codescope.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codescope.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefabc.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefmake.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefmeta.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdreftest.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefabc.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefmake.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefmeta.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdreftest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/__pycache__/checkcache.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/_codescope.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/_codescope.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdref.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdtype.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdref.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdtype.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484ref.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484ref.py was removed

--===============7257720288222960336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.12/site-packages/beartype-0.17.0.dist-info -> /usr/lib/python3.12/site-packages/beartype-0.17.2.dist-info, removed "/usr/lib/python3.12/site-packages/beartype/_check/forward/fwdtype.py /usr/lib/python3.12/site-packages/beartype/_check/code/_codescope.py /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdref.py /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484ref.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484ref.py /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdtype.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/_codescope.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdref.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__
 init__.py /usr/lib/python3.12/site-packages/beartype/_check/checkcache.py /usr/lib/python3.12/site-packages/beartype/_check/__pycache__/checkcache.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefmeta.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefmake.py /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefmeta.py /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdreftest.py /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefmake.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefabc.py /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdreftest.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/codescope.py /usr/lib/pyth
 on3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefabc.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codescope.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.12/site-packages/beartype-0.17.0.dist-info moved to /usr/lib/python3.12/site-packages/beartype-0.17.2.dist-info
  /usr/lib/python3.12/site-packages/beartype/_check/checkcache.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/codescope.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codescope.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefabc.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefmake.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdrefmeta.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/fwdreftest.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefabc.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefmake.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdrefmeta.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/fwdreftest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/forward/reference/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/__pycache__/checkcache.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/_codescope.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/_codescope.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdref.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/fwdtype.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdref.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/forward/__pycache__/fwdtype.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484/__pycache__/utilpep484ref.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484/utilpep484ref.py was removed

--===============7257720288222960336==--

