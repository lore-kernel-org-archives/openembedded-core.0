Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.4527.1585252135670096706
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 12:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F7vRdV/0;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id 23so3337252pfj.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 12:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H9Ux1tqE4YZtBalDJsGeV6Pcif/rOigdIxfS0CW3i9A=;
        b=F7vRdV/0p1ZmBjCc4Zd4vIvuKL9jk7CZOBk7rRhCeNkzxcsISRU1ooD4slktDyqHHJ
         pI1gzxOt/pukDVVoLHW70m3AEJmNBC2YckWeVX9F3obHYJeCcpV2mtlwkwAlhJ4ljdgk
         m8zQndcSF19DT9NIdGVQ7fgkCERNXUt191ly6XBdJXE1yp3EO+oAH8c/HQLBx3c2xH6g
         5+T+QC0hc9B7SsF9ngo9a37wRa4R6niH2SIz4J3yP9nbdfItqyRsX55yzcanEQrtNq5w
         ua8GOrnk5EtD8X1NiR8NX7a+7yuwmrc8mrmtJE2hUdZCTM0DVXFXLAhsa3Rp00KESIbV
         Ztvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H9Ux1tqE4YZtBalDJsGeV6Pcif/rOigdIxfS0CW3i9A=;
        b=ABDLIePdaLMc2wMEvKEHD9PNVydjrQwiaf8ICTRP+MEW0etcZGgSeaZSoPdPb3GuL2
         /d5KatjXzc4RqwjmICWCqs+VgDOWtnSb8RJ/ZZVZ4n6sS/DHIzpGICIkTPtqnaMwkd/X
         NwnU0PPTdob8N67uoaK3/pXKtobM20c7CTpz7RE8E1SNY/Thxt+T5holjEWIWc+bLkRN
         DFWE2SfLDs0iroAePCg5+Kp27eII8gF+xsT6i9zrFRQVqPO53lVp3zNNGrPByQcuW55F
         EEIFkHSD5hZPSAPI3BIrcrMfU+HSKr1VlnRlccY9luyDlt0QD0+VeQVVFJpqj0CffDMO
         ZqVg==
X-Gm-Message-State: ANhLgQ3n1FzLCDF9QXr0+d9fVkt+k1HInCA7iiPjLhoKL637NU9Xfdyq
	3J4wpZB4it7urXz7Gms6OkFr8mMG+aA=
X-Google-Smtp-Source: ADFU+vtlbLs9G2saQjeHP1IV5BFeSXt1X35iD58T/dAbbgKYo3bX0K6JDO8epvuOLdYrcfeScCKAzg==
X-Received: by 2002:a63:ce4a:: with SMTP id r10mr333904pgi.225.1585252134274;
        Thu, 26 Mar 2020 12:48:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6809])
        by smtp.gmail.com with ESMTPSA id y4sm2314137pfe.31.2020.03.26.12.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:48:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Drop patching configure files
Date: Thu, 26 Mar 2020 12:49:04 -0700
Message-Id: <20200326194904.1564501-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...iden-the-regexp-for-SH-architectures.patch | 14 -------
 ...-system-directories-when-cross-linki.patch | 42 -------------------
 .../0012-Add-support-for-Netlogic-XLP.patch   | 15 -------
 3 files changed, 71 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
index d10a144ed5..5d2cc9b436 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
@@ -9,23 +9,9 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- configure    | 2 +-
  configure.ac | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure b/configure
-index 91dc42f6c7..7c1b747e7c 100755
---- a/configure
-+++ b/configure
-@@ -3915,7 +3915,7 @@ case "${target}" in
-   nvptx*-*-*)
-     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
-     ;;
--  sh-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
 diff --git a/configure.ac b/configure.ac
 index 4bd869a63a..7187b34dfc 100644
 --- a/configure.ac
diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
index 11a8110d40..04850ababd 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -52,7 +52,6 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  ld/config.in    |  3 +++
- ld/configure    | 16 ++++++++++++++++
  ld/configure.ac | 10 ++++++++++
  ld/ld.h         |  8 ++++++++
  ld/ld.texi      | 12 ++++++++++++
@@ -76,47 +75,6 @@ index d93c9b0830..5da2742bea 100644
  /* Additional extension a shared object might have. */
  #undef EXTRA_SHLIB_EXTENSION
  
-diff --git a/ld/configure b/ld/configure
-index 811134a503..f8c17c19ae 100755
---- a/ld/configure
-+++ b/ld/configure
-@@ -826,6 +826,7 @@ with_lib_path
- enable_targets
- enable_64_bit_bfd
- with_sysroot
-+enable_poison_system_directories
- enable_gold
- enable_got
- enable_compressed_debug_sections
-@@ -1491,6 +1492,8 @@ Optional Features:
-   --disable-largefile     omit support for large files
-   --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
-+  --enable-poison-system-directories
-+                          warn for use of native system library directories
-   --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
-   --enable-got=<type>     GOT handling scheme (target, single, negative,
-                           multigot)
-@@ -15788,6 +15791,19 @@ fi
- 
- 
- 
-+# Check whether --enable-poison-system-directories was given.
-+if test "${enable_poison_system_directories+set}" = set; then :
-+  enableval=$enable_poison_system_directories;
-+else
-+  enable_poison_system_directories=no
-+fi
-+
-+if test "x${enable_poison_system_directories}" = "xyes"; then
-+
-+$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
-+
-+fi
-+
- # Check whether --enable-gold was given.
- if test "${enable_gold+set}" = set; then :
-   enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
 index b5e849d84a..22e022ec03 100644
 --- a/ld/configure.ac
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
index c32867a238..a420dc3aca 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
@@ -25,7 +25,6 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  bfd/elfxx-mips.c      |  8 ++++++++
  binutils/readelf.c    |  1 +
  gas/config/tc-mips.c  |  4 +++-
- gas/configure         |  3 +++
  gas/configure.ac      |  3 +++
  include/elf/mips.h    |  1 +
  include/opcode/mips.h |  6 ++++++
@@ -184,20 +183,6 @@ index fc6898834e..2c7151ccdb 100644
  
    /* MIPS 64 Release 6.  */
    { "i6400",	      0, ASE_VIRT | ASE_MSA,	ISA_MIPS64R6, CPU_MIPS64R6},
-diff --git a/gas/configure b/gas/configure
-index 60c1a055ae..59d6d11215 100755
---- a/gas/configure
-+++ b/gas/configure
-@@ -12722,6 +12722,9 @@ _ACEOF
- 	  mipsisa64r6 | mipsisa64r6el)
- 	    mips_cpu=mips64r6
- 	    ;;
-+	  mipsisa64r2nlm | mipsisa64r2nlmel)
-+	    mips_cpu=xlp
-+	    ;;
- 	  mipstx39 | mipstx39el)
- 	    mips_cpu=r3900
- 	    ;;
 diff --git a/gas/configure.ac b/gas/configure.ac
 index 6f32e55a1a..11c2e0d273 100644
 --- a/gas/configure.ac
-- 
2.26.0

