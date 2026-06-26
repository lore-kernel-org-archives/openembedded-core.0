Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C654CDE012
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:11:47 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29410.1782454300364068855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e9zd44HZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pzEU3aVH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019f028e2b97-6e78bd2a-8ea1-472e-8b0a-5d1bed1fe3e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782454299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lHc8actBxpKm8zApoLhwn5Y5I5+Sz9MuqUJtuB5L724=;
	b=e9zd44HZwxc5WarVw+GU984D0nAKhTc04Kmvfrzcx2b409IjVMD6/v2yAze48E5I
	M+6cErwICTfdwR/ymewt7i+7Sl5RBGQFHzMOD47aaGOpzaorj7fghhIlluJDUCnNkPZ
	ClrE4vMjCzeos56kkHourMQqGSoFjvjJNhdR7mFU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782454299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lHc8actBxpKm8zApoLhwn5Y5I5+Sz9MuqUJtuB5L724=;
	b=pzEU3aVHYGLgm0I5haMtaAGb6ysqNjSoNKdPuwSm3CIDuSze1H5gA2Xj6JETsYc8
	pl93fKLvXHTaCmceb5bD0JsrHB1x89I2pS5/BD+jAkckHqADneWR4f4dLesdLxnsZoQ
	oFjkdTtW+TUW8G7XIo/AakEylHT47GsrvYQRCEwk=
Content-Type: multipart/mixed; boundary="===============1459186160942429412=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 2.1.1 SUCCEEDED
Message-ID: <0101019f028e2b97-6e78bd2a-8ea1-472e-8b0a-5d1bed1fe3e4-000000@us-west-2.amazonses.com>
Date: Fri, 26 Jun 2026 06:11:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.26-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239600

--===============1459186160942429412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gpgme* to *2.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gpgme-upgrade-2.1.0-2.1.1.patch
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
From 5f37921aa2837e5954c76954ca26d719673df170 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 26 Jun 2026 06:11:32 +0000
Subject: [PATCH] gpgme: upgrade 2.1.0 -> 2.1.1

---
 ...e-gpgme.m4-use-gpgrt-config-with-.pc.patch | 11 +++-----
 ...autogen.sh-remove-unknown-in-version.patch |  6 ++---
 .../gpgme/gpgme/0001-pkgconfig.patch          | 17 ++++++-------
 ...ix-io.c-Use-off_t-instead-of-off64_t.patch |  4 +--
 ...se-closefrom-on-linux-and-glibc-2.34.patch |  6 ++---
 ...p-all-lib-or-usr-lib-directories-in-.patch |  2 +-
 .../gpgme/{gpgme_2.1.0.bb => gpgme_2.1.1.bb}  | 25 +++++++++++++++++--
 7 files changed, 43 insertions(+), 28 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_2.1.0.bb => gpgme_2.1.1.bb} (74%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 4b8d1ceecd..75c985af1c 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From 6ad1ac8c03ae3acc0539fc1566070e2468c7df0a Mon Sep 17 00:00:00 2001
+From 183cbb40f406b73c69c3c8aa4d82943f145ad664 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 14 Oct 2025 14:12:55 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 46 deletions(-)
 
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index acbfc1c..5f689e1 100644
+index 5fbb5db..13b43a4 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
 @@ -122,24 +122,10 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
@@ -77,7 +77,7 @@ index acbfc1c..5f689e1 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -370,11 +348,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -371,11 +349,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],[
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
@@ -90,7 +90,7 @@ index acbfc1c..5f689e1 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -383,20 +357,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -384,20 +358,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],[
       fi
    fi
    if test $ok = yes; then
@@ -113,6 +113,3 @@ index acbfc1c..5f689e1 100644
      AC_MSG_RESULT(yes)
      ifelse([$2], , :, [$2])
      _AM_PATH_GPGME_CONFIG_HOST_CHECK
--- 
-2.34.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
index 890909dd5e..87b055ce73 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 0bb7fddb6a768bbc46695de4c6e0256a3580ccbb Mon Sep 17 00:00:00 2001
+From b4bdcc72a2afadc597ab045ea1cdaf253e28b95d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 26 Nov 2024 23:23:42 -0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
@@ -20,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 9f91297..9f7559b 100755
+index 71f89e2..6b407e2 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -271,7 +271,7 @@ if [ "$myhost" = "find-version" ]; then
+@@ -286,7 +286,7 @@ if [ "$myhost" = "find-version" ]; then
      else
        ingit=no
        beta=yes
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 67b65157d1..226e705661 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 4b4e6fc898dd249387bbed4924fa22c1c494327a Mon Sep 17 00:00:00 2001
+From 1167f41361639063eb3a562ca255d00d8074b89c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 21 Jul 2025 12:43:29 +0800
 Subject: [PATCH] pkgconfig
@@ -29,10 +29,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index d4dcb1c..293fcc2 100644
+index ddc73c5..e01e5d3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -844,6 +844,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -845,6 +845,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme.pc
                  src/gpgme-glib.pc
                  src/gpgme.h)
@@ -41,7 +41,7 @@ index d4dcb1c..293fcc2 100644
  AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpgme.asd])
  AC_CONFIG_FILES([lang/js/Makefile lang/js/src/Makefile
 diff --git a/src/Makefile.am b/src/Makefile.am
-index edc239b..d427044 100644
+index 4f45dfe..3c49190 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
@@ -80,7 +80,7 @@ index 0000000..074bbf6
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 5f689e1..249e8c9 100644
+index 13b43a4..851e866 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
 @@ -166,7 +166,6 @@ dnl is added to the gpg_config_script_warn variable.
@@ -225,7 +225,7 @@ index 5f689e1..249e8c9 100644
  ])
  
  
-@@ -319,36 +249,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -320,36 +250,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],[
       min_gpgme_version="$tmp"
    fi
  
@@ -264,7 +264,7 @@ index 5f689e1..249e8c9 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -357,17 +263,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -358,17 +264,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],[
       fi
    fi
    if test $ok = yes; then
@@ -295,6 +295,3 @@ index 9ddef5c..932645b 100644
 +Cflags: -I${includedir}
 +Libs: -L${libdir} -lgpgme
  URL: https://www.gnupg.org/software/gpgme/index.html
--- 
-2.34.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
index 932fb9c962..3f47e7c10c 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -1,4 +1,4 @@
-From 417036051c84b02fe43f162ee378278a44636451 Mon Sep 17 00:00:00 2001
+From c44a35dcf7f28a469afb8213dabebc6208887bfd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 08:44:13 -0800
 Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/posix-io.c b/src/posix-io.c
-index 0d0a98b..286a626 100644
+index 4dee776..3b99500 100644
 --- a/src/posix-io.c
 +++ b/src/posix-io.c
 @@ -74,8 +74,8 @@
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
index ed2edabd63..ee91a4386b 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From aaed03b76505b1feaeeb5a4a3c6bdcc7dd089f01 Mon Sep 17 00:00:00 2001
+From b12054eff9cb13dea3e9654b20f7aafc47ae991d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Jul 2021 12:33:13 -0700
 Subject: [PATCH] use closefrom() on linux and glibc 2.34+
@@ -13,10 +13,10 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/posix-io.c b/src/posix-io.c
-index a422d8f..0d0a98b 100644
+index f8196f9..4dee776 100644
 --- a/src/posix-io.c
 +++ b/src/posix-io.c
-@@ -577,7 +577,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+@@ -599,7 +599,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
                if (fd_list[i].fd > fd)
                  fd = fd_list[i].fd;
              fd++;
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index c021e48be9..f9ec317f84 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From 9ea685f1b898ee703b85b705c35b9cbd77cca17f Mon Sep 17 00:00:00 2001
+From 6a6907224574cb7269de2bd45cd4c5d2e53ed1c1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
 Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
diff --git a/meta/recipes-support/gpgme/gpgme_2.1.0.bb b/meta/recipes-support/gpgme/gpgme_2.1.1.bb
similarity index 74%
rename from meta/recipes-support/gpgme/gpgme_2.1.0.bb
rename to meta/recipes-support/gpgme/gpgme_2.1.1.bb
index 269070b10b..956e988336 100644
--- a/meta/recipes-support/gpgme/gpgme_2.1.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.1.1.bb
@@ -1,3 +1,24 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- src/gpgme.h.in
+# +++ src/gpgme.h.in
+# @@ -1,6 +1,6 @@
+#  /* gpgme.h - Public interface to GnuPG Made Easy.                   -*- c -*-
+#   * Copyright (C) 2000 Werner Koch (dd9jn)
+# - * Copyright (C) 2001-2025 g10 Code GmbH
+# + * Copyright (C) 2001-2026 g10 Code GmbH
+#   *
+#   * This file is part of GPGME.
+#   *
+# 
+#
+
 SUMMARY = "High-level GnuPG encryption/signing API"
 DESCRIPTION = "GnuPG Made Easy (GPGME) is a library designed to make access to GnuPG easier for applications. It provides a High-Level Crypto API for encryption, decryption, signing, signature verification and key management"
 HOMEPAGE = "http://www.gnupg.org/gpgme.html"
@@ -9,7 +30,7 @@ LICENSE:${PN}-tool = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=c0d051fa63f5a5514f4ab190d7ca495e \
+                    file://src/gpgme.h.in;endline=23;md5=3b8e9a6fe45f4aef6306036aa21d3b89 \
                     file://src/engine.h;endline=21;md5=f58f7a0b6488edae41b925ac9c890068 \
                     file://src/gpgme-tool.c;endline=21;md5=66c5381e0e05475792e24982d15e7ce8 \
                     "
@@ -24,7 +45,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "841c5ea53fc26259f4fbf0e8bde982dea1b8a1ca0cb77e681c82b050566bf92b"
+SRC_URI[sha256sum] = "6d7ee12b209d7dce75468db53f72a90e1ad3d21f4c304ef2c002612a52f5333a"
 
 DEPENDS = "libgpg-error-native libgpg-error libassuan"
 
-- 
2.47.1


--===============1459186160942429412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.1.0", added "/usr/lib/libgpgme.so.45.1.1"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.1.0 to libgpgme.so.45.1.1
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.1.0 to libgpgme.so.45.1.1
  /usr/lib/libgpgme.so.45.1.0 moved to /usr/lib/libgpgme.so.45.1.1
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.8.0.0 to libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8.0.0 moved to /usr/lib/libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8 moved to /usr/lib/libpkgconf.so.7
  /usr/bin/spdxtool was removed

--===============1459186160942429412==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-2.1.0-2.1.1.patch"

RnJvbSA1ZjM3OTIxYWEyODM3ZTU5NTRjNzY5NTRjYTI2ZDcxOTY3M2RmMTcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjYgSnVuIDIwMjYgMDY6MTE6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
cGdtZTogdXBncmFkZSAyLjEuMCAtPiAyLjEuMQoKLS0tCiAuLi5lLWdwZ21lLm00LXVzZS1ncGdy
dC1jb25maWctd2l0aC0ucGMucGF0Y2ggfCAxMSArKystLS0tLQogLi4uYXV0b2dlbi5zaC1yZW1v
dmUtdW5rbm93bi1pbi12ZXJzaW9uLnBhdGNoIHwgIDYgKystLS0KIC4uLi9ncGdtZS9ncGdtZS8w
MDAxLXBrZ2NvbmZpZy5wYXRjaCAgICAgICAgICB8IDE3ICsrKysrKy0tLS0tLS0KIC4uLml4LWlv
LmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5wYXRjaCB8ICA0ICstLQogLi4uc2UtY2xv
c2Vmcm9tLW9uLWxpbnV4LWFuZC1nbGliYy0yLjM0LnBhdGNoIHwgIDYgKystLS0KIC4uLnAtYWxs
LWxpYi1vci11c3ItbGliLWRpcmVjdG9yaWVzLWluLS5wYXRjaCB8ICAyICstCiAuLi4vZ3BnbWUv
e2dwZ21lXzIuMS4wLmJiID0+IGdwZ21lXzIuMS4xLmJifSAgfCAyNSArKysrKysrKysrKysrKysr
Ky0tCiA3IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL3tncGdtZV8yLjEuMC5iYiA9PiBncGdt
ZV8yLjEuMS5iYn0gKDc0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdt
ZS9ncGdtZS8wMDAxLVJldmVydC1idWlsZC1NYWtlLWdwZ21lLm00LXVzZS1ncGdydC1jb25maWct
d2l0aC0ucGMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLVJl
dmVydC1idWlsZC1NYWtlLWdwZ21lLm00LXVzZS1ncGdydC1jb25maWctd2l0aC0ucGMucGF0Y2gK
aW5kZXggNGI4ZDFjZWVjZC4uNzVjOTg1YWYxYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1SZXZlcnQtYnVpbGQtTWFrZS1ncGdtZS5tNC11c2UtZ3Bn
cnQtY29uZmlnLXdpdGgtLnBjLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21l
L2dwZ21lLzAwMDEtUmV2ZXJ0LWJ1aWxkLU1ha2UtZ3BnbWUubTQtdXNlLWdwZ3J0LWNvbmZpZy13
aXRoLS5wYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmFkMWFjOGMwM2FlM2FjYzA1Mzlm
YzE1NjYwNzBlMjQ2OGM3ZGYwYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTgzY2Ji
NDBmNDA2YjczYzY5YzNjOGFhNGQ4Mjk0M2YxNDVhZDY2NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1
ZSwgMTQgT2N0IDIwMjUgMTQ6MTI6NTUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gUmV2ZXJ0ICJi
dWlsZDogTWFrZSBncGdtZS5tNCB1c2UgZ3BncnQtY29uZmlnIHdpdGggKi5wYy4iCkBAIC0xNSw3
ICsxNSw3IEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVy
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL3NyYy9ncGdtZS5tNCBiL3NyYy9ncGdtZS5tNAotaW5kZXggYWNiZmMx
Yy4uNWY2ODllMSAxMDA2NDQKK2luZGV4IDVmYmI1ZGIuLjEzYjQzYTQgMTAwNjQ0CiAtLS0gYS9z
cmMvZ3BnbWUubTQKICsrKyBiL3NyYy9ncGdtZS5tNAogQEAgLTEyMiwyNCArMTIyLDEwIEBAIEFD
X1JFUVVJUkUoW19BTV9QQVRIX0dQR1JUX0NPTkZJR10pZG5sCkBAIC03Nyw3ICs3Nyw3IEBAIGlu
ZGV4IGFjYmZjMWMuLjVmNjg5ZTEgMTAwNjQ0CiAgICAgICAgICBpZiB0ZXN0ICIkdG1wIiAtZ3Qg
MCA7IHRoZW4KICAgICAgICAgICAgIGlmIHRlc3QgIiRyZXFfZ3BnbWVfYXBpIiAtbmUgIiR0bXAi
IDsgdGhlbgogICAgICAgICAgICAgICBvaz1ubwotQEAgLTM3MCwxMSArMzQ4LDcgQEAgQUNfREVG
VU4oW0FNX1BBVEhfR1BHTUVfR0xJQl0sCitAQCAtMzcxLDExICszNDksNyBAQCBBQ19ERUZVTihb
QU1fUEFUSF9HUEdNRV9HTElCXSxbCiAgICAgICAjIElmIHdlIGhhdmUgYSByZWNlbnQgR1BHTUUs
IHdlIHNob3VsZCBhbHNvIGNoZWNrIHRoYXQgdGhlCiAgICAgICAjIEFQSSBpcyBjb21wYXRpYmxl
LgogICAgICAgaWYgdGVzdCAiJHJlcV9ncGdtZV9hcGkiIC1ndCAwIDsgdGhlbgpAQCAtOTAsNyAr
OTAsNyBAQCBpbmRleCBhY2JmYzFjLi41ZjY4OWUxIDEwMDY0NAogICAgICAgICAgaWYgdGVzdCAi
JHRtcCIgLWd0IDAgOyB0aGVuCiAgICAgICAgICAgICBpZiB0ZXN0ICIkcmVxX2dwZ21lX2FwaSIg
LW5lICIkdG1wIiA7IHRoZW4KICAgICAgICAgICAgICAgb2s9bm8KLUBAIC0zODMsMjAgKzM1Nyw4
IEBAIEFDX0RFRlVOKFtBTV9QQVRIX0dQR01FX0dMSUJdLAorQEAgLTM4NCwyMCArMzU4LDggQEAg
QUNfREVGVU4oW0FNX1BBVEhfR1BHTUVfR0xJQl0sWwogICAgICAgZmkKICAgIGZpCiAgICBpZiB0
ZXN0ICRvayA9IHllczsgdGhlbgpAQCAtMTEzLDYgKzExMywzIEBAIGluZGV4IGFjYmZjMWMuLjVm
Njg5ZTEgMTAwNjQ0CiAgICAgIEFDX01TR19SRVNVTFQoeWVzKQogICAgICBpZmVsc2UoWyQyXSwg
LCA6LCBbJDJdKQogICAgICBfQU1fUEFUSF9HUEdNRV9DT05GSUdfSE9TVF9DSEVDSwotLS0gCi0y
LjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAw
MS1hdXRvZ2VuLnNoLXJlbW92ZS11bmtub3duLWluLXZlcnNpb24ucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4t
dmVyc2lvbi5wYXRjaAppbmRleCA4OTA5MDlkZDVlLi44N2IwNTVjZTczIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLWF1dG9nZW4uc2gtcmVtb3ZlLXVu
a25vd24taW4tdmVyc2lvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9n
cGdtZS8wMDAxLWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gMGJiN2ZkZGI2YTc2OGJiYzQ2Njk1ZGU0YzZlMDI1NmEzNTgwY2Ni
YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjRiZGNjNzJhMmFmYWRjNTk3YWIwNDVl
YTFjZGFmMjUzZTI4Yjk1ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBK
aWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjYgTm92IDIwMjQgMjM6
MjM6NDIgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXV0b2dlbi5zaDogcmVtb3ZlICctdW5rbm93
bicgaW4gdmVyc2lvbgpAQCAtMjAsMTAgKzIwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBK
aWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2F1dG9nZW4uc2ggYi9hdXRvZ2Vu
LnNoCi1pbmRleCA5ZjkxMjk3Li45Zjc1NTliIDEwMDc1NQoraW5kZXggNzFmODllMi4uNmI0MDdl
MiAxMDA3NTUKIC0tLSBhL2F1dG9nZW4uc2gKICsrKyBiL2F1dG9nZW4uc2gKLUBAIC0yNzEsNyAr
MjcxLDcgQEAgaWYgWyAiJG15aG9zdCIgPSAiZmluZC12ZXJzaW9uIiBdOyB0aGVuCitAQCAtMjg2
LDcgKzI4Niw3IEBAIGlmIFsgIiRteWhvc3QiID0gImZpbmQtdmVyc2lvbiIgXTsgdGhlbgogICAg
ICBlbHNlCiAgICAgICAgaW5naXQ9bm8KICAgICAgICBiZXRhPXllcwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wa2djb25maWcucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBrZ2NvbmZpZy5wYXRjaAppbmRleCA2
N2I2NTE1N2QxLi4yMjZlNzA1NjYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
cGdtZS9ncGdtZS8wMDAxLXBrZ2NvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9ncGdtZS9ncGdtZS8wMDAxLXBrZ2NvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
NGI0ZTZmYzg5OGRkMjQ5Mzg3YmJlZDQ5MjRmYTIyYzFjNDk0MzI3YSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gMTE2N2Y0MTM2MTYzOTA2M2ViM2E1NjJjYTI1NWQwMGQ4MDc0Yjg5YyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2lu
ZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMjEgSnVsIDIwMjUgMTI6NDM6MjkgKzA4MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gcGtnY29uZmlnCkBAIC0yOSwxMCArMjksMTAgQEAgU2lnbmVkLW9mZi1ieTog
SG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzcmMvZ3BnbWUtcHRocmVhZC5wYy5pbgogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIv
Y29uZmlndXJlLmFjCi1pbmRleCBkNGRjYjFjLi4yOTNmY2MyIDEwMDY0NAoraW5kZXggZGRjNzNj
NS4uZTAxZTVkMyAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFj
Ci1AQCAtODQ0LDYgKzg0NCw3IEBAIEFDX0NPTkZJR19GSUxFUyhNYWtlZmlsZSBzcmMvTWFrZWZp
bGUKK0BAIC04NDUsNiArODQ1LDcgQEAgQUNfQ09ORklHX0ZJTEVTKE1ha2VmaWxlIHNyYy9NYWtl
ZmlsZQogICAgICAgICAgICAgICAgICBzcmMvZ3BnbWUucGMKICAgICAgICAgICAgICAgICAgc3Jj
L2dwZ21lLWdsaWIucGMKICAgICAgICAgICAgICAgICAgc3JjL2dwZ21lLmgpCkBAIC00MSw3ICs0
MSw3IEBAIGluZGV4IGQ0ZGNiMWMuLjI5M2ZjYzIgMTAwNjQ0CiAgQUNfQ09ORklHX0ZJTEVTKFts
YW5nL01ha2VmaWxlIGxhbmcvY2wvTWFrZWZpbGUgbGFuZy9jbC9ncGdtZS5hc2RdKQogIEFDX0NP
TkZJR19GSUxFUyhbbGFuZy9qcy9NYWtlZmlsZSBsYW5nL2pzL3NyYy9NYWtlZmlsZQogZGlmZiAt
LWdpdCBhL3NyYy9NYWtlZmlsZS5hbSBiL3NyYy9NYWtlZmlsZS5hbQotaW5kZXggZWRjMjM5Yi4u
ZDQyNzA0NCAxMDA2NDQKK2luZGV4IDRmNDVkZmUuLjNjNDkxOTAgMTAwNjQ0CiAtLS0gYS9zcmMv
TWFrZWZpbGUuYW0KICsrKyBiL3NyYy9NYWtlZmlsZS5hbQogQEAgLTIwLDExICsyMCwxMSBAQApA
QCAtODAsNyArODAsNyBAQCBpbmRleCAwMDAwMDAwLi4wNzRiYmY2CiArQ2ZsYWdzOiAtSSR7aW5j
bHVkZWRpcn0KICtSZXF1aXJlczogbGliYXNzdWFuIGdwZy1lcnJvcgogZGlmZiAtLWdpdCBhL3Ny
Yy9ncGdtZS5tNCBiL3NyYy9ncGdtZS5tNAotaW5kZXggNWY2ODllMS4uMjQ5ZThjOSAxMDA2NDQK
K2luZGV4IDEzYjQzYTQuLjg1MWU4NjYgMTAwNjQ0CiAtLS0gYS9zcmMvZ3BnbWUubTQKICsrKyBi
L3NyYy9ncGdtZS5tNAogQEAgLTE2Niw3ICsxNjYsNiBAQCBkbmwgaXMgYWRkZWQgdG8gdGhlIGdw
Z19jb25maWdfc2NyaXB0X3dhcm4gdmFyaWFibGUuCkBAIC0yMjUsNyArMjI1LDcgQEAgaW5kZXgg
NWY2ODllMS4uMjQ5ZThjOSAxMDA2NDQKICBdKQogIAogIAotQEAgLTMxOSwzNiArMjQ5LDEyIEBA
IEFDX0RFRlVOKFtBTV9QQVRIX0dQR01FX0dMSUJdLAorQEAgLTMyMCwzNiArMjUwLDEyIEBAIEFD
X0RFRlVOKFtBTV9QQVRIX0dQR01FX0dMSUJdLFsKICAgICAgIG1pbl9ncGdtZV92ZXJzaW9uPSIk
dG1wIgogICAgZmkKICAKQEAgLTI2NCw3ICsyNjQsNyBAQCBpbmRleCA1ZjY4OWUxLi4yNDllOGM5
IDEwMDY0NAogICAgICAgICAgaWYgdGVzdCAiJHRtcCIgLWd0IDAgOyB0aGVuCiAgICAgICAgICAg
ICBpZiB0ZXN0ICIkcmVxX2dwZ21lX2FwaSIgLW5lICIkdG1wIiA7IHRoZW4KICAgICAgICAgICAg
ICAgb2s9bm8KLUBAIC0zNTcsMTcgKzI2Myw5IEBAIEFDX0RFRlVOKFtBTV9QQVRIX0dQR01FX0dM
SUJdLAorQEAgLTM1OCwxNyArMjY0LDkgQEAgQUNfREVGVU4oW0FNX1BBVEhfR1BHTUVfR0xJQl0s
WwogICAgICAgZmkKICAgIGZpCiAgICBpZiB0ZXN0ICRvayA9IHllczsgdGhlbgpAQCAtMjk1LDYg
KzI5NSwzIEBAIGluZGV4IDlkZGVmNWMuLjkzMjY0NWIgMTAwNjQ0CiArQ2ZsYWdzOiAtSSR7aW5j
bHVkZWRpcn0KICtMaWJzOiAtTCR7bGliZGlyfSAtbGdwZ21lCiAgVVJMOiBodHRwczovL3d3dy5n
bnVwZy5vcmcvc29mdHdhcmUvZ3BnbWUvaW5kZXguaHRtbAotLS0gCi0yLjM0LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wb3NpeC1pby5jLVVz
ZS1vZmZfdC1pbnN0ZWFkLW9mLW9mZjY0X3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
cGdtZS9ncGdtZS8wMDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5w
YXRjaAppbmRleCA5MzJmYjljOTYyLi4zZjQ3ZTdjMTBjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWluc3RlYWQt
b2Ytb2ZmNjRfdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8w
MDAxLXBvc2l4LWlvLmMtVXNlLW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gNDE3MDM2MDUxYzg0YjAyZmU0M2YxNjJlZTM3ODI3OGE0NDYzNjQ1MSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzQ0YTM1ZGNmN2YyOGE0NjlhZmI4MjEzZGFi
ZWJjNjIwODg4N2JmZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDE1IERlYyAyMDIyIDA4OjQ0OjEzIC0wODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHBvc2l4LWlvLmM6IFVzZSBvZmZfdCBpbnN0ZWFkIG9mIG9mZjY0
X3QKQEAgLTI2LDcgKzI2LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvc3JjL3Bvc2l4LWlvLmMgYi9zcmMvcG9zaXgtaW8uYwotaW5kZXgg
MGQwYTk4Yi4uMjg2YTYyNiAxMDA2NDQKK2luZGV4IDRkZWU3NzYuLjNiOTk1MDAgMTAwNjQ0CiAt
LS0gYS9zcmMvcG9zaXgtaW8uYwogKysrIGIvc3JjL3Bvc2l4LWlvLmMKIEBAIC03NCw4ICs3NCw4
IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXVz
ZS1jbG9zZWZyb20tb24tbGludXgtYW5kLWdsaWJjLTIuMzQucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXVzZS1jbG9zZWZyb20tb24tbGludXgtYW5kLWdsaWJj
LTIuMzQucGF0Y2gKaW5kZXggZWQyZWRhYmQ2My4uZWU5MWE0Mzg2YiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS11c2UtY2xvc2Vmcm9tLW9uLWxpbnV4
LWFuZC1nbGliYy0yLjM0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dw
Z21lLzAwMDEtdXNlLWNsb3NlZnJvbS1vbi1saW51eC1hbmQtZ2xpYmMtMi4zNC5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gYWFlZDAzYjc2NTA1YjFmZWFlZWI1YTRhM2M2YmRjYzdkZDA4OWYw
MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjEyMDU0ZWZmOWNiMTNkZWEzZTk2NTRi
MjBmN2FhZmM0N2FlOTkxZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDE1IEp1bCAyMDIxIDEyOjMzOjEzIC0w
NzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHVzZSBjbG9zZWZyb20oKSBvbiBsaW51eCBhbmQgZ2xpYmMg
Mi4zNCsKQEAgLTEzLDEwICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2Fu
Z215QGZ1aml0c3UuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3Bvc2l4LWlvLmMgYi9zcmMvcG9zaXgtaW8uYwot
aW5kZXggYTQyMmQ4Zi4uMGQwYTk4YiAxMDA2NDQKK2luZGV4IGY4MTk2ZjkuLjRkZWU3NzYgMTAw
NjQ0CiAtLS0gYS9zcmMvcG9zaXgtaW8uYwogKysrIGIvc3JjL3Bvc2l4LWlvLmMKLUBAIC01Nzcs
NyArNTc3LDcgQEAgX2dwZ21lX2lvX3NwYXduIChjb25zdCBjaGFyICpwYXRoLCBjaGFyICpjb25z
dCBhcmd2W10sIHVuc2lnbmVkIGludCBmbGFncywKK0BAIC01OTksNyArNTk5LDcgQEAgX2dwZ21l
X2lvX3NwYXduIChjb25zdCBjaGFyICpwYXRoLCBjaGFyICpjb25zdCBhcmd2W10sIHVuc2lnbmVk
IGludCBmbGFncywKICAgICAgICAgICAgICAgIGlmIChmZF9saXN0W2ldLmZkID4gZmQpCiAgICAg
ICAgICAgICAgICAgIGZkID0gZmRfbGlzdFtpXS5mZDsKICAgICAgICAgICAgICBmZCsrOwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwNS1ncGdtZS1jb25m
aWctc2tpcC1hbGwtbGliLW9yLXVzci1saWItZGlyZWN0b3JpZXMtaW4tLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwNS1ncGdtZS1jb25maWctc2tpcC1hbGwtbGli
LW9yLXVzci1saWItZGlyZWN0b3JpZXMtaW4tLnBhdGNoCmluZGV4IGMwMjFlNDhiZTkuLmY5ZWMz
MTdmODQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDUt
Z3BnbWUtY29uZmlnLXNraXAtYWxsLWxpYi1vci11c3ItbGliLWRpcmVjdG9yaWVzLWluLS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDA1LWdwZ21lLWNvbmZp
Zy1za2lwLWFsbC1saWItb3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDllYTY4NWYxYjg5OGVlNzAzYjg1YjcwNWMzNWI5Y2JkNzdjY2ExN2YgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZhNjkwNzIyNDU3NGNiNzI2OWRlMmJkNDVjZDRj
NWQyZTUzZWQxYzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTMgQXByIDIwMTcgMTY6
NDA6MjcgKzAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ3BnbWUtY29uZmlnOiBza2lwIGFsbCAvbGli
KiBvciAvdXNyL2xpYiogZGlyZWN0b3JpZXMgaW4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dwZ21lL2dwZ21lXzIuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUv
Z3BnbWVfMi4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCA3NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMi4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2dwZ21lL2dwZ21lXzIuMS4xLmJiCmluZGV4IDI2OTA3MGIxMGIuLjk1NmU5ODgzMzYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzIuMS4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzIuMS4xLmJiCkBAIC0xLDMgKzEs
MjQgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBk
YXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2Ug
dXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hh
bmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4K
KyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykK
KyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBzcmMvZ3BnbWUuaC5pbgorIyArKysgc3JjL2dw
Z21lLmguaW4KKyMgQEAgLTEsNiArMSw2IEBACisjICAvKiBncGdtZS5oIC0gUHVibGljIGludGVy
ZmFjZSB0byBHbnVQRyBNYWRlIEVhc3kuICAgICAgICAgICAgICAgICAgIC0qLSBjIC0qLQorIyAg
ICogQ29weXJpZ2h0IChDKSAyMDAwIFdlcm5lciBLb2NoIChkZDlqbikKKyMgLSAqIENvcHlyaWdo
dCAoQykgMjAwMS0yMDI1IGcxMCBDb2RlIEdtYkgKKyMgKyAqIENvcHlyaWdodCAoQykgMjAwMS0y
MDI2IGcxMCBDb2RlIEdtYkgKKyMgICAqCisjICAgKiBUaGlzIGZpbGUgaXMgcGFydCBvZiBHUEdN
RS4KKyMgICAqCisjIAorIworCiBTVU1NQVJZID0gIkhpZ2gtbGV2ZWwgR251UEcgZW5jcnlwdGlv
bi9zaWduaW5nIEFQSSIKIERFU0NSSVBUSU9OID0gIkdudVBHIE1hZGUgRWFzeSAoR1BHTUUpIGlz
IGEgbGlicmFyeSBkZXNpZ25lZCB0byBtYWtlIGFjY2VzcyB0byBHbnVQRyBlYXNpZXIgZm9yIGFw
cGxpY2F0aW9ucy4gSXQgcHJvdmlkZXMgYSBIaWdoLUxldmVsIENyeXB0byBBUEkgZm9yIGVuY3J5
cHRpb24sIGRlY3J5cHRpb24sIHNpZ25pbmcsIHNpZ25hdHVyZSB2ZXJpZmljYXRpb24gYW5kIGtl
eSBtYW5hZ2VtZW50IgogSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5nbnVwZy5vcmcvZ3BnbWUuaHRt
bCIKQEAgLTksNyArMzAsNyBAQCBMSUNFTlNFOiR7UE59LXRvb2wgPSAiR1BMLTMuMC1vci1sYXRl
ciIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OTRkNTVkNTEyYTli
YTM2Y2FhOWI3ZGYwNzliYWUxOWYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlO
Ry5MRVNTRVI7bWQ1PWJiYjQ2MTIxMWEzM2IxMzRkNDJlZDVlZTgwMmIzN2ZmIFwKLSAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL3NyYy9ncGdtZS5oLmluO2VuZGxpbmU9MjM7bWQ1PWMwZDA1MWZh
NjNmNWE1NTE0ZjRhYjE5MGQ3Y2E0OTVlIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL3Ny
Yy9ncGdtZS5oLmluO2VuZGxpbmU9MjM7bWQ1PTNiOGU5YTZmZTQ1ZjRhZWY2MzA2MDM2YWEyMWQz
Yjg5IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9lbmdpbmUuaDtlbmRsaW5lPTIx
O21kNT1mNThmN2EwYjY0ODhlZGFlNDFiOTI1YWM5Yzg5MDA2OCBcCiAgICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9zcmMvZ3BnbWUtdG9vbC5jO2VuZGxpbmU9MjE7bWQ1PTY2YzUzODFlMGUwNTQ3
NTc5MmUyNDk4MmQxNWU3Y2U4IFwKICAgICAgICAgICAgICAgICAgICAgIgpAQCAtMjQsNyArNDUs
NyBAQCBTUkNfVVJJID0gIiR7R05VUEdfTUlSUk9SfS9ncGdtZS8ke0JQfS50YXIuYnoyIFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDEtYXV0b2dlbi5zaC1yZW1vdmUtdW5rbm93bi1pbi12ZXJzaW9u
LnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODQxYzVlYTUz
ZmMyNjI1OWY0ZmJmMGU4YmRlOTgyZGVhMWI4YTFjYTBjYjc3ZTY4MWM4MmIwNTA1NjZiZjkyYiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZDdlZTEyYjIwOWQ3ZGNlNzU0NjhkYjUzZjcyYTkwZTFh
ZDNkMjFmNGMzMDRlZjJjMDAyNjEyYTUyZjUzMzNhIgogCiBERVBFTkRTID0gImxpYmdwZy1lcnJv
ci1uYXRpdmUgbGliZ3BnLWVycm9yIGxpYmFzc3VhbiIKIAotLSAKMi40Ny4xCgo=

--===============1459186160942429412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 2275632 to 2276120 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/.debug/libgpgme.so.45.1.0", added "/usr/lib/.debug/libgpgme.so.45.1.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGSIZE changed from 106699 to 106789 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGSIZE changed from 476998 to 476985 (-0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 1340856 to 1342373 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: FILELIST: directory renamed /usr/src/debug/gpgme/2.1.0/tools -> /usr/src/debug/gpgme/2.1.1/tools, directory renamed /usr/src/debug/gpgme/2.1.0/src -> /usr/src/debug/gpgme/2.1.1/src
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.1.0", added "/usr/lib/libgpgme.so.45.1.1"
packages/x86-64-v3-poky-linux/gpgme/gpgme: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
packages/x86-64-v3-poky-linux/gpgme: PV changed from "2.1.0" to "2.1.1"
packages/x86-64-v3-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.1.0.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.1.1.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch"
packages/x86-64-v3-poky-linux/gpgme: PKGV changed from 2.1.0 [default] to 2.1.1 [default]
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.1.0 to libgpgme.so.45.1.1
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.1.0 to libgpgme.so.45.1.1
  /usr/lib/libgpgme.so.45.1.0 moved to /usr/lib/libgpgme.so.45.1.1
Changes to packages/x86_64-linux/pkgconf-native (sysroot):
  /usr/lib/libpkgconf.so changed symlink target from libpkgconf.so.8.0.0 to libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8.0.0 moved to /usr/lib/libpkgconf.so.7.0.0
  /usr/lib/libpkgconf.so.8 moved to /usr/lib/libpkgconf.so.7
  /usr/bin/spdxtool was removed

--===============1459186160942429412==--

