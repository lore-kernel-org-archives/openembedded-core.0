Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TE6EM-0008M0-R0
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:25:23 +0200
Received: from mail25-tx2-R.bigfish.com (10.9.14.235) by
	TX2EHSOBE002.bigfish.com (10.9.40.22) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Sep 2012 22:12:41 +0000
Received: from mail25-tx2 (localhost [127.0.0.1])	by mail25-tx2-R.bigfish.com
	(Postfix) with ESMTP id 23FD9420167	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:12:41 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(zz98dI9371I936eI1432Ic8kd6f1izz1202h1d1ah1d2ahzz17326ah8275bh8275dh17598diz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail25-tx2 (localhost.localdomain [127.0.0.1]) by mail25-tx2
	(MessageSwitch) id 1348006356938054_25582;
	Tue, 18 Sep 2012 22:12:36 +0000 (UTC)
Received: from TX2EHSMHS007.bigfish.com (unknown [10.9.14.254])	by
	mail25-tx2.bigfish.com (Postfix) with ESMTP id DD1A7180055	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:12:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS007.bigfish.com
	(10.9.99.107) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Sep 2012 22:12:33 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Tue, 18 Sep 2012 17:12:33 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] eglibc_2.16.bb: replace patch with updated
	version that supportds e6500
Thread-Index: AQHNleqzPTbAYSB8AEa+y/CUgrNCKQ==
Date: Tue, 18 Sep 2012 22:12:32 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A68B581@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
In-Reply-To: <1348006091-14992-1-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] eglibc_2.16.bb: replace patch with updated version that supportds e6500
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 22:25:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5750E27FBC474E449EFAC301AA7E9B46@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Err this was supposed to be a series but I used the wrong format-patch
commands, patches in my tree here:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dmattsm/mast=
er

-M

On Tue, Sep 18, 2012 at 5:08 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  .../eglibc/eglibc-2.16/glibc.fix_sqrt2.patch       | 1488 ++++++++++++++=
++++++
>  .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch |  538 -------
>  meta/recipes-core/eglibc/eglibc_2.16.bb            |    4 +-
>  3 files changed, 1490 insertions(+), 540 deletions(-)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/glibc.fix_sqrt2.=
patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.16/glibc.fix_sqrt2.patch b=
/meta/recipes-core/eglibc/eglibc-2.16/glibc.fix_sqrt2.patch
> new file mode 100644
> index 0000000..e098192
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.16/glibc.fix_sqrt2.patch
> @@ -0,0 +1,1488 @@
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c libc/sys=
deps/powerpc/powerpc32/603e/fpu/e_sqrt.c
> +--- libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c      1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c   2012-06-14 14:51:=
50.452001745 -0500
> +@@ -0,0 +1,134 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float two108 =3D 3.245185536584267269e+32;
> ++static const float twom54 =3D 5.551115123125782702e-17;
> ++static const float half =3D 0.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the actual square root and half of its reciprocal
> ++   simultaneously.  */
> ++
> ++#ifdef __STDC__
> ++double
> ++__ieee754_sqrt (double b)
> ++#else
> ++double
> ++__ieee754_sqrt (b)
> ++     double b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++      double y, g, h, d, r;
> ++      ieee_double_shape_type u;
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          u.value =3D b;
> ++
> ++          relax_fenv_state ();
> ++
> ++          __asm__ ("frsqrte %[estimate], %[x]\n"
> ++                   : [estimate] "=3Df" (y) : [x] "f" (b));
> ++
> ++          /* Following Muller et al, page 168, equation 5.20.
> ++
> ++             h goes to 1/(2*sqrt(b))
> ++             g goes to sqrt(b).
> ++
> ++             We need three iterations to get within 1ulp.  */
> ++
> ++          /* Indicate that these can be performed prior to the branch. =
 GCC
> ++             insists on sinking them below the branch, however; it seem=
s like
> ++             they'd be better before the branch so that we can cover an=
y latency
> ++             from storing the argument and loading its high word.  Oh w=
ell.  */
> ++
> ++          g =3D b * y;
> ++          h =3D 0.5 * y;
> ++
> ++          /* Handle small numbers by scaling.  */
> ++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> ++            return __ieee754_sqrt (b * two108) * twom54;
> ++
> ++#define FMADD(a_, c_, b_)                                              =
 \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                    =
 \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++#define FNMSUB(a_, c_, b_)                                          \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                   =
  \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          /* g is now +/- 1ulp, or exactly equal to, the square root of=
 b.  */
> ++
> ++          /* Final refinement.  */
> ++          d =3D FNMSUB (g, g, b);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_wash (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c libc/sy=
sdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
> +--- libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c     1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c  2012-06-14 14:51:=
50.452001745 -0500
> +@@ -0,0 +1,101 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float threehalf =3D 1.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the reciprocal square root and use that to compute the actua=
l
> ++   square root.  */
> ++
> ++#ifdef __STDC__
> ++float
> ++__ieee754_sqrtf (float b)
> ++#else
> ++float
> ++__ieee754_sqrtf (b)
> ++     float b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++#define FMSUB(a_, c_, b_)                                              =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                      =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++#define FNMSUB(a_, c_, b_)                                             =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          double y, x;
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          relax_fenv_state ();
> ++
> ++          /* Compute y =3D 1.5 * b - b.  Uses fewer constants than y =
=3D 0.5 * b.  */
> ++          y =3D FMSUB (threehalf, b, b);
> ++
> ++          /* Initial estimate.  */
> ++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=3Df" (x) : [b] "f" (b=
));
> ++
> ++          /* Iterate.  x_{n+1} =3D x_n * (1.5 - y * (x_n * x_n)).  */
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_washf (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c libc/s=
ysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
> +--- libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c    1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c 2012-06-14 14:55:=
14.749001061 -0500
> +@@ -0,0 +1,134 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float two108 =3D 3.245185536584267269e+32;
> ++static const float twom54 =3D 5.551115123125782702e-17;
> ++static const float half =3D 0.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the actual square root and half of its reciprocal
> ++   simultaneously.  */
> ++
> ++#ifdef __STDC__
> ++double
> ++__ieee754_sqrt (double b)
> ++#else
> ++double
> ++__ieee754_sqrt (b)
> ++     double b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++      double y, g, h, d, r;
> ++      ieee_double_shape_type u;
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          u.value =3D b;
> ++
> ++          relax_fenv_state ();
> ++
> ++          __asm__ ("frsqrte %[estimate], %[x]\n"
> ++                   : [estimate] "=3Df" (y) : [x] "f" (b));
> ++
> ++          /* Following Muller et al, page 168, equation 5.20.
> ++
> ++             h goes to 1/(2*sqrt(b))
> ++             g goes to sqrt(b).
> ++
> ++             We need three iterations to get within 1ulp.  */
> ++
> ++          /* Indicate that these can be performed prior to the branch. =
 GCC
> ++             insists on sinking them below the branch, however; it seem=
s like
> ++             they'd be better before the branch so that we can cover an=
y latency
> ++             from storing the argument and loading its high word.  Oh w=
ell.  */
> ++
> ++          g =3D b * y;
> ++          h =3D 0.5 * y;
> ++
> ++          /* Handle small numbers by scaling.  */
> ++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> ++            return __ieee754_sqrt (b * two108) * twom54;
> ++
> ++#define FMADD(a_, c_, b_)                                              =
 \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                    =
 \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++#define FNMSUB(a_, c_, b_)                                          \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                   =
  \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          /* g is now +/- 1ulp, or exactly equal to, the square root of=
 b.  */
> ++
> ++          /* Final refinement.  */
> ++          d =3D FNMSUB (g, g, b);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_wash (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c libc/=
sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
> +--- libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c   1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c        2012-06-1=
4 14:55:14.749001061 -0500
> +@@ -0,0 +1,101 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float threehalf =3D 1.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the reciprocal square root and use that to compute the actua=
l
> ++   square root.  */
> ++
> ++#ifdef __STDC__
> ++float
> ++__ieee754_sqrtf (float b)
> ++#else
> ++float
> ++__ieee754_sqrtf (b)
> ++     float b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++#define FMSUB(a_, c_, b_)                                              =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                      =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++#define FNMSUB(a_, c_, b_)                                             =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          double y, x;
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          relax_fenv_state ();
> ++
> ++          /* Compute y =3D 1.5 * b - b.  Uses fewer constants than y =
=3D 0.5 * b.  */
> ++          y =3D FMSUB (threehalf, b, b);
> ++
> ++          /* Initial estimate.  */
> ++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=3Df" (x) : [b] "f" (b=
));
> ++
> ++          /* Iterate.  x_{n+1} =3D x_n * (1.5 - y * (x_n * x_n)).  */
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_washf (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c libc/sy=
sdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
> +--- libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c     1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c  2012-06-14 14:55:=
21.812002270 -0500
> +@@ -0,0 +1,134 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float two108 =3D 3.245185536584267269e+32;
> ++static const float twom54 =3D 5.551115123125782702e-17;
> ++static const float half =3D 0.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the actual square root and half of its reciprocal
> ++   simultaneously.  */
> ++
> ++#ifdef __STDC__
> ++double
> ++__ieee754_sqrt (double b)
> ++#else
> ++double
> ++__ieee754_sqrt (b)
> ++     double b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++      double y, g, h, d, r;
> ++      ieee_double_shape_type u;
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          u.value =3D b;
> ++
> ++          relax_fenv_state ();
> ++
> ++          __asm__ ("frsqrte %[estimate], %[x]\n"
> ++                   : [estimate] "=3Df" (y) : [x] "f" (b));
> ++
> ++          /* Following Muller et al, page 168, equation 5.20.
> ++
> ++             h goes to 1/(2*sqrt(b))
> ++             g goes to sqrt(b).
> ++
> ++             We need three iterations to get within 1ulp.  */
> ++
> ++          /* Indicate that these can be performed prior to the branch. =
 GCC
> ++             insists on sinking them below the branch, however; it seem=
s like
> ++             they'd be better before the branch so that we can cover an=
y latency
> ++             from storing the argument and loading its high word.  Oh w=
ell.  */
> ++
> ++          g =3D b * y;
> ++          h =3D 0.5 * y;
> ++
> ++          /* Handle small numbers by scaling.  */
> ++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> ++            return __ieee754_sqrt (b * two108) * twom54;
> ++
> ++#define FMADD(a_, c_, b_)                                              =
 \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                    =
 \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++#define FNMSUB(a_, c_, b_)                                          \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                   =
  \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          /* g is now +/- 1ulp, or exactly equal to, the square root of=
 b.  */
> ++
> ++          /* Final refinement.  */
> ++          d =3D FNMSUB (g, g, b);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_wash (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c libc/s=
ysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
> +--- libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c    1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c 2012-06-14 14:55:=
21.812002270 -0500
> +@@ -0,0 +1,101 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float threehalf =3D 1.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the reciprocal square root and use that to compute the actua=
l
> ++   square root.  */
> ++
> ++#ifdef __STDC__
> ++float
> ++__ieee754_sqrtf (float b)
> ++#else
> ++float
> ++__ieee754_sqrtf (b)
> ++     float b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++#define FMSUB(a_, c_, b_)                                              =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                      =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++#define FNMSUB(a_, c_, b_)                                             =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          double y, x;
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          relax_fenv_state ();
> ++
> ++          /* Compute y =3D 1.5 * b - b.  Uses fewer constants than y =
=3D 0.5 * b.  */
> ++          y =3D FMSUB (threehalf, b, b);
> ++
> ++          /* Initial estimate.  */
> ++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=3Df" (x) : [b] "f" (b=
));
> ++
> ++          /* Iterate.  x_{n+1} =3D x_n * (1.5 - y * (x_n * x_n)).  */
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_washf (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c libc/sy=
sdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
> +--- libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c     1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c  2012-06-14 14:55:=
24.620001266 -0500
> +@@ -0,0 +1,134 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float two108 =3D 3.245185536584267269e+32;
> ++static const float twom54 =3D 5.551115123125782702e-17;
> ++static const float half =3D 0.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the actual square root and half of its reciprocal
> ++   simultaneously.  */
> ++
> ++#ifdef __STDC__
> ++double
> ++__ieee754_sqrt (double b)
> ++#else
> ++double
> ++__ieee754_sqrt (b)
> ++     double b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++      double y, g, h, d, r;
> ++      ieee_double_shape_type u;
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          u.value =3D b;
> ++
> ++          relax_fenv_state ();
> ++
> ++          __asm__ ("frsqrte %[estimate], %[x]\n"
> ++                   : [estimate] "=3Df" (y) : [x] "f" (b));
> ++
> ++          /* Following Muller et al, page 168, equation 5.20.
> ++
> ++             h goes to 1/(2*sqrt(b))
> ++             g goes to sqrt(b).
> ++
> ++             We need three iterations to get within 1ulp.  */
> ++
> ++          /* Indicate that these can be performed prior to the branch. =
 GCC
> ++             insists on sinking them below the branch, however; it seem=
s like
> ++             they'd be better before the branch so that we can cover an=
y latency
> ++             from storing the argument and loading its high word.  Oh w=
ell.  */
> ++
> ++          g =3D b * y;
> ++          h =3D 0.5 * y;
> ++
> ++          /* Handle small numbers by scaling.  */
> ++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> ++            return __ieee754_sqrt (b * two108) * twom54;
> ++
> ++#define FMADD(a_, c_, b_)                                              =
 \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                    =
 \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++#define FNMSUB(a_, c_, b_)                                          \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                   =
  \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          /* g is now +/- 1ulp, or exactly equal to, the square root of=
 b.  */
> ++
> ++          /* Final refinement.  */
> ++          d =3D FNMSUB (g, g, b);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_wash (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c libc/s=
ysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
> +--- libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c    1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c 2012-06-14 14:55:=
24.620001266 -0500
> +@@ -0,0 +1,101 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float threehalf =3D 1.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the reciprocal square root and use that to compute the actua=
l
> ++   square root.  */
> ++
> ++#ifdef __STDC__
> ++float
> ++__ieee754_sqrtf (float b)
> ++#else
> ++float
> ++__ieee754_sqrtf (b)
> ++     float b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++#define FMSUB(a_, c_, b_)                                              =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                      =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++#define FNMSUB(a_, c_, b_)                                             =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          double y, x;
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          relax_fenv_state ();
> ++
> ++          /* Compute y =3D 1.5 * b - b.  Uses fewer constants than y =
=3D 0.5 * b.  */
> ++          y =3D FMSUB (threehalf, b, b);
> ++
> ++          /* Initial estimate.  */
> ++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=3Df" (x) : [b] "f" (b=
));
> ++
> ++          /* Iterate.  x_{n+1} =3D x_n * (1.5 - y * (x_n * x_n)).  */
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_washf (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c libc/sy=
sdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
> +--- libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c     1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c  2012-06-14 14:51:=
50.452001745 -0500
> +@@ -0,0 +1,134 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float two108 =3D 3.245185536584267269e+32;
> ++static const float twom54 =3D 5.551115123125782702e-17;
> ++static const float half =3D 0.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the actual square root and half of its reciprocal
> ++   simultaneously.  */
> ++
> ++#ifdef __STDC__
> ++double
> ++__ieee754_sqrt (double b)
> ++#else
> ++double
> ++__ieee754_sqrt (b)
> ++     double b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++      double y, g, h, d, r;
> ++      ieee_double_shape_type u;
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          u.value =3D b;
> ++
> ++          relax_fenv_state ();
> ++
> ++          __asm__ ("frsqrte %[estimate], %[x]\n"
> ++                   : [estimate] "=3Df" (y) : [x] "f" (b));
> ++
> ++          /* Following Muller et al, page 168, equation 5.20.
> ++
> ++             h goes to 1/(2*sqrt(b))
> ++             g goes to sqrt(b).
> ++
> ++             We need three iterations to get within 1ulp.  */
> ++
> ++          /* Indicate that these can be performed prior to the branch. =
 GCC
> ++             insists on sinking them below the branch, however; it seem=
s like
> ++             they'd be better before the branch so that we can cover an=
y latency
> ++             from storing the argument and loading its high word.  Oh w=
ell.  */
> ++
> ++          g =3D b * y;
> ++          h =3D 0.5 * y;
> ++
> ++          /* Handle small numbers by scaling.  */
> ++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> ++            return __ieee754_sqrt (b * two108) * twom54;
> ++
> ++#define FMADD(a_, c_, b_)                                              =
 \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                    =
 \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++#define FNMSUB(a_, c_, b_)                                          \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                   =
  \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          /* g is now +/- 1ulp, or exactly equal to, the square root of=
 b.  */
> ++
> ++          /* Final refinement.  */
> ++          d =3D FNMSUB (g, g, b);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_wash (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c libc/s=
ysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
> +--- libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c    1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c 2012-06-14 14:51:=
50.452001745 -0500
> +@@ -0,0 +1,101 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float threehalf =3D 1.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the reciprocal square root and use that to compute the actua=
l
> ++   square root.  */
> ++
> ++#ifdef __STDC__
> ++float
> ++__ieee754_sqrtf (float b)
> ++#else
> ++float
> ++__ieee754_sqrtf (b)
> ++     float b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++#define FMSUB(a_, c_, b_)                                              =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                      =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++#define FNMSUB(a_, c_, b_)                                             =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          double y, x;
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          relax_fenv_state ();
> ++
> ++          /* Compute y =3D 1.5 * b - b.  Uses fewer constants than y =
=3D 0.5 * b.  */
> ++          y =3D FMSUB (threehalf, b, b);
> ++
> ++          /* Initial estimate.  */
> ++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=3Df" (x) : [b] "f" (b=
));
> ++
> ++          /* Iterate.  x_{n+1} =3D x_n * (1.5 - y * (x_n * x_n)).  */
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_washf (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c libc/sy=
sdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
> +--- libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c     1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c  2012-06-14 14:56:=
02.080000985 -0500
> +@@ -0,0 +1,134 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float two108 =3D 3.245185536584267269e+32;
> ++static const float twom54 =3D 5.551115123125782702e-17;
> ++static const float half =3D 0.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the actual square root and half of its reciprocal
> ++   simultaneously.  */
> ++
> ++#ifdef __STDC__
> ++double
> ++__ieee754_sqrt (double b)
> ++#else
> ++double
> ++__ieee754_sqrt (b)
> ++     double b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++      double y, g, h, d, r;
> ++      ieee_double_shape_type u;
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          u.value =3D b;
> ++
> ++          relax_fenv_state ();
> ++
> ++          __asm__ ("frsqrte %[estimate], %[x]\n"
> ++                   : [estimate] "=3Df" (y) : [x] "f" (b));
> ++
> ++          /* Following Muller et al, page 168, equation 5.20.
> ++
> ++             h goes to 1/(2*sqrt(b))
> ++             g goes to sqrt(b).
> ++
> ++             We need three iterations to get within 1ulp.  */
> ++
> ++          /* Indicate that these can be performed prior to the branch. =
 GCC
> ++             insists on sinking them below the branch, however; it seem=
s like
> ++             they'd be better before the branch so that we can cover an=
y latency
> ++             from storing the argument and loading its high word.  Oh w=
ell.  */
> ++
> ++          g =3D b * y;
> ++          h =3D 0.5 * y;
> ++
> ++          /* Handle small numbers by scaling.  */
> ++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> ++            return __ieee754_sqrt (b * two108) * twom54;
> ++
> ++#define FMADD(a_, c_, b_)                                              =
 \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                    =
 \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++#define FNMSUB(a_, c_, b_)                                          \
> ++          ({ double __r;                                               =
 \
> ++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                   =
  \
> ++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> ++          __r;})
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          r =3D FNMSUB (g, h, half);
> ++          g =3D FMADD (g, r, g);
> ++          h =3D FMADD (h, r, h);
> ++
> ++          /* g is now +/- 1ulp, or exactly equal to, the square root of=
 b.  */
> ++
> ++          /* Final refinement.  */
> ++          d =3D FNMSUB (g, g, b);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_wash (b);
> ++}
> +diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c libc/s=
ysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
> +--- libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c    1969-12-3=
1 18:00:00.000000000 -0600
> ++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c 2012-06-14 14:56:=
02.080000985 -0500
> +@@ -0,0 +1,101 @@
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
> ++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> ++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> ++static const float threehalf =3D 1.5;
> ++
> ++/* The method is based on the descriptions in:
> ++
> ++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> ++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> ++
> ++   We find the reciprocal square root and use that to compute the actua=
l
> ++   square root.  */
> ++
> ++#ifdef __STDC__
> ++float
> ++__ieee754_sqrtf (float b)
> ++#else
> ++float
> ++__ieee754_sqrtf (b)
> ++     float b;
> ++#endif
> ++{
> ++  if (__builtin_expect (b > 0, 1))
> ++    {
> ++#define FMSUB(a_, c_, b_)                                              =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                      =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++#define FNMSUB(a_, c_, b_)                                             =
 \
> ++      ({ double __r;                                                   =
 \
> ++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     =
 \
> ++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> ++        __r;})
> ++
> ++      if (__builtin_expect (b !=3D a_inf.value, 1))
> ++        {
> ++          double y, x;
> ++          fenv_t fe;
> ++
> ++          fe =3D fegetenv_register ();
> ++
> ++          relax_fenv_state ();
> ++
> ++          /* Compute y =3D 1.5 * b - b.  Uses fewer constants than y =
=3D 0.5 * b.  */
> ++          y =3D FMSUB (threehalf, b, b);
> ++
> ++          /* Initial estimate.  */
> ++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=3Df" (x) : [b] "f" (b=
));
> ++
> ++          /* Iterate.  x_{n+1} =3D x_n * (1.5 - y * (x_n * x_n)).  */
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
> ++          x =3D x * FNMSUB (y, x * x, threehalf);
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
> ++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> ++      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> ++#endif
> ++      feraiseexcept (FE_INVALID);
> ++      b =3D a_nan.value;
> ++    }
> ++  return f_washf (b);
> ++}
> +diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/I=
mplies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
> +--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies=
       1969-12-31 18:00:00.000000000 -0600
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies    2=
012-06-14 14:51:50.452001745 -0500
> +@@ -0,0 +1 @@
> ++powerpc/powerpc32/603e/fpu
> +diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu=
/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
> +--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Impli=
es     1969-12-31 18:00:00.000000000 -0600
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies  2=
012-06-14 14:54:00.481000876 -0500
> +@@ -0,0 +1 @@
> ++powerpc/powerpc32/e500mc/fpu
> +diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/=
Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
> +--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implie=
s      1969-12-31 18:00:00.000000000 -0600
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies   2=
012-06-14 14:54:17.000001007 -0500
> +@@ -0,0 +1 @@
> ++powerpc/powerpc32/e5500/fpu
> +diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/=
Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
> +--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implie=
s      1969-12-31 18:00:00.000000000 -0600
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies   2=
012-06-14 14:54:31.054001299 -0500
> +@@ -0,0 +1 @@
> ++powerpc/powerpc32/e6500/fpu
> +diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/=
Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
> +--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implie=
s      1969-12-31 18:00:00.000000000 -0600
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies   2=
012-06-14 14:51:50.453001709 -0500
> +@@ -0,0 +1 @@
> ++powerpc/powerpc64/e5500/fpu
> +diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/=
Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
> +--- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implie=
s      1969-12-31 18:00:00.000000000 -0600
> ++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies   2=
012-06-14 14:58:14.298001288 -0500
> +@@ -0,0 +1 @@
> ++powerpc/powerpc64/e6500/fpu
> diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch b/meta/r=
ecipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
> deleted file mode 100644
> index 203040c..0000000
> --- a/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
> +++ /dev/null
> @@ -1,538 +0,0 @@
> -Upstream-Status: Pending
> -
> -2011-03-22  Joseph Myers  <joseph@codesourcery.com>
> -
> -        Merge from SG++ 2.11:
> -
> -        2010-10-05  Nathan Froyd  <froydnj@codesourcery.com>
> -
> -        Issue #9382
> -
> -        * sysdeps/powerpc/powerpc32/603e/: New directory.
> -        * sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/: New directo=
ry.
> -        * sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/: New directory=
.
> -        * sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/: New directory=
.
> -        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c: Update.
> -        * sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c: Update.
> -        * sysdeps/powerpc/powerpc64/e5500/fpu/Implies: New file.
> -
> -Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
> -@@ -0,0 +1,134 @@
> -+/* Double-precision floating point square root.
> -+   Copyright (C) 2010 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, write to the Free
> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -+   02111-1307 USA.  */
> -+
> -+#include <math.h>
> -+#include <math_private.h>
> -+#include <fenv_libc.h>
> -+#include <inttypes.h>
> -+
> -+#include <sysdep.h>
> -+#include <ldsodefs.h>
> -+
> -+static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> -+static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> -+static const float two108 =3D 3.245185536584267269e+32;
> -+static const float twom54 =3D 5.551115123125782702e-17;
> -+static const float half =3D 0.5;
> -+
> -+/* The method is based on the descriptions in:
> -+
> -+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> -+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> -+
> -+   We find the actual square root and half of its reciprocal
> -+   simultaneously.  */
> -+
> -+#ifdef __STDC__
> -+double
> -+__ieee754_sqrt (double b)
> -+#else
> -+double
> -+__ieee754_sqrt (b)
> -+     double b;
> -+#endif
> -+{
> -+  if (__builtin_expect (b > 0, 1))
> -+    {
> -+      double y, g, h, d, r;
> -+      ieee_double_shape_type u;
> -+
> -+      if (__builtin_expect (b !=3D a_inf.value, 1))
> -+        {
> -+          fenv_t fe;
> -+
> -+          fe =3D fegetenv_register ();
> -+
> -+          u.value =3D b;
> -+
> -+          relax_fenv_state ();
> -+
> -+          __asm__ ("frsqrte %[estimate], %[x]\n"
> -+                   : [estimate] "=3Df" (y) : [x] "f" (b));
> -+
> -+          /* Following Muller et al, page 168, equation 5.20.
> -+
> -+             h goes to 1/(2*sqrt(b))
> -+             g goes to sqrt(b).
> -+
> -+             We need three iterations to get within 1ulp.  */
> -+
> -+          /* Indicate that these can be performed prior to the branch. =
 GCC
> -+             insists on sinking them below the branch, however; it seem=
s like
> -+             they'd be better before the branch so that we can cover an=
y latency
> -+             from storing the argument and loading its high word.  Oh w=
ell.  */
> -+
> -+          g =3D b * y;
> -+          h =3D 0.5 * y;
> -+
> -+          /* Handle small numbers by scaling.  */
> -+          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> -+            return __ieee754_sqrt (b * two108) * twom54;
> -+
> -+#define FMADD(a_, c_, b_)                                              =
 \
> -+          ({ double __r;                                               =
 \
> -+          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                    =
 \
> -+                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> -+          __r;})
> -+#define FNMSUB(a_, c_, b_)                                          \
> -+          ({ double __r;                                               =
 \
> -+          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                   =
  \
> -+                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> -+          __r;})
> -+
> -+          r =3D FNMSUB (g, h, half);
> -+          g =3D FMADD (g, r, g);
> -+          h =3D FMADD (h, r, h);
> -+
> -+          r =3D FNMSUB (g, h, half);
> -+          g =3D FMADD (g, r, g);
> -+          h =3D FMADD (h, r, h);
> -+
> -+          r =3D FNMSUB (g, h, half);
> -+          g =3D FMADD (g, r, g);
> -+          h =3D FMADD (h, r, h);
> -+
> -+          /* g is now +/- 1ulp, or exactly equal to, the square root of=
 b.  */
> -+
> -+          /* Final refinement.  */
> -+          d =3D FNMSUB (g, g, b);
> -+
> -+          fesetenv_register (fe);
> -+          return FMADD (d, h, g);
> -+        }
> -+    }
> -+  else if (b < 0)
> -+    {
> -+      /* For some reason, some PowerPC32 processors don't implement
> -+         FE_INVALID_SQRT.  */
> -+#ifdef FE_INVALID_SQRT
> -+      feraiseexcept (FE_INVALID_SQRT);
> -+
> -+      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> -+      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> -+#endif
> -+      feraiseexcept (FE_INVALID);
> -+      b =3D a_nan.value;
> -+    }
> -+  return f_wash (b);
> -+}
> -Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
> -@@ -0,0 +1,101 @@
> -+/* Single-precision floating point square root.
> -+   Copyright (C) 2010 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, write to the Free
> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -+   02111-1307 USA.  */
> -+
> -+#include <math.h>
> -+#include <math_private.h>
> -+#include <fenv_libc.h>
> -+#include <inttypes.h>
> -+
> -+#include <sysdep.h>
> -+#include <ldsodefs.h>
> -+
> -+static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> -+static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> -+static const float threehalf =3D 1.5;
> -+
> -+/* The method is based on the descriptions in:
> -+
> -+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> -+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> -+
> -+   We find the reciprocal square root and use that to compute the actua=
l
> -+   square root.  */
> -+
> -+#ifdef __STDC__
> -+float
> -+__ieee754_sqrtf (float b)
> -+#else
> -+float
> -+__ieee754_sqrtf (b)
> -+     float b;
> -+#endif
> -+{
> -+  if (__builtin_expect (b > 0, 1))
> -+    {
> -+#define FMSUB(a_, c_, b_)                                              =
 \
> -+      ({ double __r;                                                   =
 \
> -+        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                      =
 \
> -+                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> -+        __r;})
> -+#define FNMSUB(a_, c_, b_)                                             =
 \
> -+      ({ double __r;                                                   =
 \
> -+        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     =
 \
> -+                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> -+        __r;})
> -+
> -+      if (__builtin_expect (b !=3D a_inf.value, 1))
> -+        {
> -+          double y, x;
> -+          fenv_t fe;
> -+
> -+          fe =3D fegetenv_register ();
> -+
> -+          relax_fenv_state ();
> -+
> -+          /* Compute y =3D 1.5 * b - b.  Uses fewer constants than y =
=3D 0.5 * b.  */
> -+          y =3D FMSUB (threehalf, b, b);
> -+
> -+          /* Initial estimate.  */
> -+          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=3Df" (x) : [b] "f" (b=
));
> -+
> -+          /* Iterate.  x_{n+1} =3D x_n * (1.5 - y * (x_n * x_n)).  */
> -+          x =3D x * FNMSUB (y, x * x, threehalf);
> -+          x =3D x * FNMSUB (y, x * x, threehalf);
> -+          x =3D x * FNMSUB (y, x * x, threehalf);
> -+
> -+          /* All done.  */
> -+          fesetenv_register (fe);
> -+          return x * b;
> -+        }
> -+    }
> -+  else if (b < 0)
> -+    {
> -+      /* For some reason, some PowerPC32 processors don't implement
> -+         FE_INVALID_SQRT.  */
> -+#ifdef FE_INVALID_SQRT
> -+      feraiseexcept (FE_INVALID_SQRT);
> -+
> -+      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> -+      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> -+#endif
> -+      feraiseexcept (FE_INVALID);
> -+      b =3D a_nan.value;
> -+    }
> -+  return f_washf (b);
> -+}
> -Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
> -@@ -0,0 +1,134 @@
> -+/* Double-precision floating point square root.
> -+   Copyright (C) 2010 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, write to the Free
> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -+   02111-1307 USA.  */
> -+
> -+#include <math.h>
> -+#include <math_private.h>
> -+#include <fenv_libc.h>
> -+#include <inttypes.h>
> -+
> -+#include <sysdep.h>
> -+#include <ldsodefs.h>
> -+
> -+static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> -+static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> -+static const float two108 =3D 3.245185536584267269e+32;
> -+static const float twom54 =3D 5.551115123125782702e-17;
> -+static const float half =3D 0.5;
> -+
> -+/* The method is based on the descriptions in:
> -+
> -+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> -+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> -+
> -+   We find the actual square root and half of its reciprocal
> -+   simultaneously.  */
> -+
> -+#ifdef __STDC__
> -+double
> -+__ieee754_sqrt (double b)
> -+#else
> -+double
> -+__ieee754_sqrt (b)
> -+     double b;
> -+#endif
> -+{
> -+  if (__builtin_expect (b > 0, 1))
> -+    {
> -+      double y, g, h, d, r;
> -+      ieee_double_shape_type u;
> -+
> -+      if (__builtin_expect (b !=3D a_inf.value, 1))
> -+        {
> -+          fenv_t fe;
> -+
> -+          fe =3D fegetenv_register ();
> -+
> -+          u.value =3D b;
> -+
> -+          relax_fenv_state ();
> -+
> -+          __asm__ ("frsqrte %[estimate], %[x]\n"
> -+                   : [estimate] "=3Df" (y) : [x] "f" (b));
> -+
> -+          /* Following Muller et al, page 168, equation 5.20.
> -+
> -+             h goes to 1/(2*sqrt(b))
> -+             g goes to sqrt(b).
> -+
> -+             We need three iterations to get within 1ulp.  */
> -+
> -+          /* Indicate that these can be performed prior to the branch. =
 GCC
> -+             insists on sinking them below the branch, however; it seem=
s like
> -+             they'd be better before the branch so that we can cover an=
y latency
> -+             from storing the argument and loading its high word.  Oh w=
ell.  */
> -+
> -+          g =3D b * y;
> -+          h =3D 0.5 * y;
> -+
> -+          /* Handle small numbers by scaling.  */
> -+          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> -+            return __ieee754_sqrt (b * two108) * twom54;
> -+
> -+#define FMADD(a_, c_, b_)                                              =
 \
> -+          ({ double __r;                                               =
 \
> -+          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                    =
 \
> -+                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> -+          __r;})
> -+#define FNMSUB(a_, c_, b_)                                          \
> -+          ({ double __r;                                               =
 \
> -+          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                   =
  \
> -+                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b]=
 "f" (b_)); \
> -+          __r;})
> -+
> -+          r =3D FNMSUB (g, h, half);
> -+          g =3D FMADD (g, r, g);
> -+          h =3D FMADD (h, r, h);
> -+
> -+          r =3D FNMSUB (g, h, half);
> -+          g =3D FMADD (g, r, g);
> -+          h =3D FMADD (h, r, h);
> -+
> -+          r =3D FNMSUB (g, h, half);
> -+          g =3D FMADD (g, r, g);
> -+          h =3D FMADD (h, r, h);
> -+
> -+          /* g is now +/- 1ulp, or exactly equal to, the square root of=
 b.  */
> -+
> -+          /* Final refinement.  */
> -+          d =3D FNMSUB (g, g, b);
> -+
> -+          fesetenv_register (fe);
> -+          return FMADD (d, h, g);
> -+        }
> -+    }
> -+  else if (b < 0)
> -+    {
> -+      /* For some reason, some PowerPC32 processors don't implement
> -+         FE_INVALID_SQRT.  */
> -+#ifdef FE_INVALID_SQRT
> -+      feraiseexcept (FE_INVALID_SQRT);
> -+
> -+      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> -+      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> -+#endif
> -+      feraiseexcept (FE_INVALID);
> -+      b =3D a_nan.value;
> -+    }
> -+  return f_wash (b);
> -+}
> -Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
> -@@ -0,0 +1,101 @@
> -+/* Single-precision floating point square root.
> -+   Copyright (C) 2010 Free Software Foundation, Inc.
> -+   This file is part of the GNU C Library.
> -+
> -+   The GNU C Library is free software; you can redistribute it and/or
> -+   modify it under the terms of the GNU Lesser General Public
> -+   License as published by the Free Software Foundation; either
> -+   version 2.1 of the License, or (at your option) any later version.
> -+
> -+   The GNU C Library is distributed in the hope that it will be useful,
> -+   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+   Lesser General Public License for more details.
> -+
> -+   You should have received a copy of the GNU Lesser General Public
> -+   License along with the GNU C Library; if not, write to the Free
> -+   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -+   02111-1307 USA.  */
> -+
> -+#include <math.h>
> -+#include <math_private.h>
> -+#include <fenv_libc.h>
> -+#include <inttypes.h>
> -+
> -+#include <sysdep.h>
> -+#include <ldsodefs.h>
> -+
> -+static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> -+static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> -+static const float threehalf =3D 1.5;
> -+
> -+/* The method is based on the descriptions in:
> -+
> -+   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chap=
ter 5;
> -+   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, =
chapter 9
> -+
> -+   We find the reciprocal square root and use that to compute the actua=
l
> -+   square root.  */
> -+
> -+#ifdef __STDC__
> -+float
> -+__ieee754_sqrtf (float b)
> -+#else
> -+float
> -+__ieee754_sqrtf (b)
> -+     float b;
> -+#endif
> -+{
> -+  if (__builtin_expect (b > 0, 1))
> -+    {
> -+#define FMSUB(a_, c_, b_)                                              =
 \
> -+      ({ double __r;                                                   =
 \
> -+        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                      =
 \
> -+                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> -+        __r;})
> -+#define FNMSUB(a_, c_, b_)                                             =
 \
> -+      ({ double __r;                                                   =
 \
> -+        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     =
 \
> -+                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
> -+        __r;})
> -+
> -+      if (__builtin_expect (b !=3D a_inf.value, 1))
> -+        {
> -+          double y, x;
> -+          fenv_t fe;
> -+
> -+          fe =3D fegetenv_register ();
> -+
> -+          relax_fenv_state ();
> -+
> -+          /* Compute y =3D 1.5 * b - b.  Uses fewer constants than y =
=3D 0.5 * b.  */
> -+          y =3D FMSUB (threehalf, b, b);
> -+
> -+          /* Initial estimate.  */
> -+          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=3Df" (x) : [b] "f" (b=
));
> -+
> -+          /* Iterate.  x_{n+1} =3D x_n * (1.5 - y * (x_n * x_n)).  */
> -+          x =3D x * FNMSUB (y, x * x, threehalf);
> -+          x =3D x * FNMSUB (y, x * x, threehalf);
> -+          x =3D x * FNMSUB (y, x * x, threehalf);
> -+
> -+          /* All done.  */
> -+          fesetenv_register (fe);
> -+          return x * b;
> -+        }
> -+    }
> -+  else if (b < 0)
> -+    {
> -+      /* For some reason, some PowerPC32 processors don't implement
> -+         FE_INVALID_SQRT.  */
> -+#ifdef FE_INVALID_SQRT
> -+      feraiseexcept (FE_INVALID_SQRT);
> -+
> -+      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
> -+      if ((u.l[1] & FE_INVALID) =3D=3D 0)
> -+#endif
> -+      feraiseexcept (FE_INVALID);
> -+      b =3D a_nan.value;
> -+    }
> -+  return f_washf (b);
> -+}
> -Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
> -@@ -0,0 +1 @@
> -+powerpc/powerpc32/603e/fpu
> -Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/fpu/Implies
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/7400/fpu/Implies
> -@@ -0,0 +1 @@
> -+powerpc/powerpc32/603e/fpu
> -Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
> -@@ -0,0 +1 @@
> -+powerpc/powerpc32/603e/fpu
> -Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
> -@@ -0,0 +1 @@
> -+powerpc/powerpc64/e5500/fpu
> -Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- /dev/null
> -+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
> -@@ -0,0 +1 @@
> -+powerpc/powerpc32/603e/fpu
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/=
eglibc/eglibc_2.16.bb
> index 78dc44a..a753882 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>  SRCREV =3D "20393"
>
>  DEPENDS +=3D "gperf-native kconfig-frontends-native"
> -PR =3D "r9"
> +PR =3D "r10"
>  PR_append =3D "+svnr${SRCPV}"
>
>  EGLIBC_BRANCH=3D"eglibc-2_16"
> @@ -13,7 +13,7 @@ SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=
=3D${EGLIBC_BRANCH};protocol=3Dh
>             file://mips-rld-map-check.patch \
>             file://etc/ld.so.conf \
>             file://generate-supported.mk \
> -           file://ppc-sqrt.patch \
> +          file://glibc.fix_sqrt2.patch \
>             file://multilib_readlib.patch \
>             file://use-sysroot-cxx-headers.patch \
>             file://ppc-sqrt_finite.patch \
> --
> 1.7.9.7
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



