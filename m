Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id B2AB76E9B4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 09:00:29 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id w10so5129125pde.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2014 01:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fdbc8BKoNoOl+shz5U4+FC0AKglYQ0XhAxiwoq43h6Y=;
	b=hCvUIijfypzWavNKC4vxdnHF5cEp8xIbnpTQP0h088iX7M26mkh8a6POzeY598oUo0
	XDxjwCcdFsQQZ/gQzJqKZ6esO5S69ac7C3s8CFQiV4bqhB4JQDgD8+42Dee7L7f8YmjA
	dqP/dUayNj2rFCD5irJIoiUBDJgXnSxL49Vk1XYi856EiI12EQjiXH1JkmdrKj1WHo1j
	nz8OY6WfaiEk73sMl00fNlsrwfhxUJ/dt96D/EN5QHlrBBXrijcb0kxpLnKWjK9iKH31
	oaG11vk4vd43v0Uwzn5exuavMrpMN+p36YddtDmUJTBV96JNi988GrwFfTatb7GOn0oW
	UfqA==
X-Received: by 10.68.129.5 with SMTP id ns5mr576667pbb.147.1391245230502;
	Sat, 01 Feb 2014 01:00:30 -0800 (PST)
Received: from leo.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id e3sm4737342pbc.17.2014.02.01.01.00.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 01 Feb 2014 01:00:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Feb 2014 01:00:15 -0800
Message-Id: <454d9116b5fa6e0dbd35b594e1baec619f3ad0a2.1391245078.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.rc1
In-Reply-To: <cover.1391245078.git.raj.khem@gmail.com>
References: <cover.1391245078.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] binutils: Upgrade to 2.24
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
X-List-Received-Date: Sat, 01 Feb 2014 09:00:29 -0000

This builds and runs images for all qemu machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 ...pc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch |  122 ---
 ...pc.c-md_assemble-Do-not-generate-APUinfo-.patch |   46 -
 ...ls.texi-elfedit-Fix-use-of-itemx-in-table.patch |   68 --
 ...lf32.em-gld-EMULATION_NAME-_before_alloca.patch |   31 -
 ...-Replace-with-when-it-is-part-of-the-text.patch |  196 ----
 ...pc.c-md_apply_fix-Sign-extend-fieldval-un.patch |   85 --
 ...lf32.em-gld-EMULATION_NAME-_before_alloca.patch |   43 -
 .../binutils-2.23.2/backport/0003-gold.patch       |  203 ----
 .../binutils-2.23.2/backport/aarch64-crn.patch     |  117 ---
 .../binutils-2.23.2/backport/aarch64-movi.patch    |  144 ---
 .../binutils-fix-ineffectual-zero-of-cache.patch   |   60 --
 .../binutils-fix-skip-whitespace-pr14887.patch     |   50 -
 .../binutils-replace-strncat-with-strcat.patch     |   26 -
 .../binutils-fix-over-array-bounds-issue.patch     |   20 -
 .../binutils-x86_64_i386_biarch.patch              |   29 -
 .../{binutils-2.23.2.inc => binutils-2.24.inc}     |   26 +-
 ...n_2.23.2.bb => binutils-cross-canadian_2.24.bb} |    0
 ...tils-cross_2.23.2.bb => binutils-cross_2.24.bb} |    0
 ...rosssdk_2.23.2.bb => binutils-crosssdk_2.24.bb} |    0
 .../binutils-armv5e.patch                          |    0
 .../binutils-poison.patch                          |   88 +-
 .../binutils-uclibc-100-uclibc-conf.patch          |    0
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
 ...binutils-uclibc-300-006_better_file_error.patch |    0
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
 .../binutils-uclibc-gas-needs-libm.patch           |    0
 .../binutils-xlp-support.patch                     |  390 +++----
 .../binutils/binutils/fix-pr15815.patch            |   36 +
 .../libiberty_path_fix.patch                       |    0
 .../libtool-2.4-update.patch                       | 1096 +++++++++-----------
 .../libtool-rpath-fix.patch                        |    0
 .../mips64-default-ld-emulation.patch              |   41 +-
 .../relocatable_sdk.patch                          |    0
 .../{binutils_2.23.2.bb => binutils_2.24.bb}       |    6 +-
 35 files changed, 812 insertions(+), 2113 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0003-gold.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-crn.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-movi.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-ineffectual-zero-of-cache.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-whitespace-pr14887.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-replace-strncat-with-strcat.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/binutils-fix-over-array-bounds-issue.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/binutils-x86_64_i386_biarch.patch
 rename meta/recipes-devtools/binutils/{binutils-2.23.2.inc => binutils-2.24.inc} (51%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.23.2.bb => binutils-cross-canadian_2.24.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.23.2.bb => binutils-cross_2.24.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.23.2.bb => binutils-crosssdk_2.24.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-armv5e.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-poison.patch (78%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-uclibc-100-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-uclibc-300-001_ld_makefile_patch.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-uclibc-300-006_better_file_error.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-uclibc-300-012_check_ldrunpath_length.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-uclibc-gas-needs-libm.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-xlp-support.patch (41%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr15815.patch
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/libiberty_path_fix.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/libtool-2.4-update.patch (97%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/libtool-rpath-fix.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/mips64-default-ld-emulation.patch (68%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/relocatable_sdk.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.23.2.bb => binutils_2.24.bb} (77%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index fb41d5e..1805da7 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "4.8%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.23.2"
+BINUVERSION ?= "2.24"
 EGLIBCVERSION ?= "2.18"
 UCLIBCVERSION ?= "0.9.33+git%"
 LINUXLIBCVERSION ?= "3.10"
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch
deleted file mode 100644
index 6057ad5..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-config/tc-ppc.c (PPC_VLE_SPLIT16A): Delete unused macro.
- (PPC_VLE_SPLIT16D, PPC_VLE_LO16A, PPC_VLE_LO16D): 
- Likewise.      (PPC_VLE_HI16A, PPC_VLE_HI16D): 
- Likewise.      (PPC_VLE_HA16A, PPC_VLE_HA16D): 
- Likewise.      (md_apply_fix): 
- Set fx_no_overflow for assorted relocations.
- Shift and sign-extend fieldval for use by some VLE reloc
- operand->insert functions.
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
-
-commit ee75ce72fd7a4b2dc47db46acc36905da8904be4
-Author: Alan Modra <amodra@bigpond.net.au>
-Date:   Mon May 6 23:36:48 2013 +0000
-
---- binutils-2.23.2/gas/config/tc-ppc.c.orig	2013-06-02 21:44:34.000000000 -0500
-+++ binutils-2.23.2/gas/config/tc-ppc.c	2013-06-02 21:51:37.000000000 -0500
-@@ -64,40 +64,14 @@
- /* #lo(value) denotes the least significant 16 bits of the indicated.  */
- #define PPC_LO(v) ((v) & 0xffff)
- 
--/* Split the indicated value with the msbs in bits 11-15
--   and the lsbs in bits 21-31.  */
--#define PPC_VLE_SPLIT16A(v) ((v & 0xf800) << 11) | (v & 0x7ff)
--
--/* Split the indicated value with the msbs in bits 6-10
--   and the lsbs in bits 21-31.  */
--#define PPC_VLE_SPLIT16D(v) ((v & 0xf800) << 5) | (v & 0x7ff)
--
--/* #lo(value) denotes the lsb 16 bits in split16a format.  */
--#define PPC_VLE_LO16A(v) PPC_VLE_SPLIT16A(PPC_LO(v))
--
--/* #lo(value) denotes the lsb 16 bits in split16d format.  */
--#define PPC_VLE_LO16D(v) PPC_VLE_SPLIT16D(PPC_LO(v))
--
- /* #hi(value) denotes bits 16 through 31 of the indicated value.  */
- #define PPC_HI(v) (((v) >> 16) & 0xffff)
- 
--/* #lo(value) denotes the msb 16 bits in split16a format.  */
--#define PPC_VLE_HI16A(v) PPC_VLE_SPLIT16A(PPC_HI(v))
--
--/* #lo(value) denotes the msb 16 bits in split16d format.  */
--#define PPC_VLE_HI16D(v) PPC_VLE_SPLIT16D(PPC_HI(v))
--
- /* #ha(value) denotes the high adjusted value: bits 16 through 31 of
-   the indicated value, compensating for #lo() being treated as a
-   signed number.  */
- #define PPC_HA(v) PPC_HI ((v) + 0x8000)
- 
--/* #ha(value) denotes the high adjusted value in split16a format.  */
--#define PPC_VLE_HA16A(v) PPC_VLE_SPLIT16A(PPC_HA(v))
--
--/* #ha(value) denotes the high adjusted value in split16d format.  */
--#define PPC_VLE_HA16D(v) PPC_VLE_SPLIT16D(PPC_HA(v))
--
- /* #higher(value) denotes bits 32 through 47 of the indicated value.  */
- #define PPC_HIGHER(v) (((v) >> 16 >> 16) & 0xffff)
- 
-@@ -6379,7 +6353,10 @@
- 	    fixP->fx_r_type = BFD_RELOC_LO16_PCREL;
- 	  /* fall through */
- 	case BFD_RELOC_LO16_PCREL:
-+	case BFD_RELOC_PPC_VLE_LO16A:
-+	case BFD_RELOC_PPC_VLE_LO16D:
- 	  fieldval = SEX16 (value);
-+	  fixP->fx_no_overflow = 1;
- 	  break;
- 
- 	case BFD_RELOC_HI16:
-@@ -6387,7 +6364,10 @@
- 	    fixP->fx_r_type = BFD_RELOC_HI16_PCREL;
- 	  /* fall through */
- 	case BFD_RELOC_HI16_PCREL:
-+	case BFD_RELOC_PPC_VLE_HI16A:
-+	case BFD_RELOC_PPC_VLE_HI16D:
- 	  fieldval = SEX16 (PPC_HI (value));
-+	  fixP->fx_no_overflow = 1;
- 	  break;
- 
- 	case BFD_RELOC_HI16_S:
-@@ -6395,7 +6375,10 @@
- 	    fixP->fx_r_type = BFD_RELOC_HI16_S_PCREL;
- 	  /* fall through */
- 	case BFD_RELOC_HI16_S_PCREL:
-+	case BFD_RELOC_PPC_VLE_HA16A:
-+	case BFD_RELOC_PPC_VLE_HA16D:
- 	  fieldval = SEX16 (PPC_HA (value));
-+	  fixP->fx_no_overflow = 1;
- 	  break;
- 
- #ifdef OBJ_ELF
-@@ -6403,24 +6386,28 @@
- 	  if (fixP->fx_pcrel)
- 	    goto bad_pcrel;
- 	  fieldval = SEX16 (PPC_HIGHER (value));
-+	  fixP->fx_no_overflow = 1;
- 	  break;
- 
- 	case BFD_RELOC_PPC64_HIGHER_S:
- 	  if (fixP->fx_pcrel)
- 	    goto bad_pcrel;
- 	  fieldval = SEX16 (PPC_HIGHERA (value));
-+	  fixP->fx_no_overflow = 1;
- 	  break;
- 
- 	case BFD_RELOC_PPC64_HIGHEST:
- 	  if (fixP->fx_pcrel)
- 	    goto bad_pcrel;
- 	  fieldval = SEX16 (PPC_HIGHEST (value));
-+	  fixP->fx_no_overflow = 1;
- 	  break;
- 
- 	case BFD_RELOC_PPC64_HIGHEST_S:
- 	  if (fixP->fx_pcrel)
- 	    goto bad_pcrel;
- 	  fieldval = SEX16 (PPC_HIGHESTA (value));
-+	  fixP->fx_no_overflow = 1;
- 	  break;
- 
- 	  /* The following relocs can't be calculated by the assembler.
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch
deleted file mode 100644
index 55bbc6a..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-The powerpc assembler can generate .PPC.EMB.apuinfo sections in some 
-circumstances.  These originate, I think, from the old e500 ABI; in 
-any case, they are only defined for 32-bit ABIs, and there is a 
-significant amount of code in bfd/elf32-ppc.c to handle them 
-appropriately, none of which is in elf64-ppc.c.  However, the 
-assembler can generate them when building 64-bit code for processors 
-such as e5500 (which uses PPC_OPCODE_E500MC).  In such circumstances, 
-they get generated as PROGBITS rather than NOTE sections, which 
-reportedly can cause problems in a Linux kernel build. 
-
-Since these sections are only defined in 32-bit ABIs, I think it's 
-most appropriate to avoid generating them for 64-bit output, which 
-this patch does.
-
-Upstream-Status: Backport
-
--Khem 2013/03/25
-
-From d77411f56a85225e3f7b674e7172c712f6cd61cb Mon Sep 17 00:00:00 2001
-From: Joseph Myers <joseph@codesourcery.com>
-Date: Fri, 25 Jan 2013 02:02:20 +0000
-Subject: [PATCH] 	* config/tc-ppc.c (md_assemble): Do not generate
- APUinfo sections 	for 64-bit output.
-
----
- gas/ChangeLog       |    5 +++++
- gas/config/tc-ppc.c |    3 ++-
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/gas/config/tc-ppc.c b/gas/config/tc-ppc.c
-index fd15bea..0929e52 100644
---- a/gas/config/tc-ppc.c
-+++ b/gas/config/tc-ppc.c
-@@ -3249,7 +3249,8 @@ md_assemble (char *str)
- 
- #ifdef OBJ_ELF
-   /* Do we need/want an APUinfo section? */
--  if ((ppc_cpu & (PPC_OPCODE_E500 | PPC_OPCODE_E500MC | PPC_OPCODE_VLE)) != 0)
-+  if ((ppc_cpu & (PPC_OPCODE_E500 | PPC_OPCODE_E500MC | PPC_OPCODE_VLE)) != 0
-+      && !ppc_obj64)
-     {
-       /* These are all version "1".  */
-       if (opcode->flags & PPC_OPCODE_SPE)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch
deleted file mode 100644
index 97a40a2..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From e02bf9359f6ef7fe4d341aa5ac4f397f541b9ac3 Mon Sep 17 00:00:00 2001
-From: Andreas Schwab <schwab@linux-m68k.org>
-Date: Fri, 4 Jan 2013 22:27:57 +0000
-Subject: [PATCH] * doc/binutils.texi (elfedit): Fix use of @itemx in @table.
-
----
- binutils/ChangeLog         |    4 ++++
- binutils/doc/binutils.texi |   14 +++++++-------
- 2 files changed, 11 insertions(+), 7 deletions(-)
-
-Upstream-Status: Backport
-Index: binutils-2.23.1/binutils/doc/binutils.texi
-===================================================================
---- binutils-2.23.1.orig/binutils/doc/binutils.texi	2012-05-11 11:18:34.000000000 -0700
-+++ binutils-2.23.1/binutils/doc/binutils.texi	2013-02-26 12:41:51.785114224 -0800
-@@ -12,7 +12,7 @@
- @c man begin COPYRIGHT
- Copyright @copyright{} 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998,
- 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009,
--2010, 2011, 2012
-+2010, 2011, 2012, 2013
- Free Software Foundation, Inc.
- 
- Permission is granted to copy, distribute and/or modify this document
-@@ -4375,7 +4375,7 @@
- 
- @table @env
- 
--@itemx --input-mach=@var{machine}
-+@item --input-mach=@var{machine}
- Set the matching input ELF machine type to @var{machine}.  If
- @option{--input-mach} isn't specified, it will match any ELF
- machine types.
-@@ -4383,21 +4383,21 @@
- The supported ELF machine types are, @var{L1OM}, @var{K1OM} and
- @var{x86-64}.
- 
--@itemx --output-mach=@var{machine}
-+@item --output-mach=@var{machine}
- Change the ELF machine type in the ELF header to @var{machine}.  The
- supported ELF machine types are the same as @option{--input-mach}.
- 
--@itemx --input-type=@var{type}
-+@item --input-type=@var{type}
- Set the matching input ELF file type to @var{type}.  If
- @option{--input-type} isn't specified, it will match any ELF file types.
- 
- The supported ELF file types are, @var{rel}, @var{exec} and @var{dyn}.
- 
--@itemx --output-type=@var{type}
-+@item --output-type=@var{type}
- Change the ELF file type in the ELF header to @var{type}.  The
- supported ELF types are the same as @option{--input-type}.
- 
--@itemx --input-osabi=@var{osabi}
-+@item --input-osabi=@var{osabi}
- Set the matching input ELF file OSABI to @var{osabi}.  If
- @option{--input-osabi} isn't specified, it will match any ELF OSABIs.
- 
-@@ -4407,7 +4407,7 @@
- @var{FreeBSD}, @var{TRU64}, @var{Modesto}, @var{OpenBSD}, @var{OpenVMS},
- @var{NSK}, @var{AROS} and @var{FenixOS}.
- 
--@itemx --output-osabi=@var{osabi}
-+@item --output-osabi=@var{osabi}
- Change the ELF OSABI in the ELF header to @var{osabi}.  The
- supported ELF OSABI are the same as @option{--input-osabi}.
- 
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch
deleted file mode 100644
index 050450f..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4c147afe1796611c431aa86ea12342c1d80c2c4b Mon Sep 17 00:00:00 2001
-From: "Maciej W. Rozycki" <macro@linux-mips.org>
-Date: Wed, 1 May 2013 17:18:43 +0000
-Subject: [PATCH] 	* emultempl/elf32.em
- (gld${EMULATION_NAME}_before_allocation): 	Use
- is_elf_hash_table rather than a handcoded condition.
-
----
- ld/ChangeLog          |    5 +++++
- ld/emultempl/elf32.em |    2 +-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-2013-05-01  Maciej W. Rozycki  <macro@codesourcery.com>
-
-       * emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation):
-       Use is_elf_hash_table rather than a handcoded condition.
-
-Upstream-Status: Backport
-Index: binutils-2.23.2/ld/emultempl/elf32.em
-===================================================================
---- binutils-2.23.2.orig/ld/emultempl/elf32.em	2013-06-26 23:29:32.000000000 -0700
-+++ binutils-2.23.2/ld/emultempl/elf32.em	2013-06-26 23:35:45.798428256 -0700
-@@ -1494,7 +1494,7 @@
-   asection *sinterp;
-   bfd *abfd;
- 
--  if (link_info.hash->type == bfd_link_elf_hash_table)
-+  if (is_elf_hash_table (link_info.hash))
-     _bfd_elf_tls_setup (link_info.output_bfd, &link_info);
- 
-   /* If we are going to make any variable assignments, we need to let
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch
deleted file mode 100644
index 83d27d3..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-From 935f85422863b42b6fbca30885885e3fa28eea36 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Mon, 7 Jan 2013 12:11:11 +0000
-Subject: [PATCH] 	* ld.texinfo: Replace @ with @@ when it is part of
- the text. 	Correct ordering of M68HC11 entry.
-
-	* doc/binutils.texi: Fix ordering of top level nodes.
-	Replace erroneous uses of @itemx with @item.
-
-	* bfd.texinfo: Replace @ with @@ when it is part of the text.
----
- bfd/doc/ChangeLog          |    4 ++++
- bfd/doc/bfd.texinfo        |   12 +++++++-----
- binutils/ChangeLog         |    5 +++++
- binutils/doc/binutils.texi |    8 ++++----
- ld/ChangeLog               |    5 +++++
- ld/ld.texinfo              |   26 ++++++++++++++------------
- 6 files changed, 39 insertions(+), 21 deletions(-)
-
-
-Upstream-Status: Backport
-Index: binutils-2.23.1/bfd/doc/bfd.texinfo
-===================================================================
---- binutils-2.23.1.orig/bfd/doc/bfd.texinfo	2010-10-28 04:40:25.000000000 -0700
-+++ binutils-2.23.1/bfd/doc/bfd.texinfo	2013-02-26 12:42:26.909115020 -0800
-@@ -1,7 +1,7 @@
- \input texinfo.tex
- @setfilename bfd.info
- @c Copyright 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1997, 2000,
--@c 2001, 2002, 2003, 2006, 2007, 2008, 2009
-+@c 2001, 2002, 2003, 2006, 2007, 2008, 2009, 2013
- @c Free Software Foundation, Inc.
- @c 
- @synindex fn cp
-@@ -16,7 +16,8 @@
- @copying
- This file documents the BFD library.
- 
--Copyright @copyright{} 1991, 2000, 2001, 2003, 2006, 2007, 2008 Free Software Foundation, Inc.
-+Copyright @copyright{} 1991, 2000, 2001, 2003, 2006, 2007, 2008, 2013
-+Free Software Foundation, Inc.
- 
- Permission is granted to copy, distribute and/or modify this document
- under the terms of the GNU Free Documentation License, Version 1.3 or
-@@ -64,7 +65,8 @@
- @end tex
- 
- @vskip 0pt plus 1filll
--Copyright @copyright{} 1991, 2001, 2003, 2006, 2008 Free Software Foundation, Inc.
-+Copyright @copyright{} 1991, 2001, 2003, 2006, 2008, 2013
-+Free Software Foundation, Inc.
- 
-       Permission is granted to copy, distribute and/or modify this document
-       under the terms of the GNU Free Documentation License, Version 1.3
-@@ -322,7 +324,7 @@
- @printindex cp
- 
- @tex
--% I think something like @colophon should be in texinfo.  In the
-+% I think something like @@colophon should be in texinfo.  In the
- % meantime:
- \long\def\colophon{\hbox to0pt{}\vfill
- \centerline{The body of this manual is set in}
-@@ -333,7 +335,7 @@
- \centerline{{\sl\fontname\tensl\/}}
- \centerline{are used for emphasis.}\vfill}
- \page\colophon
--% Blame: doc@cygnus.com, 28mar91.
-+% Blame: doc@@cygnus.com, 28mar91.
- @end tex
- 
- @bye
-Index: binutils-2.23.1/binutils/doc/binutils.texi
-===================================================================
---- binutils-2.23.1.orig/binutils/doc/binutils.texi	2013-02-26 12:41:51.000000000 -0800
-+++ binutils-2.23.1/binutils/doc/binutils.texi	2013-02-26 12:42:26.913115010 -0800
-@@ -148,18 +148,18 @@
- * objcopy::			Copy and translate object files
- * objdump::                     Display information from object files
- * ranlib::                      Generate index to archive contents
--* readelf::                     Display the contents of ELF format files
- * size::                        List section sizes and total size
- * strings::                     List printable strings from files
- * strip::                       Discard symbols
--* elfedit::                     Update the ELF header of ELF files
- * c++filt::			Filter to demangle encoded C++ symbols
- * cxxfilt: c++filt.             MS-DOS name for c++filt
- * addr2line::			Convert addresses to file and line
- * nlmconv::                     Converts object code into an NLM
--* windres::			Manipulate Windows resources
- * windmc::			Generator for Windows message resources
-+* windres::			Manipulate Windows resources
- * dlltool::			Create files needed to build and use DLLs
-+* readelf::                     Display the contents of ELF format files
-+* elfedit::                     Update the ELF header of ELF files
- * Common Options::              Command-line options for all utilities
- * Selecting the Target System:: How these utilities determine the target
- * Reporting Bugs::              Reporting Bugs
-@@ -2898,7 +2898,7 @@
- @c man end
- @end ignore
- 
--@node c++filt, addr2line, elfedit, Top
-+@node c++filt, addr2line, strip, Top
- @chapter c++filt
- 
- @kindex c++filt
-Index: binutils-2.23.1/ld/ld.texinfo
-===================================================================
---- binutils-2.23.1.orig/ld/ld.texinfo	2013-02-19 14:26:56.571782665 -0800
-+++ binutils-2.23.1/ld/ld.texinfo	2013-02-26 12:45:20.677119476 -0800
-@@ -1,7 +1,8 @@
- \input texinfo
- @setfilename ld.info
- @c Copyright 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000,
--@c 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012
-+@c 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011,
-+@c 2012, 2013
- @c Free Software Foundation, Inc.
- @syncodeindex ky cp
- @c man begin INCLUDE
-@@ -55,7 +56,8 @@
- version @value{VERSION}.
- 
- Copyright @copyright{} 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000,
--2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
-+2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2012, 2013
-+Free Software Foundation, Inc.
- 
- Permission is granted to copy, distribute and/or modify this document
- under the terms of the GNU Free Documentation License, Version 1.3
-@@ -93,8 +95,8 @@
- @vskip 0pt plus 1filll
- @c man begin COPYRIGHT
- Copyright @copyright{} 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998,
--1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009 Free
--Software Foundation, Inc.
-+1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009,
-+2012, 2013 Free Software Foundation, Inc.
- 
- Permission is granted to copy, distribute and/or modify this document
- under the terms of the GNU Free Documentation License, Version 1.3
-@@ -142,12 +144,12 @@
- @ifset ARM
- * ARM::				ld and the ARM family
- @end ifset
--@ifset HPPA
--* HPPA ELF32::                  ld and HPPA 32-bit ELF
--@end ifset
- @ifset M68HC11
- * M68HC11/68HC12::              ld and the Motorola 68HC11 and 68HC12 families
- @end ifset
-+@ifset HPPA
-+* HPPA ELF32::                  ld and HPPA 32-bit ELF
-+@end ifset
- @ifset M68K
- * M68K::                        ld and Motorola 68K family
- @end ifset
-@@ -6003,6 +6005,9 @@
- @ifset I960
- * i960::                        @command{ld} and the Intel 960 family
- @end ifset
-+@ifset M68HC11
-+* M68HC11/68HC12::		@code{ld} and the Motorola 68HC11 and 68HC12 families
-+@end ifset
- @ifset ARM
- * ARM::				@command{ld} and the ARM family
- @end ifset
-@@ -6018,9 +6023,6 @@
- @ifset MSP430
- * MSP430::			@command{ld} and MSP430
- @end ifset
--@ifset M68HC11
--* M68HC11/68HC12::		@code{ld} and the Motorola 68HC11 and 68HC12 families
--@end ifset
- @ifset POWERPC
- * PowerPC ELF32::		@command{ld} and PowerPC 32-bit ELF Support
- @end ifset
-@@ -7868,7 +7870,7 @@
- @printindex cp
- 
- @tex
--% I think something like @colophon should be in texinfo.  In the
-+% I think something like @@colophon should be in texinfo.  In the
- % meantime:
- \long\def\colophon{\hbox to0pt{}\vfill
- \centerline{The body of this manual is set in}
-@@ -7879,7 +7881,7 @@
- \centerline{{\sl\fontname\tensl\/}}
- \centerline{are used for emphasis.}\vfill}
- \page\colophon
--% Blame: doc@cygnus.com, 28mar91.
-+% Blame: doc@@cygnus.com, 28mar91.
- @end tex
- 
- @bye
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch
deleted file mode 100644
index a62ca47..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-config/tc-ppc.c (md_apply_fix): Sign extend fieldval under control of operand flag bits.
-
-Upstream-Status: Backport
-
-Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
-
-commit cf5434698882f41ddfcc469488e8a68c674aae03
-Author: Alan Modra <amodra@bigpond.net.au>
-Date:   Thu May 9 04:01:53 2013 +0000
-
---- binutils-2.23.2/gas/config/tc-ppc.c.orig	2013-06-02 21:53:24.000000000 -0500
-+++ binutils-2.23.2/gas/config/tc-ppc.c	2013-06-02 22:03:00.000000000 -0500
-@@ -6355,7 +6355,10 @@
- 	case BFD_RELOC_LO16_PCREL:
- 	case BFD_RELOC_PPC_VLE_LO16A:
- 	case BFD_RELOC_PPC_VLE_LO16D:
--	  fieldval = SEX16 (value);
-+	  fieldval = value & 0xffff;
-+	sign_extend_16:
-+	  if ((operand->flags & PPC_OPERAND_SIGNED) != 0)
-+	    fieldval = (fieldval ^ 0x8000) - 0x8000;
- 	  fixP->fx_no_overflow = 1;
- 	  break;
- 
-@@ -6366,9 +6369,8 @@
- 	case BFD_RELOC_HI16_PCREL:
- 	case BFD_RELOC_PPC_VLE_HI16A:
- 	case BFD_RELOC_PPC_VLE_HI16D:
--	  fieldval = SEX16 (PPC_HI (value));
--	  fixP->fx_no_overflow = 1;
--	  break;
-+	  fieldval = PPC_HI (value);
-+	  goto sign_extend_16;
- 
- 	case BFD_RELOC_HI16_S:
- 	  if (fixP->fx_pcrel)
-@@ -6377,38 +6379,33 @@
- 	case BFD_RELOC_HI16_S_PCREL:
- 	case BFD_RELOC_PPC_VLE_HA16A:
- 	case BFD_RELOC_PPC_VLE_HA16D:
--	  fieldval = SEX16 (PPC_HA (value));
--	  fixP->fx_no_overflow = 1;
--	  break;
-+	  fieldval = PPC_HA (value);
-+	  goto sign_extend_16;
- 
- #ifdef OBJ_ELF
- 	case BFD_RELOC_PPC64_HIGHER:
- 	  if (fixP->fx_pcrel)
- 	    goto bad_pcrel;
--	  fieldval = SEX16 (PPC_HIGHER (value));
--	  fixP->fx_no_overflow = 1;
--	  break;
-+	  fieldval = PPC_HIGHER (value);
-+	  goto sign_extend_16;
- 
- 	case BFD_RELOC_PPC64_HIGHER_S:
- 	  if (fixP->fx_pcrel)
- 	    goto bad_pcrel;
--	  fieldval = SEX16 (PPC_HIGHERA (value));
--	  fixP->fx_no_overflow = 1;
--	  break;
-+	  fieldval = PPC_HIGHERA (value);
-+	  goto sign_extend_16;
- 
- 	case BFD_RELOC_PPC64_HIGHEST:
- 	  if (fixP->fx_pcrel)
- 	    goto bad_pcrel;
--	  fieldval = SEX16 (PPC_HIGHEST (value));
--	  fixP->fx_no_overflow = 1;
--	  break;
-+	  fieldval = PPC_HIGHEST (value);
-+	  goto sign_extend_16;
- 
- 	case BFD_RELOC_PPC64_HIGHEST_S:
- 	  if (fixP->fx_pcrel)
- 	    goto bad_pcrel;
--	  fieldval = SEX16 (PPC_HIGHESTA (value));
--	  fixP->fx_no_overflow = 1;
--	  break;
-+	  fieldval = PPC_HIGHESTA (value);
-+	  goto sign_extend_16;
- 
- 	  /* The following relocs can't be calculated by the assembler.
- 	     Leave the field zero.  */
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch
deleted file mode 100644
index 36e5924..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b0d2b7b6eae7b7f4fbfd1695d4d2f1b45198d597 Mon Sep 17 00:00:00 2001
-From: "Maciej W. Rozycki" <macro@linux-mips.org>
-Date: Fri, 3 May 2013 15:01:19 +0000
-Subject: [PATCH] 	* emultempl/elf32.em
- (gld${EMULATION_NAME}_before_allocation): 	Only call
- lang_for_each_statement if an ELF hash table is used.
-
----
- ld/ChangeLog          |    5 +++++
- ld/emultempl/elf32.em |   12 +++++++-----
- 2 files changed, 12 insertions(+), 5 deletions(-)
-
-2013-05-03  Alan Modra  <amodra@gmail.com>
-
-       * emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation):
-       Only call lang_for_each_statement if an ELF hash table is used.
-
-Upstream-Status: Backport
-
-Index: binutils-2.23.2/ld/emultempl/elf32.em
-===================================================================
---- binutils-2.23.2.orig/ld/emultempl/elf32.em	2013-06-26 23:35:45.000000000 -0700
-+++ binutils-2.23.2/ld/emultempl/elf32.em	2013-06-26 23:37:04.530429733 -0700
-@@ -1495,12 +1495,14 @@
-   bfd *abfd;
- 
-   if (is_elf_hash_table (link_info.hash))
--    _bfd_elf_tls_setup (link_info.output_bfd, &link_info);
-+    {
-+      _bfd_elf_tls_setup (link_info.output_bfd, &link_info);
- 
--  /* If we are going to make any variable assignments, we need to let
--     the ELF backend know about them in case the variables are
--     referred to by dynamic objects.  */
--  lang_for_each_statement (gld${EMULATION_NAME}_find_statement_assignment);
-+      /* If we are going to make any variable assignments, we need to
-+	 let the ELF backend know about them in case the variables are
-+	 referred to by dynamic objects.  */
-+      lang_for_each_statement (gld${EMULATION_NAME}_find_statement_assignment);
-+    }
- 
-   /* Let the ELF backend work out the sizes of any sections required
-      by dynamic linking.  */
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0003-gold.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0003-gold.patch
deleted file mode 100644
index 141e66b..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/0003-gold.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-From a347c1bd9be53513f60ed0e5f440c1f5cd78dec4 Mon Sep 17 00:00:00 2001
-From: "Maciej W. Rozycki" <macro@linux-mips.org>
-Date: Fri, 3 May 2013 15:19:26 +0000
-Subject: [PATCH]         gold/         PR ld/15365         * layout.cc
- (Layout::finalize): Make __ehdr_start STV_HIDDEN.
-
-        ld/
-        PR ld/15365
-        * emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation):
-        Restrict __ehdr_start's export class to no less than STV_HIDDEN.
-
-        ld/testsuite/
-        PR ld/15365
-        * ld-elf/ehdr_start.d: Expect __ehdr_start to be STB_LOCAL.
-        * ld-mips-elf/ehdr_start-1.nd: New test.
-        * ld-mips-elf/ehdr_start-2.nd: New test.
-        * ld-mips-elf/ehdr_start-1.ld: New test linker script.
-        * ld-mips-elf/ehdr_start-2.ld: New test linker script.
-        * ld-mips-elf/ehdr_start-new.s: New test source.
-        * ld-mips-elf/ehdr_start-o32.s: New test source.
-        * ld-mips-elf/mips-elf.exp: Run the new tests.
----
- gold/ChangeLog                            |    5 +++++
- gold/layout.cc                            |    2 +-
- ld/ChangeLog                              |    6 ++++++
- ld/emultempl/elf32.em                     |    7 +++++++
- ld/testsuite/ChangeLog                    |   12 ++++++++++++
- ld/testsuite/ld-elf/ehdr_start.d          |    2 +-
- ld/testsuite/ld-mips-elf/ehdr_start-1.ld  |    9 +++++++++
- ld/testsuite/ld-mips-elf/ehdr_start-1.nd  |    4 ++++
- ld/testsuite/ld-mips-elf/ehdr_start-2.ld  |   10 ++++++++++
- ld/testsuite/ld-mips-elf/ehdr_start-2.nd  |    4 ++++
- ld/testsuite/ld-mips-elf/ehdr_start-new.s |   13 +++++++++++++
- ld/testsuite/ld-mips-elf/ehdr_start-o32.s |   14 ++++++++++++++
- ld/testsuite/ld-mips-elf/mips-elf.exp     |   25 +++++++++++++++++++++++++
- 13 files changed, 111 insertions(+), 2 deletions(-)
- create mode 100644 ld/testsuite/ld-mips-elf/ehdr_start-1.ld
- create mode 100644 ld/testsuite/ld-mips-elf/ehdr_start-1.nd
- create mode 100644 ld/testsuite/ld-mips-elf/ehdr_start-2.ld
- create mode 100644 ld/testsuite/ld-mips-elf/ehdr_start-2.nd
- create mode 100644 ld/testsuite/ld-mips-elf/ehdr_start-new.s
- create mode 100644 ld/testsuite/ld-mips-elf/ehdr_start-o32.s
-
-Upstream-Status: Backport
-Index: binutils-2.23.2/gold/layout.cc
-===================================================================
---- binutils-2.23.2.orig/gold/layout.cc	2013-06-26 23:29:32.000000000 -0700
-+++ binutils-2.23.2/gold/layout.cc	2013-06-26 23:39:22.170432315 -0700
-@@ -2516,7 +2516,7 @@
-     symtab->define_in_output_segment("__ehdr_start", NULL,
- 				     Symbol_table::PREDEFINED, load_seg, 0, 0,
- 				     elfcpp::STT_NOTYPE, elfcpp::STB_GLOBAL,
--				     elfcpp::STV_DEFAULT, 0,
-+				     elfcpp::STV_HIDDEN, 0,
- 				     Symbol::SEGMENT_START, true);
- 
-   // Set the file offsets of all the non-data sections we've seen so
-Index: binutils-2.23.2/ld/emultempl/elf32.em
-===================================================================
---- binutils-2.23.2.orig/ld/emultempl/elf32.em	2013-06-26 23:37:04.000000000 -0700
-+++ binutils-2.23.2/ld/emultempl/elf32.em	2013-06-26 23:39:22.174432315 -0700
-@@ -1498,6 +1498,13 @@
-     {
-       _bfd_elf_tls_setup (link_info.output_bfd, &link_info);
- 
-+      /* Make __ehdr_start hidden if it has been referenced, to
-+	 prevent the symbol from being dynamic.  */
-+      if (!bfd_elf_record_link_assignment (link_info.output_bfd, &link_info,
-+					   "__ehdr_start", TRUE, TRUE))
-+	einfo ("%P%F: failed to record assignment to %s: %E\n",
-+	       "__ehdr_start");
-+
-       /* If we are going to make any variable assignments, we need to
- 	 let the ELF backend know about them in case the variables are
- 	 referred to by dynamic objects.  */
-Index: binutils-2.23.2/ld/testsuite/ld-elf/ehdr_start.d
-===================================================================
---- binutils-2.23.2.orig/ld/testsuite/ld-elf/ehdr_start.d	2013-06-26 23:29:32.000000000 -0700
-+++ binutils-2.23.2/ld/testsuite/ld-elf/ehdr_start.d	2013-06-26 23:39:22.174432315 -0700
-@@ -4,5 +4,5 @@
- #target: *-*-linux* *-*-gnu* *-*-nacl*
- 
- #...
--[0-9a-f]*000 [ADRT] __ehdr_start
-+[0-9a-f]*000 [Adrt] __ehdr_start
- #pass
-Index: binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-1.ld
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-1.ld	2013-06-26 23:39:22.174432315 -0700
-@@ -0,0 +1,9 @@
-+ENTRY (__start)
-+SECTIONS
-+{
-+  . = 0x12300000 + SIZEOF_HEADERS;
-+  .text : { *(.text) }
-+  . = 0x23400000;
-+  HIDDEN (_gp = ALIGN (16) + 0x7ff0);
-+  .got : { *(.got) }
-+}
-Index: binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-1.nd
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-1.nd	2013-06-26 23:39:22.174432315 -0700
-@@ -0,0 +1,4 @@
-+Symbol table '\.symtab' contains [0-9]+ entries:
-+#...
-+ *[0-9]+: 0*12300000 +0 (?:NOTYPE|OBJECT) +LOCAL +DEFAULT +[0-9]+ __ehdr_start
-+#pass
-Index: binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-2.ld
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-2.ld	2013-06-26 23:39:22.174432315 -0700
-@@ -0,0 +1,10 @@
-+ENTRY (__start)
-+SECTIONS
-+{
-+  . = 0x12300000 + SIZEOF_HEADERS;
-+  .text : { *(.text) }
-+  . = 0x23400000;
-+  __ehdr_start = .;
-+  HIDDEN (_gp = ALIGN (16) + 0x7ff0);
-+  .got : { *(.got) }
-+}
-Index: binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-2.nd
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-2.nd	2013-06-26 23:39:22.178432315 -0700
-@@ -0,0 +1,4 @@
-+Symbol table '\.symtab' contains [0-9]+ entries:
-+#...
-+ *[0-9]+: 0*23400000 +0 (?:NOTYPE|OBJECT) +LOCAL +DEFAULT +[0-9]+ __ehdr_start
-+#pass
-Index: binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-new.s
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-new.s	2013-06-26 23:39:22.178432315 -0700
-@@ -0,0 +1,13 @@
-+	.abicalls
-+	.text
-+	.weak	__ehdr_start
-+	.globl	__start
-+	.ent	__start
-+	.frame	$29, 0, $31
-+	.mask	0x00000000, 0
-+__start:
-+	.cplocal $2
-+	.cpsetup $t9, $zero, __start
-+	lw	$2, __ehdr_start
-+	jr	$31
-+	.end	__start
-Index: binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-o32.s
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ binutils-2.23.2/ld/testsuite/ld-mips-elf/ehdr_start-o32.s	2013-06-26 23:39:22.178432315 -0700
-@@ -0,0 +1,14 @@
-+	.abicalls
-+	.text
-+	.weak	__ehdr_start
-+	.globl	__start
-+	.ent	__start
-+	.frame	$29, 0, $31
-+	.mask	0x00000000, 0
-+__start:
-+	.set	noreorder
-+	.cpload	$25
-+	.set	reorder
-+	lw	$2, __ehdr_start
-+	jr	$31
-+	.end	__start
-Index: binutils-2.23.2/ld/testsuite/ld-mips-elf/mips-elf.exp
-===================================================================
---- binutils-2.23.2.orig/ld/testsuite/ld-mips-elf/mips-elf.exp	2013-06-26 23:29:32.000000000 -0700
-+++ binutils-2.23.2/ld/testsuite/ld-mips-elf/mips-elf.exp	2013-06-26 23:39:22.178432315 -0700
-@@ -669,3 +669,28 @@
- 		"readelf -A export-class-call16-${abi}.gd"] \
- 	    "export-class-call16-${abi}.so"]]
- }
-+
-+# Magic __ehdr_start symbol tests.
-+set abis [concat o32 [expr {$has_newabi ? "n32 n64" : ""}]]
-+foreach { abi } $abis {
-+    set suff [string map {o32 o32 n32 new n64 new} $abi]
-+    run_ld_link_tests [list \
-+        [list \
-+            "MIPS magic __ehdr_start symbol test 1 ($abi)" \
-+            "$abi_ldflags($abi) -T ehdr_start-1.ld" "" \
-+            "$abi_asflags($abi)" \
-+            [list ehdr_start-${suff}.s] \
-+            [list "readelf -s ehdr_start-1.nd"] \
-+            "ehdr_start-1-${abi}"]]
-+    if [regexp "(?:n32|n64)" "$abi"] {
-+	setup_kfail "mips*-*-*" "ld/15428"
-+    }
-+    run_ld_link_tests [list \
-+        [list \
-+            "MIPS magic __ehdr_start symbol test 2 ($abi)" \
-+            "$abi_ldflags($abi) -T ehdr_start-2.ld" "" \
-+            "$abi_asflags($abi)" \
-+            [list ehdr_start-${suff}.s] \
-+            [list "readelf -s ehdr_start-2.nd"] \
-+            "ehdr_start-2-${abi}"]]
-+}
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-crn.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-crn.patch
deleted file mode 100644
index 920ccbc..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-crn.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From: Yufeng Zhang <yufeng.zhang@arm.com>
-Date: Mon, 13 May 2013 22:50:00 +0000 (+0000)
-Subject: gas/
-X-Git-Url: http://sourceware.org/git/?p=binutils.git;a=commitdiff_plain;h=1796bf893c4729d5c523502318d72cae78495d6c
-
-Upstream-Status: backport
-
-gas/
-
-	Backport from mainline:
-
-	2013-02-27 Yufeng Zhang <yufeng.zhang@arm.com>
-	* config/tc-aarch64.c (parse_sys_reg): Allow the full range of CRn
-	for system registers.
-
-gas/testsuite/
-
-	Backport from mainline:
-
-	2013-02-27 Yufeng Zhang <yufeng.zhang@arm.com>
-	* gas/aarch64/illegal.l: Delete the error message for
-	msr S3_1_C13_C15_1,x7.
-	* gas/aarch64/sysreg.s: Add new tests.
-	* gas/aarch64/sysreg.d: Update.
----
-
-diff --git a/gas/ChangeLog b/gas/ChangeLog
-index 821acc9..3d09792 100644
---- a/gas/ChangeLog
-+++ b/gas/ChangeLog
-@@ -1,3 +1,11 @@
-+2013-05-13 Yufeng Zhang <yufeng.zhang@arm.com>
-+
-+	Backport from mainline:
-+
-+	2013-02-27 Yufeng Zhang <yufeng.zhang@arm.com>
-+	* config/tc-aarch64.c (parse_sys_reg): Allow the full range of CRn
-+	for system registers.
-+
- 2013-03-05  Yufeng Zhang  <yufeng.zhang@arm.com>
- 
- 	* config/tc-aarch64.c (aarch64_imm_float_p): Rename 'e' to 'pattern';
-diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
-index 162c865..db28c71 100644
---- a/gas/config/tc-aarch64.c
-+++ b/gas/config/tc-aarch64.c
-@@ -3243,10 +3243,14 @@ parse_sys_reg (char **str, struct hash_control *sys_regs, int imple_defined_p)
- 	  unsigned int op0, op1, cn, cm, op2;
- 	  if (sscanf (buf, "s%u_%u_c%u_c%u_%u", &op0, &op1, &cn, &cm, &op2) != 5)
- 	    return PARSE_FAIL;
--	  /* Register access is encoded as follows:
-+	  /* The architecture specifies the encoding space for implementation
-+	     defined registers as:
- 	     op0  op1  CRn   CRm   op2
--	     11   xxx  1x11  xxxx  xxx.  */
--	  if (op0 != 3 || op1 > 7 || (cn | 0x4) != 0xf || cm > 15 || op2 > 7)
-+	     11   xxx  1x11  xxxx  xxx
-+	     For convenience GAS accepts a wider encoding space, as follows:
-+	     op0  op1  CRn   CRm   op2
-+	     11   xxx  xxxx  xxxx  xxx  */
-+	  if (op0 != 3 || op1 > 7 || cn > 15 || cm > 15 || op2 > 7)
- 	    return PARSE_FAIL;
- 	  value = (op0 << 14) | (op1 << 11) | (cn << 7) | (cm << 3) | op2;
- 	}
-diff --git a/gas/testsuite/ChangeLog b/gas/testsuite/ChangeLog
-index d1ebc3b..8ee06c8 100644
---- a/gas/testsuite/ChangeLog
-+++ b/gas/testsuite/ChangeLog
-@@ -1,3 +1,13 @@
-+2013-05-13 Yufeng Zhang <yufeng.zhang@arm.com>
-+
-+	Backport from mainline:
-+
-+	2013-02-27 Yufeng Zhang <yufeng.zhang@arm.com>
-+	* gas/aarch64/illegal.l: Delete the error message for
-+	msr S3_1_C13_C15_1,x7.
-+	* gas/aarch64/sysreg.s: Add new tests.
-+	* gas/aarch64/sysreg.d: Update.
-+
- 2013-03-08  Christian Groessler  <chris@groessler.org>
- 
- 	Backport from mainline:
-diff --git a/gas/testsuite/gas/aarch64/illegal.l b/gas/testsuite/gas/aarch64/illegal.l
-index e17a1de..f7e4074 100644
---- a/gas/testsuite/gas/aarch64/illegal.l
-+++ b/gas/testsuite/gas/aarch64/illegal.l
-@@ -520,7 +520,6 @@
- [^:]*:496: Error: .*`str x1,page_table_count'
- [^:]*:498: Error: .*`prfm PLDL3KEEP,\[x9,x15,sxtx#2\]'
- [^:]*:500: Error: .*`mrs x5,S1_0_C13_C8_0'
--[^:]*:501: Error: .*`msr S3_1_C13_C15_1,x7'
- [^:]*:502: Error: .*`msr S3_1_C11_C15_-1,x7'
- [^:]*:503: Error: .*`msr S3_1_11_15_1,x7'
- [^:]*:506: Error: .*`movi w1,#15'
-diff --git a/gas/testsuite/gas/aarch64/sysreg.d b/gas/testsuite/gas/aarch64/sysreg.d
-index b83b270..c7cf00e 100644
---- a/gas/testsuite/gas/aarch64/sysreg.d
-+++ b/gas/testsuite/gas/aarch64/sysreg.d
-@@ -23,3 +23,6 @@ Disassembly of section \.text:
-   3c:	d5380260 	mrs	x0, id_isar3_el1
-   40:	d5380280 	mrs	x0, id_isar4_el1
-   44:	d53802a0 	mrs	x0, id_isar5_el1
-+  48:	d538cc00 	mrs	x0, s3_0_c12_c12_0
-+  4c:	d5384600 	mrs	x0, s3_0_c4_c6_0
-+  50:	d5184600 	msr	s3_0_c4_c6_0, x0
-diff --git a/gas/testsuite/gas/aarch64/sysreg.s b/gas/testsuite/gas/aarch64/sysreg.s
-index e6f770e..3287594 100644
---- a/gas/testsuite/gas/aarch64/sysreg.s
-+++ b/gas/testsuite/gas/aarch64/sysreg.s
-@@ -22,3 +22,7 @@
- 	mrs x0, id_isar3_el1
- 	mrs x0, id_isar4_el1
- 	mrs x0, id_isar5_el1
-+
-+	mrs x0, s3_0_c12_c12_0
-+	mrs x0, s3_0_c4_c6_0
-+	msr s3_0_c4_c6_0, x0
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-movi.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-movi.patch
deleted file mode 100644
index 314eef2..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-movi.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From: Yufeng Zhang <yufeng.zhang@arm.com>
-Date: Mon, 13 May 2013 23:09:51 +0000 (+0000)
-Subject: gas/testsuite/
-X-Git-Url: http://sourceware.org/git/?p=binutils.git;a=commitdiff_plain;h=f426901e1be0f58fe4e9386cada50ca57d0a4f36
-
-Upstream-Status: backport
-
-gas/testsuite/
-
-	Backport from mainline:
-
-	2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
-	* gas/aarch64/diagnostic.s: Update.
-	* gas/aarch64/diagnostic.l: Ditto.
-	* gas/aarch64/movi.s: Add new tests.
-	* gas/aarch64/movi.d: Update.
-
-opcodes/
-
-	Backport from mainline:
-
-	2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
-	* aarch64-asm.c (aarch64_ins_advsimd_imm_modified): Remove assertion.
-	* aarch64-opc.c (operand_general_constraint_met_p): Relax the range
-	check from [0, 255] to [-128, 255].
----
-
-diff --git a/gas/testsuite/ChangeLog b/gas/testsuite/ChangeLog
-index 8ee06c8..475c93a 100644
---- a/gas/testsuite/ChangeLog
-+++ b/gas/testsuite/ChangeLog
-@@ -1,3 +1,13 @@
-+2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
-+
-+	Backport from mainline:
-+
-+	2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
-+	* gas/aarch64/diagnostic.s: Update.
-+	* gas/aarch64/diagnostic.l: Ditto.
-+	* gas/aarch64/movi.s: Add new tests.
-+	* gas/aarch64/movi.d: Update.
-+
- 2013-05-13 Yufeng Zhang <yufeng.zhang@arm.com>
- 
- 	Backport from mainline:
-diff --git a/gas/testsuite/gas/aarch64/diagnostic.l b/gas/testsuite/gas/aarch64/diagnostic.l
-index f37f11c..d7a1347 100644
---- a/gas/testsuite/gas/aarch64/diagnostic.l
-+++ b/gas/testsuite/gas/aarch64/diagnostic.l
-@@ -38,8 +38,8 @@
- [^:]*:40: Error: invalid shift amount at operand 3 -- `shll v1.4s,v2.4h,#32'
- [^:]*:41: Error: immediate value out of range 0 to 31 at operand 3 -- `shl v1.2s,v2.2s,32'
- [^:]*:42: Error: immediate value out of range 1 to 8 at operand 3 -- `sqshrn2 v2.16b,v3.8h,#17'
--[^:]*:43: Error: immediate value out of range 0 to 255 at operand 2 -- `movi v1.4h,256'
--[^:]*:44: Error: immediate value out of range 0 to 255 at operand 2 -- `movi v1.4h,-1'
-+[^:]*:43: Error: immediate value out of range -128 to 255 at operand 2 -- `movi v1.4h,256'
-+[^:]*:44: Error: immediate value out of range -128 to 255 at operand 2 -- `movi v1.4h,-129'
- [^:]*:45: Error: invalid shift operator at operand 2 -- `movi v1.4h,255,msl#8'
- [^:]*:46: Error: invalid value for immediate at operand 2 -- `movi d0,256'
- [^:]*:47: Error: immediate value should be a multiple of 8 at operand 2 -- `movi v1.4h,255,lsl#7'
-diff --git a/gas/testsuite/gas/aarch64/diagnostic.s b/gas/testsuite/gas/aarch64/diagnostic.s
-index 99ebf8f..e5443ab 100644
---- a/gas/testsuite/gas/aarch64/diagnostic.s
-+++ b/gas/testsuite/gas/aarch64/diagnostic.s
-@@ -41,7 +41,7 @@
- 	shl	v1.2s, v2.2s, 32
- 	sqshrn2	v2.16b, v3.8h, #17
- 	movi	v1.4h, 256
--	movi	v1.4h, -1
-+	movi	v1.4h, -129
- 	movi	v1.4h, 255, msl #8
- 	movi	d0, 256
- 	movi	v1.4h, 255, lsl #7
-diff --git a/gas/testsuite/gas/aarch64/movi.d b/gas/testsuite/gas/aarch64/movi.d
-index 2c73cc4..c225b21 100644
---- a/gas/testsuite/gas/aarch64/movi.d
-+++ b/gas/testsuite/gas/aarch64/movi.d
-@@ -8201,3 +8201,6 @@ Disassembly of section \.text:
-     8004:	6f07e7e0 	movi	v0.2d, #0xffffffffffffffff
-     8008:	6f07e7e0 	movi	v0.2d, #0xffffffffffffffff
-     800c:	2f07e7ff 	movi	d31, #0xffffffffffffffff
-+    8010:	0f04e403 	movi	v3.8b, #0x80
-+    8014:	0f04e423 	movi	v3.8b, #0x81
-+    8018:	0f07e7e3 	movi	v3.8b, #0xff
-diff --git a/gas/testsuite/gas/aarch64/movi.s b/gas/testsuite/gas/aarch64/movi.s
-index 99ca34a..76f2d47 100644
---- a/gas/testsuite/gas/aarch64/movi.s
-+++ b/gas/testsuite/gas/aarch64/movi.s
-@@ -102,3 +102,8 @@
- 	movi	v0.2d, bignum
- 	movi	d31, 18446744073709551615
- .set    bignum, 0xffffffffffffffff
-+
-+	// Allow -128 to 255 in #<imm8>
-+	movi	v3.8b, -128
-+	movi	v3.8b, -127
-+	movi	v3.8b, -1
-diff --git a/opcodes/ChangeLog b/opcodes/ChangeLog
-index 96dfaeb..4adbc86 100644
---- a/opcodes/ChangeLog
-+++ b/opcodes/ChangeLog
-@@ -1,3 +1,12 @@
-+2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
-+
-+	Backport from mainline:
-+
-+	2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
-+	* aarch64-asm.c (aarch64_ins_advsimd_imm_modified): Remove assertion.
-+	* aarch64-opc.c (operand_general_constraint_met_p): Relax the range
-+	check from [0, 255] to [-128, 255].
-+
- 2013-03-25  Tristan Gingold  <gingold@adacore.com>
- 	Backport of: 2013-03-08  Yann Sionneau  <yann.sionneau@gmail.com>
- 
-diff --git a/opcodes/aarch64-asm.c b/opcodes/aarch64-asm.c
-index 16cdaa9..ba463d9 100644
---- a/opcodes/aarch64-asm.c
-+++ b/opcodes/aarch64-asm.c
-@@ -369,7 +369,6 @@ aarch64_ins_advsimd_imm_modified (const aarch64_operand *self ATTRIBUTE_UNUSED,
-       imm = aarch64_shrink_expanded_imm8 (imm);
-       assert ((int)imm >= 0);
-     }
--  assert (imm <= 255);
-   insert_fields (code, imm, 0, 2, FLD_defgh, FLD_abc);
- 
-   if (kind == AARCH64_MOD_NONE)
-diff --git a/opcodes/aarch64-opc.c b/opcodes/aarch64-opc.c
-index 73a760a..32f34c6 100644
---- a/opcodes/aarch64-opc.c
-+++ b/opcodes/aarch64-opc.c
-@@ -1724,10 +1724,10 @@ operand_general_constraint_met_p (const aarch64_opnd_info *opnds, int idx,
- 	  assert (idx == 1);
- 	  if (aarch64_get_qualifier_esize (opnds[0].qualifier) != 8)
- 	    {
--	      /* uimm8 */
--	      if (!value_in_range_p (opnd->imm.value, 0, 255))
-+	      /* uimm8 or simm8 */
-+	      if (!value_in_range_p (opnd->imm.value, -128, 255))
- 		{
--		  set_imm_out_of_range_error (mismatch_detail, idx, 0, 255);
-+		  set_imm_out_of_range_error (mismatch_detail, idx, -128, 255);
- 		  return 0;
- 		}
- 	    }
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-ineffectual-zero-of-cache.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-ineffectual-zero-of-cache.patch
deleted file mode 100644
index a4aebf3..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-ineffectual-zero-of-cache.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status: Backport
-
-* elf32-xtensa.c 
-  * (free_section_cache): Renamed from clear_section_cache.
-  * (section_cache_section): Remove ineffectual zero of cache.
-   Call init_section_cache instead.
-
-binutils build might fail on recent Linux distros:
-binutils-2.23.1/bfd/elf32-xtensa.c:6078:36: error: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Werror=sizeof-pointer-memaccess]
-       memset (sec_cache, 0, sizeof (sec_cache));
-                                    ^
-binutils-2.23.1/bfd/elf32-xtensa.c:6120:32: error: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Werror=sizeof-pointer-memaccess]
-   memset (sec_cache, 0, sizeof (sec_cache));
-
-The original commit is http://sourceware.org/cgi-bin/cvsweb.cgi/src/bfd/elf32-xtensa.c.diff?r1=1.135&r2=1.136&cvsroot=src
-
-Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
-
---- binutils-2.23.1/bfd/elf32-xtensa.c.org	2013-03-12 03:04:29.000000000 -0500
-+++ binutils-2.23.1/bfd/elf32-xtensa.c	2013-03-12 03:06:37.000000000 -0500
-@@ -6067,7 +6067,7 @@
- 
- 
- static void
--clear_section_cache (section_cache_t *sec_cache)
-+free_section_cache (section_cache_t *sec_cache)
- {
-   if (sec_cache->sec)
-     {
-@@ -6075,7 +6075,6 @@
-       release_internal_relocs (sec_cache->sec, sec_cache->relocs);
-       if (sec_cache->ptbl)
- 	free (sec_cache->ptbl);
--      memset (sec_cache, 0, sizeof (sec_cache));
-     }
- }
- 
-@@ -6116,8 +6115,8 @@
-     goto err;
- 
-   /* Fill in the new section cache.  */
--  clear_section_cache (sec_cache);
--  memset (sec_cache, 0, sizeof (sec_cache));
-+  free_section_cache (sec_cache);
-+  init_section_cache (sec_cache);
- 
-   sec_cache->sec = sec;
-   sec_cache->contents = contents;
-@@ -8272,8 +8271,9 @@
- #endif /* DEBUG */
- 
- error_return:
--  if (prop_table) free (prop_table);
--  clear_section_cache (&target_sec_cache);
-+  if (prop_table)
-+    free (prop_table);
-+  free_section_cache (&target_sec_cache);
- 
-   release_contents (sec, contents);
-   release_internal_relocs (sec, internal_relocs);
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-whitespace-pr14887.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-whitespace-pr14887.patch
deleted file mode 100644
index e504b3b..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-whitespace-pr14887.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-
-
-PR gas/14887
- * config/tc-arm.c (skip_past_char): Skip whitespace before the anticipated character.
- * config/tc-arm.c (parse_address_main): Delete skip of whitespace here as it is no longer needed.
-
-Upstream-Status: Backport [PR14887]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-===================================================================
-RCS file: /cvs/src/src/gas/ChangeLog,v
-retrieving revision 1.4898
-retrieving revision 1.4899
-Index: binutils-2.23.2/gas/config/tc-arm.c
-===================================================================
---- binutils-2.23.2.orig/gas/config/tc-arm.c
-+++ binutils-2.23.2/gas/config/tc-arm.c
-@@ -885,6 +885,9 @@ const char FLT_CHARS[] = "rRsSfFdDxXeEpP
- static inline int
- skip_past_char (char ** str, char c)
- {
-+  /* PR gas/14987: Allow for whitespace before the expected character.  */
-+  skip_whitespace (*str);
-+
-   if (**str == c)
-     {
-       (*str)++;
-@@ -5168,6 +5171,9 @@ parse_address_main (char **str, int i, i
-       return PARSE_OPERAND_SUCCESS;
-     }
- 
-+  /* PR gas/14987: Allow for whitespace before the expected character.  */
-+  skip_whitespace (p);
-+
-   if ((reg = arm_reg_parse (&p, REG_TYPE_RN)) == FAIL)
-     {
-       inst.error = _(reg_expected_msgs[REG_TYPE_RN]);
-Index: binutils-2.23.2/gas/testsuite/gas/arm/neon-ldst-es.s
-===================================================================
---- binutils-2.23.2.orig/gas/testsuite/gas/arm/neon-ldst-es.s
-+++ binutils-2.23.2/gas/testsuite/gas/arm/neon-ldst-es.s
-@@ -57,3 +57,7 @@
- 	vld2.32 {q1},[r7]
- 	vld4.32 {q1-q2},[r7]
- 	vld4.32 {q14-q15},[r7]
-+
-+	@ PR 14987 and 14887: Allow for whitespace in the instruction.
-+	vld1.32 { d1 [ ] } , [ r2 ] , r3
-+
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-replace-strncat-with-strcat.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-replace-strncat-with-strcat.patch
deleted file mode 100644
index bc8f92b..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-replace-strncat-with-strcat.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Backport
-
-* arc-dis.c (write_comments_): Don't use strncat due to
-  the size of state->commentBuffer pointer isn't predictable.
-
-binutils build will fail on Fedora18+. 
-binutils-2.23.1/opcodes/arc-dis.c:430:13: error: argument to 'sizeof' in '__builtin_strncat' call is the same expression as the destination; did you mean to provide an explicit length? [-Werror=sizeof-pointer-memaccess]
-       sizeof (state->commentBuffer));
-              ^
-
-The original commit is http://sourceware.org/cgi-bin/cvsweb.cgi/src/opcodes/arc-dis.c.diff?r1=1.17&r2=1.18&cvsroot=src
-
-Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
-
---- binutils-2.23.1/opcodes/arc-dis.c.orig	2013-03-13 00:10:27.978498158 -0500
-+++ binutils-2.23.1/opcodes/arc-dis.c	2013-03-13 00:11:28.297499381 -0500
-@@ -426,8 +426,7 @@
- 	    strcpy (state->commentBuffer, comment_prefix);
- 	  else
- 	    strcat (state->commentBuffer, ", ");
--	  strncat (state->commentBuffer, state->comm[i],
--		   sizeof (state->commentBuffer));
-+	  strcat (state->commentBuffer, state->comm[i]);
- 	}
-     }
- }
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-fix-over-array-bounds-issue.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-fix-over-array-bounds-issue.patch
deleted file mode 100644
index aacbfef..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-fix-over-array-bounds-issue.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-binutils build fails on Fedora18+ due to over array bounds issue: 
-binutils-2.23.1/opcodes/rl78-dis.c:230:13: error: array subscript is above array bounds [-Werror=array-bounds]
-      if (oper->use_es && indirect_type (oper->type))
-              ^
-
-Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
-
---- binutils-2.23.1/opcodes/rl78-dis.c.orig	2013-03-12 22:17:47.664361066 -0500
-+++ binutils-2.23.1/opcodes/rl78-dis.c	2013-03-12 23:39:51.383460914 -0500
-@@ -221,7 +221,7 @@
- 
- 	    case '0':
- 	    case '1':
--	      oper = opcode.op + *s - '0';
-+	      oper = &opcode.op[*s - '0'];
- 	      if (do_bang)
- 		PC ('!');
- 
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-x86_64_i386_biarch.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-x86_64_i386_biarch.patch
deleted file mode 100644
index c09578a..0000000
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-x86_64_i386_biarch.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/bin/sh -e
-## 127_x86_64_i386_biarch.dpatch
-##
-## DP: Description: Add (/usr)/lib32 to the search paths on x86_64.
-## DP: Author: Aurelien Jarno <aurel32.debian.org>
-## DP: Upstream status: Debian specific
-#
-# Hacked to apply with quilt
-# Adapted to binutils 2.18.50.0.7
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: binutils-2.22/ld/emulparams/elf_i386.sh
-===================================================================
---- binutils-2.22.orig/ld/emulparams/elf_i386.sh
-+++ binutils-2.22/ld/emulparams/elf_i386.sh
-@@ -14,3 +14,13 @@ GENERATE_PIE_SCRIPT=yes
- NO_SMALL_DATA=yes
- SEPARATE_GOTPLT=12
- IREL_IN_PLT=
-+
-+# Linux modify the default library search path to first include
-+# a 32-bit specific directory.
-+case "$target" in
-+  x86_64*-linux* | i[3-7]86*-linux* | x86_64*-kfreebsd*-gnu | i[3-7]86*-kfreebsd*-gnu)
-+    case "$EMULATION_NAME" in
-+      *i386*) LIBPATH_SUFFIX=32 ;;
-+    esac
-+    ;;
-+esac
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2.inc b/meta/recipes-devtools/binutils/binutils-2.24.inc
similarity index 51%
rename from meta/recipes-devtools/binutils/binutils-2.23.2.inc
rename to meta/recipes-devtools/binutils/binutils-2.24.inc
index 99fe2e5..86ff999 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.2.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.24.inc
@@ -1,5 +1,3 @@
-PR = "r4"
-
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552\
@@ -20,33 +18,15 @@ SRC_URI = "\
      file://binutils-uclibc-300-006_better_file_error.patch \
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
      file://binutils-uclibc-gas-needs-libm.patch \
-     file://binutils-x86_64_i386_biarch.patch \
      file://libtool-2.4-update.patch \
      file://libiberty_path_fix.patch \
      file://binutils-poison.patch \
      file://libtool-rpath-fix.patch \
      file://binutils-armv5e.patch \
      file://mips64-default-ld-emulation.patch \
-     ${BACKPORT} \
-     file://binutils-fix-over-array-bounds-issue.patch \
      file://binutils-xlp-support.patch \
+     file://fix-pr15815.patch \
      "
 
-BACKPORT = "\
-     file://backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch \
-     file://backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch \
-     file://backport/binutils-fix-ineffectual-zero-of-cache.patch \
-     file://backport/binutils-replace-strncat-with-strcat.patch  \
-     file://backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch  \
-     file://backport/binutils-fix-skip-whitespace-pr14887.patch \
-     file://backport/aarch64-crn.patch \
-     file://backport/aarch64-movi.patch \
-     file://backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch \
-     file://backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch \
-     file://backport/0001-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch \
-     file://backport/0002-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch \
-     file://backport/0003-gold.patch \
-"
-SRC_URI[md5sum] = "4f8fa651e35ef262edc01d60fb45702e"
-SRC_URI[sha256sum] = "fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097"
-
+SRC_URI[md5sum] = "e0f71a7b2ddab0f8612336ac81d9636b"
+SRC_URI[sha256sum] = "e5e8c5be9664e7f7f96e0d09919110ab5ad597794f5b1809871177a0f0f14137"
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.23.2.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.24.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.23.2.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.24.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.23.2.bb b/meta/recipes-devtools/binutils/binutils-cross_2.24.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.23.2.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.24.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.23.2.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.24.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.23.2.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.24.bb
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-armv5e.patch b/meta/recipes-devtools/binutils/binutils/binutils-armv5e.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/binutils-armv5e.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-armv5e.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-poison.patch b/meta/recipes-devtools/binutils/binutils/binutils-poison.patch
similarity index 78%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/binutils-poison.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-poison.patch
index 39cae51..996c023 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-poison.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-poison.patch
@@ -52,10 +52,10 @@ Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-Index: binutils-2.22.90/ld/config.in
+Index: binutils-2.24/ld/config.in
 ===================================================================
---- binutils-2.22.90.orig/ld/config.in	2012-05-17 08:13:21.000000000 -0700
-+++ binutils-2.22.90/ld/config.in	2012-08-07 23:09:34.834490113 -0700
+--- binutils-2.24.orig/ld/config.in	2013-12-15 11:46:17.000000000 -0800
++++ binutils-2.24/ld/config.in	2013-12-15 11:46:59.810435651 -0800
 @@ -11,6 +11,9 @@
     language is requested. */
  #undef ENABLE_NLS
@@ -66,11 +66,11 @@ Index: binutils-2.22.90/ld/config.in
  /* Additional extension a shared object might have. */
  #undef EXTRA_SHLIB_EXTENSION
  
-Index: binutils-2.22.90/ld/configure
+Index: binutils-2.24/ld/configure
 ===================================================================
---- binutils-2.22.90.orig/ld/configure	2012-08-07 23:08:50.000000000 -0700
-+++ binutils-2.22.90/ld/configure	2012-08-07 23:09:34.838490177 -0700
-@@ -776,6 +776,7 @@
+--- binutils-2.24.orig/ld/configure	2013-12-15 11:46:17.000000000 -0800
++++ binutils-2.24/ld/configure	2013-12-15 11:46:59.810435651 -0800
+@@ -777,6 +777,7 @@
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -78,7 +78,7 @@ Index: binutils-2.22.90/ld/configure
  enable_gold
  enable_got
  enable_werror
-@@ -1432,6 +1433,8 @@
+@@ -1433,6 +1434,8 @@
  			  (and sometimes confusing) to the casual installer
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -87,7 +87,7 @@ Index: binutils-2.22.90/ld/configure
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -4344,7 +4347,18 @@
+@@ -4345,7 +4348,18 @@
  fi
  
  
@@ -106,11 +106,11 @@ Index: binutils-2.22.90/ld/configure
  
  # Check whether --enable-got was given.
  if test "${enable_got+set}" = set; then :
-Index: binutils-2.22.90/ld/configure.in
+Index: binutils-2.24/ld/configure.in
 ===================================================================
---- binutils-2.22.90.orig/ld/configure.in	2012-05-17 08:13:23.000000000 -0700
-+++ binutils-2.22.90/ld/configure.in	2012-08-07 23:09:34.838490177 -0700
-@@ -70,6 +70,16 @@
+--- binutils-2.24.orig/ld/configure.in	2013-12-15 11:46:17.000000000 -0800
++++ binutils-2.24/ld/configure.in	2013-12-15 11:46:59.810435651 -0800
+@@ -87,6 +87,16 @@
  AC_SUBST(TARGET_SYSTEM_ROOT)
  AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
  
@@ -127,10 +127,10 @@ Index: binutils-2.22.90/ld/configure.in
  dnl Use --enable-gold to decide if this linker should be the default.
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
-Index: binutils-2.22.90/ld/ldfile.c
+Index: binutils-2.24/ld/ldfile.c
 ===================================================================
---- binutils-2.22.90.orig/ld/ldfile.c	2012-07-13 06:20:26.000000000 -0700
-+++ binutils-2.22.90/ld/ldfile.c	2012-08-07 23:30:35.166538044 -0700
+--- binutils-2.24.orig/ld/ldfile.c	2013-12-15 11:46:17.000000000 -0800
++++ binutils-2.24/ld/ldfile.c	2013-12-15 11:46:59.813768989 -0800
 @@ -116,6 +116,23 @@
      new_dirs->name = concat (ld_sysroot, name + 1, (const char *) NULL);
    else
@@ -155,11 +155,11 @@ Index: binutils-2.22.90/ld/ldfile.c
  }
  
  /* Try to open a BFD for a lang_input_statement.  */
-Index: binutils-2.22.90/ld/ld.h
+Index: binutils-2.24/ld/ld.h
 ===================================================================
---- binutils-2.22.90.orig/ld/ld.h	2012-07-09 23:50:55.000000000 -0700
-+++ binutils-2.22.90/ld/ld.h	2012-08-07 23:09:34.838490177 -0700
-@@ -203,6 +203,14 @@
+--- binutils-2.24.orig/ld/ld.h	2013-12-15 11:46:17.000000000 -0800
++++ binutils-2.24/ld/ld.h	2013-12-15 11:46:59.813768989 -0800
+@@ -180,6 +180,14 @@
    /* If TRUE we'll just print the default output on stdout.  */
    bfd_boolean print_output_format;
  
@@ -174,24 +174,24 @@ Index: binutils-2.22.90/ld/ld.h
    /* Big or little endian as set on command line.  */
    enum endian_enum endian;
  
-Index: binutils-2.22.90/ld/ldmain.c
+Index: binutils-2.24/ld/ldmain.c
 ===================================================================
---- binutils-2.22.90.orig/ld/ldmain.c	2012-07-13 06:20:26.000000000 -0700
-+++ binutils-2.22.90/ld/ldmain.c	2012-08-07 23:09:34.846490172 -0700
-@@ -265,6 +265,8 @@
+--- binutils-2.24.orig/ld/ldmain.c	2013-12-15 11:46:17.000000000 -0800
++++ binutils-2.24/ld/ldmain.c	2013-12-15 11:48:12.087101740 -0800
+@@ -266,6 +266,8 @@
+   command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
-   command_line.disable_target_specific_optimizations = -1;
 +  command_line.poison_system_directories = TRUE;
 +  command_line.error_poison_system_directories = FALSE;
  
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-Index: binutils-2.22.90/ld/ld.texinfo
+Index: binutils-2.24/ld/ld.texinfo
 ===================================================================
---- binutils-2.22.90.orig/ld/ld.texinfo	2012-07-09 23:50:55.000000000 -0700
-+++ binutils-2.22.90/ld/ld.texinfo	2012-08-07 23:09:34.850490143 -0700
-@@ -2147,6 +2147,18 @@
+--- binutils-2.24.orig/ld/ld.texinfo	2013-12-15 11:46:17.000000000 -0800
++++ binutils-2.24/ld/ld.texinfo	2013-12-15 11:46:59.813768989 -0800
+@@ -2175,6 +2175,18 @@
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -210,26 +210,26 @@ Index: binutils-2.22.90/ld/ld.texinfo
  @end table
  
  @c man end
-Index: binutils-2.22.90/ld/lexsup.c
+Index: binutils-2.24/ld/lexsup.c
 ===================================================================
---- binutils-2.22.90.orig/ld/lexsup.c	2012-07-13 06:20:26.000000000 -0700
-+++ binutils-2.22.90/ld/lexsup.c	2012-08-07 23:09:34.850490143 -0700
-@@ -496,6 +496,14 @@
-     TWO_DASHES },
-   { {"wrap", required_argument, NULL, OPTION_WRAP},
-     '\0', N_("SYMBOL"), N_("Use wrapper functions for SYMBOL"), TWO_DASHES },
+--- binutils-2.24.orig/ld/lexsup.c	2013-12-15 11:46:17.000000000 -0800
++++ binutils-2.24/ld/lexsup.c	2013-12-15 11:49:28.950434490 -0800
+@@ -507,6 +507,14 @@
+     OPTION_IGNORE_UNRESOLVED_SYMBOL},
+     '\0', N_("SYMBOL"),
+     N_("Unresolved SYMBOL will not cause an error or warning"), TWO_DASHES },
 +  { {"no-poison-system-directories", no_argument, NULL,
 +     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
 +    '\0', NULL, N_("Do not warn for -L options using system directories"),
 +    TWO_DASHES },
 +  { {"error-poison-system-directories", no_argument, NULL,
-+     OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
++    +     OPTION_ERROR_POISON_SYSTEM_DIRECTORIES},
 +    '\0', NULL, N_("Give an error for -L options using system directories"),
 +    TWO_DASHES },
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1424,6 +1432,14 @@
+@@ -1442,6 +1450,14 @@
                einfo (_("%P%X: --hash-size needs a numeric argument\n"));
            }
            break;
@@ -244,16 +244,16 @@ Index: binutils-2.22.90/ld/lexsup.c
  	}
      }
  
-Index: binutils-2.22.90/ld/ldlex.h
+Index: binutils-2.24/ld/ldlex.h
 ===================================================================
---- binutils-2.22.90.orig/ld/ldlex.h	2012-05-26 04:13:19.000000000 -0700
-+++ binutils-2.22.90/ld/ldlex.h	2012-08-07 23:34:17.122546581 -0700
-@@ -135,6 +135,8 @@
- #endif /* ENABLE_PLUGINS */
+--- binutils-2.24.orig/ld/ldlex.h	2013-12-15 11:46:17.000000000 -0800
++++ binutils-2.24/ld/ldlex.h	2013-12-15 11:47:43.230435299 -0800
+@@ -138,6 +138,8 @@
    OPTION_DEFAULT_SCRIPT,
    OPTION_PRINT_OUTPUT_FORMAT,
+   OPTION_IGNORE_UNRESOLVED_SYMBOL,
 +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
-+  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES
++  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
  };
  
  /* The initial parser states.  */
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-uclibc-100-uclibc-conf.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-100-uclibc-conf.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/binutils-uclibc-100-uclibc-conf.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-uclibc-100-uclibc-conf.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-uclibc-300-001_ld_makefile_patch.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-001_ld_makefile_patch.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/binutils-uclibc-300-001_ld_makefile_patch.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-001_ld_makefile_patch.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-uclibc-300-006_better_file_error.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-006_better_file_error.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/binutils-uclibc-300-006_better_file_error.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-006_better_file_error.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-uclibc-300-012_check_ldrunpath_length.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-012_check_ldrunpath_length.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/binutils-uclibc-300-012_check_ldrunpath_length.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-012_check_ldrunpath_length.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-uclibc-gas-needs-libm.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-gas-needs-libm.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/binutils-uclibc-gas-needs-libm.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-uclibc-gas-needs-libm.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-xlp-support.patch b/meta/recipes-devtools/binutils/binutils/binutils-xlp-support.patch
similarity index 41%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/binutils-xlp-support.patch
rename to meta/recipes-devtools/binutils/binutils/binutils-xlp-support.patch
index b0f727a..a199918 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/binutils-xlp-support.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-xlp-support.patch
@@ -28,10 +28,10 @@ Netlogic. Also, update vendor name to NLM wherever applicable.
  opcodes/mips-opc.c    |   31 ++++++++++++++++++++-----------
  17 files changed, 73 insertions(+), 17 deletions(-)
 
-Index: binutils-2.23.2/bfd/aoutx.h
+Index: binutils-2.24/bfd/aoutx.h
 ===================================================================
---- binutils-2.23.2.orig/bfd/aoutx.h	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/bfd/aoutx.h	2013-04-16 04:19:52.741282087 -0700
+--- binutils-2.24.orig/bfd/aoutx.h	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/bfd/aoutx.h	2013-12-15 13:08:03.397065919 -0800
 @@ -798,6 +798,7 @@
  	case bfd_mach_mipsisa64r2:
  	case bfd_mach_mips_sb1:
@@ -40,11 +40,11 @@ Index: binutils-2.23.2/bfd/aoutx.h
  	  /* FIXME: These should be MIPS3, MIPS4, MIPS16, MIPS32, etc.  */
  	  arch_flags = M_MIPS2;
  	  break;
-Index: binutils-2.23.2/bfd/archures.c
+Index: binutils-2.24/bfd/archures.c
 ===================================================================
---- binutils-2.23.2.orig/bfd/archures.c	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/bfd/archures.c	2013-04-16 04:19:52.741282087 -0700
-@@ -179,6 +179,7 @@
+--- binutils-2.24.orig/bfd/archures.c	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/bfd/archures.c	2013-12-15 13:08:03.397065919 -0800
+@@ -178,6 +178,7 @@
  .#define bfd_mach_mips_octeonp		6601
  .#define bfd_mach_mips_octeon2		6502
  .#define bfd_mach_mips_xlr              887682   {* decimal 'XLR'  *}
@@ -52,11 +52,11 @@ Index: binutils-2.23.2/bfd/archures.c
  .#define bfd_mach_mipsisa32             32
  .#define bfd_mach_mipsisa32r2           33
  .#define bfd_mach_mipsisa64             64
-Index: binutils-2.23.2/bfd/bfd-in2.h
+Index: binutils-2.24/bfd/bfd-in2.h
 ===================================================================
---- binutils-2.23.2.orig/bfd/bfd-in2.h	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/bfd/bfd-in2.h	2013-04-16 04:19:52.745282088 -0700
-@@ -1908,6 +1908,7 @@
+--- binutils-2.24.orig/bfd/bfd-in2.h	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/bfd/bfd-in2.h	2013-12-15 13:08:03.400399254 -0800
+@@ -1933,6 +1933,7 @@
  #define bfd_mach_mips_octeonp          6601
  #define bfd_mach_mips_octeon2          6502
  #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'  */
@@ -64,11 +64,11 @@ Index: binutils-2.23.2/bfd/bfd-in2.h
  #define bfd_mach_mipsisa32             32
  #define bfd_mach_mipsisa32r2           33
  #define bfd_mach_mipsisa64             64
-Index: binutils-2.23.2/bfd/config.bfd
+Index: binutils-2.24/bfd/config.bfd
 ===================================================================
---- binutils-2.23.2.orig/bfd/config.bfd	2013-04-16 04:19:50.897282052 -0700
-+++ binutils-2.23.2/bfd/config.bfd	2013-04-16 04:19:52.745282088 -0700
-@@ -992,6 +992,11 @@
+--- binutils-2.24.orig/bfd/config.bfd	2013-12-15 13:08:03.047065922 -0800
++++ binutils-2.24/bfd/config.bfd	2013-12-15 13:08:03.400399254 -0800
+@@ -1032,6 +1032,11 @@
      targ_defvec=bfd_elf32_littlemips_vec
      targ_selvecs="bfd_elf32_bigmips_vec bfd_elf64_bigmips_vec bfd_elf64_littlemips_vec"
      ;;
@@ -80,11 +80,11 @@ Index: binutils-2.23.2/bfd/config.bfd
    mips*-*-elf* | mips*-*-rtems* | mips*-*-vxworks | mips*-*-windiss)
      targ_defvec=bfd_elf32_bigmips_vec
      targ_selvecs="bfd_elf32_littlemips_vec bfd_elf64_bigmips_vec bfd_elf64_littlemips_vec"
-Index: binutils-2.23.2/bfd/cpu-mips.c
+Index: binutils-2.24/bfd/cpu-mips.c
 ===================================================================
---- binutils-2.23.2.orig/bfd/cpu-mips.c	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/bfd/cpu-mips.c	2013-04-16 04:27:21.097290918 -0700
-@@ -97,7 +97,8 @@
+--- binutils-2.24.orig/bfd/cpu-mips.c	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/bfd/cpu-mips.c	2013-12-15 13:08:03.400399254 -0800
+@@ -99,7 +99,8 @@
    I_mipsocteonp,
    I_mipsocteon2,
    I_xlr,
@@ -94,7 +94,7 @@ Index: binutils-2.23.2/bfd/cpu-mips.c
  };
  
  #define NN(index) (&arch_info_struct[(index) + 1])
-@@ -140,7 +141,8 @@
+@@ -143,7 +144,8 @@
    N (64, 64, bfd_mach_mips_octeonp,"mips:octeon+",  FALSE, NN(I_mipsocteonp)),
    N (64, 64, bfd_mach_mips_octeon2,"mips:octeon2",  FALSE, NN(I_mipsocteon2)),
    N (64, 64, bfd_mach_mips_xlr, "mips:xlr",       FALSE, NN(I_xlr)),
@@ -104,11 +104,11 @@ Index: binutils-2.23.2/bfd/cpu-mips.c
  };
  
  /* The default architecture is mips:3000, but with a machine number of
-Index: binutils-2.23.2/bfd/elfxx-mips.c
+Index: binutils-2.24/bfd/elfxx-mips.c
 ===================================================================
---- binutils-2.23.2.orig/bfd/elfxx-mips.c	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/bfd/elfxx-mips.c	2013-04-16 04:19:52.749282089 -0700
-@@ -6293,6 +6293,9 @@
+--- binutils-2.24.orig/bfd/elfxx-mips.c	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/bfd/elfxx-mips.c	2013-12-15 13:08:03.400399254 -0800
+@@ -6404,6 +6404,9 @@
      case E_MIPS_MACH_XLR:
        return bfd_mach_mips_xlr;
  
@@ -118,7 +118,7 @@ Index: binutils-2.23.2/bfd/elfxx-mips.c
      default:
        switch (flags & EF_MIPS_ARCH)
  	{
-@@ -11048,6 +11051,10 @@
+@@ -11622,6 +11625,10 @@
        val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
        break;
  
@@ -129,7 +129,7 @@ Index: binutils-2.23.2/bfd/elfxx-mips.c
      case bfd_mach_mipsisa32:
        val = E_MIPS_ARCH_32;
        break;
-@@ -13639,6 +13646,7 @@
+@@ -14202,6 +14209,7 @@
    { bfd_mach_mips_octeon2, bfd_mach_mips_octeonp },
    { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
    { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
@@ -137,11 +137,11 @@ Index: binutils-2.23.2/bfd/elfxx-mips.c
  
    /* MIPS64 extensions.  */
    { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
-Index: binutils-2.23.2/binutils/readelf.c
+Index: binutils-2.24/binutils/readelf.c
 ===================================================================
---- binutils-2.23.2.orig/binutils/readelf.c	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/binutils/readelf.c	2013-04-16 04:19:52.753282089 -0700
-@@ -2435,6 +2435,7 @@
+--- binutils-2.24.orig/binutils/readelf.c	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/binutils/readelf.c	2013-12-15 13:08:03.403732587 -0800
+@@ -2602,6 +2602,7 @@
  	    case E_MIPS_MACH_OCTEON: strcat (buf, ", octeon"); break;
  	    case E_MIPS_MACH_OCTEON2: strcat (buf, ", octeon2"); break;
  	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
@@ -149,11 +149,11 @@ Index: binutils-2.23.2/binutils/readelf.c
  	    case 0:
  	    /* We simply ignore the field in this case to avoid confusion:
  	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
-Index: binutils-2.23.2/gas/config/tc-mips.c
+Index: binutils-2.24/gas/config/tc-mips.c
 ===================================================================
---- binutils-2.23.2.orig/gas/config/tc-mips.c	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/gas/config/tc-mips.c	2013-04-16 04:19:52.761282087 -0700
-@@ -530,6 +530,7 @@
+--- binutils-2.24.orig/gas/config/tc-mips.c	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/gas/config/tc-mips.c	2013-12-15 13:17:19.943728439 -0800
+@@ -486,6 +486,7 @@
     || mips_opts.arch == CPU_RM7000                    \
     || mips_opts.arch == CPU_VR5500                    \
     || mips_opts.micromips                             \
@@ -161,7 +161,7 @@ Index: binutils-2.23.2/gas/config/tc-mips.c
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -558,6 +559,7 @@
+@@ -515,6 +516,7 @@
      && mips_opts.isa != ISA_MIPS3)                    \
     || mips_opts.arch == CPU_R4300                     \
     || mips_opts.micromips                             \
@@ -169,25 +169,20 @@ Index: binutils-2.23.2/gas/config/tc-mips.c
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -19176,9 +19178,12 @@
-   { "octeon+",	      0,      ISA_MIPS64R2,   CPU_OCTEONP },
-   { "octeon2",	      0,      ISA_MIPS64R2,   CPU_OCTEON2 },
- 
--  /* RMI Xlr */
-+  /* Netlogic Xlr */
-   { "xlr",	      0,      ISA_MIPS64,     CPU_XLR },
- 
-+  /* Netlogic Xlp */
-+  { "xlp",	      0,      ISA_MIPS64R2,   CPU_XLP },
-+
+@@ -17794,7 +17796,7 @@
    /* Broadcom XLP.
       XLP is mostly like XLR, with the prominent exception that it is
       MIPS64R2 rather than MIPS64.  */
-Index: binutils-2.23.2/gas/configure
+-  { "xlp",	      0, 0,			ISA_MIPS64R2, CPU_XLR },
++  { "xlp",	      0, 0,			ISA_MIPS64R2, CPU_XLP },
+ 
+   /* End marker */
+   { NULL, 0, 0, 0, 0 }
+Index: binutils-2.24/gas/configure
 ===================================================================
---- binutils-2.23.2.orig/gas/configure	2013-04-16 04:19:50.353282044 -0700
-+++ binutils-2.23.2/gas/configure	2013-04-16 04:19:52.765282087 -0700
-@@ -12695,6 +12695,9 @@
+--- binutils-2.24.orig/gas/configure	2013-12-15 13:08:01.127065936 -0800
++++ binutils-2.24/gas/configure	2013-12-15 13:08:03.407065920 -0800
+@@ -12697,6 +12697,9 @@
  	  mipsisa64r2 | mipsisa64r2el)
  	    mips_cpu=mips64r2
  	    ;;
@@ -197,48 +192,49 @@ Index: binutils-2.23.2/gas/configure
  	  mipstx39 | mipstx39el)
  	    mips_cpu=r3900
  	    ;;
-Index: binutils-2.23.2/gas/configure.tgt
+Index: binutils-2.24/gas/configure.tgt
 ===================================================================
---- binutils-2.23.2.orig/gas/configure.tgt	2013-04-16 04:19:50.097282037 -0700
-+++ binutils-2.23.2/gas/configure.tgt	2013-04-16 04:19:52.765282087 -0700
-@@ -310,7 +310,7 @@
+--- binutils-2.24.orig/gas/configure.tgt	2013-12-15 13:08:00.783732605 -0800
++++ binutils-2.24/gas/configure.tgt	2013-12-15 13:08:03.407065920 -0800
+@@ -325,7 +325,7 @@
+ 					fmt=elf em=freebsd ;;
    mips-*-sysv4*MP* | mips-*-gnu*)	fmt=elf em=tmips ;;
-   mips*-sde-elf*)			fmt=elf em=tmips ;;
-   mips-*-sysv*)				fmt=ecoff ;;
+   mips*-sde-elf* | mips*-mti-elf*)	fmt=elf em=tmips ;;
 -  mips-*-elf* | mips-*-rtems*)		fmt=elf ;;
 +  mips-*-elf* | mips-*-rtems*)		fmt=elf em=tmips ;;
    mips-*-netbsd*)			fmt=elf em=tmips ;;
    mips-*-openbsd*)			fmt=elf em=tmips ;;
  
-Index: binutils-2.23.2/include/elf/mips.h
+Index: binutils-2.24/include/elf/mips.h
 ===================================================================
---- binutils-2.23.2.orig/include/elf/mips.h	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/include/elf/mips.h	2013-04-16 04:19:52.765282087 -0700
-@@ -268,6 +268,7 @@
+--- binutils-2.24.orig/include/elf/mips.h	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/include/elf/mips.h	2013-12-15 13:08:03.407065920 -0800
+@@ -274,6 +274,7 @@
  #define E_MIPS_MACH_SB1         0x008a0000
  #define E_MIPS_MACH_OCTEON	0x008b0000
  #define E_MIPS_MACH_XLR     	0x008c0000
 +#define E_MIPS_MACH_XLP         0x008e0000
  #define E_MIPS_MACH_OCTEON2	0x008d0000
  #define E_MIPS_MACH_5400	0x00910000
- #define E_MIPS_MACH_5500	0x00980000
-Index: binutils-2.23.2/include/opcode/mips.h
+ #define E_MIPS_MACH_5900	0x00920000
+Index: binutils-2.24/include/opcode/mips.h
 ===================================================================
---- binutils-2.23.2.orig/include/opcode/mips.h	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/include/opcode/mips.h	2013-04-16 04:19:52.769282089 -0700
-@@ -772,8 +772,10 @@
+--- binutils-2.24.orig/include/opcode/mips.h	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/include/opcode/mips.h	2013-12-15 13:40:11.130384844 -0800
+@@ -1092,8 +1092,10 @@
  #define INSN_LOONGSON_2F          0x80000000
  /* Loongson 3A.  */
  #define INSN_LOONGSON_3A          0x00000400
 -/* RMI Xlr instruction */
+-#define INSN_XLR                 0x00000020
 +/* Netlogic Xlr instruction */
- #define INSN_XLR              	  0x00000020
-+/* Netlogic Xlp instruction */
-+#define INSN_XLP                  0x00000040
++#define INSN_XLR		0x00000020
++/* Netlogic XlP instruction */
++#define INSN_XLP		0x00000040
  
- /* MCU (MicroController) ASE */
- #define INSN_MCU		  0x00000010
-@@ -833,6 +835,7 @@
+ /* DSP ASE */
+ #define ASE_DSP			0x00000001
+@@ -1172,6 +1174,7 @@
  #define CPU_OCTEONP	6601
  #define CPU_OCTEON2	6502
  #define CPU_XLR     	887682   	/* decimal 'XLR'   */
@@ -246,7 +242,7 @@ Index: binutils-2.23.2/include/opcode/mips.h
  
  /* Return true if the given CPU is included in INSN_* mask MASK.  */
  
-@@ -897,6 +900,9 @@
+@@ -1239,6 +1242,9 @@
      case CPU_XLR:
        return (mask & INSN_XLR) != 0;
  
@@ -256,143 +252,151 @@ Index: binutils-2.23.2/include/opcode/mips.h
      default:
        return FALSE;
      }
-Index: binutils-2.23.2/ld/configure.tgt
+Index: binutils-2.24/ld/configure.tgt
 ===================================================================
---- binutils-2.23.2.orig/ld/configure.tgt	2013-04-16 04:19:50.897282052 -0700
-+++ binutils-2.23.2/ld/configure.tgt	2013-04-16 04:19:52.769282089 -0700
-@@ -426,6 +426,8 @@
- 			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip" ;;
- mips*-sde-elf*)		targ_emul=elf32btsmip
+--- binutils-2.24.orig/ld/configure.tgt	2013-12-15 13:08:03.047065922 -0800
++++ binutils-2.24/ld/configure.tgt	2013-12-15 13:08:03.407065920 -0800
+@@ -457,6 +457,8 @@
+ mips*-sde-elf* | mips*-mti-elf*)
+ 			targ_emul=elf32btsmip
  			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
-+mipsisa64*-*-elf*)     targ_emul=elf32btsmip
++mipsisa64*-*-elf*)	targ_emul=elf32btsmip
 +			targ_extra_emuls="elf32ltsmip elf64btsmip elf64ltsmip" ;;
- mips*el-*-elf*)		targ_emul=elf32elmip ;;
- mips*-*-elf*)		targ_emul=elf32ebmip ;;
- mips*-*-rtems*)		targ_emul=elf32ebmip ;;
-Index: binutils-2.23.2/opcodes/mips-dis.c
+ mips64*el-ps2-elf*)	targ_emul=elf32lr5900n32
+ 			targ_extra_emuls="elf32lr5900"
+ 			targ_extra_libpath=$targ_extra_emuls ;;
+Index: binutils-2.24/opcodes/mips-dis.c
 ===================================================================
---- binutils-2.23.2.orig/opcodes/mips-dis.c	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/opcodes/mips-dis.c	2013-04-16 04:19:52.769282089 -0700
-@@ -627,6 +627,12 @@
+--- binutils-2.24.orig/opcodes/mips-dis.c	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/opcodes/mips-dis.c	2013-12-15 13:39:50.243718329 -0800
+@@ -554,13 +554,11 @@
      mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
      mips_hwr_names_numeric },
  
+-  /* XLP is mostly like XLR, with the prominent exception it is being
+-     MIPS64R2.  */
+-  { "xlp", 1, bfd_mach_mips_xlr, CPU_XLR,
+-    ISA_MIPS64R2 | INSN_XLR, 0,
+-    mips_cp0_names_xlr,
+-    mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
+-    mips_hwr_names_numeric },
 +  { "xlp", 1, bfd_mach_mips_xlp, CPU_XLP,
-+	(ISA_MIPS64R2 | INSN_XLP),
-+	mips_cp0_names_mips3264r2,
-+	mips_cp0sel_names_mips3264r2, ARRAY_SIZE (mips_cp0sel_names_mips3264r2),
-+	mips_hwr_names_mips3264r2 },
-+
++    ISA_MIPS64R2 | INSN_XLP, 0,
++    mips_cp0_names_mips3264r2,
++    mips_cp0sel_names_mips3264r2, ARRAY_SIZE (mips_cp0sel_names_mips3264r2),
++    mips_hwr_names_mips3264r2 },
+ 
    /* This entry, mips16, is here only for ISA/processor selection; do
       not print its name.  */
-   { "",		1, bfd_mach_mips16, CPU_MIPS16, ISA_MIPS3,
-Index: binutils-2.23.2/opcodes/mips-opc.c
+Index: binutils-2.24/opcodes/mips-opc.c
 ===================================================================
---- binutils-2.23.2.orig/opcodes/mips-opc.c	2013-04-16 04:19:48.241282004 -0700
-+++ binutils-2.23.2/opcodes/mips-opc.c	2013-04-16 04:19:52.773282090 -0700
-@@ -126,6 +126,7 @@
+--- binutils-2.24.orig/opcodes/mips-opc.c	2013-12-15 13:07:57.180399300 -0800
++++ binutils-2.24/opcodes/mips-opc.c	2013-12-15 13:27:30.573724118 -0800
+@@ -262,7 +262,8 @@
+ #define IOCT	(INSN_OCTEON | INSN_OCTEONP | INSN_OCTEON2)
  #define IOCTP	(INSN_OCTEONP | INSN_OCTEON2)
  #define IOCT2	INSN_OCTEON2
- #define XLR     INSN_XLR
-+#define XLP     INSN_XLP
+-#define XLR     INSN_XLR
++#define XLR	INSN_XLR
++#define XLP	INSN_XLP
+ #define IVIRT	ASE_VIRT
+ #define IVIRT64	ASE_VIRT64
  
- #define G1      (T3             \
-                  )
-@@ -606,6 +607,7 @@
- {"cins",    "t,r,+p,+s",0x70000032, 0xfc00003f, WR_t|RD_s,		0,		IOCT	},
- {"clo",     "U,s",      0x70000021, 0xfc0007ff, WR_d|WR_t|RD_s, 	0,		I32|N55 },
- {"clz",     "U,s",      0x70000020, 0xfc0007ff, WR_d|WR_t|RD_s, 	0,		I32|N55 },
-+{"crc",     "d,s,t",  0x7000001c, 0xfc0007ff, WR_d|RD_s|RD_t,   0, XLP },
- {"ctc0",    "t,G",	0x40c00000, 0xffe007ff,	COD|RD_t|WR_CC,		0,		I1,		IOCT|IOCTP|IOCT2	},
- {"ctc1",    "t,G",	0x44c00000, 0xffe007ff,	COD|RD_t|WR_CC|FP_S,	0,		I1	},
- {"ctc1",    "t,S",	0x44c00000, 0xffe007ff,	COD|RD_t|WR_CC|FP_S,	0,		I1	},
-@@ -638,10 +640,11 @@
- {"daddiu",  "t,r,j",	0x64000000, 0xfc000000, WR_t|RD_s,		0,		I3	},
- {"daddu",   "d,v,t",	0x0000002d, 0xfc0007ff, WR_d|RD_s|RD_t,		0,		I3	},
- {"daddu",   "t,r,I",	0,    (int) M_DADDU_I,	INSN_MACRO,		0,		I3	},
--{"daddwc",  "d,s,t", 	0x70000038, 0xfc0007ff, WR_d|RD_s|RD_t|WR_C0|RD_C0,	0,	XLR	},
-+{"daddwc",  "d,s,t", 	0x70000038, 0xfc0007ff, WR_d|RD_s|RD_t|WR_C0|RD_C0,0, XLR|XLP	},
- {"dbreak",  "",		0x7000003f, 0xffffffff,	0,			0,		N5	},
- {"dclo",    "U,s",      0x70000025, 0xfc0007ff, RD_s|WR_d|WR_t, 	0,		I64|N55 },
- {"dclz",    "U,s",      0x70000024, 0xfc0007ff, RD_s|WR_d|WR_t, 	0,		I64|N55 },
-+{"dcrc",    "d,s,t",  0x7000001d, 0xfc0007ff, WR_d|RD_s|RD_t, 0, XLP },
+@@ -881,6 +882,7 @@
+ {"cins",		"t,r,+p,+S",	0x70000032, 0xfc00003f, WR_1|RD_2,		0,		IOCT,		0,	0 },
+ {"clo",			"U,s",		0x70000021, 0xfc0007ff, WR_1|RD_2, 	0,		I32|N55,	0,	0 },
+ {"clz",			"U,s",		0x70000020, 0xfc0007ff, WR_1|RD_2, 	0,		I32|N55,	0,	0 },
++{"crc",			"d,s,t",	0x7000001c, 0xfc0007ff,	WR_1|RD_2|RD_3,	0,		XLP, 		0,	0 },
+ {"ctc0",		"t,G",		0x40c00000, 0xffe007ff,	RD_1|WR_CC|COD,		0,		I1,		0,	IOCT|IOCTP|IOCT2 },
+ {"ctc1",		"t,G",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|COD|FP_S,	0,		I1,		0,	0 },
+ {"ctc1",		"t,S",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|COD|FP_S,	0,		I1,		0,	0 },
+@@ -913,10 +915,11 @@
+ {"daddiu",		"t,r,j",	0x64000000, 0xfc000000, WR_1|RD_2,		0,		I3,		0,	0 },
+ {"daddu",		"d,v,t",	0x0000002d, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I3,		0,	0 },
+ {"daddu",		"t,r,I",	0,    (int) M_DADDU_I,	INSN_MACRO,		0,		I3,		0,	0 },
+-{"daddwc",		"d,s,t", 	0x70000038, 0xfc0007ff, WR_1|RD_2|RD_3|WR_C0|RD_C0, 0,		XLR,		0,	0 },
++{"daddwc",		"d,s,t", 	0x70000038, 0xfc0007ff, WR_1|RD_2|RD_3|WR_C0|RD_C0, 0,		XLR|XLP,	0,	0 },
+ {"dbreak",		"",		0x7000003f, 0xffffffff,	0,			0,		N5,		0,	0 },
+ {"dclo",		"U,s",	 	0x70000025, 0xfc0007ff, WR_1|RD_2, 	0,		I64|N55,	0,	0 },
+ {"dclz",		"U,s",	 	0x70000024, 0xfc0007ff, WR_1|RD_2, 	0,		I64|N55,	0,	0 },
++{"dcrc",		"d,s,t",	0x7000001d, 0xfc0007ff, WR_1|RD_2|RD_3,	0,		XLP, 		0,	0 },
  /* dctr and dctw are used on the r5000.  */
- {"dctr",    "o(b)",	0xbc050000, 0xfc1f0000, RD_b,			0,		I3	},
- {"dctw",    "o(b)",	0xbc090000, 0xfc1f0000, RD_b,			0,		I3	},
-@@ -697,6 +700,7 @@
- {"dmfc0",   "t,G",	0x40200000, 0xffe007ff,	LCD|WR_t|RD_C0,		0,		I3	},
- {"dmfc0",   "t,+D",	0x40200000, 0xffe007f8,	LCD|WR_t|RD_C0,		0,		I64	},
- {"dmfc0",   "t,G,H",	0x40200000, 0xffe007f8,	LCD|WR_t|RD_C0,		0,		I64	},
-+{"dmfur",   "t,d",      0x7000001e, 0xffe007ff, WR_t,  0, XLP},
- {"dmt",     "",		0x41600bc1, 0xffffffff, TRAP,			0,		MT32	},
- {"dmt",     "t",	0x41600bc1, 0xffe0ffff, TRAP|WR_t,		0,		MT32	},
- {"dmtc0",   "t,G",	0x40a00000, 0xffe007ff,	COD|RD_t|WR_C0|WR_CC,	0,		I3	},
-@@ -710,6 +714,8 @@
+ {"dctr",		"o(b)",	 	0xbc050000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
+ {"dctw",		"o(b)",		0xbc090000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
+@@ -980,6 +983,7 @@
+ {"dmfc0",		"t,G,H",	0x40200000, 0xffe007f8,	WR_1|RD_C0|LCD,		0,		I64,		0,	0 },
+ {"dmfgc0",		"t,G",		0x40600100, 0xffe007ff, WR_1|RD_C0|LCD,		0,		0,		IVIRT64, 0 },
+ {"dmfgc0",		"t,G,H",	0x40600100, 0xffe007f8, WR_1|RD_C0|LCD, 	0,		0,		IVIRT64, 0 },
++{"dmfur",		"t,d",		0x7000001e, 0xffe007ff, WR_1,			0,		XLP,		0,	0 },
+ {"dmt",			"",		0x41600bc1, 0xffffffff, TRAP,			0,		0,		MT32,	0 },
+ {"dmt",			"t",		0x41600bc1, 0xffe0ffff, WR_1|TRAP,		0,		0,		MT32,	0 },
+ {"dmtc0",		"t,G",		0x40a00000, 0xffe007ff,	RD_1|WR_C0|WR_CC|COD,	0,		I3,		0,	EE },
+@@ -994,6 +998,8 @@
  /* dmtc2 is at the bottom of the table.  */
  /* dmfc3 is at the bottom of the table.  */
  /* dmtc3 is at the bottom of the table.  */
-+{"dmtur",   "t,d",      0x7000001f, 0xffe007ff, RD_t,   0, XLP},
-+{"dmul",    "d,s,t",   0x70000006, 0xfc0007ff, WR_d|RD_s|RD_t, 0, XLP},
- {"dmul",    "d,v,t",	0x70000003, 0xfc0007ff, WR_d|RD_s|RD_t|WR_HILO,	0,		IOCT	},
- {"dmul",    "d,v,t",	0,    (int) M_DMUL,	INSN_MACRO,		0,		I3	},
- {"dmul",    "d,v,I",	0,    (int) M_DMUL_I,	INSN_MACRO,		0,		I3	},
-@@ -848,9 +854,9 @@
- {"ld",      "t,o(b)",	0,    (int) M_LD_OB,	INSN_MACRO,		0,		I1	},
- {"ld",      "t,o(b)",	0xdc000000, 0xfc000000, WR_t|RD_b,		0,		I3	},
- {"ld",      "t,A(b)",	0,    (int) M_LD_AB,	INSN_MACRO,		0,		I1	},
--{"ldaddw",  "t,b",	0x70000010, 0xfc00ffff,	SM|RD_t|WR_t|RD_b,	0,		XLR	},
--{"ldaddwu", "t,b",	0x70000011, 0xfc00ffff,	SM|RD_t|WR_t|RD_b,	0,		XLR	},
--{"ldaddd",  "t,b",	0x70000012, 0xfc00ffff,	SM|RD_t|WR_t|RD_b,	0,		XLR	},
-+{"ldaddw",  "t,b",	0x70000010, 0xfc00ffff,	SM|RD_t|WR_t|RD_b,	0,		XLR|XLP	},
-+{"ldaddwu", "t,b",	0x70000011, 0xfc00ffff,	SM|RD_t|WR_t|RD_b,	0,		XLR|XLP	},
-+{"ldaddd",  "t,b",	0x70000012, 0xfc00ffff,	SM|RD_t|WR_t|RD_b,	0,		XLR|XLP	},
- {"ldc1",    "T,o(b)",	0xd4000000, 0xfc000000, CLD|RD_b|WR_T|FP_D,	0,		I2	},
- {"ldc1",    "E,o(b)",	0xd4000000, 0xfc000000, CLD|RD_b|WR_T|FP_D,	0,		I2	},
- {"ldc1",    "T,A(b)",	0,    (int) M_LDC1_AB,	INSN_MACRO,		INSN2_M_FP_D,	I2	},
-@@ -985,7 +991,7 @@
- {"mflo",    "d",	0x00000012, 0xffff07ff,	WR_d|RD_LO,		0,		I1	},
- {"mflo",    "d,9",	0x00000012, 0xff9f07ff, WR_d|RD_LO,		0,		D32	},
- {"mflhxu",  "d",	0x00000052, 0xffff07ff,	WR_d|MOD_HILO,		0,		SMT	},
--{"mfcr",    "t,s",	0x70000018, 0xfc00ffff, WR_t,			0,		XLR 	},
-+{"mfcr",    "t,s",	0x70000018, 0xfc00ffff, WR_t,			0,		XLR|XLP },
- {"min.ob",  "X,Y,Q",	0x78000006, 0xfc20003f,	WR_D|RD_S|RD_T|FP_D,	0,		MX|SB1	},
- {"min.ob",  "D,S,T",	0x4ac00006, 0xffe0003f,	WR_D|RD_S|RD_T,		0,		N54	},
- {"min.ob",  "D,S,T[e]",	0x48000006, 0xfe20003f,	WR_D|RD_S|RD_T,		0,		N54	},
-@@ -1029,10 +1035,13 @@
++{"dmtur",		"t,d",		0x7000001f, 0xffe007ff,	RD_1,			0,		XLP,		0,	0 },
++{"dmul",		"d,s,t",	0x70000006, 0xfc0007ff,	WR_1|RD_2|RD_3,		0,		XLP,		0,	0 },
+ {"dmul",		"d,v,t",	0x70000003, 0xfc0007ff, WR_1|RD_2|RD_3|WR_HILO,	0,		IOCT,		0,	0 },
+ {"dmul",		"d,v,t",	0,    (int) M_DMUL,	INSN_MACRO,		0,		I3,		0,	M32 },
+ {"dmul",		"d,v,I",	0,    (int) M_DMUL_I,	INSN_MACRO,		0,		I3,		0,	M32 },
+@@ -1134,9 +1140,9 @@
+ /* The macro has to be first to handle o32 correctly.  */
+ {"ld",			"t,A(b)",	0,    (int) M_LD_AB,	INSN_MACRO,		0,		I1,		0,	0 },
+ {"ld",			"t,o(b)",	0xdc000000, 0xfc000000, WR_1|RD_3,		0,		I3,		0,	0 },
+-{"ldaddw",		"t,b",		0x70000010, 0xfc00ffff,	MOD_1|RD_2|SM,		0,		XLR,		0,	0 },
+-{"ldaddwu",		"t,b",		0x70000011, 0xfc00ffff,	MOD_1|RD_2|SM,		0,		XLR,		0,	0 },
+-{"ldaddd",		"t,b",		0x70000012, 0xfc00ffff,	MOD_1|RD_2|SM,		0,		XLR,		0,	0 },
++{"ldaddw",		"t,b",		0x70000010, 0xfc00ffff,	MOD_1|RD_2|SM,		0,		XLR|XLP,	0,	0 },
++{"ldaddwu",		"t,b",		0x70000011, 0xfc00ffff,	MOD_1|RD_2|SM,		0,		XLR|XLP,	0,	0 },
++{"ldaddd",		"t,b",		0x70000012, 0xfc00ffff,	MOD_1|RD_2|SM,		0,		XLR|XLP,	0,	0 },
+ {"ldc1",		"T,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
+ {"ldc1",		"E,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
+ {"ldc1",		"T,A(b)",	0,    (int) M_LDC1_AB,	INSN_MACRO,		INSN2_M_FP_D,	I2,		0,	SF },
+@@ -1288,7 +1294,7 @@
+ {"mflo",		"d,9",		0x00000012, 0xff9f07ff, WR_1|RD_LO,		0,		0,		D32,	0 },
+ {"mflo1",		"d",		0x70000012, 0xffff07ff,	WR_1|RD_LO,		0,		EE,		0,	0 },
+ {"mflhxu",		"d",		0x00000052, 0xffff07ff,	WR_1|MOD_HILO,		0,		0,		SMT,	0 },
+-{"mfcr",		"t,s",		0x70000018, 0xfc00ffff, WR_1,			0,		XLR,		0,	0 },
++{"mfcr",		"t,s",		0x70000018, 0xfc00ffff, WR_1,			0,		XLR|XLP,	0,	0 },
+ {"mfsa",		"d",		0x00000028, 0xffff07ff,	WR_1,			0,		EE,		0,	0 },
+ {"min.ob",		"X,Y,Q",	0x78000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		SB1,		MX,	0 },
+ {"min.ob",		"D,S,Q",	0x48000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		N54,		0,	0 },
+@@ -1332,10 +1338,13 @@
  /* move is at the top of the table.  */
- {"msgn.qh", "X,Y,Q",	0x78200000, 0xfc20003f,	WR_D|RD_S|RD_T|FP_D,	0,		MX	},
- {"msgsnd",  "t",	0,    (int) M_MSGSND,	INSN_MACRO,		0,             XLR	},
-+{"msgsnds", "d,t",      0x4a000001, 0xffe007ff, WR_d|RD_t|RD_C0|WR_C0,  0, XLP  },
- {"msgld",   "", 	0,    (int) M_MSGLD,	INSN_MACRO,		0,             XLR	},
- {"msgld",   "t",	0,    (int) M_MSGLD_T,	INSN_MACRO,		0,             XLR	},
--{"msgwait", "", 	0,    (int) M_MSGWAIT,	INSN_MACRO,		0,             XLR	},
--{"msgwait", "t",	0,    (int) M_MSGWAIT_T,INSN_MACRO,		0,             XLR	},
-+{"msglds",  "d,t",      0x4a000002, 0xffe007ff, WR_d|RD_t|RD_C0|WR_C0,  0, XLP  },
-+{"msgwait", "", 	0,    (int) M_MSGWAIT,	INSN_MACRO,		0, 			   XLR|XLP	},
-+{"msgwait", "t",	0,    (int) M_MSGWAIT_T,INSN_MACRO,		0, 			   XLR|XLP	},
-+{"msgsync", "",         0x4a000004, 0xffffffff, 0,                      0, XLP  },
- {"msub.d",  "D,R,S,T",	0x4c000029, 0xfc00003f, RD_R|RD_S|RD_T|WR_D|FP_D, 0,		I4_33	},
- {"msub.d",	"D,S,T",	0x46200019,	0xffe0003f,	RD_S|RD_T|WR_D|FP_D,	0,	IL2E	},
- {"msub.d",	"D,S,T",	0x72200019,	0xffe0003f,	RD_S|RD_T|WR_D|FP_D,	0,	IL2F	},
-@@ -1066,7 +1075,7 @@
- {"mtlo",    "s",	0x00000013, 0xfc1fffff,	RD_s|WR_LO,		0,		I1	},
- {"mtlo",    "s,7",	0x00000013, 0xfc1fe7ff, RD_s|WR_LO,		0,		D32	},
- {"mtlhx",   "s",	0x00000053, 0xfc1fffff,	RD_s|MOD_HILO,		0,		SMT	},
--{"mtcr",    "t,s",      0x70000019, 0xfc00ffff, RD_t,			0,		XLR	},
-+{"mtcr",    "t,s",      0x70000019, 0xfc00ffff, RD_t,			0,		XLR|XLP	},
- {"mtm0",    "s",	0x70000008, 0xfc1fffff, RD_s,			0,		IOCT	},
- {"mtm1",    "s",	0x7000000c, 0xfc1fffff, RD_s,			0,		IOCT	},
- {"mtm2",    "s",	0x7000000d, 0xfc1fffff, RD_s,			0,		IOCT	},
-@@ -1425,9 +1434,9 @@
- {"suxc1",   "S,t(b)",   0x4c00000d, 0xfc0007ff, SM|RD_S|RD_t|RD_b|FP_D,	0,		I5_33|N55},
- {"sw",      "t,o(b)",	0xac000000, 0xfc000000,	SM|RD_t|RD_b,		0,		I1	},
- {"sw",      "t,A(b)",	0,    (int) M_SW_AB,	INSN_MACRO,		0,		I1	},
--{"swapw",   "t,b",	0x70000014, 0xfc00ffff, SM|RD_t|WR_t|RD_b,	0,		XLR	},
--{"swapwu",  "t,b",	0x70000015, 0xfc00ffff, SM|RD_t|WR_t|RD_b,	0,		XLR	},
--{"swapd",   "t,b",	0x70000016, 0xfc00ffff, SM|RD_t|WR_t|RD_b,	0,		XLR	},
-+{"swapw",   "t,b",	0x70000014, 0xfc00ffff, SM|RD_t|WR_t|RD_b,	0,		XLR|XLP	},
-+{"swapwu",  "t,b",	0x70000015, 0xfc00ffff, SM|RD_t|WR_t|RD_b,	0,		XLR|XLP	},
-+{"swapd",   "t,b",	0x70000016, 0xfc00ffff, SM|RD_t|WR_t|RD_b,	0,		XLR|XLP	},
- {"swc0",    "E,o(b)",	0xe0000000, 0xfc000000,	SM|RD_C0|RD_b,		0,		I1,		IOCT|IOCTP|IOCT2	},
- {"swc0",    "E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		IOCT|IOCTP|IOCT2	},
- {"swc1",    "T,o(b)",	0xe4000000, 0xfc000000,	SM|RD_T|RD_b|FP_S,	0,		I1	},
+ {"msgn.qh",		"X,Y,Q",	0x78200000, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		0,		MX,	0 },
+ {"msgsnd",		"t",		0,    (int) M_MSGSND,	INSN_MACRO,		0,		XLR,		0,	0 },
++{"msgsnds",		"d,t",		0x4a000001, 0xffe007ff,	WR_1|RD_2|RD_C0|WR_C0,	0,		XLP,		0,	0 },
+ {"msgld",		"", 		0,    (int) M_MSGLD,	INSN_MACRO,		0,		XLR,		0,	0 },
+ {"msgld",		"t",		0,    (int) M_MSGLD_T,	INSN_MACRO,		0,		XLR,		0,	0 },
+-{"msgwait",		"", 		0,    (int) M_MSGWAIT,	INSN_MACRO,		0,		XLR,		0,	0 },
+-{"msgwait",		"t",		0,    (int) M_MSGWAIT_T,INSN_MACRO,		0,		XLR,		0,	0 },
++{"msglds",		"d,t",		0x4a000002, 0xffe007ff,	WR_1|RD_2|RD_C0|WR_C0,	0,		XLP,		0,	0 },
++{"msgwait",		"",		0,    (int) M_MSGWAIT,  INSN_MACRO,		0,		XLR|XLP,	0,	0 },
++{"msgwait",		"t",		0,    (int) M_MSGWAIT_T,INSN_MACRO,		0,		XLR|XLP,	0,	0 },
++{"msgsync",		"",		0x4a000004, 0xffffffff,0,			0,		XLP,		0,	0 },
+ {"msub.d",		"D,R,S,T",	0x4c000029, 0xfc00003f, WR_1|RD_2|RD_3|RD_4|FP_D, 0,		I4_33,		0,	0 },
+ {"msub.d",		"D,S,T",	0x46200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2E,		0,	0 },
+ {"msub.d",		"D,S,T",	0x72200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2F,		0,	0 },
+@@ -1381,7 +1390,7 @@
+ {"mtlo",		"s,7",		0x00000013, 0xfc1fe7ff, RD_1|WR_LO,		0,		0,		D32,	0 },
+ {"mtlo1",		"s",		0x70000013, 0xfc1fffff,	RD_1|WR_LO,		0,		EE,		0,	0 },
+ {"mtlhx",		"s",		0x00000053, 0xfc1fffff,	RD_1|MOD_HILO,		0,		0,		SMT,	0 },
+-{"mtcr",		"t,s",		0x70000019, 0xfc00ffff, RD_1,			0,		XLR,		0,	0 },
++{"mtcr",		"t,s",		0x70000019, 0xfc00ffff, RD_1,			0,		XLR|XLP,	0,	0 },
+ {"mtm0",		"s",		0x70000008, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
+ {"mtm1",		"s",		0x7000000c, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
+ {"mtm2",		"s",		0x7000000d, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
+@@ -1802,9 +1811,9 @@
+ {"suxc1",		"S,t(b)",	0x4c00000d, 0xfc0007ff, RD_1|RD_2|RD_3|SM|FP_D,	0,		I5_33|N55,	0,	0},
+ {"sw",			"t,o(b)",	0xac000000, 0xfc000000,	RD_1|RD_3|SM,		0,		I1,		0,	0 },
+ {"sw",			"t,A(b)",	0,    (int) M_SW_AB,	INSN_MACRO,		0,		I1,		0,	0 },
+-{"swapw",		"t,b",		0x70000014, 0xfc00ffff, MOD_1|RD_2|SM,		0,		XLR,		0,	0 },
+-{"swapwu",		"t,b",		0x70000015, 0xfc00ffff, MOD_1|RD_2|SM,		0,		XLR,		0,	0 },
+-{"swapd",		"t,b",		0x70000016, 0xfc00ffff, MOD_1|RD_2|SM,		0,		XLR,		0,	0 },
++{"swapw",		"t,b",		0x70000014, 0xfc00ffff, MOD_1|RD_2|SM,		0,		XLR|XLP,	0,	0 },
++{"swapwu",		"t,b",		0x70000015, 0xfc00ffff, MOD_1|RD_2|SM,		0,		XLR|XLP,	0,	0 },
++{"swapd",		"t,b",		0x70000016, 0xfc00ffff, MOD_1|RD_2|SM,		0,		XLR|XLP,	0,	0 },
+ {"swc0",		"E,o(b)",	0xe0000000, 0xfc000000,	RD_3|RD_C0|SM,		0,		I1,		0,	IOCT|IOCTP|IOCT2 },
+ {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2 },
+ {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
diff --git a/meta/recipes-devtools/binutils/binutils/fix-pr15815.patch b/meta/recipes-devtools/binutils/binutils/fix-pr15815.patch
new file mode 100644
index 0000000..9f53f41
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/fix-pr15815.patch
@@ -0,0 +1,36 @@
+This patch fixes the problem where libiberty is not installed in spite of
+asking it via --enable-install-libiberty, the problem is that target_header_dir
+is reset explicitly which means libiberty.a will never get installed
+
+also check
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=15815
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: binutils-2.24/libiberty/configure
+===================================================================
+--- binutils-2.24.orig/libiberty/configure	2013-12-16 00:08:09.280103157 -0800
++++ binutils-2.24/libiberty/configure	2013-12-16 00:08:29.753436339 -0800
+@@ -5507,7 +5507,6 @@
+ 
+ setobjs=
+ CHECK=
+-target_header_dir=
+ if test -n "${with_target_subdir}"; then
+ 
+   # We are being configured as a target library.  AC_REPLACE_FUNCS
+Index: binutils-2.24/libiberty/configure.ac
+===================================================================
+--- binutils-2.24.orig/libiberty/configure.ac	2013-11-08 02:13:49.000000000 -0800
++++ binutils-2.24/libiberty/configure.ac	2013-12-16 00:07:45.133436672 -0800
+@@ -405,7 +405,6 @@
+ 
+ setobjs=
+ CHECK=
+-target_header_dir=
+ if test -n "${with_target_subdir}"; then
+ 
+   # We are being configured as a target library.  AC_REPLACE_FUNCS
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/libiberty_path_fix.patch b/meta/recipes-devtools/binutils/binutils/libiberty_path_fix.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/libiberty_path_fix.patch
rename to meta/recipes-devtools/binutils/binutils/libiberty_path_fix.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/libtool-2.4-update.patch b/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/libtool-2.4-update.patch
rename to meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
index 31cf0a0..2e621f1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/libtool-2.4-update.patch
+++ b/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
@@ -1,9 +1,9 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: git/libtool.m4
+Index: binutils-2.24/libtool.m4
 ===================================================================
---- git.orig/libtool.m4	2012-09-07 01:13:47.000000000 -0700
-+++ git/libtool.m4	2012-09-07 12:21:49.642865707 -0700
+--- binutils-2.24.orig/libtool.m4	2013-11-04 07:33:40.000000000 -0800
++++ binutils-2.24/libtool.m4	2013-12-15 11:10:23.863785363 -0800
 @@ -1,7 +1,8 @@
  # libtool.m4 - Configure libtool for the host system. -*-Autoconf-*-
  #
@@ -211,7 +211,7 @@ Index: git/libtool.m4
  # _LT_ENABLE_LOCK
  # ---------------
  m4_defun([_LT_ENABLE_LOCK],
-@@ -1307,14 +1356,47 @@
+@@ -1320,14 +1369,47 @@
  ])# _LT_ENABLE_LOCK
  
  
@@ -264,7 +264,7 @@ Index: git/libtool.m4
  
  AC_CHECK_TOOL(STRIP, strip, :)
  test -z "$STRIP" && STRIP=:
-@@ -1610,7 +1692,7 @@
+@@ -1623,7 +1705,7 @@
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -273,7 +273,7 @@ Index: git/libtool.m4
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -1654,10 +1736,10 @@
+@@ -1667,10 +1749,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -286,7 +286,7 @@ Index: git/libtool.m4
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -2197,8 +2279,9 @@
+@@ -2210,8 +2292,9 @@
    need_version=no
    need_lib_prefix=no
  
@@ -298,7 +298,7 @@ Index: git/libtool.m4
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -2231,13 +2314,71 @@
+@@ -2244,13 +2327,71 @@
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -371,7 +371,7 @@ Index: git/libtool.m4
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -2329,7 +2470,7 @@
+@@ -2342,7 +2483,7 @@
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -380,7 +380,7 @@ Index: git/libtool.m4
    hardcode_into_libs=yes
    ;;
  
-@@ -2937,6 +3078,11 @@
+@@ -2950,6 +3091,11 @@
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -392,7 +392,7 @@ Index: git/libtool.m4
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -3003,7 +3149,8 @@
+@@ -3016,7 +3162,8 @@
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -402,7 +402,7 @@ Index: git/libtool.m4
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -3154,6 +3301,21 @@
+@@ -3167,6 +3314,21 @@
    ;;
  esac
  ])
@@ -424,7 +424,7 @@ Index: git/libtool.m4
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -3161,7 +3323,11 @@
+@@ -3174,7 +3336,11 @@
  _LT_DECL([], [deplibs_check_method], [1],
      [Method to check whether dependent libraries are shared objects])
  _LT_DECL([], [file_magic_cmd], [1],
@@ -437,7 +437,7 @@ Index: git/libtool.m4
  ])# _LT_CHECK_MAGIC_METHOD
  
  
-@@ -3264,6 +3430,67 @@
+@@ -3277,6 +3443,67 @@
  dnl AC_DEFUN([AM_PROG_NM], [])
  dnl AC_DEFUN([AC_PROG_NM], [])
  
@@ -505,7 +505,7 @@ Index: git/libtool.m4
  
  # LT_LIB_M
  # --------
-@@ -3390,8 +3617,8 @@
+@@ -3403,8 +3630,8 @@
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -516,7 +516,7 @@ Index: git/libtool.m4
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -3427,6 +3654,7 @@
+@@ -3440,6 +3667,7 @@
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[[	 ]]\($symcode$symcode*\)[[	 ]][[	 ]]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -524,7 +524,7 @@ Index: git/libtool.m4
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -3460,6 +3688,18 @@
+@@ -3473,6 +3701,18 @@
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -543,7 +543,7 @@ Index: git/libtool.m4
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -3471,7 +3711,7 @@
+@@ -3484,7 +3724,7 @@
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -552,7 +552,7 @@ Index: git/libtool.m4
    const char *name;
    void       *address;
  }
-@@ -3497,15 +3737,15 @@
+@@ -3510,15 +3750,15 @@
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -572,7 +572,7 @@ Index: git/libtool.m4
  	else
  	  echo "cannot find nm_test_func in $nlist" >&AS_MESSAGE_LOG_FD
  	fi
-@@ -3538,6 +3778,13 @@
+@@ -3551,6 +3791,13 @@
    AC_MSG_RESULT(ok)
  fi
  
@@ -586,7 +586,7 @@ Index: git/libtool.m4
  _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
      [Take the output of nm and produce a listing of raw symbols and C names])
  _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
-@@ -3548,6 +3795,8 @@
+@@ -3561,6 +3808,8 @@
  _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
      [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
      [Transform the output of nm in a C name address pair when lib prefix is needed])
@@ -595,7 +595,7 @@ Index: git/libtool.m4
  ]) # _LT_CMD_GLOBAL_SYMBOLS
  
  
-@@ -3559,7 +3808,6 @@
+@@ -3572,7 +3821,6 @@
  _LT_TAGVAR(lt_prog_compiler_pic, $1)=
  _LT_TAGVAR(lt_prog_compiler_static, $1)=
  
@@ -603,7 +603,7 @@ Index: git/libtool.m4
  m4_if([$1], [CXX], [
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -3664,6 +3912,12 @@
+@@ -3678,6 +3926,12 @@
  	  ;;
  	esac
  	;;
@@ -616,7 +616,7 @@ Index: git/libtool.m4
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -3816,7 +4070,7 @@
+@@ -3830,7 +4084,7 @@
  	;;
        solaris*)
  	case $cc_basename in
@@ -625,7 +625,7 @@ Index: git/libtool.m4
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
  	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
-@@ -4038,6 +4292,12 @@
+@@ -4053,6 +4307,12 @@
  	_LT_TAGVAR(lt_prog_compiler_pic, $1)='--shared'
  	_LT_TAGVAR(lt_prog_compiler_static, $1)='--static'
  	;;
@@ -638,7 +638,7 @@ Index: git/libtool.m4
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -4100,7 +4360,7 @@
+@@ -4115,7 +4375,7 @@
        _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
        _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
        case $cc_basename in
@@ -647,7 +647,7 @@ Index: git/libtool.m4
  	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld ';;
        *)
  	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,';;
-@@ -4157,9 +4417,11 @@
+@@ -4172,9 +4432,11 @@
      _LT_TAGVAR(lt_prog_compiler_pic, $1)="$_LT_TAGVAR(lt_prog_compiler_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])"
      ;;
  esac
@@ -662,7 +662,7 @@ Index: git/libtool.m4
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -4178,6 +4440,8 @@
+@@ -4193,6 +4455,8 @@
  _LT_TAGDECL([pic_flag], [lt_prog_compiler_pic], [1],
  	[Additional compiler flags for building library objects])
  
@@ -671,7 +671,7 @@ Index: git/libtool.m4
  #
  # Check to make sure the static flag actually works.
  #
-@@ -4198,6 +4462,7 @@
+@@ -4213,6 +4477,7 @@
  m4_defun([_LT_LINKER_SHLIBS],
  [AC_REQUIRE([LT_PATH_LD])dnl
  AC_REQUIRE([LT_PATH_NM])dnl
@@ -679,7 +679,7 @@ Index: git/libtool.m4
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_DECL_EGREP])dnl
  m4_require([_LT_DECL_SED])dnl
-@@ -4206,6 +4471,7 @@
+@@ -4221,6 +4486,7 @@
  AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared libraries])
  m4_if([$1], [CXX], [
    _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -687,7 +687,7 @@ Index: git/libtool.m4
    case $host_os in
    aix[[4-9]]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -4220,15 +4486,20 @@
+@@ -4235,15 +4501,20 @@
      ;;
    pw32*)
      _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
@@ -713,7 +713,7 @@ Index: git/libtool.m4
  ], [
    runpath_var=
    _LT_TAGVAR(allow_undefined_flag, $1)=
-@@ -4396,7 +4667,8 @@
+@@ -4411,7 +4682,8 @@
        _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
        _LT_TAGVAR(always_export_symbols, $1)=no
        _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
@@ -723,7 +723,7 @@ Index: git/libtool.m4
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -4444,7 +4716,7 @@
+@@ -4459,7 +4731,7 @@
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -732,7 +732,7 @@ Index: git/libtool.m4
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -4495,12 +4767,12 @@
+@@ -4510,12 +4782,12 @@
  	  _LT_TAGVAR(whole_archive_flag_spec, $1)='--whole-archive$convenience --no-whole-archive'
  	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
  	  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='-rpath $libdir'
@@ -747,7 +747,7 @@ Index: git/libtool.m4
  	  fi
  	  ;;
  	esac
-@@ -4514,8 +4786,8 @@
+@@ -4529,8 +4801,8 @@
  	_LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -758,7 +758,7 @@ Index: git/libtool.m4
        fi
        ;;
  
-@@ -4533,8 +4805,8 @@
+@@ -4548,8 +4820,8 @@
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -769,7 +769,7 @@ Index: git/libtool.m4
        else
  	_LT_TAGVAR(ld_shlibs, $1)=no
        fi
-@@ -4580,8 +4852,8 @@
+@@ -4595,8 +4867,8 @@
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -780,7 +780,7 @@ Index: git/libtool.m4
        else
  	_LT_TAGVAR(ld_shlibs, $1)=no
        fi
-@@ -4711,7 +4983,7 @@
+@@ -4726,7 +4998,7 @@
  	_LT_TAGVAR(allow_undefined_flag, $1)='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -789,7 +789,7 @@ Index: git/libtool.m4
          _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
        else
-@@ -4722,7 +4994,7 @@
+@@ -4737,7 +5009,7 @@
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -798,7 +798,7 @@ Index: git/libtool.m4
  	 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
  	  # -berok will link without error, but may produce a broken library.
-@@ -4766,20 +5038,63 @@
+@@ -4781,20 +5053,63 @@
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -876,7 +876,7 @@ Index: git/libtool.m4
        ;;
  
      darwin* | rhapsody*)
-@@ -4813,7 +5128,7 @@
+@@ -4828,7 +5143,7 @@
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -885,7 +885,7 @@ Index: git/libtool.m4
        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
        _LT_TAGVAR(hardcode_direct, $1)=yes
        _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
-@@ -4821,7 +5136,7 @@
+@@ -4836,7 +5151,7 @@
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -894,7 +894,7 @@ Index: git/libtool.m4
        else
  	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -4837,7 +5152,7 @@
+@@ -4852,7 +5167,7 @@
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -903,7 +903,7 @@ Index: git/libtool.m4
        else
  	_LT_TAGVAR(archive_cmds, $1)='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -4861,10 +5176,10 @@
+@@ -4876,10 +5191,10 @@
  	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -916,7 +916,7 @@ Index: git/libtool.m4
  	  ;;
  	esac
        else
-@@ -4911,16 +5226,31 @@
+@@ -4926,16 +5241,31 @@
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -955,7 +955,7 @@ Index: git/libtool.m4
        else
  	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -5005,7 +5335,7 @@
+@@ -5020,7 +5350,7 @@
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
@@ -964,7 +964,7 @@ Index: git/libtool.m4
  	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
        else
  	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
-@@ -5024,9 +5354,9 @@
+@@ -5039,9 +5369,9 @@
        _LT_TAGVAR(no_undefined_flag, $1)=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -976,7 +976,7 @@ Index: git/libtool.m4
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -5298,8 +5628,6 @@
+@@ -5313,8 +5643,6 @@
      to runtime path list])
  _LT_TAGDECL([], [link_all_deplibs], [0],
      [Whether libtool must link a program against all its dependency libraries])
@@ -985,7 +985,7 @@ Index: git/libtool.m4
  _LT_TAGDECL([], [always_export_symbols], [0],
      [Set to "yes" if exported symbols are required])
  _LT_TAGDECL([], [export_symbols_cmds], [2],
-@@ -5310,6 +5638,8 @@
+@@ -5325,6 +5653,8 @@
      [Symbols that must always be exported])
  _LT_TAGDECL([], [prelink_cmds], [2],
      [Commands necessary for linking programs (against libraries) with templates])
@@ -994,7 +994,7 @@ Index: git/libtool.m4
  _LT_TAGDECL([], [file_list_spec], [1],
      [Specify filename containing input files])
  dnl FIXME: Not yet implemented
-@@ -5411,6 +5741,7 @@
+@@ -5426,6 +5756,7 @@
  m4_defun([_LT_LANG_CXX_CONFIG],
  [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_DECL_EGREP])dnl
@@ -1002,7 +1002,7 @@ Index: git/libtool.m4
  if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
      ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
      (test "X$CXX" != "Xg++"))) ; then
-@@ -5472,6 +5803,7 @@
+@@ -5487,6 +5818,7 @@
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -1010,7 +1010,7 @@ Index: git/libtool.m4
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -5489,6 +5821,7 @@
+@@ -5504,6 +5836,7 @@
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -1018,7 +1018,7 @@ Index: git/libtool.m4
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5510,8 +5843,8 @@
+@@ -5525,8 +5858,8 @@
        # Check if GNU C++ uses GNU ld as the underlying linker, since the
        # archiving commands below assume that GNU ld is being used.
        if test "$with_gnu_ld" = yes; then
@@ -1029,7 +1029,7 @@ Index: git/libtool.m4
  
          _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
          _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
-@@ -5652,7 +5985,7 @@
+@@ -5667,7 +6000,7 @@
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -1038,7 +1038,7 @@ Index: git/libtool.m4
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  
            _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -5664,7 +5997,7 @@
+@@ -5679,7 +6012,7 @@
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -1047,7 +1047,7 @@ Index: git/libtool.m4
  	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
  	    # -berok will link without error, but may produce a broken library.
-@@ -5706,29 +6039,75 @@
+@@ -5721,29 +6054,75 @@
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -1146,7 +1146,7 @@ Index: git/libtool.m4
        darwin* | rhapsody*)
          _LT_DARWIN_LINKER_FEATURES($1)
  	;;
-@@ -5803,7 +6182,7 @@
+@@ -5818,7 +6197,7 @@
              ;;
            *)
              if test "$GXX" = yes; then
@@ -1155,7 +1155,7 @@ Index: git/libtool.m4
              else
                # FIXME: insert proper C++ library support
                _LT_TAGVAR(ld_shlibs, $1)=no
-@@ -5874,10 +6253,10 @@
+@@ -5889,10 +6268,10 @@
  	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -1168,7 +1168,7 @@ Index: git/libtool.m4
  	            ;;
  	        esac
  	      fi
-@@ -5918,9 +6297,9 @@
+@@ -5933,9 +6312,9 @@
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -1180,7 +1180,7 @@ Index: git/libtool.m4
  	      fi
  	    fi
  	    _LT_TAGVAR(link_all_deplibs, $1)=yes
-@@ -5990,20 +6369,20 @@
+@@ -6005,20 +6384,20 @@
  	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -1205,7 +1205,7 @@ Index: git/libtool.m4
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -6198,7 +6577,7 @@
+@@ -6213,7 +6592,7 @@
  	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -1214,7 +1214,7 @@ Index: git/libtool.m4
  		  ;;
  	      esac
  
-@@ -6244,7 +6623,7 @@
+@@ -6259,7 +6638,7 @@
  
        solaris*)
          case $cc_basename in
@@ -1223,7 +1223,7 @@ Index: git/libtool.m4
  	    # Sun C++ 4.2, 5.x and Centerline C++
              _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
  	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
-@@ -6285,9 +6664,9 @@
+@@ -6300,9 +6679,9 @@
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -1235,7 +1235,7 @@ Index: git/libtool.m4
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -6416,6 +6795,7 @@
+@@ -6431,6 +6810,7 @@
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -1243,7 +1243,7 @@ Index: git/libtool.m4
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -6430,6 +6810,29 @@
+@@ -6445,6 +6825,29 @@
  ])# _LT_LANG_CXX_CONFIG
  
  
@@ -1273,7 +1273,7 @@ Index: git/libtool.m4
  # _LT_SYS_HIDDEN_LIBDEPS([TAGNAME])
  # ---------------------------------
  # Figure out "hidden" library dependencies from verbose
-@@ -6438,6 +6841,7 @@
+@@ -6453,6 +6856,7 @@
  # objects, libraries and library flags.
  m4_defun([_LT_SYS_HIDDEN_LIBDEPS],
  [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
@@ -1281,7 +1281,7 @@ Index: git/libtool.m4
  # Dependencies to place before and after the object being linked:
  _LT_TAGVAR(predep_objects, $1)=
  _LT_TAGVAR(postdep_objects, $1)=
-@@ -6488,6 +6892,13 @@
+@@ -6503,6 +6907,13 @@
  };
  _LT_EOF
  ])
@@ -1295,7 +1295,7 @@ Index: git/libtool.m4
  dnl Parse the compiler output and extract the necessary
  dnl objects, libraries and library flags.
  if AC_TRY_EVAL(ac_compile); then
-@@ -6499,7 +6910,7 @@
+@@ -6514,7 +6925,7 @@
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -1304,7 +1304,7 @@ Index: git/libtool.m4
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -6508,13 +6919,22 @@
+@@ -6523,13 +6934,22 @@
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -1331,7 +1331,7 @@ Index: git/libtool.m4
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -6534,8 +6954,10 @@
+@@ -6549,8 +6969,10 @@
  	   _LT_TAGVAR(postdeps, $1)="${_LT_TAGVAR(postdeps, $1)} ${prev}${p}"
  	 fi
         fi
@@ -1342,7 +1342,7 @@ Index: git/libtool.m4
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -6571,6 +6993,7 @@
+@@ -6586,6 +7008,7 @@
  fi
  
  $RM -f confest.$objext
@@ -1350,7 +1350,7 @@ Index: git/libtool.m4
  
  # PORTME: override above test on systems where it is broken
  m4_if([$1], [CXX],
-@@ -6607,7 +7030,7 @@
+@@ -6622,7 +7045,7 @@
  
  solaris*)
    case $cc_basename in
@@ -1359,7 +1359,7 @@ Index: git/libtool.m4
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -6720,7 +7143,9 @@
+@@ -6735,7 +7158,9 @@
    # Allow CC to be a program name with arguments.
    lt_save_CC="$CC"
    lt_save_GCC=$GCC
@@ -1369,7 +1369,7 @@ Index: git/libtool.m4
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -6774,6 +7199,7 @@
+@@ -6789,6 +7214,7 @@
  
    GCC=$lt_save_GCC
    CC="$lt_save_CC"
@@ -1377,7 +1377,7 @@ Index: git/libtool.m4
  fi # test "$_lt_disable_F77" != yes
  
  AC_LANG_POP
-@@ -6850,7 +7276,9 @@
+@@ -6865,7 +7291,9 @@
    # Allow CC to be a program name with arguments.
    lt_save_CC="$CC"
    lt_save_GCC=$GCC
@@ -1387,7 +1387,7 @@ Index: git/libtool.m4
    compiler=$CC
    GCC=$ac_cv_fc_compiler_gnu
  
-@@ -6906,7 +7334,8 @@
+@@ -6921,7 +7349,8 @@
    fi # test -n "$compiler"
  
    GCC=$lt_save_GCC
@@ -1397,7 +1397,7 @@ Index: git/libtool.m4
  fi # test "$_lt_disable_FC" != yes
  
  AC_LANG_POP
-@@ -6943,10 +7372,12 @@
+@@ -6958,10 +7387,12 @@
  _LT_LINKER_BOILERPLATE
  
  # Allow CC to be a program name with arguments.
@@ -1411,7 +1411,7 @@ Index: git/libtool.m4
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_TAGVAR(LD, $1)="$LD"
-@@ -6977,7 +7408,8 @@
+@@ -6992,7 +7423,8 @@
  AC_LANG_RESTORE
  
  GCC=$lt_save_GCC
@@ -1421,7 +1421,7 @@ Index: git/libtool.m4
  ])# _LT_LANG_GCJ_CONFIG
  
  
-@@ -7012,9 +7444,11 @@
+@@ -7027,9 +7459,11 @@
  
  # Allow CC to be a program name with arguments.
  lt_save_CC="$CC"
@@ -1433,7 +1433,7 @@ Index: git/libtool.m4
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_CC_BASENAME([$compiler])
-@@ -7027,7 +7461,8 @@
+@@ -7042,7 +7476,8 @@
  
  GCC=$lt_save_GCC
  AC_LANG_RESTORE
@@ -1443,7 +1443,7 @@ Index: git/libtool.m4
  ])# _LT_LANG_RC_CONFIG
  
  
-@@ -7086,6 +7521,15 @@
+@@ -7101,6 +7536,15 @@
  AC_SUBST([OBJDUMP])
  ])
  
@@ -1459,7 +1459,7 @@ Index: git/libtool.m4
  
  # _LT_DECL_SED
  # ------------
-@@ -7179,8 +7623,8 @@
+@@ -7194,8 +7638,8 @@
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -1470,7 +1470,7 @@ Index: git/libtool.m4
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -7219,206 +7663,162 @@
+@@ -7234,206 +7678,162 @@
  ])# _LT_CHECK_SHELL_FEATURES
  
  
@@ -1823,10 +1823,10 @@ Index: git/libtool.m4
 +_LT_DECL([to_tool_file_cmd], [lt_cv_to_tool_file_cmd],
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
-Index: git/ltmain.sh
+Index: binutils-2.24/ltmain.sh
 ===================================================================
---- git.orig/ltmain.sh	2012-09-07 01:13:47.469341477 -0700
-+++ git/ltmain.sh	2012-09-07 12:21:49.650865716 -0700
+--- binutils-2.24.orig/ltmain.sh	2013-11-04 07:33:40.000000000 -0800
++++ binutils-2.24/ltmain.sh	2013-12-15 11:10:23.867118697 -0800
 @@ -1,10 +1,9 @@
 -# Generated from ltmain.m4sh.
  
@@ -7053,10 +7053,10 @@ Index: git/ltmain.sh
  
  if test -n "$exec_cmd"; then
    eval exec "$exec_cmd"
-Index: git/ltoptions.m4
+Index: binutils-2.24/ltoptions.m4
 ===================================================================
---- git.orig/ltoptions.m4	2012-09-07 01:13:47.000000000 -0700
-+++ git/ltoptions.m4	2012-09-07 12:21:49.650865716 -0700
+--- binutils-2.24.orig/ltoptions.m4	2013-11-04 07:33:40.000000000 -0800
++++ binutils-2.24/ltoptions.m4	2013-12-15 11:10:23.867118697 -0800
 @@ -8,7 +8,7 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -7066,10 +7066,10 @@ Index: git/ltoptions.m4
  
  # This is to help aclocal find these macros, as it can't see m4_define.
  AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
-Index: git/ltversion.m4
+Index: binutils-2.24/ltversion.m4
 ===================================================================
---- git.orig/ltversion.m4	2012-09-07 01:13:47.000000000 -0700
-+++ git/ltversion.m4	2012-09-07 12:21:49.650865716 -0700
+--- binutils-2.24.orig/ltversion.m4	2013-11-04 07:33:40.000000000 -0800
++++ binutils-2.24/ltversion.m4	2013-12-15 11:10:23.867118697 -0800
 @@ -7,17 +7,17 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -7094,10 +7094,10 @@ Index: git/ltversion.m4
  _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
  _LT_DECL(, macro_revision, 0)
  ])
-Index: git/lt~obsolete.m4
+Index: binutils-2.24/lt~obsolete.m4
 ===================================================================
---- git.orig/lt~obsolete.m4	2012-09-07 01:13:47.000000000 -0700
-+++ git/lt~obsolete.m4	2012-09-07 12:21:49.650865716 -0700
+--- binutils-2.24.orig/lt~obsolete.m4	2013-11-04 07:33:40.000000000 -0800
++++ binutils-2.24/lt~obsolete.m4	2013-12-15 11:10:23.867118697 -0800
 @@ -7,7 +7,7 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -7107,11 +7107,11 @@ Index: git/lt~obsolete.m4
  
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
-Index: git/configure
+Index: binutils-2.24/configure
 ===================================================================
---- git.orig/configure	2012-09-07 09:24:43.000000000 -0700
-+++ git/configure	2012-09-07 12:21:49.654865717 -0700
-@@ -7808,7 +7808,7 @@
+--- binutils-2.24.orig/configure	2013-12-15 11:09:51.000000000 -0800
++++ binutils-2.24/configure	2013-12-15 11:10:23.870452030 -0800
+@@ -7921,7 +7921,7 @@
      # For an installed makeinfo, we require it to be from texinfo 4.7 or
      # higher, else we use the "missing" dummy.
      if ${MAKEINFO} --version \
@@ -7120,11 +7120,11 @@ Index: git/configure
        :
      else
        MAKEINFO="$MISSING makeinfo"
-Index: git/bfd/configure
+Index: binutils-2.24/bfd/configure
 ===================================================================
---- git.orig/bfd/configure	2012-09-07 01:13:43.117341313 -0700
-+++ git/bfd/configure	2012-09-07 12:21:49.658865717 -0700
-@@ -667,6 +667,9 @@
+--- binutils-2.24.orig/bfd/configure	2013-12-02 01:30:30.000000000 -0800
++++ binutils-2.24/bfd/configure	2013-12-15 11:10:23.870452030 -0800
+@@ -668,6 +668,9 @@
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7134,7 +7134,7 @@ Index: git/bfd/configure
  OBJDUMP
  LN_S
  NM
-@@ -779,6 +782,7 @@
+@@ -780,6 +783,7 @@
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7142,7 +7142,7 @@ Index: git/bfd/configure
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1453,6 +1457,8 @@
+@@ -1456,6 +1460,8 @@
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7151,7 +7151,7 @@ Index: git/bfd/configure
    --with-mmap             try using mmap for BFD input files if available
    --with-separate-debug-dir=DIR
                            Look for global separate debug info in DIR
-@@ -5383,8 +5389,8 @@
+@@ -5386,8 +5392,8 @@
  
  
  
@@ -7162,7 +7162,7 @@ Index: git/bfd/configure
  
  
  
-@@ -5424,7 +5430,7 @@
+@@ -5427,7 +5433,7 @@
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7171,7 +7171,7 @@ Index: git/bfd/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6110,8 +6116,8 @@
+@@ -6113,8 +6119,8 @@
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7182,7 +7182,7 @@ Index: git/bfd/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6160,6 +6166,80 @@
+@@ -6163,6 +6169,80 @@
  
  
  
@@ -7263,7 +7263,7 @@ Index: git/bfd/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6176,6 +6256,11 @@
+@@ -6179,6 +6259,11 @@
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -7275,7 +7275,7 @@ Index: git/bfd/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6344,7 +6429,8 @@
+@@ -6347,7 +6432,8 @@
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -7285,7 +7285,7 @@ Index: git/bfd/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6498,6 +6584,21 @@
+@@ -6501,6 +6587,21 @@
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -7307,7 +7307,7 @@ Index: git/bfd/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6513,9 +6614,162 @@
+@@ -6516,9 +6617,162 @@
  
  
  
@@ -7472,7 +7472,7 @@ Index: git/bfd/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6531,7 +6785,7 @@
+@@ -6534,7 +6788,7 @@
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -7481,7 +7481,7 @@ Index: git/bfd/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6551,11 +6805,15 @@
+@@ -6554,11 +6808,15 @@
  fi
  
  
@@ -7500,7 +7500,7 @@ Index: git/bfd/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6571,7 +6829,7 @@
+@@ -6574,7 +6832,7 @@
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -7509,7 +7509,7 @@ Index: git/bfd/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6590,6 +6848,10 @@
+@@ -6593,6 +6851,10 @@
  $as_echo "no" >&6; }
  fi
  
@@ -7520,7 +7520,7 @@ Index: git/bfd/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6601,16 +6863,72 @@
+@@ -6604,16 +6866,72 @@
  esac
      AR=$ac_ct_AR
    fi
@@ -7597,7 +7597,7 @@ Index: git/bfd/configure
  
  
  
-@@ -6952,8 +7270,8 @@
+@@ -6955,8 +7273,8 @@
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -7608,7 +7608,7 @@ Index: git/bfd/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6989,6 +7307,7 @@
+@@ -6992,6 +7310,7 @@
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -7616,7 +7616,7 @@ Index: git/bfd/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7030,6 +7349,18 @@
+@@ -7033,6 +7352,18 @@
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -7635,7 +7635,7 @@ Index: git/bfd/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7041,7 +7372,7 @@
+@@ -7044,7 +7375,7 @@
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -7644,7 +7644,7 @@ Index: git/bfd/configure
    const char *name;
    void       *address;
  }
-@@ -7067,8 +7398,8 @@
+@@ -7070,8 +7401,8 @@
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -7655,7 +7655,7 @@ Index: git/bfd/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7078,8 +7409,8 @@
+@@ -7081,8 +7412,8 @@
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -7666,7 +7666,7 @@ Index: git/bfd/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7116,6 +7447,20 @@
+@@ -7119,6 +7450,20 @@
  $as_echo "ok" >&6; }
  fi
  
@@ -7687,7 +7687,7 @@ Index: git/bfd/configure
  
  
  
-@@ -7135,6 +7480,41 @@
+@@ -7138,6 +7483,41 @@
  
  
  
@@ -7729,7 +7729,7 @@ Index: git/bfd/configure
  
  
  # Check whether --enable-libtool-lock was given.
-@@ -7330,6 +7710,123 @@
+@@ -7346,6 +7726,123 @@
  
  need_locks="$enable_libtool_lock"
  
@@ -7853,7 +7853,7 @@ Index: git/bfd/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7893,6 +8390,8 @@
+@@ -7909,6 +8406,8 @@
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -7862,7 +7862,7 @@ Index: git/bfd/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8057,7 +8556,8 @@
+@@ -8073,7 +8572,8 @@
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -7872,7 +7872,7 @@ Index: git/bfd/configure
  
  
  
-@@ -8146,7 +8646,7 @@
+@@ -8162,7 +8662,7 @@
  esac
  
  # Global variables:
@@ -7881,7 +7881,7 @@ Index: git/bfd/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8444,8 +8944,6 @@
+@@ -8460,8 +8960,6 @@
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -7890,7 +7890,7 @@ Index: git/bfd/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8610,6 +9108,12 @@
+@@ -8627,6 +9125,12 @@
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -7903,7 +7903,7 @@ Index: git/bfd/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8672,7 +9176,7 @@
+@@ -8689,7 +9193,7 @@
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -7912,7 +7912,7 @@ Index: git/bfd/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8729,13 +9233,17 @@
+@@ -8746,13 +9250,17 @@
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -7936,7 +7936,7 @@ Index: git/bfd/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8796,6 +9304,11 @@
+@@ -8813,6 +9321,11 @@
  
  
  
@@ -7948,7 +7948,7 @@ Index: git/bfd/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9146,7 +9659,8 @@
+@@ -9163,7 +9676,8 @@
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -7958,7 +7958,7 @@ Index: git/bfd/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9194,7 +9708,7 @@
+@@ -9211,7 +9725,7 @@
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -7967,7 +7967,7 @@ Index: git/bfd/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -9245,12 +9759,12 @@
+@@ -9262,12 +9776,12 @@
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -7982,7 +7982,7 @@ Index: git/bfd/configure
  	  fi
  	  ;;
  	esac
-@@ -9264,8 +9778,8 @@
+@@ -9281,8 +9795,8 @@
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -7993,7 +7993,7 @@ Index: git/bfd/configure
        fi
        ;;
  
-@@ -9283,8 +9797,8 @@
+@@ -9300,8 +9814,8 @@
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8004,7 +8004,7 @@ Index: git/bfd/configure
        else
  	ld_shlibs=no
        fi
-@@ -9330,8 +9844,8 @@
+@@ -9347,8 +9861,8 @@
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8015,7 +8015,7 @@ Index: git/bfd/configure
        else
  	ld_shlibs=no
        fi
-@@ -9461,7 +9975,13 @@
+@@ -9478,7 +9992,13 @@
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8030,7 +8030,7 @@ Index: git/bfd/configure
  /* end confdefs.h.  */
  
  int
-@@ -9474,22 +9994,29 @@
+@@ -9491,22 +10011,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8073,7 +8073,7 @@ Index: git/bfd/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9501,7 +10028,13 @@
+@@ -9518,7 +10045,13 @@
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8088,7 +8088,7 @@ Index: git/bfd/configure
  /* end confdefs.h.  */
  
  int
-@@ -9514,22 +10047,29 @@
+@@ -9531,22 +10064,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8131,7 +8131,7 @@ Index: git/bfd/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9574,20 +10114,63 @@
+@@ -9591,20 +10131,63 @@
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -8209,7 +8209,7 @@ Index: git/bfd/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9648,7 +10231,7 @@
+@@ -9665,7 +10248,7 @@
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8218,7 +8218,7 @@ Index: git/bfd/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9656,7 +10239,7 @@
+@@ -9673,7 +10256,7 @@
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8227,7 +8227,7 @@ Index: git/bfd/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9672,7 +10255,7 @@
+@@ -9689,7 +10272,7 @@
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8236,7 +8236,7 @@ Index: git/bfd/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9696,10 +10279,10 @@
+@@ -9713,10 +10296,10 @@
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8249,7 +8249,7 @@ Index: git/bfd/configure
  	  ;;
  	esac
        else
-@@ -9778,23 +10361,36 @@
+@@ -9795,23 +10378,36 @@
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -8294,7 +8294,7 @@ Index: git/bfd/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9879,7 +10475,7 @@
+@@ -9896,7 +10492,7 @@
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8303,7 +8303,7 @@ Index: git/bfd/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9898,9 +10494,9 @@
+@@ -9915,9 +10511,9 @@
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -8315,7 +8315,7 @@ Index: git/bfd/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10476,8 +11072,9 @@
+@@ -10493,8 +11089,9 @@
    need_version=no
    need_lib_prefix=no
  
@@ -8327,7 +8327,7 @@ Index: git/bfd/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10510,13 +11107,71 @@
+@@ -10527,13 +11124,71 @@
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -8400,7 +8400,7 @@ Index: git/bfd/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10608,7 +11263,7 @@
+@@ -10625,7 +11280,7 @@
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -8409,16 +8409,7 @@ Index: git/bfd/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11404,7 +12059,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11407 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11448,10 +12103,10 @@
+@@ -11465,10 +12120,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8431,16 +8422,7 @@ Index: git/bfd/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11510,7 +12165,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11513 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11554,10 +12209,10 @@
+@@ -11571,10 +12226,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8453,7 +8435,7 @@ Index: git/bfd/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15056,7 +15711,7 @@
+@@ -15079,7 +15734,7 @@
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -8462,7 +8444,7 @@ Index: git/bfd/configure
    fi
  
  # More hacks to build DLLs on Windows.
-@@ -16661,13 +17316,20 @@
+@@ -16694,13 +17349,20 @@
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -8483,7 +8465,7 @@ Index: git/bfd/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16682,14 +17344,17 @@
+@@ -16715,14 +17377,17 @@
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -8502,7 +8484,7 @@ Index: git/bfd/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16722,12 +17387,12 @@
+@@ -16755,12 +17420,12 @@
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -8516,7 +8498,7 @@ Index: git/bfd/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16782,8 +17447,13 @@
+@@ -16815,8 +17480,13 @@
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -8530,7 +8512,7 @@ Index: git/bfd/configure
  STRIP \
  RANLIB \
  CC \
-@@ -16793,12 +17463,14 @@
+@@ -16826,12 +17496,14 @@
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -8546,7 +8528,7 @@ Index: git/bfd/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16814,7 +17486,6 @@
+@@ -16847,7 +17519,6 @@
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -8554,7 +8536,7 @@ Index: git/bfd/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16850,6 +17521,7 @@
+@@ -16883,6 +17554,7 @@
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -8562,7 +8544,7 @@ Index: git/bfd/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -17629,7 +18301,8 @@
+@@ -17662,7 +18334,8 @@
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -8572,7 +8554,7 @@ Index: git/bfd/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17732,19 +18405,42 @@
+@@ -17765,19 +18438,42 @@
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -8616,7 +8598,7 @@ Index: git/bfd/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17774,6 +18470,12 @@
+@@ -17807,6 +18503,12 @@
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -8629,7 +8611,7 @@ Index: git/bfd/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17783,6 +18485,9 @@
+@@ -17816,6 +18518,9 @@
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -8639,7 +8621,7 @@ Index: git/bfd/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17897,12 +18602,12 @@
+@@ -17930,12 +18635,12 @@
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -8655,7 +8637,7 @@ Index: git/bfd/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17989,9 +18694,6 @@
+@@ -18022,9 +18727,6 @@
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -8665,7 +8647,7 @@ Index: git/bfd/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18007,6 +18709,9 @@
+@@ -18040,6 +18742,9 @@
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -8675,7 +8657,7 @@ Index: git/bfd/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18039,210 +18744,169 @@
+@@ -18072,210 +18777,169 @@
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -9046,10 +9028,10 @@ Index: git/bfd/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: git/opcodes/configure
+Index: binutils-2.24/opcodes/configure
 ===================================================================
---- git.orig/opcodes/configure	2012-09-07 01:13:47.513341480 -0700
-+++ git/opcodes/configure	2012-09-07 12:22:50.350868022 -0700
+--- binutils-2.24.orig/opcodes/configure	2013-11-04 07:33:40.000000000 -0800
++++ binutils-2.24/opcodes/configure	2013-12-15 11:10:23.873785364 -0800
 @@ -648,6 +648,9 @@
  LIPO
  NMEDIT
@@ -9658,7 +9640,7 @@ Index: git/opcodes/configure
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
    enableval=$enable_libtool_lock;
-@@ -7060,6 +7440,123 @@
+@@ -7073,6 +7453,123 @@
  
  need_locks="$enable_libtool_lock"
  
@@ -9782,7 +9764,7 @@ Index: git/opcodes/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7623,6 +8120,8 @@
+@@ -7636,6 +8133,8 @@
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -9791,7 +9773,7 @@ Index: git/opcodes/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7788,7 +8287,8 @@
+@@ -7801,7 +8300,8 @@
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -9801,7 +9783,7 @@ Index: git/opcodes/configure
  
  
  
-@@ -7877,7 +8377,7 @@
+@@ -7890,7 +8390,7 @@
  esac
  
  # Global variables:
@@ -9810,7 +9792,7 @@ Index: git/opcodes/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8175,8 +8675,6 @@
+@@ -8188,8 +8688,6 @@
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -9819,7 +9801,7 @@ Index: git/opcodes/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8341,6 +8839,12 @@
+@@ -8355,6 +8853,12 @@
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -9832,7 +9814,7 @@ Index: git/opcodes/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8403,7 +8907,7 @@
+@@ -8417,7 +8921,7 @@
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -9841,7 +9823,7 @@ Index: git/opcodes/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8460,13 +8964,17 @@
+@@ -8474,13 +8978,17 @@
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -9865,7 +9847,7 @@ Index: git/opcodes/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8527,6 +9035,11 @@
+@@ -8541,6 +9049,11 @@
  
  
  
@@ -9877,7 +9859,7 @@ Index: git/opcodes/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8877,7 +9390,8 @@
+@@ -8891,7 +9404,8 @@
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -9887,7 +9869,7 @@ Index: git/opcodes/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8925,7 +9439,7 @@
+@@ -8939,7 +9453,7 @@
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -9896,7 +9878,7 @@ Index: git/opcodes/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -8976,12 +9490,12 @@
+@@ -8990,12 +9504,12 @@
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -9911,7 +9893,7 @@ Index: git/opcodes/configure
  	  fi
  	  ;;
  	esac
-@@ -8995,8 +9509,8 @@
+@@ -9009,8 +9523,8 @@
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -9922,7 +9904,7 @@ Index: git/opcodes/configure
        fi
        ;;
  
-@@ -9014,8 +9528,8 @@
+@@ -9028,8 +9542,8 @@
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -9933,7 +9915,7 @@ Index: git/opcodes/configure
        else
  	ld_shlibs=no
        fi
-@@ -9061,8 +9575,8 @@
+@@ -9075,8 +9589,8 @@
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -9944,7 +9926,7 @@ Index: git/opcodes/configure
        else
  	ld_shlibs=no
        fi
-@@ -9192,7 +9706,13 @@
+@@ -9206,7 +9720,13 @@
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -9959,7 +9941,7 @@ Index: git/opcodes/configure
  /* end confdefs.h.  */
  
  int
-@@ -9205,22 +9725,29 @@
+@@ -9219,22 +9739,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -10002,7 +9984,7 @@ Index: git/opcodes/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9232,7 +9759,13 @@
+@@ -9246,7 +9773,13 @@
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -10017,7 +9999,7 @@ Index: git/opcodes/configure
  /* end confdefs.h.  */
  
  int
-@@ -9245,22 +9778,29 @@
+@@ -9259,22 +9792,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -10060,7 +10042,7 @@ Index: git/opcodes/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9305,20 +9845,63 @@
+@@ -9319,20 +9859,63 @@
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -10138,7 +10120,7 @@ Index: git/opcodes/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9379,7 +9962,7 @@
+@@ -9393,7 +9976,7 @@
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -10147,7 +10129,7 @@ Index: git/opcodes/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9387,7 +9970,7 @@
+@@ -9401,7 +9984,7 @@
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -10156,7 +10138,7 @@ Index: git/opcodes/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9403,7 +9986,7 @@
+@@ -9417,7 +10000,7 @@
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -10165,7 +10147,7 @@ Index: git/opcodes/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9427,10 +10010,10 @@
+@@ -9441,10 +10024,10 @@
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -10178,7 +10160,7 @@ Index: git/opcodes/configure
  	  ;;
  	esac
        else
-@@ -9509,23 +10092,36 @@
+@@ -9523,23 +10106,36 @@
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -10223,7 +10205,7 @@ Index: git/opcodes/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9610,7 +10206,7 @@
+@@ -9624,7 +10220,7 @@
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -10232,7 +10214,7 @@ Index: git/opcodes/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9629,9 +10225,9 @@
+@@ -9643,9 +10239,9 @@
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -10244,7 +10226,7 @@ Index: git/opcodes/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10207,8 +10803,9 @@
+@@ -10221,8 +10817,9 @@
    need_version=no
    need_lib_prefix=no
  
@@ -10256,7 +10238,7 @@ Index: git/opcodes/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10241,13 +10838,71 @@
+@@ -10255,13 +10852,71 @@
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -10329,7 +10311,7 @@ Index: git/opcodes/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10339,7 +10994,7 @@
+@@ -10353,7 +11008,7 @@
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -10338,16 +10320,7 @@ Index: git/opcodes/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11135,7 +11790,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11138 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11179,10 +11834,10 @@
+@@ -11193,10 +11848,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -10360,16 +10333,7 @@ Index: git/opcodes/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11241,7 +11896,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11244 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11285,10 +11940,10 @@
+@@ -11299,10 +11954,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -10382,7 +10346,7 @@ Index: git/opcodes/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12401,7 +13056,7 @@
+@@ -12415,7 +13070,7 @@
  # since libbfd may not pull in the entirety of libiberty.
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -10391,7 +10355,7 @@ Index: git/opcodes/configure
    fi
  
    case "${host}" in
-@@ -13370,13 +14025,20 @@
+@@ -13387,13 +14042,20 @@
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -10412,7 +10376,7 @@ Index: git/opcodes/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13391,14 +14053,17 @@
+@@ -13408,14 +14070,17 @@
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -10431,7 +10395,7 @@ Index: git/opcodes/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13431,12 +14096,12 @@
+@@ -13448,12 +14113,12 @@
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -10445,7 +10409,7 @@ Index: git/opcodes/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13491,8 +14156,13 @@
+@@ -13508,8 +14173,13 @@
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -10459,7 +10423,7 @@ Index: git/opcodes/configure
  STRIP \
  RANLIB \
  CC \
-@@ -13502,12 +14172,14 @@
+@@ -13519,12 +14189,14 @@
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -10475,7 +10439,7 @@ Index: git/opcodes/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13523,7 +14195,6 @@
+@@ -13540,7 +14212,6 @@
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -10483,7 +10447,7 @@ Index: git/opcodes/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13559,6 +14230,7 @@
+@@ -13576,6 +14247,7 @@
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -10491,7 +10455,7 @@ Index: git/opcodes/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14315,7 +14987,8 @@
+@@ -14332,7 +15004,8 @@
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -10501,7 +10465,7 @@ Index: git/opcodes/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14418,19 +15091,42 @@
+@@ -14435,19 +15108,42 @@
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -10545,7 +10509,7 @@ Index: git/opcodes/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14460,6 +15156,12 @@
+@@ -14477,6 +15173,12 @@
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -10558,7 +10522,7 @@ Index: git/opcodes/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14469,6 +15171,9 @@
+@@ -14486,6 +15188,9 @@
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -10568,7 +10532,7 @@ Index: git/opcodes/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14583,12 +15288,12 @@
+@@ -14600,12 +15305,12 @@
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -10584,7 +10548,7 @@ Index: git/opcodes/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14675,9 +15380,6 @@
+@@ -14692,9 +15397,6 @@
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -10594,7 +10558,7 @@ Index: git/opcodes/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14693,6 +15395,9 @@
+@@ -14710,6 +15412,9 @@
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -10604,7 +10568,7 @@ Index: git/opcodes/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14725,210 +15430,169 @@
+@@ -14742,210 +15447,169 @@
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10975,10 +10939,10 @@ Index: git/opcodes/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: git/binutils/configure
+Index: binutils-2.24/binutils/configure
 ===================================================================
---- git.orig/binutils/configure	2012-09-07 01:13:43.349341321 -0700
-+++ git/binutils/configure	2012-09-07 12:21:49.670865713 -0700
+--- binutils-2.24.orig/binutils/configure	2013-11-04 07:33:37.000000000 -0800
++++ binutils-2.24/binutils/configure	2013-12-15 11:10:23.877118697 -0800
 @@ -655,8 +655,11 @@
  LIPO
  NMEDIT
@@ -11589,7 +11553,7 @@ Index: git/binutils/configure
  
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
-@@ -7099,6 +7479,123 @@
+@@ -7112,6 +7492,123 @@
  
  need_locks="$enable_libtool_lock"
  
@@ -11713,7 +11677,7 @@ Index: git/binutils/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7662,6 +8159,8 @@
+@@ -7675,6 +8172,8 @@
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -11722,7 +11686,7 @@ Index: git/binutils/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7857,7 +8356,8 @@
+@@ -7870,7 +8369,8 @@
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -11732,7 +11696,7 @@ Index: git/binutils/configure
  
  
  
-@@ -7946,7 +8446,7 @@
+@@ -7959,7 +8459,7 @@
  esac
  
  # Global variables:
@@ -11741,7 +11705,7 @@ Index: git/binutils/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8244,8 +8744,6 @@
+@@ -8257,8 +8757,6 @@
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -11750,7 +11714,7 @@ Index: git/binutils/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8410,6 +8908,12 @@
+@@ -8424,6 +8922,12 @@
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -11763,7 +11727,7 @@ Index: git/binutils/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8472,7 +8976,7 @@
+@@ -8486,7 +8990,7 @@
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -11772,7 +11736,7 @@ Index: git/binutils/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8529,13 +9033,17 @@
+@@ -8543,13 +9047,17 @@
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -11796,7 +11760,7 @@ Index: git/binutils/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8596,6 +9104,11 @@
+@@ -8610,6 +9118,11 @@
  
  
  
@@ -11808,7 +11772,7 @@ Index: git/binutils/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8946,7 +9459,8 @@
+@@ -8960,7 +9473,8 @@
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -11818,7 +11782,7 @@ Index: git/binutils/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8994,7 +9508,7 @@
+@@ -9008,7 +9522,7 @@
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -11827,7 +11791,7 @@ Index: git/binutils/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -9045,12 +9559,12 @@
+@@ -9059,12 +9573,12 @@
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -11842,7 +11806,7 @@ Index: git/binutils/configure
  	  fi
  	  ;;
  	esac
-@@ -9064,8 +9578,8 @@
+@@ -9078,8 +9592,8 @@
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -11853,7 +11817,7 @@ Index: git/binutils/configure
        fi
        ;;
  
-@@ -9083,8 +9597,8 @@
+@@ -9097,8 +9611,8 @@
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -11864,7 +11828,7 @@ Index: git/binutils/configure
        else
  	ld_shlibs=no
        fi
-@@ -9130,8 +9644,8 @@
+@@ -9144,8 +9658,8 @@
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -11875,7 +11839,7 @@ Index: git/binutils/configure
        else
  	ld_shlibs=no
        fi
-@@ -9261,7 +9775,13 @@
+@@ -9275,7 +9789,13 @@
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -11890,7 +11854,7 @@ Index: git/binutils/configure
  /* end confdefs.h.  */
  
  int
-@@ -9274,22 +9794,29 @@
+@@ -9288,22 +9808,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -11933,7 +11897,7 @@ Index: git/binutils/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9301,7 +9828,13 @@
+@@ -9315,7 +9842,13 @@
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -11948,7 +11912,7 @@ Index: git/binutils/configure
  /* end confdefs.h.  */
  
  int
-@@ -9314,22 +9847,29 @@
+@@ -9328,22 +9861,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -11991,7 +11955,7 @@ Index: git/binutils/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9374,20 +9914,63 @@
+@@ -9388,20 +9928,63 @@
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -12069,7 +12033,7 @@ Index: git/binutils/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9448,7 +10031,7 @@
+@@ -9462,7 +10045,7 @@
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -12078,7 +12042,7 @@ Index: git/binutils/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9456,7 +10039,7 @@
+@@ -9470,7 +10053,7 @@
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -12087,7 +12051,7 @@ Index: git/binutils/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9472,7 +10055,7 @@
+@@ -9486,7 +10069,7 @@
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -12096,7 +12060,7 @@ Index: git/binutils/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9496,10 +10079,10 @@
+@@ -9510,10 +10093,10 @@
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -12109,7 +12073,7 @@ Index: git/binutils/configure
  	  ;;
  	esac
        else
-@@ -9578,23 +10161,36 @@
+@@ -9592,23 +10175,36 @@
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -12154,7 +12118,7 @@ Index: git/binutils/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9679,7 +10275,7 @@
+@@ -9693,7 +10289,7 @@
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -12163,7 +12127,7 @@ Index: git/binutils/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9698,9 +10294,9 @@
+@@ -9712,9 +10308,9 @@
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -12175,7 +12139,7 @@ Index: git/binutils/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10276,8 +10872,9 @@
+@@ -10290,8 +10886,9 @@
    need_version=no
    need_lib_prefix=no
  
@@ -12187,7 +12151,7 @@ Index: git/binutils/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10310,13 +10907,71 @@
+@@ -10324,13 +10921,71 @@
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -12260,7 +12224,7 @@ Index: git/binutils/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10408,7 +11063,7 @@
+@@ -10422,7 +11077,7 @@
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -12269,16 +12233,7 @@ Index: git/binutils/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11204,7 +11859,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11207 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11248,10 +11903,10 @@
+@@ -11262,10 +11917,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -12291,16 +12246,7 @@ Index: git/binutils/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11310,7 +11965,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11313 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11354,10 +12009,10 @@
+@@ -11368,10 +12023,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -12313,7 +12259,7 @@ Index: git/binutils/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14898,13 +15553,20 @@
+@@ -14948,13 +15603,20 @@
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -12334,7 +12280,7 @@ Index: git/binutils/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -14919,14 +15581,17 @@
+@@ -14969,14 +15631,17 @@
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -12353,7 +12299,7 @@ Index: git/binutils/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -14959,12 +15624,12 @@
+@@ -15009,12 +15674,12 @@
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -12367,7 +12313,7 @@ Index: git/binutils/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15019,8 +15684,13 @@
+@@ -15069,8 +15734,13 @@
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -12381,7 +12327,7 @@ Index: git/binutils/configure
  STRIP \
  RANLIB \
  CC \
-@@ -15030,12 +15700,14 @@
+@@ -15080,12 +15750,14 @@
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -12397,7 +12343,7 @@ Index: git/binutils/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15051,7 +15723,6 @@
+@@ -15101,7 +15773,6 @@
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -12405,7 +12351,7 @@ Index: git/binutils/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15087,6 +15758,7 @@
+@@ -15137,6 +15808,7 @@
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -12413,7 +12359,7 @@ Index: git/binutils/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -15844,7 +16516,8 @@
+@@ -15894,7 +16566,8 @@
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -12423,7 +12369,7 @@ Index: git/binutils/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -15947,19 +16620,42 @@
+@@ -15997,19 +16670,42 @@
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -12467,7 +12413,7 @@ Index: git/binutils/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -15989,6 +16685,12 @@
+@@ -16039,6 +16735,12 @@
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -12480,7 +12426,7 @@ Index: git/binutils/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -15998,6 +16700,9 @@
+@@ -16048,6 +16750,9 @@
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -12490,7 +12436,7 @@ Index: git/binutils/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16112,12 +16817,12 @@
+@@ -16162,12 +16867,12 @@
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -12506,7 +12452,7 @@ Index: git/binutils/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16204,9 +16909,6 @@
+@@ -16254,9 +16959,6 @@
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -12516,7 +12462,7 @@ Index: git/binutils/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16222,6 +16924,9 @@
+@@ -16272,6 +16974,9 @@
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -12526,7 +12472,7 @@ Index: git/binutils/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16254,210 +16959,169 @@
+@@ -16304,210 +17009,169 @@
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -12897,10 +12843,10 @@ Index: git/binutils/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: git/gas/configure
+Index: binutils-2.24/gas/configure
 ===================================================================
---- git.orig/gas/configure	2012-09-07 01:13:43.721341336 -0700
-+++ git/gas/configure	2012-09-07 12:21:49.678865715 -0700
+--- binutils-2.24.orig/gas/configure	2013-11-04 07:33:37.000000000 -0800
++++ binutils-2.24/gas/configure	2013-12-15 11:10:23.880452030 -0800
 @@ -645,8 +645,11 @@
  LIPO
  NMEDIT
@@ -13508,7 +13454,7 @@ Index: git/gas/configure
  
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
-@@ -7082,6 +7462,123 @@
+@@ -7095,6 +7475,123 @@
  
  need_locks="$enable_libtool_lock"
  
@@ -13632,7 +13578,7 @@ Index: git/gas/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7645,6 +8142,8 @@
+@@ -7658,6 +8155,8 @@
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -13641,7 +13587,7 @@ Index: git/gas/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7840,7 +8339,8 @@
+@@ -7853,7 +8352,8 @@
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -13651,7 +13597,7 @@ Index: git/gas/configure
  
  
  
-@@ -7929,7 +8429,7 @@
+@@ -7942,7 +8442,7 @@
  esac
  
  # Global variables:
@@ -13660,7 +13606,7 @@ Index: git/gas/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8227,8 +8727,6 @@
+@@ -8240,8 +8740,6 @@
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -13669,7 +13615,7 @@ Index: git/gas/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8393,6 +8891,12 @@
+@@ -8407,6 +8905,12 @@
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -13682,7 +13628,7 @@ Index: git/gas/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8455,7 +8959,7 @@
+@@ -8469,7 +8973,7 @@
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -13691,7 +13637,7 @@ Index: git/gas/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8512,13 +9016,17 @@
+@@ -8526,13 +9030,17 @@
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -13715,7 +13661,7 @@ Index: git/gas/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8579,6 +9087,11 @@
+@@ -8593,6 +9101,11 @@
  
  
  
@@ -13727,7 +13673,7 @@ Index: git/gas/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8929,7 +9442,8 @@
+@@ -8943,7 +9456,8 @@
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -13737,7 +13683,7 @@ Index: git/gas/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8977,7 +9491,7 @@
+@@ -8991,7 +9505,7 @@
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -13746,7 +13692,7 @@ Index: git/gas/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -9028,12 +9542,12 @@
+@@ -9042,12 +9556,12 @@
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -13761,7 +13707,7 @@ Index: git/gas/configure
  	  fi
  	  ;;
  	esac
-@@ -9047,8 +9561,8 @@
+@@ -9061,8 +9575,8 @@
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -13772,7 +13718,7 @@ Index: git/gas/configure
        fi
        ;;
  
-@@ -9066,8 +9580,8 @@
+@@ -9080,8 +9594,8 @@
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -13783,7 +13729,7 @@ Index: git/gas/configure
        else
  	ld_shlibs=no
        fi
-@@ -9113,8 +9627,8 @@
+@@ -9127,8 +9641,8 @@
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -13794,7 +13740,7 @@ Index: git/gas/configure
        else
  	ld_shlibs=no
        fi
-@@ -9244,7 +9758,13 @@
+@@ -9258,7 +9772,13 @@
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -13809,7 +13755,7 @@ Index: git/gas/configure
  /* end confdefs.h.  */
  
  int
-@@ -9257,22 +9777,29 @@
+@@ -9271,22 +9791,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -13852,7 +13798,7 @@ Index: git/gas/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9284,7 +9811,13 @@
+@@ -9298,7 +9825,13 @@
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -13867,7 +13813,7 @@ Index: git/gas/configure
  /* end confdefs.h.  */
  
  int
-@@ -9297,22 +9830,29 @@
+@@ -9311,22 +9844,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -13910,7 +13856,7 @@ Index: git/gas/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9357,20 +9897,63 @@
+@@ -9371,20 +9911,63 @@
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -13988,7 +13934,7 @@ Index: git/gas/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9431,7 +10014,7 @@
+@@ -9445,7 +10028,7 @@
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -13997,7 +13943,7 @@ Index: git/gas/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9439,7 +10022,7 @@
+@@ -9453,7 +10036,7 @@
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -14006,7 +13952,7 @@ Index: git/gas/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9455,7 +10038,7 @@
+@@ -9469,7 +10052,7 @@
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -14015,7 +13961,7 @@ Index: git/gas/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9479,10 +10062,10 @@
+@@ -9493,10 +10076,10 @@
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -14028,7 +13974,7 @@ Index: git/gas/configure
  	  ;;
  	esac
        else
-@@ -9561,23 +10144,36 @@
+@@ -9575,23 +10158,36 @@
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -14073,7 +14019,7 @@ Index: git/gas/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9662,7 +10258,7 @@
+@@ -9676,7 +10272,7 @@
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -14082,7 +14028,7 @@ Index: git/gas/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9681,9 +10277,9 @@
+@@ -9695,9 +10291,9 @@
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -14094,7 +14040,7 @@ Index: git/gas/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10259,8 +10855,9 @@
+@@ -10273,8 +10869,9 @@
    need_version=no
    need_lib_prefix=no
  
@@ -14106,7 +14052,7 @@ Index: git/gas/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10293,13 +10890,71 @@
+@@ -10307,13 +10904,71 @@
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -14179,7 +14125,7 @@ Index: git/gas/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10391,7 +11046,7 @@
+@@ -10405,7 +11060,7 @@
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -14188,16 +14134,7 @@ Index: git/gas/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11187,7 +11842,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11190 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11231,10 +11886,10 @@
+@@ -11245,10 +11900,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14210,16 +14147,7 @@ Index: git/gas/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11293,7 +11948,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11296 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11337,10 +11992,10 @@
+@@ -11351,10 +12006,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14232,7 +14160,7 @@ Index: git/gas/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15074,13 +15729,20 @@
+@@ -15064,13 +15719,20 @@
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -14253,7 +14181,7 @@ Index: git/gas/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15095,14 +15757,17 @@
+@@ -15085,14 +15747,17 @@
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -14272,7 +14200,7 @@ Index: git/gas/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15135,12 +15800,12 @@
+@@ -15125,12 +15790,12 @@
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -14286,7 +14214,7 @@ Index: git/gas/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15195,8 +15860,13 @@
+@@ -15185,8 +15850,13 @@
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -14300,7 +14228,7 @@ Index: git/gas/configure
  STRIP \
  RANLIB \
  CC \
-@@ -15206,12 +15876,14 @@
+@@ -15196,12 +15866,14 @@
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -14316,7 +14244,7 @@ Index: git/gas/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15227,7 +15899,6 @@
+@@ -15217,7 +15889,6 @@
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -14324,7 +14252,7 @@ Index: git/gas/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15263,6 +15934,7 @@
+@@ -15253,6 +15924,7 @@
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -14332,7 +14260,7 @@ Index: git/gas/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16027,7 +16699,8 @@
+@@ -16017,7 +16689,8 @@
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -14342,7 +14270,7 @@ Index: git/gas/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16130,19 +16803,42 @@
+@@ -16120,19 +16793,42 @@
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -14386,7 +14314,7 @@ Index: git/gas/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16172,6 +16868,12 @@
+@@ -16162,6 +16858,12 @@
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -14399,7 +14327,7 @@ Index: git/gas/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16181,6 +16883,9 @@
+@@ -16171,6 +16873,9 @@
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -14409,7 +14337,7 @@ Index: git/gas/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16295,12 +17000,12 @@
+@@ -16285,12 +16990,12 @@
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -14425,7 +14353,7 @@ Index: git/gas/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16387,9 +17092,6 @@
+@@ -16377,9 +17082,6 @@
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -14435,7 +14363,7 @@ Index: git/gas/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16405,6 +17107,9 @@
+@@ -16395,6 +17097,9 @@
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -14445,7 +14373,7 @@ Index: git/gas/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16437,210 +17142,169 @@
+@@ -16427,210 +17132,169 @@
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -14816,10 +14744,10 @@ Index: git/gas/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: git/gprof/configure
+Index: binutils-2.24/gprof/configure
 ===================================================================
---- git.orig/gprof/configure	2012-09-07 09:24:43.382461620 -0700
-+++ git/gprof/configure	2012-09-07 12:21:49.682865716 -0700
+--- binutils-2.24.orig/gprof/configure	2013-12-15 11:09:51.443785606 -0800
++++ binutils-2.24/gprof/configure	2013-12-15 11:10:23.880452030 -0800
 @@ -629,8 +629,11 @@
  LIPO
  NMEDIT
@@ -15439,7 +15367,7 @@ Index: git/gprof/configure
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
    enableval=$enable_libtool_lock;
-@@ -7017,6 +7392,123 @@
+@@ -7030,6 +7405,123 @@
  
  need_locks="$enable_libtool_lock"
  
@@ -15563,7 +15491,7 @@ Index: git/gprof/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7580,6 +8072,8 @@
+@@ -7593,6 +8085,8 @@
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -15572,7 +15500,7 @@ Index: git/gprof/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7775,7 +8269,8 @@
+@@ -7788,7 +8282,8 @@
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -15582,7 +15510,7 @@ Index: git/gprof/configure
  
  
  
-@@ -7864,7 +8359,7 @@
+@@ -7877,7 +8372,7 @@
  esac
  
  # Global variables:
@@ -15591,7 +15519,7 @@ Index: git/gprof/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8162,8 +8657,6 @@
+@@ -8175,8 +8670,6 @@
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -15600,7 +15528,7 @@ Index: git/gprof/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8328,6 +8821,12 @@
+@@ -8342,6 +8835,12 @@
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -15613,7 +15541,7 @@ Index: git/gprof/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8390,7 +8889,7 @@
+@@ -8404,7 +8903,7 @@
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -15622,7 +15550,7 @@ Index: git/gprof/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8447,13 +8946,17 @@
+@@ -8461,13 +8960,17 @@
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -15646,7 +15574,7 @@ Index: git/gprof/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8514,6 +9017,11 @@
+@@ -8528,6 +9031,11 @@
  
  
  
@@ -15658,7 +15586,7 @@ Index: git/gprof/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8864,7 +9372,8 @@
+@@ -8878,7 +9386,8 @@
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -15668,7 +15596,7 @@ Index: git/gprof/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8912,7 +9421,7 @@
+@@ -8926,7 +9435,7 @@
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -15677,7 +15605,7 @@ Index: git/gprof/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -8963,12 +9472,12 @@
+@@ -8977,12 +9486,12 @@
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -15692,7 +15620,7 @@ Index: git/gprof/configure
  	  fi
  	  ;;
  	esac
-@@ -8982,8 +9491,8 @@
+@@ -8996,8 +9505,8 @@
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -15703,7 +15631,7 @@ Index: git/gprof/configure
        fi
        ;;
  
-@@ -9001,8 +9510,8 @@
+@@ -9015,8 +9524,8 @@
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -15714,7 +15642,7 @@ Index: git/gprof/configure
        else
  	ld_shlibs=no
        fi
-@@ -9048,8 +9557,8 @@
+@@ -9062,8 +9571,8 @@
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -15725,7 +15653,7 @@ Index: git/gprof/configure
        else
  	ld_shlibs=no
        fi
-@@ -9179,7 +9688,13 @@
+@@ -9193,7 +9702,13 @@
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -15740,7 +15668,7 @@ Index: git/gprof/configure
  /* end confdefs.h.  */
  
  int
-@@ -9192,22 +9707,29 @@
+@@ -9206,22 +9721,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -15783,7 +15711,7 @@ Index: git/gprof/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9219,7 +9741,13 @@
+@@ -9233,7 +9755,13 @@
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -15798,7 +15726,7 @@ Index: git/gprof/configure
  /* end confdefs.h.  */
  
  int
-@@ -9232,22 +9760,29 @@
+@@ -9246,22 +9774,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -15841,7 +15769,7 @@ Index: git/gprof/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9292,20 +9827,63 @@
+@@ -9306,20 +9841,63 @@
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -15919,7 +15847,7 @@ Index: git/gprof/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9366,7 +9944,7 @@
+@@ -9380,7 +9958,7 @@
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -15928,7 +15856,7 @@ Index: git/gprof/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9374,7 +9952,7 @@
+@@ -9388,7 +9966,7 @@
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -15937,7 +15865,7 @@ Index: git/gprof/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9390,7 +9968,7 @@
+@@ -9404,7 +9982,7 @@
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -15946,7 +15874,7 @@ Index: git/gprof/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9414,10 +9992,10 @@
+@@ -9428,10 +10006,10 @@
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -15959,7 +15887,7 @@ Index: git/gprof/configure
  	  ;;
  	esac
        else
-@@ -9496,23 +10074,36 @@
+@@ -9510,23 +10088,36 @@
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -16004,7 +15932,7 @@ Index: git/gprof/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9597,7 +10188,7 @@
+@@ -9611,7 +10202,7 @@
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -16013,7 +15941,7 @@ Index: git/gprof/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9616,9 +10207,9 @@
+@@ -9630,9 +10221,9 @@
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -16025,7 +15953,7 @@ Index: git/gprof/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10194,8 +10785,9 @@
+@@ -10208,8 +10799,9 @@
    need_version=no
    need_lib_prefix=no
  
@@ -16037,7 +15965,7 @@ Index: git/gprof/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10228,13 +10820,71 @@
+@@ -10242,13 +10834,71 @@
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -16110,7 +16038,7 @@ Index: git/gprof/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10326,7 +10976,7 @@
+@@ -10340,7 +10990,7 @@
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -16119,16 +16047,7 @@ Index: git/gprof/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11122,7 +11772,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11120 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11166,10 +11816,10 @@
+@@ -11180,10 +11830,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -16141,16 +16060,7 @@ Index: git/gprof/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11228,7 +11878,7 @@
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11226 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
-@@ -11272,10 +11922,10 @@
+@@ -11286,10 +11936,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -16163,7 +16073,7 @@ Index: git/gprof/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12817,13 +13467,20 @@
+@@ -12831,13 +13481,20 @@
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -16184,7 +16094,7 @@ Index: git/gprof/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12838,14 +13495,17 @@
+@@ -12852,14 +13509,17 @@
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -16203,7 +16113,7 @@ Index: git/gprof/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12878,12 +13538,12 @@
+@@ -12892,12 +13552,12 @@
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -16217,7 +16127,7 @@ Index: git/gprof/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -12938,8 +13598,13 @@
+@@ -12952,8 +13612,13 @@
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -16231,7 +16141,7 @@ Index: git/gprof/configure
  STRIP \
  RANLIB \
  CC \
-@@ -12949,12 +13614,14 @@
+@@ -12963,12 +13628,14 @@
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -16247,7 +16157,7 @@ Index: git/gprof/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -12970,7 +13637,6 @@
+@@ -12984,7 +13651,6 @@
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -16255,7 +16165,7 @@ Index: git/gprof/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13006,6 +13672,7 @@
+@@ -13020,6 +13686,7 @@
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -16263,7 +16173,7 @@ Index: git/gprof/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -13762,7 +14429,8 @@
+@@ -13776,7 +14443,8 @@
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -16273,7 +16183,7 @@ Index: git/gprof/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -13865,19 +14533,42 @@
+@@ -13879,19 +14547,42 @@
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -16317,7 +16227,7 @@ Index: git/gprof/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -13907,6 +14598,12 @@
+@@ -13921,6 +14612,12 @@
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -16330,7 +16240,7 @@ Index: git/gprof/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -13916,6 +14613,9 @@
+@@ -13930,6 +14627,9 @@
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -16340,7 +16250,7 @@ Index: git/gprof/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14030,12 +14730,12 @@
+@@ -14044,12 +14744,12 @@
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -16356,7 +16266,7 @@ Index: git/gprof/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14122,9 +14822,6 @@
+@@ -14136,9 +14836,6 @@
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -16366,7 +16276,7 @@ Index: git/gprof/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14140,6 +14837,9 @@
+@@ -14154,6 +14851,9 @@
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -16376,7 +16286,7 @@ Index: git/gprof/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14172,210 +14872,169 @@
+@@ -14186,210 +14886,169 @@
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -16747,11 +16657,11 @@ Index: git/gprof/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: git/ld/configure
+Index: binutils-2.24/ld/configure
 ===================================================================
---- git.orig/ld/configure	2012-09-07 01:13:46.789341452 -0700
-+++ git/ld/configure	2012-09-07 12:21:49.686865716 -0700
-@@ -645,8 +645,11 @@
+--- binutils-2.24.orig/ld/configure	2013-11-04 07:33:39.000000000 -0800
++++ binutils-2.24/ld/configure	2013-12-15 11:12:06.120451266 -0800
+@@ -646,8 +646,11 @@
  LIPO
  NMEDIT
  DSYMUTIL
@@ -16763,7 +16673,7 @@ Index: git/ld/configure
  OBJDUMP
  LN_S
  NM
-@@ -784,6 +787,7 @@
+@@ -785,6 +788,7 @@
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -16771,7 +16681,7 @@ Index: git/ld/configure
  enable_libtool_lock
  enable_nls
  enable_initfini_array
-@@ -1451,6 +1455,8 @@
+@@ -1452,6 +1456,8 @@
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -16780,7 +16690,7 @@ Index: git/ld/configure
    --with-zlib             include zlib support (auto/yes/no) default=auto
  
  Some influential environment variables:
-@@ -6124,8 +6130,8 @@
+@@ -6125,8 +6131,8 @@
  
  
  
@@ -16791,7 +16701,7 @@ Index: git/ld/configure
  
  
  
-@@ -6165,7 +6171,7 @@
+@@ -6166,7 +6172,7 @@
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -16800,7 +16710,7 @@ Index: git/ld/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6851,8 +6857,8 @@
+@@ -6852,8 +6858,8 @@
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -16811,7 +16721,7 @@ Index: git/ld/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6901,6 +6907,80 @@
+@@ -6902,6 +6908,80 @@
  
  
  
@@ -16892,7 +16802,7 @@ Index: git/ld/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6917,6 +6997,11 @@
+@@ -6918,6 +6998,11 @@
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -16904,7 +16814,7 @@ Index: git/ld/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -7085,7 +7170,8 @@
+@@ -7086,7 +7171,8 @@
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -16914,7 +16824,7 @@ Index: git/ld/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -7239,6 +7325,21 @@
+@@ -7240,6 +7326,21 @@
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -16936,7 +16846,7 @@ Index: git/ld/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7254,9 +7355,162 @@
+@@ -7255,9 +7356,162 @@
  
  
  
@@ -17101,7 +17011,7 @@ Index: git/ld/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -7272,7 +7526,7 @@
+@@ -7273,7 +7527,7 @@
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -17110,7 +17020,7 @@ Index: git/ld/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7292,11 +7546,15 @@
+@@ -7293,11 +7547,15 @@
  fi
  
  
@@ -17129,7 +17039,7 @@ Index: git/ld/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -7312,7 +7570,7 @@
+@@ -7313,7 +7571,7 @@
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -17138,7 +17048,7 @@ Index: git/ld/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7331,6 +7589,10 @@
+@@ -7332,6 +7590,10 @@
  $as_echo "no" >&6; }
  fi
  
@@ -17149,7 +17059,7 @@ Index: git/ld/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7342,12 +7604,10 @@
+@@ -7343,12 +7605,10 @@
  esac
      AR=$ac_ct_AR
    fi
@@ -17164,7 +17074,7 @@ Index: git/ld/configure
  
  
  
-@@ -7359,6 +7619,64 @@
+@@ -7360,6 +7620,64 @@
  
  
  
@@ -17229,7 +17139,7 @@ Index: git/ld/configure
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -7693,8 +8011,8 @@
+@@ -7694,8 +8012,8 @@
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -17240,7 +17150,7 @@ Index: git/ld/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7730,6 +8048,7 @@
+@@ -7731,6 +8049,7 @@
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -17248,7 +17158,7 @@ Index: git/ld/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7771,6 +8090,18 @@
+@@ -7772,6 +8091,18 @@
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -17267,7 +17177,7 @@ Index: git/ld/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7782,7 +8113,7 @@
+@@ -7783,7 +8114,7 @@
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -17276,7 +17186,7 @@ Index: git/ld/configure
    const char *name;
    void       *address;
  }
-@@ -7808,8 +8139,8 @@
+@@ -7809,8 +8140,8 @@
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -17287,7 +17197,7 @@ Index: git/ld/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7819,8 +8150,8 @@
+@@ -7820,8 +8151,8 @@
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -17298,7 +17208,7 @@ Index: git/ld/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7857,6 +8188,23 @@
+@@ -7858,6 +8189,23 @@
  $as_echo "ok" >&6; }
  fi
  
@@ -17322,7 +17232,7 @@ Index: git/ld/configure
  
  
  
-@@ -7873,6 +8221,38 @@
+@@ -7874,6 +8222,38 @@
  
  
  
@@ -17361,7 +17271,7 @@ Index: git/ld/configure
  
  
  
-@@ -8071,6 +8451,123 @@
+@@ -8085,6 +8465,123 @@
  
  need_locks="$enable_libtool_lock"
  
@@ -17485,7 +17395,7 @@ Index: git/ld/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8634,6 +9131,8 @@
+@@ -8648,6 +9145,8 @@
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -17494,7 +17404,7 @@ Index: git/ld/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8702,6 +9201,16 @@
+@@ -8716,6 +9215,16 @@
  
  
  
@@ -17511,7 +17421,7 @@ Index: git/ld/configure
  
  
  # Set options
-@@ -8830,7 +9339,8 @@
+@@ -8844,7 +9353,8 @@
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -17521,7 +17431,7 @@ Index: git/ld/configure
  
  
  
-@@ -8919,7 +9429,7 @@
+@@ -8933,7 +9443,7 @@
  esac
  
  # Global variables:
@@ -17530,7 +17440,7 @@ Index: git/ld/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -9217,8 +9727,6 @@
+@@ -9231,8 +9741,6 @@
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -17539,7 +17449,7 @@ Index: git/ld/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9383,6 +9891,12 @@
+@@ -9398,6 +9906,12 @@
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -17552,7 +17462,7 @@ Index: git/ld/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9445,7 +9959,7 @@
+@@ -9460,7 +9974,7 @@
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -17561,7 +17471,7 @@ Index: git/ld/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9502,13 +10016,17 @@
+@@ -9517,13 +10031,17 @@
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -17585,7 +17495,7 @@ Index: git/ld/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9569,6 +10087,11 @@
+@@ -9584,6 +10102,11 @@
  
  
  
@@ -17597,7 +17507,7 @@ Index: git/ld/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9919,7 +10442,8 @@
+@@ -9934,7 +10457,8 @@
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -17607,7 +17517,7 @@ Index: git/ld/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9967,7 +10491,7 @@
+@@ -9982,7 +10506,7 @@
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -17616,7 +17526,7 @@ Index: git/ld/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -10018,12 +10542,12 @@
+@@ -10033,12 +10557,12 @@
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -17631,7 +17541,7 @@ Index: git/ld/configure
  	  fi
  	  ;;
  	esac
-@@ -10037,8 +10561,8 @@
+@@ -10052,8 +10576,8 @@
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -17642,7 +17552,7 @@ Index: git/ld/configure
        fi
        ;;
  
-@@ -10056,8 +10580,8 @@
+@@ -10071,8 +10595,8 @@
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -17653,7 +17563,7 @@ Index: git/ld/configure
        else
  	ld_shlibs=no
        fi
-@@ -10103,8 +10627,8 @@
+@@ -10118,8 +10642,8 @@
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -17664,7 +17574,7 @@ Index: git/ld/configure
        else
  	ld_shlibs=no
        fi
-@@ -10234,7 +10758,13 @@
+@@ -10249,7 +10773,13 @@
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -17679,7 +17589,7 @@ Index: git/ld/configure
  /* end confdefs.h.  */
  
  int
-@@ -10247,22 +10777,29 @@
+@@ -10262,22 +10792,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -17722,7 +17632,7 @@ Index: git/ld/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10274,7 +10811,13 @@
+@@ -10289,7 +10826,13 @@
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -17737,7 +17647,7 @@ Index: git/ld/configure
  /* end confdefs.h.  */
  
  int
-@@ -10287,22 +10830,29 @@
+@@ -10302,22 +10845,29 @@
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -17780,7 +17690,7 @@ Index: git/ld/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10347,20 +10897,63 @@
+@@ -10362,20 +10912,63 @@
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -17858,7 +17768,7 @@ Index: git/ld/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -10421,7 +11014,7 @@
+@@ -10436,7 +11029,7 @@
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -17867,7 +17777,7 @@ Index: git/ld/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -10429,7 +11022,7 @@
+@@ -10444,7 +11037,7 @@
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -17876,7 +17786,7 @@ Index: git/ld/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -10445,7 +11038,7 @@
+@@ -10460,7 +11053,7 @@
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -17885,7 +17795,7 @@ Index: git/ld/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10469,10 +11062,10 @@
+@@ -10484,10 +11077,10 @@
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -17898,7 +17808,7 @@ Index: git/ld/configure
  	  ;;
  	esac
        else
-@@ -10551,23 +11144,36 @@
+@@ -10566,23 +11159,36 @@
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -17943,7 +17853,7 @@ Index: git/ld/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10652,7 +11258,7 @@
+@@ -10667,7 +11273,7 @@
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -17952,7 +17862,7 @@ Index: git/ld/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10671,9 +11277,9 @@
+@@ -10686,9 +11292,9 @@
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -17964,7 +17874,7 @@ Index: git/ld/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -11249,8 +11855,9 @@
+@@ -11264,8 +11870,9 @@
    need_version=no
    need_lib_prefix=no
  
@@ -17976,7 +17886,7 @@ Index: git/ld/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -11283,13 +11890,71 @@
+@@ -11298,13 +11905,71 @@
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -18049,7 +17959,7 @@ Index: git/ld/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11381,7 +12046,7 @@
+@@ -11396,7 +12061,7 @@
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -18058,16 +17968,16 @@ Index: git/ld/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -12177,7 +12842,7 @@
+@@ -12192,7 +12857,7 @@
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12180 "configure"
+-#line 12195 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12221,10 +12886,10 @@
+@@ -12236,10 +12901,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18080,16 +17990,16 @@ Index: git/ld/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12283,7 +12948,7 @@
+@@ -12298,7 +12963,7 @@
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12286 "configure"
+-#line 12301 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12327,10 +12992,10 @@
+@@ -12342,10 +13007,10 @@
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18102,7 +18012,7 @@ Index: git/ld/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12722,6 +13387,7 @@
+@@ -12737,6 +13402,7 @@
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -18110,7 +18020,7 @@ Index: git/ld/configure
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12739,6 +13405,7 @@
+@@ -12754,6 +13420,7 @@
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -18118,7 +18028,7 @@ Index: git/ld/configure
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12878,8 +13545,8 @@
+@@ -12893,8 +13560,8 @@
        # Check if GNU C++ uses GNU ld as the underlying linker, since the
        # archiving commands below assume that GNU ld is being used.
        if test "$with_gnu_ld" = yes; then
@@ -18129,7 +18039,7 @@ Index: git/ld/configure
  
          hardcode_libdir_flag_spec_CXX='${wl}-rpath ${wl}$libdir'
          export_dynamic_flag_spec_CXX='${wl}--export-dynamic'
-@@ -13021,7 +13688,13 @@
+@@ -13036,7 +13703,13 @@
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -18144,7 +18054,7 @@ Index: git/ld/configure
  /* end confdefs.h.  */
  
  int
-@@ -13034,22 +13707,29 @@
+@@ -13049,22 +13722,29 @@
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -18187,7 +18097,7 @@ Index: git/ld/configure
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -13062,7 +13742,13 @@
+@@ -13077,7 +13757,13 @@
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -18202,7 +18112,7 @@ Index: git/ld/configure
  /* end confdefs.h.  */
  
  int
-@@ -13075,22 +13761,29 @@
+@@ -13090,22 +13776,29 @@
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -18245,7 +18155,7 @@ Index: git/ld/configure
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -13133,29 +13826,75 @@
+@@ -13148,29 +13841,75 @@
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -18344,7 +18254,7 @@ Index: git/ld/configure
        darwin* | rhapsody*)
  
  
-@@ -13261,7 +14000,7 @@
+@@ -13276,7 +14015,7 @@
              ;;
            *)
              if test "$GXX" = yes; then
@@ -18353,7 +18263,7 @@ Index: git/ld/configure
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -13332,10 +14071,10 @@
+@@ -13347,10 +14086,10 @@
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -18366,7 +18276,7 @@ Index: git/ld/configure
  	            ;;
  	        esac
  	      fi
-@@ -13376,9 +14115,9 @@
+@@ -13391,9 +14130,9 @@
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -18378,7 +18288,7 @@ Index: git/ld/configure
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13448,20 +14187,20 @@
+@@ -13463,20 +14202,20 @@
  	      prelink_cmds_CXX='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -18403,7 +18313,7 @@ Index: git/ld/configure
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13656,7 +14395,7 @@
+@@ -13671,7 +14410,7 @@
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -18412,7 +18322,7 @@ Index: git/ld/configure
  		  ;;
  	      esac
  
-@@ -13702,7 +14441,7 @@
+@@ -13717,7 +14456,7 @@
  
        solaris*)
          case $cc_basename in
@@ -18421,7 +18331,7 @@ Index: git/ld/configure
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13743,9 +14482,9 @@
+@@ -13758,9 +14497,9 @@
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -18433,7 +18343,7 @@ Index: git/ld/configure
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13880,6 +14619,13 @@
+@@ -13895,6 +14634,13 @@
  };
  _LT_EOF
  
@@ -18447,7 +18357,7 @@ Index: git/ld/configure
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13893,7 +14639,7 @@
+@@ -13908,7 +14654,7 @@
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -18456,7 +18366,7 @@ Index: git/ld/configure
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13902,13 +14648,22 @@
+@@ -13917,13 +14663,22 @@
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -18483,7 +18393,7 @@ Index: git/ld/configure
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13928,8 +14683,10 @@
+@@ -13943,8 +14698,10 @@
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -18494,7 +18404,7 @@ Index: git/ld/configure
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13965,6 +14722,7 @@
+@@ -13980,6 +14737,7 @@
  fi
  
  $RM -f confest.$objext
@@ -18502,7 +18412,7 @@ Index: git/ld/configure
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -14000,7 +14758,7 @@
+@@ -14015,7 +14773,7 @@
  
  solaris*)
    case $cc_basename in
@@ -18511,7 +18421,7 @@ Index: git/ld/configure
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -14065,8 +14823,6 @@
+@@ -14080,8 +14838,6 @@
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -18520,7 +18430,7 @@ Index: git/ld/configure
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -14170,6 +14926,11 @@
+@@ -14186,6 +14942,11 @@
  	  ;;
  	esac
  	;;
@@ -18532,7 +18442,7 @@ Index: git/ld/configure
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -14322,7 +15083,7 @@
+@@ -14338,7 +15099,7 @@
  	;;
        solaris*)
  	case $cc_basename in
@@ -18541,7 +18451,7 @@ Index: git/ld/configure
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -14387,10 +15148,17 @@
+@@ -14403,10 +15164,17 @@
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -18562,7 +18472,7 @@ Index: git/ld/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -14448,6 +15216,8 @@
+@@ -14464,6 +15232,8 @@
  
  
  
@@ -18571,7 +18481,7 @@ Index: git/ld/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14625,6 +15395,7 @@
+@@ -14641,6 +15411,7 @@
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -18579,7 +18489,7 @@ Index: git/ld/configure
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14639,15 +15410,20 @@
+@@ -14655,15 +15426,20 @@
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -18605,7 +18515,7 @@ Index: git/ld/configure
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14910,8 +15686,9 @@
+@@ -14926,8 +15702,9 @@
    need_version=no
    need_lib_prefix=no
  
@@ -18617,7 +18527,7 @@ Index: git/ld/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14943,13 +15720,71 @@
+@@ -14959,13 +15736,71 @@
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -18690,7 +18600,7 @@ Index: git/ld/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -15040,7 +15875,7 @@
+@@ -15056,7 +15891,7 @@
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -18699,7 +18609,7 @@ Index: git/ld/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -15499,6 +16334,7 @@
+@@ -15515,6 +16350,7 @@
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -18707,7 +18617,7 @@ Index: git/ld/configure
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -17737,13 +18573,20 @@
+@@ -17754,13 +18590,20 @@
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -18728,7 +18638,7 @@ Index: git/ld/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17758,14 +18601,17 @@
+@@ -17775,14 +18618,17 @@
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -18747,7 +18657,7 @@ Index: git/ld/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17798,12 +18644,12 @@
+@@ -17815,12 +18661,12 @@
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -18761,7 +18671,7 @@ Index: git/ld/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17842,8 +18688,8 @@
+@@ -17859,8 +18705,8 @@
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -18771,7 +18681,7 @@ Index: git/ld/configure
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -17870,12 +18716,12 @@
+@@ -17887,12 +18733,12 @@
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -18785,7 +18695,7 @@ Index: git/ld/configure
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -17913,8 +18759,13 @@
+@@ -17930,8 +18776,13 @@
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -18799,7 +18709,7 @@ Index: git/ld/configure
  STRIP \
  RANLIB \
  CC \
-@@ -17924,12 +18775,14 @@
+@@ -17941,12 +18792,14 @@
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -18815,7 +18725,7 @@ Index: git/ld/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17945,7 +18798,6 @@
+@@ -17962,7 +18815,6 @@
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -18823,7 +18733,7 @@ Index: git/ld/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17967,8 +18819,8 @@
+@@ -17984,8 +18836,8 @@
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -18833,7 +18743,7 @@ Index: git/ld/configure
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -17980,7 +18832,6 @@
+@@ -17997,7 +18849,6 @@
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -18841,7 +18751,7 @@ Index: git/ld/configure
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18014,6 +18865,7 @@
+@@ -18031,6 +18882,7 @@
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -18849,7 +18759,7 @@ Index: git/ld/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18028,7 +18880,8 @@
+@@ -18045,7 +18897,8 @@
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -18859,7 +18769,7 @@ Index: git/ld/configure
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -18821,7 +19674,8 @@
+@@ -18838,7 +19691,8 @@
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -18869,7 +18779,7 @@ Index: git/ld/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18924,19 +19778,42 @@
+@@ -18941,19 +19795,42 @@
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -18913,7 +18823,7 @@ Index: git/ld/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18966,6 +19843,12 @@
+@@ -18983,6 +19860,12 @@
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18926,7 +18836,7 @@ Index: git/ld/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18975,6 +19858,9 @@
+@@ -18992,6 +19875,9 @@
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -18936,7 +18846,7 @@ Index: git/ld/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19089,12 +19975,12 @@
+@@ -19106,12 +19992,12 @@
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -18952,7 +18862,7 @@ Index: git/ld/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19181,9 +20067,6 @@
+@@ -19198,9 +20084,6 @@
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -18962,7 +18872,7 @@ Index: git/ld/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19199,6 +20082,9 @@
+@@ -19216,6 +20099,9 @@
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -18972,7 +18882,7 @@ Index: git/ld/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19245,210 +20131,169 @@
+@@ -19262,210 +20148,169 @@
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -19343,7 +19253,7 @@ Index: git/ld/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -19476,12 +20321,12 @@
+@@ -19493,12 +20338,12 @@
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -19359,7 +19269,7 @@ Index: git/ld/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -19568,9 +20413,6 @@
+@@ -19585,9 +20430,6 @@
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -19369,7 +19279,7 @@ Index: git/ld/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -19586,6 +20428,9 @@
+@@ -19603,6 +20445,9 @@
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -19379,11 +19289,11 @@ Index: git/ld/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec_CXX
  
-Index: git/bfd/configure.in
+Index: binutils-2.24/bfd/configure.in
 ===================================================================
---- git.orig/bfd/configure.in	2012-09-07 01:13:43.000000000 -0700
-+++ git/bfd/configure.in	2012-09-07 12:21:49.690865715 -0700
-@@ -548,7 +548,7 @@
+--- binutils-2.24.orig/bfd/configure.in	2013-12-02 01:30:28.000000000 -0800
++++ binutils-2.24/bfd/configure.in	2013-12-15 11:10:23.887118697 -0800
+@@ -568,7 +568,7 @@
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -19392,11 +19302,11 @@ Index: git/bfd/configure.in
    fi
  
  # More hacks to build DLLs on Windows.
-Index: git/opcodes/configure.in
+Index: binutils-2.24/opcodes/configure.in
 ===================================================================
---- git.orig/opcodes/configure.in	2012-09-07 01:13:47.000000000 -0700
-+++ git/opcodes/configure.in	2012-09-07 12:21:49.690865715 -0700
-@@ -146,7 +146,7 @@
+--- binutils-2.24.orig/opcodes/configure.in	2013-11-04 07:33:40.000000000 -0800
++++ binutils-2.24/opcodes/configure.in	2013-12-15 11:10:23.887118697 -0800
+@@ -162,7 +162,7 @@
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/libtool-rpath-fix.patch b/meta/recipes-devtools/binutils/binutils/libtool-rpath-fix.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/libtool-rpath-fix.patch
rename to meta/recipes-devtools/binutils/binutils/libtool-rpath-fix.patch
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/mips64-default-ld-emulation.patch b/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
similarity index 68%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/mips64-default-ld-emulation.patch
rename to meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
index ab01859..51eaf0b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.2/mips64-default-ld-emulation.patch
+++ b/meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
@@ -5,33 +5,38 @@ Upstream-Status: Inappropriate [ OE configuration Specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: binutils-2.22/bfd/config.bfd
+Index: binutils-2.24/bfd/config.bfd
 ===================================================================
---- binutils-2.22.orig/bfd/config.bfd	2011-07-28 15:35:13.000000000 -0700
-+++ binutils-2.22/bfd/config.bfd	2012-04-23 21:07:44.151578222 -0700
-@@ -970,13 +970,13 @@
+--- binutils-2.24.orig/bfd/config.bfd	2013-11-04 07:33:37.000000000 -0800
++++ binutils-2.24/bfd/config.bfd	2013-12-15 11:54:57.113765374 -0800
+@@ -1052,14 +1052,14 @@
+     targ_defvec=bfd_elf32_bigmips_vec
+     targ_selvecs="bfd_elf32_littlemips_vec bfd_elf64_bigmips_vec bfd_elf64_littlemips_vec ecoff_big_vec ecoff_little_vec"
      ;;
- #ifdef BFD64
-   mips64*el-*-linux*)
+-  mips64*el-*-linux*)
 -    targ_defvec=bfd_elf32_ntradlittlemips_vec
 -    targ_selvecs="bfd_elf32_ntradbigmips_vec bfd_elf32_tradlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf64_tradlittlemips_vec bfd_elf64_tradbigmips_vec"
-+    targ_defvec=bfd_elf64_tradlittlemips_vec
-+    targ_selvecs="bfd_elf32_ntradbigmips_vec bfd_elf32_ntradlittlemips_vec bfd_elf32_tradlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf64_tradbigmips_vec"
-     want64=true
-     ;;
-   mips64*-*-linux*)
+-    ;;
+-  mips64*-*-linux*)
 -    targ_defvec=bfd_elf32_ntradbigmips_vec
 -    targ_selvecs="bfd_elf32_ntradlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf32_tradlittlemips_vec bfd_elf64_tradbigmips_vec bfd_elf64_tradlittlemips_vec"
+-    ;;
++   mips64*el-*-linux*)
++    targ_defvec=bfd_elf64_tradlittlemips_vec
++    targ_selvecs="bfd_elf32_ntradbigmips_vec bfd_elf32_ntradlittlemips_vec bfd_elf32_tradlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf64_tradbigmips_vec"
++     ;;
++   mips64*-*-linux*)
 +    targ_defvec=bfd_elf64_tradbigmips_vec
 +    targ_selvecs="bfd_elf32_ntradbigmips_vec bfd_elf32_ntradlittlemips_vec bfd_elf32_tradbigmips_vec bfd_elf32_tradlittlemips_vec bfd_elf64_tradlittlemips_vec"
-     want64=true
-     ;;
- #endif
-Index: binutils-2.22/ld/configure.tgt
++     ;;
+   mips*el-*-linux*)
+     targ_defvec=bfd_elf32_tradlittlemips_vec
+     targ_selvecs="bfd_elf32_tradbigmips_vec ecoff_little_vec ecoff_big_vec bfd_elf32_ntradlittlemips_vec bfd_elf64_tradlittlemips_vec bfd_elf32_ntradbigmips_vec bfd_elf64_tradbigmips_vec"
+Index: binutils-2.24/ld/configure.tgt
 ===================================================================
---- binutils-2.22.orig/ld/configure.tgt	2011-11-21 01:29:37.000000000 -0800
-+++ binutils-2.22/ld/configure.tgt	2012-04-23 21:05:34.183571931 -0700
-@@ -395,11 +395,11 @@
+--- binutils-2.24.orig/ld/configure.tgt	2013-11-26 03:37:33.000000000 -0800
++++ binutils-2.24/ld/configure.tgt	2013-12-15 11:50:52.273766155 -0800
+@@ -471,11 +471,11 @@
  mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
  		        targ_extra_emuls="elf32elmipvxworks" ;;
  mips*-*-windiss)	targ_emul=elf32mipswindiss ;;
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/relocatable_sdk.patch b/meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-2.23.2/relocatable_sdk.patch
rename to meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
diff --git a/meta/recipes-devtools/binutils/binutils_2.23.2.bb b/meta/recipes-devtools/binutils/binutils_2.24.bb
similarity index 77%
rename from meta/recipes-devtools/binutils/binutils_2.23.2.bb
rename to meta/recipes-devtools/binutils/binutils_2.24.bb
index 1523e87..738aaee 100644
--- a/meta/recipes-devtools/binutils/binutils_2.23.2.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.24.bb
@@ -5,10 +5,14 @@ DEPENDS += "flex bison zlib"
 
 EXTRA_OECONF += "--with-sysroot=/ \
                 --enable-install-libbfd \
+                --enable-install-libiberty \
                 --enable-shared \
                 "
 
-EXTRA_OECONF_class-native = "--enable-targets=all --enable-64-bit-bfd --enable-install-libbfd"
+EXTRA_OECONF_class-native = "--enable-targets=all \
+                             --enable-64-bit-bfd \
+                             --enable-install-libiberty \
+                             --enable-install-libbfd"
 
 do_install_class-native () {
 	autotools_do_install
-- 
1.9.rc1


