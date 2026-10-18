Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F5BCCF2CF
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:33:57 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9656.1792301629719884616
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ganFxOLu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rtxs3vdW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a14d807d9b-c40162ed-3997-439a-b558-d9b865d851fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792301629;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xn5tRSACbYNW9xWaS4EnqBsC70kxynOHGj19GxoTpTw=;
	b=ganFxOLuMUu+5rz4UvcdkpJf0hu9GrAWwDEz1e7gHQ+A8nZFkE0c7d82JSTAXDY6
	e5j7PRwlXe4+KjPFLIDytkInejLcS/9A2R65AAUe7kFCr0VuSDFJOLC9j7bBldioMKL
	Jat0MGCq/TuDit1t/+vekD4K2dNln3aSUOhpwUOc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792301629;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xn5tRSACbYNW9xWaS4EnqBsC70kxynOHGj19GxoTpTw=;
	b=rtxs3vdWH6wouuU2BPmGo8yvUm80B60dHHt0gbfyMUx0Mf950VRMS2nMIMtbKJw2
	GK6h0+sv0GM8WQvCoaMLmr40p/X2f1OO1hVUVXfsyj0JIOFxEfJfEiO2xYsGycPD08h
	42ZBnJBXC8GjK21j+ftE2JnCzFXVaIXOmKHiGOak=
Content-Type: multipart/mixed; boundary="===============3359945851206675267=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome: upgrading to 4.0.1 SUCCEEDED
Message-ID: <010101a14d807d9b-c40162ed-3997-439a-b558-d9b865d851fd-000000@us-west-2.amazonses.com>
Date: Sun, 18 Oct 2026 05:33:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 05:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248102

--===============3359945851206675267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pycryptodome* to *4.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-upgrade-3.24.1-4.0.1.patch
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
From f1e6657624a5a84d790a21c7de32842cdefe3c54 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 18 Oct 2026 05:07:46 +0000
Subject: [PATCH] python3-pycryptodome: upgrade 3.24.1 -> 4.0.1

4.0.1(17 October 2026)

New features
------------

4.0.0 (14 October 2026)

Breaking changes
----------------

Deprecations
------------

Resolved issues
---------------

New features
------------
---
 .../python/python-pycryptodome.inc            |  2 +-
 ....24.1.bb => python3-pycryptodome_4.0.1.bb} | 26 ++++++++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.24.1.bb => python3-pycryptodome_4.0.1.bb} (11%)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index a0181874cd..6d334a689f 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
 HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "BSD-2-Clause AND Unlicense"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ddd4ccc573346f98658e0059890f9da8"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_4.0.1.bb
similarity index 11%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_4.0.1.bb
index 0aa53559d6..4503d59629 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.24.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_4.0.1.bb
@@ -1,6 +1,30 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.rst
+# +++ LICENSE.rst
+# @@ -3,6 +3,10 @@
+#  
+#  In either case, there are minimal if no restrictions on the redistribution,
+#  modification and usage of the software.
+# +
+# +Files that do not include the license text refer to it with an SPDX tag:
+# +``SPDX-License-Identifier: BSD-2-Clause`` for the BSD license below
+# +(``SPDX-FileCopyrightText`` gives the copyright notice).
+#  
+#  Public domain
+#  =============
+# 
+#
+
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3f9e74444c0ecbec7af232a95d282c74b114d53212ce075ed17b7fd7dca32bb3"
+SRC_URI[sha256sum] = "9981c68e717db5e841a74c4b33016d25f7d9beb8f7dd55c4dc844b9b42c08150"
 
 CVE_PRODUCT = "pycryptodome:pycryptodome"
-- 
2.47.1


--===============3359945851206675267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 2277640 to 3506600 (+54%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2805378 to 795910 (-72%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: removed "/usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modmult.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modexp.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modmult.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modexp.py", added "/usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_raw_api.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/plugin.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_cpu_features.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_shared_objects.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_shared_objects.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_shared_objects.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_threads.py /usr/lib/python3.14/
 site-packages/Crypto/SelfTest/Cipher/__pycache__/test_message_too_long.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/__pycache__/plugin.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_threads.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_raw_api.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_nat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_message_too_long.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_passphrase.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_nat.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_shared_objects.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_passphrase.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_cpu_features.cpyth
 on-314.pyc"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info -> /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info, removed "/usr/lib/python3.14/site-packages/Crypto/Hash/MD4.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cfb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ecb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ocb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ofb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/Salsa20.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD160.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/Blowfish.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/RSA.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/DSA.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/ECC.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA1.pyi /usr/lib/python3.14/site-packages/Crypto/H
 ash/TupleHash128.pyi /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/LICENSE.rst /usr/lib/python3.14/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.14/site-packages/Crypto/Util/number.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_openpgp.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_OAEP.pyi /usr/lib/python3.14/site-packages/Crypto/Util/RFC1751.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/DSS.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/pss.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC2.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_raw_api.pyi /usr/lib/python3.14/site-packages/Crypto/IO/PEM.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_file_system.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD5.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KangarooTwelve.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.py /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCu
 stom.py /usr/lib/python3.14/site-packages/Crypto/Random/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_PSS.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cbc.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/DES3.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_cpu_features.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2b.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2s.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC256.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/DES.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_v1_5.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA224.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_ws.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerCustom.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Protocol/DH.pyi /usr/l
 ib/python3.14/site-packages/Crypto/Cipher/ARC4.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ccm.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_gcm.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE128.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/AES.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Util/strxor.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_EKSBlowfish.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/__init__.pyi /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/AUTHORS.rst /usr/lib/python3.14/site-packages/Crypto/Protocol/SecretSharing.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20.pyi /usr/lib/python3.14/site-packages/Crypto/Util/Padding.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/pkcs1_15.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD.pyi 
 /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerGMP.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Math/Primality.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_224.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_256.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_384.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_512.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ctr.pyi /usr/lib/python3.14/site-packages/Crypto/IO/_PBES.pyi /usr/lib/python3.14/site-packages/Crypto/Util/Counter.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNative.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/KDF.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_eax.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.pyi /usr/lib/python3.14/site-packages/Crypto/Random/random.pyi /usr/lib/python3.
 14/site-packages/Crypto/IO/PKCS8.pyi /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.py /usr/lib/python3.14/site-packages/Crypto/Protocol/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20_Poly1305.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/CMAC.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/HMAC.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/Poly1305.pyi /usr/lib/python3.14/site-packages/Crypto/Math/Numbers.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerBase.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD2.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/py3compat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Hash/SHA512.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_point.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/keccak.pyi /usr/lib/python3.14/site-packages/Crypto/Util/asn
 1.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_curve448.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/CAST.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ed448.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/SHA256.pyi /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/eddsa.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_siv.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_openssh.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/ElGamal.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash256.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_v1_5.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA384.pyi", added "/usr/lib/python3.14/site-packages/Crypto/Hash/_kecca
 k_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_threads.cpython-314.pyc /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/licenses/LICENSE.rst /usr/lib/python3.14/site-packages/Crypto/Util/_bytes.py /usr/lib/python3.14/site-packages/Crypto/Hash/_k12.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/_state_machine.py /usr/lib/python3.14/site-packages/Crypto/Math/_nat_bmi2_adx.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat_bmi2_adx.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/oaep.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_bytes.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_lib.py /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerNat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/_k12_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypt
 o/Util/_threads.py /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/_ec_lib.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Math/_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/_chacha20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/_Salsa20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/_state_machine.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA224_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA256_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/oaep.py /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNat.py"
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_chacha20_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/oaep.py was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/oaep.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/_state_machine.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_Salsa20_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_state_machine.py was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_k12.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_k12_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_keccak_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA224_shani.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA256_shani.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNat.py was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_nat.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_nat_bmi2_adx.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerNat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_lib.py was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat_bmi2_adx.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/_ec_lib.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_message_too_long.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_shared_objects.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_message_too_long.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_shared_objects.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_shared_objects.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_shared_objects.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_nat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_nat.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/plugin.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_passphrase.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_passphrase.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/__pycache__/plugin.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_cpu_features.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_raw_api.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_threads.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_cpu_features.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_raw_api.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_threads.py was added
  /usr/lib/python3.14/site-packages/Crypto/Util/_bytes.py was added
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_bytes.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_threads.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Util/_threads.py was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/licenses/LICENSE.rst was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/AES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC2.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC4.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/Blowfish.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/CAST.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20_Poly1305.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/DES3.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/DES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_EKSBlowfish.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cbc.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ccm.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cfb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ctr.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_eax.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ecb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_gcm.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ocb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ofb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_openpgp.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_siv.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_OAEP.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_v1_5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/Salsa20.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2b.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2s.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/CMAC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/HMAC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KangarooTwelve.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/keccak.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD2.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD4.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/Poly1305.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD160.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA1.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA224.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_224.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_384.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_512.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA384.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA512.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/_PBES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/PEM.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/PKCS8.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerBase.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNative.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_modexp.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/Numbers.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/Primality.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerCustom.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerGMP.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/DH.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/KDF.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/SecretSharing.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_curve448.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/DSA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/ECC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_ws.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ed448.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/ElGamal.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_openssh.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_point.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/RSA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Random/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Random/random.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modexp.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modmult.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modexp.py was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modmult.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/DSS.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/eddsa.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/pkcs1_15.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_PSS.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_v1_5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/pss.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/asn1.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/Counter.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_cpu_features.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_file_system.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/number.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/Padding.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/py3compat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_raw_api.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/RFC1751.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/strxor.pyi was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/AUTHORS.rst was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/LICENSE.rst was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/WHEEL was removed

--===============3359945851206675267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pycryptodome-changelog.txt"

4.0.1(17 October 2026)

New features
------------

4.0.0 (14 October 2026)

Breaking changes
----------------

Deprecations
------------

Resolved issues
---------------

New features
------------

--===============3359945851206675267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pycryptodome: PV changed from "3.24.1" to "4.0.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.24.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-4.0.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pycryptodome: PKGV changed from 3.24.1 [default] to 4.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.24.1" to "4.0.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.24.1 [default] to 4.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 2277640 to 3506600 (+54%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: FILELIST: removed "/usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_curve448.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_ec_ws.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_ed448.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/.debug/_modexp.abi3.so", added "/usr/lib/python3.14/site-packages/Crypto/Cipher/.debug/_chacha20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/.debug/_SHA256_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/.debug/_k12.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/.debug/_nat_bmi2_adx.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/.debug/_k12_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_ec_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Math/.debug/_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/.debug/_keccak_avx2_bmi2.abi3.so /usr/lib
 /python3.14/site-packages/Crypto/Hash/.debug/_SHA224_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/.debug/_Salsa20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/.debug/_ec_nat_bmi2_adx.abi3.so"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.24.1" to "4.0.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.24.1 [default] to 4.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.24.1" to "4.0.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.24.1 [default] to 4.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.24.1" to "4.0.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.24.1 [default] to 4.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.24.1" to "4.0.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.24.1 [default] to 4.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2805378 to 795910 (-72%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-src: FILELIST: removed "/usr/src/debug/python3-pycryptodome/3.24.1/src/p521_table.c /usr/src/debug/python3-pycryptodome/3.24.1/src/chacha20.c /usr/src/debug/python3-pycryptodome/3.24.1/src/p521_table.h /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_ctr.c /usr/src/debug/python3-pycryptodome/3.24.1/src/bignum.c /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_cfb.c /usr/src/debug/python3-pycryptodome/3.24.1/src/mont.h /usr/src/debug/python3-pycryptodome/3.24.1/src/MD4.c /usr/src/debug/python3-pycryptodome/3.24.1/src/mont.c /usr/src/debug/python3-pycryptodome/3.24.1/src/cast5.c /usr/src/debug/python3-pycryptodome/3.24.1/src/keccak.c /usr/src/debug/python3-pycryptodome/3.24.1/src/RIPEMD160.c /usr/src/debug/python3-pycryptodome/3.24.1/src/p384_table.h /usr/src/debug/python3-pycryptodome/3.24.1/src/siphash.c /usr/src/debug/python3-pycryptodome/3.24.1/src/p384_table.c /usr/src/debug/python3-pycryptodome/3.24.1/src
 /SHA512.c /usr/src/debug/python3-pycryptodome/3.24.1/src/blowfish_init.c /usr/src/debug/python3-pycryptodome/3.24.1/src/curve448.c /usr/src/debug/python3-pycryptodome/3.24.1/src/curve448.h /usr/src/debug/python3-pycryptodome/3.24.1/src/multiply.h /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_ecb.c /usr/src/debug/python3-pycryptodome/3.24.1/src/scrypt.c /usr/src/debug/python3-pycryptodome/3.24.1/src/Salsa20.c /usr/src/debug/python3-pycryptodome/3.24.1/src/curve25519.c /usr/src/debug/python3-pycryptodome/3.24.1/src/cpuid.c /usr/src/debug/python3-pycryptodome/3.24.1/src/curve25519.h /usr/src/debug/python3-pycryptodome/3.24.1/src/strxor.c /usr/src/debug/python3-pycryptodome/3.24.1/src/blake2s.c /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_ofb.c /usr/src/debug/python3-pycryptodome/3.24.1/src/endianess.h /usr/src/debug/python3-pycryptodome/3.24.1/src/DES3.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ARC4.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ghash_clmul.c /usr/sr
 c/debug/python3-pycryptodome/3.24.1/src/blowfish_eks.c /usr/src/debug/python3-pycryptodome/3.24.1/src/MD5.c /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_cbc.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ed448.h /usr/src/debug/python3-pycryptodome/3.24.1/src/ed448.c /usr/src/debug/python3-pycryptodome/3.24.1/src/libtom/tomcrypt_des.c /usr/src/debug/python3-pycryptodome/3.24.1/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ghash_portable.c /usr/src/debug/python3-pycryptodome/3.24.1/src/mont3.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ec.h /usr/src/debug/python3-pycryptodome/3.24.1/src/mont1.c /usr/src/debug/python3-pycryptodome/3.24.1/src/libtom/tomcrypt_macros.h /usr/src/debug/python3-pycryptodome/3.24.1/src/p256_table.c /usr/src/debug/python3-pycryptodome/3.24.1/src/raw_ocb.c /usr/src/debug/python3-pycryptodome/3.24.1/src/p256_table.h /usr/src/debug/python3-pycryptodome/3.24.1/src/SHA224.c /usr/src/debug/python3-pycryptodome/3.24.1/src/libtom/
 tomcrypt.h /usr/src/debug/python3-pycryptodome/3.24.1/src/ed25519.h /usr/src/debug/python3-pycryptodome/3.24.1/src/SHA256.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ed25519.c /usr/src/debug/python3-pycryptodome/3.24.1/src/blowfish.c /usr/src/debug/python3-pycryptodome/3.24.1/src/block_common.c /usr/src/debug/python3-pycryptodome/3.24.1/src/block_base.h /usr/src/debug/python3-pycryptodome/3.24.1/src/modexp_utils.c /usr/src/debug/python3-pycryptodome/3.24.1/src/mont2.c /usr/src/debug/python3-pycryptodome/3.24.1/src/modexp_utils.h /usr/src/debug/python3-pycryptodome/3.24.1/src/blake2b.c /usr/src/debug/python3-pycryptodome/3.24.1/src/multiply_64.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ARC2.c /usr/src/debug/python3-pycryptodome/3.24.1/src/modexp.c /usr/src/debug/python3-pycryptodome/3.24.1/src/common.h /usr/src/debug/python3-pycryptodome/3.24.1/src/libtom/tomcrypt_cipher.h /usr/src/debug/python3-pycryptodome/3.24.1/src/blake2.c /usr/src/debug/python3-pycryptodome/3.24.1/sr
 c/MD2.c /usr/src/debug/python3-pycryptodome/3.24.1/src/AESNI.c /usr/src/debug/python3-pycryptodome/3.24.1/src/AES.c /usr/src/debug/python3-pycryptodome/3.24.1/src/DES.c /usr/src/debug/python3-pycryptodome/3.24.1/src/ec_ws.c /usr/src/debug/python3-pycryptodome/3.24.1/src/mod25519.c /usr/src/debug/python3-pycryptodome/3.24.1/src/poly1305.c /usr/src/debug/python3-pycryptodome/3.24.1/src/CAST.c /usr/src/debug/python3-pycryptodome/3.24.1/src/SHA1.c /usr/src/debug/python3-pycryptodome/3.24.1/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodome/3.24.1/src/SHA384.c", added "/usr/src/debug/python3-pycryptodome/4.0.1/src/MD2.c /usr/src/debug/python3-pycryptodome/4.0.1/src/k12.c /usr/src/debug/python3-pycryptodome/4.0.1/src/blake2s.c /usr/src/debug/python3-pycryptodome/4.0.1/src/MD4.c /usr/src/debug/python3-pycryptodome/4.0.1/src/SHA384.c /usr/src/debug/python3-pycryptodome/4.0.1/src/block_common.c /usr/src/debug/python3-pycryptodome/4.0.1/src/blowfish_init.c /usr/src/debug/python3-pycryptod
 ome/4.0.1/src/keccak.c /usr/src/debug/python3-pycryptodome/4.0.1/src/des_tables.h /usr/src/debug/python3-pycryptodome/4.0.1/src/ghash_clmul.c /usr/src/debug/python3-pycryptodome/4.0.1/src/blowfish_eks.c /usr/src/debug/python3-pycryptodome/4.0.1/src/scrypt.c /usr/src/debug/python3-pycryptodome/4.0.1/src/endianess.h /usr/src/debug/python3-pycryptodome/4.0.1/src/nat_prime.c /usr/src/debug/python3-pycryptodome/4.0.1/src/siphash.h /usr/src/debug/python3-pycryptodome/4.0.1/src/blake2b.c /usr/src/debug/python3-pycryptodome/4.0.1/src/SHA224.c /usr/src/debug/python3-pycryptodome/4.0.1/src/ghash_portable.c /usr/src/debug/python3-pycryptodome/4.0.1/src/pkcs1_decode.c /usr/src/debug/python3-pycryptodome/4.0.1/src/raw_ctr.c /usr/src/debug/python3-pycryptodome/4.0.1/src/mod25519.c /usr/src/debug/python3-pycryptodome/4.0.1/src/ARC4.c /usr/src/debug/python3-pycryptodome/4.0.1/src/blake2.c /usr/src/debug/python3-pycryptodome/4.0.1/src/keccak_avx2_bmi2.c /usr/src/debug/python3-pycryptodome/4.0.1/src/
 nat_gcd.c /usr/src/debug/python3-pycryptodome/4.0.1/src/Salsa20_avx2_bmi2.c /usr/src/debug/python3-pycryptodome/4.0.1/src/CAST.c /usr/src/debug/python3-pycryptodome/4.0.1/src/salsa20_core.h /usr/src/debug/python3-pycryptodome/4.0.1/src/chacha20_avx2_bmi2.c /usr/src/debug/python3-pycryptodome/4.0.1/src/ed25519.h /usr/src/debug/python3-pycryptodome/4.0.1/src/AESNI.c /usr/src/debug/python3-pycryptodome/4.0.1/src/ed25519.c /usr/src/debug/python3-pycryptodome/4.0.1/src/ec_nat_bmi2_adx.c /usr/src/debug/python3-pycryptodome/4.0.1/src/nat_mod.c /usr/src/debug/python3-pycryptodome/4.0.1/src/SHA1.c /usr/src/debug/python3-pycryptodome/4.0.1/src/chacha20.c /usr/src/debug/python3-pycryptodome/4.0.1/src/cast5.c /usr/src/debug/python3-pycryptodome/4.0.1/src/nat_bmi2_adx.c /usr/src/debug/python3-pycryptodome/4.0.1/src/block_base.h /usr/src/debug/python3-pycryptodome/4.0.1/src/ec_field.h /usr/src/debug/python3-pycryptodome/4.0.1/src/cpuid.c /usr/src/debug/python3-pycryptodome/4.0.1/src/ec_special.h 
 /usr/src/debug/python3-pycryptodome/4.0.1/src/SHA224_shani.c /usr/src/debug/python3-pycryptodome/4.0.1/src/SHA256_shani.c /usr/src/debug/python3-pycryptodome/4.0.1/src/DES3.c /usr/src/debug/python3-pycryptodome/4.0.1/src/raw_cfb.c /usr/src/debug/python3-pycryptodome/4.0.1/src/curve448.c /usr/src/debug/python3-pycryptodome/4.0.1/src/SHA512.c /usr/src/debug/python3-pycryptodome/4.0.1/src/curve448.h /usr/src/debug/python3-pycryptodome/4.0.1/src/ARC2.c /usr/src/debug/python3-pycryptodome/4.0.1/src/poly1305.c /usr/src/debug/python3-pycryptodome/4.0.1/src/blowfish.c /usr/src/debug/python3-pycryptodome/4.0.1/src/common.h /usr/src/debug/python3-pycryptodome/4.0.1/src/raw_cbc.c /usr/src/debug/python3-pycryptodome/4.0.1/src/SHA256.c /usr/src/debug/python3-pycryptodome/4.0.1/src/nat_div.c /usr/src/debug/python3-pycryptodome/4.0.1/src/ec_nat.h /usr/src/debug/python3-pycryptodome/4.0.1/src/hash_SHA2_template.c /usr/src/debug/python3-pycryptodome/4.0.1/src/raw_ofb.c /usr/src/debug/python3-pycrypt
 odome/4.0.1/src/ec_nat.c /usr/src/debug/python3-pycryptodome/4.0.1/src/raw_ecb.c /usr/src/debug/python3-pycryptodome/4.0.1/src/RIPEMD160.c /usr/src/debug/python3-pycryptodome/4.0.1/src/MD5.c /usr/src/debug/python3-pycryptodome/4.0.1/src/strxor.c /usr/src/debug/python3-pycryptodome/4.0.1/src/ed25519_table.h /usr/src/debug/python3-pycryptodome/4.0.1/src/nat_ct.h /usr/src/debug/python3-pycryptodome/4.0.1/src/raw_ocb.c /usr/src/debug/python3-pycryptodome/4.0.1/src/keccak_x4_avx2.c /usr/src/debug/python3-pycryptodome/4.0.1/src/Salsa20.c /usr/src/debug/python3-pycryptodome/4.0.1/src/curve25519.h /usr/src/debug/python3-pycryptodome/4.0.1/src/ec_nat_module.c /usr/src/debug/python3-pycryptodome/4.0.1/src/curve25519.c /usr/src/debug/python3-pycryptodome/4.0.1/src/nat.c /usr/src/debug/python3-pycryptodome/4.0.1/src/nat_rows.c /usr/src/debug/python3-pycryptodome/4.0.1/src/ec_common.c /usr/src/debug/python3-pycryptodome/4.0.1/src/nat.h /usr/src/debug/python3-pycryptodome/4.0.1/src/ec_common.h /u
 sr/src/debug/python3-pycryptodome/4.0.1/src/ed448.h /usr/src/debug/python3-pycryptodome/4.0.1/src/AES.c /usr/src/debug/python3-pycryptodome/4.0.1/src/DES.c /usr/src/debug/python3-pycryptodome/4.0.1/src/ed448.c /usr/src/debug/python3-pycryptodome/4.0.1/src/k12_avx2_bmi2.c"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.24.1" to "4.0.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.24.1 [default] to 4.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.24.1" to "4.0.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.24.1 [default] to 4.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 3156286 to 3402789 (+8%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: FILELIST: removed "/usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modexp.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modexp.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modmult.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modmult.py", added "/usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_cpu_features.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_shared_objects.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_shared_objects.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_threads.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/__pycache__/plugin.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_cpu_features.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Self
 Test/Math/test_nat.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_passphrase.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_nat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_passphrase.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_shared_objects.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_raw_api.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_message_too_long.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_raw_api.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/plugin.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_threads.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_message_too_long.py /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_shared_
 objects.py"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.24.1" to "4.0.1"
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.24.1 [default] to 4.0.1 [default]
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3762246 to 3802437 (+1%)
packages/x86-64-v3-poky-linux/python3-pycryptodome/python3-pycryptodome: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info -> /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info, removed "/usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_384.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_512.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_224.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_256.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Util/strxor.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/ElGamal.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KangarooTwelve.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/DSA.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/ECC.pyi /usr/lib/python3.14/site-packages/Crypt
 o/PublicKey/RSA.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_siv.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/pkcs1_15.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ccm.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_gcm.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_modexp.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/CMAC.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/HMAC.pyi /usr/lib/python3.14/site-packages/Crypto/IO/PEM.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash256.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA224.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD4.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_cpu_features.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/DSS.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/pss.pyi /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerCustom.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_ws.
 abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/_openssh.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA512.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD2.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_v1_5.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_PSS.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cbc.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/MD5.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cfb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ecb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ocb.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ofb.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash128.pyi /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.pyi /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/L
 ICENSE.rst /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_EKSBlowfish.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_point.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/keccak.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2b.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2s.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC256.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNative.pyi /usr/lib/python3.14/site-packages/Crypto/IO/_PBES.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_eax.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA384.pyi /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerGMP.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/py3compat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Ci
 pher/ARC2.pyi /usr/lib/python3.14/site-packages/Crypto/Util/Padding.pyi /usr/lib/python3.14/site-packages/Crypto/Random/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Math/Primality.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.pyi /usr/lib/python3.14/site-packages/Crypto/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Util/RFC1751.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/Salsa20.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.py /usr/lib/python3.14/site-packages/Crypto/Hash/Poly1305.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.py /usr/lib/python3.14/site-packages/Crypto/Util/asn1.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/KDF.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA256.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/DH.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/SHA.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/eddsa.pyi /usr/lib/python3.14/site-packages/Crypto/
 Hash/SHA1.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ed448.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ctr.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_raw_api.pyi /usr/lib/python3.14/site-packages/Crypto/Math/Numbers.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_openpgp.pyi /usr/lib/python3.14/site-packages/Crypto/Random/random.pyi /usr/lib/python3.14/site-packages/Crypto/Util/number.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/DES.pyi /usr/lib/python3.14/site-packages/Crypto/Protocol/SecretSharing.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC4.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_OAEP.pyi /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerBase.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/PublicKey/_curve448.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/CAST.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/AES.pyi /us
 r/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20_Poly1305.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Util/Counter.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/DES3.pyi /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/AUTHORS.rst /usr/lib/python3.14/site-packages/Crypto/Protocol/__init__.pyi /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.py /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD160.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE128.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE256.pyi /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_v1_5.pyi /usr/lib/python3.14/site-packages/Crypto/IO/PKCS8.pyi /usr/lib/python3.14/site-packages/Crypto/Util/_file_system.pyi /usr/lib/python3.14/site-packages/Crypto/Cipher/Blowfish.pyi /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE128.pyi", added "/usr/lib/python3.14/site-packages/Crypto/Math/__pyca
 che__/_IntegerNat.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Cipher/oaep.py /usr/lib/python3.14/site-packages/Crypto/Util/_bytes.py /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/oaep.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Math/_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_bytes.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Cipher/_chacha20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA256_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA224_shani.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat_bmi2_adx.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_lib.py /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/_state_machine.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Util/_threads.py /usr/lib/python3.14/site-packages/Crypto/Hash/_k12.abi3.so /usr/
 lib/python3.14/site-packages/Crypto/Hash/_keccak_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/_Salsa20_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_threads.cpython-314.pyc /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNat.py /usr/lib/python3.14/site-packages/Crypto/Hash/_k12_avx2_bmi2.abi3.so /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/_ec_lib.cpython-314.pyc /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/licenses/LICENSE.rst /usr/lib/python3.14/site-packages/Crypto/Math/_nat_bmi2_adx.abi3.so /usr/lib/python3.14/site-packages/Crypto/Cipher/_state_machine.py"
Changes to packages/x86-64-v3-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_chacha20_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/oaep.py was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/oaep.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__pycache__/_state_machine.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_Salsa20_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_state_machine.py was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_k12.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_k12_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_keccak_avx2_bmi2.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA224_shani.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Hash/_SHA256_shani.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNat.py was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_nat.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/_nat_bmi2_adx.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerNat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_lib.py was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_nat_bmi2_adx.abi3.so was added
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__pycache__/_ec_lib.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_message_too_long.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/__pycache__/test_shared_objects.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_message_too_long.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Cipher/test_shared_objects.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/__pycache__/test_shared_objects.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Hash/test_shared_objects.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_nat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_nat.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/plugin.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/__pycache__/test_import_passphrase.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/PublicKey/test_import_passphrase.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/__pycache__/plugin.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_cpu_features.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_raw_api.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/__pycache__/test_threads.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_cpu_features.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_raw_api.py was added
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Util/test_threads.py was added
  /usr/lib/python3.14/site-packages/Crypto/Util/_bytes.py was added
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_bytes.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/_threads.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/Crypto/Util/_threads.py was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/licenses/LICENSE.rst was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/pycryptodome-4.0.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/Crypto/Cipher/AES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC2.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ARC4.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/Blowfish.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/CAST.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20_Poly1305.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/ChaCha20.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/DES3.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/DES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_EKSBlowfish.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cbc.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ccm.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_cfb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ctr.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_eax.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ecb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_gcm.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ocb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_ofb.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_openpgp.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/_mode_siv.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_OAEP.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/PKCS1_v1_5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Cipher/Salsa20.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2b.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/BLAKE2s.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/CMAC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/cSHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/HMAC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KangarooTwelve.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/keccak.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/KMAC256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD2.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD4.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/MD5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/Poly1305.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD160.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/RIPEMD.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA1.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA224.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_224.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_384.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA3_512.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA384.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA512.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/SHA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TupleHash256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE128.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Hash/TurboSHAKE256.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/_PBES.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/PEM.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/IO/PKCS8.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerBase.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerCustom.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerGMP.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_IntegerNative.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/_modexp.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/Numbers.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/Primality.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerCustom.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Math/__pycache__/_IntegerGMP.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/DH.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/KDF.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Protocol/SecretSharing.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_curve448.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/DSA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/ECC.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ec_ws.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_ed448.abi3.so was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/ElGamal.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_openssh.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/_point.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/PublicKey/RSA.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Random/__init__.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Random/random.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modexp.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/__pycache__/test_modmult.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modexp.py was removed
  /usr/lib/python3.14/site-packages/Crypto/SelfTest/Math/test_modmult.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/DSS.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/eddsa.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/pkcs1_15.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_PSS.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/PKCS1_v1_5.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Signature/pss.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/asn1.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/Counter.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_cpu_features.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_file_system.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/number.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/Padding.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.py was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/py3compat.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/__pycache__/py3compat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/_raw_api.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/RFC1751.pyi was removed
  /usr/lib/python3.14/site-packages/Crypto/Util/strxor.pyi was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/AUTHORS.rst was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/licenses/LICENSE.rst was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/pycryptodome-3.24.1.dist-info/WHEEL was removed

--===============3359945851206675267==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-upgrade-3.24.1-4.0.1.patch"

RnJvbSBmMWU2NjU3NjI0YTVhODRkNzkwYTIxYzdkZTMyODQyY2RlZmUzYzU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTggT2N0IDIwMjYgMDU6MDc6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3J5cHRvZG9tZTogdXBncmFkZSAzLjI0LjEgLT4gNC4wLjEKCjQuMC4xKDE3IE9j
dG9iZXIgMjAyNikKCk5ldyBmZWF0dXJlcwotLS0tLS0tLS0tLS0KCjQuMC4wICgxNCBPY3RvYmVy
IDIwMjYpCgpCcmVha2luZyBjaGFuZ2VzCi0tLS0tLS0tLS0tLS0tLS0KCkRlcHJlY2F0aW9ucwot
LS0tLS0tLS0tLS0KClJlc29sdmVkIGlzc3VlcwotLS0tLS0tLS0tLS0tLS0KCk5ldyBmZWF0dXJl
cwotLS0tLS0tLS0tLS0KLS0tCiAuLi4vcHl0aG9uL3B5dGhvbi1weWNyeXB0b2RvbWUuaW5jICAg
ICAgICAgICAgfCAgMiArLQogLi4uLjI0LjEuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWVfNC4w
LjEuYmJ9IHwgMjYgKysrKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24ve3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMjQuMS5iYiA9PiBweXRob24zLXB5Y3J5cHRv
ZG9tZV80LjAuMS5iYn0gKDExJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbi1weWNyeXB0b2RvbWUuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24tcHljcnlwdG9kb21lLmluYwppbmRleCBhMDE4MTg3NGNkLi42ZDMzNGE2ODlm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1weWNyeXB0
b2RvbWUuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXB5Y3J5
cHRvZG9tZS5pbmMKQEAgLTMsNyArMyw3IEBAIERFU0NSSVBUSU9OID0gIlB5Q3J5cHRvZG9tZSBp
cyBhIHNlbGYtY29udGFpbmVkIFB5dGhvbiBwYWNrYWdlIG9mIGxvdy1sZXZlbFwKICBjcnlwdG9n
cmFwaGljIHByaW1pdGl2ZXMuIgogSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5weWNyeXB0b2RvbWUu
b3JnIgogTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UgQU5EIFVubGljZW5zZSIKLUxJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21kNT0yOTI0MmE3MDQxMGE0ZWVmZjQ4OGEyODE2
NGU3YWI5MyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21kNT1kZGQ0
Y2NjNTczMzQ2Zjk4NjU4ZTAwNTk4OTBmOWRhOCIKIAogaW5oZXJpdCBweXBpCiAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4y
NC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9t
ZV80LjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDExJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMjQuMS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRvZG9tZV80LjAuMS5i
YgppbmRleCAwYWE1MzU1OWQ2Li40NTAzZDU5NjI5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMjQuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzQuMC4xLmJiCkBA
IC0xLDYgKzEsMzAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZl
IGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0Lgor
IyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6
ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0
ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVw
ZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLnJzdAorIyArKysg
TElDRU5TRS5yc3QKKyMgQEAgLTMsNiArMywxMCBAQAorIyAgCisjICBJbiBlaXRoZXIgY2FzZSwg
dGhlcmUgYXJlIG1pbmltYWwgaWYgbm8gcmVzdHJpY3Rpb25zIG9uIHRoZSByZWRpc3RyaWJ1dGlv
biwKKyMgIG1vZGlmaWNhdGlvbiBhbmQgdXNhZ2Ugb2YgdGhlIHNvZnR3YXJlLgorIyArCisjICtG
aWxlcyB0aGF0IGRvIG5vdCBpbmNsdWRlIHRoZSBsaWNlbnNlIHRleHQgcmVmZXIgdG8gaXQgd2l0
aCBhbiBTUERYIHRhZzoKKyMgK2BgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVz
ZWBgIGZvciB0aGUgQlNEIGxpY2Vuc2UgYmVsb3cKKyMgKyhgYFNQRFgtRmlsZUNvcHlyaWdodFRl
eHRgYCBnaXZlcyB0aGUgY29weXJpZ2h0IG5vdGljZSkuCisjICAKKyMgIFB1YmxpYyBkb21haW4K
KyMgID09PT09PT09PT09PT0KKyMgCisjCisKIHJlcXVpcmUgcHl0aG9uLXB5Y3J5cHRvZG9tZS5p
bmMKIGluaGVyaXQgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiM2Y5ZTc0NDQ0YzBlY2JlYzdhZjIzMmE5NWQyODJjNzRiMTE0ZDUzMjEyY2UwNzVl
ZDE3YjdmZDdkY2EzMmJiMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5OTgxYzY4ZTcxN2RiNWU4
NDFhNzRjNGIzMzAxNmQyNWY3ZDliZWI4ZjdkZDU1YzRkYzg0NGI5YjQyYzA4MTUwIgogCiBDVkVf
UFJPRFVDVCA9ICJweWNyeXB0b2RvbWU6cHljcnlwdG9kb21lIgotLSAKMi40Ny4xCgo=

--===============3359945851206675267==--

