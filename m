Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 100578 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Feb 2019 08:46:20 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140072.outbound.protection.outlook.com [40.107.14.72])
	by mail.openembedded.org (Postfix) with ESMTP id 36D617C893
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GennInUPsNgw6rHnCmn2vD+5xSDS4WiEo3Xhv+WhLlI=;
	b=T052fK4U4dUgWl5/QQVdrh+N5znGHPbmbrjtHLRX3850lClpv2pglPE2LWFUJGvY/ovZBdqeceJT0xXPp5T9WiV6qFtLIwsdtH0WBHZmTppnxDlEpAvIPOmNi1eoRI/Fjut7z41phdBOzkmQilHTztAmyDzPoufr/yjr1o3Zpjg=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4780.eurprd04.prod.outlook.com (20.176.233.90) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.19; Mon, 18 Feb 2019 03:18:19 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::b84d:485a:ecdd:b52a]) by
	DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::b84d:485a:ecdd:b52a%2]) with mapi id 15.20.1622.018;
	Mon, 18 Feb 2019 03:18:19 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] glibc: support powerpc e5500 and e6500
Thread-Index: AQHUxziYPOnBbILmnE2jKg+Jmmpjkw==
Date: Mon, 18 Feb 2019 03:18:19 +0000
Message-ID: <1550459871-25701-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2P15301CA0021.APCP153.PROD.OUTLOOK.COM
	(2603:1096:202:1::31) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
x-mailer: git-send-email 2.7.4
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 350ed9f1-76b3-4d1b-8e34-08d6954fbade
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4780; 
x-ms-traffictypediagnostic: DB7PR04MB4780:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DB7PR04MB4780;
	23:/QMUhxcHflwFpfbuJInkoaHt7rv26EUL/j0w27b?=
	=?iso-8859-1?Q?sH9Iz1N9wxFZo3s1AYE2SEFm0Dn1WBQssr+rfG84h5ANkO+NWQ4XtXW1ED?=
	=?iso-8859-1?Q?wPUaoWeyeIRuRuw4qymmyMOIsY/eFSygbCTMYggp31zNbh30dG2qzPLwHk?=
	=?iso-8859-1?Q?/SRM/EGFfA4LGjznQ+IGbhMyeKPW6s3Q43wiejFx4VRFaHTwsXdDPZbnmZ?=
	=?iso-8859-1?Q?BInIhpUxzlQEtcWv1jPoWToxHjB8c0fNYamakVs3OVqU22vByuKFN/bQZg?=
	=?iso-8859-1?Q?fcKhfw6O/6FnArl3lPyN0E+a1LYlZPjtJd9KKImXm/yfETl3oCdh7v+daQ?=
	=?iso-8859-1?Q?9cI9VpjL3isGdM8oX3UrnEREIEKXMx0lz0YRhhWAXTQfUXPTCaHe70SUDI?=
	=?iso-8859-1?Q?0GEu+wJDU2Whw0E62wputRJIyNbEJfvZHiHbrwcCgQ/KZNKSmvFDqP5s1R?=
	=?iso-8859-1?Q?q3V+hRvwnYJPqC4okF5lT3/ASkoDp6ijAx75uIz8lE2lHHHh8Nw/3Zi8zw?=
	=?iso-8859-1?Q?3cDBLYrHKrg7KABI+rdK0UsvuAdB9+rZThv+Hborz2x+dq6xOg4nBiqyWz?=
	=?iso-8859-1?Q?7GbYWFRB74nBeoEI2PhK4i4W0nHSSSwZWEu+b+jxgV1GxaDK+mBRNji5ml?=
	=?iso-8859-1?Q?ZaoyRBsbnNb9VLX2SO7hzLqLlA3cAxk3SH63t3+XRF/BkYt/4H/TDsLzPQ?=
	=?iso-8859-1?Q?yNn5sIY20kM5SsrPEiKsmjZAv+xoTSDmfHE2WLzdcHkbr2Z06tEMa6J5uc?=
	=?iso-8859-1?Q?TQz8JlsxYLmddmog5M843Dc4W0E9wlBntRyBwggebkS7VSu1U9BDHOs2Nl?=
	=?iso-8859-1?Q?40CKDYfF+X2qWa3Ytl6w+Hzxf/R1COHbD3mp9daS0ZONLeT5rh81Zo5utH?=
	=?iso-8859-1?Q?Ho2rkRzLVUF0IIiGbSWY32ME7tvx9puvSl8iXzVtPXAYq2bxkSdFFka1y8?=
	=?iso-8859-1?Q?tpSk/1dYrDzXg2e2VHCRa772XMkIKPvKDPa9hM9lFtz9o/LUskzvBy9Upk?=
	=?iso-8859-1?Q?zzTFA2PRJZsvU7tc8bJpIMTh8SywQN/qsyTRLtxQdeR1SdyRBGHQSvAl+W?=
	=?iso-8859-1?Q?W8FVIqea0miyH2RW+PHsx/yn5kJx/xgj+LbuAMlT9yAy2M0Mx2st7+GTvA?=
	=?iso-8859-1?Q?bqZzt+2kSwmic7CjpCgaP9pStm32OI2mGdrX83fMoL5wiIlAvfD9/hKDX+?=
	=?iso-8859-1?Q?DuJmeckovoz84+kvwrGUXPwLoeTK8dT/3tGRRIdets7sjvJxRxb68fh00O?=
	=?iso-8859-1?Q?XCNHh+UUQk/TxYqpmdy6jB2XFaFUdNx4JGp3nhZ/9RIwBlKNsZ2yKuFMlN?=
	=?iso-8859-1?Q?PlaO7izJoqp9F5baUasyu5q?=
x-microsoft-antispam-prvs: <DB7PR04MB47805EE4BA5D159D823EB28484630@DB7PR04MB4780.eurprd04.prod.outlook.com>
x-forefront-prvs: 09525C61DB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(366004)(396003)(136003)(346002)(376002)(189003)(199004)(5660300002)(68736007)(52116002)(14444005)(256004)(3846002)(36756003)(102836004)(6116002)(5640700003)(99286004)(86362001)(50226002)(81166006)(81156014)(8676002)(305945005)(7736002)(476003)(2906002)(14454004)(2616005)(8936002)(478600001)(486006)(2351001)(71200400001)(71190400001)(6916009)(106356001)(186003)(6512007)(26005)(53946003)(66066001)(97736004)(6486002)(6506007)(386003)(53936002)(6436002)(316002)(30864003)(105586002)(25786009)(2501003)(4326008)(2004002)(579004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4780;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pAT1cynvqdzwu3tgCRFGwpA28e9pNJ11rS5/FAV53aT2zl3NDoBm1qyqCqa+MZPFeWwyDleqAK/GKYs6+V282Bv9H2W5MGjrIR9t7MpnLs3HYL2uCyndKxD9UZ8GHSGjWG22PA88iDam9G3OAHyMvOu5lne8XSv49kuGCR/XmqQnyXaMwhqRNnaaaQ6FGu+WpXnptFLlV1SOG30zk9m6C0VX2BNeK9g6UM6NT7FLTGToXVr6bIkH6P14cN6h8egkKE+WB0MHleJbJgzzaPhu1+JBa+fgMIj1gXRZ+GKqWDNfIdAWVZAeFgp8zgVMPWNcbhSvhP/C74KM4RQhVbPx2l/klDU1ofktaMauHrMjTm+r1S0LmvtMWSKDbyM/ErF/EVkgn1RABjSq3XB0oyVDZcZvT87uWt2ICf11m/GN6KQ=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 350ed9f1-76b3-4d1b-8e34-08d6954fbade
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2019 03:18:17.7527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4780
Subject: [PATCH] glibc: support powerpc e5500 and e6500
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
X-List-Received-Date: Tue, 19 Feb 2019 08:46:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 .../glibc/0031-glibc-support-e5500-and-e6500.patch | 564 +++++++++++++++++=
++++
 meta/recipes-core/glibc/glibc_2.29.bb              |   1 +
 2 files changed, 565 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-glibc-support-e5500-=
and-e6500.patch

diff --git a/meta/recipes-core/glibc/glibc/0031-glibc-support-e5500-and-e65=
00.patch b/meta/recipes-core/glibc/glibc/0031-glibc-support-e5500-and-e6500=
.patch
new file mode 100644
index 0000000..146115a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-glibc-support-e5500-and-e6500.patc=
h
@@ -0,0 +1,564 @@
+From 70dc75d3da86dea8b6ebdaedfa76e625a076678e Mon Sep 17 00:00:00 2001
+From: Chunrong Guo <chunrong.guo@nxp.com>
+Date: Wed, 31 Oct 2018 17:56:24 +0800
+Subject: [PATCH] glibc: support e5500 and e6500
+
+Upstream-Status: Pending
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
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glib=
c/glibc_2.29.bb
index 72db00c..2b495c4 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -56,6 +56,7 @@ SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0028-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0029-inject-file-assembly-directives.patch \
            file://0030-locale-prevent-maybe-uninitialized-errors-with-Os-B=
Z.patch \
+           file://0031-glibc-support-e5500-and-e6500.patch \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.7.4


