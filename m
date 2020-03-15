Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id A301A61C13
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:13 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id x7so8282440pgh.5
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fWTf2c/5X1tKPse55SsW48PF3Fegi6r24c+tUcei6U8=;
	b=CKBRVw2NonyhiVKHorGB4gL2hPYaQV2eCyXuOGKE5TLE0EkcaSsbef6yXJsZm0exRP
	UsFuPBTm2ZBpvjm8A0QOfgTwjTFcyyNNxhghtbawh1n58Qe49lPRH1RGlw9QtMnJ1/nn
	uIu14pdKjuX7fzqcK1rd21d1tnLomiGvl2Ahtj9qeL9gX27c5v9m5q9Fn00LRJRWejp9
	aD/Zu4tPqVXt3qcoLmIFn+zpnQaC5uyCNRFVYCSfGG50JJRZwhF0i/hhJnc/fdR0KkzK
	D+MLTc9vnzK4VBZS8Vzta2K6MIF0WQqFaVZim3i31XoDZ0ECtxytvLjwRnmpFaL/eCAQ
	v+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fWTf2c/5X1tKPse55SsW48PF3Fegi6r24c+tUcei6U8=;
	b=Kso3SfIYIdD2/PqNTlsOGKDsrQ8rgTVFiKf6mjpteWEkcjZGLdo2Ye44LwKwM+thC1
	CLCP/YmcxBLtNI1ylw54xaa3fLDqd6LnwMqtT5dVvktJa9NixHop5m7REzILun4ge6uy
	acDsox9UbUHaXBXiVEti+ReRhLio6lwx0r0LCmo7BjTjjvBB2IHp94x2IfWpwf7vUnRB
	Q8f5/AX1Y34Vcvy1vt3Dvz+nL+DRwcauEVKhaPqKAIeOGkE9QSLtKfI07pVL+mUYJjBv
	sXFLJo37yquzaq71bOJ2Gxw0sVoleHMF2Gv/yBh+oum1tJtYII5w6lKRnLEMuXRQ55m+
	wN9A==
X-Gm-Message-State: ANhLgQ0Sh3a8hKkORDBQql0WNE17UcgUeikcvo9VDxUSVfwOiyp87E8X
	qmjLoHlhOdXISLyQVib9tTmChF4+
X-Google-Smtp-Source: ADFU+vt+SCGT6D5fajI/lYOfi6hBTirKpd8Yvt0Mi3/5IpljK2lHJJ0RnFI1pTwktuLH9HifnmjzSA==
X-Received: by 2002:a63:214c:: with SMTP id s12mr21919144pgm.296.1584295934290;
	Sun, 15 Mar 2020 11:12:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.13
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:56 -0700
Message-Id: <c8f5b560bfd67ae3880c380a2700e782e454958e.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 14/16] glibc: CVE-2020-10029
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:14 -0000

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Backport the CVE patch from upstream:
[https://sourceware.org/git/gitweb.cgi?p=glibc.git;
a=patch;h=9333498794cde1d5cca518badf79533a24114b6f]

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../glibc/glibc/CVE-2020-10029.patch          | 128 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.30.bb         |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-10029.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-10029.patch b/meta/recipes-core/glibc/glibc/CVE-2020-10029.patch
new file mode 100644
index 0000000000..606b691bcf
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2020-10029.patch
@@ -0,0 +1,128 @@
+From ce265ec5bc25ec35fba53807abac1b0c8469895e Mon Sep 17 00:00:00 2001
+From: Joseph Myers <joseph@codesourcery.com>
+Date: Wed, 12 Feb 2020 23:31:56 +0000
+Subject: [PATCH] Avoid ldbl-96 stack corruption from range reduction of
+
+ pseudo-zero (bug 25487).
+
+Bug 25487 reports stack corruption in ldbl-96 sinl on a pseudo-zero
+argument (an representation where all the significand bits, including
+the explicit high bit, are zero, but the exponent is not zero, which
+is not a valid representation for the long double type).
+
+Although this is not a valid long double representation, existing
+practice in this area (see bug 4586, originally marked invalid but
+subsequently fixed) is that we still seek to avoid invalid memory
+accesses as a result, in case of programs that treat arbitrary binary
+data as long double representations, although the invalid
+representations of the ldbl-96 format do not need to be consistently
+handled the same as any particular valid representation.
+
+This patch makes the range reduction detect pseudo-zero and unnormal
+representations that would otherwise go to __kernel_rem_pio2, and
+returns a NaN for them instead of continuing with the range reduction
+process.  (Pseudo-zero and unnormal representations whose unbiased
+exponent is less than -1 have already been safely returned from the
+function before this point without going through the rest of range
+reduction.)  Pseudo-zero representations would previously result in
+the value passed to __kernel_rem_pio2 being all-zero, which is
+definitely unsafe; unnormal representations would previously result in
+a value passed whose high bit is zero, which might well be unsafe
+since that is not a form of input expected by __kernel_rem_pio2.
+
+Tested for x86_64.
+
+CVE: CVE-2020-10029
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;
+a=patch;h=9333498794cde1d5cca518badf79533a24114b6f]
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
+---
+ sysdeps/ieee754/ldbl-96/Makefile           |  3 ++-
+ sysdeps/ieee754/ldbl-96/e_rem_pio2l.c      | 12 +++++++++
+ sysdeps/ieee754/ldbl-96/test-sinl-pseudo.c | 41 ++++++++++++++++++++++++++++++
+ 3 files changed, 55 insertions(+), 1 deletion(-)
+ create mode 100644 sysdeps/ieee754/ldbl-96/test-sinl-pseudo.c
+
+diff --git a/sysdeps/ieee754/ldbl-96/Makefile b/sysdeps/ieee754/ldbl-96/Makefile
+index b103254..052c1c7 100644
+--- a/sysdeps/ieee754/ldbl-96/Makefile
++++ b/sysdeps/ieee754/ldbl-96/Makefile
+@@ -17,5 +17,6 @@
+ # <http://www.gnu.org/licenses/>.
+ 
+ ifeq ($(subdir),math)
+-tests += test-canonical-ldbl-96 test-totalorderl-ldbl-96
++tests += test-canonical-ldbl-96 test-totalorderl-ldbl-96 test-sinl-pseudo
++CFLAGS-test-sinl-pseudo.c += -fstack-protector-all
+ endif
+diff --git a/sysdeps/ieee754/ldbl-96/e_rem_pio2l.c b/sysdeps/ieee754/ldbl-96/e_rem_pio2l.c
+index 805de22..1aeccb4 100644
+--- a/sysdeps/ieee754/ldbl-96/e_rem_pio2l.c
++++ b/sysdeps/ieee754/ldbl-96/e_rem_pio2l.c
+@@ -210,6 +210,18 @@ __ieee754_rem_pio2l (long double x, long double *y)
+       return 0;
+     }
+ 
++  if ((i0 & 0x80000000) == 0)
++    {
++      /* Pseudo-zero and unnormal representations are not valid
++	 representations of long double.  We need to avoid stack
++	 corruption in __kernel_rem_pio2, which expects input in a
++	 particular normal form, but those representations do not need
++	 to be consistently handled like any particular floating-point
++	 value.  */
++      y[1] = y[0] = __builtin_nanl ("");
++      return 0;
++    }
++
+   /* Split the 64 bits of the mantissa into three 24-bit integers
+      stored in a double array.  */
+   exp = j0 - 23;
+diff --git a/sysdeps/ieee754/ldbl-96/test-sinl-pseudo.c b/sysdeps/ieee754/ldbl-96/test-sinl-pseudo.c
+new file mode 100644
+index 0000000..f59b977
+--- /dev/null
++++ b/sysdeps/ieee754/ldbl-96/test-sinl-pseudo.c
+@@ -0,0 +1,41 @@
++/* Test sinl for pseudo-zeros and unnormals for ldbl-96 (bug 25487).
++   Copyright (C) 2020 Free Software Foundation, Inc.
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
++#include <math.h>
++#include <math_ldbl.h>
++#include <stdint.h>
++
++static int
++do_test (void)
++{
++  for (int i = 0; i < 64; i++)
++    {
++      uint64_t sig = i == 63 ? 0 : 1ULL << i;
++      long double ld;
++      SET_LDOUBLE_WORDS (ld, 0x4141,
++			 sig >> 32, sig & 0xffffffffULL);
++      /* The requirement is that no stack overflow occurs when the
++	 pseudo-zero or unnormal goes through range reduction.  */
++      volatile long double ldr;
++      ldr = sinl (ld);
++      (void) ldr;
++    }
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.30.bb b/meta/recipes-core/glibc/glibc_2.30.bb
index 7913bc2812..c9e44a396d 100644
--- a/meta/recipes-core/glibc/glibc_2.30.bb
+++ b/meta/recipes-core/glibc/glibc_2.30.bb
@@ -42,6 +42,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-inject-file-assembly-directives.patch \
            file://0028-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://CVE-2019-19126.patch \
+           file://CVE-2020-10029.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.17.1


