Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.3407.1611009511155657803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NXBaQPA+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id n7so11827453pgg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6v3BB2uNIxLQ0+N2Fn0sXdd7fM3tPJ6bZ++fxoUJIXQ=;
        b=NXBaQPA+GSnak6gKzAeg3FWqRTq8Q9y96fr+N+PrqIX33SUw8jVAxhIm24cRUSULgb
         QEPBN4UF0UULqugYqGx7evkqnfgzmPOfitWln+ibKvwL5EM3iI4XISY4pCRNpMCohq6g
         Bt/7ZOkGc8yzdMRoeU/bZTCPsb5LTu7Cp5cyp7YGKepV8R4N6egLHY+bhQE+ASXagB/Y
         UwcfVfoGAJEzHFRx0ZWNP/9ATZgQCLII0cbhWNTEhHLWobWhGep9BI+YVGWGvu6HvO+7
         pJ95hopGgN2gMg8x0vxAfnDHTVZ6nmCv/vsb7WBvB4iF6YLkzipAk8Gr6a7zWTJnJiv8
         cq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6v3BB2uNIxLQ0+N2Fn0sXdd7fM3tPJ6bZ++fxoUJIXQ=;
        b=GTQO5pHUXplFbK2fBjFD+oEem6p7TSiX4Gl/o3yOYfY7BfPtKG3LaDYJKjUhu7nMHP
         3AuZrzntxgpht2k6TI0aDhbrvgB+FGRqJ5Nou9gvV95IcJHKjPuDZevBbBZValU4jpdQ
         CttuWWLTayOWDtBbkoo5gfydXYisSST0MUJ3EekVPiw2xr8Bt0zkJhQuhtVDCnaMiIec
         HD5lfNnC7KcUOyBmgFo0vhL5Up4N86n7GP1pBF2nuRT9sXjq+nzof2sg2lLNFmOb0UA0
         sNsgli9mdzSxCNcZej+Z4ihNJFYjhf/gGOXeDb/qm0ocOIpoUnRi9NlbWynOQTsJiMH4
         VcrA==
X-Gm-Message-State: AOAM530gZ7EswnNatzyY6wnSHR1O57ZPYHyoi5rLxoU9J/GtFN0AZmg1
	vwVmITClKotk1IxVUD4MrlCSz9Sw5LJusWetnJQ=
X-Google-Smtp-Source: ABdhPJyzFRQ6a7q9xTBDk7W4vps+MabPCL/3a8QJ7HN+mgftRGQt5AdKAnmoOv/3ITrBzIXsAy5x4g==
X-Received: by 2002:a65:67cf:: with SMTP id b15mr1657584pgs.429.1611009510007;
        Mon, 18 Jan 2021 14:38:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.38.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:38:29 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/19] glibc: Security fix for CVE-2020-29573
Date: Mon, 18 Jan 2021 12:36:24 -1000
Message-Id: <f67ada971e6065fc5179059df3a8cd57fe6b0220.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Armin Kuster <akuster@mvista.com>

Source: glibc.org
MR: 107580
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/?p=glibc.git;a=commit;h=681900d29683722b1cb0a8e565a0585846ec5a61

ChangeID: 7bc5edb2e1947ac0774a453000a1568bbe3bb7d2
Description:

Fixedup to match 2.31 context. ldbl2mpn.c is in i386 for this version

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/CVE-2020-29573.patch          | 128 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29573.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch b/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
new file mode 100644
index 0000000000..1e75f2d29d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
@@ -0,0 +1,128 @@
+From 681900d29683722b1cb0a8e565a0585846ec5a61 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 22 Sep 2020 19:07:48 +0200
+Subject: [PATCH] x86: Harden printf against non-normal long double values (bug
+ 26649)
+
+The behavior of isnan/__builtin_isnan on bit patterns that do not
+correspond to something that the CPU would produce from valid inputs
+is currently under-defined in the toolchain. (The GCC built-in and
+glibc disagree.)
+
+The isnan check in PRINTF_FP_FETCH in stdio-common/printf_fp.c
+assumes the GCC behavior that returns true for non-normal numbers
+which are not specified as NaN. (The glibc implementation returns
+false for such numbers.)
+
+At present, passing non-normal numbers to __mpn_extract_long_double
+causes this function to produce irregularly shaped multi-precision
+integers, triggering undefined behavior in __printf_fp_l.
+
+With GCC 10 and glibc 2.32, this behavior is not visible because
+__builtin_isnan is used, which avoids calling
+__mpn_extract_long_double in this case.  This commit updates the
+implementation of __mpn_extract_long_double so that regularly shaped
+multi-precision integers are produced in this case, avoiding
+undefined behavior in __printf_fp_l.
+
+Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
+CVE: CVE-2020-29573
+Signed-off-By: Armin Kuster <akuster@mvista.com>
+
+---
+ sysdeps/x86/Makefile                    |  4 ++
+ sysdeps/x86/ldbl2mpn.c                  |  8 ++++
+ sysdeps/x86/tst-ldbl-nonnormal-printf.c | 52 +++++++++++++++++++++++++
+ 3 files changed, 64 insertions(+)
+ create mode 100644 sysdeps/x86/tst-ldbl-nonnormal-printf.c
+
+Index: git/sysdeps/x86/Makefile
+===================================================================
+--- git.orig/sysdeps/x86/Makefile
++++ git/sysdeps/x86/Makefile
+@@ -9,6 +9,10 @@ tests += tst-get-cpu-features tst-get-cp
+ tests-static += tst-get-cpu-features-static
+ endif
+ 
++ifeq ($(subdir),math)
++tests += tst-ldbl-nonnormal-printf
++endif # $(subdir) == math
++
+ ifeq ($(subdir),setjmp)
+ gen-as-const-headers += jmp_buf-ssp.sym
+ sysdep_routines += __longjmp_cancel
+Index: git/sysdeps/x86/tst-ldbl-nonnormal-printf.c
+===================================================================
+--- /dev/null
++++ git/sysdeps/x86/tst-ldbl-nonnormal-printf.c
+@@ -0,0 +1,52 @@
++/* Test printf with x86-specific non-normal long double value.
++   Copyright (C) 2020 Free Software Foundation, Inc.
++
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
++   <https://www.gnu.org/licenses/>.  */
++
++#include <stdio.h>
++#include <string.h>
++#include <support/check.h>
++
++/* Fill the stack with non-zero values.  This makes a crash in
++   snprintf more likely.  */
++static void __attribute__ ((noinline, noclone))
++fill_stack (void)
++{
++  char buffer[65536];
++  memset (buffer, 0xc0, sizeof (buffer));
++  asm ("" ::: "memory");
++}
++
++static int
++do_test (void)
++{
++  fill_stack ();
++
++  long double value;
++  memcpy (&value, "\x00\x04\x00\x00\x00\x00\x00\x00\x00\x04", 10);
++
++  char buf[30];
++  int ret = snprintf (buf, sizeof (buf), "%Lg", value);
++  TEST_COMPARE (ret, strlen (buf));
++  if (strcmp (buf, "nan") != 0)
++    /* If snprintf does not recognize the non-normal number as a NaN,
++       it has added the missing explicit MSB.  */
++    TEST_COMPARE_STRING (buf, "3.02201e-4624");
++  return 0;
++}
++
++#include <support/test-driver.c>
+Index: git/sysdeps/i386/ldbl2mpn.c
+===================================================================
+--- git.orig/sysdeps/i386/ldbl2mpn.c
++++ git/sysdeps/i386/ldbl2mpn.c
+@@ -115,6 +115,12 @@ __mpn_extract_long_double (mp_ptr res_pt
+ 	   && res_ptr[N - 1] == 0)
+     /* Pseudo zero.  */
+     *expt = 0;
+-
++  else
++    /* The sign bit is explicit, but add it in case it is missing in
++       the input.  Otherwise, callers will not be able to produce the
++       expected multi-precision integer layout by shifting the sign
++       bit into the MSB.  */
++    res_ptr[N - 1] |= (mp_limb_t) 1 << (LDBL_MANT_DIG - 1
++                   - ((N - 1) * BITS_PER_MP_LIMB));
+   return N;
+ }
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 3a0d60abf8..067d4de64a 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -42,6 +42,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://CVE-2020-29562.patch \
+           file://CVE-2020-29573.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.17.1

