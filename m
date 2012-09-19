Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TEBW6-0000S8-RA
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 06:04:02 +0200
Received: from mail97-am1-R.bigfish.com (10.3.201.236) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.23; Wed, 19 Sep 2012 03:51:21 +0000
Received: from mail97-am1 (localhost [127.0.0.1])	by mail97-am1-R.bigfish.com
	(Postfix) with ESMTP id C64143800FC	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 03:51:21 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail97-am1 (localhost.localdomain [127.0.0.1]) by mail97-am1
	(MessageSwitch) id 1348026679407926_31613;
	Wed, 19 Sep 2012 03:51:19 +0000 (UTC)
Received: from AM1EHSMHS007.bigfish.com (unknown [10.3.201.251])	by
	mail97-am1.bigfish.com (Postfix) with ESMTP id 582D13A0133	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 03:51:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS007.bigfish.com
	(10.3.207.107) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 19 Sep 2012 03:51:19 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Tue, 18 Sep 2012 22:51:17 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] eglibc_2.16.bb: refresh
	ppc_slow_ieee754_sqrt.patch for e6500
Thread-Index: AQHNlhoFY2R780Gxp0yW04A7P5Zvzg==
Date: Wed, 19 Sep 2012 03:51:16 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A68BBC3@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
	<1348006091-14992-2-git-send-email-msm@freescale.com>
In-Reply-To: <1348006091-14992-2-git-send-email-msm@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] eglibc_2.16.bb: refresh ppc_slow_ieee754_sqrt.patch for e6500
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
X-List-Received-Date: Wed, 19 Sep 2012 04:04:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <811AB17DDD5669428ED76F1E18904F68@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 5:08 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> Make same changes for e6500 fpu as done with others

This patch was the problem, I needed to update this for e500mc as well
since the glibc.fix_sqrt2.patch updates it as well. Will submit v2 of
both of the patches.

-M

>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  .../eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch |  101 ++++++++++++++=
++----
>  meta/recipes-core/eglibc/eglibc_2.16.bb            |    2 +-
>  2 files changed, 84 insertions(+), 19 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.p=
atch b/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
> index 9a932ff..f432b72 100644
> --- a/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
> +++ b/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
> @@ -5,9 +5,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Upstream-Status: Pending
>  Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c      2012-07-0=
3 22:36:01.172386436 -0700
> -+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c   2012-07-03 23:04:=
37.396469515 -0700
> -@@ -40,7 +40,7 @@
> +--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
> ++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
> +@@ -40,7 +40,7 @@ static const float half =3D 0.5;
>      simultaneously.  */
>
>   double
> @@ -16,7 +16,7 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
>   {
>     if (__builtin_expect (b > 0, 1))
>       {
> -@@ -77,7 +77,7 @@
> +@@ -77,7 +77,7 @@ __ieee754_sqrt (double b)
>
>             /* Handle small numbers by scaling.  */
>             if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> @@ -25,7 +25,7 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
>
>   #define FMADD(a_, c_, b_)                                              =
 \
>             ({ double __r;                                               =
 \
> -@@ -126,4 +126,12 @@
> +@@ -126,4 +126,12 @@ __ieee754_sqrt (double b)
>       }
>     return f_wash (b);
>   }
> @@ -40,9 +40,9 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
>   strong_alias (__ieee754_sqrt, __sqrt_finite)
>  Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c     2012-07-0=
3 22:36:01.172386436 -0700
> -+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c  2012-07-03 23:07:=
06.260476775 -0700
> -@@ -38,7 +38,7 @@
> +--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
> ++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
> +@@ -38,7 +38,7 @@ static const float threehalf =3D 1.5;
>      square root.  */
>
>   float
> @@ -51,7 +51,7 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.=
c
>   {
>     if (__builtin_expect (b > 0, 1))
>       {
> -@@ -93,4 +93,10 @@
> +@@ -93,4 +93,10 @@ __ieee754_sqrtf (float b)
>       }
>     return f_washf (b);
>   }
> @@ -64,9 +64,9 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.=
c
>   strong_alias (__ieee754_sqrtf, __sqrtf_finite)
>  Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c     2012-07-0=
3 22:36:01.176386435 -0700
> -+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c  2012-07-03 23:14:=
16.328497458 -0700
> -@@ -40,7 +40,7 @@
> +--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
> ++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
> +@@ -40,7 +40,7 @@ static const float half =3D 0.5;
>      simultaneously.  */
>
>   double
> @@ -75,7 +75,7 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.=
c
>   {
>     if (__builtin_expect (b > 0, 1))
>       {
> -@@ -77,7 +77,7 @@
> +@@ -77,7 +77,7 @@ __ieee754_sqrt (double b)
>
>             /* Handle small numbers by scaling.  */
>             if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> @@ -84,7 +84,7 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.=
c
>
>   #define FMADD(a_, c_, b_)                                              =
 \
>             ({ double __r;                                               =
 \
> -@@ -126,4 +126,12 @@
> +@@ -126,4 +126,12 @@ __ieee754_sqrt (double b)
>       }
>     return f_wash (b);
>   }
> @@ -99,9 +99,9 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.=
c
>   strong_alias (__ieee754_sqrt, __sqrt_finite)
>  Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c    2012-07-0=
3 22:36:01.176386435 -0700
> -+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c 2012-07-03 23:13:=
52.732496373 -0700
> -@@ -38,7 +38,7 @@
> +--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
> ++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
> +@@ -38,7 +38,7 @@ static const float threehalf =3D 1.5;
>      square root.  */
>
>   float
> @@ -110,7 +110,7 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqr=
tf.c
>   {
>     if (__builtin_expect (b > 0, 1))
>       {
> -@@ -93,4 +93,10 @@
> +@@ -93,4 +93,10 @@ __ieee754_sqrtf (float b)
>       }
>     return f_washf (b);
>   }
> @@ -121,3 +121,68 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sq=
rtf.c
>  +  return __slow_ieee754_sqrtf (x);
>  +}
>   strong_alias (__ieee754_sqrtf, __sqrtf_finite)
> +Index: libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libc.orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
> ++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
> +@@ -41,10 +41,10 @@ static const float half =3D 0.5;
> +
> + #ifdef __STDC__
> + double
> +-__ieee754_sqrt (double b)
> ++__slow_ieee754_sqrt (double b)
> + #else
> + double
> +-__ieee754_sqrt (b)
> ++__slow_ieee754_sqrt (b)
> +      double b;
> + #endif
> + {
> +@@ -83,7 +83,7 @@ __ieee754_sqrt (b)
> +
> +           /* Handle small numbers by scaling.  */
> +           if (__builtin_expect ((u.parts.msw & 0x7ff00000) <=3D 0x02000=
000, 0))
> +-            return __ieee754_sqrt (b * two108) * twom54;
> ++            return __slow_ieee754_sqrt (b * two108) * twom54;
> +
> + #define FMADD(a_, c_, b_)                                              =
 \
> +           ({ double __r;                                               =
 \
> +@@ -132,3 +132,10 @@ __ieee754_sqrt (b)
> +     }
> +   return f_wash (b);
> + }
> ++
> ++#undef __ieee754_sqrt
> ++double
> ++__ieee754_sqrt (double x)
> ++{
> ++   return __slow_ieee754_sqrt (x);
> ++}
> +Index: libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libc.orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
> ++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
> +@@ -39,10 +39,10 @@ static const float threehalf =3D 1.5;
> +
> + #ifdef __STDC__
> + float
> +-__ieee754_sqrtf (float b)
> ++__slow_ieee754_sqrtf (float b)
> + #else
> + float
> +-__ieee754_sqrtf (b)
> ++__slow_ieee754_sqrtf (b)
> +      float b;
> + #endif
> + {
> +@@ -99,3 +99,10 @@ __ieee754_sqrtf (b)
> +     }
> +   return f_washf (b);
> + }
> ++
> ++#undef __ieee754_sqrtf
> ++float
> ++__ieee754_sqrtf (float x)
> ++{
> ++  return __slow_ieee754_sqrtf (x);
> ++}
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/=
eglibc/eglibc_2.16.bb
> index a753882..96da9a5 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>  SRCREV =3D "20393"
>
>  DEPENDS +=3D "gperf-native kconfig-frontends-native"
> -PR =3D "r10"
> +PR =3D "r11"
>  PR_append =3D "+svnr${SRCPV}"
>
>  EGLIBC_BRANCH=3D"eglibc-2_16"
> --
> 1.7.9.7
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



