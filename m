Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30A5C77B78
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 17:07:55 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.1736.1682528868382113079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 10:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HnrUs4vC;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63d4595d60fso47298b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682528867; x=1685120867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qFt105UIHF+qt2r3/vD1Sa1ELeRBY9md/+2WzYZd/w=;
        b=HnrUs4vC+R0mcyI4c1AfIBODSWb/dr3o1HVwHYy09slkHW95iYEopPN1AWr6Q3kaKG
         QNJVHyeJxhE44uQ2bYe+8Ph6YohnqoKLhnX4LSG2ZbnB9gp0x4uNtKbOLI2bK/8z9T56
         pzWI9VheqvZOw29SuiGxCRBBly0rKr8GktTWIjXfB/rIkppFk4+yjvm/az6OP9m5JxnA
         4SXFsLUKgA6+uCsDTTc2yJ9Ge4SdfIauDmZ9fy2Mvhmkfj38FGHXrqZS3e/7sPziDTlq
         kS+lR7IAeL6iLo8MkIYOZFx6TEHzKMkNS2Fsh8leRUazV+E0LxpZ8Wcuv+pc0Dn5NICW
         fqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682528867; x=1685120867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qFt105UIHF+qt2r3/vD1Sa1ELeRBY9md/+2WzYZd/w=;
        b=ZdE8q5mxsoKqR1JosSIedDOJsB2+3AKYMayI1O/eIeYHdcgPVrZGGQ50FkxMSkgGXQ
         rVaVW4/OJVWGx/0X42UJI2OUeUWhiOmx+tsDtTYWZsdRD/OdGf6biSFTSNcULjQ0jiBL
         7S8mRGo7qUXnKVp00LK0DRJNVypgJicv6yNmgzmImRcY/PWIYrKWJJkLIs7NQstSq61k
         3MICoUNnNzKYJ4eQqZCDDpvkNhrWvmW2ybQzw+kkk3BBpsTuaCTKas5MsgphKxU/gG8P
         qzvDLj3PY4DgcX63lFkwL/CPkwt0UOcIrhD0OKAzZH+dO+ZyYWxmCBpDaejEdc901PlV
         +RFw==
X-Gm-Message-State: AC+VfDwWbVEu9uStP1aC8JemWpejtroP7lIfr83v7703bz0tYnm50/2S
	zKR+djqLeC44DfGT87DKdfJFWN693L/DsA==
X-Google-Smtp-Source: ACHHUZ45JpTsga8jl5ZKYaTYqQ0XNvHk/8uk4tunaPcwkS4McZhOlurBDGIpF/JCDf1aaXnBZGB+lg==
X-Received: by 2002:a05:6a20:1588:b0:f4:c0d6:87c with SMTP id h8-20020a056a20158800b000f4c0d6087cmr3957266pzj.14.1682528866949;
        Wed, 26 Apr 2023 10:07:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::5002])
        by smtp.gmail.com with ESMTPSA id f195-20020a6238cc000000b0063b8428b0d8sm11438876pfa.152.2023.04.26.10.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 10:07:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Deepthi Hemraj <deepadeepthi98@gmail.com>,
	Deepthi Hemraj <Deepthi.Hemraj@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] binutils: stable 2.40 branch updates
Date: Wed, 26 Apr 2023 10:07:43 -0700
Message-Id: <20230426170743.1691794-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 17:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180450

From: Deepthi Hemraj <deepadeepthi98@gmail.com>

Rebase existing patches

Below commits on binutils-2.40 stable branch are updated.
4671be001eb Updated Hungarian translation for the gprof directory
ded035f913e lto: Don't add indirect symbols for versioned aliases in IR
74cb2ddeabc gas: arm: Change warning message to not reference specific A-class architecture revision
570b9c09bbf gas: arm: Fix a further IT-predicated vcvt issue in the presense of MVE vcvtn
bddd62e188c libctf: get the offsets of fields of unnamed structs/unions right
7aa47eafcce libctf: fix assertion failure with no system qsort_r
165accf0752 coff_get_normalized_symtab bfd_release
af35798e957 PR30217, dynamic relocations using local dynamic symbols
18bb604f1e1 PR30198, Assertion and segfault when linking x86_64 elf and coff
34a2b4a0e21 PR30155, ld segfault in _bfd_nearby_section
3d0046f39aa PR30046, power cmpi leads to unknown architecture
5c87fb1d59b ppc32 and "LOAD segment with RWX permissions"
11f5c1ebf14 Updated Serbian translations for gold, gprof and opcodes sub-directories
38e455b1d9a Updated translations for the bfd and gprof directories.
b2bc62b7b4e gas: correct symbol name comparison in .startof./.sizeof. handling
17294931e3e configure: remove dependencies on gmp and mpfr when gdb is disabled
1fc096a4c59 Regen config files
e1815414077 Pass $JANSSON_LIBS and $ZSTD_LIBS to ld-bootstrap/bootrap.exp
3e888977f16 bpf: fix error conversion from long unsigned int to unsigned int [-Werror=overflow]
65dbb942145 Updated Swedish translation for the binutils sub-directory
27f59ec47a1 RISC-V: make C-extension JAL available again for (32-bit) assembly
edd36b26f35 gprofng: PR30043 libgprofng.so.* are installed to a wrong location
c6e269febbc gprofng: PR29521 [docs] man pages are not in the release tarball
bcea253f5fa toplevel: Makefile.def: add install-strip dependency on libsframe

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebase existing patches to apply on top

 .../binutils/binutils-2.40.inc                |   2 +-
 ...s-crosssdk-Generate-relocatable-SDKs.patch |   2 +-
 ...o-not-generate-linker-script-directo.patch |   2 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |   8 +-
 ...004-Point-scripts-location-to-libdir.patch |   6 +-
 ...stro-compiler-point-to-the-wrong-ins.patch |   2 +-
 ...-system-directories-when-cross-linki.patch |   8 +-
 ...ect-assembling-for-ppc-wait-mnemonic.patch |   2 +-
 .../binutils/0008-Use-libtool-2.4.patch       | 252 +++++++++---------
 ...h-in-libtool-when-sysroot-is-enabled.patch |   2 +-
 .../0010-sync-with-OE-libtool-changes.patch   |   2 +-
 ...or-clang-before-checking-gcc-version.patch |   6 +-
 ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   2 +-
 ...sing-_Alignof-when-using-C11-or-newe.patch |   2 +-
 14 files changed, 149 insertions(+), 149 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index ad2c9f9da1..924cc95669 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_40-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "ffb83e32fc11f36b7b82b876c14888f82cd983b3"
+SRCREV ?= "4671be001eb5a899ecac3e2686a92934000f8262"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 7fffa81724..ca249834ea 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,4 +1,4 @@
-From 25e715730ddcca37021fa4876aed4fa91d5dea25 Mon Sep 17 00:00:00 2001
+From 4bdab425bdd7dc52c95bfd62e035c1b9abe9595e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
 Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 87a19c9ec3..663dc4af7d 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,4 +1,4 @@
-From 080a8eafc5961f78222d84aaa816d0933441b7ab Mon Sep 17 00:00:00 2001
+From c79005d4d9991593557766ad569f48c26482399f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
 Subject: [PATCH] binutils-cross: Do not generate linker script directories
diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index 54967b9362..f46116f1af 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -1,4 +1,4 @@
-From 90d1bb804033a74b54f64cd5d3127c004c266af8 Mon Sep 17 00:00:00 2001
+From 70da8b91026c5381d430194910fc15e3b6c5ec7f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 19 Feb 2020 09:51:16 -0800
 Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 12b2c3c453f..0590b7055d0 100644
+index b3195b4be68..fc6460317a7 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -42,7 +42,8 @@ ZLIBINC = @zlibinc@
@@ -43,7 +43,7 @@ index 12b2c3c453f..0590b7055d0 100644
  NO_WERROR = @NO_WERROR@
  AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 3d5685d6bae..70643b1ce46 100644
+index fe422569228..4a4c851b44a 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
 @@ -566,7 +566,8 @@ ZLIB = @zlibdir@ -lz
@@ -65,7 +65,7 @@ index eff6693e052..95787012b89 100644
        info.path = NULL;
        info.len = info.alloc = 0;
 -      tmppath = concat (ld_sysroot, prefix, "/etc/ld.so.conf",
-+      tmppath = concat (ld_sysconfdir, "/ld.so.conf",
++      tmppath = concat (ld_sysconfdir, "/etc/ld.so.conf",
  			(const char *) NULL);
        if (!ldelf_parse_ld_so_conf (&info, tmppath))
  	{
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index 90abd50498..e7d2593c49 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,4 +1,4 @@
-From a7c988d60f11c8279453c2d9edeede001cce7c9e Mon Sep 17 00:00:00 2001
+From fa477bb947fa17543f4550bc0e7e715c8355649c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
 Subject: [PATCH] Point scripts location to libdir
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 0590b7055d0..c30db94ee3c 100644
+index fc6460317a7..1b875904b8d 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -51,7 +51,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
@@ -25,7 +25,7 @@ index 0590b7055d0..c30db94ee3c 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 70643b1ce46..0405028e02f 100644
+index 4a4c851b44a..08dcd7b75fc 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
 @@ -574,7 +574,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
diff --git a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 9557e871db..7242f48795 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,4 +1,4 @@
-From fc39b9c332a346910695817274d55d0c20dc717a Mon Sep 17 00:00:00 2001
+From 7912f5a918e612950feb04d845934f26160e85da Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
 Subject: [PATCH] don't let the distro compiler point to the wrong installation
diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
index 0ca55d4095..87bbe9fb1b 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From b9af05e87ac8eb4fa18a75939edb661056246c30 Mon Sep 17 00:00:00 2001
+From 725ca09ee1041f64589f26ba815ef11da687c608 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH] warn for uses of system directories when cross linking
@@ -77,7 +77,7 @@ index ad0dc6a106c..d21edaddce7 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 49936a0cb2a..5f5dad6d67c 100755
+index 995708089fd..6406a42c442 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -839,6 +839,7 @@ with_lib_path
@@ -253,7 +253,7 @@ index ceaca2d85d0..62e7b4e5341 100644
      {
        if (error_count < MAX_ERRORS_IN_A_ROW)
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index c5960385572..eb54627fb71 100644
+index a1c6140100d..d47ba4f977d 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
 @@ -613,6 +613,14 @@ static const struct ld_option ld_options[] =
@@ -271,7 +271,7 @@ index c5960385572..eb54627fb71 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1735,6 +1743,14 @@ parse_args (unsigned argc, char **argv)
+@@ -1737,6 +1745,14 @@ parse_args (unsigned argc, char **argv)
  	  config.print_map_discarded = true;
  	  break;
  
diff --git a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index 502ce82928..fdd1f7756f 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,4 +1,4 @@
-From ef9aa69324a209e546956a2f674462717ec5af0f Mon Sep 17 00:00:00 2001
+From 4e9d4ace8a340399aeaa8332e2cfbfcc7d2d14d7 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
 Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
index 7e7c2579b3..0be871f5cf 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
@@ -1,4 +1,4 @@
-From 0ad92af822bb6f58de3f3889d0adc0b2ef9d477f Mon Sep 17 00:00:00 2001
+From a66b1806350a9bed7b188c7d115991f6cdee51a9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
 Subject: [PATCH] Use libtool 2.4
@@ -76,7 +76,7 @@ index 80aed657643..106ec256a79 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  all_backends = @all_backends@
 diff --git a/bfd/configure b/bfd/configure
-index e5d464378f8..ee8ea251479 100755
+index 60ea6becab2..84dcdf167ba 100755
 --- a/bfd/configure
 +++ b/bfd/configure
 @@ -706,6 +706,9 @@ OTOOL
@@ -2038,7 +2038,7 @@ index 27315addc0f..5ddd5a42a7d 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/binutils/configure b/binutils/configure
-index 3cb797c2b8d..5578150c1d9 100755
+index c7bd42049c3..06285371350 100755
 --- a/binutils/configure
 +++ b/binutils/configure
 @@ -700,8 +700,11 @@ OTOOL
@@ -3977,7 +3977,7 @@ index 8319181b472..3425e414c1c 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/gas/configure b/gas/configure
-index 684e68e0ea2..ba35172965e 100755
+index 3c0c3e27d3b..11baafb9db6 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -686,8 +686,11 @@ OTOOL
@@ -5916,7 +5916,7 @@ index c9914e46d7d..1857eb8b5a8 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/gprof/configure b/gprof/configure
-index 3e8edd112cb..5b320c60f50 100755
+index c5a081c88aa..a1b06379df4 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -663,8 +663,11 @@ OTOOL
@@ -7830,7 +7830,7 @@ index 3e8edd112cb..5b320c60f50 100755
    chmod +x "$ofile"
  
 diff --git a/gprofng/Makefile.in b/gprofng/Makefile.in
-index 01f7dca3f2a..3db326271c9 100644
+index a2854950e34..4d307543d81 100644
 --- a/gprofng/Makefile.in
 +++ b/gprofng/Makefile.in
 @@ -253,6 +253,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -7850,10 +7850,10 @@ index 01f7dca3f2a..3db326271c9 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/configure b/gprofng/configure
-index 2afc9a381a6..1e57b41ffa4 100755
+index 3ad87139280..e4593cbb838 100755
 --- a/gprofng/configure
 +++ b/gprofng/configure
-@@ -672,6 +672,8 @@ OTOOL
+@@ -674,6 +674,8 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7862,7 +7862,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  OBJDUMP
  LN_S
  NM
-@@ -802,6 +804,7 @@ enable_static
+@@ -804,6 +806,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7870,7 +7870,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  enable_libtool_lock
  enable_werror_always
  enable_gprofng_tools
-@@ -1465,6 +1468,8 @@ Optional Packages:
+@@ -1467,6 +1470,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7879,7 +7879,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
    --with-jdk=PATH         specify prefix directory for installed JDK.
    --with-system-zlib      use installed libz
  
-@@ -6156,8 +6161,8 @@ esac
+@@ -6158,8 +6163,8 @@ esac
  
  
  
@@ -7890,7 +7890,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  
  
-@@ -6197,7 +6202,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -6199,7 +6204,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7899,7 +7899,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6890,8 +6895,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6892,8 +6897,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7910,7 +7910,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6940,6 +6945,80 @@ esac
+@@ -6942,6 +6947,80 @@ esac
  
  
  
@@ -7991,7 +7991,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6956,6 +7035,11 @@ case $reload_flag in
+@@ -6958,6 +7037,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -8003,7 +8003,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -7124,7 +7208,8 @@ mingw* | pw32*)
+@@ -7126,7 +7210,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -8013,7 +8013,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -7278,6 +7363,21 @@ esac
+@@ -7280,6 +7365,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -8035,7 +8035,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7293,6 +7393,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -7295,6 +7395,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -8193,7 +8193,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -7307,8 +7558,10 @@ for plugin in $plugin_names; do
+@@ -7309,8 +7560,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -8206,7 +8206,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -7324,7 +7577,7 @@ do
+@@ -7326,7 +7579,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -8215,7 +8215,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7344,11 +7597,15 @@ $as_echo "no" >&6; }
+@@ -7346,11 +7599,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -8234,7 +8234,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -7364,7 +7621,7 @@ do
+@@ -7366,7 +7623,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -8243,7 +8243,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7383,6 +7640,10 @@ else
+@@ -7385,6 +7642,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -8254,7 +8254,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7394,29 +7655,81 @@ ac_tool_warned=yes ;;
+@@ -7396,29 +7657,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8351,7 +8351,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  
  
-@@ -7763,8 +8076,8 @@ esac
+@@ -7765,8 +8078,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -8362,7 +8362,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7800,6 +8113,7 @@ for ac_symprfx in "" "_"; do
+@@ -7802,6 +8115,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -8370,7 +8370,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7841,6 +8155,18 @@ _LT_EOF
+@@ -7843,6 +8157,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -8389,7 +8389,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7852,7 +8178,7 @@ _LT_EOF
+@@ -7854,7 +8180,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -8398,7 +8398,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
    const char *name;
    void       *address;
  }
-@@ -7878,8 +8204,8 @@ static const void *lt_preloaded_setup() {
+@@ -7880,8 +8206,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8409,7 +8409,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7889,8 +8215,8 @@ _LT_EOF
+@@ -7891,8 +8217,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -8420,7 +8420,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7927,6 +8253,13 @@ else
+@@ -7929,6 +8255,13 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8434,7 +8434,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  
  
-@@ -7946,6 +8279,48 @@ fi
+@@ -7948,6 +8281,48 @@ fi
  
  
  
@@ -8483,7 +8483,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  
  # Check whether --enable-libtool-lock was given.
-@@ -8154,6 +8529,123 @@ esac
+@@ -8156,6 +8531,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -8607,7 +8607,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8717,6 +9209,8 @@ _LT_EOF
+@@ -8719,6 +9211,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -8616,7 +8616,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8785,6 +9279,16 @@ done
+@@ -8787,6 +9281,16 @@ done
  
  
  
@@ -8633,7 +8633,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  
  # Set options
-@@ -9270,8 +9774,6 @@ fi
+@@ -9272,8 +9776,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -8642,7 +8642,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9437,6 +9939,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9439,6 +9941,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8655,7 +8655,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9499,7 +10007,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9501,7 +10009,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8664,7 +8664,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9556,13 +10064,17 @@ case $host_os in
+@@ -9558,13 +10066,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -8688,7 +8688,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9623,6 +10135,11 @@ fi
+@@ -9625,6 +10137,11 @@ fi
  
  
  
@@ -8700,7 +8700,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9973,7 +10490,8 @@ _LT_EOF
+@@ -9975,7 +10492,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -8710,7 +8710,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -10072,12 +10590,12 @@ _LT_EOF
+@@ -10074,12 +10592,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -8725,7 +8725,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	  fi
  	  ;;
  	esac
-@@ -10091,8 +10609,8 @@ _LT_EOF
+@@ -10093,8 +10611,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -8736,7 +8736,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        fi
        ;;
  
-@@ -10110,8 +10628,8 @@ _LT_EOF
+@@ -10112,8 +10630,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8747,7 +8747,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        else
  	ld_shlibs=no
        fi
-@@ -10157,8 +10675,8 @@ _LT_EOF
+@@ -10159,8 +10677,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8758,7 +8758,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        else
  	ld_shlibs=no
        fi
-@@ -10288,7 +10806,13 @@ _LT_EOF
+@@ -10290,7 +10808,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8773,7 +8773,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  /* end confdefs.h.  */
  
  int
-@@ -10301,22 +10825,29 @@ main ()
+@@ -10303,22 +10827,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8816,7 +8816,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10328,7 +10859,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10330,7 +10861,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8831,7 +8831,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  /* end confdefs.h.  */
  
  int
-@@ -10341,22 +10878,29 @@ main ()
+@@ -10343,22 +10880,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8874,7 +8874,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10401,20 +10945,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10403,20 +10947,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -8952,7 +8952,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -10475,7 +11062,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10477,7 +11064,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8961,7 +8961,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -10483,7 +11070,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10485,7 +11072,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8970,7 +8970,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -10499,7 +11086,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10501,7 +11088,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8979,7 +8979,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10523,10 +11110,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10525,10 +11112,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8992,7 +8992,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	  ;;
  	esac
        else
-@@ -10605,23 +11192,36 @@ fi
+@@ -10607,23 +11194,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -9037,7 +9037,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10706,7 +11306,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10708,7 +11308,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -9046,7 +9046,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10725,9 +11325,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10727,9 +11327,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -9058,7 +9058,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -11303,8 +11903,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11305,8 +11905,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9070,7 +9070,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -11337,13 +11938,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11339,13 +11940,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9143,16 +9143,16 @@ index 2afc9a381a6..1e57b41ffa4 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -12221,7 +12880,7 @@ else
+@@ -12223,7 +12882,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12224 "configure"
+-#line 12226 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12265,10 +12924,10 @@ else
+@@ -12267,10 +12926,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9165,16 +9165,16 @@ index 2afc9a381a6..1e57b41ffa4 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12327,7 +12986,7 @@ else
+@@ -12329,7 +12988,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12330 "configure"
+-#line 12332 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12371,10 +13030,10 @@ else
+@@ -12373,10 +13032,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9187,7 +9187,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12766,6 +13425,7 @@ $RM -r conftest*
+@@ -12768,6 +13427,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -9195,7 +9195,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12783,6 +13443,7 @@ $RM -r conftest*
+@@ -12785,6 +13445,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -9203,7 +9203,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -13065,7 +13726,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -13067,7 +13728,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -9218,7 +9218,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  /* end confdefs.h.  */
  
  int
-@@ -13078,22 +13745,29 @@ main ()
+@@ -13080,22 +13747,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9261,7 +9261,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -13106,7 +13780,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13108,7 +13782,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9276,7 +9276,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  /* end confdefs.h.  */
  
  int
-@@ -13119,22 +13799,29 @@ main ()
+@@ -13121,22 +13801,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9319,7 +9319,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -13177,29 +13864,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13179,29 +13866,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9418,7 +9418,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        darwin* | rhapsody*)
  
  
-@@ -13305,7 +14038,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13307,7 +14040,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9427,7 +9427,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -13376,10 +14109,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13378,10 +14111,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -9440,7 +9440,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	            ;;
  	        esac
  	      fi
-@@ -13420,9 +14153,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13422,9 +14155,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9452,7 +9452,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13492,20 +14225,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13494,20 +14227,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	      prelink_cmds_CXX='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -9477,7 +9477,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13700,7 +14433,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13702,7 +14435,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9486,7 +9486,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  		  ;;
  	      esac
  
-@@ -13746,7 +14479,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13748,7 +14481,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -9495,7 +9495,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13787,9 +14520,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13789,9 +14522,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9507,7 +9507,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13924,6 +14657,13 @@ private:
+@@ -13926,6 +14659,13 @@ private:
  };
  _LT_EOF
  
@@ -9521,7 +9521,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13937,7 +14677,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13939,7 +14679,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9530,7 +9530,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13946,13 +14686,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13948,13 +14688,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9557,7 +9557,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13972,8 +14721,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13974,8 +14723,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9568,7 +9568,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -14009,6 +14760,7 @@ else
+@@ -14011,6 +14762,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -9576,7 +9576,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -14044,7 +14796,7 @@ linux*)
+@@ -14046,7 +14798,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -9585,7 +9585,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -14109,8 +14861,6 @@ fi
+@@ -14111,8 +14863,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -9594,7 +9594,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -14215,6 +14965,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14217,6 +14967,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -9606,7 +9606,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -14367,7 +15122,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14369,7 +15124,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -9615,7 +9615,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -14432,10 +15187,17 @@ case $host_os in
+@@ -14434,10 +15189,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -9636,7 +9636,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -14493,6 +15255,8 @@ fi
+@@ -14495,6 +15257,8 @@ fi
  
  
  
@@ -9645,7 +9645,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14670,6 +15434,7 @@ fi
+@@ -14672,6 +15436,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -9653,7 +9653,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14684,15 +15449,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14686,15 +15451,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9679,7 +9679,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14955,8 +15725,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14957,8 +15727,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9691,7 +9691,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14988,13 +15759,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14990,13 +15761,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9764,7 +9764,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -15534,6 +16363,7 @@ fi
+@@ -15536,6 +16365,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -9772,7 +9772,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -17690,13 +18520,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17751,13 +18581,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9793,7 +9793,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17711,14 +18548,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17772,14 +18609,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9812,7 +9812,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17751,12 +18591,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17812,12 +18652,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9826,7 +9826,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17795,8 +18635,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -17856,8 +18696,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9836,7 +9836,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -17823,12 +18663,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -17884,12 +18724,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9850,7 +9850,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -17866,8 +18706,13 @@ reload_flag \
+@@ -17927,8 +18767,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9864,7 +9864,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17877,12 +18722,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17938,12 +18783,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9880,7 +9880,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17898,7 +18745,6 @@ no_undefined_flag \
+@@ -17959,7 +18806,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9888,7 +9888,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17920,8 +18766,8 @@ LD_CXX \
+@@ -17981,8 +18827,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9898,7 +9898,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -17933,7 +18779,6 @@ no_undefined_flag_CXX \
+@@ -17994,7 +18840,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9906,7 +9906,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -17967,6 +18812,7 @@ module_cmds \
+@@ -18028,6 +18873,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9914,7 +9914,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -17981,7 +18827,8 @@ archive_expsym_cmds_CXX \
+@@ -18042,7 +18888,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9924,7 +9924,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -18738,7 +19585,8 @@ $as_echo X"$file" |
+@@ -18799,7 +19646,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9934,7 +9934,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18841,19 +19689,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18902,19 +19750,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9978,7 +9978,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18883,6 +19754,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18944,6 +19815,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9991,7 +9991,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18892,6 +19769,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18953,6 +19830,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -10001,7 +10001,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19006,12 +19886,12 @@ with_gcc=$GCC
+@@ -19067,12 +19947,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -10017,7 +10017,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19098,9 +19978,6 @@ inherit_rpath=$inherit_rpath
+@@ -19159,9 +20039,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -10027,7 +10027,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19116,6 +19993,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19177,6 +20054,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -10037,7 +10037,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19162,210 +20042,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19223,210 +20103,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10411,7 +10411,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -19393,12 +20232,12 @@ with_gcc=$GCC_CXX
+@@ -19454,12 +20293,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10427,7 +10427,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -19485,9 +20324,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -19546,9 +20385,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10437,7 +10437,7 @@ index 2afc9a381a6..1e57b41ffa4 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -19503,6 +20339,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -19564,6 +20400,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -10448,10 +10448,10 @@ index 2afc9a381a6..1e57b41ffa4 100755
  file_list_spec=$lt_file_list_spec_CXX
  
 diff --git a/gprofng/doc/Makefile.in b/gprofng/doc/Makefile.in
-index a45018334e8..4c30941c6b6 100644
+index 3cd2068cbf6..c5d431236aa 100644
 --- a/gprofng/doc/Makefile.in
 +++ b/gprofng/doc/Makefile.in
-@@ -237,6 +237,7 @@ CXXFLAGS = @CXXFLAGS@
+@@ -240,6 +240,7 @@ CXXFLAGS = @CXXFLAGS@
  CYGPATH_W = @CYGPATH_W@
  DEFS = @DEFS@
  DEPDIR = @DEPDIR@
@@ -10459,7 +10459,7 @@ index a45018334e8..4c30941c6b6 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -272,6 +273,7 @@ LN_S = @LN_S@
+@@ -275,6 +276,7 @@ LN_S = @LN_S@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -10508,7 +10508,7 @@ index eef61ba85f7..0eb1521b704 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/libcollector/configure b/gprofng/libcollector/configure
-index e92fbfc2242..09e93f878ae 100755
+index 079a0b71ec3..a28289cfe9d 100755
 --- a/gprofng/libcollector/configure
 +++ b/gprofng/libcollector/configure
 @@ -641,6 +641,8 @@ OTOOL
@@ -13108,7 +13108,7 @@ index e92fbfc2242..09e93f878ae 100755
  file_list_spec=$lt_file_list_spec_CXX
  
 diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
-index 4274762334e..74ab09d7661 100644
+index 605fa4f6fd4..313c4ceb4ca 100644
 --- a/gprofng/src/Makefile.in
 +++ b/gprofng/src/Makefile.in
 @@ -324,6 +324,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -13128,7 +13128,7 @@ index 4274762334e..74ab09d7661 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 0405028e02f..bd18a0a9e55 100644
+index 08dcd7b75fc..17c58dd2fd0 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
 @@ -384,6 +384,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -13156,7 +13156,7 @@ index 0405028e02f..bd18a0a9e55 100644
  ac_ct_CXX = @ac_ct_CXX@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
 diff --git a/ld/configure b/ld/configure
-index 5f5dad6d67c..18150633570 100755
+index 6406a42c442..21ab5b06709 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -700,8 +700,11 @@ OTOOL
@@ -29906,7 +29906,7 @@ index c1eca5a42ed..7cab295b26d 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/opcodes/configure b/opcodes/configure
-index 483ae4f7a9c..907807594f9 100755
+index d2364991ee8..f9a46eec7a3 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -682,6 +682,9 @@ OTOOL
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index ce795b7522..afd694db4d 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,4 +1,4 @@
-From d6f4f62fda4fde10b805b06d5e61792ee821449c Mon Sep 17 00:00:00 2001
+From ff2754e302d06df51f8dd8ef877afb65eb30fcab Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
 Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
diff --git a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
index 910bd38694..cc0fb551b2 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
@@ -1,4 +1,4 @@
-From 654b4ea9e28aad037e788672ca0d9ba450b3285e Mon Sep 17 00:00:00 2001
+From 039b4afd7d3b5a599aebee97410809276a622ccd Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
 Subject: [PATCH] sync with OE libtool changes
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
index a825f9c842..b921dd1218 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
@@ -1,4 +1,4 @@
-From 9d35ab04de550f1db5d2e74d37fdeab4ca436148 Mon Sep 17 00:00:00 2001
+From 4eb24605fb2012c0f02883d1f560d5d852c0705e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Apr 2020 14:17:20 -0700
 Subject: [PATCH] Check for clang before checking gcc version
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 417fc5a970c..bdc3583215f 100755
+index 9cb953a197e..b63b5cd3de0 100755
 --- a/configure
 +++ b/configure
 @@ -5460,7 +5460,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
@@ -31,7 +31,7 @@ index 417fc5a970c..bdc3583215f 100755
  #endif
  int main() {}
 diff --git a/configure.ac b/configure.ac
-index 3a1eb0357e5..1c00b9aec42 100644
+index e95a9ed116e..2df870b86af 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1444,7 +1444,7 @@ if test "$GCC" = yes; then
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 1871fbc799..f69071ae96 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,4 +1,4 @@
-From 9a296e537708296d32c07c1dc681f59de3d1acf9 Mon Sep 17 00:00:00 2001
+From 9613e47bfdea18d2764eec130676e3e0b40c676f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 10 Mar 2022 21:21:33 -0800
 Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
index 91ac606f78..9cdc7e219d 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From 5fb47367d885a4a32625f09138b306d36ec3769f Mon Sep 17 00:00:00 2001
+From 8af01d85c4e5a5558d770291b7df86acfd59827c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
-- 
2.40.1


