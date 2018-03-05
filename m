Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id B043A78A47
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:08 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id n7so18112574wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kb3TLbCF7IiJC/IW6xTI+MvPrdN5tgkrggrqsjdJup0=;
	b=DQYeYg19Mq4XJ4hgMWibqnU3DpZX2eOdruHrHK53JG+tZl5NePrx/7L2ZaTr0C1Q1n
	JvtIYLB5ePJ7ZAKlwNURzv4NPHdAW2adUBgRhQ9Hq8V0+a6CmoMODcA6S4momPI0rwRW
	bc9/hHiOuL2JTvVmuFsT1sjgIYr/Y8POY8Yj967Vga9hwFEhCixk/+BHMu2US51mXzj8
	fFEDwHU1Z4xJGIOeD8hu8ynz48GOxQ7OHr1/r5oi+UhlEWlT5SXcbIz4+cIx3gNdQIE8
	5xiv62cLj26V4PCIaPJa2C0vt+GPsA2I/9TcPAlJS0pYPRilHq5BSTcPn7m4oNJxZmA9
	zZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kb3TLbCF7IiJC/IW6xTI+MvPrdN5tgkrggrqsjdJup0=;
	b=H61bGF91mKbCGjDD0RZNhHzw/WGZMUKqPOfo5/Q71d/45CWJRTWQC03/35SdkIo70F
	jMJozmt8kTxjeNVY6FHto6DmvJq5cP/WemZITUETW9W4CTlfl0GtYpKiCCyQ5u23+nJy
	X9dJ2NvWccm2WyVwZMUkjG188q50puFIasbHQ50u4Ri7St1V8IBZ9j9eRxvkGn0qKoKE
	6RjYQDgG4F+LOd51vz0WebGC0JtIgrE/9QbDoj2u+weH06NYKocbxXoP4aOBcaCzZ7LH
	VgXW0AuBYwRmJTdkqBiLfC23VOmNDW7rez+7BoWQN6bwCJblyXasVjizk2Wt7yeoDzYD
	OhNA==
X-Gm-Message-State: AElRT7HYQRl265iUn8O6k8fgOgKuv7oQhMvO9EkMFzaucCHsCTXOwqSI
	G/NBr3jnTS7cx71ipIvrroiDNRpJ
X-Google-Smtp-Source: AG47ELv0FiD+0AaTJBx1hJXwt6i2JXxG6SlvC/4WUhGj0JyZY4X5Mc1JHDd+JFA2V5GJ2fMOpX3/yA==
X-Received: by 10.223.160.56 with SMTP id k53mr12866161wrk.5.1520270467808;
	Mon, 05 Mar 2018 09:21:07 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:33 +0000
Message-Id: <20180305172046.21729-16-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 16/29] elfutils: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../elfutils/files/debian/hppa_backend.diff        | 46 +++++++++++-----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
index 44fda7f3059..56f852a414e 100644
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
2.11.0


