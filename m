Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB9F6C491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:27:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2018 07:27:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,257,1539673200"; d="scan'208";a="87365214"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.31.112])
	by fmsmga007.fm.intel.com with ESMTP; 20 Nov 2018 07:27:24 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 16:27:03 +0100
Message-Id: <20181120152704.71151-3-raphael.kubo.da.costa@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120152704.71151-2-raphael.kubo.da.costa@intel.com>
References: <20181120152704.71151-1-raphael.kubo.da.costa@intel.com>
	<20181120152704.71151-2-raphael.kubo.da.costa@intel.com>
MIME-Version: 1.0
Subject: [rocko][PATCH 2/3] elfutils: refresh patches
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
X-List-Received-Date: Tue, 20 Nov 2018 15:27:23 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

(From OE-Core rev: 2526fcfac8e360d5d27f5ebe26608df470b3b84b)

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../elfutils/files/debian/hppa_backend.diff   | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
index 44fda7f305..56f852a414 100644
--- a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
+++ b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
@@ -1,10 +1,10 @@
 Upstream-Status: Backport [from debian]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
-Index: b/backends/parisc_init.c
+Index: elfutils-0.170/backends/parisc_init.c
 ===================================================================
 --- /dev/null
-+++ b/backends/parisc_init.c
++++ elfutils-0.170/backends/parisc_init.c
 @@ -0,0 +1,73 @@
 +/* Initialization of PA-RISC specific backend library.
 +   Copyright (C) 2002, 2005, 2006 Red Hat, Inc.
@@ -79,10 +79,10 @@ Index: b/backends/parisc_init.c
 +
 +  return MODVERSION;
 +}
-Index: b/backends/parisc_regs.c
+Index: elfutils-0.170/backends/parisc_regs.c
 ===================================================================
 --- /dev/null
-+++ b/backends/parisc_regs.c
++++ elfutils-0.170/backends/parisc_regs.c
 @@ -0,0 +1,159 @@
 +/* Register names and numbers for PA-RISC DWARF.
 +   Copyright (C) 2005, 2006 Red Hat, Inc.
@@ -243,10 +243,10 @@ Index: b/backends/parisc_regs.c
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-Index: b/backends/parisc_reloc.def
+Index: elfutils-0.170/backends/parisc_reloc.def
 ===================================================================
 --- /dev/null
-+++ b/backends/parisc_reloc.def
++++ elfutils-0.170/backends/parisc_reloc.def
 @@ -0,0 +1,128 @@
 +/* List the relocation types for PA-RISC.  -*- C -*-
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -376,10 +376,10 @@ Index: b/backends/parisc_reloc.def
 +RELOC_TYPE (TLS_DTPMOD64,	DYN)
 +
 +#define NO_RELATIVE_RELOC       1
-Index: b/backends/parisc_retval.c
+Index: elfutils-0.170/backends/parisc_retval.c
 ===================================================================
 --- /dev/null
-+++ b/backends/parisc_retval.c
++++ elfutils-0.170/backends/parisc_retval.c
 @@ -0,0 +1,213 @@
 +/* Function return value location for Linux/PA-RISC ABI.
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -594,10 +594,10 @@ Index: b/backends/parisc_retval.c
 +  return parisc_return_value_location_ (functypedie, locp, 1);
 +}
 +
-Index: b/backends/parisc_symbol.c
+Index: elfutils-0.170/backends/parisc_symbol.c
 ===================================================================
 --- /dev/null
-+++ b/backends/parisc_symbol.c
++++ elfutils-0.170/backends/parisc_symbol.c
 @@ -0,0 +1,112 @@
 +/* PA-RISC specific symbolic name handling.
 +   Copyright (C) 2002, 2005 Red Hat, Inc.
@@ -711,10 +711,10 @@ Index: b/backends/parisc_symbol.c
 +      return ELF_T_NUM;
 +    }
 +}
-Index: b/backends/libebl_parisc.h
+Index: elfutils-0.170/backends/libebl_parisc.h
 ===================================================================
 --- /dev/null
-+++ b/backends/libebl_parisc.h
++++ elfutils-0.170/backends/libebl_parisc.h
 @@ -0,0 +1,9 @@
 +#ifndef _LIBEBL_HPPA_H
 +#define _LIBEBL_HPPA_H 1
@@ -725,10 +725,10 @@ Index: b/backends/libebl_parisc.h
 +extern int parisc_return_value_location_64(Dwarf_Die *, const Dwarf_Op **locp);
 +
 +#endif
-Index: b/backends/Makefile.am
+Index: elfutils-0.170/backends/Makefile.am
 ===================================================================
---- a/backends/Makefile.am
-+++ b/backends/Makefile.am
+--- elfutils-0.170.orig/backends/Makefile.am
++++ elfutils-0.170/backends/Makefile.am
 @@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
  
  
@@ -744,7 +744,7 @@ Index: b/backends/Makefile.am
  noinst_LIBRARIES = $(libebl_pic)
  noinst_DATA = $(libebl_pic:_pic.a=.so)
  
-@@ -128,6 +128,9 @@ endif
+@@ -124,6 +124,9 @@ cpu_bpf = ../libcpu/libcpu_bpf.a
  libebl_bpf_pic_a_SOURCES = $(bpf_SRCS)
  am_libebl_bpf_pic_a_OBJECTS = $(bpf_SRCS:.c=.os)
  
@@ -752,13 +752,13 @@ Index: b/backends/Makefile.am
 +libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
 +am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
  
- libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw) $(libeu)
  	@rm -f $(@:.so=.map)
-Index: b/libelf/elf.h
+Index: elfutils-0.170/libelf/elf.h
 ===================================================================
---- a/libelf/elf.h
-+++ b/libelf/elf.h
-@@ -2055,16 +2055,24 @@ enum
+--- elfutils-0.170.orig/libelf/elf.h
++++ elfutils-0.170/libelf/elf.h
+@@ -2056,16 +2056,24 @@ enum
  #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
  #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
  #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
@@ -783,7 +783,7 @@ Index: b/libelf/elf.h
  #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
  #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
  #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
-@@ -2073,6 +2081,7 @@ enum
+@@ -2074,6 +2082,7 @@ enum
  #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
  #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
  #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
@@ -791,7 +791,7 @@ Index: b/libelf/elf.h
  #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
  #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
  #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
-@@ -2098,6 +2107,8 @@ enum
+@@ -2099,6 +2108,8 @@ enum
  #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
  #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
  #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
-- 
2.19.1


