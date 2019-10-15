Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id CA3547F2FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 01:33:55 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id k20so3734112pgi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 18:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XlUU4sjD1DwTYCbthe8w6cbXVRQ0xIhP6ssU/Yt3oTc=;
	b=CeSmq0cjk9AQrf2R+kB+/Zu13vPj/6t2lLiS8j/Sl4PHbspaMkzibrYMHqo6LE1SPq
	oj7EixzW6oRI5bhGyi6HGxeH9R7qjgp+5ZVjZQ6idX58XYIO6Nc22UTqz16wrGl2OdB/
	48mfzRnarTXv3neFtZpB/3hGHjPKajxx2qIBJ3BR1d4yPQwiNTt6tRH0RdcxjZJIy2wx
	MRdWg9dvDTp8EwIgyATRDtAJL1rTlIbLyPLO9yfGKC/FrlYO+tTVla8GEz0oJOY2eAmH
	r0sRD0xqx3SAXmcuIcxF3CjycBwLarrgfwYrEP+lLj1vuIA9z/IA+Q0Vhb4Igk6b2j7m
	CXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XlUU4sjD1DwTYCbthe8w6cbXVRQ0xIhP6ssU/Yt3oTc=;
	b=n8B+5l00Z3gzPPu1+I0QP58MCkwuWpoC3eLyXwa0SASo7vrGDLpn/XlDQN953feIYq
	OYE5nLjYzLIOtLdhgo8atZH2We5T2jUrIZa8yXST6pJjd6TBcYmzWqlP4jaJ2BxpNxIw
	DczLfdna8xCX128wWMikDBDBE05OIAk/ndhuCKnhNObRR8zbNQjCB/MCw28JuBbPrW15
	UOSOc0sr4mTvyS8R3jLUgikWC8WoypqCZg79VRZCqqnvx0qbTSXIaSy9z14E75BrLoup
	ZeF238I8y0k9tjuJSiVZdyCodyY5ZRcDZO0MVWoBJDspIS8+9E6VtAvjq5ZMPb+2uT3z
	hFAA==
X-Gm-Message-State: APjAAAXJi00eCXq8x0kHkkVH51Ygl8NEMy7wS6NWCbYkEER6hnrQ++u/
	uqKRSopa1g13WuD8dk/pl6fpmzrN
X-Google-Smtp-Source: APXvYqyb2NJDPycvUuwSNqn8jNuYVIxnudiMQEI/JIoI5A3SV9ecGS8LzLGzssdFVpRW4kBN7oo7HQ==
X-Received: by 2002:a17:90a:f491:: with SMTP id
	bx17mr39915380pjb.106.1571103236066; 
	Mon, 14 Oct 2019 18:33:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:1c7e:9ce6:b4cb:b655])
	by smtp.gmail.com with ESMTPSA id
	b20sm22710629pff.158.2019.10.14.18.33.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Oct 2019 18:33:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 18:33:44 -0700
Message-Id: <d68441ed80fd43f091baf01bfdb47c3ec010c662.1571103112.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571103112.git.akuster808@gmail.com>
References: <cover.1571103112.git.akuster808@gmail.com>
Subject: [thud 3/7] glibc: Security fix for cve <CVE-2019-6488, CVE-2019-7309>
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
X-List-Received-Date: Tue, 15 Oct 2019 01:33:55 -0000

From: Muminul Islam <misla011@fiu.edu>

Signed-off-by: Muminul Islam <muislam@microsoft.com>

CVE: CVE-2019-6488, CVE-2019-7309

Upstream-Status: Backport
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc/CVE-2019-6488.patch | 274 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc/CVE-2019-7309.patch | 207 ++++++++++++++++
 meta/recipes-core/glibc/glibc_2.28.bb             |   2 +
 3 files changed, 483 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-6488.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-7309.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-6488.patch b/meta/recipes-core/glibc/glibc/CVE-2019-6488.patch
new file mode 100644
index 0000000..fa42375
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-6488.patch
@@ -0,0 +1,274 @@
+From 718016100d889a986c536b595bf6ec0d6ab4b90e Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Fri, 1 Feb 2019 12:17:09 -0800
+Subject: [PATCH] x86-64 memchr/wmemchr: Properly handle the length parameter
+ [BZ #24097]
+Reply-To: muislam@microsoft.com
+
+On x32, the size_t parameter may be passed in the lower 32 bits of a
+64-bit register with the non-zero upper 32 bits.  The string/memory
+functions written in assembly can only use the lower 32 bits of a
+64-bit register as length or must clear the upper 32 bits before using
+the full 64-bit register for length.
+
+This pach fixes memchr/wmemchr for x32.  Tested on x86-64 and x32.  On
+x86-64, libc.so is the same with and withou the fix.
+
+	[BZ #24097]
+	CVE-2019-6488
+	* sysdeps/x86_64/memchr.S: Use RDX_LP for length.  Clear the
+	upper 32 bits of RDX register.
+	* sysdeps/x86_64/multiarch/memchr-avx2.S: Likewise.
+	* sysdeps/x86_64/x32/Makefile (tests): Add tst-size_t-memchr and
+	tst-size_t-wmemchr.
+	* sysdeps/x86_64/x32/test-size_t.h: New file.
+	* sysdeps/x86_64/x32/tst-size_t-memchr.c: Likewise.
+	* sysdeps/x86_64/x32/tst-size_t-wmemchr.c: Likewise.
+
+(cherry picked from commit 97700a34f36721b11a754cf37a1cc40695ece1fd)
+
+CVE: CVE-2019-6488
+
+Upstream-Status: Backport
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+---
+ NEWS                                    |  1 -
+ sysdeps/x86_64/memchr.S                 | 10 ++--
+ sysdeps/x86_64/multiarch/memchr-avx2.S  |  8 ++-
+ sysdeps/x86_64/x32/Makefile             |  8 +++
+ sysdeps/x86_64/x32/test-size_t.h        | 35 ++++++++++++
+ sysdeps/x86_64/x32/tst-size_t-memchr.c  | 72 +++++++++++++++++++++++++
+ sysdeps/x86_64/x32/tst-size_t-wmemchr.c | 20 +++++++
+ 7 files changed, 148 insertions(+), 6 deletions(-)
+ create mode 100644 sysdeps/x86_64/x32/test-size_t.h
+ create mode 100644 sysdeps/x86_64/x32/tst-size_t-memchr.c
+ create mode 100644 sysdeps/x86_64/x32/tst-size_t-wmemchr.c
+
+diff --git a/NEWS b/NEWS
+index fd14941128..b158973a30 100644
+--- a/NEWS
++++ b/NEWS
+@@ -17,7 +17,6 @@ The following bugs are resolved with this release:
+   [23606] Missing ENDBR32 in sysdeps/i386/start.S
+   [23679] gethostid: Missing NULL check for gethostbyname_r result
+   [23717] Fix stack overflow in stdlib/tst-setcontext9
+-
+ 
+ Version 2.28
+ 
+diff --git a/sysdeps/x86_64/memchr.S b/sysdeps/x86_64/memchr.S
+index feef5d4f24..cb320257a2 100644
+--- a/sysdeps/x86_64/memchr.S
++++ b/sysdeps/x86_64/memchr.S
+@@ -34,12 +34,16 @@ ENTRY(MEMCHR)
+ 	mov	%edi, %ecx
+ 
+ #ifdef USE_AS_WMEMCHR
+-	test	%rdx, %rdx
++	test	%RDX_LP, %RDX_LP
+ 	jz	L(return_null)
+-	shl	$2, %rdx
++	shl	$2, %RDX_LP
+ #else
++# ifdef __ILP32__
++	/* Clear the upper 32 bits.  */
++	movl	%edx, %edx
++# endif
+ 	punpcklbw %xmm1, %xmm1
+-	test	%rdx, %rdx
++	test	%RDX_LP, %RDX_LP
+ 	jz	L(return_null)
+ 	punpcklbw %xmm1, %xmm1
+ #endif
+diff --git a/sysdeps/x86_64/multiarch/memchr-avx2.S b/sysdeps/x86_64/multiarch/memchr-avx2.S
+index 5f5e772554..c81da19bf0 100644
+--- a/sysdeps/x86_64/multiarch/memchr-avx2.S
++++ b/sysdeps/x86_64/multiarch/memchr-avx2.S
+@@ -40,16 +40,20 @@
+ ENTRY (MEMCHR)
+ # ifndef USE_AS_RAWMEMCHR
+ 	/* Check for zero length.  */
+-	testq	%rdx, %rdx
++	test	%RDX_LP, %RDX_LP
+ 	jz	L(null)
+ # endif
+ 	movl	%edi, %ecx
+ 	/* Broadcast CHAR to YMM0.  */
+ 	vmovd	%esi, %xmm0
+ # ifdef USE_AS_WMEMCHR
+-	shl	$2, %rdx
++	shl	$2, %RDX_LP
+ 	vpbroadcastd %xmm0, %ymm0
+ # else
++#  ifdef __ILP32__
++	/* Clear the upper 32 bits.  */
++	movl	%edx, %edx
++#  endif
+ 	vpbroadcastb %xmm0, %ymm0
+ # endif
+ 	/* Check if we may cross page boundary with one vector load.  */
+diff --git a/sysdeps/x86_64/x32/Makefile b/sysdeps/x86_64/x32/Makefile
+index f2ebc24fb0..7d528889c6 100644
+--- a/sysdeps/x86_64/x32/Makefile
++++ b/sysdeps/x86_64/x32/Makefile
+@@ -4,3 +4,11 @@ ifeq ($(subdir),math)
+ # 64-bit llround.  Add -fno-builtin-lround to silence the compiler.
+ CFLAGS-s_llround.c += -fno-builtin-lround
+ endif
++
++ifeq ($(subdir),string)
++tests += tst-size_t-memchr
++endif
++
++ifeq ($(subdir),wcsmbs)
++tests += tst-size_t-wmemchr
++endif
+diff --git a/sysdeps/x86_64/x32/test-size_t.h b/sysdeps/x86_64/x32/test-size_t.h
+new file mode 100644
+index 0000000000..78a940863e
+--- /dev/null
++++ b/sysdeps/x86_64/x32/test-size_t.h
+@@ -0,0 +1,35 @@
++/* Test string/memory functions with size_t in the lower 32 bits of
++   64-bit register.
++   Copyright (C) 2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#define TEST_MAIN
++#include <string/test-string.h>
++
++/* On x32, parameter_t may be passed in a 64-bit register with the LEN
++   field in the lower 32 bits.  When the LEN field of 64-bit register
++   is passed to string/memory function as the size_t parameter, only
++   the lower 32 bits can be used.  */
++typedef struct
++{
++  union
++    {
++      size_t len;
++      void (*fn) (void);
++    };
++  void *p;
++} parameter_t;
+diff --git a/sysdeps/x86_64/x32/tst-size_t-memchr.c b/sysdeps/x86_64/x32/tst-size_t-memchr.c
+new file mode 100644
+index 0000000000..29a3daf102
+--- /dev/null
++++ b/sysdeps/x86_64/x32/tst-size_t-memchr.c
+@@ -0,0 +1,72 @@
++/* Test memchr with size_t in the lower 32 bits of 64-bit register.
++   Copyright (C) 2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef WIDE
++# define TEST_NAME "memchr"
++#else
++# define TEST_NAME "wmemchr"
++#endif /* WIDE */
++#include "test-size_t.h"
++
++#ifndef WIDE
++# define MEMCHR memchr
++# define CHAR char
++# define UCHAR unsigned char
++#else
++# include <wchar.h>
++# define MEMCHR wmemchr
++# define CHAR wchar_t
++# define UCHAR wchar_t
++#endif /* WIDE */
++
++IMPL (MEMCHR, 1)
++
++typedef CHAR * (*proto_t) (const CHAR*, int, size_t);
++
++static CHAR *
++__attribute__ ((noinline, noclone))
++do_memchr (parameter_t a, parameter_t b)
++{
++  return CALL (&b, a.p, (uintptr_t) b.p, a.len);
++}
++
++static int
++test_main (void)
++{
++  test_init ();
++
++  parameter_t src = { { page_size / sizeof (CHAR) }, buf2 };
++  parameter_t c = { { 0 }, (void *) (uintptr_t) 0x12 };
++
++  int ret = 0;
++  FOR_EACH_IMPL (impl, 0)
++    {
++      c.fn = impl->fn;
++      CHAR *res = do_memchr (src, c);
++      if (res)
++	{
++	  error (0, 0, "Wrong result in function %s: %p != NULL",
++		 impl->name, res);
++	  ret = 1;
++	}
++    }
++
++  return ret ? EXIT_FAILURE : EXIT_SUCCESS;
++}
++
++#include <support/test-driver.c>
+diff --git a/sysdeps/x86_64/x32/tst-size_t-wmemchr.c b/sysdeps/x86_64/x32/tst-size_t-wmemchr.c
+new file mode 100644
+index 0000000000..877801d646
+--- /dev/null
++++ b/sysdeps/x86_64/x32/tst-size_t-wmemchr.c
+@@ -0,0 +1,20 @@
++/* Test wmemchr with size_t in the lower 32 bits of 64-bit register.
++   Copyright (C) 2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#define WIDE 1
++#include "tst-size_t-memchr.c"
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-7309.patch b/meta/recipes-core/glibc/glibc/CVE-2019-7309.patch
new file mode 100644
index 0000000..04963c2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-7309.patch
@@ -0,0 +1,207 @@
+From af7f46c45a60e6df754fb6258b546917e61ae6f1 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 4 Feb 2019 08:55:52 -0800
+Subject: [PATCH] x86-64 memcmp: Use unsigned Jcc instructions on size [BZ
+ #24155]
+Reply-To: muislam@microsoft.com
+
+Since the size argument is unsigned. we should use unsigned Jcc
+instructions, instead of signed, to check size.
+
+Tested on x86-64 and x32, with and without --disable-multi-arch.
+
+	[BZ #24155]
+	CVE-2019-7309
+	* NEWS: Updated for CVE-2019-7309.
+	* sysdeps/x86_64/memcmp.S: Use RDX_LP for size.  Clear the
+	upper 32 bits of RDX register for x32.  Use unsigned Jcc
+	instructions, instead of signed.
+	* sysdeps/x86_64/x32/Makefile (tests): Add tst-size_t-memcmp-2.
+	* sysdeps/x86_64/x32/tst-size_t-memcmp-2.c: New test.
+
+(cherry picked from commit 3f635fb43389b54f682fc9ed2acc0b2aaf4a923d)
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-7309
+
+Upstream-Status: Backport
+---
+ sysdeps/x86_64/memcmp.S                  | 20 +++---
+ sysdeps/x86_64/x32/Makefile              |  2 +-
+ sysdeps/x86_64/x32/tst-size_t-memcmp-2.c | 79 ++++++++++++++++++++++++
+ 3 files changed, 92 insertions(+), 9 deletions(-)
+ create mode 100644 sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
+
+diff --git a/sysdeps/x86_64/memcmp.S b/sysdeps/x86_64/memcmp.S
+index bcb4a2e88d..45918d375a 100644
+--- a/sysdeps/x86_64/memcmp.S
++++ b/sysdeps/x86_64/memcmp.S
+@@ -21,14 +21,18 @@
+ 
+ 	.text
+ ENTRY (memcmp)
+-	test	%rdx, %rdx
++#ifdef __ILP32__
++	/* Clear the upper 32 bits.  */
++	movl	%edx, %edx
++#endif
++	test	%RDX_LP, %RDX_LP
+ 	jz	L(finz)
+ 	cmpq	$1, %rdx
+-	jle	L(finr1b)
++	jbe	L(finr1b)
+ 	subq	%rdi, %rsi
+ 	movq	%rdx, %r10
+ 	cmpq	$32, %r10
+-	jge	L(gt32)
++	jae	L(gt32)
+ 	/* Handle small chunks and last block of less than 32 bytes.  */
+ L(small):
+ 	testq	$1, %r10
+@@ -156,7 +160,7 @@ L(A32):
+ 	movq	%r11, %r10
+ 	andq	$-32, %r10
+ 	cmpq	%r10, %rdi
+-        jge	L(mt16)
++        jae	L(mt16)
+ 	/* Pre-unroll to be ready for unrolled 64B loop.  */
+ 	testq	$32, %rdi
+ 	jz	L(A64)
+@@ -178,7 +182,7 @@ L(A64):
+ 	movq	%r11, %r10
+ 	andq	$-64, %r10
+ 	cmpq	%r10, %rdi
+-        jge	L(mt32)
++        jae	L(mt32)
+ 
+ L(A64main):
+ 	movdqu    (%rdi,%rsi), %xmm0
+@@ -216,7 +220,7 @@ L(mt32):
+ 	movq	%r11, %r10
+ 	andq	$-32, %r10
+ 	cmpq	%r10, %rdi
+-        jge	L(mt16)
++        jae	L(mt16)
+ 
+ L(A32main):
+ 	movdqu    (%rdi,%rsi), %xmm0
+@@ -254,7 +258,7 @@ L(ATR):
+ 	movq	%r11, %r10
+ 	andq	$-32, %r10
+ 	cmpq	%r10, %rdi
+-        jge	L(mt16)
++        jae	L(mt16)
+ 	testq	$16, %rdi
+ 	jz	L(ATR32)
+ 
+@@ -325,7 +329,7 @@ L(ATR64main):
+ 	movq	%r11, %r10
+ 	andq	$-32, %r10
+ 	cmpq	%r10, %rdi
+-        jge	L(mt16)
++        jae	L(mt16)
+ 
+ L(ATR32res):
+ 	movdqa    (%rdi,%rsi), %xmm0
+diff --git a/sysdeps/x86_64/x32/Makefile b/sysdeps/x86_64/x32/Makefile
+index 7d528889c6..c9850beeb5 100644
+--- a/sysdeps/x86_64/x32/Makefile
++++ b/sysdeps/x86_64/x32/Makefile
+@@ -6,7 +6,7 @@ CFLAGS-s_llround.c += -fno-builtin-lround
+ endif
+ 
+ ifeq ($(subdir),string)
+-tests += tst-size_t-memchr
++tests += tst-size_t-memchr tst-size_t-memcmp-2
+ endif
+ 
+ ifeq ($(subdir),wcsmbs)
+diff --git a/sysdeps/x86_64/x32/tst-size_t-memcmp-2.c b/sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
+new file mode 100644
+index 0000000000..d8ae1a0813
+--- /dev/null
++++ b/sysdeps/x86_64/x32/tst-size_t-memcmp-2.c
+@@ -0,0 +1,79 @@
++/* Test memcmp with size_t in the lower 32 bits of 64-bit register.
++   Copyright (C) 2019 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#define TEST_MAIN
++#ifdef WIDE
++# define TEST_NAME "wmemcmp"
++#else
++# define TEST_NAME "memcmp"
++#endif
++
++#include "test-size_t.h"
++
++#ifdef WIDE
++# include <inttypes.h>
++# include <wchar.h>
++
++# define MEMCMP wmemcmp
++# define CHAR wchar_t
++#else
++# define MEMCMP memcmp
++# define CHAR char
++#endif
++
++IMPL (MEMCMP, 1)
++
++typedef int (*proto_t) (const CHAR *, const CHAR *, size_t);
++
++static int
++__attribute__ ((noinline, noclone))
++do_memcmp (parameter_t a, parameter_t b)
++{
++  return CALL (&b, a.p, b.p, a.len);
++}
++
++static int
++test_main (void)
++{
++  test_init ();
++
++  parameter_t dest = { { page_size / sizeof (CHAR) }, buf1 };
++  parameter_t src = { { 0 }, buf2 };
++
++  memcpy (buf1, buf2, page_size);
++
++  CHAR *p = (CHAR *) buf1;
++  p[page_size / sizeof (CHAR) - 1] = (CHAR) 1;
++
++  int ret = 0;
++  FOR_EACH_IMPL (impl, 0)
++    {
++      src.fn = impl->fn;
++      int res = do_memcmp (dest, src);
++      if (res >= 0)
++	{
++	  error (0, 0, "Wrong result in function %s: %i >= 0",
++		 impl->name, res);
++	  ret = 1;
++	}
++    }
++
++  return ret ? EXIT_FAILURE : EXIT_SUCCESS;
++}
++
++#include <support/test-driver.c>
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 0839fa1..4e6ee4d 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -50,6 +50,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://CVE-2019-9169.patch \
            file://CVE-2016-10739.patch \
            file://CVE-2018-19591.patch \
+           file://CVE-2019-6488.patch \
+           file://CVE-2019-7309.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


