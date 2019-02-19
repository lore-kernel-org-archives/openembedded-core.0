Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 14344 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Feb 2019 11:22:39 UTC
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30051.outbound.protection.outlook.com [40.107.3.51])
	by mail.openembedded.org (Postfix) with ESMTP id DC9057C872
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 11:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GennInUPsNgw6rHnCmn2vD+5xSDS4WiEo3Xhv+WhLlI=;
	b=clAr6ZzN5TSFP8zkohrbfxtpo+EdPVM00nfCJfL1HngWY/3EYvvw7CFEaldZiN+UTB+FJrntAXBnqkAW1BZu1C2bKEYCCj/ZUdUrviAg4kqsYGY8C9dkDuE24gK6lksxjkYfnr9Nd4UvFSzqgHTDQTV80f6H3+0ISqXA+5A2ySg=
Received: from AM0PR04MB5059.eurprd04.prod.outlook.com (20.177.40.152) by
	AM0PR04MB4500.eurprd04.prod.outlook.com (52.135.147.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1622.19; Tue, 19 Feb 2019 05:50:32 +0000
Received: from AM0PR04MB5059.eurprd04.prod.outlook.com
	([fe80::ecf0:3994:ce2e:642e]) by
	AM0PR04MB5059.eurprd04.prod.outlook.com
	([fe80::ecf0:3994:ce2e:642e%5]) with mapi id 15.20.1622.018;
	Tue, 19 Feb 2019 05:50:32 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] glibc: support powerpc e5500 and e6500
Thread-Index: AQHUyBcGSl/8OVwP+kqgbWHbs1UL4g==
Date: Tue, 19 Feb 2019 05:50:32 +0000
Message-ID: <1550555410-24852-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0073.apcprd03.prod.outlook.com
	(2603:1096:203:72::13) To AM0PR04MB5059.eurprd04.prod.outlook.com
	(2603:10a6:208:c9::24)
x-mailer: git-send-email 2.7.4
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea171e83-f4a4-488a-d17d-08d6962e2907
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR04MB4500; 
x-ms-traffictypediagnostic: AM0PR04MB4500:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; AM0PR04MB4500;
	23:Bez8b8go3duPCQgyPKiLDFCy1wNuuJ8MgENjxzV?=
	=?iso-8859-1?Q?im/mj2/iq3ec4SMBg9ELo/LcOXsLSCt8VRWO1uHg4dF915y5ATeujRUeru?=
	=?iso-8859-1?Q?uK3xhmxkDn7SUUfJmX+1/4z6jsNYZfQrN25mwiq4IaP0eXTfrtNa8PKOmm?=
	=?iso-8859-1?Q?nysINcABENorA35ar+qvGPAueAXsFKOPWsI0CwsAGJ/R9owIGyEoTPNBLQ?=
	=?iso-8859-1?Q?qPos1AKFbP4a4Dpp0279vur1S90/vW1cb4KHbIukeJkeTks7UC0J6h5T2h?=
	=?iso-8859-1?Q?woUuY4rGbxcy7SUUH22q33tD5wOg7Xh1CS1cFnerag2CXza3GZ0CQGJDhR?=
	=?iso-8859-1?Q?U4GL+t3vSN8CZMTnRS6EHH4e77E2kSBXDNqmEgB44DHDSxgvkHtdmvSeBI?=
	=?iso-8859-1?Q?FYLoln/DWEJ8wq+YCjSZdN9nEzSz/oalUDcDGvC34kjAhOXp9c3TMTfrTs?=
	=?iso-8859-1?Q?QVgcOE4Kppp6VioHxZMrSTm5C/Fh2Zx+wcqB/eEmYfqeMb74yEIradzS8n?=
	=?iso-8859-1?Q?6FoGu9wqNoGkqMUC6K6fp533n0djg83ganvdBaqGdM/KR1Jw9TOCqJ6lpJ?=
	=?iso-8859-1?Q?RDWPwN8yfJ1w6buiATZPo0p3X7nV3HM/LYB4ZIzVPSRIWZloRfyQFYOeUe?=
	=?iso-8859-1?Q?olt9qsrX46Qi4HEhWcBOHXk63yltBftRaFsoDbzuZ6hhQjceHwLf1DVks4?=
	=?iso-8859-1?Q?l51vCbjccIKRZ4oHcGPTuxOZENTtkttnLvB/QJgplg2zVdW4pnfVPUcq4s?=
	=?iso-8859-1?Q?xZhZyN6oNEg7RG+gyb/cA6owcqWkh+rft+9b2z35uSFXRRbZ0xr1B3VLip?=
	=?iso-8859-1?Q?xH05KNj+ct3EKUWE1H1VeLmqhTo8nQ06eh8BTFQZ3YXYWesDoemDnXApS0?=
	=?iso-8859-1?Q?qPOL94Lnthh5FZTYJQHp85kUIs+XDHbPpLrdfLQG/9K5GozFA0dXsMzOBs?=
	=?iso-8859-1?Q?vRh8XLVDhIHhyJmmGCFjSDQzIPk0VLgWWZZ74FGhEfJ5rlmYOrhCc+oeO9?=
	=?iso-8859-1?Q?OP2/ZidDs7Y6cxhaWEncHQjagRZQXgss9vvvZqRwXFraITt8FhL2pw8qER?=
	=?iso-8859-1?Q?QDdyHiDoDaeLpPAQ38E5aEdfOKeozJYHSrQHigRMFMdNZTYWg5siV85wm0?=
	=?iso-8859-1?Q?W5ONCypkiqPr53tb3ILA4rTEb+Icuha07bAyOboj0LqHTeC5beYk/DdF2t?=
	=?iso-8859-1?Q?iIzHNd5VpELrHOdeKvbNblFzwnuuwlum2CPGMol2+KtJiwbf/GVA6HsIF9?=
	=?iso-8859-1?Q?S1I+XIzNwq8jeW8mFn5nbkXGoW+K/atCmfkzDTIGF3zUBDRPeatP7KHomi?=
	=?iso-8859-1?Q?GVNvp2R7WCpfoui7negt6sQ?=
x-microsoft-antispam-prvs: <AM0PR04MB45006AB42408511561201A98847C0@AM0PR04MB4500.eurprd04.prod.outlook.com>
x-forefront-prvs: 09538D3531
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(189003)(14454004)(53936002)(53946003)(5640700003)(66066001)(26005)(5660300002)(6916009)(8936002)(25786009)(6506007)(86362001)(386003)(2906002)(316002)(36756003)(30864003)(6436002)(50226002)(6486002)(6512007)(102836004)(99286004)(52116002)(97736004)(105586002)(106356001)(2351001)(2616005)(6116002)(14444005)(186003)(7736002)(486006)(476003)(68736007)(81156014)(2501003)(81166006)(8676002)(305945005)(3846002)(71190400001)(71200400001)(4326008)(256004)(478600001)(2004002)(579004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4500;
	H:AM0PR04MB5059.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xqhTzS/qZ+jEAR0Jcv05nMzAk3sQdbSb/uqDCEco1eLLSrMr+mQlSuRoOzEk8xZLIa31X6s0vBDBZkarPuSPQPXaPUpCjPdD3uTZeazyKp7U5qg4Rhs1JnkVN3MULQH2h4+C8Uvhzc9j8NGNwU+Ix1swmEohotVLQ7QdsOEuWAzMac1scIQYoUPQaGqVCvBMsxEtXFkrFtgUGB5EHxDF5hkgsbR49/3xlm8DCRphl92YezXPZtdTW9p9mkXMAOzvWAFPU1/VMtXdA1IRzFE0jLSDWUeOjnTHjutYW57cjAICI8LCZIOxapwQAv7I+/juQzAODI2/J2Rn6EHtmJUl1QXMawYjgZpWKHXEAVZB3Eyjo4mXvfi47nKIG9KI4LbiKASUyRKXHOhOPoSXIl4r/fqe0YRsdEoXUPnmOnGmoHQ=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea171e83-f4a4-488a-d17d-08d6962e2907
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2019 05:50:30.9466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4500
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
X-List-Received-Date: Tue, 19 Feb 2019 11:22:40 -0000
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


