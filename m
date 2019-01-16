Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0946BCD6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:09:03 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id m62so2555756ith.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/D5UrIVt/jdK7IVJMuWK7VcqDpPSQynUaPLEspf61dQ=;
	b=jLu4fuAAuLRrYBQ2h2zrdKHb0hqDrhYdCR32fAUpLiks9d+L+8nzDlDfLBLNyhVK4l
	8F8Ojie69yUp2YQc0XCOs/PfRq+6WW2eUlb0DvfzppFVlsxdKDpA1OjWvS6Q6qiSidXw
	9JdOW3+HZIuvONkDFWTHqZPa+ZU+9obAkqbPBMiyXF7VjpwqfkHzeiF4ZKuyaC6HlwA9
	hPTyhfYMgltfXiCSGvhRTMxX74FygVeuwPyE38Dg6wewowcxlMbU8lK8oGW+K+hJVh4l
	YayL6hj72CfRVZk4FsY563cJuW08dFfP4pDD84WyF9BCl/KbYSfnzC32fgXlkhogJsWF
	Xr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/D5UrIVt/jdK7IVJMuWK7VcqDpPSQynUaPLEspf61dQ=;
	b=oh9u+5hSKgL1g+t/DBXiKJQhEkRNgRLS+zCmJ2RYu/5sCE+/j7MhvtgJFjilcQzt7m
	gQbE3tEqplgYlMF6znrLeFLZj+K5aI3g7cIAgdaXZ3N2ImQEi9/xEQIYavhr0IMWdM8v
	169MDG3Pp+z8ELpyKhEWIEgHksPKD8QEGL79mhyFq/G1ZkTShDdP6ED/TNBrUUU4ZFIw
	rkUF/rXaN+PD4nzEvEh0mazsu2pTf71UigzB7b4Fmhr18V5s30JaZJLAMs03yzFN9NT7
	Y2bMCfGLo8gH3St/vbguEjibk8Lx1ycPeTKcC0AIs0Yeiy03eZs/2DDh0ngWHtWVSQuU
	9uPQ==
X-Gm-Message-State: AJcUukfsLQ8ruQFXlnTJx+yX385jaSvBVieaqy/lx6c7Mgjj/9ueqw7d
	WvDYd0Ow2pwv35++6kc0D/G4RjT/qpHpVsLIYHr5EFOO
X-Google-Smtp-Source: ALg8bN7EpZ7yfmou7EqTqLiqHxUgw2tOjHMd2l33SZ3vXILQvYzlLGXwHS440pAD3VzMjezsGB+SbSAGR92ylXWo3lk=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr4961448ite.26.1547640544022; 
	Wed, 16 Jan 2019 04:09:04 -0800 (PST)
MIME-Version: 1.0
References: <1547545883-1212-1-git-send-email-chunrong.guo@nxp.com>
In-Reply-To: <1547545883-1212-1-git-send-email-chunrong.guo@nxp.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jan 2019 12:08:52 +0000
Message-ID: <CAJTo0LZmzQfbODE2rdR6wXpMN1dFouUc=CxrNL4tWJy23yL6Bw@mail.gmail.com>
To: "C.r. Guo" <chunrong.guo@nxp.com>
Cc: "chunrong.guo@nxp.co" <chunrong.guo@nxp.co>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: glibc support powerpc e5500 and e6500
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
X-List-Received-Date: Wed, 16 Jan 2019 12:09:03 -0000
Content-Type: text/plain; charset="UTF-8"

No Upstream-Status or your S-o-b in the patch.

Ross

On Wed, 16 Jan 2019 at 10:13, C.r. Guo <chunrong.guo@nxp.com> wrote:
>
> From: Chunrong Guo <chunrong.guo@nxp.com>
>
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  .../glibc/0035-glibc-support-e5500-and-e6500.patch | 562 +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.28.bb              |   1 +
>  2 files changed, 563 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0035-glibc-support-e5500-and-e6500.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0035-glibc-support-e5500-and-e6500.patch b/meta/recipes-core/glibc/glibc/0035-glibc-support-e5500-and-e6500.patch
> new file mode 100644
> index 0000000..bc54de7
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0035-glibc-support-e5500-and-e6500.patch
> @@ -0,0 +1,562 @@
> +From 70dc75d3da86dea8b6ebdaedfa76e625a076678e Mon Sep 17 00:00:00 2001
> +From: Chunrong Guo <chunrong.guo@nxp.com>
> +Date: Wed, 31 Oct 2018 17:56:24 +0800
> +Subject: [PATCH] glibc: support e5500 and e6500
> +
> +Signed-off-by: BJ DevOps Team <bjdevops@NXP1.onmicrosoft.com>
> +---
> + sysdeps/powerpc/powerpc64/be/e5500/Implies         |   2 +
> + sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrt.c    | 137 +++++++++++++++++++++
> + sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrtf.c   | 103 ++++++++++++++++
> + .../powerpc/powerpc64/be/e5500/multiarch/Implies   |   1 +
> + sysdeps/powerpc/powerpc64/be/e6500/Implies         |   2 +
> + sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrt.c    | 137 +++++++++++++++++++++
> + sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrtf.c   | 103 ++++++++++++++++
> + .../powerpc/powerpc64/be/e6500/multiarch/Implies   |   1 +
> + 8 files changed, 486 insertions(+)
> + create mode 100644 sysdeps/powerpc/powerpc64/be/e5500/Implies
> + create mode 100644 sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrt.c
> + create mode 100644 sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrtf.c
> + create mode 100644 sysdeps/powerpc/powerpc64/be/e5500/multiarch/Implies
> + create mode 100644 sysdeps/powerpc/powerpc64/be/e6500/Implies
> + create mode 100644 sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrt.c
> + create mode 100644 sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrtf.c
> + create mode 100644 sysdeps/powerpc/powerpc64/be/e6500/multiarch/Implies
> +
> +diff --git a/sysdeps/powerpc/powerpc64/be/e5500/Implies b/sysdeps/powerpc/powerpc64/be/e5500/Implies
> +new file mode 100644
> +index 0000000..a795586
> +--- /dev/null
> ++++ b/sysdeps/powerpc/powerpc64/be/e5500/Implies
> +@@ -0,0 +1,2 @@
> ++powerpc/powerpc64/e5500
> ++
> +diff --git a/sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrt.c
> +new file mode 100644
> +index 0000000..13a8197
> +--- /dev/null
> ++++ b/sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrt.c
> +@@ -0,0 +1,137 @@
> ++/* Double-precision floating point square root.
> ++   Copyright (C) 2010 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, write to the Free
> ++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> ++   02111-1307 USA.  */
> ++
> ++#include <math.h>
> ++#include <math_private.h>
> ++#include <fenv_libc.h>
> ++#include <inttypes.h>
> ++
> ++#include <sysdep.h>
> ++#include <ldsodefs.h>
> ++
> ++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
> ++static const float two108 = 3.245185536584267269e+32;
> ++static const float twom54 = 5.551115123125782702e-17;
> ++static const float half = 0.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
> ++
> ++   We find the actual square root and half of its reciprocal
> ++   simultaneously.  */
> ++
> ++double
> ++__slow_ieee754_sqrt (double b)
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++      double y, g, h, d, r;
> ++      ieee_double_shape_type u;
> ++
> ++      if (__builtin_expect (b != a_inf.value, 1))
> ++        {
> ++          fenv_t fe;
> ++
> ++          fe = fegetenv_register ();
> ++
> ++          u.value = b;
> ++
> ++          relax_fenv_state ();
> ++
> ++          __asm__ ("frsqrte %[estimate], %[x]\n"
> ++                   : [estimate] "=f" (y) : [x] "f" (b));
> ++
> ++          /* Following Muller et al, page 168, equation 5.20.
> ++
> ++             h goes to 1/(2*sqrt(b))
> ++             g goes to sqrt(b).
> ++
> ++             We need three iterations to get within 1ulp.  */
> ++
> ++          /* Indicate that these can be performed prior to the branch.  GCC
> ++             insists on sinking them below the branch, however; it seems like
> ++             they'd be better before the branch so that we can cover any latency
> ++             from storing the argument and loading its high word.  Oh well.  */
> ++
> ++          g = b * y;
> ++          h = 0.5 * y;
> ++
> ++          /* Handle small numbers by scaling.  */
> ++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
> ++            return __slow_ieee754_sqrt (b * two108) * twom54;
> ++
> ++#define FMADD(a_, c_, b_)                                               \
> ++          ({ double __r;                                                \
> ++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
> ++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++          __r;})
> ++#define FNMSUB(a_, c_, b_)                                          \
> ++          ({ double __r;                                                \
> ++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
> ++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++          __r;})
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
> ++
> ++          /* Final refinement.  */
> ++          d = FNMSUB (g, g, b);
> ++
> ++          fesetenv_register (fe);
> ++          return FMADD (d, h, g);
> ++        }
> ++    }
> ++  else if (b < 0)
> ++    {
> ++      /* For some reason, some PowerPC32 processors don't implement
> ++         FE_INVALID_SQRT.  */
> ++#ifdef FE_INVALID_SQRT
> ++      feraiseexcept (FE_INVALID_SQRT);
> ++
> ++      fenv_union_t u = { .fenv = fegetenv_register () };
> ++      if ((u.l & FE_INVALID) == 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b = a_nan.value;
> ++    }
> ++  return f_wash (b);
> ++}
> ++
> ++#undef __ieee754_sqrt
> ++double
> ++__ieee754_sqrt (double x)
> ++{
> ++  return __slow_ieee754_sqrt (x);
> ++}
> ++
> ++strong_alias (__ieee754_sqrt, __sqrt_finite)
> +diff --git a/sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrtf.c
> +new file mode 100644
> +index 0000000..fae2d81
> +--- /dev/null
> ++++ b/sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrtf.c
> +@@ -0,0 +1,103 @@
> ++/* Single-precision floating point square root.
> ++   Copyright (C) 2010 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, write to the Free
> ++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> ++   02111-1307 USA.  */
> ++
> ++#include <math.h>
> ++#include <math_private.h>
> ++#include <fenv_libc.h>
> ++#include <inttypes.h>
> ++
> ++#include <sysdep.h>
> ++#include <ldsodefs.h>
> ++
> ++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
> ++static const float threehalf = 1.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
> ++
> ++   We find the reciprocal square root and use that to compute the actual
> ++   square root.  */
> ++
> ++float
> ++__slow_ieee754_sqrtf (float b)
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++#define FMSUB(a_, c_, b_)                                               \
> ++      ({ double __r;                                                    \
> ++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
> ++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++        __r;})
> ++#define FNMSUB(a_, c_, b_)                                              \
> ++      ({ double __r;                                                    \
> ++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
> ++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++        __r;})
> ++
> ++      if (__builtin_expect (b != a_inf.value, 1))
> ++        {
> ++          double y, x;
> ++          fenv_t fe;
> ++
> ++          fe = fegetenv_register ();
> ++
> ++          relax_fenv_state ();
> ++
> ++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
> ++          y = FMSUB (threehalf, b, b);
> ++
> ++          /* Initial estimate.  */
> ++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
> ++
> ++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++
> ++          /* All done.  */
> ++          fesetenv_register (fe);
> ++          return x * b;
> ++        }
> ++    }
> ++  else if (b < 0)
> ++    {
> ++      /* For some reason, some PowerPC32 processors don't implement
> ++         FE_INVALID_SQRT.  */
> ++#ifdef FE_INVALID_SQRT
> ++      feraiseexcept (FE_INVALID_SQRT);
> ++
> ++      fenv_union_t u = { .fenv = fegetenv_register () };
> ++      if ((u.l & FE_INVALID) == 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b = a_nan.value;
> ++    }
> ++  return f_washf (b);
> ++}
> ++#undef __ieee754_sqrtf
> ++float
> ++__ieee754_sqrtf (float x)
> ++{
> ++  return __slow_ieee754_sqrtf (x);
> ++}
> ++
> ++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
> +diff --git a/sysdeps/powerpc/powerpc64/be/e5500/multiarch/Implies b/sysdeps/powerpc/powerpc64/be/e5500/multiarch/Implies
> +new file mode 100644
> +index 0000000..30edcf7
> +--- /dev/null
> ++++ b/sysdeps/powerpc/powerpc64/be/e5500/multiarch/Implies
> +@@ -0,0 +1 @@
> ++powerpc/powerpc64/multiarch
> +diff --git a/sysdeps/powerpc/powerpc64/be/e6500/Implies b/sysdeps/powerpc/powerpc64/be/e6500/Implies
> +new file mode 100644
> +index 0000000..9b8fc07
> +--- /dev/null
> ++++ b/sysdeps/powerpc/powerpc64/be/e6500/Implies
> +@@ -0,0 +1,2 @@
> ++powerpc/powerpc64/e6500
> ++
> +diff --git a/sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrt.c
> +new file mode 100644
> +index 0000000..13a8197
> +--- /dev/null
> ++++ b/sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrt.c
> +@@ -0,0 +1,137 @@
> ++/* Double-precision floating point square root.
> ++   Copyright (C) 2010 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, write to the Free
> ++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> ++   02111-1307 USA.  */
> ++
> ++#include <math.h>
> ++#include <math_private.h>
> ++#include <fenv_libc.h>
> ++#include <inttypes.h>
> ++
> ++#include <sysdep.h>
> ++#include <ldsodefs.h>
> ++
> ++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
> ++static const float two108 = 3.245185536584267269e+32;
> ++static const float twom54 = 5.551115123125782702e-17;
> ++static const float half = 0.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
> ++
> ++   We find the actual square root and half of its reciprocal
> ++   simultaneously.  */
> ++
> ++double
> ++__slow_ieee754_sqrt (double b)
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++      double y, g, h, d, r;
> ++      ieee_double_shape_type u;
> ++
> ++      if (__builtin_expect (b != a_inf.value, 1))
> ++        {
> ++          fenv_t fe;
> ++
> ++          fe = fegetenv_register ();
> ++
> ++          u.value = b;
> ++
> ++          relax_fenv_state ();
> ++
> ++          __asm__ ("frsqrte %[estimate], %[x]\n"
> ++                   : [estimate] "=f" (y) : [x] "f" (b));
> ++
> ++          /* Following Muller et al, page 168, equation 5.20.
> ++
> ++             h goes to 1/(2*sqrt(b))
> ++             g goes to sqrt(b).
> ++
> ++             We need three iterations to get within 1ulp.  */
> ++
> ++          /* Indicate that these can be performed prior to the branch.  GCC
> ++             insists on sinking them below the branch, however; it seems like
> ++             they'd be better before the branch so that we can cover any latency
> ++             from storing the argument and loading its high word.  Oh well.  */
> ++
> ++          g = b * y;
> ++          h = 0.5 * y;
> ++
> ++          /* Handle small numbers by scaling.  */
> ++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
> ++            return __slow_ieee754_sqrt (b * two108) * twom54;
> ++
> ++#define FMADD(a_, c_, b_)                                               \
> ++          ({ double __r;                                                \
> ++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
> ++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++          __r;})
> ++#define FNMSUB(a_, c_, b_)                                          \
> ++          ({ double __r;                                                \
> ++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     \
> ++                   : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++          __r;})
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          r = FNMSUB (g, h, half);
> ++          g = FMADD (g, r, g);
> ++          h = FMADD (h, r, h);
> ++
> ++          /* g is now +/- 1ulp, or exactly equal to, the square root of b.  */
> ++
> ++          /* Final refinement.  */
> ++          d = FNMSUB (g, g, b);
> ++
> ++          fesetenv_register (fe);
> ++          return FMADD (d, h, g);
> ++        }
> ++    }
> ++  else if (b < 0)
> ++    {
> ++      /* For some reason, some PowerPC32 processors don't implement
> ++         FE_INVALID_SQRT.  */
> ++#ifdef FE_INVALID_SQRT
> ++      feraiseexcept (FE_INVALID_SQRT);
> ++
> ++      fenv_union_t u = { .fenv = fegetenv_register () };
> ++      if ((u.l & FE_INVALID) == 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b = a_nan.value;
> ++    }
> ++  return f_wash (b);
> ++}
> ++
> ++#undef __ieee754_sqrt
> ++double
> ++__ieee754_sqrt (double x)
> ++{
> ++  return __slow_ieee754_sqrt (x);
> ++}
> ++
> ++strong_alias (__ieee754_sqrt, __sqrt_finite)
> +diff --git a/sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrtf.c
> +new file mode 100644
> +index 0000000..fae2d81
> +--- /dev/null
> ++++ b/sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrtf.c
> +@@ -0,0 +1,103 @@
> ++/* Single-precision floating point square root.
> ++   Copyright (C) 2010 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, write to the Free
> ++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> ++   02111-1307 USA.  */
> ++
> ++#include <math.h>
> ++#include <math_private.h>
> ++#include <fenv_libc.h>
> ++#include <inttypes.h>
> ++
> ++#include <sysdep.h>
> ++#include <ldsodefs.h>
> ++
> ++static const ieee_float_shape_type a_nan = {.word = 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf = {.word = 0x7f800000 };
> ++static const float threehalf = 1.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, chapter 9
> ++
> ++   We find the reciprocal square root and use that to compute the actual
> ++   square root.  */
> ++
> ++float
> ++__slow_ieee754_sqrtf (float b)
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++#define FMSUB(a_, c_, b_)                                               \
> ++      ({ double __r;                                                    \
> ++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
> ++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++        __r;})
> ++#define FNMSUB(a_, c_, b_)                                              \
> ++      ({ double __r;                                                    \
> ++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
> ++                 : [r] "=f" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f" (b_)); \
> ++        __r;})
> ++
> ++      if (__builtin_expect (b != a_inf.value, 1))
> ++        {
> ++          double y, x;
> ++          fenv_t fe;
> ++
> ++          fe = fegetenv_register ();
> ++
> ++          relax_fenv_state ();
> ++
> ++          /* Compute y = 1.5 * b - b.  Uses fewer constants than y = 0.5 * b.  */
> ++          y = FMSUB (threehalf, b, b);
> ++
> ++          /* Initial estimate.  */
> ++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=f" (x) : [b] "f" (b));
> ++
> ++          /* Iterate.  x_{n+1} = x_n * (1.5 - y * (x_n * x_n)).  */
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++          x = x * FNMSUB (y, x * x, threehalf);
> ++
> ++          /* All done.  */
> ++          fesetenv_register (fe);
> ++          return x * b;
> ++        }
> ++    }
> ++  else if (b < 0)
> ++    {
> ++      /* For some reason, some PowerPC32 processors don't implement
> ++         FE_INVALID_SQRT.  */
> ++#ifdef FE_INVALID_SQRT
> ++      feraiseexcept (FE_INVALID_SQRT);
> ++
> ++      fenv_union_t u = { .fenv = fegetenv_register () };
> ++      if ((u.l & FE_INVALID) == 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b = a_nan.value;
> ++    }
> ++  return f_washf (b);
> ++}
> ++#undef __ieee754_sqrtf
> ++float
> ++__ieee754_sqrtf (float x)
> ++{
> ++  return __slow_ieee754_sqrtf (x);
> ++}
> ++
> ++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
> +diff --git a/sysdeps/powerpc/powerpc64/be/e6500/multiarch/Implies b/sysdeps/powerpc/powerpc64/be/e6500/multiarch/Implies
> +new file mode 100644
> +index 0000000..30edcf7
> +--- /dev/null
> ++++ b/sysdeps/powerpc/powerpc64/be/e6500/multiarch/Implies
> +@@ -0,0 +1 @@
> ++powerpc/powerpc64/multiarch
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
> index cebd2d0..f871d23 100644
> --- a/meta/recipes-core/glibc/glibc_2.28.bb
> +++ b/meta/recipes-core/glibc/glibc_2.28.bb
> @@ -49,6 +49,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch \
>             file://0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
>             file://0034-inject-file-assembly-directives.patch \
> +           file://0035-glibc-support-e5500-and-e6500.patch \
>  "
>
>  NATIVESDKFIXES ?= ""
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

