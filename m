Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97840C61DD6
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 05:44:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2183.1787982254753116736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 22:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GkO9o//t;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BQbGGNvK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a04c0c0f7f-2c646210-62ed-4099-9cc7-63e59b699f21-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787982254;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YaM35DgtwKCozsIOjVz+T3d5GIDgDSvO/vJLh+EZlIA=;
	b=GkO9o//tqt3lKX8SF10E+V9w79ZM2sikjxzOdgiwmjicl+5jFpj/DESGTEi7M1po
	IT0jAiW81VOvfa74r9QD4tYweYdTxsohlhJIZ9Kls1dI68MwI3IKdABK9Cvv0BhS09F
	/My2yGQfR9AL5RntKzKK1qAIJp3voVvzg44xqbQg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787982254;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YaM35DgtwKCozsIOjVz+T3d5GIDgDSvO/vJLh+EZlIA=;
	b=BQbGGNvKNYRRa/qrV2VqGY5/9SrFOWKBaG4SSh2PS58AqJ7Ab6mGLwjPoF0X5lwe
	7KirEhXVi/8f9BN3T8S28opBNgLKlD3vm/CjDTCiKZFFWFJVco6NoqRe8sWT8fj1sAe
	TTdYa9EVa+cWuMKqFWtZu5gmKq2uTFykHTa6tcGE=
Content-Type: multipart/mixed; boundary="===============2061573774666823391=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgcrypt: upgrading to 1.12.3 SUCCEEDED
Message-ID: <010101a04c0c0f7f-2c646210-62ed-4099-9cc7-63e59b699f21-000000@us-west-2.amazonses.com>
Date: Sat, 29 Aug 2026 05:44:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.29-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 05:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244629

--===============2061573774666823391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgcrypt* to *1.12.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgcrypt-upgrade-1.12.2-1.12.3.patch
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
From 590185b4aac59d3bdd2c8dbca72b788c7b6644fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 29 Aug 2026 05:40:50 +0000
Subject: [PATCH] libgcrypt: upgrade 1.12.2 -> 1.12.3

Source: ChangeLog

2026-08-26  Werner Koch  <wk@gnupg.org>

	Release 1.12.3.
	+ commit a4bccd238c9f972af1abaa4b99967e4181eccfd1
	* configure.ac: Bump LT version to C28/A8/R0.

2026-08-25  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:rsa:pkcs1: Reject shorter PS on decryption.
	+ commit 0729bf7214c63462bfb433732e6d65527d0dc615
	* cipher/rsa-common.c (_gcry_rsa_pkcs1_decode_for_enc): Validate
	the length of PS.

	cipher:rsa:pkcs1: Fix the condition of frame length.
	+ commit 2ef95711d898d65609c232f4f61e38efd066a7bd
	* cipher/rsa-common.c (_gcry_rsa_pkcs1_encode_for_enc): Fix
	the validation of NFRAME and VALUELEN.

2026-08-24  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:rsa:pkcs1: Reject shorter PS on decryption.
	+ commit 9fd5ecd9abe3606e96fb85981ad386f6ea8d0d0a
	* cipher/rsa-common.c (_gcry_rsa_pkcs1_decode_for_enc): Validate
	the length of PS.

2026-08-18  Werner Koch  <wk@gnupg.org>

	tests: Add 3072 and 4096 bit powm benchmarks.
	+ commit 7199d14b0211f23b69012a7412160ee2a1fcb44f
	* tests/benchmark.c (mpi_bench): Add data from two RSA public keys
	with their OpenPGP signatures.

2026-08-18  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:kem:dhkem: Validate OPTIONAL and OPTIONAL_LEN.
	+ commit 8722f83fbf1b3b7f63a72a675c8f49f7e405e0c0
	* cipher/kem.c (_gcry_kem_decap): Check OPTIONAL and OPTIONAL_LEN
	for GCRY_KEM_DHKEM25519 and GCRY_KEM_DHKEM448.

	cipher:ecc:sm2: Use constant time memequal to check.
	+ commit f9de3feb0533cc456474fbeeab86c57f980c75ef
	* cipher/ecc-sm2.c (_gcry_ecc_sm2_decrypt): Use wipememory
	and ct_not_memequal.

	cipher:rsa: Only accept canonical signature.
	+ commit 710d2a438bbfca083b8a680f8c8badc20b8f377f
	* cipher/rsa.c (rsa_verify): Reject if it's <= 0.  Reject if it's
	larger than or equal to N.

	mpi:ec:Edward: Make sure to have fixed length MPI for get_affine.
	+ commit 7004c17e28c3d6e5616c303e8b9fee298c4b8e25
	* mpi/ec.c (_gcry_mpi_ec_get_affine): When copying X and Y, make sure
	to have fixed length.

	cipher:ecc: Only accept canonical value of S.
	+ commit 73967d0ef06fc68a6796a5f646684e56119dad6c
	* cipher/ecc-eddsa.c (_gcry_ecc_eddsa_verify): Reject
	non-canonical S.

2026-08-18  Werner Koch  <wk@gnupg.org>

	tests: Add 3072 and 4096 bit powm benchmarks.
	+ commit e4bd9cd9ec3e7f4ea2ef7676a2d98542ecac9d32
	* tests/benchmark.c (mpi_bench): Add data from two RSA public keys
	with their OpenPGP signatures.

2026-08-12  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:kem:dhkem: Validate OPTIONAL and OPTIONAL_LEN.
	+ commit 0de5c33470d249f511a412d76d15b3a525105371
	* cipher/kem.c (_gcry_kem_decap): Check OPTIONAL and OPTIONAL_LEN
	for GCRY_KEM_DHKEM25519 and GCRY_KEM_DHKEM448.

	cipher:ecc:sm2: Use constant time memequal to check.
	+ commit 8643186e0f63470af44c3a7523aa8fed480dee41
	* cipher/ecc-sm2.c (_gcry_ecc_sm2_decrypt): Use wipememory
	and ct_not_memequal.

	cipher:rsa: Only accept canonical signature.
	+ commit 742f8c149161adeab4b96459170fde363e6ae299
	* cipher/rsa.c (rsa_verify): Reject if it's <= 0.  Reject if it's
	larger than or e

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...01-libgcrypt-fix-m4-file-for-oe-core.patch |  2 +-
 ...s-Fix-link-errors-for-t-thread-local.patch | 13 ++---
 ...m-fix-undefined-reference-to-pthread.patch | 11 ++--
 .../libgcrypt/files/no-bench-slope.patch      |  2 +-
 .../libgcrypt/files/no-native-gpg-error.patch |  4 +-
 ...ibgcrypt_1.12.2.bb => libgcrypt_1.12.3.bb} | 54 ++++++++++++++++++-
 6 files changed, 65 insertions(+), 21 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.2.bb => libgcrypt_1.12.3.bb} (44%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index e60507e636..ad071e07f5 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From 3bc536529c9bbe1e62d1c1127abee6183ed64298 Mon Sep 17 00:00:00 2001
+From 4f27b68f509c94739d8d7c5e5c8bc1b0b17259ad Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
index 19a925c2c6..6200ac0a31 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -1,4 +1,4 @@
-From 942e232ded48fa08d2bda417ae8ad8c03d644372 Mon Sep 17 00:00:00 2001
+From 4a8d31b6e1af1d2764e159d5825ad2241a74fe7b Mon Sep 17 00:00:00 2001
 From: Collin Funk <collin.funk1@gmail.com>
 Date: Wed, 27 Aug 2025 11:49:06 +0800
 Subject: [PATCH] tests: Fix link errors for t-thread-local.
@@ -21,18 +21,15 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 4800135..f0f7adb 100644
+index 3baaf48..cc2fd6b 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -102,7 +102,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -103,7 +103,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
 -t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
 +t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
- 
- # Build a version of the test driver for the build platform.
--- 
-2.34.1
-
+ t_cipher_internal_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/cipher
+ t_sntrup761_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/cipher
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index 090948c3c5..924ece8b8e 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From a3496435dcc223a914eec5e61e853934fd4eb635 Mon Sep 17 00:00:00 2001
+From 6322f759b58ba78d5b01c09c19d91571e999334c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 27 Aug 2025 11:46:17 +0800
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 93daf3c..4800135 100644
+index 8c468b4..3baaf48 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -100,7 +100,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -101,7 +101,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -26,7 +26,7 @@ index 93daf3c..4800135 100644
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
-@@ -122,7 +122,7 @@ else
+@@ -125,7 +125,7 @@ else
  xtestsuite_libs = ../src/.libs/libgcrypt.so*
  xtestsuite_driver = testdrv
  t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -35,6 +35,3 @@ index 93daf3c..4800135 100644
  endif
  
  # xcheck uses our new testdrv instead of the automake test runner.
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index 606cca1344..849f8b0361 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,4 +1,4 @@
-From 254821a620c1f7d6542c23dbe555e7c02637a3f8 Mon Sep 17 00:00:00 2001
+From 50bfe58f1ffa6a8519377f4c10e5d41133d8782a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 9 Sep 2022 11:13:37 +0100
 Subject: [PATCH] libgcrypt: disable bench-slope test case
diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
index 98874ce12a..f22f6993a2 100644
--- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -1,4 +1,4 @@
-From ede03b847038afc294e206ca345d12d75bbba844 Mon Sep 17 00:00:00 2001
+From a7778057e08273041c48e10ff2f4c7dcce9220c1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 26 Aug 2022 15:23:37 +0100
 Subject: [PATCH] libgcrypt: rewrite ptest
@@ -13,7 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index bfca4c2..634b718 100644
+index 7743258..bffa3cc 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
 @@ -32,7 +32,6 @@
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
similarity index 44%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
index deb053031e..af5f00dbfa 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
@@ -1,3 +1,53 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSES
+# +++ LICENSES
+# @@ -61,6 +61,36 @@
+#  
+#  #+begin_quote
+#     Copyright (c) 2021-2022, Intel Corporation
+# +
+# +   Redistribution and use in source and binary forms, with or without
+# +   modification, are permitted provided that the following conditions are met:
+# +
+# +       * Redistributions of source code must retain the above copyright notice,
+# +         this list of conditions and the following disclaimer.
+# +       * Redistributions in binary form must reproduce the above copyright
+# +         notice, this list of conditions and the following disclaimer in the
+# +         documentation and/or other materials provided with the distribution.
+# +       * Neither the name of Intel Corporation nor the names of its contributors
+# +         may be used to endorse or promote products derived from this software
+# +         without specific prior written permission.
+# +
+# +   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+# +   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+# +   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+# +   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
+# +   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+# +   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+# +   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
+# +   CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+# +   OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+# +   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +#+end_quote
+# +
+# +  For files:
+# +  - cipher/sm3-intel-avx2-amd64.S
+# +
+# +#+begin_quote
+# +   Copyright (c) 2023-2024, Intel Corporation
+#  
+#     Redistribution and use in source and binary forms, with or without
+#     modification, are permitted provided that the following conditions are met:
+# 
+#
+
 SUMMARY = "General purpose cryptographic library based on the code from GnuPG"
 DESCRIPTION = "A cryptography library developed as a separated module of GnuPG. \
 It can also be used independently of GnuPG, but depends on its error-reporting \
@@ -12,7 +62,7 @@ LICENSE:${PN}-dev = "GPL-2.0-or-later AND LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://COPYING.LIB;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
-                    file://LICENSES;md5=034b4e369944ad4b52a68368f1cf98b8 \
+                    file://LICENSES;md5=47e346a71a2593d19f741408407fe91f \
                     "
 
 DEPENDS = "libgpg-error"
@@ -26,7 +76,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e"
+SRC_URI[sha256sum] = "98d1b0b3202d2b03fa754a35aa3cbbfcf526a3260d8d2ee213748001b1043006"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.47.1


--===============2061573774666823391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.7.2", added "/usr/lib/libgcrypt.so.20.8.8"
Changes to packages/x86-64-v3-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.2 to libgcrypt.so.20.8.8
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.2 to libgcrypt.so.20.8.8
  /usr/lib/libgcrypt.so.20.7.2 moved to /usr/lib/libgcrypt.so.20.8.8
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.2 to libgcrypt.so.20.8.8
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.2 to libgcrypt.so.20.8.8
  /usr/lib/libgcrypt.so.20.7.2 moved to /usr/lib/libgcrypt.so.20.8.8

--===============2061573774666823391==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgcrypt-upgrade-1.12.2-1.12.3.patch"

RnJvbSA1OTAxODViNGFhYzU5ZDNiZGQyYzhkYmNhNzJiNzg4YzdiNjY0NGZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjkgQXVnIDIwMjYgMDU6NDA6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnY3J5cHQ6IHVwZ3JhZGUgMS4xMi4yIC0+IDEuMTIuMwoKU291cmNlOiBDaGFuZ2VMb2cKCjIw
MjYtMDgtMjYgIFdlcm5lciBLb2NoICA8d2tAZ251cGcub3JnPgoKCVJlbGVhc2UgMS4xMi4zLgoJ
KyBjb21taXQgYTRiY2NkMjM4YzlmOTcyYWYxYWJhYTRiOTk5NjdlNDE4MWVjY2ZkMQoJKiBjb25m
aWd1cmUuYWM6IEJ1bXAgTFQgdmVyc2lvbiB0byBDMjgvQTgvUjAuCgoyMDI2LTA4LTI1ICBOSUlC
RSBZdXRha2EgIDxnbmlpYmVAZnNpai5vcmc+CgoJY2lwaGVyOnJzYTpwa2NzMTogUmVqZWN0IHNo
b3J0ZXIgUFMgb24gZGVjcnlwdGlvbi4KCSsgY29tbWl0IDA3MjliZjcyMTRjNjM0NjJiZmI0MzM3
MzJlNmQ2NTUyN2QwZGM2MTUKCSogY2lwaGVyL3JzYS1jb21tb24uYyAoX2djcnlfcnNhX3BrY3Mx
X2RlY29kZV9mb3JfZW5jKTogVmFsaWRhdGUKCXRoZSBsZW5ndGggb2YgUFMuCgoJY2lwaGVyOnJz
YTpwa2NzMTogRml4IHRoZSBjb25kaXRpb24gb2YgZnJhbWUgbGVuZ3RoLgoJKyBjb21taXQgMmVm
OTU3MTFkODk4ZDY1NjA5YzIzMmY0ZjYxZTM4ZWZkMDY2YTdiZAoJKiBjaXBoZXIvcnNhLWNvbW1v
bi5jIChfZ2NyeV9yc2FfcGtjczFfZW5jb2RlX2Zvcl9lbmMpOiBGaXgKCXRoZSB2YWxpZGF0aW9u
IG9mIE5GUkFNRSBhbmQgVkFMVUVMRU4uCgoyMDI2LTA4LTI0ICBOSUlCRSBZdXRha2EgIDxnbmlp
YmVAZnNpai5vcmc+CgoJY2lwaGVyOnJzYTpwa2NzMTogUmVqZWN0IHNob3J0ZXIgUFMgb24gZGVj
cnlwdGlvbi4KCSsgY29tbWl0IDlmZDVlY2Q5YWJlMzYwNmU5NmZiODU5ODFhZDM4NmY2ZWE4ZDBk
MGEKCSogY2lwaGVyL3JzYS1jb21tb24uYyAoX2djcnlfcnNhX3BrY3MxX2RlY29kZV9mb3JfZW5j
KTogVmFsaWRhdGUKCXRoZSBsZW5ndGggb2YgUFMuCgoyMDI2LTA4LTE4ICBXZXJuZXIgS29jaCAg
PHdrQGdudXBnLm9yZz4KCgl0ZXN0czogQWRkIDMwNzIgYW5kIDQwOTYgYml0IHBvd20gYmVuY2ht
YXJrcy4KCSsgY29tbWl0IDcxOTlkMTRiMDIxMWYyM2I2OTAxMmE3NDEyMTYwZWUyYTFmY2I0NGYK
CSogdGVzdHMvYmVuY2htYXJrLmMgKG1waV9iZW5jaCk6IEFkZCBkYXRhIGZyb20gdHdvIFJTQSBw
dWJsaWMga2V5cwoJd2l0aCB0aGVpciBPcGVuUEdQIHNpZ25hdHVyZXMuCgoyMDI2LTA4LTE4ICBO
SUlCRSBZdXRha2EgIDxnbmlpYmVAZnNpai5vcmc+CgoJY2lwaGVyOmtlbTpkaGtlbTogVmFsaWRh
dGUgT1BUSU9OQUwgYW5kIE9QVElPTkFMX0xFTi4KCSsgY29tbWl0IDg3MjJmODNmYmYxYjNiN2Y2
M2E3MmE2NzVjOGY0OWY3ZTQwNWUwYzAKCSogY2lwaGVyL2tlbS5jIChfZ2NyeV9rZW1fZGVjYXAp
OiBDaGVjayBPUFRJT05BTCBhbmQgT1BUSU9OQUxfTEVOCglmb3IgR0NSWV9LRU1fREhLRU0yNTUx
OSBhbmQgR0NSWV9LRU1fREhLRU00NDguCgoJY2lwaGVyOmVjYzpzbTI6IFVzZSBjb25zdGFudCB0
aW1lIG1lbWVxdWFsIHRvIGNoZWNrLgoJKyBjb21taXQgZjlkZTNmZWIwNTMzY2M0NTY0NzRmYmVl
YWI4NmM1N2Y5ODBjNzVlZgoJKiBjaXBoZXIvZWNjLXNtMi5jIChfZ2NyeV9lY2Nfc20yX2RlY3J5
cHQpOiBVc2Ugd2lwZW1lbW9yeQoJYW5kIGN0X25vdF9tZW1lcXVhbC4KCgljaXBoZXI6cnNhOiBP
bmx5IGFjY2VwdCBjYW5vbmljYWwgc2lnbmF0dXJlLgoJKyBjb21taXQgNzEwZDJhNDM4YmJmY2Ew
ODNiOGE2ODBmOGM4YmFkYzIwYjhmMzc3ZgoJKiBjaXBoZXIvcnNhLmMgKHJzYV92ZXJpZnkpOiBS
ZWplY3QgaWYgaXQncyA8PSAwLiAgUmVqZWN0IGlmIGl0J3MKCWxhcmdlciB0aGFuIG9yIGVxdWFs
IHRvIE4uCgoJbXBpOmVjOkVkd2FyZDogTWFrZSBzdXJlIHRvIGhhdmUgZml4ZWQgbGVuZ3RoIE1Q
SSBmb3IgZ2V0X2FmZmluZS4KCSsgY29tbWl0IDcwMDRjMTdlMjhjM2Q2ZTU2MTZjMzAzZThiOWZl
ZTI5OGM0YjhlMjUKCSogbXBpL2VjLmMgKF9nY3J5X21waV9lY19nZXRfYWZmaW5lKTogV2hlbiBj
b3B5aW5nIFggYW5kIFksIG1ha2Ugc3VyZQoJdG8gaGF2ZSBmaXhlZCBsZW5ndGguCgoJY2lwaGVy
OmVjYzogT25seSBhY2NlcHQgY2Fub25pY2FsIHZhbHVlIG9mIFMuCgkrIGNvbW1pdCA3Mzk2N2Qw
ZWYwNmZjNjhhNjc5NmE1ZjY0NjY4NGU1NjExOWRhZDZjCgkqIGNpcGhlci9lY2MtZWRkc2EuYyAo
X2djcnlfZWNjX2VkZHNhX3ZlcmlmeSk6IFJlamVjdAoJbm9uLWNhbm9uaWNhbCBTLgoKMjAyNi0w
OC0xOCAgV2VybmVyIEtvY2ggIDx3a0BnbnVwZy5vcmc+CgoJdGVzdHM6IEFkZCAzMDcyIGFuZCA0
MDk2IGJpdCBwb3dtIGJlbmNobWFya3MuCgkrIGNvbW1pdCBlNGJkOWNkOWVjM2U3ZjRlYTJlZjc2
NzZhMmQ5ODU0MmVjYWM5ZDMyCgkqIHRlc3RzL2JlbmNobWFyay5jIChtcGlfYmVuY2gpOiBBZGQg
ZGF0YSBmcm9tIHR3byBSU0EgcHVibGljIGtleXMKCXdpdGggdGhlaXIgT3BlblBHUCBzaWduYXR1
cmVzLgoKMjAyNi0wOC0xMiAgTklJQkUgWXV0YWthICA8Z25paWJlQGZzaWoub3JnPgoKCWNpcGhl
cjprZW06ZGhrZW06IFZhbGlkYXRlIE9QVElPTkFMIGFuZCBPUFRJT05BTF9MRU4uCgkrIGNvbW1p
dCAwZGU1YzMzNDcwZDI0OWY1MTFhNDEyZDc2ZDE1YjNhNTI1MTA1MzcxCgkqIGNpcGhlci9rZW0u
YyAoX2djcnlfa2VtX2RlY2FwKTogQ2hlY2sgT1BUSU9OQUwgYW5kIE9QVElPTkFMX0xFTgoJZm9y
IEdDUllfS0VNX0RIS0VNMjU1MTkgYW5kIEdDUllfS0VNX0RIS0VNNDQ4LgoKCWNpcGhlcjplY2M6
c20yOiBVc2UgY29uc3RhbnQgdGltZSBtZW1lcXVhbCB0byBjaGVjay4KCSsgY29tbWl0IDg2NDMx
ODZlMGY2MzQ3MGFmNDRjM2E3NTIzYWE4ZmVkNDgwZGVlNDEKCSogY2lwaGVyL2VjYy1zbTIuYyAo
X2djcnlfZWNjX3NtMl9kZWNyeXB0KTogVXNlIHdpcGVtZW1vcnkKCWFuZCBjdF9ub3RfbWVtZXF1
YWwuCgoJY2lwaGVyOnJzYTogT25seSBhY2NlcHQgY2Fub25pY2FsIHNpZ25hdHVyZS4KCSsgY29t
bWl0IDc0MmY4YzE0OTE2MWFkZWFiNGI5NjQ1OTE3MGZkZTM2M2U2YWUyOTkKCSogY2lwaGVyL3Jz
YS5jIChyc2FfdmVyaWZ5KTogUmVqZWN0IGlmIGl0J3MgPD0gMC4gIFJlamVjdCBpZiBpdCdzCgls
YXJnZXIgdGhhbiBvciBlCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAg
Y2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2ht
ZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uMDEtbGliZ2NyeXB0LWZpeC1tNC1maWxlLWZv
ci1vZS1jb3JlLnBhdGNoIHwgIDIgKy0KIC4uLnMtRml4LWxpbmstZXJyb3JzLWZvci10LXRocmVh
ZC1sb2NhbC5wYXRjaCB8IDEzICsrLS0tCiAuLi5tLWZpeC11bmRlZmluZWQtcmVmZXJlbmNlLXRv
LXB0aHJlYWQucGF0Y2ggfCAxMSArKy0tCiAuLi4vbGliZ2NyeXB0L2ZpbGVzL25vLWJlbmNoLXNs
b3BlLnBhdGNoICAgICAgfCAgMiArLQogLi4uL2xpYmdjcnlwdC9maWxlcy9uby1uYXRpdmUtZ3Bn
LWVycm9yLnBhdGNoIHwgIDQgKy0KIC4uLmliZ2NyeXB0XzEuMTIuMi5iYiA9PiBsaWJnY3J5cHRf
MS4xMi4zLmJifSB8IDU0ICsrKysrKysrKysrKysrKysrKy0KIDYgZmlsZXMgY2hhbmdlZCwgNjUg
aW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ2NyeXB0L3tsaWJnY3J5cHRfMS4xMi4yLmJiID0+IGxpYmdjcnlwdF8xLjEyLjMuYmJ9
ICg0NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVz
LzAwMDEtbGliZ2NyeXB0LWZpeC1tNC1maWxlLWZvci1vZS1jb3JlLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzLzAwMDEtbGliZ2NyeXB0LWZpeC1tNC1maWxlLWZv
ci1vZS1jb3JlLnBhdGNoCmluZGV4IGU2MDUwN2U2MzYuLmFkMDcxZTA3ZjUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDAxLWxpYmdjcnlwdC1maXgt
bTQtZmlsZS1mb3Itb2UtY29yZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJn
Y3J5cHQvZmlsZXMvMDAwMS1saWJnY3J5cHQtZml4LW00LWZpbGUtZm9yLW9lLWNvcmUucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDNiYzUzNjUyOWM5YmJlMWU2MmQxYzExMjdhYmVlNjE4M2Vk
NjQyOTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDRmMjdiNjhmNTA5Yzk0NzM5ZDhk
N2M1ZTVjOGJjMWIwYjE3MjU5YWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUcmV2
b3IgR2FtYmxpbiA8dHJldm9yLmdhbWJsaW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjkg
T2N0IDIwMTkgMTQ6MDg6MzIgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZ2NyeXB0OiBmaXgg
bTQgZmlsZSBmb3Igb2UtY29yZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Z2NyeXB0L2ZpbGVzLzAwMDEtdGVzdHMtRml4LWxpbmstZXJyb3JzLWZvci10LXRocmVhZC1sb2Nh
bC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDAxLXRlc3Rz
LUZpeC1saW5rLWVycm9ycy1mb3ItdC10aHJlYWQtbG9jYWwucGF0Y2gKaW5kZXggMTlhOTI1YzJj
Ni4uNjIwMGFjMGEzMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0
L2ZpbGVzLzAwMDEtdGVzdHMtRml4LWxpbmstZXJyb3JzLWZvci10LXRocmVhZC1sb2NhbC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwMS10ZXN0cy1G
aXgtbGluay1lcnJvcnMtZm9yLXQtdGhyZWFkLWxvY2FsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA5NDJlMjMyZGVkNDhmYTA4ZDJiZGE0MTdhZThhZDhjMDNkNjQ0MzcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA0YThkMzFiNmUxYWYxZDI3NjRlMTU5ZDU4MjVhZDIyNDFhNzRm
ZTdiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ29sbGluIEZ1bmsgPGNvbGxpbi5m
dW5rMUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDI3IEF1ZyAyMDI1IDExOjQ5OjA2ICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBGaXggbGluayBlcnJvcnMgZm9yIHQtdGhyZWFkLWxvY2Fs
LgpAQCAtMjEsMTggKzIxLDE1IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5q
aWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFtIGIvdGVzdHMvTWFrZWZp
bGUuYW0KLWluZGV4IDQ4MDAxMzUuLmYwZjdhZGIgMTAwNjQ0CitpbmRleCAzYmFhZjQ4Li5jYzJm
ZDZiIDEwMDY0NAogLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0KICsrKyBiL3Rlc3RzL01ha2VmaWxl
LmFtCi1AQCAtMTAyLDcgKzEwMiw3IEBAIHRlc3RhcGlfTERBREQgPSAkKHN0YW5kYXJkX2xkYWRk
KSBATERBRERfRk9SX1RFU1RTX0tMVURHRUAKK0BAIC0xMDMsNyArMTAzLDcgQEAgdGVzdGFwaV9M
REFERCA9ICQoc3RhbmRhcmRfbGRhZGQpIEBMREFERF9GT1JfVEVTVFNfS0xVREdFQAogIHRfbG9j
a19MREFERCA9ICQoc3RhbmRhcmRfbGRhZGQpICQoR1BHX0VSUk9SX01UX0xJQlMpIEBMREFERF9G
T1JfVEVTVFNfS0xVREdFQAogIHRfbG9ja19DRkxBR1MgPSAkKEdQR19FUlJPUl9NVF9DRkxBR1Mp
IC1scHRocmVhZAogIHRfdGhyZWFkX2xvY2FsX0xEQUREID0gJChzdGFuZGFyZF9sZGFkZCkgJChH
UEdfRVJST1JfTVRfTElCUykgQExEQUREX0ZPUl9URVNUU19LTFVER0VACiAtdF90aHJlYWRfbG9j
YWxfQ0ZMQUdTID0gJChHUEdfRVJST1JfTVRfQ0ZMQUdTKQogK3RfdGhyZWFkX2xvY2FsX0NGTEFH
UyA9ICQoR1BHX0VSUk9SX01UX0NGTEFHUykgLWxwdGhyZWFkCiAgdGVzdGRydl9MREFERCA9ICQo
TERBRERfRk9SX1RFU1RTX0tMVURHRSkKLSAKLSAjIEJ1aWxkIGEgdmVyc2lvbiBvZiB0aGUgdGVz
dCBkcml2ZXIgZm9yIHRoZSBidWlsZCBwbGF0Zm9ybS4KLS0tIAotMi4zNC4xCi0KKyB0X2NpcGhl
cl9pbnRlcm5hbF9DUFBGTEFHUyA9ICQoQU1fQ1BQRkxBR1MpIC1JJCh0b3Bfc3JjZGlyKS9jaXBo
ZXIKKyB0X3NudHJ1cDc2MV9DUFBGTEFHUyA9ICQoQU1fQ1BQRkxBR1MpIC1JJCh0b3Bfc3JjZGly
KS9jaXBoZXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxl
cy8wMDA0LXRlc3RzLU1ha2VmaWxlLmFtLWZpeC11bmRlZmluZWQtcmVmZXJlbmNlLXRvLXB0aHJl
YWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwNC10ZXN0
cy1NYWtlZmlsZS5hbS1maXgtdW5kZWZpbmVkLXJlZmVyZW5jZS10by1wdGhyZWFkLnBhdGNoCmlu
ZGV4IDA5MDk0OGMzYzUuLjkyNGVjZThiOGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmdjcnlwdC9maWxlcy8wMDA0LXRlc3RzLU1ha2VmaWxlLmFtLWZpeC11bmRlZmluZWQt
cmVmZXJlbmNlLXRvLXB0aHJlYWQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Z2NyeXB0L2ZpbGVzLzAwMDQtdGVzdHMtTWFrZWZpbGUuYW0tZml4LXVuZGVmaW5lZC1yZWZlcmVu
Y2UtdG8tcHRocmVhZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTM0OTY0MzVkY2MyMjNh
OTE0ZWVjNWU2MWU4NTM5MzRmZDRlYjYzNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NjMyMmY3NTliNThiYTc4ZDViMDFjMDljMTlkOTE1NzFlOTk5MzM0YyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERh
dGU6IFdlZCwgMjcgQXVnIDIwMjUgMTE6NDY6MTcgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVz
dHMvTWFrZWZpbGUuYW06IGZpeCB1bmRlZmluZWQgcmVmZXJlbmNlIHRvCkBAIC0xNCwxMCArMTQs
MTAgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRp
ZmYgLS1naXQgYS90ZXN0cy9NYWtlZmlsZS5hbSBiL3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCA5
M2RhZjNjLi40ODAwMTM1IDEwMDY0NAoraW5kZXggOGM0NjhiNC4uM2JhYWY0OCAxMDA2NDQKIC0t
LSBhL3Rlc3RzL01ha2VmaWxlLmFtCiArKysgYi90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTEwMCw3
ICsxMDAsNyBAQCB0X21waV9iaXRfTERBREQgPSAkKHN0YW5kYXJkX2xkYWRkKSBATERBRERfRk9S
X1RFU1RTX0tMVURHRUAKK0BAIC0xMDEsNyArMTAxLDcgQEAgdF9tcGlfYml0X0xEQUREID0gJChz
dGFuZGFyZF9sZGFkZCkgQExEQUREX0ZPUl9URVNUU19LTFVER0VACiAgdF9zZWNtZW1fTERBREQg
PSAkKHN0YW5kYXJkX2xkYWRkKSBATERBRERfRk9SX1RFU1RTX0tMVURHRUAKICB0ZXN0YXBpX0xE
QUREID0gJChzdGFuZGFyZF9sZGFkZCkgQExEQUREX0ZPUl9URVNUU19LTFVER0VACiAgdF9sb2Nr
X0xEQUREID0gJChzdGFuZGFyZF9sZGFkZCkgJChHUEdfRVJST1JfTVRfTElCUykgQExEQUREX0ZP
Ul9URVNUU19LTFVER0VACkBAIC0yNiw3ICsyNiw3IEBAIGluZGV4IDkzZGFmM2MuLjQ4MDAxMzUg
MTAwNjQ0CiAgdF90aHJlYWRfbG9jYWxfTERBREQgPSAkKHN0YW5kYXJkX2xkYWRkKSAkKEdQR19F
UlJPUl9NVF9MSUJTKSBATERBRERfRk9SX1RFU1RTX0tMVURHRUAKICB0X3RocmVhZF9sb2NhbF9D
RkxBR1MgPSAkKEdQR19FUlJPUl9NVF9DRkxBR1MpCiAgdGVzdGRydl9MREFERCA9ICQoTERBRERf
Rk9SX1RFU1RTX0tMVURHRSkKLUBAIC0xMjIsNyArMTIyLDcgQEAgZWxzZQorQEAgLTEyNSw3ICsx
MjUsNyBAQCBlbHNlCiAgeHRlc3RzdWl0ZV9saWJzID0gLi4vc3JjLy5saWJzL2xpYmdjcnlwdC5z
byoKICB4dGVzdHN1aXRlX2RyaXZlciA9IHRlc3RkcnYKICB0X2tkZl9MREFERCA9ICQoc3RhbmRh
cmRfbGRhZGQpICQoR1BHX0VSUk9SX01UX0xJQlMpIEBMREFERF9GT1JfVEVTVFNfS0xVREdFQApA
QCAtMzUsNiArMzUsMyBAQCBpbmRleCA5M2RhZjNjLi40ODAwMTM1IDEwMDY0NAogIGVuZGlmCiAg
CiAgIyB4Y2hlY2sgdXNlcyBvdXIgbmV3IHRlc3RkcnYgaW5zdGVhZCBvZiB0aGUgYXV0b21ha2Ug
dGVzdCBydW5uZXIuCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJnY3J5cHQvZmlsZXMvbm8tYmVuY2gtc2xvcGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvbm8tYmVuY2gtc2xvcGUucGF0Y2gKaW5kZXggNjA2Y2Nh
MTM0NC4uODQ5ZjhiMDM2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2Ny
eXB0L2ZpbGVzL25vLWJlbmNoLXNsb3BlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmdjcnlwdC9maWxlcy9uby1iZW5jaC1zbG9wZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMjU0ODIxYTYyMGMxZjdkNjU0MmMyM2RiZTU1NWU3YzAyNjM3YTNmOCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNTBiZmU1OGYxZmZhNmE4NTE5Mzc3ZjRjMTBlNWQ0MTEzM2Q4Nzgy
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBhcm0uY29tPgogRGF0ZTogRnJpLCA5IFNlcCAyMDIyIDExOjEzOjM3ICswMTAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGxpYmdjcnlwdDogZGlzYWJsZSBiZW5jaC1zbG9wZSB0ZXN0IGNhc2UKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy9uby1uYXRpdmUtZ3Bn
LWVycm9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLW5h
dGl2ZS1ncGctZXJyb3IucGF0Y2gKaW5kZXggOTg4NzRjZTEyYS4uZjIyZjY5OTNhMiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLW5hdGl2ZS1ncGct
ZXJyb3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25v
LW5hdGl2ZS1ncGctZXJyb3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGVkZTAzYjg0NzAz
OGFmYzI5NGUyMDZjYTM0NWQxMmQ3NWJiYmE4NDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGE3Nzc4MDU3ZTA4MjczMDQxYzQ4ZTEwZmYyZjRjN2RjY2U5MjIwYzEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERh
dGU6IEZyaSwgMjYgQXVnIDIwMjIgMTU6MjM6MzcgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGli
Z2NyeXB0OiByZXdyaXRlIHB0ZXN0CkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90ZXN0cy90ZXN0ZHJ2LmMgYi90ZXN0cy90ZXN0ZHJ2LmMK
LWluZGV4IGJmY2E0YzIuLjYzNGI3MTggMTAwNjQ0CitpbmRleCA3NzQzMjU4Li5iZmZhM2NjIDEw
MDY0NAogLS0tIGEvdGVzdHMvdGVzdGRydi5jCiArKysgYi90ZXN0cy90ZXN0ZHJ2LmMKIEBAIC0z
Miw3ICszMiw2IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQv
bGliZ2NyeXB0XzEuMTIuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJn
Y3J5cHRfMS4xMi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggNDQlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMi4yLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvbGliZ2NyeXB0XzEuMTIuMy5iYgppbmRleCBkZWIw
NTMwMzFlLi5hZjVmMDBkYmZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJn
Y3J5cHQvbGliZ2NyeXB0XzEuMTIuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJn
Y3J5cHQvbGliZ2NyeXB0XzEuMTIuMy5iYgpAQCAtMSwzICsxLDUzIEBACisjIEZJWE1FOiB0aGUg
TElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBn
cmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xk
IGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2
YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1p
dCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5z
ZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgor
IworIyAtLS0gTElDRU5TRVMKKyMgKysrIExJQ0VOU0VTCisjIEBAIC02MSw2ICs2MSwzNiBAQAor
IyAgCisjICAjK2JlZ2luX3F1b3RlCisjICAgICBDb3B5cmlnaHQgKGMpIDIwMjEtMjAyMiwgSW50
ZWwgQ29ycG9yYXRpb24KKyMgKworIyArICAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3Vy
Y2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjICsgICBtb2RpZmljYXRpb24s
IGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMgYXJl
IG1ldDoKKyMgKworIyArICAgICAgICogUmVkaXN0cmlidXRpb25zIG9mIHNvdXJjZSBjb2RlIG11
c3QgcmV0YWluIHRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlLAorIyArICAgICAgICAgdGhpcyBs
aXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dpbmcgZGlzY2xhaW1lci4KKyMgKyAgICAg
ICAqIFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBtdXN0IHJlcHJvZHVjZSB0aGUgYWJv
dmUgY29weXJpZ2h0CisjICsgICAgICAgICBub3RpY2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25z
IGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIgaW4gdGhlCisjICsgICAgICAgICBkb2N1bWVu
dGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMgcHJvdmlkZWQgd2l0aCB0aGUgZGlzdHJpYnV0
aW9uLgorIyArICAgICAgICogTmVpdGhlciB0aGUgbmFtZSBvZiBJbnRlbCBDb3Jwb3JhdGlvbiBu
b3IgdGhlIG5hbWVzIG9mIGl0cyBjb250cmlidXRvcnMKKyMgKyAgICAgICAgIG1heSBiZSB1c2Vk
IHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cyBkZXJpdmVkIGZyb20gdGhpcyBzb2Z0d2Fy
ZQorIyArICAgICAgICAgd2l0aG91dCBzcGVjaWZpYyBwcmlvciB3cml0dGVuIHBlcm1pc3Npb24u
CisjICsKKyMgKyAgIFRISVMgU09GVFdBUkUgSVMgUFJPVklERUQgQlkgVEhFIENPUFlSSUdIVCBI
T0xERVJTIEFORCBDT05UUklCVVRPUlMgIkFTIElTIgorIyArICAgQU5EIEFOWSBFWFBSRVNTIE9S
IElNUExJRUQgV0FSUkFOVElFUywgSU5DTFVESU5HLCBCVVQgTk9UIExJTUlURUQgVE8sIFRIRQor
IyArICAgSU1QTElFRCBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJTElUWSBBTkQgRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQVJFCisjICsgICBESVNDTEFJTUVELiBJTiBOTyBFVkVO
VCBTSEFMTCBUSEUgQ09QWVJJR0hUIE9XTkVSIE9SIENPTlRSSUJVVE9SUyBCRSBMSUFCTEUKKyMg
KyAgIEZPUiBBTlkgRElSRUNULCBJTkRJUkVDVCwgSU5DSURFTlRBTCwgU1BFQ0lBTCwgRVhFTVBM
QVJZLCBPUiBDT05TRVFVRU5USUFMCisjICsgICBEQU1BR0VTIChJTkNMVURJTkcsIEJVVCBOT1Qg
TElNSVRFRCBUTywgUFJPQ1VSRU1FTlQgT0YgU1VCU1RJVFVURSBHT09EUyBPUgorIyArICAgU0VS
VklDRVM7IExPU1MgT0YgVVNFLCBEQVRBLCBPUiBQUk9GSVRTOyBPUiBCVVNJTkVTUyBJTlRFUlJV
UFRJT04pIEhPV0VWRVIKKyMgKyAgIENBVVNFRCBBTkQgT04gQU5ZIFRIRU9SWSBPRiBMSUFCSUxJ
VFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVCBMSUFCSUxJVFksCisjICsgICBPUiBUT1JU
IChJTkNMVURJTkcgTkVHTElHRU5DRSBPUiBPVEhFUldJU0UpIEFSSVNJTkcgSU4gQU5ZIFdBWSBP
VVQgT0YgVEhFIFVTRQorIyArICAgT0YgVEhJUyBTT0ZUV0FSRSwgRVZFTiBJRiBBRFZJU0VEIE9G
IFRIRSBQT1NTSUJJTElUWSBPRiBTVUNIIERBTUFHRS4KKyMgKyMrZW5kX3F1b3RlCisjICsKKyMg
KyAgRm9yIGZpbGVzOgorIyArICAtIGNpcGhlci9zbTMtaW50ZWwtYXZ4Mi1hbWQ2NC5TCisjICsK
KyMgKyMrYmVnaW5fcXVvdGUKKyMgKyAgIENvcHlyaWdodCAoYykgMjAyMy0yMDI0LCBJbnRlbCBD
b3Jwb3JhdGlvbgorIyAgCisjICAgICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBh
bmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgICAgIG1vZGlmaWNhdGlvbiwgYXJl
IHBlcm1pdHRlZCBwcm92aWRlZCB0aGF0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucyBhcmUgbWV0
OgorIyAKKyMKKwogU1VNTUFSWSA9ICJHZW5lcmFsIHB1cnBvc2UgY3J5cHRvZ3JhcGhpYyBsaWJy
YXJ5IGJhc2VkIG9uIHRoZSBjb2RlIGZyb20gR251UEciCiBERVNDUklQVElPTiA9ICJBIGNyeXB0
b2dyYXBoeSBsaWJyYXJ5IGRldmVsb3BlZCBhcyBhIHNlcGFyYXRlZCBtb2R1bGUgb2YgR251UEcu
IFwKIEl0IGNhbiBhbHNvIGJlIHVzZWQgaW5kZXBlbmRlbnRseSBvZiBHbnVQRywgYnV0IGRlcGVu
ZHMgb24gaXRzIGVycm9yLXJlcG9ydGluZyBcCkBAIC0xMiw3ICs2Miw3IEBAIExJQ0VOU0U6JHtQ
Tn0tZGV2ID0gIkdQTC0yLjAtb3ItbGF0ZXIgQU5EIExHUEwtMi4xLW9yLWxhdGVyIgogCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT01NzBhOWIzNzQ5ZGQwNDYzYTE3Nzg4
MDNiMTJhNmRjZSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9
NGJmNjYxYzFlMzc5M2U1NWM4ZDEwNTFiYzVlMGFlMjEgXAotICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vTElDRU5TRVM7bWQ1PTAzNGI0ZTM2OTk0NGFkNGI1MmE2ODM2OGYxY2Y5OGI4IFwKKyAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTO21kNT00N2UzNDZhNzFhMjU5M2QxOWY3
NDE0MDg0MDdmZTkxZiBcCiAgICAgICAgICAgICAgICAgICAgICIKIAogREVQRU5EUyA9ICJsaWJn
cGctZXJyb3IiCkBAIC0yNiw3ICs3Niw3IEBAIFNSQ19VUkkgPSAiJHtHTlVQR19NSVJST1J9L2xp
YmdjcnlwdC9saWJnY3J5cHQtJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9uby1i
ZW5jaC1zbG9wZS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2NlMzNjMjQ5MjIyMWEwNDM2Zjk2YTg1MDAy
MTVlOWYzZTNkY2I1ZmQyNmE3NTdjZDQxNWU3YTg0M2JhYmQ1ZSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI5OGQxYjBiMzIwMmQyYjAzZmE3NTRhMzVhYTNjYmJmY2Y1MjZhMzI2MGQ4ZDJlZTIxMzc0
ODAwMWIxMDQzMDA2IgogCiBCSU5DT05GSUcgPSAiJHtiaW5kaXJ9L2xpYmdjcnlwdC1jb25maWci
CiAKLS0gCjIuNDcuMQoK

--===============2061573774666823391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libgcrypt-changelog.txt"

Changelog for libgcrypt: 1.12.2 -> 1.12.3
Source: ChangeLog

2026-08-26  Werner Koch  <wk@gnupg.org>

	Release 1.12.3.
	+ commit a4bccd238c9f972af1abaa4b99967e4181eccfd1
	* configure.ac: Bump LT version to C28/A8/R0.

2026-08-25  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:rsa:pkcs1: Reject shorter PS on decryption.
	+ commit 0729bf7214c63462bfb433732e6d65527d0dc615
	* cipher/rsa-common.c (_gcry_rsa_pkcs1_decode_for_enc): Validate
	the length of PS.

	cipher:rsa:pkcs1: Fix the condition of frame length.
	+ commit 2ef95711d898d65609c232f4f61e38efd066a7bd
	* cipher/rsa-common.c (_gcry_rsa_pkcs1_encode_for_enc): Fix
	the validation of NFRAME and VALUELEN.

2026-08-24  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:rsa:pkcs1: Reject shorter PS on decryption.
	+ commit 9fd5ecd9abe3606e96fb85981ad386f6ea8d0d0a
	* cipher/rsa-common.c (_gcry_rsa_pkcs1_decode_for_enc): Validate
	the length of PS.

2026-08-18  Werner Koch  <wk@gnupg.org>

	tests: Add 3072 and 4096 bit powm benchmarks.
	+ commit 7199d14b0211f23b69012a7412160ee2a1fcb44f
	* tests/benchmark.c (mpi_bench): Add data from two RSA public keys
	with their OpenPGP signatures.

2026-08-18  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:kem:dhkem: Validate OPTIONAL and OPTIONAL_LEN.
	+ commit 8722f83fbf1b3b7f63a72a675c8f49f7e405e0c0
	* cipher/kem.c (_gcry_kem_decap): Check OPTIONAL and OPTIONAL_LEN
	for GCRY_KEM_DHKEM25519 and GCRY_KEM_DHKEM448.

	cipher:ecc:sm2: Use constant time memequal to check.
	+ commit f9de3feb0533cc456474fbeeab86c57f980c75ef
	* cipher/ecc-sm2.c (_gcry_ecc_sm2_decrypt): Use wipememory
	and ct_not_memequal.

	cipher:rsa: Only accept canonical signature.
	+ commit 710d2a438bbfca083b8a680f8c8badc20b8f377f
	* cipher/rsa.c (rsa_verify): Reject if it's <= 0.  Reject if it's
	larger than or equal to N.

	mpi:ec:Edward: Make sure to have fixed length MPI for get_affine.
	+ commit 7004c17e28c3d6e5616c303e8b9fee298c4b8e25
	* mpi/ec.c (_gcry_mpi_ec_get_affine): When copying X and Y, make sure
	to have fixed length.

	cipher:ecc: Only accept canonical value of S.
	+ commit 73967d0ef06fc68a6796a5f646684e56119dad6c
	* cipher/ecc-eddsa.c (_gcry_ecc_eddsa_verify): Reject
	non-canonical S.

2026-08-18  Werner Koch  <wk@gnupg.org>

	tests: Add 3072 and 4096 bit powm benchmarks.
	+ commit e4bd9cd9ec3e7f4ea2ef7676a2d98542ecac9d32
	* tests/benchmark.c (mpi_bench): Add data from two RSA public keys
	with their OpenPGP signatures.

2026-08-12  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:kem:dhkem: Validate OPTIONAL and OPTIONAL_LEN.
	+ commit 0de5c33470d249f511a412d76d15b3a525105371
	* cipher/kem.c (_gcry_kem_decap): Check OPTIONAL and OPTIONAL_LEN
	for GCRY_KEM_DHKEM25519 and GCRY_KEM_DHKEM448.

	cipher:ecc:sm2: Use constant time memequal to check.
	+ commit 8643186e0f63470af44c3a7523aa8fed480dee41
	* cipher/ecc-sm2.c (_gcry_ecc_sm2_decrypt): Use wipememory
	and ct_not_memequal.

	cipher:rsa: Only accept canonical signature.
	+ commit 742f8c149161adeab4b96459170fde363e6ae299
	* cipher/rsa.c (rsa_verify): Reject if it's <= 0.  Reject if it's
	larger than or equal to N.

	mpi:ec:Edward: Make sure to have fixed length MPI for get_affine.
	+ commit 659b22897536ea89bad39b06cf3e9ac094495cdf
	* mpi/ec.c (_gcry_mpi_ec_get_affine): When copying X and Y, make sure
	to have fixed length.

	cipher:ecc: Only accept canonical value of S.
	+ commit 817bfd451b084172fddfceabda64fc8153f5c43b
	* cipher/ecc-eddsa.c (_gcry_ecc_eddsa_verify): Reject
	non-canonical S.

2026-08-11  Werner Koch  <wk@gnupg.org>

	random: Avoid theoretical drive-by loading of netapi32.dll.
	+ commit 9bac8069b3a2a39cf6589fee8e0f8c0112453f62
	* random/rndw32.c (slow_gatherer): Use LoadLibraryEx for netapi32.dll.

	* src/hwfeatures.c (_gcry_get_sysconfdir): Also here for shell32.dll.

2026-08-11  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:rsa:oaep: Validate hash algorithm for use with RSA modulus.
	+ commit 77b3adcab23835c58e8d8c42f15efc5a874f734b
	* cipher/rsa-common.c (_gcry_rsa_oaep_encode): Raise an error if hash
	algo is not appropriate.

	cipher:kdf:baloon: Validate parameters.
	+ commit 663b29d5fcbdb37072f958b3e4fe7f3a3f516f91
	* cipher/kdf.c (BALLOON_TIMECOST_MAX): New.
	(BALLOON_PARALLELISM_MAX): New.
	(balloon_open): Validate parameters with those constants.  Calculate
	the multiplication in 64-bit.

	cipher:kdf:argon2: Validate parallelism.
	+ commit b417f214bac0d4af3d45c50467a39547ed6e60c6
	* cipher/kdf.c (ARGON2_PARALLELISM_MAX): New.
	(argon2_init): Validate with ARGON2_PARALLELISM_MAX.

2026-08-07  Werner Koch  <wk@gnupg.org>

	cipher:kyber: Accept and return a seed with gcry_pk_genkey.
	+ commit e099ccfea9367d215a3bb66bddd7bc46db58037e
	* src/gcrypt-int.h (strcyt kem_genkey_extra_data_s): New.
	* cipher/kem.c (kem_infos): Add field seed_len.  Add value s for the
	  kyber algos.
	(_gcry_kem_genkey): Add optional arg "extra".  Change all callers.
	(kem_generate): Add optiona s-expression arg derive-parms.  Return the
	seed if requested.
	* cipher/kyber.c (kyber_keypair): Ditto.  Return the seed if
	requested.

2026-08-07  NIIBE Yutaka  <gniibe@fsij.org>
	    Werner Koch  <wk@gnupg.org>

	cipher:ecc: Add curve ietf25 with exact RFC8410 semantics.
	+ commit 997217e600abc79888a0684736f34a9e96e667c0
	* cipher/ecc-curves.c ("ietf25"): Add.
	(domain_parms): Add "ietf25".
	* tests/curves.c (N_CURVES): Increment.
	* tests/t-cv25519.c (test_cv_hl25): New.
	(test_cv): Add test_cv_hl25.

2026-08-07  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	bench-slope: skip DSA benchmarking in FIPS mode.
	+ commit bcf7c9186e57a7ec052350c0417f24f32ee2ea4d
	* tests/bench-slope.c (pk_algos): Add 'fips_allowed' field.
	(_pk_bench): Skip algorithm that is not allowed in FIPS mode.

2026-08-06  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	dilithium: use strong random for signature nonce.
	+ commit 70ecc4e943c6d5a83c4099b2a5105f38c16b35d7
	* cipher/pubkey-dilithium.c (randombytes): Add 'level' parameter.
	(mldsa_generate): Use GCRY_VERY_STRONG_RANDOM for key seed.
	(mldsa_sign): Use GCRY_STRONG_RANDOM for per signature value.

	kyber: use strong random for encapsulation coins.
	+ commit d7a3acc13029d7b8e8a689a0afb88c333cb59f21
	* cipher/kyber.c (randombytes): Remove.
	(crypto_kem_keypair_2, crypto_kem_keypair_3, crypto_kem_keypair_4)
	(crypto_kem_enc_2, crypto_kem_enc_3, crypto_kem_enc_4): Remove
	declarations.
	(crypto_kem_keypair, crypto_kem_enc): Remove variant defines.
	(kyber_keypair): Generate coins with GCRY_VERY_STRONG_RANDOM and always
	use derandomized entry point.
	(kyber_encap): Likewise, but with GCRY_STRONG_RANDOM.
	* cipher/kyber-kdep.c (crypto_kem_keypair, crypto_kem_enc): Remove.

	md,cipher: allow internal users to skip fast random poll.
	+ commit 75ff7a959b81acc212d9657b5a6f0b1fcdc8afa0
	* cipher/md.c (md_open): Add 'fast_rnd_poll' parameter.
	(_gcry_md_open_internal): New.
	(_gcry_md_open): Forward to '_gcry_md_open_internal'.
	(_gcry_md_hash_buffer, _gcry_md_hash_buffers_extract): Do not poll on
	the one-shot fallback path.
	* cipher/cipher.c (_gcry_cipher_open_internal): Add 'fast_rnd_poll'
	parameter.
	(_gcry_cipher_open): Request poll.
	* src/cipher.h (_gcry_cipher_open_internal): Move declaration...
	* src/gcrypt-int.h (_gcry_cipher_open_internal): ...to here.
	(_gcry_md_open_internal): New.
	* cipher/kyber.c (shake128_init): Open handle without poll.
	* cipher/dilithium.c (shake128_init, shake256_init): Likewise.
	* cipher/des.c (selftest): Likewise.
	* cipher/dsa-common.c (_gcry_dsa_gen_rfc6979_k): Likewise.
	* cipher/ecc-sm2.c (kdf_x9_63, _gcry_ecc_sm2_encrypt)
	(_gcry_ecc_sm2_decrypt): Likewise.
	* cipher/ecc.c (test_keys_fips, selftest_hash_sign): Likewise.
	* cipher/hash-common.c (_gcry_hash_selftest_check_one): Likewise.
	* cipher/pubkey.c (_gcry_pk_get_keygrip): Likewise.
	* cipher/rijndael.c (selftest_fips_128_38a): Likewise.
	* cipher/rsa-common.c (mgf1, _gcry_rsa_pss_encode)
	(_gcry_rsa_pss_verify): Likewise.
	* cipher/rsa.c (test_keys_fips, selftest_hash_sign_2048): Likewise.
	* random/random-drbg.c (drbg_hash_init, drbg_hmac_init, drbg_sym_init):
	Likewise.
	* src/fips.c (hmac256_check): Likewise.
	* cipher/mceliece6688128f.c (crypto_xof_shake256): Use
	'_gcry_md_hash_buffers_extract'.
	* cipher/mceliece6688128f.sh: Likewise.
	* cipher/kdf.c (openpgp_s2k, _gcry_kdf_pkdf2, prng_aes_ctr_init)
	(onestep_kdf_open, x963_kdf_open): Use internal interface and keep
	poll.
	* cipher/mac-cmac.c (cmac_open): Likewise.
	* cipher/mac-gmac.c (gmac_open): Likewise.
	* cipher/mac-hmac.c (hmac_open, check_one): Likewise.
	* cipher/mac-poly1305.c (poly1305mac_open): Likewise.

	sntrup761: defer reduction in polynomial multiplication.
	+ commit baa3a6376bbacd2bf0e98bc854dc3b81f185d529
	* cipher/sntrup761.c (Rq_mult_small, R3_mult): Accumulate inner product
	in int32_t and reduce once per output coefficient.
	* tests/bench-slope.c (pq_algos): Use full measurement repetitions for
	sntrup761.

	sntrup761: read random values with single call.
	+ commit 3f2f39bf7578c572b724285bb1554ea741562f28
	* cipher/sntrup761.c: Include "bithelp.h".
	(urandom32): Remove.
	(Short_random, Small_random): Fill 32-bit array with one call to random
	function instead of reading four bytes at a time.

	sntrup761: reduce freeze helpers without division.
	+ commit 317c661b16cc25215fc159136bb1ce25a1134ce7
	* cipher/sntrup761.c (int32_divmod_uint14, int32_mod_uint14): Remove.
	(F3_freeze, Fq_freeze): Bias input to non-negative range and compute
	quotient with multiply-shift.

	tests: add sntrup761 internal arithmetic regression test.
	+ commit c3eb48fc637c033e6bf4c00a206761ab5c979608
	* tests/Makefile.am (tests_bin): Add 't-sntrup761'.
	(t_sntrup761_CPPFLAGS): New.
	* tests/t-sntrup761.c: New.

	bench-slope: add RSA and DSA benchmarking.
	+ commit d7b29520c3e6f4df5fa532db5b5e91b685175509
	* tests/bench-slope.c (bench_pk_algo, bench_pk_operation, bench_pk_oper)
	(bench_pk_hd, sample_private_rsa_key_2048, sample_public_rsa_key_2048)
	(sample_private_rsa_key_3072, sample_public_rsa_key_3072)
	(sample_private_rsa_key_4096, sample_public_rsa_key_4096)
	(sample_private_dsa_key_2048, sample_public_dsa_key_2048)
	(sample_private_dsa_key_3072, sample_public_dsa_key_3072, pk_algos)
	(pk_algo_name, pk_map_name, bench_pk_init, bench_pk_free)
	(bench_pk_sign_do_bench, bench_pk_verify_do_bench, pk_sign_ops)
	(pk_verify_ops, pk_operations, cipher_pk_one, _pk_bench, pk_bench): New.
	(print_help): Add mention of 'pk'.
	(main): Add "pk" tests.

	bench-slope: add post-quantum algorithm benchmarking.
	+ commit 1f996ac4c106686b43c60a09e65ce356533ba8ca
	* tests/bench-slope.c (bench_pq_algo, bench_pq_operation, bench_pq_oper)
	(bench_pq_kem_hd, bench_pq_sig_hd, pq_algos, PQ_SIG_SEED_LEN)
	(PQ_SIG_MSG_LEN, pq_algo_name, pq_algo_is_kem, pq_map_name)
	(pq_setup_obj, bench_pq_kem_keypair, bench_pq_kem_init)
	(bench_pq_kem_free, bench_pq_kem_encapsulate)
	(bench_pq_kem_keygen_do_bench, bench_pq_kem_encap_do_bench)
	(bench_pq_kem_decap_do_bench, bench_pq_sig_init, bench_pq_sig_free)
	(bench_pq_sig_keygen, bench_pq_sig_keygen_do_bench)
	(bench_pq_sig_sign_do_bench, bench_pq_sig_verify_do_bench)
	(pq_kem_keygen_ops, pq_kem_encap_ops, pq_kem_decap_ops)
	(pq_sig_keygen_ops, pq_sig_sign_ops, pq_sig_verify_ops)
	(pq_kem_operations, pq_sig_operations, cipher_pq_one, _pq_bench)
	(pq_bench, include_slow, bench_print_result_skipped): New.
	(print_help): Add mention of 'pq' and '--include-slow'.
	(main): Add "pq" tests and '--include-slow' option.

	bench-slope: add option to disable quick random generation.
	+ commit 1f1c8f4dae428f1c7368b501c463297ca72f4213
	* tests/bench-slope.c (print_help): Add '--no-quick-rng'.
	(main): Add '--no-quick-rng' option and initialize RNG before
	benchmarking.

2026-08-05  NIIBE Yutaka  <gniibe@fsij.org>

	sexp:scan: Fix parsing quoted and CRLF/LFCR.
	+ commit 1d97fc609e93015e0e05fb4a603653550ab025e0
	* src/sexp.c (do_vsexp_sscan): Check the buffer limit correctly.

	mpi:scan: Support BUFLEN check for GCRYMPI_FMT_SSH.
	+ commit 163569bff1f5459e092f38b7031dfb005050a5a3
	* mpi/mpicoder.c (_gcry_mpi_scan): Enable the length validation for
	GCRYMPI_FMT_SSH.

	cipher:rsa: Fix verify RSA PSS verify.
	+ commit 0d64fc228f1096d86f9a1a6e774dd0724c090628
	* cipher/rsa-common.c (_gcry_rsa_pss_verify): Validate EMLEN, before
	the allocation.

2026-08-04  Werner Koch  <wk@gnupg.org>

	ecc: Avoid a NULL ptr deref due to a unsupported genkey flag.
	+ commit 3b259530bca5903b64ebc93ac266cfb8bd057495
	* cipher/ecc.c (ecc_generate): Return an error for a missing Qy.

2026-08-03  Werner Koch  <wk@gnupg.org>

	tests: Add KDF test case from RFC-9580.
	+ commit af761dabf98423b42bb4f434c9d67526cefce98c
	* tests/t-kdf.c (check_hkdf): Add test case

	mpi: Use constants for the flags.
	+ commit c217b5f7fc788b199d698dc333ebd0a6acd24f93
	* mpi/mpiutil.c: Use our constants instead of numeric vlaues for the
	  flags.

2026-07-29  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	bufhelp: use aligned type on all targets when alignment is known.
	+ commit db3c38937db571868f64ecb727ccb5183679c7de
	* cipher/bufhelp.h (buf_load32_maybe_unaligned)
	(buf_store32_maybe_unaligned, buf_load64_maybe_unaligned)
	(buf_store64_maybe_unaligned): New.
	(buf_load32, buf_store32, buf_load64, buf_store64): Move compile-time
	alignment check out of RISC-V specific path.

	bufhelp: avoid byte-wise load/store on RISC-V with Zicclsm.
	+ commit e18a5eb65009e5523ce42fbbf73a22cd73498db3
	* cipher/bufhelp.h (bufhelp_u32_aligned_t, bufhelp_u64_aligned_t)
	(buf_load32, buf_store32, buf_load64, buf_store64): New.
	(buf_get_be32, buf_get_le32, buf_put_be32, buf_put_le32)
	(buf_get_be64, buf_get_le64, buf_put_be64, buf_put_le64): Use
	'buf_load32'/'buf_load64' and 'buf_store32'/'buf_store64'.

2026-07-28  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	riscv: use memory operands for inline assembly load/store.
	+ commit 7f192cb46c0d970309c750499c98d67d863c305c
	* cipher/cipher-gcm-riscv-zbb-zbc.c (load_aligned_u64x2)
	(store_aligned_u64x2): Use memory operand instead of register operand
	with offset in assembly template and 'memory' clobber.
	(load_unaligned_u64x2): Skip alignment check when Zicclsm is enabled.
	* cipher/crc-riscv-zbb-zbc.c (load_aligned_u32, load_aligned_u64x2):
	Use memory operand instead of register operand with offset in assembly
	template and 'memory' clobber.

	riscv: use unaligned vector memory access when supported.
	+ commit ecaa3572e10f6808bed324fe55d4c6b0232402db
	* cipher/Makefile.am: Use -mstrict-align only for plain RVV
	implementations; add Zvkb to RVV-crypto -march flags.
	* cipher/chacha20-riscv-v.c (unaligned_load_u32m1)
	(unaligned_store_u32m1): New.
	(chacha20_rvv_blocks): Use unaligned load/store helpers.
	* cipher/cipher-gcm-riscv-zvkg.c (unaligned_load_u32m1): Use element
	width access when RVV_UNALIGNED_NOT_ALLOWED is not defined.
	* cipher/rijndael-riscv-zvkned.c (unaligned_load_u64m1)
	(unaligned_load_u32m1, unaligned_store_u32m1, unaligned_load_u32m2)
	(unaligned_store_u32m2, unaligned_load_u32m4, unaligned_store_u32m4):
	Likewise.
	* cipher/sha256-riscv-zvknha-zvkb.c (load_and_swap): Likewise; drop
	'vl_bytes' parameter.
	(sha256_transform_zvknha_zvkb): Remove 'vl_bytes'.
	* cipher/sha512-riscv-zvknhb-zvkb.c: Likewise.
	* cipher/simd-common-riscv.h (RVV_UNALIGNED_NOT_ALLOWED): New.
	* configure.ac: Replace -mstrict-align compiler support check with
	Zicclsm enabled check; add Zicclsm to MARCH_RVA23U64_BASE and Zvkb to
	MARCH_RVA23U64_WITH_VEC_CRYPTO; drop -mstrict-align from RVV-crypto
	check flags; add vrev8 to RVV-crypto intrinsics test.

	cipher: remove transitional ctr_enc alias.
	+ commit 365e6f726c52ba67b07ab25c1e7f8e31413819eb
	* cipher/cipher-internal.h (ctr_enc): Remove transitional alias.
	* cipher/rijndael-s390x.c (_gcry_aes_s390x_setup_acceleration): Assign
	ctr16be_enc bulk op.

	des: reduce CTR bulk counter carry handling to 16 bits.
	+ commit 4dd49372902772bd7d1f66662d76a2a7fe516f5b
	* cipher/des.c (_gcry_3des_ctr_enc): Use cipher_block_add_be16.
	(do_tripledes_setkey): Assign ctr16be_enc bulk op.

	twofish: reduce CTR bulk counter carry handling to 16 bits.
	+ commit d226d4c2d547e1c00e5298b66dba27f966c84dd9
	* cipher/twofish.c (twofish_setkey): Assign ctr16be_enc bulk op.
	(_gcry_twofish_ctr_enc): Use cipher_block_add_be16.
	* cipher/twofish-amd64.S (RT0bl, RT1bl): New.
	(_gcry_twofish_amd64_ctr_enc): Increment low 16 counter bits in place,
	drop full-width carry and byteswap.
	* cipher/twofish-avx2-amd64.S (inc_le128): Remove.
	(_gcry_twofish_avx2_ctr_enc): Add to low 16 counter bits only, drop
	full-width carry handling.

	sm4: reduce CTR bulk counter carry handling to 16 bits.
	+ commit 83bcf5e750caac2b97e6579c75aaf8945f6dd32b
	* cipher/sm4.c (sm4_setkey): Assign ctr16be_enc bulk op.
	* cipher/sm4-aesni-avx-amd64.S (inc_le128): Remove.
	(_gcry_sm4_aesni_avx_ctr_enc): Add to low 16 counter bits only, drop
	full-width carry handling.
	* cipher/sm4-avx2-amd64.h: Likewise.
	* cipher/sm4-avx512-amd64.h (ctr_enc_blk32): Add to low 16 counter bits
	only, drop full-width carry handling.
	* cipher/sm4-intel-avx512-amd64.S (add_le128): Remove.
	* cipher/sm4-gfni-avx512-amd64.S (add_le128): Remove.
	(_gcry_sm4_gfni_avx512_ctr_enc): Add to low 16 counter bits only, drop
	full-width carry handling.
	* cipher/sm4-aarch64.S: Likewise.
	* cipher/sm4-armv8-aarch64-ce.S: Likewise.
	* cipher/sm4-armv9-aarch64-sve-ce.S: Likewise.

	serpent: reduce CTR bulk counter carry handling to 16 bits.
	+ commit 19c6853838889972de5ea447b4b14980c72938b5
	* cipher/serpent.c (serpent_setkey): Assign ctr16be_enc bulk op.
	(_gcry_serpent_ctr_enc): Use cipher_block_add_be16.
	* cipher/serpent-avx2-amd64.S (inc_le128): Remove.
	(_gcry_serpent_avx2_ctr_enc): Add to low 16 counter bits only, drop
	full-width overflow path.
	* cipher/serpent-sse2-amd64.S (_gcry_serpent_sse2_ctr_enc): Add to low
	16 counter bits only, drop full-width overflow path.
	* cipher/serpent-avx512-x86.c (ctr_generate): Do 16-bit big-endian
	counter addition, add carry slow path with vpaddw/vpshufb.
	* cipher/serpent-armv7-neon.S (_gcry_serpent_neon_ctr_enc): Drop 64-bit
	counter overflow path.
	* cipher/Makefile.am (avx512f_cflags): Add -mavx512bw.
	* configure.ac: Add -mavx512bw and _mm512_shuffle_epi8 to AVX512
	intrinsics check.

	cast5: reduce CTR bulk counter carry handling to 16 bits.
	+ commit 9e5b079a3acc7b39e98a87bcd6e1e1a8d2bbcedf
	* cipher/cast5.c (cast_setkey): Assign ctr16be_enc bulk op.
	(_gcry_cast5_ctr_enc): Use cipher_block_add_be16.
	* cipher/cast5-arm.S (_gcry_cast5_arm_ctr_enc): Drop 64-bit counter
	carry propagation in IV construction.

	camellia: reduce CTR bulk counter carry handling to 16 bits.
	+ commit b556ded47cdf0f5647b81d27dfc17203bbdb5ffd
	* cipher/camellia-glue.c (camellia_setkey): Assign ctr16be_enc bulk op.
	* cipher/camellia-aesni-avx-amd64.S (inc_le128): Remove.
	(_gcry_camellia_aesni_avx_ctr_enc): Add to low 16 counter bits only,
	drop full-width overflow path.
	* cipher/camellia-aesni-avx2-amd64.h: Likewise.
	* cipher/camellia-gfni-avx512-amd64.S: Likewise.

	blowfish: reduce CTR bulk counter carry handling to 16 bits.
	+ commit e15480f8255546e6b067a4e8131c23293017a211
	* cipher/blowfish.c (bf_setkey): Assign ctr16be_enc bulk op.
	(_gcry_blowfish_ctr_enc): Use cipher_block_add_be16.
	* cipher/blowfish-arm.S (_gcry_blowfish_arm_ctr_enc): Drop 64-bit
	counter carry propagation in IV construction.

	aria: reduce CTR bulk counter carry handling to 16 bits.
	+ commit 0345d09c78b10f306c29a70bf9ba24ce3032deda
	* cipher/aria.c (aria_setkey): Assign ctr16be_enc bulk op.
	* cipher/aria-aesni-avx-amd64.S (inc_le128): Remove.
	(__aria_aesni_avx_ctr_gen_keystream_16way): Add to low 16 counter bits
	only, drop full-width overflow path.
	* cipher/aria-aesni-avx2-amd64.S: Likewise.
	* cipher/aria-gfni-avx512-amd64.S: Likewise.

	cipher: aes: reduce CTR bulk counter carry handling to 16 bits.
	+ commit 0762bd3d3ccd70ef2ca0305576d5e6f3a7c3a223
	* cipher/cipher-internal.h (cipher_bulk_ops_t): Rename 'ctr_enc' member
	to 'ctr16be_enc'.
	(ctr_enc): New transitional alias macro.
	(cipher_block_add): Widen 'add' to u64.
	(cipher_block_add_be16): New.
	* cipher/cipher-ctr.c (_gcry_cipher_ctr_encrypt_ctx): Split bulk work at
	low 16-bit counter overflow and do full-width carry addition here.
	* cipher/bulkhelp.h (bulk_ctr_enc_128): Use cipher_block_add_be16.
	* cipher/rijndael.c (do_setkey): Assign ctr16be_enc bulk op.
	(_gcry_aes_ctr_enc): Use cipher_block_add_be16.
	* cipher/rijndael-aesni.c (do_aesni_ctr, do_aesni_ctr_4)
	(do_aesni_ctr_8): Drop full-width counter carry handling.
	* cipher/rijndael-ssse3-amd64.c (_gcry_aes_ssse3_ctr_enc): Likewise.
	* cipher/rijndael-vp-simd128.h (FUNC_CTR_ENC): Likewise.
	* cipher/rijndael-armv8-aarch32-ce.S (_gcry_aes_ctr_enc_armv8_ce):
	Likewise.
	* cipher/rijndael-armv8-aarch64-ce.S (_gcry_aes_ctr_enc_armv8_ce):
	Likewise.
	* cipher/rijndael-ppc-functions.h (CTR_ENC_FUNC): Likewise.
	* cipher/rijndael-riscv-zvkned.c (_gcry_aes_riscv_zvkned_ctr_enc):
	Likewise.
	* cipher/rijndael-vaes-avx2-amd64.S (_gcry_vaes_avx2_ctr_enc_amd64):
	Likewise.
	* cipher/rijndael-vaes-avx2-i386.S (_gcry_vaes_avx2_ctr_enc_i386):
	Likewise.
	* cipher/rijndael-vaes-avx512-amd64.S (_gcry_vaes_avx512_ctr_enc_amd64):
	Likewise.
	* tests/basic.c (cipher_cbc_bulk_test, cipher_cfb_bulk_test)
	(cipher_ctr_bulk_test): Add verbose output.
	(cipher_ctr16_overflow_test, check_ctr16_overflow): New.
	(check_cipher_modes): Call check_ctr16_overflow.

2026-07-24  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	rijndael-armv8-aarch32-ce: clear q15 holding last round key.
	+ commit 726e992bdf2efea24f3d82470a048523f259c1a9
	* cipher/rijndael-armv8-aarch32-ce.S (_gcry_aes_cbc_enc_armv8_ce)
	(_gcry_aes_cbc_dec_armv8_ce, _gcry_aes_ecb_enc_armv8_ce)
	(_gcry_aes_ecb_dec_armv8_ce, _gcry_aes_cfb_enc_armv8_ce)
	(_gcry_aes_cfb_dec_armv8_ce, _gcry_aes_ctr_enc_armv8_ce)
	(_gcry_aes_ctr32le_enc_armv8_ce, _gcry_aes_ocb_enc_armv8_ce)
	(_gcry_aes_ocb_dec_armv8_ce, _gcry_aes_ocb_auth_armv8_ce)
	(_gcry_aes_xts_enc_armv8_ce, _gcry_aes_xts_dec_armv8_ce): Clear q15 on
	function exit.

	cipher: fold AEAD byte-counter helper to 64-bit accumulator.
	+ commit 4216338d0f2528049d86a69c3385b158bb316f15
	* cipher/cipher-internal.h (cipher_bytecounter_add): Rewrite using
	64-bit accumulator.

	cipher-gcm: assert 32 KiB input cap in gcm_ctr_encrypt.
	+ commit 642722537b5f380fd6e55376e7626b842388d6ac
	* cipher/cipher-gcm.c (gcm_ctr_encrypt): Assert input length cap that
	keeps CTR-wrap chunk math from overflowing.

	cipher-ocb: fix split-AAD abort at L-table wrap boundary.
	+ commit 6ca6cc222772adb9782359d855b301d1d0d1b239
	* cipher/cipher-ocb.c (_gcry_cipher_ocb_authenticate): Pass aad_nblocks
	to ocb_get_L_big in buffered-block path, not aad_nblocks + 1.
	* tests/basic.c (ocb_aad_tag, check_ocb_cipher_aad_tablewrap): New.
	(check_ocb_cipher): Call check_ocb_cipher_aad_tablewrap.

	gost28147: fix out-of-bounds read in IMIT MAC verify.
	+ commit db7850c2117729cc57e498c5631effdade5b6341
	* cipher/gost28147.c (gost_imit_verify): Reject tag longer than MAC.
	* tests/basic.c (check_mac_gost_imit_verify_len): New.
	(check_mac): Call check_mac_gost_imit_verify_len.

	cipher-cmac: fix CMAC block-count truncation for 64 GiB writes.
	+ commit e1a352f89e10539d91294b6cbf7fc76d72585a99
	* cipher/cipher-cmac.c (_gcry_cmac_write): Use size_t for nblocks.

	cipher: fix spurious AEAD byte-counter carry for 4 GiB adds.
	+ commit 6e5ae3fbed53fb60dfd074d63aed86a97c79c595
	* cipher/cipher-internal.h (cipher_bytecounter_add): New.
	* cipher/cipher-gcm.c (gcm_bytecounter_add): Use shared helper.
	* cipher/cipher-gcm-siv.c (gcm_siv_bytecounter_add): Likewise.
	* cipher/cipher-poly1305.c (poly1305_bytecounter_add): Likewise.
	* tests/Makefile.am (tests_bin): Add 't-cipher-internal'.
	(t_cipher_internal_CPPFLAGS): New.
	* tests/t-cipher-internal.c: New test.

	rijndael-vp-riscv: clear upper half when moving 128-bit to 256-bit.
	+ commit 69ca1d2f149f447ff2c5832ad687fd9392787b2d
	* cipher/rijndael-vp-riscv.c (movdqa128_256): Clear high 128-bit half
	of target 256-bit vector register.

	cipher: prefer 128-bit blocksize in inline block helpers.
	+ commit 5f2306fbe47097ff82ec520074d23315d5bbc80e
	* cipher/cipher-internal.h (_gcry_blocksize_shift, cipher_block_add)
	(cipher_block_cpy, cipher_block_xor, cipher_block_xor_2dst)
	(cipher_block_xor_n_copy_2, cipher_block_bswap): Mark 8-byte blocksize
	branch with UNLIKELY.

	secmem: use nested #if for __has_feature test.
	+ commit 7102d0e5cfc0d928d9a46e927636ed413ab56ef1
	* src/secmem.c (lock_pool_pages): Test __has_feature with a nested #if
	instead of a single combined expression.

	Detect nonstring attribute via __has_attribute.
	+ commit d0f8420f5b3f5ec799599e5aff815917656fbd90
	* src/gcrypt.h.in (_GCRY_GCC_ATTR_NONSTRING): Detect with
	__has_attribute instead of GCC version check.

2026-07-18  Werner Koch  <wk@gnupg.org>

	doc: Fix descriptions of gcry_mpi_set/clear_flag.
	+ commit 14acdaf733ac278551f561ede76db5c4df8e91f3
	* mpi/mpiutil.c (_gcry_mpi_clear_flag): Remove marking of A as unused.

2026-07-04  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	cipher: limit table prefetch to the look-up table arrays.
	+ commit 35f4e5abf22c8a1cb07314914d29b11c63decb5b
	* cipher/aria.c (prefetch_sboxes): Compute unshare counter once
	and prefetch only look-up arrays.
	* cipher/cipher-gcm.c (do_prefetch_tables): Likewise.
	* cipher/rijndael.c (prefetch_enc, prefetch_dec): Likewise.
	* cipher/sm4.c (prefetch_sbox_table): Likewise.
	* cipher/rijndael-tables.h (dec_tables): Rename 'inv_sbox' field to
	'inv_sboxT'.

	sm4: tail-call ARM and PPC crypt_blk1_x helpers.
	+ commit 054aad385729ab9d42cee508c993b9aabe123835
	* cipher/sm4-aarch64.S (sm4_aarch64_crypt_blk1_4)
	(_gcry_sm4_aarch64_crypt_blk1_8): Return zero stack burn size.
	* cipher/sm4-armv8-aarch64-ce.S (sm4_armv8_ce_crypt_blk1_4)
	(_gcry_sm4_armv8_ce_crypt_blk1_8): Likewise.
	* cipher/sm4-armv9-aarch64-sve-ce.S (_gcry_sm4_armv9_sve_ce_crypt):
	Likewise.
	* cipher/sm4-ppc.c (sm4_ppc_crypt_blk1_16, _gcry_sm4_ppc8le_crypt_blk1_16)
	(_gcry_sm4_ppc9le_crypt_blk1_16): Likewise.
	* cipher/sm4.c (_gcry_sm4_aarch64_crypt_blk1_8)
	(_gcry_sm4_armv8_ce_crypt_blk1_8, _gcry_sm4_armv9_sve_ce_crypt)
	(_gcry_sm4_ppc8le_crypt_blk1_16, _gcry_sm4_ppc9le_crypt_blk1_16):
	Likewise.
	(sm4_aarch64_crypt_blk1_16, sm4_armv8_ce_crypt_blk1_16)
	(sm4_armv9_sve_ce_crypt_blk1_16, sm4_ppc8le_crypt_blk1_16)
	(sm4_ppc9le_crypt_blk1_16): Tail-call the underlying blk1_x helper.

2026-06-28  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	sm4: deduplicate OCB bulk dispatch using function pointers.
	+ commit aaa88b3fa150f336ac2ef73e5d5217b8eebfac07
	* cipher/sm4.c (SM4_context) [ASM_FUNC_ABI]: New members caching the
	selected OCB bulk function pointers and their resolution state.
	(ocb_crypt_fn_t, ocb_auth_fn_t) [ASM_FUNC_ABI]: New.
	(_gcry_sm4_aesni_avx_ocb_enc, _gcry_sm4_aesni_avx_ocb_dec)
	(_gcry_sm4_aesni_avx_ocb_auth, _gcry_sm4_aesni_avx2_ocb_enc)
	(_gcry_sm4_aesni_avx2_ocb_dec, _gcry_sm4_aesni_avx2_ocb_auth)
	(_gcry_sm4_intel_avx2_ocb_enc, _gcry_sm4_intel_avx2_ocb_dec)
	(_gcry_sm4_intel_avx2_ocb_auth, _gcry_sm4_intel_avx512_ocb_enc_blk32)
	(_gcry_sm4_intel_avx512_ocb_dec_blk32, _gcry_sm4_gfni_avx2_ocb_enc)
	(_gcry_sm4_gfni_avx2_ocb_dec, _gcry_sm4_gfni_avx2_ocb_auth)
	(_gcry_sm4_gfni_avx512_ocb_enc, _gcry_sm4_gfni_avx512_ocb_dec)
	(_gcry_sm4_gfni_avx512_ocb_auth, _gcry_sm4_gfni_avx512_ocb_enc_blk32)
	(_gcry_sm4_gfni_avx512_ocb_dec_blk32): Make 'Ls' an unsized array
	parameter.
	(sm4_crypt_blk1_32): Process the head 16-block chunk then tail-call the
	remainder instead of looping.
	(_gcry_sm4_ocb_crypt, _gcry_sm4_ocb_auth) [ASM_FUNC_ABI]: Select the
	bulk implementation through a function pointer and share the
	8/16/32-block processing loops; resolve and cache the selection in the
	context on the first bulk call.

	sm4: add Intel SM4 instructions accelerated AVX512 implementation.
	+ commit 14d1a882aacd0263e82747c14e52f352dfa796f8
	* cipher/Makefile.am: Add 'sm4-avx512-amd64.h' and
	'sm4-intel-avx512-amd64.S'.
	* cipher/sm4-avx512-amd64.h: New, 32-block cipher mode functions moved
	here from 'sm4-gfni-avx512-amd64.S'.
	* cipher/sm4-gfni-avx512-amd64.S (_gcry_sm4_gfni_avx512_crypt_blk32)
	(_gcry_sm4_gfni_avx512_ctr_enc_blk32)
	(_gcry_sm4_gfni_avx512_cbc_dec_blk32)
	(_gcry_sm4_gfni_avx512_cfb_dec_blk32)
	(_gcry_sm4_gfni_avx512_ocb_enc_blk32)
	(_gcry_sm4_gfni_avx512_ocb_dec_blk32): Move to 'sm4-avx512-amd64.h'.
	(FUNC_NAME, SM4_CRYPT_BLK32): New.
	* cipher/sm4-intel-avx512-amd64.S: New.
	* cipher/sm4.c (USE_INTEL_SM4_AVX512): New.
	(ASM_FUNC_ABI): Define also for Intel SM4 AVX512 implementation.
	(SM4_context): Add 'use_intel_sm4_avx512'.
	(_gcry_sm4_intel_avx512_ctr_enc_blk32)
	(_gcry_sm4_intel_avx512_cbc_dec_blk32)
	(_gcry_sm4_intel_avx512_cfb_dec_blk32)
	(_gcry_sm4_intel_avx512_ocb_enc_blk32)
	(_gcry_sm4_intel_avx512_ocb_dec_blk32)
	(_gcry_sm4_intel_avx512_crypt_blk32): New.
	(sm4_setkey): Enable Intel SM4 AVX512 implementation if supported by CPU.
	(sm4_crypt_blk1_32, _gcry_sm4_ctr_enc, _gcry_sm4_cbc_dec)
	(_gcry_sm4_cfb_dec, _gcry_sm4_ocb_crypt) [USE_INTEL_SM4_AVX512]: Add
	Intel SM4 AVX512 code path.
	* configure.ac (GCRYPT_ASM_CIPHERS) [x86_64]: Add
	'sm4-intel-avx512-amd64.lo'.

	sm4: add Intel SM4 instructions accelerated AVX2 implementation.
	+ commit df44b486ba99efa451c24144a9ca34326f4d9685
	* cipher/Makefile.am: Add 'sm4-intel-avx2-amd64.S'.
	* cipher/sm4-intel-avx2-amd64.S: New.
	* cipher/sm4.c (USE_INTEL_SM4_AVX2): New.
	(ASM_FUNC_ABI): Define also for Intel SM4 implementation.
	(SM4_context): Add 'use_intel_sm4_avx2'.
	(_gcry_sm4_intel_avx2_expand_key, _gcry_sm4_intel_avx2_ctr_enc)
	(_gcry_sm4_intel_avx2_cbc_dec, _gcry_sm4_intel_avx2_cfb_dec)
	(_gcry_sm4_intel_avx2_ocb_enc, _gcry_sm4_intel_avx2_ocb_dec)
	(_gcry_sm4_intel_avx2_ocb_auth, _gcry_sm4_intel_avx2_crypt_blk1_16)
	(sm4_intel_avx2_crypt_blk1_16): New.
	(sm4_expand_key): Add Intel SM4 code-path.
	(sm4_setkey): Use Intel SM4 implementation if supported by CPU.
	(sm4_encrypt, sm4_decrypt, sm4_get_crypt_blk1_16_fn)
	(_gcry_sm4_ctr_enc, _gcry_sm4_cbc_dec, _gcry_sm4_cfb_dec)
	(_gcry_sm4_ocb_crypt, _gcry_sm4_ocb_auth) [USE_INTEL_SM4_AVX2]: Add
	Intel SM4 code-path.
	* configure.ac (gcry_cv_gcc_inline_asm_sm4, HAVE_GCC_INLINE_ASM_SM4): New.
	(GCRYPT_ASM_CIPHERS) [x86_64]: Add 'sm4-intel-avx2-amd64.lo'.
	* doc/gcrypt.texi: Add "intel-sm4" to HW features list.
	* src/g10lib.h (HWF_INTEL_SM4): New.
	* src/hwf-x86.c (detect_x86_gnuc): Add Intel SM4 detection.
	* src/hwfeatures.c (hwflist): Add "intel-sm4".

	sm4: deduplicate AVX2 cipher mode code between AES-NI and GFNI.
	+ commit c2ff450c51b36b3c79c645fb27e8d26b8077a3ac
	* cipher/Makefile.am: Add 'sm4-avx2-amd64.h'.
	* cipher/sm4-avx2-amd64.h: New, shared cipher mode functions moved
	here from 'sm4-aesni-avx2-amd64.S' and 'sm4-gfni-avx2-amd64.S'.
	* cipher/sm4-aesni-avx2-amd64.S (__sm4_crypt_blk16): Rename to
	'__sm4_aesni_crypt_blk16'.
	(_gcry_sm4_aesni_avx2_ctr_enc, _gcry_sm4_aesni_avx2_cbc_dec)
	(_gcry_sm4_aesni_avx2_cfb_dec, _gcry_sm4_aesni_avx2_ocb_enc)
	(_gcry_sm4_aesni_avx2_ocb_dec, _gcry_sm4_aesni_avx2_ocb_auth)
	(inc_le128, Lbige_addb_0_*): Move to 'sm4-avx2-amd64.h'.
	(FUNC_NAME, SM4_CRYPT_BLK16): New.
	* cipher/sm4-gfni-avx2-amd64.S (_gcry_sm4_gfni_avx2_ctr_enc)
	(_gcry_sm4_gfni_avx2_cbc_dec, _gcry_sm4_gfni_avx2_cfb_dec)
	(_gcry_sm4_gfni_avx2_ocb_enc, _gcry_sm4_gfni_avx2_ocb_dec)
	(_gcry_sm4_gfni_avx2_ocb_auth, inc_le128, Lbige_addb_0_*): Move
	to 'sm4-avx2-amd64.h'.
	(FUNC_NAME, SM4_CRYPT_BLK16): New.

	sm3: add Intel SM3 extension implementation.
	+ commit 3f94b92e05708a77ba4adca2132409dc19512013
	* LICENSES: Add 'cipher/sm3-intel-avx2-amd64.S'.
	* cipher/Makefile.am: Add 'sm3-intel-avx2-amd64.S'.
	* cipher/sm3-intel-avx2-amd64.S: New.
	* cipher/sm3.c (USE_INTEL_SM3): New.
	(ASM_FUNC_ABI, ASM_EXTRA_STACK): Define also for USE_INTEL_SM3.
	[USE_INTEL_SM3] (_gcry_sm3_transform_intel_avx2)
	(do_sm3_transform_intel_avx2): New.
	(sm3_init) [USE_INTEL_SM3]: Use Intel SM3 accelerated implementation if
	HW feature available.
	* configure.ac (gcry_cv_gcc_inline_asm_sm3)
	(HAVE_GCC_INLINE_ASM_SM3): New.
	(GCRYPT_ASM_DIGESTS) [x86_64]: Add 'sm3-intel-avx2-amd64.lo'.
	* doc/gcrypt.texi: Add "intel-sm3" to HW features list.
	* src/g10lib.h (HWF_INTEL_SM3): New.
	* src/hwf-x86.c (detect_x86_gnuc): Add Intel SM3 detection.
	* src/hwfeatures.c (hwflist): Add "intel-sm3".

	sha512: add Intel SHA512 extension implementation.
	+ commit 0f8a34038db46c22786dc94d07a216f784a5b72c
	* cipher/Makefile.am: Add 'sha512-intel-shaext.c'; Add instrumentation
	option munging for 'sha512-intel-shaext.o' and 'sha512-intel-shaext.lo'.
	* cipher/sha512-intel-shaext.c: New.
	* cipher/sha512.c (USE_SHA512_INTEL): New.
	[USE_SHA512_INTEL] (_gcry_sha512_transform_intel_shaext)
	(do_sha512_transform_intel_shaext): New.
	(sha512_init_common) [USE_SHA512_INTEL]: Use Intel SHA512 accelerated
	implementation if HW feature available.
	* configure.ac (gcry_cv_gcc_inline_asm_sha512)
	(HAVE_GCC_INLINE_ASM_SHA512): New.
	(GCRYPT_ASM_DIGESTS) [x86]: Add 'sha512-intel-shaext.lo'.
	* doc/gcrypt.texi: Add "intel-sha512" to HW features list.
	* src/g10lib.h (HWF_INTEL_SHA512): New.
	* src/hwf-x86.c (get_cpuid_subleaf): New, based on 'get_cpuid'.
	(get_cpuid): Implement as wrapper for 'get_cpuid_subleaf'.
	(detect_x86_gnuc): Add Intel SHA512 detection.
	* src/hwfeatures.c (hwflist): Add "intel-sha512".

	Add straight-line speculation hardening for function ends.
	+ commit 9b684f4a448e8948b4c1fd1316320fa97fd8109a
	* cipher/asm-common-amd64.h (SPEC_STOP): New.
	(CFI_ENDPROC): Emit straight-line speculation barrier at function end.
	(ret_spec_stop): Use 'SPEC_STOP'.
	* cipher/asm-common-i386.h (SPEC_STOP, CFI_ENDPROC, ret_spec_stop):
	Likewise.
	* cipher/asm-common-aarch64.h (SPEC_STOP, CFI_ENDPROC, ret_spec_stop):
	Likewise.
	* cipher/cast5-amd64.S (__cast5_dec_blk4): Move 'CFI_ENDPROC' after
	'ret_spec_stop'.
	* mpi/i386/syntax.h (SPEC_STOP): New.
	(ret_spec_stop): Use 'SPEC_STOP'.

2026-06-04  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:kem: Validate input length.
	+ commit db5ae94eb01feb3cb60d42e6caa75106e3e781fc
	* cipher/kem.c (_gcry_kem_genkey): Add input length validation.
	(_gcry_kem_encap, _gcry_kem_decap): Likewise.
	* src/gcrypt.h.in: Add forgotten constants for X448.

	sexp: Add length check DATALEN when parsing SEXP.
	+ commit 5b0d3ff945004c428c61ec016c102fa22dc55757
	* src/sexp.c (do_vsexp_sscan): Raise an error when the length
	cannot be represented by the DATALEN type.

	cipher:gcm: Silence GCC 15 warning.
	+ commit 9774fd1d9d63d816882f8c717e941797d9220afa
	* cipher/cipher-gcm.c (do_ghash_buf): Avoid nagative N.

2026-06-01  John Thacker  <johnthacker@gmail.com>

	w32: Type SSIZE_T as ssize_t instead of long when building with MSVC.
	+ commit 0933792c057623d16c51577a35ecd53793ab7d96
	* src/gcrypt.h.in (!__GNUC__,W32): Include Windows header.

2026-05-13  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	Fix carry flag clobber for powerpc inline assembly with clang.
	+ commit 92a2b41e94c1b63700b8b01ae11ccbeb0ae4a2a8
	* mpi/longlong.h [_ARCH_PPC || _ARCH_PPC64] (__PPC_CLOBBER_CC)
	(add_ssaaaa, sub_ddmmss): Add "xer" to clobber list.
	* mpi/ec-inline.h [__powerpc__] (ADD3_LIMB64, SUB3_LIMB64)
	(ADD4_LIMB64, SUB4_LIMB64, ADD5_LIMB64, SUB5_LIMB64): Likewise.
	* cipher/poly1305.c [__powerpc__] (ADD_1305_64): Likewise.

	configure: use AC_LINK_IFELSE for intrinsics to fix LTO builds.
	+ commit 77b98375ff4d6e9667ba6c8233e98e430d2c6988
	* configure.ac (gcry_cv_cc_x86_avx512_intrinsics)
	(GCRY_AARCH64_NEON_INTRINSICS_TEST)
	(GCRY_POWERPC_VECTOR_INTRINSICS_TEST)
	(GCRY_RISCV_VECTOR_INTRINSICS_TEST): Add main() function to test
	program.
	(gcry_cv_cc_x86_avx512_intrinsics)
	(gcry_cv_cc_aarch64_neon_intrinsics)
	(gcry_cv_cc_aarch64_neon_intrinsics_cflags)
	(gcry_cv_cc_ppc_altivec, gcry_cv_cc_ppc_altivec_cflags)
	(gcry_cv_cc_riscv_vector_intrinsics)
	(gcry_cv_cc_riscv_vector_intrinsics_cflags): Change AC_COMPILE_IFELSE
	to AC_LINK_IFELSE.

2026-05-12  NIIBE Yutaka  <gniibe@fsij.org>

	w32: Fix for Win32 DLL, using FreeLibrary.
	+ commit 62fad7f7620ddb1fbfc3d36b49f21d9a9ece17e4
	* src/hwfeatures.c (_gcry_get_sysconfdir): Use FreeLibrary to release
	the handle.

2026-05-07  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	rijndael-riscv-zvkned: fix m4 grouping when VLEN greater than 128.
	+ commit 3f684fc6ab3ac98320e245a06b3563ad37ec56f5
	* cipher/rijndael-riscv-zvkned.c (vxor_u8_u32m1, vxor_u8_u32m4): Mark
	as ASM_FUNC_ATTR_INLINE.
	(merge_4x_u32m1_to_u32m4, split_u32m4_to_4x_u32m1): New.
	(_gcry_aes_riscv_zvkned_ctr_enc, _gcry_aes_riscv_zvkned_ctr32le_enc)
	(aes_riscv_ocb_enc, aes_riscv_ocb_dec, _gcry_aes_riscv_zvkned_ocb_auth)
	(aes_riscv_xts_enc, aes_riscv_xts_dec): Use merge_4x_u32m1_to_u32m4
	and split_u32m4_to_4x_u32m1 instead of __riscv_vset_v_u32m1_u32m4
	and __riscv_vget_v_u32m4_u32m1.
	(_gcry_aes_riscv_zvkned_cfb_dec, _gcry_aes_riscv_zvkned_cbc_dec): Slide
	m4 groups instead of splitting to m1 and combining back to m4.

2026-04-17  Bert van der Weerd  <bert@teamspicy.net>

	cipher:kdf:ballon: Fix wiping memory after use.
	+ commit 787ae6a02ba091ab959c1f4499ead21842fa1665
	* cipher/kdf.c (balloon_close): Fix the memory size to be wiped.

--===============2061573774666823391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libgcrypt: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.12.2.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://0001-tests-Fix-link-errors-for-t-thread-local.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.12.3.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://0001-tests-Fix-link-errors-for-t-thread-local.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libgcrypt: PV changed from "1.12.2" to "1.12.3"
packages/x86-64-v3-poky-linux/libgcrypt: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: FILELIST: removed "/usr/lib/.debug/libgcrypt.so.20.7.2", added "/usr/lib/.debug/libgcrypt.so.20.8.8"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PKGSIZE changed from 19262224 to 19491720 (+1%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PV changed from "1.12.2" to "1.12.3"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dev: PKGSIZE changed from 131434 to 132254 (+1%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dev: PV changed from "1.12.2" to "1.12.3"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dev: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-doc: PKGSIZE changed from 357752 to 357772 (+0%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-doc: PV changed from "1.12.2" to "1.12.3"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-doc: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-locale: PV changed from "1.12.2" to "1.12.3"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-locale: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-ptest: PKGSIZE changed from 51410532 to 51422884 (+0%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-ptest: PV changed from "1.12.2" to "1.12.3"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-ptest: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: FILELIST: directory renamed /usr/src/debug/libgcrypt/1.12.2/src -> /usr/src/debug/libgcrypt/1.12.3/src, directory renamed /usr/src/debug/libgcrypt/1.12.2/random -> /usr/src/debug/libgcrypt/1.12.3/random, directory renamed /usr/src/debug/libgcrypt/1.12.2/mpi -> /usr/src/debug/libgcrypt/1.12.3/mpi, directory renamed /usr/src/debug/libgcrypt/1.12.2/compat -> /usr/src/debug/libgcrypt/1.12.3/compat, directory renamed /usr/src/debug/libgcrypt/1.12.2/tests -> /usr/src/debug/libgcrypt/1.12.3/tests, directory renamed /usr/src/debug/libgcrypt/1.12.2/cipher -> /usr/src/debug/libgcrypt/1.12.3/cipher
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PKGSIZE changed from 5965573 to 6009146 (+1%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PV changed from "1.12.2" to "1.12.3"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-staticdev: PV changed from "1.12.2" to "1.12.3"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-staticdev: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.7.2", added "/usr/lib/libgcrypt.so.20.8.8"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: PKGSIZE changed from 1208859 to 1217051 (+1%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: PV changed from "1.12.2" to "1.12.3"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
Changes to packages/x86-64-v3-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.2 to libgcrypt.so.20.8.8
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.2 to libgcrypt.so.20.8.8
  /usr/lib/libgcrypt.so.20.7.2 moved to /usr/lib/libgcrypt.so.20.8.8
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.2 to libgcrypt.so.20.8.8
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.2 to libgcrypt.so.20.8.8
  /usr/lib/libgcrypt.so.20.7.2 moved to /usr/lib/libgcrypt.so.20.8.8

--===============2061573774666823391==--

