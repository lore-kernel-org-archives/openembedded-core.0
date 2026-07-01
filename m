Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58083C44500
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:34:30 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39124.1782887655167342801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DjFplyYg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZiWUiAvk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f1c62a335-a730d138-d855-4832-9853-eef3301df141-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782887654;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HeG5zT9kS+vAVuECl4yLJprlMywaR5eRlZNZuX6Kzck=;
	b=DjFplyYgq8Zfrq17HbqbTNjkw5AP4f59U3Xvi0W5rAif7Lf/6RiwPK+rQNd4YdH/
	1e0iHP0kouLEpbxhhnb2s/376BxjaNwzfbULkJ6/k4bxrDQzgtf8vKH3JfLQuj9D48u
	nVDnmHL7spOTpQTZ/TqZq7OSuQQv+ARRJrgFi7Wk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782887654;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HeG5zT9kS+vAVuECl4yLJprlMywaR5eRlZNZuX6Kzck=;
	b=ZiWUiAvkqiE8ocMThv77TIbJzWuvLHgzRr7n5+BzyeEKBjKNEt1FqsJW536jc0px
	wEgyIkrVXnlnUJAEBcl6sFrDX3YgAE3ff57iMAXG95wDGtmNGJex7D3CsjX93x3LSxS
	3Q9N1XX23/H+SWwmzrXJWBqej+1kOf+K4ZU2WAfQ=
Content-Type: multipart/mixed; boundary="===============2115884084461222746=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 2.1.2 SUCCEEDED
Message-ID: <0101019f1c62a335-a730d138-d855-4832-9853-eef3301df141-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jul 2026 06:34:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239943

--===============2115884084461222746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gpgme* to *2.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gpgme-upgrade-2.1.0-2.1.2.patch
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
From 811b3da1c77be26b6ef3f85cfcdaa223d81a5c1d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jul 2026 06:34:04 +0000
Subject: [PATCH] gpgme: upgrade 2.1.0 -> 2.1.2

---
 ...e-gpgme.m4-use-gpgrt-config-with-.pc.patch | 11 +++-----
 ...autogen.sh-remove-unknown-in-version.patch |  6 ++---
 .../gpgme/gpgme/0001-pkgconfig.patch          | 17 ++++++-------
 ...ix-io.c-Use-off_t-instead-of-off64_t.patch |  4 +--
 ...se-closefrom-on-linux-and-glibc-2.34.patch |  6 ++---
 ...p-all-lib-or-usr-lib-directories-in-.patch |  2 +-
 .../gpgme/{gpgme_2.1.0.bb => gpgme_2.1.2.bb}  | 25 +++++++++++++++++--
 7 files changed, 43 insertions(+), 28 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_2.1.0.bb => gpgme_2.1.2.bb} (74%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 4b8d1ceecd..ec0c423961 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From 6ad1ac8c03ae3acc0539fc1566070e2468c7df0a Mon Sep 17 00:00:00 2001
+From 11991439661faba92e2a3966084d40fc8757557f Mon Sep 17 00:00:00 2001
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
index 890909dd5e..579f47c173 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 0bb7fddb6a768bbc46695de4c6e0256a3580ccbb Mon Sep 17 00:00:00 2001
+From 7f374b5827f3d5d7f57e9045259f5aca703fb1d3 Mon Sep 17 00:00:00 2001
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
index 67b65157d1..ed3b3db261 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 4b4e6fc898dd249387bbed4924fa22c1c494327a Mon Sep 17 00:00:00 2001
+From 04838f9ce25f6964254310b66069ed1b37b019ce Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 21 Jul 2025 12:43:29 +0800
 Subject: [PATCH] pkgconfig
@@ -29,10 +29,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index d4dcb1c..293fcc2 100644
+index cd0af89..5ee3891 100644
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
index 932fb9c962..16df7fff1b 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -1,4 +1,4 @@
-From 417036051c84b02fe43f162ee378278a44636451 Mon Sep 17 00:00:00 2001
+From c069f75821abe4fa7765556f2bcf3af8b04a6eaf Mon Sep 17 00:00:00 2001
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
index ed2edabd63..0c00cb00f8 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From aaed03b76505b1feaeeb5a4a3c6bdcc7dd089f01 Mon Sep 17 00:00:00 2001
+From 116b3ecc954387f141f7cf9f5e01185919130f18 Mon Sep 17 00:00:00 2001
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
index c021e48be9..a71ec8e762 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From 9ea685f1b898ee703b85b705c35b9cbd77cca17f Mon Sep 17 00:00:00 2001
+From 101b5ffa3742d7e71e75f5e22aa3efe0f4c283b5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
 Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
diff --git a/meta/recipes-support/gpgme/gpgme_2.1.0.bb b/meta/recipes-support/gpgme/gpgme_2.1.2.bb
similarity index 74%
rename from meta/recipes-support/gpgme/gpgme_2.1.0.bb
rename to meta/recipes-support/gpgme/gpgme_2.1.2.bb
index 269070b10b..cd48ac1647 100644
--- a/meta/recipes-support/gpgme/gpgme_2.1.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.1.2.bb
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
+SRC_URI[sha256sum] = "0687a95b299871c4141f507c0f740de6b429c9ac067d0fa4e062e3264df5fb77"
 
 DEPENDS = "libgpg-error-native libgpg-error libassuan"
 
-- 
2.47.1


--===============2115884084461222746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGV changed from 2.1.0 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/.debug/libgpgme.so.45.1.0", added "/usr/lib/.debug/libgpgme.so.45.1.2"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PV changed from "2.1.0" to "2.1.2"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 2275632 to 2276120 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGV changed from 2.1.0 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PV changed from "2.1.0" to "2.1.2"
packages/x86-64-v3-poky-linux/gpgme/gpgme-dev: PKGSIZE changed from 106699 to 106789 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGV changed from 2.1.0 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PV changed from "2.1.0" to "2.1.2"
packages/x86-64-v3-poky-linux/gpgme/gpgme-doc: PKGSIZE changed from 476998 to 476985 (-0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PKGV changed from 2.1.0 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-locale: PV changed from "2.1.0" to "2.1.2"
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGV changed from 2.1.0 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: FILELIST: directory renamed /usr/src/debug/gpgme/2.1.0/tools -> /usr/src/debug/gpgme/2.1.2/tools, directory renamed /usr/src/debug/gpgme/2.1.0/src -> /usr/src/debug/gpgme/2.1.2/src
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PV changed from "2.1.0" to "2.1.2"
packages/x86-64-v3-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 1340856 to 1342373 (+0%)
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 2.1.0 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-staticdev: PV changed from "2.1.0" to "2.1.2"
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PKGV changed from 2.1.0 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme-tool: PV changed from "2.1.0" to "2.1.2"
packages/x86-64-v3-poky-linux/gpgme/gpgme: PKGV changed from 2.1.0 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.1.0", added "/usr/lib/libgpgme.so.45.1.2"
packages/x86-64-v3-poky-linux/gpgme/gpgme: PV changed from "2.1.0" to "2.1.2"
packages/x86-64-v3-poky-linux/gpgme: PKGV changed from 2.1.0 [default] to 2.1.2 [default]
packages/x86-64-v3-poky-linux/gpgme: PV changed from "2.1.0" to "2.1.2"
packages/x86-64-v3-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.1.0.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-2.1.2.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch file://0001-autogen.sh-remove-unknown-in-version.patch"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.1.0 to libgpgme.so.45.1.2
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.1.0 to libgpgme.so.45.1.2
  /usr/lib/libgpgme.so.45.1.0 moved to /usr/lib/libgpgme.so.45.1.2

--===============2115884084461222746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.45.1.0", added "/usr/lib/libgpgme.so.45.1.2"
Changes to packages/x86-64-v3-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgme.so.45 changed symlink target from libgpgme.so.45.1.0 to libgpgme.so.45.1.2
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.45.1.0 to libgpgme.so.45.1.2
  /usr/lib/libgpgme.so.45.1.0 moved to /usr/lib/libgpgme.so.45.1.2

--===============2115884084461222746==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-2.1.0-2.1.2.patch"

RnJvbSA4MTFiM2RhMWM3N2JlMjZiNmVmM2Y4NWNmY2RhYTIyM2Q4MWE1YzFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKdWwgMjAyNiAwNjozNDowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdw
Z21lOiB1cGdyYWRlIDIuMS4wIC0+IDIuMS4yCgotLS0KIC4uLmUtZ3BnbWUubTQtdXNlLWdwZ3J0
LWNvbmZpZy13aXRoLS5wYy5wYXRjaCB8IDExICsrKy0tLS0tCiAuLi5hdXRvZ2VuLnNoLXJlbW92
ZS11bmtub3duLWluLXZlcnNpb24ucGF0Y2ggfCAgNiArKy0tLQogLi4uL2dwZ21lL2dwZ21lLzAw
MDEtcGtnY29uZmlnLnBhdGNoICAgICAgICAgIHwgMTcgKysrKysrLS0tLS0tLQogLi4uaXgtaW8u
Yy1Vc2Utb2ZmX3QtaW5zdGVhZC1vZi1vZmY2NF90LnBhdGNoIHwgIDQgKy0tCiAuLi5zZS1jbG9z
ZWZyb20tb24tbGludXgtYW5kLWdsaWJjLTIuMzQucGF0Y2ggfCAgNiArKy0tLQogLi4ucC1hbGwt
bGliLW9yLXVzci1saWItZGlyZWN0b3JpZXMtaW4tLnBhdGNoIHwgIDIgKy0KIC4uLi9ncGdtZS97
Z3BnbWVfMi4xLjAuYmIgPT4gZ3BnbWVfMi4xLjIuYmJ9ICB8IDI1ICsrKysrKysrKysrKysrKysr
LS0KIDcgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUve2dwZ21lXzIuMS4wLmJiID0+IGdwZ21l
XzIuMS4yLmJifSAoNzQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21l
L2dwZ21lLzAwMDEtUmV2ZXJ0LWJ1aWxkLU1ha2UtZ3BnbWUubTQtdXNlLWdwZ3J0LWNvbmZpZy13
aXRoLS5wYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtUmV2
ZXJ0LWJ1aWxkLU1ha2UtZ3BnbWUubTQtdXNlLWdwZ3J0LWNvbmZpZy13aXRoLS5wYy5wYXRjaApp
bmRleCA0YjhkMWNlZWNkLi5lYzBjNDIzOTYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9ncGdtZS9ncGdtZS8wMDAxLVJldmVydC1idWlsZC1NYWtlLWdwZ21lLm00LXVzZS1ncGdy
dC1jb25maWctd2l0aC0ucGMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUv
Z3BnbWUvMDAwMS1SZXZlcnQtYnVpbGQtTWFrZS1ncGdtZS5tNC11c2UtZ3BncnQtY29uZmlnLXdp
dGgtLnBjLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2YWQxYWM4YzAzYWUzYWNjMDUzOWZj
MTU2NjA3MGUyNDY4YzdkZjBhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMTk5MTQz
OTY2MWZhYmE5MmUyYTM5NjYwODRkNDBmYzg3NTc1NTdmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVl
LCAxNCBPY3QgMjAyNSAxNDoxMjo1NSArMDgwMAogU3ViamVjdDogW1BBVENIXSBSZXZlcnQgImJ1
aWxkOiBNYWtlIGdwZ21lLm00IHVzZSBncGdydC1jb25maWcgd2l0aCAqLnBjLiIKQEAgLTE1LDcg
KzE1LDcgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQog
CiBkaWZmIC0tZ2l0IGEvc3JjL2dwZ21lLm00IGIvc3JjL2dwZ21lLm00Ci1pbmRleCBhY2JmYzFj
Li41ZjY4OWUxIDEwMDY0NAoraW5kZXggNWZiYjVkYi4uMTNiNDNhNCAxMDA2NDQKIC0tLSBhL3Ny
Yy9ncGdtZS5tNAogKysrIGIvc3JjL2dwZ21lLm00CiBAQCAtMTIyLDI0ICsxMjIsMTAgQEAgQUNf
UkVRVUlSRShbX0FNX1BBVEhfR1BHUlRfQ09ORklHXSlkbmwKQEAgLTc3LDcgKzc3LDcgQEAgaW5k
ZXggYWNiZmMxYy4uNWY2ODllMSAxMDA2NDQKICAgICAgICAgIGlmIHRlc3QgIiR0bXAiIC1ndCAw
IDsgdGhlbgogICAgICAgICAgICAgaWYgdGVzdCAiJHJlcV9ncGdtZV9hcGkiIC1uZSAiJHRtcCIg
OyB0aGVuCiAgICAgICAgICAgICAgIG9rPW5vCi1AQCAtMzcwLDExICszNDgsNyBAQCBBQ19ERUZV
TihbQU1fUEFUSF9HUEdNRV9HTElCXSwKK0BAIC0zNzEsMTEgKzM0OSw3IEBAIEFDX0RFRlVOKFtB
TV9QQVRIX0dQR01FX0dMSUJdLFsKICAgICAgICMgSWYgd2UgaGF2ZSBhIHJlY2VudCBHUEdNRSwg
d2Ugc2hvdWxkIGFsc28gY2hlY2sgdGhhdCB0aGUKICAgICAgICMgQVBJIGlzIGNvbXBhdGlibGUu
CiAgICAgICBpZiB0ZXN0ICIkcmVxX2dwZ21lX2FwaSIgLWd0IDAgOyB0aGVuCkBAIC05MCw3ICs5
MCw3IEBAIGluZGV4IGFjYmZjMWMuLjVmNjg5ZTEgMTAwNjQ0CiAgICAgICAgICBpZiB0ZXN0ICIk
dG1wIiAtZ3QgMCA7IHRoZW4KICAgICAgICAgICAgIGlmIHRlc3QgIiRyZXFfZ3BnbWVfYXBpIiAt
bmUgIiR0bXAiIDsgdGhlbgogICAgICAgICAgICAgICBvaz1ubwotQEAgLTM4MywyMCArMzU3LDgg
QEAgQUNfREVGVU4oW0FNX1BBVEhfR1BHTUVfR0xJQl0sCitAQCAtMzg0LDIwICszNTgsOCBAQCBB
Q19ERUZVTihbQU1fUEFUSF9HUEdNRV9HTElCXSxbCiAgICAgICBmaQogICAgZmkKICAgIGlmIHRl
c3QgJG9rID0geWVzOyB0aGVuCkBAIC0xMTMsNiArMTEzLDMgQEAgaW5kZXggYWNiZmMxYy4uNWY2
ODllMSAxMDA2NDQKICAgICAgQUNfTVNHX1JFU1VMVCh5ZXMpCiAgICAgIGlmZWxzZShbJDJdLCAs
IDosIFskMl0pCiAgICAgIF9BTV9QQVRIX0dQR01FX0NPTkZJR19IT1NUX0NIRUNLCi0tLSAKLTIu
MzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAx
LWF1dG9nZW4uc2gtcmVtb3ZlLXVua25vd24taW4tdmVyc2lvbi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtYXV0b2dlbi5zaC1yZW1vdmUtdW5rbm93bi1pbi12
ZXJzaW9uLnBhdGNoCmluZGV4IDg5MDkwOWRkNWUuLjU3OWY0N2MxNzMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtYXV0b2dlbi5zaC1yZW1vdmUtdW5r
bm93bi1pbi12ZXJzaW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dw
Z21lLzAwMDEtYXV0b2dlbi5zaC1yZW1vdmUtdW5rbm93bi1pbi12ZXJzaW9uLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSAwYmI3ZmRkYjZhNzY4YmJjNDY2OTVkZTRjNmUwMjU2YTM1ODBjY2Ji
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3ZjM3NGI1ODI3ZjNkNWQ3ZjU3ZTkwNDUy
NTlmNWFjYTcwM2ZiMWQzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEpp
YSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyNiBOb3YgMjAyNCAyMzoy
Mzo0MiAtMDgwMAogU3ViamVjdDogW1BBVENIXSBhdXRvZ2VuLnNoOiByZW1vdmUgJy11bmtub3du
JyBpbiB2ZXJzaW9uCkBAIC0yMCwxMCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEpp
YSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvYXV0b2dlbi5zaCBiL2F1dG9nZW4u
c2gKLWluZGV4IDlmOTEyOTcuLjlmNzU1OWIgMTAwNzU1CitpbmRleCA3MWY4OWUyLi42YjQwN2Uy
IDEwMDc1NQogLS0tIGEvYXV0b2dlbi5zaAogKysrIGIvYXV0b2dlbi5zaAotQEAgLTI3MSw3ICsy
NzEsNyBAQCBpZiBbICIkbXlob3N0IiA9ICJmaW5kLXZlcnNpb24iIF07IHRoZW4KK0BAIC0yODYs
NyArMjg2LDcgQEAgaWYgWyAiJG15aG9zdCIgPSAiZmluZC12ZXJzaW9uIiBdOyB0aGVuCiAgICAg
IGVsc2UKICAgICAgICBpbmdpdD1ubwogICAgICAgIGJldGE9eWVzCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBrZ2NvbmZpZy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcGtnY29uZmlnLnBhdGNoCmluZGV4IDY3
YjY1MTU3ZDEuLmVkM2IzZGIyNjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dw
Z21lL2dwZ21lLzAwMDEtcGtnY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dwZ21lL2dwZ21lLzAwMDEtcGtnY29uZmlnLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0
YjRlNmZjODk4ZGQyNDkzODdiYmVkNDkyNGZhMjJjMWM0OTQzMjdhIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAwNDgzOGY5Y2UyNWY2OTY0MjU0MzEwYjY2MDY5ZWQxYjM3YjAxOWNlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5k
cml2ZXIuY29tPgogRGF0ZTogTW9uLCAyMSBKdWwgMjAyNSAxMjo0MzoyOSArMDgwMAogU3ViamVj
dDogW1BBVENIXSBwa2djb25maWcKQEAgLTI5LDEwICsyOSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBI
b25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHNyYy9ncGdtZS1wdGhyZWFkLnBjLmluCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9j
b25maWd1cmUuYWMKLWluZGV4IGQ0ZGNiMWMuLjI5M2ZjYzIgMTAwNjQ0CitpbmRleCBjZDBhZjg5
Li41ZWUzODkxIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMK
LUBAIC04NDQsNiArODQ0LDcgQEAgQUNfQ09ORklHX0ZJTEVTKE1ha2VmaWxlIHNyYy9NYWtlZmls
ZQorQEAgLTg0NSw2ICs4NDUsNyBAQCBBQ19DT05GSUdfRklMRVMoTWFrZWZpbGUgc3JjL01ha2Vm
aWxlCiAgICAgICAgICAgICAgICAgIHNyYy9ncGdtZS5wYwogICAgICAgICAgICAgICAgICBzcmMv
Z3BnbWUtZ2xpYi5wYwogICAgICAgICAgICAgICAgICBzcmMvZ3BnbWUuaCkKQEAgLTQxLDcgKzQx
LDcgQEAgaW5kZXggZDRkY2IxYy4uMjkzZmNjMiAxMDA2NDQKICBBQ19DT05GSUdfRklMRVMoW2xh
bmcvTWFrZWZpbGUgbGFuZy9jbC9NYWtlZmlsZSBsYW5nL2NsL2dwZ21lLmFzZF0pCiAgQUNfQ09O
RklHX0ZJTEVTKFtsYW5nL2pzL01ha2VmaWxlIGxhbmcvanMvc3JjL01ha2VmaWxlCiBkaWZmIC0t
Z2l0IGEvc3JjL01ha2VmaWxlLmFtIGIvc3JjL01ha2VmaWxlLmFtCi1pbmRleCBlZGMyMzliLi5k
NDI3MDQ0IDEwMDY0NAoraW5kZXggNGY0NWRmZS4uM2M0OTE5MCAxMDA2NDQKIC0tLSBhL3NyYy9N
YWtlZmlsZS5hbQogKysrIGIvc3JjL01ha2VmaWxlLmFtCiBAQCAtMjAsMTEgKzIwLDExIEBACkBA
IC04MCw3ICs4MCw3IEBAIGluZGV4IDAwMDAwMDAuLjA3NGJiZjYKICtDZmxhZ3M6IC1JJHtpbmNs
dWRlZGlyfQogK1JlcXVpcmVzOiBsaWJhc3N1YW4gZ3BnLWVycm9yCiBkaWZmIC0tZ2l0IGEvc3Jj
L2dwZ21lLm00IGIvc3JjL2dwZ21lLm00Ci1pbmRleCA1ZjY4OWUxLi4yNDllOGM5IDEwMDY0NAor
aW5kZXggMTNiNDNhNC4uODUxZTg2NiAxMDA2NDQKIC0tLSBhL3NyYy9ncGdtZS5tNAogKysrIGIv
c3JjL2dwZ21lLm00CiBAQCAtMTY2LDcgKzE2Niw2IEBAIGRubCBpcyBhZGRlZCB0byB0aGUgZ3Bn
X2NvbmZpZ19zY3JpcHRfd2FybiB2YXJpYWJsZS4KQEAgLTIyNSw3ICsyMjUsNyBAQCBpbmRleCA1
ZjY4OWUxLi4yNDllOGM5IDEwMDY0NAogIF0pCiAgCiAgCi1AQCAtMzE5LDM2ICsyNDksMTIgQEAg
QUNfREVGVU4oW0FNX1BBVEhfR1BHTUVfR0xJQl0sCitAQCAtMzIwLDM2ICsyNTAsMTIgQEAgQUNf
REVGVU4oW0FNX1BBVEhfR1BHTUVfR0xJQl0sWwogICAgICAgbWluX2dwZ21lX3ZlcnNpb249IiR0
bXAiCiAgICBmaQogIApAQCAtMjY0LDcgKzI2NCw3IEBAIGluZGV4IDVmNjg5ZTEuLjI0OWU4Yzkg
MTAwNjQ0CiAgICAgICAgICBpZiB0ZXN0ICIkdG1wIiAtZ3QgMCA7IHRoZW4KICAgICAgICAgICAg
IGlmIHRlc3QgIiRyZXFfZ3BnbWVfYXBpIiAtbmUgIiR0bXAiIDsgdGhlbgogICAgICAgICAgICAg
ICBvaz1ubwotQEAgLTM1NywxNyArMjYzLDkgQEAgQUNfREVGVU4oW0FNX1BBVEhfR1BHTUVfR0xJ
Ql0sCitAQCAtMzU4LDE3ICsyNjQsOSBAQCBBQ19ERUZVTihbQU1fUEFUSF9HUEdNRV9HTElCXSxb
CiAgICAgICBmaQogICAgZmkKICAgIGlmIHRlc3QgJG9rID0geWVzOyB0aGVuCkBAIC0yOTUsNiAr
Mjk1LDMgQEAgaW5kZXggOWRkZWY1Yy4uOTMyNjQ1YiAxMDA2NDQKICtDZmxhZ3M6IC1JJHtpbmNs
dWRlZGlyfQogK0xpYnM6IC1MJHtsaWJkaXJ9IC1sZ3BnbWUKICBVUkw6IGh0dHBzOi8vd3d3Lmdu
dXBnLm9yZy9zb2Z0d2FyZS9ncGdtZS9pbmRleC5odG1sCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXBvc2l4LWlvLmMtVXNl
LW9mZl90LWluc3RlYWQtb2Ytb2ZmNjRfdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dw
Z21lL2dwZ21lLzAwMDEtcG9zaXgtaW8uYy1Vc2Utb2ZmX3QtaW5zdGVhZC1vZi1vZmY2NF90LnBh
dGNoCmluZGV4IDkzMmZiOWM5NjIuLjE2ZGY3ZmZmMWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtcG9zaXgtaW8uYy1Vc2Utb2ZmX3QtaW5zdGVhZC1v
Zi1vZmY2NF90LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAw
MDEtcG9zaXgtaW8uYy1Vc2Utb2ZmX3QtaW5zdGVhZC1vZi1vZmY2NF90LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSA0MTcwMzYwNTFjODRiMDJmZTQzZjE2MmVlMzc4Mjc4YTQ0NjM2NDUxIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMDY5Zjc1ODIxYWJlNGZhNzc2NTU1NmYyYmNm
M2FmOGIwNGE2ZWFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTUgRGVjIDIwMjIgMDg6NDQ6MTMgLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gcG9zaXgtaW8uYzogVXNlIG9mZl90IGluc3RlYWQgb2Ygb2ZmNjRf
dApAQCAtMjYsNyArMjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9zcmMvcG9zaXgtaW8uYyBiL3NyYy9wb3NpeC1pby5jCi1pbmRleCAw
ZDBhOThiLi4yODZhNjI2IDEwMDY0NAoraW5kZXggNGRlZTc3Ni4uM2I5OTUwMCAxMDA2NDQKIC0t
LSBhL3NyYy9wb3NpeC1pby5jCiArKysgYi9zcmMvcG9zaXgtaW8uYwogQEAgLTc0LDggKzc0LDgg
QEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtdXNl
LWNsb3NlZnJvbS1vbi1saW51eC1hbmQtZ2xpYmMtMi4zNC5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2dwZ21lL2dwZ21lLzAwMDEtdXNlLWNsb3NlZnJvbS1vbi1saW51eC1hbmQtZ2xpYmMt
Mi4zNC5wYXRjaAppbmRleCBlZDJlZGFiZDYzLi4wYzAwY2IwMGY4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDAxLXVzZS1jbG9zZWZyb20tb24tbGludXgt
YW5kLWdsaWJjLTIuMzQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3Bn
bWUvMDAwMS11c2UtY2xvc2Vmcm9tLW9uLWxpbnV4LWFuZC1nbGliYy0yLjM0LnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBhYWVkMDNiNzY1MDViMWZlYWVlYjVhNGEzYzZiZGNjN2RkMDg5ZjAx
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMTZiM2VjYzk1NDM4N2YxNDFmN2NmOWY1
ZTAxMTg1OTE5MTMwZjE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTUgSnVsIDIwMjEgMTI6MzM6MTMgLTA3
MDAKIFN1YmplY3Q6IFtQQVRDSF0gdXNlIGNsb3NlZnJvbSgpIG9uIGxpbnV4IGFuZCBnbGliYyAy
LjM0KwpAQCAtMTMsMTAgKzEzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5n
bXlAZnVqaXRzdS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvcG9zaXgtaW8uYyBiL3NyYy9wb3NpeC1pby5jCi1p
bmRleCBhNDIyZDhmLi4wZDBhOThiIDEwMDY0NAoraW5kZXggZjgxOTZmOS4uNGRlZTc3NiAxMDA2
NDQKIC0tLSBhL3NyYy9wb3NpeC1pby5jCiArKysgYi9zcmMvcG9zaXgtaW8uYwotQEAgLTU3Nyw3
ICs1NzcsNyBAQCBfZ3BnbWVfaW9fc3Bhd24gKGNvbnN0IGNoYXIgKnBhdGgsIGNoYXIgKmNvbnN0
IGFyZ3ZbXSwgdW5zaWduZWQgaW50IGZsYWdzLAorQEAgLTU5OSw3ICs1OTksNyBAQCBfZ3BnbWVf
aW9fc3Bhd24gKGNvbnN0IGNoYXIgKnBhdGgsIGNoYXIgKmNvbnN0IGFyZ3ZbXSwgdW5zaWduZWQg
aW50IGZsYWdzLAogICAgICAgICAgICAgICAgaWYgKGZkX2xpc3RbaV0uZmQgPiBmZCkKICAgICAg
ICAgICAgICAgICAgZmQgPSBmZF9saXN0W2ldLmZkOwogICAgICAgICAgICAgIGZkKys7CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDA1LWdwZ21lLWNvbmZp
Zy1za2lwLWFsbC1saWItb3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZS8wMDA1LWdwZ21lLWNvbmZpZy1za2lwLWFsbC1saWIt
b3ItdXNyLWxpYi1kaXJlY3Rvcmllcy1pbi0ucGF0Y2gKaW5kZXggYzAyMWU0OGJlOS4uYTcxZWM4
ZTc2MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwNS1n
cGdtZS1jb25maWctc2tpcC1hbGwtbGliLW9yLXVzci1saWItZGlyZWN0b3JpZXMtaW4tLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAwMDUtZ3BnbWUtY29uZmln
LXNraXAtYWxsLWxpYi1vci11c3ItbGliLWRpcmVjdG9yaWVzLWluLS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gOWVhNjg1ZjFiODk4ZWU3MDNiODViNzA1YzM1YjljYmQ3N2NjYTE3ZiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTAxYjVmZmEzNzQyZDdlNzFlNzVmNWUyMmFhM2Vm
ZTBmNGMyODNiNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAxMyBBcHIgMjAxNyAxNjo0
MDoyNyArMDMwMAogU3ViamVjdDogW1BBVENIXSBncGdtZS1jb25maWc6IHNraXAgYWxsIC9saWIq
IG9yIC91c3IvbGliKiBkaXJlY3RvcmllcyBpbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ3BnbWUvZ3BnbWVfMi4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9n
cGdtZV8yLjEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDc0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9ncGdtZS9ncGdtZV8yLjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ3BnbWUvZ3BnbWVfMi4xLjIuYmIKaW5kZXggMjY5MDcwYjEwYi4uY2Q0OGFjMTY0NyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMi4xLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWVfMi4xLjIuYmIKQEAgLTEsMyArMSwy
NCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRh
dGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJl
bmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1
cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFu
Z2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgor
IyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQor
IworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIHNyYy9ncGdtZS5oLmluCisjICsrKyBzcmMvZ3Bn
bWUuaC5pbgorIyBAQCAtMSw2ICsxLDYgQEAKKyMgIC8qIGdwZ21lLmggLSBQdWJsaWMgaW50ZXJm
YWNlIHRvIEdudVBHIE1hZGUgRWFzeS4gICAgICAgICAgICAgICAgICAgLSotIGMgLSotCisjICAg
KiBDb3B5cmlnaHQgKEMpIDIwMDAgV2VybmVyIEtvY2ggKGRkOWpuKQorIyAtICogQ29weXJpZ2h0
IChDKSAyMDAxLTIwMjUgZzEwIENvZGUgR21iSAorIyArICogQ29weXJpZ2h0IChDKSAyMDAxLTIw
MjYgZzEwIENvZGUgR21iSAorIyAgICoKKyMgICAqIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIEdQR01F
LgorIyAgICoKKyMgCisjCisKIFNVTU1BUlkgPSAiSGlnaC1sZXZlbCBHbnVQRyBlbmNyeXB0aW9u
L3NpZ25pbmcgQVBJIgogREVTQ1JJUFRJT04gPSAiR251UEcgTWFkZSBFYXN5IChHUEdNRSkgaXMg
YSBsaWJyYXJ5IGRlc2lnbmVkIHRvIG1ha2UgYWNjZXNzIHRvIEdudVBHIGVhc2llciBmb3IgYXBw
bGljYXRpb25zLiBJdCBwcm92aWRlcyBhIEhpZ2gtTGV2ZWwgQ3J5cHRvIEFQSSBmb3IgZW5jcnlw
dGlvbiwgZGVjcnlwdGlvbiwgc2lnbmluZywgc2lnbmF0dXJlIHZlcmlmaWNhdGlvbiBhbmQga2V5
IG1hbmFnZW1lbnQiCiBIT01FUEFHRSA9ICJodHRwOi8vd3d3LmdudXBnLm9yZy9ncGdtZS5odG1s
IgpAQCAtOSw3ICszMCw3IEBAIExJQ0VOU0U6JHtQTn0tdG9vbCA9ICJHUEwtMy4wLW9yLWxhdGVy
IgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJh
MzZjYWE5YjdkZjA3OWJhZTE5ZiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5H
LkxFU1NFUjttZDU9YmJiNDYxMjExYTMzYjEzNGQ0MmVkNWVlODAyYjM3ZmYgXAotICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vc3JjL2dwZ21lLmguaW47ZW5kbGluZT0yMzttZDU9YzBkMDUxZmE2
M2Y1YTU1MTRmNGFiMTkwZDdjYTQ5NWUgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3Jj
L2dwZ21lLmguaW47ZW5kbGluZT0yMzttZDU9M2I4ZTlhNmZlNDVmNGFlZjYzMDYwMzZhYTIxZDNi
ODkgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL2VuZ2luZS5oO2VuZGxpbmU9MjE7
bWQ1PWY1OGY3YTBiNjQ4OGVkYWU0MWI5MjVhYzljODkwMDY4IFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL3NyYy9ncGdtZS10b29sLmM7ZW5kbGluZT0yMTttZDU9NjZjNTM4MWUwZTA1NDc1
NzkyZTI0OTgyZDE1ZTdjZTggXAogICAgICAgICAgICAgICAgICAgICAiCkBAIC0yNCw3ICs0NSw3
IEBAIFNSQ19VUkkgPSAiJHtHTlVQR19NSVJST1J9L2dwZ21lLyR7QlB9LnRhci5iejIgXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMS1hdXRvZ2VuLnNoLXJlbW92ZS11bmtub3duLWluLXZlcnNpb24u
cGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NDFjNWVhNTNm
YzI2MjU5ZjRmYmYwZThiZGU5ODJkZWExYjhhMWNhMGNiNzdlNjgxYzgyYjA1MDU2NmJmOTJiIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjA2ODdhOTViMjk5ODcxYzQxNDFmNTA3YzBmNzQwZGU2YjQy
OWM5YWMwNjdkMGZhNGUwNjJlMzI2NGRmNWZiNzciCiAKIERFUEVORFMgPSAibGliZ3BnLWVycm9y
LW5hdGl2ZSBsaWJncGctZXJyb3IgbGliYXNzdWFuIgogCi0tIAoyLjQ3LjEKCg==

--===============2115884084461222746==--

