Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CF8CFD31E
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.53363.1728588948890684536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aSBLsBD0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=d3UNf7Vv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277ee5b97-027088a3-7e89-4ba8-bfe6-b5442ffa3d3b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588962;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LqnON1TAle59VKumKQM+33/MqtblT6/Ua6yw016fMDQ=;
	b=aSBLsBD0FtqFNcjq6sBEteLX0v3ZJO4l0MXrt6qpJM8icNQEPpvJ4DRgL35WK2WD
	oTrowuQ32Q/HbVSYBXEoDHdBV0uU9zZoCdT0DDvI+/GHlRrDs7ILODl1NWFWIBQPqpH
	gEdl6SLZSsXKmbqW5oV2i7OoyJmnhj4LuCYrcUzY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588962;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LqnON1TAle59VKumKQM+33/MqtblT6/Ua6yw016fMDQ=;
	b=d3UNf7VviBGgCQvQKDjxmlqeoQjeXgw4lqEBUYSxA5hpE4R1aSQUN7+xlFEfzPtu
	/o1TlXGSeTUto941dt2mrYxX062ehyZkoe2T6cVSWdkJU9YfG65lU9EIUsilpfwuA6Z
	xgMhiy3QAXUw0NBK0AoPyDJH1IPXWRE+27eE+E6k=
Content-Type: multipart/mixed; boundary="===============0628951132366764936=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex,python3-pycryptodome: upgrading to
 3.21.0,3.21.0 SUCCEEDED
Message-ID: <0101019277ee5b97-027088a3-7e89-4ba8-bfe6-b5442ffa3d3b-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205503

--===============0628951132366764936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodomex,python3-pycryptodome* to *3.21.0,3.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-python3-pycryptodome-upgrade-3.patch
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
From 3ae01303e6a2486923938c7456cb399bb662ed80 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 11:40:37 +0000
Subject: [PATCH] python3-pycryptodomex,python3-pycryptodome: upgrade 3.20.0 ->
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


--===============0628951132366764936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 1150512 to 1310024 (+14%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: removed "/usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTe
 st/PublicKey/test_ECC_Curve25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pycryptodome-3.20.0.dist-info -> /usr/lib/python3.12/site-packages/pycryptodome-3.21.0.dist-info, removed "/usr/lib/python3.12/site-packages/Crypto/PublicKey/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_nist_ecc.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve448.abi3.so /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_curve.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_edwards.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve25519.abi3.so /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_point.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_montgomery.py /
 usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/_edwards.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.pyi /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_montgomery.cpython-312.pyc"
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
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: FILELIST: removed "/usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypt
 odome/SelfTest/PublicKey/test_import_Curve448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_import_Curve25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pycryptodomex-3.20.0.dist-info -> /usr/lib/python3.12/site-packages/pycryptodomex-3.21.0.dist-info, removed "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_curve.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_point.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve25519.abi3.so /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_edwards.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_point.pyi /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_edwards.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pyc
 ache__/_montgomery.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve448.abi3.so /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_montgomery.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_nist_ecc.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_point.cpython-312.pyc"
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

--===============0628951132366764936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.20.0.tar.gz;downloadfilename=pycryptodome-3.20.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.21.0.tar.gz;downloadfilename=pycryptodome-3.21.0.tar.gz"
packages/core2-64-poky-linux/python3-pycryptodome: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: FILELIST: removed "/usr/lib/python3.12/site-packages/Crypto/PublicKey/.debug/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Crypto/PublicKey/.debug/_curve25519.abi3.so /usr/lib/python3.12/site-packages/Crypto/PublicKey/.debug/_curve448.abi3.so"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 1150512 to 1310024 (+14%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: FILELIST: directory renamed /usr/src/debug/python3-pycryptodome/3.20.0/src/libtom -> /usr/src/debug/python3-pycryptodome/3.21.0/src/libtom, removed "/usr/src/debug/python3-pycryptodome/3.20.0/src/p521_table.h /usr/src/debug/python3-pycryptodome/3.20.0/src/CAST.c /usr/src/debug/python3-pycryptodome/3.20.0/src/cast5.c /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_cfb.c /usr/src/debug/python3-pycryptodome/3.20.0/src/blake2b.c /usr/src/debug/python3-pycryptodome/3.20.0/src/block_base.h /usr/src/debug/python3-pycryptodome/3.20.0/src/p521_table.c /usr/src/debug/python3-pycryptodome/3.20.0/src/blowfish_init.c /usr/src/debug/python3-pycryptodome/3.20.0/src/modexp_utils.h /usr/src/debug/python3-pycryptodome/3.20.0/src/scrypt.c /usr/src/debug/python3-pycryptodome/3.20.0/src/SHA384.c /usr/src/debug/python3-pycryptodome/3.20.0/src/cpuid.c /usr/src/debug/python3-pycryptodome/3.20.0/src/blake2.c /usr/src/debug/python3
 -pycryptodome/3.20.0/src/common.h /usr/src/debug/python3-pycryptodome/3.20.0/src/MD2.c /usr/src/debug/python3-pycryptodome/3.20.0/src/p256_table.h /usr/src/debug/python3-pycryptodome/3.20.0/src/ed448.h /usr/src/debug/python3-pycryptodome/3.20.0/src/modexp_utils.c /usr/src/debug/python3-pycryptodome/3.20.0/src/siphash.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ed448.c /usr/src/debug/python3-pycryptodome/3.20.0/src/block_common.c /usr/src/debug/python3-pycryptodome/3.20.0/src/p256_table.c /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_cbc.c /usr/src/debug/python3-pycryptodome/3.20.0/src/mod25519.c /usr/src/debug/python3-pycryptodome/3.20.0/src/poly1305.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ec.h /usr/src/debug/python3-pycryptodome/3.20.0/src/AES.c /usr/src/debug/python3-pycryptodome/3.20.0/src/AESNI.c /usr/src/debug/python3-pycryptodome/3.20.0/src/DES.c /usr/src/debug/python3-pycryptodome/3.20.0/src/mont.h /usr/src/debug/python3-pycryptodome/3.20.0/src/mont.c /usr/
 src/debug/python3-pycryptodome/3.20.0/src/raw_ctr.c /usr/src/debug/python3-pycryptodome/3.20.0/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodome/3.20.0/src/SHA512.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ed25519.c /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_ecb.c /usr/src/debug/python3-pycryptodome/3.20.0/src/Salsa20.c /usr/src/debug/python3-pycryptodome/3.20.0/src/blake2s.c /usr/src/debug/python3-pycryptodome/3.20.0/src/endianess.h /usr/src/debug/python3-pycryptodome/3.20.0/src/SHA256.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ed25519.h /usr/src/debug/python3-pycryptodome/3.20.0/src/bignum.c /usr/src/debug/python3-pycryptodome/3.20.0/src/modexp.c /usr/src/debug/python3-pycryptodome/3.20.0/src/MD4.c /usr/src/debug/python3-pycryptodome/3.20.0/src/RIPEMD160.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ec_ws.c /usr/src/debug/python3-pycryptodome/3.20.0/src/MD5.c /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_ocb.c /usr/src/debug/python3-pycryptod
 ome/3.20.0/src/multiply.h /usr/src/debug/python3-pycryptodome/3.20.0/src/keccak.c /usr/src/debug/python3-pycryptodome/3.20.0/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ARC4.c /usr/src/debug/python3-pycryptodome/3.20.0/src/SHA224.c /usr/src/debug/python3-pycryptodome/3.20.0/src/strxor.c /usr/src/debug/python3-pycryptodome/3.20.0/src/blowfish.c /usr/src/debug/python3-pycryptodome/3.20.0/src/p384_table.c /usr/src/debug/python3-pycryptodome/3.20.0/src/SHA1.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ARC2.c /usr/src/debug/python3-pycryptodome/3.20.0/src/multiply_64.c /usr/src/debug/python3-pycryptodome/3.20.0/src/x25519.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ghash_clmul.c /usr/src/debug/python3-pycryptodome/3.20.0/src/ghash_portable.c /usr/src/debug/python3-pycryptodome/3.20.0/src/p384_table.h /usr/src/debug/python3-pycryptodome/3.20.0/src/raw_ofb.c /usr/src/debug/python3-pycryptodome/3.20.0/src/chacha20.c", added "/usr/src/debug/python3-pycryptodome
 /3.21.0/src/p521_table.h /usr/src/debug/python3-pycryptodome/3.21.0/src/CAST.c /usr/src/debug/python3-pycryptodome/3.21.0/src/cast5.c /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_cfb.c /usr/src/debug/python3-pycryptodome/3.21.0/src/blake2b.c /usr/src/debug/python3-pycryptodome/3.21.0/src/block_base.h /usr/src/debug/python3-pycryptodome/3.21.0/src/p521_table.c /usr/src/debug/python3-pycryptodome/3.21.0/src/blowfish_init.c /usr/src/debug/python3-pycryptodome/3.21.0/src/modexp_utils.h /usr/src/debug/python3-pycryptodome/3.21.0/src/scrypt.c /usr/src/debug/python3-pycryptodome/3.21.0/src/SHA384.c /usr/src/debug/python3-pycryptodome/3.21.0/src/cpuid.c /usr/src/debug/python3-pycryptodome/3.21.0/src/blake2.c /usr/src/debug/python3-pycryptodome/3.21.0/src/common.h /usr/src/debug/python3-pycryptodome/3.21.0/src/MD2.c /usr/src/debug/python3-pycryptodome/3.21.0/src/p256_table.h /usr/src/debug/python3-pycryptodome/3.21.0/src/ed448.h /usr/src/debug/python3-pycryptodome/3.21.0/src/modexp_uti
 ls.c /usr/src/debug/python3-pycryptodome/3.21.0/src/siphash.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ed448.c /usr/src/debug/python3-pycryptodome/3.21.0/src/block_common.c /usr/src/debug/python3-pycryptodome/3.21.0/src/p256_table.c /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_cbc.c /usr/src/debug/python3-pycryptodome/3.21.0/src/mod25519.c /usr/src/debug/python3-pycryptodome/3.21.0/src/poly1305.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ec.h /usr/src/debug/python3-pycryptodome/3.21.0/src/AES.c /usr/src/debug/python3-pycryptodome/3.21.0/src/AESNI.c /usr/src/debug/python3-pycryptodome/3.21.0/src/DES.c /usr/src/debug/python3-pycryptodome/3.21.0/src/mont.h /usr/src/debug/python3-pycryptodome/3.21.0/src/mont.c /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_ctr.c /usr/src/debug/python3-pycryptodome/3.21.0/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodome/3.21.0/src/SHA512.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ed25519.c /usr/src/debug/python3-pyc
 ryptodome/3.21.0/src/raw_ecb.c /usr/src/debug/python3-pycryptodome/3.21.0/src/Salsa20.c /usr/src/debug/python3-pycryptodome/3.21.0/src/blake2s.c /usr/src/debug/python3-pycryptodome/3.21.0/src/curve25519.c /usr/src/debug/python3-pycryptodome/3.21.0/src/endianess.h /usr/src/debug/python3-pycryptodome/3.21.0/src/SHA256.c /usr/src/debug/python3-pycryptodome/3.21.0/src/curve25519.h /usr/src/debug/python3-pycryptodome/3.21.0/src/ed25519.h /usr/src/debug/python3-pycryptodome/3.21.0/src/bignum.c /usr/src/debug/python3-pycryptodome/3.21.0/src/modexp.c /usr/src/debug/python3-pycryptodome/3.21.0/src/MD4.c /usr/src/debug/python3-pycryptodome/3.21.0/src/RIPEMD160.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ec_ws.c /usr/src/debug/python3-pycryptodome/3.21.0/src/MD5.c /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_ocb.c /usr/src/debug/python3-pycryptodome/3.21.0/src/curve448.h /usr/src/debug/python3-pycryptodome/3.21.0/src/multiply.h /usr/src/debug/python3-pycryptodome/3.21.0/src/keccak.c
  /usr/src/debug/python3-pycryptodome/3.21.0/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ARC4.c /usr/src/debug/python3-pycryptodome/3.21.0/src/curve448.c /usr/src/debug/python3-pycryptodome/3.21.0/src/SHA224.c /usr/src/debug/python3-pycryptodome/3.21.0/src/strxor.c /usr/src/debug/python3-pycryptodome/3.21.0/src/blowfish.c /usr/src/debug/python3-pycryptodome/3.21.0/src/p384_table.c /usr/src/debug/python3-pycryptodome/3.21.0/src/SHA1.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ARC2.c /usr/src/debug/python3-pycryptodome/3.21.0/src/multiply_64.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ghash_clmul.c /usr/src/debug/python3-pycryptodome/3.21.0/src/ghash_portable.c /usr/src/debug/python3-pycryptodome/3.21.0/src/p384_table.h /usr/src/debug/python3-pycryptodome/3.21.0/src/raw_ofb.c /usr/src/debug/python3-pycryptodome/3.21.0/src/chacha20.c"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2778758 to 2800915 (+1%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: removed "/usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Ed25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve25519.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/Publ
 icKey/test_ECC_Ed448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_ECC_Curve448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve448.py /usr/lib/python3.12/site-packages/Crypto/SelfTest/PublicKey/test_import_Curve25519.py"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 2849613 to 3006823 (+6%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pycryptodome-3.20.0.dist-info -> /usr/lib/python3.12/site-packages/pycryptodome-3.21.0.dist-info, removed "/usr/lib/python3.12/site-packages/Crypto/PublicKey/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve448.abi3.so /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/_edwards.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/_nist_ecc.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_curve.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_point.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_montgomery.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/_curve25519.abi3.so /usr/lib/python3.12/site-p
 ackages/Crypto/PublicKey/__pycache__/_montgomery.cpython-312.pyc /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.pyi /usr/lib/python3.12/site-packages/Crypto/PublicKey/_point.py /usr/lib/python3.12/site-packages/Crypto/PublicKey/__pycache__/_edwards.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3519872 to 3630020 (+3%)
packages/core2-64-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
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
packages/core2-64-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.20.0.tar.gz;downloadfilename=pycryptodomex-3.20.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.21.0.tar.gz;downloadfilename=pycryptodomex-3.21.0.tar.gz"
packages/core2-64-poky-linux/python3-pycryptodomex: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: FILELIST: removed "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/.debug/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/.debug/_curve448.abi3.so /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/.debug/_curve25519.abi3.so"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 1150608 to 1310144 (+14%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: FILELIST: directory renamed /usr/src/debug/python3-pycryptodomex/3.20.0/src/libtom -> /usr/src/debug/python3-pycryptodomex/3.21.0/src/libtom, removed "/usr/src/debug/python3-pycryptodomex/3.20.0/src/ed25519.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ed25519.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/chacha20.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/poly1305.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/SHA512.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/blowfish.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/blake2.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/Salsa20.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/p256_table.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/endianess.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/SHA
 1.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/multiply.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/ed448.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/SHA224.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ARC2.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/SHA256.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ed448.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/MD5.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/mod25519.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/modexp.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/x25519.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/AES.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/p521_table.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_cbc.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_cfb.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_ctr.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_ecb.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/raw_ocb.c /usr/src/debug/python
 3-pycryptodomex/3.20.0/src/raw_ofb.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/block_base.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/scrypt.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/mont.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/AESNI.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/blowfish_init.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/cpuid.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/blake2b.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/blake2s.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/CAST.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/DES.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/modexp_utils.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/keccak.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ec.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/ghash_portable.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/SHA384.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/modexp_utils.c /usr/src/debug/python3-pycry
 ptodomex/3.20.0/src/block_common.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/strxor.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/p256_table.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ec_ws.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/MD4.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/RIPEMD160.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/multiply_64.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ARC4.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/ghash_clmul.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/MD2.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/siphash.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/common.h /usr/src/debug/python3-pycryptodomex/3.20.0/src/mont.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/bignum.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/p521_table.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/cast5.c /usr/src/debug/python3-pycryptodomex/3.20.0/src/p384_table.h /usr/src/debug/python3-pycryptodomex
 /3.20.0/src/p384_table.c", added "/usr/src/debug/python3-pycryptodomex/3.21.0/src/RIPEMD160.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/curve448.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ed25519.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/multiply_64.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/MD2.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/DES.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/Salsa20.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/CAST.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/block_common.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ed25519.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/SHA512.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/modexp.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/cpuid.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/poly1305.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ghash_clmul.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/hash_SHA2_template.c /usr/src/debug/python3
 -pycryptodomex/3.21.0/src/blake2.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_cbc.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_cfb.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_ctr.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_ecb.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_ocb.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/raw_ofb.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/scrypt.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/curve25519.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/cast5.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/endianess.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/ARC4.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/modexp_utils.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/AESNI.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/blowfish.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/SHA384.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/modexp_utils.c /usr/src/debug/python3-pycr
 yptodomex/3.21.0/src/strxor.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/mod25519.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/p521_table.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/p384_table.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/mont.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/block_base.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/blowfish_init.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/p256_table.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/SHA224.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/p256_table.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/AES.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/mont.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ec_ws.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/multiply.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/p384_table.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/p521_table.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/MD5.c /usr/src/debug/python3-pycr
 yptodomex/3.21.0/src/ed448.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/ec.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/keccak.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ed448.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/ARC2.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/siphash.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/SHA256.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/bignum.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/SHA1.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/blake2s.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/common.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/curve448.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/ghash_portable.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/curve25519.h /usr/src/debug/python3-pycryptodomex/3.21.0/src/blake2b.c /usr/src/debug/python3-pycryptodomex/3.21.0/src/chacha20.c /usr/src/debug/python3-pycryptodomex/3.2
 1.0/src/MD4.c"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGSIZE changed from 2778758 to 2800915 (+1%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: FILELIST: removed "/usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_448.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_25519.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Curve25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_ECC_Ed25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey
 /test_import_Curve448.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/test_import_Curve25519.py /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve25519.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_import_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Curve448.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/SelfTest/PublicKey/__pycache__/test_ECC_Ed448.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 2853585 to 3010987 (+6%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pycryptodomex-3.20.0.dist-info -> /usr/lib/python3.12/site-packages/pycryptodomex-3.21.0.dist-info, removed "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_x25519.abi3.so", added "/usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve25519.abi3.so /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_montgomery.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_montgomery.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_point.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_point.pyi /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_nist_ecc.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_edwards.py /usr/lib/python3.12/site-packages/Cryptodome/PublicK
 ey/_point.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_nist_ecc.py /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/_curve448.abi3.so /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_curve.cpython-312.pyc /usr/lib/python3.12/site-packages/Cryptodome/PublicKey/__pycache__/_edwards.cpython-312.pyc"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.20.0" to "3.21.0"
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3525621 to 3635989 (+3%)
packages/core2-64-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.20.0 [default] to 3.21.0 [default]
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

--===============0628951132366764936==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-python3-pycryptodome-upgrade-3.patch"

RnJvbSAzYWUwMTMwM2U2YTI0ODY5MjM5MzhjNzQ1NmNiMzk5YmI2NjJlZDgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTE6NDA6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3J5cHRvZG9tZXgscHl0aG9uMy1weWNyeXB0b2RvbWU6IHVwZ3JhZGUgMy4yMC4w
IC0+CiAzLjIxLjAsMy4yMC4wIC0+IDMuMjEuMAoKLS0tCiAuLi5uMy1weWNyeXB0b2RvbWVfMy4y
MC4wLmJiID0+IHB5dGhvbjMtcHljcnlwdG9kb21lXzMuMjEuMC5iYn0gfCAyICstCiAuLi4tcHlj
cnlwdG9kb21leF8zLjIwLjAuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjEuMC5iYn0g
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y3J5cHRvZG9t
ZV8zLjIwLjAuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMS4wLmJifSAoNDQlKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21leF8z
LjIwLjAuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjEuMC5iYn0gKDcxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21l
XzMuMjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0
b2RvbWVfMy4yMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNDQlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4yMC4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMu
MjEuMC5iYgppbmRleCA2YzkzYzIwNWFjLi43NzY2NGIyMmE1IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMjAuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMjEu
MC5iYgpAQCAtMSw1ICsxLDUgQEAKIHJlcXVpcmUgcHl0aG9uLXB5Y3J5cHRvZG9tZS5pbmMKIGlu
aGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMDk2MDkyMDllZDdkZTYxYzJiNTYwY2M1YzhjNGZiZjg5MmY4YjE1YjFmYWY3ZTRjYmZmYWM5
N2RiMWZmZmRhNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNzc4N2UwZDQ2OWJkYWU3NjNiODc2
MTc0Y2YyZTZjMGY3YmU3OTgwOGFmMjZiMWRhOTZmMWE2NGJjZjQ3Mjk3IgogCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjIw
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21l
eF8zLjIxLjAuYmIKc2ltaWxhcml0eSBpbmRleCA3MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yMC4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21leF8zLjIx
LjAuYmIKaW5kZXggNTQ1NzhkMjg1MC4uZTVmYjAwMGQ5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZXhfMy4yMC4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMjEu
MC5iYgpAQCAtMSw3ICsxLDcgQEAKIHJlcXVpcmUgcHl0aG9uLXB5Y3J5cHRvZG9tZS5pbmMKIGlu
aGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiN2E3MTBiNzliYWRkZDY1YjgwNjQwMmUxNDc2NmM3MjFhZWU4ZmI4MzM4MTc2OWMyNzkyMGYy
NjQ3NjI3NmMxZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMjJkMGJkMDUzODFkZDI1YzMyZGQ2
MDY1YzA3MWViZjA4NDIxMmFiNzliYWI0NTk5YmE5ZTZhM2UwMDA5ZTZjIgogCiBGSUxFUzoke1BO
fS10ZXN0cyA9ICIgXAogICAgICR7UFlUSE9OX1NJVEVQQUNLQUdFU19ESVJ9L0NyeXB0b2RvbWUv
U2VsZlRlc3QvIFwKLS0gCjIuNDQuMQoK

--===============0628951132366764936==--

