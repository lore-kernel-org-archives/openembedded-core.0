Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29430CD98CF
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:07 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50410.1781195498830752471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=irJR/9rf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0eTfFXrm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019eb786cc7f-e2a3077c-9f56-42c6-b3e4-f712222b84ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195525;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iC0ZGb92uJrQrsgWxsYL/ZEnBwclEEAtjhak879tGmg=;
	b=irJR/9rfAmxjas/chlhaUNSxhTpG1ylARMQWjX4lujOoni/yniuiYbJO8kXj9Nvu
	UgS80INUZ2sHF25lzgC6Jr7ul5U3W6Yp2d9E4a2SgGbMSfpzso8Ya71a55ZemqM/LaK
	94pLGPf5SxiVuMwWTZqWnjrNuDaXGLtiGZu2AJVs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195525;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iC0ZGb92uJrQrsgWxsYL/ZEnBwclEEAtjhak879tGmg=;
	b=0eTfFXrmS54aj0O3uhop/Jvdq+bgrLg8FIwP2QVL8zmFrx2ligQxCkRgwxUECfbW
	hsGhBujZ/f3EoFj3qMPEtJ3O0JsmzljsXg5x5A3EBydK0UoX+X97Iv8JJ2VN2X0UKFh
	xQr1PIVPnKAJyz4AkPjElV+ydQDpzacuaQxxqhzQ=
Content-Type: multipart/mixed; boundary="===============8843253312649775966=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] nettle: upgrading to 4.0 SUCCEEDED
Message-ID: <0101019eb786cc7f-e2a3077c-9f56-42c6-b3e4-f712222b84ab-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238581

--===============8843253312649775966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nettle* to *4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nettle-upgrade-3.10.2-4.0.patch
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
From 7819f6984f247e1e06f513c61d64d9d7ea3d2c7c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 16:08:15 +0000
Subject: [PATCH] nettle: upgrade 3.10.2 -> 4.0

---
 ...get-to-only-build-tests-not-run-them.patch | 10 ++--
 ...der-files-of-openssl-only-if-enable_.patch |  6 +--
 .../{nettle_3.10.2.bb => nettle_4.0.bb}       | 48 +++++++++++++++++--
 3 files changed, 53 insertions(+), 11 deletions(-)
 rename meta/recipes-support/nettle/{nettle_3.10.2.bb => nettle_4.0.bb} (57%)

diff --git a/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
index ee3e74c43b..7e1d26b125 100644
--- a/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
+++ b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
@@ -1,4 +1,4 @@
-From 3ea3eaf5bda21529fc8a8da3d8b07ebc3875ba7e Mon Sep 17 00:00:00 2001
+From 232da891d3468acfeb80eaf6fa1fad9454242ed6 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 2 Aug 2024 09:48:43 -0400
 Subject: [PATCH] Makefile.in: Add target to only build tests (not run them)
@@ -21,10 +21,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 71ad761..0f239f4 100644
+index 9399985..4d4046e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -53,6 +53,9 @@ clean distclean mostlyclean maintainer-clean tags:
+@@ -56,6 +56,9 @@ clean distclean mostlyclean maintainer-clean tags:
  	  echo "Making $@ in $$d" ; (cd $$d && $(MAKE) $@); done
  	$(MAKE) $@-here
  
@@ -35,10 +35,10 @@ index 71ad761..0f239f4 100644
  	true
  
 diff --git a/testsuite/Makefile.in b/testsuite/Makefile.in
-index 0699fa0..8ac9983 100644
+index b2f0518..c93b9b6 100644
 --- a/testsuite/Makefile.in
 +++ b/testsuite/Makefile.in
-@@ -137,6 +137,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../non-nettle.$(OBJEXT) \
+@@ -144,6 +144,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../non-nettle.$(OBJEXT) \
  # data.
  VALGRIND = valgrind --error-exitcode=1 --leak-check=full --show-reachable=yes @IF_ASM@ --partial-loads-ok=yes
  
diff --git a/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
index 89b5c7bec4..f4c77506f3 100644
--- a/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
+++ b/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
@@ -1,4 +1,4 @@
-From ec2ca7e505e6bfe1fff2a7d6e6bb39b60b93e19a Mon Sep 17 00:00:00 2001
+From 009724a1811298d11183d7432e1a82b92c95e083 Mon Sep 17 00:00:00 2001
 From: Haiqing Bai <Haiqing.Bai@windriver.com>
 Date: Fri, 9 Dec 2016 15:23:17 +0800
 Subject: [PATCH] nettle: check header files of openssl only if
@@ -23,10 +23,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7c003bb..779f7ff 100644
+index af017d8..9294e24 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -197,9 +197,11 @@ AC_TYPE_SIZE_T
+@@ -177,9 +177,11 @@ AC_TYPE_SIZE_T
  AC_CHECK_SIZEOF(long)
  AC_CHECK_SIZEOF(size_t)
  
diff --git a/meta/recipes-support/nettle/nettle_3.10.2.bb b/meta/recipes-support/nettle/nettle_4.0.bb
similarity index 57%
rename from meta/recipes-support/nettle/nettle_3.10.2.bb
rename to meta/recipes-support/nettle/nettle_4.0.bb
index 7b7be5f594..384d946801 100644
--- a/meta/recipes-support/nettle/nettle_3.10.2.bb
+++ b/meta/recipes-support/nettle/nettle_4.0.bb
@@ -1,3 +1,44 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING.LESSERv3
+# +++ COPYING.LESSERv3
+# @@ -1,7 +1,7 @@
+# -		   GNU LESSER GENERAL PUBLIC LICENSE
+# +                   GNU LESSER GENERAL PUBLIC LICENSE
+#                         Version 3, 29 June 2007
+#  
+# - Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+# + Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -10,7 +10,7 @@
+#  the terms and conditions of version 3 of the GNU General Public
+#  License, supplemented by the additional permissions listed below.
+#  
+# -  0. Additional Definitions. 
+# +  0. Additional Definitions.
+#  
+#    As used herein, "this License" refers to version 3 of the GNU Lesser
+#  General Public License, and the "GNU GPL" refers to version 3 of the GNU
+# @@ -111,7 +111,7 @@
+#         a copy of the Library already present on the user's computer
+#         system, and (b) will operate properly with a modified version
+#         of the Library that is interface-compatible with the Linked
+# -       Version. 
+# +       Version.
+#  
+#     e) Provide Installation Information, but only if you would otherwise
+#     be required to provide such information under section 6 of the
+# 
+#
+
 SUMMARY = "A low level cryptographic library"
 DESCRIPTION = "Nettle is a cryptographic library that is designed to fit easily in more or less any context: In crypto toolkits for object-oriented languages (C++, Python, Pike, ...), in applications like LSH or GNUPG, or even in kernel space."
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
@@ -7,10 +48,11 @@ context-independent set of cryptographic algorithms"
 SECTION = "libs"
 LICENSE = "LGPL-3.0-or-later | GPL-2.0-or-later"
 
-LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
+LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=3000208d539ec061b899bce1d9ce9404 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
-                    file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e"
+                    file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
+                    "
 
 DEPENDS += "gmp"
 
@@ -20,7 +62,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://check-header-files-of-openssl-only-if-enable_.patch \
            "
 
-SRC_URI[sha256sum] = "fe9ff51cb1f2abb5e65a6b8c10a92da0ab5ab6eaf26e7fc2b675c45f1fb519b5"
+SRC_URI[sha256sum] = "3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.47.1


--===============8843253312649775966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/nettle: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/nettle/nettle-3.10.2.tar.gz file://Add-target-to-only-build-tests-not-run-them.patch file://run-ptest file://check-header-files-of-openssl-only-if-enable_.patch" to "https://ftpmirror.gnu.org/gnu/nettle/nettle-4.0.tar.gz file://Add-target-to-only-build-tests-not-run-them.patch file://run-ptest file://check-header-files-of-openssl-only-if-enable_.patch"
packages/x86-64-v3-poky-linux/nettle: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-bin: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-bin: PKGSIZE changed from 92688 to 96784 (+4%)
packages/x86-64-v3-poky-linux/nettle/nettle-bin: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-dbg: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-dbg: PKGSIZE changed from 39597888 to 38511032 (-3%)
packages/x86-64-v3-poky-linux/nettle/nettle-dbg: FILELIST: removed "/usr/lib/.debug/libhogweed.so.6.11 /usr/lib/nettle/ptest/testsuite/.debug/meta-armor-test /usr/lib/nettle/ptest/testsuite/.debug/md5-compat-test /usr/lib/.debug/libnettle.so.8.11", added "/usr/lib/nettle/ptest/testsuite/.debug/slh-dsa-test /usr/lib/.debug/libnettle.so.9.0 /usr/lib/.debug/libhogweed.so.7.0"
packages/x86-64-v3-poky-linux/nettle/nettle-dbg: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-dev: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-dev: PKGSIZE changed from 278815 to 260640 (-7%)
packages/x86-64-v3-poky-linux/nettle/nettle-dev: FILELIST: removed "/usr/include/nettle/sha.h /usr/include/nettle/pgp.h /usr/include/nettle/md5-compat.h /usr/include/nettle/dsa-compat.h", added "/usr/include/nettle/slh-dsa.h"
packages/x86-64-v3-poky-linux/nettle/nettle-dev: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-doc: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-doc: PKGSIZE changed from 361472 to 351478 (-3%)
packages/x86-64-v3-poky-linux/nettle/nettle-doc: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-locale: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-locale: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-ptest: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-ptest: PKGSIZE changed from 10830755 to 10742637 (-1%)
packages/x86-64-v3-poky-linux/nettle/nettle-ptest: FILELIST: removed "/usr/lib/nettle/ptest/testsuite/meta-armor-test /usr/lib/nettle/ptest/testsuite/md5-compat-test", added "/usr/lib/nettle/ptest/testsuite/slh-dsa-test /usr/lib/nettle/ptest/testsuite/sc-slh-dsa-test"
packages/x86-64-v3-poky-linux/nettle/nettle-ptest: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-src: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-src: PKGSIZE changed from 4705071 to 4691781 (-0%)
packages/x86-64-v3-poky-linux/nettle/nettle-src: FILELIST: directory renamed /usr/src/debug/nettle/3.10.2/tools -> /usr/src/debug/nettle/4.0/tools, directory renamed /usr/src/debug/nettle/3.10.2/examples -> /usr/src/debug/nettle/4.0/examples, removed "/usr/src/debug/nettle/3.10.2/nettle-meta-hashes.c /usr/src/debug/nettle/3.10.2/blowfish-internal.h /usr/src/debug/nettle/3.10.2/umac-nh-n.s /usr/src/debug/nettle/3.10.2/rsa-md5-sign.c /usr/src/debug/nettle/3.10.2/poly1305.h /usr/src/debug/nettle/3.10.2/bignum.h /usr/src/debug/nettle/3.10.2/aes256-decrypt.c /usr/src/debug/nettle/3.10.2/aes256-encrypt.c /usr/src/debug/nettle/3.10.2/buffer-init.c /usr/src/debug/nettle/3.10.2/bignum.c /usr/src/debug/nettle/3.10.2/sha512-compress.s /usr/src/debug/nettle/3.10.2/ecc-curve448.h /usr/src/debug/nettle/3.10.2/testsuite/x86-ibt-test.c /usr/src/debug/nettle/3.10.2/sha3-224.c /usr/src/debug/nettle/3.10.2/sexp2dsa.c /usr/src/debug/nettle/3.10.2/pkcs1-sec-decrypt.c /usr/src/debug/nettle/3.10.2/ecc-curv
 e448.c /usr/src/debug/nettle/3.10.2/aes-decrypt-internal.s /usr/src/debug/nettle/3.10.2/base64-decode.c /usr/src/debug/nettle/3.10.2/base64-encode.c /usr/src/debug/nettle/3.10.2/ecc-mul-a-eh.c /usr/src/debug/nettle/3.10.2/ecc-mul-g-eh.c /usr/src/debug/nettle/3.10.2/testsuite/md4-test.c /usr/src/debug/nettle/3.10.2/camellia128-crypt.c /usr/src/debug/nettle/3.10.2/camellia256-crypt.c /usr/src/debug/nettle/3.10.2/siv-gcm-aes256.c /usr/src/debug/nettle/3.10.2/nettle-meta-aeads.c /usr/src/debug/nettle/3.10.2/pbkdf2-hmac-sha256.c /usr/src/debug/nettle/3.10.2/pbkdf2-hmac-sha384.c /usr/src/debug/nettle/3.10.2/pbkdf2-hmac-sha512.c /usr/src/debug/nettle/3.10.2/chacha-internal.h /usr/src/debug/nettle/3.10.2/ecc-curve448-modp.s /usr/src/debug/nettle/3.10.2/camellia-table.c /usr/src/debug/nettle/3.10.2/ccm-aes128.c /usr/src/debug/nettle/3.10.2/ccm-aes192.c /usr/src/debug/nettle/3.10.2/ccm-aes256.c /usr/src/debug/nettle/3.10.2/eax-aes128.c /usr/src/debug/nettle/3.10.2/gcm-aes256.c /usr/src/debug/
 nettle/3.10.2/curve448.h /usr/src/debug/nettle/3.10.2/ecc-a-to-j.c /usr/src/debug/nettle/3.10.2/ecc-add-eh.c /usr/src/debug/nettle/3.10.2/ecc-add-th.c /usr/src/debug/nettle/3.10.2/gcm-aes128.c /usr/src/debug/nettle/3.10.2/testsuite/sha512-256-test.c /usr/src/debug/nettle/3.10.2/testsuite/sexp2rsa-test.c /usr/src/debug/nettle/3.10.2/rsa-pss-sha256-sign-tr.c /usr/src/debug/nettle/3.10.2/drbg-ctr-aes256.c /usr/src/debug/nettle/3.10.2/aes192-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/md-internal.h /usr/src/debug/nettle/3.10.2/yarrow.h /usr/src/debug/nettle/3.10.2/base16-meta.c /usr/src/debug/nettle/3.10.2/sha256-compress-n.s /usr/src/debug/nettle/3.10.2/salsa20-set-nonce.c /usr/src/debug/nettle/3.10.2/write-be32.c /usr/src/debug/nettle/3.10.2/testsuite/rsa2sexp-test.c /usr/src/debug/nettle/3.10.2/write-le32.c /usr/src/debug/nettle/3.10.2/write-le64.c /usr/src/debug/nettle/3.10.2/ripemd160-compress.c /usr/src/debug/nettle/3.10.2/salsa20r12-crypt.c /usr/src/debug/nettle/3.10.2/der2dsa
 .c /usr/src/debug/nettle/3.10.2/memxor.h /usr/src/debug/nettle/3.10.2/asn1.h /usr/src/debug/nettle/3.10.2/cpuid.s /usr/src/debug/nettle/3.10.2/sha1.h /usr/src/debug/nettle/3.10.2/pkcs1-rsa-sha1.c /usr/src/debug/nettle/3.10.2/memxor.s /usr/src/debug/nettle/3.10.2/buffer.h /usr/src/debug/nettle/3.10.2/sha1.c /usr/src/debug/nettle/3.10.2/testsuite/ripemd160-test.c /usr/src/debug/nettle/3.10.2/testsuite/sm4-test.c /usr/src/debug/nettle/3.10.2/siv-gcm.h /usr/src/debug/nettle/3.10.2/sha1-compress.s /usr/src/debug/nettle/3.10.2/buffer.c /usr/src/debug/nettle/3.10.2/umac-nh.s /usr/src/debug/nettle/3.10.2/eax-aes128-meta.c /usr/src/debug/nettle/3.10.2/gcm-aes128-meta.c /usr/src/debug/nettle/3.10.2/gcm-aes192-meta.c /usr/src/debug/nettle/3.10.2/gcm-aes256-meta.c /usr/src/debug/nettle/3.10.2/siv-gcm.c /usr/src/debug/nettle/3.10.2/aes128-decrypt.c /usr/src/debug/nettle/3.10.2/aes128-encrypt.c /usr/src/debug/nettle/3.10.2/testsuite/sexp-test.c /usr/src/debug/nettle/3.10.2/sha384-meta.c /usr/src/
 debug/nettle/3.10.2/sha3-384.c /usr/src/debug/nettle/3.10.2/sha3.h /usr/src/debug/nettle/3.10.2/des3.c /usr/src/debug/nettle/3.10.2/sha3.c /usr/src/debug/nettle/3.10.2/streebog-meta.c /usr/src/debug/nettle/3.10.2/ecdsa.h /usr/src/debug/nettle/3.10.2/ed448-shake256.c /usr/src/debug/nettle/3.10.2/eddsa.h /usr/src/debug/nettle/3.10.2/sexp2bignum.c /usr/src/debug/nettle/3.10.2/testsuite/aes-keywrap-test.c /usr/src/debug/nettle/3.10.2/testsuite/arcfour-test.c /usr/src/debug/nettle/3.10.2/aes256-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/gcm-camellia256.c /usr/src/debug/nettle/3.10.2/getopt1.c /usr/src/debug/nettle/3.10.2/ecc-gostdsa-verify.c /usr/src/debug/nettle/3.10.2/gcm-camellia128-meta.c /usr/src/debug/nettle/3.10.2/ocb.h /usr/src/debug/nettle/3.10.2/yarrow256.c /usr/src/debug/nettle/3.10.2/pgp.h /usr/src/debug/nettle/3.10.2/pss.h /usr/src/debug/nettle/3.10.2/aes192-decrypt-2.s /usr/src/debug/nettle/3.10.2/aes192-encrypt-2.s /usr/src/debug/nettle/3.10.2/rsa.h /usr/src/debug/nett
 le/3.10.2/gostdsa.h /usr/src/debug/nettle/3.10.2/sm3.h /usr/src/debug/nettle/3.10.2/sm4.h /usr/src/debug/nettle/3.10.2/chacha-crypt.c /usr/src/debug/nettle/3.10.2/ecc-size.c /usr/src/debug/nettle/3.10.2/base16-decode.c /usr/src/debug/nettle/3.10.2/base16-encode.c /usr/src/debug/nettle/3.10.2/aes128-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/testsuite/gostdsa-sign-test.c /usr/src/debug/nettle/3.10.2/pkcs1-rsa-sha256.c /usr/src/debug/nettle/3.10.2/xts.h /usr/src/debug/nettle/3.10.2/aes.h /usr/src/debug/nettle/3.10.2/cbc.h /usr/src/debug/nettle/3.10.2/ccm.h /usr/src/debug/nettle/3.10.2/siv-ghash-set-key.c /usr/src/debug/nettle/3.10.2/cfb.h /usr/src/debug/nettle/3.10.2/blowfish.c /usr/src/debug/nettle/3.10.2/ctr.h /usr/src/debug/nettle/3.10.2/des.h /usr/src/debug/nettle/3.10.2/dsa.h /usr/src/debug/nettle/3.10.2/rsa-md5-sign-tr.c /usr/src/debug/nettle/3.10.2/blowfish.h /usr/src/debug/nettle/3.10.2/cfb.c /usr/src/debug/nettle/3.10.2/cmac-des3-meta.c /usr/src/debug/nettle/3.10.2/hmac-s
 ha1-meta.c /usr/src/debug/nettle/3.10.2/ctr.c /usr/src/debug/nettle/3.10.2/des.c /usr/src/debug/nettle/3.10.2/dsa.c /usr/src/debug/nettle/3.10.2/eax.c /usr/src/debug/nettle/3.10.2/gcm.c /usr/src/debug/nettle/3.10.2/md2.c /usr/src/debug/nettle/3.10.2/ecc-j-to-a.c /usr/src/debug/nettle/3.10.2/ecc-random.c /usr/src/debug/nettle/3.10.2/testsuite/pss-test.c /usr/src/debug/nettle/3.10.2/ecdsa-keygen.c /usr/src/debug/nettle/3.10.2/rsa2openpgp.c /usr/src/debug/nettle/3.10.2/rsa-sign-tr.c /usr/src/debug/nettle/3.10.2/testsuite/xts-test.c /usr/src/debug/nettle/3.10.2/testsuite/cast128-test.c /usr/src/debug/nettle/3.10.2/aes128-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/eddsa-expand.c /usr/src/debug/nettle/3.10.2/testsuite/poly1305-test.c /usr/src/debug/nettle/3.10.2/serpent-decrypt.s /usr/src/debug/nettle/3.10.2/serpent-encrypt.s /usr/src/debug/nettle/3.10.2/ecc-curve25519.h /usr/src/debug/nettle/3.10.2/curve448-mul.c /usr/src/debug/nettle/3.10.2/ecc-curve25519.c /usr/src/debug/nettle/3.1
 0.2/nettle-types.h /usr/src/debug/nettle/3.10.2/sha3-256.c /usr/src/debug/nettle/3.10.2/aes-invert-internal.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-mod-arith-test.c /usr/src/debug/nettle/3.10.2/umac-internal.h /usr/src/debug/nettle/3.10.2/ecdsa-sign.c /usr/src/debug/nettle/3.10.2/eddsa-hash.c /usr/src/debug/nettle/3.10.2/dsa-sha1-sign.c /usr/src/debug/nettle/3.10.2/eddsa-sign.c /usr/src/debug/nettle/3.10.2/md2-meta.c /usr/src/debug/nettle/3.10.2/chacha-poly1305.h /usr/src/debug/nettle/3.10.2/md4-meta.c /usr/src/debug/nettle/3.10.2/md5-meta.c /usr/src/debug/nettle/3.10.2/rsa-sha1-sign.c /usr/src/debug/nettle/3.10.2/sm3-meta.c /usr/src/debug/nettle/3.10.2/sm4-meta.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-mul-a-test.c /usr/src/debug/nettle/3.10.2/chacha-poly1305.c /usr/src/debug/nettle/3.10.2/nettle-write.h /usr/src/debug/nettle/3.10.2/testsuite/ecc-mul-g-test.c /usr/src/debug/nettle/3.10.2/poly1305-blocks.s /usr/src/debug/nettle/3.10.2/sha512-224-meta.c /usr/src/debug/nettle/
 3.10.2/sha512-256-meta.c /usr/src/debug/nettle/3.10.2/rsa-pss-sha512-verify.c /usr/src/debug/nettle/3.10.2/testsuite/ecdsa-verify-test.c /usr/src/debug/nettle/3.10.2/gost28147.c /usr/src/debug/nettle/3.10.2/sexp-format.c /usr/src/debug/nettle/3.10.2/sec-sub-1.c /usr/src/debug/nettle/3.10.2/der2rsa.c /usr/src/debug/nettle/3.10.2/testsuite/sexp-format-test.c /usr/src/debug/nettle/3.10.2/pkcs1.h /usr/src/debug/nettle/3.10.2/camellia-internal.h /usr/src/debug/nettle/3.10.2/pkcs1.c /usr/src/debug/nettle/3.10.2/bignum-random.c /usr/src/debug/nettle/3.10.2/ghash-internal.h /usr/src/debug/nettle/3.10.2/testsuite/meta-armor-test.c /usr/src/debug/nettle/3.10.2/dsa2sexp.c /usr/src/debug/nettle/3.10.2/rsa2sexp.c /usr/src/debug/nettle/3.10.2/sexp2rsa.c /usr/src/debug/nettle/3.10.2/sexp-transport-format.c /usr/src/debug/nettle/3.10.2/hmac-sm3.c /usr/src/debug/nettle/3.10.2/camellia128-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/camellia128-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/camelli
 a256-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/camellia256-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/ed25519-sha512-verify.c /usr/src/debug/nettle/3.10.2/gmp-glue.h /usr/src/debug/nettle/3.10.2/cbc-aes128-encrypt.c /usr/src/debug/nettle/3.10.2/cbc-aes192-encrypt.c /usr/src/debug/nettle/3.10.2/cbc-aes256-encrypt.c /usr/src/debug/nettle/3.10.2/gmp-glue.c /usr/src/debug/nettle/3.10.2/dsa-compat.h /usr/src/debug/nettle/3.10.2/balloon-sha1.c /usr/src/debug/nettle/3.10.2/balloon-sha512.c /usr/src/debug/nettle/3.10.2/md5-compat.h /usr/src/debug/nettle/3.10.2/testsuite/knuth-lfib-test.c /usr/src/debug/nettle/3.10.2/config.h /usr/src/debug/nettle/3.10.2/testsuite/pkcs1-test.c /usr/src/debug/nettle/3.10.2/dsa-keygen.c /usr/src/debug/nettle/3.10.2/rsa-keygen.c /usr/src/debug/nettle/3.10.2/ecc-scalar.c /usr/src/debug/nettle/3.10.2/dsa-compat.c /usr/src/debug/nettle/3.10.2/md5-compat.c /usr/src/debug/nettle/3.10.2/memxor-2.s /usr/src/debug/nettle/3.10.2/sha224-meta.c /usr/src/debug/net
 tle/3.10.2/realloc.c /usr/src/debug/nettle/3.10.2/rsa-pss-sha256-verify.c /usr/src/debug/nettle/3.10.2/ghash-set-key-2.s /usr/src/debug/nettle/3.10.2/realloc.h /usr/src/debug/nettle/3.10.2/testsuite/ctr-test.c /usr/src/debug/nettle/3.10.2/arctwo.h /usr/src/debug/nettle/3.10.2/arctwo.c /usr/src/debug/nettle/3.10.2/testsuite/camellia-test.c /usr/src/debug/nettle/3.10.2/serpent-meta.c /usr/src/debug/nettle/3.10.2/rsa-decrypt-tr.c /usr/src/debug/nettle/3.10.2/testsuite/pkcs1-sec-decrypt-test.c /usr/src/debug/nettle/3.10.2/balloon.h /usr/src/debug/nettle/3.10.2/memops.h /usr/src/debug/nettle/3.10.2/ecc-mul-m.c /usr/src/debug/nettle/3.10.2/balloon.c /usr/src/debug/nettle/3.10.2/testsuite/curve448-dh-test.c /usr/src/debug/nettle/3.10.2/sha3-224-meta.c /usr/src/debug/nettle/3.10.2/sha3-256-meta.c /usr/src/debug/nettle/3.10.2/cast128_sboxes.h /usr/src/debug/nettle/3.10.2/sha3-384-meta.c /usr/src/debug/nettle/3.10.2/sha3-512-meta.c /usr/src/debug/nettle/3.10.2/hmac-md5-meta.c /usr/src/debug/n
 ettle/3.10.2/hmac-sm3-meta.c /usr/src/debug/nettle/3.10.2/testsuite/cfb-test.c /usr/src/debug/nettle/3.10.2/serpent-set-key.c /usr/src/debug/nettle/3.10.2/sexp-transport.c /usr/src/debug/nettle/3.10.2/serpent.h /usr/src/debug/nettle/3.10.2/ed448-shake256-pubkey.c /usr/src/debug/nettle/3.10.2/testsuite/meta-cipher-test.c /usr/src/debug/nettle/3.10.2/testsuite/gostdsa-vko-test.c /usr/src/debug/nettle/3.10.2/dsa-hash.c /usr/src/debug/nettle/3.10.2/testsuite/bcrypt-test.c /usr/src/debug/nettle/3.10.2/memxor3.s /usr/src/debug/nettle/3.10.2/aes-decrypt-table.c /usr/src/debug/nettle/3.10.2/oaep.h /usr/src/debug/nettle/3.10.2/sexp.h /usr/src/debug/nettle/3.10.2/testsuite/dsa-keygen-test.c /usr/src/debug/nettle/3.10.2/bignum-random-prime.c /usr/src/debug/nettle/3.10.2/testsuite/rsa-keygen-test.c /usr/src/debug/nettle/3.10.2/oaep.c /usr/src/debug/nettle/3.10.2/sexp.c /usr/src/debug/nettle/3.10.2/poly1305-update.c /usr/src/debug/nettle/3.10.2/getopt_int.h /usr/src/debug/nettle/3.10.2/testsuite
 /drbg-ctr-aes256-test.c /usr/src/debug/nettle/3.10.2/chacha-poly1305-meta.c /usr/src/debug/nettle/3.10.2/drbg-ctr.h /usr/src/debug/nettle/3.10.2/twofish-meta.c /usr/src/debug/nettle/3.10.2/umac96.c /usr/src/debug/nettle/3.10.2/salsa20-256-set-key.c /usr/src/debug/nettle/3.10.2/salsa20-128-set-key.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-add-test.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-dup-test.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-mod-test.c /usr/src/debug/nettle/3.10.2/testsuite/twofish-test.c /usr/src/debug/nettle/3.10.2/testsuite/curve25519-dh-test.c /usr/src/debug/nettle/3.10.2/testsuite/random-prime-test.c /usr/src/debug/nettle/3.10.2/testsuite/gosthash94-test.c /usr/src/debug/nettle/3.10.2/ecc-dup-eh.c /usr/src/debug/nettle/3.10.2/ecc-dup-jj.c /usr/src/debug/nettle/3.10.2/ecc-dup-th.c /usr/src/debug/nettle/3.10.2/sha256-meta.c /usr/src/debug/nettle/3.10.2/aes256-meta.c /usr/src/debug/nettle/3.10.2/ecc-add-ehh.c /usr/src/debug/nettle/3.10.2/ecc-add-jja.c /usr/sr
 c/debug/nettle/3.10.2/ecc-add-jjj.c /usr/src/debug/nettle/3.10.2/ecc-add-thh.c /usr/src/debug/nettle/3.10.2/rotors.h /usr/src/debug/nettle/3.10.2/nettle-internal.h /usr/src/debug/nettle/3.10.2/rsa-sha1-sign-tr.c /usr/src/debug/nettle/3.10.2/testsuite/rsa-oaep-encrypt-test.c /usr/src/debug/nettle/3.10.2/chacha-set-nonce.c /usr/src/debug/nettle/3.10.2/dsa-compat-keygen.c /usr/src/debug/nettle/3.10.2/sec-add-1.c /usr/src/debug/nettle/3.10.2/base64-meta.c /usr/src/debug/nettle/3.10.2/gosthash94.c /usr/src/debug/nettle/3.10.2/knuth-lfib.c /usr/src/debug/nettle/3.10.2/ecc-mul-a.c /usr/src/debug/nettle/3.10.2/sha512-meta.c /usr/src/debug/nettle/3.10.2/gosthash94.h /usr/src/debug/nettle/3.10.2/knuth-lfib.h /usr/src/debug/nettle/3.10.2/cast128.h /usr/src/debug/nettle/3.10.2/cast128.c /usr/src/debug/nettle/3.10.2/testsuite/memeql-test.c /usr/src/debug/nettle/3.10.2/testsuite/memxor-test.c /usr/src/debug/nettle/3.10.2/aes192-meta.c /usr/src/debug/nettle/3.10.2/ed448-shake256-sign.c /usr/src/de
 bug/nettle/3.10.2/macros.h /usr/src/debug/nettle/3.10.2/yarrow_key_event.c /usr/src/debug/nettle/3.10.2/aes192-decrypt.c /usr/src/debug/nettle/3.10.2/aes192-encrypt.c /usr/src/debug/nettle/3.10.2/ghash-update.s /usr/src/debug/nettle/3.10.2/salsa20.h /usr/src/debug/nettle/3.10.2/ecc-mul-g.c /usr/src/debug/nettle/3.10.2/testsuite/eddsa-sign-test.c /usr/src/debug/nettle/3.10.2/testsuite/pbkdf2-test.c /usr/src/debug/nettle/3.10.2/testsuite/eax-test.c /usr/src/debug/nettle/3.10.2/base64url-decode.c /usr/src/debug/nettle/3.10.2/ecc-secp192r1-modp.s /usr/src/debug/nettle/3.10.2/ecc-secp224r1-modp.s /usr/src/debug/nettle/3.10.2/ecc-secp256r1-redc.s /usr/src/debug/nettle/3.10.2/ecc-secp384r1-modp.s /usr/src/debug/nettle/3.10.2/ecc-secp521r1-modp.s /usr/src/debug/nettle/3.10.2/sha512.c /usr/src/debug/nettle/3.10.2/siv-cmac-aes128.c /usr/src/debug/nettle/3.10.2/testsuite/aes-test.c /usr/src/debug/nettle/3.10.2/base64url-encode.c /usr/src/debug/nettle/3.10.2/testsuite/cxx-test.cxx /usr/src/debu
 g/nettle/3.10.2/testsuite/des-test.c /usr/src/debug/nettle/3.10.2/pkcs1-rsa-digest.c /usr/src/debug/nettle/3.10.2/eax.h /usr/src/debug/nettle/3.10.2/ecc.h /usr/src/debug/nettle/3.10.2/gcm.h /usr/src/debug/nettle/3.10.2/md2.h /usr/src/debug/nettle/3.10.2/md4.h /usr/src/debug/nettle/3.10.2/md5.h /usr/src/debug/nettle/3.10.2/gosthash94-meta.c /usr/src/debug/nettle/3.10.2/md4.c /usr/src/debug/nettle/3.10.2/md5.c /usr/src/debug/nettle/3.10.2/ocb.c /usr/src/debug/nettle/3.10.2/pss.c /usr/src/debug/nettle/3.10.2/rsa.c /usr/src/debug/nettle/3.10.2/sm3.c /usr/src/debug/nettle/3.10.2/sm4.c /usr/src/debug/nettle/3.10.2/xts.c /usr/src/debug/nettle/3.10.2/cbc.c /usr/src/debug/nettle/3.10.2/ccm.c /usr/src/debug/nettle/3.10.2/curve25519.h /usr/src/debug/nettle/3.10.2/pbkdf2.h /usr/src/debug/nettle/3.10.2/cmac64.c /usr/src/debug/nettle/3.10.2/umac64.c /usr/src/debug/nettle/3.10.2/testsuite/yarrow-test.c /usr/src/debug/nettle/3.10.2/gcm-camellia256-meta.c /usr/src/debug/nettle/3.10.2/testsuite/ecdsa
 -keygen-test.c /usr/src/debug/nettle/3.10.2/testsuite/blowfish-test.c /usr/src/debug/nettle/3.10.2/testsuite/ecdsa-sign-test.c /usr/src/debug/nettle/3.10.2/cbc-aes128-encrypt-2.s /usr/src/debug/nettle/3.10.2/cbc-aes192-encrypt-2.s /usr/src/debug/nettle/3.10.2/cbc-aes256-encrypt-2.s /usr/src/debug/nettle/3.10.2/cmac-aes128-meta.c /usr/src/debug/nettle/3.10.2/cmac-aes256-meta.c /usr/src/debug/nettle/3.10.2/hmac-sha224-meta.c /usr/src/debug/nettle/3.10.2/hmac-sha256-meta.c /usr/src/debug/nettle/3.10.2/hmac-sha384-meta.c /usr/src/debug/nettle/3.10.2/hmac-sha512-meta.c /usr/src/debug/nettle/3.10.2/poly1305-aes.c /usr/src/debug/nettle/3.10.2/cnd-memcpy.c /usr/src/debug/nettle/3.10.2/cnd-copy.c /usr/src/debug/nettle/3.10.2/pgp-encode.c /usr/src/debug/nettle/3.10.2/aes-decrypt.c /usr/src/debug/nettle/3.10.2/rsa-decrypt.c /usr/src/debug/nettle/3.10.2/sha2.h /usr/src/debug/nettle/3.10.2/siv-ghash-update.c /usr/src/debug/nettle/3.10.2/testsuite/meta-mac-test.c /usr/src/debug/nettle/3.10.2/test
 suite/balloon-test.c /usr/src/debug/nettle/3.10.2/ecc-nonsec-add-jjj.c /usr/src/debug/nettle/3.10.2/testsuite/salsa20-test.c /usr/src/debug/nettle/3.10.2/hmac-streebog.c /usr/src/debug/nettle/3.10.2/sha3-shake.c /usr/src/debug/nettle/3.10.2/hmac-sha1.c /usr/src/debug/nettle/3.10.2/testsuite/ed25519-test.c /usr/src/debug/nettle/3.10.2/ecc-ecdsa-verify.c /usr/src/debug/nettle/3.10.2/chacha.h /usr/src/debug/nettle/3.10.2/umac-poly128.c /usr/src/debug/nettle/3.10.2/hmac-md5.c /usr/src/debug/nettle/3.10.2/ripemd160-meta.c /usr/src/debug/nettle/3.10.2/ecc-point-mul.c /usr/src/debug/nettle/3.10.2/chacha-set-key.c /usr/src/debug/nettle/3.10.2/testsuite/siv-gcm-test.c /usr/src/debug/nettle/3.10.2/testsuite/hkdf-test.c /usr/src/debug/nettle/3.10.2/rsa-pkcs1-sign.c /usr/src/debug/nettle/3.10.2/rsa-pkcs1-sign-tr.c /usr/src/debug/nettle/3.10.2/ecc-gost-gc256b.c /usr/src/debug/nettle/3.10.2/testsuite/sha3-permute-test.c /usr/src/debug/nettle/3.10.2/pkcs1-rsa-md5.c /usr/src/debug/nettle/3.10.2/rsa
 -blind.c /usr/src/debug/nettle/3.10.2/aes-internal.h /usr/src/debug/nettle/3.10.2/ctr-internal.h /usr/src/debug/nettle/3.10.2/dsa-internal.h /usr/src/debug/nettle/3.10.2/ecc-gost-gc256b.h /usr/src/debug/nettle/3.10.2/ecc-internal.h /usr/src/debug/nettle/3.10.2/gcm-internal.h /usr/src/debug/nettle/3.10.2/rsa-internal.h /usr/src/debug/nettle/3.10.2/gcm-aes.c /usr/src/debug/nettle/3.10.2/shake256.c /usr/src/debug/nettle/3.10.2/testsuite/ecdh-test.c /usr/src/debug/nettle/3.10.2/salsa20-core-internal.s /usr/src/debug/nettle/3.10.2/ghash-update-2.s /usr/src/debug/nettle/3.10.2/umac32.c /usr/src/debug/nettle/3.10.2/nettle-meta-armors.c /usr/src/debug/nettle/3.10.2/siv-cmac.c /usr/src/debug/nettle/3.10.2/siv-cmac.h /usr/src/debug/nettle/3.10.2/salsa20-set-key.c /usr/src/debug/nettle/3.10.2/testsuite/bignum-test.c /usr/src/debug/nettle/3.10.2/hmac-streebog-meta.c /usr/src/debug/nettle/3.10.2/testsuite/ed448-test.c /usr/src/debug/nettle/3.10.2/ecc-point.c /usr/src/debug/nettle/3.10.2/cmac-aes
 128.c /usr/src/debug/nettle/3.10.2/cmac-aes256.c /usr/src/debug/nettle/3.10.2/hmac-sha224.c /usr/src/debug/nettle/3.10.2/hkdf.h /usr/src/debug/nettle/3.10.2/hmac-sha256.c /usr/src/debug/nettle/3.10.2/hmac-sha384.c /usr/src/debug/nettle/3.10.2/hmac-sha512.c /usr/src/debug/nettle/3.10.2/sha1-compress-2.s /usr/src/debug/nettle/3.10.2/hkdf.c /usr/src/debug/nettle/3.10.2/umac-poly64.c /usr/src/debug/nettle/3.10.2/sha3-permute.s /usr/src/debug/nettle/3.10.2/testsuite/base16-test.c /usr/src/debug/nettle/3.10.2/nettle-meta-ciphers.c /usr/src/debug/nettle/3.10.2/testsuite/base64-test.c /usr/src/debug/nettle/3.10.2/nettle-lookup-hash.c /usr/src/debug/nettle/3.10.2/aes-encrypt-internal.s /usr/src/debug/nettle/3.10.2/camellia-crypt-internal.s /usr/src/debug/nettle/3.10.2/nettle-meta-macs.c /usr/src/debug/nettle/3.10.2/rsa-sha256-sign-tr.c /usr/src/debug/nettle/3.10.2/rsa-sha512-sign-tr.c /usr/src/debug/nettle/3.10.2/ecc-secp192r1.h /usr/src/debug/nettle/3.10.2/ecc-secp224r1.h /usr/src/debug/net
 tle/3.10.2/ecc-secp256r1.h /usr/src/debug/nettle/3.10.2/ecc-secp384r1.h /usr/src/debug/nettle/3.10.2/ecc-secp521r1.h /usr/src/debug/nettle/3.10.2/sha3-internal.h /usr/src/debug/nettle/3.10.2/ecc-secp192r1.c /usr/src/debug/nettle/3.10.2/ecc-secp224r1.c /usr/src/debug/nettle/3.10.2/ecc-secp256r1.c /usr/src/debug/nettle/3.10.2/ecc-secp384r1.c /usr/src/debug/nettle/3.10.2/ecc-secp521r1.c /usr/src/debug/nettle/3.10.2/non-nettle.h /usr/src/debug/nettle/3.10.2/testsuite/rsa-sec-decrypt-test.c /usr/src/debug/nettle/3.10.2/gcm-camellia128.c /usr/src/debug/nettle/3.10.2/dsa-verify.c /usr/src/debug/nettle/3.10.2/non-nettle.c /usr/src/debug/nettle/3.10.2/rsa-verify.c /usr/src/debug/nettle/3.10.2/testsuite/streebog-test.c /usr/src/debug/nettle/3.10.2/eddsa-decompress.c /usr/src/debug/nettle/3.10.2/block-internal.h /usr/src/debug/nettle/3.10.2/blowfish-bcrypt.c /usr/src/debug/nettle/3.10.2/curve448-eh-to-x.c /usr/src/debug/nettle/3.10.2/rsa-oaep-decrypt.c /usr/src/debug/nettle/3.10.2/rsa-oaep-enc
 rypt.c /usr/src/debug/nettle/3.10.2/ecc-mod-arith.c /usr/src/debug/nettle/3.10.2/version.h /usr/src/debug/nettle/3.10.2/gcm-aes192.c /usr/src/debug/nettle/3.10.2/ocb-aes128.c /usr/src/debug/nettle/3.10.2/umac-set-key.c /usr/src/debug/nettle/3.10.2/version.c /usr/src/debug/nettle/3.10.2/xts-aes128.c /usr/src/debug/nettle/3.10.2/xts-aes256.c /usr/src/debug/nettle/3.10.2/ecc-point-mul-g.c /usr/src/debug/nettle/3.10.2/rsa-sec-decrypt.c /usr/src/debug/nettle/3.10.2/ecdsa-verify.c /usr/src/debug/nettle/3.10.2/base64url-meta.c /usr/src/debug/nettle/3.10.2/eddsa-pubkey.c /usr/src/debug/nettle/3.10.2/eddsa-verify.c /usr/src/debug/nettle/3.10.2/dsa-gen-params.c /usr/src/debug/nettle/3.10.2/gostdsa-verify.c /usr/src/debug/nettle/3.10.2/sha2-internal.h /usr/src/debug/nettle/3.10.2/aes256-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/gcm-sm4-meta.c /usr/src/debug/nettle/3.10.2/twofish.h /usr/src/debug/nettle/3.10.2/pbkdf2.c /usr/src/debug/nettle/3.10.2/twofish.c /usr/src/debug/nettle/3.10.2/cur
 ve25519-mul-g.c /usr/src/debug/nettle/3.10.2/testsuite/sm3-test.c /usr/src/debug/nettle/3.10.2/testsuite/meta-aead-test.c /usr/src/debug/nettle/3.10.2/testsuite/meta-hash-test.c /usr/src/debug/nettle/3.10.2/testsuite/sha1-test.c /usr/src/debug/nettle/3.10.2/umac-l2.c /usr/src/debug/nettle/3.10.2/curve25519-eh-to-x.c /usr/src/debug/nettle/3.10.2/ecc-ecdsa-sign.c /usr/src/debug/nettle/3.10.2/pkcs1-decrypt.c /usr/src/debug/nettle/3.10.2/pkcs1-encrypt.c /usr/src/debug/nettle/3.10.2/salsa20-crypt.c /usr/src/debug/nettle/3.10.2/sha1-meta.c /usr/src/debug/nettle/3.10.2/aes-encrypt-table.c /usr/src/debug/nettle/3.10.2/gostdsa-sign.c /usr/src/debug/nettle/3.10.2/pss-mgf1.c /usr/src/debug/nettle/3.10.2/siv-gcm-aes128.c /usr/src/debug/nettle/3.10.2/pss-mgf1.h /usr/src/debug/nettle/3.10.2/testsuite/rsa-pss-sign-tr-test.c /usr/src/debug/nettle/3.10.2/testsuite/dlopen-test.c /usr/src/debug/nettle/3.10.2/testsuite/serpent-test.c /usr/src/debug/nettle/3.10.2/testsuite/version-test.c /usr/src/debug/
 nettle/3.10.2/serpent-internal.h /usr/src/debug/nettle/3.10.2/ed25519-sha512-pubkey.c /usr/src/debug/nettle/3.10.2/getopt.c /usr/src/debug/nettle/3.10.2/umac128.c /usr/src/debug/nettle/3.10.2/cmac.h /usr/src/debug/nettle/3.10.2/hmac.h /usr/src/debug/nettle/3.10.2/getopt.h /usr/src/debug/nettle/3.10.2/umac.h /usr/src/debug/nettle/3.10.2/cmac.c /usr/src/debug/nettle/3.10.2/hmac.c /usr/src/debug/nettle/3.10.2/testsuite/gostdsa-keygen-test.c /usr/src/debug/nettle/3.10.2/testsuite/rsa-encrypt-test.c /usr/src/debug/nettle/3.10.2/hmac-gosthash94.c /usr/src/debug/nettle/3.10.2/aes128-decrypt-2.s /usr/src/debug/nettle/3.10.2/aes128-encrypt-2.s /usr/src/debug/nettle/3.10.2/cmac-des3.c /usr/src/debug/nettle/3.10.2/testsuite/cnd-memcpy-test.c /usr/src/debug/nettle/3.10.2/nist-keywrap.c /usr/src/debug/nettle/3.10.2/aes192-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/chacha-core-internal.s /usr/src/debug/nettle/3.10.2/nist-keywrap.h /usr/src/debug/nettle/3.10.2/base64.h /usr/src/debug/nettle/3.
 10.2/pbkdf2-hmac-gosthash94.c /usr/src/debug/nettle/3.10.2/salsa20-crypt-internal.c /usr/src/debug/nettle/3.10.2/sha3-512.c /usr/src/debug/nettle/3.10.2/testsuite/md2-test.c /usr/src/debug/nettle/3.10.2/testsuite/rsa-compute-root-test.c /usr/src/debug/nettle/3.10.2/umac-l3.c /usr/src/debug/nettle/3.10.2/sha256.c /usr/src/debug/nettle/3.10.2/hmac-ripemd160.c /usr/src/debug/nettle/3.10.2/testsuite/cmac-test.c /usr/src/debug/nettle/3.10.2/testsuite/hmac-test.c /usr/src/debug/nettle/3.10.2/testsuite/umac-test.c /usr/src/debug/nettle/3.10.2/testsuite/ocb-test.c /usr/src/debug/nettle/3.10.2/gcm-sm4.c /usr/src/debug/nettle/3.10.2/fat-setup.h /usr/src/debug/nettle/3.10.2/testsuite/ecc-modinv-test.c /usr/src/debug/nettle/3.10.2/camellia-invert-key.c /usr/src/debug/nettle/3.10.2/curve25519-mul.c /usr/src/debug/nettle/3.10.2/aes-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/aes-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/cast128-meta.c /usr/src/debug/nettle/3.10.2/camellia-absorb.c /usr/sr
 c/debug/nettle/3.10.2/testsuite/pss-mgf1-test.c /usr/src/debug/nettle/3.10.2/ecc-gost-gc512a.c /usr/src/debug/nettle/3.10.2/streebog.c /usr/src/debug/nettle/3.10.2/ecc-gost-gc512a.h /usr/src/debug/nettle/3.10.2/aes256-decrypt-2.s /usr/src/debug/nettle/3.10.2/aes256-encrypt-2.s /usr/src/debug/nettle/3.10.2/streebog.h /usr/src/debug/nettle/3.10.2/testsuite/sha512-224-test.c /usr/src/debug/nettle/3.10.2/memeql-sec.c /usr/src/debug/nettle/3.10.2/testsuite/siv-cmac-test.c /usr/src/debug/nettle/3.10.2/salsa20-2core.s /usr/src/debug/nettle/3.10.2/testsuite/cbc-test.c /usr/src/debug/nettle/3.10.2/testsuite/eddsa-verify-test.c /usr/src/debug/nettle/3.10.2/aes128-meta.c /usr/src/debug/nettle/3.10.2/testsuite/sha1-huge-test.c /usr/src/debug/nettle/3.10.2/testsuite/arctwo-test.c /usr/src/debug/nettle/3.10.2/salsa20-internal.h /usr/src/debug/nettle/3.10.2/ed25519-sha512.c /usr/src/debug/nettle/3.10.2/ripemd160-internal.h /usr/src/debug/nettle/3.10.2/dsa-sign.c /usr/src/debug/nettle/3.10.2/rsa-si
 gn.c /usr/src/debug/nettle/3.10.2/testsuite/chacha-test.c /usr/src/debug/nettle/3.10.2/gostdsa-vko.c /usr/src/debug/nettle/3.10.2/testsuite/sha224-test.c /usr/src/debug/nettle/3.10.2/testsuite/sha256-test.c /usr/src/debug/nettle/3.10.2/ecc-mod.c /usr/src/debug/nettle/3.10.2/testsuite/sha384-test.c /usr/src/debug/nettle/3.10.2/nettle-meta.h /usr/src/debug/nettle/3.10.2/testsuite/sha512-test.c /usr/src/debug/nettle/3.10.2/keymap.h /usr/src/debug/nettle/3.10.2/pkcs1-rsa-sha512.c /usr/src/debug/nettle/3.10.2/testsuite/buffer-test.c /usr/src/debug/nettle/3.10.2/base16.h /usr/src/debug/nettle/3.10.2/camellia128-meta.c /usr/src/debug/nettle/3.10.2/camellia192-meta.c /usr/src/debug/nettle/3.10.2/camellia256-meta.c /usr/src/debug/nettle/3.10.2/sha256-compress-n-2.s /usr/src/debug/nettle/3.10.2/camellia.h /usr/src/debug/nettle/3.10.2/arcfour.h /usr/src/debug/nettle/3.10.2/eddsa-internal.h /usr/src/debug/nettle/3.10.2/pkcs1-internal.h /usr/src/debug/nettle/3.10.2/ed25519-sha512-sign.c /usr/src
 /debug/nettle/3.10.2/ecc-pm1-redc.c /usr/src/debug/nettle/3.10.2/arcfour.c /usr/src/debug/nettle/3.10.2/ecc-pp1-redc.c /usr/src/debug/nettle/3.10.2/testsuite/gostdsa-verify-test.c /usr/src/debug/nettle/3.10.2/hmac-gosthash94-meta.c /usr/src/debug/nettle/3.10.2/poly1305-internal.s /usr/src/debug/nettle/3.10.2/testsuite/rsa-sign-tr-test.c /usr/src/debug/nettle/3.10.2/curve448-mul-g.c /usr/src/debug/nettle/3.10.2/ghash-set-key.c /usr/src/debug/nettle/3.10.2/poly1305-internal.h /usr/src/debug/nettle/3.10.2/aes-set-key-internal.c /usr/src/debug/nettle/3.10.2/testsuite/md5-compat-test.c /usr/src/debug/nettle/3.10.2/testsuite/md5-test.c /usr/src/debug/nettle/3.10.2/testsuite/eddsa-compress-test.c /usr/src/debug/nettle/3.10.2/ed448-shake256-verify.c /usr/src/debug/nettle/3.10.2/testsuite/rsa-test.c /usr/src/debug/nettle/3.10.2/dsa-sha256-verify.c /usr/src/debug/nettle/3.10.2/fat-x86_64.c /usr/src/debug/nettle/3.10.2/rsa-sha256-verify.c /usr/src/debug/nettle/3.10.2/rsa-sha512-verify.c /usr/s
 rc/debug/nettle/3.10.2/testsuite/dsa-test.c /usr/src/debug/nettle/3.10.2/eddsa-compress.c /usr/src/debug/nettle/3.10.2/rsa-pss-sha512-sign-tr.c /usr/src/debug/nettle/3.10.2/aes-encrypt.c /usr/src/debug/nettle/3.10.2/ecc-eh-to-a.c /usr/src/debug/nettle/3.10.2/ecc-mod-inv.c /usr/src/debug/nettle/3.10.2/rsa-encrypt.c /usr/src/debug/nettle/3.10.2/rsa-sec-compute-root.c /usr/src/debug/nettle/3.10.2/testsuite/ccm-test.c /usr/src/debug/nettle/3.10.2/testsuite/gcm-test.c /usr/src/debug/nettle/3.10.2/hmac-ripemd160-meta.c /usr/src/debug/nettle/3.10.2/balloon-sha384.c /usr/src/debug/nettle/3.10.2/dsa-sha1-verify.c /usr/src/debug/nettle/3.10.2/rsa-sha1-verify.c /usr/src/debug/nettle/3.10.2/rsa-pkcs1-verify.c /usr/src/debug/nettle/3.10.2/gost28147-internal.h /usr/src/debug/nettle/3.10.2/ecc-gostdsa-sign.c /usr/src/debug/nettle/3.10.2/hogweed-internal.h /usr/src/debug/nettle/3.10.2/ecc-curve.h /usr/src/debug/nettle/3.10.2/der-iterator.c /usr/src/debug/nettle/3.10.2/ecc-curve25519-modp.s /usr/src
 /debug/nettle/3.10.2/testsuite/sha3-224-test.c /usr/src/debug/nettle/3.10.2/pbkdf2-hmac-sha1.c /usr/src/debug/nettle/3.10.2/testsuite/sha3-256-test.c /usr/src/debug/nettle/3.10.2/testsuite/sha3-384-test.c /usr/src/debug/nettle/3.10.2/testsuite/sha3-512-test.c /usr/src/debug/nettle/3.10.2/ctr16.c /usr/src/debug/nettle/3.10.2/testsuite/shake128-test.c /usr/src/debug/nettle/3.10.2/testsuite/shake256-test.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-redc-test.c /usr/src/debug/nettle/3.10.2/bswap-internal.h /usr/src/debug/nettle/3.10.2/testsuite/ecc-sqrt-test.c /usr/src/debug/nettle/3.10.2/testsuite/chacha-poly1305-test.c /usr/src/debug/nettle/3.10.2/siv-cmac-aes256.c /usr/src/debug/nettle/3.10.2/ripemd160.c /usr/src/debug/nettle/3.10.2/rsa-md5-verify.c /usr/src/debug/nettle/3.10.2/ripemd160.h /usr/src/debug/nettle/3.10.2/dsa-sha256-sign.c /usr/src/debug/nettle/3.10.2/rsa-sha256-sign.c /usr/src/debug/nettle/3.10.2/rsa-sha512-sign.c /usr/src/debug/nettle/3.10.2/arctwo-meta.c /usr/src/debu
 g/nettle/3.10.2/testsuite/testutils.h /usr/src/debug/nettle/3.10.2/testsuite/des3-test.c /usr/src/debug/nettle/3.10.2/shake128.c /usr/src/debug/nettle/3.10.2/testsuite/testutils.c /usr/src/debug/nettle/3.10.2/balloon-sha256.c /usr/src/debug/nettle/3.10.2/desCode.h", added "/usr/src/debug/nettle/4.0/knuth-lfib.h /usr/src/debug/nettle/4.0/rsa-pkcs1-sign-tr.c /usr/src/debug/nettle/4.0/knuth-lfib.c /usr/src/debug/nettle/4.0/dsa-hash.c /usr/src/debug/nettle/4.0/blowfish.c /usr/src/debug/nettle/4.0/pkcs1-encrypt.c /usr/src/debug/nettle/4.0/blowfish.h /usr/src/debug/nettle/4.0/umac-poly64.c /usr/src/debug/nettle/4.0/gostdsa-vko.c /usr/src/debug/nettle/4.0/md-internal.h /usr/src/debug/nettle/4.0/poly1305.h /usr/src/debug/nettle/4.0/hmac-sha256.c /usr/src/debug/nettle/4.0/rsa-sec-compute-root.c /usr/src/debug/nettle/4.0/ecc-point-mul-g.c /usr/src/debug/nettle/4.0/chacha-core-internal.s /usr/src/debug/nettle/4.0/ecc-add-jjj.c /usr/src/debug/nettle/4.0/salsa20-set-nonce.c /usr/src/debug/nettle
 /4.0/asn1.h /usr/src/debug/nettle/4.0/rsa-decrypt-tr.c /usr/src/debug/nettle/4.0/ecc-mul-g.c /usr/src/debug/nettle/4.0/chacha-internal.h /usr/src/debug/nettle/4.0/nettle-internal.h /usr/src/debug/nettle/4.0/nettle-meta-ciphers.c /usr/src/debug/nettle/4.0/testsuite/sha384-test.c /usr/src/debug/nettle/4.0/base64url-decode.c /usr/src/debug/nettle/4.0/base64url-encode.c /usr/src/debug/nettle/4.0/testsuite/rsa-compute-root-test.c /usr/src/debug/nettle/4.0/siv-cmac.h /usr/src/debug/nettle/4.0/ecc-mul-a.c /usr/src/debug/nettle/4.0/siv-cmac.c /usr/src/debug/nettle/4.0/rsa-sign-tr.c /usr/src/debug/nettle/4.0/umac-set-key.c /usr/src/debug/nettle/4.0/hmac-ripemd160-meta.c /usr/src/debug/nettle/4.0/testsuite/gostdsa-keygen-test.c /usr/src/debug/nettle/4.0/hmac-sm3.c /usr/src/debug/nettle/4.0/fat-x86_64.c /usr/src/debug/nettle/4.0/sexp.c /usr/src/debug/nettle/4.0/sexp.h /usr/src/debug/nettle/4.0/testsuite/ed448-test.c /usr/src/debug/nettle/4.0/ecc-gost-gc512a.h /usr/src/debug/nettle/4.0/ecc-gost
 -gc512a.c /usr/src/debug/nettle/4.0/cnd-memcpy.c /usr/src/debug/nettle/4.0/sha3-384-meta.c /usr/src/debug/nettle/4.0/testsuite/dlopen-test.c /usr/src/debug/nettle/4.0/testsuite/x86-ibt-test.c /usr/src/debug/nettle/4.0/hmac-sha224-meta.c /usr/src/debug/nettle/4.0/hmac-sha256-meta.c /usr/src/debug/nettle/4.0/hmac-sha384-meta.c /usr/src/debug/nettle/4.0/hmac-sha512-meta.c /usr/src/debug/nettle/4.0/ecc-ecdsa-verify.c /usr/src/debug/nettle/4.0/salsa20-set-key.c /usr/src/debug/nettle/4.0/aes256-meta.c /usr/src/debug/nettle/4.0/arctwo-meta.c /usr/src/debug/nettle/4.0/aes128-meta.c /usr/src/debug/nettle/4.0/sha224-meta.c /usr/src/debug/nettle/4.0/sha256-meta.c /usr/src/debug/nettle/4.0/sha384-meta.c /usr/src/debug/nettle/4.0/sha512-meta.c /usr/src/debug/nettle/4.0/aes192-meta.c /usr/src/debug/nettle/4.0/nettle-meta.h /usr/src/debug/nettle/4.0/sm4.c /usr/src/debug/nettle/4.0/pss-mgf1.c /usr/src/debug/nettle/4.0/des3.c /usr/src/debug/nettle/4.0/pss-mgf1.h /usr/src/debug/nettle/4.0/sm4.h /usr/
 src/debug/nettle/4.0/pbkdf2-hmac-sha512.c /usr/src/debug/nettle/4.0/ecc-scalar.c /usr/src/debug/nettle/4.0/testsuite/bcrypt-test.c /usr/src/debug/nettle/4.0/poly1305-aes.c /usr/src/debug/nettle/4.0/testsuite/salsa20-test.c /usr/src/debug/nettle/4.0/ecc-gostdsa-verify.c /usr/src/debug/nettle/4.0/slh-dsa-128f.c /usr/src/debug/nettle/4.0/eddsa-expand.c /usr/src/debug/nettle/4.0/hmac-md5.c /usr/src/debug/nettle/4.0/ecc-point.c /usr/src/debug/nettle/4.0/rsa-pkcs1-sign.c /usr/src/debug/nettle/4.0/nettle-meta-macs.c /usr/src/debug/nettle/4.0/base16-decode.c /usr/src/debug/nettle/4.0/base64-decode.c /usr/src/debug/nettle/4.0/nettle-meta-hashes.c /usr/src/debug/nettle/4.0/testsuite/eddsa-compress-test.c /usr/src/debug/nettle/4.0/aes-set-key-internal.c /usr/src/debug/nettle/4.0/ctr.c /usr/src/debug/nettle/4.0/dsa.h /usr/src/debug/nettle/4.0/nettle-write.h /usr/src/debug/nettle/4.0/dsa.c /usr/src/debug/nettle/4.0/ctr.h /usr/src/debug/nettle/4.0/umac-nh-n.s /usr/src/debug/nettle/4.0/cmac.h /usr
 /src/debug/nettle/4.0/slh-merkle.c /usr/src/debug/nettle/4.0/cmac.c /usr/src/debug/nettle/4.0/twofish-meta.c /usr/src/debug/nettle/4.0/ecc-curve25519.h /usr/src/debug/nettle/4.0/ecc-curve448.h /usr/src/debug/nettle/4.0/poly1305-blocks.s /usr/src/debug/nettle/4.0/ecc-curve448.c /usr/src/debug/nettle/4.0/camellia128-meta.c /usr/src/debug/nettle/4.0/camellia192-meta.c /usr/src/debug/nettle/4.0/camellia256-meta.c /usr/src/debug/nettle/4.0/ecc-curve25519.c /usr/src/debug/nettle/4.0/aes192-decrypt-2.s /usr/src/debug/nettle/4.0/aes128-decrypt-2.s /usr/src/debug/nettle/4.0/aes256-decrypt-2.s /usr/src/debug/nettle/4.0/testsuite/ecc-redc-test.c /usr/src/debug/nettle/4.0/ecc-gostdsa-sign.c /usr/src/debug/nettle/4.0/poly1305-update.c /usr/src/debug/nettle/4.0/ripemd160.c /usr/src/debug/nettle/4.0/memxor3.s /usr/src/debug/nettle/4.0/ripemd160.h /usr/src/debug/nettle/4.0/rsa-sha256-sign.c /usr/src/debug/nettle/4.0/cmac-des3-meta.c /usr/src/debug/nettle/4.0/hmac-sha512.c /usr/src/debug/nettle/4.0/
 serpent-decrypt.s /usr/src/debug/nettle/4.0/serpent-encrypt.s /usr/src/debug/nettle/4.0/umac-l3.c /usr/src/debug/nettle/4.0/ed25519-sha512-sign.c /usr/src/debug/nettle/4.0/ccm-aes192.c /usr/src/debug/nettle/4.0/ecc-curve.h /usr/src/debug/nettle/4.0/gcm-aes192.c /usr/src/debug/nettle/4.0/getopt1.c /usr/src/debug/nettle/4.0/gcm.c /usr/src/debug/nettle/4.0/gcm.h /usr/src/debug/nettle/4.0/ccm-aes256.c /usr/src/debug/nettle/4.0/xts-aes256.c /usr/src/debug/nettle/4.0/gcm-aes256.c /usr/src/debug/nettle/4.0/testsuite/camellia-test.c /usr/src/debug/nettle/4.0/testsuite/des3-test.c /usr/src/debug/nettle/4.0/testsuite/ecdh-test.c /usr/src/debug/nettle/4.0/oaep.h /usr/src/debug/nettle/4.0/pss.c /usr/src/debug/nettle/4.0/testsuite/hkdf-test.c /usr/src/debug/nettle/4.0/testsuite/hmac-test.c /usr/src/debug/nettle/4.0/testsuite/sexp-test.c /usr/src/debug/nettle/4.0/testsuite/sha1-test.c /usr/src/debug/nettle/4.0/curve25519.h /usr/src/debug/nettle/4.0/testsuite/cmac-test.c /usr/src/debug/nettle/4.0/
 pss.h /usr/src/debug/nettle/4.0/oaep.c /usr/src/debug/nettle/4.0/chacha-set-nonce.c /usr/src/debug/nettle/4.0/eddsa-hash.c /usr/src/debug/nettle/4.0/testsuite/aes-keywrap-test.c /usr/src/debug/nettle/4.0/yarrow_key_event.c /usr/src/debug/nettle/4.0/ecc.h /usr/src/debug/nettle/4.0/curve25519-mul.c /usr/src/debug/nettle/4.0/rsa-md5-verify.c /usr/src/debug/nettle/4.0/cnd-copy.c /usr/src/debug/nettle/4.0/testsuite/base16-test.c /usr/src/debug/nettle/4.0/hmac-ripemd160.c /usr/src/debug/nettle/4.0/hmac-sha384.c /usr/src/debug/nettle/4.0/bignum-random-prime.c /usr/src/debug/nettle/4.0/md2-meta.c /usr/src/debug/nettle/4.0/md4-meta.c /usr/src/debug/nettle/4.0/md5-meta.c /usr/src/debug/nettle/4.0/sm3-meta.c /usr/src/debug/nettle/4.0/sm4-meta.c /usr/src/debug/nettle/4.0/testsuite/ecc-mod-arith-test.c /usr/src/debug/nettle/4.0/cast128.h /usr/src/debug/nettle/4.0/testsuite/meta-mac-test.c /usr/src/debug/nettle/4.0/testsuite/sha3-512-test.c /usr/src/debug/nettle/4.0/realloc.h /usr/src/debug/nettl
 e/4.0/cast128.c /usr/src/debug/nettle/4.0/chacha-crypt.c /usr/src/debug/nettle/4.0/umac128.c /usr/src/debug/nettle/4.0/nettle-types.h /usr/src/debug/nettle/4.0/realloc.c /usr/src/debug/nettle/4.0/umac-l2.c /usr/src/debug/nettle/4.0/ecc-ecdsa-sign.c /usr/src/debug/nettle/4.0/gostdsa.h /usr/src/debug/nettle/4.0/slh-dsa.h /usr/src/debug/nettle/4.0/testsuite/ecc-modinv-test.c /usr/src/debug/nettle/4.0/der2dsa.c /usr/src/debug/nettle/4.0/der2rsa.c /usr/src/debug/nettle/4.0/sha3-shake.c /usr/src/debug/nettle/4.0/slh-dsa.c /usr/src/debug/nettle/4.0/testsuite/sexp2rsa-test.c /usr/src/debug/nettle/4.0/testsuite/gostdsa-verify-test.c /usr/src/debug/nettle/4.0/salsa20.h /usr/src/debug/nettle/4.0/slh-wots.c /usr/src/debug/nettle/4.0/gostdsa-sign.c /usr/src/debug/nettle/4.0/pkcs1-sec-decrypt.c /usr/src/debug/nettle/4.0/testsuite/rsa2sexp-test.c /usr/src/debug/nettle/4.0/umac.h /usr/src/debug/nettle/4.0/cmac-des3.c /usr/src/debug/nettle/4.0/cmac-aes256.c /usr/src/debug/nettle/4.0/sm3.h /usr/src/d
 ebug/nettle/4.0/pkcs1-rsa-sha1.c /usr/src/debug/nettle/4.0/sm3.c /usr/src/debug/nettle/4.0/streebog.c /usr/src/debug/nettle/4.0/ecdsa-verify.c /usr/src/debug/nettle/4.0/eddsa-verify.c /usr/src/debug/nettle/4.0/streebog.h /usr/src/debug/nettle/4.0/testsuite/yarrow-test.c /usr/src/debug/nettle/4.0/siv-gcm.c /usr/src/debug/nettle/4.0/siv-gcm.h /usr/src/debug/nettle/4.0/desCode.h /usr/src/debug/nettle/4.0/nist-keywrap.h /usr/src/debug/nettle/4.0/md4.c /usr/src/debug/nettle/4.0/xts.c /usr/src/debug/nettle/4.0/nist-keywrap.c /usr/src/debug/nettle/4.0/siv-cmac-aes256.c /usr/src/debug/nettle/4.0/xts.h /usr/src/debug/nettle/4.0/md4.h /usr/src/debug/nettle/4.0/sha512-224-meta.c /usr/src/debug/nettle/4.0/sha512-256-meta.c /usr/src/debug/nettle/4.0/testsuite/meta-cipher-test.c /usr/src/debug/nettle/4.0/hmac-streebog-meta.c /usr/src/debug/nettle/4.0/testsuite/cxx-test.cxx /usr/src/debug/nettle/4.0/ecc-mul-g-eh.c /usr/src/debug/nettle/4.0/curve448-eh-to-x.c /usr/src/debug/nettle/4.0/testsuite/drb
 g-ctr-aes256-test.c /usr/src/debug/nettle/4.0/ecdsa-keygen.c /usr/src/debug/nettle/4.0/buffer-init.c /usr/src/debug/nettle/4.0/ecc-point-mul.c /usr/src/debug/nettle/4.0/gcm-camellia256-meta.c /usr/src/debug/nettle/4.0/rsa-sha512-sign-tr.c /usr/src/debug/nettle/4.0/des.c /usr/src/debug/nettle/4.0/ed448-shake256.c /usr/src/debug/nettle/4.0/des.h /usr/src/debug/nettle/4.0/aes128-set-decrypt-key.c /usr/src/debug/nettle/4.0/aes128-set-encrypt-key.c /usr/src/debug/nettle/4.0/aes192-set-decrypt-key.c /usr/src/debug/nettle/4.0/aes192-set-encrypt-key.c /usr/src/debug/nettle/4.0/aes256-set-decrypt-key.c /usr/src/debug/nettle/4.0/aes256-set-encrypt-key.c /usr/src/debug/nettle/4.0/non-nettle.c /usr/src/debug/nettle/4.0/testsuite/siv-gcm-test.c /usr/src/debug/nettle/4.0/camellia-table.c /usr/src/debug/nettle/4.0/non-nettle.h /usr/src/debug/nettle/4.0/camellia.h /usr/src/debug/nettle/4.0/testsuite/ecc-add-test.c /usr/src/debug/nettle/4.0/testsuite/gosthash94-test.c /usr/src/debug/nettle/4.0/fat-s
 etup.h /usr/src/debug/nettle/4.0/testsuite/sha3-224-test.c /usr/src/debug/nettle/4.0/testsuite/sha3-256-test.c /usr/src/debug/nettle/4.0/testsuite/sha512-224-test.c /usr/src/debug/nettle/4.0/testsuite/sha512-256-test.c /usr/src/debug/nettle/4.0/hmac-internal.c /usr/src/debug/nettle/4.0/ripemd160-compress.c /usr/src/debug/nettle/4.0/sha3-internal.h /usr/src/debug/nettle/4.0/umac-internal.h /usr/src/debug/nettle/4.0/hmac-internal.h /usr/src/debug/nettle/4.0/sha2-internal.h /usr/src/debug/nettle/4.0/md2.h /usr/src/debug/nettle/4.0/ecc-pm1-redc.c /usr/src/debug/nettle/4.0/ecc-pp1-redc.c /usr/src/debug/nettle/4.0/chacha-poly1305.c /usr/src/debug/nettle/4.0/sha3-224-meta.c /usr/src/debug/nettle/4.0/ghash-set-key.c /usr/src/debug/nettle/4.0/ocb.c /usr/src/debug/nettle/4.0/chacha-poly1305.h /usr/src/debug/nettle/4.0/md2.c /usr/src/debug/nettle/4.0/ocb.h /usr/src/debug/nettle/4.0/blowfish-bcrypt.c /usr/src/debug/nettle/4.0/ghash-update-2.s /usr/src/debug/nettle/4.0/slh-dsa-shake-128s.c /usr/
 src/debug/nettle/4.0/sha2.h /usr/src/debug/nettle/4.0/hmac.h /usr/src/debug/nettle/4.0/testsuite/shake128-test.c /usr/src/debug/nettle/4.0/ecc-dup-jj.c /usr/src/debug/nettle/4.0/sha1-compress.s /usr/src/debug/nettle/4.0/ecc-eh-to-a.c /usr/src/debug/nettle/4.0/nettle-meta-aeads.c /usr/src/debug/nettle/4.0/salsa20-core-internal.s /usr/src/debug/nettle/4.0/ripemd160-internal.h /usr/src/debug/nettle/4.0/slh-fors.c /usr/src/debug/nettle/4.0/ecc-mul-m.c /usr/src/debug/nettle/4.0/balloon-sha256.c /usr/src/debug/nettle/4.0/balloon-sha384.c /usr/src/debug/nettle/4.0/balloon-sha512.c /usr/src/debug/nettle/4.0/cbc.h /usr/src/debug/nettle/4.0/dsa-gen-params.c /usr/src/debug/nettle/4.0/ecc-nonsec-add-jjj.c /usr/src/debug/nettle/4.0/rsa-md5-sign-tr.c /usr/src/debug/nettle/4.0/eax-aes128-meta.c /usr/src/debug/nettle/4.0/cbc.c /usr/src/debug/nettle/4.0/gcm-aes128-meta.c /usr/src/debug/nettle/4.0/gcm-aes192-meta.c /usr/src/debug/nettle/4.0/testsuite/md5-test.c /usr/src/debug/nettle/4.0/testsuite/ocb
 -test.c /usr/src/debug/nettle/4.0/ecc-mod-arith.c /usr/src/debug/nettle/4.0/hmac-md5-meta.c /usr/src/debug/nettle/4.0/pkcs1-decrypt.c /usr/src/debug/nettle/4.0/sec-add-1.c /usr/src/debug/nettle/4.0/gost28147.c /usr/src/debug/nettle/4.0/siv-cmac-aes128.c /usr/src/debug/nettle/4.0/ecc-a-to-j.c /usr/src/debug/nettle/4.0/testsuite/twofish-test.c /usr/src/debug/nettle/4.0/ripemd160-meta.c /usr/src/debug/nettle/4.0/rsa-md5-sign.c /usr/src/debug/nettle/4.0/testsuite/bignum-test.c /usr/src/debug/nettle/4.0/ecc-add-th.c /usr/src/debug/nettle/4.0/chacha-set-key.c /usr/src/debug/nettle/4.0/slh-dsa-sha2-128f.c /usr/src/debug/nettle/4.0/testsuite/poly1305-test.c /usr/src/debug/nettle/4.0/sha3.h /usr/src/debug/nettle/4.0/cbc-aes256-encrypt.c /usr/src/debug/nettle/4.0/sha3.c /usr/src/debug/nettle/4.0/ed448-shake256-sign.c /usr/src/debug/nettle/4.0/rsa-sha256-sign-tr.c /usr/src/debug/nettle/4.0/salsa20r12-crypt.c /usr/src/debug/nettle/4.0/block-internal.h /usr/src/debug/nettle/4.0/bswap-internal.h 
 /usr/src/debug/nettle/4.0/eddsa-internal.h /usr/src/debug/nettle/4.0/ghash-internal.h /usr/src/debug/nettle/4.0/pkcs1-internal.h /usr/src/debug/nettle/4.0/camellia-crypt-internal.s /usr/src/debug/nettle/4.0/testsuite/ripemd160-test.c /usr/src/debug/nettle/4.0/siv-ghash-update.c /usr/src/debug/nettle/4.0/cmac-aes128.c /usr/src/debug/nettle/4.0/rsa-pss-sha256-verify.c /usr/src/debug/nettle/4.0/rsa-pss-sha512-verify.c /usr/src/debug/nettle/4.0/slh-dsa-shake-128f.c /usr/src/debug/nettle/4.0/testsuite/sha3-384-test.c /usr/src/debug/nettle/4.0/base16-encode.c /usr/src/debug/nettle/4.0/base64-encode.c /usr/src/debug/nettle/4.0/testsuite/cnd-memcpy-test.c /usr/src/debug/nettle/4.0/testsuite/slh-dsa-test.c /usr/src/debug/nettle/4.0/testsuite/chacha-test.c /usr/src/debug/nettle/4.0/ccm-aes128.c /usr/src/debug/nettle/4.0/eax-aes128.c /usr/src/debug/nettle/4.0/gcm-aes128.c /usr/src/debug/nettle/4.0/ocb-aes128.c /usr/src/debug/nettle/4.0/xts-aes128.c /usr/src/debug/nettle/4.0/ed25519-sha512-pubk
 ey.c /usr/src/debug/nettle/4.0/hmac-sha1-meta.c /usr/src/debug/nettle/4.0/rsa.c /usr/src/debug/nettle/4.0/aes.h /usr/src/debug/nettle/4.0/ecc-dup-th.c /usr/src/debug/nettle/4.0/rsa.h /usr/src/debug/nettle/4.0/testsuite/pss-mgf1-test.c /usr/src/debug/nettle/4.0/aes128-decrypt.c /usr/src/debug/nettle/4.0/aes192-decrypt.c /usr/src/debug/nettle/4.0/aes256-decrypt.c /usr/src/debug/nettle/4.0/rsa-sha256-verify.c /usr/src/debug/nettle/4.0/sec-sub-1.c /usr/src/debug/nettle/4.0/testsuite/shake256-test.c /usr/src/debug/nettle/4.0/testsuite/streebog-test.c /usr/src/debug/nettle/4.0/ecc-add-jja.c /usr/src/debug/nettle/4.0/ecc-size.c /usr/src/debug/nettle/4.0/sexp-transport.c /usr/src/debug/nettle/4.0/ecdsa-sign.c /usr/src/debug/nettle/4.0/eddsa-sign.c /usr/src/debug/nettle/4.0/cfb.h /usr/src/debug/nettle/4.0/sha256-compress-n-2.s /usr/src/debug/nettle/4.0/salsa20-internal.h /usr/src/debug/nettle/4.0/ghash-set-key-2.s /usr/src/debug/nettle/4.0/ecc-dup-eh.c /usr/src/debug/nettle/4.0/cfb.c /usr/sr
 c/debug/nettle/4.0/testsuite/curve448-dh-test.c /usr/src/debug/nettle/4.0/blowfish-internal.h /usr/src/debug/nettle/4.0/eddsa-pubkey.c /usr/src/debug/nettle/4.0/sexp2dsa.c /usr/src/debug/nettle/4.0/sexp2rsa.c /usr/src/debug/nettle/4.0/gosthash94-meta.c /usr/src/debug/nettle/4.0/camellia-invert-key.c /usr/src/debug/nettle/4.0/ghash-update.s /usr/src/debug/nettle/4.0/sha3-permute.s /usr/src/debug/nettle/4.0/shake128.c /usr/src/debug/nettle/4.0/testsuite/ed25519-test.c /usr/src/debug/nettle/4.0/testsuite/siv-cmac-test.c /usr/src/debug/nettle/4.0/testsuite/buffer-test.c /usr/src/debug/nettle/4.0/write-be32.c /usr/src/debug/nettle/4.0/slh-dsa-internal.h /usr/src/debug/nettle/4.0/siv-ghash-set-key.c /usr/src/debug/nettle/4.0/slh-xmss.c /usr/src/debug/nettle/4.0/rsa-sha1-sign-tr.c /usr/src/debug/nettle/4.0/pkcs1-rsa-sha256.c /usr/src/debug/nettle/4.0/testsuite/meta-aead-test.c /usr/src/debug/nettle/4.0/pkcs1-rsa-digest.c /usr/src/debug/nettle/4.0/testsuite/sha3-permute-test.c /usr/src/debu
 g/nettle/4.0/hogweed-internal.h /usr/src/debug/nettle/4.0/testsuite/base64-test.c /usr/src/debug/nettle/4.0/ecc-add-eh.c /usr/src/debug/nettle/4.0/sha3-256-meta.c /usr/src/debug/nettle/4.0/hmac-sm3-meta.c /usr/src/debug/nettle/4.0/camellia128-set-encrypt-key.c /usr/src/debug/nettle/4.0/camellia128-set-decrypt-key.c /usr/src/debug/nettle/4.0/camellia256-set-decrypt-key.c /usr/src/debug/nettle/4.0/camellia256-set-encrypt-key.c /usr/src/debug/nettle/4.0/cast128-meta.c /usr/src/debug/nettle/4.0/ecc-secp256r1-redc.s /usr/src/debug/nettle/4.0/testsuite/pkcs1-sec-decrypt-test.c /usr/src/debug/nettle/4.0/testsuite/sha256-test.c /usr/src/debug/nettle/4.0/testsuite/pss-test.c /usr/src/debug/nettle/4.0/testsuite/rsa-test.c /usr/src/debug/nettle/4.0/testsuite/sm3-test.c /usr/src/debug/nettle/4.0/testsuite/sm4-test.c /usr/src/debug/nettle/4.0/testsuite/aes-test.c /usr/src/debug/nettle/4.0/testsuite/cbc-test.c /usr/src/debug/nettle/4.0/testsuite/ccm-test.c /usr/src/debug/nettle/4.0/testsuite/arcf
 our-test.c /usr/src/debug/nettle/4.0/testsuite/cfb-test.c /usr/src/debug/nettle/4.0/testsuite/ctr-test.c /usr/src/debug/nettle/4.0/ed25519-sha512.c /usr/src/debug/nettle/4.0/cmac-aes128-meta.c /usr/src/debug/nettle/4.0/cmac-aes256-meta.c /usr/src/debug/nettle/4.0/ed448-shake256-pubkey.c /usr/src/debug/nettle/4.0/eddsa-compress.c /usr/src/debug/nettle/4.0/cast128_sboxes.h /usr/src/debug/nettle/4.0/sexp-transport-format.c /usr/src/debug/nettle/4.0/ecc-curve25519-modp.s /usr/src/debug/nettle/4.0/testsuite/ecdsa-keygen-test.c /usr/src/debug/nettle/4.0/rsa-oaep-decrypt.c /usr/src/debug/nettle/4.0/rsa-oaep-encrypt.c /usr/src/debug/nettle/4.0/testsuite/ecdsa-verify-test.c /usr/src/debug/nettle/4.0/testsuite/eddsa-verify-test.c /usr/src/debug/nettle/4.0/testsuite/gostdsa-sign-test.c /usr/src/debug/nettle/4.0/ecc-add-ehh.c /usr/src/debug/nettle/4.0/testsuite/chacha-poly1305-test.c /usr/src/debug/nettle/4.0/testsuite/arctwo-test.c /usr/src/debug/nettle/4.0/testsuite/rsa-oaep-encrypt-test.c /u
 sr/src/debug/nettle/4.0/streebog-meta.c /usr/src/debug/nettle/4.0/aes128-encrypt.c /usr/src/debug/nettle/4.0/aes192-encrypt.c /usr/src/debug/nettle/4.0/aes256-encrypt.c /usr/src/debug/nettle/4.0/rsa-sha512-verify.c /usr/src/debug/nettle/4.0/yarrow256.c /usr/src/debug/nettle/4.0/curve448-mul-g.c /usr/src/debug/nettle/4.0/pbkdf2-hmac-gosthash94.c /usr/src/debug/nettle/4.0/gcm-sm4.c /usr/src/debug/nettle/4.0/gost28147-internal.h /usr/src/debug/nettle/4.0/testsuite/memxor-test.c /usr/src/debug/nettle/4.0/testsuite/gostdsa-vko-test.c /usr/src/debug/nettle/4.0/camellia-absorb.c /usr/src/debug/nettle/4.0/eddsa-decompress.c /usr/src/debug/nettle/4.0/hmac-gosthash94.c /usr/src/debug/nettle/4.0/aes-encrypt-table.c /usr/src/debug/nettle/4.0/aes-decrypt-table.c /usr/src/debug/nettle/4.0/salsa20-2core.s /usr/src/debug/nettle/4.0/sha3-224.c /usr/src/debug/nettle/4.0/slh-dsa-128s.c /usr/src/debug/nettle/4.0/salsa20-crypt.c /usr/src/debug/nettle/4.0/serpent-set-key.c /usr/src/debug/nettle/4.0/tests
 uite/serpent-test.c /usr/src/debug/nettle/4.0/testsuite/sha224-test.c /usr/src/debug/nettle/4.0/testsuite/meta-hash-test.c /usr/src/debug/nettle/4.0/testsuite/sha1-huge-test.c /usr/src/debug/nettle/4.0/testsuite/pbkdf2-test.c /usr/src/debug/nettle/4.0/pbkdf2-hmac-sha384.c /usr/src/debug/nettle/4.0/pkcs1-rsa-sha512.c /usr/src/debug/nettle/4.0/sexp2bignum.c /usr/src/debug/nettle/4.0/ecc-secp192r1-modp.s /usr/src/debug/nettle/4.0/ecc-secp224r1-modp.s /usr/src/debug/nettle/4.0/ecc-secp384r1-modp.s /usr/src/debug/nettle/4.0/ecc-secp521r1-modp.s /usr/src/debug/nettle/4.0/aes-internal.h /usr/src/debug/nettle/4.0/ctr-internal.h /usr/src/debug/nettle/4.0/dsa-internal.h /usr/src/debug/nettle/4.0/ecc-internal.h /usr/src/debug/nettle/4.0/gcm-internal.h /usr/src/debug/nettle/4.0/rsa-internal.h /usr/src/debug/nettle/4.0/sha3-512-meta.c /usr/src/debug/nettle/4.0/ecdsa.h /usr/src/debug/nettle/4.0/eddsa.h /usr/src/debug/nettle/4.0/pkcs1.h /usr/src/debug/nettle/4.0/ctr16.c /usr/src/debug/nettle/4.0/p
 kcs1.c /usr/src/debug/nettle/4.0/rsa-sha1-sign.c /usr/src/debug/nettle/4.0/testsuite/sha512-test.c /usr/src/debug/nettle/4.0/hmac-sha224.c /usr/src/debug/nettle/4.0/pbkdf2-hmac-sha1.c /usr/src/debug/nettle/4.0/sha1-meta.c /usr/src/debug/nettle/4.0/cpuid.s /usr/src/debug/nettle/4.0/lib/getopt-core.h /usr/src/debug/nettle/4.0/testsuite/curve25519-dh-test.c /usr/src/debug/nettle/4.0/serpent-internal.h /usr/src/debug/nettle/4.0/ecc-mul-a-eh.c /usr/src/debug/nettle/4.0/serpent-meta.c /usr/src/debug/nettle/4.0/testsuite/ecc-dup-test.c /usr/src/debug/nettle/4.0/hkdf.h /usr/src/debug/nettle/4.0/hkdf.c /usr/src/debug/nettle/4.0/ed25519-sha512-verify.c /usr/src/debug/nettle/4.0/dsa2sexp.c /usr/src/debug/nettle/4.0/rsa2sexp.c /usr/src/debug/nettle/4.0/testsuite/dsa-keygen-test.c /usr/src/debug/nettle/4.0/testsuite/rsa-keygen-test.c /usr/src/debug/nettle/4.0/balloon-sha1.c /usr/src/debug/nettle/4.0/hmac-streebog.c /usr/src/debug/nettle/4.0/testsuite/ecc-sqrt-test.c /usr/src/debug/nettle/4.0/tes
 tsuite/pkcs1-test.c /usr/src/debug/nettle/4.0/hmac-gosthash94-meta.c /usr/src/debug/nettle/4.0/aes-invert-internal.c /usr/src/debug/nettle/4.0/testsuite/rsa-sec-decrypt-test.c /usr/src/debug/nettle/4.0/sexp-format.c /usr/src/debug/nettle/4.0/cbc-aes128-encrypt-2.s /usr/src/debug/nettle/4.0/cbc-aes192-encrypt-2.s /usr/src/debug/nettle/4.0/slh-shake.c /usr/src/debug/nettle/4.0/aes128-encrypt-2.s /usr/src/debug/nettle/4.0/aes192-encrypt-2.s /usr/src/debug/nettle/4.0/aes256-encrypt-2.s /usr/src/debug/nettle/4.0/testsuite/blowfish-test.c /usr/src/debug/nettle/4.0/sha512-compress.s /usr/src/debug/nettle/4.0/curve448-mul.c /usr/src/debug/nettle/4.0/testsuite/ecdsa-sign-test.c /usr/src/debug/nettle/4.0/testsuite/eddsa-sign-test.c /usr/src/debug/nettle/4.0/balloon.c /usr/src/debug/nettle/4.0/version.c /usr/src/debug/nettle/4.0/balloon.h /usr/src/debug/nettle/4.0/testsuite/random-prime-test.c /usr/src/debug/nettle/4.0/testsuite/rsa-encrypt-test.c /usr/src/debug/nettle/4.0/version.h /usr/src/d
 ebug/nettle/4.0/umac-poly128.c /usr/src/debug/nettle/4.0/dsa-sign.c /usr/src/debug/nettle/4.0/gcm-aes256-meta.c /usr/src/debug/nettle/4.0/rsa-sign.c /usr/src/debug/nettle/4.0/camellia-internal.h /usr/src/debug/nettle/4.0/rsa-sha512-sign.c /usr/src/debug/nettle/4.0/md5.h /usr/src/debug/nettle/4.0/rsa-pss-sha256-sign-tr.c /usr/src/debug/nettle/4.0/rsa-pss-sha512-sign-tr.c /usr/src/debug/nettle/4.0/md5.c /usr/src/debug/nettle/4.0/aes-decrypt-internal.s /usr/src/debug/nettle/4.0/aes-encrypt-internal.s /usr/src/debug/nettle/4.0/sha3-384.c /usr/src/debug/nettle/4.0/lib/getopt-ext.h /usr/src/debug/nettle/4.0/memeql-sec.c /usr/src/debug/nettle/4.0/gosthash94.c /usr/src/debug/nettle/4.0/gosthash94.h /usr/src/debug/nettle/4.0/sha256-compress-n.s /usr/src/debug/nettle/4.0/testsuite/rsa-sign-tr-test.c /usr/src/debug/nettle/4.0/drbg-ctr.h /usr/src/debug/nettle/4.0/ecc-random.c /usr/src/debug/nettle/4.0/testsuite/ecc-mod-test.c /usr/src/debug/nettle/4.0/cbc-aes128-encrypt.c /usr/src/debug/nettle/
 4.0/cbc-aes192-encrypt.c /usr/src/debug/nettle/4.0/hmac-sha1.c /usr/src/debug/nettle/4.0/pkcs1-rsa-md5.c /usr/src/debug/nettle/4.0/gcm-camellia256.c /usr/src/debug/nettle/4.0/getopt.h /usr/src/debug/nettle/4.0/pbkdf2-hmac-sha256.c /usr/src/debug/nettle/4.0/testsuite/cast128-test.c /usr/src/debug/nettle/4.0/buffer.h /usr/src/debug/nettle/4.0/chacha.h /usr/src/debug/nettle/4.0/config.h /usr/src/debug/nettle/4.0/macros.h /usr/src/debug/nettle/4.0/arctwo.h /usr/src/debug/nettle/4.0/base16.h /usr/src/debug/nettle/4.0/camellia128-crypt.c /usr/src/debug/nettle/4.0/camellia256-crypt.c /usr/src/debug/nettle/4.0/testsuite/ecc-mul-a-test.c /usr/src/debug/nettle/4.0/testsuite/ecc-mul-g-test.c /usr/src/debug/nettle/4.0/dsa-keygen.c /usr/src/debug/nettle/4.0/rsa-keygen.c /usr/src/debug/nettle/4.0/testsuite/balloon-test.c /usr/src/debug/nettle/4.0/ecc-j-to-a.c /usr/src/debug/nettle/4.0/testsuite/knuth-lfib-test.c /usr/src/debug/nettle/4.0/arctwo.c /usr/src/debug/nettle/4.0/bignum.c /usr/src/debug/
 nettle/4.0/buffer.c /usr/src/debug/nettle/4.0/cmac64.c /usr/src/debug/nettle/4.0/pbkdf2.c /usr/src/debug/nettle/4.0/curve25519-eh-to-x.c /usr/src/debug/nettle/4.0/ed448-shake256-verify.c /usr/src/debug/nettle/4.0/der-iterator.c /usr/src/debug/nettle/4.0/sha3-512.c /usr/src/debug/nettle/4.0/eax.h /usr/src/debug/nettle/4.0/slh-dsa-sha2-128s.c /usr/src/debug/nettle/4.0/testsuite/testutils.h /usr/src/debug/nettle/4.0/testsuite/testutils.c /usr/src/debug/nettle/4.0/sha3-256.c /usr/src/debug/nettle/4.0/shake256.c /usr/src/debug/nettle/4.0/testsuite/rsa-pss-sign-tr-test.c /usr/src/debug/nettle/4.0/bignum-random.c /usr/src/debug/nettle/4.0/eax.c /usr/src/debug/nettle/4.0/testsuite/umac-test.c /usr/src/debug/nettle/4.0/gcm-camellia128.c /usr/src/debug/nettle/4.0/gostdsa-verify.c /usr/src/debug/nettle/4.0/drbg-ctr-aes256.c /usr/src/debug/nettle/4.0/ecc-mod.c /usr/src/debug/nettle/4.0/salsa20-128-set-key.c /usr/src/debug/nettle/4.0/salsa20-256-set-key.c /usr/src/debug/nettle/4.0/gmp-glue.c /us
 r/src/debug/nettle/4.0/memxor-2.s /usr/src/debug/nettle/4.0/umac-nh.s /usr/src/debug/nettle/4.0/gmp-glue.h /usr/src/debug/nettle/4.0/dsa-verify.c /usr/src/debug/nettle/4.0/rsa-verify.c /usr/src/debug/nettle/4.0/twofish.h /usr/src/debug/nettle/4.0/sha1.h /usr/src/debug/nettle/4.0/twofish.c /usr/src/debug/nettle/4.0/sha1.c /usr/src/debug/nettle/4.0/yarrow.h /usr/src/debug/nettle/4.0/base64.h /usr/src/debug/nettle/4.0/bignum.h /usr/src/debug/nettle/4.0/keymap.h /usr/src/debug/nettle/4.0/memops.h /usr/src/debug/nettle/4.0/slh-sha256.c /usr/src/debug/nettle/4.0/memxor.h /usr/src/debug/nettle/4.0/pbkdf2.h /usr/src/debug/nettle/4.0/rotors.h /usr/src/debug/nettle/4.0/sha256.c /usr/src/debug/nettle/4.0/sha512.c /usr/src/debug/nettle/4.0/umac32.c /usr/src/debug/nettle/4.0/umac64.c /usr/src/debug/nettle/4.0/umac96.c /usr/src/debug/nettle/4.0/getopt.c /usr/src/debug/nettle/4.0/arcfour.c /usr/src/debug/nettle/4.0/arcfour.h /usr/src/debug/nettle/4.0/gcm-sm4-meta.c /usr/src/debug/nettle/4.0/cbc-ae
 s256-encrypt-2.s /usr/src/debug/nettle/4.0/memxor.s /usr/src/debug/nettle/4.0/rsa-sha1-verify.c /usr/src/debug/nettle/4.0/ecc-secp192r1.c /usr/src/debug/nettle/4.0/ecc-secp224r1.c /usr/src/debug/nettle/4.0/ecc-secp256r1.c /usr/src/debug/nettle/4.0/ecc-secp384r1.c /usr/src/debug/nettle/4.0/ecc-secp521r1.c /usr/src/debug/nettle/4.0/salsa20-crypt-internal.c /usr/src/debug/nettle/4.0/ecc-secp192r1.h /usr/src/debug/nettle/4.0/ecc-secp224r1.h /usr/src/debug/nettle/4.0/ecc-secp256r1.h /usr/src/debug/nettle/4.0/ecc-secp384r1.h /usr/src/debug/nettle/4.0/ecc-secp521r1.h /usr/src/debug/nettle/4.0/write-le32.c /usr/src/debug/nettle/4.0/nettle-lookup-hash.c /usr/src/debug/nettle/4.0/ccm.h /usr/src/debug/nettle/4.0/ecc-gost-gc256b.c /usr/src/debug/nettle/4.0/ecc-gost-gc256b.h /usr/src/debug/nettle/4.0/chacha-poly1305-meta.c /usr/src/debug/nettle/4.0/ccm.c /usr/src/debug/nettle/4.0/sha1-compress-2.s /usr/src/debug/nettle/4.0/siv-gcm-aes128.c /usr/src/debug/nettle/4.0/siv-gcm-aes256.c /usr/src/debu
 g/nettle/4.0/poly1305-internal.h /usr/src/debug/nettle/4.0/poly1305-internal.s /usr/src/debug/nettle/4.0/testsuite/version-test.c /usr/src/debug/nettle/4.0/testsuite/des-test.c /usr/src/debug/nettle/4.0/testsuite/dsa-test.c /usr/src/debug/nettle/4.0/testsuite/eax-test.c /usr/src/debug/nettle/4.0/testsuite/gcm-test.c /usr/src/debug/nettle/4.0/testsuite/xts-test.c /usr/src/debug/nettle/4.0/curve25519-mul-g.c /usr/src/debug/nettle/4.0/rsa-sec-decrypt.c /usr/src/debug/nettle/4.0/testsuite/md2-test.c /usr/src/debug/nettle/4.0/rsa-pkcs1-verify.c /usr/src/debug/nettle/4.0/testsuite/md4-test.c /usr/src/debug/nettle/4.0/curve448.h /usr/src/debug/nettle/4.0/serpent.h /usr/src/debug/nettle/4.0/ecc-mod-inv.c /usr/src/debug/nettle/4.0/testsuite/sexp-format-test.c /usr/src/debug/nettle/4.0/ecc-curve448-modp.s /usr/src/debug/nettle/4.0/testsuite/memeql-test.c /usr/src/debug/nettle/4.0/write-le64.c /usr/src/debug/nettle/4.0/rsa-decrypt.c /usr/src/debug/nettle/4.0/rsa-encrypt.c /usr/src/debug/nettle
 /4.0/gcm-camellia128-meta.c /usr/src/debug/nettle/4.0/ecc-add-thh.c"
packages/x86-64-v3-poky-linux/nettle/nettle-src: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-staticdev: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-staticdev: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle: PKGSIZE changed from 676083 to 676081 (-0%)
packages/x86-64-v3-poky-linux/nettle/nettle: FILELIST: removed "/usr/lib/libhogweed.so.6.11 /usr/lib/libnettle.so.8.11 /usr/lib/libnettle.so.8 /usr/lib/libhogweed.so.6", added "/usr/lib/libnettle.so.9.0 /usr/lib/libhogweed.so.7.0 /usr/lib/libnettle.so.9 /usr/lib/libhogweed.so.7"
packages/x86-64-v3-poky-linux/nettle/nettle: PKGV changed from 3.10.2 [default] to 4.0 [default]
Changes to packages/x86-64-v3-poky-linux/nettle (sysroot):
  /usr/lib/libhogweed.so changed symlink target from libhogweed.so.6.11 to libhogweed.so.7.0
  /usr/lib/libnettle.so changed symlink target from libnettle.so.8.11 to libnettle.so.9.0
  /usr/lib/libhogweed.so.6 moved to /usr/lib/libhogweed.so.7
  /usr/lib/libnettle.so.8 moved to /usr/lib/libnettle.so.9
  /usr/include/nettle/slh-dsa.h was added
  /usr/lib/libhogweed.so.7.0 was added
  /usr/lib/libnettle.so.9.0 was added
  /usr/include/nettle/dsa-compat.h was removed
  /usr/include/nettle/md5-compat.h was removed
  /usr/include/nettle/pgp.h was removed
  /usr/include/nettle/sha.h was removed
  /usr/lib/libhogweed.so.6.11 was removed
  /usr/lib/libnettle.so.8.11 was removed
Changes to packages/x86_64-linux/nettle-native (sysroot):
  /usr/lib/libhogweed.so changed symlink target from libhogweed.so.6.11 to libhogweed.so.7.0
  /usr/lib/libnettle.so changed symlink target from libnettle.so.8.11 to libnettle.so.9.0
  /usr/lib/libhogweed.so.6 moved to /usr/lib/libhogweed.so.7
  /usr/lib/libnettle.so.8 moved to /usr/lib/libnettle.so.9
  /usr/include/nettle/slh-dsa.h was added
  /usr/lib/libhogweed.so.7.0 was added
  /usr/lib/libnettle.so.9.0 was added
  /usr/include/nettle/dsa-compat.h was removed
  /usr/include/nettle/md5-compat.h was removed
  /usr/include/nettle/pgp.h was removed
  /usr/include/nettle/sha.h was removed
  /usr/lib/libhogweed.so.6.11 was removed
  /usr/lib/libnettle.so.8.11 was removed

--===============8843253312649775966==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nettle-upgrade-3.10.2-4.0.patch"

RnJvbSA3ODE5ZjY5ODRmMjQ3ZTFlMDZmNTEzYzYxZDY0ZDlkN2VhM2QyYzdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTY6MDg6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZXR0bGU6IHVwZ3JhZGUgMy4xMC4yIC0+IDQuMAoKLS0tCiAuLi5nZXQtdG8tb25seS1idWlsZC10
ZXN0cy1ub3QtcnVuLXRoZW0ucGF0Y2ggfCAxMCArKy0tCiAuLi5kZXItZmlsZXMtb2Ytb3BlbnNz
bC1vbmx5LWlmLWVuYWJsZV8ucGF0Y2ggfCAgNiArLS0KIC4uLi97bmV0dGxlXzMuMTAuMi5iYiA9
PiBuZXR0bGVfNC4wLmJifSAgICAgICB8IDQ4ICsrKysrKysrKysrKysrKysrLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbmV0dGxlL3tuZXR0bGVfMy4xMC4yLmJiID0+IG5ldHRsZV80LjAuYmJ9
ICg1NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmV0dGxlL25ldHRsZS9B
ZGQtdGFyZ2V0LXRvLW9ubHktYnVpbGQtdGVzdHMtbm90LXJ1bi10aGVtLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbmV0dGxlL25ldHRsZS9BZGQtdGFyZ2V0LXRvLW9ubHktYnVpbGQtdGVz
dHMtbm90LXJ1bi10aGVtLnBhdGNoCmluZGV4IGVlM2U3NGM0M2IuLjdlMWQyNmIxMjUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L25ldHRsZS9uZXR0bGUvQWRkLXRhcmdldC10by1v
bmx5LWJ1aWxkLXRlc3RzLW5vdC1ydW4tdGhlbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZXR0bGUvbmV0dGxlL0FkZC10YXJnZXQtdG8tb25seS1idWlsZC10ZXN0cy1ub3QtcnVu
LXRoZW0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNlYTNlYWY1YmRhMjE1MjlmYzhhOGRh
M2Q4YjA3ZWJjMzg3NWJhN2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDIzMmRhODkx
ZDM0NjhhY2ZlYjgwZWFmNmZhMWZhZDk0NTQyNDJlZDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPgogRGF0ZTogRnJp
LCAyIEF1ZyAyMDI0IDA5OjQ4OjQzIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2VmaWxlLmlu
OiBBZGQgdGFyZ2V0IHRvIG9ubHkgYnVpbGQgdGVzdHMgKG5vdCBydW4gdGhlbSkKQEAgLTIxLDEw
ICsyMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGli
cmUuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQg
YS9NYWtlZmlsZS5pbiBiL01ha2VmaWxlLmluCi1pbmRleCA3MWFkNzYxLi4wZjIzOWY0IDEwMDY0
NAoraW5kZXggOTM5OTk4NS4uNGQ0MDQ2ZSAxMDA2NDQKIC0tLSBhL01ha2VmaWxlLmluCiArKysg
Yi9NYWtlZmlsZS5pbgotQEAgLTUzLDYgKzUzLDkgQEAgY2xlYW4gZGlzdGNsZWFuIG1vc3RseWNs
ZWFuIG1haW50YWluZXItY2xlYW4gdGFnczoKK0BAIC01Niw2ICs1Niw5IEBAIGNsZWFuIGRpc3Rj
bGVhbiBtb3N0bHljbGVhbiBtYWludGFpbmVyLWNsZWFuIHRhZ3M6CiAgCSAgZWNobyAiTWFraW5n
ICRAIGluICQkZCIgOyAoY2QgJCRkICYmICQoTUFLRSkgJEApOyBkb25lCiAgCSQoTUFLRSkgJEAt
aGVyZQogIApAQCAtMzUsMTAgKzM1LDEwIEBAIGluZGV4IDcxYWQ3NjEuLjBmMjM5ZjQgMTAwNjQ0
CiAgCXRydWUKICAKIGRpZmYgLS1naXQgYS90ZXN0c3VpdGUvTWFrZWZpbGUuaW4gYi90ZXN0c3Vp
dGUvTWFrZWZpbGUuaW4KLWluZGV4IDA2OTlmYTAuLjhhYzk5ODMgMTAwNjQ0CitpbmRleCBiMmYw
NTE4Li5jOTNiOWI2IDEwMDY0NAogLS0tIGEvdGVzdHN1aXRlL01ha2VmaWxlLmluCiArKysgYi90
ZXN0c3VpdGUvTWFrZWZpbGUuaW4KLUBAIC0xMzcsNiArMTM3LDggQEAgJChUQVJHRVRTKSAkKEVY
VFJBX1RBUkdFVFMpOiB0ZXN0dXRpbHMuJChPQkpFWFQpIC4uL25vbi1uZXR0bGUuJChPQkpFWFQp
IFwKK0BAIC0xNDQsNiArMTQ0LDggQEAgJChUQVJHRVRTKSAkKEVYVFJBX1RBUkdFVFMpOiB0ZXN0
dXRpbHMuJChPQkpFWFQpIC4uL25vbi1uZXR0bGUuJChPQkpFWFQpIFwKICAjIGRhdGEuCiAgVkFM
R1JJTkQgPSB2YWxncmluZCAtLWVycm9yLWV4aXRjb2RlPTEgLS1sZWFrLWNoZWNrPWZ1bGwgLS1z
aG93LXJlYWNoYWJsZT15ZXMgQElGX0FTTUAgLS1wYXJ0aWFsLWxvYWRzLW9rPXllcwogIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmV0dGxlL25ldHRsZS9jaGVjay1oZWFkZXIt
ZmlsZXMtb2Ytb3BlbnNzbC1vbmx5LWlmLWVuYWJsZV8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZXR0bGUvbmV0dGxlL2NoZWNrLWhlYWRlci1maWxlcy1vZi1vcGVuc3NsLW9ubHktaWYt
ZW5hYmxlXy5wYXRjaAppbmRleCA4OWI1YzdiZWM0Li5mNGM3NzUwNmYzIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9uZXR0bGUvbmV0dGxlL2NoZWNrLWhlYWRlci1maWxlcy1vZi1v
cGVuc3NsLW9ubHktaWYtZW5hYmxlXy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9u
ZXR0bGUvbmV0dGxlL2NoZWNrLWhlYWRlci1maWxlcy1vZi1vcGVuc3NsLW9ubHktaWYtZW5hYmxl
Xy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWMyY2E3ZTUwNWU2YmZlMWZmZjJhN2Q2ZTZi
YjM5YjYwYjkzZTE5YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDA5NzI0YTE4MTEy
OThkMTExODNkNzQzMmUxYTgyYjkyYzk1ZTA4MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEhhaXFpbmcgQmFpIDxIYWlxaW5nLkJhaUB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCA5
IERlYyAyMDE2IDE1OjIzOjE3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIG5ldHRsZTogY2hlY2sg
aGVhZGVyIGZpbGVzIG9mIG9wZW5zc2wgb25seSBpZgpAQCAtMjMsMTAgKzIzLDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+CiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggN2MwMDNiYi4uNzc5ZjdmZiAxMDA2
NDQKK2luZGV4IGFmMDE3ZDguLjkyOTRlMjQgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsr
KyBiL2NvbmZpZ3VyZS5hYwotQEAgLTE5Nyw5ICsxOTcsMTEgQEAgQUNfVFlQRV9TSVpFX1QKK0BA
IC0xNzcsOSArMTc3LDExIEBAIEFDX1RZUEVfU0laRV9UCiAgQUNfQ0hFQ0tfU0laRU9GKGxvbmcp
CiAgQUNfQ0hFQ0tfU0laRU9GKHNpemVfdCkKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L25ldHRsZS9uZXR0bGVfMy4xMC4yLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmV0
dGxlL25ldHRsZV80LjAuYmIKc2ltaWxhcml0eSBpbmRleCA1NyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbmV0dGxlL25ldHRsZV8zLjEwLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L25ldHRsZS9uZXR0bGVfNC4wLmJiCmluZGV4IDdiN2JlNWY1OTQuLjM4NGQ5
NDY4MDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L25ldHRsZS9uZXR0bGVfMy4x
MC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25ldHRsZS9uZXR0bGVfNC4wLmJiCkBA
IC0xLDMgKzEsNDQgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZl
IGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0Lgor
IyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6
ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0
ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVw
ZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HLkxFU1NFUnYzCisj
ICsrKyBDT1BZSU5HLkxFU1NFUnYzCisjIEBAIC0xLDcgKzEsNyBAQAorIyAtCQkgICBHTlUgTEVT
U0VSIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgKyAgICAgICAgICAgICAgICAgICBHTlUgTEVT
U0VSIEdFTkVSQUwgUFVCTElDIExJQ0VOU0UKKyMgICAgICAgICAgICAgICAgICAgICAgICAgVmVy
c2lvbiAzLCAyOSBKdW5lIDIwMDcKKyMgIAorIyAtIENvcHlyaWdodCAoQykgMjAwNyBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24sIEluYy4gPGh0dHA6Ly9mc2Yub3JnLz4KKyMgKyBDb3B5cmlnaHQg
KEMpIDIwMDcgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuIDxodHRwczovL2ZzZi5vcmcv
PgorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJh
dGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0
IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIEBAIC0xMCw3ICsxMCw3IEBACisjICB0aGUgdGVybXMg
YW5kIGNvbmRpdGlvbnMgb2YgdmVyc2lvbiAzIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKKyMg
IExpY2Vuc2UsIHN1cHBsZW1lbnRlZCBieSB0aGUgYWRkaXRpb25hbCBwZXJtaXNzaW9ucyBsaXN0
ZWQgYmVsb3cuCisjICAKKyMgLSAgMC4gQWRkaXRpb25hbCBEZWZpbml0aW9ucy4gCisjICsgIDAu
IEFkZGl0aW9uYWwgRGVmaW5pdGlvbnMuCisjICAKKyMgICAgQXMgdXNlZCBoZXJlaW4sICJ0aGlz
IExpY2Vuc2UiIHJlZmVycyB0byB2ZXJzaW9uIDMgb2YgdGhlIEdOVSBMZXNzZXIKKyMgIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UsIGFuZCB0aGUgIkdOVSBHUEwiIHJlZmVycyB0byB2ZXJzaW9uIDMg
b2YgdGhlIEdOVQorIyBAQCAtMTExLDcgKzExMSw3IEBACisjICAgICAgICAgYSBjb3B5IG9mIHRo
ZSBMaWJyYXJ5IGFscmVhZHkgcHJlc2VudCBvbiB0aGUgdXNlcidzIGNvbXB1dGVyCisjICAgICAg
ICAgc3lzdGVtLCBhbmQgKGIpIHdpbGwgb3BlcmF0ZSBwcm9wZXJseSB3aXRoIGEgbW9kaWZpZWQg
dmVyc2lvbgorIyAgICAgICAgIG9mIHRoZSBMaWJyYXJ5IHRoYXQgaXMgaW50ZXJmYWNlLWNvbXBh
dGlibGUgd2l0aCB0aGUgTGlua2VkCisjIC0gICAgICAgVmVyc2lvbi4gCisjICsgICAgICAgVmVy
c2lvbi4KKyMgIAorIyAgICAgZSkgUHJvdmlkZSBJbnN0YWxsYXRpb24gSW5mb3JtYXRpb24sIGJ1
dCBvbmx5IGlmIHlvdSB3b3VsZCBvdGhlcndpc2UKKyMgICAgIGJlIHJlcXVpcmVkIHRvIHByb3Zp
ZGUgc3VjaCBpbmZvcm1hdGlvbiB1bmRlciBzZWN0aW9uIDYgb2YgdGhlCisjIAorIworCiBTVU1N
QVJZID0gIkEgbG93IGxldmVsIGNyeXB0b2dyYXBoaWMgbGlicmFyeSIKIERFU0NSSVBUSU9OID0g
Ik5ldHRsZSBpcyBhIGNyeXB0b2dyYXBoaWMgbGlicmFyeSB0aGF0IGlzIGRlc2lnbmVkIHRvIGZp
dCBlYXNpbHkgaW4gbW9yZSBvciBsZXNzIGFueSBjb250ZXh0OiBJbiBjcnlwdG8gdG9vbGtpdHMg
Zm9yIG9iamVjdC1vcmllbnRlZCBsYW5ndWFnZXMgKEMrKywgUHl0aG9uLCBQaWtlLCAuLi4pLCBp
biBhcHBsaWNhdGlvbnMgbGlrZSBMU0ggb3IgR05VUEcsIG9yIGV2ZW4gaW4ga2VybmVsIHNwYWNl
LiIKIEhPTUVQQUdFID0gImh0dHA6Ly93d3cubHlzYXRvci5saXUuc2Uvfm5pc3NlL25ldHRsZS8i
CkBAIC03LDEwICs0OCwxMSBAQCBjb250ZXh0LWluZGVwZW5kZW50IHNldCBvZiBjcnlwdG9ncmFw
aGljIGFsZ29yaXRobXMiCiBTRUNUSU9OID0gImxpYnMiCiBMSUNFTlNFID0gIkxHUEwtMy4wLW9y
LWxhdGVyIHwgR1BMLTIuMC1vci1sYXRlciIKIAotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORy5MRVNTRVJ2MzttZDU9NmE2YThlMDIwODM4YjIzNDA2YzgxYjE5YzFkNDZkZjYgXAor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy5MRVNTRVJ2MzttZDU9MzAwMDIwOGQ1
MzllYzA2MWI4OTliY2UxZDljZTk0MDQgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09Q
WUlOR3YyO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9zZXJwZW50LWRlY3J5cHQuYztiZWdpbmxpbmU9MTQ7ZW5kbGluZT0z
NjttZDU9Y2EwZDIyMGJjNDEzZTE4NDJlY2M1MDc2OTBjZTQxNmUgXAotICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vc2VycGVudC1zZXQta2V5LmM7YmVnaW5saW5lPTE0O2VuZGxpbmU9MzY7bWQ1
PWNhMGQyMjBiYzQxM2UxODQyZWNjNTA3NjkwY2U0MTZlIgorICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vc2VycGVudC1zZXQta2V5LmM7YmVnaW5saW5lPTE0O2VuZGxpbmU9MzY7bWQ1PWNhMGQy
MjBiYzQxM2UxODQyZWNjNTA3NjkwY2U0MTZlIFwKKyAgICAgICAgICAgICAgICAgICAgIgogCiBE
RVBFTkRTICs9ICJnbXAiCiAKQEAgLTIwLDcgKzYyLDcgQEAgU1JDX1VSSSA9ICIke0dOVV9NSVJS
T1J9LyR7QlBOfS8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vY2hlY2staGVhZGVy
LWZpbGVzLW9mLW9wZW5zc2wtb25seS1pZi1lbmFibGVfLnBhdGNoIFwKICAgICAgICAgICAgIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmU5ZmY1MWNiMWYyYWJiNWU2NWE2YjhjMTBhOTJkYTBh
YjVhYjZlYWYyNmU3ZmMyYjY3NWM0NWYxZmI1MTliNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIz
YWRkYmMwMGRhMDE4NDZiMjMyZmIzYmM0NTM1MzhlYTU0NjhkYTQzMDMzZjIxYmIzNDVjYjFlOTA3
M2Y1MDk0IgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJuZXR0bGUtKD9QPHB2ZXI+XGQrKFwu
XGQrKSspXC50YXIiCiAKLS0gCjIuNDcuMQoK

--===============8843253312649775966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/nettle/nettle-dev: FILELIST: removed "/usr/include/nettle/sha.h /usr/include/nettle/pgp.h /usr/include/nettle/md5-compat.h /usr/include/nettle/dsa-compat.h", added "/usr/include/nettle/slh-dsa.h"
packages/x86-64-v3-poky-linux/nettle/nettle-ptest: FILELIST: removed "/usr/lib/nettle/ptest/testsuite/meta-armor-test /usr/lib/nettle/ptest/testsuite/md5-compat-test", added "/usr/lib/nettle/ptest/testsuite/sc-slh-dsa-test /usr/lib/nettle/ptest/testsuite/slh-dsa-test"
packages/x86-64-v3-poky-linux/nettle/nettle: FILELIST: removed "/usr/lib/libnettle.so.8 /usr/lib/libhogweed.so.6.11 /usr/lib/libhogweed.so.6 /usr/lib/libnettle.so.8.11", added "/usr/lib/libhogweed.so.7.0 /usr/lib/libnettle.so.9 /usr/lib/libnettle.so.9.0 /usr/lib/libhogweed.so.7"
Changes to packages/x86-64-v3-poky-linux/nettle (sysroot):
  /usr/lib/libhogweed.so changed symlink target from libhogweed.so.6.11 to libhogweed.so.7.0
  /usr/lib/libnettle.so changed symlink target from libnettle.so.8.11 to libnettle.so.9.0
  /usr/lib/libhogweed.so.6 moved to /usr/lib/libhogweed.so.7
  /usr/lib/libnettle.so.8 moved to /usr/lib/libnettle.so.9
  /usr/include/nettle/slh-dsa.h was added
  /usr/lib/libhogweed.so.7.0 was added
  /usr/lib/libnettle.so.9.0 was added
  /usr/include/nettle/dsa-compat.h was removed
  /usr/include/nettle/md5-compat.h was removed
  /usr/include/nettle/pgp.h was removed
  /usr/include/nettle/sha.h was removed
  /usr/lib/libhogweed.so.6.11 was removed
  /usr/lib/libnettle.so.8.11 was removed
Changes to packages/x86_64-linux/nettle-native (sysroot):
  /usr/lib/libhogweed.so changed symlink target from libhogweed.so.6.11 to libhogweed.so.7.0
  /usr/lib/libnettle.so changed symlink target from libnettle.so.8.11 to libnettle.so.9.0
  /usr/lib/libhogweed.so.6 moved to /usr/lib/libhogweed.so.7
  /usr/lib/libnettle.so.8 moved to /usr/lib/libnettle.so.9
  /usr/include/nettle/slh-dsa.h was added
  /usr/lib/libhogweed.so.7.0 was added
  /usr/lib/libnettle.so.9.0 was added
  /usr/include/nettle/dsa-compat.h was removed
  /usr/include/nettle/md5-compat.h was removed
  /usr/include/nettle/pgp.h was removed
  /usr/include/nettle/sha.h was removed
  /usr/lib/libhogweed.so.6.11 was removed
  /usr/lib/libnettle.so.8.11 was removed

--===============8843253312649775966==--

