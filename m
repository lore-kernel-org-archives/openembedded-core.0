Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E5CC4828E
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.88843.1705340029535086413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b2P6w2wf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QTlxitAX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018d0e2fca53-0f800ed6-8e28-4d73-83fb-53ce8d1a2498-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1yMFoYGgE14cnDTaVFVOsA5TQBFaDU0E3sIqFOG2tGM=;
	b=b2P6w2wfywMSb46m0KxUdAEbrGkRJLa97/GwCIZzNzw2ZyUEJS8u7wDRAYtrhgC3
	1tvXEgitCuKXItHf6pJJS6wIwoBckLDWFNk0EyNf1i9myRDDbgOd4SrxnOb1gfz8Mdo
	6U2OqNjC1MTB3znvRvS/Px6ZjcaK4Z7R0uNYkblU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340030;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1yMFoYGgE14cnDTaVFVOsA5TQBFaDU0E3sIqFOG2tGM=;
	b=QTlxitAXBXR0qVqtdA6PJHKWWJc4Z71RnfrwZDrmXdU06nEpg6FCa/CBNLyApt2V
	M/KVBTorsnJQfbybS1z0FZxk4TjnWBYHEfKW7toYoNoyYWu1PkrUEHfY7hSSpN6k9nI
	af4y71Un5LjKT4r+awjOQyitewP5tSekJShJYKoI=
Content-Type: multipart/mixed; boundary="===============8614423252597465200=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome: upgrading to 3.20.0 SUCCEEDED
Message-ID: <0101018d0e2fca53-0f800ed6-8e28-4d73-83fb-53ce8d1a2498-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193723

--===============8614423252597465200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodome* to *3.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-upgrade-3.19.1-3.20.0.patch
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
From 07f7c0a641292f19770e67668df12729ed8d4559 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 07:52:41 +0000
Subject: [PATCH] python3-pycryptodome: upgrade 3.19.1 -> 3.20.0

---
 ...n3-pycryptodome_3.19.1.bb => python3-pycryptodome_3.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.19.1.bb => python3-pycryptodome_3.20.0.bb} (38%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.19.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
similarity index 38%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.19.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
index 70f16c7f6d..d24fa58d43 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.19.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "8ae0dd1bcfada451c35f9e29a3e5db385caabc190f98e4a80ad02a61098fb776"
+SRC_URI[sha256sum] = "09609209ed7de61c2b560cc5c8c4fbf892f8b15b1faf7e4cbffac97db1fffda7"
 
-- 
2.42.0


--===============8614423252597465200==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-upgrade-3.19.1-3.20.0.patch"

RnJvbSAwN2Y3YzBhNjQxMjkyZjE5NzcwZTY3NjY4ZGYxMjcyOWVkOGQ0NTU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDc6NTI6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3J5cHRvZG9tZTogdXBncmFkZSAzLjE5LjEgLT4gMy4yMC4wCgotLS0KIC4uLm4z
LXB5Y3J5cHRvZG9tZV8zLjE5LjEuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21l
XzMuMTkuMS5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZV8zLjIwLjAuYmJ9ICgzOCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9t
ZV8zLjE5LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlw
dG9kb21lXzMuMjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDM4JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMTkuMS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8z
LjIwLjAuYmIKaW5kZXggNzBmMTZjN2Y2ZC4uZDI0ZmE1OGQ0MyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjE5LjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjIw
LjAuYmIKQEAgLTEsNSArMSw1IEBACiByZXF1aXJlIHB5dGhvbi1weWNyeXB0b2RvbWUuaW5jCiBp
bmhlcml0IHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4YWUwZGQxYmNmYWRh
NDUxYzM1ZjllMjlhM2U1ZGIzODVjYWFiYzE5MGY5OGU0YTgwYWQwMmE2MTA5OGZiNzc2IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjA5NjA5MjA5ZWQ3ZGU2MWMyYjU2MGNjNWM4YzRmYmY4OTJmOGIx
NWIxZmFmN2U0Y2JmZmFjOTdkYjFmZmZkYTciCiAKLS0gCjIuNDIuMAoK

--===============8614423252597465200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: added "/usr/lib/python3.11/site-packages/Crypto/SelfTest/Hash/test_TurboSHAKE.py /usr/lib/python3.11/site-packages/Crypto/SelfTest/Hash/__pycache__/test_TurboSHAKE.cpython-311.pyc"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pycryptodome-3.19.1.dist-info -> /usr/lib/python3.11/site-packages/pycryptodome-3.20.0.dist-info, added "/usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE128.py /usr/lib/python3.11/site-packages/Crypto/Hash/__pycache__/TurboSHAKE256.cpython-311.pyc /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE128.pyi /usr/lib/python3.11/site-packages/Crypto/Hash/__pycache__/TurboSHAKE128.cpython-311.pyc /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE256.pyi /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE256.py"
Changes to packages/core2-64-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.19.1.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodome-3.20.0.dist-info
  /usr/lib/python3.11/site-packages/Crypto/Hash/__pycache__/TurboSHAKE128.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Crypto/Hash/__pycache__/TurboSHAKE256.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE128.py was added
  /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE128.pyi was added
  /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE256.py was added
  /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE256.pyi was added
  /usr/lib/python3.11/site-packages/Crypto/SelfTest/Hash/__pycache__/test_TurboSHAKE.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Crypto/SelfTest/Hash/test_TurboSHAKE.py was added

--===============8614423252597465200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.19.1.tar.gz;downloadfilename=pycryptodome-3.19.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.20.0.tar.gz;downloadfilename=pycryptodome-3.20.0.tar.gz"
packages/core2-64-poky-linux/python3-pycryptodome: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: added "/usr/lib/python3.11/site-packages/Crypto/SelfTest/Hash/test_TurboSHAKE.py /usr/lib/python3.11/site-packages/Crypto/SelfTest/Hash/__pycache__/test_TurboSHAKE.cpython-311.pyc"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 2920114 to 2986406 (+2%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.19.1" to "3.20.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pycryptodome-3.19.1.dist-info -> /usr/lib/python3.11/site-packages/pycryptodome-3.20.0.dist-info, added "/usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE256.pyi /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE128.py /usr/lib/python3.11/site-packages/Crypto/Hash/__pycache__/TurboSHAKE256.cpython-311.pyc /usr/lib/python3.11/site-packages/Crypto/Hash/__pycache__/TurboSHAKE128.cpython-311.pyc /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE128.pyi /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE256.py"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.19.1 [default] to 3.20.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3571931 to 3596866 (+1%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.19.1" to "3.20.0"
Changes to packages/core2-64-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.19.1.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodome-3.20.0.dist-info
  /usr/lib/python3.11/site-packages/Crypto/Hash/__pycache__/TurboSHAKE128.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Crypto/Hash/__pycache__/TurboSHAKE256.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE128.py was added
  /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE128.pyi was added
  /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE256.py was added
  /usr/lib/python3.11/site-packages/Crypto/Hash/TurboSHAKE256.pyi was added
  /usr/lib/python3.11/site-packages/Crypto/SelfTest/Hash/__pycache__/test_TurboSHAKE.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/Crypto/SelfTest/Hash/test_TurboSHAKE.py was added

--===============8614423252597465200==--

