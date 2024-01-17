Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C7FC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 13:08:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.1534.1705496908911508500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 05:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JyaOf9bO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso34514095e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 05:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705496907; x=1706101707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLrlJo2RRLTW4OF9UL5muzFYct9HCmyO4H5wQ/NiWR4=;
        b=JyaOf9bOMpzEdEvehQ8hnMyBbuNTVojvFG/Gvfi2LhFZ5c9ceifLLvJhgIMm8SSYoa
         BWpL4D45QqQB/Nl9u9jZxHty78+Otx2/XKYAWKR7JGrEx7wI3eWvk4E4LBZtLNw4+I7I
         46C7TxjCQLTQOaV3e0HA2/3oPGEaMq5ryke70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705496907; x=1706101707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLrlJo2RRLTW4OF9UL5muzFYct9HCmyO4H5wQ/NiWR4=;
        b=kjGzY2E78wtXGVjJdSFRNNnSOzcXcP4K0ehHuAJ73oBM/L1biGBrD5/8SGsP0teE+G
         TxBtKxfRxJZvkIw+XYuRQ0dl24fhMArnyQCZGAm4fd/Het+bdWd20cE8zwaDsxCs5FH0
         9h1fjPGMB5ePwp42fWziCIdPrOBpZ79lw0PzcZMZeKoOwo7caJd3cuzSaDBUFwVku0/W
         OXhgxMVVeQDyKBZmueMQ9yEInQgagWLneKDQUSi+L2yX+LqOWukuvHiwZDa9Pb5U/90t
         YREZrDbgLrsLKo02o+eozIN508ePZM8vSVQfOIoUQ3E7VRiLUhaF1J5bzoelpSVPlM4J
         yD1Q==
X-Gm-Message-State: AOJu0YxLG0mFrdI8VM+Gwojhoz0ofCy0c2MldWbfdVgMdJSjBDT84NAh
	gQyPLTUM7mUjzBkCMcMAD09m9RI8q5LIggl5gpqH5Ev3pBQ=
X-Google-Smtp-Source: AGHT+IEyvt/jJZrTenXpWAyNlln54SV5gEsfZiNPuDf+bKInULRPIt3mPIon7ZtL9xBiP43NQXUf9g==
X-Received: by 2002:a05:600c:1d06:b0:40d:6293:fc69 with SMTP id l6-20020a05600c1d0600b0040d6293fc69mr2729475wms.28.1705496906909;
        Wed, 17 Jan 2024 05:08:26 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3c1d:bf3d:325f:7bb3])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c1c9400b0040e54f15d3dsm26263349wms.31.2024.01.17.05.08.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 05:08:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] libtool: Update patch offsets
Date: Wed, 17 Jan 2024 13:08:22 +0000
Message-Id: <20240117130822.3928928-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240117130822.3928928-1-richard.purdie@linuxfoundation.org>
References: <20240117130822.3928928-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 13:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193912

Our patches were rather out of sync, update the line offsets to match the current
patchset/underlying code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-trailing-slashes-on-install-command.patch |  4 ++--
 ...e-the-with-sysroot-option-to-avoid-c.patch | 19 ++++++++++---------
 ...-Add-missing-sysroot-to-library-path.patch |  4 ++--
 ...sroot-paths-being-encoded-into-RPATH.patch |  8 ++++----
 ...encode-RATHS-which-match-default-lin.patch |  8 ++++----
 ...r-static-libs-for-internal-compiler-.patch |  4 ++--
 ...-sure-autoheader-run-before-autoconf.patch |  2 +-
 ...-sure-autoheader-run-before-automake.patch |  2 +-
 ...eproducibility-stop-encoding-hostnam.patch |  4 ++--
 .../libtool/dont-depend-on-help2man.patch     |  3 ++-
 10 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
index 4c4d0547a36..51c0c52da8f 100644
--- a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
+++ b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
@@ -15,10 +15,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00010.html]
 
 diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
-index 96b37003..3d5dcd0a 100644
+index a5f21a1..f884824 100644
 --- a/build-aux/ltmain.in
 +++ b/build-aux/ltmain.in
-@@ -2378,8 +2378,14 @@ func_mode_install ()
+@@ -2381,8 +2381,14 @@ func_mode_install ()
  	func_append dir "$objdir"
  
  	if test -n "$relink_command"; then
diff --git a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch b/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
index 1920e2e6dbf..2126f829537 100644
--- a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
+++ b/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
@@ -84,9 +84,10 @@ Index: libtool-2.4.7/tests/sysroot.at
  AC_OUTPUT(Makefile)
  ]])
 diff --git a/tests/testsuite b/tests/testsuite
+index 24265e4..d388e3e 100755
 --- a/tests/testsuite
 +++ b/tests/testsuite
-@@ -48945,7 +48945,7 @@ $at_traceon; }
+@@ -48997,7 +48997,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -95,7 +96,7 @@ diff --git a/tests/testsuite b/tests/testsuite
  
  #???
  if test PATH = "$shlibpath_var"; then
-@@ -49154,7 +49154,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -49211,7 +49211,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -104,7 +105,7 @@ diff --git a/tests/testsuite b/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -49342,7 +49342,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -49404,7 +49404,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
@@ -113,7 +114,7 @@ diff --git a/tests/testsuite b/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -49694,7 +49694,7 @@ $at_traceon; }
+@@ -49761,7 +49761,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -122,7 +123,7 @@ diff --git a/tests/testsuite b/tests/testsuite
  
  #???
  if test PATH = "$shlibpath_var"; then
-@@ -49903,7 +49903,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -49975,7 +49975,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -131,7 +132,7 @@ diff --git a/tests/testsuite b/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -50091,7 +50091,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -50168,7 +50168,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
@@ -140,7 +141,7 @@ diff --git a/tests/testsuite b/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -50443,7 +50443,7 @@ $at_traceon; }
+@@ -50525,7 +50525,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -149,7 +150,7 @@ diff --git a/tests/testsuite b/tests/testsuite
  
  #???
  if test PATH = "$shlibpath_var"; then
-@@ -50652,7 +50652,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -50739,7 +50739,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -158,7 +159,7 @@ diff --git a/tests/testsuite b/tests/testsuite
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -50840,7 +50840,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -50932,7 +50932,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
diff --git a/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch b/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
index 07c7f911e08..35f48ef906a 100644
--- a/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
+++ b/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
@@ -11,10 +11,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00017.html]
 
 diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
-index 3d5dcd0a..2c994612 100644
+index f884824..25a91de 100644
 --- a/build-aux/ltmain.in
 +++ b/build-aux/ltmain.in
-@@ -6475,7 +6475,7 @@ func_mode_link ()
+@@ -6503,7 +6503,7 @@ func_mode_link ()
  	      fi
  	    else
  	      # We cannot seem to hardcode it, guess we'll fake it.
diff --git a/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch b/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
index 4fcf456b0b8..9203302182d 100644
--- a/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
+++ b/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
@@ -10,10 +10,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00009.html]
 
 diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
-index 2c994612..96238350 100644
+index 25a91de..40cb94a 100644
 --- a/build-aux/ltmain.in
 +++ b/build-aux/ltmain.in
-@@ -7654,9 +7654,11 @@ EOF
+@@ -7682,9 +7682,11 @@ EOF
  	  test relink = "$opt_mode" || rpath=$compile_rpath$rpath
  	  for libdir in $rpath; do
  	    if test -n "$hardcode_libdir_flag_spec"; then
@@ -27,7 +27,7 @@ index 2c994612..96238350 100644
  		if test -z "$hardcode_libdirs"; then
  		  hardcode_libdirs=$libdir
  		else
-@@ -8386,6 +8388,10 @@ EOF
+@@ -8414,6 +8416,10 @@ EOF
        hardcode_libdirs=
        for libdir in $compile_rpath $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
@@ -38,7 +38,7 @@ index 2c994612..96238350 100644
  	  if test -n "$hardcode_libdir_separator"; then
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs=$libdir
-@@ -8437,6 +8443,10 @@ EOF
+@@ -8465,6 +8471,10 @@ EOF
        hardcode_libdirs=
        for libdir in $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
diff --git a/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch b/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
index 589a33e8a66..8b6352b01b4 100644
--- a/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
+++ b/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
@@ -13,10 +13,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00013.html]
 
 diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
-index 96238350..6fb58ed2 100644
+index 40cb94a..2fa055e 100644
 --- a/build-aux/ltmain.in
 +++ b/build-aux/ltmain.in
-@@ -7672,8 +7672,16 @@ EOF
+@@ -7700,8 +7700,16 @@ EOF
  		  esac
  		fi
  	      else
@@ -35,7 +35,7 @@ index 96238350..6fb58ed2 100644
  	      fi
  	    elif test -n "$runpath_var"; then
  	      case "$perm_rpath " in
-@@ -8406,8 +8414,16 @@ EOF
+@@ -8434,8 +8442,16 @@ EOF
  	      esac
  	    fi
  	  else
@@ -54,7 +54,7 @@ index 96238350..6fb58ed2 100644
  	  fi
  	elif test -n "$runpath_var"; then
  	  case "$perm_rpath " in
-@@ -8461,8 +8477,14 @@ EOF
+@@ -8489,8 +8505,14 @@ EOF
  	      esac
  	    fi
  	  else
diff --git a/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch b/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
index 83c74373ae0..c151c3b4813 100644
--- a/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
+++ b/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
@@ -16,10 +16,10 @@ https://debbugs.gnu.org/cgi/bugreport.cgi?bug=27866
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00016.html]
 
 diff --git a/m4/libtool.m4 b/m4/libtool.m4
-index 180dd9d1..022c1292 100644
+index bd90775..3794130 100644
 --- a/m4/libtool.m4
 +++ b/m4/libtool.m4
-@@ -7560,7 +7560,7 @@ if AC_TRY_EVAL(ac_compile); then
+@@ -7556,7 +7556,7 @@ if AC_TRY_EVAL(ac_compile); then
    for p in `eval "$output_verbose_link_cmd"`; do
      case $prev$p in
  
diff --git a/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch b/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
index 1543ad2afd5..f51deecbef2 100644
--- a/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
+++ b/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
@@ -14,7 +14,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=e7dc729dd27b367905cd0ce52b5466d91537857a]
 
 diff --git a/Makefile.am b/Makefile.am
-index 6b546092..84795d87 100644
+index c29860e..9c34bfd 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -370,7 +370,7 @@ lt_configure_deps = $(lt_aclocal_m4) $(lt_aclocal_m4_deps)
diff --git a/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch b/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
index 67bd27ac928..e451de59e33 100644
--- a/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
+++ b/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
@@ -16,7 +16,7 @@ Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
 diff --git a/Makefile.am b/Makefile.am
-index 84795d87..8c9949ed 100644
+index 9c34bfd..231ef3f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -333,7 +333,7 @@ EXTRA_DIST     += $(lt_aclocal_m4) \
diff --git a/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
index b0f771c9bbc..8469b8727e1 100644
--- a/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
+++ b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
@@ -13,10 +13,10 @@ https://sources.debian.org/data/main/libt/libtool/2.4.6-10/debian/patches/
 Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=bd826173c4c9c3fa8d77d92785754897cb4bfd89]
 
 diff --git a/m4/libtool.m4 b/m4/libtool.m4
-index 022c1292..1a8a2998 100644
+index 3794130..84a550c 100644
 --- a/m4/libtool.m4
 +++ b/m4/libtool.m4
-@@ -728,7 +728,6 @@ _LT_CONFIG_SAVE_COMMANDS([
+@@ -730,7 +730,6 @@ _LT_CONFIG_SAVE_COMMANDS([
      cat <<_LT_EOF >> "$cfgfile"
  #! $SHELL
  # Generated automatically by $as_me ($PACKAGE) $VERSION
diff --git a/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch b/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
index fd4084c8594..0013d165445 100644
--- a/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
+++ b/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
@@ -4,9 +4,10 @@ Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 Updated by: Robert Yang <liezhi.yang@windriver.com>
 
 diff --git a/Makefile.am b/Makefile.am
+index 7bd7f72..c29860e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -404,21 +404,6 @@ $(notes_txt): $(notes_texi)
+@@ -411,21 +411,6 @@ $(notes_txt): $(notes_texi)
  	$(AM_V_GEN)$(MAKEINFO) -P '$(srcdir)/doc' --no-headers \
  	    $(MAKEINFOFLAGS) -o '$@' '$(notes_texi)'
  
-- 
2.39.2


