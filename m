Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1D67179BC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s18-v6so3349457wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=olr6+GkCUwNIZb+zWtwHYVTTWY4vHlW2O1MYjJSTOLU=;
	b=Z19XpXL4yimnB1exalF7pBq8NuPunIvu1rcwh8AMt4IZT7E4YwKOyNp97y95WLtBaX
	CqQ7F77X611SbFNW7HLbqJ/stRBv/6AxaDpZy3pMBZw7UcaQhrw6U17G0FQTibH042nz
	wcSkPVQ0jypy7hzQidS2EkkUqtQ09zpKsWqTkuhGj6aXaIpmiwkkM64VWvWVFWmCk3Tc
	3XQ500jReLacEjgs/xoSJXWHAxPcvNt68mkhRxlPiDzR8aw0RfiCHHmaCAlIgR2cZs0n
	+Mm3x87HAW7V43oG2V5gr7fqKMDdh0h8GgGBvzOIBgsfjKaR0u1Ga5MJx14nRvMGNW+d
	aHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=olr6+GkCUwNIZb+zWtwHYVTTWY4vHlW2O1MYjJSTOLU=;
	b=B717uXPQJWygZ3Ca6LstGoZgUgz+IAyKrruq4B4+Gg0c+dMb6y6mqoHRoDiUiTjpTt
	st4atLtpGc3d/LXr+w1QpjgoR+7CnTXbgYS31G7B+s5kVJwyEtQSNDGNBcbewpxoaci3
	ftaj6el5Ckl6aRw6ddTx1fWeVR9rp2dFLracLbr0IaneMwRsTClhRHFSE8R7E4pUPjoA
	LLMFMexoC2JeCt9KF0D6vIyxW5rLDwdukwG2uGUdX4D/VwX/fEVSZzIOMm0SwQVHbNX9
	tAaZdxjJ9KpALa6OwZHA85eql1QETeVd41hIppAN10atweM4go8uFmZAeZsiFXYJ6kM4
	Z7dQ==
X-Gm-Message-State: ABuFfojuNbbA4yE2J90hp9iHYswEL06jR9afuqNFlEoPC/3P+5Csqicf
	RfDihl7uaBM2EPrNSixPvFc=
X-Google-Smtp-Source: ACcGV62QdIpLrImyauErlqhdb9wlDe3WZOort8zdo9/XbH5sgjsPapWIGoTk5vt5o/pJNOlg57n3xQ==
X-Received: by 2002:adf:83c3:: with SMTP id 61-v6mr44209850wre.5.1540217122788;
	Mon, 22 Oct 2018 07:05:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:01 +0100
Message-Id: <1540217112-24479-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 02/13] nspr: Update to 4.20
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:22 -0000

RISC-v support now included in this release so drop patch.
and refresh patches

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../nspr/nspr/0002-Add-nios2-support.patch         |  25 ++--
 ...e-definitions-for-the-RISC-V-architecture.patch | 150 ---------------------
 .../nspr/nspr/remove-rpath-from-tests.patch        |   2 +-
 .../nspr/{nspr_4.19.bb => nspr_4.20.bb}            |   5 +-
 4 files changed, 14 insertions(+), 168 deletions(-)
 delete mode 100644 meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch
 rename meta/recipes-support/nspr/{nspr_4.19.bb => nspr_4.20.bb} (95%)

diff --git a/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch b/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
index 2322806..3a04d42 100644
--- a/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
+++ b/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
@@ -12,11 +12,11 @@ Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=124442
  nspr/pr/include/md/_linux.h   | 14 ++++++++++++++
  2 files changed, 59 insertions(+)
 
-diff --git a/pr/include/md/_linux.cfg b/nspr/pr/include/md/_linux.cfg
-index 8cbf0cb..150676b 100644
---- a/pr/include/md/_linux.cfg
-+++ b/pr/include/md/_linux.cfg
-@@ -972,6 +972,51 @@
+Index: nspr/pr/include/md/_linux.cfg
+===================================================================
+--- nspr.orig/pr/include/md/_linux.cfg
++++ nspr/pr/include/md/_linux.cfg
+@@ -975,6 +975,51 @@
  #define PR_BYTES_PER_WORD_LOG2   2
  #define PR_BYTES_PER_DWORD_LOG2  3
  
@@ -68,10 +68,10 @@ index 8cbf0cb..150676b 100644
  #elif defined(__or1k__)
  
  #undef  IS_LITTLE_ENDIAN
-diff --git a/pr/include/md/_linux.h b/nspr/pr/include/md/_linux.h
-index d378db5..18260be 100644
---- a/pr/include/md/_linux.h
-+++ b/pr/include/md/_linux.h
+Index: nspr/pr/include/md/_linux.h
+===================================================================
+--- nspr.orig/pr/include/md/_linux.h
++++ nspr/pr/include/md/_linux.h
 @@ -55,6 +55,8 @@
  #define _PR_SI_ARCHITECTURE "avr32"
  #elif defined(__m32r__)
@@ -80,8 +80,8 @@ index d378db5..18260be 100644
 +#define _PR_SI_ARCHITECTURE "nios2"
  #elif defined(__or1k__)
  #define _PR_SI_ARCHITECTURE "or1k"
- #else
-@@ -125,6 +127,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRInt32 *val, PRInt32 newval);
+ #elif defined(__riscv) && (__riscv_xlen == 32)
+@@ -129,6 +131,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRIn
  #define _MD_ATOMIC_SET                _PR_x86_64_AtomicSet
  #endif
  
@@ -100,6 +100,3 @@ index d378db5..18260be 100644
  #if defined(__or1k__)
  #if defined(__GNUC__)
  /* Use GCC built-in functions */
--- 
-2.7.0.rc3
-
diff --git a/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch b/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch
deleted file mode 100644
index 47e1475..0000000
--- a/meta/recipes-support/nspr/nspr/0003-Add-type-definitions-for-the-RISC-V-architecture.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-# HG changeset patch
-# User Karsten Merker <merker@debian.org>
-# Date 1523974333 -7200
-# Node ID f47871e2aeb16b39d4f516690e25c81b04d6d05a
-# Parent  776db96f834cb86e8863052201d55f60a2da91cb
-Bug 1308584, Add type definitions for the RISC-V architecture, r=kaie
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-[ Changes by AF:
- - Rebase on other Yocto patches
-]
-Upstream-Status: Backport [ https://hg.mozilla.org/projects/nspr/rev/f47871e2aeb1 ]
-
-diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
---- a/pr/include/md/_linux.cfg
-+++ b/pr/include/md/_linux.cfg
-@@ -1015,16 +1015,108 @@
- #define PR_ALIGN_OF_FLOAT   4
- #define PR_ALIGN_OF_DOUBLE  4
- #define PR_ALIGN_OF_POINTER 4
- #define PR_ALIGN_OF_WORD    4
- 
- #define PR_BYTES_PER_WORD_LOG2   2
- #define PR_BYTES_PER_DWORD_LOG2  3
- 
-+#elif defined(__riscv) && (__riscv_xlen == 32)
-+
-+#undef  IS_BIG_ENDIAN
-+#define IS_LITTLE_ENDIAN 1
-+#undef  IS_64
-+
-+#define PR_BYTES_PER_BYTE   1
-+#define PR_BYTES_PER_SHORT  2
-+#define PR_BYTES_PER_INT    4
-+#define PR_BYTES_PER_INT64  8
-+#define PR_BYTES_PER_LONG   4
-+#define PR_BYTES_PER_FLOAT  4
-+#define PR_BYTES_PER_DOUBLE 8
-+#define PR_BYTES_PER_WORD   4
-+#define PR_BYTES_PER_DWORD  8
-+
-+#define PR_BITS_PER_BYTE    8
-+#define PR_BITS_PER_SHORT   16
-+#define PR_BITS_PER_INT     32
-+#define PR_BITS_PER_INT64   64
-+#define PR_BITS_PER_LONG    32
-+#define PR_BITS_PER_FLOAT   32
-+#define PR_BITS_PER_DOUBLE  64
-+#define PR_BITS_PER_WORD    32
-+
-+#define PR_BITS_PER_BYTE_LOG2   3
-+#define PR_BITS_PER_SHORT_LOG2  4
-+#define PR_BITS_PER_INT_LOG2    5
-+#define PR_BITS_PER_INT64_LOG2  6
-+#define PR_BITS_PER_LONG_LOG2   5
-+#define PR_BITS_PER_FLOAT_LOG2  5
-+#define PR_BITS_PER_DOUBLE_LOG2 6
-+#define PR_BITS_PER_WORD_LOG2   5
-+
-+#define PR_ALIGN_OF_SHORT   2
-+#define PR_ALIGN_OF_INT     4
-+#define PR_ALIGN_OF_LONG    4
-+#define PR_ALIGN_OF_INT64   8
-+#define PR_ALIGN_OF_FLOAT   4
-+#define PR_ALIGN_OF_DOUBLE  8
-+#define PR_ALIGN_OF_POINTER 4
-+#define PR_ALIGN_OF_WORD    4
-+
-+#define PR_BYTES_PER_WORD_LOG2  2
-+#define PR_BYTES_PER_DWORD_LOG2 3
-+
-+#elif defined(__riscv) && (__riscv_xlen == 64)
-+
-+#undef  IS_BIG_ENDIAN
-+#define IS_LITTLE_ENDIAN 1
-+#define IS_64
-+
-+#define PR_BYTES_PER_BYTE   1
-+#define PR_BYTES_PER_SHORT  2
-+#define PR_BYTES_PER_INT    4
-+#define PR_BYTES_PER_INT64  8
-+#define PR_BYTES_PER_LONG   8
-+#define PR_BYTES_PER_FLOAT  4
-+#define PR_BYTES_PER_DOUBLE 8
-+#define PR_BYTES_PER_WORD   8
-+#define PR_BYTES_PER_DWORD  8
-+
-+#define PR_BITS_PER_BYTE    8
-+#define PR_BITS_PER_SHORT   16
-+#define PR_BITS_PER_INT     32
-+#define PR_BITS_PER_INT64   64
-+#define PR_BITS_PER_LONG    64
-+#define PR_BITS_PER_FLOAT   32
-+#define PR_BITS_PER_DOUBLE  64
-+#define PR_BITS_PER_WORD    64
-+
-+#define PR_BITS_PER_BYTE_LOG2   3
-+#define PR_BITS_PER_SHORT_LOG2  4
-+#define PR_BITS_PER_INT_LOG2    5
-+#define PR_BITS_PER_INT64_LOG2  6
-+#define PR_BITS_PER_LONG_LOG2   6
-+#define PR_BITS_PER_FLOAT_LOG2  5
-+#define PR_BITS_PER_DOUBLE_LOG2 6
-+#define PR_BITS_PER_WORD_LOG2   6
-+
-+#define PR_ALIGN_OF_SHORT   2
-+#define PR_ALIGN_OF_INT     4
-+#define PR_ALIGN_OF_LONG    8
-+#define PR_ALIGN_OF_INT64   8
-+#define PR_ALIGN_OF_FLOAT   4
-+#define PR_ALIGN_OF_DOUBLE  8
-+#define PR_ALIGN_OF_POINTER 8
-+#define PR_ALIGN_OF_WORD    8
-+
-+#define PR_BYTES_PER_WORD_LOG2  3
-+#define PR_BYTES_PER_DWORD_LOG2 3
-+
- #else
- 
- #error "Unknown CPU architecture"
- 
- #endif
- 
- #ifndef HAVE_LONG_LONG
- #define	HAVE_LONG_LONG
-diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
---- a/pr/include/md/_linux.h
-+++ b/pr/include/md/_linux.h
-@@ -54,16 +54,20 @@
- #elif defined(__avr32__)
- #define _PR_SI_ARCHITECTURE "avr32"
- #elif defined(__m32r__)
- #define _PR_SI_ARCHITECTURE "m32r"
- #elif defined(__nios2__)
- #define _PR_SI_ARCHITECTURE "nios2"
- #elif defined(__or1k__)
- #define _PR_SI_ARCHITECTURE "or1k"
-+#elif defined(__riscv) && (__riscv_xlen == 32)
-+#define _PR_SI_ARCHITECTURE "riscv32"
-+#elif defined(__riscv) && (__riscv_xlen == 64)
-+#define _PR_SI_ARCHITECTURE "riscv64"
- #else
- #error "Unknown CPU architecture"
- #endif
- #define PR_DLL_SUFFIX		".so"
- 
- #define _PR_VMBASE              0x30000000
- #define _PR_STACK_VMBASE	0x50000000
- #define _MD_DEFAULT_STACK_SIZE	65536L
-
diff --git a/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch b/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
index ecc6d31..7ba59ed 100644
--- a/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
+++ b/meta/recipes-support/nspr/nspr/remove-rpath-from-tests.patch
@@ -15,7 +15,7 @@ Index: nspr/pr/tests/Makefile.in
 ===================================================================
 --- nspr.orig/pr/tests/Makefile.in
 +++ nspr/pr/tests/Makefile.in
-@@ -315,7 +315,7 @@ ifeq ($(OS_ARCH), SunOS)
+@@ -316,7 +316,7 @@ ifeq ($(OS_ARCH), SunOS)
  endif # SunOS
  
  ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
diff --git a/meta/recipes-support/nspr/nspr_4.19.bb b/meta/recipes-support/nspr/nspr_4.20.bb
similarity index 95%
rename from meta/recipes-support/nspr/nspr_4.19.bb
rename to meta/recipes-support/nspr/nspr_4.20.bb
index 0212be7..fe3b4bd 100644
--- a/meta/recipes-support/nspr/nspr_4.19.bb
+++ b/meta/recipes-support/nspr/nspr_4.20.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://remove-srcdir-from-configure-in.patch \
            file://0002-Add-nios2-support.patch \
            file://0001-md-Fix-build-with-musl.patch \
-           file://0003-Add-type-definitions-for-the-RISC-V-architecture.patch \
            file://0004-Add-ARC-support.patch \
            file://nspr.pc.in \
 "
@@ -24,8 +23,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "e1d27282ad6286b69d6b9fd07201d3dd"
-SRC_URI[sha256sum] = "2ed95917fa2277910d1d1cf36030607dccc0ba522bba08e2af13c113dcd8f729"
+SRC_URI[md5sum] = "1c198c7e73f6b0e2bb9153a644ba246b"
+SRC_URI[sha256sum] = "2c8964913da89ffbaf464d49ce44d79e8804e1794ef9a8c52a7bff7224d1556e"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.7.4


