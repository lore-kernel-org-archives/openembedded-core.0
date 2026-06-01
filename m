Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2BBCD6E67
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1570.1780328136613517798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Txz1LBjj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=t7Yg1FBP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d3d2fa-c2ff0111-69d1-4aad-8a57-90556edcaa65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hSHnm3dPaEbx5Q6ttgrNO31V08EOVMMT5gJC8mw6BWQ=;
	b=Txz1LBjjLX6U4hTAu08c1EITEj8X2wpfRcTt4Y/RiDYs8CagC3a67ExttNyiFwCB
	kuOSQsdS3oP1HTcnnJ/7nQJoNsR+u7VETKn/G4aNYNO5mZ14vzUQklU3lhUPhqDGG3L
	8hpswo3xsIIuqfKovN+abFJNVRoh9TY0DgcbttNk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328158;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hSHnm3dPaEbx5Q6ttgrNO31V08EOVMMT5gJC8mw6BWQ=;
	b=t7Yg1FBPY2YoW30CRbXi+f25zbfmuMDWyFgjzyi82ee5M5yh3pY4QAm/o8JKkEgk
	AAqHsiqkBXCC5joF56e4w+Pe+Oyc3Y6Q0AAmmcLIDyL4GDkm0vSTMnqLs7DRqtOVlwA
	J2F3HsCF23/Kimv3sCF5s6yQqsksFcRYM0J6H56w=
Content-Type: multipart/mixed; boundary="===============7682813197581868305=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] nettle: upgrading to 4.0 SUCCEEDED
Message-ID: <0101019e83d3d2fa-c2ff0111-69d1-4aad-8a57-90556edcaa65-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237966

--===============7682813197581868305==
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
From 7abf2d316c10520834972a7977f037810bf81277 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 15:13:10 +0000
Subject: [PATCH] nettle: upgrade 3.10.2 -> 4.0

---
 ...get-to-only-build-tests-not-run-them.patch | 10 ++--
 ...der-files-of-openssl-only-if-enable_.patch |  6 +--
 .../{nettle_3.10.2.bb => nettle_4.0.bb}       | 48 +++++++++++++++++--
 3 files changed, 53 insertions(+), 11 deletions(-)
 rename meta/recipes-support/nettle/{nettle_3.10.2.bb => nettle_4.0.bb} (57%)

diff --git a/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
index ee3e74c43b..ce6eb06530 100644
--- a/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
+++ b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
@@ -1,4 +1,4 @@
-From 3ea3eaf5bda21529fc8a8da3d8b07ebc3875ba7e Mon Sep 17 00:00:00 2001
+From 41efa69ebce70f4171a63da6dc407df849f74c14 Mon Sep 17 00:00:00 2001
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
index 89b5c7bec4..8eb0eac1c9 100644
--- a/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
+++ b/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
@@ -1,4 +1,4 @@
-From ec2ca7e505e6bfe1fff2a7d6e6bb39b60b93e19a Mon Sep 17 00:00:00 2001
+From 2da05e71f04cd344682149d0284fadccfb222ebc Mon Sep 17 00:00:00 2001
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


--===============7682813197581868305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/nettle/nettle-dev: FILELIST: removed "/usr/include/nettle/dsa-compat.h /usr/include/nettle/sha.h /usr/include/nettle/md5-compat.h /usr/include/nettle/pgp.h", added "/usr/include/nettle/slh-dsa.h"
packages/x86-64-v3-poky-linux/nettle/nettle-ptest: FILELIST: removed "/usr/lib/nettle/ptest/testsuite/md5-compat-test /usr/lib/nettle/ptest/testsuite/meta-armor-test", added "/usr/lib/nettle/ptest/testsuite/sc-slh-dsa-test /usr/lib/nettle/ptest/testsuite/slh-dsa-test"
packages/x86-64-v3-poky-linux/nettle/nettle: FILELIST: removed "/usr/lib/libhogweed.so.6 /usr/lib/libnettle.so.8 /usr/lib/libnettle.so.8.11 /usr/lib/libhogweed.so.6.11", added "/usr/lib/libhogweed.so.7 /usr/lib/libnettle.so.9 /usr/lib/libhogweed.so.7.0 /usr/lib/libnettle.so.9.0"
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

--===============7682813197581868305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 11330424 to 11130992 (-2%)
packages/x86-64-v3-poky-linux/nettle: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/nettle/nettle-3.10.2.tar.gz file://Add-target-to-only-build-tests-not-run-them.patch file://run-ptest file://check-header-files-of-openssl-only-if-enable_.patch" to "https://ftpmirror.gnu.org/gnu/nettle/nettle-4.0.tar.gz file://Add-target-to-only-build-tests-not-run-them.patch file://run-ptest file://check-header-files-of-openssl-only-if-enable_.patch"
packages/x86-64-v3-poky-linux/nettle: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-bin: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-bin: PKGSIZE changed from 92688 to 96784 (+4%)
packages/x86-64-v3-poky-linux/nettle/nettle-bin: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-dbg: FILELIST: removed "/usr/lib/nettle/ptest/testsuite/.debug/md5-compat-test /usr/lib/nettle/ptest/testsuite/.debug/meta-armor-test /usr/lib/.debug/libnettle.so.8.11 /usr/lib/.debug/libhogweed.so.6.11", added "/usr/lib/.debug/libhogweed.so.7.0 /usr/lib/.debug/libnettle.so.9.0 /usr/lib/nettle/ptest/testsuite/.debug/slh-dsa-test"
packages/x86-64-v3-poky-linux/nettle/nettle-dbg: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-dbg: PKGSIZE changed from 39597888 to 38511032 (-3%)
packages/x86-64-v3-poky-linux/nettle/nettle-dbg: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-dev: FILELIST: removed "/usr/include/nettle/pgp.h /usr/include/nettle/md5-compat.h /usr/include/nettle/sha.h /usr/include/nettle/dsa-compat.h", added "/usr/include/nettle/slh-dsa.h"
packages/x86-64-v3-poky-linux/nettle/nettle-dev: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-dev: PKGSIZE changed from 278815 to 260640 (-7%)
packages/x86-64-v3-poky-linux/nettle/nettle-dev: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-doc: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-doc: PKGSIZE changed from 361472 to 351478 (-3%)
packages/x86-64-v3-poky-linux/nettle/nettle-doc: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-locale: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-locale: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-ptest: FILELIST: removed "/usr/lib/nettle/ptest/testsuite/meta-armor-test /usr/lib/nettle/ptest/testsuite/md5-compat-test", added "/usr/lib/nettle/ptest/testsuite/sc-slh-dsa-test /usr/lib/nettle/ptest/testsuite/slh-dsa-test"
packages/x86-64-v3-poky-linux/nettle/nettle-ptest: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-ptest: PKGSIZE changed from 10830755 to 10742637 (-1%)
packages/x86-64-v3-poky-linux/nettle/nettle-ptest: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-src: FILELIST: directory renamed /usr/src/debug/nettle/3.10.2/tools -> /usr/src/debug/nettle/4.0/tools, directory renamed /usr/src/debug/nettle/3.10.2/examples -> /usr/src/debug/nettle/4.0/examples, removed "/usr/src/debug/nettle/3.10.2/ecc-gostdsa-verify.c /usr/src/debug/nettle/3.10.2/testsuite/ripemd160-test.c /usr/src/debug/nettle/3.10.2/testsuite/ed448-test.c /usr/src/debug/nettle/3.10.2/oaep.c /usr/src/debug/nettle/3.10.2/camellia128-meta.c /usr/src/debug/nettle/3.10.2/camellia192-meta.c /usr/src/debug/nettle/3.10.2/camellia256-meta.c /usr/src/debug/nettle/3.10.2/cmac-aes128.c /usr/src/debug/nettle/3.10.2/cmac-aes256.c /usr/src/debug/nettle/3.10.2/ed448-shake256-verify.c /usr/src/debug/nettle/3.10.2/hmac-sha224.c /usr/src/debug/nettle/3.10.2/hmac-sha256.c /usr/src/debug/nettle/3.10.2/hmac-sha384.c /usr/src/debug/nettle/3.10.2/hmac-sha512.c /usr/src/debug/nettle/3.10.2/oaep.h /usr/src/debug/nettle/3.10.2/sexp.h /usr/src/debug/nettle/3.1
 0.2/testsuite/md5-compat-test.c /usr/src/debug/nettle/3.10.2/testsuite/sha512-256-test.c /usr/src/debug/nettle/3.10.2/balloon-sha512.c /usr/src/debug/nettle/3.10.2/testsuite/curve25519-dh-test.c /usr/src/debug/nettle/3.10.2/cmac-des3.c /usr/src/debug/nettle/3.10.2/camellia-crypt-internal.s /usr/src/debug/nettle/3.10.2/ecdsa-verify.c /usr/src/debug/nettle/3.10.2/eddsa-pubkey.c /usr/src/debug/nettle/3.10.2/eddsa-verify.c /usr/src/debug/nettle/3.10.2/sec-sub-1.c /usr/src/debug/nettle/3.10.2/ecc-mod-arith.c /usr/src/debug/nettle/3.10.2/rsa-pss-sha256-sign-tr.c /usr/src/debug/nettle/3.10.2/dsa-gen-params.c /usr/src/debug/nettle/3.10.2/buffer.h /usr/src/debug/nettle/3.10.2/rsa-decrypt-tr.c /usr/src/debug/nettle/3.10.2/siv-ghash-update.c /usr/src/debug/nettle/3.10.2/buffer.c /usr/src/debug/nettle/3.10.2/sexp-transport.c /usr/src/debug/nettle/3.10.2/aes-internal.h /usr/src/debug/nettle/3.10.2/ctr-internal.h /usr/src/debug/nettle/3.10.2/dsa-internal.h /usr/src/debug/nettle/3.10.2/ecc-interna
 l.h /usr/src/debug/nettle/3.10.2/gcm-internal.h /usr/src/debug/nettle/3.10.2/ecc-curve25519.h /usr/src/debug/nettle/3.10.2/rsa-internal.h /usr/src/debug/nettle/3.10.2/ecc-curve25519.c /usr/src/debug/nettle/3.10.2/testsuite/md2-test.c /usr/src/debug/nettle/3.10.2/sexp.c /usr/src/debug/nettle/3.10.2/serpent-internal.h /usr/src/debug/nettle/3.10.2/ecc-secp192r1.h /usr/src/debug/nettle/3.10.2/ecc-secp224r1.h /usr/src/debug/nettle/3.10.2/ecc-secp256r1.h /usr/src/debug/nettle/3.10.2/ecc-secp384r1.h /usr/src/debug/nettle/3.10.2/ecc-secp521r1.h /usr/src/debug/nettle/3.10.2/ecc-secp192r1.c /usr/src/debug/nettle/3.10.2/ecc-secp224r1.c /usr/src/debug/nettle/3.10.2/ecc-secp256r1.c /usr/src/debug/nettle/3.10.2/ecc-secp384r1.c /usr/src/debug/nettle/3.10.2/ecc-secp521r1.c /usr/src/debug/nettle/3.10.2/rsa-pkcs1-sign.c /usr/src/debug/nettle/3.10.2/chacha-set-key.c /usr/src/debug/nettle/3.10.2/aes128-encrypt-2.s /usr/src/debug/nettle/3.10.2/aes128-decrypt-2.s /usr/src/debug/nettle/3.10.2/umac-nh-n.s 
 /usr/src/debug/nettle/3.10.2/chacha-poly1305-meta.c /usr/src/debug/nettle/3.10.2/getopt.c /usr/src/debug/nettle/3.10.2/getopt.h /usr/src/debug/nettle/3.10.2/rsa-oaep-decrypt.c /usr/src/debug/nettle/3.10.2/rsa-oaep-encrypt.c /usr/src/debug/nettle/3.10.2/sha3-224-meta.c /usr/src/debug/nettle/3.10.2/sha3-256-meta.c /usr/src/debug/nettle/3.10.2/sha3-384-meta.c /usr/src/debug/nettle/3.10.2/sha3-512-meta.c /usr/src/debug/nettle/3.10.2/salsa20-128-set-key.c /usr/src/debug/nettle/3.10.2/salsa20-256-set-key.c /usr/src/debug/nettle/3.10.2/testsuite/aes-keywrap-test.c /usr/src/debug/nettle/3.10.2/getopt1.c /usr/src/debug/nettle/3.10.2/streebog.c /usr/src/debug/nettle/3.10.2/camellia128-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/camellia128-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/camellia256-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/camellia256-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/poly1305-aes.c /usr/src/debug/nettle/3.10.2/streebog.h /usr/src/debug/nettle/3.10.2/tests
 uite/gostdsa-sign-test.c /usr/src/debug/nettle/3.10.2/hkdf.h /usr/src/debug/nettle/3.10.2/hkdf.c /usr/src/debug/nettle/3.10.2/testsuite/ed25519-test.c /usr/src/debug/nettle/3.10.2/pkcs1-rsa-digest.c /usr/src/debug/nettle/3.10.2/testsuite/pkcs1-sec-decrypt-test.c /usr/src/debug/nettle/3.10.2/ecc-ecdsa-verify.c /usr/src/debug/nettle/3.10.2/twofish-meta.c /usr/src/debug/nettle/3.10.2/testsuite/sha1-huge-test.c /usr/src/debug/nettle/3.10.2/ocb.h /usr/src/debug/nettle/3.10.2/pgp.h /usr/src/debug/nettle/3.10.2/arctwo.c /usr/src/debug/nettle/3.10.2/pss.h /usr/src/debug/nettle/3.10.2/rsa.h /usr/src/debug/nettle/3.10.2/arctwo.h /usr/src/debug/nettle/3.10.2/rsa-md5-verify.c /usr/src/debug/nettle/3.10.2/curve448-eh-to-x.c /usr/src/debug/nettle/3.10.2/der-iterator.c /usr/src/debug/nettle/3.10.2/testsuite/streebog-test.c /usr/src/debug/nettle/3.10.2/testsuite/serpent-test.c /usr/src/debug/nettle/3.10.2/testsuite/version-test.c /usr/src/debug/nettle/3.10.2/poly1305-blocks.s /usr/src/debug/nettle/
 3.10.2/gost28147.c /usr/src/debug/nettle/3.10.2/curve25519-eh-to-x.c /usr/src/debug/nettle/3.10.2/testsuite/rsa-pss-sign-tr-test.c /usr/src/debug/nettle/3.10.2/ctr16.c /usr/src/debug/nettle/3.10.2/base64.h /usr/src/debug/nettle/3.10.2/nettle-meta-armors.c /usr/src/debug/nettle/3.10.2/testsuite/meta-mac-test.c /usr/src/debug/nettle/3.10.2/ecdsa-sign.c /usr/src/debug/nettle/3.10.2/eddsa-hash.c /usr/src/debug/nettle/3.10.2/eddsa-sign.c /usr/src/debug/nettle/3.10.2/sha2.h /usr/src/debug/nettle/3.10.2/memxor.h /usr/src/debug/nettle/3.10.2/testsuite/rsa-sec-decrypt-test.c /usr/src/debug/nettle/3.10.2/sha3-384.c /usr/src/debug/nettle/3.10.2/getopt_int.h /usr/src/debug/nettle/3.10.2/memxor.s /usr/src/debug/nettle/3.10.2/aes128-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/curve25519-mul-g.c /usr/src/debug/nettle/3.10.2/hmac-streebog.c /usr/src/debug/nettle/3.10.2/salsa20-2core.s /usr/src/debug/nettle/3.10.2/aes-decrypt.c /usr/src/debug/nettle/3.10.2/rsa-decrypt.c /usr/src/debug/nettle/3.10
 .2/testsuite/xts-test.c /usr/src/debug/nettle/3.10.2/shake256.c /usr/src/debug/nettle/3.10.2/testsuite/balloon-test.c /usr/src/debug/nettle/3.10.2/testsuite/salsa20-test.c /usr/src/debug/nettle/3.10.2/aes192-decrypt-2.s /usr/src/debug/nettle/3.10.2/aes192-encrypt-2.s /usr/src/debug/nettle/3.10.2/curve25519.h /usr/src/debug/nettle/3.10.2/testsuite/gostdsa-vko-test.c /usr/src/debug/nettle/3.10.2/hmac-streebog-meta.c /usr/src/debug/nettle/3.10.2/sha3-512.c /usr/src/debug/nettle/3.10.2/ecc-gost-gc256b.h /usr/src/debug/nettle/3.10.2/ecc-gost-gc256b.c /usr/src/debug/nettle/3.10.2/testsuite/dlopen-test.c /usr/src/debug/nettle/3.10.2/ecc-j-to-a.c /usr/src/debug/nettle/3.10.2/ecc-random.c /usr/src/debug/nettle/3.10.2/testsuite/sha3-permute-test.c /usr/src/debug/nettle/3.10.2/pss-mgf1.c /usr/src/debug/nettle/3.10.2/testsuite/ecdsa-sign-test.c /usr/src/debug/nettle/3.10.2/pss-mgf1.h /usr/src/debug/nettle/3.10.2/testsuite/blowfish-test.c /usr/src/debug/nettle/3.10.2/ecc-nonsec-add-jjj.c /usr/sr
 c/debug/nettle/3.10.2/nettle-meta-macs.c /usr/src/debug/nettle/3.10.2/sha256-compress-n.s /usr/src/debug/nettle/3.10.2/cbc-aes128-encrypt.c /usr/src/debug/nettle/3.10.2/cbc-aes192-encrypt.c /usr/src/debug/nettle/3.10.2/cbc-aes256-encrypt.c /usr/src/debug/nettle/3.10.2/testsuite/bcrypt-test.c /usr/src/debug/nettle/3.10.2/ecc-curve448.h /usr/src/debug/nettle/3.10.2/rsa-pkcs1-verify.c /usr/src/debug/nettle/3.10.2/rsa-pss-sha512-verify.c /usr/src/debug/nettle/3.10.2/ecc-curve448.c /usr/src/debug/nettle/3.10.2/rsa-sec-compute-root.c /usr/src/debug/nettle/3.10.2/testsuite/sm3-test.c /usr/src/debug/nettle/3.10.2/gmp-glue.h /usr/src/debug/nettle/3.10.2/gmp-glue.c /usr/src/debug/nettle/3.10.2/siv-cmac.h /usr/src/debug/nettle/3.10.2/poly1305.h /usr/src/debug/nettle/3.10.2/testsuite/rsa-encrypt-test.c /usr/src/debug/nettle/3.10.2/umac-l2.c /usr/src/debug/nettle/3.10.2/poly1305-update.c /usr/src/debug/nettle/3.10.2/siv-cmac.c /usr/src/debug/nettle/3.10.2/testsuite/hkdf-test.c /usr/src/debug/net
 tle/3.10.2/testsuite/arctwo-test.c /usr/src/debug/nettle/3.10.2/ripemd160.h /usr/src/debug/nettle/3.10.2/testsuite/x86-ibt-test.c /usr/src/debug/nettle/3.10.2/ripemd160.c /usr/src/debug/nettle/3.10.2/pkcs1-sec-decrypt.c /usr/src/debug/nettle/3.10.2/rsa-sha1-sign-tr.c /usr/src/debug/nettle/3.10.2/salsa20r12-crypt.c /usr/src/debug/nettle/3.10.2/bignum-random.c /usr/src/debug/nettle/3.10.2/balloon-sha1.c /usr/src/debug/nettle/3.10.2/dsa-sha256-verify.c /usr/src/debug/nettle/3.10.2/rsa-sha256-verify.c /usr/src/debug/nettle/3.10.2/rsa-sha512-verify.c /usr/src/debug/nettle/3.10.2/drbg-ctr-aes256.c /usr/src/debug/nettle/3.10.2/cpuid.s /usr/src/debug/nettle/3.10.2/ed448-shake256.c /usr/src/debug/nettle/3.10.2/base64url-meta.c /usr/src/debug/nettle/3.10.2/aes256-decrypt-2.s /usr/src/debug/nettle/3.10.2/aes256-encrypt-2.s /usr/src/debug/nettle/3.10.2/testsuite/md4-test.c /usr/src/debug/nettle/3.10.2/testsuite/cxx-test.cxx /usr/src/debug/nettle/3.10.2/hmac-md5.c /usr/src/debug/nettle/3.10.2/ed
 25519-sha512-verify.c /usr/src/debug/nettle/3.10.2/aes-encrypt.c /usr/src/debug/nettle/3.10.2/ecc-mod-inv.c /usr/src/debug/nettle/3.10.2/ecc-eh-to-a.c /usr/src/debug/nettle/3.10.2/rsa-encrypt.c /usr/src/debug/nettle/3.10.2/curve448-mul-g.c /usr/src/debug/nettle/3.10.2/blowfish.c /usr/src/debug/nettle/3.10.2/blowfish.h /usr/src/debug/nettle/3.10.2/sha1-compress-2.s /usr/src/debug/nettle/3.10.2/testsuite/cnd-memcpy-test.c /usr/src/debug/nettle/3.10.2/siv-gcm-aes128.c /usr/src/debug/nettle/3.10.2/salsa20-set-nonce.c /usr/src/debug/nettle/3.10.2/testsuite/ccm-test.c /usr/src/debug/nettle/3.10.2/testsuite/gcm-test.c /usr/src/debug/nettle/3.10.2/ccm-aes128.c /usr/src/debug/nettle/3.10.2/ccm-aes192.c /usr/src/debug/nettle/3.10.2/ccm-aes256.c /usr/src/debug/nettle/3.10.2/eax-aes128.c /usr/src/debug/nettle/3.10.2/base16-decode.c /usr/src/debug/nettle/3.10.2/base16-encode.c /usr/src/debug/nettle/3.10.2/gostdsa-sign.c /usr/src/debug/nettle/3.10.2/ecc-a-to-j.c /usr/src/debug/nettle/3.10.2/ecc-a
 dd-eh.c /usr/src/debug/nettle/3.10.2/ecc-add-th.c /usr/src/debug/nettle/3.10.2/testsuite/dsa-test.c /usr/src/debug/nettle/3.10.2/testsuite/rsa-test.c /usr/src/debug/nettle/3.10.2/fat-setup.h /usr/src/debug/nettle/3.10.2/salsa20-internal.h /usr/src/debug/nettle/3.10.2/testsuite/siv-gcm-test.c /usr/src/debug/nettle/3.10.2/aes256-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/nettle-meta-ciphers.c /usr/src/debug/nettle/3.10.2/rsa-pss-sha256-verify.c /usr/src/debug/nettle/3.10.2/testsuite/sha1-test.c /usr/src/debug/nettle/3.10.2/testsuite/cbc-test.c /usr/src/debug/nettle/3.10.2/memxor3.s /usr/src/debug/nettle/3.10.2/aes256-decrypt.c /usr/src/debug/nettle/3.10.2/aes256-encrypt.c /usr/src/debug/nettle/3.10.2/pkcs1-rsa-sha512.c /usr/src/debug/nettle/3.10.2/ecc-pm1-redc.c /usr/src/debug/nettle/3.10.2/ecc-pp1-redc.c /usr/src/debug/nettle/3.10.2/dsa-sha256-sign.c /usr/src/debug/nettle/3.10.2/rsa-sha256-sign.c /usr/src/debug/nettle/3.10.2/rsa-sha512-sign.c /usr/src/debug/nettle/3.10.2/testsuit
 e/pss-mgf1-test.c /usr/src/debug/nettle/3.10.2/twofish.h /usr/src/debug/nettle/3.10.2/twofish.c /usr/src/debug/nettle/3.10.2/cmac.c /usr/src/debug/nettle/3.10.2/hmac.c /usr/src/debug/nettle/3.10.2/cmac.h /usr/src/debug/nettle/3.10.2/hmac.h /usr/src/debug/nettle/3.10.2/umac.h /usr/src/debug/nettle/3.10.2/hogweed-internal.h /usr/src/debug/nettle/3.10.2/blowfish-bcrypt.c /usr/src/debug/nettle/3.10.2/testsuite/aes-test.c /usr/src/debug/nettle/3.10.2/testsuite/des-test.c /usr/src/debug/nettle/3.10.2/sha512.c /usr/src/debug/nettle/3.10.2/testsuite/pbkdf2-test.c /usr/src/debug/nettle/3.10.2/testsuite/ecdh-test.c /usr/src/debug/nettle/3.10.2/ghash-set-key-2.s /usr/src/debug/nettle/3.10.2/testsuite/poly1305-test.c /usr/src/debug/nettle/3.10.2/testsuite/ecdsa-keygen-test.c /usr/src/debug/nettle/3.10.2/serpent-decrypt.s /usr/src/debug/nettle/3.10.2/serpent-encrypt.s /usr/src/debug/nettle/3.10.2/testsuite/siv-cmac-test.c /usr/src/debug/nettle/3.10.2/ecc-secp192r1-modp.s /usr/src/debug/nettle/3.
 10.2/ecc-secp224r1-modp.s /usr/src/debug/nettle/3.10.2/ecc-secp256r1-redc.s /usr/src/debug/nettle/3.10.2/ecc-secp384r1-modp.s /usr/src/debug/nettle/3.10.2/ecc-secp521r1-modp.s /usr/src/debug/nettle/3.10.2/chacha-set-nonce.c /usr/src/debug/nettle/3.10.2/aes-decrypt-table.c /usr/src/debug/nettle/3.10.2/ripemd160-meta.c /usr/src/debug/nettle/3.10.2/chacha-crypt.c /usr/src/debug/nettle/3.10.2/ripemd160-internal.h /usr/src/debug/nettle/3.10.2/sha1-compress.s /usr/src/debug/nettle/3.10.2/ecc-gost-gc512a.h /usr/src/debug/nettle/3.10.2/ecdsa-keygen.c /usr/src/debug/nettle/3.10.2/siv-gcm.c /usr/src/debug/nettle/3.10.2/siv-gcm.h /usr/src/debug/nettle/3.10.2/ecc-gost-gc512a.c /usr/src/debug/nettle/3.10.2/testsuite/knuth-lfib-test.c /usr/src/debug/nettle/3.10.2/camellia.h /usr/src/debug/nettle/3.10.2/hmac-sm3-meta.c /usr/src/debug/nettle/3.10.2/hmac-md5-meta.c /usr/src/debug/nettle/3.10.2/salsa20.h /usr/src/debug/nettle/3.10.2/testsuite/camellia-test.c /usr/src/debug/nettle/3.10.2/testsuite/rsa
 -oaep-encrypt-test.c /usr/src/debug/nettle/3.10.2/testsuite/ocb-test.c /usr/src/debug/nettle/3.10.2/dsa-sha1-sign.c /usr/src/debug/nettle/3.10.2/rsa-sha1-sign.c /usr/src/debug/nettle/3.10.2/pkcs1.c /usr/src/debug/nettle/3.10.2/rsa-sha1-verify.c /usr/src/debug/nettle/3.10.2/ecc-dup-eh.c /usr/src/debug/nettle/3.10.2/dsa-sha1-verify.c /usr/src/debug/nettle/3.10.2/ecc-dup-jj.c /usr/src/debug/nettle/3.10.2/ecc-dup-th.c /usr/src/debug/nettle/3.10.2/base64-decode.c /usr/src/debug/nettle/3.10.2/base64-encode.c /usr/src/debug/nettle/3.10.2/ripemd160-compress.c /usr/src/debug/nettle/3.10.2/gcm-camellia128-meta.c /usr/src/debug/nettle/3.10.2/pkcs1.h /usr/src/debug/nettle/3.10.2/der2dsa.c /usr/src/debug/nettle/3.10.2/sexp2rsa.c /usr/src/debug/nettle/3.10.2/testsuite/base16-test.c /usr/src/debug/nettle/3.10.2/testsuite/base64-test.c /usr/src/debug/nettle/3.10.2/cast128.h /usr/src/debug/nettle/3.10.2/gost28147-internal.h /usr/src/debug/nettle/3.10.2/cast128.c /usr/src/debug/nettle/3.10.2/chacha-i
 nternal.h /usr/src/debug/nettle/3.10.2/sha3-internal.h /usr/src/debug/nettle/3.10.2/hmac-sha512-meta.c /usr/src/debug/nettle/3.10.2/bswap-internal.h /usr/src/debug/nettle/3.10.2/cmac-aes128-meta.c /usr/src/debug/nettle/3.10.2/cmac-aes256-meta.c /usr/src/debug/nettle/3.10.2/camellia-internal.h /usr/src/debug/nettle/3.10.2/hmac-sha224-meta.c /usr/src/debug/nettle/3.10.2/hmac-sha256-meta.c /usr/src/debug/nettle/3.10.2/hmac-sha384-meta.c /usr/src/debug/nettle/3.10.2/rsa-md5-sign-tr.c /usr/src/debug/nettle/3.10.2/cast128_sboxes.h /usr/src/debug/nettle/3.10.2/streebog-meta.c /usr/src/debug/nettle/3.10.2/arctwo-meta.c /usr/src/debug/nettle/3.10.2/eddsa-compress.c /usr/src/debug/nettle/3.10.2/memeql-sec.c /usr/src/debug/nettle/3.10.2/dsa-sign.c /usr/src/debug/nettle/3.10.2/rsa-sign.c /usr/src/debug/nettle/3.10.2/balloon-sha256.c /usr/src/debug/nettle/3.10.2/yarrow.h /usr/src/debug/nettle/3.10.2/testsuite/sha512-224-test.c /usr/src/debug/nettle/3.10.2/ecc-curve448-modp.s /usr/src/debug/nettl
 e/3.10.2/ecc-gostdsa-sign.c /usr/src/debug/nettle/3.10.2/block-internal.h /usr/src/debug/nettle/3.10.2/cmac64.c /usr/src/debug/nettle/3.10.2/aes-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/aes-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/umac64.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-add-test.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-dup-test.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-mod-test.c /usr/src/debug/nettle/3.10.2/sec-add-1.c /usr/src/debug/nettle/3.10.2/macros.h /usr/src/debug/nettle/3.10.2/sha256.c /usr/src/debug/nettle/3.10.2/memops.h /usr/src/debug/nettle/3.10.2/rsa2openpgp.c /usr/src/debug/nettle/3.10.2/base16-meta.c /usr/src/debug/nettle/3.10.2/ecc-mod.c /usr/src/debug/nettle/3.10.2/testsuite/des3-test.c /usr/src/debug/nettle/3.10.2/testsuite/testutils.c /usr/src/debug/nettle/3.10.2/der2rsa.c /usr/src/debug/nettle/3.10.2/curve448-mul.c /usr/src/debug/nettle/3.10.2/testsuite/testutils.h /usr/src/debug/nettle/3.10.2/aes-encrypt-table.c /usr/src/debug/net
 tle/3.10.2/ghash-update-2.s /usr/src/debug/nettle/3.10.2/sm3.h /usr/src/debug/nettle/3.10.2/sm4.h /usr/src/debug/nettle/3.10.2/rsa-sign-tr.c /usr/src/debug/nettle/3.10.2/xts.h /usr/src/debug/nettle/3.10.2/aes.h /usr/src/debug/nettle/3.10.2/hmac-gosthash94-meta.c /usr/src/debug/nettle/3.10.2/cbc.h /usr/src/debug/nettle/3.10.2/ccm.h /usr/src/debug/nettle/3.10.2/testsuite/gostdsa-keygen-test.c /usr/src/debug/nettle/3.10.2/cfb.h /usr/src/debug/nettle/3.10.2/testsuite/ctr-test.c /usr/src/debug/nettle/3.10.2/base64url-decode.c /usr/src/debug/nettle/3.10.2/cbc.c /usr/src/debug/nettle/3.10.2/ccm.c /usr/src/debug/nettle/3.10.2/cfb.c /usr/src/debug/nettle/3.10.2/ctr.c /usr/src/debug/nettle/3.10.2/camellia-absorb.c /usr/src/debug/nettle/3.10.2/des.c /usr/src/debug/nettle/3.10.2/dsa.c /usr/src/debug/nettle/3.10.2/eax.c /usr/src/debug/nettle/3.10.2/gcm.c /usr/src/debug/nettle/3.10.2/rsa-sec-decrypt.c /usr/src/debug/nettle/3.10.2/testsuite/cast128-test.c /usr/src/debug/nettle/3.10.2/dsa-hash.c /u
 sr/src/debug/nettle/3.10.2/testsuite/memeql-test.c /usr/src/debug/nettle/3.10.2/testsuite/memxor-test.c /usr/src/debug/nettle/3.10.2/umac-poly128.c /usr/src/debug/nettle/3.10.2/md2-meta.c /usr/src/debug/nettle/3.10.2/md4-meta.c /usr/src/debug/nettle/3.10.2/gcm-camellia256.c /usr/src/debug/nettle/3.10.2/md5-meta.c /usr/src/debug/nettle/3.10.2/sm3-meta.c /usr/src/debug/nettle/3.10.2/sm4-meta.c /usr/src/debug/nettle/3.10.2/ecc-mul-m.c /usr/src/debug/nettle/3.10.2/hmac-sha1.c /usr/src/debug/nettle/3.10.2/base16.h /usr/src/debug/nettle/3.10.2/gcm-sm4.c /usr/src/debug/nettle/3.10.2/testsuite/cfb-test.c /usr/src/debug/nettle/3.10.2/dsa-compat.c /usr/src/debug/nettle/3.10.2/dsa-keygen.c /usr/src/debug/nettle/3.10.2/ecc-scalar.c /usr/src/debug/nettle/3.10.2/md5-compat.c /usr/src/debug/nettle/3.10.2/rsa-keygen.c /usr/src/debug/nettle/3.10.2/sexp-transport-format.c /usr/src/debug/nettle/3.10.2/dsa-compat.h /usr/src/debug/nettle/3.10.2/md5-compat.h /usr/src/debug/nettle/3.10.2/testsuite/pss-tes
 t.c /usr/src/debug/nettle/3.10.2/rotors.h /usr/src/debug/nettle/3.10.2/testsuite/yarrow-test.c /usr/src/debug/nettle/3.10.2/aes256-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/salsa20-set-key.c /usr/src/debug/nettle/3.10.2/arcfour.c /usr/src/debug/nettle/3.10.2/pbkdf2-hmac-sha1.c /usr/src/debug/nettle/3.10.2/aes128-meta.c /usr/src/debug/nettle/3.10.2/sha256-compress-n-2.s /usr/src/debug/nettle/3.10.2/arcfour.h /usr/src/debug/nettle/3.10.2/chacha-poly1305.c /usr/src/debug/nettle/3.10.2/bignum-random-prime.c /usr/src/debug/nettle/3.10.2/ecc-mul-a-eh.c /usr/src/debug/nettle/3.10.2/chacha-poly1305.h /usr/src/debug/nettle/3.10.2/ecc-mul-g-eh.c /usr/src/debug/nettle/3.10.2/nettle-meta-aeads.c /usr/src/debug/nettle/3.10.2/gostdsa-vko.c /usr/src/debug/nettle/3.10.2/umac-nh.s /usr/src/debug/nettle/3.10.2/testsuite/arcfour-test.c /usr/src/debug/nettle/3.10.2/nettle-meta.h /usr/src/debug/nettle/3.10.2/umac-poly64.c /usr/src/debug/nettle/3.10.2/ghash-internal.h /usr/src/debug/nettle/3.10.2/rs
 a-md5-sign.c /usr/src/debug/nettle/3.10.2/pkcs1-decrypt.c /usr/src/debug/nettle/3.10.2/pkcs1-encrypt.c /usr/src/debug/nettle/3.10.2/salsa20-crypt.c /usr/src/debug/nettle/3.10.2/aes128-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/testsuite/rsa2sexp-test.c /usr/src/debug/nettle/3.10.2/aes-encrypt-internal.s /usr/src/debug/nettle/3.10.2/testsuite/cmac-test.c /usr/src/debug/nettle/3.10.2/testsuite/hmac-test.c /usr/src/debug/nettle/3.10.2/testsuite/umac-test.c /usr/src/debug/nettle/3.10.2/write-be32.c /usr/src/debug/nettle/3.10.2/write-le32.c /usr/src/debug/nettle/3.10.2/sexp-format.c /usr/src/debug/nettle/3.10.2/write-le64.c /usr/src/debug/nettle/3.10.2/testsuite/eax-test.c /usr/src/debug/nettle/3.10.2/ecc-point.c /usr/src/debug/nettle/3.10.2/testsuite/gosthash94-test.c /usr/src/debug/nettle/3.10.2/yarrow_key_event.c /usr/src/debug/nettle/3.10.2/nettle-lookup-hash.c /usr/src/debug/nettle/3.10.2/cast128-meta.c /usr/src/debug/nettle/3.10.2/cnd-copy.c /usr/src/debug/nettle/3.10.2/curve44
 8.h /usr/src/debug/nettle/3.10.2/testsuite/sexp2rsa-test.c /usr/src/debug/nettle/3.10.2/ecc-point-mul-g.c /usr/src/debug/nettle/3.10.2/base64-meta.c /usr/src/debug/nettle/3.10.2/ed448-shake256-pubkey.c /usr/src/debug/nettle/3.10.2/hmac-sm3.c /usr/src/debug/nettle/3.10.2/rsa-blind.c /usr/src/debug/nettle/3.10.2/gosthash94-meta.c /usr/src/debug/nettle/3.10.2/ctr.h /usr/src/debug/nettle/3.10.2/des.h /usr/src/debug/nettle/3.10.2/dsa.h /usr/src/debug/nettle/3.10.2/eax.h /usr/src/debug/nettle/3.10.2/gcm.h /usr/src/debug/nettle/3.10.2/ecc.h /usr/src/debug/nettle/3.10.2/md2.h /usr/src/debug/nettle/3.10.2/md4.h /usr/src/debug/nettle/3.10.2/md5.h /usr/src/debug/nettle/3.10.2/camellia-table.c /usr/src/debug/nettle/3.10.2/ecc-curve25519-modp.s /usr/src/debug/nettle/3.10.2/eddsa-decompress.c /usr/src/debug/nettle/3.10.2/cmac-des3-meta.c /usr/src/debug/nettle/3.10.2/hmac-sha1-meta.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-modinv-test.c /usr/src/debug/nettle/3.10.2/testsuite/gostdsa-verify-test
 .c /usr/src/debug/nettle/3.10.2/nist-keywrap.c /usr/src/debug/nettle/3.10.2/memxor-2.s /usr/src/debug/nettle/3.10.2/nist-keywrap.h /usr/src/debug/nettle/3.10.2/gcm-aes128.c /usr/src/debug/nettle/3.10.2/gcm-aes192.c /usr/src/debug/nettle/3.10.2/gcm-aes256.c /usr/src/debug/nettle/3.10.2/ocb-aes128.c /usr/src/debug/nettle/3.10.2/xts-aes128.c /usr/src/debug/nettle/3.10.2/xts-aes256.c /usr/src/debug/nettle/3.10.2/serpent-set-key.c /usr/src/debug/nettle/3.10.2/pkcs1-rsa-sha256.c /usr/src/debug/nettle/3.10.2/eax-aes128-meta.c /usr/src/debug/nettle/3.10.2/gcm-aes128-meta.c /usr/src/debug/nettle/3.10.2/gcm-aes192-meta.c /usr/src/debug/nettle/3.10.2/gcm-aes256-meta.c /usr/src/debug/nettle/3.10.2/config.h /usr/src/debug/nettle/3.10.2/testsuite/twofish-test.c /usr/src/debug/nettle/3.10.2/md2.c /usr/src/debug/nettle/3.10.2/md4.c /usr/src/debug/nettle/3.10.2/md5.c /usr/src/debug/nettle/3.10.2/ocb.c /usr/src/debug/nettle/3.10.2/pss.c /usr/src/debug/nettle/3.10.2/rsa.c /usr/src/debug/nettle/3.10.2/
 sm3.c /usr/src/debug/nettle/3.10.2/sm4.c /usr/src/debug/nettle/3.10.2/xts.c /usr/src/debug/nettle/3.10.2/ecc-curve.h /usr/src/debug/nettle/3.10.2/salsa20-core-internal.s /usr/src/debug/nettle/3.10.2/eddsa-expand.c /usr/src/debug/nettle/3.10.2/dsa-verify.c /usr/src/debug/nettle/3.10.2/non-nettle.c /usr/src/debug/nettle/3.10.2/rsa-verify.c /usr/src/debug/nettle/3.10.2/non-nettle.h /usr/src/debug/nettle/3.10.2/ecc-mul-a.c /usr/src/debug/nettle/3.10.2/des3.c /usr/src/debug/nettle/3.10.2/camellia-invert-key.c /usr/src/debug/nettle/3.10.2/sha3.c /usr/src/debug/nettle/3.10.2/realloc.c /usr/src/debug/nettle/3.10.2/pbkdf2.h /usr/src/debug/nettle/3.10.2/ecc-mul-g.c /usr/src/debug/nettle/3.10.2/sha384-meta.c /usr/src/debug/nettle/3.10.2/sha3.h /usr/src/debug/nettle/3.10.2/pbkdf2.c /usr/src/debug/nettle/3.10.2/umac32.c /usr/src/debug/nettle/3.10.2/realloc.h /usr/src/debug/nettle/3.10.2/buffer-init.c /usr/src/debug/nettle/3.10.2/ecc-size.c /usr/src/debug/nettle/3.10.2/pkcs1-rsa-sha1.c /usr/src/d
 ebug/nettle/3.10.2/rsa-pss-sha512-sign-tr.c /usr/src/debug/nettle/3.10.2/cbc-aes128-encrypt-2.s /usr/src/debug/nettle/3.10.2/cbc-aes192-encrypt-2.s /usr/src/debug/nettle/3.10.2/cbc-aes256-encrypt-2.s /usr/src/debug/nettle/3.10.2/sha2-internal.h /usr/src/debug/nettle/3.10.2/base64url-encode.c /usr/src/debug/nettle/3.10.2/pbkdf2-hmac-sha256.c /usr/src/debug/nettle/3.10.2/pbkdf2-hmac-sha384.c /usr/src/debug/nettle/3.10.2/nettle-internal.h /usr/src/debug/nettle/3.10.2/pbkdf2-hmac-sha512.c /usr/src/debug/nettle/3.10.2/testsuite/drbg-ctr-aes256-test.c /usr/src/debug/nettle/3.10.2/testsuite/chacha-poly1305-test.c /usr/src/debug/nettle/3.10.2/aes-decrypt-internal.s /usr/src/debug/nettle/3.10.2/gosthash94.h /usr/src/debug/nettle/3.10.2/ghash-update.s /usr/src/debug/nettle/3.10.2/knuth-lfib.h /usr/src/debug/nettle/3.10.2/balloon.h /usr/src/debug/nettle/3.10.2/nettle-types.h /usr/src/debug/nettle/3.10.2/dsa2sexp.c /usr/src/debug/nettle/3.10.2/ed25519-sha512-pubkey.c /usr/src/debug/nettle/3.10.
 2/gosthash94.c /usr/src/debug/nettle/3.10.2/knuth-lfib.c /usr/src/debug/nettle/3.10.2/rsa2sexp.c /usr/src/debug/nettle/3.10.2/balloon.c /usr/src/debug/nettle/3.10.2/sexp2bignum.c /usr/src/debug/nettle/3.10.2/ed448-shake256-sign.c /usr/src/debug/nettle/3.10.2/testsuite/eddsa-verify-test.c /usr/src/debug/nettle/3.10.2/salsa20-crypt-internal.c /usr/src/debug/nettle/3.10.2/nettle-meta-hashes.c /usr/src/debug/nettle/3.10.2/ecdsa.h /usr/src/debug/nettle/3.10.2/eddsa.h /usr/src/debug/nettle/3.10.2/pkcs1-rsa-md5.c /usr/src/debug/nettle/3.10.2/aes256-meta.c /usr/src/debug/nettle/3.10.2/sha256-meta.c /usr/src/debug/nettle/3.10.2/nettle-write.h /usr/src/debug/nettle/3.10.2/aes-invert-internal.c /usr/src/debug/nettle/3.10.2/dsa-compat-keygen.c /usr/src/debug/nettle/3.10.2/rsa-pkcs1-sign-tr.c /usr/src/debug/nettle/3.10.2/aes192-set-decrypt-key.c /usr/src/debug/nettle/3.10.2/siv-cmac-aes256.c /usr/src/debug/nettle/3.10.2/testsuite/pkcs1-test.c /usr/src/debug/nettle/3.10.2/siv-ghash-set-key.c /usr
 /src/debug/nettle/3.10.2/ecc-add-jjj.c /usr/src/debug/nettle/3.10.2/ecc-add-thh.c /usr/src/debug/nettle/3.10.2/ecc-add-ehh.c /usr/src/debug/nettle/3.10.2/ecc-add-jja.c /usr/src/debug/nettle/3.10.2/gcm-aes.c /usr/src/debug/nettle/3.10.2/sha512-224-meta.c /usr/src/debug/nettle/3.10.2/sha512-256-meta.c /usr/src/debug/nettle/3.10.2/testsuite/dsa-keygen-test.c /usr/src/debug/nettle/3.10.2/testsuite/rsa-keygen-test.c /usr/src/debug/nettle/3.10.2/sexp2dsa.c /usr/src/debug/nettle/3.10.2/umac-l3.c /usr/src/debug/nettle/3.10.2/testsuite/eddsa-compress-test.c /usr/src/debug/nettle/3.10.2/rsa-sha256-sign-tr.c /usr/src/debug/nettle/3.10.2/rsa-sha512-sign-tr.c /usr/src/debug/nettle/3.10.2/cnd-memcpy.c /usr/src/debug/nettle/3.10.2/pgp-encode.c /usr/src/debug/nettle/3.10.2/testsuite/meta-cipher-test.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-redc-test.c /usr/src/debug/nettle/3.10.2/gcm-camellia256-meta.c /usr/src/debug/nettle/3.10.2/md-internal.h /usr/src/debug/nettle/3.10.2/testsuite/ecc-sqrt-te
 st.c /usr/src/debug/nettle/3.10.2/gcm-camellia128.c /usr/src/debug/nettle/3.10.2/drbg-ctr.h /usr/src/debug/nettle/3.10.2/curve25519-mul.c /usr/src/debug/nettle/3.10.2/hmac-ripemd160.c /usr/src/debug/nettle/3.10.2/sha1.c /usr/src/debug/nettle/3.10.2/umac-set-key.c /usr/src/debug/nettle/3.10.2/camellia128-crypt.c /usr/src/debug/nettle/3.10.2/asn1.h /usr/src/debug/nettle/3.10.2/camellia256-crypt.c /usr/src/debug/nettle/3.10.2/sha1.h /usr/src/debug/nettle/3.10.2/testsuite/random-prime-test.c /usr/src/debug/nettle/3.10.2/umac-internal.h /usr/src/debug/nettle/3.10.2/siv-gcm-aes256.c /usr/src/debug/nettle/3.10.2/version.h /usr/src/debug/nettle/3.10.2/version.c /usr/src/debug/nettle/3.10.2/pbkdf2-hmac-gosthash94.c /usr/src/debug/nettle/3.10.2/hmac-gosthash94.c /usr/src/debug/nettle/3.10.2/aes-set-key-internal.c /usr/src/debug/nettle/3.10.2/testsuite/sha3-224-test.c /usr/src/debug/nettle/3.10.2/testsuite/sha3-256-test.c /usr/src/debug/nettle/3.10.2/testsuite/sha3-384-test.c /usr/src/debug/ne
 ttle/3.10.2/aes128-decrypt.c /usr/src/debug/nettle/3.10.2/blowfish-internal.h /usr/src/debug/nettle/3.10.2/aes128-encrypt.c /usr/src/debug/nettle/3.10.2/testsuite/sha3-512-test.c /usr/src/debug/nettle/3.10.2/testsuite/rsa-compute-root-test.c /usr/src/debug/nettle/3.10.2/testsuite/shake128-test.c /usr/src/debug/nettle/3.10.2/testsuite/shake256-test.c /usr/src/debug/nettle/3.10.2/testsuite/sm4-test.c /usr/src/debug/nettle/3.10.2/sha3-shake.c /usr/src/debug/nettle/3.10.2/gostdsa-verify.c /usr/src/debug/nettle/3.10.2/desCode.h /usr/src/debug/nettle/3.10.2/testsuite/chacha-test.c /usr/src/debug/nettle/3.10.2/testsuite/sha224-test.c /usr/src/debug/nettle/3.10.2/poly1305-internal.s /usr/src/debug/nettle/3.10.2/testsuite/sha256-test.c /usr/src/debug/nettle/3.10.2/siv-cmac-aes128.c /usr/src/debug/nettle/3.10.2/testsuite/bignum-test.c /usr/src/debug/nettle/3.10.2/testsuite/sha384-test.c /usr/src/debug/nettle/3.10.2/testsuite/sha512-test.c /usr/src/debug/nettle/3.10.2/sha3-224.c /usr/src/debug
 /nettle/3.10.2/serpent-meta.c /usr/src/debug/nettle/3.10.2/poly1305-internal.h /usr/src/debug/nettle/3.10.2/testsuite/rsa-sign-tr-test.c /usr/src/debug/nettle/3.10.2/gostdsa.h /usr/src/debug/nettle/3.10.2/shake128.c /usr/src/debug/nettle/3.10.2/hmac-ripemd160-meta.c /usr/src/debug/nettle/3.10.2/ecc-point-mul.c /usr/src/debug/nettle/3.10.2/testsuite/curve448-dh-test.c /usr/src/debug/nettle/3.10.2/testsuite/ecdsa-verify-test.c /usr/src/debug/nettle/3.10.2/sha224-meta.c /usr/src/debug/nettle/3.10.2/sha3-permute.s /usr/src/debug/nettle/3.10.2/ghash-set-key.c /usr/src/debug/nettle/3.10.2/testsuite/sexp-test.c /usr/src/debug/nettle/3.10.2/sha3-256.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-mod-arith-test.c /usr/src/debug/nettle/3.10.2/testsuite/md5-test.c /usr/src/debug/nettle/3.10.2/umac96.c /usr/src/debug/nettle/3.10.2/testsuite/meta-armor-test.c /usr/src/debug/nettle/3.10.2/balloon-sha384.c /usr/src/debug/nettle/3.10.2/ecc-ecdsa-sign.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-mul-a
 -test.c /usr/src/debug/nettle/3.10.2/testsuite/ecc-mul-g-test.c /usr/src/debug/nettle/3.10.2/bignum.h /usr/src/debug/nettle/3.10.2/serpent.h /usr/src/debug/nettle/3.10.2/bignum.c /usr/src/debug/nettle/3.10.2/ed25519-sha512-sign.c /usr/src/debug/nettle/3.10.2/fat-x86_64.c /usr/src/debug/nettle/3.10.2/keymap.h /usr/src/debug/nettle/3.10.2/testsuite/buffer-test.c /usr/src/debug/nettle/3.10.2/sha512-meta.c /usr/src/debug/nettle/3.10.2/umac128.c /usr/src/debug/nettle/3.10.2/testsuite/sexp-format-test.c /usr/src/debug/nettle/3.10.2/yarrow256.c /usr/src/debug/nettle/3.10.2/ed25519-sha512.c /usr/src/debug/nettle/3.10.2/aes192-meta.c /usr/src/debug/nettle/3.10.2/testsuite/eddsa-sign-test.c /usr/src/debug/nettle/3.10.2/sha1-meta.c /usr/src/debug/nettle/3.10.2/chacha-core-internal.s /usr/src/debug/nettle/3.10.2/sha512-compress.s /usr/src/debug/nettle/3.10.2/testsuite/meta-aead-test.c /usr/src/debug/nettle/3.10.2/testsuite/meta-hash-test.c /usr/src/debug/nettle/3.10.2/eddsa-internal.h /usr/src/
 debug/nettle/3.10.2/pkcs1-internal.h /usr/src/debug/nettle/3.10.2/aes192-decrypt.c /usr/src/debug/nettle/3.10.2/aes192-set-encrypt-key.c /usr/src/debug/nettle/3.10.2/gcm-sm4-meta.c /usr/src/debug/nettle/3.10.2/chacha.h /usr/src/debug/nettle/3.10.2/aes192-encrypt.c", added "/usr/src/debug/nettle/4.0/pss.c /usr/src/debug/nettle/4.0/testsuite/sha3-224-test.c /usr/src/debug/nettle/4.0/testsuite/sha3-256-test.c /usr/src/debug/nettle/4.0/ed25519-sha512-verify.c /usr/src/debug/nettle/4.0/pss.h /usr/src/debug/nettle/4.0/poly1305-update.c /usr/src/debug/nettle/4.0/cfb.h /usr/src/debug/nettle/4.0/slh-dsa-128f.c /usr/src/debug/nettle/4.0/cfb.c /usr/src/debug/nettle/4.0/rsa-md5-sign-tr.c /usr/src/debug/nettle/4.0/testsuite/aes-test.c /usr/src/debug/nettle/4.0/testsuite/cbc-test.c /usr/src/debug/nettle/4.0/ecc-point-mul-g.c /usr/src/debug/nettle/4.0/testsuite/ccm-test.c /usr/src/debug/nettle/4.0/testsuite/cfb-test.c /usr/src/debug/nettle/4.0/testsuite/chacha-test.c /usr/src/debug/nettle/4.0/test
 suite/ctr-test.c /usr/src/debug/nettle/4.0/testsuite/des-test.c /usr/src/debug/nettle/4.0/testsuite/dsa-test.c /usr/src/debug/nettle/4.0/testsuite/eax-test.c /usr/src/debug/nettle/4.0/testsuite/serpent-test.c /usr/src/debug/nettle/4.0/testsuite/sha224-test.c /usr/src/debug/nettle/4.0/salsa20-2core.s /usr/src/debug/nettle/4.0/base64url-decode.c /usr/src/debug/nettle/4.0/base64url-encode.c /usr/src/debug/nettle/4.0/rsa-oaep-decrypt.c /usr/src/debug/nettle/4.0/rsa-oaep-encrypt.c /usr/src/debug/nettle/4.0/testsuite/chacha-poly1305-test.c /usr/src/debug/nettle/4.0/salsa20-crypt.c /usr/src/debug/nettle/4.0/umac-poly64.c /usr/src/debug/nettle/4.0/hmac-sha224-meta.c /usr/src/debug/nettle/4.0/hmac-sha256-meta.c /usr/src/debug/nettle/4.0/hmac-sha384-meta.c /usr/src/debug/nettle/4.0/hmac-sha512-meta.c /usr/src/debug/nettle/4.0/eax-aes128-meta.c /usr/src/debug/nettle/4.0/gcm-aes128-meta.c /usr/src/debug/nettle/4.0/aes-internal.h /usr/src/debug/nettle/4.0/ctr-internal.h /usr/src/debug/nettle/4.0
 /dsa-internal.h /usr/src/debug/nettle/4.0/ecc-internal.h /usr/src/debug/nettle/4.0/gcm-aes192-meta.c /usr/src/debug/nettle/4.0/gcm-internal.h /usr/src/debug/nettle/4.0/oaep.h /usr/src/debug/nettle/4.0/rsa-internal.h /usr/src/debug/nettle/4.0/oaep.c /usr/src/debug/nettle/4.0/testsuite/rsa-compute-root-test.c /usr/src/debug/nettle/4.0/slh-dsa-sha2-128s.c /usr/src/debug/nettle/4.0/balloon.h /usr/src/debug/nettle/4.0/hmac-sm3-meta.c /usr/src/debug/nettle/4.0/version.h /usr/src/debug/nettle/4.0/balloon.c /usr/src/debug/nettle/4.0/version.c /usr/src/debug/nettle/4.0/gcm-aes256.c /usr/src/debug/nettle/4.0/xts-aes256.c /usr/src/debug/nettle/4.0/ccm-aes256.c /usr/src/debug/nettle/4.0/cnd-copy.c /usr/src/debug/nettle/4.0/camellia128-set-decrypt-key.c /usr/src/debug/nettle/4.0/camellia128-set-encrypt-key.c /usr/src/debug/nettle/4.0/camellia256-set-decrypt-key.c /usr/src/debug/nettle/4.0/camellia256-set-encrypt-key.c /usr/src/debug/nettle/4.0/ecc-mul-g.c /usr/src/debug/nettle/4.0/hmac-gosthash9
 4.c /usr/src/debug/nettle/4.0/pkcs1-rsa-md5.c /usr/src/debug/nettle/4.0/testsuite/gostdsa-keygen-test.c /usr/src/debug/nettle/4.0/hmac-sm3.c /usr/src/debug/nettle/4.0/testsuite/shake128-test.c /usr/src/debug/nettle/4.0/dsa.h /usr/src/debug/nettle/4.0/ed448-shake256-pubkey.c /usr/src/debug/nettle/4.0/testsuite/ecc-mod-arith-test.c /usr/src/debug/nettle/4.0/cbc-aes128-encrypt.c /usr/src/debug/nettle/4.0/cbc-aes192-encrypt.c /usr/src/debug/nettle/4.0/ecc-mul-a.c /usr/src/debug/nettle/4.0/dsa.c /usr/src/debug/nettle/4.0/lib/getopt-core.h /usr/src/debug/nettle/4.0/testsuite/gcm-test.c /usr/src/debug/nettle/4.0/testsuite/md2-test.c /usr/src/debug/nettle/4.0/testsuite/md4-test.c /usr/src/debug/nettle/4.0/testsuite/md5-test.c /usr/src/debug/nettle/4.0/testsuite/ocb-test.c /usr/src/debug/nettle/4.0/testsuite/pss-test.c /usr/src/debug/nettle/4.0/testsuite/rsa-test.c /usr/src/debug/nettle/4.0/testsuite/sm3-test.c /usr/src/debug/nettle/4.0/testsuite/sm4-test.c /usr/src/debug/nettle/4.0/testsuit
 e/xts-test.c /usr/src/debug/nettle/4.0/chacha-set-nonce.c /usr/src/debug/nettle/4.0/curve25519-eh-to-x.c /usr/src/debug/nettle/4.0/sha3-224-meta.c /usr/src/debug/nettle/4.0/ghash-set-key.c /usr/src/debug/nettle/4.0/nettle-lookup-hash.c /usr/src/debug/nettle/4.0/sexp-transport.c /usr/src/debug/nettle/4.0/gostdsa-verify.c /usr/src/debug/nettle/4.0/sha3-512.c /usr/src/debug/nettle/4.0/ecc-secp192r1-modp.s /usr/src/debug/nettle/4.0/ecc-secp224r1-modp.s /usr/src/debug/nettle/4.0/ecc-secp384r1-modp.s /usr/src/debug/nettle/4.0/ecc-secp521r1-modp.s /usr/src/debug/nettle/4.0/ecc-point.c /usr/src/debug/nettle/4.0/pkcs1-rsa-digest.c /usr/src/debug/nettle/4.0/sexp2bignum.c /usr/src/debug/nettle/4.0/siv-gcm-aes128.c /usr/src/debug/nettle/4.0/siv-gcm-aes256.c /usr/src/debug/nettle/4.0/hmac-sha1-meta.c /usr/src/debug/nettle/4.0/salsa20r12-crypt.c /usr/src/debug/nettle/4.0/testsuite/camellia-test.c /usr/src/debug/nettle/4.0/ripemd160-meta.c /usr/src/debug/nettle/4.0/blowfish.c /usr/src/debug/nettle
 /4.0/dsa-hash.c /usr/src/debug/nettle/4.0/nettle-write.h /usr/src/debug/nettle/4.0/testsuite/meta-mac-test.c /usr/src/debug/nettle/4.0/siv-cmac-aes128.c /usr/src/debug/nettle/4.0/testsuite/sha3-512-test.c /usr/src/debug/nettle/4.0/blowfish.h /usr/src/debug/nettle/4.0/sha3-permute.s /usr/src/debug/nettle/4.0/aes128-meta.c /usr/src/debug/nettle/4.0/aes192-meta.c /usr/src/debug/nettle/4.0/aes256-meta.c /usr/src/debug/nettle/4.0/arctwo-meta.c /usr/src/debug/nettle/4.0/sha224-meta.c /usr/src/debug/nettle/4.0/nettle-meta.h /usr/src/debug/nettle/4.0/sha256-meta.c /usr/src/debug/nettle/4.0/sha384-meta.c /usr/src/debug/nettle/4.0/sha512-meta.c /usr/src/debug/nettle/4.0/testsuite/aes-keywrap-test.c /usr/src/debug/nettle/4.0/sha3-384-meta.c /usr/src/debug/nettle/4.0/umac-set-key.c /usr/src/debug/nettle/4.0/testsuite/sexp2rsa-test.c /usr/src/debug/nettle/4.0/drbg-ctr-aes256.c /usr/src/debug/nettle/4.0/ocb.c /usr/src/debug/nettle/4.0/sec-sub-1.c /usr/src/debug/nettle/4.0/testsuite/testutils.c /u
 sr/src/debug/nettle/4.0/aes-set-key-internal.c /usr/src/debug/nettle/4.0/gost28147-internal.h /usr/src/debug/nettle/4.0/ocb.h /usr/src/debug/nettle/4.0/siv-cmac-aes256.c /usr/src/debug/nettle/4.0/testsuite/testutils.h /usr/src/debug/nettle/4.0/sha512-224-meta.c /usr/src/debug/nettle/4.0/sha512-256-meta.c /usr/src/debug/nettle/4.0/hmac-sha1.c /usr/src/debug/nettle/4.0/slh-merkle.c /usr/src/debug/nettle/4.0/testsuite/ecc-modinv-test.c /usr/src/debug/nettle/4.0/nettle-meta-hashes.c /usr/src/debug/nettle/4.0/gcm-aes256-meta.c /usr/src/debug/nettle/4.0/slh-dsa-shake-128f.c /usr/src/debug/nettle/4.0/slh-wots.c /usr/src/debug/nettle/4.0/slh-fors.c /usr/src/debug/nettle/4.0/sha256-compress-n-2.s /usr/src/debug/nettle/4.0/rsa-sha256-sign-tr.c /usr/src/debug/nettle/4.0/camellia-internal.h /usr/src/debug/nettle/4.0/pkcs1-encrypt.c /usr/src/debug/nettle/4.0/salsa20-internal.h /usr/src/debug/nettle/4.0/camellia-crypt-internal.s /usr/src/debug/nettle/4.0/cpuid.s /usr/src/debug/nettle/4.0/ecc-mod.
 c /usr/src/debug/nettle/4.0/dsa-keygen.c /usr/src/debug/nettle/4.0/rsa-keygen.c /usr/src/debug/nettle/4.0/testsuite/ed448-test.c /usr/src/debug/nettle/4.0/fat-setup.h /usr/src/debug/nettle/4.0/salsa20-set-nonce.c /usr/src/debug/nettle/4.0/ecc-ecdsa-verify.c /usr/src/debug/nettle/4.0/testsuite/ecc-mod-test.c /usr/src/debug/nettle/4.0/hmac-streebog-meta.c /usr/src/debug/nettle/4.0/ctr16.c /usr/src/debug/nettle/4.0/pkcs1.c /usr/src/debug/nettle/4.0/sha3-shake.c /usr/src/debug/nettle/4.0/blowfish-bcrypt.c /usr/src/debug/nettle/4.0/testsuite/eddsa-compress-test.c /usr/src/debug/nettle/4.0/ecdsa.h /usr/src/debug/nettle/4.0/eddsa.h /usr/src/debug/nettle/4.0/pkcs1.h /usr/src/debug/nettle/4.0/gosthash94.h /usr/src/debug/nettle/4.0/base16-decode.c /usr/src/debug/nettle/4.0/base64-decode.c /usr/src/debug/nettle/4.0/testsuite/gosthash94-test.c /usr/src/debug/nettle/4.0/gosthash94.c /usr/src/debug/nettle/4.0/rsa-sha256-verify.c /usr/src/debug/nettle/4.0/sha3.h /usr/src/debug/nettle/4.0/testsuite
 /memeql-test.c /usr/src/debug/nettle/4.0/chacha-poly1305.c /usr/src/debug/nettle/4.0/sha3.c /usr/src/debug/nettle/4.0/chacha-poly1305.h /usr/src/debug/nettle/4.0/serpent.h /usr/src/debug/nettle/4.0/sha1.h /usr/src/debug/nettle/4.0/testsuite/balloon-test.c /usr/src/debug/nettle/4.0/arcfour.c /usr/src/debug/nettle/4.0/sm3-meta.c /usr/src/debug/nettle/4.0/sm4-meta.c /usr/src/debug/nettle/4.0/md4-meta.c /usr/src/debug/nettle/4.0/md2-meta.c /usr/src/debug/nettle/4.0/md5-meta.c /usr/src/debug/nettle/4.0/arcfour.h /usr/src/debug/nettle/4.0/gcm-camellia128-meta.c /usr/src/debug/nettle/4.0/blowfish-internal.h /usr/src/debug/nettle/4.0/buffer-init.c /usr/src/debug/nettle/4.0/ecc-add-jjj.c /usr/src/debug/nettle/4.0/sha1.c /usr/src/debug/nettle/4.0/testsuite/version-test.c /usr/src/debug/nettle/4.0/gcm-camellia256-meta.c /usr/src/debug/nettle/4.0/ecc-scalar.c /usr/src/debug/nettle/4.0/md5.h /usr/src/debug/nettle/4.0/streebog-meta.c /usr/src/debug/nettle/4.0/umac-nh.s /usr/src/debug/nettle/4.0/m
 d5.c /usr/src/debug/nettle/4.0/fat-x86_64.c /usr/src/debug/nettle/4.0/twofish.h /usr/src/debug/nettle/4.0/rsa-sha256-sign.c /usr/src/debug/nettle/4.0/twofish.c /usr/src/debug/nettle/4.0/testsuite/rsa-encrypt-test.c /usr/src/debug/nettle/4.0/umac.h /usr/src/debug/nettle/4.0/pkcs1-rsa-sha512.c /usr/src/debug/nettle/4.0/ecc-add-eh.c /usr/src/debug/nettle/4.0/testsuite/ripemd160-test.c /usr/src/debug/nettle/4.0/pss-mgf1.h /usr/src/debug/nettle/4.0/sec-add-1.c /usr/src/debug/nettle/4.0/eddsa-compress.c /usr/src/debug/nettle/4.0/pss-mgf1.c /usr/src/debug/nettle/4.0/testsuite/gostdsa-sign-test.c /usr/src/debug/nettle/4.0/aes.h /usr/src/debug/nettle/4.0/serpent-internal.h /usr/src/debug/nettle/4.0/ecc-j-to-a.c /usr/src/debug/nettle/4.0/ecc-eh-to-a.c /usr/src/debug/nettle/4.0/ecc-dup-jj.c /usr/src/debug/nettle/4.0/cmac-aes256.c /usr/src/debug/nettle/4.0/testsuite/meta-cipher-test.c /usr/src/debug/nettle/4.0/sm3.h /usr/src/debug/nettle/4.0/cast128_sboxes.h /usr/src/debug/nettle/4.0/sm3.c /usr
 /src/debug/nettle/4.0/knuth-lfib.c /usr/src/debug/nettle/4.0/serpent-set-key.c /usr/src/debug/nettle/4.0/rsa-sha512-sign-tr.c /usr/src/debug/nettle/4.0/knuth-lfib.h /usr/src/debug/nettle/4.0/cmac-des3.c /usr/src/debug/nettle/4.0/ecc-ecdsa-sign.c /usr/src/debug/nettle/4.0/aes-decrypt-internal.s /usr/src/debug/nettle/4.0/aes-encrypt-internal.s /usr/src/debug/nettle/4.0/testsuite/random-prime-test.c /usr/src/debug/nettle/4.0/nettle-meta-macs.c /usr/src/debug/nettle/4.0/ecc-curve25519-modp.s /usr/src/debug/nettle/4.0/curve25519.h /usr/src/debug/nettle/4.0/testsuite/slh-dsa-test.c /usr/src/debug/nettle/4.0/cmac.h /usr/src/debug/nettle/4.0/cbc-aes256-encrypt-2.s /usr/src/debug/nettle/4.0/cmac.c /usr/src/debug/nettle/4.0/nettle-meta-ciphers.c /usr/src/debug/nettle/4.0/ecc-random.c /usr/src/debug/nettle/4.0/pkcs1-rsa-sha1.c /usr/src/debug/nettle/4.0/cnd-memcpy.c /usr/src/debug/nettle/4.0/dsa2sexp.c /usr/src/debug/nettle/4.0/rsa2sexp.c /usr/src/debug/nettle/4.0/serpent-meta.c /usr/src/debug/
 nettle/4.0/testsuite/dlopen-test.c /usr/src/debug/nettle/4.0/eddsa-decompress.c /usr/src/debug/nettle/4.0/bignum-random-prime.c /usr/src/debug/nettle/4.0/testsuite/sha512-224-test.c /usr/src/debug/nettle/4.0/slh-sha256.c /usr/src/debug/nettle/4.0/testsuite/sha512-256-test.c /usr/src/debug/nettle/4.0/ecc-curve448-modp.s /usr/src/debug/nettle/4.0/getopt1.c /usr/src/debug/nettle/4.0/hmac-md5.c /usr/src/debug/nettle/4.0/ed448-shake256-sign.c /usr/src/debug/nettle/4.0/rsa-md5-sign.c /usr/src/debug/nettle/4.0/umac-l3.c /usr/src/debug/nettle/4.0/testsuite/sha3-384-test.c /usr/src/debug/nettle/4.0/eddsa-hash.c /usr/src/debug/nettle/4.0/hmac-ripemd160-meta.c /usr/src/debug/nettle/4.0/testsuite/ecc-mul-a-test.c /usr/src/debug/nettle/4.0/testsuite/ecc-mul-g-test.c /usr/src/debug/nettle/4.0/memxor3.s /usr/src/debug/nettle/4.0/salsa20-128-set-key.c /usr/src/debug/nettle/4.0/salsa20-256-set-key.c /usr/src/debug/nettle/4.0/slh-dsa-internal.h /usr/src/debug/nettle/4.0/rsa-sha1-verify.c /usr/src/deb
 ug/nettle/4.0/testsuite/cxx-test.cxx /usr/src/debug/nettle/4.0/testsuite/rsa-pss-sign-tr-test.c /usr/src/debug/nettle/4.0/ripemd160-internal.h /usr/src/debug/nettle/4.0/pkcs1-rsa-sha256.c /usr/src/debug/nettle/4.0/ccm-aes128.c /usr/src/debug/nettle/4.0/eax-aes128.c /usr/src/debug/nettle/4.0/gcm-aes128.c /usr/src/debug/nettle/4.0/eax.h /usr/src/debug/nettle/4.0/ocb-aes128.c /usr/src/debug/nettle/4.0/shake128.c /usr/src/debug/nettle/4.0/xts-aes128.c /usr/src/debug/nettle/4.0/eax.c /usr/src/debug/nettle/4.0/testsuite/cnd-memcpy-test.c /usr/src/debug/nettle/4.0/gosthash94-meta.c /usr/src/debug/nettle/4.0/curve448-eh-to-x.c /usr/src/debug/nettle/4.0/balloon-sha1.c /usr/src/debug/nettle/4.0/sexp2dsa.c /usr/src/debug/nettle/4.0/sexp2rsa.c /usr/src/debug/nettle/4.0/gcm.h /usr/src/debug/nettle/4.0/balloon-sha256.c /usr/src/debug/nettle/4.0/balloon-sha384.c /usr/src/debug/nettle/4.0/balloon-sha512.c /usr/src/debug/nettle/4.0/dsa-gen-params.c /usr/src/debug/nettle/4.0/rsa-sha1-sign.c /usr/src/
 debug/nettle/4.0/gcm.c /usr/src/debug/nettle/4.0/testsuite/yarrow-test.c /usr/src/debug/nettle/4.0/eddsa-pubkey.c /usr/src/debug/nettle/4.0/testsuite/sha512-test.c /usr/src/debug/nettle/4.0/aes-invert-internal.c /usr/src/debug/nettle/4.0/siv-ghash-update.c /usr/src/debug/nettle/4.0/bswap-internal.h /usr/src/debug/nettle/4.0/block-internal.h /usr/src/debug/nettle/4.0/eddsa-internal.h /usr/src/debug/nettle/4.0/ghash-internal.h /usr/src/debug/nettle/4.0/ripemd160.h /usr/src/debug/nettle/4.0/pkcs1-internal.h /usr/src/debug/nettle/4.0/chacha-crypt.c /usr/src/debug/nettle/4.0/ctr.c /usr/src/debug/nettle/4.0/ripemd160.c /usr/src/debug/nettle/4.0/umac-nh-n.s /usr/src/debug/nettle/4.0/nettle-types.h /usr/src/debug/nettle/4.0/ctr.h /usr/src/debug/nettle/4.0/testsuite/shake256-test.c /usr/src/debug/nettle/4.0/testsuite/streebog-test.c /usr/src/debug/nettle/4.0/cbc-aes256-encrypt.c /usr/src/debug/nettle/4.0/hkdf.h /usr/src/debug/nettle/4.0/hkdf.c /usr/src/debug/nettle/4.0/md-internal.h /usr/src
 /debug/nettle/4.0/hmac-sha512.c /usr/src/debug/nettle/4.0/pbkdf2-hmac-sha512.c /usr/src/debug/nettle/4.0/bignum-random.c /usr/src/debug/nettle/4.0/ecc-nonsec-add-jjj.c /usr/src/debug/nettle/4.0/rsa-pss-sha256-sign-tr.c /usr/src/debug/nettle/4.0/rsa-pss-sha512-sign-tr.c /usr/src/debug/nettle/4.0/testsuite/bignum-test.c /usr/src/debug/nettle/4.0/hogweed-internal.h /usr/src/debug/nettle/4.0/slh-dsa-128s.c /usr/src/debug/nettle/4.0/testsuite/rsa2sexp-test.c /usr/src/debug/nettle/4.0/hmac.h /usr/src/debug/nettle/4.0/testsuite/bcrypt-test.c /usr/src/debug/nettle/4.0/der-iterator.c /usr/src/debug/nettle/4.0/sha1-compress.s /usr/src/debug/nettle/4.0/ecc-secp192r1.c /usr/src/debug/nettle/4.0/ecc-secp224r1.c /usr/src/debug/nettle/4.0/ecc-secp256r1.c /usr/src/debug/nettle/4.0/ecc-secp384r1.c /usr/src/debug/nettle/4.0/ecc-secp521r1.c /usr/src/debug/nettle/4.0/ecc-secp224r1.h /usr/src/debug/nettle/4.0/ecc-secp256r1.h /usr/src/debug/nettle/4.0/ecc-secp384r1.h /usr/src/debug/nettle/4.0/ecc-secp521
 r1.h /usr/src/debug/nettle/4.0/ecc-secp192r1.h /usr/src/debug/nettle/4.0/ecc-add-ehh.c /usr/src/debug/nettle/4.0/curve448-mul.c /usr/src/debug/nettle/4.0/testsuite/dsa-keygen-test.c /usr/src/debug/nettle/4.0/testsuite/rsa-keygen-test.c /usr/src/debug/nettle/4.0/chacha-core-internal.s /usr/src/debug/nettle/4.0/testsuite/salsa20-test.c /usr/src/debug/nettle/4.0/gcm-sm4-meta.c /usr/src/debug/nettle/4.0/pbkdf2-hmac-sha1.c /usr/src/debug/nettle/4.0/ecc-add-jja.c /usr/src/debug/nettle/4.0/nettle-meta-aeads.c /usr/src/debug/nettle/4.0/rsa-decrypt.c /usr/src/debug/nettle/4.0/rsa-encrypt.c /usr/src/debug/nettle/4.0/testsuite/ed25519-test.c /usr/src/debug/nettle/4.0/write-le32.c /usr/src/debug/nettle/4.0/ecc-mod-inv.c /usr/src/debug/nettle/4.0/testsuite/siv-cmac-test.c /usr/src/debug/nettle/4.0/testsuite/meta-hash-test.c /usr/src/debug/nettle/4.0/testsuite/sha1-huge-test.c /usr/src/debug/nettle/4.0/gcm-aes192.c /usr/src/debug/nettle/4.0/sha1-meta.c /usr/src/debug/nettle/4.0/chacha-internal.h 
 /usr/src/debug/nettle/4.0/dsa-sign.c /usr/src/debug/nettle/4.0/nettle-internal.h /usr/src/debug/nettle/4.0/rsa-sign.c /usr/src/debug/nettle/4.0/rsa-pkcs1-sign-tr.c /usr/src/debug/nettle/4.0/ecc-curve448.c /usr/src/debug/nettle/4.0/ghash-set-key-2.s /usr/src/debug/nettle/4.0/ghash-update.s /usr/src/debug/nettle/4.0/md4.h /usr/src/debug/nettle/4.0/cbc.h /usr/src/debug/nettle/4.0/ecc-curve448.h /usr/src/debug/nettle/4.0/cbc.c /usr/src/debug/nettle/4.0/testsuite/memxor-test.c /usr/src/debug/nettle/4.0/md4.c /usr/src/debug/nettle/4.0/md2.h /usr/src/debug/nettle/4.0/camellia-table.c /usr/src/debug/nettle/4.0/md2.c /usr/src/debug/nettle/4.0/testsuite/ecdsa-keygen-test.c /usr/src/debug/nettle/4.0/testsuite/ecdsa-verify-test.c /usr/src/debug/nettle/4.0/testsuite/eddsa-verify-test.c /usr/src/debug/nettle/4.0/poly1305.h /usr/src/debug/nettle/4.0/ecc-secp256r1-redc.s /usr/src/debug/nettle/4.0/sexp-transport-format.c /usr/src/debug/nettle/4.0/memeql-sec.c /usr/src/debug/nettle/4.0/aes128-set-dec
 rypt-key.c /usr/src/debug/nettle/4.0/aes128-set-encrypt-key.c /usr/src/debug/nettle/4.0/aes192-set-decrypt-key.c /usr/src/debug/nettle/4.0/aes192-set-encrypt-key.c /usr/src/debug/nettle/4.0/aes256-set-decrypt-key.c /usr/src/debug/nettle/4.0/aes256-set-encrypt-key.c /usr/src/debug/nettle/4.0/hmac-internal.c /usr/src/debug/nettle/4.0/nist-keywrap.c /usr/src/debug/nettle/4.0/chacha-set-key.c /usr/src/debug/nettle/4.0/hmac-internal.h /usr/src/debug/nettle/4.0/nist-keywrap.h /usr/src/debug/nettle/4.0/sha2-internal.h /usr/src/debug/nettle/4.0/sha3-internal.h /usr/src/debug/nettle/4.0/chacha-poly1305-meta.c /usr/src/debug/nettle/4.0/testsuite/ecc-dup-test.c /usr/src/debug/nettle/4.0/rsa-sha512-verify.c /usr/src/debug/nettle/4.0/hmac-sha256.c /usr/src/debug/nettle/4.0/umac-internal.h /usr/src/debug/nettle/4.0/testsuite/pss-mgf1-test.c /usr/src/debug/nettle/4.0/testsuite/sha3-permute-test.c /usr/src/debug/nettle/4.0/testsuite/x86-ibt-test.c /usr/src/debug/nettle/4.0/sha3-224.c /usr/src/debug
 /nettle/4.0/ecc-gost-gc256b.c /usr/src/debug/nettle/4.0/yarrow_key_event.c /usr/src/debug/nettle/4.0/ecc-gost-gc256b.h /usr/src/debug/nettle/4.0/rsa-sha512-sign.c /usr/src/debug/nettle/4.0/curve448.h /usr/src/debug/nettle/4.0/pbkdf2-hmac-sha256.c /usr/src/debug/nettle/4.0/desCode.h /usr/src/debug/nettle/4.0/testsuite/rsa-sign-tr-test.c /usr/src/debug/nettle/4.0/camellia-invert-key.c /usr/src/debug/nettle/4.0/realloc.c /usr/src/debug/nettle/4.0/testsuite/cast128-test.c /usr/src/debug/nettle/4.0/realloc.h /usr/src/debug/nettle/4.0/salsa20-crypt-internal.c /usr/src/debug/nettle/4.0/ecdsa-sign.c /usr/src/debug/nettle/4.0/eddsa-sign.c /usr/src/debug/nettle/4.0/ghash-update-2.s /usr/src/debug/nettle/4.0/ecc-dup-th.c /usr/src/debug/nettle/4.0/salsa20-core-internal.s /usr/src/debug/nettle/4.0/testsuite/arctwo-test.c /usr/src/debug/nettle/4.0/sha2.h /usr/src/debug/nettle/4.0/slh-shake.c /usr/src/debug/nettle/4.0/testsuite/siv-gcm-test.c /usr/src/debug/nettle/4.0/hmac-sha384.c /usr/src/debug/
 nettle/4.0/testsuite/pkcs1-test.c /usr/src/debug/nettle/4.0/testsuite/gostdsa-verify-test.c /usr/src/debug/nettle/4.0/ed448-shake256.c /usr/src/debug/nettle/4.0/drbg-ctr.h /usr/src/debug/nettle/4.0/testsuite/meta-aead-test.c /usr/src/debug/nettle/4.0/memxor-2.s /usr/src/debug/nettle/4.0/testsuite/rsa-oaep-encrypt-test.c /usr/src/debug/nettle/4.0/cmac-aes128-meta.c /usr/src/debug/nettle/4.0/cmac-aes256-meta.c /usr/src/debug/nettle/4.0/ecc.h /usr/src/debug/nettle/4.0/cast128.h /usr/src/debug/nettle/4.0/testsuite/sexp-format-test.c /usr/src/debug/nettle/4.0/cast128.c /usr/src/debug/nettle/4.0/cast128-meta.c /usr/src/debug/nettle/4.0/umac128.c /usr/src/debug/nettle/4.0/hmac-sha224.c /usr/src/debug/nettle/4.0/hmac-ripemd160.c /usr/src/debug/nettle/4.0/salsa20.h /usr/src/debug/nettle/4.0/testsuite/pbkdf2-test.c /usr/src/debug/nettle/4.0/ecc-dup-eh.c /usr/src/debug/nettle/4.0/sha3-256-meta.c /usr/src/debug/nettle/4.0/rsa-pkcs1-verify.c /usr/src/debug/nettle/4.0/rsa-pss-sha256-verify.c /usr
 /src/debug/nettle/4.0/rsa-pss-sha512-verify.c /usr/src/debug/nettle/4.0/ripemd160-compress.c /usr/src/debug/nettle/4.0/testsuite/knuth-lfib-test.c /usr/src/debug/nettle/4.0/ecc-pm1-redc.c /usr/src/debug/nettle/4.0/ecc-pp1-redc.c /usr/src/debug/nettle/4.0/rsa-sec-decrypt.c /usr/src/debug/nettle/4.0/cmac-aes128.c /usr/src/debug/nettle/4.0/hmac-gosthash94-meta.c /usr/src/debug/nettle/4.0/siv-ghash-set-key.c /usr/src/debug/nettle/4.0/sha3-256.c /usr/src/debug/nettle/4.0/shake256.c /usr/src/debug/nettle/4.0/aes-decrypt-table.c /usr/src/debug/nettle/4.0/aes-encrypt-table.c /usr/src/debug/nettle/4.0/slh-xmss.c /usr/src/debug/nettle/4.0/der2dsa.c /usr/src/debug/nettle/4.0/der2rsa.c /usr/src/debug/nettle/4.0/slh-dsa.c /usr/src/debug/nettle/4.0/gostdsa.h /usr/src/debug/nettle/4.0/slh-dsa.h /usr/src/debug/nettle/4.0/slh-dsa-sha2-128f.c /usr/src/debug/nettle/4.0/testsuite/twofish-test.c /usr/src/debug/nettle/4.0/write-le64.c /usr/src/debug/nettle/4.0/siv-gcm.c /usr/src/debug/nettle/4.0/camellia
 128-meta.c /usr/src/debug/nettle/4.0/camellia192-meta.c /usr/src/debug/nettle/4.0/camellia256-meta.c /usr/src/debug/nettle/4.0/ed25519-sha512.c /usr/src/debug/nettle/4.0/aes128-encrypt-2.s /usr/src/debug/nettle/4.0/aes192-encrypt-2.s /usr/src/debug/nettle/4.0/aes256-encrypt-2.s /usr/src/debug/nettle/4.0/siv-gcm.h /usr/src/debug/nettle/4.0/gmp-glue.c /usr/src/debug/nettle/4.0/gmp-glue.h /usr/src/debug/nettle/4.0/testsuite/ecdsa-sign-test.c /usr/src/debug/nettle/4.0/testsuite/eddsa-sign-test.c /usr/src/debug/nettle/4.0/siv-cmac.c /usr/src/debug/nettle/4.0/cmac-des3-meta.c /usr/src/debug/nettle/4.0/gostdsa-vko.c /usr/src/debug/nettle/4.0/streebog.h /usr/src/debug/nettle/4.0/ed25519-sha512-pubkey.c /usr/src/debug/nettle/4.0/siv-cmac.h /usr/src/debug/nettle/4.0/testsuite/ecc-add-test.c /usr/src/debug/nettle/4.0/streebog.c /usr/src/debug/nettle/4.0/camellia.h /usr/src/debug/nettle/4.0/non-nettle.c /usr/src/debug/nettle/4.0/sha512-compress.s /usr/src/debug/nettle/4.0/non-nettle.h /usr/src/
 debug/nettle/4.0/rsa-pkcs1-sign.c /usr/src/debug/nettle/4.0/pkcs1-sec-decrypt.c /usr/src/debug/nettle/4.0/keymap.h /usr/src/debug/nettle/4.0/macros.h /usr/src/debug/nettle/4.0/base16.h /usr/src/debug/nettle/4.0/base64.h /usr/src/debug/nettle/4.0/bignum.h /usr/src/debug/nettle/4.0/buffer.h /usr/src/debug/nettle/4.0/ecc-mod-arith.c /usr/src/debug/nettle/4.0/hmac-md5-meta.c /usr/src/debug/nettle/4.0/pkcs1-decrypt.c /usr/src/debug/nettle/4.0/testsuite/blowfish-test.c /usr/src/debug/nettle/4.0/sha3-384.c /usr/src/debug/nettle/4.0/ecc-point-mul.c /usr/src/debug/nettle/4.0/pbkdf2.c /usr/src/debug/nettle/4.0/sha256.c /usr/src/debug/nettle/4.0/curve25519-mul-g.c /usr/src/debug/nettle/4.0/serpent-decrypt.s /usr/src/debug/nettle/4.0/serpent-encrypt.s /usr/src/debug/nettle/4.0/gcm-sm4.c /usr/src/debug/nettle/4.0/sm4.c /usr/src/debug/nettle/4.0/sexp-format.c /usr/src/debug/nettle/4.0/curve448-mul-g.c /usr/src/debug/nettle/4.0/sm4.h /usr/src/debug/nettle/4.0/testsuite/sha256-test.c /usr/src/debug
 /nettle/4.0/ed448-shake256-verify.c /usr/src/debug/nettle/4.0/ed25519-sha512-sign.c /usr/src/debug/nettle/4.0/base16-encode.c /usr/src/debug/nettle/4.0/base64-encode.c /usr/src/debug/nettle/4.0/sexp.h /usr/src/debug/nettle/4.0/aes128-encrypt.c /usr/src/debug/nettle/4.0/aes192-encrypt.c /usr/src/debug/nettle/4.0/aes256-encrypt.c /usr/src/debug/nettle/4.0/sexp.c /usr/src/debug/nettle/4.0/lib/getopt-ext.h /usr/src/debug/nettle/4.0/testsuite/drbg-ctr-aes256-test.c /usr/src/debug/nettle/4.0/gostdsa-sign.c /usr/src/debug/nettle/4.0/asn1.h /usr/src/debug/nettle/4.0/poly1305-aes.c /usr/src/debug/nettle/4.0/testsuite/buffer-test.c /usr/src/debug/nettle/4.0/testsuite/sha384-test.c /usr/src/debug/nettle/4.0/camellia128-crypt.c /usr/src/debug/nettle/4.0/camellia256-crypt.c /usr/src/debug/nettle/4.0/ecc-add-th.c /usr/src/debug/nettle/4.0/aes128-decrypt-2.s /usr/src/debug/nettle/4.0/aes192-decrypt-2.s /usr/src/debug/nettle/4.0/aes256-decrypt-2.s /usr/src/debug/nettle/4.0/poly1305-internal.h /usr/
 src/debug/nettle/4.0/gcm-camellia128.c /usr/src/debug/nettle/4.0/poly1305-internal.s /usr/src/debug/nettle/4.0/curve25519-mul.c /usr/src/debug/nettle/4.0/rsa-md5-verify.c /usr/src/debug/nettle/4.0/rsa.h /usr/src/debug/nettle/4.0/sha256-compress-n.s /usr/src/debug/nettle/4.0/yarrow256.c /usr/src/debug/nettle/4.0/rsa.c /usr/src/debug/nettle/4.0/gcm-camellia256.c /usr/src/debug/nettle/4.0/twofish-meta.c /usr/src/debug/nettle/4.0/hmac-streebog.c /usr/src/debug/nettle/4.0/xts.c /usr/src/debug/nettle/4.0/xts.h /usr/src/debug/nettle/4.0/des3.c /usr/src/debug/nettle/4.0/ecc-add-thh.c /usr/src/debug/nettle/4.0/camellia-absorb.c /usr/src/debug/nettle/4.0/pbkdf2-hmac-gosthash94.c /usr/src/debug/nettle/4.0/testsuite/curve25519-dh-test.c /usr/src/debug/nettle/4.0/ecc-mul-g-eh.c /usr/src/debug/nettle/4.0/rsa-decrypt-tr.c /usr/src/debug/nettle/4.0/salsa20-set-key.c /usr/src/debug/nettle/4.0/testsuite/base64-test.c /usr/src/debug/nettle/4.0/gost28147.c /usr/src/debug/nettle/4.0/dsa-verify.c /usr/sr
 c/debug/nettle/4.0/rsa-verify.c /usr/src/debug/nettle/4.0/write-be32.c /usr/src/debug/nettle/4.0/poly1305-blocks.s /usr/src/debug/nettle/4.0/eddsa-expand.c /usr/src/debug/nettle/4.0/ecc-gost-gc512a.c /usr/src/debug/nettle/4.0/ecc-gost-gc512a.h /usr/src/debug/nettle/4.0/testsuite/poly1305-test.c /usr/src/debug/nettle/4.0/ecdsa-verify.c /usr/src/debug/nettle/4.0/eddsa-verify.c /usr/src/debug/nettle/4.0/ecc-mul-m.c /usr/src/debug/nettle/4.0/ccm.c /usr/src/debug/nettle/4.0/testsuite/base16-test.c /usr/src/debug/nettle/4.0/sha3-512-meta.c /usr/src/debug/nettle/4.0/testsuite/gostdsa-vko-test.c /usr/src/debug/nettle/4.0/ccm.h /usr/src/debug/nettle/4.0/testsuite/cmac-test.c /usr/src/debug/nettle/4.0/testsuite/des3-test.c /usr/src/debug/nettle/4.0/testsuite/ecdh-test.c /usr/src/debug/nettle/4.0/testsuite/hkdf-test.c /usr/src/debug/nettle/4.0/testsuite/hmac-test.c /usr/src/debug/nettle/4.0/testsuite/sexp-test.c /usr/src/debug/nettle/4.0/testsuite/sha1-test.c /usr/src/debug/nettle/4.0/testsuit
 e/umac-test.c /usr/src/debug/nettle/4.0/umac-l2.c /usr/src/debug/nettle/4.0/des.c /usr/src/debug/nettle/4.0/des.h /usr/src/debug/nettle/4.0/ecdsa-keygen.c /usr/src/debug/nettle/4.0/sha1-compress-2.s /usr/src/debug/nettle/4.0/ecc-size.c /usr/src/debug/nettle/4.0/slh-dsa-shake-128s.c /usr/src/debug/nettle/4.0/ecc-a-to-j.c /usr/src/debug/nettle/4.0/aes128-decrypt.c /usr/src/debug/nettle/4.0/aes192-decrypt.c /usr/src/debug/nettle/4.0/aes256-decrypt.c /usr/src/debug/nettle/4.0/rsa-sha1-sign-tr.c /usr/src/debug/nettle/4.0/cbc-aes128-encrypt-2.s /usr/src/debug/nettle/4.0/cbc-aes192-encrypt-2.s /usr/src/debug/nettle/4.0/ecc-curve.h /usr/src/debug/nettle/4.0/ecc-curve25519.h /usr/src/debug/nettle/4.0/rsa-sign-tr.c /usr/src/debug/nettle/4.0/testsuite/arcfour-test.c /usr/src/debug/nettle/4.0/pbkdf2-hmac-sha384.c /usr/src/debug/nettle/4.0/ecc-gostdsa-sign.c /usr/src/debug/nettle/4.0/testsuite/rsa-sec-decrypt-test.c /usr/src/debug/nettle/4.0/ecc-curve25519.c /usr/src/debug/nettle/4.0/testsuite/p
 kcs1-sec-decrypt-test.c /usr/src/debug/nettle/4.0/testsuite/ecc-sqrt-test.c /usr/src/debug/nettle/4.0/rsa-sec-compute-root.c /usr/src/debug/nettle/4.0/ecc-mul-a-eh.c /usr/src/debug/nettle/4.0/arctwo.h /usr/src/debug/nettle/4.0/memops.h /usr/src/debug/nettle/4.0/memxor.h /usr/src/debug/nettle/4.0/pbkdf2.h /usr/src/debug/nettle/4.0/rotors.h /usr/src/debug/nettle/4.0/yarrow.h /usr/src/debug/nettle/4.0/chacha.h /usr/src/debug/nettle/4.0/config.h /usr/src/debug/nettle/4.0/getopt.h /usr/src/debug/nettle/4.0/sha512.c /usr/src/debug/nettle/4.0/umac32.c /usr/src/debug/nettle/4.0/umac64.c /usr/src/debug/nettle/4.0/umac96.c /usr/src/debug/nettle/4.0/getopt.c /usr/src/debug/nettle/4.0/arctwo.c /usr/src/debug/nettle/4.0/bignum.c /usr/src/debug/nettle/4.0/buffer.c /usr/src/debug/nettle/4.0/cmac64.c /usr/src/debug/nettle/4.0/ecc-gostdsa-verify.c /usr/src/debug/nettle/4.0/testsuite/ecc-redc-test.c /usr/src/debug/nettle/4.0/umac-poly128.c /usr/src/debug/nettle/4.0/ccm-aes192.c /usr/src/debug/nettle/
 4.0/memxor.s /usr/src/debug/nettle/4.0/testsuite/curve448-dh-test.c"
packages/x86-64-v3-poky-linux/nettle/nettle-src: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-src: PKGSIZE changed from 4705071 to 4691781 (-0%)
packages/x86-64-v3-poky-linux/nettle/nettle-src: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle-staticdev: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle-staticdev: PKGV changed from 3.10.2 [default] to 4.0 [default]
packages/x86-64-v3-poky-linux/nettle/nettle: FILELIST: removed "/usr/lib/libnettle.so.8 /usr/lib/libhogweed.so.6.11 /usr/lib/libhogweed.so.6 /usr/lib/libnettle.so.8.11", added "/usr/lib/libnettle.so.9 /usr/lib/libhogweed.so.7.0 /usr/lib/libnettle.so.9.0 /usr/lib/libhogweed.so.7"
packages/x86-64-v3-poky-linux/nettle/nettle: PV changed from "3.10.2" to "4.0"
packages/x86-64-v3-poky-linux/nettle/nettle: PKGSIZE changed from 676083 to 676081 (-0%)
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

--===============7682813197581868305==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nettle-upgrade-3.10.2-4.0.patch"

RnJvbSA3YWJmMmQzMTZjMTA1MjA4MzQ5NzJhNzk3N2YwMzc4MTBiZjgxMjc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNToxMzoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5l
dHRsZTogdXBncmFkZSAzLjEwLjIgLT4gNC4wCgotLS0KIC4uLmdldC10by1vbmx5LWJ1aWxkLXRl
c3RzLW5vdC1ydW4tdGhlbS5wYXRjaCB8IDEwICsrLS0KIC4uLmRlci1maWxlcy1vZi1vcGVuc3Ns
LW9ubHktaWYtZW5hYmxlXy5wYXRjaCB8ICA2ICstLQogLi4uL3tuZXR0bGVfMy4xMC4yLmJiID0+
IG5ldHRsZV80LjAuYmJ9ICAgICAgIHwgNDggKysrKysrKysrKysrKysrKystLQogMyBmaWxlcyBj
aGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9uZXR0bGUve25ldHRsZV8zLjEwLjIuYmIgPT4gbmV0dGxlXzQuMC5iYn0g
KDU3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZXR0bGUvbmV0dGxlL0Fk
ZC10YXJnZXQtdG8tb25seS1idWlsZC10ZXN0cy1ub3QtcnVuLXRoZW0ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9uZXR0bGUvbmV0dGxlL0FkZC10YXJnZXQtdG8tb25seS1idWlsZC10ZXN0
cy1ub3QtcnVuLXRoZW0ucGF0Y2gKaW5kZXggZWUzZTc0YzQzYi4uY2U2ZWIwNjUzMCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmV0dGxlL25ldHRsZS9BZGQtdGFyZ2V0LXRvLW9u
bHktYnVpbGQtdGVzdHMtbm90LXJ1bi10aGVtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L25ldHRsZS9uZXR0bGUvQWRkLXRhcmdldC10by1vbmx5LWJ1aWxkLXRlc3RzLW5vdC1ydW4t
dGhlbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2VhM2VhZjViZGEyMTUyOWZjOGE4ZGEz
ZDhiMDdlYmMzODc1YmE3ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDFlZmE2OWVi
Y2U3MGY0MTcxYTYzZGE2ZGM0MDdkZjg0OWY3NGMxNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+CiBEYXRlOiBGcmks
IDIgQXVnIDIwMjQgMDk6NDg6NDMgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZWZpbGUuaW46
IEFkZCB0YXJnZXQgdG8gb25seSBidWlsZCB0ZXN0cyAobm90IHJ1biB0aGVtKQpAQCAtMjEsMTAg
KzIxLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBh
L01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWluZGV4IDcxYWQ3NjEuLjBmMjM5ZjQgMTAwNjQ0
CitpbmRleCA5Mzk5OTg1Li40ZDQwNDZlIDEwMDY0NAogLS0tIGEvTWFrZWZpbGUuaW4KICsrKyBi
L01ha2VmaWxlLmluCi1AQCAtNTMsNiArNTMsOSBAQCBjbGVhbiBkaXN0Y2xlYW4gbW9zdGx5Y2xl
YW4gbWFpbnRhaW5lci1jbGVhbiB0YWdzOgorQEAgLTU2LDYgKzU2LDkgQEAgY2xlYW4gZGlzdGNs
ZWFuIG1vc3RseWNsZWFuIG1haW50YWluZXItY2xlYW4gdGFnczoKICAJICBlY2hvICJNYWtpbmcg
JEAgaW4gJCRkIiA7IChjZCAkJGQgJiYgJChNQUtFKSAkQCk7IGRvbmUKICAJJChNQUtFKSAkQC1o
ZXJlCiAgCkBAIC0zNSwxMCArMzUsMTAgQEAgaW5kZXggNzFhZDc2MS4uMGYyMzlmNCAxMDA2NDQK
ICAJdHJ1ZQogIAogZGlmZiAtLWdpdCBhL3Rlc3RzdWl0ZS9NYWtlZmlsZS5pbiBiL3Rlc3RzdWl0
ZS9NYWtlZmlsZS5pbgotaW5kZXggMDY5OWZhMC4uOGFjOTk4MyAxMDA2NDQKK2luZGV4IGIyZjA1
MTguLmM5M2I5YjYgMTAwNjQ0CiAtLS0gYS90ZXN0c3VpdGUvTWFrZWZpbGUuaW4KICsrKyBiL3Rl
c3RzdWl0ZS9NYWtlZmlsZS5pbgotQEAgLTEzNyw2ICsxMzcsOCBAQCAkKFRBUkdFVFMpICQoRVhU
UkFfVEFSR0VUUyk6IHRlc3R1dGlscy4kKE9CSkVYVCkgLi4vbm9uLW5ldHRsZS4kKE9CSkVYVCkg
XAorQEAgLTE0NCw2ICsxNDQsOCBAQCAkKFRBUkdFVFMpICQoRVhUUkFfVEFSR0VUUyk6IHRlc3R1
dGlscy4kKE9CSkVYVCkgLi4vbm9uLW5ldHRsZS4kKE9CSkVYVCkgXAogICMgZGF0YS4KICBWQUxH
UklORCA9IHZhbGdyaW5kIC0tZXJyb3ItZXhpdGNvZGU9MSAtLWxlYWstY2hlY2s9ZnVsbCAtLXNo
b3ctcmVhY2hhYmxlPXllcyBASUZfQVNNQCAtLXBhcnRpYWwtbG9hZHMtb2s9eWVzCiAgCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZXR0bGUvbmV0dGxlL2NoZWNrLWhlYWRlci1m
aWxlcy1vZi1vcGVuc3NsLW9ubHktaWYtZW5hYmxlXy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L25ldHRsZS9uZXR0bGUvY2hlY2staGVhZGVyLWZpbGVzLW9mLW9wZW5zc2wtb25seS1pZi1l
bmFibGVfLnBhdGNoCmluZGV4IDg5YjVjN2JlYzQuLjhlYjBlYWMxYzkgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L25ldHRsZS9uZXR0bGUvY2hlY2staGVhZGVyLWZpbGVzLW9mLW9w
ZW5zc2wtb25seS1pZi1lbmFibGVfLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25l
dHRsZS9uZXR0bGUvY2hlY2staGVhZGVyLWZpbGVzLW9mLW9wZW5zc2wtb25seS1pZi1lbmFibGVf
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlYzJjYTdlNTA1ZTZiZmUxZmZmMmE3ZDZlNmJi
MzliNjBiOTNlMTlhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyZGEwNWU3MWYwNGNk
MzQ0NjgyMTQ5ZDAyODRmYWRjY2ZiMjIyZWJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSGFpcWluZyBCYWkgPEhhaXFpbmcuQmFpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBGcmksIDkg
RGVjIDIwMTYgMTU6MjM6MTcgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbmV0dGxlOiBjaGVjayBo
ZWFkZXIgZmlsZXMgb2Ygb3BlbnNzbCBvbmx5IGlmCkBAIC0yMywxMCArMjMsMTAgQEAgU2lnbmVk
LW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEv
Y29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCA3YzAwM2JiLi43NzlmN2ZmIDEwMDY0
NAoraW5kZXggYWYwMTdkOC4uOTI5NGUyNCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysr
IGIvY29uZmlndXJlLmFjCi1AQCAtMTk3LDkgKzE5NywxMSBAQCBBQ19UWVBFX1NJWkVfVAorQEAg
LTE3Nyw5ICsxNzcsMTEgQEAgQUNfVFlQRV9TSVpFX1QKICBBQ19DSEVDS19TSVpFT0YobG9uZykK
ICBBQ19DSEVDS19TSVpFT0Yoc2l6ZV90KQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmV0dGxlL25ldHRsZV8zLjEwLjIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZXR0
bGUvbmV0dGxlXzQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDU3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9uZXR0bGUvbmV0dGxlXzMuMTAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbmV0dGxlL25ldHRsZV80LjAuYmIKaW5kZXggN2I3YmU1ZjU5NC4uMzg0ZDk0
NjgwMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmV0dGxlL25ldHRsZV8zLjEw
LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmV0dGxlL25ldHRsZV80LjAuYmIKQEAg
LTEsMyArMSw0NCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUg
YmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRo
ZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisj
IFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXpl
IHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRl
OicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBk
YXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcuTEVTU0VSdjMKKyMg
KysrIENPUFlJTkcuTEVTU0VSdjMKKyMgQEAgLTEsNyArMSw3IEBACisjIC0JCSAgIEdOVSBMRVNT
RVIgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyArICAgICAgICAgICAgICAgICAgIEdOVSBMRVNT
RVIgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAgICAgICAgICAgICAgICAgICAgICAgICBWZXJz
aW9uIDMsIDI5IEp1bmUgMjAwNworIyAgCisjIC0gQ29weXJpZ2h0IChDKSAyMDA3IEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbiwgSW5jLiA8aHR0cDovL2ZzZi5vcmcvPgorIyArIENvcHlyaWdodCAo
QykgMjAwNyBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4gPGh0dHBzOi8vZnNmLm9yZy8+
CisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0
aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcgaXQg
aXMgbm90IGFsbG93ZWQuCisjICAKKyMgQEAgLTEwLDcgKzEwLDcgQEAKKyMgIHRoZSB0ZXJtcyBh
bmQgY29uZGl0aW9ucyBvZiB2ZXJzaW9uIDMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYworIyAg
TGljZW5zZSwgc3VwcGxlbWVudGVkIGJ5IHRoZSBhZGRpdGlvbmFsIHBlcm1pc3Npb25zIGxpc3Rl
ZCBiZWxvdy4KKyMgIAorIyAtICAwLiBBZGRpdGlvbmFsIERlZmluaXRpb25zLiAKKyMgKyAgMC4g
QWRkaXRpb25hbCBEZWZpbml0aW9ucy4KKyMgIAorIyAgICBBcyB1c2VkIGhlcmVpbiwgInRoaXMg
TGljZW5zZSIgcmVmZXJzIHRvIHZlcnNpb24gMyBvZiB0aGUgR05VIExlc3NlcgorIyAgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSwgYW5kIHRoZSAiR05VIEdQTCIgcmVmZXJzIHRvIHZlcnNpb24gMyBv
ZiB0aGUgR05VCisjIEBAIC0xMTEsNyArMTExLDcgQEAKKyMgICAgICAgICBhIGNvcHkgb2YgdGhl
IExpYnJhcnkgYWxyZWFkeSBwcmVzZW50IG9uIHRoZSB1c2VyJ3MgY29tcHV0ZXIKKyMgICAgICAg
ICBzeXN0ZW0sIGFuZCAoYikgd2lsbCBvcGVyYXRlIHByb3Blcmx5IHdpdGggYSBtb2RpZmllZCB2
ZXJzaW9uCisjICAgICAgICAgb2YgdGhlIExpYnJhcnkgdGhhdCBpcyBpbnRlcmZhY2UtY29tcGF0
aWJsZSB3aXRoIHRoZSBMaW5rZWQKKyMgLSAgICAgICBWZXJzaW9uLiAKKyMgKyAgICAgICBWZXJz
aW9uLgorIyAgCisjICAgICBlKSBQcm92aWRlIEluc3RhbGxhdGlvbiBJbmZvcm1hdGlvbiwgYnV0
IG9ubHkgaWYgeW91IHdvdWxkIG90aGVyd2lzZQorIyAgICAgYmUgcmVxdWlyZWQgdG8gcHJvdmlk
ZSBzdWNoIGluZm9ybWF0aW9uIHVuZGVyIHNlY3Rpb24gNiBvZiB0aGUKKyMgCisjCisKIFNVTU1B
UlkgPSAiQSBsb3cgbGV2ZWwgY3J5cHRvZ3JhcGhpYyBsaWJyYXJ5IgogREVTQ1JJUFRJT04gPSAi
TmV0dGxlIGlzIGEgY3J5cHRvZ3JhcGhpYyBsaWJyYXJ5IHRoYXQgaXMgZGVzaWduZWQgdG8gZml0
IGVhc2lseSBpbiBtb3JlIG9yIGxlc3MgYW55IGNvbnRleHQ6IEluIGNyeXB0byB0b29sa2l0cyBm
b3Igb2JqZWN0LW9yaWVudGVkIGxhbmd1YWdlcyAoQysrLCBQeXRob24sIFBpa2UsIC4uLiksIGlu
IGFwcGxpY2F0aW9ucyBsaWtlIExTSCBvciBHTlVQRywgb3IgZXZlbiBpbiBrZXJuZWwgc3BhY2Uu
IgogSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5seXNhdG9yLmxpdS5zZS9+bmlzc2UvbmV0dGxlLyIK
QEAgLTcsMTAgKzQ4LDExIEBAIGNvbnRleHQtaW5kZXBlbmRlbnQgc2V0IG9mIGNyeXB0b2dyYXBo
aWMgYWxnb3JpdGhtcyIKIFNFQ1RJT04gPSAibGlicyIKIExJQ0VOU0UgPSAiTEdQTC0zLjAtb3It
bGF0ZXIgfCBHUEwtMi4wLW9yLWxhdGVyIgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HLkxFU1NFUnYzO21kNT02YTZhOGUwMjA4MzhiMjM0MDZjODFiMTljMWQ0NmRmNiBcCitM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLkxFU1NFUnYzO21kNT0zMDAwMjA4ZDUz
OWVjMDYxYjg5OWJjZTFkOWNlOTQwNCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZ
SU5HdjI7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwKICAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL3NlcnBlbnQtZGVjcnlwdC5jO2JlZ2lubGluZT0xNDtlbmRsaW5lPTM2
O21kNT1jYTBkMjIwYmM0MTNlMTg0MmVjYzUwNzY5MGNlNDE2ZSBcCi0gICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9zZXJwZW50LXNldC1rZXkuYztiZWdpbmxpbmU9MTQ7ZW5kbGluZT0zNjttZDU9
Y2EwZDIyMGJjNDEzZTE4NDJlY2M1MDc2OTBjZTQxNmUiCisgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9zZXJwZW50LXNldC1rZXkuYztiZWdpbmxpbmU9MTQ7ZW5kbGluZT0zNjttZDU9Y2EwZDIy
MGJjNDEzZTE4NDJlY2M1MDc2OTBjZTQxNmUgXAorICAgICAgICAgICAgICAgICAgICAiCiAKIERF
UEVORFMgKz0gImdtcCIKIApAQCAtMjAsNyArNjIsNyBAQCBTUkNfVVJJID0gIiR7R05VX01JUlJP
Un0vJHtCUE59LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9jaGVjay1oZWFkZXIt
ZmlsZXMtb2Ytb3BlbnNzbC1vbmx5LWlmLWVuYWJsZV8ucGF0Y2ggXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZTlmZjUxY2IxZjJhYmI1ZTY1YTZiOGMxMGE5MmRhMGFi
NWFiNmVhZjI2ZTdmYzJiNjc1YzQ1ZjFmYjUxOWI1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNh
ZGRiYzAwZGEwMTg0NmIyMzJmYjNiYzQ1MzUzOGVhNTQ2OGRhNDMwMzNmMjFiYjM0NWNiMWU5MDcz
ZjUwOTQiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIm5ldHRsZS0oP1A8cHZlcj5cZCsoXC5c
ZCspKylcLnRhciIKIAotLSAKMi40Ny4xCgo=

--===============7682813197581868305==--

