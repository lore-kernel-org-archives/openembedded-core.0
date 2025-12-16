Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03B1D5E136
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17382.1765872127684878873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Wx0CVBPc;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lUWBQX57;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019b262e9c6e-dba27cd7-8f05-44f4-99ad-928ec686e009-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9DjHPLpU8aMSpPdX75H9MOHLjfW9mwSjJ09PgjJGXTc=;
	b=Wx0CVBPcirdJgC0nn+r1qSmnnYFP6lkAtvuQjDMr5nR6Zp2MZjLbjFvgJjZRlw3Q
	aOETEw39EXBNAlqaYMCoQ3SNWEK2+nYz+2j9Y2KeFR4dXs/4bXTHQSKQT6fsei7/+QM
	Y10d+DbxrIs/n/nZSh44pkf1uhdHZDl9Vssu1OVo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872147;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9DjHPLpU8aMSpPdX75H9MOHLjfW9mwSjJ09PgjJGXTc=;
	b=lUWBQX57DePSq7pli8s3OyxCgYKHt6Yqq7h+hTwGrLjhmOBqqHkE1PtQyft4DX4W
	rUV15Zq42rzaFKLDfdiYYxvQelXKtOv46mk5okahePbACQCF+WuJ0fEmexBp2hBUD5L
	FeMct4hsaD4ZjhySH8C04UW34HOxGkBquuVD7N0k=
Content-Type: multipart/mixed; boundary="===============7391949214730646258=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rdflib: upgrading to 7.5.0 SUCCEEDED
Message-ID: <0101019b262e9c6e-dba27cd7-8f05-44f4-99ad-928ec686e009-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227824

--===============7391949214730646258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rdflib* to *7.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rdflib-upgrade-7.1.4-7.5.0.patch
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
From 8d0571c7768687071a128d9581983dd5cbff9bbc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:12:40 +0000
Subject: [PATCH] python3-rdflib: upgrade 7.1.4 -> 7.5.0

---
 .../python/{python3-rdflib_7.1.4.bb => python3-rdflib_7.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.1.4.bb => python3-rdflib_7.5.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.1.4.bb b/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-rdflib_7.1.4.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
index 01841cda4f..e421aa2bac 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.1.4.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7006e973486c4700556f6d58cba0ab6c"
 
-SRC_URI[sha256sum] = "fed46e24f26a788e2ab8e445f7077f00edcf95abb73bcef4b86cefa8b62dd174"
+SRC_URI[sha256sum] = "663083443908b1830e567350d72e74d9948b310f827966358d76eebdc92bf592"
 
 inherit pypi python_poetry_core
 
-- 
2.47.1


--===============7391949214730646258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: FILELIST: directory renamed /usr/lib/python3.13/site-packages/rdflib-7.1.4.dist-info -> /usr/lib/python3.13/site-packages/rdflib-7.5.0.dist-info, added "/usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__init__.py /usr/lib/python3.13/site-packages/rdflib/contrib/__init__.py /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__pycache__/client.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/exceptions.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/client.py /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/util.py /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/tools/sparqlquery.py /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/client.py /usr/lib/python3.13/site-
 packages/rdflib/contrib/rdf4j/exceptions.py /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__init__.py /usr/lib/python3.13/site-packages/rdflib/plugins/stores/__pycache__/rdf4j.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/tools/__pycache__/sparqlquery.cpython-313.pyc /usr/bin/sq /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/client.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/plugins/stores/rdf4j.py /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/util.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/__pycache__/__init__.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-rdflib (sysroot):
  /usr/lib/python3.13/site-packages/rdflib-7.1.4.dist-info moved to /usr/lib/python3.13/site-packages/rdflib-7.5.0.dist-info
  /usr/lib/python3.13/site-packages/rdflib/contrib was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/client.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__init__.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__pycache__ was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__pycache__/client.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/__init__.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/__pycache__ was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/client.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/exceptions.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__init__.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__ was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/client.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/exceptions.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/util.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/util.py was added
  /usr/lib/python3.13/site-packages/rdflib/plugins/stores/__pycache__/rdf4j.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/plugins/stores/rdf4j.py was added
  /usr/lib/python3.13/site-packages/rdflib/tools/__pycache__/sparqlquery.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/tools/sparqlquery.py was added

--===============7391949214730646258==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rdflib-upgrade-7.1.4-7.5.0.patch"

RnJvbSA4ZDA1NzFjNzc2ODY4NzA3MWExMjhkOTU4MTk4M2RkNWNiZmY5YmJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6MTI6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJkZmxpYjogdXBncmFkZSA3LjEuNCAtPiA3LjUuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXJkZmxpYl83LjEuNC5iYiA9PiBweXRob24zLXJkZmxpYl83LjUuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJkZmxpYl83LjEuNC5iYiA9PiBw
eXRob24zLXJkZmxpYl83LjUuMC5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmRmbGliXzcuMS40LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXJkZmxpYl83LjUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcmRmbGli
XzcuMS40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cmRmbGliXzcuNS4wLmJiCmluZGV4IDAxODQxY2RhNGYuLmU0MjFhYTJiYWMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZGZsaWJfNy4xLjQuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJkZmxpYl83LjUuMC5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkJTRC0z
LUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTcwMDZlOTcz
NDg2YzQ3MDA1NTZmNmQ1OGNiYTBhYjZjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmVkNDZl
MjRmMjZhNzg4ZTJhYjhlNDQ1ZjcwNzdmMDBlZGNmOTVhYmI3M2JjZWY0Yjg2Y2VmYThiNjJkZDE3
NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2NjMwODM0NDM5MDhiMTgzMGU1NjczNTBkNzJlNzRk
OTk0OGIzMTBmODI3OTY2MzU4ZDc2ZWViZGM5MmJmNTkyIgogCiBpbmhlcml0IHB5cGkgcHl0aG9u
X3BvZXRyeV9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============7391949214730646258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-rdflib: PV changed from "7.1.4" to "7.5.0"
packages/x86-64-v3-poky-linux/python3-rdflib: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rdflib/rdflib-7.1.4.tar.gz;downloadfilename=rdflib-7.1.4.tar.gz" to "https://files.pythonhosted.org/packages/source/r/rdflib/rdflib-7.5.0.tar.gz;downloadfilename=rdflib-7.5.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-rdflib: PKGV changed from 7.1.4 [default] to 7.5.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-dbg: PV changed from "7.1.4" to "7.5.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-dbg: PKGV changed from 7.1.4 [default] to 7.5.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-dev: PV changed from "7.1.4" to "7.5.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-dev: PKGV changed from 7.1.4 [default] to 7.5.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-doc: PV changed from "7.1.4" to "7.5.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-doc: PKGV changed from 7.1.4 [default] to 7.5.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-locale: PV changed from "7.1.4" to "7.5.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-locale: PKGV changed from 7.1.4 [default] to 7.5.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-src: PV changed from "7.1.4" to "7.5.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-src: PKGV changed from 7.1.4 [default] to 7.5.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-staticdev: PV changed from "7.1.4" to "7.5.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib-staticdev: PKGV changed from 7.1.4 [default] to 7.5.0 [default]
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: PKGSIZE changed from 3795745 to 3989513 (+5%)
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: PV changed from "7.1.4" to "7.5.0"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: FILELIST: directory renamed /usr/lib/python3.13/site-packages/rdflib-7.1.4.dist-info -> /usr/lib/python3.13/site-packages/rdflib-7.5.0.dist-info, added "/usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/client.cpython-313.pyc /usr/bin/sq /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/client.py /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__pycache__/client.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/client.py /usr/lib/python3.13/site-packages/rdflib/tools/sparqlquery.py /usr/lib/python3.13/site-packages/rdflib/tools/__pycache__/sparqlquery.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/util.py /usr/lib/python3.13/site-packages/rdflib/plugins/stores/__pycache__/rdf4j.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/__pycache__/__i
 nit__.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__init__.py /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/exceptions.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__init__.py /usr/lib/python3.13/site-packages/rdflib/contrib/__init__.py /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/util.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/exceptions.py /usr/lib/python3.13/site-packages/rdflib/plugins/stores/rdf4j.py"
packages/x86-64-v3-poky-linux/python3-rdflib/python3-rdflib: PKGV changed from 7.1.4 [default] to 7.5.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-rdflib (sysroot):
  /usr/lib/python3.13/site-packages/rdflib-7.1.4.dist-info moved to /usr/lib/python3.13/site-packages/rdflib-7.5.0.dist-info
  /usr/lib/python3.13/site-packages/rdflib/contrib was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/client.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__init__.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__pycache__ was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__pycache__/client.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/graphdb/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/__init__.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/__pycache__ was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/client.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/exceptions.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__init__.py was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__ was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/client.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/exceptions.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/__pycache__/util.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/contrib/rdf4j/util.py was added
  /usr/lib/python3.13/site-packages/rdflib/plugins/stores/__pycache__/rdf4j.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/plugins/stores/rdf4j.py was added
  /usr/lib/python3.13/site-packages/rdflib/tools/__pycache__/sparqlquery.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rdflib/tools/sparqlquery.py was added

--===============7391949214730646258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-aae75d31d0b6a431592dbd263e5d238f774e7c7b"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:aae75d31d0b6a431592dbd263e5d238f774e7c7b"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 405 Local 393 Mirrors 0 Missed 12 Current 253 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 254 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 261 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 262 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 298 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 299 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 309 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 322 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 328 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 343 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-rdflib-7.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-rdflib-7.5.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 344 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 345 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 347 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-rdflib-7.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 970 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_fetch)
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pyparsing/3.2.4/temp/log.do_packagedata_setscene.450773
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 356 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb:do_package_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-rdflib-7.5.0-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 380 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 971 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_unpack)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 409 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 411 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1026 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1037 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1038 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1120 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1121 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 482 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_package_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1133 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running setscene task 497 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1151 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 527 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1197 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 573 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 595 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1214 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 604 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 606 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 608 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 615 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 619 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 628 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1699 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1721 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1842 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_collect_spdx_deps)
NOTE: Running task 1845 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-pyparsing-3.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-rdflib-7.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rdflib-7.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1857 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_configure)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_configure: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1858 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_compile)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_compile: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1859 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_install)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_install: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_install: Succeeded
NOTE: Running task 1860 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_package)
NOTE: Running task 1861 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_populate_sysroot)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_package: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_populate_sysroot unihash changed to db6b598e5389e3d945d7fcc83cbdd036e9afdfdb9c6d97d5a0c5275343ee0734
NOTE: Setscene tasks completed
NOTE: recipe python3-rdflib-7.5.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_package unihash changed to b40701e9e2349de183c7ab2e3667c3401ddb89927bc4c16614385e432d1f872d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_package_write_deb became valid
NOTE: Running setscene task 652 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 654 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 656 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-rdflib-7.5.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-rdflib-7.5.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 658 of 658 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1863 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_create_spdx)
NOTE: Running task 1867 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_package_qa)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_create_spdx: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_package_qa: Started
NOTE: recipe python3-rdflib-7.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1868 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_create_package_spdx)
NOTE: recipe python3-rdflib-7.5.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-rdflib-7.5.0-r0: task do_create_package_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_package_qa unihash changed to 8989660cf5ffda3b8330e2588bc1cf72eb2d6adbe558b26686c5e2a2d9c568c3
NOTE: recipe python3-rdflib-7.5.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 1869 of 1869 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1869 tasks of which 1845 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pyparsing-3.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyparsing-src went backwards which would break package feeds (from 0:3.2.5-r0 to 0:3.2.4-r0) [version-going-backwards]
ERROR: python3-pyparsing-3.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyparsing-dbg went backwards which would break package feeds (from 0:3.2.5-r0 to 0:3.2.4-r0) [version-going-backwards]
ERROR: python3-pyparsing-3.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyparsing-staticdev went backwards which would break package feeds (from 0:3.2.5-r0 to 0:3.2.4-r0) [version-going-backwards]
ERROR: python3-pyparsing-3.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyparsing-dev went backwards which would break package feeds (from 0:3.2.5-r0 to 0:3.2.4-r0) [version-going-backwards]
ERROR: python3-pyparsing-3.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyparsing-doc went backwards which would break package feeds (from 0:3.2.5-r0 to 0:3.2.4-r0) [version-going-backwards]
ERROR: python3-pyparsing-3.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyparsing-locale went backwards which would break package feeds (from 0:3.2.5-r0 to 0:3.2.4-r0) [version-going-backwards]
ERROR: python3-pyparsing-3.2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pyparsing went backwards which would break package feeds (from 0:3.2.5-r0 to 0:3.2.4-r0) [version-going-backwards]
ERROR: python3-pyparsing-3.2.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7391949214730646258==--

