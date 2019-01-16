Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 81058 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Jan 2019 08:36:54 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130087.outbound.protection.outlook.com [40.107.13.87])
	by mail.openembedded.org (Postfix) with ESMTP id 571987C1AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 08:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=M25Jns/axrCErZU261NZNEmO5AsNgazDOYeQa6M0PT8=;
	b=OksReiHfUSeg1DOn4PZyAEvcMu8eDfqP1oXg+zZg5Kd2Czu66uvymZPItbARiaCKITXiLoO7csp+QCQpjpZyoVjymT8qKZbgw5QkdPm+30pfTFrCzPea+1U1BICZ0HC0GPb9tpCRlSVuukOVLNYWJ+k5PU/9iyo3zOAbeLt8UH8=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4348.eurprd04.prod.outlook.com (52.135.131.155) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Wed, 16 Jan 2019 03:15:10 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::c155:178e:fbd7:5892]) by
	DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::c155:178e:fbd7:5892%4]) with mapi id 15.20.1537.018;
	Wed, 16 Jan 2019 03:15:10 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [thud][PATCH] glibc: glibc support powerpc e5500 and e6500
Thread-Index: AQHUrUmwJsCVH9c72UeMwH7tVbpCsQ==
Date: Wed, 16 Jan 2019 03:15:10 +0000
Message-ID: <1547608486-11508-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0078.apcprd03.prod.outlook.com
	(2603:1096:203:72::18) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR04MB4348;
	6:kjQxGaH6W5dR0TE+pZ3qYFjzCXoAplSMkIoTxlS3aRX1oyef7umBNG8L0Q5c2I9SlLXsRHUVMVmkd8V4l+RzyNok6sYpq52rhBBmYSMiHunB1WLt6OvUQnJGZZTmZ43yg7y6iA8nRw3inz4GurHbVW9O5Heo//DZsMK3lSWx/HR8ZhK5qBKCyHPCVJpa94Cv3Y4KZMXl+OYOF4HlQix65QBxwVIgL1Y9JPjX+KLj0fxSpdR7VDa6oglPhAv7wABTIzhUGuI/7CaNpsM4AWgNib6kFYuEX0Vm2qotLBty2Vmc4M3tuKm7I0EMlYITWJSal7aRQP/tGNWhXGj5HBJURHeC+f+YQoIEQRSndWH4uQCGGmuRu+ehVByl9RUqVxiO1MRaMBrxTWDiaGMPK3Q4b8eAbx/jOSvvnmkElPIlXi8rv42xRVpvds+xS0d/ZbrKVcmQkuv9DOKMAX5JwUITVA==;
	5:wVcb66unsi8Sd4hvqn7H4kWVN+muZBbTyWAaVWkp6NrhjYZzbmRyqs5s61+L97JT4YdMD1EqcI67qgim6Yk7/qr9819aG8dVxIr1nnOVHJk/uMMzyO4FTWLuIbPavmxiAEeCmRZrMkFww4qKygIjrKQ96fmoN/tFBk6Bzr9RRjm4nZYJMJulhGJAZx3/LRI7CSuCu2E+GstyhQ7XPzPlkA==;
	7:Qaim/vrKrf6FYfbvye+uQsz34hUZRD+lJfCYp4FCJfD0UPCiKtEFjZTitUiHuqTD9r4dgJgPk0Un5SeDkSCS4iG7cmmP77CHLlTnPanK+A7jB8nBx00NDyIpfZQCeRWL1VGFvb+3lupb4q5OQpx9Tw==
x-ms-office365-filtering-correlation-id: b647a0c9-2182-45e7-a268-08d67b60d2ad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4348; 
X-MS-TrafficTypeDiagnostic: DB7PR04MB4348:|DB7PR04MB4348:
x-microsoft-antispam-prvs: <DB7PR04MB4348FFCD655E9BBAF3EA187384820@DB7PR04MB4348.eurprd04.prod.outlook.com>
x-forefront-prvs: 091949432C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(396003)(366004)(346002)(136003)(39860400002)(189003)(199004)(14454004)(478600001)(2616005)(6116002)(53936002)(3846002)(52116002)(36756003)(476003)(2351001)(53946003)(4326008)(2906002)(68736007)(6506007)(6486002)(26005)(105586002)(6916009)(106356001)(6512007)(386003)(5660300001)(102836004)(86362001)(4744004)(5640700003)(25786009)(6436002)(186003)(486006)(99286004)(71190400001)(71200400001)(2501003)(97736004)(305945005)(30864003)(81156014)(81166006)(66066001)(8936002)(8676002)(316002)(7736002)(50226002)(256004)(2004002)(579004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4348;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2hq3khqkGV6ZJ8eDmWuLyNC5S44HL/78Z3U7fx/0ql2Uj7+mlFIIfLXlZ7OvsCUZ6PRl9fkYL13NLT7KNWzCPNsDfCdVI4R67oeUiOqjYzScHF8EOd38GV/vffG9GhFe9DlI4aYthTGeJfbHLoUiUb1Ep0APiZQcrbjxmZRo83CmSXMoWdio9eLt+32pYihSv6vnlOI95xHSBamACUF0Jt1SmZnA39yuOrNmI5DqebGp+UBoEBfxW/I/H5sJ4vPggEZVmWRmWmuFyb9OuLJXHTaNjLGzSg4JUCZKamt/JSfb+Xv0tEU/Pf1TWbOTz2w/60FRuSbi0JTUbOjbrhs9bp+jH7wCjZQ27dtqztPifRqPGoA36RzHaanWFnMFhZACFz/CZNgrFwOxBBZa7uH+hGgUiuRlzoM4whjpyiM3mCY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b647a0c9-2182-45e7-a268-08d67b60d2ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2019 03:15:08.8115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4348
X-Microsoft-Exchange-Diagnostics: 1; DB7PR04MB4348;
	23:K3qP7AUIipF4FaPdhrKWDdBIzlz2DHbpNbFstXp8s8LCxluZqtmr5KWopLEoOnJiT/Ox0YN6EkqjpfGrbQaPVps/BkgLSxgta+50OnCR/jgt6avX6Sv+WHTvVaXewPTtVadqc+1zYQhOQWp+FL6EWQ==
X-OriginatorOrg: nxp.com
Subject: [thud][PATCH] glibc: glibc support powerpc e5500 and e6500
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
X-List-Received-Date: Wed, 16 Jan 2019 08:36:56 -0000
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
index d072939..231117e 100644
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


