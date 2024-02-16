Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8FBC48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 19:02:51 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.5379.1708110163627800499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 11:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lcrmhYLs;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-296d24631c0so1782856a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708110163; x=1708714963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K5+hlBNEjjnyMfBxP49oE1w39hAgmDX3VhoUz57vEyc=;
        b=lcrmhYLsnHlLxVB43iI8M3dOcwZj/gIXxGLR1j/8dsruui2mhXtvNaq7WK1+4/mu8v
         jF4NJ9RoxIOQYPnchsyP1GGDZLLLoSfHRInbb3sWOMSzWTi5qCtPwASPUXTujOtyw7Ax
         7HbOEs9e1TXin7elWEN7Xmyth3RQZdeuq0VZSRmcAdF4s/u7CTN16V4EzOj4APDhuG17
         DAPC4mUsTIZfkJ/oe69caX3DylN5ceU9G8eaKtwUBazNecUZ1wmxHOhzpU0PgLE+7PiE
         K0F80pOF+RH+h4TgjKyRw/ZC0Nv6fM4whMCL4rpDZO6vRrD13w0eUHtDUaCOOMUPdrbs
         KwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708110163; x=1708714963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5+hlBNEjjnyMfBxP49oE1w39hAgmDX3VhoUz57vEyc=;
        b=LCS5TBG0epVeLGRUVj9oGoJnRE3G4lFeMFm+XLgPdE+Uw+kmR/2TsqSnWzQLHM2jT5
         tCYooBtVBpkyMDajBsldIvaoKYpAsIE+RKriGfTPtD7AQHNUOTk5YT6CRTn1WB8AScrI
         VNn1EEVSgJGMg8iyJWJiqmgK1UJogmp8m4I6svV9UhIZH33lasy4dCxLwNRrJQSZ5XKQ
         30Iy3U5QNf8JMT4+SRKTQWBqXU+h5+q+O4JllmpacBj627JSOqgnAHQOARiZ30ClGxfa
         PlcvxJqIR5mou0ByaYIsJFpk7PTa+iKwRHb0h0OZMF6C5d3AmUgbLDs+M9XdbUIftoUD
         KKMw==
X-Gm-Message-State: AOJu0YwVdPUeSffGU1gLCrAeeR5lQH04RiMp96fB9zDFAc2Csgk5mlGI
	TtV8SZlf2oxoIXxjUZHqSO74fATZsOFR6l2OwiHWsJGwuUKZZEo5tWA0hVPrnj4=
X-Google-Smtp-Source: AGHT+IEAT4pFSK2jCOEEEQXW2mexGcAoALcMny9scMNJQlm6enEryWGMUGi5vtLUr9NQDIrt3yNTMA==
X-Received: by 2002:a17:90a:f283:b0:299:1bf1:7543 with SMTP id fs3-20020a17090af28300b002991bf17543mr4613534pjb.6.1708110162243;
        Fri, 16 Feb 2024 11:02:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::fffa])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090aca8400b00296f2c1d2c9sm349567pjt.18.2024.02.16.11.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 11:02:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] binutils: Update to tip of 2.42 release branch
Date: Fri, 16 Feb 2024 11:02:39 -0800
Message-ID: <20240216190239.725494-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 19:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195800

Brings following fixes.

* 553c7f61b74 x86: Display -msse-check= default as none
* 4f7d1d2d5ec PowerPC: Add support for Power11 options
* 3c1f1c35784 x86-64: Add R_X86_64_CODE_6_GOTTPOFF
* c426c8e307a x86/APX: VROUND{P,S}{S,D} encodings require AVX512{F,VL}
* 78f9e9faaa4 PR31208, strip can break ELF alignment requirements
* e19278f72bd PR 31283 windmc: Parse input correctly on big endian hosts
* b76b8983116 Link x86-64 mark-plt-1.so with --no-as-needed
* e92e2d654bf LoongArch: gas: Fix the types of symbols referred with %le_*_r in the symtab

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Refresh patches as well

 .../binutils/binutils-2.42.inc                |   2 +-
 ...s-crosssdk-Generate-relocatable-SDKs.patch |   2 +-
 ...o-not-generate-linker-script-directo.patch |   2 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |   2 +-
 ...004-Point-scripts-location-to-libdir.patch |   2 +-
 ...stro-compiler-point-to-the-wrong-ins.patch |   2 +-
 ...-system-directories-when-cross-linki.patch |   4 +-
 ...ect-assembling-for-ppc-wait-mnemonic.patch |   2 +-
 .../binutils/0008-Use-libtool-2.4.patch       | 158 +++++++++---------
 ...h-in-libtool-when-sysroot-is-enabled.patch |   2 +-
 .../0010-sync-with-OE-libtool-changes.patch   |   2 +-
 ...or-clang-before-checking-gcc-version.patch |   2 +-
 ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   2 +-
 ...sing-_Alignof-when-using-C11-or-newe.patch |   2 +-
 ...-pe-dll.o-entry-deom-targ_extra_ofil.patch |   2 +-
 15 files changed, 94 insertions(+), 94 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index f48a1eb2494..b6c275af46d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_42-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "42cde237366398f6e318232f4ce080bef42f0371"
+SRCREV ?= "553c7f61b74badf91df484450944675efd9cd485"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 148c9a29db0..4ef11c56e7c 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,4 +1,4 @@
-From 07237f83e4bfefab6473ed7c7b601d9d23b11edd Mon Sep 17 00:00:00 2001
+From 089ee95b342e79af09258b45c888a13b35fadf26 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
 Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index bea1be9e832..1652473bcb2 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,4 +1,4 @@
-From 4988a5a42289e43ab0fbd87793f293e263dc3dc1 Mon Sep 17 00:00:00 2001
+From 6fae7afeb713a60755e17443964e46190bb97ede Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
 Subject: [PATCH] binutils-cross: Do not generate linker script directories
diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index 6f23abc2508..f45690ed68d 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -1,4 +1,4 @@
-From a0047134327e312a22f798bd328becf4053a6973 Mon Sep 17 00:00:00 2001
+From 1fe9aa3f25e09281cb018b29081db4cc44bdc01f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 19 Feb 2020 09:51:16 -0800
 Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index b2e9ef1ff82..ab12c145ea9 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,4 +1,4 @@
-From 1647f124bf0b48ca90189ecbd9ddd4b2c348ce03 Mon Sep 17 00:00:00 2001
+From 780109902b00652dfdc080607c614f210e96ae9b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
 Subject: [PATCH] Point scripts location to libdir
diff --git a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index fbb4418e56b..f7c3987542f 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,4 +1,4 @@
-From 1e09d056a802c0d12bdf31aceead3725b69bd626 Mon Sep 17 00:00:00 2001
+From c8cca8d2364c9f233d6e771136a4d4ff7f405c21 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
 Subject: [PATCH] don't let the distro compiler point to the wrong installation
diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
index 1dcea9fe288..bf6a1a39611 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From 7a6074edd927273ae6924dc676ca2fdf127ce542 Mon Sep 17 00:00:00 2001
+From a92c46e3703d038d7d810bdc91e8540ad9d9150a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH] warn for uses of system directories when cross linking
@@ -77,7 +77,7 @@ index 52d62f06ff0..b5944e7ba55 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index add770f883c..867f3f62c88 100755
+index 6f8a05c3b6c..98a76d6da7f 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -844,6 +844,7 @@ with_lib_path
diff --git a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index 7bf4ecabe15..f9fa0d4f78d 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,4 +1,4 @@
-From 9784134b2670b284fb4d31360964a14d1e9a070d Mon Sep 17 00:00:00 2001
+From d35fd95eee9930ab41d9ad637eacb35aa9fe6f44 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
 Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
index ebaa3c55b55..8f74c639d5d 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
@@ -1,4 +1,4 @@
-From 952a0e386cb925190561ad6b33a2dedacec1056b Mon Sep 17 00:00:00 2001
+From da089ddacb6506f406acd8939389183a4356ebf0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
 Subject: [PATCH] Use libtool 2.4
@@ -75,7 +75,7 @@ index faaa0c424b8..5371e093163 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  all_backends = @all_backends@
 diff --git a/bfd/configure b/bfd/configure
-index 0a6e96c5b3b..970732f338a 100755
+index acbac2f364a..a53a9d52719 100755
 --- a/bfd/configure
 +++ b/bfd/configure
 @@ -712,6 +712,9 @@ OTOOL
@@ -2037,7 +2037,7 @@ index 842a6d99b54..037cccde038 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/binutils/configure b/binutils/configure
-index 6f08b6bdcde..03d922de70e 100755
+index a1092735311..f3bdee98f3f 100755
 --- a/binutils/configure
 +++ b/binutils/configure
 @@ -704,8 +704,11 @@ OTOOL
@@ -2069,7 +2069,7 @@ index 6f08b6bdcde..03d922de70e 100755
    --with-debuginfod       Enable debuginfo lookups with debuginfod
                            (auto/yes/no)
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
-@@ -4733,8 +4739,8 @@ esac
+@@ -4958,8 +4964,8 @@ esac
  
  
  
@@ -2080,7 +2080,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
  
  
-@@ -4774,7 +4780,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4999,7 +5005,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -2089,7 +2089,7 @@ index 6f08b6bdcde..03d922de70e 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5467,8 +5473,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5692,8 +5698,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -2100,7 +2100,7 @@ index 6f08b6bdcde..03d922de70e 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5517,6 +5523,80 @@ esac
+@@ -5742,6 +5748,80 @@ esac
  
  
  
@@ -2181,7 +2181,7 @@ index 6f08b6bdcde..03d922de70e 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5533,6 +5613,11 @@ case $reload_flag in
+@@ -5758,6 +5838,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -2193,7 +2193,7 @@ index 6f08b6bdcde..03d922de70e 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5701,7 +5786,8 @@ mingw* | pw32*)
+@@ -5926,7 +6011,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -2203,7 +2203,7 @@ index 6f08b6bdcde..03d922de70e 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5860,6 +5946,21 @@ esac
+@@ -6085,6 +6171,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -2225,7 +2225,7 @@ index 6f08b6bdcde..03d922de70e 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5875,6 +5976,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6100,6 +6201,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -2383,7 +2383,7 @@ index 6f08b6bdcde..03d922de70e 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -5889,8 +6141,10 @@ for plugin in $plugin_names; do
+@@ -6114,8 +6366,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -2396,7 +2396,7 @@ index 6f08b6bdcde..03d922de70e 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -5906,7 +6160,7 @@ do
+@@ -6131,7 +6385,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -2405,7 +2405,7 @@ index 6f08b6bdcde..03d922de70e 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5926,11 +6180,15 @@ $as_echo "no" >&6; }
+@@ -6151,11 +6405,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -2424,7 +2424,7 @@ index 6f08b6bdcde..03d922de70e 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -5946,7 +6204,7 @@ do
+@@ -6171,7 +6429,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -2433,7 +2433,7 @@ index 6f08b6bdcde..03d922de70e 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5965,6 +6223,10 @@ else
+@@ -6190,6 +6448,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -2444,7 +2444,7 @@ index 6f08b6bdcde..03d922de70e 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5976,25 +6238,19 @@ ac_tool_warned=yes ;;
+@@ -6201,25 +6463,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -2479,7 +2479,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
  
  
-@@ -6006,6 +6262,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6231,6 +6487,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -2544,7 +2544,7 @@ index 6f08b6bdcde..03d922de70e 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6345,8 +6659,8 @@ esac
+@@ -6570,8 +6884,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -2555,7 +2555,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6382,6 +6696,7 @@ for ac_symprfx in "" "_"; do
+@@ -6607,6 +6921,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -2563,7 +2563,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6423,6 +6738,18 @@ _LT_EOF
+@@ -6648,6 +6963,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -2582,7 +2582,7 @@ index 6f08b6bdcde..03d922de70e 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6434,7 +6761,7 @@ _LT_EOF
+@@ -6659,7 +6986,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -2591,7 +2591,7 @@ index 6f08b6bdcde..03d922de70e 100755
    const char *name;
    void       *address;
  }
-@@ -6460,8 +6787,8 @@ static const void *lt_preloaded_setup() {
+@@ -6685,8 +7012,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -2602,7 +2602,7 @@ index 6f08b6bdcde..03d922de70e 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6471,8 +6798,8 @@ _LT_EOF
+@@ -6696,8 +7023,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -2613,7 +2613,7 @@ index 6f08b6bdcde..03d922de70e 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6509,6 +6836,18 @@ else
+@@ -6734,6 +7061,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -2632,7 +2632,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
  
  
-@@ -6525,6 +6864,43 @@ fi
+@@ -6750,6 +7089,43 @@ fi
  
  
  
@@ -2676,7 +2676,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
  
  
-@@ -6736,6 +7112,123 @@ esac
+@@ -6961,6 +7337,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -2800,7 +2800,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7299,6 +7792,8 @@ _LT_EOF
+@@ -7524,6 +8017,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -2809,7 +2809,7 @@ index 6f08b6bdcde..03d922de70e 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7883,8 +8378,6 @@ fi
+@@ -8108,8 +8603,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -2818,7 +2818,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8050,6 +8543,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8275,6 +8768,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -2831,7 +2831,7 @@ index 6f08b6bdcde..03d922de70e 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8112,7 +8611,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8337,7 +8836,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -2840,7 +2840,7 @@ index 6f08b6bdcde..03d922de70e 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8169,13 +8668,17 @@ case $host_os in
+@@ -8394,13 +8893,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -2864,7 +2864,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8236,6 +8739,11 @@ fi
+@@ -8461,6 +8964,11 @@ fi
  
  
  
@@ -2876,7 +2876,7 @@ index 6f08b6bdcde..03d922de70e 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8586,7 +9094,8 @@ _LT_EOF
+@@ -8811,7 +9319,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -2886,7 +2886,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8685,12 +9194,12 @@ _LT_EOF
+@@ -8910,12 +9419,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -2901,7 +2901,7 @@ index 6f08b6bdcde..03d922de70e 100755
  	  fi
  	  ;;
  	esac
-@@ -8704,8 +9213,8 @@ _LT_EOF
+@@ -8929,8 +9438,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -2912,7 +2912,7 @@ index 6f08b6bdcde..03d922de70e 100755
        fi
        ;;
  
-@@ -8723,8 +9232,8 @@ _LT_EOF
+@@ -8948,8 +9457,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2923,7 +2923,7 @@ index 6f08b6bdcde..03d922de70e 100755
        else
  	ld_shlibs=no
        fi
-@@ -8770,8 +9279,8 @@ _LT_EOF
+@@ -8995,8 +9504,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2934,7 +2934,7 @@ index 6f08b6bdcde..03d922de70e 100755
        else
  	ld_shlibs=no
        fi
-@@ -8901,7 +9410,13 @@ _LT_EOF
+@@ -9126,7 +9635,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -2949,7 +2949,7 @@ index 6f08b6bdcde..03d922de70e 100755
  /* end confdefs.h.  */
  
  int
-@@ -8914,22 +9429,29 @@ main ()
+@@ -9139,22 +9654,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2992,7 +2992,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8941,7 +9463,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9166,7 +9688,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -3007,7 +3007,7 @@ index 6f08b6bdcde..03d922de70e 100755
  /* end confdefs.h.  */
  
  int
-@@ -8954,22 +9482,29 @@ main ()
+@@ -9179,22 +9707,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -3050,7 +3050,7 @@ index 6f08b6bdcde..03d922de70e 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9014,20 +9549,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9239,20 +9774,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -3128,7 +3128,7 @@ index 6f08b6bdcde..03d922de70e 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9088,7 +9666,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9313,7 +9891,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -3137,7 +3137,7 @@ index 6f08b6bdcde..03d922de70e 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9096,7 +9674,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9321,7 +9899,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -3146,7 +3146,7 @@ index 6f08b6bdcde..03d922de70e 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9112,7 +9690,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9337,7 +9915,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -3155,7 +3155,7 @@ index 6f08b6bdcde..03d922de70e 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9136,10 +9714,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9361,10 +9939,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -3168,7 +3168,7 @@ index 6f08b6bdcde..03d922de70e 100755
  	  ;;
  	esac
        else
-@@ -9218,23 +9796,36 @@ fi
+@@ -9443,23 +10021,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -3213,7 +3213,7 @@ index 6f08b6bdcde..03d922de70e 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9319,7 +9910,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9544,7 +10135,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -3222,7 +3222,7 @@ index 6f08b6bdcde..03d922de70e 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9338,9 +9929,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9563,9 +10154,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -3234,7 +3234,7 @@ index 6f08b6bdcde..03d922de70e 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -9916,8 +10507,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10141,8 +10732,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -3246,7 +3246,7 @@ index 6f08b6bdcde..03d922de70e 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -9950,13 +10542,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10175,13 +10767,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -3319,16 +3319,16 @@ index 6f08b6bdcde..03d922de70e 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10858,7 +11508,7 @@ else
+@@ -11083,7 +11733,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10861 "configure"
+-#line 11086 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10902,10 +11552,10 @@ else
+@@ -11127,10 +11777,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3341,16 +3341,16 @@ index 6f08b6bdcde..03d922de70e 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -10964,7 +11614,7 @@ else
+@@ -11189,7 +11839,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10967 "configure"
+-#line 11192 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11008,10 +11658,10 @@ else
+@@ -11233,10 +11883,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3363,7 +3363,7 @@ index 6f08b6bdcde..03d922de70e 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -17164,13 +17814,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17390,13 +18040,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3384,7 +3384,7 @@ index 6f08b6bdcde..03d922de70e 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17185,14 +17842,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17411,14 +18068,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3403,7 +3403,7 @@ index 6f08b6bdcde..03d922de70e 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17225,12 +17885,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17451,12 +18111,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3417,7 +3417,7 @@ index 6f08b6bdcde..03d922de70e 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17285,8 +17945,13 @@ reload_flag \
+@@ -17511,8 +18171,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3431,7 +3431,7 @@ index 6f08b6bdcde..03d922de70e 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17296,12 +17961,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17522,12 +18187,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3447,7 +3447,7 @@ index 6f08b6bdcde..03d922de70e 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17317,7 +17984,6 @@ no_undefined_flag \
+@@ -17543,7 +18210,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3455,7 +3455,7 @@ index 6f08b6bdcde..03d922de70e 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17353,6 +18019,7 @@ module_cmds \
+@@ -17579,6 +18245,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3463,7 +3463,7 @@ index 6f08b6bdcde..03d922de70e 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18126,7 +18793,8 @@ $as_echo X"$file" |
+@@ -18352,7 +19019,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3473,7 +3473,7 @@ index 6f08b6bdcde..03d922de70e 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18229,19 +18897,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18455,19 +19123,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3517,7 +3517,7 @@ index 6f08b6bdcde..03d922de70e 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18271,6 +18962,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18497,6 +19188,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3530,7 +3530,7 @@ index 6f08b6bdcde..03d922de70e 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18280,6 +18977,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18506,6 +19203,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3540,7 +3540,7 @@ index 6f08b6bdcde..03d922de70e 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18394,12 +19094,12 @@ with_gcc=$GCC
+@@ -18620,12 +19320,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3556,7 +3556,7 @@ index 6f08b6bdcde..03d922de70e 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18486,9 +19186,6 @@ inherit_rpath=$inherit_rpath
+@@ -18712,9 +19412,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3566,7 +3566,7 @@ index 6f08b6bdcde..03d922de70e 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18504,6 +19201,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18730,6 +19427,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3576,7 +3576,7 @@ index 6f08b6bdcde..03d922de70e 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18536,210 +19236,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18762,210 +19462,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3979,7 +3979,7 @@ index bc25765cb5b..c481d96a05a 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/gas/configure b/gas/configure
-index e4c4bcb69a5..63ee2a1445d 100755
+index 5f8c8493589..998727b6108 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -692,8 +692,11 @@ OTOOL
@@ -5918,7 +5918,7 @@ index a7398231030..fc7a3d78db0 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/gprof/configure b/gprof/configure
-index 6d5c3612d3d..b2d9125ab60 100755
+index 2d62b6fbb07..0cafee249eb 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -669,8 +669,11 @@ OTOOL
@@ -7852,7 +7852,7 @@ index dbc868191b7..1ca6dd01f58 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/configure b/gprofng/configure
-index 6dfafb4e483..2dc8702f339 100755
+index bdfa2281f2c..b6376eb3f77 100755
 --- a/gprofng/configure
 +++ b/gprofng/configure
 @@ -671,6 +671,8 @@ OTOOL
@@ -10488,7 +10488,7 @@ index ce8755c80c9..91e29c29ab8 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/libcollector/configure b/gprofng/libcollector/configure
-index b6737b96bd5..d1552932a75 100755
+index 8b0092433fe..a363ab1047c 100755
 --- a/gprofng/libcollector/configure
 +++ b/gprofng/libcollector/configure
 @@ -640,6 +640,8 @@ OTOOL
@@ -13112,7 +13112,7 @@ index 15311048855..71b39ee9311 100644
  ac_ct_CXX = @ac_ct_CXX@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
 diff --git a/ld/configure b/ld/configure
-index 867f3f62c88..60fbf749e61 100755
+index 98a76d6da7f..a4266996c44 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -705,8 +705,11 @@ OTOOL
@@ -30548,7 +30548,7 @@ index 245479140c9..bfed90449bf 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/opcodes/configure b/opcodes/configure
-index 6cd3730c5a2..824f42ab20a 100755
+index 1660c3266a3..a1b84ed81f9 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -688,6 +688,9 @@ OTOOL
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index 5f87c2ebf0c..50201fb6b69 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,4 +1,4 @@
-From 37a395151679d74c98a23ad5c39ed02009487f9c Mon Sep 17 00:00:00 2001
+From c9e810840d95554046b7132e3e2c98bf99cb2d89 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
 Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
diff --git a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
index 5f6708896d3..57d9ac5f27f 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
@@ -1,4 +1,4 @@
-From 8c2788cee8eb69c8bde5778129a6b66287868c3b Mon Sep 17 00:00:00 2001
+From befc176c209bbb4c32b57c2068e813c88b1ab6b1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
 Subject: [PATCH] sync with OE libtool changes
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
index e753627a243..c47f41f5caf 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
@@ -1,4 +1,4 @@
-From 11bbb4f62b0f914f59f3f01a9d835930f9eb1122 Mon Sep 17 00:00:00 2001
+From cad852e0ed46a1c26607f9e7d17cc5974b05e38a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Apr 2020 14:17:20 -0700
 Subject: [PATCH] Check for clang before checking gcc version
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 7059eb467c0..985911aab14 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,4 +1,4 @@
-From 65c8ea481cda572b60d0949648df912e616d3884 Mon Sep 17 00:00:00 2001
+From 47e53916e3112391d8bff2b2257dcec0a2426d66 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 10 Mar 2022 21:21:33 -0800
 Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
index 0b6065b60f1..0cb2f46a070 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From ad6942752570199d3959e344c432bc92d9fc43ad Mon Sep 17 00:00:00 2001
+From d479020609329cdc7fa3675bc3daf072401fefae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
index de1a6271d72..8aef2cc7101 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
@@ -1,4 +1,4 @@
-From 6a21059fb86423304358693a200f1ad568cd6699 Mon Sep 17 00:00:00 2001
+From ddd941856582a82171626cbe609325b11e223704 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Jan 2023 19:35:07 -0800
 Subject: [PATCH] Remove duplicate pe-dll.o entry deom targ_extra_ofiles
-- 
2.43.2


