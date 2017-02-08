Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6E18719E2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 03:17:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v183HGrZ021182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 7 Feb 2017 19:17:16 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 19:17:15 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 7 Feb 2017 22:16:59 -0500
Message-ID: <f7bba1f45fd40e30c877499dafdbf11e72bd7684.1486523726.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1486523726.git.hongxu.jia@windriver.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
Subject: [PATCH 03/13] elfutils: 0.166 -> 0.168
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
X-List-Received-Date: Wed, 08 Feb 2017 03:17:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

- Pick patches from debian for 0.168

- Rebase 0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch to support libc musl

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../elfcmp-fix-self-comparision.patch              |  41 --
 .../elfutils/elfutils-0.166/m68k_backend.diff      | 492 -------------
 .../elfutils/elfutils-0.166/uclibc-support.patch   | 128 ----
 ...de-alternatives-for-glibc-assumptions-hel.patch | 772 +++++++++------------
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |   0
 .../0001-fix-a-stack-usage-warning.patch           |   0
 .../0001-remove-the-unneed-checking.patch          |   0
 .../aarch64_uio.patch                              |   0
 ...ferences-between-mips-machine-identifiers.patch |   9 +-
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   0
 .../0003-Add-mips-n64-relocation-format-hack.patch |  32 +-
 .../debian}/arm_backend.diff                       |  52 +-
 .../debian}/hppa_backend.diff                      |  60 +-
 .../elfutils/elfutils-0.168/debian/hurd_path.patch |  14 +
 .../elfutils-0.168/debian/ignore_strmerge.diff     |  11 +
 .../debian}/kfreebsd_path.patch                    |   8 +-
 .../debian}/mips_backend.diff                      |  72 +-
 .../debian}/mips_readelf_w.patch                   |   8 +-
 .../debian}/testsuite-ignore-elflint.diff          |  14 +-
 .../fixheadercheck.patch                           |   0
 .../shadow.patch                                   |   0
 .../{elfutils_0.166.bb => elfutils_0.168.bb}       |  29 +-
 22 files changed, 482 insertions(+), 1260 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch (47%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-fix-a-stack-usage-warning.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-remove-the-unneed-checking.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/aarch64_uio.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0001-Ignore-differences-between-mips-machine-identifiers.patch (85%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0003-Add-mips-n64-relocation-format-hack.patch (90%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/arm_backend.diff (94%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/hppa_backend.diff (95%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/kfreebsd_path.patch (69%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/mips_backend.diff (92%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/mips_readelf_w.patch (78%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/testsuite-ignore-elflint.diff (70%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/shadow.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.166.bb => elfutils_0.168.bb} (78%)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
deleted file mode 100644
index 6c150bb..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 836a16fe5b5bab4a3afe2c991c104652775ce3a3 Mon Sep 17 00:00:00 2001
-From: David Abdurachmanov <davidlt@cern.ch>
-Date: Mon, 11 Apr 2016 16:00:57 +0200
-Subject: elfcmp: fix self-comparison error with GCC 6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Noticed with Fedora 24 Alpha, gcc (GCC) 6.0.0 20160406
-(Red Hat 6.0.0-0.20).
-
-elfcmp.c: In function ‘main’:
-elfcmp.c:364:199: error: self-comparison always evaluates
-to false [-Werror=tautological-compare]
-        if (unlikely (name1 == NULL || name2 == NULL
-
-Signed-off-by: David Abdurachmanov <davidlt@cern.ch>
----
-
-Upstream-Status: Backport
-
- src/ChangeLog | 4 ++++
- src/elfcmp.c  | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/elfcmp.c b/src/elfcmp.c
-index 852b92f..7b5d39c 100644
---- a/src/elfcmp.c
-+++ b/src/elfcmp.c
-@@ -368,7 +368,7 @@ main (int argc, char *argv[])
- 				&& sym1->st_shndx != SHN_UNDEF)
- 			    || sym1->st_info != sym2->st_info
- 			    || sym1->st_other != sym2->st_other
--			    || sym1->st_shndx != sym1->st_shndx))
-+			    || sym1->st_shndx != sym2->st_shndx))
- 		{
- 		  // XXX Do we want to allow reordered symbol tables?
- 		symtab_mismatch:
--- 
-cgit v0.12
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
deleted file mode 100644
index d73855b..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
+++ /dev/null
@@ -1,492 +0,0 @@
-From: Kurt Roeckx <kurt@roeckx.be>
-From: Thorsten Glaser <tg@mirbsd.de>
-Subject: m68k support
-
-Written by Kurt Roeckx, except for the retval support which was written
-by Thorsten Glaser
-
-
-Index: elfutils-0.164/backends/m68k_init.c
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/m68k_init.c
-@@ -0,0 +1,49 @@
-+/* Initialization of m68k specific backend library.
-+   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
-+
-+   This software is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   This softare is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with this software; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+*/
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#define BACKEND		m68k_
-+#define RELOC_PREFIX	R_68K_
-+#include "libebl_CPU.h"
-+
-+/* This defines the common reloc hooks based on m68k_reloc.def.  */
-+#include "common-reloc.c"
-+
-+
-+const char *
-+m68k_init (Elf *elf __attribute__ ((unused)),
-+     GElf_Half machine __attribute__ ((unused)),
-+     Ebl *eh,
-+     size_t ehlen)
-+{
-+  /* Check whether the Elf_BH object has a sufficent size.  */
-+  if (ehlen < sizeof (Ebl))
-+    return NULL;
-+
-+  /* We handle it.  */
-+  eh->name = "m68k";
-+  m68k_init_reloc (eh);
-+  HOOK (eh, reloc_simple_type);
-+  HOOK (eh, return_value_location);
-+  HOOK (eh, register_info);
-+
-+  return MODVERSION;
-+}
-Index: elfutils-0.164/backends/m68k_regs.c
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/m68k_regs.c
-@@ -0,0 +1,106 @@
-+/* Register names and numbers for m68k DWARF.
-+   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
-+
-+   This software is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   This software is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with this software; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <string.h>
-+#include <dwarf.h>
-+
-+#define BACKEND m68k_
-+#include "libebl_CPU.h"
-+
-+ssize_t
-+m68k_register_info (Ebl *ebl __attribute__ ((unused)),
-+		   int regno, char *name, size_t namelen,
-+		   const char **prefix, const char **setname,
-+		   int *bits, int *type)
-+{
-+	if (name == NULL)
-+		return 25;
-+
-+	if (regno < 0 || regno > 24 || namelen < 5)
-+		return -1;
-+
-+	*prefix = "%";
-+	*bits = 32;
-+	*type = (regno < 8 ? DW_ATE_signed
-+		: regno < 16 ? DW_ATE_address : DW_ATE_float);
-+
-+	if (regno < 8)
-+	{
-+		*setname = "integer";
-+	}
-+	else if (regno < 16)
-+	{
-+		*setname = "address";
-+	}
-+	else if (regno < 24)
-+	{
-+		*setname = "FPU";
-+	}
-+	else
-+	{
-+		*setname = "address";
-+		*type = DW_ATE_address;
-+	}
-+
-+	switch (regno)
-+	{
-+	case 0 ... 7:
-+		name[0] = 'd';
-+		name[1] = regno + '0';
-+		namelen = 2;
-+		break;
-+
-+	case 8 ... 13:
-+		name[0] = 'a';
-+		name[1] = regno - 8 + '0';
-+		namelen = 2;
-+		break;
-+
-+	case 14:
-+		name[0] = 'f';
-+		name[1] = 'p';
-+   		namelen = 2;
-+		break;
-+
-+	case 15:
-+		name[0] = 's';
-+		name[1] = 'p';
-+   		namelen = 2;
-+		break;
-+
-+	case 16 ... 23:
-+		name[0] = 'f';
-+		name[1] = 'p';
-+		name[2] = regno - 16 + '0';
-+   		namelen = 3;
-+		break;
-+
-+	case 24:
-+		name[0] = 'p';
-+		name[1] = 'c';
-+		namelen = 2;
-+	}
-+
-+	name[namelen++] = '\0';
-+	return namelen;
-+}
-+
-Index: elfutils-0.164/backends/m68k_reloc.def
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/m68k_reloc.def
-@@ -0,0 +1,45 @@
-+/* List the relocation types for m68k.  -*- C -*-
-+   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
-+
-+   This software is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   This software is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with this software; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+*/
-+
-+/* 	    NAME,		REL|EXEC|DYN	*/
-+
-+RELOC_TYPE (NONE,		0)
-+RELOC_TYPE (32,			REL|EXEC|DYN)
-+RELOC_TYPE (16,			REL)
-+RELOC_TYPE (8,			REL)
-+RELOC_TYPE (PC32,		REL|EXEC|DYN)
-+RELOC_TYPE (PC16,		REL)
-+RELOC_TYPE (PC8,		REL)
-+RELOC_TYPE (GOT32,		REL)
-+RELOC_TYPE (GOT16,		REL)
-+RELOC_TYPE (GOT8,		REL)
-+RELOC_TYPE (GOT32O,		REL)
-+RELOC_TYPE (GOT16O,		REL)
-+RELOC_TYPE (GOT8O,		REL)
-+RELOC_TYPE (PLT32,		REL)
-+RELOC_TYPE (PLT16,		REL)
-+RELOC_TYPE (PLT8,		REL)
-+RELOC_TYPE (PLT32O,		REL)
-+RELOC_TYPE (PLT16O,		REL)
-+RELOC_TYPE (PLT8O,		REL)
-+RELOC_TYPE (COPY,		EXEC)
-+RELOC_TYPE (GLOB_DAT,		EXEC|DYN)
-+RELOC_TYPE (JMP_SLOT,		EXEC|DYN)
-+RELOC_TYPE (RELATIVE,		EXEC|DYN)
-+RELOC_TYPE (GNU_VTINHERIT,	REL)
-+RELOC_TYPE (GNU_VTENTRY,	REL)
-+
-Index: elfutils-0.164/libelf/elf.h
-===================================================================
---- elfutils-0.164.orig/libelf/elf.h
-+++ elfutils-0.164/libelf/elf.h
-@@ -1158,6 +1158,9 @@ typedef struct
- #define R_68K_GLOB_DAT	20		/* Create GOT entry */
- #define R_68K_JMP_SLOT	21		/* Create PLT entry */
- #define R_68K_RELATIVE	22		/* Adjust by program base */
-+/* The next 2 are GNU extensions to enable C++ vtable garbage collection.  */
-+#define R_68K_GNU_VTINHERIT 23
-+#define R_68K_GNU_VTENTRY   24
- #define R_68K_TLS_GD32      25          /* 32 bit GOT offset for GD */
- #define R_68K_TLS_GD16      26          /* 16 bit GOT offset for GD */
- #define R_68K_TLS_GD8       27          /* 8 bit GOT offset for GD */
-Index: elfutils-0.164/backends/Makefile.am
-===================================================================
---- elfutils-0.164.orig/backends/Makefile.am
-+++ elfutils-0.164/backends/Makefile.am
-@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
- 
- 
- modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx parisc mips
-+	  tilegx parisc mips m68k
- libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
- 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
- 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
- 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
--	     libebl_parisc_pic.a libebl_mips_pic.a
-+	     libebl_parisc_pic.a libebl_mips_pic.a libebl_m68k_pic.a
- noinst_LIBRARIES = $(libebl_pic)
- noinst_DATA = $(libebl_pic:_pic.a=.so)
- 
-@@ -120,6 +120,10 @@ mips_SRCS = mips_init.c mips_symbol.c mi
- libebl_mips_pic_a_SOURCES = $(mips_SRCS)
- am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
- 
-+m68k_SRCS = m68k_init.c m68k_symbol.c m68k_regs.c m68k_retval.c
-+libebl_m68k_pic_a_SOURCES = $(m68k_SRCS)
-+am_libebl_m68k_pic_a_OBJECTS = $(m68k_SRCS:.c=.os)
-+
- libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
- 	@rm -f $(@:.so=.map)
- 	$(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
-Index: elfutils-0.164/backends/m68k_symbol.c
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/m68k_symbol.c
-@@ -0,0 +1,43 @@
-+/* m68k specific symbolic name handling.
-+   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
-+
-+   This software is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   This software distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with this software; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+*/
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <elf.h>
-+#include <stddef.h>
-+
-+#define BACKEND		m68k_
-+#include "libebl_CPU.h"
-+
-+/* Check for the simple reloc types.  */
-+Elf_Type
-+m68k_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type)
-+{
-+  switch (type)
-+    {
-+    case R_68K_32:
-+      return ELF_T_SWORD;
-+    case R_68K_16:
-+      return ELF_T_HALF;
-+    case R_68K_8:
-+      return ELF_T_BYTE;
-+    default:
-+      return ELF_T_NUM;
-+    }
-+}
-Index: elfutils-0.164/backends/m68k_retval.c
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/m68k_retval.c
-@@ -0,0 +1,172 @@
-+/* Function return value location for Linux/m68k ABI.
-+   Copyright (C) 2005-2010 Red Hat, Inc.
-+   Copyright (c) 2011 Thorsten Glaser, Debian.
-+   This file is part of Red Hat elfutils.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <assert.h>
-+#include <dwarf.h>
-+
-+#define BACKEND m68k_
-+#include "libebl_CPU.h"
-+
-+
-+/* %d0, or pair %d0, %d1, or %a0 */
-+static const Dwarf_Op loc_intreg[] =
-+  {
-+    { .atom = DW_OP_reg0 }, { .atom = DW_OP_piece, .number = 4 },
-+    { .atom = DW_OP_reg1 }, { .atom = DW_OP_piece, .number = 4 },
-+  };
-+static const Dwarf_Op loc_ptrreg[] =
-+  {
-+    { .atom = DW_OP_reg8 },
-+  };
-+#define nloc_intreg	1
-+#define nloc_intregpair	4
-+#define nloc_ptrreg	1
-+
-+/* %f0 */
-+static const Dwarf_Op loc_fpreg[] =
-+  {
-+    { .atom = DW_OP_reg16 }
-+  };
-+#define nloc_fpreg	1
-+
-+/* Structures are a bit more complicated - small structures are returned
-+   in %d0 / %d1 (-freg-struct-return which is enabled by default), large
-+   structures use %a1 (in constrast to the SYSV psABI which says %a0) as
-+   reentrant storage space indicator.  */
-+static const Dwarf_Op loc_aggregate[] =
-+  {
-+    { .atom = DW_OP_breg9, .number = 0 }
-+  };
-+#define nloc_aggregate 1
-+
-+int
-+m68k_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-+{
-+  Dwarf_Word size;
-+
-+  /* Start with the function's type, and get the DW_AT_type attribute,
-+     which is the type of the return value.  */
-+
-+  Dwarf_Attribute attr_mem;
-+  Dwarf_Attribute *attr = dwarf_attr_integrate (functypedie, DW_AT_type,
-+						&attr_mem);
-+  if (attr == NULL)
-+    /* The function has no return value, like a `void' function in C.  */
-+    return 0;
-+
-+  Dwarf_Die die_mem;
-+  Dwarf_Die *typedie = dwarf_formref_die (attr, &die_mem);
-+  int tag = dwarf_tag (typedie);
-+
-+  /* Follow typedefs and qualifiers to get to the actual type.  */
-+  while (tag == DW_TAG_typedef
-+	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
-+	 || tag == DW_TAG_restrict_type)
-+    {
-+      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
-+      typedie = dwarf_formref_die (attr, &die_mem);
-+      tag = dwarf_tag (typedie);
-+    }
-+
-+  switch (tag)
-+    {
-+    case -1:
-+      return -1;
-+
-+    case DW_TAG_subrange_type:
-+      if (! dwarf_hasattr_integrate (typedie, DW_AT_byte_size))
-+	{
-+	  attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
-+	  typedie = dwarf_formref_die (attr, &die_mem);
-+	  tag = dwarf_tag (typedie);
-+	}
-+      /* Fall through.  */
-+
-+    case DW_TAG_base_type:
-+    case DW_TAG_enumeration_type:
-+    case DW_TAG_pointer_type:
-+    case DW_TAG_ptr_to_member_type:
-+      if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
-+						 &attr_mem), &size) != 0)
-+	{
-+	  if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
-+	    size = 4;
-+	  else
-+	    return -1;
-+	}
-+      if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
-+	{
-+	  *locp = loc_ptrreg;
-+          return nloc_ptrreg;
-+	}
-+      if (tag == DW_TAG_base_type)
-+	{
-+	  Dwarf_Word encoding;
-+	  if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
-+						     &attr_mem),
-+			       &encoding) != 0)
-+	    return -1;
-+	  if (encoding == DW_ATE_float)
-+	    {
-+	      /* XXX really 10? */
-+              if (size > 10)
-+                return -2;
-+              *locp = loc_fpreg;
-+              return nloc_fpreg;
-+	    }
-+	}
-+      if (size <= 8)
-+	{
-+	intreg:
-+	  /* XXX check endianness of dword pair, int64 vs aggregate */
-+	  *locp = loc_intreg;
-+	  return size <= 4 ? nloc_intreg : nloc_intregpair;
-+	}
-+
-+    aggregate:
-+      *locp = loc_aggregate;
-+      return nloc_aggregate;
-+
-+    case DW_TAG_structure_type:
-+    case DW_TAG_class_type:
-+    case DW_TAG_union_type:
-+    case DW_TAG_array_type:
-+      if (dwarf_aggregate_size (typedie, &size) == 0
-+	  && size > 0 && size <= 8)
-+	/* not accurate for a struct whose only member is a float */
-+	goto intreg;
-+      goto aggregate;
-+    }
-+
-+  /* XXX We don't have a good way to return specific errors from ebl calls.
-+     This value means we do not understand the type, but it is well-formed
-+     DWARF and might be valid.  */
-+  return -2;
-+}
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch
deleted file mode 100644
index 6299998..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 3daec2dd11a04955f95e8f65a48820103d84dbec Mon Sep 17 00:00:00 2001
-From: Junling Zheng <zhengjunling@huawei.com>
-Date: Thu, 9 Apr 2015 12:12:49 +0000
-Subject: [PATCH] uclibc support for elfutils 0.161
-
-on uclibc systems libintl and libuargp are separate from libc.
-so they need to be specified on commandline when we use proxy-libintl
-then libintl is a static archive so it should be listed last since
-elfutils does not respect disable-nls we need to link in libintl
-
-We add a new option --enable-uclibc which will be used to control
-the uclibc specific configurations during build.
-
-Upstream-Status: Inappropriate [uclibc specific]
-
-Signed-off-by: Khem Raj <raj.khem>
-Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
-[Junling Zheng:
- - adjust context
-]
----
- configure.ac       | 8 ++++++++
- libcpu/Makefile.am | 4 ++++
- libdw/Makefile.am  | 7 ++++++-
- libelf/Makefile.am | 5 +++++
- 4 files changed, 23 insertions(+), 1 deletion(-)
-
-Index: elfutils-0.166/configure.ac
-===================================================================
---- elfutils-0.166.orig/configure.ac
-+++ elfutils-0.166/configure.ac
-@@ -79,6 +79,14 @@ AS_IF([test "$use_locks" = yes],
- 
- AH_TEMPLATE([USE_LOCKS], [Defined if libraries should be thread-safe.])
- 
-+AC_ARG_ENABLE([uclibc],
-+AS_HELP_STRING([--enable-uclibc], [Use uclibc for system libraries]),
-+use_uclibc=yes, use_uclibc=no)
-+AM_CONDITIONAL(USE_UCLIBC, test "$use_uclibc" = yes)
-+AS_IF([test "$use_uclibc" = yes], [AC_DEFINE(USE_UCLIBC)])
-+
-+AH_TEMPLATE([USE_UCLIBC], [Defined if uclibc libraries are used.])
-+
- AC_PROG_CC
- AC_PROG_RANLIB
- AC_PROG_YACC
-@@ -347,18 +355,13 @@ AC_LINK_IFELSE(
- )
- 
- dnl If our libc doesn't provide argp, then test for libargp
--if test "$libc_has_argp" = "false" ; then
--	AC_MSG_WARN("libc does not have argp")
--	AC_CHECK_LIB([argp], [argp_parse], [have_argp="true"], [have_argp="false"])
--
--	if test "$have_argp" = "false"; then
--		AC_MSG_ERROR("no libargp found")
--	else
--		argp_LDADD="-largp"
--	fi
--else
--	argp_LDADD=""
--fi
-+AS_IF([test "x$libc_has_argp" = "xfalse"],
-+	[AC_MSG_WARN("libc does not have argp")
-+	AC_CHECK_LIB([argp], [argp_parse], [have_argp="true" argp_LDADD="-largp"], [have_argp="false"])], [argp_LDADD=""])
-+
-+AS_IF([test "x$libc_has_argp" = "xfalse" -a "x$have_argp" = "xfalse"],
-+	AC_CHECK_LIB([uargp], [argp_parse], [have_uargp="true" argp_LDADD="-luargp"], [have_uargp="false"])], [argp_LDADD=""])
-+
- AC_SUBST([argp_LDADD])
- 
- dnl The directories with content.
-Index: elfutils-0.166/libcpu/Makefile.am
-===================================================================
---- elfutils-0.166.orig/libcpu/Makefile.am
-+++ elfutils-0.166/libcpu/Makefile.am
-@@ -80,6 +80,10 @@ i386_parse_CFLAGS = -DNMNES="`wc -l < i3
- i386_lex.o: i386_parse.h
- i386_gendis_LDADD = $(libeu) -lm
- 
-+if USE_UCLIBC
-+i386_gendis_LDADD += -lintl
-+endif
-+
- i386_parse.h: i386_parse.c ;
- 
- EXTRA_DIST = defs/i386
-Index: elfutils-0.166/libdw/Makefile.am
-===================================================================
---- elfutils-0.166.orig/libdw/Makefile.am
-+++ elfutils-0.166/libdw/Makefile.am
-@@ -102,6 +102,11 @@ endif
- libdw_pic_a_SOURCES =
- am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
- 
-+libdw_so_LDLIBS =
-+if USE_UCLIBC
-+libdw_so_LDLIBS += -lintl
-+endif
-+
- libdw_so_SOURCES =
- libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
- 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a \
-@@ -112,7 +117,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map l
- 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
- 		-Wl,--version-script,$<,--no-undefined \
- 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
--		-ldl -lz $(argp_LDADD) $(zip_LIBS)
-+		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS)
- 	@$(textrel_check)
- 	$(AM_V_at)ln -fs $@ $@.$(VERSION)
- 
-Index: elfutils-0.166/libelf/Makefile.am
-===================================================================
---- elfutils-0.166.orig/libelf/Makefile.am
-+++ elfutils-0.166/libelf/Makefile.am
-@@ -96,6 +96,11 @@ libelf_pic_a_SOURCES =
- am_libelf_pic_a_OBJECTS = $(libelf_a_SOURCES:.c=.os)
- 
- libelf_so_LDLIBS = -lz
-+
-+if USE_UCLIBC
-+libelf_so_LDLIBS += -lintl
-+endif
-+
- if USE_LOCKS
- libelf_so_LDLIBS += -lpthread
- endif
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
similarity index 47%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
index 38b31f6..020ffa1 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
@@ -1,27 +1,28 @@
-From 4b0fe80b3951f044c1c1b14d1d7f5f0b8ab67507 Mon Sep 17 00:00:00 2001
+From 054fedda5ab9b84160d40d90cb967f2f5822b889 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 06:35:34 +0000
 Subject: [PATCH] build: Provide alternatives for glibc assumptions helps
  compiling it on musl
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+Rebase to 0.68
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
  Makefile.am                      |  2 +-
- lib/color.c                      |  2 +-
- lib/crc32_file.c                 |  4 +++-
- lib/fixedsizehash.h              |  4 ++--
- lib/system.h                     | 11 +++++++++++
+ lib/color.c                      |  3 ++-
+ lib/crc32_file.c                 |  1 +
+ lib/fixedsizehash.h              |  1 -
+ lib/system.h                     | 10 ++++++++++
  lib/xmalloc.c                    |  2 +-
  libasm/asm_end.c                 |  2 +-
  libasm/asm_newscn.c              |  2 +-
  libcpu/i386_gendis.c             |  2 +-
  libcpu/i386_lex.c                |  2 +-
  libcpu/i386_parse.c              |  2 +-
- libdw/Makefile.am                |  2 +-
- libdw/libdw_alloc.c              |  3 ++-
- libdwfl/Makefile.am              |  2 ++
+ libdw/Makefile.am                |  4 +++-
+ libdw/libdw_alloc.c              |  2 +-
  libdwfl/dwfl_build_id_find_elf.c |  3 ++-
  libdwfl/dwfl_error.c             |  4 +++-
  libdwfl/dwfl_module_getdwarf.c   |  1 +
@@ -29,8 +30,7 @@ Upstream-Status: Pending
  libdwfl/libdwfl_crc32_file.c     | 10 ++++++++++
  libdwfl/linux-kernel-modules.c   |  1 +
  libebl/eblopenbackend.c          |  2 +-
- libebl/eblwstrtab.c              |  2 +-
- libelf/elf.h                     |  9 ++++++---
+ libelf/elf.h                     |  8 ++++++--
  libelf/libelf.h                  |  1 +
  libelf/libelfP.h                 |  1 +
  src/addr2line.c                  |  2 +-
@@ -40,11 +40,6 @@ Upstream-Status: Pending
  src/elfcmp.c                     |  2 +-
  src/elflint.c                    |  2 +-
  src/findtextrel.c                |  2 +-
- src/i386_ld.c                    |  2 +-
- src/ld.c                         |  2 +-
- src/ldgeneric.c                  |  2 +-
- src/ldlex.c                      |  2 +-
- src/ldscript.c                   |  2 +-
  src/nm.c                         |  2 +-
  src/objdump.c                    |  2 +-
  src/ranlib.c                     |  2 +-
@@ -85,12 +80,12 @@ Upstream-Status: Pending
  tests/sectiondump.c              |  2 +-
  tests/varlocs.c                  |  2 +-
  tests/vdsosyms.c                 |  2 +-
- 77 files changed, 109 insertions(+), 73 deletions(-)
+ 70 files changed, 98 insertions(+), 64 deletions(-)
 
-Index: elfutils-0.166/Makefile.am
-===================================================================
---- elfutils-0.166.orig/Makefile.am
-+++ elfutils-0.166/Makefile.am
+diff --git a/Makefile.am b/Makefile.am
+index 2ff444e..41f77df 100644
+--- a/Makefile.am
++++ b/Makefile.am
 @@ -28,7 +28,7 @@ pkginclude_HEADERS = version.h
  
  # Add doc back when we have some real content.
@@ -100,11 +95,11 @@ Index: elfutils-0.166/Makefile.am
  
  EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
  	     COPYING COPYING-GPLV2 COPYING-LGPLV3
-Index: elfutils-0.166/lib/color.c
-===================================================================
---- elfutils-0.166.orig/lib/color.c
-+++ elfutils-0.166/lib/color.c
-@@ -32,7 +32,7 @@
+diff --git a/lib/color.c b/lib/color.c
+index fde2d9d..73292ac 100644
+--- a/lib/color.c
++++ b/lib/color.c
+@@ -32,12 +32,13 @@
  #endif
  
  #include <argp.h>
@@ -113,50 +108,41 @@ Index: elfutils-0.166/lib/color.c
  #include <libintl.h>
  #include <stdlib.h>
  #include <string.h>
-Index: elfutils-0.166/lib/crc32_file.c
-===================================================================
---- elfutils-0.166.orig/lib/crc32_file.c
-+++ elfutils-0.166/lib/crc32_file.c
-@@ -30,12 +30,14 @@
- # include <config.h>
- #endif
+ #include <unistd.h>
+ #include "libeu.h"
++#include "system.h"
  
--#include "system.h"
- #include <errno.h>
+ 
+ /* Prototype for option handler.  */
+diff --git a/lib/crc32_file.c b/lib/crc32_file.c
+index a8434d4..57e4298 100644
+--- a/lib/crc32_file.c
++++ b/lib/crc32_file.c
+@@ -35,6 +35,7 @@
  #include <unistd.h>
-+#include <stdint.h>
  #include <sys/stat.h>
  #include <sys/mman.h>
- 
 +#include "system.h"
-+
+ 
  int
  crc32_file (int fd, uint32_t *resp)
- {
-Index: elfutils-0.166/lib/fixedsizehash.h
-===================================================================
---- elfutils-0.166.orig/lib/fixedsizehash.h
-+++ elfutils-0.166/lib/fixedsizehash.h
-@@ -30,12 +30,12 @@
+diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h
+index dac2a5f..43016fc 100644
+--- a/lib/fixedsizehash.h
++++ b/lib/fixedsizehash.h
+@@ -30,7 +30,6 @@
  #include <errno.h>
  #include <stdlib.h>
  #include <string.h>
 -#include <sys/cdefs.h>
- #include <sys/param.h>
  
  #include <system.h>
  
--#define CONCAT(t1,t2) __CONCAT (t1,t2)
-+#define CONCAT1(x,y) x##y
-+#define CONCAT(x,y) CONCAT1(x,y)
- 
- /* Before including this file the following macros must be defined:
- 
-Index: elfutils-0.166/lib/system.h
-===================================================================
---- elfutils-0.166.orig/lib/system.h
-+++ elfutils-0.166/lib/system.h
-@@ -49,6 +49,16 @@
+diff --git a/lib/system.h b/lib/system.h
+index ccd99d6..0e93e60 100644
+--- a/lib/system.h
++++ b/lib/system.h
+@@ -55,6 +55,16 @@
  #else
  # error "Unknown byte order"
  #endif
@@ -171,12 +157,12 @@ Index: elfutils-0.166/lib/system.h
 +
 +#define error(status, errno, ...) err(status, __VA_ARGS__)
  
- extern void *xmalloc (size_t) __attribute__ ((__malloc__));
- extern void *xcalloc (size_t, size_t) __attribute__ ((__malloc__));
-Index: elfutils-0.166/lib/xmalloc.c
-===================================================================
---- elfutils-0.166.orig/lib/xmalloc.c
-+++ elfutils-0.166/lib/xmalloc.c
+ #ifndef MAX
+ #define MAX(m, n) ((m) < (n) ? (n) : (m))
+diff --git a/lib/xmalloc.c b/lib/xmalloc.c
+index 0cde384..217b054 100644
+--- a/lib/xmalloc.c
++++ b/lib/xmalloc.c
 @@ -30,7 +30,7 @@
  # include <config.h>
  #endif
@@ -186,10 +172,10 @@ Index: elfutils-0.166/lib/xmalloc.c
  #include <libintl.h>
  #include <stddef.h>
  #include <stdlib.h>
-Index: elfutils-0.166/libasm/asm_end.c
-===================================================================
---- elfutils-0.166.orig/libasm/asm_end.c
-+++ elfutils-0.166/libasm/asm_end.c
+diff --git a/libasm/asm_end.c b/libasm/asm_end.c
+index 191a535..bf5ab06 100644
+--- a/libasm/asm_end.c
++++ b/libasm/asm_end.c
 @@ -32,7 +32,7 @@
  #endif
  
@@ -199,10 +185,10 @@ Index: elfutils-0.166/libasm/asm_end.c
  #include <libintl.h>
  #include <stdio.h>
  #include <stdlib.h>
-Index: elfutils-0.166/libasm/asm_newscn.c
-===================================================================
---- elfutils-0.166.orig/libasm/asm_newscn.c
-+++ elfutils-0.166/libasm/asm_newscn.c
+diff --git a/libasm/asm_newscn.c b/libasm/asm_newscn.c
+index ddbb25d..74a598d 100644
+--- a/libasm/asm_newscn.c
++++ b/libasm/asm_newscn.c
 @@ -32,7 +32,7 @@
  #endif
  
@@ -212,10 +198,10 @@ Index: elfutils-0.166/libasm/asm_newscn.c
  #include <libintl.h>
  #include <stdlib.h>
  #include <string.h>
-Index: elfutils-0.166/libcpu/i386_gendis.c
-===================================================================
---- elfutils-0.166.orig/libcpu/i386_gendis.c
-+++ elfutils-0.166/libcpu/i386_gendis.c
+diff --git a/libcpu/i386_gendis.c b/libcpu/i386_gendis.c
+index aae5eae..6d76016 100644
+--- a/libcpu/i386_gendis.c
++++ b/libcpu/i386_gendis.c
 @@ -31,7 +31,7 @@
  # include <config.h>
  #endif
@@ -225,11 +211,11 @@ Index: elfutils-0.166/libcpu/i386_gendis.c
  #include <errno.h>
  #include <stdio.h>
  #include <stdlib.h>
-Index: elfutils-0.166/libcpu/i386_lex.c
-===================================================================
---- elfutils-0.166.orig/libcpu/i386_lex.c
-+++ elfutils-0.166/libcpu/i386_lex.c
-@@ -578,7 +578,7 @@ char *i386_text;
+diff --git a/libcpu/i386_lex.c b/libcpu/i386_lex.c
+index b670608..b842c25 100644
+--- a/libcpu/i386_lex.c
++++ b/libcpu/i386_lex.c
+@@ -592,7 +592,7 @@ char *i386_text;
  #endif
  
  #include <ctype.h>
@@ -237,11 +223,11 @@ Index: elfutils-0.166/libcpu/i386_lex.c
 +#include <err.h>
  #include <libintl.h>
  
- #include <system.h>
-Index: elfutils-0.166/libcpu/i386_parse.c
-===================================================================
---- elfutils-0.166.orig/libcpu/i386_parse.c
-+++ elfutils-0.166/libcpu/i386_parse.c
+ #include <libeu.h>
+diff --git a/libcpu/i386_parse.c b/libcpu/i386_parse.c
+index 724addf..5b67802 100644
+--- a/libcpu/i386_parse.c
++++ b/libcpu/i386_parse.c
 @@ -107,7 +107,7 @@
  #include <assert.h>
  #include <ctype.h>
@@ -251,24 +237,33 @@ Index: elfutils-0.166/libcpu/i386_parse.c
  #include <inttypes.h>
  #include <libintl.h>
  #include <math.h>
-Index: elfutils-0.166/libdw/Makefile.am
-===================================================================
---- elfutils-0.166.orig/libdw/Makefile.am
-+++ elfutils-0.166/libdw/Makefile.am
-@@ -117,7 +117,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map l
+diff --git a/libdw/Makefile.am b/libdw/Makefile.am
+index 082d96c..51cbea0 100644
+--- a/libdw/Makefile.am
++++ b/libdw/Makefile.am
+@@ -102,6 +102,8 @@ endif
+ libdw_pic_a_SOURCES =
+ am_libdw_pic_a_OBJECTS = $(libdw_a_SOURCES:.c=.os)
+ 
++fts_LDADD = -lfts
++
+ libdw_so_SOURCES =
+ libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
+ 	  ../libdwfl/libdwfl_pic.a ../libebl/libebl.a \
+@@ -112,7 +114,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
  		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
  		-Wl,--version-script,$<,--no-undefined \
  		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
--		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS)
-+		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS) -lfts -largp
+-		-ldl -lz $(argp_LDADD) $(zip_LIBS)
++		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(fts_LDADD)
  	@$(textrel_check)
  	$(AM_V_at)ln -fs $@ $@.$(VERSION)
  
-Index: elfutils-0.166/libdw/libdw_alloc.c
-===================================================================
---- elfutils-0.166.orig/libdw/libdw_alloc.c
-+++ elfutils-0.166/libdw/libdw_alloc.c
-@@ -31,11 +31,12 @@
+diff --git a/libdw/libdw_alloc.c b/libdw/libdw_alloc.c
+index 28a8cf6..29aeb3f 100644
+--- a/libdw/libdw_alloc.c
++++ b/libdw/libdw_alloc.c
+@@ -31,7 +31,7 @@
  # include <config.h>
  #endif
  
@@ -276,29 +271,11 @@ Index: elfutils-0.166/libdw/libdw_alloc.c
 +#include <err.h>
  #include <errno.h>
  #include <stdlib.h>
- #include <sys/param.h>
  #include "libdwP.h"
-+#include "system.h"
- 
- 
- void *
-Index: elfutils-0.166/libdwfl/Makefile.am
-===================================================================
---- elfutils-0.166.orig/libdwfl/Makefile.am
-+++ elfutils-0.166/libdwfl/Makefile.am
-@@ -84,6 +84,8 @@ libelf = ../libelf/libelf.so
- libebl = ../libebl/libebl.a
- libeu = ../lib/libeu.a
- 
-+LDADD = -lfts
-+
- libdwfl_pic_a_SOURCES =
- am_libdwfl_pic_a_OBJECTS = $(libdwfl_a_SOURCES:.c=.os)
- 
-Index: elfutils-0.166/libdwfl/dwfl_build_id_find_elf.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/dwfl_build_id_find_elf.c
-+++ elfutils-0.166/libdwfl/dwfl_build_id_find_elf.c
+diff --git a/libdwfl/dwfl_build_id_find_elf.c b/libdwfl/dwfl_build_id_find_elf.c
+index 903e193..b00d10c 100644
+--- a/libdwfl/dwfl_build_id_find_elf.c
++++ b/libdwfl/dwfl_build_id_find_elf.c
 @@ -27,6 +27,7 @@
     not, see <http://www.gnu.org/licenses/>.  */
  
@@ -307,7 +284,7 @@ Index: elfutils-0.166/libdwfl/dwfl_build_id_find_elf.c
  #include <inttypes.h>
  #include <fcntl.h>
  #include <unistd.h>
-@@ -94,7 +95,7 @@ __libdwfl_open_by_build_id (Dwfl_Module
+@@ -94,7 +95,7 @@ __libdwfl_open_by_build_id (Dwfl_Module *mod, bool debug, char **file_name,
  	{
  	  if (*file_name != NULL)
  	    free (*file_name);
@@ -316,10 +293,10 @@ Index: elfutils-0.166/libdwfl/dwfl_build_id_find_elf.c
  	  if (*file_name == NULL)
  	    {
  	      *file_name = name;
-Index: elfutils-0.166/libdwfl/dwfl_error.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/dwfl_error.c
-+++ elfutils-0.166/libdwfl/dwfl_error.c
+diff --git a/libdwfl/dwfl_error.c b/libdwfl/dwfl_error.c
+index 7bcf61c..c345797 100644
+--- a/libdwfl/dwfl_error.c
++++ b/libdwfl/dwfl_error.c
 @@ -140,6 +140,7 @@ __libdwfl_seterrno (Dwfl_Error error)
  const char *
  dwfl_errmsg (int error)
@@ -338,10 +315,10 @@ Index: elfutils-0.166/libdwfl/dwfl_error.c
      case OTHER_ERROR (LIBELF):
        return elf_errmsg (error & 0xffff);
      case OTHER_ERROR (LIBDW):
-Index: elfutils-0.166/libdwfl/dwfl_module_getdwarf.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/dwfl_module_getdwarf.c
-+++ elfutils-0.166/libdwfl/dwfl_module_getdwarf.c
+diff --git a/libdwfl/dwfl_module_getdwarf.c b/libdwfl/dwfl_module_getdwarf.c
+index 0e8810b..82ad665 100644
+--- a/libdwfl/dwfl_module_getdwarf.c
++++ b/libdwfl/dwfl_module_getdwarf.c
 @@ -31,6 +31,7 @@
  #include <fcntl.h>
  #include <string.h>
@@ -350,11 +327,11 @@ Index: elfutils-0.166/libdwfl/dwfl_module_getdwarf.c
  #include "../libdw/libdwP.h"	/* DWARF_E_* values are here.  */
  #include "../libelf/libelfP.h"
  
-Index: elfutils-0.166/libdwfl/find-debuginfo.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/find-debuginfo.c
-+++ elfutils-0.166/libdwfl/find-debuginfo.c
-@@ -385,7 +385,7 @@ dwfl_standard_find_debuginfo (Dwfl_Modul
+diff --git a/libdwfl/find-debuginfo.c b/libdwfl/find-debuginfo.c
+index 80515db..80b0148 100644
+--- a/libdwfl/find-debuginfo.c
++++ b/libdwfl/find-debuginfo.c
+@@ -385,7 +385,7 @@ dwfl_standard_find_debuginfo (Dwfl_Module *mod,
        /* If FILE_NAME is a symlink, the debug file might be associated
  	 with the symlink target name instead.  */
  
@@ -363,10 +340,10 @@ Index: elfutils-0.166/libdwfl/find-debuginfo.c
        if (canon != NULL && strcmp (file_name, canon))
  	fd = find_debuginfo_in_path (mod, canon,
  				     debuglink_file, debuglink_crc,
-Index: elfutils-0.166/libdwfl/libdwfl_crc32_file.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/libdwfl_crc32_file.c
-+++ elfutils-0.166/libdwfl/libdwfl_crc32_file.c
+diff --git a/libdwfl/libdwfl_crc32_file.c b/libdwfl/libdwfl_crc32_file.c
+index 6b6b7d3..debc4a4 100644
+--- a/libdwfl/libdwfl_crc32_file.c
++++ b/libdwfl/libdwfl_crc32_file.c
 @@ -31,6 +31,16 @@
  
  #define crc32_file attribute_hidden __libdwfl_crc32_file
@@ -384,11 +361,11 @@ Index: elfutils-0.166/libdwfl/libdwfl_crc32_file.c
  #define LIB_SYSTEM_H	1
  #include <libdwflP.h>
  #include "../lib/crc32_file.c"
-Index: elfutils-0.166/libdwfl/linux-kernel-modules.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/linux-kernel-modules.c
-+++ elfutils-0.166/libdwfl/linux-kernel-modules.c
-@@ -34,6 +34,7 @@
+diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
+index 9cd8ea9..4dbf4c5 100644
+--- a/libdwfl/linux-kernel-modules.c
++++ b/libdwfl/linux-kernel-modules.c
+@@ -36,6 +36,7 @@
  #include <config.h>
  
  #include "libdwflP.h"
@@ -396,10 +373,10 @@ Index: elfutils-0.166/libdwfl/linux-kernel-modules.c
  #include <inttypes.h>
  #include <errno.h>
  #include <stdio.h>
-Index: elfutils-0.166/libebl/eblopenbackend.c
-===================================================================
---- elfutils-0.166.orig/libebl/eblopenbackend.c
-+++ elfutils-0.166/libebl/eblopenbackend.c
+diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
+index 34d439a..56d2345 100644
+--- a/libebl/eblopenbackend.c
++++ b/libebl/eblopenbackend.c
 @@ -32,7 +32,7 @@
  
  #include <assert.h>
@@ -409,23 +386,10 @@ Index: elfutils-0.166/libebl/eblopenbackend.c
  #include <libelfP.h>
  #include <dwarf.h>
  #include <stdlib.h>
-Index: elfutils-0.166/libebl/eblwstrtab.c
-===================================================================
---- elfutils-0.166.orig/libebl/eblwstrtab.c
-+++ elfutils-0.166/libebl/eblwstrtab.c
-@@ -305,7 +305,7 @@ copystrings (struct Ebl_WStrent *nodep,
- 
-   /* Process the current node.  */
-   nodep->offset = *offsetp;
--  *freep = wmempcpy (*freep, nodep->string, nodep->len);
-+  *freep = wmemcpy (*freep, nodep->string, nodep->len) + nodep->len;
-   *offsetp += nodep->len * sizeof (wchar_t);
- 
-   for (subs = nodep->next; subs != NULL; subs = subs->next)
-Index: elfutils-0.166/libelf/elf.h
-===================================================================
---- elfutils-0.166.orig/libelf/elf.h
-+++ elfutils-0.166/libelf/elf.h
+diff --git a/libelf/elf.h b/libelf/elf.h
+index 74654d6..81eee8b 100644
+--- a/libelf/elf.h
++++ b/libelf/elf.h
 @@ -21,7 +21,9 @@
  
  #include <features.h>
@@ -437,21 +401,20 @@ Index: elfutils-0.166/libelf/elf.h
  
  /* Standard ELF types.  */
  
-@@ -3591,7 +3593,8 @@ enum
- 
- #define R_TILEGX_NUM		130
+@@ -3704,6 +3706,8 @@ enum
+ #define R_BPF_NONE		0	/* No reloc */
+ #define R_BPF_MAP_FD		1	/* Map fd to pointer */
  
--
 -__END_DECLS
 +#ifdef __cplusplus
 +}
 +#endif
  
  #endif	/* elf.h */
-Index: elfutils-0.166/libelf/libelf.h
-===================================================================
---- elfutils-0.166.orig/libelf/libelf.h
-+++ elfutils-0.166/libelf/libelf.h
+diff --git a/libelf/libelf.h b/libelf/libelf.h
+index c0d6389..38a68fd 100644
+--- a/libelf/libelf.h
++++ b/libelf/libelf.h
 @@ -29,6 +29,7 @@
  #ifndef _LIBELF_H
  #define _LIBELF_H 1
@@ -460,10 +423,10 @@ Index: elfutils-0.166/libelf/libelf.h
  #include <stdint.h>
  #include <sys/types.h>
  
-Index: elfutils-0.166/libelf/libelfP.h
-===================================================================
---- elfutils-0.166.orig/libelf/libelfP.h
-+++ elfutils-0.166/libelf/libelfP.h
+diff --git a/libelf/libelfP.h b/libelf/libelfP.h
+index 4459982..1296f20 100644
+--- a/libelf/libelfP.h
++++ b/libelf/libelfP.h
 @@ -36,6 +36,7 @@
  
  #include <ar.h>
@@ -472,10 +435,10 @@ Index: elfutils-0.166/libelf/libelfP.h
  
  #include <errno.h>
  #include <stdbool.h>
-Index: elfutils-0.166/src/addr2line.c
-===================================================================
---- elfutils-0.166.orig/src/addr2line.c
-+++ elfutils-0.166/src/addr2line.c
+diff --git a/src/addr2line.c b/src/addr2line.c
+index 0222088..cd6a9a6 100644
+--- a/src/addr2line.c
++++ b/src/addr2line.c
 @@ -23,7 +23,7 @@
  #include <argp.h>
  #include <assert.h>
@@ -485,10 +448,10 @@ Index: elfutils-0.166/src/addr2line.c
  #include <fcntl.h>
  #include <inttypes.h>
  #include <libdwfl.h>
-Index: elfutils-0.166/src/ar.c
-===================================================================
---- elfutils-0.166.orig/src/ar.c
-+++ elfutils-0.166/src/ar.c
+diff --git a/src/ar.c b/src/ar.c
+index f2f322b..6e70031 100644
+--- a/src/ar.c
++++ b/src/ar.c
 @@ -22,7 +22,7 @@
  
  #include <argp.h>
@@ -498,10 +461,10 @@ Index: elfutils-0.166/src/ar.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <libintl.h>
-Index: elfutils-0.166/src/arlib.c
-===================================================================
---- elfutils-0.166.orig/src/arlib.c
-+++ elfutils-0.166/src/arlib.c
+diff --git a/src/arlib.c b/src/arlib.c
+index e0839aa..1143658 100644
+--- a/src/arlib.c
++++ b/src/arlib.c
 @@ -21,7 +21,7 @@
  #endif
  
@@ -509,12 +472,12 @@ Index: elfutils-0.166/src/arlib.c
 -#include <error.h>
 +#include <err.h>
  #include <gelf.h>
+ #include <inttypes.h>
  #include <libintl.h>
- #include <stdio.h>
-Index: elfutils-0.166/src/arlib2.c
-===================================================================
---- elfutils-0.166.orig/src/arlib2.c
-+++ elfutils-0.166/src/arlib2.c
+diff --git a/src/arlib2.c b/src/arlib2.c
+index 553fc57..46443d0 100644
+--- a/src/arlib2.c
++++ b/src/arlib2.c
 @@ -20,7 +20,7 @@
  # include <config.h>
  #endif
@@ -524,10 +487,10 @@ Index: elfutils-0.166/src/arlib2.c
  #include <libintl.h>
  #include <limits.h>
  #include <string.h>
-Index: elfutils-0.166/src/elfcmp.c
-===================================================================
---- elfutils-0.166.orig/src/elfcmp.c
-+++ elfutils-0.166/src/elfcmp.c
+diff --git a/src/elfcmp.c b/src/elfcmp.c
+index 401ab31..873d253 100644
+--- a/src/elfcmp.c
++++ b/src/elfcmp.c
 @@ -23,7 +23,7 @@
  #include <argp.h>
  #include <assert.h>
@@ -537,10 +500,10 @@ Index: elfutils-0.166/src/elfcmp.c
  #include <fcntl.h>
  #include <locale.h>
  #include <libintl.h>
-Index: elfutils-0.166/src/elflint.c
-===================================================================
---- elfutils-0.166.orig/src/elflint.c
-+++ elfutils-0.166/src/elflint.c
+diff --git a/src/elflint.c b/src/elflint.c
+index 7d3f227..074d21c 100644
+--- a/src/elflint.c
++++ b/src/elflint.c
 @@ -24,7 +24,7 @@
  #include <assert.h>
  #include <byteswap.h>
@@ -550,10 +513,10 @@ Index: elfutils-0.166/src/elflint.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.166/src/findtextrel.c
-===================================================================
---- elfutils-0.166.orig/src/findtextrel.c
-+++ elfutils-0.166/src/findtextrel.c
+diff --git a/src/findtextrel.c b/src/findtextrel.c
+index dc41502..325888c 100644
+--- a/src/findtextrel.c
++++ b/src/findtextrel.c
 @@ -23,7 +23,7 @@
  #include <argp.h>
  #include <assert.h>
@@ -563,75 +526,10 @@ Index: elfutils-0.166/src/findtextrel.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <libdw.h>
-Index: elfutils-0.166/src/i386_ld.c
-===================================================================
---- elfutils-0.166.orig/src/i386_ld.c
-+++ elfutils-0.166/src/i386_ld.c
-@@ -20,7 +20,7 @@
- #endif
- 
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stdlib.h>
- #include <string.h>
-Index: elfutils-0.166/src/ld.c
-===================================================================
---- elfutils-0.166.orig/src/ld.c
-+++ elfutils-0.166/src/ld.c
-@@ -21,7 +21,7 @@
- 
- #include <argp.h>
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <libelf.h>
- #include <libintl.h>
-Index: elfutils-0.166/src/ldgeneric.c
-===================================================================
---- elfutils-0.166.orig/src/ldgeneric.c
-+++ elfutils-0.166/src/ldgeneric.c
-@@ -23,7 +23,7 @@
- #include <ctype.h>
- #include <dlfcn.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <fnmatch.h>
- #include <gelf.h>
-Index: elfutils-0.166/src/ldlex.c
-===================================================================
---- elfutils-0.166.orig/src/ldlex.c
-+++ elfutils-0.166/src/ldlex.c
-@@ -1106,7 +1106,7 @@ char *ldtext;
- #include <assert.h>
- #include <ctype.h>
- #include <elf.h>
--#include <error.h>
-+#include <err.h>
- #include <inttypes.h>
- #include <libintl.h>
- #include <stdbool.h>
-Index: elfutils-0.166/src/ldscript.c
-===================================================================
---- elfutils-0.166.orig/src/ldscript.c
-+++ elfutils-0.166/src/ldscript.c
-@@ -95,7 +95,7 @@
- #endif
- 
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stdbool.h>
- #include <stdint.h>
-Index: elfutils-0.166/src/nm.c
-===================================================================
---- elfutils-0.166.orig/src/nm.c
-+++ elfutils-0.166/src/nm.c
+diff --git a/src/nm.c b/src/nm.c
+index c54e96f..9e031d9 100644
+--- a/src/nm.c
++++ b/src/nm.c
 @@ -26,7 +26,7 @@
  #include <ctype.h>
  #include <dwarf.h>
@@ -641,10 +539,10 @@ Index: elfutils-0.166/src/nm.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.166/src/objdump.c
-===================================================================
---- elfutils-0.166.orig/src/objdump.c
-+++ elfutils-0.166/src/objdump.c
+diff --git a/src/objdump.c b/src/objdump.c
+index fff4b81..4b1f966 100644
+--- a/src/objdump.c
++++ b/src/objdump.c
 @@ -21,7 +21,7 @@
  #endif
  
@@ -654,10 +552,10 @@ Index: elfutils-0.166/src/objdump.c
  #include <fcntl.h>
  #include <inttypes.h>
  #include <libintl.h>
-Index: elfutils-0.166/src/ranlib.c
-===================================================================
---- elfutils-0.166.orig/src/ranlib.c
-+++ elfutils-0.166/src/ranlib.c
+diff --git a/src/ranlib.c b/src/ranlib.c
+index 41a3bcf..0c7da2c 100644
+--- a/src/ranlib.c
++++ b/src/ranlib.c
 @@ -24,7 +24,7 @@
  #include <argp.h>
  #include <assert.h>
@@ -667,10 +565,10 @@ Index: elfutils-0.166/src/ranlib.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <libintl.h>
-Index: elfutils-0.166/src/readelf.c
-===================================================================
---- elfutils-0.166.orig/src/readelf.c
-+++ elfutils-0.166/src/readelf.c
+diff --git a/src/readelf.c b/src/readelf.c
+index d18a4b7..a6cfb35 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
 @@ -25,7 +25,7 @@
  #include <ctype.h>
  #include <dwarf.h>
@@ -680,10 +578,10 @@ Index: elfutils-0.166/src/readelf.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.166/src/size.c
-===================================================================
---- elfutils-0.166.orig/src/size.c
-+++ elfutils-0.166/src/size.c
+diff --git a/src/size.c b/src/size.c
+index de0d791..4639d42 100644
+--- a/src/size.c
++++ b/src/size.c
 @@ -21,7 +21,7 @@
  #endif
  
@@ -693,10 +591,10 @@ Index: elfutils-0.166/src/size.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.166/src/stack.c
-===================================================================
---- elfutils-0.166.orig/src/stack.c
-+++ elfutils-0.166/src/stack.c
+diff --git a/src/stack.c b/src/stack.c
+index a5a7beb..4c075bc 100644
+--- a/src/stack.c
++++ b/src/stack.c
 @@ -18,7 +18,7 @@
  #include <config.h>
  #include <assert.h>
@@ -706,10 +604,10 @@ Index: elfutils-0.166/src/stack.c
  #include <stdlib.h>
  #include <inttypes.h>
  #include <stdio.h>
-Index: elfutils-0.166/src/strings.c
-===================================================================
---- elfutils-0.166.orig/src/strings.c
-+++ elfutils-0.166/src/strings.c
+diff --git a/src/strings.c b/src/strings.c
+index 49aab8b..09d5b1c 100644
+--- a/src/strings.c
++++ b/src/strings.c
 @@ -25,7 +25,7 @@
  #include <ctype.h>
  #include <endian.h>
@@ -719,10 +617,10 @@ Index: elfutils-0.166/src/strings.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.166/src/strip.c
-===================================================================
---- elfutils-0.166.orig/src/strip.c
-+++ elfutils-0.166/src/strip.c
+diff --git a/src/strip.c b/src/strip.c
+index a875ddf..fd76f7f 100644
+--- a/src/strip.c
++++ b/src/strip.c
 @@ -24,7 +24,7 @@
  #include <assert.h>
  #include <byteswap.h>
@@ -732,10 +630,10 @@ Index: elfutils-0.166/src/strip.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <libelf.h>
-Index: elfutils-0.166/src/unstrip.c
-===================================================================
---- elfutils-0.166.orig/src/unstrip.c
-+++ elfutils-0.166/src/unstrip.c
+diff --git a/src/unstrip.c b/src/unstrip.c
+index d838ae9..0108272 100644
+--- a/src/unstrip.c
++++ b/src/unstrip.c
 @@ -31,7 +31,7 @@
  #include <argp.h>
  #include <assert.h>
@@ -745,10 +643,10 @@ Index: elfutils-0.166/src/unstrip.c
  #include <fcntl.h>
  #include <fnmatch.h>
  #include <libintl.h>
-Index: elfutils-0.166/tests/addrscopes.c
-===================================================================
---- elfutils-0.166.orig/tests/addrscopes.c
-+++ elfutils-0.166/tests/addrscopes.c
+diff --git a/tests/addrscopes.c b/tests/addrscopes.c
+index 791569f..54f4311 100644
+--- a/tests/addrscopes.c
++++ b/tests/addrscopes.c
 @@ -25,7 +25,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -758,10 +656,10 @@ Index: elfutils-0.166/tests/addrscopes.c
  #include <string.h>
  
  
-Index: elfutils-0.166/tests/allregs.c
-===================================================================
---- elfutils-0.166.orig/tests/allregs.c
-+++ elfutils-0.166/tests/allregs.c
+diff --git a/tests/allregs.c b/tests/allregs.c
+index 286f7e3..c9de089 100644
+--- a/tests/allregs.c
++++ b/tests/allregs.c
 @@ -21,7 +21,7 @@
  #include <stdio.h>
  #include <stdlib.h>
@@ -771,10 +669,10 @@ Index: elfutils-0.166/tests/allregs.c
  #include <locale.h>
  #include <argp.h>
  #include <assert.h>
-Index: elfutils-0.166/tests/backtrace-data.c
-===================================================================
---- elfutils-0.166.orig/tests/backtrace-data.c
-+++ elfutils-0.166/tests/backtrace-data.c
+diff --git a/tests/backtrace-data.c b/tests/backtrace-data.c
+index b7158da..354fa6a 100644
+--- a/tests/backtrace-data.c
++++ b/tests/backtrace-data.c
 @@ -27,7 +27,7 @@
  #include <dirent.h>
  #include <stdlib.h>
@@ -784,10 +682,10 @@ Index: elfutils-0.166/tests/backtrace-data.c
  #include <unistd.h>
  #include <dwarf.h>
  #if defined(__x86_64__) && defined(__linux__)
-Index: elfutils-0.166/tests/backtrace-dwarf.c
-===================================================================
---- elfutils-0.166.orig/tests/backtrace-dwarf.c
-+++ elfutils-0.166/tests/backtrace-dwarf.c
+diff --git a/tests/backtrace-dwarf.c b/tests/backtrace-dwarf.c
+index a644c8a..b8cbe27 100644
+--- a/tests/backtrace-dwarf.c
++++ b/tests/backtrace-dwarf.c
 @@ -22,7 +22,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -797,10 +695,10 @@ Index: elfutils-0.166/tests/backtrace-dwarf.c
  #include <unistd.h>
  #include <sys/ptrace.h>
  #include <sys/types.h>
-Index: elfutils-0.166/tests/backtrace.c
-===================================================================
---- elfutils-0.166.orig/tests/backtrace.c
-+++ elfutils-0.166/tests/backtrace.c
+diff --git a/tests/backtrace.c b/tests/backtrace.c
+index 1ff6353..47e3f7b 100644
+--- a/tests/backtrace.c
++++ b/tests/backtrace.c
 @@ -24,7 +24,7 @@
  #include <dirent.h>
  #include <stdlib.h>
@@ -810,10 +708,10 @@ Index: elfutils-0.166/tests/backtrace.c
  #include <unistd.h>
  #include <dwarf.h>
  #ifdef __linux__
-Index: elfutils-0.166/tests/buildid.c
-===================================================================
---- elfutils-0.166.orig/tests/buildid.c
-+++ elfutils-0.166/tests/buildid.c
+diff --git a/tests/buildid.c b/tests/buildid.c
+index 87c1877..2953e6b 100644
+--- a/tests/buildid.c
++++ b/tests/buildid.c
 @@ -23,7 +23,7 @@
  #include ELFUTILS_HEADER(elf)
  #include ELFUTILS_HEADER(dwelf)
@@ -823,10 +721,10 @@ Index: elfutils-0.166/tests/buildid.c
  #include <string.h>
  #include <stdlib.h>
  #include <sys/types.h>
-Index: elfutils-0.166/tests/debugaltlink.c
-===================================================================
---- elfutils-0.166.orig/tests/debugaltlink.c
-+++ elfutils-0.166/tests/debugaltlink.c
+diff --git a/tests/debugaltlink.c b/tests/debugaltlink.c
+index 6d97d50..ee7e559 100644
+--- a/tests/debugaltlink.c
++++ b/tests/debugaltlink.c
 @@ -23,7 +23,7 @@
  #include ELFUTILS_HEADER(dw)
  #include ELFUTILS_HEADER(dwelf)
@@ -836,10 +734,10 @@ Index: elfutils-0.166/tests/debugaltlink.c
  #include <string.h>
  #include <stdlib.h>
  #include <sys/types.h>
-Index: elfutils-0.166/tests/debuglink.c
-===================================================================
---- elfutils-0.166.orig/tests/debuglink.c
-+++ elfutils-0.166/tests/debuglink.c
+diff --git a/tests/debuglink.c b/tests/debuglink.c
+index 935d102..741cb81 100644
+--- a/tests/debuglink.c
++++ b/tests/debuglink.c
 @@ -21,7 +21,7 @@
  #include <errno.h>
  #include ELFUTILS_HEADER(dwelf)
@@ -849,10 +747,10 @@ Index: elfutils-0.166/tests/debuglink.c
  #include <string.h>
  #include <stdlib.h>
  #include <sys/types.h>
-Index: elfutils-0.166/tests/deleted.c
-===================================================================
---- elfutils-0.166.orig/tests/deleted.c
-+++ elfutils-0.166/tests/deleted.c
+diff --git a/tests/deleted.c b/tests/deleted.c
+index 6be35bc..0190711 100644
+--- a/tests/deleted.c
++++ b/tests/deleted.c
 @@ -21,7 +21,7 @@
  #include <unistd.h>
  #include <assert.h>
@@ -862,10 +760,10 @@ Index: elfutils-0.166/tests/deleted.c
  #include <errno.h>
  #ifdef __linux__
  #include <sys/prctl.h>
-Index: elfutils-0.166/tests/dwfl-addr-sect.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfl-addr-sect.c
-+++ elfutils-0.166/tests/dwfl-addr-sect.c
+diff --git a/tests/dwfl-addr-sect.c b/tests/dwfl-addr-sect.c
+index 21e470a..1ea1e3b 100644
+--- a/tests/dwfl-addr-sect.c
++++ b/tests/dwfl-addr-sect.c
 @@ -23,7 +23,7 @@
  #include <stdio_ext.h>
  #include <stdlib.h>
@@ -875,10 +773,10 @@ Index: elfutils-0.166/tests/dwfl-addr-sect.c
  #include <locale.h>
  #include <argp.h>
  #include ELFUTILS_HEADER(dwfl)
-Index: elfutils-0.166/tests/dwfl-bug-addr-overflow.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfl-bug-addr-overflow.c
-+++ elfutils-0.166/tests/dwfl-bug-addr-overflow.c
+diff --git a/tests/dwfl-bug-addr-overflow.c b/tests/dwfl-bug-addr-overflow.c
+index aa8030e..02c8bef 100644
+--- a/tests/dwfl-bug-addr-overflow.c
++++ b/tests/dwfl-bug-addr-overflow.c
 @@ -20,7 +20,7 @@
  #include <inttypes.h>
  #include <stdio.h>
@@ -888,10 +786,10 @@ Index: elfutils-0.166/tests/dwfl-bug-addr-overflow.c
  #include <locale.h>
  #include ELFUTILS_HEADER(dwfl)
  
-Index: elfutils-0.166/tests/dwfl-bug-fd-leak.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfl-bug-fd-leak.c
-+++ elfutils-0.166/tests/dwfl-bug-fd-leak.c
+diff --git a/tests/dwfl-bug-fd-leak.c b/tests/dwfl-bug-fd-leak.c
+index 689cdd7..5973da3 100644
+--- a/tests/dwfl-bug-fd-leak.c
++++ b/tests/dwfl-bug-fd-leak.c
 @@ -24,7 +24,7 @@
  #include <dirent.h>
  #include <stdlib.h>
@@ -901,10 +799,10 @@ Index: elfutils-0.166/tests/dwfl-bug-fd-leak.c
  #include <unistd.h>
  #include <dwarf.h>
  
-Index: elfutils-0.166/tests/dwfl-bug-getmodules.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfl-bug-getmodules.c
-+++ elfutils-0.166/tests/dwfl-bug-getmodules.c
+diff --git a/tests/dwfl-bug-getmodules.c b/tests/dwfl-bug-getmodules.c
+index 1ee989f..fd62e65 100644
+--- a/tests/dwfl-bug-getmodules.c
++++ b/tests/dwfl-bug-getmodules.c
 @@ -18,7 +18,7 @@
  #include <config.h>
  #include ELFUTILS_HEADER(dwfl)
@@ -914,10 +812,10 @@ Index: elfutils-0.166/tests/dwfl-bug-getmodules.c
  
  static const Dwfl_Callbacks callbacks =
    {
-Index: elfutils-0.166/tests/dwfl-report-elf-align.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfl-report-elf-align.c
-+++ elfutils-0.166/tests/dwfl-report-elf-align.c
+diff --git a/tests/dwfl-report-elf-align.c b/tests/dwfl-report-elf-align.c
+index a4e97d3..f471587 100644
+--- a/tests/dwfl-report-elf-align.c
++++ b/tests/dwfl-report-elf-align.c
 @@ -20,7 +20,7 @@
  #include <inttypes.h>
  #include <stdio.h>
@@ -927,10 +825,10 @@ Index: elfutils-0.166/tests/dwfl-report-elf-align.c
  #include <locale.h>
  #include <string.h>
  #include <stdlib.h>
-Index: elfutils-0.166/tests/dwfllines.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfllines.c
-+++ elfutils-0.166/tests/dwfllines.c
+diff --git a/tests/dwfllines.c b/tests/dwfllines.c
+index 90379dd..cbdf6c4 100644
+--- a/tests/dwfllines.c
++++ b/tests/dwfllines.c
 @@ -27,7 +27,7 @@
  #include <stdio.h>
  #include <stdlib.h>
@@ -940,10 +838,10 @@ Index: elfutils-0.166/tests/dwfllines.c
  
  int
  main (int argc, char *argv[])
-Index: elfutils-0.166/tests/dwflmodtest.c
-===================================================================
---- elfutils-0.166.orig/tests/dwflmodtest.c
-+++ elfutils-0.166/tests/dwflmodtest.c
+diff --git a/tests/dwflmodtest.c b/tests/dwflmodtest.c
+index 0027f96..e68d3bc 100644
+--- a/tests/dwflmodtest.c
++++ b/tests/dwflmodtest.c
 @@ -23,7 +23,7 @@
  #include <stdio_ext.h>
  #include <stdlib.h>
@@ -953,10 +851,10 @@ Index: elfutils-0.166/tests/dwflmodtest.c
  #include <locale.h>
  #include <argp.h>
  #include ELFUTILS_HEADER(dwfl)
-Index: elfutils-0.166/tests/dwflsyms.c
-===================================================================
---- elfutils-0.166.orig/tests/dwflsyms.c
-+++ elfutils-0.166/tests/dwflsyms.c
+diff --git a/tests/dwflsyms.c b/tests/dwflsyms.c
+index 49ac334..cf07830 100644
+--- a/tests/dwflsyms.c
++++ b/tests/dwflsyms.c
 @@ -25,7 +25,7 @@
  #include <stdio.h>
  #include <stdio_ext.h>
@@ -966,10 +864,10 @@ Index: elfutils-0.166/tests/dwflsyms.c
  #include <string.h>
  
  static const char *
-Index: elfutils-0.166/tests/early-offscn.c
-===================================================================
---- elfutils-0.166.orig/tests/early-offscn.c
-+++ elfutils-0.166/tests/early-offscn.c
+diff --git a/tests/early-offscn.c b/tests/early-offscn.c
+index 924cb9e..6f60d5a 100644
+--- a/tests/early-offscn.c
++++ b/tests/early-offscn.c
 @@ -19,7 +19,7 @@
  #endif
  
@@ -979,10 +877,10 @@ Index: elfutils-0.166/tests/early-offscn.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <stdio.h>
-Index: elfutils-0.166/tests/ecp.c
-===================================================================
---- elfutils-0.166.orig/tests/ecp.c
-+++ elfutils-0.166/tests/ecp.c
+diff --git a/tests/ecp.c b/tests/ecp.c
+index 38a6859..743cea5 100644
+--- a/tests/ecp.c
++++ b/tests/ecp.c
 @@ -20,7 +20,7 @@
  #endif
  
@@ -992,10 +890,10 @@ Index: elfutils-0.166/tests/ecp.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <stdlib.h>
-Index: elfutils-0.166/tests/find-prologues.c
-===================================================================
---- elfutils-0.166.orig/tests/find-prologues.c
-+++ elfutils-0.166/tests/find-prologues.c
+diff --git a/tests/find-prologues.c b/tests/find-prologues.c
+index ba8ae37..76f5f04 100644
+--- a/tests/find-prologues.c
++++ b/tests/find-prologues.c
 @@ -25,7 +25,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -1005,10 +903,10 @@ Index: elfutils-0.166/tests/find-prologues.c
  #include <string.h>
  #include <fnmatch.h>
  
-Index: elfutils-0.166/tests/funcretval.c
-===================================================================
---- elfutils-0.166.orig/tests/funcretval.c
-+++ elfutils-0.166/tests/funcretval.c
+diff --git a/tests/funcretval.c b/tests/funcretval.c
+index 8d19d11..c8aaa93 100644
+--- a/tests/funcretval.c
++++ b/tests/funcretval.c
 @@ -25,7 +25,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -1018,10 +916,10 @@ Index: elfutils-0.166/tests/funcretval.c
  #include <string.h>
  #include <fnmatch.h>
  
-Index: elfutils-0.166/tests/funcscopes.c
-===================================================================
---- elfutils-0.166.orig/tests/funcscopes.c
-+++ elfutils-0.166/tests/funcscopes.c
+diff --git a/tests/funcscopes.c b/tests/funcscopes.c
+index 9c90185..dbccb89 100644
+--- a/tests/funcscopes.c
++++ b/tests/funcscopes.c
 @@ -25,7 +25,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -1031,10 +929,10 @@ Index: elfutils-0.166/tests/funcscopes.c
  #include <string.h>
  #include <fnmatch.h>
  
-Index: elfutils-0.166/tests/getsrc_die.c
-===================================================================
---- elfutils-0.166.orig/tests/getsrc_die.c
-+++ elfutils-0.166/tests/getsrc_die.c
+diff --git a/tests/getsrc_die.c b/tests/getsrc_die.c
+index 055aede..9c394dd 100644
+--- a/tests/getsrc_die.c
++++ b/tests/getsrc_die.c
 @@ -19,7 +19,7 @@
  #endif
  
@@ -1044,10 +942,10 @@ Index: elfutils-0.166/tests/getsrc_die.c
  #include <fcntl.h>
  #include <inttypes.h>
  #include <libelf.h>
-Index: elfutils-0.166/tests/line2addr.c
-===================================================================
---- elfutils-0.166.orig/tests/line2addr.c
-+++ elfutils-0.166/tests/line2addr.c
+diff --git a/tests/line2addr.c b/tests/line2addr.c
+index e0d65d3..9bf0023 100644
+--- a/tests/line2addr.c
++++ b/tests/line2addr.c
 @@ -26,7 +26,7 @@
  #include <locale.h>
  #include <stdlib.h>
@@ -1057,10 +955,10 @@ Index: elfutils-0.166/tests/line2addr.c
  
  
  static void
-Index: elfutils-0.166/tests/low_high_pc.c
-===================================================================
---- elfutils-0.166.orig/tests/low_high_pc.c
-+++ elfutils-0.166/tests/low_high_pc.c
+diff --git a/tests/low_high_pc.c b/tests/low_high_pc.c
+index d0f4302..8da4fbd 100644
+--- a/tests/low_high_pc.c
++++ b/tests/low_high_pc.c
 @@ -25,7 +25,7 @@
  #include <stdio_ext.h>
  #include <locale.h>
@@ -1070,10 +968,10 @@ Index: elfutils-0.166/tests/low_high_pc.c
  #include <string.h>
  #include <fnmatch.h>
  
-Index: elfutils-0.166/tests/md5-sha1-test.c
-===================================================================
---- elfutils-0.166.orig/tests/md5-sha1-test.c
-+++ elfutils-0.166/tests/md5-sha1-test.c
+diff --git a/tests/md5-sha1-test.c b/tests/md5-sha1-test.c
+index d50355e..3c41f40 100644
+--- a/tests/md5-sha1-test.c
++++ b/tests/md5-sha1-test.c
 @@ -19,7 +19,7 @@
  #endif
  
@@ -1083,10 +981,10 @@ Index: elfutils-0.166/tests/md5-sha1-test.c
  
  #include "md5.h"
  #include "sha1.h"
-Index: elfutils-0.166/tests/rdwrmmap.c
-===================================================================
---- elfutils-0.166.orig/tests/rdwrmmap.c
-+++ elfutils-0.166/tests/rdwrmmap.c
+diff --git a/tests/rdwrmmap.c b/tests/rdwrmmap.c
+index 6f027df..1ce5e6e 100644
+--- a/tests/rdwrmmap.c
++++ b/tests/rdwrmmap.c
 @@ -19,7 +19,7 @@
  #endif
  
@@ -1096,10 +994,10 @@ Index: elfutils-0.166/tests/rdwrmmap.c
  #include <stdio.h>
  #include <fcntl.h>
  #include <unistd.h>
-Index: elfutils-0.166/tests/saridx.c
-===================================================================
---- elfutils-0.166.orig/tests/saridx.c
-+++ elfutils-0.166/tests/saridx.c
+diff --git a/tests/saridx.c b/tests/saridx.c
+index 8a450d8..b387801 100644
+--- a/tests/saridx.c
++++ b/tests/saridx.c
 @@ -17,7 +17,7 @@
  
  #include <config.h>
@@ -1109,10 +1007,10 @@ Index: elfutils-0.166/tests/saridx.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <stdio.h>
-Index: elfutils-0.166/tests/sectiondump.c
-===================================================================
---- elfutils-0.166.orig/tests/sectiondump.c
-+++ elfutils-0.166/tests/sectiondump.c
+diff --git a/tests/sectiondump.c b/tests/sectiondump.c
+index 3033fed..8e888db 100644
+--- a/tests/sectiondump.c
++++ b/tests/sectiondump.c
 @@ -18,7 +18,7 @@
  #include <config.h>
  
@@ -1122,10 +1020,10 @@ Index: elfutils-0.166/tests/sectiondump.c
  #include <fcntl.h>
  #include <gelf.h>
  #include <inttypes.h>
-Index: elfutils-0.166/tests/varlocs.c
-===================================================================
---- elfutils-0.166.orig/tests/varlocs.c
-+++ elfutils-0.166/tests/varlocs.c
+diff --git a/tests/varlocs.c b/tests/varlocs.c
+index c3fba89..e043ea2 100644
+--- a/tests/varlocs.c
++++ b/tests/varlocs.c
 @@ -25,7 +25,7 @@
  #include <dwarf.h>
  #include <stdio.h>
@@ -1135,10 +1033,10 @@ Index: elfutils-0.166/tests/varlocs.c
  #include <string.h>
  #include <sys/types.h>
  #include <sys/stat.h>
-Index: elfutils-0.166/tests/vdsosyms.c
-===================================================================
---- elfutils-0.166.orig/tests/vdsosyms.c
-+++ elfutils-0.166/tests/vdsosyms.c
+diff --git a/tests/vdsosyms.c b/tests/vdsosyms.c
+index b876c10..afb2823 100644
+--- a/tests/vdsosyms.c
++++ b/tests/vdsosyms.c
 @@ -18,7 +18,7 @@
  #include <config.h>
  #include <assert.h>
@@ -1148,16 +1046,6 @@ Index: elfutils-0.166/tests/vdsosyms.c
  #include <inttypes.h>
  #include <stdio.h>
  #include <string.h>
-Index: elfutils-0.166/libelf/elf_getarsym.c
-===================================================================
---- elfutils-0.166.orig/libelf/elf_getarsym.c
-+++ elfutils-0.166/libelf/elf_getarsym.c
-@@ -302,7 +302,7 @@ elf_getarsym (Elf *elf, size_t *ptr)
- 		arsym[cnt].as_off = (*u32)[cnt];
- 
- 	      arsym[cnt].as_hash = _dl_elf_hash (str_data);
--	      str_data = rawmemchr (str_data, '\0') + 1;
-+	      str_data = memchr (str_data, '\0', SIZE_MAX) + 1;
- 	    }
- 
- 	  /* At the end a special entry.  */
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-fix-a-stack-usage-warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-fix-a-stack-usage-warning.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0001-fix-a-stack-usage-warning.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/0001-fix-a-stack-usage-warning.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-remove-the-unneed-checking.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-remove-the-unneed-checking.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0001-remove-the-unneed-checking.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/0001-remove-the-unneed-checking.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/aarch64_uio.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/aarch64_uio.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
similarity index 85%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0001-Ignore-differences-between-mips-machine-identifiers.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
index 3f110f9..a9a7210 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-Ignore-differences-between-mips-machine-identifiers.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
@@ -12,11 +12,11 @@ Signed-off-by: James Cowgill <james410@cowgill.org.uk>
  backends/mips_init.c | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
-diff --git a/backends/mips_init.c b/backends/mips_init.c
-index 7429a89..d10e940 100644
+Index: b/backends/mips_init.c
+===================================================================
 --- a/backends/mips_init.c
 +++ b/backends/mips_init.c
-@@ -46,11 +46,7 @@ mips_init (elf, machine, eh, ehlen)
+@@ -45,11 +45,7 @@ mips_init (Elf *elf __attribute__ ((unus
      return NULL;
  
    /* We handle it.  */
@@ -29,6 +29,3 @@ index 7429a89..d10e940 100644
    mips_init_reloc (eh);
    HOOK (eh, reloc_simple_type);
    HOOK (eh, return_value_location);
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0003-Add-mips-n64-relocation-format-hack.patch
similarity index 90%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0003-Add-mips-n64-relocation-format-hack.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/debian/0003-Add-mips-n64-relocation-format-hack.patch
index 14b7985..1ec98d4 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/0003-Add-mips-n64-relocation-format-hack.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0003-Add-mips-n64-relocation-format-hack.patch
@@ -20,10 +20,10 @@ Signed-off-by: James Cowgill <james410@cowgill.org.uk>
  src/strip.c               | 17 +++++++++++++++++
  5 files changed, 101 insertions(+), 6 deletions(-)
 
-Index: elfutils-0.164/libelf/gelf_getrel.c
+Index: b/libelf/gelf_getrel.c
 ===================================================================
---- elfutils-0.164.orig/libelf/gelf_getrel.c
-+++ elfutils-0.164/libelf/gelf_getrel.c
+--- a/libelf/gelf_getrel.c
++++ b/libelf/gelf_getrel.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -63,10 +63,10 @@ Index: elfutils-0.164/libelf/gelf_getrel.c
      }
  
    rwlock_unlock (scn->elf->lock);
-Index: elfutils-0.164/libelf/gelf_getrela.c
+Index: b/libelf/gelf_getrela.c
 ===================================================================
---- elfutils-0.164.orig/libelf/gelf_getrela.c
-+++ elfutils-0.164/libelf/gelf_getrela.c
+--- a/libelf/gelf_getrela.c
++++ b/libelf/gelf_getrela.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -106,10 +106,10 @@ Index: elfutils-0.164/libelf/gelf_getrela.c
      }
  
    rwlock_unlock (scn->elf->lock);
-Index: elfutils-0.164/libelf/gelf_update_rel.c
+Index: b/libelf/gelf_update_rel.c
 ===================================================================
---- elfutils-0.164.orig/libelf/gelf_update_rel.c
-+++ elfutils-0.164/libelf/gelf_update_rel.c
+--- a/libelf/gelf_update_rel.c
++++ b/libelf/gelf_update_rel.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -151,10 +151,10 @@ Index: elfutils-0.164/libelf/gelf_update_rel.c
      }
  
    result = 1;
-Index: elfutils-0.164/libelf/gelf_update_rela.c
+Index: b/libelf/gelf_update_rela.c
 ===================================================================
---- elfutils-0.164.orig/libelf/gelf_update_rela.c
-+++ elfutils-0.164/libelf/gelf_update_rela.c
+--- a/libelf/gelf_update_rela.c
++++ b/libelf/gelf_update_rela.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -196,11 +196,11 @@ Index: elfutils-0.164/libelf/gelf_update_rela.c
      }
  
    result = 1;
-Index: elfutils-0.164/src/strip.c
+Index: b/src/strip.c
 ===================================================================
---- elfutils-0.164.orig/src/strip.c
-+++ elfutils-0.164/src/strip.c
-@@ -546,6 +546,23 @@ handle_elf (int fd, Elf *elf, const char
+--- a/src/strip.c
++++ b/src/strip.c
+@@ -532,6 +532,23 @@ handle_elf (int fd, Elf *elf, const char
        goto fail;
      }
  
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/arm_backend.diff
similarity index 94%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.168/debian/arm_backend.diff
index 9d47f95..c9f7670 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/arm_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/arm_backend.diff
@@ -1,7 +1,7 @@
-Index: elfutils-0.164/backends/arm_init.c
+Index: b/backends/arm_init.c
 ===================================================================
---- elfutils-0.164.orig/backends/arm_init.c
-+++ elfutils-0.164/backends/arm_init.c
+--- a/backends/arm_init.c
++++ b/backends/arm_init.c
 @@ -35,20 +35,31 @@
  #define RELOC_PREFIX	R_ARM_
  #include "libebl_CPU.h"
@@ -47,10 +47,10 @@ Index: elfutils-0.164/backends/arm_init.c
    HOOK (eh, abi_cfi);
    HOOK (eh, check_reloc_target_type);
    HOOK (eh, symbol_type_name);
-Index: elfutils-0.164/backends/arm_regs.c
+Index: b/backends/arm_regs.c
 ===================================================================
---- elfutils-0.164.orig/backends/arm_regs.c
-+++ elfutils-0.164/backends/arm_regs.c
+--- a/backends/arm_regs.c
++++ b/backends/arm_regs.c
 @@ -31,6 +31,7 @@
  #endif
  
@@ -209,10 +209,10 @@ Index: elfutils-0.164/backends/arm_regs.c
        *setname = "VFP";
        *type = DW_ATE_float;
        *bits = 64;
-Index: elfutils-0.164/backends/arm_retval.c
+Index: b/backends/arm_retval.c
 ===================================================================
---- elfutils-0.164.orig/backends/arm_retval.c
-+++ elfutils-0.164/backends/arm_retval.c
+--- a/backends/arm_retval.c
++++ b/backends/arm_retval.c
 @@ -48,6 +48,13 @@ static const Dwarf_Op loc_intreg[] =
  #define nloc_intreg	1
  #define nloc_intregs(n)	(2 * (n))
@@ -288,11 +288,11 @@ Index: elfutils-0.164/backends/arm_retval.c
 +   return arm_return_value_location_ (functypedie, locp, 0);
 +}
 +
-Index: elfutils-0.164/libelf/elf.h
+Index: b/libelf/elf.h
 ===================================================================
---- elfutils-0.164.orig/libelf/elf.h
-+++ elfutils-0.164/libelf/elf.h
-@@ -2450,6 +2450,9 @@ enum
+--- a/libelf/elf.h
++++ b/libelf/elf.h
+@@ -2593,6 +2593,9 @@ enum
  #define EF_ARM_EABI_VER4	0x04000000
  #define EF_ARM_EABI_VER5	0x05000000
  
@@ -302,7 +302,7 @@ Index: elfutils-0.164/libelf/elf.h
  /* Additional symbol types for Thumb.  */
  #define STT_ARM_TFUNC		STT_LOPROC /* A Thumb function.  */
  #define STT_ARM_16BIT		STT_HIPROC /* A Thumb label.  */
-@@ -2467,12 +2470,19 @@ enum
+@@ -2610,12 +2613,19 @@ enum
  
  /* Processor specific values for the Phdr p_type field.  */
  #define PT_ARM_EXIDX		(PT_LOPROC + 1)	/* ARM unwind segment.  */
@@ -322,7 +322,7 @@ Index: elfutils-0.164/libelf/elf.h
  
  /* AArch64 relocs.  */
  
-@@ -2765,6 +2775,7 @@ enum
+@@ -2908,6 +2918,7 @@ enum
  					   TLS block (LDR, STR).  */
  #define R_ARM_TLS_IE12GP	111	/* 12 bit GOT entry relative
  					   to GOT origin (LDR).  */
@@ -330,10 +330,10 @@ Index: elfutils-0.164/libelf/elf.h
  #define R_ARM_ME_TOO		128	/* Obsolete.  */
  #define R_ARM_THM_TLS_DESCSEQ	129
  #define R_ARM_THM_TLS_DESCSEQ16	129
-Index: elfutils-0.164/backends/libebl_arm.h
+Index: b/backends/libebl_arm.h
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/libebl_arm.h
++++ b/backends/libebl_arm.h
 @@ -0,0 +1,9 @@
 +#ifndef _LIBEBL_ARM_H
 +#define _LIBEBL_ARM_H 1
@@ -344,10 +344,10 @@ Index: elfutils-0.164/backends/libebl_arm.h
 +extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
 +
 +#endif
-Index: elfutils-0.164/tests/run-allregs.sh
+Index: b/tests/run-allregs.sh
 ===================================================================
---- elfutils-0.164.orig/tests/run-allregs.sh
-+++ elfutils-0.164/tests/run-allregs.sh
+--- a/tests/run-allregs.sh
++++ b/tests/run-allregs.sh
 @@ -2672,7 +2672,28 @@ integer registers:
  	 13: sp (sp), address 32 bits
  	 14: lr (lr), address 32 bits
@@ -465,10 +465,10 @@ Index: elfutils-0.164/tests/run-allregs.sh
  EOF
  
  # See run-readelf-mixed-corenote.sh for instructions to regenerate
-Index: elfutils-0.164/tests/run-readelf-mixed-corenote.sh
+Index: b/tests/run-readelf-mixed-corenote.sh
 ===================================================================
---- elfutils-0.164.orig/tests/run-readelf-mixed-corenote.sh
-+++ elfutils-0.164/tests/run-readelf-mixed-corenote.sh
+--- a/tests/run-readelf-mixed-corenote.sh
++++ b/tests/run-readelf-mixed-corenote.sh
 @@ -31,12 +31,11 @@ Note segment of 892 bytes at offset 0x27
      pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
      utime: 0.000000, stime: 0.010000, cutime: 0.000000, cstime: 0.000000
@@ -487,10 +487,10 @@ Index: elfutils-0.164/tests/run-readelf-mixed-corenote.sh
    CORE                 124  PRPSINFO
      state: 0, sname: R, zomb: 0, nice: 0, flag: 0x00400500
      uid: 0, gid: 0, pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
-Index: elfutils-0.164/tests/run-addrcfi.sh
+Index: b/tests/run-addrcfi.sh
 ===================================================================
---- elfutils-0.164.orig/tests/run-addrcfi.sh
-+++ elfutils-0.164/tests/run-addrcfi.sh
+--- a/tests/run-addrcfi.sh
++++ b/tests/run-addrcfi.sh
 @@ -3554,6 +3554,38 @@ dwarf_cfi_addrframe (.eh_frame): no matc
  	FPA reg21 (f5): undefined
  	FPA reg22 (f6): undefined
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hppa_backend.diff
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.168/debian/hppa_backend.diff
index 4545671..2fcc917 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/hppa_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hppa_backend.diff
@@ -1,7 +1,7 @@
-Index: elfutils-0.164/backends/parisc_init.c
+Index: b/backends/parisc_init.c
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/parisc_init.c
++++ b/backends/parisc_init.c
 @@ -0,0 +1,73 @@
 +/* Initialization of PA-RISC specific backend library.
 +   Copyright (C) 2002, 2005, 2006 Red Hat, Inc.
@@ -76,10 +76,10 @@ Index: elfutils-0.164/backends/parisc_init.c
 +
 +  return MODVERSION;
 +}
-Index: elfutils-0.164/backends/parisc_regs.c
+Index: b/backends/parisc_regs.c
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/parisc_regs.c
++++ b/backends/parisc_regs.c
 @@ -0,0 +1,159 @@
 +/* Register names and numbers for PA-RISC DWARF.
 +   Copyright (C) 2005, 2006 Red Hat, Inc.
@@ -240,10 +240,10 @@ Index: elfutils-0.164/backends/parisc_regs.c
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-Index: elfutils-0.164/backends/parisc_reloc.def
+Index: b/backends/parisc_reloc.def
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/parisc_reloc.def
++++ b/backends/parisc_reloc.def
 @@ -0,0 +1,128 @@
 +/* List the relocation types for PA-RISC.  -*- C -*-
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -373,10 +373,10 @@ Index: elfutils-0.164/backends/parisc_reloc.def
 +RELOC_TYPE (TLS_DTPMOD64,	DYN)
 +
 +#define NO_RELATIVE_RELOC       1
-Index: elfutils-0.164/backends/parisc_retval.c
+Index: b/backends/parisc_retval.c
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/parisc_retval.c
++++ b/backends/parisc_retval.c
 @@ -0,0 +1,213 @@
 +/* Function return value location for Linux/PA-RISC ABI.
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -591,10 +591,10 @@ Index: elfutils-0.164/backends/parisc_retval.c
 +  return parisc_return_value_location_ (functypedie, locp, 1);
 +}
 +
-Index: elfutils-0.164/backends/parisc_symbol.c
+Index: b/backends/parisc_symbol.c
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/parisc_symbol.c
++++ b/backends/parisc_symbol.c
 @@ -0,0 +1,112 @@
 +/* PA-RISC specific symbolic name handling.
 +   Copyright (C) 2002, 2005 Red Hat, Inc.
@@ -708,10 +708,10 @@ Index: elfutils-0.164/backends/parisc_symbol.c
 +      return ELF_T_NUM;
 +    }
 +}
-Index: elfutils-0.164/backends/libebl_parisc.h
+Index: b/backends/libebl_parisc.h
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/libebl_parisc.h
++++ b/backends/libebl_parisc.h
 @@ -0,0 +1,9 @@
 +#ifndef _LIBEBL_HPPA_H
 +#define _LIBEBL_HPPA_H 1
@@ -722,28 +722,28 @@ Index: elfutils-0.164/backends/libebl_parisc.h
 +extern int parisc_return_value_location_64(Dwarf_Die *, const Dwarf_Op **locp);
 +
 +#endif
-Index: elfutils-0.164/backends/Makefile.am
+Index: b/backends/Makefile.am
 ===================================================================
---- elfutils-0.164.orig/backends/Makefile.am
-+++ elfutils-0.164/backends/Makefile.am
-@@ -33,11 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
+--- a/backends/Makefile.am
++++ b/backends/Makefile.am
+@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
  
  
  modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx
-+	  tilegx parisc
+-	  tilegx m68k bpf
++	  tilegx m68k bpf parisc
  libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
  	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
  	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
--	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a
-+	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
-+	     libebl_parisc_pic.a
+ 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
+-	     libebl_m68k_pic.a libebl_bpf_pic.a
++	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_parisc_pic.a
  noinst_LIBRARIES = $(libebl_pic)
  noinst_DATA = $(libebl_pic:_pic.a=.so)
  
-@@ -111,6 +112,9 @@ tilegx_SRCS = tilegx_init.c tilegx_symbo
- libebl_tilegx_pic_a_SOURCES = $(tilegx_SRCS)
- am_libebl_tilegx_pic_a_OBJECTS = $(tilegx_SRCS:.c=.os)
+@@ -128,6 +128,9 @@ endif
+ libebl_bpf_pic_a_SOURCES = $(bpf_SRCS)
+ am_libebl_bpf_pic_a_OBJECTS = $(bpf_SRCS:.c=.os)
  
 +parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
 +libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
@@ -751,11 +751,11 @@ Index: elfutils-0.164/backends/Makefile.am
  
  libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
  	@rm -f $(@:.so=.map)
-Index: elfutils-0.164/libelf/elf.h
+Index: b/libelf/elf.h
 ===================================================================
---- elfutils-0.164.orig/libelf/elf.h
-+++ elfutils-0.164/libelf/elf.h
-@@ -1912,16 +1912,24 @@ enum
+--- a/libelf/elf.h
++++ b/libelf/elf.h
+@@ -2055,16 +2055,24 @@ enum
  #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
  #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
  #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
@@ -780,7 +780,7 @@ Index: elfutils-0.164/libelf/elf.h
  #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
  #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
  #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
-@@ -1930,6 +1938,7 @@ enum
+@@ -2073,6 +2081,7 @@ enum
  #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
  #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
  #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
@@ -788,7 +788,7 @@ Index: elfutils-0.164/libelf/elf.h
  #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
  #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
  #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
-@@ -1955,6 +1964,8 @@ enum
+@@ -2098,6 +2107,8 @@ enum
  #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
  #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
  #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
new file mode 100644
index 0000000..4440e39
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
@@ -0,0 +1,14 @@
+Index: elfutils-0.165/tests/run-native-test.sh
+===================================================================
+--- elfutils-0.165.orig/tests/run-native-test.sh
++++ elfutils-0.165/tests/run-native-test.sh
+@@ -83,6 +83,9 @@ native_test()
+ # "cannot attach to process: Function not implemented".
+ [ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
+ 
++# hurd's /proc/$PID/maps does not give paths yet.
++[ "$(uname)" = "GNU" ] && exit 77
++
+ native_test ${abs_builddir}/allregs
+ native_test ${abs_builddir}/funcretval
+ 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
new file mode 100644
index 0000000..1e6d7a2
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
@@ -0,0 +1,11 @@
+--- elfutils-0.165.orig/tests/run-strip-strmerge.sh
++++ elfutils-0.165/tests/run-strip-strmerge.sh
+@@ -30,7 +30,7 @@ remerged=remerged.elf
+ tempfiles $merged $stripped $debugfile $remerged
+ 
+ echo elflint $input
+-testrun ${abs_top_builddir}/src/elflint --gnu $input
++testrun_on_self_skip ${abs_top_builddir}/src/elflint --gnu $input
+ echo elfstrmerge
+ testrun ${abs_top_builddir}/tests/elfstrmerge -o $merged $input
+ echo elflint $merged
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/kfreebsd_path.patch
similarity index 69%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/kfreebsd_path.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/debian/kfreebsd_path.patch
index ba454ee..9a19b58 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/kfreebsd_path.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/kfreebsd_path.patch
@@ -1,6 +1,8 @@
---- elfutils/tests/run-native-test.sh.orig
-+++ elfutils/tests/run-native-test.sh
-@@ -78,6 +78,12 @@
+Index: b/tests/run-native-test.sh
+===================================================================
+--- a/tests/run-native-test.sh
++++ b/tests/run-native-test.sh
+@@ -77,6 +77,12 @@ native_test()
    test $native -eq 0 || testrun "$@" -p $native > /dev/null
  }
  
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_backend.diff
similarity index 92%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_backend.diff
index de1237b..36a1cae 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/mips_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_backend.diff
@@ -1,7 +1,7 @@
-Index: elfutils-0.164/backends/mips_init.c
+Index: b/backends/mips_init.c
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/mips_init.c
++++ b/backends/mips_init.c
 @@ -0,0 +1,59 @@
 +/* Initialization of mips specific backend library.
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -62,10 +62,10 @@ Index: elfutils-0.164/backends/mips_init.c
 +
 +  return MODVERSION;
 +}
-Index: elfutils-0.164/backends/mips_regs.c
+Index: b/backends/mips_regs.c
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/mips_regs.c
++++ b/backends/mips_regs.c
 @@ -0,0 +1,104 @@
 +/* Register names and numbers for MIPS DWARF.
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -171,10 +171,10 @@ Index: elfutils-0.164/backends/mips_regs.c
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-Index: elfutils-0.164/backends/mips_reloc.def
+Index: b/backends/mips_reloc.def
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/mips_reloc.def
++++ b/backends/mips_reloc.def
 @@ -0,0 +1,79 @@
 +/* List the relocation types for mips.  -*- C -*-
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -255,10 +255,10 @@ Index: elfutils-0.164/backends/mips_reloc.def
 +
 +#define NO_COPY_RELOC 1
 +#define NO_RELATIVE_RELOC 1
-Index: elfutils-0.164/backends/mips_retval.c
+Index: b/backends/mips_retval.c
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/mips_retval.c
++++ b/backends/mips_retval.c
 @@ -0,0 +1,321 @@
 +/* Function return value location for Linux/mips ABI.
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -581,10 +581,10 @@ Index: elfutils-0.164/backends/mips_retval.c
 +     DWARF and might be valid.  */
 +  return -2;
 +}
-Index: elfutils-0.164/backends/mips_symbol.c
+Index: b/backends/mips_symbol.c
 ===================================================================
 --- /dev/null
-+++ elfutils-0.164/backends/mips_symbol.c
++++ b/backends/mips_symbol.c
 @@ -0,0 +1,52 @@
 +/* MIPS specific symbolic name handling.
 +   Copyright (C) 2002, 2003, 2005 Red Hat, Inc.
@@ -638,10 +638,10 @@ Index: elfutils-0.164/backends/mips_symbol.c
 +      return ELF_T_NUM;
 +    }
 +}
-Index: elfutils-0.164/libebl/eblopenbackend.c
+Index: b/libebl/eblopenbackend.c
 ===================================================================
---- elfutils-0.164.orig/libebl/eblopenbackend.c
-+++ elfutils-0.164/libebl/eblopenbackend.c
+--- a/libebl/eblopenbackend.c
++++ b/libebl/eblopenbackend.c
 @@ -71,6 +71,8 @@ static const struct
    { "sparc", "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
    { "sparc", "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
@@ -650,55 +650,27 @@ Index: elfutils-0.164/libebl/eblopenbackend.c
 +  { "mips", "elf_mipsel", "mipsel", 4, EM_MIPS_RS3_LE, 0, 0 },
  
    { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
-   { "m68k", "elf_m68k", "m68k", 4, EM_68K, 0, 0 },
-Index: elfutils-0.164/backends/common-reloc.c
+   { "m68k", "elf_m68k", "m68k", 4, EM_68K, ELFCLASS32, ELFDATA2MSB },
+Index: b/backends/Makefile.am
 ===================================================================
---- elfutils-0.164.orig/backends/common-reloc.c
-+++ elfutils-0.164/backends/common-reloc.c
-@@ -125,11 +125,13 @@ EBLHOOK(reloc_valid_use) (Elf *elf, int
- }
- 
- 
-+#ifndef NO_COPY_RELOC
- bool
- EBLHOOK(copy_reloc_p) (int reloc)
- {
-   return reloc == R_TYPE (COPY);
- }
-+#endif
- 
- bool
- EBLHOOK(none_reloc_p) (int reloc)
-@@ -151,7 +153,9 @@ EBLHOOK(init_reloc) (Ebl *ebl)
-   ebl->reloc_type_name = EBLHOOK(reloc_type_name);
-   ebl->reloc_type_check = EBLHOOK(reloc_type_check);
-   ebl->reloc_valid_use = EBLHOOK(reloc_valid_use);
-+#ifndef NO_COPY_RELOC
-   ebl->copy_reloc_p = EBLHOOK(copy_reloc_p);
-+#endif
-   ebl->none_reloc_p = EBLHOOK(none_reloc_p);
- #ifndef NO_RELATIVE_RELOC
-   ebl->relative_reloc_p = EBLHOOK(relative_reloc_p);
-Index: elfutils-0.164/backends/Makefile.am
-===================================================================
---- elfutils-0.164.orig/backends/Makefile.am
-+++ elfutils-0.164/backends/Makefile.am
+--- a/backends/Makefile.am
++++ b/backends/Makefile.am
 @@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
  
  
  modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx parisc
-+	  tilegx parisc mips
+-	  tilegx m68k bpf parisc
++	  tilegx m68k bpf parisc mips
  libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
  	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
  	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
  	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
--	     libebl_parisc_pic.a
-+	     libebl_parisc_pic.a libebl_mips_pic.a
+-	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_parisc_pic.a
++	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_parisc_pic.a libebl_mips_pic.a
  noinst_LIBRARIES = $(libebl_pic)
  noinst_DATA = $(libebl_pic:_pic.a=.so)
  
-@@ -116,6 +116,10 @@ parisc_SRCS = parisc_init.c parisc_symbo
+@@ -132,6 +132,10 @@ parisc_SRCS = parisc_init.c parisc_symbo
  libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
  am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
  
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_readelf_w.patch
similarity index 78%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_readelf_w.patch
index 930d6f6..53c7923 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/mips_readelf_w.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_readelf_w.patch
@@ -6,11 +6,11 @@ Forwarded: not-needed
 Upstreams wants a change where this is handled by a hook that needs
 to be filled in by the backend for the arch.
 
-Index: elfutils-0.164/src/readelf.c
+Index: b/src/readelf.c
 ===================================================================
---- elfutils-0.164.orig/src/readelf.c
-+++ elfutils-0.164/src/readelf.c
-@@ -8218,7 +8218,8 @@ print_debug (Dwfl_Module *dwflmod, Ebl *
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -8343,7 +8343,8 @@ print_debug (Dwfl_Module *dwflmod, Ebl *
        GElf_Shdr shdr_mem;
        GElf_Shdr *shdr = gelf_getshdr (scn, &shdr_mem);
  
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff
similarity index 70%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff
index eae5796..d79b57b 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/testsuite-ignore-elflint.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff
@@ -4,21 +4,21 @@ binutils don't pass elflint. However elfutils shouldn't FTBFS because of this.
 So we run the tests on all archs to see what breaks, but if it breaks we ignore
 the result (exitcode 77 means: this test was skipped).
 
-Index: elfutils-0.156/tests/run-elflint-self.sh
+Index: b/tests/run-elflint-self.sh
 ===================================================================
---- elfutils-0.156.orig/tests/run-elflint-self.sh	2013-07-28 14:35:36.000000000 +0200
-+++ elfutils-0.156/tests/run-elflint-self.sh	2013-07-28 14:36:10.000000000 +0200
+--- a/tests/run-elflint-self.sh
++++ b/tests/run-elflint-self.sh
 @@ -18,4 +18,4 @@
  
  . $srcdir/test-subr.sh
  
 -testrun_on_self ${abs_top_builddir}/src/elflint --quiet --gnu-ld
 +testrun_on_self_skip ${abs_top_builddir}/src/elflint --quiet --gnu-ld
-Index: elfutils-0.156/tests/test-subr.sh
+Index: b/tests/test-subr.sh
 ===================================================================
---- elfutils-0.156.orig/tests/test-subr.sh	2013-07-28 14:35:36.000000000 +0200
-+++ elfutils-0.156/tests/test-subr.sh	2013-07-28 14:35:36.000000000 +0200
-@@ -149,3 +149,18 @@
+--- a/tests/test-subr.sh
++++ b/tests/test-subr.sh
+@@ -152,3 +152,18 @@ testrun_on_self_quiet()
    # Only exit if something failed
    if test $exit_status != 0; then exit $exit_status; fi
  }
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/fixheadercheck.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/fixheadercheck.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/fixheadercheck.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/shadow.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/shadow.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.166.bb b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
similarity index 78%
rename from meta/recipes-devtools/elfutils/elfutils_0.166.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.168.bb
index 5c436d3..96e895a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.166.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
@@ -7,8 +7,8 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "d4e462b7891915dc5326bccefa2024ff"
-SRC_URI[sha256sum] = "3c056914c8a438b210be0d790463b960fc79d234c3f05ce707cbff80e94cba30"
+SRC_URI[md5sum] = "52adfa40758d0d39e5d5c57689bf38d6"
+SRC_URI[sha256sum] = "b88d07893ba1373c7dd69a7855974706d05377766568a7d9002706d5de72c276"
 
 SRC_URI += "\
         file://dso-link-change.patch \
@@ -22,20 +22,19 @@ SRC_URI += "\
 "
 
 # pick the patch from debian
-# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.164-1.debian.tar.xz
+# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.168-0.2.debian.tar.xz
 SRC_URI += "\
-        file://hppa_backend.diff \
-        file://arm_backend.diff \
-        file://mips_backend.diff \
-        file://m68k_backend.diff \
-        file://testsuite-ignore-elflint.diff \
-        file://mips_readelf_w.patch \
-        file://kfreebsd_path.patch \
-        file://0001-Ignore-differences-between-mips-machine-identifiers.patch \
-        file://0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
-        file://0003-Add-mips-n64-relocation-format-hack.patch \
-        file://uclibc-support.patch \
-        file://elfcmp-fix-self-comparision.patch \
+        file://debian/hppa_backend.diff \
+        file://debian/arm_backend.diff \
+        file://debian/mips_backend.diff \
+        file://debian/testsuite-ignore-elflint.diff \
+        file://debian/mips_readelf_w.patch \
+        file://debian/kfreebsd_path.patch \
+        file://debian/0001-Ignore-differences-between-mips-machine-identifiers.patch \
+        file://debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
+        file://debian/0003-Add-mips-n64-relocation-format-hack.patch \
+        file://debian/hurd_path.patch \
+        file://debian/ignore_strmerge.diff \
 "
 SRC_URI_append_libc-musl = " file://0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch "
 
-- 
2.8.1


