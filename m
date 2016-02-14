Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 317EA7002B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:53:00 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id b35so98554691qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 12:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q1M2EcUmOSYyvVFxwrN3+MomzQctUCsQL7op1b6cTak=;
	b=pBSvk4QSOI/AHV9YKhQy4W5rIjWqikJ4vWasndcB/qbVrYshp3zWr5yHq2aqxtHHxu
	jeSRj3qQaC6pWjC5ySuzR4jAMDc51IB8afXWgDOCCWP+6ZHXFGl27Q/4sf+W4rSEUO0I
	9IEfu9jcJmrA6fwSTJSlYVUutqAMUF0NNllnhseMzb+7/225CZOmEjxz6opLapIrtS2T
	MRgeIdfOSvZMZ5YKA/MXSQQHwXDCf0Wlikgfdw4oDLuhgeJsezPiP46L4Jch6c7akptf
	wBOarAIgItXRlq8K92Mkg+u1MHiThAnTL6RgpBD6BZuNozcPVLlhXDw3bYqyaiMkHtWW
	+inw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q1M2EcUmOSYyvVFxwrN3+MomzQctUCsQL7op1b6cTak=;
	b=HGy/ne0r7W3/i+oLZecF7SA4U+J69pC96RfyS6xc/CzAmo3TPemF5WG7bEowDPoEOO
	NNQvS2PBkbeGGRMJIcBhrSTphuvWWSxALad5NH/vYYYGmBEB9albRZMR1BT2ht0b0GWy
	1qzn5cesVCtxt227TG9/i+h8EZzFi+cD/EyU8Go7xx/IlkcsCmAX/b6qacK7JNFP1aZm
	l7umN3AblR4EjSxNnjmNS6t3TbiCodS5CRuqv8zF7PXeJO528NRwbawb9oKW75coHU2G
	wvZL3QnGdHAPxIYgFEbIYyG4cykikZzJ7u/BFT4vuv6d+6H7GlpYRRBTqVIpfNPhdqQ1
	H5Gg==
X-Gm-Message-State: AG10YORUyBeKGgu9ruawzTK2WETBR8nCEtjzzFLVdisAVOpN7DYWkb022h+hR617rmsqpg==
X-Received: by 10.140.43.37 with SMTP id d34mr16093212qga.51.1455483181363;
	Sun, 14 Feb 2016 12:53:01 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	q22sm9893272qkl.19.2016.02.14.12.53.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 12:53:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Feb 2016 20:52:51 +0000
Message-Id: <1455483171-66851-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
References: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 5/5] binutils: Use tip of 2.26 branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Feb 2016 20:53:01 -0000

Until 2.26.1 is released there are few fixes which are needed especially
when using -fpie, here are changes that are part of this version bump

H.J. Lu (7):
      Add a testcase for PR ld/18591
      Store estimated distances in compressed_size
      Remove duplicated marker for 2.26 in gas/NEWS
      Add -mrelax-relocations= to x86 assembler
      Mask off the least significant bit in GOT offset
      Enable -Bsymbolic and -Bsymbolic-functions to PIE
      Fix a typo in objcopy manual

John David Anglin (1):
      Fix /usr/bin/ld: final link failed: File truncated error on hppa

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.26.inc   |   6 +-
 .../binutils/0001-Generate-relocatable-SDKs.patch  |   6 +-
 ...ure-widen-the-regexp-for-SH-architectures.patch |   8 +-
 .../0003-Point-scripts-location-to-libdir.patch    |   6 +-
 ...te-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   6 +-
 .../0005-Explicitly-link-with-libm-on-uclibc.patch |   6 +-
 .../binutils/binutils/0006-Use-libtool-2.4.patch   | 242 ++++++++++-----------
 ...7-Add-the-armv5e-architecture-to-binutils.patch |   6 +-
 ...he-distro-compiler-point-to-the-wrong-ins.patch |   6 +-
 ...es-of-system-directories-when-cross-linki.patch |  16 +-
 ...-rpath-in-libtool-when-sysroot-is-enabled.patch |   6 +-
 ...Change-default-emulation-for-mips64-linux.patch |   6 +-
 ...tch => 0012-Add-support-for-Netlogic-XLP.patch} |  17 +-
 ...ress-computations-in-initial-PLT-entries-.patch |   6 +-
 ...014-Correct-nios2-_gp-address-computation.patch |   6 +-
 15 files changed, 173 insertions(+), 176 deletions(-)
 rename meta/recipes-devtools/binutils/binutils/{0012-Add-XLP-instructions-support.patch => 0012-Add-support-for-Netlogic-XLP.patch} (97%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.26.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
index dd5c8ca..6d535fc 100644
--- a/meta/recipes-devtools/binutils/binutils-2.26.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "3c9d874373f2189cb704999b0ba39b9bbca91a61"
+SRCREV = "71fa566a9cf2597b60a58c1d7c148bab637454a6"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0002-configure-widen-the-regexp-for-SH-architectures.patch \
@@ -31,10 +31,10 @@ SRC_URI = "\
      file://0009-warn-for-uses-of-system-directories-when-cross-linki.patch \
      file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
      file://0011-Change-default-emulation-for-mips64-linux.patch \
-     file://0012-Add-XLP-instructions-support.patch \
+     file://0012-Add-support-for-Netlogic-XLP.patch \
      file://0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch \
      file://0014-Correct-nios2-_gp-address-computation.patch \
-     "
+"
 S  = "${WORKDIR}/git"
 
 do_configure_prepend () {
diff --git a/meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch
index f5cffff..91f9017 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch
@@ -1,7 +1,7 @@
-From c2263f6e910f43637fb514de5c48e9ce6a8d55f1 Mon Sep 17 00:00:00 2001
+From 3c75355342a8562ccb65b8bbbe81a0495fec5c57 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
-Subject: [PATCH 01/12] Generate relocatable SDKs
+Subject: [PATCH 01/14] Generate relocatable SDKs
 
 This patch will modify the ELF linker scripts so that the crosssdk
 linker will generate binaries with a 4096 bytes PT_INTERP section. When the binaries
@@ -58,5 +58,5 @@ index ec78c90..f9e7a31 100644
  if test -z "$PLT"; then
    IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch
index 83995c4..4a202d0 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch
@@ -1,7 +1,7 @@
-From 301ad846e3a3ea0b49243c6276aa7dcc3fa5cc59 Mon Sep 17 00:00:00 2001
+From b1ae604880562ed065f614a745d3f8922838bc5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:07:33 +0000
-Subject: [PATCH 02/12] configure: widen the regexp for SH architectures
+Subject: [PATCH 02/14] configure: widen the regexp for SH architectures
 
 gprof needs to know about uclibc
 
@@ -36,7 +36,7 @@ index 34b66f7..85414ab 100755
        sh*-*-elf)
           ;;
 diff --git a/gprof/configure b/gprof/configure
-index 2702da1..7dcd141 100755
+index 693b927..d4db554 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -5869,6 +5869,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
@@ -52,5 +52,5 @@ index 2702da1..7dcd141 100755
    if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch
index 935f949..2c70ecd 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch
@@ -1,7 +1,7 @@
-From 887db9238821b4f1f5f469f9c825ed9b2e2dc719 Mon Sep 17 00:00:00 2001
+From 01808e8ef8ee709c8218d962601c18a63a063a1f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
-Subject: [PATCH 03/12] Point scripts location to libdir
+Subject: [PATCH 03/14] Point scripts location to libdir
 
 Upstream-Status: Inappropriate [debian patch]
 
@@ -38,5 +38,5 @@ index ed98f87..530e4c9 100644
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index fb9bbd6..8f0a402 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,7 +1,7 @@
-From 0d76940b5507406719635ee154a29e80a8cb1234 Mon Sep 17 00:00:00 2001
+From c008c7f97c1cf487749c6c375820a1f3b3c6c53d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:27:17 +0000
-Subject: [PATCH 04/12] Only generate an RPATH entry if LD_RUN_PATH is not
+Subject: [PATCH 04/14] Only generate an RPATH entry if LD_RUN_PATH is not
  empty
 
 for cases where -rpath isn't specified. debian (#151024)
@@ -37,5 +37,5 @@ index 0405d4f..73c5447 100644
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch b/meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch
index 9111abf..92ead7f 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch
@@ -1,7 +1,7 @@
-From 589cc10e54b95607d2728ee37e9387140bf5eb32 Mon Sep 17 00:00:00 2001
+From 6a41635e29c4a6c064b1f66e79a8fe2026f4361b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:32:49 +0000
-Subject: [PATCH 05/12] Explicitly link with libm on uclibc
+Subject: [PATCH 05/14] Explicitly link with libm on uclibc
 
 Description:
 
@@ -48,5 +48,5 @@ index 0b490d4..086e0d2 100644
    aarch64 | alpha | arm | i386 | ia64 | microblaze | mips | ns32k | or1k | or1knd | pdp11 | ppc | sparc | z80 | z8k)
      bfd_gas=yes
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
index 779efd4..e54ab1b 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
@@ -1,7 +1,7 @@
-From 807b3164599359644dddd1c853a73a51165c026c Mon Sep 17 00:00:00 2001
+From da70f0876cdd8ed703d9ed1524212ccfefb09ef3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Jan 2016 06:26:54 +0000
-Subject: [PATCH 06/12] Use libtool 2.4
+Date: Sun, 14 Feb 2016 17:04:07 +0000
+Subject: [PATCH 06/14] Use libtool 2.4
 
 get libtool sysroot support
 
@@ -27,7 +27,7 @@ Upstream-Status: Pending
  15 files changed, 9944 insertions(+), 3709 deletions(-)
 
 diff --git a/bfd/configure b/bfd/configure
-index 217ac69..2ef4b9e 100755
+index 7411c6d..eae743e 100755
 --- a/bfd/configure
 +++ b/bfd/configure
 @@ -670,6 +670,9 @@ OTOOL
@@ -1960,7 +1960,7 @@ index 6f5e85f..44bd02c 100644
  
  # More hacks to build DLLs on Windows.
 diff --git a/binutils/configure b/binutils/configure
-index bbabdc6..9150d42 100755
+index d4f3e1e..a6df5bb 100755
 --- a/binutils/configure
 +++ b/binutils/configure
 @@ -657,8 +657,11 @@ OTOOL
@@ -3288,7 +3288,7 @@ index bbabdc6..9150d42 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15354,13 +16009,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15355,13 +16010,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3309,7 +3309,7 @@ index bbabdc6..9150d42 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15375,14 +16037,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15376,14 +16038,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3328,7 +3328,7 @@ index bbabdc6..9150d42 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15415,12 +16080,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15416,12 +16081,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3342,7 +3342,7 @@ index bbabdc6..9150d42 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15475,8 +16140,13 @@ reload_flag \
+@@ -15476,8 +16141,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3356,7 +3356,7 @@ index bbabdc6..9150d42 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15486,12 +16156,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15487,12 +16157,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3372,7 +3372,7 @@ index bbabdc6..9150d42 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15507,7 +16179,6 @@ no_undefined_flag \
+@@ -15508,7 +16180,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3380,7 +3380,7 @@ index bbabdc6..9150d42 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15543,6 +16214,7 @@ module_cmds \
+@@ -15544,6 +16215,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3388,7 +3388,7 @@ index bbabdc6..9150d42 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16300,7 +16972,8 @@ $as_echo X"$file" |
+@@ -16301,7 +16973,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3398,7 +3398,7 @@ index bbabdc6..9150d42 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16403,19 +17076,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16404,19 +17077,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3442,7 +3442,7 @@ index bbabdc6..9150d42 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16445,6 +17141,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16446,6 +17142,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3455,7 +3455,7 @@ index bbabdc6..9150d42 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16454,6 +17156,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16455,6 +17157,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3465,7 +3465,7 @@ index bbabdc6..9150d42 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16568,12 +17273,12 @@ with_gcc=$GCC
+@@ -16569,12 +17274,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3481,7 +3481,7 @@ index bbabdc6..9150d42 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16660,9 +17365,6 @@ inherit_rpath=$inherit_rpath
+@@ -16661,9 +17366,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3491,7 +3491,7 @@ index bbabdc6..9150d42 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16678,6 +17380,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16679,6 +17381,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3501,7 +3501,7 @@ index bbabdc6..9150d42 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16710,210 +17415,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16711,210 +17416,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3898,7 +3898,7 @@ index 85414ab..34b66f7 100755
        sh*-*-elf)
           ;;
 diff --git a/gas/configure b/gas/configure
-index f2864b7..1c2a665 100755
+index dd9c953..89f18b3 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -647,8 +647,11 @@ OTOOL
@@ -3921,7 +3921,7 @@ index f2864b7..1c2a665 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1427,6 +1431,8 @@ Optional Packages:
+@@ -1430,6 +1434,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -3930,7 +3930,7 @@ index f2864b7..1c2a665 100755
    --with-system-zlib      use installed libz
  
  Some influential environment variables:
-@@ -4906,8 +4912,8 @@ esac
+@@ -4909,8 +4915,8 @@ esac
  
  
  
@@ -3941,7 +3941,7 @@ index f2864b7..1c2a665 100755
  
  
  
-@@ -4947,7 +4953,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4950,7 +4956,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -3950,7 +3950,7 @@ index f2864b7..1c2a665 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5633,8 +5639,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5636,8 +5642,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -3961,7 +3961,7 @@ index f2864b7..1c2a665 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5683,6 +5689,80 @@ esac
+@@ -5686,6 +5692,80 @@ esac
  
  
  
@@ -4042,7 +4042,7 @@ index f2864b7..1c2a665 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5699,6 +5779,11 @@ case $reload_flag in
+@@ -5702,6 +5782,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -4054,7 +4054,7 @@ index f2864b7..1c2a665 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5867,7 +5952,8 @@ mingw* | pw32*)
+@@ -5870,7 +5955,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -4064,7 +4064,7 @@ index f2864b7..1c2a665 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6021,6 +6107,21 @@ esac
+@@ -6024,6 +6110,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -4086,7 +4086,7 @@ index f2864b7..1c2a665 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6036,9 +6137,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6039,9 +6140,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -4251,7 +4251,7 @@ index f2864b7..1c2a665 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6054,7 +6308,7 @@ do
+@@ -6057,7 +6311,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -4260,7 +4260,7 @@ index f2864b7..1c2a665 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6074,11 +6328,15 @@ $as_echo "no" >&6; }
+@@ -6077,11 +6331,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -4279,7 +4279,7 @@ index f2864b7..1c2a665 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6094,7 +6352,7 @@ do
+@@ -6097,7 +6355,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -4288,7 +4288,7 @@ index f2864b7..1c2a665 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6113,6 +6371,10 @@ else
+@@ -6116,6 +6374,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -4299,7 +4299,7 @@ index f2864b7..1c2a665 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6124,12 +6386,10 @@ ac_tool_warned=yes ;;
+@@ -6127,12 +6389,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -4314,7 +4314,7 @@ index f2864b7..1c2a665 100755
  
  
  
-@@ -6141,6 +6401,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6144,6 +6404,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -4379,7 +4379,7 @@ index f2864b7..1c2a665 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6475,8 +6793,8 @@ esac
+@@ -6478,8 +6796,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -4390,7 +4390,7 @@ index f2864b7..1c2a665 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6512,6 +6830,7 @@ for ac_symprfx in "" "_"; do
+@@ -6515,6 +6833,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -4398,7 +4398,7 @@ index f2864b7..1c2a665 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6553,6 +6872,18 @@ _LT_EOF
+@@ -6556,6 +6875,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -4417,7 +4417,7 @@ index f2864b7..1c2a665 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6564,7 +6895,7 @@ _LT_EOF
+@@ -6567,7 +6898,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -4426,7 +4426,7 @@ index f2864b7..1c2a665 100755
    const char *name;
    void       *address;
  }
-@@ -6590,8 +6921,8 @@ static const void *lt_preloaded_setup() {
+@@ -6593,8 +6924,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4437,7 +4437,7 @@ index f2864b7..1c2a665 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6601,8 +6932,8 @@ _LT_EOF
+@@ -6604,8 +6935,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -4448,7 +4448,7 @@ index f2864b7..1c2a665 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6639,6 +6970,21 @@ else
+@@ -6642,6 +6973,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4470,7 +4470,7 @@ index f2864b7..1c2a665 100755
  
  
  
-@@ -6657,6 +7003,40 @@ fi
+@@ -6660,6 +7006,40 @@ fi
  
  
  
@@ -4511,7 +4511,7 @@ index f2864b7..1c2a665 100755
  
  
  
-@@ -6866,6 +7246,123 @@ esac
+@@ -6869,6 +7249,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -4635,7 +4635,7 @@ index f2864b7..1c2a665 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7429,6 +7926,8 @@ _LT_EOF
+@@ -7432,6 +7929,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -4644,7 +4644,7 @@ index f2864b7..1c2a665 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7624,7 +8123,8 @@ fi
+@@ -7627,7 +8126,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -4654,7 +4654,7 @@ index f2864b7..1c2a665 100755
  
  
  
-@@ -7713,7 +8213,7 @@ aix3*)
+@@ -7716,7 +8216,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -4663,7 +4663,7 @@ index f2864b7..1c2a665 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8011,8 +8511,6 @@ fi
+@@ -8014,8 +8514,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -4672,7 +4672,7 @@ index f2864b7..1c2a665 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8178,6 +8676,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8181,6 +8679,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4685,7 +4685,7 @@ index f2864b7..1c2a665 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8240,7 +8744,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8243,7 +8747,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4694,7 +4694,7 @@ index f2864b7..1c2a665 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8297,13 +8801,17 @@ case $host_os in
+@@ -8300,13 +8804,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -4718,7 +4718,7 @@ index f2864b7..1c2a665 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8364,6 +8872,11 @@ fi
+@@ -8367,6 +8875,11 @@ fi
  
  
  
@@ -4730,7 +4730,7 @@ index f2864b7..1c2a665 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8714,7 +9227,8 @@ _LT_EOF
+@@ -8717,7 +9230,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -4740,7 +4740,7 @@ index f2864b7..1c2a665 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8813,12 +9327,12 @@ _LT_EOF
+@@ -8816,12 +9330,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -4755,7 +4755,7 @@ index f2864b7..1c2a665 100755
  	  fi
  	  ;;
  	esac
-@@ -8832,8 +9346,8 @@ _LT_EOF
+@@ -8835,8 +9349,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -4766,7 +4766,7 @@ index f2864b7..1c2a665 100755
        fi
        ;;
  
-@@ -8851,8 +9365,8 @@ _LT_EOF
+@@ -8854,8 +9368,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4777,7 +4777,7 @@ index f2864b7..1c2a665 100755
        else
  	ld_shlibs=no
        fi
-@@ -8898,8 +9412,8 @@ _LT_EOF
+@@ -8901,8 +9415,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4788,7 +4788,7 @@ index f2864b7..1c2a665 100755
        else
  	ld_shlibs=no
        fi
-@@ -9029,7 +9543,13 @@ _LT_EOF
+@@ -9032,7 +9546,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -4803,7 +4803,7 @@ index f2864b7..1c2a665 100755
  /* end confdefs.h.  */
  
  int
-@@ -9042,22 +9562,29 @@ main ()
+@@ -9045,22 +9565,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4846,7 +4846,7 @@ index f2864b7..1c2a665 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9069,7 +9596,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9072,7 +9599,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4861,7 +4861,7 @@ index f2864b7..1c2a665 100755
  /* end confdefs.h.  */
  
  int
-@@ -9082,22 +9615,29 @@ main ()
+@@ -9085,22 +9618,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4904,7 +4904,7 @@ index f2864b7..1c2a665 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9142,20 +9682,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9145,20 +9685,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -4982,7 +4982,7 @@ index f2864b7..1c2a665 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9216,7 +9799,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9219,7 +9802,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -4991,7 +4991,7 @@ index f2864b7..1c2a665 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9224,7 +9807,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9227,7 +9810,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -5000,7 +5000,7 @@ index f2864b7..1c2a665 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9240,7 +9823,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9243,7 +9826,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -5009,7 +5009,7 @@ index f2864b7..1c2a665 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9264,10 +9847,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9267,10 +9850,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -5022,7 +5022,7 @@ index f2864b7..1c2a665 100755
  	  ;;
  	esac
        else
-@@ -9346,23 +9929,36 @@ fi
+@@ -9349,23 +9932,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -5067,7 +5067,7 @@ index f2864b7..1c2a665 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9447,7 +10043,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9450,7 +10046,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5076,7 +5076,7 @@ index f2864b7..1c2a665 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9466,9 +10062,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9469,9 +10065,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5088,7 +5088,7 @@ index f2864b7..1c2a665 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10044,8 +10640,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10047,8 +10643,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -5100,7 +5100,7 @@ index f2864b7..1c2a665 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10078,13 +10675,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10081,13 +10678,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -5173,7 +5173,7 @@ index f2864b7..1c2a665 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10176,7 +10831,7 @@ haiku*)
+@@ -10179,7 +10834,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -5182,16 +5182,16 @@ index f2864b7..1c2a665 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -10972,7 +11627,7 @@ else
+@@ -10975,7 +11630,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10975 "configure"
+-#line 10978 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11016,10 +11671,10 @@ else
+@@ -11019,10 +11674,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5204,16 +5204,16 @@ index f2864b7..1c2a665 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11078,7 +11733,7 @@ else
+@@ -11081,7 +11736,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11081 "configure"
+-#line 11084 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11122,10 +11777,10 @@ else
+@@ -11125,10 +11780,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5226,7 +5226,7 @@ index f2864b7..1c2a665 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15241,13 +15896,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15276,13 +15931,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5247,7 +5247,7 @@ index f2864b7..1c2a665 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15262,14 +15924,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15297,14 +15959,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5266,7 +5266,7 @@ index f2864b7..1c2a665 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15302,12 +15967,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15337,12 +16002,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5280,7 +5280,7 @@ index f2864b7..1c2a665 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15362,8 +16027,13 @@ reload_flag \
+@@ -15397,8 +16062,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5294,7 +5294,7 @@ index f2864b7..1c2a665 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15373,12 +16043,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15408,12 +16078,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5310,7 +5310,7 @@ index f2864b7..1c2a665 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15394,7 +16066,6 @@ no_undefined_flag \
+@@ -15429,7 +16101,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5318,7 +5318,7 @@ index f2864b7..1c2a665 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15430,6 +16101,7 @@ module_cmds \
+@@ -15465,6 +16136,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5326,7 +5326,7 @@ index f2864b7..1c2a665 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16194,7 +16866,8 @@ $as_echo X"$file" |
+@@ -16229,7 +16901,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5336,7 +5336,7 @@ index f2864b7..1c2a665 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16297,19 +16970,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16332,19 +17005,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5380,7 +5380,7 @@ index f2864b7..1c2a665 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16339,6 +17035,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16374,6 +17070,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5393,7 +5393,7 @@ index f2864b7..1c2a665 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16348,6 +17050,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16383,6 +17085,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5403,7 +5403,7 @@ index f2864b7..1c2a665 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16462,12 +17167,12 @@ with_gcc=$GCC
+@@ -16497,12 +17202,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5419,7 +5419,7 @@ index f2864b7..1c2a665 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16554,9 +17259,6 @@ inherit_rpath=$inherit_rpath
+@@ -16589,9 +17294,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5429,7 +5429,7 @@ index f2864b7..1c2a665 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16572,6 +17274,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16607,6 +17309,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5439,7 +5439,7 @@ index f2864b7..1c2a665 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16604,210 +17309,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16639,210 +17344,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5814,7 +5814,7 @@ index f2864b7..1c2a665 100755
    chmod +x "$ofile"
  
 diff --git a/gprof/configure b/gprof/configure
-index 7dcd141..45b2592 100755
+index d4db554..78b292c 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -629,8 +629,11 @@ OTOOL
@@ -7742,7 +7742,7 @@ index 7dcd141..45b2592 100755
    chmod +x "$ofile"
  
 diff --git a/ld/configure b/ld/configure
-index b900175..7a20e4e 100755
+index 8095b71..eb4f0d7 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -657,8 +657,11 @@ OTOOL
@@ -9683,7 +9683,7 @@ index b900175..7a20e4e 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -17952,13 +18788,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17953,13 +18789,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9704,7 +9704,7 @@ index b900175..7a20e4e 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17973,14 +18816,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17974,14 +18817,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9723,7 +9723,7 @@ index b900175..7a20e4e 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18013,12 +18859,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18014,12 +18860,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9737,7 +9737,7 @@ index b900175..7a20e4e 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18057,8 +18903,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -18058,8 +18904,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9747,7 +9747,7 @@ index b900175..7a20e4e 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18085,12 +18931,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -18086,12 +18932,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9761,7 +9761,7 @@ index b900175..7a20e4e 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18128,8 +18974,13 @@ reload_flag \
+@@ -18129,8 +18975,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9775,7 +9775,7 @@ index b900175..7a20e4e 100755
  STRIP \
  RANLIB \
  CC \
-@@ -18139,12 +18990,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18140,12 +18991,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9791,7 +9791,7 @@ index b900175..7a20e4e 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18160,7 +19013,6 @@ no_undefined_flag \
+@@ -18161,7 +19014,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9799,7 +9799,7 @@ index b900175..7a20e4e 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18182,8 +19034,8 @@ LD_CXX \
+@@ -18183,8 +19035,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9809,7 +9809,7 @@ index b900175..7a20e4e 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -18195,7 +19047,6 @@ no_undefined_flag_CXX \
+@@ -18196,7 +19048,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9817,7 +9817,7 @@ index b900175..7a20e4e 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18229,6 +19080,7 @@ module_cmds \
+@@ -18230,6 +19081,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9825,7 +9825,7 @@ index b900175..7a20e4e 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18243,7 +19095,8 @@ archive_expsym_cmds_CXX \
+@@ -18244,7 +19096,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9835,7 +9835,7 @@ index b900175..7a20e4e 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -19036,7 +19889,8 @@ $as_echo X"$file" |
+@@ -19037,7 +19890,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9845,7 +9845,7 @@ index b900175..7a20e4e 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -19139,19 +19993,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19140,19 +19994,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9889,7 +9889,7 @@ index b900175..7a20e4e 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19181,6 +20058,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19182,6 +20059,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9902,7 +9902,7 @@ index b900175..7a20e4e 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19190,6 +20073,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19191,6 +20074,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -9912,7 +9912,7 @@ index b900175..7a20e4e 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19304,12 +20190,12 @@ with_gcc=$GCC
+@@ -19305,12 +20191,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -9928,7 +9928,7 @@ index b900175..7a20e4e 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19396,9 +20282,6 @@ inherit_rpath=$inherit_rpath
+@@ -19397,9 +20283,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -9938,7 +9938,7 @@ index b900175..7a20e4e 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19414,6 +20297,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19415,6 +20298,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -9948,7 +9948,7 @@ index b900175..7a20e4e 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19460,210 +20346,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19461,210 +20347,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10322,7 +10322,7 @@ index b900175..7a20e4e 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -19691,12 +20536,12 @@ with_gcc=$GCC_CXX
+@@ -19692,12 +20537,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10338,7 +10338,7 @@ index b900175..7a20e4e 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -19783,9 +20628,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -19784,9 +20629,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10348,7 +10348,7 @@ index b900175..7a20e4e 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -19801,6 +20643,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -19802,6 +20644,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -17442,7 +17442,7 @@ index bf92b5e..c573da9 100644
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
 diff --git a/opcodes/configure b/opcodes/configure
-index 1ff66fa..d20abf3 100755
+index eedb184..d3076e1 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -648,6 +648,9 @@ OTOOL
@@ -21291,5 +21291,5 @@ index 8378857..7584940 100755
    chmod +x "$ofile"
  
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
index 0319ba6..cb3f83b 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
@@ -1,7 +1,7 @@
-From 61789a45c6193519b9da9dd0fa9a94532faaa4a9 Mon Sep 17 00:00:00 2001
+From 4ff9dbe13f38e4fea24fbcc9879cf7352c0561ff Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:37:10 +0000
-Subject: [PATCH 07/12] Add the armv5e architecture to binutils
+Subject: [PATCH 07/14] Add the armv5e architecture to binutils
 
 Binutils has a comment that indicates it is supposed to match gcc for
 all of the support "-march=" settings, but it was lacking the armv5e setting.
@@ -31,5 +31,5 @@ index 3bd4bc9..5d99921 100644
    ARM_ARCH_OPT ("armv5txm",	ARM_ARCH_V5TxM,	 FPU_ARCH_VFP),
    ARM_ARCH_OPT ("armv5te",	ARM_ARCH_V5TE,	 FPU_ARCH_VFP),
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index ad1901e..f8382f8 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,7 +1,7 @@
-From 0ccefb615b5316e71c1ed9bab80aa4eafb26167a Mon Sep 17 00:00:00 2001
+From cb36d94dbd521752e6444418af500e139a26eabb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
-Subject: [PATCH 08/12] don't let the distro compiler point to the wrong
+Subject: [PATCH 08/14] don't let the distro compiler point to the wrong
  installation location
 
 Thanks to RP for helping find the source code causing the issue.
@@ -31,5 +31,5 @@ index 7d7e2f4..1aaaf0e 100644
  	if test -n "${target_header_dir}"; then \
  		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
index b14ead0..d3f510b 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,7 +1,7 @@
-From e5d18410cb07da09f854b9568f51a873f1166d2a Mon Sep 17 00:00:00 2001
+From 4daa841ce16ba52b717bdff9eb1dfc4f19638814 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
-Subject: [PATCH 09/12] warn for uses of system directories when cross linking
+Subject: [PATCH 09/14] warn for uses of system directories when cross linking
 
 2008-07-02  Joseph Myers  <joseph@codesourcery.com>
 
@@ -77,7 +77,7 @@ index 276fb77..35c58eb 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 7a20e4e..7cff36c 100755
+index eb4f0d7..e9054b4 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -790,6 +790,7 @@ with_lib_path
@@ -118,7 +118,7 @@ index 7a20e4e..7cff36c 100755
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 188172d..2cd8443 100644
+index e28f38e..7b474e7 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
@@ -158,10 +158,10 @@ index d84ec4e..3476b26 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texinfo b/ld/ld.texinfo
-index 1dd7492..fb1438e 100644
+index 2389661..d06112b 100644
 --- a/ld/ld.texinfo
 +++ b/ld/ld.texinfo
-@@ -2332,6 +2332,18 @@ string identifying the original linked file does not change.
+@@ -2338,6 +2338,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -235,7 +235,7 @@ index bb0b9cc..a23c56c 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 4cad209..173b17f 100644
+index e2fb212..a2064f1 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
 @@ -530,6 +530,14 @@ static const struct ld_option ld_options[] =
@@ -269,5 +269,5 @@ index 4cad209..173b17f 100644
      }
  
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index 49b19e9..4074241 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,7 +1,7 @@
-From eff00547a91cad0b8ee9bf5b6030dfa48a5ea6ae Mon Sep 17 00:00:00 2001
+From bb9eb09411ddcef515f0f7ad7c29214b0766e960 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
-Subject: [PATCH 10/12] Fix rpath in libtool when sysroot is enabled
+Subject: [PATCH 10/14] Fix rpath in libtool when sysroot is enabled
 
 Enabling sysroot support in libtool exposed a bug where the final
 library had an RPATH encoded into it which still pointed to the
@@ -48,5 +48,5 @@ index 70e856e..11ee684 100644
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs="$libdir"
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
index 905b7b3..c0d2d71 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
@@ -1,7 +1,7 @@
-From b0bcabc83ba02f984d8c87d612c115c9ab7a9fce Mon Sep 17 00:00:00 2001
+From af1b4ee69b4fd617b88127ed40c3ca7351a9532f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
-Subject: [PATCH 11/12] Change default emulation for mips64*-*-linux
+Subject: [PATCH 11/14] Change default emulation for mips64*-*-linux
 
 we change the default emulations to be N64 instead of N32
 
@@ -55,5 +55,5 @@ index 6b6bbf2..b45b1e5 100644
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
  			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
rename to meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
index 01492b5..af7f12f 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
@@ -1,12 +1,9 @@
-From 10e0f42d258164a6a8c0c733518c79e114f5d702 Mon Sep 17 00:00:00 2001
+From 9f967c555b3fda64af4549ae252a0fba00120529 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Jan 2016 06:37:20 +0000
-Subject: [PATCH 12/12] Add XLP instructions support
+Date: Sun, 14 Feb 2016 17:06:19 +0000
+Subject: [PATCH 12/14] Add support for Netlogic XLP
 
-From 26adb06ce515aadfec08ce13109b4b98287f677b Mon Sep 17 00:00:00 2001
-From: Nebu Philips <nphilips@netlogicmicro.com>
-Date: Fri, 30 Jul 2010 15:10:03 -0700
-Subject: [PATCH] Add support for Netlogic XLP
+Patch From: Nebu Philips <nphilips@netlogicmicro.com>
 
 Using the mipsisa64r2nlm target, add support for XLP from
 Netlogic. Also, update vendor name to NLM wherever applicable.
@@ -188,10 +185,10 @@ index a2d45a4..75902c0 100644
    /* i6400.  */
    { "i6400",	      0, ASE_MSA,		ISA_MIPS64R6, CPU_MIPS64R6},
 diff --git a/gas/configure b/gas/configure
-index 1c2a665..c8010a8 100755
+index 89f18b3..86b19ae 100755
 --- a/gas/configure
 +++ b/gas/configure
-@@ -12826,6 +12826,9 @@ _ACEOF
+@@ -12851,6 +12851,9 @@ _ACEOF
  	  mipsisa64r6 | mipsisa64r6el)
  	    mips_cpu=mips64r6
  	    ;;
@@ -412,5 +409,5 @@ index 402f887..3764836 100644
  {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch b/meta/recipes-devtools/binutils/binutils/0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch
index a62b519..24af120 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Fix-GOT-address-computations-in-initial-PLT-entries-.patch
@@ -1,7 +1,7 @@
-From 45490ccc18bbb518550209c38b2278b04703c183 Mon Sep 17 00:00:00 2001
+From 9619a608528383a44ccc1637ae939b5f3e97adc5 Mon Sep 17 00:00:00 2001
 From: Sandra Loosemore <sandra@codesourcery.com>
 Date: Wed, 9 Dec 2015 16:13:58 -0800
-Subject: [PATCH 1/2] Fix GOT address computations in initial PLT entries for
+Subject: [PATCH 13/14] Fix GOT address computations in initial PLT entries for
  nios2.
 
 2015-12-09  Sandra Loosemore  <sandra@codesourcery.com>
@@ -68,5 +68,5 @@ index 6b29d8b..1c54320 100644
  	}
      }
 -- 
-2.7.0
+2.7.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Correct-nios2-_gp-address-computation.patch b/meta/recipes-devtools/binutils/binutils/0014-Correct-nios2-_gp-address-computation.patch
index 7a4c1db..86eeded 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-Correct-nios2-_gp-address-computation.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Correct-nios2-_gp-address-computation.patch
@@ -1,7 +1,7 @@
-From fcf984ae68c89e5495e65fe6456650cc014b5ea7 Mon Sep 17 00:00:00 2001
+From 27f155fd0ab4ba954366643dbfdc3c7104933794 Mon Sep 17 00:00:00 2001
 From: Sandra Loosemore <sandra@codesourcery.com>
 Date: Sun, 27 Dec 2015 12:30:26 -0800
-Subject: [PATCH 2/2] Correct nios2 _gp address computation.
+Subject: [PATCH 14/14] Correct nios2 _gp address computation.
 
 2015-12-27  Sandra Loosemore  <sandra@codesourcery.com>
 
@@ -102,5 +102,5 @@ index 1c54320..babecf3 100644
  	    case R_NIOS2_UJMP:
  	      r = nios2_elf32_do_ujmp_relocate (input_bfd, howto,
 -- 
-2.7.0
+2.7.1
 
-- 
2.7.1


