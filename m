Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821C0C4828A
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.88847.1705340029604919725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IN8dyV2m;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LupdUp4i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018d0e2fce0d-cecc19ff-cdd3-4ca4-8de9-e1bed1822eb1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gA+aeP2pxRuCHEvFgloepGDZBqpOwLs5Bc/jHer6uns=;
	b=IN8dyV2m5ncjvmtf0bWuP476CYbSw7mWHR1di7IdB6/S0gWcD1qifvYLb/zVzI/D
	wY+5Mr7J0J5SD99WlHawUVJWZPAwZmysxgXOH6D6aBpl8m2Z/suiOyqRcZAybZk7Yuy
	5jXgazoDVyXDBgPGFfWyRGqib/5Sh8kvsY6g3Ihg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gA+aeP2pxRuCHEvFgloepGDZBqpOwLs5Bc/jHer6uns=;
	b=LupdUp4iRKhaRNRCEGoVmtLBl0XM8yWtaY06amO41ZN4ovjpyAt+WqtHP+5Wu/G7
	/a/LW4fGZvbLAPOCz0xhFfYLGWBVLPM7/W68cTxOx4naHkBFuaDnxgE4Pr65LrERAcD
	IkLG+lZZ7qGEvDgkZt1OWDnvtlsqXi+3YGECN+Dg=
Content-Type: multipart/mixed; boundary="===============6518345334541844922=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex: upgrading to 3.20.0 SUCCEEDED
Message-ID: <0101018d0e2fce0d-cecc19ff-cdd3-4ca4-8de9-e1bed1822eb1-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193760

--===============6518345334541844922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodomex* to *3.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-upgrade-3.19.1-3.20.0.patch
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
From c4f3b38a687f8bd9e1304c6faff030bfa0ddb660 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 07:56:45 +0000
Subject: [PATCH] python3-pycryptodomex: upgrade 3.19.1 -> 3.20.0

---
 ...-pycryptodomex_3.19.1.bb => python3-pycryptodomex_3.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.19.1.bb => python3-pycryptodomex_3.20.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.19.1.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.19.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
index d6e5c6d3ee..2673ea8326 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.19.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "0b7154aff2272962355f8941fd514104a88cb29db2d8f43a29af900d6398eb1c"
+SRC_URI[sha256sum] = "7a710b79baddd65b806402e14766c721aee8fb83381769c27920f26476276c1e"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.42.0


--===============6518345334541844922==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-upgrade-3.19.1-3.20.0.patch"

RnJvbSBjNGYzYjM4YTY4N2Y4YmQ5ZTEzMDRjNmZhZmYwMzBiZmEwZGRiNjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDc6NTY6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3J5cHRvZG9tZXg6IHVwZ3JhZGUgMy4xOS4xIC0+IDMuMjAuMAoKLS0tCiAuLi4t
cHljcnlwdG9kb21leF8zLjE5LjEuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjAuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y3J5cHRvZG9t
ZXhfMy4xOS4xLmJiID0+IHB5dGhvbjMtcHljcnlwdG9kb21leF8zLjIwLjAuYmJ9ICg2OSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRv
ZG9tZXhfMy4xOS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
Y3J5cHRvZG9tZXhfMy4yMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNjklCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMTkuMS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRv
ZG9tZXhfMy4yMC4wLmJiCmluZGV4IGQ2ZTVjNmQzZWUuLjI2NzNlYTgzMjYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMTku
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9k
b21leF8zLjIwLjAuYmIKQEAgLTEsNyArMSw3IEBACiByZXF1aXJlIHB5dGhvbi1weWNyeXB0b2Rv
bWUuaW5jCiBpbmhlcml0IHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwYjcx
NTRhZmYyMjcyOTYyMzU1Zjg5NDFmZDUxNDEwNGE4OGNiMjlkYjJkOGY0M2EyOWFmOTAwZDYzOThl
YjFjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdhNzEwYjc5YmFkZGQ2NWI4MDY0MDJlMTQ3NjZj
NzIxYWVlOGZiODMzODE3NjljMjc5MjBmMjY0NzYyNzZjMWUiCiAKIEZJTEVTOiR7UE59LXRlc3Rz
ID0gIiBcCiAgICAgJHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vQ3J5cHRvZG9tZS9TZWxmVGVz
dC8gXAotLSAKMi40Mi4wCgo=

--===============6518345334541844922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: FILELIST: added "/usr/lib/python3.11/site-packages/Cryptodome/SelfTest/Hash/__pycache__/test_TurboSHAKE.cpython-311.pyc /usr/lib/python3.11/site-packages/Cryptodome/SelfTest/Hash/test_TurboSHAKE.py"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pycryptodomex-3.19.1.dist-info -> /usr/lib/python3.11/site-packages/pycryptodomex-3.20.0.dist-info, added "/usr/lib/python3.11/site-packages/Cryptodome/Hash/__pycache__/TurboSHAKE128.cpython-311.pyc /usr/lib/python3.11/site-packages/Cryptodome/Hash/__pycache__/TurboSHAKE256.cpython-311.pyc /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE128.py /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE256.pyi /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE128.pyi /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE256.py"
Changes to packages/core2-64-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodomex-3.19.1.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodomex-3.20.0.dist-info
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/__pycache__/TurboSHAKE128.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/__pycache__/TurboSHAKE256.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE128.py was added
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE128.pyi was added
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE256.py was added
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE256.pyi was added
  /usr/lib/python3.11/site-packages/Cryptodome/SelfTest/Hash/__pycache__/test_TurboSHAKE.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cryptodome/SelfTest/Hash/test_TurboSHAKE.py was added

--===============6518345334541844922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pycryptodomex: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.19.1.tar.gz;downloadfilename=pycryptodomex-3.19.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.20.0.tar.gz;downloadfilename=pycryptodomex-3.20.0.tar.gz"
packages/core2-64-poky-linux/python3-pycryptodomex: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: FILELIST: added "/usr/lib/python3.11/site-packages/Cryptodome/SelfTest/Hash/test_TurboSHAKE.py /usr/lib/python3.11/site-packages/Cryptodome/SelfTest/Hash/__pycache__/test_TurboSHAKE.cpython-311.pyc"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 2924046 to 2990378 (+2%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pycryptodomex-3.19.1.dist-info -> /usr/lib/python3.11/site-packages/pycryptodomex-3.20.0.dist-info, added "/usr/lib/python3.11/site-packages/Cryptodome/Hash/__pycache__/TurboSHAKE128.cpython-311.pyc /usr/lib/python3.11/site-packages/Cryptodome/Hash/__pycache__/TurboSHAKE256.cpython-311.pyc /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE128.py /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE256.py /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE128.pyi /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE256.pyi"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3577580 to 3602615 (+1%)
Changes to packages/core2-64-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodomex-3.19.1.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodomex-3.20.0.dist-info
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/__pycache__/TurboSHAKE128.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/__pycache__/TurboSHAKE256.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE128.py was added
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE128.pyi was added
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE256.py was added
  /usr/lib/python3.11/site-packages/Cryptodome/Hash/TurboSHAKE256.pyi was added
  /usr/lib/python3.11/site-packages/Cryptodome/SelfTest/Hash/__pycache__/test_TurboSHAKE.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Cryptodome/SelfTest/Hash/test_TurboSHAKE.py was added

--===============6518345334541844922==--

