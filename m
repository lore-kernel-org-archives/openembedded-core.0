Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qm8wC-0007PN-EG
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 20:34:33 +0200
Received: by pzk1 with SMTP id 1so3145591pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=coZFqZgO46YgnyEs7KE5aOW7jt2NKW7yOlBoRF/QuQg=;
	b=oBleBs6bFzLHpSjHS8hnAGt+80tyyhpiHHbOq1VdPbhoa2f65UGA/jMDJRduJIO9nD
	XELS+b5TKnVneeOhvMhN2jATCImWY/Z9jt2QtrfiXCvqIEE3zfizU/L0FXVe1O+xvcR2
	tyYLG6HRgAF+M/0Nr7cdJ76TgR14NhVm8mXXw=
Received: by 10.68.36.201 with SMTP id s9mr174964pbj.345.1311791411148; Wed,
	27 Jul 2011 11:30:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Wed, 27 Jul 2011 11:29:41 -0700 (PDT)
In-Reply-To: <1311786077.30326.397.camel@phil-desktop>
References: <1311786077.30326.397.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jul 2011 11:29:41 -0700
Message-ID: <CAMKF1sofPs2QwvbTz_fi_e5xtHuOJV=qKBiBjriH=6eSjFTPaQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 27 Jul 2011 18:34:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2011 at 10:01 AM, Phil Blundell <philb@gnu.org> wrote:
> Glibc 2.10.1 is outdated now and eglibc seems to provide a superset of
> its functionality.
>
> Signed-off-by: Phil Blundell <philb@gnu.org>

Thanks for doing it.

Acked-by: Khem Raj <raj.khem@gmail.com>



> ---
> Resending as non-RFC since nobody objected to the idea.
>
> =C2=A0meta/conf/distro/include/tclibc-glibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 35 -
> =C2=A0meta/conf/distro/include/tcmode-default.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A05 -
> =C2=A0.../glibc/glibc-2.10.1/arm-longlong.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 60 --
> =C2=A0.../glibc/glibc-2.10.1/arm-memcpy.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0760 --------------------
> =C2=A0.../glibc/glibc-2.10.1/dl-cache-libcmp.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 12 -
> =C2=A0.../recipes-core/glibc/glibc-2.10.1/etc/ld.so.conf | =C2=A0 =C2=A02=
 -
> =C2=A0.../glibc/glibc-2.10.1/fhs-linux-paths.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 13 -
> =C2=A0.../glibc/glibc-2.10.1/generate-supported.mk =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 11 -
> =C2=A0.../glibc/glibc-2.10.1/generic-bits_select.h =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 35 -
> =C2=A0.../glibc/glibc-2.10.1/generic-bits_time.h =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 75 --
> =C2=A0.../glibc/glibc-2.10.1/generic-bits_types.h =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0200 -----
> =C2=A0.../glibc/glibc-2.10.1/generic-bits_typesizes.h =C2=A0 =C2=A0| =C2=
=A0 66 --
> =C2=A0.../glibc-2.9-enable-binutils-2.2.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 37 -
> =C2=A0.../glibc-arm-IO-acquire-lock-fix.diff =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 15 -
> =C2=A0.../glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch | =C2=A0 17 -
> =C2=A0.../glibc/glibc-2.10.1/glibc-check_pf.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0345 ---------
> =C2=A0.../glibc/glibc-2.10.1/ldd-unbash.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 13 -
> =C2=A0.../glibc/glibc-2.10.1/ldsocache-varrun.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 20 -
> =C2=A0.../glibc/glibc-2.10.1/march-i686.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 39 -
> =C2=A0.../glibc/glibc-2.10.1/mips-rld-map-check.patch =C2=A0 =C2=A0| =C2=
=A0 23 -
> =C2=A0.../glibc/glibc-2.10.1/nptl-crosscompile.patch =C2=A0 =C2=A0 | =C2=
=A0 28 -
> =C2=A0.../glibc/glibc-2.10.1/nscd-init.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 41 --
> =C2=A0.../glibc/glibc-2.10.1/powerpc-sqrt-hack.diff =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 27 -
> =C2=A0.../recipes-core/glibc/glibc-2.10.1/rulesfix.patch | =C2=A0 15 -
> =C2=A0meta/recipes-core/glibc/glibc-initial.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 67 --
> =C2=A0meta/recipes-core/glibc/glibc-initial_2.10.1.bb =C2=A0 =C2=A0| =C2=
=A0 10 -
> =C2=A0meta/recipes-core/glibc/glibc-locale_2.10.1.bb =C2=A0 =C2=A0 | =C2=
=A0 63 --
> =C2=A0meta/recipes-core/glibc/glibc-package.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 96 ---
> =C2=A0meta/recipes-core/glibc/glibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 60 --
> =C2=A0meta/recipes-core/glibc/glibc_2.10.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0161 -----
> =C2=A0meta/recipes-core/glibc/site_config/funcs =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0474 ------------
> =C2=A0meta/recipes-core/glibc/site_config/headers =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0156 ----
> =C2=A0meta/recipes-core/glibc/site_config/types =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 21 -
> =C2=A033 files changed, 0 insertions(+), 3002 deletions(-)
> =C2=A0delete mode 100644 meta/conf/distro/include/tclibc-glibc.inc
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/arm-longlon=
g.patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/arm-memcpy.=
patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/dl-cache-li=
bcmp.patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/etc/ld.so.c=
onf
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/fhs-linux-p=
aths.patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generate-su=
pported.mk
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bit=
s_select.h
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bit=
s_time.h
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bit=
s_types.h
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/generic-bit=
s_typesizes.h
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-2.9-e=
nable-binutils-2.2.patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-I=
O-acquire-lock-fix.diff
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-n=
o-asm-page.patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/glibc-check=
_pf.patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/ldd-unbash.=
patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/ldsocache-v=
arrun.patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/march-i686.=
patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/mips-rld-ma=
p-check.patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/nptl-crossc=
ompile.patch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/nscd-init.p=
atch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/powerpc-sqr=
t-hack.diff
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-2.10.1/rulesfix.pa=
tch
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-initial.inc
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-initial_2.10.1.bb
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-locale_2.10.1.bb
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-package.inc
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc-stage.inc
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc.inc
> =C2=A0delete mode 100644 meta/recipes-core/glibc/glibc_2.10.1.bb
> =C2=A0delete mode 100644 meta/recipes-core/glibc/site_config/funcs
> =C2=A0delete mode 100644 meta/recipes-core/glibc/site_config/headers
> =C2=A0delete mode 100644 meta/recipes-core/glibc/site_config/types
>
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
> - =C2=A0 =C2=A0libsegfault \
> - =C2=A0 =C2=A0glibc \
> - =C2=A0 =C2=A0glibc-dbg \
> - =C2=A0 =C2=A0glibc-dev \
> - =C2=A0 =C2=A0glibc-utils \
> - =C2=A0 =C2=A0glibc-thread-db \
> - =C2=A0 =C2=A0glibc-localedata-i18n \
> - =C2=A0 =C2=A0glibc-gconv-ibm850 \
> - =C2=A0 =C2=A0glibc-gconv-cp1252 \
> - =C2=A0 =C2=A0glibc-gconv-iso8859-1 \
> - =C2=A0 =C2=A0glibc-gconv-iso8859-15 \
> - =C2=A0 =C2=A0locale-base-en-gb \
> - =C2=A0 =C2=A0"
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 86538f1..dce76db 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -49,11 +49,6 @@ PREFERRED_VERSION_binutils-crosssdk ?=3D "${BINUVERSIO=
N}"
> =C2=A0PREFERRED_VERSION_binutils-cross-canadian ?=3D "${BINUVERSION}"
> =C2=A0PREFERRED_VERSION_linux-libc-headers ?=3D "${LINUXLIBCVERSION}"
> =C2=A0PREFERRED_VERSION_linux-libc-headers-nativesdk ?=3D "${LINUXLIBCVER=
SION}"
> -PREFERRED_VERSION_glibc ?=3D "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-locale ?=3D "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-nativesdk ?=3D "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-initial ?=3D "${GLIBCVERSION}"
> -PREFERRED_VERSION_glibc-initial-nativesdk ?=3D "${GLIBCVERSION}"
> =C2=A0PREFERRED_VERSION_eglibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ?=3D "${EGLIBCVERSION}"
> =C2=A0PREFERRED_VERSION_eglibc-locale =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0?=3D "${EGLIBCVERSION}"
> =C2=A0PREFERRED_VERSION_eglibc-nativesdk =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D=
 "${EGLIBCVERSION}"
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch b/me=
ta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch
> deleted file mode 100644
> index ce67d7e..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> ---- glibc-2.4/stdlib/longlong.h.ark =C2=A0 =C2=A02006-03-11 22:49:27.000=
000000 +0100
> -+++ glibc-2.4/stdlib/longlong.h =C2=A0 =C2=A0 =C2=A0 =C2=A02006-03-11 22=
:55:12.000000000 +0100
> -@@ -206,6 +206,14 @@
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"rI" ((USItype) (bh)), =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"r" ((USItype) (al)), =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"rI" ((USItype) (bl)) __CLOBBE=
R_CC)
> -+/* v3m and all higher arches have long multiply support. =C2=A0*/
> -+#if !defined(__ARM_ARCH_2__) && !defined(__ARM_ARCH_3__)
> -+#define umul_ppmm(xh, xl, a, b) \
> -+ =C2=A0__asm__ ("umull %0,%1,%2,%3" : "=3D&r" (xl), "=3D&r" (xh) : "r" =
(a), "r" (b))
> -+#define UMUL_TIME 5
> -+#define smul_ppmm(xh, xl, a, b) \
> -+ =C2=A0__asm__ ("smull %0,%1,%2,%3" : "=3D&r" (xl), "=3D&r" (xh) : "r" =
(a), "r" (b))
> -+#else
> - #define umul_ppmm(xh, xl, a, b) \
> - {register USItype __t0, __t1, __t2; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \
> - =C2=A0 __asm__ ("%@ Inlined umul_ppmm\n" =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \
> -@@ -227,7 +235,13 @@
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: "r" ((USItype) (a)), =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"r" ((USItype) (b)) __CLOBBER_=
CC );}
> - #define UMUL_TIME 20
> -+#endif
> - #define UDIV_TIME 100
> -+#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || defined(__AR=
M_ARCH_5TE__)
> -+#define count_leading_zeros(COUNT,X) =C2=A0 ((COUNT) =3D __builtin_clz =
(X))
> -+#define COUNT_LEADING_ZEROS_0 32
> -+#endif
> -+
> - #endif /* __arm__ */
> -
> - #if defined (__hppa) && W_TYPE_SIZE =3D=3D 32
> ---- glibc-2.4/ports/sysdeps/arm/mp_clz_tab.c.ark =C2=A0 =C2=A0 =C2=A0 20=
06-03-11 22:56:43.000000000 +0100
> -+++ glibc-2.4/ports/sysdeps/arm/mp_clz_tab.c =C2=A0 2006-03-11 22:58:19.=
000000000 +0100
> -@@ -0,0 +1,24 @@
> -+/* __clz_tab -- support for longlong.h
> -+ =C2=A0 Copyright (C) 2004 Free Software Foundation, Inc.
> -+ =C2=A0 This file is part of the GNU C Library.
> -+
> -+ =C2=A0 The GNU C Library is free software; you can redistribute it and=
/or
> -+ =C2=A0 modify it under the terms of the GNU Lesser General Public
> -+ =C2=A0 License as published by the Free Software Foundation; either
> -+ =C2=A0 version 2.1 of the License, or (at your option) any later versi=
on.
> -+
> -+ =C2=A0 The GNU C Library is distributed in the hope that it will be us=
eful,
> -+ =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See =
the GNU
> -+ =C2=A0 Lesser General Public License for more details.
> -+
> -+ =C2=A0 You should have received a copy of the GNU Lesser General Publi=
c
> -+ =C2=A0 License along with the GNU C Library; if not, write to the Free
> -+ =C2=A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, =
MA
> -+ =C2=A0 02111-1307 USA. =C2=A0*/
> -+
> -+#if defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || defined(__AR=
M_ARCH_5TE__)
> -+/* Nothing required. =C2=A0*/
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
> ---- /dev/null =C2=A02004-02-02 20:32:13.000000000 +0000
> -+++ sysdeps/arm/memmove.S =C2=A0 =C2=A0 =C2=A02004-03-20 18:37:23.000000=
000 +0000
> -@@ -0,0 +1,251 @@
> -+/*
> -+ * =C2=A0 Optimized memmove implementation for ARM processors
> -+ *
> -+ * =C2=A0 =C2=A0Author: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Nicolas Pitre
> -+ * =C2=A0 =C2=A0Created: =C2=A0 =C2=A0 =C2=A0 =C2=A0Dec 23, 2003
> -+ * =C2=A0 =C2=A0Copyright: =C2=A0 =C2=A0 =C2=A0(C) MontaVista Software,=
 Inc.
> -+ *
> -+ * =C2=A0 This file is free software; you can redistribute it and/or
> -+ * =C2=A0 modify it under the terms of the GNU Lesser General Public
> -+ * =C2=A0 License as published by the Free Software Foundation; either
> -+ * =C2=A0 version 2.1 of the License, or (at your option) any later ver=
sion.
> -+ *
> -+ * =C2=A0 This file is distributed in the hope that it will be useful,
> -+ * =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> -+ * =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0Se=
e the GNU
> -+ * =C2=A0 Lesser General Public License for more details.
> -+ */
> -+
> -+#include <sysdep.h>
> -+
> -+
> -+/*
> -+ * Endian independent macros for shifting bytes within registers.
> -+ */
> -+#ifndef __ARMEB__
> -+#define pull =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsr
> -+#define push =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsl
> -+#else
> -+#define pull =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsl
> -+#define push =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsr
> -+#endif
> -+
> -+/*
> -+ * Enable data preload for architectures that support it (ARMv5 and abo=
ve)
> -+ */
> -+#if defined(__ARM_ARCH_5__) || \
> -+ =C2=A0 =C2=A0defined(__ARM_ARCH_5T__) || \
> -+ =C2=A0 =C2=A0defined(__ARM_ARCH_5TE__)
> -+#define PLD(code...) =C2=A0code
> -+#else
> -+#define PLD(code...)
> -+#endif
> -+
> -+
> -+/* char * memmove (char *dst, const char *src) */
> -+ENTRY(memmove)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0ip, =
r0, r1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmphi =C2=A0 r2, ip
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bls =C2=A0 =C2=A0 memc=
py(PLT)
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmfd =C2=A0 sp!, {r0,=
 r4, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add =C2=A0 =C2=A0 r1, =
r1, r2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add =C2=A0 =C2=A0 r0, =
r0, r2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 25f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, =
r0, #3
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-4] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bne =C2=A0 =C2=A0 26f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, =
r1, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bne =C2=A0 =C2=A0 27f
> -+
> -+19: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subs =C2=A0 =C2=A0r2, r2, #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 24f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #8
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 23f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 22f
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-32] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, r2, #96 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmfd =C2=A0 sp!, {r5 =
- r8}
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 21f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0@ cache alignment =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, r1, #31 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-64] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0beq =C2=A0 =C2=A0 20f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, ip =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-96] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 20f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 ip, #16 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r2, r2, ip =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldmgedb r1!, {r3 - r6} =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0stmgedb r0!, {r3 - r6} =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0beq =C2=A0 =C2=A0 20f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0and =C2=A0 =C2=A0 ip, ip, #15 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 ip, #8 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 r3, [r1, #-4]!=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldrge =C2=A0 r4, [r1, #-4]! =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldrgt =C2=A0 r5, [r1, #-4]! =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0str =C2=A0 =C2=A0 r3, [r0, #-4]!=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0strge =C2=A0 r4, [r0, #-4]! =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0strgt =C2=A0 r5, [r0, #-4]! =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+
> -+20: =C2=A0 PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-96] =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-128] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+21: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldmdb =C2=A0 r1!, {r3, r4, ip, l=
r}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #32
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmdb =C2=A0 r0!, {r3,=
 r4, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmdb =C2=A0 r1!, {r3,=
 r4, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmgedb r0!, {r3, r4, =
ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmgedb r1!, {r3, r4, =
ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmgedb r0!, {r3, r4, =
ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmgedb r1!, {r3, r4, =
ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subges =C2=A0r2, r2, #=
32
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmdb =C2=A0 r0!, {r3,=
 r4, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bge =C2=A0 =C2=A0 20b
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 r2, #96 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0bge =C2=A0 =C2=A0 21b =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0add =C2=A0 =C2=A0 r2, r2, #96 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#31
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmfd =C2=A0 sp!, {r5 =
- r8}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmeqfd sp!, {r0, r4, =
pc}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#16
> -+22: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldmnedb r1!, {r3, r4, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmnedb r0!, {r3, r4, =
ip, lr}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#8
> -+23: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldmnedb r1!, {r3, r4}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmnedb r0!, {r3, r4}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#4
> -+24: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldrne =C2=A0 r3, [r1, #-4]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strne =C2=A0 r3, [r0, =
#-4]!
> -+
> -+25: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ands =C2=A0 =C2=A0r2, r2, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmeqfd sp!, {r0, r4, =
pc}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, =
#2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrb =C2=A0 =C2=A0r3, =
[r1, #-1]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgeb =C2=A0r4, [r1, =
#-2]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgtb =C2=A0ip, [r1, =
#-3]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strb =C2=A0 =C2=A0r3, =
[r0, #-1]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgeb =C2=A0r4, [r0, =
#-2]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgtb =C2=A0ip, [r0, =
#-3]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmfd =C2=A0 sp!, {r0,=
 r4, pc}
> -+
> -+26: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp =C2=A0 =C2=A0 ip, #2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrb =C2=A0 =C2=A0r3, =
[r1, #-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgeb =C2=A0r4, [r1, =
#-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgtb =C2=A0lr, [r1, =
#-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strb =C2=A0 =C2=A0r3, =
[r0, #-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgeb =C2=A0r4, [r0, =
#-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgtb =C2=A0lr, [r0, =
#-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, ip
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 25b
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, =
r1, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beq =C2=A0 =C2=A0 19b
> -+
> -+27: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bic =C2=A0 =C2=A0 r1, r1, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 ip, =
#2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 r3, =
[r1]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beq =C2=A0 =C2=A0 35f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 36f
> -+
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.macro =C2=A0backward_=
copy_shift push pull
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, =
#12
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-4] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 33f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #28
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmfd =C2=A0 sp!, {r5 =
- r9}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 31f
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, r2, #96 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-32] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 30f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-64] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0@ cache alignment =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, r1, #31 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-96] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0beq =C2=A0 =C2=A0 29f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, ip =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-128] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 29f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r2, r2, ip =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+28: =C2=A0 PLD( =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r4, r3, push #\push =C2=
=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 r3, [r1, #-4]!=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0subs =C2=A0 =C2=A0ip, ip, #4 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r4, r4, r3, pu=
ll #\pull )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0str =C2=A0 =C2=A0 r4, [r0, #-4]!=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0bgt =C2=A0 =C2=A0 28b =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+
> -+29: =C2=A0 PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #-128] =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+30: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 lr, r3, push #=
\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmdb =C2=A0 r1!, {r3 =
- r9, ip}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #32
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 lr, =
lr, ip, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 ip, =
ip, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 ip, =
ip, r9, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r9, =
r9, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r9, =
r9, r8, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r8, =
r8, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r8, =
r8, r7, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r7, =
r7, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r7, =
r7, r6, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r6, =
r6, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r6, =
r6, r5, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r5, =
r5, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r5, =
r5, r4, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r4, =
r4, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r4, =
r4, r3, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmdb =C2=A0 r0!, {r4 =
- r9, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bge =C2=A0 =C2=A0 29b
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 r2, #96 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0bge =C2=A0 =C2=A0 30b =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0add =C2=A0 =C2=A0 r2, r2, #96 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 r2, =
#16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 32f
> -+31: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r7, r3, push #=
\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmdb =C2=A0 r1!, {r3 =
- r6}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r2, =
r2, #16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r7, =
r7, r6, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r6, =
r6, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r6, =
r6, r5, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r5, =
r5, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r5, =
r5, r4, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r4, =
r4, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r4, =
r4, r3, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmdb =C2=A0 r0!, {r4 =
- r7}
> -+32: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adds =C2=A0 =C2=A0r2, r2, #28
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmfd =C2=A0 sp!, {r5 =
- r9}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 34f
> -+33: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r4, r3, push #=
\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 r3, =
[r1, #-4]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r4, =
r4, r3, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =C2=A0 =C2=A0 r4, =
[r0, #-4]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bge =C2=A0 =C2=A0 33b
> -+34:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.endm
> -+
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backward_copy_shift =
=C2=A0 =C2=A0 push=3D8 =C2=A0pull=3D24
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add =C2=A0 =C2=A0 r1, =
r1, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0=
 25b
> -+
> -+35: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backward_copy_shift =C2=A0 =C2=
=A0 push=3D16 pull=3D16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add =C2=A0 =C2=A0 r1, =
r1, #2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0=
 25b
> -+
> -+36: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backward_copy_shift =C2=A0 =C2=
=A0 push=3D24 pull=3D8
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add =C2=A0 =C2=A0 r1, =
r1, #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0=
 25b
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =C2=A0 memmove, =
. - memmove
> -+END(memmove)
> -+libc_hidden_builtin_def (memmove)
> ---- /dev/null =C2=A02004-02-02 20:32:13.000000000 +0000
> -+++ sysdeps/arm/bcopy.S =C2=A0 =C2=A0 =C2=A0 =C2=A02004-03-20 18:37:48.0=
00000000 +0000
> -@@ -0,0 +1,255 @@
> -+/*
> -+ * =C2=A0 Optimized memmove implementation for ARM processors
> -+ *
> -+ * =C2=A0 =C2=A0Author: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Nicolas Pitre
> -+ * =C2=A0 =C2=A0Created: =C2=A0 =C2=A0 =C2=A0 =C2=A0Dec 23, 2003
> -+ * =C2=A0 =C2=A0Copyright: =C2=A0 =C2=A0 =C2=A0(C) MontaVista Software,=
 Inc.
> -+ *
> -+ * =C2=A0 This file is free software; you can redistribute it and/or
> -+ * =C2=A0 modify it under the terms of the GNU Lesser General Public
> -+ * =C2=A0 License as published by the Free Software Foundation; either
> -+ * =C2=A0 version 2.1 of the License, or (at your option) any later ver=
sion.
> -+ *
> -+ * =C2=A0 This file is distributed in the hope that it will be useful,
> -+ * =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> -+ * =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0Se=
e the GNU
> -+ * =C2=A0 Lesser General Public License for more details.
> -+ */
> -+
> -+#include <sysdep.h>
> -+
> -+
> -+/*
> -+ * Endian independent macros for shifting bytes within registers.
> -+ */
> -+#ifndef __ARMEB__
> -+#define pull =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsr
> -+#define push =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsl
> -+#else
> -+#define pull =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsl
> -+#define push =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsr
> -+#endif
> -+
> -+/*
> -+ * Enable data preload for architectures that support it (ARMv5 and abo=
ve)
> -+ */
> -+#if defined(__ARM_ARCH_5__) || \
> -+ =C2=A0 =C2=A0defined(__ARM_ARCH_5T__) || \
> -+ =C2=A0 =C2=A0defined(__ARM_ARCH_5TE__)
> -+#define PLD(code...) =C2=A0code
> -+#else
> -+#define PLD(code...)
> -+#endif
> -+
> -+dst =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .req =C2=A0 =C2=A0r1
> -+src =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .req =C2=A0 =C2=A0r0
> -+
> -+/* void *bcopy (const char *src, char *dst, size_t size) */
> -+ENTRY(bcopy)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0ip, =
dst, src
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmphi =C2=A0 r2, ip
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0movls =C2=A0 r3, r0
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0movls =C2=A0 r0, r1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0movls =C2=A0 r1, r3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bls =C2=A0 =C2=A0 memc=
py(PLT)
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmfd =C2=A0 sp!, {r4,=
 lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add =C2=A0 =C2=A0 src,=
 src, r2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add =C2=A0 =C2=A0 dst,=
 dst, r2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 25f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, =
dst, #3
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-4] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bne =C2=A0 =C2=A0 26f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, =
src, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bne =C2=A0 =C2=A0 27f
> -+
> -+19: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subs =C2=A0 =C2=A0r2, r2, #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 24f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #8
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 23f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 22f
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-32] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, r2, #96 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmfd =C2=A0 sp!, {r5 =
- r8}
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 21f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0@ cache alignment =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, src, #31 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-64] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0beq =C2=A0 =C2=A0 20f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, ip =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-96] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 20f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 ip, #16 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r2, r2, ip =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldmgedb src!, {r3 - r6} =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0stmgedb dst!, {r3 - r6} =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0beq =C2=A0 =C2=A0 20f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0and =C2=A0 =C2=A0 ip, ip, #15 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 ip, #8 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 r3, [src, #-4]=
! =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldrge =C2=A0 r4, [src, #-4]! =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldrgt =C2=A0 r5, [src, #-4]! =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0str =C2=A0 =C2=A0 r3, [dst, #-4]=
! =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0strge =C2=A0 r4, [dst, #-4]! =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0strgt =C2=A0 r5, [dst, #-4]! =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+
> -+20: =C2=A0 PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-96] =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-128] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+21: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldmdb =C2=A0 src!, {r3, r4, ip, =
lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #32
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmdb =C2=A0 dst!, {r3=
, r4, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmdb =C2=A0 src!, {r3=
, r4, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmgedb dst!, {r3, r4,=
 ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmgedb src!, {r3, r4,=
 ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmgedb dst!, {r3, r4,=
 ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmgedb src!, {r3, r4,=
 ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subges =C2=A0r2, r2, #=
32
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmdb =C2=A0 dst!, {r3=
, r4, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bge =C2=A0 =C2=A0 20b
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 r2, #96 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0bge =C2=A0 =C2=A0 21b =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0add =C2=A0 =C2=A0 r2, r2, #96 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#31
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmfd =C2=A0 sp!, {r5 =
- r8}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmeqfd sp!, {r4, pc}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#16
> -+22: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldmnedb src!, {r3, r4, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmnedb dst!, {r3, r4,=
 ip, lr}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#8
> -+23: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldmnedb src!, {r3, r4}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmnedb dst!, {r3, r4}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#4
> -+24: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldrne =C2=A0 r3, [src, #-4]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strne =C2=A0 r3, [dst,=
 #-4]!
> -+
> -+25: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ands =C2=A0 =C2=A0r2, r2, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmeqfd sp!, {dst, r4,=
 pc}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, =
#2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrb =C2=A0 =C2=A0r3, =
[src, #-1]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgeb =C2=A0r4, [src,=
 #-2]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgtb =C2=A0ip, [src,=
 #-3]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strb =C2=A0 =C2=A0r3, =
[dst, #-1]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgeb =C2=A0r4, [dst,=
 #-2]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgtb =C2=A0ip, [dst,=
 #-3]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmfd =C2=A0 sp!, {dst=
, r4, pc}
> -+
> -+26: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp =C2=A0 =C2=A0 ip, #2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrb =C2=A0 =C2=A0r3, =
[src, #-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgeb =C2=A0r4, [src,=
 #-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgtb =C2=A0lr, [src,=
 #-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strb =C2=A0 =C2=A0r3, =
[dst, #-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgeb =C2=A0r4, [dst,=
 #-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgtb =C2=A0lr, [dst,=
 #-1]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, ip
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 25b
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, =
src, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beq =C2=A0 =C2=A0 19b
> -+
> -+27: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bic =C2=A0 =C2=A0 src, src, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 ip, =
#2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 r3, =
[src]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beq =C2=A0 =C2=A0 35f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 36f
> -+
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.macro =C2=A0backward_=
copy_shift push pull
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, =
#12
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-4] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 33f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #28
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmfd =C2=A0 sp!, {r5 =
- r9}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 31f
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, r2, #96 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-32] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 30f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-64] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0@ cache alignment =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, src, #31 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-96] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0beq =C2=A0 =C2=A0 29f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, ip =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-128] =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 29f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r2, r2, ip =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+28: =C2=A0 PLD( =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r4, r3, push #\push =C2=
=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 r3, [src, #-4]=
! =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0subs =C2=A0 =C2=A0ip, ip, #4 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r4, r4, r3, pu=
ll #\pull )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0str =C2=A0 =C2=A0 r4, [dst, #-4]=
! =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0bgt =C2=A0 =C2=A0 28b =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+
> -+29: =C2=A0 PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [src, #-128] =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+30: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 lr, r3, push #=
\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmdb =C2=A0 src!, {r3=
 - r9, ip}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #32
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 lr, =
lr, ip, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 ip, =
ip, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 ip, =
ip, r9, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r9, =
r9, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r9, =
r9, r8, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r8, =
r8, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r8, =
r8, r7, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r7, =
r7, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r7, =
r7, r6, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r6, =
r6, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r6, =
r6, r5, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r5, =
r5, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r5, =
r5, r4, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r4, =
r4, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r4, =
r4, r3, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmdb =C2=A0 dst!, {r4=
 - r9, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bge =C2=A0 =C2=A0 29b
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 r2, #96 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0bge =C2=A0 =C2=A0 30b =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0add =C2=A0 =C2=A0 r2, r2, #96 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 r2, =
#16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 32f
> -+31: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r7, r3, push #=
\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmdb =C2=A0 src!, {r3=
 - r6}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r2, =
r2, #16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r7, =
r7, r6, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r6, =
r6, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r6, =
r6, r5, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r5, =
r5, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r5, =
r5, r4, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r4, =
r4, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r4, =
r4, r3, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmdb =C2=A0 dst!, {r4=
 - r7}
> -+32: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adds =C2=A0 =C2=A0r2, r2, #28
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmfd =C2=A0 sp!, {r5 =
- r9}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 34f
> -+33: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r4, r3, push #=
\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 r3, =
[src, #-4]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r4, =
r4, r3, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =C2=A0 =C2=A0 r4, =
[dst, #-4]!
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bge =C2=A0 =C2=A0 33b
> -+34:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.endm
> -+
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backward_copy_shift =
=C2=A0 =C2=A0 push=3D8 =C2=A0pull=3D24
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add =C2=A0 =C2=A0 src,=
 src, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0=
 25b
> -+
> -+35: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backward_copy_shift =C2=A0 =C2=
=A0 push=3D16 pull=3D16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add =C2=A0 =C2=A0 src,=
 src, #2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0=
 25b
> -+
> -+36: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 backward_copy_shift =C2=A0 =C2=
=A0 push=3D24 pull=3D8
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add =C2=A0 =C2=A0 src,=
 src, #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0=
 25b
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =C2=A0 bcopy, . =
- bcopy
> -+END(bcopy)
> -
> ---- /dev/null =C2=A02004-02-02 20:32:13.000000000 +0000
> -+++ sysdeps/arm/memcpy.S =C2=A0 =C2=A0 =C2=A0 2004-05-02 14:33:22.000000=
000 +0100
> -@@ -0,0 +1,242 @@
> -+/*
> -+ * =C2=A0 Optimized memcpy implementation for ARM processors
> -+ *
> -+ * =C2=A0 =C2=A0Author: =C2=A0 =C2=A0 =C2=A0 =C2=A0 Nicolas Pitre
> -+ * =C2=A0 =C2=A0Created: =C2=A0 =C2=A0 =C2=A0 =C2=A0Dec 23, 2003
> -+ * =C2=A0 =C2=A0Copyright: =C2=A0 =C2=A0 =C2=A0(C) MontaVista Software,=
 Inc.
> -+ *
> -+ * =C2=A0 This file is free software; you can redistribute it and/or
> -+ * =C2=A0 modify it under the terms of the GNU Lesser General Public
> -+ * =C2=A0 License as published by the Free Software Foundation; either
> -+ * =C2=A0 version 2.1 of the License, or (at your option) any later ver=
sion.
> -+ *
> -+ * =C2=A0 This file is distributed in the hope that it will be useful,
> -+ * =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> -+ * =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0Se=
e the GNU
> -+ * =C2=A0 Lesser General Public License for more details.
> -+ */
> -+
> -+#include <sysdep.h>
> -+
> -+
> -+/*
> -+ * Endian independent macros for shifting bytes within registers.
> -+ */
> -+#ifndef __ARMEB__
> -+#define pull =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsr
> -+#define push =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsl
> -+#else
> -+#define pull =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsl
> -+#define push =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lsr
> -+#endif
> -+
> -+/*
> -+ * Enable data preload for architectures that support it (ARMv5 and abo=
ve)
> -+ */
> -+#if defined(__ARM_ARCH_5__) || \
> -+ =C2=A0 =C2=A0defined(__ARM_ARCH_5T__) || \
> -+ =C2=A0 =C2=A0defined(__ARM_ARCH_5TE__)
> -+#define PLD(code...) =C2=A0code
> -+#else
> -+#define PLD(code...)
> -+#endif
> -+
> -+
> -+/* char * memcpy (char *dst, const char *src) */
> -+
> -+ENTRY(memcpy)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmfd =C2=A0 sp!, {r0,=
 r4, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 7f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, =
r0, #3
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #0] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bne =C2=A0 =C2=A0 8f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, =
r1, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bne =C2=A0 =C2=A0 9f
> -+
> -+1: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, r2, #=
4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 6f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #8
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 5f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 4f
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, r2, #65 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmfd =C2=A0 sp!, {r5 =
- r8}
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 3f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #32] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0@ cache alignment =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, r1, #31 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #64] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0beq =C2=A0 =C2=A0 2f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0rsb =C2=A0 =C2=A0 ip, ip, #32 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, ip =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #96] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 2f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 ip, #16 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r2, r2, ip =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldmgeia r1!, {r3 - r6} =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0stmgeia r0!, {r3 - r6} =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0beq =C2=A0 =C2=A0 2f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0and =C2=A0 =C2=A0 ip, ip, #15 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 ip, #8 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 r3, [r1], #4 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldrge =C2=A0 r4, [r1], #4 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldrgt =C2=A0 r5, [r1], #4 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0str =C2=A0 =C2=A0 r3, [r0], #4 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0strge =C2=A0 r4, [r0], #4 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0strgt =C2=A0 r5, [r0], #4 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+
> -+2: =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #96] =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+3: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmia =C2=A0 r1!, {r3 - r8,=
 ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #32
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmia =C2=A0 r0!, {r3 =
- r8, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bge =C2=A0 =C2=A0 2b
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 r2, #65 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0bge =C2=A0 =C2=A0 3b =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0add =C2=A0 =C2=A0 r2, r2, #65 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#31
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmfd =C2=A0 sp!, {r5 =
- r8}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmeqfd sp!, {r0, r4, =
pc}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#16
> -+4: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmneia r1!, {r3, r4, ip, l=
r}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmneia r0!, {r3, r4, =
ip, lr}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#8
> -+5: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmneia r1!, {r3, r4}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmneia r0!, {r3, r4}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst =C2=A0 =C2=A0 r2, =
#4
> -+6: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrne =C2=A0 r3, [r1], #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strne =C2=A0 r3, [r0],=
 #4
> -+
> -+7: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ands =C2=A0 =C2=A0r2, r2, #=
3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmeqfd sp!, {r0, r4, =
pc}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, =
#2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrb =C2=A0 =C2=A0r3, =
[r1], #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgeb =C2=A0r4, [r1],=
 #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgtb =C2=A0ip, [r1]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strb =C2=A0 =C2=A0r3, =
[r0], #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgeb =C2=A0r4, [r0],=
 #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgtb =C2=A0ip, [r0]
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmfd =C2=A0 sp!, {r0,=
 r4, pc}
> -+
> -+8: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rsb =C2=A0 =C2=A0 ip, ip, #=
4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 ip, =
#2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrb =C2=A0 =C2=A0r3, =
[r1], #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgeb =C2=A0r4, [r1],=
 #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldrgtb =C2=A0lr, [r1],=
 #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strb =C2=A0 =C2=A0r3, =
[r0], #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgeb =C2=A0r4, [r0],=
 #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strgtb =C2=A0lr, [r0],=
 #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, ip
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 7b
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, =
r1, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beq =C2=A0 =C2=A0 1b
> -+
> -+9: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bic =C2=A0 =C2=A0 r1, r1, #=
3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 ip, =
#2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 lr, =
[r1], #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beq =C2=A0 =C2=A0 17f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bgt =C2=A0 =C2=A0 18f
> -+
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.macro =C2=A0forward_c=
opy_shift pull push
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, =
#12
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #0] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 15f
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #28
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmfd =C2=A0 sp!, {r5 =
- r9}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 13f
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, r2, #97 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 12f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #32] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0@ cache alignment =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0rsb =C2=A0 =C2=A0 ip, r1, #36 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #64] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ands =C2=A0 =C2=A0ip, ip, #31 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #96] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0beq =C2=A0 =C2=A0 11f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmp =C2=A0 =C2=A0 r2, ip =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #128] =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0blt =C2=A0 =C2=A0 11f =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r2, r2, ip =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+10: =C2=A0 PLD( =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r3, lr, pull #\pull =C2=
=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 lr, [r1], #4 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0subs =C2=A0 =C2=A0ip, ip, #4 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r3, r3, lr, pu=
sh #\push )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0str =C2=A0 =C2=A0 r3, [r0], #4 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0bgt =C2=A0 =C2=A0 10b =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+
> -+11: =C2=A0 PLD( =C2=A0 =C2=A0pld =C2=A0 =C2=A0 [r1, #128] =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)
> -+12: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r3, lr, pull #=
\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmia =C2=A0 r1!, {r4 =
- r9, ip, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #32
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r3, =
r3, r4, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r4, =
r4, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r4, =
r4, r5, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r5, =
r5, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r5, =
r5, r6, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r6, =
r6, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r6, =
r6, r7, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r7, =
r7, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r7, =
r7, r8, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r8, =
r8, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r8, =
r8, r9, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r9, =
r9, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r9, =
r9, ip, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 ip, =
ip, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 ip, =
ip, lr, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmia =C2=A0 r0!, {r3 =
- r9, ip}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bge =C2=A0 =C2=A0 11b
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 r2, #97 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0bge =C2=A0 =C2=A0 12b =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0PLD( =C2=A0 =C2=A0add =C2=A0 =C2=A0 r2, r2, #97 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmn =C2=A0 =C2=A0 r2, =
#16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 14f
> -+13: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r3, lr, pull #=
\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmia =C2=A0 r1!, {r4 =
- r6, lr}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r2, =
r2, #16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r3, =
r3, r4, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r4, =
r4, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r4, =
r4, r5, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r5, =
r5, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r5, =
r5, r6, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov =C2=A0 =C2=A0 r6, =
r6, pull #\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r6, =
r6, lr, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stmia =C2=A0 r0!, {r3 =
- r6}
> -+14: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adds =C2=A0 =C2=A0r2, r2, #28
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldmfd =C2=A0 sp!, {r5 =
- r9}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blt =C2=A0 =C2=A0 16f
> -+15: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r3, lr, pull #=
\pull
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr =C2=A0 =C2=A0 lr, =
[r1], #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subs =C2=A0 =C2=A0r2, =
r2, #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0orr =C2=A0 =C2=A0 r3, =
r3, lr, push #\push
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =C2=A0 =C2=A0 r3, =
[r0], #4
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bge =C2=A0 =C2=A0 15b
> -+16:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.endm
> -+
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0forward_copy_shift =C2=
=A0 =C2=A0 =C2=A0pull=3D8 =C2=A0push=3D24
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r1, =
r1, #3
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0=
 7b
> -+
> -+17: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 forward_copy_shift =C2=A0 =C2=A0=
 =C2=A0pull=3D16 push=3D16
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r1, =
r1, #2
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0=
 7b
> -+
> -+18: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 forward_copy_shift =C2=A0 =C2=A0=
 =C2=A0pull=3D24 push=3D8
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sub =C2=A0 =C2=A0 r1, =
r1, #1
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0=
 7b
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =C2=A0 memcpy, .=
 - memcpy
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
> ---- glibc-2.4/elf/Versions.ark 2006-03-11 23:30:09.000000000 +0100
> -+++ glibc-2.4/elf/Versions =C2=A0 =C2=A0 2006-03-11 23:31:44.000000000 +=
0100
> -@@ -63,5 +63,7 @@
> - =C2=A0 =C2=A0 _dl_debug_state;
> - =C2=A0 =C2=A0 # Pointer protection.
> - =C2=A0 =C2=A0 __pointer_chk_guard;
> -+ =C2=A0 =C2=A0# for ldconfig
> -+ =C2=A0 =C2=A0_dl_cache_libcmp;
> - =C2=A0 }
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
> ---- glibc-2.1.1/sysdeps/unix/sysv/linux/paths.h~ =C2=A0 =C2=A0 =C2=A0 Th=
u May 27 13:16:33 1999
> -+++ glibc-2.1.1/sysdeps/unix/sysv/linux/paths.h =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Thu May 27 13:17:55 1999
> -@@ -71,7 +71,7 @@
> - /* Provide trailing slash, since mostly used for building pathnames. */
> - #define =C2=A0 =C2=A0 =C2=A0 _PATH_DEV =C2=A0 =C2=A0 =C2=A0 "/dev/"
> - #define =C2=A0 =C2=A0 =C2=A0 _PATH_TMP =C2=A0 =C2=A0 =C2=A0 "/tmp/"
> --#define =C2=A0 =C2=A0 =C2=A0 _PATH_VARDB =C2=A0 =C2=A0 "/var/db/"
> -+#define =C2=A0 =C2=A0 =C2=A0 _PATH_VARDB =C2=A0 =C2=A0 "/var/lib/misc/"
> - #define =C2=A0 =C2=A0 =C2=A0 _PATH_VARRUN =C2=A0 =C2=A0"/var/run/"
> - #define =C2=A0 =C2=A0 =C2=A0 _PATH_VARTMP =C2=A0 =C2=A0"/var/tmp/"
> -
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
> - =C2=A0 =C2=A0 =C2=A0 rm -f $(OUT)
> - =C2=A0 =C2=A0 =C2=A0 touch $(OUT)
> - =C2=A0 =C2=A0 =C2=A0 for locale in $(SUPPORTED-LOCALES); do \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ $$locale =3D true ] =
&& continue; \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $$locale | sed 's=
,/, ,' >> $(OUT); \
> - =C2=A0 =C2=A0 =C2=A0 done
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_select.h b=
/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_select.h
> deleted file mode 100644
> index 47e7ded..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_select.h
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -/* Copyright (C) 1997, 1998, 2001 Free Software Foundation, Inc.
> - =C2=A0 This file is part of the GNU C Library.
> -
> - =C2=A0 The GNU C Library is free software; you can redistribute it and/=
or
> - =C2=A0 modify it under the terms of the GNU Lesser General Public
> - =C2=A0 License as published by the Free Software Foundation; either
> - =C2=A0 version 2.1 of the License, or (at your option) any later versio=
n.
> -
> - =C2=A0 The GNU C Library is distributed in the hope that it will be use=
ful,
> - =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> - =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See t=
he GNU
> - =C2=A0 Lesser General Public License for more details.
> -
> - =C2=A0 You should have received a copy of the GNU Lesser General Public
> - =C2=A0 License along with the GNU C Library; if not, write to the Free
> - =C2=A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, M=
A
> - =C2=A0 02111-1307 USA. =C2=A0*/
> -
> -#ifndef _SYS_SELECT_H
> -# error "Never use <bits/select.h> directly; include <sys/select.h> inst=
ead."
> -#endif
> -
> -
> -/* We don't use `memset' because this would require a prototype and
> - =C2=A0 the array isn't too big. =C2=A0*/
> -#define __FD_ZERO(s) \
> - =C2=A0do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> - =C2=A0 =C2=A0unsigned int __i; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\
> - =C2=A0 =C2=A0fd_set *__arr =3D (s); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> - =C2=A0 =C2=A0for (__i =3D 0; __i < sizeof (fd_set) / sizeof (__fd_mask)=
; ++__i) =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> - =C2=A0 =C2=A0 =C2=A0__FDS_BITS (__arr)[__i] =3D 0; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> - =C2=A0} while (0)
> -#define __FD_SET(d, s) =C2=A0 =C2=A0 (__FDS_BITS (s)[__FDELT(d)] |=3D __=
FDMASK(d))
> -#define __FD_CLR(d, s) =C2=A0 =C2=A0 (__FDS_BITS (s)[__FDELT(d)] &=3D ~_=
_FDMASK(d))
> -#define __FD_ISSET(d, s) =C2=A0 ((__FDS_BITS (s)[__FDELT(d)] & __FDMASK(=
d)) !=3D 0)
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_time.h b/m=
eta/recipes-core/glibc/glibc-2.10.1/generic-bits_time.h
> deleted file mode 100644
> index b3184d1..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_time.h
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -/* System-dependent timing definitions. =C2=A0Generic version.
> - =C2=A0 Copyright (C) 1996,1997,1999-2002,2003 Free Software Foundation,=
 Inc.
> - =C2=A0 This file is part of the GNU C Library.
> -
> - =C2=A0 The GNU C Library is free software; you can redistribute it and/=
or
> - =C2=A0 modify it under the terms of the GNU Lesser General Public
> - =C2=A0 License as published by the Free Software Foundation; either
> - =C2=A0 version 2.1 of the License, or (at your option) any later versio=
n.
> -
> - =C2=A0 The GNU C Library is distributed in the hope that it will be use=
ful,
> - =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> - =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See t=
he GNU
> - =C2=A0 Lesser General Public License for more details.
> -
> - =C2=A0 You should have received a copy of the GNU Lesser General Public
> - =C2=A0 License along with the GNU C Library; if not, write to the Free
> - =C2=A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, M=
A
> - =C2=A0 02111-1307 USA. =C2=A0*/
> -
> -/*
> - * Never include this file directly; use <time.h> instead.
> - */
> -
> -#ifndef __need_timeval
> -# ifndef _BITS_TIME_H
> -# =C2=A0define _BITS_TIME_H 1
> -
> -/* ISO/IEC 9899:1990 7.12.1: <time.h>
> - =C2=A0 The macro `CLOCKS_PER_SEC' is the number per second of the value
> - =C2=A0 returned by the `clock' function. */
> -/* CAE XSH, Issue 4, Version 2: <time.h>
> - =C2=A0 The value of CLOCKS_PER_SEC is required to be 1 million on all
> - =C2=A0 XSI-conformant systems. */
> -# =C2=A0define CLOCKS_PER_SEC =C2=A01000000l
> -
> -# =C2=A0if !defined __STRICT_ANSI__ && !defined __USE_XOPEN2K
> -/* Even though CLOCKS_PER_SEC has such a strange value CLK_TCK
> - =C2=A0 presents the real value for clock ticks per second for the syste=
m. =C2=A0*/
> -# =C2=A0 include <bits/types.h>
> -extern long int __sysconf (int);
> -# =C2=A0 define CLK_TCK ((__clock_t) __sysconf (2)) /* 2 is _SC_CLK_TCK =
*/
> -# =C2=A0endif
> -
> -# =C2=A0ifdef __USE_POSIX199309
> -/* Identifier for system-wide realtime clock. =C2=A0*/
> -# =C2=A0 define CLOCK_REALTIME =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00
> -/* Monotonic system-wide clock. =C2=A0*/
> -# =C2=A0 define CLOCK_MONOTONIC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1
> -/* High-resolution timer from the CPU. =C2=A0*/
> -# =C2=A0 define CLOCK_PROCESS_CPUTIME_ID =C2=A0 =C2=A02
> -/* Thread-specific CPU-time clock. =C2=A0*/
> -# =C2=A0 define CLOCK_THREAD_CPUTIME_ID =C2=A0 =C2=A0 3
> -
> -/* Flag to indicate time is absolute. =C2=A0*/
> -# =C2=A0 define TIMER_ABSTIME =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1
> -# =C2=A0endif
> -
> -# endif =C2=A0 =C2=A0 =C2=A0 =C2=A0/* bits/time.h */
> -#endif
> -
> -#ifdef __need_timeval
> -# undef __need_timeval
> -# ifndef _STRUCT_TIMEVAL
> -# =C2=A0define _STRUCT_TIMEVAL =C2=A0 =C2=A0 =C2=A01
> -# =C2=A0include <bits/types.h>
> -
> -/* A time value that is accurate to the nearest
> - =C2=A0 microsecond but also has a range of years. =C2=A0*/
> -struct timeval
> - =C2=A0{
> - =C2=A0 =C2=A0__time_t tv_sec; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Sec=
onds. =C2=A0*/
> - =C2=A0 =C2=A0__suseconds_t tv_usec; =C2=A0 =C2=A0 /* Microseconds. =C2=
=A0*/
> - =C2=A0};
> -# endif =C2=A0 =C2=A0 =C2=A0 =C2=A0/* struct timeval */
> -#endif /* need timeval */
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_types.h b/=
meta/recipes-core/glibc/glibc-2.10.1/generic-bits_types.h
> deleted file mode 100644
> index 65c8a9f..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/generic-bits_types.h
> +++ /dev/null
> @@ -1,200 +0,0 @@
> -/* bits/types.h -- definitions of __*_t types underlying *_t types.
> - =C2=A0 Copyright (C) 2002, 2003, 2004, 2005 Free Software Foundation, I=
nc.
> - =C2=A0 This file is part of the GNU C Library.
> -
> - =C2=A0 The GNU C Library is free software; you can redistribute it and/=
or
> - =C2=A0 modify it under the terms of the GNU Lesser General Public
> - =C2=A0 License as published by the Free Software Foundation; either
> - =C2=A0 version 2.1 of the License, or (at your option) any later versio=
n.
> -
> - =C2=A0 The GNU C Library is distributed in the hope that it will be use=
ful,
> - =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> - =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See t=
he GNU
> - =C2=A0 Lesser General Public License for more details.
> -
> - =C2=A0 You should have received a copy of the GNU Lesser General Public
> - =C2=A0 License along with the GNU C Library; if not, write to the Free
> - =C2=A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, M=
A
> - =C2=A0 02111-1307 USA. =C2=A0*/
> -
> -/*
> - * Never include this file directly; use <sys/types.h> instead.
> - */
> -
> -#ifndef =C2=A0 =C2=A0 =C2=A0 =C2=A0_BITS_TYPES_H
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0_BITS_TYPES_H =C2=A0 1
> -
> -#include <features.h>
> -#include <bits/wordsize.h>
> -
> -#define __need_size_t
> -#include <stddef.h>
> -
> -/* Convenience types. =C2=A0*/
> -typedef unsigned char __u_char;
> -typedef unsigned short int __u_short;
> -typedef unsigned int __u_int;
> -typedef unsigned long int __u_long;
> -
> -/* Fixed-size types, underlying types depend on word size and compiler. =
=C2=A0*/
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
> -/* quad_t is also 64 bits. =C2=A0*/
> -#if __WORDSIZE =3D=3D 64
> -typedef long int __quad_t;
> -typedef unsigned long int __u_quad_t;
> -#elif defined __GLIBC_HAVE_LONG_LONG
> -__extension__ typedef long long int __quad_t;
> -__extension__ typedef unsigned long long int __u_quad_t;
> -#else
> -typedef struct
> -{
> - =C2=A0long __val[2];
> -} __quad_t;
> -typedef struct
> -{
> - =C2=A0__u_long __val[2];
> -} __u_quad_t;
> -#endif
> -
> -
> -/* The machine-dependent file <bits/typesizes.h> defines __*_T_TYPE
> - =C2=A0 macros for each of the OS types we define below. =C2=A0The defin=
itions
> - =C2=A0 of those macros must use the following macros for underlying typ=
es.
> - =C2=A0 We define __S<SIZE>_TYPE and __U<SIZE>_TYPE for the signed and u=
nsigned
> - =C2=A0 variants of each of the following integer types on this machine.
> -
> - =C2=A0 =C2=A0 =C2=A0 16 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-- "natural" 16-bit type (always short)
> - =C2=A0 =C2=A0 =C2=A0 32 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-- "natural" 32-bit type (always int)
> - =C2=A0 =C2=A0 =C2=A0 64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-- "natural" 64-bit type (long or long long)
> - =C2=A0 =C2=A0 =C2=A0 LONG32 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- 32-bit=
 type, traditionally long
> - =C2=A0 =C2=A0 =C2=A0 QUAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- 6=
4-bit type, always long long
> - =C2=A0 =C2=A0 =C2=A0 WORD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- n=
atural type of __WORDSIZE bits (int or long)
> - =C2=A0 =C2=A0 =C2=A0 LONGWORD =C2=A0 =C2=A0 =C2=A0 =C2=A0-- type of __W=
ORDSIZE bits, traditionally long
> -
> - =C2=A0 We distinguish WORD/LONGWORD, 32/LONG32, and 64/QUAD so that the
> - =C2=A0 conventional uses of `long' or `long long' type modifiers match =
the
> - =C2=A0 types we define, even when a less-adorned type would be the same=
 size.
> - =C2=A0 This matters for (somewhat) portably writing printf/scanf format=
s for
> - =C2=A0 these types, where using the appropriate l or ll format modifier=
s can
> - =C2=A0 make the typedefs and the formats match up across all GNU platfo=
rms. =C2=A0If
> - =C2=A0 we used `long' when it's 64 bits where `long long' is expected, =
then the
> - =C2=A0 compiler would warn about the formats not matching the argument =
types,
> - =C2=A0 and the programmer changing them to shut up the compiler would b=
reak the
> - =C2=A0 program's portability.
> -
> - =C2=A0 Here we assume what is presently the case in all the GCC configu=
rations
> - =C2=A0 we support: long long is always 64 bits, long is always word/add=
ress size,
> - =C2=A0 and int is always 32 bits. =C2=A0*/
> -
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__S16_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0short int
> -#define __U16_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned sh=
ort int
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__S32_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int
> -#define __U32_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned in=
t
> -#define __SLONGWORD_TYPE =C2=A0 =C2=A0 =C2=A0 long int
> -#define __ULONGWORD_TYPE =C2=A0 =C2=A0 =C2=A0 unsigned long int
> -#if __WORDSIZE =3D=3D 32
> -# define __SQUAD_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__quad_t
> -# define __UQUAD_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__u_quad_t
> -# define __SWORD_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int
> -# define __UWORD_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int
> -# define __SLONG32_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0long int
> -# define __ULONG32_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0unsigned long int
> -# define __S64_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__quad_t
> -# define __U64_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__u_quad_t
> -/* We want __extension__ before typedef's that use nonstandard base type=
s
> - =C2=A0 such as `long long' in C89 mode. =C2=A0*/
> -# define __STD_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__extension=
__ typedef
> -#elif __WORDSIZE =3D=3D 64
> -# define __SQUAD_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long int
> -# define __UQUAD_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long in=
t
> -# define __SWORD_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long int
> -# define __UWORD_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long in=
t
> -# define __SLONG32_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0int
> -# define __ULONG32_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0unsigned int
> -# define __S64_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long int
> -# define __U64_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned lo=
ng int
> -/* No need to mark the typedef with __extension__. =C2=A0 */
> -# define __STD_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0typedef
> -#else
> -# error
> -#endif
> -#include <bits/typesizes.h> =C2=A0 =C2=A0/* Defines __*_T_TYPE macros. =
=C2=A0*/
> -
> -
> -__STD_TYPE __DEV_T_TYPE __dev_t; =C2=A0 =C2=A0 =C2=A0 /* Type of device =
numbers. =C2=A0*/
> -__STD_TYPE __UID_T_TYPE __uid_t; =C2=A0 =C2=A0 =C2=A0 /* Type of user id=
entifications. =C2=A0*/
> -__STD_TYPE __GID_T_TYPE __gid_t; =C2=A0 =C2=A0 =C2=A0 /* Type of group i=
dentifications. =C2=A0*/
> -__STD_TYPE __INO_T_TYPE __ino_t; =C2=A0 =C2=A0 =C2=A0 /* Type of file se=
rial numbers. =C2=A0*/
> -__STD_TYPE __INO64_T_TYPE __ino64_t; =C2=A0 /* Type of file serial numbe=
rs (LFS).*/
> -__STD_TYPE __MODE_T_TYPE __mode_t; =C2=A0 =C2=A0 /* Type of file attribu=
te bitmasks. =C2=A0*/
> -__STD_TYPE __NLINK_T_TYPE __nlink_t; =C2=A0 /* Type of file link counts.=
 =C2=A0*/
> -__STD_TYPE __OFF_T_TYPE __off_t; =C2=A0 =C2=A0 =C2=A0 /* Type of file si=
zes and offsets. =C2=A0*/
> -__STD_TYPE __OFF64_T_TYPE __off64_t; =C2=A0 /* Type of file sizes and of=
fsets (LFS). =C2=A0*/
> -__STD_TYPE __PID_T_TYPE __pid_t; =C2=A0 =C2=A0 =C2=A0 /* Type of process=
 identifications. =C2=A0*/
> -__STD_TYPE __FSID_T_TYPE __fsid_t; =C2=A0 =C2=A0 /* Type of file system =
IDs. =C2=A0*/
> -__STD_TYPE __CLOCK_T_TYPE __clock_t; =C2=A0 /* Type of CPU usage counts.=
 =C2=A0*/
> -__STD_TYPE __RLIM_T_TYPE __rlim_t; =C2=A0 =C2=A0 /* Type for resource me=
asurement. =C2=A0*/
> -__STD_TYPE __RLIM64_T_TYPE __rlim64_t; /* Type for resource measurement =
(LFS). =C2=A0*/
> -__STD_TYPE __ID_T_TYPE __id_t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* General ty=
pe for IDs. =C2=A0*/
> -__STD_TYPE __TIME_T_TYPE __time_t; =C2=A0 =C2=A0 /* Seconds since the Ep=
och. =C2=A0*/
> -__STD_TYPE __USECONDS_T_TYPE __useconds_t; /* Count of microseconds. =C2=
=A0*/
> -__STD_TYPE __SUSECONDS_T_TYPE __suseconds_t; /* Signed count of microsec=
onds. =C2=A0*/
> -
> -__STD_TYPE __DADDR_T_TYPE __daddr_t; =C2=A0 /* The type of a disk addres=
s. =C2=A0*/
> -__STD_TYPE __SWBLK_T_TYPE __swblk_t; =C2=A0 /* Type of a swap block mayb=
e? =C2=A0*/
> -__STD_TYPE __KEY_T_TYPE __key_t; =C2=A0 =C2=A0 =C2=A0 /* Type of an IPC =
key. =C2=A0*/
> -
> -/* Clock ID used in clock and timer functions. =C2=A0*/
> -__STD_TYPE __CLOCKID_T_TYPE __clockid_t;
> -
> -/* Timer ID returned by `timer_create'. =C2=A0*/
> -__STD_TYPE __TIMER_T_TYPE __timer_t;
> -
> -/* Type to represent block size. =C2=A0*/
> -__STD_TYPE __BLKSIZE_T_TYPE __blksize_t;
> -
> -/* Types from the Large File Support interface. =C2=A0*/
> -
> -/* Type to count number of disk blocks. =C2=A0*/
> -__STD_TYPE __BLKCNT_T_TYPE __blkcnt_t;
> -__STD_TYPE __BLKCNT64_T_TYPE __blkcnt64_t;
> -
> -/* Type to count file system blocks. =C2=A0*/
> -__STD_TYPE __FSBLKCNT_T_TYPE __fsblkcnt_t;
> -__STD_TYPE __FSBLKCNT64_T_TYPE __fsblkcnt64_t;
> -
> -/* Type to count file system nodes. =C2=A0*/
> -__STD_TYPE __FSFILCNT_T_TYPE __fsfilcnt_t;
> -__STD_TYPE __FSFILCNT64_T_TYPE __fsfilcnt64_t;
> -
> -__STD_TYPE __SSIZE_T_TYPE __ssize_t; /* Type of a byte count, or error. =
=C2=A0*/
> -
> -/* These few don't really vary by system, they always correspond
> - =C2=A0 to one of the other defined types. =C2=A0*/
> -typedef __off64_t __loff_t; =C2=A0 =C2=A0/* Type of file sizes and offse=
ts (LFS). =C2=A0*/
> -typedef __quad_t *__qaddr_t;
> -typedef char *__caddr_t;
> -
> -/* Duplicates info from stdint.h but this is used in unistd.h. =C2=A0*/
> -__STD_TYPE __SWORD_TYPE __intptr_t;
> -
> -/* Duplicate info from sys/socket.h. =C2=A0*/
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
> -/* bits/typesizes.h -- underlying types for *_t. =C2=A0Generic version.
> - =C2=A0 Copyright (C) 2002, 2003 Free Software Foundation, Inc.
> - =C2=A0 This file is part of the GNU C Library.
> -
> - =C2=A0 The GNU C Library is free software; you can redistribute it and/=
or
> - =C2=A0 modify it under the terms of the GNU Lesser General Public
> - =C2=A0 License as published by the Free Software Foundation; either
> - =C2=A0 version 2.1 of the License, or (at your option) any later versio=
n.
> -
> - =C2=A0 The GNU C Library is distributed in the hope that it will be use=
ful,
> - =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> - =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See t=
he GNU
> - =C2=A0 Lesser General Public License for more details.
> -
> - =C2=A0 You should have received a copy of the GNU Lesser General Public
> - =C2=A0 License along with the GNU C Library; if not, write to the Free
> - =C2=A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, M=
A
> - =C2=A0 02111-1307 USA. =C2=A0*/
> -
> -#ifndef _BITS_TYPES_H
> -# error "Never include <bits/typesizes.h> directly; use <sys/types.h> in=
stead."
> -#endif
> -
> -#ifndef =C2=A0 =C2=A0 =C2=A0 =C2=A0_BITS_TYPESIZES_H
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0_BITS_TYPESIZES_H =C2=A0 =C2=A0 =C2=
=A0 1
> -
> -/* See <bits/types.h> for the meaning of these macros. =C2=A0This file e=
xists so
> - =C2=A0 that <bits/types.h> need not vary across different GNU platforms=
. =C2=A0*/
> -
> -#define __DEV_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __UQUAD_TYPE
> -#define __UID_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __U32_TYPE
> -#define __GID_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __U32_TYPE
> -#define __INO_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __ULONGWORD_TYPE
> -#define __INO64_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 __UQUAD_TYPE
> -#define __MODE_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__U32_TYPE
> -#define __NLINK_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 __UWORD_TYPE
> -#define __OFF_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __SLONGWORD_TYPE
> -#define __OFF64_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 __SQUAD_TYPE
> -#define __PID_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __S32_TYPE
> -#define __RLIM_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__ULONGWORD_TYPE
> -#define __RLIM64_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0__UQUAD_TYPE
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__BLKCNT_T_TYPE =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __SLONGWORD_TYPE
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__BLKCNT64_T_TYPE =C2=A0 =C2=A0 =C2=
=A0 __SQUAD_TYPE
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__FSBLKCNT_T_TYPE =C2=A0 =C2=A0 =C2=
=A0 __ULONGWORD_TYPE
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__FSBLKCNT64_T_TYPE =C2=A0 =C2=A0 __U=
QUAD_TYPE
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__FSFILCNT_T_TYPE =C2=A0 =C2=A0 =C2=
=A0 __ULONGWORD_TYPE
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__FSFILCNT64_T_TYPE =C2=A0 =C2=A0 __U=
QUAD_TYPE
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__ID_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __U32_TYPE
> -#define __CLOCK_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 __SLONGWORD_TYPE
> -#define __TIME_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__SLONGWORD_TYPE
> -#define __USECONDS_T_TYPE =C2=A0 =C2=A0 =C2=A0__U32_TYPE
> -#define __SUSECONDS_T_TYPE =C2=A0 =C2=A0 __SLONGWORD_TYPE
> -#define __DADDR_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 __S32_TYPE
> -#define __SWBLK_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 __SLONGWORD_TYPE
> -#define __KEY_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __S32_TYPE
> -#define __CLOCKID_T_TYPE =C2=A0 =C2=A0 =C2=A0 __S32_TYPE
> -#define __TIMER_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *
> -#define __BLKSIZE_T_TYPE =C2=A0 =C2=A0 =C2=A0 __SLONGWORD_TYPE
> -#define __FSID_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct { int __v=
al[2]; }
> -#define __SSIZE_T_TYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 __SWORD_TYPE
> -
> -/* Number of descriptors that can fit in an `fd_set'. =C2=A0*/
> -#define =C2=A0 =C2=A0 =C2=A0 =C2=A0__FD_SETSIZE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A01024
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
> ---- glibc-2.9.orig/configure.in =C2=A0 =C2=A0 =C2=A0 =C2=A02009-10-22 15=
:38:13.000000000 +0200
> -+++ glibc-2.9/configure.in =C2=A0 =C2=A0 2009-10-22 15:37:33.000000000 +=
0200
> -@@ -844,10 +844,10 @@
> - # Accept binutils 2.13 or newer.
> - AC_CHECK_PROG_VER(AS, $AS, --version,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [GNU assembler.=
* \([0-9]*\.[0-9.]*\)],
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[2.1[3-9]*], AS=
=3D: critic_missing=3D"$critic_missing as")
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[2.1[3-9]* | 2.=
2* ], AS=3D: critic_missing=3D"$critic_missing as")
> - AC_CHECK_PROG_VER(LD, $LD, --version,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [GNU ld.* \([0-=
9][0-9]*\.[0-9.]*\)],
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[2.1[3-9]*], LD=
=3D: critic_missing=3D"$critic_missing ld")
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[2.1[3-9]* | 2.=
2* ], LD=3D: critic_missing=3D"$critic_missing ld")
> -
> - # We need the physical current working directory. =C2=A0We cannot use t=
he
> - # "pwd -P" shell builtin since that's not portable. =C2=A0Instead we tr=
y to
> ---- glibc-2.9.orig/configure =C2=A0 2009-02-26 22:28:17.000000000 +0100
> -+++ glibc-2.9/configure =C2=A0 =C2=A0 =C2=A0 =C2=A02009-10-22 15:43:11.0=
00000000 +0200
> -@@ -4531,7 +4531,7 @@
> - =C2=A0 ac_prog_version=3D`$AS --version 2>&1 | sed -n 's/^.*GNU assembl=
er.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
> - =C2=A0 case $ac_prog_version in
> - =C2=A0 =C2=A0 '') ac_prog_version=3D"v. ?.??, bad"; ac_verc_fail=3Dyes;=
;
> -- =C2=A0 =C2=A02.1[3-9]*)
> -+ =C2=A0 =C2=A02.1[3-9]* | 2.2*)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_prog_version=3D"$ac_prog_version, ok"; ac=
_verc_fail=3Dno;;
> - =C2=A0 =C2=A0 *) ac_prog_version=3D"$ac_prog_version, bad"; ac_verc_fai=
l=3Dyes;;
> -
> -@@ -4594,7 +4594,7 @@
> - =C2=A0 ac_prog_version=3D`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \(=
[0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
> - =C2=A0 case $ac_prog_version in
> - =C2=A0 =C2=A0 '') ac_prog_version=3D"v. ?.??, bad"; ac_verc_fail=3Dyes;=
;
> -- =C2=A0 =C2=A02.1[3-9]*)
> -+ =C2=A0 =C2=A02.1[3-9]* | 2.2*)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_prog_version=3D"$ac_prog_version, ok"; ac=
_verc_fail=3Dno;;
> - =C2=A0 =C2=A0 *) ac_prog_version=3D"$ac_prog_version, bad"; ac_verc_fai=
l=3Dyes;;
> -
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
> ---- /tmp/stdio-lock.h =C2=A02008-03-04 18:51:15.555038993 +0100
> -+++ glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/bits/stdio-lock.h =C2=A0=
 =C2=A0 =C2=A02008-03-04 18:51:28.445035052 +0100
> -@@ -50,6 +50,8 @@
> - =C2=A0 _IO_cleanup_region_start ((void (*) (void *)) _IO_funlockfile, (=
_fp)); =C2=A0 =C2=A0 =C2=A0\
> - =C2=A0 _IO_flockfile (_fp)
> -
> -+# define _IO_acquire_lock_clear_flags2(_fp) _IO_acquire_lock (_fp)
> -+
> - # define _IO_release_lock(_fp) \
> - =C2=A0 _IO_funlockfile (_fp); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> - =C2=A0 _IO_cleanup_region_end (0)
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
> ---- glibc-2.6.1.orig/ports/sysdeps/unix/sysv/linux/arm/ioperm.c =C2=A0 =
=C2=A0 =C2=A0 =C2=A02008-09-12 18:08:18.000000000 -0700
> -+++ glibc-2.6.1/ports/sysdeps/unix/sysv/linux/arm/ioperm.c =C2=A0 =C2=A0=
 2008-09-12 18:08:28.000000000 -0700
> -@@ -45,7 +45,6 @@
> - #include <sys/mman.h>
> -
> - #include <linux/version.h>
> --#include <asm/page.h>
> - #include <sys/sysctl.h>
> -
> - #define PATH_ARM_SYSTYPE =C2=A0 =C2=A0 =C2=A0"/etc/arm_systype"
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
> -X-Spam-Status: No, hits=3D-2.5 required=3D5.0 =C2=A0 =C2=A0 =C2=A0tests=
=3DAWL,BAYES_00,TW_CP
> -X-Spam-Check-By: sourceware.org
> -Received: from nevyn.them.org (HELO nevyn.them.org) (66.93.172.17) =C2=
=A0 =C2=A0 by sourceware.org (qpsmtpd/0.31.1) with ESMTP; Tue, 31 Oct 2006 =
17:37:11 +0000
> -Received: from drow by nevyn.them.org with local (Exim 4.54) =C2=A0 id 1=
GexXw-0007Dj-30; Tue, 31 Oct 2006 12:37:08 -0500
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
> -Mailing-List: contact libc-ports-help at sourceware dot org; run by ezml=
m
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
> ->
> -> would declaring req with attribute packed not help ?
> -> -mike
> -
> -Nope. =C2=A0"struct rtgenmsg" would still have size 4.
> -
> -Philip, are you still at all interested in this for the old ABI?
> -I don't have time to test this patch right now, but I think it
> -will work.
> -
> ---
> -Daniel Jacobowitz
> -CodeSourcery
> -
> -2006-10-31 =C2=A0Daniel Jacobowitz =C2=A0<dan@codesourcery.com>
> -
> - =C2=A0 =C2=A0 =C2=A0 * sysdeps/unix/sysv/linux/arm/check_pf.c: New file=
.
> - =C2=A0 =C2=A0 =C2=A0 * sysdeps/unix/sysv/linux/arm/eabi/check_pf.c: New=
 file.
> -
> -Upstream-Status: Inappropriate [not used]
> -
> -Index: sysdeps/unix/sysv/linux/arm/check_pf.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -RCS file: sysdeps/unix/sysv/linux/arm/check_pf.c
> -diff -N sysdeps/unix/sysv/linux/arm/check_pf.c
> ---- /dev/null =C2=A01 Jan 1970 00:00:00 -0000
> -+++ sysdeps/unix/sysv/linux/arm/check_pf.c =C2=A0 =C2=A0 31 Oct 2006 17:=
29:58 -0000
> -@@ -0,0 +1,274 @@
> -+/* Determine protocol families for which interfaces exist. =C2=A0ARM Li=
nux version.
> -+ =C2=A0 Copyright (C) 2003, 2006 Free Software Foundation, Inc.
> -+ =C2=A0 This file is part of the GNU C Library.
> -+
> -+ =C2=A0 The GNU C Library is free software; you can redistribute it and=
/or
> -+ =C2=A0 modify it under the terms of the GNU Lesser General Public
> -+ =C2=A0 License as published by the Free Software Foundation; either
> -+ =C2=A0 version 2.1 of the License, or (at your option) any later versi=
on.
> -+
> -+ =C2=A0 The GNU C Library is distributed in the hope that it will be us=
eful,
> -+ =C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ =C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0See =
the GNU
> -+ =C2=A0 Lesser General Public License for more details.
> -+
> -+ =C2=A0 You should have received a copy of the GNU Lesser General Publi=
c
> -+ =C2=A0 License along with the GNU C Library; if not, write to the Free
> -+ =C2=A0 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, =
MA
> -+ =C2=A0 02111-1307 USA. =C2=A0*/
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
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct in6addrinfo **in6ai, s=
ize_t *in6ailen)
> -+{
> -+ =C2=A0struct req
> -+ =C2=A0{
> -+ =C2=A0 =C2=A0struct nlmsghdr nlh;
> -+ =C2=A0 =C2=A0struct rtgenmsg g;
> -+ =C2=A0} req;
> -+ =C2=A0struct sockaddr_nl nladdr;
> -+
> -+ =C2=A0/* struct rtgenmsg consists of a single byte but the ARM ABI rou=
nds
> -+ =C2=A0 =C2=A0 it up to a word. =C2=A0Clear the padding explicitly here=
. =C2=A0*/
> -+ =C2=A0assert (sizeof (req.g) =3D=3D 4);
> -+ =C2=A0memset (&req.g, '\0', sizeof (req.g));
> -+
> -+ =C2=A0req.nlh.nlmsg_len =3D sizeof (req);
> -+ =C2=A0req.nlh.nlmsg_type =3D RTM_GETADDR;
> -+ =C2=A0req.nlh.nlmsg_flags =3D NLM_F_ROOT | NLM_F_MATCH | NLM_F_REQUEST=
;
> -+ =C2=A0req.nlh.nlmsg_pid =3D 0;
> -+ =C2=A0req.nlh.nlmsg_seq =3D time (NULL);
> -+ =C2=A0req.g.rtgen_family =3D AF_UNSPEC;
> -+
> -+ =C2=A0memset (&nladdr, '\0', sizeof (nladdr));
> -+ =C2=A0nladdr.nl_family =3D AF_NETLINK;
> -+
> -+ =C2=A0if (TEMP_FAILURE_RETRY (__sendto (fd, (void *) &req, sizeof (req=
), 0,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct sockaddr *) &nladdr=
,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof (nladdr))) < 0)
> -+ =C2=A0 =C2=A0return -1;
> -+
> -+ =C2=A0*seen_ipv4 =3D false;
> -+ =C2=A0*seen_ipv6 =3D false;
> -+
> -+ =C2=A0bool done =3D false;
> -+ =C2=A0char buf[4096];
> -+ =C2=A0struct iovec iov =3D { buf, sizeof (buf) };
> -+ =C2=A0struct in6ailist
> -+ =C2=A0{
> -+ =C2=A0 =C2=A0struct in6addrinfo info;
> -+ =C2=A0 =C2=A0struct in6ailist *next;
> -+ =C2=A0} *in6ailist =3D NULL;
> -+ =C2=A0size_t in6ailistlen =3D 0;
> -+
> -+ =C2=A0do
> -+ =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0struct msghdr msg =3D
> -+ =C2=A0 =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0(void *) &nladdr, sizeof (nladdr),
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&iov, 1,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A00
> -+ =C2=A0 =C2=A0 =C2=A0};
> -+
> -+ =C2=A0 =C2=A0 =C2=A0ssize_t read_len =3D TEMP_FAILURE_RETRY (__recvmsg=
 (fd, &msg, 0));
> -+ =C2=A0 =C2=A0 =C2=A0if (read_len < 0)
> -+ =C2=A0 =C2=A0 =C2=A0return -1;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (msg.msg_flags & MSG_TRUNC)
> -+ =C2=A0 =C2=A0 =C2=A0return -1;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0struct nlmsghdr *nlmh;
> -+ =C2=A0 =C2=A0 =C2=A0for (nlmh =3D (struct nlmsghdr *) buf;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 NLMSG_OK (nlmh, (size_t) read_len);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 nlmh =3D (struct nlmsghdr *) NLMSG_NEXT (n=
lmh, read_len))
> -+ =C2=A0 =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nladdr.nl_pid !=3D 0 || (pid_t) nlmh->n=
lmsg_pid !=3D pid
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| nlmh->nlmsg_seq !=3D req.n=
lh.nlmsg_seq)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nlmh->nlmsg_type =3D=3D RTM_NEWADDR)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ifaddrmsg *ifam =3D (s=
truct ifaddrmsg *) NLMSG_DATA (nlmh);
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (ifam->ifa_family)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case AF_INET:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*seen_ipv4 =3D =
true;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case AF_INET6:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*seen_ipv6 =3D =
true;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ifam->ifa_f=
lags & (IFA_F_DEPRECATED
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | IFA_F_TEMP=
ORARY
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | IFA_F_HOME=
ADDRESS))
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
truct rtattr *rta =3D IFA_RTA (ifam);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
ize_t len =3D (nlmh->nlmsg_len
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- NLMSG_LENGTH (sizeof (*if=
am)));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v=
oid *local =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v=
oid *address =3D NULL;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w=
hile (RTA_OK (rta, len))
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0switch (rta->rta_type)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0case IFA_LOCAL:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0local =3D RTA_DATA (rta);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0case IFA_ADDRESS:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0address =3D RTA_DATA (rta);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0rta =3D RTA_NEXT (rta, len);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}
> -+
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s=
truct in6ailist *newp =3D alloca (sizeof (*newp));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n=
ewp->info.flags =3D (((ifam->ifa_flags & IFA_F_DEPRECATED)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? in6=
ai_deprecated : 0)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ((if=
am->ifa_flags
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0& IFA_F_TEMPORARY)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ? in6ai_temporary : 0)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ((if=
am->ifa_flags
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0& IFA_F_HOMEADDRESS)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ? in6ai_homeaddress : 0));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m=
emcpy (newp->info.addr, address ?: local,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof (newp->info.addr));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n=
ewp->next =3D in6ailist;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
n6ailist =3D newp;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=
+in6ailistlen;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Ignore. =C2=
=A0*/
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (nlmh->nlmsg_type =3D=3D NLMSG_DONE=
)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We found the end, leave the loop.=
 =C2=A0*/
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done =3D true;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0}
> -+ =C2=A0while (! done);
> -+
> -+ =C2=A0close_not_cancel_no_status (fd);
> -+
> -+ =C2=A0if (in6ailist !=3D NULL)
> -+ =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0*in6ai =3D malloc (in6ailistlen * sizeof (**in6ai)=
);
> -+ =C2=A0 =C2=A0 =C2=A0if (*in6ai =3D=3D NULL)
> -+ =C2=A0 =C2=A0 =C2=A0return -1;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0*in6ailen =3D in6ailistlen;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0do
> -+ =C2=A0 =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0(*in6ai)[--in6ailistlen] =3D in6ailist->inf=
o;
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0in6ailist =3D in6ailist->next;
> -+ =C2=A0 =C2=A0 =C2=A0}
> -+ =C2=A0 =C2=A0 =C2=A0while (in6ailist !=3D NULL);
> -+ =C2=A0 =C2=A0}
> -+
> -+ =C2=A0return 0;
> -+}
> -+
> -+
> -+/* We don't know if we have NETLINK support compiled in in our
> -+ =C2=A0 Kernel. =C2=A0*/
> -+#if __ASSUME_NETLINK_SUPPORT =3D=3D 0
> -+/* Define in ifaddrs.h. =C2=A0*/
> -+extern int __no_netlink_support attribute_hidden;
> -+#else
> -+# define __no_netlink_support 0
> -+#endif
> -+
> -+
> -+void
> -+attribute_hidden
> -+__check_pf (bool *seen_ipv4, bool *seen_ipv6,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct in6addrinfo **in6ai, size_t *=
in6ailen)
> -+{
> -+ =C2=A0*in6ai =3D NULL;
> -+ =C2=A0*in6ailen =3D 0;
> -+
> -+ =C2=A0if (! __no_netlink_support)
> -+ =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0int fd =3D __socket (PF_NETLINK, SOCK_RAW, NETLINK=
_ROUTE);
> -+
> -+ =C2=A0 =C2=A0 =C2=A0struct sockaddr_nl nladdr;
> -+ =C2=A0 =C2=A0 =C2=A0memset (&nladdr, '\0', sizeof (nladdr));
> -+ =C2=A0 =C2=A0 =C2=A0nladdr.nl_family =3D AF_NETLINK;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0socklen_t addr_len =3D sizeof (nladdr);
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (fd >=3D 0
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&& __bind (fd, (struct sockaddr *) &nladdr,=
 sizeof (nladdr)) =3D=3D 0
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&& __getsockname (fd, (struct sockaddr *) &=
nladdr, &addr_len) =3D=3D 0
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&& make_request (fd, nladdr.nl_pid, seen_ip=
v4, seen_ipv6,
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 in6ai, in6ailen) =3D=3D 0)
> -+ =C2=A0 =C2=A0 =C2=A0/* It worked. =C2=A0*/
> -+ =C2=A0 =C2=A0 =C2=A0return;
> -+
> -+ =C2=A0 =C2=A0 =C2=A0if (fd >=3D 0)
> -+ =C2=A0 =C2=A0 =C2=A0__close (fd);
> -+
> -+#if __ASSUME_NETLINK_SUPPORT =3D=3D 0
> -+ =C2=A0 =C2=A0 =C2=A0/* Remember that there is no netlink support. =C2=
=A0*/
> -+ =C2=A0 =C2=A0 =C2=A0__no_netlink_support =3D 1;
> -+#else
> -+ =C2=A0 =C2=A0 =C2=A0/* We cannot determine what interfaces are availab=
le. =C2=A0Be
> -+ =C2=A0 =C2=A0 =C2=A0 pessimistic. =C2=A0*/
> -+ =C2=A0 =C2=A0 =C2=A0*seen_ipv4 =3D true;
> -+ =C2=A0 =C2=A0 =C2=A0*seen_ipv6 =3D true;
> -+#endif
> -+ =C2=A0 =C2=A0}
> -+
> -+#if __ASSUME_NETLINK_SUPPORT =3D=3D 0
> -+ =C2=A0/* No netlink. =C2=A0Get the interface list via getifaddrs. =C2=
=A0*/
> -+ =C2=A0struct ifaddrs *ifa =3D NULL;
> -+ =C2=A0if (getifaddrs (&ifa) !=3D 0)
> -+ =C2=A0 =C2=A0{
> -+ =C2=A0 =C2=A0 =C2=A0/* We cannot determine what interfaces are availab=
le. =C2=A0Be
> -+ =C2=A0 =C2=A0 =C2=A0 pessimistic. =C2=A0*/
> -+ =C2=A0 =C2=A0 =C2=A0*seen_ipv4 =3D true;
> -+ =C2=A0 =C2=A0 =C2=A0*seen_ipv6 =3D true;
> -+ =C2=A0 =C2=A0 =C2=A0return;
> -+ =C2=A0 =C2=A0}
> -+
> -+ =C2=A0struct ifaddrs *runp;
> -+ =C2=A0for (runp =3D ifa; runp !=3D NULL; runp =3D runp->ifa_next)
> -+ =C2=A0 =C2=A0if (runp->ifa_addr->sa_family =3D=3D PF_INET)
> -+ =C2=A0 =C2=A0 =C2=A0*seen_ipv4 =3D true;
> -+ =C2=A0 =C2=A0else if (runp->ifa_addr->sa_family =3D=3D PF_INET6)
> -+ =C2=A0 =C2=A0 =C2=A0*seen_ipv6 =3D true;
> -+
> -+ =C2=A0(void) freeifaddrs (ifa);
> -+#endif
> -+}
> -Index: sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -RCS file: sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
> -diff -N sysdeps/unix/sysv/linux/arm/eabi/check_pf.c
> ---- /dev/null =C2=A01 Jan 1970 00:00:00 -0000
> -+++ sysdeps/unix/sysv/linux/arm/eabi/check_pf.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A031 Oct 2006 17:29:58 -0000
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
> ---- glibc-2.5/elf/ldd.bash.in.org =C2=A0 =C2=A0 =C2=A02006-04-30 16:06:2=
0.000000000 +0000
> -+++ glibc-2.5/elf/ldd.bash.in =C2=A02007-03-30 19:18:57.000000000 +0000
> -@@ -110,7 +110,7 @@
> - # environments where the executed program might not have permissions
> - # to write to the console/tty. =C2=A0But only bash 3.x supports the pip=
efail
> - # option, and we don't bother to handle the case for older bash version=
s.
> --if set -o pipefail 2> /dev/null; then
> -+if false; then
> - =C2=A0 try_trace() {
> - =C2=A0 =C2=A0 eval $add_env '"$@"' | cat
> - =C2=A0 }
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
> -
> - #ifndef LD_SO_CACHE
> --# define LD_SO_CACHE SYSCONFDIR "/ld.so.cache"
> -+# define LD_SO_CACHE "/var/run/ld.so.cache"
> - #endif
> -
> - #ifndef add_system_dir
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/march-i686.patch b/meta=
/recipes-core/glibc/glibc-2.10.1/march-i686.patch
> deleted file mode 100644
> index 687235c..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/march-i686.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -2007-02-15 =C2=A0Khem Raj =C2=A0<kraj@xxxxxxxxxx>
> -
> - =C2=A0 =C2=A0 =C2=A0 * sysdeps/unix/sysv/linux/i386/sysdep.h: Re-define=
 __i686.
> - =C2=A0 =C2=A0 =C2=A0 * nptl/sysdeps/pthread/pt-initfini.c: Ditto.
> -
> -
> -Upstream-Status: Inappropriate [not used]
> -
> -Index: sysdeps/unix/sysv/linux/i386/sysdep.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- sysdeps/unix/sysv/linux/i386/sysdep.h =C2=A0 =C2=A0 =C2=A0(revision =
1469)
> -+++ sysdeps/unix/sysv/linux/i386/sysdep.h =C2=A0 =C2=A0 =C2=A0(working c=
opy)
> -@@ -29,6 +29,10 @@
> - #include <dl-sysdep.h>
> - #include <tls.h>
> -
> -+#if defined __i686 && defined __ASSEMBLER__
> -+#undef __i686
> -+#define __i686 __i686
> -+#endif
> -
> - /* For Linux we can use the system call table in the header file
> - =C2=A0 =C2=A0 =C2=A0 /usr/include/asm/unistd.h
> -Index: nptl/sysdeps/pthread/pt-initfini.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- nptl/sysdeps/pthread/pt-initfini.c (revision 1469)
> -+++ nptl/sysdeps/pthread/pt-initfini.c (working copy)
> -@@ -45,6 +45,11 @@
> - /* Embed an #include to pull in the alignment and .end directives. */
> - asm ("\n#include \"defs.h\"");
> -
> -+asm ("\n#if defined __i686 && defined __ASSEMBLER__");
> -+asm ("\n#undef __i686");
> -+asm ("\n#define __i686 __i686");
> -+asm ("\n#endif");
> -+
> - /* The initial common code ends here. */
> - asm ("\n/*@HEADER_ENDS*/");
> -
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
> ---- glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h =C2=A02009-05-16 1=
6:36:20.000000000 +0800
> -+++ glibc-2.10.1/ports/sysdeps/mips/dl-machine.h =C2=A0 =C2=A0 =C2=A0 20=
10-09-19 09:11:53.000000000 +0800
> -@@ -70,7 +70,8 @@
> - /* If there is a DT_MIPS_RLD_MAP entry in the dynamic section, fill it =
in
> - =C2=A0 =C2=A0with the run-time address of the r_debug structure =C2=A0*=
/
> - #define ELF_MACHINE_DEBUG_SETUP(l,r) \
> --do { if ((l)->l_info[DT_MIPS (RLD_MAP)]) \
> -+do { if ((l)->l_info[DT_MIPS (RLD_MAP)] && \
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 (l)->l_info[DT_MIPS (RLD_MAP)]->d_un.d_ptr=
) \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0*(ElfW(Addr) *)((l)->l_info[DT_MIPS (RLD_MAP=
)]->d_un.d_ptr) =3D \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0(ElfW(Addr)) (r); \
> - =C2=A0 =C2=A0} while (0)
> diff --git a/meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch=
 b/meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch
> deleted file mode 100644
> index 7e3d9bb..0000000
> --- a/meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Upstream-Status: Inappropriate [not used]
> -
> ---- glibc-2.4/nptl/sysdeps/pthread/configure.in.ark =C2=A0 =C2=A02006-03=
-12 00:41:40.000000000 +0100
> -+++ glibc-2.4/nptl/sysdeps/pthread/configure.in =C2=A0 =C2=A0 =C2=A0 =C2=
=A02006-03-12 00:44:08.000000000 +0100
> -@@ -45,5 +45,6 @@
> - =C2=A0 =C2=A0 AC_MSG_ERROR([the compiler must support C cleanup handlin=
g])
> - =C2=A0 fi
> - else
> -- =C2=A0AC_MSG_ERROR(forced unwind support is required)
> -+ =C2=A0AC_MSG_WARN([forced unwind support is required, can't be verifie=
d while crosscompiling])
> -+ =C2=A0AC_DEFINE(HAVE_FORCED_UNWIND)
> - fi
> ---- glibc-2.4/nptl/sysdeps/pthread/configure.ark =C2=A0 =C2=A0 =C2=A0 20=
06-03-12 00:42:47.000000000 +0100
> -+++ glibc-2.4/nptl/sysdeps/pthread/configure =C2=A0 2006-03-12 00:44:08.=
000000000 +0100
> -@@ -153,7 +153,10 @@
> - =C2=A0 =C2=A0{ (exit 1); exit 1; }; }
> - =C2=A0 fi
> - else
> -- =C2=A0{ { echo "$as_me:$LINENO: error: forced unwind support is requir=
ed" >&5
> --echo "$as_me: error: forced unwind support is required" >&2;}
> -- =C2=A0 { (exit 1); exit 1; }; }
> -+ =C2=A0{ echo "$as_me:$LINENO: WARNING: forced unwind support is requir=
ed, can't be verified while crosscompiling" >&5
> -+echo "$as_me: WARNING: forced unwind support is required, can't be veri=
fied while crosscompiling" >&2;}
> -+ =C2=A0cat >>confdefs.h <<\_ACEOF
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
> -
> - start () {
> - =C2=A0 =C2=A0 [ -d /var/run/nscd ] || mkdir /var/run/nscd
> -- =C2=A0 =C2=A0[ -d /var/db/nscd ] || mkdir /var/db/nscd
> - =C2=A0 =C2=A0 echo -n $"Starting $prog: "
> -- =C2=A0 =C2=A0daemon /usr/sbin/nscd
> -+ =C2=A0 =C2=A0/usr/sbin/nscd
> - =C2=A0 =C2=A0 RETVAL=3D$?
> - =C2=A0 =C2=A0 echo
> - =C2=A0 =C2=A0 [ $RETVAL -eq 0 ] && touch /var/lock/subsys/nscd
> -@@ -67,12 +66,10 @@
> - =C2=A0 =C2=A0 =C2=A0 # a non-privileged user
> - =C2=A0 =C2=A0 =C2=A0 rm -f /var/run/nscd/nscd.pid
> - =C2=A0 =C2=A0 =C2=A0 rm -f /var/run/nscd/socket
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0success $"$prog shutdo=
wn"
> -- =C2=A0 =C2=A0else
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failure $"$prog shutdo=
wn"
> - =C2=A0 =C2=A0 fi
> -- =C2=A0 =C2=A0echo
> -- =C2=A0 =C2=A0return $RETVAL
> -+ =C2=A0 =C2=A0echo "Done."
> -+ =C2=A0 =C2=A0# If nscd did not run, return 0 according to LSB.
> -+ =C2=A0 =C2=A0return 0
> - }
> -
> - restart() {
> -@@ -104,7 +101,8 @@
> - =C2=A0 =C2=A0 =C2=A0 ;;
> - =C2=A0 =C2=A0 force-reload | reload)
> - =C2=A0 =C2=A0 =C2=A0 echo -n $"Reloading $prog: "
> -- =C2=A0 =C2=A0 =C2=A0killproc /usr/sbin/nscd -HUP
> -+ =C2=A0 =C2=A0 =C2=A0# Use killall, initscripts-1.0-r115 don't support =
-HUP yet.
> -+ =C2=A0 =C2=A0 =C2=A0killall -HUP /usr/sbin/nscd
> - =C2=A0 =C2=A0 =C2=A0 RETVAL=3D$?
> - =C2=A0 =C2=A0 =C2=A0 echo
> - =C2=A0 =C2=A0 =C2=A0 ;;
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
> ---- ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c =C2=
=A0 =C2=A0 2006-04-14 07:44:30.000000000 +0200
> -+++ glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c =C2=A0 =C2=A0 2006-12-08 12:5=
3:32.202227000 +0100
> -@@ -25,6 +25,9 @@
> - #include <sysdep.h>
> - #include <ldsodefs.h>
> -
> -+#define __CPU_HAS_FSQRT ((GLRO(dl_hwcap) & PPC_FEATURE_64) !=3D 0)
> -+
> -+
> - static const double almost_half =3D 0.5000000000000001; /* 0.5 + 2^-53 =
*/
> - static const ieee_float_shape_type a_nan =3D {.word =3D 0x7fc00000 };
> - static const ieee_float_shape_type a_inf =3D {.word =3D 0x7f800000 };
> -diff -Nurd ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf=
.c glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c
> ---- ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c =C2=
=A0 =C2=A02006-04-14 07:44:30.000000000 +0200
> -+++ glibc-2.5/sysdeps/powerpc/fpu/e_sqrtf.c =C2=A0 =C2=A02006-12-08 12:5=
3:36.992227000 +0100
> -@@ -25,6 +25,8 @@
> - #include <sysdep.h>
> - #include <ldsodefs.h>
> -
> -+#define __CPU_HAS_FSQRT ((GLRO(dl_hwcap) & PPC_FEATURE_64) !=3D 0)
> -+
> - static const float almost_half =3D 0.50000006; =C2=A0/* 0.5 + 2^-24 */
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
> ---- glibc-2.9.orig/Makerules =C2=A0 2009-09-14 16:39:21.000000000 +0100
> -+++ glibc-2.9/Makerules =C2=A0 =C2=A0 =C2=A0 =C2=A02009-09-14 16:39:50.0=
00000000 +0100
> -@@ -173,6 +173,8 @@
> - # it's used in sysd-rules, below.
> - $(common-objpfx)%.h $(common-objpfx)%.h.d: $(..)scripts/gen-as-const.aw=
k \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0%.sym $(common-before-compile)
> -+ =C2=A0 =C2=A0 =C2=A0rm -f $(@:.h=3D.h.d)
> -+ =C2=A0 =C2=A0 =C2=A0rm -f $(@:.h.d=3D.h)
> - =C2=A0 =C2=A0 =C2=A0 $(AWK) -f $< $(filter %.sym,$^) \
> - =C2=A0 =C2=A0 =C2=A0 | $(CC) -S -o $(@:.h.d=3D.h)T3 $(CFLAGS) $(CPPFLAG=
S) -x c - \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -MD -MP -MF $(@:.h=3D.=
h.d)T -MT '$(@:.h=3D.h.d) $(@:.h.d=3D.h)'
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
> - =C2=A0 =C2=A0 =C2=A0 sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); };=
 },g' ${S}/configure
> - =C2=A0 =C2=A0 =C2=A0 chmod +x ${S}/configure
> - =C2=A0 =C2=A0 =C2=A0 find ${S} -name "configure" | xargs touch
> - =C2=A0 =C2=A0 =C2=A0 ${S}/configure --host=3D${TARGET_SYS} --build=3D${=
BUILD_SYS} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-cvs --disabl=
e-sanity-checks \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-headers=3D${STA=
GING_DIR_TARGET}${includedir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-hacker-mode
> - =C2=A0 =C2=A0 =C2=A0 if grep -q GLIBC_2.3 ${S}/ChangeLog; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # glibc-2.3.x passes c=
ross options to $(CC) when generating errlist-compat.c, which fails without=
 a real cross-compiler.
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Fortunately, we don'=
t need errlist-compat.c, since we just need .h files,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # so work around this =
by creating a fake errlist-compat.c and satisfying its dependencies.
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Another workaround m=
ight be to tell configure to not use any cross options to $(CC).
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The real fix would b=
e to get install-headers to not generate errlist-compat.c.
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make sysdeps/gnu/errli=
st.c
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p stdio-common
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 touch stdio-common/err=
list-compat.c
> - =C2=A0 =C2=A0 =C2=A0 fi
> -}
> -
> -do_compile () {
> - =C2=A0 =C2=A0 =C2=A0 :
> -}
> -
> -do_install () {
> - =C2=A0 =C2=A0 =C2=A0 oe_runmake cross-compiling=3Dyes install_root=3D${=
D} \
> - =C2=A0 =C2=A0 =C2=A0 includedir=3D'${includedir}' prefix=3D'${prefix}' =
\
> - =C2=A0 =C2=A0 =C2=A0 install-bootstrap-headers=3Dyes install-headers
> -
> - =C2=A0 =C2=A0 =C2=A0 oe_runmake csu/subdir_lib
> - =C2=A0 =C2=A0 =C2=A0 # Two headers -- stubs.h and features.h -- aren't =
installed by install-headers,
> - =C2=A0 =C2=A0 =C2=A0 # so do them by hand. =C2=A0We can tolerate an emp=
ty stubs.h for the moment.
> - =C2=A0 =C2=A0 =C2=A0 # See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00=
900.html
> - =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${includedir}/gnu/
> - =C2=A0 =C2=A0 =C2=A0 touch ${D}${includedir}/gnu/stubs.h
> - =C2=A0 =C2=A0 =C2=A0 cp ${S}/include/features.h ${D}${includedir}/featu=
res.h
> -
> - =C2=A0 =C2=A0 =C2=A0 if [ -e ${B}/bits/stdio_lim.h ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${B}/bits/stdio_lim=
.h =C2=A0${D}${includedir}/bits/
> - =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${libdir}/
> - =C2=A0 =C2=A0 =C2=A0 install -m 644 csu/crt[1in].o ${D}${libdir}
> - =C2=A0 =C2=A0 =C2=A0 ${CC} -nostdlib -nostartfiles -shared -x c /dev/nu=
ll \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o ${D}${libdir}/libc.=
so
> -
> - =C2=A0 =C2=A0 =C2=A0 # add links to linux-libc-headers: gcc-{cross,cros=
sdk}-intermediate need this.
> - =C2=A0 =C2=A0 =C2=A0 for t in linux asm asm-generic; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s ${STAGING_DIR_TA=
RGET}${includedir}/$t ${D}${includedir}/
> - =C2=A0 =C2=A0 =C2=A0 done
> -}
> -
> -do_siteconfig () {
> - =C2=A0 =C2=A0 =C2=A0 :
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
> - =C2=A0 =C2=A0 =C2=A0 :
> -}
> -
> -do_configure_prepend () {
> - =C2=A0 =C2=A0 =C2=A0 unset CFLAGS
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
> -# default to disabled
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
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl=
ibc-gconv-*${PKGSUFFIX} =C2=A0glibc-charmap-* =C2=A0glibc-localedata-* =C2=
=A0glibc-binary-localedata-*"
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
> - =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir=
}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir=
}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${LOCALETREESRC}/${libdir}/locale ${D}${l=
ibdir}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${li=
bdir}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${LOCALETREESRC}/${datadir}/i18n ${D}${da=
tadir}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${=
datadir}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
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
> -# and our build is not a uclibc one, and we skip a glibc one if our buil=
d
> -# is a uclibc build.
> -#
> -# See the note in gcc/gcc_3.4.0.oe
> -#
> -
> -python __anonymous () {
> - =C2=A0 =C2=A0import bb, re
> - =C2=A0 =C2=A0uc_os =3D (re.match('.*uclibc*', bb.data.getVar('TARGET_OS=
', d, 1)) !=3D None)
> - =C2=A0 =C2=A0if uc_os:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipPackage("incompatible wit=
h target %s" %
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.getVar('TARGET_OS'=
, d, 1))
> -}
> -
> -PKGSUFFIX =3D ""
> -PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> -
> -PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd=
${PKGSUFFIX} \
> - =C2=A0 =C2=A0 =C2=A0 ldd${PKGSUFFIX} ${PN}-utils ${PN}-dev ${PN}-doc \
> - =C2=A0 =C2=A0 =C2=A0 libsegfault${PKGSUFFIX} ${PN}-extra-nss ${PN}-thre=
ad-db \
> - =C2=A0 =C2=A0 =C2=A0 ${PN}-pcprofile"
> -
> -libc_baselibs =3D "${base_libdir}/libc* ${base_libdir}/libm* ${base_libd=
ir}/ld* \
> - =C2=A0 =C2=A0 =C2=A0 ${base_libdir}/libpthread* ${base_libdir}/libresol=
v* ${base_libdir}/librt* \
> - =C2=A0 =C2=A0 =C2=A0 ${base_libdir}/libutil* ${base_libdir}/libnsl* ${b=
ase_libdir}/libnss_files* \
> - =C2=A0 =C2=A0 =C2=A0 ${base_libdir}/libnss_compat* ${base_libdir}/libns=
s_dns* ${base_libdir}/libdl* \
> - =C2=A0 =C2=A0 =C2=A0 ${base_libdir}/libanl* ${base_libdir}/libBrokenLoc=
ale*"
> -
> -# The problem is that if PN =3D "glibc", FILES_${PN} will overwrite FILE=
S_glibc
> -# Solution: Make them both the same thing, then it doesn't matter
> -
> -glibcfiles =3D "${sysconfdir} ${libc_baselibs} ${base_sbindir}/ldconfig =
\
> - =C2=A0 =C2=A0 =C2=A0 ${libexecdir}/* ${datadir}/zoneinfo"
> -glibcdbgfiles =3D "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${base_bi=
ndir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}=
/gconv/.debug ${libexecdir}/*/.debug"
> -glibcdevfiles =3D "${bindir}/rpcgen ${includedir} ${libdir}/lib*${SOLIBS=
DEV} ${libdir}/*.la \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/*.a ${=
libdir}/*.o ${libdir}/pkgconfig \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${base_libdir}/*=
.a ${base_libdir}/*.o ${datadir}/aclocal"
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
 =C2=A0sln is useful to make symbolic links to dynamic libraries if the dyn=
amic linking system, for some reason, is not functional."
> -SUMMARY_nscd =3D "Name service cache daemon"
> -DESCRIPTION_nscd =3D "nscd, name service cache daemon, caches name servi=
ce lookups for the passwd, group and hosts information. =C2=A0It can damati=
cally improvide performance with remote, such as NIS or NIS+, name services=
."
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
> - =C2=A0 =C2=A0 =C2=A0 dest=3D${D}/${includedir}/glibc-locale-internal-${=
MULTIMACH_TARGET_SYS}
> - =C2=A0 =C2=A0 =C2=A0 install -d ${dest}${base_libdir} ${dest}${bindir} =
${dest}${libdir} ${dest}${datadir}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${D}${base_libdir}/* ${dest}${base_libdir=
}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpP ${D}${bindir}/localedef ${dest}${bindir}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${libdir}/gconv ${dest}${libdir}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${D}${libdir}/* ${dest}${libdir}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${datadir}/i18n ${dest}${datadir}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${D}${datadir}/* ${dest}${datadir}
> - =C2=A0 =C2=A0 =C2=A0 cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
> -}
> -
> -addtask do_install_locale after do_install before do_populate_sysroot
> -
> -PACKAGE_PREPROCESS_FUNCS +=3D "glibc_package_preprocess"
> -
> -glibc_package_preprocess () {
> - =C2=A0 =C2=A0 =C2=A0 rm -rf ${PKGD}/${includedir}/eglibc-locale-interna=
l-${MULTIMACH_TARGET_SYS}
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
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://elf/cache.c;beginline=3D1;endline=3D17;md5=3D926aac25497b1de7d630b4749=
005d208 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://COPYING.LIB;md5=3Dbbb461211a33b134d42ed5ee802b37ff \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://bits/types.h;beginline=3D1;endline=3D18;md5=3D267938e7c0538e76f734551e=
c6ea908d"
> -# nptl needs unwind support in gcc, which can't be built without glibc.
> -DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers=
"
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
> - =C2=A0 =C2=A0 =C2=A0 mkdir -p ${WORKDIR}/site_config_libc; \
> - =C2=A0 =C2=A0 =C2=A0 cp ${SYSROOT_DESTDIR}${libdir}/libc.so ${WORKDIR}/=
site_config_libc; \
> - =C2=A0 =C2=A0 =C2=A0 sed -i -e 's# ${base_libdir}# ${SYSROOT_DESTDIR}${=
base_libdir}#g' -e 's# ${libdir}# ${SYSROOT_DESTDIR}${libdir}#g' ${WORKDIR}=
/site_config_libc/libc.so; \
> -"
> -
> -inherit autotools
> -
> -GLIBC_EXTRA_OECONF ?=3D ""
> -INHIBIT_DEFAULT_DEPS =3D "1"
> -
> -do_rig_locales() {
> - =C2=A0 =C2=A0 =C2=A0 # If indicated, only build a limited selection of =
locales
> - =C2=A0 =C2=A0 =C2=A0 if [ "x${LIMIT_BUILT_LOCALES}" !=3D "x" ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INFILE=3D"${S}/localed=
ata/SUPPORTED"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OUTFILE=3D"${S}/locale=
data/SUPPORTED.tmp"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 head -n 3 $INFILE > $O=
UTFILE
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in ${LIMIT_BUILT=
_LOCALES}; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 grep $i $INFILE >> $OUTFILE || true
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 head --lines=3D-1 $OUT=
FILE > $INFILE
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tail --lines=3D1 $OUTF=
ILE | sed 's#\\##' >> $INFILE
> - =C2=A0 =C2=A0 =C2=A0 fi
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
> -# and our build is not a uclibc one, and we skip a glibc one if our buil=
d
> -# is a uclibc build.
> -#
> -# See the note in gcc/gcc_3.4.0.oe
> -#
> -
> -python __anonymous () {
> - =C2=A0 =C2=A0import bb, re
> - =C2=A0 =C2=A0uc_os =3D (re.match('.*uclibc$', bb.data.getVar('TARGET_OS=
', d, 1)) !=3D None)
> - =C2=A0 =C2=A0if uc_os:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipPackage("incompatible wit=
h target %s" %
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.getVar('TARGET_OS'=
, d, 1))
> -}
> -
> -RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
> -
> -# =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://noinfo.patch;patch=3D1
> -# =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ldconfig.patch;patch=3D1;pnum=3D0
> -# =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://arm-machine-gmon.patch;patch=3D1;pn=
um=3D0
> -# =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://arm-ioperm.patch;patch=3D1;pnum=3D0
> -# =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ldd.patch;patch=3D1;pnum=3D0
> -SRC_URI =3D "${GNU_MIRROR}/glibc/glibc-${PV}.tar.bz2 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GNU_MIRROR}/glibc/glibc-ports-${PV=
}.tar.bz2 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GNU_MIRROR}/glibc/glibc-libidn-${P=
V}.tar.bz2 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nscd-init.patch;striplevel=3D=
0 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://arm-memcpy.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://arm-longlong.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fhs-linux-paths.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dl-cache-libcmp.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ldsocache-varrun.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nptl-crosscompile.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://glibc-check_pf.patch;striplev=
el=3D0 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ldd-unbash.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://glibc-arm-IO-acquire-lock-fix=
.diff \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mips-rld-map-check.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://generic-bits_select.h \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://generic-bits_types.h \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://generic-bits_typesizes.h \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://generic-bits_time.h \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://etc/ld.so.conf \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://generate-supported.mk \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://march-i686.patch;striplevel=
=3D0 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rulesfix.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://glibc-2.9-enable-binutils-2.2=
.patch"
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
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--without-cvs --=
disable-profile --disable-debug --without-gd \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-clocale=
=3Dgnu \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-add-ons=
=3D${GLIBC_ADDONS} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-headers=
=3D${STAGING_INCDIR} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--without-selinu=
x \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GLIBC_EXTRA_OE=
CONF}"
> -
> -EXTRA_OECONF +=3D "${@get_libc_fpu_setting(bb, d)}"
> -
> -do_munge() {
> - =C2=A0 =C2=A0 =C2=A0 # Integrate ports and libidn into tree
> - =C2=A0 =C2=A0 =C2=A0 mv ${WORKDIR}/glibc-ports-${PV} ${S}/ports
> - =C2=A0 =C2=A0 =C2=A0 mv ${WORKDIR}/glibc-libidn-${PV} ${S}/libidn
> -
> - =C2=A0 =C2=A0 =C2=A0 # Ports isn't really working... Fix it
> - =C2=A0 =C2=A0 =C2=A0 # Some of this is rather dirty, but it seems to be=
 the only
> - =C2=A0 =C2=A0 =C2=A0 # quick way to get this cruft to compile
> - =C2=A0 =C2=A0 =C2=A0 rm -rf ${S}/ports/sysdeps/unix/sysv/linux/arm/linu=
xthreads
> - =C2=A0 =C2=A0 =C2=A0 ln -s nptl ${S}/ports/sysdeps/unix/sysv/linux/arm/=
linuxthreads
> - =C2=A0 =C2=A0 =C2=A0 cp ${S}/nptl/sysdeps/pthread/bits/sigthread.h ${S}=
/ports/sysdeps/unix/sysv/linux/arm/bits/
> - =C2=A0 =C2=A0 =C2=A0 cp ${S}/sysdeps/unix/sysv/linux/i386/bits/wchar.h =
${S}/ports/sysdeps/unix/sysv/linux/arm/bits/
> - =C2=A0 =C2=A0 =C2=A0 cp ${S}/sysdeps/wordsize-32/bits/wordsize.h ${S}/p=
orts/sysdeps/unix/sysv/linux/arm/bits/
> - =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/generic-bits_select.h ${S}/ports/sys=
deps/unix/sysv/linux/arm/bits/select.h
> - =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/generic-bits_types.h ${S}/ports/sysd=
eps/unix/sysv/linux/arm/bits/types.h
> - =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/generic-bits_typesizes.h ${S}/ports/=
sysdeps/unix/sysv/linux/arm/bits/typesizes.h
> - =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/generic-bits_time.h ${S}/ports/sysde=
ps/unix/sysv/linux/arm/bits/time.h
> - =C2=A0 =C2=A0 =C2=A0 # Copy in generic stuff for not yet implemented he=
aders
> - =C2=A0 =C2=A0 =C2=A0 for i in ${S}/bits/*.h; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 F=3D`basename $i`
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ "$F" =3D "local_lim.=
h" ] && continue
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ "$F" =3D "errno.h" ]=
 && continue
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -e ${S}/ports/sys=
deps/unix/sysv/linux/arm/bits/$F || test -e ${S}/ports/sysdeps/arm/bits/$F =
|| test -e ${S}/sysdeps/unix/sysv/linux/bits/$F || test -e ${S}/sysdeps/iee=
e754/bits/$F || cp $i ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/
> - =C2=A0 =C2=A0 =C2=A0 done
> - =C2=A0 =C2=A0 =C2=A0 # This is harmful; we need to get the one from npt=
l/sysdeps/pthreads
> - =C2=A0 =C2=A0 =C2=A0 rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/=
libc-lock.h
> - =C2=A0 =C2=A0 =C2=A0 # Obsoleted by sysdeps/arm/{fpu,eabi}/bits/fenv.h
> - =C2=A0 =C2=A0 =C2=A0 rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/=
fenv.h
> - =C2=A0 =C2=A0 =C2=A0 # Obsoleted by sysdeps/gnu/bits/utmp.h
> - =C2=A0 =C2=A0 =C2=A0 rm -f ${S}/ports/sysdeps/unix/sysv/linux/arm/bits/=
utmp.h
> -}
> -
> -addtask munge before do_patch after do_unpack
> -
> -
> -do_configure () {
> -# /var/db was not included to FHS
> - =C2=A0 =C2=A0 =C2=A0 sed -i s:/var/db/nscd:/var/run/nscd: ${S}/nscd/nsc=
d.h
> -# override this function to avoid the autoconf/automake/aclocal/autohead=
er
> -# calls for now
> -# don't pass CPPFLAGS into configure, since it upsets the kernel-headers
> -# version check and doesn't really help with anything
> - =C2=A0 =C2=A0 =C2=A0 if [ -z "`which rpcgen`" ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "rpcgen not found=
. =C2=A0Install glibc-devel."
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
> - =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 (cd ${S} && gnu-configize) || die "failure in runn=
ing gnu-configize"
> - =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D"" oe_runconf
> -}
> -
> -rpcsvc =3D "bootparam_prot.x nlm_prot.x rstat.x \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yppasswd.x klm_prot.x rex.x sm_inter.=
x mount.x \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rusers.x spray.x nfs_prot.x rquota.x =
key_prot.x"
> -
> -do_compile () {
> - =C2=A0 =C2=A0 =C2=A0 # -Wl,-rpath-link <staging>/lib in LDFLAGS can cau=
se breakage if another glibc is in staging
> - =C2=A0 =C2=A0 =C2=A0 unset LDFLAGS
> - =C2=A0 =C2=A0 =C2=A0 base_do_compile
> - =C2=A0 =C2=A0 =C2=A0 (
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/sunrpc/rpcsvc
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for r in ${rpcsvc}; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 h=3D`echo $r|sed -e's,\.x$,.h,'`
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rpcgen -h $r -o $h || bbwarn "unable to generate header for $r"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
> - =C2=A0 =C2=A0 =C2=A0 )
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
> --
> 1.7.4.1
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


