Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 39527 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Jan 2019 10:12:41 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10062.outbound.protection.outlook.com [40.107.1.62])
	by mail.openembedded.org (Postfix) with ESMTP id 81FD471A0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 10:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nIE44lTvhnEGm2BN63JMXHY3UEIMG2Nz4abnjGWOd14=;
	b=oH60+PJLcEym+zsfr7MtY7ifhOL3MIbLQyMxuUR4nSbNIc9qcfgyP9SwLevpDZ37XsEF94T9OFz6kzMezyw70CI+aPRMXr4fBuS782GmfPl1jiZAH2bgL58pvEQyAZonrQ0dWPeRkO1D2cJbZtwZqlagU2yZhow6nf26cP1OcuM=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB5018.eurprd04.prod.outlook.com (20.176.234.214) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.14; Tue, 15 Jan 2019 09:51:42 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::c155:178e:fbd7:5892]) by
	DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::c155:178e:fbd7:5892%4]) with mapi id 15.20.1537.018;
	Tue, 15 Jan 2019 09:51:42 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] glibc: glibc support powerpc e5500 and e6500
Thread-Index: AQHUrLfryN0NsbFbO06TyzZPj46NqA==
Date: Tue, 15 Jan 2019 09:51:42 +0000
Message-ID: <1547545883-1212-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR03CA0063.apcprd03.prod.outlook.com
	(2603:1096:202:17::33) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR04MB5018;
	6:fjkMaSlo0KHUprTBlbYG7IJ6oObJATySn9Fgss59iGcayFX/h2mMImJf4jFdDRXUx37mNa1KygUoSxW7f14MiCJ+wBsm4cEOFco4kaAWX9GpIKyUh44pWpES2BRuk89UpPSApXW90vmfe/oy0ydzmW08D+YlP8Th1WK2sXP47jR4s1zhqD9h+lnzCT/VEoO6uXhYT62QS7d+OZmZMrYSuo5qHtiNDEx5Fr3Ekk8svF6F1xwPNFn9MZpJnpbhsw0P2GC47QewJdP9b9SvWEKxmM2oNMJX07dzkbi1PDvAOJEv6NWrfalnFCUloE04uQVUEy9tEFceWWQbnRWYw5FbY8d6vZ4LY2aBXWqZPkw3bj15+aVIDQw0hYytB/budF+G286PKRvn5f+Alkp7jpfw7zS+9DVkQeOvMIJnWNZWV6MwEiSSb/RvEAUoKtPRfhrBDnYhxrMWMb0KfJvGU4/psg==;
	5:YEhu0xtApNiepmRPgyojFtny0OpIB4st6gyMYJE+B4zadt9hSusbA6x2IuncpXI5SkAes8btEmfhvwWzao6MpiwzV85tfi6Kx7Oc7B2Rh8O0urd9zR+TM9f78N2hBaAykzCCZe7RljT2qD3X1tchSDvwCI7bUWv+1XqsN7fg3nryp1W92aStlIH7x3rR54DP9G9z/Ftfx1gNZxX7ZZRWGA==;
	7:HLFHno2USJMFmxsa4F4+8mJ16cLtBFIn0x5V2GaOkDyjxnpNTzsavm0bsSrtSL2PRlVP3u+zkmCvnqPu7B2NjyBpz5AibJtkIHF51RmJwM1oeXkJri5u1YFuTXRCQCOuEu/LbWnNvEWAkhyEoXiVwA==
x-ms-office365-filtering-correlation-id: 76198ea4-59a3-4b30-61f6-08d67acf0d7f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB5018; 
X-MS-TrafficTypeDiagnostic: DB7PR04MB5018:|DB7PR04MB5018:
x-microsoft-antispam-prvs: <DB7PR04MB5018C34081810FA55FF82A5584810@DB7PR04MB5018.eurprd04.prod.outlook.com>
x-forefront-prvs: 0918748D70
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(136003)(376002)(39860400002)(396003)(189003)(199004)(2351001)(6116002)(386003)(3846002)(478600001)(106356001)(50226002)(2906002)(8936002)(6512007)(8676002)(2501003)(256004)(66066001)(30864003)(36756003)(6506007)(7736002)(54906003)(86362001)(305945005)(2616005)(476003)(53936002)(52116002)(486006)(102836004)(6916009)(14454004)(6486002)(26005)(5660300001)(53946003)(97736004)(81156014)(105586002)(71190400001)(68736007)(25786009)(316002)(81166006)(71200400001)(6436002)(186003)(99286004)(5640700003)(4326008)(2004002)(579004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB5018;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lkugPSPEGgv3Hdt+3u6BeL32fxpVLoRdoIxKt3PQtCzQzbxyhDQap553Wl4LmrgjCltvwMWC8jj8LNw9j3RaWDg6SumssBNbIncTiQzI3cbCt2UKxSA9nWk+xjSauuo6kiVHvOw2HCu1GGfgpIGYcRJW+dBx+BgfISU9N2pYNNwtIWbblE0RrgjUBfK4ucPfoOGAzbfLkVjd0i7lCRWPpY7bZVteg6GJpjSHEUgKSlYjFcSEDZ2z0aDXuT42/93pQzbnbXJsQK0x/N+OzPL4sO5PoLll+bmiJAtHFHZJupjAF4LoATtjPNmBQBZ26f0Vyqhuu03aUZOYwfFmU8hc1KUtAH5m7seVgw1hv96/kyKZcYcmpg/FJ5AtWA83E8jDosO7VQ1n+rGt8qRv5T1ETYGGFVwqQEFgSC46lwWgxRE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 76198ea4-59a3-4b30-61f6-08d67acf0d7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2019 09:51:40.8294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5018
X-Microsoft-Exchange-Diagnostics: 1; DB7PR04MB5018;
	23:0EryukhtUr6wM6c1AnZjAjIPRizRJR5PRyhmsOR6doDksIF/HYFo7yULIobtpsyDds3XG+ernqrFPr1Np8cFZ1loOcsn2ex0pnos+vrIdnBJbgXNKTfJi7yJJhY5/uSdtCEeN5ItgagjgT89PyMayQ==
X-OriginatorOrg: nxp.com
Cc: "chunrong.guo@nxp.co" <chunrong.guo@nxp.co>
Subject: [PATCH] glibc: glibc support powerpc e5500 and e6500
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
X-List-Received-Date: Wed, 16 Jan 2019 10:12:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 .../glibc/0035-glibc-support-e5500-and-e6500.patch | 562 +++++++++++++++++=
++++
 meta/recipes-core/glibc/glibc_2.28.bb              |   1 +
 2 files changed, 563 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0035-glibc-support-e5500-=
and-e6500.patch

diff --git a/meta/recipes-core/glibc/glibc/0035-glibc-support-e5500-and-e65=
00.patch b/meta/recipes-core/glibc/glibc/0035-glibc-support-e5500-and-e6500=
.patch
new file mode 100644
index 0000000..bc54de7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0035-glibc-support-e5500-and-e6500.patc=
h
@@ -0,0 +1,562 @@
+From 70dc75d3da86dea8b6ebdaedfa76e625a076678e Mon Sep 17 00:00:00 2001
+From: Chunrong Guo <chunrong.guo@nxp.com>
+Date: Wed, 31 Oct 2018 17:56:24 +0800
+Subject: [PATCH] glibc: support e5500 and e6500
+
+Signed-off-by: BJ DevOps Team <bjdevops@NXP1.onmicrosoft.com>
+---
+ sysdeps/powerpc/powerpc64/be/e5500/Implies         |   2 +
+ sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrt.c    | 137 ++++++++++++++++=
+++++
+ sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrtf.c   | 103 ++++++++++++++++
+ .../powerpc/powerpc64/be/e5500/multiarch/Implies   |   1 +
+ sysdeps/powerpc/powerpc64/be/e6500/Implies         |   2 +
+ sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrt.c    | 137 ++++++++++++++++=
+++++
+ sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrtf.c   | 103 ++++++++++++++++
+ .../powerpc/powerpc64/be/e6500/multiarch/Implies   |   1 +
+ 8 files changed, 486 insertions(+)
+ create mode 100644 sysdeps/powerpc/powerpc64/be/e5500/Implies
+ create mode 100644 sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrt.c
+ create mode 100644 sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrtf.c
+ create mode 100644 sysdeps/powerpc/powerpc64/be/e5500/multiarch/Implies
+ create mode 100644 sysdeps/powerpc/powerpc64/be/e6500/Implies
+ create mode 100644 sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrt.c
+ create mode 100644 sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrtf.c
+ create mode 100644 sysdeps/powerpc/powerpc64/be/e6500/multiarch/Implies
+
+diff --git a/sysdeps/powerpc/powerpc64/be/e5500/Implies b/sysdeps/powerpc/=
powerpc64/be/e5500/Implies
+new file mode 100644
+index 0000000..a795586
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/be/e5500/Implies
+@@ -0,0 +1,2 @@
++powerpc/powerpc64/e5500
++
+diff --git a/sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrt.c b/sysdeps/pow=
erpc/powerpc64/be/e5500/fpu/e_sqrt.c
+new file mode 100644
+index 0000000..13a8197
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrt.c
+@@ -0,0 +1,137 @@
++/* Double-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
++static const float two108 =3D 3.245185536584267269e+32;
++static const float twom54 =3D 5.551115123125782702e-17;
++static const float half =3D 0.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapte=
r 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, ch=
apter 9
++
++   We find the actual square root and half of its reciprocal
++   simultaneously.  */
++
++double
++__slow_ieee754_sqrt (double b)
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++      double y, g, h, d, r;
++      ieee_double_shape_type u;
++
++      if (__builtin_expect (b !=3D a_inf.value, 1))
++        {
++          fenv_t fe;
++
++          fe =3D fegetenv_register ();
++
++          u.value =3D b;
++
++          relax_fenv_state ();
++
++          __asm__ ("frsqrte %[estimate], %[x]\n"
++                   : [estimate] "=3Df" (y) : [x] "f" (b));
++
++          /* Following Muller et al, page 168, equation 5.20.
++
++             h goes to 1/(2*sqrt(b))
++             g goes to sqrt(b).
++
++             We need three iterations to get within 1ulp.  */
++
++          /* Indicate that these can be performed prior to the branch.  G=
CC
++             insists on sinking them below the branch, however; it seems =
like
++             they'd be better before the branch so that we can cover any =
latency
++             from storing the argument and loading its high word.  Oh wel=
l.  */
++
++          g =3D b * y;
++          h =3D 0.5 * y;
++
++          /* Handle small numbers by scaling.  */
++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x0200000=
0, 0))
++            return __slow_ieee754_sqrt (b * two108) * twom54;
++
++#define FMADD(a_, c_, b_)                                               \
++          ({ double __r;                                                \
++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
++          __r;})
++#define FNMSUB(a_, c_, b_)                                          \
++          ({ double __r;                                                \
++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     =
\
++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
++          __r;})
++
++          r =3D FNMSUB (g, h, half);
++          g =3D FMADD (g, r, g);
++          h =3D FMADD (h, r, h);
++
++          r =3D FNMSUB (g, h, half);
++          g =3D FMADD (g, r, g);
++          h =3D FMADD (h, r, h);
++
++          r =3D FNMSUB (g, h, half);
++          g =3D FMADD (g, r, g);
++          h =3D FMADD (h, r, h);
++
++          /* g is now +/- 1ulp, or exactly equal to, the square root of b=
.  */
++
++          /* Final refinement.  */
++          d =3D FNMSUB (g, g, b);
++
++          fesetenv_register (fe);
++          return FMADD (d, h, g);
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
++      if ((u.l & FE_INVALID) =3D=3D 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b =3D a_nan.value;
++    }
++  return f_wash (b);
++}
++
++#undef __ieee754_sqrt
++double
++__ieee754_sqrt (double x)
++{
++  return __slow_ieee754_sqrt (x);
++}
++
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+diff --git a/sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrtf.c b/sysdeps/po=
werpc/powerpc64/be/e5500/fpu/e_sqrtf.c
+new file mode 100644
+index 0000000..fae2d81
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/be/e5500/fpu/e_sqrtf.c
+@@ -0,0 +1,103 @@
++/* Single-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
++static const float threehalf =3D 1.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapte=
r 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, ch=
apter 9
++
++   We find the reciprocal square root and use that to compute the actual
++   square root.  */
++
++float
++__slow_ieee754_sqrtf (float b)
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++#define FMSUB(a_, c_, b_)                                               \
++      ({ double __r;                                                    \
++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f"=
 (b_)); \
++        __r;})
++#define FNMSUB(a_, c_, b_)                                              \
++      ({ double __r;                                                    \
++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f"=
 (b_)); \
++        __r;})
++
++      if (__builtin_expect (b !=3D a_inf.value, 1))
++        {
++          double y, x;
++          fenv_t fe;
++
++          fe =3D fegetenv_register ();
++
++          relax_fenv_state ();
++
++          /* Compute y =3D 1.5 * b - b.  Uses fewer constants than y =3D =
0.5 * b.  */
++          y =3D FMSUB (threehalf, b, b);
++
++          /* Initial estimate.  */
++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=3Df" (x) : [b] "f" (b))=
;
++
++          /* Iterate.  x_{n+1} =3D x_n * (1.5 - y * (x_n * x_n)).  */
++          x =3D x * FNMSUB (y, x * x, threehalf);
++          x =3D x * FNMSUB (y, x * x, threehalf);
++          x =3D x * FNMSUB (y, x * x, threehalf);
++
++          /* All done.  */
++          fesetenv_register (fe);
++          return x * b;
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
++      if ((u.l & FE_INVALID) =3D=3D 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b =3D a_nan.value;
++    }
++  return f_washf (b);
++}
++#undef __ieee754_sqrtf
++float
++__ieee754_sqrtf (float x)
++{
++  return __slow_ieee754_sqrtf (x);
++}
++
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+diff --git a/sysdeps/powerpc/powerpc64/be/e5500/multiarch/Implies b/sysdep=
s/powerpc/powerpc64/be/e5500/multiarch/Implies
+new file mode 100644
+index 0000000..30edcf7
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/be/e5500/multiarch/Implies
+@@ -0,0 +1 @@
++powerpc/powerpc64/multiarch
+diff --git a/sysdeps/powerpc/powerpc64/be/e6500/Implies b/sysdeps/powerpc/=
powerpc64/be/e6500/Implies
+new file mode 100644
+index 0000000..9b8fc07
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/be/e6500/Implies
+@@ -0,0 +1,2 @@
++powerpc/powerpc64/e6500
++
+diff --git a/sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrt.c b/sysdeps/pow=
erpc/powerpc64/be/e6500/fpu/e_sqrt.c
+new file mode 100644
+index 0000000..13a8197
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrt.c
+@@ -0,0 +1,137 @@
++/* Double-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
++static const float two108 =3D 3.245185536584267269e+32;
++static const float twom54 =3D 5.551115123125782702e-17;
++static const float half =3D 0.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapte=
r 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, ch=
apter 9
++
++   We find the actual square root and half of its reciprocal
++   simultaneously.  */
++
++double
++__slow_ieee754_sqrt (double b)
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++      double y, g, h, d, r;
++      ieee_double_shape_type u;
++
++      if (__builtin_expect (b !=3D a_inf.value, 1))
++        {
++          fenv_t fe;
++
++          fe =3D fegetenv_register ();
++
++          u.value =3D b;
++
++          relax_fenv_state ();
++
++          __asm__ ("frsqrte %[estimate], %[x]\n"
++                   : [estimate] "=3Df" (y) : [x] "f" (b));
++
++          /* Following Muller et al, page 168, equation 5.20.
++
++             h goes to 1/(2*sqrt(b))
++             g goes to sqrt(b).
++
++             We need three iterations to get within 1ulp.  */
++
++          /* Indicate that these can be performed prior to the branch.  G=
CC
++             insists on sinking them below the branch, however; it seems =
like
++             they'd be better before the branch so that we can cover any =
latency
++             from storing the argument and loading its high word.  Oh wel=
l.  */
++
++          g =3D b * y;
++          h =3D 0.5 * y;
++
++          /* Handle small numbers by scaling.  */
++          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x0200000=
0, 0))
++            return __slow_ieee754_sqrt (b * two108) * twom54;
++
++#define FMADD(a_, c_, b_)                                               \
++          ({ double __r;                                                \
++          __asm__ ("fmadd %[r], %[a], %[c], %[b]\n"                     \
++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
++          __r;})
++#define FNMSUB(a_, c_, b_)                                          \
++          ({ double __r;                                                \
++          __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                     =
\
++                   : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "=
f" (b_)); \
++          __r;})
++
++          r =3D FNMSUB (g, h, half);
++          g =3D FMADD (g, r, g);
++          h =3D FMADD (h, r, h);
++
++          r =3D FNMSUB (g, h, half);
++          g =3D FMADD (g, r, g);
++          h =3D FMADD (h, r, h);
++
++          r =3D FNMSUB (g, h, half);
++          g =3D FMADD (g, r, g);
++          h =3D FMADD (h, r, h);
++
++          /* g is now +/- 1ulp, or exactly equal to, the square root of b=
.  */
++
++          /* Final refinement.  */
++          d =3D FNMSUB (g, g, b);
++
++          fesetenv_register (fe);
++          return FMADD (d, h, g);
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
++      if ((u.l & FE_INVALID) =3D=3D 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b =3D a_nan.value;
++    }
++  return f_wash (b);
++}
++
++#undef __ieee754_sqrt
++double
++__ieee754_sqrt (double x)
++{
++  return __slow_ieee754_sqrt (x);
++}
++
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+diff --git a/sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrtf.c b/sysdeps/po=
werpc/powerpc64/be/e6500/fpu/e_sqrtf.c
+new file mode 100644
+index 0000000..fae2d81
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/be/e6500/fpu/e_sqrtf.c
+@@ -0,0 +1,103 @@
++/* Single-precision floating point square root.
++   Copyright (C) 2010 Free Software Foundation, Inc.
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
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#include <math.h>
++#include <math_private.h>
++#include <fenv_libc.h>
++#include <inttypes.h>
++
++#include <sysdep.h>
++#include <ldsodefs.h>
++
++static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
++static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
++static const float threehalf =3D 1.5;
++
++/* The method is based on the descriptions in:
++
++   _The Handbook of Floating-Pointer Arithmetic_ by Muller et al., chapte=
r 5;
++   _IA-64 and Elementary Functions: Speed and Precision_ by Markstein, ch=
apter 9
++
++   We find the reciprocal square root and use that to compute the actual
++   square root.  */
++
++float
++__slow_ieee754_sqrtf (float b)
++{
++  if (__builtin_expect (b > 0, 1))
++    {
++#define FMSUB(a_, c_, b_)                                               \
++      ({ double __r;                                                    \
++        __asm__ ("fmsub %[r], %[a], %[c], %[b]\n"                       \
++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f"=
 (b_)); \
++        __r;})
++#define FNMSUB(a_, c_, b_)                                              \
++      ({ double __r;                                                    \
++        __asm__ ("fnmsub %[r], %[a], %[c], %[b]\n"                      \
++                 : [r] "=3Df" (__r) : [a] "f" (a_), [c] "f" (c_), [b] "f"=
 (b_)); \
++        __r;})
++
++      if (__builtin_expect (b !=3D a_inf.value, 1))
++        {
++          double y, x;
++          fenv_t fe;
++
++          fe =3D fegetenv_register ();
++
++          relax_fenv_state ();
++
++          /* Compute y =3D 1.5 * b - b.  Uses fewer constants than y =3D =
0.5 * b.  */
++          y =3D FMSUB (threehalf, b, b);
++
++          /* Initial estimate.  */
++          __asm__ ("frsqrte %[x], %[b]\n" : [x] "=3Df" (x) : [b] "f" (b))=
;
++
++          /* Iterate.  x_{n+1} =3D x_n * (1.5 - y * (x_n * x_n)).  */
++          x =3D x * FNMSUB (y, x * x, threehalf);
++          x =3D x * FNMSUB (y, x * x, threehalf);
++          x =3D x * FNMSUB (y, x * x, threehalf);
++
++          /* All done.  */
++          fesetenv_register (fe);
++          return x * b;
++        }
++    }
++  else if (b < 0)
++    {
++      /* For some reason, some PowerPC32 processors don't implement
++         FE_INVALID_SQRT.  */
++#ifdef FE_INVALID_SQRT
++      feraiseexcept (FE_INVALID_SQRT);
++
++      fenv_union_t u =3D { .fenv =3D fegetenv_register () };
++      if ((u.l & FE_INVALID) =3D=3D 0)
++#endif
++	feraiseexcept (FE_INVALID);
++      b =3D a_nan.value;
++    }
++  return f_washf (b);
++}
++#undef __ieee754_sqrtf
++float
++__ieee754_sqrtf (float x)
++{
++  return __slow_ieee754_sqrtf (x);
++}
++
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+diff --git a/sysdeps/powerpc/powerpc64/be/e6500/multiarch/Implies b/sysdep=
s/powerpc/powerpc64/be/e6500/multiarch/Implies
+new file mode 100644
+index 0000000..30edcf7
+--- /dev/null
++++ b/sysdeps/powerpc/powerpc64/be/e6500/multiarch/Implies
+@@ -0,0 +1 @@
++powerpc/powerpc64/multiarch
+--=20
+1.8.3.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glib=
c/glibc_2.28.bb
index cebd2d0..f871d23 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -49,6 +49,7 @@ SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-=
w.patch \
            file://0033-locale-prevent-maybe-uninitialized-errors-with-Os-B=
Z.patch \
            file://0034-inject-file-assembly-directives.patch \
+           file://0035-glibc-support-e5500-and-e6500.patch \
 "
=20
 NATIVESDKFIXES ?=3D ""
--=20
2.7.4


