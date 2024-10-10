Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19470CFD378
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.53385.1728588988061275760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=kBJTaxsg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1livhWsI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277eebbf8-d9770b34-27c8-4ebc-929d-af0968b6e109-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=utc38x4V3pK6jxSEf6vmxeCwWTMsPdIl9K3fmhzex+A=;
	b=kBJTaxsghs5jUDE8tIm9qQkqN2r1pU2fV+BxSPiJqa8Pt5vTdYwH5S5tGkVwMN/V
	aF7PFaYam1QAC2N4BwQNVW/Wf8aYUjVcXh4VIBntNbQSmMtbYeggcbuaVIQYx56oACJ
	8wv31uFVbmL8vt+WyXtdrJPsrGSX7WBsiisbQOs0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=utc38x4V3pK6jxSEf6vmxeCwWTMsPdIl9K3fmhzex+A=;
	b=1livhWsIoT+sEcLJyGEjuAHiLfJ/cx8di48SJpJKXDezcH+3JNJC2N9y2dN6FTrq
	EzVSdc8Maahdz1MDg3KeUbLq9hEFT34f6O01AnMHskEK32K1KAhnknRnmvoASkhW9X+
	R/BNLI+sr7AWDQwj2TsWJwSQc7LKsB9YutA6Vwk0=
Content-Type: multipart/mixed; boundary="===============2383048258674586829=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome,python3-pycryptodomex: upgrading to
 3.21.0,3.21.0 SUCCEEDED
Message-ID: <0101019277eebbf8-d9770b34-27c8-4ebc-929d-af0968b6e109-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205583

--===============2383048258674586829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodome,python3-pycryptodomex* to *3.21.0,3.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-python3-pycryptodomex-upgrade-3.patch
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
From 5f44c11de2f8030b5604ab32b960fec6bbeed7b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 9 Oct 2024 23:10:57 +0000
Subject: [PATCH] python3-pycryptodome,python3-pycryptodomex: upgrade 3.20.0 ->
 3.21.0,3.20.0 -> 3.21.0

---
 ...n3-pycryptodome_3.20.0.bb => python3-pycryptodome_3.21.0.bb} | 2 +-
 ...-pycryptodomex_3.20.0.bb => python3-pycryptodomex_3.21.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.20.0.bb => python3-pycryptodome_3.21.0.bb} (44%)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.20.0.bb => python3-pycryptodomex_3.21.0.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb
similarity index 44%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb
index 6c93c205ac..77664b22a5 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "09609209ed7de61c2b560cc5c8c4fbf892f8b15b1faf7e4cbffac97db1fffda7"
+SRC_URI[sha256sum] = "f7787e0d469bdae763b876174cf2e6c0f7be79808af26b1da96f1a64bcf47297"
 
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.21.0.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.21.0.bb
index 54578d2850..e5fb000d9b 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.21.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7a710b79baddd65b806402e14766c721aee8fb83381769c27920f26476276c1e"
+SRC_URI[sha256sum] = "222d0bd05381dd25c32dd6065c071ebf084212ab79bab4599ba9e6a3e0009e6c"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.44.1


--===============2383048258674586829==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-python3-pycryptodomex-upgrade-3.patch"

RnJvbSA1ZjQ0YzExZGUyZjgwMzBiNTYwNGFiMzJiOTYwZmVjNmJiZWVkN2I3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOSBPY3QgMjAyNCAyMzoxMDo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21lLHB5dGhvbjMtcHljcnlwdG9kb21leDogdXBncmFkZSAzLjIwLjAg
LT4KIDMuMjEuMCwzLjIwLjAgLT4gMy4yMS4wCgotLS0KIC4uLm4zLXB5Y3J5cHRvZG9tZV8zLjIw
LjAuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMS4wLmJifSB8IDIgKy0KIC4uLi1weWNy
eXB0b2RvbWV4XzMuMjAuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yMS4wLmJifSB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21l
XzMuMjAuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZV8zLjIxLjAuYmJ9ICg0NCUpCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNyeXB0b2RvbWV4XzMu
MjAuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yMS4wLmJifSAoNzElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVf
My4yMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRv
ZG9tZV8zLjIxLjAuYmIKc2ltaWxhcml0eSBpbmRleCA0NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV8zLjIwLjAuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4y
MS4wLmJiCmluZGV4IDZjOTNjMjA1YWMuLjc3NjY0YjIyYTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMC4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMS4w
LmJiCkBAIC0xLDUgKzEsNSBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5o
ZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIwOTYwOTIwOWVkN2RlNjFjMmI1NjBjYzVjOGM0ZmJmODkyZjhiMTViMWZhZjdlNGNiZmZhYzk3
ZGIxZmZmZGE3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3Nzg3ZTBkNDY5YmRhZTc2M2I4NzYx
NzRjZjJlNmMwZjdiZTc5ODA4YWYyNmIxZGE5NmYxYTY0YmNmNDcyOTciCiAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjAu
MC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4
XzMuMjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDcxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjIwLjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjEu
MC5iYgppbmRleCA1NDU3OGQyODUwLi5lNWZiMDAwZDliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjIwLjAuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yMS4w
LmJiCkBAIC0xLDcgKzEsNyBAQAogcmVxdWlyZSBweXRob24tcHljcnlwdG9kb21lLmluYwogaW5o
ZXJpdCBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI3YTcxMGI3OWJhZGRkNjViODA2NDAyZTE0NzY2YzcyMWFlZThmYjgzMzgxNzY5YzI3OTIwZjI2
NDc2Mjc2YzFlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIyMmQwYmQwNTM4MWRkMjVjMzJkZDYw
NjVjMDcxZWJmMDg0MjEyYWI3OWJhYjQ1OTliYTllNmEzZTAwMDllNmMiCiAKIEZJTEVTOiR7UE59
LXRlc3RzID0gIiBcCiAgICAgJHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vQ3J5cHRvZG9tZS9T
ZWxmVGVzdC8gXAotLSAKMi40NC4xCgo=

--===============2383048258674586829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 1150512 to 1310024 (+14%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: removed "/usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/t
 est_import_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pycryptodome-3.20.0.dist-info -> /usr/lib/python3.12/site-packages/pycryptodome-3.21.0.dist-info, removed "/usr/lib/python3.12/site-packages/Crypto/PublicKey/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_nist_ecc.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_curve.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve448.abi3.so /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve25519.abi3.so /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_edwards.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_point.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_montgomery.py /
 usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.pyi /usr/lib/python3.12/site-packages/Crypto/PublicKey/_edwards.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_montgomery.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.12/site-packages/pycryptodome-3.20.0.dist-info moved to /usr/lib/python3.12/site-packages/pycryptodome-3.21.0.dist-info
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve25519.abi3.so was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve448.abi3.so was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_edwards.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_montgomery.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_nist_ecc.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.pyi was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_curve.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_edwards.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_montgomery.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_point.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve25519.py was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve448.py was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed25519.py was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed448.py was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve25519.py was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve448.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_x25519.abi3.so was removed
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_25519.py was removed
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_448.py was removed
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 1150608 to 1310144 (+14%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: FILELIST: removed "/usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_25519.py", added "/usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypt
 odome/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_import_Curve448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_import_Curve25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pycryptodomex-3.20.0.dist-info -> /usr/lib/python3.12/site-packages/pycryptodomex-3.21.0.dist-info, removed "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_curve.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_point.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve25519.abi3.so /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_edwards.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_montgomery.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_edwards.cpython-312.pyc /usr/lib/python3.12/site-packag
 es/Cryptodome/PublicKey/_point.pyi /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve448.abi3.so /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_nist_ecc.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_montgomery.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_point.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.12/site-packages/pycryptodomex-3.20.0.dist-info moved to /usr/lib/python3.12/site-packages/pycryptodomex-3.21.0.dist-info
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve25519.abi3.so was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve448.abi3.so was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_edwards.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_montgomery.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_nist_ecc.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_point.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_point.pyi was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_curve.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_edwards.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_montgomery.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_point.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve25519.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve448.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed25519.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed448.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_import_Curve25519.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_import_Curve448.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_x25519.abi3.so was removed
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_25519.py was removed
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_448.py was removed

--===============2383048258674586829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pycryptodome: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.20.0.tar.gz;downloadfilename=pycryptodome-3.20.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.21.0.tar.gz;downloadfilename=pycryptodome-3.21.0.tar.gz"
packages/core2-64-poky-linux/python3-pycryptodome: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: FILELIST: removed "/usr/lib/python3.12/site-packages/Crypto/PublicKey/.debug/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Crypto/PublicKey/.debug/_curve25519.abi3.so /usr/lib/python3.12/site-packages/Crypto/PublicKey/.debug/_curve448.abi3.so"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 1150512 to 1310024 (+14%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: FILELIST: directory renamed /usr/src/debug/python3-pycryptodome/3.20.0/src/libtom -> /usr/src/debug/python3-pycryptodome/3.21.0/src/libtom, removed "/usr/src/debug/python3-pycryptodome/3.20.0/src/p384_table.h /usr/src/debug/python3-pycryptodome/3.20.0/src/ed448.c /usr/src/debug/python3-pycryptodome/3.20.0/src/x25519.c /usr/src/debug/python3-pycryptodome/3.20.0/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodome/3.20.0/src/keccak.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ed448.h /usr/src/debug/python3-pycryptodome/3.20.0/src/endianess.h /usr/src/debug/python3-pycryptodome/3.20.0/src/blake2s.c /usr/src/debug/python3-pycryptodome/3.20.0/src/block_base.h /usr/src/debug/python3-pycryptodome/3.20.0/src/p384_table.c /usr/src/debug/python3-pycryptodome/3.20.0/src/SHA1.c /usr/src/debug/python3-pycryptodome/3.20.0/src/cast5.c /usr/src/debug/python3-pycryptodome/3.20.0/src/MD5.c /usr/src/debug/python3-py
 cryptodome/3.20.0/src/ec_ws.c /usr/src/debug/python3-pycryptodome/3.20.0/src/strxor.c /usr/src/debug/python3-pycryptodome/3.20.0/src/MD4.c /usr/src/debug/python3-pycryptodome/3.20.0/src/cpuid.c /usr/src/debug/python3-pycryptodome/3.20.0/src/modexp_utils.h /usr/src/debug/python3-pycryptodome/3.20.0/src/modexp_utils.c /usr/src/debug/python3-pycryptodome/3.20.0/src/chacha20.c /usr/src/debug/python3-pycryptodome/3.20.0/src/mont.h /usr/src/debug/python3-pycryptodome/3.20.0/src/mont.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ghash_portable.c /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_ecb.c /usr/src/debug/python3-pycryptodome/3.20.0/src/blake2b.c /usr/src/debug/python3-pycryptodome/3.20.0/src/scrypt.c /usr/src/debug/python3-pycryptodome/3.20.0/src/RIPEMD160.c /usr/src/debug/python3-pycryptodome/3.20.0/src/multiply.h /usr/src/debug/python3-pycryptodome/3.20.0/src/p521_table.c /usr/src/debug/python3-pycryptodome/3.20.0/src/blowfish.c /usr/src/debug/python3-pycryptodome/3.20.0/s
 rc/ARC4.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ec.h /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_cfb.c /usr/src/debug/python3-pycryptodome/3.20.0/src/Salsa20.c /usr/src/debug/python3-pycryptodome/3.20.0/src/p521_table.h /usr/src/debug/python3-pycryptodome/3.20.0/src/bignum.c /usr/src/debug/python3-pycryptodome/3.20.0/src/siphash.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ed25519.h /usr/src/debug/python3-pycryptodome/3.20.0/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodome/3.20.0/src/common.h /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_ofb.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ed25519.c /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_cbc.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ARC2.c /usr/src/debug/python3-pycryptodome/3.20.0/src/SHA512.c /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_ocb.c /usr/src/debug/python3-pycryptodome/3.20.0/src/block_common.c /usr/src/debug/python3-pycryptodome/3.20.0/src/p256_table.h /usr/src/debu
 g/python3-pycryptodome/3.20.0/src/p256_table.c /usr/src/debug/python3-pycryptodome/3.20.0/src/blowfish_init.c /usr/src/debug/python3-pycryptodome/3.20.0/src/blake2.c /usr/src/debug/python3-pycryptodome/3.20.0/src/mod25519.c /usr/src/debug/python3-pycryptodome/3.20.0/src/poly1305.c /usr/src/debug/python3-pycryptodome/3.20.0/src/SHA224.c /usr/src/debug/python3-pycryptodome/3.20.0/src/SHA256.c /usr/src/debug/python3-pycryptodome/3.20.0/src/CAST.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ghash_clmul.c /usr/src/debug/python3-pycryptodome/3.20.0/src/AES.c /usr/src/debug/python3-pycryptodome/3.20.0/src/DES.c /usr/src/debug/python3-pycryptodome/3.20.0/src/modexp.c /usr/src/debug/python3-pycryptodome/3.20.0/src/multiply_64.c /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_ctr.c /usr/src/debug/python3-pycryptodome/3.20.0/src/AESNI.c /usr/src/debug/python3-pycryptodome/3.20.0/src/MD2.c /usr/src/debug/python3-pycryptodome/3.20.0/src/SHA384.c", added "/usr/src/debug/python3-pycryptodome
 /3.21.0/src/p384_table.h /usr/src/debug/python3-pycryptodome/3.21.0/src/ed448.c /usr/src/debug/python3-pycryptodome/3.21.0/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodome/3.21.0/src/keccak.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ed448.h /usr/src/debug/python3-pycryptodome/3.21.0/src/endianess.h /usr/src/debug/python3-pycryptodome/3.21.0/src/blake2s.c /usr/src/debug/python3-pycryptodome/3.21.0/src/block_base.h /usr/src/debug/python3-pycryptodome/3.21.0/src/p384_table.c /usr/src/debug/python3-pycryptodome/3.21.0/src/SHA1.c /usr/src/debug/python3-pycryptodome/3.21.0/src/cast5.c /usr/src/debug/python3-pycryptodome/3.21.0/src/MD5.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ec_ws.c /usr/src/debug/python3-pycryptodome/3.21.0/src/strxor.c /usr/src/debug/python3-pycryptodome/3.21.0/src/MD4.c /usr/src/debug/python3-pycryptodome/3.21.0/src/cpuid.c /usr/src/debug/python3-pycryptodome/3.21.0/src/modexp_utils.h /usr/src/debug/python3-pycryptodome/3.21.0/src/modexp_utils
 .c /usr/src/debug/python3-pycryptodome/3.21.0/src/chacha20.c /usr/src/debug/python3-pycryptodome/3.21.0/src/mont.h /usr/src/debug/python3-pycryptodome/3.21.0/src/mont.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ghash_portable.c /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_ecb.c /usr/src/debug/python3-pycryptodome/3.21.0/src/blake2b.c /usr/src/debug/python3-pycryptodome/3.21.0/src/scrypt.c /usr/src/debug/python3-pycryptodome/3.21.0/src/RIPEMD160.c /usr/src/debug/python3-pycryptodome/3.21.0/src/curve448.h /usr/src/debug/python3-pycryptodome/3.21.0/src/multiply.h /usr/src/debug/python3-pycryptodome/3.21.0/src/p521_table.c /usr/src/debug/python3-pycryptodome/3.21.0/src/blowfish.c /usr/src/debug/python3-pycryptodome/3.21.0/src/curve448.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ARC4.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ec.h /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_cfb.c /usr/src/debug/python3-pycryptodome/3.21.0/src/Salsa20.c /usr/src/debug/python3-
 pycryptodome/3.21.0/src/p521_table.h /usr/src/debug/python3-pycryptodome/3.21.0/src/bignum.c /usr/src/debug/python3-pycryptodome/3.21.0/src/siphash.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ed25519.h /usr/src/debug/python3-pycryptodome/3.21.0/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodome/3.21.0/src/common.h /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_ofb.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ed25519.c /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_cbc.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ARC2.c /usr/src/debug/python3-pycryptodome/3.21.0/src/SHA512.c /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_ocb.c /usr/src/debug/python3-pycryptodome/3.21.0/src/block_common.c /usr/src/debug/python3-pycryptodome/3.21.0/src/p256_table.h /usr/src/debug/python3-pycryptodome/3.21.0/src/p256_table.c /usr/src/debug/python3-pycryptodome/3.21.0/src/blowfish_init.c /usr/src/debug/python3-pycryptodome/3.21.0/src/curve25519.c /usr/src/debug/python3-pycryp
 todome/3.21.0/src/blake2.c /usr/src/debug/python3-pycryptodome/3.21.0/src/curve25519.h /usr/src/debug/python3-pycryptodome/3.21.0/src/mod25519.c /usr/src/debug/python3-pycryptodome/3.21.0/src/SHA224.c /usr/src/debug/python3-pycryptodome/3.21.0/src/poly1305.c /usr/src/debug/python3-pycryptodome/3.21.0/src/SHA256.c /usr/src/debug/python3-pycryptodome/3.21.0/src/CAST.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ghash_clmul.c /usr/src/debug/python3-pycryptodome/3.21.0/src/AES.c /usr/src/debug/python3-pycryptodome/3.21.0/src/DES.c /usr/src/debug/python3-pycryptodome/3.21.0/src/modexp.c /usr/src/debug/python3-pycryptodome/3.21.0/src/multiply_64.c /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_ctr.c /usr/src/debug/python3-pycryptodome/3.21.0/src/AESNI.c /usr/src/debug/python3-pycryptodome/3.21.0/src/MD2.c /usr/src/debug/python3-pycryptodome/3.21.0/src/SHA384.c"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2778758 to 2800915 (+1%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: removed "/usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/Sel
 fTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve448.py"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 2849613 to 3006823 (+6%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pycryptodome-3.20.0.dist-info -> /usr/lib/python3.12/site-packages/pycryptodome-3.21.0.dist-info, removed "/usr/lib/python3.12/site-packages/Crypto/PublicKey/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/_edwards.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.pyi /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_edwards.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve25519.abi3.so /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_montgomery.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/_nist_ecc.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_curve.cpython-312.pyc /usr/lib/python3.12/site-packag
 es/Crypto/PublicKey/_curve448.abi3.so /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_montgomery.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_point.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3519872 to 3630020 (+3%)
Changes to packages/core2-64-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.12/site-packages/pycryptodome-3.20.0.dist-info moved to /usr/lib/python3.12/site-packages/pycryptodome-3.21.0.dist-info
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve25519.abi3.so was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve448.abi3.so was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_edwards.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_montgomery.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_nist_ecc.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.pyi was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_curve.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_edwards.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_montgomery.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_point.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve25519.py was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve448.py was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed25519.py was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed448.py was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve25519.py was added
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve448.py was added
  /usr/lib/python3.12/site-packages/Crypto/PublicKey/_x25519.abi3.so was removed
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_25519.py was removed
  /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_448.py was removed
packages/core2-64-poky-linux/python3-pycryptodomex: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.20.0.tar.gz;downloadfilename=pycryptodomex-3.20.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.21.0.tar.gz;downloadfilename=pycryptodomex-3.21.0.tar.gz"
packages/core2-64-poky-linux/python3-pycryptodomex: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: FILELIST: removed "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/.debug/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/.debug/_curve25519.abi3.so /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/.debug/_curve448.abi3.so"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 1150608 to 1310144 (+14%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: FILELIST: directory renamed /usr/src/debug/python3-pycryptodomex/3.20.0/src/libtom -> /usr/src/debug/python3-pycryptodomex/3.21.0/src/libtom, removed "/usr/src/debug/python3-pycryptodomex/3.20.0/src/ARC2.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/SHA384.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/blake2.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/multiply.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/p256_table.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/p384_table.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/p521_table.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/Salsa20.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ec.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/ghash_clmul.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/mod25519.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/p256_table.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/ed25519.h /usr/sr
 c/debug/python3-pycryptodomex/3.20.0/src/p384_table.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/p521_table.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/ed448.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/AESNI.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/common.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/DES.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ec_ws.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ed25519.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ed448.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/blowfish_init.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_cbc.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_cfb.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_ctr.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_ecb.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_ocb.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_ofb.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/poly1305.c /usr/src/debug/pyt
 hon3-pycryptodomex/3.20.0/src/ghash_portable.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/cpuid.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/endianess.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/x25519.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/AES.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/modexp_utils.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/keccak.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/modexp_utils.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/CAST.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/bignum.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/MD4.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/blake2b.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/SHA512.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/blake2s.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/MD5.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/pkcs1_decode.c /usr/src/debug/
 python3-pycryptodomex/3.20.0/src/strxor.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/block_base.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/block_common.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/multiply_64.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/SHA256.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/RIPEMD160.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/MD2.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/chacha20.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/modexp.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/scrypt.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/SHA1.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/cast5.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/siphash.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/blowfish.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/mont.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/SHA224.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ARC4.c /usr/src/debug/python3-pycrypt
 odomex/3.20.0/src/mont.c", added "/usr/src/debug/python3-pycryptodomex/3.21.0/src/SHA512.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/bignum.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ARC4.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/Salsa20.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/SHA1.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/strxor.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/endianess.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/ghash_clmul.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/MD5.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/curve25519.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/MD4.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_ctr.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_ecb.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_ocb.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_ofb.c /usr/src/debug/python3-pycryptodomex/3
 .21.0/src/raw_cbc.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ed25519.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/modexp_utils.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_cfb.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/modexp.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/curve25519.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/ec_ws.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ed25519.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/keccak.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/modexp_utils.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/p256_table.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/blowfish.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/multiply.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/ARC2.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/p384_table.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/p521_table.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/curve448.h /usr/src/debug/python3-pycrypto
 domex/3.21.0/src/mod25519.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/common.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/CAST.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/chacha20.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/curve448.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/p256_table.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/p384_table.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/p521_table.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/ed448.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/AESNI.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/blake2.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ec.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/MD2.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/DES.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/poly1305.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/cast5.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/blake2b.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/blake
 2s.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/block_common.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/AES.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/scrypt.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/blowfish_init.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/cpuid.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/RIPEMD160.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/SHA384.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/siphash.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/block_base.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/ed448.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/mont.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/multiply_64.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/SHA256.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/mont.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ghash_portable.c /usr/src/debug/python3-pycryptodomex/3.21.0
 /src/SHA224.c"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGSIZE changed from 2778758 to 2800915 (+1%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: FILELIST: removed "/usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_import_Curve25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packag
 es/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_import_Curve448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 2853585 to 3010987 (+6%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pycryptodomex-3.20.0.dist-info -> /usr/lib/python3.12/site-packages/pycryptodomex-3.21.0.dist-info, removed "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_nist_ecc.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve25519.abi3.so /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_point.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_edwards.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_edwards.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve448.abi3.so /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_montgomery.py /usr/lib/python3.12/site-packages/Cryptodome/
 PublicKey/_point.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_curve.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_point.pyi /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_montgomery.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve.py"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3525621 to 3635989 (+3%)
Changes to packages/core2-64-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.12/site-packages/pycryptodomex-3.20.0.dist-info moved to /usr/lib/python3.12/site-packages/pycryptodomex-3.21.0.dist-info
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve25519.abi3.so was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve448.abi3.so was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_edwards.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_montgomery.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_nist_ecc.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_point.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_point.pyi was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_curve.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_edwards.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_montgomery.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_point.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve25519.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve448.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed25519.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed448.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_import_Curve25519.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_import_Curve448.py was added
  /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_x25519.abi3.so was removed
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_25519.py was removed
  /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_448.py was removed

--===============2383048258674586829==--

