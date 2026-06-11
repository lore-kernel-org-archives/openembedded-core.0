Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955FBCDB468
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50604.1781195495673993552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nvD4QjSX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vFKarl8R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019eb78692fc-28118f73-6a08-43c4-a517-14a42ec20274-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195510;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OfizXUba+aZrFbw0HCU3fNLo2HvhvAkJbLWUHgkcTUM=;
	b=nvD4QjSXuJTZeWLg3OFynczc434QHwHMnyjoQVwrbKUq6aaN4TgdSwXm8B54H8X8
	5gPgp2IDnCCtrfb9XvYHaVA3WQEl+jjCYm8z4tyHvyddRnYIMhhD1q49Xbc1YYppdYL
	FK7u+AvCa1W9WVLN3CWFi/PrOulIFUfu+Q6xhFFw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195510;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OfizXUba+aZrFbw0HCU3fNLo2HvhvAkJbLWUHgkcTUM=;
	b=vFKarl8RHajxIxwfHagjAV3N7O+8KFXnlu+F02u9//WJv/WzQzTgm2SCQSQ8WlqY
	72fhFNxk+9QQLGnn6uiuOkLdgwk7qpwo/eB6oOuZRUwKYPTbGaP9BhutiVhmv4FqAeH
	kOdP0dTY/cF8ChmEo/5pxYBzY+1rgdTUXwgd9Aaw=
Content-Type: multipart/mixed; boundary="===============5250945285622376777=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.07.1 SUCCEEDED
Message-ID: <0101019eb78692fc-28118f73-6a08-43c4-a517-14a42ec20274-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238511

--===============5250945285622376777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ghostscript* to *10.07.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ghostscript-upgrade-10.07.0-10.07.1.patch
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
From 736021fe986cdc5eba21aae348c8c03405e56a37 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 11:14:02 +0000
Subject: [PATCH] ghostscript: upgrade 10.07.0 -> 10.07.1

---
 ...ace-static-const-double-with-macros-.patch |  4 +--
 .../avoid-host-contamination.patch            |  4 +--
 .../ghostscript-9.16-Werror-return-type.patch |  2 +-
 .../ghostscript/ghostscript/out-of-tree.patch | 30 ++++++++-----------
 ...ript_10.07.0.bb => ghostscript_10.07.1.bb} |  2 +-
 5 files changed, 19 insertions(+), 23 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.07.0.bb => ghostscript_10.07.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
index 6f310abf2e..d21b39aeae 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-psi-ztype.c-replace-static-const-double-with-macros-.patch
@@ -1,4 +1,4 @@
-From 0298799777bd179c455e5ce8d6008b2d84732967 Mon Sep 17 00:00:00 2001
+From 815f7180c3716eb3a2e77775d4d104e820717262 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Tue, 7 Apr 2026 22:40:26 -0700
 Subject: [PATCH] psi/ztype.c: replace static const double with macros for
@@ -28,6 +28,6 @@ index a01d83f..d454778 100644
 +
 +#define min_int_real ((double)(ALT_MIN_INT) - 1.0)
 +#define max_int_real ((double)(ALT_MAX_INT) + 1.0)
-
+ 
  #define REAL_CAN_BE_INT(v)\
    ((v) > min_int_real && (v) < max_int_real)
diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index d191231c7b..baa3598fd7 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,4 +1,4 @@
-From 85905ce3b1bc63f0be9eda9888e40d8e7a803d21 Mon Sep 17 00:00:00 2001
+From 14a2fa8a78974935a69a720cfdcbd3ac2c5bd27d Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
 Subject: [PATCH] avoid host contamination
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/devices/devs.mak b/devices/devs.mak
-index a5dbc7a..27b55f2 100644
+index 1e44e8d..f4d95da 100644
 --- a/devices/devs.mak
 +++ b/devices/devs.mak
 @@ -403,7 +403,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
index 0598c3dcd2..6125af60a5 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.16-Werror-return-type.patch
@@ -1,4 +1,4 @@
-From c23b787f9a38be2cdc57133915c402b69acedd1a Mon Sep 17 00:00:00 2001
+From e8892d650b06b3065a9bff1f787ae90043c81ac3 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Mon, 4 May 2015 22:31:48 -0700
 Subject: [PATCH] base/gendev.c: fix for -Werror=return-type
diff --git a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
index 202c9d6c7c..5f6e0ca394 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/out-of-tree.patch
@@ -1,14 +1,21 @@
-Fix the build to do out-of-tree properly.
+From 6f792c2e8df8103fbbde16aba401ab21dd2539a2 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 2 Apr 2026 14:41:42 +0100
+Subject: [PATCH] Fix the build to do out-of-tree properly.
 
 The patches are in progress but are being submitted upstream.
 
 Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=709289]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff -rU3 a/configure.ac b/configure.ac
---- a/configure.ac	2025-09-09 10:36:39.000000000 +0100
-+++ b/configure.ac	2026-03-31 15:35:08.988262612 +0100
-@@ -400,7 +400,7 @@
+diff --git a/configure.ac b/configure.ac
+index b2b3678..dd00e86 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -400,7 +400,7 @@ if test x"$with_arch_h" = x""; then
            *)
              ARCH_CONF_HEADER=
              if test x"$host" != x"$build"; then
@@ -17,18 +24,7 @@ diff -rU3 a/configure.ac b/configure.ac
              else
                ARCH_CONF_HEADER=
              fi
-@@ -869,8 +869,8 @@
- AC_SUBST(RECURSIVE_MUTEXATTR)
- 
- dnl Tesseract/Leptonica detection
--TESSERACTDIR=tesseract
--LEPTONICADIR=leptonica
-+TESSERACTDIR=$srcdir/tesseract
-+LEPTONICADIR=$srcdir/leptonica
- OCR_VERSION=0
- OCR_SHARED=0
- LEPTONICAINCLUDE=
-@@ -886,7 +886,7 @@
+@@ -889,7 +889,7 @@ AC_ARG_WITH([tesseract], AS_HELP_STRING([--without-tesseract],
  
  if test x$with_tesseract != xno; then
    AC_MSG_CHECKING([for local Tesseract library source])
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
index 1b6cb4aaae..3254872036 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.07.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.07.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch \
            "
 
-SRC_URI[sha256sum] = "ed6ea62022e3f4d5a6569b6efc9361b63a6d118bfcad8f0beb897c37885b5cad"
+SRC_URI[sha256sum] = "2fc74362f9be6fae1b0a65d38fdcfd4f0b518cc3b07c5581fb661eb4d2e15251"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.47.1


--===============5250945285622376777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PKGSIZE changed from 214034912 to 209308144 (-2%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dbg: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dev: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-dev: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PKGSIZE changed from 11329961 to 11329224 (-0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: FILELIST: directory renamed /usr/share/doc/ghostscript/10.07.0 -> /usr/share/doc/ghostscript/10.07.1
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-locale: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-locale: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PKGSIZE changed from 95068617 to 95143166 (+0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: FILELIST: directory renamed /usr/src/debug/ghostscript/10.07.0/lcms2mt/src -> /usr/src/debug/ghostscript/10.07.1/lcms2mt/src, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib/japanese -> /usr/src/debug/ghostscript/10.07.1/contrib/japanese, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/include/tesseract -> /usr/src/debug/ghostscript/10.07.1/tesseract/include/tesseract, directory renamed /usr/src/debug/ghostscript/10.07.0/soobj -> /usr/src/debug/ghostscript/10.07.1/obj, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/textord -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/textord, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/wordrec -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/wordrec, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccmain -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/ccmain, directory renamed /usr/src/debu
 g/ghostscript/10.07.0/tesseract/src/api -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/api, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/lstm -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/lstm, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib -> /usr/src/debug/ghostscript/10.07.1/contrib, directory renamed /usr/src/debug/ghostscript/10.07.0/openjpeg/src/lib/openjp2 -> /usr/src/debug/ghostscript/10.07.1/openjpeg/src/lib/openjp2, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/viewer -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/viewer, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/arch -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/arch, directory renamed /usr/src/debug/ghostscript/10.07.0/ijs -> /usr/src/debug/ghostscript/10.07.1/ijs, directory renamed /usr/src/debug/ghostscript/10.07.0/devices/vector -> /usr/src/debug/ghostscript/10.07.1/devices/vector, directory renamed /usr/src/debug/g
 hostscript/10.07.0/contrib/pcl3/src -> /usr/src/debug/ghostscript/10.07.1/contrib/pcl3/src, directory renamed /usr/src/debug/ghostscript/10.07.0/devices -> /usr/src/debug/ghostscript/10.07.1/devices, directory renamed /usr/src/debug/ghostscript/10.07.0/lcms2mt/include -> /usr/src/debug/ghostscript/10.07.1/lcms2mt/include, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/dict -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/dict, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib/opvp -> /usr/src/debug/ghostscript/10.07.1/contrib/opvp, directory renamed /usr/src/debug/ghostscript/10.07.0/devices/rinkj -> /usr/src/debug/ghostscript/10.07.1/devices/rinkj, directory renamed /usr/src/debug/ghostscript/10.07.0/obj -> /usr/src/debug/ghostscript/10.07.1/soobj, directory renamed /usr/src/debug/ghostscript/10.07.0/base -> /usr/src/debug/ghostscript/10.07.1/base, directory renamed /usr/src/debug/ghostscript/10.07.0/urf -> /usr/src/debug/ghostscript/10.07.1/urf, d
 irectory renamed /usr/src/debug/ghostscript/10.07.0/leptonica/src -> /usr/src/debug/ghostscript/10.07.1/leptonica/src, directory renamed /usr/src/debug/ghostscript/10.07.0/cups -> /usr/src/debug/ghostscript/10.07.1/cups, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib/pcl3/eprn -> /usr/src/debug/ghostscript/10.07.1/contrib/pcl3/eprn, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccstruct -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/ccstruct, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/ccutil -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/ccutil, directory renamed /usr/src/debug/ghostscript/10.07.0/brotli/c/include/brotli -> /usr/src/debug/ghostscript/10.07.1/brotli/c/include/brotli, directory renamed /usr/src/debug/ghostscript/10.07.0/pdf -> /usr/src/debug/ghostscript/10.07.1/pdf, directory renamed /usr/src/debug/ghostscript/10.07.0/contrib/eplaser -> /usr/src/debug/ghostscript/10.07.1/contrib/eplaser, directory re
 named /usr/src/debug/ghostscript/10.07.0/contrib/lips4 -> /usr/src/debug/ghostscript/10.07.1/contrib/lips4, directory renamed /usr/src/debug/ghostscript/10.07.0/jbig2dec -> /usr/src/debug/ghostscript/10.07.1/jbig2dec, directory renamed /usr/src/debug/ghostscript/10.07.0/psi -> /usr/src/debug/ghostscript/10.07.1/psi, directory renamed /usr/src/debug/ghostscript/10.07.0/tesseract/src/classify -> /usr/src/debug/ghostscript/10.07.1/tesseract/src/classify, directory renamed /usr/src/debug/ghostscript/10.07.0/zlib -> /usr/src/debug/ghostscript/10.07.1/zlib, removed "/usr/src/debug/ghostscript/10.07.0/brotli/c/enc/bit_cost_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/prefix.h /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/prefix.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_forgetful_chain_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/dictionary.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_to_binary_tree_inc.h /usr/src/debug/ghostscript/10.07.0/brotl
 i/c/enc/hash_longest_match_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/dictionary.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/static_dict.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/static_dict.c /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/huffman.h /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/huffman.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/metablock_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/metablock.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/metablock.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/backward_references_hq.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/cluster.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/cluster.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/backward_references_hq.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compress_fragment.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/histogram.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_composite_inc.h /usr/src/debug/gh
 ostscript/10.07.0/brotli/c/enc/cluster_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/histogram.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compress_fragment.h /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/decode.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/encoder_dict.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/context.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compress_fragment_two_pass.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/context.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/encoder_dict.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compress_fragment_two_pass.c /usr/src/debug/ghostscript/10.07.0/brotli/c/common/platform.c /usr/src/debug/ghostscript/10.07.0/brotli/c/common/platform.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_longest_match64_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compound_dictionary.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/encode.c /usr/src/debug/ghostscript/10.07.0/brot
 li/c/enc/static_dict_lut.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/compound_dictionary.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/block_splitter_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/fast_log.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/fast_log.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/params.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/transform.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/bit_cost.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/transform.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/shared_dictionary_internal.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/histogram_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/block_encoder_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/backward_references_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/memory.h /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/state.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/state.h /usr/src/debug/g
 hostscript/10.07.0/brotli/c/dec/state.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/command.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/command.c /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/bit_reader.h /usr/src/debug/ghostscript/10.07.0/brotli/c/dec/bit_reader.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/entropy_encode_static.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/brotli_bit_stream.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/brotli_bit_stream.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/literal_cost.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/utf8_util.c /usr/src/debug/ghostscript/10.07.0/brotli/c/common/constants.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/literal_cost.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/utf8_util.h /usr/src/debug/ghostscript/10.07.0/brotli/c/common/constants.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_rolling_inc.h /usr/src/debug/gh
 ostscript/10.07.0/brotli/c/enc/backward_references.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/backward_references.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/find_match_length.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/write_bits.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/hash_longest_match_quickly_inc.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/quality.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/ringbuffer.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/block_splitter.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/dictionary_hash.h /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/entropy_encode.c /usr/src/debug/ghostscript/10.07.0/brotli/c/common/shared_dictionary.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/block_splitter.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/dictionary_hash.c /usr/src/debug/ghostscript/10.07.0/brotli/c/enc/entropy_encode.h", added "/usr/src/debug/ghostscript/10.07.1/brotli/c/enc/params.h /usr/src/debug/g
 hostscript/10.07.1/brotli/c/enc/bit_cost.c /usr/src/debug/ghostscript/10.07.1/brotli/c/common/transform.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/bit_cost.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/transform.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/shared_dictionary_internal.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/histogram_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/block_encoder_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/backward_references_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/memory.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/state.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/state.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/state.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/matching_tag_mask.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/command.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/command.c /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/bit_reader.h /usr/src/debu
 g/ghostscript/10.07.1/brotli/c/enc/dictionary_hash_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/bit_reader.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/entropy_encode_static.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/brotli_bit_stream.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/brotli_bit_stream.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/literal_cost.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/utf8_util.c /usr/src/debug/ghostscript/10.07.1/brotli/c/common/constants.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/literal_cost.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/utf8_util.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/constants.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/dictionary_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_rolling_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/backward_references.h /usr/src/debug/ghostscript/10.07.1/brot
 li/c/enc/backward_references.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/find_match_length.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/write_bits.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_longest_match_quickly_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/quality.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/static_init.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/block_splitter.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/dictionary_hash.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/ringbuffer.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_init.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/entropy_encode.c /usr/src/debug/ghostscript/10.07.1/brotli/c/common/shared_dictionary.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/block_splitter.c /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/static_init.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/entropy_encode.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static
 _init.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/bit_cost_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/prefix.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/prefix.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_forgetful_chain_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/dictionary.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_to_binary_tree_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_longest_match_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/dictionary.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_dict.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_dict.c /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/huffman.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/huffman.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/metablock_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/metablock.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/metablock.h /usr/src/debug/ghostscript/10.07.1/bro
 tli/c/enc/hash_base.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/backward_references_hq.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/cluster.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/cluster.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/backward_references_hq.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compress_fragment.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/histogram.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_composite_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/cluster_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/histogram.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compress_fragment.h /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/decode.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/encoder_dict.h /usr/src/debug/ghostscript/10.07.1/brotli/c/common/context.c /usr/src/debug/ghostscript/10.07.1/brotli/c/dec/prefix_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compress_fragment_two_pass.h /usr/sr
 c/debug/ghostscript/10.07.1/brotli/c/common/context.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/encoder_dict.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compress_fragment_two_pass.c /usr/src/debug/ghostscript/10.07.1/brotli/c/common/platform.c /usr/src/debug/ghostscript/10.07.1/brotli/c/common/platform.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_longest_match64_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compound_dictionary.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_dict_lut_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/encode.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/static_dict_lut.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/compound_dictionary.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/hash_longest_match64_simd_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/block_splitter_inc.h /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/fast_log.c /usr/src/debug/ghostscript/10.07.1/brotli/c/enc/fast_log.h /usr
 /src/debug/ghostscript/10.07.1/brotli/c/enc/hash_longest_match_simd_inc.h"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-src: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-staticdev: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript-staticdev: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PKGSIZE changed from 95602911 to 95682102 (+0%)
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.07.0/Resource/Encoding -> /usr/share/ghostscript/10.07.1/Resource/Encoding, directory renamed /usr/share/ghostscript/10.07.0/lib -> /usr/share/ghostscript/10.07.1/lib, directory renamed /usr/share/ghostscript/10.07.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.07.1/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.07.0/Resource/SubstCID -> /usr/share/ghostscript/10.07.1/Resource/SubstCID, directory renamed /usr/share/ghostscript/10.07.0/iccprofiles -> /usr/share/ghostscript/10.07.1/iccprofiles, directory renamed /usr/share/ghostscript/10.07.0/Resource/Decoding -> /usr/share/ghostscript/10.07.1/Resource/Decoding, directory renamed /usr/share/ghostscript/10.07.0/Resource/CIDFont -> /usr/share/ghostscript/10.07.1/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.07.0/Resource/Init -> /usr/share/ghostscript/10.07.1/Resource/Init, directory renamed /us
 r/share/ghostscript/10.07.0/Resource/ColorSpace -> /usr/share/ghostscript/10.07.1/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.07.0/Resource/IdiomSet -> /usr/share/ghostscript/10.07.1/Resource/IdiomSet, directory renamed /usr/share/ghostscript/10.07.0/Resource/CMap -> /usr/share/ghostscript/10.07.1/Resource/CMap, directory renamed /usr/share/ghostscript/10.07.0/Resource/Font -> /usr/share/ghostscript/10.07.1/Resource/Font
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
packages/x86-64-v3-poky-linux/ghostscript: PV changed from "10.07.0" to "10.07.1"
packages/x86-64-v3-poky-linux/ghostscript: SRC_URI changed from "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10070/ghostscript-10.07.0.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://out-of-tree.patch file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch" to "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10071/ghostscript-10.07.1.tar.gz file://ghostscript-9.16-Werror-return-type.patch file://avoid-host-contamination.patch file://out-of-tree.patch file://0001-psi-ztype.c-replace-static-const-double-with-macros-.patch"
packages/x86-64-v3-poky-linux/ghostscript: PKGV changed from 10.07.0 [default] to 10.07.1 [default]
Changes to packages/x86-64-v3-poky-linux/ghostscript (sysroot):
  /usr/share/ghostscript/10.07.0 moved to /usr/share/ghostscript/10.07.1

--===============5250945285622376777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.07.0-10.07.1.patch"

RnJvbSA3MzYwMjFmZTk4NmNkYzVlYmEyMWFhZTM0OGM4YzAzNDA1ZTU2YTM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTE6MTQ6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aG9zdHNjcmlwdDogdXBncmFkZSAxMC4wNy4wIC0+IDEwLjA3LjEKCi0tLQogLi4uYWNlLXN0YXRp
Yy1jb25zdC1kb3VibGUtd2l0aC1tYWNyb3MtLnBhdGNoIHwgIDQgKy0tCiAuLi4vYXZvaWQtaG9z
dC1jb250YW1pbmF0aW9uLnBhdGNoICAgICAgICAgICAgfCAgNCArLS0KIC4uLi9naG9zdHNjcmlw
dC05LjE2LVdlcnJvci1yZXR1cm4tdHlwZS5wYXRjaCB8ICAyICstCiAuLi4vZ2hvc3RzY3JpcHQv
Z2hvc3RzY3JpcHQvb3V0LW9mLXRyZWUucGF0Y2ggfCAzMCArKysrKysrKy0tLS0tLS0tLS0tCiAu
Li5yaXB0XzEwLjA3LjAuYmIgPT4gZ2hvc3RzY3JpcHRfMTAuMDcuMS5iYn0gfCAgMiArLQogNSBm
aWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQve2dob3N0c2NyaXB0XzEwLjA3LjAuYmIg
PT4gZ2hvc3RzY3JpcHRfMTAuMDcuMS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvMDAwMS1wc2ktenR5cGUuYy1yZXBs
YWNlLXN0YXRpYy1jb25zdC1kb3VibGUtd2l0aC1tYWNyb3MtLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0LzAwMDEtcHNpLXp0eXBlLmMtcmVwbGFj
ZS1zdGF0aWMtY29uc3QtZG91YmxlLXdpdGgtbWFjcm9zLS5wYXRjaAppbmRleCA2ZjMxMGFiZjJl
Li5kMjFiMzlhZWFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3Jp
cHQvZ2hvc3RzY3JpcHQvMDAwMS1wc2ktenR5cGUuYy1yZXBsYWNlLXN0YXRpYy1jb25zdC1kb3Vi
bGUtd2l0aC1tYWNyb3MtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNj
cmlwdC9naG9zdHNjcmlwdC8wMDAxLXBzaS16dHlwZS5jLXJlcGxhY2Utc3RhdGljLWNvbnN0LWRv
dWJsZS13aXRoLW1hY3Jvcy0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAyOTg3OTk3Nzdi
ZDE3OWM0NTVlNWNlOGQ2MDA4YjJkODQ3MzI5NjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDgxNWY3MTgwYzM3MTZlYjNhMmU3Nzc3NWQ0ZDEwNGU4MjA3MTcyNjIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4K
IERhdGU6IFR1ZSwgNyBBcHIgMjAyNiAyMjo0MDoyNiAtMDcwMAogU3ViamVjdDogW1BBVENIXSBw
c2kvenR5cGUuYzogcmVwbGFjZSBzdGF0aWMgY29uc3QgZG91YmxlIHdpdGggbWFjcm9zIGZvcgpA
QCAtMjgsNiArMjgsNiBAQCBpbmRleCBhMDFkODNmLi5kNDU0Nzc4IDEwMDY0NAogKwogKyNkZWZp
bmUgbWluX2ludF9yZWFsICgoZG91YmxlKShBTFRfTUlOX0lOVCkgLSAxLjApCiArI2RlZmluZSBt
YXhfaW50X3JlYWwgKChkb3VibGUpKEFMVF9NQVhfSU5UKSArIDEuMCkKLQorIAogICNkZWZpbmUg
UkVBTF9DQU5fQkVfSU5UKHYpXAogICAgKCh2KSA+IG1pbl9pbnRfcmVhbCAmJiAodikgPCBtYXhf
aW50X3JlYWwpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQv
Z2hvc3RzY3JpcHQvYXZvaWQtaG9zdC1jb250YW1pbmF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0L2F2b2lkLWhvc3QtY29udGFtaW5hdGlv
bi5wYXRjaAppbmRleCBkMTkxMjMxYzdiLi5iYWEzNTk4ZmQ3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQvYXZvaWQtaG9zdC1jb250YW1p
bmF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9z
dHNjcmlwdC9hdm9pZC1ob3N0LWNvbnRhbWluYXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDg1OTA1Y2UzYjFiYzYzZjBiZTllZGE5ODg4ZTQwZDhlN2E4MDNkMjEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDE0YTJmYThhNzg5NzQ5MzVhNjlhNzIwY2ZkY2JkM2FjMmM1YmQy
N2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2lu
ZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMjkgTWFyIDIwMTggMTY6MDI6MDUgKzA4MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gYXZvaWQgaG9zdCBjb250YW1pbmF0aW9uCkBAIC0xNSw3ICsxNSw3IEBAIFNp
Z25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L2RldmljZXMvZGV2cy5tYWsgYi9kZXZpY2VzL2RldnMubWFrCi1pbmRleCBhNWRiYzdhLi4yN2I1
NWYyIDEwMDY0NAoraW5kZXggMWU0NGU4ZC4uZjRkOTVkYSAxMDA2NDQKIC0tLSBhL2RldmljZXMv
ZGV2cy5tYWsKICsrKyBiL2RldmljZXMvZGV2cy5tYWsKIEBAIC00MDMsNyArNDAzLDcgQEAgJChE
RVZPQkopZ2RldnhhbHQuJChPQkopIDogJChERVZTUkMpZ2RldnhhbHQuYyAkKEdERVZYKSAkKG1h
dGhfX2gpICQobWVtb3J5X19oKVwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9n
aG9zdHNjcmlwdC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC05LjE2LVdlcnJvci1yZXR1cm4tdHlw
ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdC9n
aG9zdHNjcmlwdC05LjE2LVdlcnJvci1yZXR1cm4tdHlwZS5wYXRjaAppbmRleCAwNTk4YzNkY2Qy
Li42MTI1YWY2MGE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3Jp
cHQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHQtOS4xNi1XZXJyb3ItcmV0dXJuLXR5cGUucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0L2dob3N0
c2NyaXB0LTkuMTYtV2Vycm9yLXJldHVybi10eXBlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBjMjNiNzg3ZjlhMzhiZTJjZGM1NzEzMzkxNWM0MDJiNjlhY2VkZDFhIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBlODg5MmQ2NTBiMDZiMzA2NWE5YmZmMWY3ODdhZTkwMDQzYzgxYWMz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5n
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDQgTWF5IDIwMTUgMjI6MzE6NDggLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gYmFzZS9nZW5kZXYuYzogZml4IGZvciAtV2Vycm9yPXJldHVybi10eXBl
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3Jp
cHQvb3V0LW9mLXRyZWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQv
Z2hvc3RzY3JpcHQvb3V0LW9mLXRyZWUucGF0Y2gKaW5kZXggMjAyYzlkNmM3Yy4uNWY2ZTBjYTM5
NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2Ny
aXB0L291dC1vZi10cmVlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNj
cmlwdC9naG9zdHNjcmlwdC9vdXQtb2YtdHJlZS5wYXRjaApAQCAtMSwxNCArMSwyMSBAQAotRml4
IHRoZSBidWlsZCB0byBkbyBvdXQtb2YtdHJlZSBwcm9wZXJseS4KK0Zyb20gNmY3OTJjMmU4ZGY4
MTAzZmJiZGUxNmFiYTQwMWFiMjFkZDI1MzlhMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgorRGF0ZTogVGh1LCAyIEFwciAy
MDI2IDE0OjQxOjQyICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIEZpeCB0aGUgYnVpbGQgdG8gZG8g
b3V0LW9mLXRyZWUgcHJvcGVybHkuCiAKIFRoZSBwYXRjaGVzIGFyZSBpbiBwcm9ncmVzcyBidXQg
YXJlIGJlaW5nIHN1Ym1pdHRlZCB1cHN0cmVhbS4KIAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0
ZWQgW2h0dHBzOi8vYnVncy5naG9zdHNjcmlwdC5jb20vc2hvd19idWcuY2dpP2lkPTcwOTI4OV0K
IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgorLS0tCisg
Y29uZmlndXJlLmFjIHwgNCArKy0tCisgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIAotZGlmZiAtclUzIGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFj
Ci0tLS0gYS9jb25maWd1cmUuYWMJMjAyNS0wOS0wOSAxMDozNjozOS4wMDAwMDAwMDAgKzAxMDAK
LSsrKyBiL2NvbmZpZ3VyZS5hYwkyMDI2LTAzLTMxIDE1OjM1OjA4Ljk4ODI2MjYxMiArMDEwMAot
QEAgLTQwMCw3ICs0MDAsNyBAQAorZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3Vy
ZS5hYworaW5kZXggYjJiMzY3OC4uZGQwMGU4NiAxMDA2NDQKKy0tLSBhL2NvbmZpZ3VyZS5hYwor
KysrIGIvY29uZmlndXJlLmFjCitAQCAtNDAwLDcgKzQwMCw3IEBAIGlmIHRlc3QgeCIkd2l0aF9h
cmNoX2giID0geCIiOyB0aGVuCiAgICAgICAgICAgICopCiAgICAgICAgICAgICAgQVJDSF9DT05G
X0hFQURFUj0KICAgICAgICAgICAgICBpZiB0ZXN0IHgiJGhvc3QiICE9IHgiJGJ1aWxkIjsgdGhl
bgpAQCAtMTcsMTggKzI0LDcgQEAgZGlmZiAtclUzIGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJl
LmFjCiAgICAgICAgICAgICAgZWxzZQogICAgICAgICAgICAgICAgQVJDSF9DT05GX0hFQURFUj0K
ICAgICAgICAgICAgICBmaQotQEAgLTg2OSw4ICs4NjksOCBAQAotIEFDX1NVQlNUKFJFQ1VSU0lW
RV9NVVRFWEFUVFIpCi0gCi0gZG5sIFRlc3NlcmFjdC9MZXB0b25pY2EgZGV0ZWN0aW9uCi0tVEVT
U0VSQUNURElSPXRlc3NlcmFjdAotLUxFUFRPTklDQURJUj1sZXB0b25pY2EKLStURVNTRVJBQ1RE
SVI9JHNyY2Rpci90ZXNzZXJhY3QKLStMRVBUT05JQ0FESVI9JHNyY2Rpci9sZXB0b25pY2EKLSBP
Q1JfVkVSU0lPTj0wCi0gT0NSX1NIQVJFRD0wCi0gTEVQVE9OSUNBSU5DTFVERT0KLUBAIC04ODYs
NyArODg2LDcgQEAKK0BAIC04ODksNyArODg5LDcgQEAgQUNfQVJHX1dJVEgoW3Rlc3NlcmFjdF0s
IEFTX0hFTFBfU1RSSU5HKFstLXdpdGhvdXQtdGVzc2VyYWN0XSwKICAKICBpZiB0ZXN0IHgkd2l0
aF90ZXNzZXJhY3QgIT0geG5vOyB0aGVuCiAgICBBQ19NU0dfQ0hFQ0tJTkcoW2ZvciBsb2NhbCBU
ZXNzZXJhY3QgbGlicmFyeSBzb3VyY2VdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0XzEwLjA3LjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDcuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3Rz
Y3JpcHRfMTAuMDcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2Ny
aXB0L2dob3N0c2NyaXB0XzEwLjA3LjEuYmIKaW5kZXggMWI2Y2I0YWFhZS4uMzI1NDg3MjAzNiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0c2NyaXB0
XzEwLjA3LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dob3N0c2NyaXB0L2dob3N0
c2NyaXB0XzEwLjA3LjEuYmIKQEAgLTI4LDcgKzI4LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dp
dGh1Yi5jb20vQXJ0aWZleFNvZnR3YXJlL2dob3N0cGRsLWRvd25sb2Fkcy9yZWxlYXNlcy9kb3du
bG8KICAgICAgICAgICAgZmlsZTovLzAwMDEtcHNpLXp0eXBlLmMtcmVwbGFjZS1zdGF0aWMtY29u
c3QtZG91YmxlLXdpdGgtbWFjcm9zLS5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImVkNmVhNjIwMjJlM2Y0ZDVhNjU2OWI2ZWZjOTM2MWI2M2E2ZDExOGJmY2Fk
OGYwYmViODk3YzM3ODg1YjVjYWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmZjNzQzNjJmOWJl
NmZhZTFiMGE2NWQzOGZkY2ZkNGYwYjUxOGNjM2IwN2M1NTgxZmI2NjFlYjRkMmUxNTI1MSIKIAog
UEFDS0FHRUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUdbZ3RrXSA9ICItLWVuYWJsZS1ndGss
LS1kaXNhYmxlLWd0ayxndGsrMyIKLS0gCjIuNDcuMQoK

--===============5250945285622376777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ghostscript/ghostscript-doc: FILELIST: directory renamed /usr/share/doc/ghostscript/10.07.0 -> /usr/share/doc/ghostscript/10.07.1
packages/x86-64-v3-poky-linux/ghostscript/ghostscript: FILELIST: directory renamed /usr/share/ghostscript/10.07.0/Resource/CIDFSubst -> /usr/share/ghostscript/10.07.1/Resource/CIDFSubst, directory renamed /usr/share/ghostscript/10.07.0/Resource/ColorSpace -> /usr/share/ghostscript/10.07.1/Resource/ColorSpace, directory renamed /usr/share/ghostscript/10.07.0/Resource/CMap -> /usr/share/ghostscript/10.07.1/Resource/CMap, directory renamed /usr/share/ghostscript/10.07.0/Resource/Decoding -> /usr/share/ghostscript/10.07.1/Resource/Decoding, directory renamed /usr/share/ghostscript/10.07.0/Resource/CIDFont -> /usr/share/ghostscript/10.07.1/Resource/CIDFont, directory renamed /usr/share/ghostscript/10.07.0/Resource/Init -> /usr/share/ghostscript/10.07.1/Resource/Init, directory renamed /usr/share/ghostscript/10.07.0/Resource/IdiomSet -> /usr/share/ghostscript/10.07.1/Resource/IdiomSet, directory renamed /usr/share/ghostscript/10.07.0/Resource/SubstCID -> /usr/share/ghostscript/10.07.1/Reso
 urce/SubstCID, directory renamed /usr/share/ghostscript/10.07.0/lib -> /usr/share/ghostscript/10.07.1/lib, directory renamed /usr/share/ghostscript/10.07.0/Resource/Encoding -> /usr/share/ghostscript/10.07.1/Resource/Encoding, directory renamed /usr/share/ghostscript/10.07.0/iccprofiles -> /usr/share/ghostscript/10.07.1/iccprofiles, directory renamed /usr/share/ghostscript/10.07.0/Resource/Font -> /usr/share/ghostscript/10.07.1/Resource/Font
Changes to packages/x86-64-v3-poky-linux/ghostscript (sysroot):
  /usr/share/ghostscript/10.07.0 moved to /usr/share/ghostscript/10.07.1

--===============5250945285622376777==--

