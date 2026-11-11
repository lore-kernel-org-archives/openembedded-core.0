Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5345.1794386239343748487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 00:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VNKCjcgQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so2672170eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 00:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794386239; x=1794991039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a7NbBFqxlsDyz3jYWweT13gx2ksini4w3yXwkgPEafA=;
        b=VNKCjcgQj3UX9IDZDN8zXYfcBcRBpHl22bMuxcXgcf71oEVje/MbmAz2ogh2Ttuidz
         BxvwTw7TQKqMCJ3KjS1BXGDvWDRLYW0AMQ9/m+Ve6h7Iai7h/xMyF3UiKxRzWjgY5UvT
         WQsRi9jHxo5BVE0Q0ruoo1THqT9qUcmRaCs9JjqKimU7KWvz7jdQUKaXfdIqRlZ2Gp12
         p5r01SpMPygFFRRb+8BO9u0Tp606t8swSUGqF1fwewN0ETvtX7MMIQQVxEaGJa95oAcR
         kuLRXYf8Slj6gJtJoSAg4QXPzQT5IYbzCakr6F7M62JSaU8Y90QLrSAiOGZHiymdEJPt
         7yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386239; x=1794991039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7NbBFqxlsDyz3jYWweT13gx2ksini4w3yXwkgPEafA=;
        b=Vfv1VVVwn/7t+WQp2pcan9sp1d2AKy1ViB3Ylwax8FWS8Ob0jHct0QqKn3i5z91+h1
         7kF1U73K7i9ODueGtmvB4zDHW987Fiy1Fd/sgr1tRDGOFjXPellZPiYij27zj76HOXP4
         difLlgsNqxbGV9yDyfI/ugEJv+S3XGpjag+f/WUlXJGf+P/i12PzJs4eXmwJeSYeTFhg
         H0cxxGQBejYsWBzYFnZSdYRt8Ipxxy+JhJyiPVQxU+RK1UVoQpJQKWMtrhXaGVfjV7k0
         O7SVcVLCztUliU7vdQ+28CS+uDt593dUPQgyy3g2fMgCZNpCRqQ70AcAGVBvtK3kvFn9
         80rQ==
X-Gm-Message-State: APuU4Z9zNUzLKUhjM4xQ/8FXW8zJqYVgy54akA0ZblJnWsjVT4HaOvuP
	TO1tOJMvmgNI4oOcnpC4yToqKqnW2SaEHp5Z/aCQR+lTfCQLTUD/pPGqoS7pYg1HI2X5fg==
X-Gm-Gg: AYBFou1UQExTbHTUb+BEEKMRDVWskWGS22D6JJO0rodikgQtZQq9MyL8+8J4foHEmXK
	ZfqqSAE/ZYxKq3rgjOaSSbP18Uro7YwvPKDcay2SGUI987xidNhV46I9T08cl2YcitbCfBaq0pf
	iljaKKEOxngtcsVPzEkxl5+hCOxlIuyddFDep1rFOxtZ2lrMMQBdOEpbp9qmzjNFgOsOl+47A9o
	aL0LjLqYGBCqDcN1Py+WyB0G11bvvR1LamvoysCHueFb9A1UUHUj7qaZv7bXwzSOUzy1f02DmXC
	ehc++TVaLGxdcFYV4aW+mAngLB4fN6XdxYa1FQmhCySWsROXLJiYDIpGRh9bkY1EfIO73MBGS9S
	Xzie+VAnPiPcKZ0Bj8mk3UFPusi9tZVihPBb5jASnGWlGnGMAtJsrNyU49g9Uw7w6cklUUu3I5d
	sJUvFnfgB8EA4We3mr+2Y5krRlVFBPdXgyIs2ZWceyNnq9H+eiimo9rqOyzd+nVcv7MiwP8Iv/G
	RHa0gKHg+ypBzaPn/Bmh8oC5nbZunRxMQPFQQIwiBpTM6dI0wRxfuWxO2FQqtRRWb7R9AGQc9hn
	HenLJCccZ7hjG0lDlMkd0331X3S5HHabtFeDYeoGorbIyuQH0c2fq2XzcP7kctrzRtuohhlUQMp
	3LYpjnANJ3Y0Pt16dLY8Bx0Hi6Adfrg0MUNamIRIOvETqz4AQck0fpSNukmUSY1YPl90ZTcD/0q
	H0yP+MLHZiRupkOSrHKSX5RT4lIbSiJCM5/ppu+1RLRgEIRNUfOuIRzWb0DQR2LbRSvR/ee/pJO
	V3+PeC/+srbQcOgy1rEpBmTAydRzKNf2onl+2W1O3RfABuCMQ1Jn0xPjLGymdFfhWNwA5VC32+/
	jjj9
X-Received: by 2002:a05:693c:88cb:10b0:376:5b99:a816 with SMTP id 5a478bee46e88-37683188c5emr2546041eec.3.1794386238426;
        Wed, 11 Nov 2026 00:37:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm14504599eec.7.2026.11.11.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:37:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] musl: Use FENV_ACCESS pragma instead of maytrap exception behavior
Date: Wed, 11 Nov 2026 00:37:09 -0800
Message-ID: <20261111083711.549321-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 08:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249968
Content-Type: text/plain; charset="utf-8"

Upstream review [1] asked whether the real problem is a missing
#pragma STDC FENV_ACCESS ON in the affected sources. It is: with the
pragma in expm1.c, expm1f.c, hypot.c and hypotf.c, clang stops
speculating the floating point operations that raise the spurious
exceptions, and libc-test math/expm1, expm1f, hypot, hypotf and sinh
pass.

Tested natively on aarch64 with clang 23.1.3 and gcc 14.2 for
generic, cortex-a57, cortex-a72 and neoverse-n1: those tests now pass
with both compilers, and gcc builds are unchanged. The remaining clang
only math failure, yn, comes from fma contraction and is already
deleted from the libc-test ptest.

Replace the configure flag with the source change.

[1] https://www.openwall.com/lists/musl/2026/10/28/2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
AI-Generated: Uses Claude Code
---
 ...p-exception-behavior-maytrap-when-su.patch | 46 ------------
 ..._ACCESS-in-expm1-expm1f-hypot-and-hy.patch | 73 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  2 +-
 3 files changed, 74 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch
 create mode 100644 meta/recipes-core/musl/musl/0004-math-enable-FENV_ACCESS-in-expm1-expm1f-hypot-and-hy.patch

diff --git a/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch b/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch
deleted file mode 100644
index dfff81299b..0000000000
--- a/meta/recipes-core/musl/musl/0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From fe310a5e2fe6be3c28f800bde383d7df5aac4b49 Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Sun, 25 Oct 2026 21:54:26 -0700
-Subject: [PATCH] configure: use -ffp-exception-behavior=maytrap when supported
-
-The math library relies on floating point exception flags being raised
-exactly as the C code would raise them. GCC keeps that by default
-(-ftrapping-math), but clang assumes floating point exceptions are never
-inspected unless told otherwise, and may then evaluate both arms of a
-branch and select the result. Built with clang 23 for aarch64, expm1()
-computes both y*2.0*0x1p1023 and y*twopk for the k < 0 || k > 56 case
-and picks one with fcsel, so the unused multiply raises a spurious
-OVERFLOW. libc-test's math/expm1, expm1f, hypot, hypotf and sinh fail
-because of that.
-
--ffp-exception-behavior=maytrap tells clang to avoid transformations
-that raise exceptions the original code would not raise. GCC does not
-accept the option, so tryflag leaves GCC builds unchanged.
-
-Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2026/10/28/1]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- configure | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/configure b/configure
-index bc9fbe48..7e1e1b72 100755
---- a/configure
-+++ b/configure
-@@ -355,6 +355,16 @@ tryflag CFLAGS_C99FSE -fexcess-precision=standard \
- || { test "$ARCH" = i386 && tryflag CFLAGS_C99FSE -ffloat-store ; }
- tryflag CFLAGS_C99FSE -frounding-math
- 
-+#
-+# The math library relies on floating point exception flags being
-+# raised exactly as the C code would raise them. GCC does not move
-+# floating point operations that may trap across branches by default
-+# (-ftrapping-math), but clang assumes exceptions are never inspected
-+# unless told otherwise, and may then evaluate both sides of a branch,
-+# raising spurious exceptions (e.g. OVERFLOW from expm1, hypot, sinh).
-+#
-+tryflag CFLAGS_C99FSE -ffp-exception-behavior=maytrap
-+
- #
- # Semantically we want to insist that our sources follow the
- # C rules for type-based aliasing, but most if not all real-world
diff --git a/meta/recipes-core/musl/musl/0004-math-enable-FENV_ACCESS-in-expm1-expm1f-hypot-and-hy.patch b/meta/recipes-core/musl/musl/0004-math-enable-FENV_ACCESS-in-expm1-expm1f-hypot-and-hy.patch
new file mode 100644
index 0000000000..594e97a348
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0004-math-enable-FENV_ACCESS-in-expm1-expm1f-hypot-and-hy.patch
@@ -0,0 +1,73 @@
+From 5009e7cdcd11c585f2bdebacf2fb4f8540508efe Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 10 Nov 2026 18:36:03 -0800
+Subject: [PATCH] math: enable FENV_ACCESS in expm1, expm1f, hypot and hypotf
+
+These functions rely on floating point exception flags being raised
+exactly as the C code would raise them, but without FENV_ACCESS the
+compiler may assume the flags are never inspected. Clang does, and
+speculates floating point operations across branches. Built with
+clang 23 for aarch64 (-mcpu=cortex-a57), expm1() computes both
+y*2.0*0x1p1023 and y*twopk for the k < 0 || k > 56 case and picks
+one with fcsel, so the unused multiply raises a spurious OVERFLOW.
+libc-test's math/expm1, expm1f, hypot, hypotf and sinh (via expm1)
+fail because of that.
+
+GCC does not speculate these operations, so GCC builds are unchanged.
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2026/11/11/3]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/math/expm1.c  | 1 +
+ src/math/expm1f.c | 1 +
+ src/math/hypot.c  | 1 +
+ src/math/hypotf.c | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/src/math/expm1.c b/src/math/expm1.c
+index ac1e61e..81d0c80 100644
+--- a/src/math/expm1.c
++++ b/src/math/expm1.c
+@@ -105,6 +105,7 @@
+  */
+ 
+ #include "libm.h"
++#pragma STDC FENV_ACCESS ON
+ 
+ static const double
+ o_threshold = 7.09782712893383973096e+02, /* 0x40862E42, 0xFEFA39EF */
+diff --git a/src/math/expm1f.c b/src/math/expm1f.c
+index 09a41af..8c7aa18 100644
+--- a/src/math/expm1f.c
++++ b/src/math/expm1f.c
+@@ -14,6 +14,7 @@
+  */
+ 
+ #include "libm.h"
++#pragma STDC FENV_ACCESS ON
+ 
+ static const float
+ ln2_hi      = 6.9313812256e-01, /* 0x3f317180 */
+diff --git a/src/math/hypot.c b/src/math/hypot.c
+index 6071bf1..0efc546 100644
+--- a/src/math/hypot.c
++++ b/src/math/hypot.c
+@@ -1,6 +1,7 @@
+ #include <math.h>
+ #include <stdint.h>
+ #include <float.h>
++#pragma STDC FENV_ACCESS ON
+ 
+ #if FLT_EVAL_METHOD > 1U && LDBL_MANT_DIG == 64
+ #define SPLIT (0x1p32 + 1)
+diff --git a/src/math/hypotf.c b/src/math/hypotf.c
+index 2fc214b..91fc086 100644
+--- a/src/math/hypotf.c
++++ b/src/math/hypotf.c
+@@ -1,5 +1,6 @@
+ #include <math.h>
+ #include <stdint.h>
++#pragma STDC FENV_ACCESS ON
+ 
+ float hypotf(float x, float y)
+ {
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b53b4be84c..0be24b22f1 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch \
-           file://0004-configure-use-ffp-exception-behavior-maytrap-when-su.patch \
+           file://0004-math-enable-FENV_ACCESS-in-expm1-expm1f-hypot-and-hy.patch \
           "
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
