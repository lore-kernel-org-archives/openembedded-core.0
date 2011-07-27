Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qm99i-0007Yx-5i
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 20:48:30 +0200
Received: by ewy5 with SMTP id 5so1649499ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 11:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W4BzusK0p0VHFMEo3gZtBiwqvFzADKaWjxNTtNgbJM0=;
	b=klOjpgnozUfOWV7zrZMb5GZ3HvIPEqxc/UyvzjKakSuAOBV8rganaZLPtS4Yr4MM5F
	5uiFzU0Sy/SZSiwUSNZ+dddIDf2FVUMMphfzjwPVtBuDHqhZEuVPWsh0+kT92hEA/kjH
	b7QR0zyjzYzZXYI3Hh3UA6Xxd5yfXoNUb2a48=
Received: by 10.204.30.214 with SMTP id v22mr35983bkc.344.1311791829481;
	Wed, 27 Jul 2011 11:37:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w23sm41325bkf.61.2011.07.27.11.37.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 11:37:07 -0700 (PDT)
Date: Wed, 27 Jul 2011 20:36:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110727183656.GD15286@jama.jama.net>
References: <1311786077.30326.397.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1311786077.30326.397.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] glibc: deleted
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2011 18:48:30 -0000
X-Groupsio-MsgNum: 6896
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline

--d01dLTUuW90fS44H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2011 at 06:01:16PM +0100, Phil Blundell wrote:
> Glibc 2.10.1 is outdated now and eglibc seems to provide a superset of
> its functionality.
>=20
> Signed-off-by: Phil Blundell <philb@gnu.org>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> Resending as non-RFC since nobody objected to the idea.
>=20
>  meta/conf/distro/include/tclibc-glibc.inc          |   35 -
>  meta/conf/distro/include/tcmode-default.inc        |    5 -
>  .../glibc/glibc-2.10.1/arm-longlong.patch          |   60 --
>  .../glibc/glibc-2.10.1/arm-memcpy.patch            |  760 --------------=
------
>  .../glibc/glibc-2.10.1/dl-cache-libcmp.patch       |   12 -
>  .../recipes-core/glibc/glibc-2.10.1/etc/ld.so.conf |    2 -
>  .../glibc/glibc-2.10.1/fhs-linux-paths.patch       |   13 -
>  .../glibc/glibc-2.10.1/generate-supported.mk       |   11 -
>  .../glibc/glibc-2.10.1/generic-bits_select.h       |   35 -
>  .../glibc/glibc-2.10.1/generic-bits_time.h         |   75 --
>  .../glibc/glibc-2.10.1/generic-bits_types.h        |  200 -----
>  .../glibc/glibc-2.10.1/generic-bits_typesizes.h    |   66 --
>  .../glibc-2.9-enable-binutils-2.2.patch            |   37 -
>  .../glibc-arm-IO-acquire-lock-fix.diff             |   15 -
>  .../glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch |   17 -
>  .../glibc/glibc-2.10.1/glibc-check_pf.patch        |  345 ---------
>  .../glibc/glibc-2.10.1/ldd-unbash.patch            |   13 -
>  .../glibc/glibc-2.10.1/ldsocache-varrun.patch      |   20 -
>  .../glibc/glibc-2.10.1/march-i686.patch            |   39 -
>  .../glibc/glibc-2.10.1/mips-rld-map-check.patch    |   23 -
>  .../glibc/glibc-2.10.1/nptl-crosscompile.patch     |   28 -
>  .../glibc/glibc-2.10.1/nscd-init.patch             |   41 --
>  .../glibc/glibc-2.10.1/powerpc-sqrt-hack.diff      |   27 -
>  .../recipes-core/glibc/glibc-2.10.1/rulesfix.patch |   15 -
>  meta/recipes-core/glibc/glibc-initial.inc          |   67 --
>  meta/recipes-core/glibc/glibc-initial_2.10.1.bb    |   10 -
>  meta/recipes-core/glibc/glibc-locale_2.10.1.bb     |   63 --
>  meta/recipes-core/glibc/glibc-package.inc          |   96 ---
>  meta/recipes-core/glibc/glibc.inc                  |   60 --
>  meta/recipes-core/glibc/glibc_2.10.1.bb            |  161 -----
>  meta/recipes-core/glibc/site_config/funcs          |  474 ------------
>  meta/recipes-core/glibc/site_config/headers        |  156 ----
>  meta/recipes-core/glibc/site_config/types          |   21 -
>  33 files changed, 0 insertions(+), 3002 deletions(-)
>  delete mode 100644 meta/conf/distro/include/tclibc-glibc.inc
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/arm-longlong.pat=
ch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/arm-memcpy.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/dl-cache-libcmp.=
patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/etc/ld.so.conf
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/fhs-linux-paths.=
patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generate-support=
ed.mk
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bits_sel=
ect.h
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bits_tim=
e.h
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bits_typ=
es.h
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bits_typ=
esizes.h
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-2.9-enable=
-binutils-2.2.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-IO-acq=
uire-lock-fix.diff
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-no-asm=
-page.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.p=
atch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/ldd-unbash.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/ldsocache-varrun=
=2Epatch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/march-i686.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/mips-rld-map-che=
ck.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompil=
e.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/nscd-init.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/powerpc-sqrt-hac=
k.diff
>  delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/rulesfix.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc-initial.inc
>  delete mode 100644 meta/recipes-core/glibc/glibc-initial_2.10.1.bb
>  delete mode 100644 meta/recipes-core/glibc/glibc-locale_2.10.1.bb
>  delete mode 100644 meta/recipes-core/glibc/glibc-package.inc
>  delete mode 100644 meta/recipes-core/glibc/glibc-stage.inc
>  delete mode 100644 meta/recipes-core/glibc/glibc.inc
>  delete mode 100644 meta/recipes-core/glibc/glibc_2.10.1.bb
>  delete mode 100644 meta/recipes-core/glibc/site_config/funcs
>  delete mode 100644 meta/recipes-core/glibc/site_config/headers
>  delete mode 100644 meta/recipes-core/glibc/site_config/types
>=20
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro=
/include/tclibc-glibc.inc
> deleted file mode 100644
> index 0370dfa..0000000
> --- a/meta/conf/distro/include/tclibc-glibc.inc
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -#
> -# glibc specific configuration
> -#
> -
> -TARGET_OS =3D "linux"
> -TARGET_OS_arm =3D "linux-gnueabi"
> -TARGET_OS_armeb =3D "linux-gnueabi"
> -TARGET_OS_powerpc =3D "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU=
',d,1) in ['ppc-efd', 'ppc-efs']]}"
> -
> -# Add glibc to the overrides.
> -OVERRIDES =3D. "libc-glibc:"
> -
> -PREFERRED_PROVIDER_virtual/libiconv ?=3D "glibc"
> -PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?=3D "glibc-nativesdk"
> -PREFERRED_PROVIDER_virtual/libintl ?=3D "glibc"
> -PREFERRED_PROVIDER_virtual/libc ?=3D "glibc"
> -PREFERRED_PROVIDER_virtual/libc-nativesdk ?=3D "glibc-nativesdk"
> -PREFERRED_PROVIDER_virtual/libc-locale ?=3D "glibc-locale"
> -
> -CXXFLAGS +=3D "-fvisibility-inlines-hidden"
> -
> -LIBC_DEPENDENCIES =3D "\
> -    libsegfault \
> -    glibc \
> -    glibc-dbg \
> -    glibc-dev \
> -    glibc-utils \
> -    glibc-thread-db \
> -    glibc-localedata-i18n \
> -    glibc-gconv-ibm850 \
> -    glibc-gconv-cp1252 \
> -    glibc-gconv-iso8859-1 \
> -    glibc-gconv-iso8859-15 \
> -    locale-base-en-gb \
> -    "
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 86538f1..dce76db 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -49,11 +49,6 @@ PREFERRED_VERSION_binutils-crosssdk ?=3D "${BINUVERSIO=
N}"
>  PREFERRED_VERSION_binutils-cross-canadian ?=3D "${BINUVERSION}"
>  PREFERRED_VERSION_linux-libc-headers ?=3D "${LINUXLIBCVERSION}"
>  PREFERRED_VERSION_linux-libc-headers-nativesdk ?=3D "${LINUXLIBCVERSION}"
> -PREFERRED_VERSION_glibc ?=3D "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-locale ?=3D "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-nativesdk ?=3D "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-initial ?=3D "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-initial-nativesdk ?=3D "${GLIBCVERSION}"
>  PREFERRED_VERSION_eglibc                   ?=3D "${EGLIBCVERSION}"
>  PREFERRED_VERSION_eglibc-locale            ?=3D "${EGLIBCVERSION}"
>  PREFERRED_VERSION_eglibc-nativesdk         ?=3D "${EGLIBCVERSION}"
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch b/me=
ta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch
> deleted file mode 100644
> index ce67d7e..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> ---- glibc-2.4/stdlib/longlong.h.ark	2006-03-11 22:49:27.000000000 +0100
> -+++ glibc-2.4/stdlib/longlong.h	2006-03-11 22:55:12.000000000 +0100
> -@@ -206,6 +206,14 @@
> - 	     "rI" ((USItype) (bh)),					\
> - 	     "r" ((USItype) (al)),					\
> - 	     "rI" ((USItype) (bl)) __CLOBBER_CC)
> -+/* v3m and all higher arches have long multiply support.  */
> -+#if !defined(__ARM_ARCH_2__) && !defined(__ARM_ARCH_3__)
> -+#define umul_ppmm(xh, xl, a, b) \
> -+  __asm__ ("umull %0,%1,%2,%3" : "=3D&r" (xl), "=3D&r" (xh) : "r" (a), =
"r" (b))
> -+#define UMUL_TIME 5
> -+#define smul_ppmm(xh, xl, a, b) \
> -+  __asm__ ("smull %0,%1,%2,%3" : "=3D&r" (xl), "=3D&r" (xh) : "r" (a), =
"r" (b))
> -+#else							  =20
> - #define umul_ppmm(xh, xl, a, b) \
> - {register USItype __t0, __t1, __t2;					\
> -   __asm__ ("%@ Inlined umul_ppmm\n"					\
> -@@ -227,7 +235,13 @@
> - 	   : "r" ((USItype) (a)),					\
> - 	     "r" ((USItype) (b)) __CLOBBER_CC );}
> - #define UMUL_TIME 20
> -+#endif
> - #define UDIV_TIME 100
> -+#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || defined(__AR=
M_ARCH_5TE__)
> -+#define count_leading_zeros(COUNT,X)   ((COUNT) =3D __builtin_clz (X))
> -+#define COUNT_LEADING_ZEROS_0 32
> -+#endif
> -+							  =20
> - #endif /* __arm__ */
> -=20
> - #if defined (__hppa) && W_TYPE_SIZE =3D=3D 32
> ---- glibc-2.4/ports/sysdeps/arm/mp_clz_tab.c.ark	2006-03-11 22:56:43.000=
000000 +0100
> -+++ glibc-2.4/ports/sysdeps/arm/mp_clz_tab.c	2006-03-11 22:58:19.0000000=
00 +0100
> -@@ -0,0 +1,24 @@
> -+/* __clz_tab -- support for longlong.h
> -+   Copyright (C) 2004 Free Software Foundation, Inc.
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
> -+#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || defined(__AR=
M_ARCH_5TE__)
> -+/* Nothing required.  */
> -+#else
> -+#include <stdlib/mp_clz_tab.c>
> -+#endif
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/arm-memcpy.patch b/meta=
/recipes-core/glibc/glibc-2.10.1/arm-memcpy.patch
> deleted file mode 100644
> index f50d481..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/arm-memcpy.patch
> +++ /dev/null
> @@ -1,760 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> ---- /dev/null	2004-02-02 20:32:13.000000000 +0000
> -+++ sysdeps/arm/memmove.S	2004-03-20 18:37:23.000000000 +0000
> -@@ -0,0 +1,251 @@
> -+/*
> -+ *   Optimized memmove implementation for ARM processors
> -+ *
> -+ *	Author: 	Nicolas Pitre
> -+ *	Created:	Dec 23, 2003
> -+ *	Copyright:	(C) MontaVista Software, Inc.
> -+ *
> -+ *   This file is free software; you can redistribute it and/or
> -+ *   modify it under the terms of the GNU Lesser General Public
> -+ *   License as published by the Free Software Foundation; either
> -+ *   version 2.1 of the License, or (at your option) any later version.
> -+ *
> -+ *   This file is distributed in the hope that it will be useful,
> -+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+ *   Lesser General Public License for more details.
> -+ */
> -+
> -+#include <sysdep.h>
> -+
> -+
> -+/*
> -+ * Endian independent macros for shifting bytes within registers.
> -+ */
> -+#ifndef __ARMEB__
> -+#define pull            lsr
> -+#define push            lsl
> -+#else
> -+#define pull            lsl
> -+#define push            lsr
> -+#endif
> -+
> -+/*
> -+ * Enable data preload for architectures that support it (ARMv5 and abo=
ve)
> -+ */
> -+#if defined(__ARM_ARCH_5__) || \
> -+    defined(__ARM_ARCH_5T__) || \
> -+    defined(__ARM_ARCH_5TE__)
> -+#define PLD(code...)	code
> -+#else
> -+#define PLD(code...)
> -+#endif
> -+
> -+
> -+/* char * memmove (char *dst, const char *src) */
> -+ENTRY(memmove)
> -+		subs	ip, r0, r1
> -+		cmphi	r2, ip
> -+		bls	memcpy(PLT)
> -+
> -+		stmfd	sp!, {r0, r4, lr}
> -+		add	r1, r1, r2
> -+		add	r0, r0, r2
> -+		subs	r2, r2, #4
> -+		blt	25f
> -+		ands	ip, r0, #3
> -+	PLD(	pld	[r1, #-4]		)
> -+		bne	26f
> -+		ands	ip, r1, #3
> -+		bne	27f
> -+
> -+19:		subs	r2, r2, #4
> -+		blt	24f
> -+		subs	r2, r2, #8
> -+		blt	23f
> -+		subs	r2, r2, #16
> -+		blt	22f
> -+
> -+	PLD(	pld	[r1, #-32]		)
> -+	PLD(	subs	r2, r2, #96		)
> -+		stmfd	sp!, {r5 - r8}
> -+	PLD(	blt	21f			)
> -+
> -+	PLD(	@ cache alignment		)
> -+	PLD(	ands	ip, r1, #31		)
> -+	PLD(	pld	[r1, #-64]		)
> -+	PLD(	beq	20f			)
> -+	PLD(	cmp	r2, ip			)
> -+	PLD(	pld	[r1, #-96]		)
> -+	PLD(	blt	20f			)
> -+	PLD(	cmp	ip, #16			)
> -+	PLD(	sub	r2, r2, ip		)
> -+	PLD(	ldmgedb	r1!, {r3 - r6}		)
> -+	PLD(	stmgedb	r0!, {r3 - r6}		)
> -+	PLD(	beq	20f			)
> -+	PLD(	and	ip, ip, #15		)
> -+	PLD(	cmp	ip, #8			)
> -+	PLD(	ldr	r3, [r1, #-4]!		)
> -+	PLD(	ldrge	r4, [r1, #-4]!		)
> -+	PLD(	ldrgt	r5, [r1, #-4]!		)
> -+	PLD(	str	r3, [r0, #-4]!		)
> -+	PLD(	strge	r4, [r0, #-4]!		)
> -+	PLD(	strgt	r5, [r0, #-4]!		)
> -+
> -+20:	PLD(	pld	[r1, #-96]		)
> -+	PLD(	pld	[r1, #-128]		)
> -+21:		ldmdb	r1!, {r3, r4, ip, lr}
> -+		subs	r2, r2, #32
> -+		stmdb	r0!, {r3, r4, ip, lr}
> -+		ldmdb	r1!, {r3, r4, ip, lr}
> -+		stmgedb	r0!, {r3, r4, ip, lr}
> -+		ldmgedb	r1!, {r3, r4, ip, lr}
> -+		stmgedb	r0!, {r3, r4, ip, lr}
> -+		ldmgedb	r1!, {r3, r4, ip, lr}
> -+		subges	r2, r2, #32
> -+		stmdb	r0!, {r3, r4, ip, lr}
> -+		bge	20b
> -+	PLD(	cmn	r2, #96			)
> -+	PLD(	bge	21b			)
> -+	PLD(	add	r2, r2, #96		)
> -+		tst	r2, #31
> -+		ldmfd	sp!, {r5 - r8}
> -+		ldmeqfd	sp!, {r0, r4, pc}
> -+
> -+		tst	r2, #16
> -+22:		ldmnedb	r1!, {r3, r4, ip, lr}
> -+		stmnedb	r0!, {r3, r4, ip, lr}
> -+
> -+		tst	r2, #8
> -+23:		ldmnedb	r1!, {r3, r4}
> -+		stmnedb	r0!, {r3, r4}
> -+
> -+		tst	r2, #4
> -+24:		ldrne	r3, [r1, #-4]!
> -+		strne	r3, [r0, #-4]!
> -+
> -+25:		ands	r2, r2, #3
> -+		ldmeqfd	sp!, {r0, r4, pc}
> -+
> -+		cmp	r2, #2
> -+		ldrb	r3, [r1, #-1]
> -+		ldrgeb	r4, [r1, #-2]
> -+		ldrgtb	ip, [r1, #-3]
> -+		strb	r3, [r0, #-1]
> -+		strgeb	r4, [r0, #-2]
> -+		strgtb	ip, [r0, #-3]
> -+		ldmfd	sp!, {r0, r4, pc}
> -+
> -+26:		cmp	ip, #2
> -+		ldrb	r3, [r1, #-1]!
> -+		ldrgeb	r4, [r1, #-1]!
> -+		ldrgtb	lr, [r1, #-1]!
> -+		strb	r3, [r0, #-1]!
> -+		strgeb	r4, [r0, #-1]!
> -+		strgtb	lr, [r0, #-1]!
> -+		subs	r2, r2, ip
> -+		blt	25b
> -+		ands	ip, r1, #3
> -+		beq	19b
> -+
> -+27:		bic	r1, r1, #3
> -+		cmp	ip, #2
> -+		ldr	r3, [r1]
> -+		beq	35f
> -+		blt	36f
> -+
> -+
> -+		.macro	backward_copy_shift push pull
> -+
> -+		cmp	r2, #12
> -+	PLD(	pld	[r1, #-4]		)
> -+		blt	33f
> -+		subs	r2, r2, #28
> -+		stmfd	sp!, {r5 - r9}
> -+		blt	31f
> -+
> -+	PLD(	subs	r2, r2, #96		)
> -+	PLD(	pld	[r1, #-32]		)
> -+	PLD(	blt	30f			)
> -+	PLD(	pld	[r1, #-64]		)
> -+
> -+	PLD(	@ cache alignment		)
> -+	PLD(	ands	ip, r1, #31		)
> -+	PLD(	pld	[r1, #-96]		)
> -+	PLD(	beq	29f			)
> -+	PLD(	cmp	r2, ip			)
> -+	PLD(	pld	[r1, #-128]		)
> -+	PLD(	blt	29f			)
> -+	PLD(	sub	r2, r2, ip		)
> -+28:	PLD(	mov	r4, r3, push #\push	)
> -+	PLD(	ldr	r3, [r1, #-4]!		)
> -+	PLD(	subs	ip, ip, #4		)
> -+	PLD(	orr	r4, r4, r3, pull #\pull	)
> -+	PLD(	str	r4, [r0, #-4]!		)
> -+	PLD(	bgt	28b			)
> -+
> -+29:	PLD(	pld	[r1, #-128]		)
> -+30:		mov	lr, r3, push #\push
> -+		ldmdb	r1!, {r3 - r9, ip}
> -+		subs	r2, r2, #32
> -+		orr	lr, lr, ip, pull #\pull
> -+		mov	ip, ip, push #\push
> -+		orr	ip, ip, r9, pull #\pull
> -+		mov	r9, r9, push #\push
> -+		orr	r9, r9, r8, pull #\pull
> -+		mov	r8, r8, push #\push
> -+		orr	r8, r8, r7, pull #\pull
> -+		mov	r7, r7, push #\push
> -+		orr	r7, r7, r6, pull #\pull
> -+		mov	r6, r6, push #\push
> -+		orr	r6, r6, r5, pull #\pull
> -+		mov	r5, r5, push #\push
> -+		orr	r5, r5, r4, pull #\pull
> -+		mov	r4, r4, push #\push
> -+		orr	r4, r4, r3, pull #\pull
> -+		stmdb	r0!, {r4 - r9, ip, lr}
> -+		bge	29b
> -+	PLD(	cmn	r2, #96			)
> -+	PLD(	bge	30b			)
> -+	PLD(	add	r2, r2, #96		)
> -+		cmn	r2, #16
> -+		blt	32f
> -+31:		mov	r7, r3, push #\push
> -+		ldmdb	r1!, {r3 - r6}
> -+		sub	r2, r2, #16
> -+		orr	r7, r7, r6, pull #\pull
> -+		mov	r6, r6, push #\push
> -+		orr	r6, r6, r5, pull #\pull
> -+		mov	r5, r5, push #\push
> -+		orr	r5, r5, r4, pull #\pull
> -+		mov	r4, r4, push #\push
> -+		orr	r4, r4, r3, pull #\pull
> -+		stmdb	r0!, {r4 - r7}
> -+32:		adds	r2, r2, #28
> -+		ldmfd	sp!, {r5 - r9}
> -+		blt	34f
> -+33:		mov	r4, r3, push #\push
> -+		ldr	r3, [r1, #-4]!
> -+		subs	r2, r2, #4
> -+		orr	r4, r4, r3, pull #\pull
> -+		str	r4, [r0, #-4]!
> -+		bge	33b
> -+34:
> -+		.endm
> -+
> -+
> -+		backward_copy_shift	push=3D8	pull=3D24
> -+		add	r1, r1, #3
> -+		b	25b
> -+
> -+35:		backward_copy_shift	push=3D16	pull=3D16
> -+		add	r1, r1, #2
> -+		b	25b
> -+
> -+36:		backward_copy_shift	push=3D24	pull=3D8
> -+		add	r1, r1, #1
> -+		b	25b
> -+
> -+		.size	memmove, . - memmove
> -+END(memmove)
> -+libc_hidden_builtin_def (memmove)
> ---- /dev/null	2004-02-02 20:32:13.000000000 +0000
> -+++ sysdeps/arm/bcopy.S	2004-03-20 18:37:48.000000000 +0000
> -@@ -0,0 +1,255 @@
> -+/*
> -+ *   Optimized memmove implementation for ARM processors
> -+ *
> -+ *	Author: 	Nicolas Pitre
> -+ *	Created:	Dec 23, 2003
> -+ *	Copyright:	(C) MontaVista Software, Inc.
> -+ *
> -+ *   This file is free software; you can redistribute it and/or
> -+ *   modify it under the terms of the GNU Lesser General Public
> -+ *   License as published by the Free Software Foundation; either
> -+ *   version 2.1 of the License, or (at your option) any later version.
> -+ *
> -+ *   This file is distributed in the hope that it will be useful,
> -+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+ *   Lesser General Public License for more details.
> -+ */
> -+
> -+#include <sysdep.h>
> -+
> -+
> -+/*
> -+ * Endian independent macros for shifting bytes within registers.
> -+ */
> -+#ifndef __ARMEB__
> -+#define pull            lsr
> -+#define push            lsl
> -+#else
> -+#define pull            lsl
> -+#define push            lsr
> -+#endif
> -+
> -+/*
> -+ * Enable data preload for architectures that support it (ARMv5 and abo=
ve)
> -+ */
> -+#if defined(__ARM_ARCH_5__) || \
> -+    defined(__ARM_ARCH_5T__) || \
> -+    defined(__ARM_ARCH_5TE__)
> -+#define PLD(code...)	code
> -+#else
> -+#define PLD(code...)
> -+#endif
> -+
> -+dst		.req	r1
> -+src		.req	r0
> -+
> -+/* void *bcopy (const char *src, char *dst, size_t size) */
> -+ENTRY(bcopy)
> -+		subs	ip, dst, src
> -+		cmphi	r2, ip
> -+		movls	r3, r0
> -+		movls	r0, r1
> -+		movls	r1, r3
> -+		bls	memcpy(PLT)
> -+
> -+		stmfd	sp!, {r4, lr}
> -+		add	src, src, r2
> -+		add	dst, dst, r2
> -+		subs	r2, r2, #4
> -+		blt	25f
> -+		ands	ip, dst, #3
> -+	PLD(	pld	[src, #-4]		)
> -+		bne	26f
> -+		ands	ip, src, #3
> -+		bne	27f
> -+
> -+19:		subs	r2, r2, #4
> -+		blt	24f
> -+		subs	r2, r2, #8
> -+		blt	23f
> -+		subs	r2, r2, #16
> -+		blt	22f
> -+
> -+	PLD(	pld	[src, #-32]		)
> -+	PLD(	subs	r2, r2, #96		)
> -+		stmfd	sp!, {r5 - r8}
> -+	PLD(	blt	21f			)
> -+
> -+	PLD(	@ cache alignment		)
> -+	PLD(	ands	ip, src, #31		)
> -+	PLD(	pld	[src, #-64]		)
> -+	PLD(	beq	20f			)
> -+	PLD(	cmp	r2, ip			)
> -+	PLD(	pld	[src, #-96]		)
> -+	PLD(	blt	20f			)
> -+	PLD(	cmp	ip, #16			)
> -+	PLD(	sub	r2, r2, ip		)
> -+	PLD(	ldmgedb	src!, {r3 - r6}		)
> -+	PLD(	stmgedb	dst!, {r3 - r6}		)
> -+	PLD(	beq	20f			)
> -+	PLD(	and	ip, ip, #15		)
> -+	PLD(	cmp	ip, #8			)
> -+	PLD(	ldr	r3, [src, #-4]!		)
> -+	PLD(	ldrge	r4, [src, #-4]!		)
> -+	PLD(	ldrgt	r5, [src, #-4]!		)
> -+	PLD(	str	r3, [dst, #-4]!		)
> -+	PLD(	strge	r4, [dst, #-4]!		)
> -+	PLD(	strgt	r5, [dst, #-4]!		)
> -+
> -+20:	PLD(	pld	[src, #-96]		)
> -+	PLD(	pld	[src, #-128]		)
> -+21:		ldmdb	src!, {r3, r4, ip, lr}
> -+		subs	r2, r2, #32
> -+		stmdb	dst!, {r3, r4, ip, lr}
> -+		ldmdb	src!, {r3, r4, ip, lr}
> -+		stmgedb	dst!, {r3, r4, ip, lr}
> -+		ldmgedb	src!, {r3, r4, ip, lr}
> -+		stmgedb	dst!, {r3, r4, ip, lr}
> -+		ldmgedb	src!, {r3, r4, ip, lr}
> -+		subges	r2, r2, #32
> -+		stmdb	dst!, {r3, r4, ip, lr}
> -+		bge	20b
> -+	PLD(	cmn	r2, #96			)
> -+	PLD(	bge	21b			)
> -+	PLD(	add	r2, r2, #96		)
> -+		tst	r2, #31
> -+		ldmfd	sp!, {r5 - r8}
> -+		ldmeqfd	sp!, {r4, pc}
> -+
> -+		tst	r2, #16
> -+22:		ldmnedb	src!, {r3, r4, ip, lr}
> -+		stmnedb	dst!, {r3, r4, ip, lr}
> -+
> -+		tst	r2, #8
> -+23:		ldmnedb	src!, {r3, r4}
> -+		stmnedb	dst!, {r3, r4}
> -+
> -+		tst	r2, #4
> -+24:		ldrne	r3, [src, #-4]!
> -+		strne	r3, [dst, #-4]!
> -+
> -+25:		ands	r2, r2, #3
> -+		ldmeqfd	sp!, {dst, r4, pc}
> -+
> -+		cmp	r2, #2
> -+		ldrb	r3, [src, #-1]
> -+		ldrgeb	r4, [src, #-2]
> -+		ldrgtb	ip, [src, #-3]
> -+		strb	r3, [dst, #-1]
> -+		strgeb	r4, [dst, #-2]
> -+		strgtb	ip, [dst, #-3]
> -+		ldmfd	sp!, {dst, r4, pc}
> -+
> -+26:		cmp	ip, #2
> -+		ldrb	r3, [src, #-1]!
> -+		ldrgeb	r4, [src, #-1]!
> -+		ldrgtb	lr, [src, #-1]!
> -+		strb	r3, [dst, #-1]!
> -+		strgeb	r4, [dst, #-1]!
> -+		strgtb	lr, [dst, #-1]!
> -+		subs	r2, r2, ip
> -+		blt	25b
> -+		ands	ip, src, #3
> -+		beq	19b
> -+
> -+27:		bic	src, src, #3
> -+		cmp	ip, #2
> -+		ldr	r3, [src]
> -+		beq	35f
> -+		blt	36f
> -+
> -+
> -+		.macro	backward_copy_shift push pull
> -+
> -+		cmp	r2, #12
> -+	PLD(	pld	[src, #-4]		)
> -+		blt	33f
> -+		subs	r2, r2, #28
> -+		stmfd	sp!, {r5 - r9}
> -+		blt	31f
> -+
> -+	PLD(	subs	r2, r2, #96		)
> -+	PLD(	pld	[src, #-32]		)
> -+	PLD(	blt	30f			)
> -+	PLD(	pld	[src, #-64]		)
> -+
> -+	PLD(	@ cache alignment		)
> -+	PLD(	ands	ip, src, #31		)
> -+	PLD(	pld	[src, #-96]		)
> -+	PLD(	beq	29f			)
> -+	PLD(	cmp	r2, ip			)
> -+	PLD(	pld	[src, #-128]		)
> -+	PLD(	blt	29f			)
> -+	PLD(	sub	r2, r2, ip		)
> -+28:	PLD(	mov	r4, r3, push #\push	)
> -+	PLD(	ldr	r3, [src, #-4]!		)
> -+	PLD(	subs	ip, ip, #4		)
> -+	PLD(	orr	r4, r4, r3, pull #\pull	)
> -+	PLD(	str	r4, [dst, #-4]!		)
> -+	PLD(	bgt	28b			)
> -+
> -+29:	PLD(	pld	[src, #-128]		)
> -+30:		mov	lr, r3, push #\push
> -+		ldmdb	src!, {r3 - r9, ip}
> -+		subs	r2, r2, #32
> -+		orr	lr, lr, ip, pull #\pull
> -+		mov	ip, ip, push #\push
> -+		orr	ip, ip, r9, pull #\pull
> -+		mov	r9, r9, push #\push
> -+		orr	r9, r9, r8, pull #\pull
> -+		mov	r8, r8, push #\push
> -+		orr	r8, r8, r7, pull #\pull
> -+		mov	r7, r7, push #\push
> -+		orr	r7, r7, r6, pull #\pull
> -+		mov	r6, r6, push #\push
> -+		orr	r6, r6, r5, pull #\pull
> -+		mov	r5, r5, push #\push
> -+		orr	r5, r5, r4, pull #\pull
> -+		mov	r4, r4, push #\push
> -+		orr	r4, r4, r3, pull #\pull
> -+		stmdb	dst!, {r4 - r9, ip, lr}
> -+		bge	29b
> -+	PLD(	cmn	r2, #96			)
> -+	PLD(	bge	30b			)
> -+	PLD(	add	r2, r2, #96		)
> -+		cmn	r2, #16
> -+		blt	32f
> -+31:		mov	r7, r3, push #\push
> -+		ldmdb	src!, {r3 - r6}
> -+		sub	r2, r2, #16
> -+		orr	r7, r7, r6, pull #\pull
> -+		mov	r6, r6, push #\push
> -+		orr	r6, r6, r5, pull #\pull
> -+		mov	r5, r5, push #\push
> -+		orr	r5, r5, r4, pull #\pull
> -+		mov	r4, r4, push #\push
> -+		orr	r4, r4, r3, pull #\pull
> -+		stmdb	dst!, {r4 - r7}
> -+32:		adds	r2, r2, #28
> -+		ldmfd	sp!, {r5 - r9}
> -+		blt	34f
> -+33:		mov	r4, r3, push #\push
> -+		ldr	r3, [src, #-4]!
> -+		subs	r2, r2, #4
> -+		orr	r4, r4, r3, pull #\pull
> -+		str	r4, [dst, #-4]!
> -+		bge	33b
> -+34:
> -+		.endm
> -+
> -+
> -+		backward_copy_shift	push=3D8	pull=3D24
> -+		add	src, src, #3
> -+		b	25b
> -+
> -+35:		backward_copy_shift	push=3D16	pull=3D16
> -+		add	src, src, #2
> -+		b	25b
> -+
> -+36:		backward_copy_shift	push=3D24	pull=3D8
> -+		add	src, src, #1
> -+		b	25b
> -+
> -+		.size	bcopy, . - bcopy
> -+END(bcopy)
> -
> ---- /dev/null	2004-02-02 20:32:13.000000000 +0000
> -+++ sysdeps/arm/memcpy.S	2004-05-02 14:33:22.000000000 +0100
> -@@ -0,0 +1,242 @@
> -+/*
> -+ *   Optimized memcpy implementation for ARM processors
> -+ *
> -+ *	Author: 	Nicolas Pitre
> -+ *	Created:	Dec 23, 2003
> -+ *	Copyright:	(C) MontaVista Software, Inc.
> -+ *
> -+ *   This file is free software; you can redistribute it and/or
> -+ *   modify it under the terms of the GNU Lesser General Public
> -+ *   License as published by the Free Software Foundation; either
> -+ *   version 2.1 of the License, or (at your option) any later version.
> -+ *
> -+ *   This file is distributed in the hope that it will be useful,
> -+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+ *   Lesser General Public License for more details.
> -+ */
> -+
> -+#include <sysdep.h>
> -+
> -+
> -+/*
> -+ * Endian independent macros for shifting bytes within registers.
> -+ */
> -+#ifndef __ARMEB__
> -+#define pull            lsr
> -+#define push            lsl
> -+#else
> -+#define pull            lsl
> -+#define push            lsr
> -+#endif
> -+
> -+/*
> -+ * Enable data preload for architectures that support it (ARMv5 and abo=
ve)
> -+ */
> -+#if defined(__ARM_ARCH_5__) || \
> -+    defined(__ARM_ARCH_5T__) || \
> -+    defined(__ARM_ARCH_5TE__)
> -+#define PLD(code...)	code
> -+#else
> -+#define PLD(code...)
> -+#endif
> -+
> -+
> -+/* char * memcpy (char *dst, const char *src) */
> -+
> -+ENTRY(memcpy)
> -+		subs	r2, r2, #4
> -+		stmfd	sp!, {r0, r4, lr}
> -+		blt	7f
> -+		ands	ip, r0, #3
> -+	PLD(	pld	[r1, #0]		)
> -+		bne	8f
> -+		ands	ip, r1, #3
> -+		bne	9f
> -+
> -+1:		subs	r2, r2, #4
> -+		blt	6f
> -+		subs	r2, r2, #8
> -+		blt	5f
> -+		subs	r2, r2, #16
> -+		blt	4f
> -+
> -+	PLD(	subs	r2, r2, #65		)
> -+		stmfd	sp!, {r5 - r8}
> -+	PLD(	blt	3f			)
> -+	PLD(	pld	[r1, #32]		)
> -+
> -+	PLD(	@ cache alignment		)
> -+	PLD(	ands	ip, r1, #31		)
> -+	PLD(	pld	[r1, #64]		)
> -+	PLD(	beq	2f			)
> -+	PLD(	rsb	ip, ip, #32		)
> -+	PLD(	cmp	r2, ip			)
> -+	PLD(	pld	[r1, #96]		)
> -+	PLD(	blt	2f			)
> -+	PLD(	cmp	ip, #16			)
> -+	PLD(	sub	r2, r2, ip		)
> -+	PLD(	ldmgeia	r1!, {r3 - r6}		)
> -+	PLD(	stmgeia	r0!, {r3 - r6}		)
> -+	PLD(	beq	2f			)
> -+	PLD(	and	ip, ip, #15		)
> -+	PLD(	cmp	ip, #8			)
> -+	PLD(	ldr	r3, [r1], #4		)
> -+	PLD(	ldrge	r4, [r1], #4		)
> -+	PLD(	ldrgt	r5, [r1], #4		)
> -+	PLD(	str	r3, [r0], #4		)
> -+	PLD(	strge	r4, [r0], #4		)
> -+	PLD(	strgt	r5, [r0], #4		)
> -+
> -+2:	PLD(	pld	[r1, #96]		)
> -+3:		ldmia	r1!, {r3 - r8, ip, lr}
> -+		subs	r2, r2, #32
> -+		stmia	r0!, {r3 - r8, ip, lr}
> -+		bge	2b
> -+	PLD(	cmn	r2, #65			)
> -+	PLD(	bge	3b			)
> -+	PLD(	add	r2, r2, #65		)
> -+		tst	r2, #31
> -+		ldmfd	sp!, {r5 - r8}
> -+		ldmeqfd	sp!, {r0, r4, pc}
> -+
> -+		tst	r2, #16
> -+4:		ldmneia	r1!, {r3, r4, ip, lr}
> -+		stmneia	r0!, {r3, r4, ip, lr}
> -+
> -+		tst	r2, #8
> -+5:		ldmneia	r1!, {r3, r4}
> -+		stmneia	r0!, {r3, r4}
> -+
> -+		tst	r2, #4
> -+6:		ldrne	r3, [r1], #4
> -+		strne	r3, [r0], #4
> -+
> -+7:		ands	r2, r2, #3
> -+		ldmeqfd	sp!, {r0, r4, pc}
> -+
> -+		cmp	r2, #2
> -+		ldrb	r3, [r1], #1
> -+		ldrgeb	r4, [r1], #1
> -+		ldrgtb	ip, [r1]
> -+		strb	r3, [r0], #1
> -+		strgeb	r4, [r0], #1
> -+		strgtb	ip, [r0]
> -+		ldmfd	sp!, {r0, r4, pc}
> -+
> -+8:		rsb	ip, ip, #4
> -+		cmp	ip, #2
> -+		ldrb	r3, [r1], #1
> -+		ldrgeb	r4, [r1], #1
> -+		ldrgtb	lr, [r1], #1
> -+		strb	r3, [r0], #1
> -+		strgeb	r4, [r0], #1
> -+		strgtb	lr, [r0], #1
> -+		subs	r2, r2, ip
> -+		blt	7b
> -+		ands	ip, r1, #3
> -+		beq	1b
> -+
> -+9:		bic	r1, r1, #3
> -+		cmp	ip, #2
> -+		ldr	lr, [r1], #4
> -+		beq	17f
> -+		bgt	18f
> -+
> -+
> -+		.macro	forward_copy_shift pull push
> -+
> -+		cmp	r2, #12
> -+	PLD(	pld	[r1, #0]		)
> -+		blt	15f
> -+		subs	r2, r2, #28
> -+		stmfd	sp!, {r5 - r9}
> -+		blt	13f
> -+
> -+	PLD(	subs	r2, r2, #97		)
> -+	PLD(	blt	12f			)
> -+	PLD(	pld	[r1, #32]		)
> -+
> -+	PLD(	@ cache alignment		)
> -+	PLD(	rsb	ip, r1, #36		)
> -+	PLD(	pld	[r1, #64]		)
> -+	PLD(	ands	ip, ip, #31		)
> -+	PLD(	pld	[r1, #96]		)
> -+	PLD(	beq	11f			)
> -+	PLD(	cmp	r2, ip			)
> -+	PLD(	pld	[r1, #128]		)
> -+	PLD(	blt	11f			)
> -+	PLD(	sub	r2, r2, ip		)
> -+10:	PLD(	mov	r3, lr, pull #\pull	)
> -+	PLD(	ldr	lr, [r1], #4		)
> -+	PLD(	subs	ip, ip, #4		)
> -+	PLD(	orr	r3, r3, lr, push #\push	)
> -+	PLD(	str	r3, [r0], #4		)
> -+	PLD(	bgt	10b			)
> -+
> -+11:	PLD(	pld	[r1, #128]		)
> -+12:		mov	r3, lr, pull #\pull
> -+		ldmia	r1!, {r4 - r9, ip, lr}
> -+		subs	r2, r2, #32
> -+		orr	r3, r3, r4, push #\push
> -+		mov	r4, r4, pull #\pull
> -+		orr	r4, r4, r5, push #\push
> -+		mov	r5, r5, pull #\pull
> -+		orr	r5, r5, r6, push #\push
> -+		mov	r6, r6, pull #\pull
> -+		orr	r6, r6, r7, push #\push
> -+		mov	r7, r7, pull #\pull
> -+		orr	r7, r7, r8, push #\push
> -+		mov	r8, r8, pull #\pull
> -+		orr	r8, r8, r9, push #\push
> -+		mov	r9, r9, pull #\pull
> -+		orr	r9, r9, ip, push #\push
> -+		mov	ip, ip, pull #\pull
> -+		orr	ip, ip, lr, push #\push
> -+		stmia	r0!, {r3 - r9, ip}
> -+		bge	11b
> -+	PLD(	cmn	r2, #97			)
> -+	PLD(	bge	12b			)
> -+	PLD(	add	r2, r2, #97		)
> -+		cmn	r2, #16
> -+		blt	14f
> -+13:		mov	r3, lr, pull #\pull
> -+		ldmia	r1!, {r4 - r6, lr}
> -+		sub	r2, r2, #16
> -+		orr	r3, r3, r4, push #\push
> -+		mov	r4, r4, pull #\pull
> -+		orr	r4, r4, r5, push #\push
> -+		mov	r5, r5, pull #\pull
> -+		orr	r5, r5, r6, push #\push
> -+		mov	r6, r6, pull #\pull
> -+		orr	r6, r6, lr, push #\push
> -+		stmia	r0!, {r3 - r6}
> -+14:		adds	r2, r2, #28
> -+		ldmfd	sp!, {r5 - r9}
> -+		blt	16f
> -+15:		mov	r3, lr, pull #\pull
> -+		ldr	lr, [r1], #4
> -+		subs	r2, r2, #4
> -+		orr	r3, r3, lr, push #\push
> -+		str	r3, [r0], #4
> -+		bge	15b
> -+16:
> -+		.endm
> -+
> -+
> -+		forward_copy_shift	pull=3D8	push=3D24
> -+		sub	r1, r1, #3
> -+		b	7b
> -+
> -+17:		forward_copy_shift	pull=3D16	push=3D16
> -+		sub	r1, r1, #2
> -+		b	7b
> -+
> -+18:		forward_copy_shift	pull=3D24	push=3D8
> -+		sub	r1, r1, #1
> -+		b	7b
> -+
> -+		.size	memcpy, . - memcpy
> -+END(memcpy)
> -+libc_hidden_builtin_def (memcpy)
> -+
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/dl-cache-libcmp.patch b=
/meta/recipes-core/glibc/glibc-2.10.1/dl-cache-libcmp.patch
> deleted file mode 100644
> index 199aaa6..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/dl-cache-libcmp.patch
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> ---- glibc-2.4/elf/Versions.ark	2006-03-11 23:30:09.000000000 +0100
> -+++ glibc-2.4/elf/Versions	2006-03-11 23:31:44.000000000 +0100
> -@@ -63,5 +63,7 @@
> -     _dl_debug_state;
> -     # Pointer protection.
> -     __pointer_chk_guard;
> -+    # for ldconfig
> -+    _dl_cache_libcmp;
> -   }
> - }
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/etc/ld.so.conf b/meta/r=
ecipes-core/glibc/glibc-2.10.1/etc/ld.so.conf
> deleted file mode 100644
> index ddd777d..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/etc/ld.so.conf
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/usr/local/lib
> -include /etc/ld.so.conf.d/*
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/fhs-linux-paths.patch b=
/meta/recipes-core/glibc/glibc-2.10.1/fhs-linux-paths.patch
> deleted file mode 100644
> index 91c6781..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/fhs-linux-paths.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> ---- glibc-2.1.1/sysdeps/unix/sysv/linux/paths.h~	Thu May 27 13:16:33 1999
> -+++ glibc-2.1.1/sysdeps/unix/sysv/linux/paths.h	Thu May 27 13:17:55 1999
> -@@ -71,7 +71,7 @@
> - /* Provide trailing slash, since mostly used for building pathnames. */
> - #define	_PATH_DEV	"/dev/"
> - #define	_PATH_TMP	"/tmp/"
> --#define	_PATH_VARDB	"/var/db/"
> -+#define	_PATH_VARDB	"/var/lib/misc/"
> - #define	_PATH_VARRUN	"/var/run/"
> - #define	_PATH_VARTMP	"/var/tmp/"
> -=20
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/generate-supported.mk b=
/meta/recipes-core/glibc/glibc-2.10.1/generate-supported.mk
> deleted file mode 100644
> index d2a28c2..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/generate-supported.mk
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#!/usr/bin/make
> -
> -include $(IN)
> -
> -all:
> -	rm -f $(OUT)
> -	touch $(OUT)
> -	for locale in $(SUPPORTED-LOCALES); do \
> -		[ $$locale =3D true ] && continue; \
> -		echo $$locale | sed 's,/, ,' >> $(OUT); \
> -	done
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_select.h b=
/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_select.h
> deleted file mode 100644
> index 47e7ded..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_select.h
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -/* Copyright (C) 1997, 1998, 2001 Free Software Foundation, Inc.
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public
> -   License as published by the Free Software Foundation; either
> -   version 2.1 of the License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, write to the Free
> -   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -   02111-1307 USA.  */
> -
> -#ifndef _SYS_SELECT_H
> -# error "Never use <bits/select.h> directly; include <sys/select.h> inst=
ead."
> -#endif
> -
> -
> -/* We don't use `memset' because this would require a prototype and
> -   the array isn't too big.  */
> -#define __FD_ZERO(s) \
> -  do {									      \
> -    unsigned int __i;							      \
> -    fd_set *__arr =3D (s);						      \
> -    for (__i =3D 0; __i < sizeof (fd_set) / sizeof (__fd_mask); ++__i)	 =
     \
> -      __FDS_BITS (__arr)[__i] =3D 0;					      \
> -  } while (0)
> -#define __FD_SET(d, s)     (__FDS_BITS (s)[__FDELT(d)] |=3D __FDMASK(d))
> -#define __FD_CLR(d, s)     (__FDS_BITS (s)[__FDELT(d)] &=3D ~__FDMASK(d))
> -#define __FD_ISSET(d, s)   ((__FDS_BITS (s)[__FDELT(d)] & __FDMASK(d)) !=
=3D 0)
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_time.h b/m=
eta/recipes-core/glibc/glibc-2.10.1/generic-bits_time.h
> deleted file mode 100644
> index b3184d1..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_time.h
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -/* System-dependent timing definitions.  Generic version.
> -   Copyright (C) 1996,1997,1999-2002,2003 Free Software Foundation, Inc.
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public
> -   License as published by the Free Software Foundation; either
> -   version 2.1 of the License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, write to the Free
> -   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -   02111-1307 USA.  */
> -
> -/*
> - * Never include this file directly; use <time.h> instead.
> - */
> -
> -#ifndef __need_timeval
> -# ifndef _BITS_TIME_H
> -#  define _BITS_TIME_H	1
> -
> -/* ISO/IEC 9899:1990 7.12.1: <time.h>
> -   The macro `CLOCKS_PER_SEC' is the number per second of the value
> -   returned by the `clock' function. */
> -/* CAE XSH, Issue 4, Version 2: <time.h>
> -   The value of CLOCKS_PER_SEC is required to be 1 million on all
> -   XSI-conformant systems. */
> -#  define CLOCKS_PER_SEC  1000000l
> -
> -#  if !defined __STRICT_ANSI__ && !defined __USE_XOPEN2K
> -/* Even though CLOCKS_PER_SEC has such a strange value CLK_TCK
> -   presents the real value for clock ticks per second for the system.  */
> -#   include <bits/types.h>
> -extern long int __sysconf (int);
> -#   define CLK_TCK ((__clock_t) __sysconf (2))	/* 2 is _SC_CLK_TCK */
> -#  endif
> -
> -#  ifdef __USE_POSIX199309
> -/* Identifier for system-wide realtime clock.  */
> -#   define CLOCK_REALTIME		0
> -/* Monotonic system-wide clock.  */
> -#   define CLOCK_MONOTONIC		1
> -/* High-resolution timer from the CPU.  */
> -#   define CLOCK_PROCESS_CPUTIME_ID	2
> -/* Thread-specific CPU-time clock.  */
> -#   define CLOCK_THREAD_CPUTIME_ID	3
> -
> -/* Flag to indicate time is absolute.  */
> -#   define TIMER_ABSTIME		1
> -#  endif
> -
> -# endif	/* bits/time.h */
> -#endif
> -
> -#ifdef __need_timeval
> -# undef __need_timeval
> -# ifndef _STRUCT_TIMEVAL
> -#  define _STRUCT_TIMEVAL	1
> -#  include <bits/types.h>
> -
> -/* A time value that is accurate to the nearest
> -   microsecond but also has a range of years.  */
> -struct timeval
> -  {
> -    __time_t tv_sec;		/* Seconds.  */
> -    __suseconds_t tv_usec;	/* Microseconds.  */
> -  };
> -# endif	/* struct timeval */
> -#endif	/* need timeval */
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_types.h b/=
meta/recipes-core/glibc/glibc-2.10.1/generic-bits_types.h
> deleted file mode 100644
> index 65c8a9f..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_types.h
> +++ /dev/null
> @@ -1,200 +0,0 @@
> -/* bits/types.h -- definitions of __*_t types underlying *_t types.
> -   Copyright (C) 2002, 2003, 2004, 2005 Free Software Foundation, Inc.
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public
> -   License as published by the Free Software Foundation; either
> -   version 2.1 of the License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, write to the Free
> -   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -   02111-1307 USA.  */
> -
> -/*
> - * Never include this file directly; use <sys/types.h> instead.
> - */
> -
> -#ifndef	_BITS_TYPES_H
> -#define	_BITS_TYPES_H	1
> -
> -#include <features.h>
> -#include <bits/wordsize.h>
> -
> -#define __need_size_t
> -#include <stddef.h>
> -
> -/* Convenience types.  */
> -typedef unsigned char __u_char;
> -typedef unsigned short int __u_short;
> -typedef unsigned int __u_int;
> -typedef unsigned long int __u_long;
> -
> -/* Fixed-size types, underlying types depend on word size and compiler. =
 */
> -typedef signed char __int8_t;
> -typedef unsigned char __uint8_t;
> -typedef signed short int __int16_t;
> -typedef unsigned short int __uint16_t;
> -typedef signed int __int32_t;
> -typedef unsigned int __uint32_t;
> -#if __WORDSIZE =3D=3D 64
> -typedef signed long int __int64_t;
> -typedef unsigned long int __uint64_t;
> -#elif defined __GLIBC_HAVE_LONG_LONG
> -__extension__ typedef signed long long int __int64_t;
> -__extension__ typedef unsigned long long int __uint64_t;
> -#endif
> -
> -/* quad_t is also 64 bits.  */
> -#if __WORDSIZE =3D=3D 64
> -typedef long int __quad_t;
> -typedef unsigned long int __u_quad_t;
> -#elif defined __GLIBC_HAVE_LONG_LONG
> -__extension__ typedef long long int __quad_t;
> -__extension__ typedef unsigned long long int __u_quad_t;
> -#else
> -typedef struct
> -{
> -  long __val[2];
> -} __quad_t;
> -typedef struct
> -{
> -  __u_long __val[2];
> -} __u_quad_t;
> -#endif
> -
> -
> -/* The machine-dependent file <bits/typesizes.h> defines __*_T_TYPE
> -   macros for each of the OS types we define below.  The definitions
> -   of those macros must use the following macros for underlying types.
> -   We define __S<SIZE>_TYPE and __U<SIZE>_TYPE for the signed and unsign=
ed
> -   variants of each of the following integer types on this machine.
> -
> -	16		-- "natural" 16-bit type (always short)
> -	32		-- "natural" 32-bit type (always int)
> -	64		-- "natural" 64-bit type (long or long long)
> -	LONG32		-- 32-bit type, traditionally long
> -	QUAD		-- 64-bit type, always long long
> -	WORD		-- natural type of __WORDSIZE bits (int or long)
> -	LONGWORD	-- type of __WORDSIZE bits, traditionally long
> -
> -   We distinguish WORD/LONGWORD, 32/LONG32, and 64/QUAD so that the
> -   conventional uses of `long' or `long long' type modifiers match the
> -   types we define, even when a less-adorned type would be the same size.
> -   This matters for (somewhat) portably writing printf/scanf formats for
> -   these types, where using the appropriate l or ll format modifiers can
> -   make the typedefs and the formats match up across all GNU platforms. =
 If
> -   we used `long' when it's 64 bits where `long long' is expected, then =
the
> -   compiler would warn about the formats not matching the argument types,
> -   and the programmer changing them to shut up the compiler would break =
the
> -   program's portability.
> -
> -   Here we assume what is presently the case in all the GCC configuratio=
ns
> -   we support: long long is always 64 bits, long is always word/address =
size,
> -   and int is always 32 bits.  */
> -
> -#define	__S16_TYPE		short int
> -#define __U16_TYPE		unsigned short int
> -#define	__S32_TYPE		int
> -#define __U32_TYPE		unsigned int
> -#define __SLONGWORD_TYPE	long int
> -#define __ULONGWORD_TYPE	unsigned long int
> -#if __WORDSIZE =3D=3D 32
> -# define __SQUAD_TYPE		__quad_t
> -# define __UQUAD_TYPE		__u_quad_t
> -# define __SWORD_TYPE		int
> -# define __UWORD_TYPE		unsigned int
> -# define __SLONG32_TYPE		long int
> -# define __ULONG32_TYPE		unsigned long int
> -# define __S64_TYPE		__quad_t
> -# define __U64_TYPE		__u_quad_t
> -/* We want __extension__ before typedef's that use nonstandard base types
> -   such as `long long' in C89 mode.  */
> -# define __STD_TYPE		__extension__ typedef
> -#elif __WORDSIZE =3D=3D 64
> -# define __SQUAD_TYPE		long int
> -# define __UQUAD_TYPE		unsigned long int
> -# define __SWORD_TYPE		long int
> -# define __UWORD_TYPE		unsigned long int
> -# define __SLONG32_TYPE		int
> -# define __ULONG32_TYPE		unsigned int
> -# define __S64_TYPE		long int
> -# define __U64_TYPE		unsigned long int
> -/* No need to mark the typedef with __extension__.   */
> -# define __STD_TYPE		typedef
> -#else
> -# error
> -#endif
> -#include <bits/typesizes.h>	/* Defines __*_T_TYPE macros.  */
> -
> -
> -__STD_TYPE __DEV_T_TYPE __dev_t;	/* Type of device numbers.  */
> -__STD_TYPE __UID_T_TYPE __uid_t;	/* Type of user identifications.  */
> -__STD_TYPE __GID_T_TYPE __gid_t;	/* Type of group identifications.  */
> -__STD_TYPE __INO_T_TYPE __ino_t;	/* Type of file serial numbers.  */
> -__STD_TYPE __INO64_T_TYPE __ino64_t;	/* Type of file serial numbers (LFS=
).*/
> -__STD_TYPE __MODE_T_TYPE __mode_t;	/* Type of file attribute bitmasks.  =
*/
> -__STD_TYPE __NLINK_T_TYPE __nlink_t;	/* Type of file link counts.  */
> -__STD_TYPE __OFF_T_TYPE __off_t;	/* Type of file sizes and offsets.  */
> -__STD_TYPE __OFF64_T_TYPE __off64_t;	/* Type of file sizes and offsets (=
LFS).  */
> -__STD_TYPE __PID_T_TYPE __pid_t;	/* Type of process identifications.  */
> -__STD_TYPE __FSID_T_TYPE __fsid_t;	/* Type of file system IDs.  */
> -__STD_TYPE __CLOCK_T_TYPE __clock_t;	/* Type of CPU usage counts.  */
> -__STD_TYPE __RLIM_T_TYPE __rlim_t;	/* Type for resource measurement.  */
> -__STD_TYPE __RLIM64_T_TYPE __rlim64_t;	/* Type for resource measurement =
(LFS).  */
> -__STD_TYPE __ID_T_TYPE __id_t;		/* General type for IDs.  */
> -__STD_TYPE __TIME_T_TYPE __time_t;	/* Seconds since the Epoch.  */
> -__STD_TYPE __USECONDS_T_TYPE __useconds_t; /* Count of microseconds.  */
> -__STD_TYPE __SUSECONDS_T_TYPE __suseconds_t; /* Signed count of microsec=
onds.  */
> -
> -__STD_TYPE __DADDR_T_TYPE __daddr_t;	/* The type of a disk address.  */
> -__STD_TYPE __SWBLK_T_TYPE __swblk_t;	/* Type of a swap block maybe?  */
> -__STD_TYPE __KEY_T_TYPE __key_t;	/* Type of an IPC key.  */
> -
> -/* Clock ID used in clock and timer functions.  */
> -__STD_TYPE __CLOCKID_T_TYPE __clockid_t;
> -
> -/* Timer ID returned by `timer_create'.  */
> -__STD_TYPE __TIMER_T_TYPE __timer_t;
> -
> -/* Type to represent block size.  */
> -__STD_TYPE __BLKSIZE_T_TYPE __blksize_t;
> -
> -/* Types from the Large File Support interface.  */
> -
> -/* Type to count number of disk blocks.  */
> -__STD_TYPE __BLKCNT_T_TYPE __blkcnt_t;
> -__STD_TYPE __BLKCNT64_T_TYPE __blkcnt64_t;
> -
> -/* Type to count file system blocks.  */
> -__STD_TYPE __FSBLKCNT_T_TYPE __fsblkcnt_t;
> -__STD_TYPE __FSBLKCNT64_T_TYPE __fsblkcnt64_t;
> -
> -/* Type to count file system nodes.  */
> -__STD_TYPE __FSFILCNT_T_TYPE __fsfilcnt_t;
> -__STD_TYPE __FSFILCNT64_T_TYPE __fsfilcnt64_t;
> -
> -__STD_TYPE __SSIZE_T_TYPE __ssize_t; /* Type of a byte count, or error. =
 */
> -
> -/* These few don't really vary by system, they always correspond
> -   to one of the other defined types.  */
> -typedef __off64_t __loff_t;	/* Type of file sizes and offsets (LFS).  */
> -typedef __quad_t *__qaddr_t;
> -typedef char *__caddr_t;
> -
> -/* Duplicates info from stdint.h but this is used in unistd.h.  */
> -__STD_TYPE __SWORD_TYPE __intptr_t;
> -
> -/* Duplicate info from sys/socket.h.  */
> -__STD_TYPE __U32_TYPE __socklen_t;
> -
> -
> -#undef __STD_TYPE
> -
> -#endif /* bits/types.h */
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_typesizes.=
h b/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_typesizes.h
> deleted file mode 100644
> index e9226c4..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_typesizes.h
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -/* bits/typesizes.h -- underlying types for *_t.  Generic version.
> -   Copyright (C) 2002, 2003 Free Software Foundation, Inc.
> -   This file is part of the GNU C Library.
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Lesser General Public
> -   License as published by the Free Software Foundation; either
> -   version 2.1 of the License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Lesser General Public License for more details.
> -
> -   You should have received a copy of the GNU Lesser General Public
> -   License along with the GNU C Library; if not, write to the Free
> -   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
> -   02111-1307 USA.  */
> -
> -#ifndef _BITS_TYPES_H
> -# error "Never include <bits/typesizes.h> directly; use <sys/types.h> in=
stead."
> -#endif
> -
> -#ifndef	_BITS_TYPESIZES_H
> -#define	_BITS_TYPESIZES_H	1
> -
> -/* See <bits/types.h> for the meaning of these macros.  This file exists=
 so
> -   that <bits/types.h> need not vary across different GNU platforms.  */
> -
> -#define __DEV_T_TYPE		__UQUAD_TYPE
> -#define __UID_T_TYPE		__U32_TYPE
> -#define __GID_T_TYPE		__U32_TYPE
> -#define __INO_T_TYPE		__ULONGWORD_TYPE
> -#define __INO64_T_TYPE		__UQUAD_TYPE
> -#define __MODE_T_TYPE		__U32_TYPE
> -#define __NLINK_T_TYPE		__UWORD_TYPE
> -#define __OFF_T_TYPE		__SLONGWORD_TYPE
> -#define __OFF64_T_TYPE		__SQUAD_TYPE
> -#define __PID_T_TYPE		__S32_TYPE
> -#define __RLIM_T_TYPE		__ULONGWORD_TYPE
> -#define __RLIM64_T_TYPE		__UQUAD_TYPE
> -#define	__BLKCNT_T_TYPE		__SLONGWORD_TYPE
> -#define	__BLKCNT64_T_TYPE	__SQUAD_TYPE
> -#define	__FSBLKCNT_T_TYPE	__ULONGWORD_TYPE
> -#define	__FSBLKCNT64_T_TYPE	__UQUAD_TYPE
> -#define	__FSFILCNT_T_TYPE	__ULONGWORD_TYPE
> -#define	__FSFILCNT64_T_TYPE	__UQUAD_TYPE
> -#define	__ID_T_TYPE		__U32_TYPE
> -#define __CLOCK_T_TYPE		__SLONGWORD_TYPE
> -#define __TIME_T_TYPE		__SLONGWORD_TYPE
> -#define __USECONDS_T_TYPE	__U32_TYPE
> -#define __SUSECONDS_T_TYPE	__SLONGWORD_TYPE
> -#define __DADDR_T_TYPE		__S32_TYPE
> -#define __SWBLK_T_TYPE		__SLONGWORD_TYPE
> -#define __KEY_T_TYPE		__S32_TYPE
> -#define __CLOCKID_T_TYPE	__S32_TYPE
> -#define __TIMER_T_TYPE		void *
> -#define __BLKSIZE_T_TYPE	__SLONGWORD_TYPE
> -#define __FSID_T_TYPE		struct { int __val[2]; }
> -#define __SSIZE_T_TYPE		__SWORD_TYPE
> -
> -/* Number of descriptors that can fit in an `fd_set'.  */
> -#define	__FD_SETSIZE		1024
> -
> -
> -#endif /* bits/typesizes.h */
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/glibc-2.9-enable-binuti=
ls-2.2.patch b/meta/recipes-core/glibc/glibc-2.10.1/glibc-2.9-enable-binuti=
ls-2.2.patch
> deleted file mode 100644
> index 07e4758..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/glibc-2.9-enable-binutils-2.2.=
patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ---- glibc-2.9.orig/configure.in	2009-10-22 15:38:13.000000000 +0200
> -+++ glibc-2.9/configure.in	2009-10-22 15:37:33.000000000 +0200
> -@@ -844,10 +844,10 @@
> - # Accept binutils 2.13 or newer.
> - AC_CHECK_PROG_VER(AS, $AS, --version,
> - 		  [GNU assembler.* \([0-9]*\.[0-9.]*\)],
> --		  [2.1[3-9]*], AS=3D: critic_missing=3D"$critic_missing as")
> -+		  [2.1[3-9]* | 2.2* ], AS=3D: critic_missing=3D"$critic_missing as")
> - AC_CHECK_PROG_VER(LD, $LD, --version,
> - 		  [GNU ld.* \([0-9][0-9]*\.[0-9.]*\)],
> --		  [2.1[3-9]*], LD=3D: critic_missing=3D"$critic_missing ld")
> -+		  [2.1[3-9]* | 2.2* ], LD=3D: critic_missing=3D"$critic_missing ld")
> -=20
> - # We need the physical current working directory.  We cannot use the
> - # "pwd -P" shell builtin since that's not portable.  Instead we try to
> ---- glibc-2.9.orig/configure	2009-02-26 22:28:17.000000000 +0100
> -+++ glibc-2.9/configure	2009-10-22 15:43:11.000000000 +0200
> -@@ -4531,7 +4531,7 @@
> -   ac_prog_version=3D`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* =
\([0-9]*\.[0-9.]*\).*$/\1/p'`
> -   case $ac_prog_version in
> -     '') ac_prog_version=3D"v. ?.??, bad"; ac_verc_fail=3Dyes;;
> --    2.1[3-9]*)
> -+    2.1[3-9]* | 2.2*)
> -        ac_prog_version=3D"$ac_prog_version, ok"; ac_verc_fail=3Dno;;
> -     *) ac_prog_version=3D"$ac_prog_version, bad"; ac_verc_fail=3Dyes;;
> -=20
> -@@ -4594,7 +4594,7 @@
> -   ac_prog_version=3D`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9]=
[0-9]*\.[0-9.]*\).*$/\1/p'`
> -   case $ac_prog_version in
> -     '') ac_prog_version=3D"v. ?.??, bad"; ac_verc_fail=3Dyes;;
> --    2.1[3-9]*)
> -+    2.1[3-9]* | 2.2*)
> -        ac_prog_version=3D"$ac_prog_version, ok"; ac_verc_fail=3Dno;;
> -     *) ac_prog_version=3D"$ac_prog_version, bad"; ac_verc_fail=3Dyes;;
> -=20
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-IO-acquire-lo=
ck-fix.diff b/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-IO-acquire-loc=
k-fix.diff
> deleted file mode 100644
> index 843c5e8..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-IO-acquire-lock-fix.=
diff
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Arm needs a similar fix as http://sourceware.org/ml/libc-ports/2007-12/m=
sg00000.html
> -
> -Upstream-Status: Inappropriate [not used]
> -
> ---- /tmp/stdio-lock.h	2008-03-04 18:51:15.555038993 +0100
> -+++ glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/bits/stdio-lock.h	2008-0=
3-04 18:51:28.445035052 +0100
> -@@ -50,6 +50,8 @@
> -   _IO_cleanup_region_start ((void (*) (void *)) _IO_funlockfile, (_fp))=
;      \
> -   _IO_flockfile (_fp)
> -=20
> -+# define _IO_acquire_lock_clear_flags2(_fp) _IO_acquire_lock (_fp)
> -+
> - # define _IO_release_lock(_fp) \
> -   _IO_funlockfile (_fp);						      \
> -   _IO_cleanup_region_end (0)
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-no-asm-page.p=
atch b/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch
> deleted file mode 100644
> index 9dba9d2..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -http://sourceware.org/ml/libc-ports/2008-04/msg00005.html
> -
> -Upstream-Status: Inappropriate [not used]
> -
> -
> -Index: glibc-2.6.1/ports/sysdeps/unix/sysv/linux/arm/ioperm.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- glibc-2.6.1.orig/ports/sysdeps/unix/sysv/linux/arm/ioperm.c	2008-09-=
12 18:08:18.000000000 -0700
> -+++ glibc-2.6.1/ports/sysdeps/unix/sysv/linux/arm/ioperm.c	2008-09-12 18=
:08:28.000000000 -0700
> -@@ -45,7 +45,6 @@
> - #include <sys/mman.h>
> -=20
> - #include <linux/version.h>
> --#include <asm/page.h>
> - #include <sys/sysctl.h>
> -=20
> - #define PATH_ARM_SYSTYPE	"/etc/arm_systype"
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch b/=
meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
> deleted file mode 100644
> index a0e55bf..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
> +++ /dev/null
> @@ -1,345 +0,0 @@
> -From libc-ports-return-550-listarch-libc-ports=3Dsources dot redhat dot =
com at sourceware dot org Tue Oct 31 17:37:21 2006
> -Return-Path: <libc-ports-return-550-listarch-libc-ports=3Dsources dot re=
dhat dot com at sourceware dot org>
> -Delivered-To: listarch-libc-ports at sources dot redhat dot com
> -Received: (qmail 17273 invoked by alias); 31 Oct 2006 17:37:20 -0000
> -Received: (qmail 17262 invoked by uid 22791); 31 Oct 2006 17:37:19 -0000
> -X-Spam-Status: No, hits=3D-2.5 required=3D5.0 	tests=3DAWL,BAYES_00,TW_CP
> -X-Spam-Check-By: sourceware.org
> -Received: from nevyn.them.org (HELO nevyn.them.org) (66.93.172.17)     b=
y sourceware.org (qpsmtpd/0.31.1) with ESMTP; Tue, 31 Oct 2006 17:37:11 +00=
00
> -Received: from drow by nevyn.them.org with local (Exim 4.54) 	id 1GexXw-=
0007Dj-30; Tue, 31 Oct 2006 12:37:08 -0500
> -Date: Tue, 31 Oct 2006 12:37:08 -0500
> -From: Daniel Jacobowitz <drow at false dot org>
> -To: Mike Frysinger <vapier at gentoo dot org>
> -Cc: libc-ports at sourceware dot org, Philip Balister <philip dot balist=
er at gmail dot com>
> -Subject: Re: Problem with glibc-2.5 on ARM
> -Message-ID: <20061031173708.GJ20468@nevyn.them.org>
> -References: <499146270610241149ibe030e0nd9d6b177a95b346e@mail.gmail.com>=
 <499146270610241254u7cadf63ej2edf05cedbc5266f@mail.gmail.com> <20061024195=
837.GA20181@nevyn.them.org> <200610291954.27022.vapier@gentoo.org>
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3Dus-ascii
> -Content-Disposition: inline
> -In-Reply-To: <200610291954 dot 27022 dot vapier at gentoo dot org>
> -User-Agent: Mutt/1.5.13 (2006-08-11)
> -X-IsSubscribed: yes
> -Mailing-List: contact libc-ports-help at sourceware dot org; run by ezmlm
> -Precedence: bulk
> -List-Subscribe: <mailto:libc-ports-subscribe at sourceware dot org>
> -List-Post: <mailto:libc-ports at sourceware dot org>
> -List-Help: <mailto:libc-ports-help at sourceware dot org>, <http://sourc=
eware dot org/lists dot html#faqs>
> -Sender: libc-ports-owner at sourceware dot org
> -Delivered-To: mailing list libc-ports at sourceware dot org
> -
> -On Sun, Oct 29, 2006 at 07:54:25PM -0500, Mike Frysinger wrote:
> -> On Tuesday 24 October 2006 15:58, Daniel Jacobowitz wrote:
> -> > ARM is going to need a slightly different version of that file, I
> -> > guess.
> ->=20
> -> would declaring req with attribute packed not help ?
> -> -mike
> -
> -Nope.  "struct rtgenmsg" would still have size 4.
> -
> -Philip, are you still at all interested in this for the old ABI?
> -I don't have time to test this patch right now, but I think it
> -will work.
> -
> ---=20
> -Daniel Jacobowitz
> -CodeSourcery
> -
> -2006-10-31  Daniel Jacobowitz  <dan@codesourcery.com>
> -
> -	* sysdeps/unix/sysv/linux/arm/check_pf.c: New file.
> -	* sysdeps/unix/sysv/linux/arm/eabi/check_pf.c: New file.
> -
> -Upstream-Status: Inappropriate [not used]
> -
> -Index: sysdeps/unix/sysv/linux/arm/check_pf.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -RCS file: sysdeps/unix/sysv/linux/arm/check_pf.c
> -diff -N sysdeps/unix/sysv/linux/arm/check_pf.c
> ---- /dev/null	1 Jan 1970 00:00:00 -0000
> -+++ sysdeps/unix/sysv/linux/arm/check_pf.c	31 Oct 2006 17:29:58 -0000
> -@@ -0,0 +1,274 @@
> -+/* Determine protocol families for which interfaces exist.  ARM Linux v=
ersion.
> -+   Copyright (C) 2003, 2006 Free Software Foundation, Inc.
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
> -+#include <assert.h>
> -+#include <errno.h>
> -+#include <ifaddrs.h>
> -+#include <netdb.h>
> -+#include <stddef.h>
> -+#include <string.h>
> -+#include <time.h>
> -+#include <unistd.h>
> -+#include <sys/socket.h>
> -+
> -+#include <asm/types.h>
> -+#include <linux/netlink.h>
> -+#include <linux/rtnetlink.h>
> -+
> -+#include <not-cancel.h>
> -+#include <kernel-features.h>
> -+
> -+
> -+#ifndef IFA_F_TEMPORARY
> -+# define IFA_F_TEMPORARY IFA_F_SECONDARY
> -+#endif
> -+#ifndef IFA_F_HOMEADDRESS
> -+# define IFA_F_HOMEADDRESS 0
> -+#endif
> -+
> -+
> -+static int
> -+make_request (int fd, pid_t pid, bool *seen_ipv4, bool *seen_ipv6,
> -+	      struct in6addrinfo **in6ai, size_t *in6ailen)
> -+{
> -+  struct req
> -+  {
> -+    struct nlmsghdr nlh;
> -+    struct rtgenmsg g;
> -+  } req;
> -+  struct sockaddr_nl nladdr;
> -+
> -+  /* struct rtgenmsg consists of a single byte but the ARM ABI rounds
> -+     it up to a word.  Clear the padding explicitly here.  */
> -+  assert (sizeof (req.g) =3D=3D 4);
> -+  memset (&req.g, '\0', sizeof (req.g));
> -+
> -+  req.nlh.nlmsg_len =3D sizeof (req);
> -+  req.nlh.nlmsg_type =3D RTM_GETADDR;
> -+  req.nlh.nlmsg_flags =3D NLM_F_ROOT | NLM_F_MATCH | NLM_F_REQUEST;
> -+  req.nlh.nlmsg_pid =3D 0;
> -+  req.nlh.nlmsg_seq =3D time (NULL);
> -+  req.g.rtgen_family =3D AF_UNSPEC;
> -+
> -+  memset (&nladdr, '\0', sizeof (nladdr));
> -+  nladdr.nl_family =3D AF_NETLINK;
> -+
> -+  if (TEMP_FAILURE_RETRY (__sendto (fd, (void *) &req, sizeof (req), 0,
> -+				    (struct sockaddr *) &nladdr,
> -+				    sizeof (nladdr))) < 0)
> -+    return -1;
> -+
> -+  *seen_ipv4 =3D false;
> -+  *seen_ipv6 =3D false;
> -+
> -+  bool done =3D false;
> -+  char buf[4096];
> -+  struct iovec iov =3D { buf, sizeof (buf) };
> -+  struct in6ailist
> -+  {
> -+    struct in6addrinfo info;
> -+    struct in6ailist *next;
> -+  } *in6ailist =3D NULL;
> -+  size_t in6ailistlen =3D 0;
> -+
> -+  do
> -+    {
> -+      struct msghdr msg =3D
> -+	{
> -+	  (void *) &nladdr, sizeof (nladdr),
> -+	  &iov, 1,
> -+	  NULL, 0,
> -+	  0
> -+	};
> -+
> -+      ssize_t read_len =3D TEMP_FAILURE_RETRY (__recvmsg (fd, &msg, 0));
> -+      if (read_len < 0)
> -+	return -1;
> -+
> -+      if (msg.msg_flags & MSG_TRUNC)
> -+	return -1;
> -+
> -+      struct nlmsghdr *nlmh;
> -+      for (nlmh =3D (struct nlmsghdr *) buf;
> -+	   NLMSG_OK (nlmh, (size_t) read_len);
> -+	   nlmh =3D (struct nlmsghdr *) NLMSG_NEXT (nlmh, read_len))
> -+	{
> -+	  if (nladdr.nl_pid !=3D 0 || (pid_t) nlmh->nlmsg_pid !=3D pid
> -+	      || nlmh->nlmsg_seq !=3D req.nlh.nlmsg_seq)
> -+	    continue;
> -+
> -+	  if (nlmh->nlmsg_type =3D=3D RTM_NEWADDR)
> -+	    {
> -+	      struct ifaddrmsg *ifam =3D (struct ifaddrmsg *) NLMSG_DATA (nlmh=
);
> -+
> -+	      switch (ifam->ifa_family)
> -+		{
> -+		case AF_INET:
> -+		  *seen_ipv4 =3D true;
> -+		  break;
> -+		case AF_INET6:
> -+		  *seen_ipv6 =3D true;
> -+
> -+		  if (ifam->ifa_flags & (IFA_F_DEPRECATED
> -+					 | IFA_F_TEMPORARY
> -+					 | IFA_F_HOMEADDRESS))
> -+		    {
> -+		      struct rtattr *rta =3D IFA_RTA (ifam);
> -+		      size_t len =3D (nlmh->nlmsg_len
> -+				    - NLMSG_LENGTH (sizeof (*ifam)));
> -+		      void *local =3D NULL;
> -+		      void *address =3D NULL;
> -+		      while (RTA_OK (rta, len))
> -+			{
> -+			  switch (rta->rta_type)
> -+			    {
> -+			    case IFA_LOCAL:
> -+			      local =3D RTA_DATA (rta);
> -+			      break;
> -+
> -+			    case IFA_ADDRESS:
> -+			      address =3D RTA_DATA (rta);
> -+			      break;
> -+			    }
> -+
> -+			  rta =3D RTA_NEXT (rta, len);
> -+			}
> -+
> -+		      struct in6ailist *newp =3D alloca (sizeof (*newp));
> -+		      newp->info.flags =3D (((ifam->ifa_flags & IFA_F_DEPRECATED)
> -+					   ? in6ai_deprecated : 0)
> -+					  | ((ifam->ifa_flags
> -+					      & IFA_F_TEMPORARY)
> -+					     ? in6ai_temporary : 0)
> -+					  | ((ifam->ifa_flags
> -+					      & IFA_F_HOMEADDRESS)
> -+					     ? in6ai_homeaddress : 0));
> -+		      memcpy (newp->info.addr, address ?: local,
> -+			      sizeof (newp->info.addr));
> -+		      newp->next =3D in6ailist;
> -+		      in6ailist =3D newp;
> -+		      ++in6ailistlen;
> -+		    }
> -+		  break;
> -+		default:
> -+		  /* Ignore.  */
> -+		  break;
> -+		}
> -+	    }
> -+	  else if (nlmh->nlmsg_type =3D=3D NLMSG_DONE)
> -+	    /* We found the end, leave the loop.  */
> -+	    done =3D true;
> -+	}
> -+    }
> -+  while (! done);
> -+
> -+  close_not_cancel_no_status (fd);
> -+
> -+  if (in6ailist !=3D NULL)
> -+    {
> -+      *in6ai =3D malloc (in6ailistlen * sizeof (**in6ai));
> -+      if (*in6ai =3D=3D NULL)
> -+	return -1;
> -+
> -+      *in6ailen =3D in6ailistlen;
> -+
> -+      do
> -+	{
> -+	  (*in6ai)[--in6ailistlen] =3D in6ailist->info;
> -+	  in6ailist =3D in6ailist->next;
> -+	}
> -+      while (in6ailist !=3D NULL);
> -+    }
> -+
> -+  return 0;
> -+}
> -+
> -+
> -+/* We don't know if we have NETLINK support compiled in in our
> -+   Kernel.  */
> -+#if __ASSUME_NETLINK_SUPPORT =3D=3D 0
> -+/* Define in ifaddrs.h.  */
> -+extern int __no_netlink_support attribute_hidden;
> -+#else
> -+# define __no_netlink_support 0
> -+#endif
> -+
> -+
> -+void
> -+attribute_hidden
> -+__check_pf (bool *seen_ipv4, bool *seen_ipv6,
> -+	    struct in6addrinfo **in6ai, size_t *in6ailen)
> -+{
> -+  *in6ai =3D NULL;
> -+  *in6ailen =3D 0;
> -+
> -+  if (! __no_netlink_support)
> -+    {
> -+      int fd =3D __socket (PF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
> -+
> -+      struct sockaddr_nl nladdr;
> -+      memset (&nladdr, '\0', sizeof (nladdr));
> -+      nladdr.nl_family =3D AF_NETLINK;
> -+
> -+      socklen_t addr_len =3D sizeof (nladdr);
> -+
> -+      if (fd >=3D 0
> -+	  && __bind (fd, (struct sockaddr *) &nladdr, sizeof (nladdr)) =3D=3D 0
> -+	  && __getsockname (fd, (struct sockaddr *) &nladdr, &addr_len) =3D=3D=
 0
> -+	  && make_request (fd, nladdr.nl_pid, seen_ipv4, seen_ipv6,
> -+			   in6ai, in6ailen) =3D=3D 0)
> -+	/* It worked.  */
> -+	return;
> -+
> -+      if (fd >=3D 0)
> -+	__close (fd);
> -+
> -+#if __ASSUME_NETLINK_SUPPORT =3D=3D 0
> -+      /* Remember that there is no netlink support.  */
> -+      __no_netlink_support =3D 1;
> -+#else
> -+      /* We cannot determine what interfaces are available.  Be
> -+	 pessimistic.  */
> -+      *seen_ipv4 =3D true;
> -+      *seen_ipv6 =3D true;
> -+#endif
> -+    }
> -+
> -+#if __ASSUME_NETLINK_SUPPORT =3D=3D 0
> -+  /* No netlink.  Get the interface list via getifaddrs.  */
> -+  struct ifaddrs *ifa =3D NULL;
> -+  if (getifaddrs (&ifa) !=3D 0)
> -+    {
> -+      /* We cannot determine what interfaces are available.  Be
> -+	 pessimistic.  */
> -+      *seen_ipv4 =3D true;
> -+      *seen_ipv6 =3D true;
> -+      return;
> -+    }
> -+
> -+  struct ifaddrs *runp;
> -+  for (runp =3D ifa; runp !=3D NULL; runp =3D runp->ifa_next)
> -+    if (runp->ifa_addr->sa_family =3D=3D PF_INET)
> -+      *seen_ipv4 =3D true;
> -+    else if (runp->ifa_addr->sa_family =3D=3D PF_INET6)
> -+      *seen_ipv6 =3D true;
> -+
> -+  (void) freeifaddrs (ifa);
> -+#endif
> -+}
> -Index: sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -RCS file: sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
> -diff -N sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
> ---- /dev/null	1 Jan 1970 00:00:00 -0000
> -+++ sysdeps/unix/sysv/linux/arm/eabi/check_pf.c	31 Oct 2006 17:29:58 -00=
00
> -@@ -0,0 +1 @@
> -+#include <sysdeps/unix/sysv/linux/check_pf.c>
> -
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/ldd-unbash.patch b/meta=
/recipes-core/glibc/glibc-2.10.1/ldd-unbash.patch
> deleted file mode 100644
> index 1601310..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/ldd-unbash.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> ---- glibc-2.5/elf/ldd.bash.in.org	2006-04-30 16:06:20.000000000 +0000
> -+++ glibc-2.5/elf/ldd.bash.in	2007-03-30 19:18:57.000000000 +0000
> -@@ -110,7 +110,7 @@
> - # environments where the executed program might not have permissions
> - # to write to the console/tty.  But only bash 3.x supports the pipefail
> - # option, and we don't bother to handle the case for older bash version=
s.
> --if set -o pipefail 2> /dev/null; then
> -+if false; then
> -   try_trace() {
> -     eval $add_env '"$@"' | cat
> -   }
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/ldsocache-varrun.patch =
b/meta/recipes-core/glibc/glibc-2.10.1/ldsocache-varrun.patch
> deleted file mode 100644
> index c303c64..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/ldsocache-varrun.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -This patch moves ld.so.cache from /etc to /var/run. This is for devices
> -where /etc is JFFS2 or CRAMFS but /var is a ramdisk.
> -
> -#
> -# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
> -#
> -
> -Upstream-Status: Inappropriate [not used]
> -
> ---- libc/sysdeps/generic/dl-cache.h~ldsocache-varrun
> -+++ libc/sysdeps/generic/dl-cache.h
> -@@ -29,7 +29,7 @@
> - #endif
> -=20
> - #ifndef LD_SO_CACHE
> --# define LD_SO_CACHE SYSCONFDIR "/ld.so.cache"
> -+# define LD_SO_CACHE "/var/run/ld.so.cache"
> - #endif
> -=20
> - #ifndef add_system_dir
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/march-i686.patch b/meta=
/recipes-core/glibc/glibc-2.10.1/march-i686.patch
> deleted file mode 100644
> index 687235c..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/march-i686.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -2007-02-15  Khem Raj  <kraj@xxxxxxxxxx>
> -
> -       * sysdeps/unix/sysv/linux/i386/sysdep.h: Re-define __i686.
> -       * nptl/sysdeps/pthread/pt-initfini.c: Ditto.
> -
> -
> -Upstream-Status: Inappropriate [not used]
> -
> -Index: sysdeps/unix/sysv/linux/i386/sysdep.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- sysdeps/unix/sysv/linux/i386/sysdep.h	(revision 1469)
> -+++ sysdeps/unix/sysv/linux/i386/sysdep.h	(working copy)
> -@@ -29,6 +29,10 @@
> - #include <dl-sysdep.h>
> - #include <tls.h>
> -=20
> -+#if defined __i686 && defined __ASSEMBLER__
> -+#undef __i686
> -+#define __i686 __i686
> -+#endif
> -=20
> - /* For Linux we can use the system call table in the header file
> - 	/usr/include/asm/unistd.h
> -Index: nptl/sysdeps/pthread/pt-initfini.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- nptl/sysdeps/pthread/pt-initfini.c	(revision 1469)
> -+++ nptl/sysdeps/pthread/pt-initfini.c	(working copy)
> -@@ -45,6 +45,11 @@
> - /* Embed an #include to pull in the alignment and .end directives. */
> - asm ("\n#include \"defs.h\"");
> -=20
> -+asm ("\n#if defined __i686 && defined __ASSEMBLER__");
> -+asm ("\n#undef __i686");
> -+asm ("\n#define __i686 __i686");
> -+asm ("\n#endif");
> -+
> - /* The initial common code ends here. */
> - asm ("\n/*@HEADER_ENDS*/");
> -=20
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/mips-rld-map-check.patc=
h b/meta/recipes-core/glibc/glibc-2.10.1/mips-rld-map-check.patch
> deleted file mode 100644
> index 2599e16..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/mips-rld-map-check.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -On mips target, binutils currently sets DT_MIPS_RLD_MAP to 0 in dynamic
> -section if a --version-script sets _RLD_MAP to local. This is apparently
> -a binutils bug, but libc shouldn't segfault in this case.
> -
> -see also: http://sourceware.org/bugilla/show_bug.cgi?id=3D11615
> -
> -Upstream-Status: Inappropriate [not used]
> -
> -9/19/2010 - added by Qing He <qing.he@intel.com>
> ----
> -diff -ru glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h glibc-2.10.1/=
ports/sysdeps/mips/dl-machine.h
> ---- glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h	2009-05-16 16:36:2=
0.000000000 +0800
> -+++ glibc-2.10.1/ports/sysdeps/mips/dl-machine.h	2010-09-19 09:11:53.000=
000000 +0800
> -@@ -70,7 +70,8 @@
> - /* If there is a DT_MIPS_RLD_MAP entry in the dynamic section, fill it =
in
> -    with the run-time address of the r_debug structure  */
> - #define ELF_MACHINE_DEBUG_SETUP(l,r) \
> --do { if ((l)->l_info[DT_MIPS (RLD_MAP)]) \
> -+do { if ((l)->l_info[DT_MIPS (RLD_MAP)] && \
> -+         (l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) \
> -        *(ElfW(Addr) *)((l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr) =3D \
> -        (ElfW(Addr)) (r); \
> -    } while (0)
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch=
 b/meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch
> deleted file mode 100644
> index 7e3d9bb..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> ---- glibc-2.4/nptl/sysdeps/pthread/configure.in.ark	2006-03-12 00:41:40.=
000000000 +0100
> -+++ glibc-2.4/nptl/sysdeps/pthread/configure.in	2006-03-12 00:44:08.0000=
00000 +0100
> -@@ -45,5 +45,6 @@
> -     AC_MSG_ERROR([the compiler must support C cleanup handling])
> -   fi
> - else
> --  AC_MSG_ERROR(forced unwind support is required)
> -+  AC_MSG_WARN([forced unwind support is required, can't be verified whi=
le crosscompiling])
> -+  AC_DEFINE(HAVE_FORCED_UNWIND)
> - fi
> ---- glibc-2.4/nptl/sysdeps/pthread/configure.ark	2006-03-12 00:42:47.000=
000000 +0100
> -+++ glibc-2.4/nptl/sysdeps/pthread/configure	2006-03-12 00:44:08.0000000=
00 +0100
> -@@ -153,7 +153,10 @@
> -    { (exit 1); exit 1; }; }
> -   fi
> - else
> --  { { echo "$as_me:$LINENO: error: forced unwind support is required" >=
&5
> --echo "$as_me: error: forced unwind support is required" >&2;}
> --   { (exit 1); exit 1; }; }
> -+  { echo "$as_me:$LINENO: WARNING: forced unwind support is required, c=
an't be verified while crosscompiling" >&5
> -+echo "$as_me: WARNING: forced unwind support is required, can't be veri=
fied while crosscompiling" >&2;}
> -+  cat >>confdefs.h <<\_ACEOF
> -+#define HAVE_FORCED_UNWIND 1
> -+_ACEOF
> -+
> - fi
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/nscd-init.patch b/meta/=
recipes-core/glibc/glibc-2.10.1/nscd-init.patch
> deleted file mode 100644
> index 8017e49..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/nscd-init.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> ---- nscd/nscd.init
> -+++ nscd/nscd.init
> -@@ -48,9 +48,8 @@
> -=20
> - start () {
> -     [ -d /var/run/nscd ] || mkdir /var/run/nscd
> --    [ -d /var/db/nscd ] || mkdir /var/db/nscd
> -     echo -n $"Starting $prog: "
> --    daemon /usr/sbin/nscd
> -+    /usr/sbin/nscd
> -     RETVAL=3D$?
> -     echo
> -     [ $RETVAL -eq 0 ] && touch /var/lock/subsys/nscd
> -@@ -67,12 +66,10 @@
> - 	# a non-privileged user
> - 	rm -f /var/run/nscd/nscd.pid
> - 	rm -f /var/run/nscd/socket
> --       	success $"$prog shutdown"
> --    else
> --       	failure $"$prog shutdown"
> -     fi
> --    echo
> --    return $RETVAL
> -+    echo "Done."
> -+    # If nscd did not run, return 0 according to LSB.
> -+    return 0
> - }
> -=20
> - restart() {
> -@@ -104,7 +101,8 @@
> - 	;;
> -     force-reload | reload)
> -     	echo -n $"Reloading $prog: "
> --	killproc /usr/sbin/nscd -HUP
> -+	# Use killall, initscripts-1.0-r115 don't support -HUP yet.
> -+	killall -HUP /usr/sbin/nscd
> - 	RETVAL=3D$?
> - 	echo
> - 	;;
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff =
b/meta/recipes-core/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff
> deleted file mode 100644
> index bbc75d1..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> -diff -Nurd ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.=
c glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c
> ---- ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c	2006-=
04-14 07:44:30.000000000 +0200
> -+++ glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c	2006-12-08 12:53:32.202227000=
 +0100
> -@@ -25,6 +25,9 @@
> - #include <sysdep.h>
> - #include <ldsodefs.h>
> -=20
> -+#define __CPU_HAS_FSQRT ((GLRO(dl_hwcap) & PPC_FEATURE_64) !=3D 0)
> -+
> -+
> - static const double almost_half =3D 0.5000000000000001;	/* 0.5 + 2^-53 =
*/
> - static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> - static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> -diff -Nurd ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf=
=2Ec glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c
> ---- ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c	2006=
-04-14 07:44:30.000000000 +0200
> -+++ glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c	2006-12-08 12:53:36.99222700=
0 +0100
> -@@ -25,6 +25,8 @@
> - #include <sysdep.h>
> - #include <ldsodefs.h>
> -=20
> -+#define __CPU_HAS_FSQRT ((GLRO(dl_hwcap) & PPC_FEATURE_64) !=3D 0)
> -+
> - static const float almost_half =3D 0.50000006;	/* 0.5 + 2^-24 */
> - static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> - static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/rulesfix.patch b/meta/r=
ecipes-core/glibc/glibc-2.10.1/rulesfix.patch
> deleted file mode 100644
> index 585bb62..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/rulesfix.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> -Index: glibc-2.9/Makerules
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- glibc-2.9.orig/Makerules	2009-09-14 16:39:21.000000000 +0100
> -+++ glibc-2.9/Makerules	2009-09-14 16:39:50.000000000 +0100
> -@@ -173,6 +173,8 @@
> - # it's used in sysd-rules, below.
> - $(common-objpfx)%.h $(common-objpfx)%.h.d: $(..)scripts/gen-as-const.aw=
k \
> - 					   %.sym $(common-before-compile)
> -+	rm -f $(@:.h=3D.h.d)
> -+	rm -f $(@:.h.d=3D.h)
> - 	$(AWK) -f $< $(filter %.sym,$^) \
> - 	| $(CC) -S -o $(@:.h.d=3D.h)T3 $(CFLAGS) $(CPPFLAGS) -x c - \
> - 		-MD -MP -MF $(@:.h=3D.h.d)T -MT '$(@:.h=3D.h.d) $(@:.h.d=3D.h)'
> diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-cor=
e/glibc/glibc-initial.inc
> deleted file mode 100644
> index 3745955..0000000
> --- a/meta/recipes-core/glibc/glibc-initial.inc
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -SECTION =3D "libs"
> -DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers"
> -PROVIDES =3D "virtual/${TARGET_PREFIX}libc-initial"
> -FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-${PV}', '$=
{FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files'=
, '${FILE_DIRNAME}' ], d)}"
> -
> -PACKAGES =3D ""
> -PACKAGES_DYNAMIC =3D ""
> -
> -STAGINGCC =3D "gcc-cross-initial"
> -STAGINGCC_virtclass-nativesdk =3D "gcc-crosssdk-initial"
> -
> -do_configure () {
> -	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
> -	chmod +x ${S}/configure
> -	find ${S} -name "configure" | xargs touch
> -	${S}/configure --host=3D${TARGET_SYS} --build=3D${BUILD_SYS} \
> -		--without-cvs --disable-sanity-checks \
> -		--with-headers=3D${STAGING_DIR_TARGET}${includedir} \
> -		--enable-hacker-mode
> -	if grep -q GLIBC_2.3 ${S}/ChangeLog; then
> -		# glibc-2.3.x passes cross options to $(CC) when generating errlist-co=
mpat.c, which fails without a real cross-compiler.
> -		# Fortunately, we don't need errlist-compat.c, since we just need .h f=
iles,
> -		# so work around this by creating a fake errlist-compat.c and satisfyi=
ng its dependencies.
> -		# Another workaround might be to tell configure to not use any cross o=
ptions to $(CC).
> -		# The real fix would be to get install-headers to not generate errlist=
-compat.c.
> -		make sysdeps/gnu/errlist.c
> -		mkdir -p stdio-common
> -		touch stdio-common/errlist-compat.c
> -	fi
> -}
> -
> -do_compile () {
> -	:
> -}
> -
> -do_install () {
> -	oe_runmake cross-compiling=3Dyes install_root=3D${D} \
> -	includedir=3D'${includedir}' prefix=3D'${prefix}' \
> -	install-bootstrap-headers=3Dyes install-headers
> -
> -	oe_runmake csu/subdir_lib
> -	# Two headers -- stubs.h and features.h -- aren't installed by install-=
headers,
> -	# so do them by hand.  We can tolerate an empty stubs.h for the moment.
> -	# See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
> -	mkdir -p ${D}${includedir}/gnu/
> -	touch ${D}${includedir}/gnu/stubs.h
> -	cp ${S}/include/features.h ${D}${includedir}/features.h
> -
> -	if [ -e ${B}/bits/stdio_lim.h ]; then
> -		cp ${B}/bits/stdio_lim.h  ${D}${includedir}/bits/
> -	fi
> -	mkdir -p ${D}${libdir}/
> -	install -m 644 csu/crt[1in].o ${D}${libdir}
> -	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
> -		-o ${D}${libdir}/libc.so
> -
> -	# add links to linux-libc-headers: gcc-{cross,crossdk}-intermediate nee=
d this.
> -	for t in linux asm asm-generic; do
> -		ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
> -	done
> -}
> -
> -do_siteconfig () {
> -	:
> -}
> -
> -do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_TCBOOTSTRAP}"
> diff --git a/meta/recipes-core/glibc/glibc-initial_2.10.1.bb b/meta/recip=
es-core/glibc/glibc-initial_2.10.1.bb
> deleted file mode 100644
> index bc3d7e4..0000000
> --- a/meta/recipes-core/glibc/glibc-initial_2.10.1.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require glibc_${PV}.bb
> -require glibc-initial.inc
> -
> -do_install_locale() {
> -	:
> -}
> -
> -do_configure_prepend () {
> -	unset CFLAGS
> -}
> diff --git a/meta/recipes-core/glibc/glibc-locale_2.10.1.bb b/meta/recipe=
s-core/glibc/glibc-locale_2.10.1.bb
> deleted file mode 100644
> index 1ddc40e..0000000
> --- a/meta/recipes-core/glibc/glibc-locale_2.10.1.bb
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -INHIBIT_DEFAULT_DEPS =3D "1"
> -LICENSE =3D "LGPL"
> -
> -BPN =3D "glibc"
> -
> -do_fetch[noexec] =3D "1"
> -do_unpack[noexec] =3D "1"
> -do_patch[noexec] =3D "1"
> -do_configure[noexec] =3D "1"
> -do_compile[noexec] =3D "1"
> -
> -# Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GEN=
ERATION
> -# is set. The idea is to avoid running localedef on the target (at first=
 boot)
> -# to decrease initial boot time and avoid localedef being killed by the =
OOM
> -# killer which used to effectively break i18n on machines with < 128MB R=
AM.
> -
> -# default to disabled=20
> -ENABLE_BINARY_LOCALE_GENERATION ?=3D "0"
> -ENABLE_BINARY_LOCALE_GENERATION_pn-glibc-locale-nativesdk =3D "0"
> -
> -#enable locale generation on these arches
> -# BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> -BINARY_LOCALE_ARCHES ?=3D "arm.* i[3-6]86 x86_64 powerpc mips"
> -
> -# set "1" to use cross-localedef for locale generation
> -# set "0" for qemu emulation of native localedef for locale generation
> -LOCALE_GENERATION_WITH_CROSS-LOCALEDEF =3D "1"
> -
> -PR =3D "r1"
> -
> -PKGSUFFIX =3D ""
> -PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> -
> -PROVIDES =3D "virtual/libc-locale${PKGSUFFIX}"
> -
> -PACKAGES =3D "localedef${PKGSUFFIX} ${PN}-dbg"
> -
> -PACKAGES_DYNAMIC =3D "locale-base-* \
> -                    glibc-gconv-*${PKGSUFFIX}  glibc-charmap-*  glibc-lo=
caledata-*  glibc-binary-localedata-*"
> -
> -
> -DESCRIPTION_localedef =3D "glibc: compile locale definition files"
> -
> -FILES_${PN}-dbg +=3D "${libdir}/gconv/.debug/*"
> -FILES_localedef${PKGSUFFIX} =3D "${bindir}/localedef"
> -
> -LOCALETREESRC =3D "${STAGING_INCDIR}/glibc-locale-internal-${MULTIMACH_T=
ARGET_SYS}"
> -
> -do_install () {
> -	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir}
> -	cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> -	cp -fpPR ${LOCALETREESRC}/${libdir}/locale ${D}${libdir}
> -	cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> -	cp -fpPR ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> -	cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> -	cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> -}
> -
> -inherit libc-package
> -
> -do_install[depends] +=3D "virtual/libc${PKGSUFFIX}:do_populate_sysroot"
> -
> -BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
> deleted file mode 100644
> index c1c3853..0000000
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -#
> -# For now, we will skip building of a gcc package if it is a uclibc one
> -# and our build is not a uclibc one, and we skip a glibc one if our build
> -# is a uclibc build.
> -#
> -# See the note in gcc/gcc_3.4.0.oe
> -#
> -
> -python __anonymous () {
> -    import bb, re
> -    uc_os =3D (re.match('.*uclibc*', bb.data.getVar('TARGET_OS', d, 1)) =
!=3D None)
> -    if uc_os:
> -        raise bb.parse.SkipPackage("incompatible with target %s" %
> -                                   bb.data.getVar('TARGET_OS', d, 1))
> -}
> -
> -PKGSUFFIX =3D ""
> -PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> -
> -PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd=
${PKGSUFFIX} \
> -	ldd${PKGSUFFIX} ${PN}-utils ${PN}-dev ${PN}-doc \
> -	libsegfault${PKGSUFFIX} ${PN}-extra-nss ${PN}-thread-db \
> -	${PN}-pcprofile"
> -
> -libc_baselibs =3D "${base_libdir}/libc* ${base_libdir}/libm* ${base_libd=
ir}/ld* \
> -	${base_libdir}/libpthread* ${base_libdir}/libresolv* ${base_libdir}/lib=
rt* \
> -	${base_libdir}/libutil* ${base_libdir}/libnsl* ${base_libdir}/libnss_fi=
les* \
> -	${base_libdir}/libnss_compat* ${base_libdir}/libnss_dns* ${base_libdir}=
/libdl* \
> -	${base_libdir}/libanl* ${base_libdir}/libBrokenLocale*"
> -
> -# The problem is that if PN =3D "glibc", FILES_${PN} will overwrite FILE=
S_glibc
> -# Solution: Make them both the same thing, then it doesn't matter
> -
> -glibcfiles =3D "${sysconfdir} ${libc_baselibs} ${base_sbindir}/ldconfig \
> -	${libexecdir}/* ${datadir}/zoneinfo"
> -glibcdbgfiles =3D "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
> -                  ${base_bindir}/.debug ${base_sbindir}/.debug ${base_li=
bdir}/.debug \
> -                  ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
> -glibcdevfiles =3D "${bindir}/rpcgen ${includedir} ${libdir}/lib*${SOLIBS=
DEV} ${libdir}/*.la \
> -                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
> -                ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
> -
> -FILES_glibc =3D "${glibcfiles}"
> -FILES_${PN} =3D "${glibcfiles}"
> -FILES_ldd${PKGSUFFIX} =3D "${bindir}/ldd"
> -FILES_libsegfault${PKGSUFFIX} =3D "${base_libdir}/libSegFault*"
> -FILES_glibc-extra-nss =3D "${base_libdir}/libnss*"
> -FILES_sln =3D "${base_sbindir}/sln"
> -FILES_glibc-dev =3D "${glibcdevfiles}"
> -FILES_${PN}-dev =3D "${glibcdevfiles}"
> -FILES_glibc-dbg =3D "${glibcdbgfiles}"
> -FILES_${PN}-dbg =3D "${glibcdbgfiles}"
> -FILES_nscd${PKGSUFFIX} =3D "${sbindir}/nscd* ${sysconfdir}/nscd* ${sysco=
nfdir}/init.d/nscd*"
> -FILES_glibc-utils =3D "${bindir}/* ${sbindir}/*"
> -FILES_glibc-gconv =3D "${libdir}/gconv/*"
> -FILES_catchsegv${PKGSUFFIX} =3D "${bindir}/catchsegv"
> -RDEPENDS_catchsegv${PKGSUFFIX} =3D "libsegfault"
> -FILES_glibc-pcprofile =3D "${base_libdir}/libpcprofile.so"
> -FILES_glibc-thread-db =3D "${base_libdir}/libthread_db*"
> -RPROVIDES_glibc-dev +=3D "libc-dev"
> -
> -SUMMARY_sln =3D "The static ln."
> -DESCRIPTION_sln =3D "Similar to the 'ln' utility, but statically linked.=
  sln is useful to make symbolic links to dynamic libraries if the dynamic =
linking system, for some reason, is not functional."
> -SUMMARY_nscd =3D "Name service cache daemon"
> -DESCRIPTION_nscd =3D "nscd, name service cache daemon, caches name servi=
ce lookups for the passwd, group and hosts information.  It can damatically=
 improvide performance with remote, such as NIS or NIS+, name services."
> -SUMMARY_glibc-extra-nss =3D "hesiod, NIS and NIS+ nss libraries"
> -DESCRIPTION_glibc-extra-nss =3D "glibc: nis, nisplus and hesiod search s=
ervices.
> -SUMMARY_ldd =3D "print shared library dependencies"
> -DESCRIPTION_ldd =3D "/usr/bin/ldd prints shared library dependencies for=
 each program or shared library specified on the command line."
> -SUMMARY_glibc-utils =3D "Miscellaneous utilities provided by glibc"
> -DESCRIPTION_glibc-utils =3D "Miscellaneous utilities including getconf, =
iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
> -
> -EXTRA_OEMAKE +=3D "rootsbindir=3D${base_sbindir}"
> -
> -inherit libc-common
> -
> -do_install_locale () {
> -	dest=3D${D}/${includedir}/glibc-locale-internal-${MULTIMACH_TARGET_SYS}
> -	install -d ${dest}${base_libdir} ${dest}${bindir} ${dest}${libdir} ${de=
st}${datadir}
> -	cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir}
> -	cp -fpP ${D}${bindir}/localedef ${dest}${bindir}
> -        mv ${D}${libdir}/gconv ${dest}${libdir}
> -	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
> -        mv ${D}${datadir}/i18n ${dest}${datadir}
> -	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
> -	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
> -}
> -
> -addtask do_install_locale after do_install before do_populate_sysroot
> -
> -PACKAGE_PREPROCESS_FUNCS +=3D "glibc_package_preprocess"
> -
> -glibc_package_preprocess () {
> -	rm -rf ${PKGD}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_=
SYS}
> -}
> -
> diff --git a/meta/recipes-core/glibc/glibc-stage.inc b/meta/recipes-core/=
glibc/glibc-stage.inc
> deleted file mode 100644
> index e69de29..0000000
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
> deleted file mode 100644
> index 57d693c..0000000
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -DESCRIPTION =3D "GNU C Library"
> -HOMEPAGE =3D "http://www.gnu.org/software/libc/libc.html"
> -BUGTRACKER =3D "http://sources.redhat.com/bugzilla/"
> -SECTION =3D "libs"
> -LICENSE =3D "LGPLv2.1+ & GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f=
833 \
> -                    file://elf/cache.c;beginline=3D1;endline=3D17;md5=3D=
926aac25497b1de7d630b4749005d208 \
> -                    file://COPYING.LIB;md5=3Dbbb461211a33b134d42ed5ee802=
b37ff \
> -                    file://bits/types.h;beginline=3D1;endline=3D18;md5=
=3D267938e7c0538e76f734551ec6ea908d"
> -# nptl needs unwind support in gcc, which can't be built without glibc.
> -DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
> -RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
> -#this leads to circular deps, so lets not add it yet
> -#RDEPENDS_ldd +=3D " bash"
> -#RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> -PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> -PROVIDES +=3D "virtual/libintl virtual/libiconv"
> -
> -STAGINGCC =3D "gcc-cross-intermediate"
> -STAGINGCC_virtclass-nativesdk =3D "gcc-crosssdk-intermediate"
> -PATH_prepend =3D "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
> -
> -TOOLCHAIN_OPTIONS =3D " --sysroot=3D${STAGING_DIR_TCBOOTSTRAP}"
> -
> -# siteconfig.bbclass runs configure which needs a working compiler
> -# For the compiler to work we need a working libc yet libc isn't
> -# in the sysroots directory at this point. This means the libc.so
> -# linker script won't work as the --sysroot setting isn't correct.
> -# Here we create a hacked up libc linker script and pass in the right
> -# flags to let configure work. Ugly.
> -EXTRASITECONFIG =3D "CFLAGS=3D'${CFLAGS} -Wl,-L${WORKDIR}/site_config_li=
bc -L${WORKDIR}/site_config_libc -L${SYSROOT_DESTDIR}${libdir} -L${SYSROOT_=
DESTDIR}${base_libdir} -Wl,-L${SYSROOT_DESTDIR}${libdir} -Wl,-L${SYSROOT_DE=
STDIR}${base_libdir}'"
> -siteconfig_do_siteconfig_gencache_prepend =3D " \
> -	mkdir -p ${WORKDIR}/site_config_libc; \
> -	cp ${SYSROOT_DESTDIR}${libdir}/libc.so ${WORKDIR}/site_config_libc; \
> -	sed -i -e 's# ${base_libdir}# ${SYSROOT_DESTDIR}${base_libdir}#g' -e 's=
# ${libdir}# ${SYSROOT_DESTDIR}${libdir}#g' ${WORKDIR}/site_config_libc/lib=
c.so; \
> -"
> -
> -inherit autotools
> -
> -GLIBC_EXTRA_OECONF ?=3D ""
> -INHIBIT_DEFAULT_DEPS =3D "1"
> -
> -do_rig_locales() {
> -	# If indicated, only build a limited selection of locales
> -	if [ "x${LIMIT_BUILT_LOCALES}" !=3D "x" ]; then
> -		INFILE=3D"${S}/localedata/SUPPORTED"
> -		OUTFILE=3D"${S}/localedata/SUPPORTED.tmp"
> -		head -n 3 $INFILE > $OUTFILE
> -		for i in ${LIMIT_BUILT_LOCALES}; do
> -			echo=20
> -			grep $i $INFILE >> $OUTFILE || true
> -		done
> -		head --lines=3D-1 $OUTFILE > $INFILE
> -		tail --lines=3D1 $OUTFILE | sed 's#\\##' >> $INFILE
> -	fi
> -}
> -
> -addtask rig_locales before do_compile after do_configure
> -
> -ARM_INSTRUCTION_SET =3D "arm"
> diff --git a/meta/recipes-core/glibc/glibc_2.10.1.bb b/meta/recipes-core/=
glibc/glibc_2.10.1.bb
> deleted file mode 100644
> index e76f3c0..0000000
> --- a/meta/recipes-core/glibc/glibc_2.10.1.bb
> +++ /dev/null
> @@ -1,161 +0,0 @@
> -require glibc.inc
> -
> -ARM_INSTRUCTION_SET =3D "arm"
> -
> -PACKAGES_DYNAMIC =3D "libc6*"
> -RPROVIDES_${PN}-dev =3D "libc6-dev virtual-libc-dev"
> -
> -PR =3D "r7"
> -
> -# the -isystem in bitbake.conf screws up glibc do_stage
> -BUILD_CPPFLAGS =3D "-I${STAGING_INCDIR_NATIVE}"
> -TARGET_CPPFLAGS =3D "-I${STAGING_DIR_TARGET}${includedir}"
> -
> -GLIBC_ADDONS ?=3D "ports,nptl,libidn"
> -
> -GLIBC_BROKEN_LOCALES =3D " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET=
 gez_ER bn_BD te_IN"
> -
> -FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-${PV}', '$=
{FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files'=
, '${FILE_DIRNAME}' ], d)}"
> -
> -#
> -# For now, we will skip building of a gcc package if it is a uclibc one
> -# and our build is not a uclibc one, and we skip a glibc one if our build
> -# is a uclibc build.
> -#
> -# See the note in gcc/gcc_3.4.0.oe
> -#
> -
> -python __anonymous () {
> -    import bb, re
> -    uc_os =3D (re.match('.*uclibc$', bb.data.getVar('TARGET_OS', d, 1)) =
!=3D None)
> -    if uc_os:
> -        raise bb.parse.SkipPackage("incompatible with target %s" %
> -                                   bb.data.getVar('TARGET_OS', d, 1))
> -}
> -
> -RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
> -
> -#	   file://noinfo.patch;patch=3D1
> -#	   file://ldconfig.patch;patch=3D1;pnum=3D0
> -#	   file://arm-machine-gmon.patch;patch=3D1;pnum=3D0
> -#	   file://arm-ioperm.patch;patch=3D1;pnum=3D0
> -#	   file://ldd.patch;patch=3D1;pnum=3D0
> -SRC_URI =3D "${GNU_MIRROR}/glibc/glibc-${PV}.tar.bz2 \
> -           ${GNU_MIRROR}/glibc/glibc-ports-${PV}.tar.bz2 \
> -           ${GNU_MIRROR}/glibc/glibc-libidn-${PV}.tar.bz2 \
> -           file://nscd-init.patch;striplevel=3D0 \
> -           file://arm-memcpy.patch \
> -           file://arm-longlong.patch \
> -           file://fhs-linux-paths.patch \
> -           file://dl-cache-libcmp.patch \
> -           file://ldsocache-varrun.patch \
> -           file://nptl-crosscompile.patch \
> -           file://glibc-check_pf.patch;striplevel=3D0 \
> -           file://ldd-unbash.patch \
> -           file://glibc-arm-IO-acquire-lock-fix.diff \
> -           file://mips-rld-map-check.patch \
> -           file://generic-bits_select.h \
> -           file://generic-bits_types.h \
> -           file://generic-bits_typesizes.h \
> -           file://generic-bits_time.h \
> -           file://etc/ld.so.conf \
> -           file://generate-supported.mk \
> -           file://march-i686.patch;striplevel=3D0 \
> -           file://rulesfix.patch \
> -           file://glibc-2.9-enable-binutils-2.2.patch"
> -
> -# Build fails on sh3 and sh4 without additional patches
> -SRC_URI_append_sh3 =3D " file://no-z-defs.patch"
> -SRC_URI_append_sh4 =3D " file://no-z-defs.patch"
> -
> -#powerpc patches to add support for soft-float
> -SRC_URI_append_powerpc=3D " file://powerpc-sqrt-hack.diff"
> -
> -S =3D "${WORKDIR}/glibc-${PV}"
> -B =3D "${WORKDIR}/build-${TARGET_SYS}"
> -
> -# We need this for nativesdk
> -export libc_cv_slibdir =3D "${base_libdir}"
> -
> -EXTRA_OECONF =3D "--enable-kernel=3D${OLDEST_KERNEL} \
> -                --without-cvs --disable-profile --disable-debug --withou=
t-gd \
> -                --enable-clocale=3Dgnu \
> -                --enable-add-ons=3D${GLIBC_ADDONS} \
> -                --with-headers=3D${STAGING_INCDIR} \
> -                --without-selinux \
> -                ${GLIBC_EXTRA_OECONF}"
> -
> -EXTRA_OECONF +=3D "${@get_libc_fpu_setting(bb, d)}"
> -
> -do_munge() {
> -	# Integrate ports and libidn into tree
> -	mv ${WORKDIR}/glibc-ports-${PV} ${S}/ports
> -	mv ${WORKDIR}/glibc-libidn-${PV} ${S}/libidn
> -
> -	# Ports isn't really working... Fix it
> -	# Some of this is rather dirty, but it seems to be the only
> -	# quick way to get this cruft to compile
> -	rm -rf ${S}/ports/sysdeps/unix/sysv/linux/arm/linuxthreads
> -	ln -s nptl ${S}/ports/sysdeps/unix/sysv/linux/arm/linuxthreads
> -	cp ${S}/nptl/sysdeps/pthread/bits/sigthread.h ${S}/ports/sysdeps/unix/s=
ysv/linux/arm/bits/
> -	cp ${S}/sysdeps/unix/sysv/linux/i386/bits/wchar.h ${S}/ports/sysdeps/un=
ix/sysv/linux/arm/bits/
> -	cp ${S}/sysdeps/wordsize-32/bits/wordsize.h ${S}/ports/sysdeps/unix/sys=
v/linux/arm/bits/
> -	cp ${WORKDIR}/generic-bits_select.h ${S}/ports/sysdeps/unix/sysv/linux/=
arm/bits/select.h
> -	cp ${WORKDIR}/generic-bits_types.h ${S}/ports/sysdeps/unix/sysv/linux/a=
rm/bits/types.h
> -	cp ${WORKDIR}/generic-bits_typesizes.h ${S}/ports/sysdeps/unix/sysv/lin=
ux/arm/bits/typesizes.h
> -	cp ${WORKDIR}/generic-bits_time.h ${S}/ports/sysdeps/unix/sysv/linux/ar=
m/bits/time.h
> -	# Copy in generic stuff for not yet implemented headers
> -	for i in ${S}/bits/*.h; do
> -		F=3D`basename $i`
> -		[ "$F" =3D "local_lim.h" ] && continue
> -		[ "$F" =3D "errno.h" ] && continue
> -		test -e ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/$F || test -e ${S}=
/ports/sysdeps/arm/bits/$F || test -e ${S}/sysdeps/unix/sysv/linux/bits/$F =
|| test -e ${S}/sysdeps/ieee754/bits/$F || cp $i ${S}/ports/sysdeps/unix/sy=
sv/linux/arm/bits/
> -	done
> -	# This is harmful; we need to get the one from nptl/sysdeps/pthreads
> -	rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/libc-lock.h
> -	# Obsoleted by sysdeps/arm/{fpu,eabi}/bits/fenv.h
> -	rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/fenv.h
> -	# Obsoleted by sysdeps/gnu/bits/utmp.h
> -	rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/utmp.h
> -}
> -
> -addtask munge before do_patch after do_unpack
> -
> -
> -do_configure () {
> -# /var/db was not included to FHS
> -	sed -i s:/var/db/nscd:/var/run/nscd: ${S}/nscd/nscd.h
> -# override this function to avoid the autoconf/automake/aclocal/autohead=
er
> -# calls for now
> -# don't pass CPPFLAGS into configure, since it upsets the kernel-headers
> -# version check and doesn't really help with anything
> -	if [ -z "`which rpcgen`" ]; then
> -		echo "rpcgen not found.  Install glibc-devel."
> -		exit 1
> -	fi
> -	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
> -	CPPFLAGS=3D"" oe_runconf
> -}
> -
> -rpcsvc =3D "bootparam_prot.x nlm_prot.x rstat.x \
> -          yppasswd.x klm_prot.x rex.x sm_inter.x mount.x \
> -          rusers.x spray.x nfs_prot.x rquota.x key_prot.x"
> -
> -do_compile () {
> -	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if anothe=
r glibc is in staging
> -	unset LDFLAGS
> -	base_do_compile
> -	(
> -		cd ${S}/sunrpc/rpcsvc
> -		for r in ${rpcsvc}; do
> -			h=3D`echo $r|sed -e's,\.x$,.h,'`
> -			rpcgen -h $r -o $h || bbwarn "unable to generate header for $r"
> -		done
> -	)
> -}
> -
> -require glibc-stage.inc
> -
> -require glibc-package.inc
> -
> -BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-core/glibc/site_config/funcs b/meta/recipes-cor=
e/glibc/site_config/funcs
> deleted file mode 100644
> index ccc8539..0000000
> --- a/meta/recipes-core/glibc/site_config/funcs
> +++ /dev/null
> @@ -1,474 +0,0 @@
> -a64l
> -abs
> -access
> -__adjtimex
> -alarm
> -alphasort
> -argz_append
> -__argz_count
> -argz_create_sep
> -argz_insert
> -__argz_next
> -argz_next
> -__argz_stringify
> -argz_stringify
> -asprintf
> -atexit
> -atof
> -atoi
> -bcmp
> -bcopy
> -bindresvport
> -bind_textdomain_codeset
> -btowc
> -bzero
> -calloc
> -canonicalize_file_name
> -catgets
> -cfgetospeed
> -cfsetispeed
> -cfsetspeed
> -chmod
> -chown
> -chroot
> -clock
> -close
> -closedir
> -closelog
> -confstr
> -connect
> -daemon
> -dcgettext
> -difftime
> -dirfd
> -dirname
> -dngettext
> -dup2
> -ecvt
> -endgrent
> -endmntent
> -endpwent
> -endutent
> -endutxent
> -epoll_ctl
> -err
> -ether_hostton
> -ether_ntohost
> -euidaccess
> -execv
> -fchdir
> -fchmod
> -fchmodat
> -fchown
> -fchownat
> -fcntl
> -fcvt
> -fdatasync
> -fdopendir
> -feof_unlocked
> -fgets_unlocked
> -fgetxattr
> -finite
> -flistxattr
> -flock
> -flockfile
> -fnmatch
> -fork
> -fpathconf
> -__fpending
> -fprintf
> -free
> -freeaddrinfo
> -freeifaddrs
> -fseeko
> -__fsetlocking
> -fsetxattr
> -fstat64
> -fstat
> -fstatfs
> -fsync
> -ftello
> -ftime
> -ftruncate
> -funlockfile
> -futimes
> -futimesat
> -gai_strerror
> -gcvt
> -getaddrinfo
> -getc_unlocked
> -getcwd
> -getdelim
> -getdomainname
> -getdtablesize
> -getegid
> -getenv
> -geteuid
> -getgid
> -getgrent
> -getgrent_r
> -getgrgid_r
> -getgrnam
> -getgrnam_r
> -getgrouplist
> -getgroups
> -gethostbyaddr_r
> -gethostbyname2
> -gethostbyname
> -gethostbyname_r
> -gethostent
> -gethostid
> -gethostname
> -getifaddrs
> -getline
> -getloadavg
> -getmntent
> -getmsg
> -getnameinfo
> -getnetbyaddr_r
> -getnetgrent_r
> -getopt
> -getopt_long
> -getopt_long_only
> -getpagesize
> -getpass
> -getpeername
> -getpgrp
> -getpid
> -getppid
> -getprotoent_r
> -getpwent
> -getpwent_r
> -getpwnam
> -getpwnam_r
> -getpwuid
> -getpwuid_r
> -getresuid
> -getrlimit
> -getrusage
> -getservbyname
> -getservbyname_r
> -getservbyport_r
> -getservent
> -getservent_r
> -getspnam
> -getspnam_r
> -gettimeofday
> -getttyent
> -getttynam
> -getuid
> -getusershell
> -getutent
> -getutid
> -getutline
> -getutmp
> -getutmpx
> -getutxent
> -getutxid
> -getutxline
> -getwd
> -getxattr
> -glob
> -gmtime
> -gmtime_r
> -grantpt
> -group_member
> -herror
> -hstrerror
> -iconv
> -iconv_open
> -if_freenameindex
> -if_indextoname
> -if_nameindex
> -if_nametoindex
> -index
> -inet_addr
> -inet_aton
> -inet_ntoa
> -inet_ntop
> -inet_pton
> -initgroups
> -innetgr
> -iruserok
> -isascii
> -isatty
> -isblank
> -isgraph
> -isinf
> -isnan
> -isprint
> -isspace
> -iswalnum
> -iswcntrl
> -iswctype
> -iswprint
> -iswspace
> -iswupper
> -isxdigit
> -kill
> -killpg
> -lchown
> -lckpwdf
> -lgetxattr
> -link
> -listxattr
> -llistxattr
> -localtime
> -localtime_r
> -lockf
> -lrand48
> -lsearch
> -lseek64
> -lsetxattr
> -lstat
> -mallinfo
> -malloc
> -mblen
> -mbrlen
> -mbrtowc
> -mbsinit
> -mbsrtowcs
> -mbtowc
> -memalign
> -memchr
> -memcmp
> -memcpy
> -memmove
> -mempcpy
> -memrchr
> -memset
> -mkdir
> -mkdirat
> -mkdtemp
> -mkfifo
> -mknod
> -mkstemp64
> -mkstemp
> -mktime
> -mlock
> -mmap
> -mtrace
> -munlock
> -munmap
> -nanosleep
> -nice
> -nl_langinfo
> -ntp_adjtime
> -ntp_gettime
> -_obstack_free
> -on_exit
> -open64
> -open
> -openat
> -opendir
> -openlog
> -pathconf
> -pipe
> -poll
> -popen
> -posix_memalign
> -prctl
> -pread
> -printf
> -__progname
> -pselect
> -pthread_mutex_lock
> -ptsname
> -putenv
> -putgrent
> -putpwent
> -putspent
> -pututline
> -pututxline
> -putwc
> -pwrite
> -qsort
> -raise
> -rand
> -random
> -rand_r
> -read
> -readdir
> -readdir_r
> -readlink
> -realloc
> -realpath
> -re_comp
> -recvmsg
> -re_exec
> -regcomp
> -regexec
> -remove
> -rename
> -re_search
> -rmdir
> -rpmatch
> -rresvport_af
> -ruserok
> -ruserok_af
> -sbrk
> -scandir
> -sched_setscheduler
> -sched_yield
> -__secure_getenv
> -select
> -semctl
> -semget
> -sendmsg
> -setbuf
> -setbuffer
> -setegid
> -setenv
> -seteuid
> -setgid
> -setgroups
> -sethostname
> -setitimer
> -_setjmp
> -setjmp
> -setlinebuf
> -setlocale
> -setmntent
> -setpgid
> -setpgrp
> -setpriority
> -setregid
> -setresgid
> -setresuid
> -setreuid
> -setrlimit
> -setsid
> -setsockopt
> -settimeofday
> -setuid
> -setutent
> -setutxent
> -setvbuf
> -setxattr
> -sgetspent
> -shmat
> -shmctl
> -shmdt
> -shmget
> -shutdown
> -sigaction
> -sigaddset
> -sigaltstack
> -sigblock
> -sigemptyset
> -sighold
> -siginterrupt
> -signal
> -sigprocmask
> -sigset
> -sigsetmask
> -sigstack
> -sigsuspend
> -sigvec
> -snprintf
> -socket
> -socketpair
> -sprintf
> -srand48
> -srand
> -srandom
> -sscanf
> -stat
> -statfs
> -statvfs
> -stime
> -stpcpy
> -strcasecmp
> -strcasestr
> -strchr
> -strchrnul
> -strcmp
> -strcspn
> -strdup
> -strerror
> -strerror_r
> -strftime
> -strlen
> -strncasecmp
> -strncmp
> -strndup
> -strnlen
> -strpbrk
> -strptime
> -strrchr
> -strsep
> -strsignal
> -strspn
> -strstr
> -strtod
> -strtoimax
> -strtok_r
> -strtol
> -strtoll
> -strtoul
> -strtoull
> -strtoumax
> -strverscmp
> -strxfrm
> -symlink
> -sync
> -sysconf
> -sysctl
> -sysinfo
> -syslog
> -_sys_siglist
> -sys_siglist
> -system
> -tcgetattr
> -tcgetpgrp
> -tcsetattr
> -tcsetpgrp
> -time
> -timegm
> -times
> -timezone
> -tmpnam
> -towlower
> -towupper
> -truncate
> -tsearch
> -ttyname
> -tzset
> -ulimit
> -umask
> -uname
> -unlink
> -unsetenv
> -unshare
> -updwtmp
> -updwtmpx
> -usleep
> -ustat
> -utime
> -utimes
> -utmpname
> -utmpxname
> -valloc
> -vasprintf
> -verrx
> -vfork
> -vfprintf
> -vfscanf
> -vhangup
> -vprintf
> -vsnprintf
> -vsprintf
> -wait3
> -wait4
> -waitpid
> -wcrtomb
> -wcscoll
> -wcsdup
> -wcslen
> -wctob
> -wctomb
> -wctype
> -wcwidth
> -wmemchr
> -wmemcpy
> -wmempcpy
> diff --git a/meta/recipes-core/glibc/site_config/headers b/meta/recipes-c=
ore/glibc/site_config/headers
> deleted file mode 100644
> index 609ab53..0000000
> --- a/meta/recipes-core/glibc/site_config/headers
> +++ /dev/null
> @@ -1,156 +0,0 @@
> -aio.h
> -alloca.h
> -argz.h
> -arpa/inet.h
> -arpa/nameser.h
> -asm/byteorder.h
> -asm/ioctls.h
> -asm/page.h
> -asm/types.h
> -assert.h
> -byteswap.h
> -crypt.h
> -ctype.h
> -dirent.h
> -dlfcn.h
> -elf.h
> -endian.h
> -err.h
> -errno.h
> -execinfo.h
> -fcntl.h
> -features.h
> -float.h
> -fstab.h
> -ftw.h
> -getopt.h
> -glob.h
> -grp.h
> -iconv.h
> -ifaddrs.h
> -inttypes.h
> -langinfo.h
> -lastlog.h
> -libgen.h
> -libintl.h
> -limits.h
> -linux/capability.h
> -linux/fd.h
> -linux/fs.h
> -linux/hayesesp.h
> -linux/hdreg.h
> -linux/icmp.h
> -linux/in6.h
> -linux/joystick.h
> -linux/ptrace.h
> -linux/serial.h
> -linux/sonypi.h
> -linux/unistd.h
> -linux/utsname.h
> -linux/version.h
> -locale.h
> -malloc.h
> -math.h
> -mcheck.h
> -memory.h
> -mntent.h
> -mqueue.h
> -netdb.h
> -net/if.h
> -netinet/ether.h
> -netinet/in.h
> -netinet/ip6.h
> -netinet/ip.h
> -netinet/tcp.h
> -netinet/udp.h
> -netipx/ipx.h
> -net/route.h
> -paths.h
> -poll.h
> -pthread.h
> -pty.h
> -pwd.h
> -regex.h
> -resolv.h
> -rpc/rpc.h
> -rpc/types.h
> -sched.h
> -scsi/scsi.h
> -search.h
> -semaphore.h
> -setjmp.h
> -sgtty.h
> -shadow.h
> -signal.h
> -stdarg.h
> -stdbool.h
> -stdc
> -stddef.h
> -stdint.h
> -stdio.h
> -stdlib.h
> -string.h
> -strings.h
> -stropts.h
> -sys/bitypes.h
> -sys/cdefs.h
> -sys/dir.h
> -sys/epoll.h
> -sysexits.h
> -sys/fcntl.h
> -sys/file.h
> -sys/fsuid.h
> -sys/ioctl.h
> -sys/ipc.h
> -syslog.h
> -sys/mman.h
> -sys/mount.h
> -sys/mtio.h
> -sys/param.h
> -sys/poll.h
> -sys/prctl.h
> -sys/ptrace.h
> -sys/queue.h
> -sys/reg.h
> -sys/resource.h
> -sys/select.h
> -sys/sem.h
> -sys/shm.h
> -sys/signal.h
> -sys/socket.h
> -sys/socketvar.h
> -sys/soundcard.h
> -sys/statfs.h
> -sys/stat.h
> -sys/statvfs.h
> -sys/stropts.h
> -sys/swap.h
> -sys/sysctl.h
> -sys/sysinfo.h
> -sys/sysmacros.h
> -sys/termios.h
> -sys/timeb.h
> -sys/time.h
> -sys/times.h
> -sys/timex.h
> -sys/types.h
> -sys/uio.h
> -sys/un.h
> -sys/unistd.h
> -sys/user.h
> -sys/utsname.h
> -sys/vfs.h
> -sys/wait.h
> -termio.h
> -termios.h
> -time.h
> -ttyent.h
> -ulimit.h
> -unistd.h
> -ustat.h
> -utime.h
> -utmp.h
> -utmpx.h
> -values.h
> -wchar.h
> -wctype.h
> diff --git a/meta/recipes-core/glibc/site_config/types b/meta/recipes-cor=
e/glibc/site_config/types
> deleted file mode 100644
> index 178bd85..0000000
> --- a/meta/recipes-core/glibc/site_config/types
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -char
> -char *
> -double
> -float
> -int
> -long
> -long double
> -long int
> -long long
> -long long int
> -short
> -short int
> -signed char
> -unsigned char
> -unsigned int
> -unsigned long
> -unsigned long int
> -unsigned long long int
> -unsigned short
> -unsigned short int
> -void *
> --=20
> 1.7.4.1
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4wWsgACgkQN1Ujt2V2gByqlACfUqMJ0YfNkJq9qwtyd+IN+mUP
F1cAnjIUNQu7RNDD3kZHS26NG+w4wh0U
=zDfj
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--
