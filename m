Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1R5AH9-0006JJ-0g
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Sep 2011 07:50:47 +0200
Received: by fxi1 with SMTP id 1so3386859fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 22:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=MT7vwg7GD15aDDTYCKTDcGmAB4Cz4LQSKZWu3/myNng=;
	b=RtnYguBqcKQ2LdP3rfjoJ64g58vKMZXeYo41cSmI/YUTfRQDRt0BQztAUNiu+NKDAa
	GihL0bE0IarpXczrK1+T4kGkD0q6zrmk9vMZQeluCloNrI6p3QvanBpT1Vz/Xz7sfbZ8
	xqhHMgeqjGXJmDpfSIPPYwikCMukz3Yo+kgn8=
MIME-Version: 1.0
Received: by 10.223.29.76 with SMTP id p12mr2535373fac.51.1316324731938; Sat,
	17 Sep 2011 22:45:31 -0700 (PDT)
Received: by 10.223.83.206 with HTTP; Sat, 17 Sep 2011 22:45:31 -0700 (PDT)
In-Reply-To: <019b2f27ac87424c96d0110cb8962270@DFLE71.ent.ti.com>
References: <1315346049-8611-1-git-send-email-joelagnel@ti.com>
	<019b2f27ac87424c96d0110cb8962270@DFLE71.ent.ti.com>
Date: Sun, 18 Sep 2011 00:45:31 -0500
Message-ID: <CAD=GYpYnz3+vLiLNsKK86+Ykp1gaK_tvAWaG_fsv-uJzeositA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: "Fernandes, Joel A" <joelagnel@ti.com>
Cc: "Kooi, Koen" <k-kooi@ti.com>, "Kridner, Jason" <jdk@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 meta-oe 2/8] libmad: Imported from OE-classic
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
X-List-Received-Date: Sun, 18 Sep 2011 05:50:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Can this patch be applied please?

Thanks,
Joel

On Tue, Sep 6, 2011 at 4:54 PM, Fernandes, Joel A <joelagnel@ti.com> wrote:
> Updated LICENSE version to GPLv2
>
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> =A0.../libmad/files/add-pkgconfig.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 68 +
> =A0.../files/libmad-0.15.1b-avr32-optimization.patch =A0| 2922 ++++++++++=
++++++++++
> =A0.../libmad/files/mad-mips-h-constraint.patch =A0 =A0 =A0 | =A0 70 +
> =A0meta-oe/recipes-multimedia/libmad/files/mad.diff =A0 | =A0 24 +
> =A0.../recipes-multimedia/libmad/libmad_0.15.1b.bb =A0 =A0| =A0 34 +
> =A05 files changed, 3118 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-oe/recipes-multimedia/libmad/files/add-pkgconf=
ig.patch
> =A0create mode 100644 meta-oe/recipes-multimedia/libmad/files/libmad-0.15=
.1b-avr32-optimization.patch
> =A0create mode 100644 meta-oe/recipes-multimedia/libmad/files/mad-mips-h-=
constraint.patch
> =A0create mode 100644 meta-oe/recipes-multimedia/libmad/files/mad.diff
> =A0create mode 100644 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
>
> diff --git a/meta-oe/recipes-multimedia/libmad/files/add-pkgconfig.patch =
b/meta-oe/recipes-multimedia/libmad/files/add-pkgconfig.patch
> new file mode 100644
> index 0000000..636b27a
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libmad/files/add-pkgconfig.patch
> @@ -0,0 +1,68 @@
> +Here is a patch for adding pkg-config support to libmad.
> +It would make life a bit easier for distro maintainers if this was appli=
ed.
> +In case you didn't know, pkg-config is a tool for providing LDFLAGS and
> +CFLAGS for packages using shared libraries. It's on freedesktop.org.
> +Debian has already been distributing the pkg-config file mad.pc with
> +libmad for some time, and people developing on debian (notably xmms2
> +developers) have started relying on this support being present, causing
> +some confusion for people installing from source and on some BSDs which
> +do not provide mad.pc (google: pkgconfig libmad).
> +
> +EMH
> +
> +--h31gzZEtNLTqOjlF
> +Content-Type: text/plain; charset=3Dus-ascii
> +Content-Disposition: attachment; filename=3D&quot;libmad-0.15.1b-pkgconf=
ig.patch&quot;
> +
> +diff -Naur libmad-0.15.1b.old/configure.ac libmad-0.15.1b/configure.ac
> +--- libmad-0.15.1b.old/configure.ac =A0 =A02004-01-23 10:41:32.000000000=
 +0100
> ++++ libmad-0.15.1b/configure.ac =A0 =A0 =A0 =A02004-08-07 02:25:24.63346=
2168 +0200
> +@@ -429,5 +429,5 @@
> + dnl AC_SUBST(LTLIBOBJS)
> +
> + AC_CONFIG_FILES([Makefile msvc++/Makefile =A0\
> +- =A0 =A0 =A0libmad.list])
> ++ =A0 =A0 =A0libmad.list mad.pc])
> + AC_OUTPUT
> +diff -Naur libmad-0.15.1b.old/mad.pc.in libmad-0.15.1b/mad.pc.in
> +--- libmad-0.15.1b.old/mad.pc.in =A0 =A0 =A0 1970-01-01 01:00:00.0000000=
00 +0100
> ++++ libmad-0.15.1b/mad.pc.in =A0 2004-08-07 02:04:59.617692872 +0200
> +@@ -0,0 +1,14 @@
> ++# libmad pkg-config source file
> ++
> ++prefix=3D@prefix@
> ++exec_prefix=3D@exec_prefix@
> ++libdir=3D@libdir@
> ++includedir=3D@includedir@
> ++
> ++Name: mad
> ++Description: MPEG Audio Decoder
> ++Version: @VERSION@
> ++Requires:
> ++Conflicts:
> ++Libs: -L${libdir} -lmad -lm
> ++Cflags: -I${includedir}
> +diff -Naur libmad-0.15.1b.old/Makefile.am libmad-0.15.1b/Makefile.am
> +--- libmad-0.15.1b.old/Makefile.am =A0 =A0 2004-02-17 03:02:03.000000000=
 +0100
> ++++ libmad-0.15.1b/Makefile.am 2004-08-07 02:03:19.859858368 +0200
> +@@ -24,6 +24,9 @@
> + SUBDIRS =3D
> + DIST_SUBDIRS =3D =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0msvc++
> +
> ++pkgconfigdir =3D =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$(libdir)/pkgconfig
> ++pkgconfig_DATA =3D =A0 =A0 =A0mad.pc
> ++
> + lib_LTLIBRARIES =3D =A0 =A0 libmad.la
> + include_HEADERS =3D =A0 =A0 mad.h
> +
> +@@ -34,7 +37,8 @@
> + minimad_LDADD =3D =A0 =A0 =A0 =A0 =A0 =A0 =A0 libmad.la
> +
> + EXTRA_DIST =3D =A0 =A0 =A0 =A0 =A0mad.h.sed =A0\
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CHANGES COPYRIGHT CREDITS R=
EADME TODO VERSION
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0CHANGES COPYRIGHT CREDITS R=
EADME TODO VERSION \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mad.pc.in
> +
> + exported_headers =3D =A0 =A0version.h fixed.h bit.h timer.h stream.h fr=
ame.h =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 synth.h decoder.h
> +
> diff --git a/meta-oe/recipes-multimedia/libmad/files/libmad-0.15.1b-avr32=
-optimization.patch b/meta-oe/recipes-multimedia/libmad/files/libmad-0.15.1=
b-avr32-optimization.patch
> new file mode 100644
> index 0000000..b74eea3
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libmad/files/libmad-0.15.1b-avr32-optimi=
zation.patch
> @@ -0,0 +1,2922 @@
> +diff --git a/bit.c b/bit.c
> +index c2bfb24..262ce3a 100644
> +--- a/bit.c
> ++++ b/bit.c
> +@@ -25,12 +25,6 @@
> +
> + # include "global.h"
> +
> +-# ifdef HAVE_LIMITS_H
> +-# =A0include <limits.h>
> +-# else
> +-# =A0define CHAR_BIT =A08
> +-# endif
> +-
> + # include "bit.h"
> +
> + /*
> +@@ -81,6 +75,8 @@ unsigned short const crc_table[256] =3D {
> +
> + # define CRC_POLY =A00x8005
> +
> ++#ifndef FPM_AVR32
> ++
> + /*
> + =A0* NAME: =A0 =A0 =A0bit->init()
> + =A0* DESCRIPTION: =A0 =A0 =A0 initialize bit pointer struct
> +@@ -190,6 +186,8 @@ void mad_bit_write(struct mad_bitptr *bitptr, unsign=
ed int len,
> + }
> + # endif
> +
> ++#endif
> ++
> + /*
> + =A0* NAME: =A0 =A0 =A0bit->crc()
> + =A0* DESCRIPTION: =A0 =A0 =A0 compute CRC-check word
> +diff --git a/bit.h b/bit.h
> +index 5a51570..70f550a 100644
> +--- a/bit.h
> ++++ b/bit.h
> +@@ -22,6 +22,92 @@
> + # ifndef LIBMAD_BIT_H
> + # define LIBMAD_BIT_H
> +
> ++# ifdef HAVE_LIMITS_H
> ++# =A0include <limits.h>
> ++# else
> ++# =A0define CHAR_BIT =A08
> ++# endif
> ++
> ++#ifdef FPM_AVR32
> ++
> ++struct mad_bitptr {
> ++ =A0unsigned char const *byte;
> ++ =A0unsigned int read_bytes;
> ++};
> ++
> ++/*
> ++ * NAME: =A0 =A0 =A0bit->init()
> ++ * DESCRIPTION: =A0 =A0 =A0 initialize bit pointer struct
> ++ */
> ++static void mad_bit_init(struct mad_bitptr *bitptr, unsigned char const=
 *byte)
> ++{
> ++ =A0bitptr->byte =A0=3D byte;
> ++ =A0bitptr->read_bytes =A0=3D 0;
> ++}
> ++
> ++/*
> ++ * NAME: =A0 =A0 =A0bit->length()
> ++ * DESCRIPTION: =A0 =A0 =A0 return number of bits between start and end=
 points
> ++ */
> ++static unsigned int mad_bit_length(struct mad_bitptr const *begin,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct mad_bitptr c=
onst *end)
> ++{
> ++ =A0return (end->read_bytes - begin->read_bytes) +
> ++ =A0 =A08 * (end->byte - begin->byte);
> ++}
> ++
> ++/*
> ++ * NAME: =A0 =A0 =A0bit->nextbyte()
> ++ * DESCRIPTION: =A0 =A0 =A0 return pointer to next unprocessed byte
> ++ */
> ++static unsigned char const *mad_bit_nextbyte(struct mad_bitptr const *b=
itptr)
> ++{
> ++ =A0return bitptr->byte + ((bitptr->read_bytes + 0x7) >> 3);
> ++}
> ++
> ++/*
> ++ * NAME: =A0 =A0 =A0bit->skip()
> ++ * DESCRIPTION: =A0 =A0 =A0 advance bit pointer
> ++ */
> ++static void mad_bit_skip(struct mad_bitptr *bitptr, unsigned int len)
> ++{
> ++ =A0bitptr->read_bytes +=3D len;
> ++ =A0bitptr->byte +=3D (bitptr->read_bytes >> 3);
> ++ =A0bitptr->read_bytes &=3D =A00x7;
> ++}
> ++
> ++/*
> ++ * NAME: =A0 =A0 =A0bit->read()
> ++ * DESCRIPTION: =A0 =A0 =A0 read an arbitrary number of bits and return=
 their UIMSBF value
> ++ */
> ++static unsigned long mad_bit_read(struct mad_bitptr *bitptr, unsigned i=
nt len)
> ++{
> ++ =A0register unsigned long value;
> ++
> ++ =A0if (!len)
> ++ =A0 =A0return 0;
> ++
> ++ =A0value =3D *(unsigned int *)bitptr->byte;
> ++
> ++ =A0value <<=3D bitptr->read_bytes;
> ++ =A0value >>=3D (32 - len);
> ++
> ++ =A0bitptr->read_bytes +=3D len;
> ++ =A0bitptr->byte +=3D (bitptr->read_bytes >> 3);
> ++ =A0bitptr->read_bytes &=3D =A00x7;
> ++
> ++ =A0return value;
> ++}
> ++
> ++# define mad_bit_finish(bitptr) =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* nothing =
*/
> ++
> ++static unsigned long =A0mad_bit_bitsleft(struct mad_bitptr *bitptr)
> ++{
> ++ =A0return (8 - (bitptr)->read_bytes);
> ++}
> ++
> ++#else /* #ifdef FPM_AVR32 */
> ++
> + struct mad_bitptr {
> + =A0 unsigned char const *byte;
> + =A0 unsigned short cache;
> +@@ -42,6 +128,8 @@ void mad_bit_skip(struct mad_bitptr *, unsigned int);
> + unsigned long mad_bit_read(struct mad_bitptr *, unsigned int);
> + void mad_bit_write(struct mad_bitptr *, unsigned int, unsigned long);
> +
> ++#endif
> ++
> + unsigned short mad_bit_crc(struct mad_bitptr, unsigned int, unsigned sh=
ort);
> +
> + # endif
> +diff --git a/configure.ac b/configure.ac
> +index 9b79399..063cb9b 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -274,13 +274,14 @@ fi
> + AC_MSG_CHECKING(for architecture-specific fixed-point math routines)
> + AC_ARG_ENABLE(fpm, AC_HELP_STRING([--enable-fpm=3DARCH],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[use ARCH-specific fixed-point math =
routines
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(one of: intel, arm, mips, sparc, p=
pc, 64bit, default)]),
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(one of: intel, arm, avr32, mips, s=
parc, ppc, 64bit, default)]),
> + [
> + =A0 =A0 case "$enableval" in
> + =A0 =A0 =A0 yes) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ;;
> + =A0 =A0 =A0 no|default|approx) FPM=3D"DEFAULT" ;;
> + =A0 =A0 =A0 intel|i?86) =A0 =A0 =A0 =A0FPM=3D"INTEL" =A0 ;;
> + =A0 =A0 =A0 arm) =A0 =A0 =A0 =A0 =A0 =A0 =A0 FPM=3D"ARM" =A0 =A0 ;;
> ++ =A0 =A0 =A0avr32) =A0 =A0 =A0 =A0 =A0 =A0 FPM=3D"AVR32" =A0 ;;
> + =A0 =A0 =A0 mips) =A0 =A0 =A0 =A0 =A0 =A0 =A0FPM=3D"MIPS" =A0 =A0;;
> + =A0 =A0 =A0 sparc) =A0 =A0 =A0 =A0 =A0 =A0 FPM=3D"SPARC" =A0 ;;
> + =A0 =A0 =A0 ppc|powerpc) =A0 =A0 =A0 FPM=3D"PPC" =A0 =A0 ;;
> +@@ -298,6 +299,7 @@ then
> + =A0 =A0 case "$host" in
> + =A0 =A0 =A0 i?86-*) =A0 =A0 FPM=3D"INTEL" =A0;;
> + =A0 =A0 =A0 arm*-*) =A0 =A0 FPM=3D"ARM" =A0 =A0;;
> ++ =A0 =A0 =A0avr32*-*) =A0 FPM=3D"AVR32" =A0;;
> + =A0 =A0 =A0 mips*-*) =A0 =A0FPM=3D"MIPS" =A0 ;;
> + =A0 =A0 =A0 sparc*-*) =A0 FPM=3D"SPARC" =A0;;
> + =A0 =A0 =A0 powerpc*-*) FPM=3D"PPC" =A0 =A0;;
> +@@ -343,6 +345,11 @@ then
> + =A0 =A0 =A0 =A0 =A0 ASO=3D"$ASO -DASO_IMDCT"
> + =A0 =A0 =A0 =A0 =A0 ASO_OBJS=3D"imdct_l_arm.lo"
> + =A0 =A0 =A0 =A0 =A0 ;;
> ++ =A0 =A0 =A0avr32*-*)
> ++ =A0 =A0 =A0 =A0 =A0ASO=3D"$ASO -DASO_INTERLEAVE2"
> ++ =A0 =A0 =A0 =A0 =A0ASO=3D"$ASO -DASO_ZEROCHECK"
> ++ =A0 =A0 =A0 =A0 =A0ASO_OBJS=3D"dct32_avr32.lo synth_avr32.lo imdct_avr=
32.lo"
> ++ =A0 =A0 =A0 =A0 =A0;;
> + =A0 =A0 =A0 mips*-*)
> + =A0 =A0 =A0 =A0 =A0 ASO=3D"$ASO -DASO_INTERLEAVE2"
> + =A0 =A0 =A0 =A0 =A0 ASO=3D"$ASO -DASO_ZEROCHECK"
> +diff --git a/configure b/configure
> +index ee421cc..7a9f0c8 100755
> +--- a/configure
> ++++ b/configure
> +@@ -1048,7 +1048,7 @@ Optional Features:
> + =A0 --enable-speed =A0 =A0 =A0 =A0 =A0optimize for speed over accuracy
> + =A0 --enable-accuracy =A0 =A0 =A0 optimize for accuracy over speed
> + =A0 --enable-fpm=3DARCH =A0 =A0 =A0 use ARCH-specific fixed-point math =
routines (one of:
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0intel, arm, mips, s=
parc, ppc, 64bit, default)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0intel, arm, avr32, =
mips, sparc, ppc, 64bit, default)
> + =A0 --enable-sso =A0 =A0 =A0 =A0 =A0 =A0use subband synthesis optimizat=
ion
> + =A0 --disable-aso =A0 =A0 =A0 =A0 =A0 disable architecture-specific opt=
imizations
> + =A0 --enable-strict-iso =A0 =A0 use strict ISO/IEC interpretations
> +@@ -21477,6 +21477,7 @@ if test "${enable_fpm+set}" =3D set; then
> + =A0 =A0 =A0 no|default|approx) FPM=3D"DEFAULT" ;;
> + =A0 =A0 =A0 intel|i?86) =A0 =A0 =A0 =A0FPM=3D"INTEL" =A0 ;;
> + =A0 =A0 =A0 arm) =A0 =A0 =A0 =A0 =A0 =A0 =A0 FPM=3D"ARM" =A0 =A0 ;;
> ++ =A0 =A0 =A0avr32) =A0 =A0 =A0 =A0 =A0 =A0 FPM=3D"AVR32" =A0 ;;
> + =A0 =A0 =A0 mips) =A0 =A0 =A0 =A0 =A0 =A0 =A0FPM=3D"MIPS" =A0 =A0;;
> + =A0 =A0 =A0 sparc) =A0 =A0 =A0 =A0 =A0 =A0 FPM=3D"SPARC" =A0 ;;
> + =A0 =A0 =A0 ppc|powerpc) =A0 =A0 =A0 FPM=3D"PPC" =A0 =A0 ;;
> +@@ -21498,6 +21499,7 @@ then
> + =A0 =A0 case "$host" in
> + =A0 =A0 =A0 i?86-*) =A0 =A0 FPM=3D"INTEL" =A0;;
> + =A0 =A0 =A0 arm*-*) =A0 =A0 FPM=3D"ARM" =A0 =A0;;
> ++ =A0 =A0 =A0avr32*-*) =A0 FPM=3D"AVR32" =A0;;
> + =A0 =A0 =A0 mips*-*) =A0 =A0FPM=3D"MIPS" =A0 ;;
> + =A0 =A0 =A0 sparc*-*) =A0 FPM=3D"SPARC" =A0;;
> + =A0 =A0 =A0 powerpc*-*) FPM=3D"PPC" =A0 =A0;;
> +@@ -21554,6 +21556,11 @@ then
> + =A0 =A0 =A0 =A0 =A0 ASO=3D"$ASO -DASO_IMDCT"
> + =A0 =A0 =A0 =A0 =A0 ASO_OBJS=3D"imdct_l_arm.lo"
> + =A0 =A0 =A0 =A0 =A0 ;;
> ++ =A0 =A0 =A0avr32*-*)
> ++ =A0 =A0 =A0 =A0 =A0ASO=3D"$ASO -DASO_INTERLEAVE2"
> ++ =A0 =A0 =A0 =A0 =A0ASO=3D"$ASO -DASO_ZEROCHECK"
> ++ =A0 =A0 =A0 =A0 =A0ASO_OBJS=3D"dct32_avr32.lo synth_avr32.lo imdct_avr=
32.lo"
> ++ =A0 =A0 =A0 =A0 =A0;;
> + =A0 =A0 =A0 mips*-*)
> + =A0 =A0 =A0 =A0 =A0 ASO=3D"$ASO -DASO_INTERLEAVE2"
> + =A0 =A0 =A0 =A0 =A0 ASO=3D"$ASO -DASO_ZEROCHECK"
> +diff --git a/dct32_avr32.S b/dct32_avr32.S
> +new file mode 100644
> +index 0000000..7513340
> +--- /dev/null
> ++++ b/dct32_avr32.S
> +@@ -0,0 +1,780 @@
> ++/*
> ++ =A0 Optimized 32-point Discrete Cosine Transform (DCT)
> ++ =A0 Copyright 2003-2006 Atmel Corporation.
> ++
> ++ =A0 Written by Ronny Pedersen, Atmel Norway
> ++
> ++ =A0 This program is free software; you can redistribute it and/or modi=
fy
> ++ =A0 it under the terms of the GNU General Public License as published =
by
> ++ =A0 the Free Software Foundation; either version 2 of the License, or
> ++ =A0 (at your option) any later version.
> ++
> ++ =A0 This program is distributed in the hope that it will be useful,
> ++ =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> ++ =A0 GNU General Public License for more details.
> ++
> ++ =A0 You should have received a copy of the GNU General Public License
> ++ =A0 along with this program; if not, write to the Free Software
> ++ =A0 Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-13=
07, USA. */
> ++
> ++#define =A0 =A0 =A0 SHIFT =A0 12
> ++#define MAD_F_SCALEBITS 28
> ++#define SLOTS 8
> ++
> ++#define MAD_F(x) =A0 =A0 =A0((x + (1 << 15)) >> 16)
> ++
> ++# =A0define costab1 =A0 =A0 MAD_F(0x7fd8878e)
> ++# =A0define costab2 =A0 =A0 MAD_F(0x7f62368f)
> ++# =A0define costab3 =A0 =A0 MAD_F(0x7e9d55fc)
> ++# =A0define costab4 =A0 =A0 MAD_F(0x7d8a5f40)
> ++# =A0define costab5 =A0 =A0 MAD_F(0x7c29fbee)
> ++# =A0define costab6 =A0 =A0 MAD_F(0x7a7d055b)
> ++# =A0define costab7 =A0 =A0 MAD_F(0x78848414)
> ++# =A0define costab8 =A0 =A0 MAD_F(0x7641af3d)
> ++# =A0define costab9 =A0 =A0 MAD_F(0x73b5ebd1)
> ++# =A0define costab10 =A0 =A0MAD_F(0x70e2cbc6)
> ++# =A0define costab11 =A0 =A0MAD_F(0x6dca0d14)
> ++# =A0define costab12 =A0 =A0MAD_F(0x6a6d98a4)
> ++# =A0define costab13 =A0 =A0MAD_F(0x66cf8120)
> ++# =A0define costab14 =A0 =A0MAD_F(0x62f201ac)
> ++# =A0define costab15 =A0 =A0MAD_F(0x5ed77c8a)
> ++# =A0define costab16 =A0 =A0MAD_F(0x5a82799a)
> ++# =A0define costab17 =A0 =A0MAD_F(0x55f5a4d2)
> ++# =A0define costab18 =A0 =A0MAD_F(0x5133cc94)
> ++# =A0define costab19 =A0 =A0MAD_F(0x4c3fdff4)
> ++# =A0define costab20 =A0 =A0MAD_F(0x471cece7)
> ++# =A0define costab21 =A0 =A0MAD_F(0x41ce1e65)
> ++# =A0define costab22 =A0 =A0MAD_F(0x3c56ba70)
> ++# =A0define costab23 =A0 =A0MAD_F(0x36ba2014)
> ++# =A0define costab24 =A0 =A0MAD_F(0x30fbc54d)
> ++# =A0define costab25 =A0 =A0MAD_F(0x2b1f34eb)
> ++# =A0define costab26 =A0 =A0MAD_F(0x25280c5e)
> ++# =A0define costab27 =A0 =A0MAD_F(0x1f19f97b)
> ++# =A0define costab28 =A0 =A0MAD_F(0x18f8b83c)
> ++# =A0define costab29 =A0 =A0MAD_F(0x12c8106f)
> ++# =A0define costab30 =A0 =A0MAD_F(0x0c8bd35e)
> ++# =A0define costab31 =A0 =A0MAD_F(0x0647d97c)
> ++
> ++
> ++ =A0 =A0 =A0.macro =A0butterfly2_in out1, out2, out3, out4, in, idx_in1=
, idx_in2, idx_in3, idx_in4, coeff1, coeff2, tmplo, tmphi
> ++ =A0 =A0 =A0mov =A0 =A0 \tmplo, \coeff1
> ++ =A0 =A0 =A0ld.w =A0 =A0\out1, \in[\idx_in1 * 4]
> ++ =A0 =A0 =A0ld.w =A0 =A0\out2, \in[\idx_in2 * 4]
> ++ =A0 =A0 =A0ld.w =A0 =A0\out3, \in[\idx_in3 * 4]
> ++ =A0 =A0 =A0ld.w =A0 =A0\out4, \in[\idx_in4 * 4]
> ++ =A0 =A0 =A0sub =A0 =A0 \tmphi, \out1, \out2
> ++ =A0 =A0 =A0add =A0 =A0 \out1, \out2
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 \out2, \tmphi, \tmplo:b
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 \tmphi, \out3, \out4
> ++ =A0 =A0 =A0mov =A0 =A0 \tmplo, \coeff2
> ++ =A0 =A0 =A0add =A0 =A0 \out3, \out4
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 \out4, \tmphi, \tmplo:b
> ++ =A0 =A0 =A0.endm
> ++
> ++ =A0 =A0 =A0.macro =A0butterfly2 =A0 =A0 =A0in1, in2, in3, in4, coeff1,=
 tmplo, tmphi, tmp
> ++ =A0 =A0 =A0mov =A0 =A0 \tmp, \coeff1
> ++ =A0 =A0 =A0sub =A0 =A0 \tmphi, \in1, \in2
> ++ =A0 =A0 =A0add =A0 =A0 \in1, \in2
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 \in2, \tmphi, \tmp:b
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 \tmphi, \in3, \in4
> ++ =A0 =A0 =A0add =A0 =A0 \in3, \in4
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 \in4, \tmphi, \tmp:b
> ++ =A0 =A0 =A0.endm
> ++
> ++ =A0 =A0 =A0.macro =A0butterfly4 =A0 =A0 =A0in1, in2, in3, in4, in5, in=
6, in7, in8, coeff1, tmplo, tmphi, tmp
> ++ =A0 =A0 =A0mov =A0 =A0 \tmp, \coeff1
> ++ =A0 =A0 =A0sub =A0 =A0 \tmphi, \in1, \in2
> ++ =A0 =A0 =A0add =A0 =A0 \in1, \in2
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 \in2, \tmphi, \tmp:b
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 \tmphi, \in3, \in4
> ++ =A0 =A0 =A0add =A0 =A0 \in3, \in4
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 \in4, \tmphi, \tmp:b
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 \tmphi, \in5, \in6
> ++ =A0 =A0 =A0add =A0 =A0 \in5, \in6
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 \in6, \tmphi, \tmp:b
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 \tmphi, \in7, \in8
> ++ =A0 =A0 =A0add =A0 =A0 \in7, \in8
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 \in8, \tmphi, \tmp:b
> ++ =A0 =A0 =A0.endm
> ++
> ++ =A0 =A0 =A0.macro =A0scale =A0 reg
> ++ =A0 =A0 =A0.endm
> ++
> ++/*void dct32( mad_fixed_t const in[32], unsigned int slot,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0mad_fixed_t lo[16][8], mad_fixed_t hi[16][8=
]) */
> ++
> ++ =A0 =A0 =A0.global dct32_avr32
> ++dct32_avr32:
> ++ =A0 =A0 =A0stm =A0 =A0 --sp, r0-r7, r9-r11, lr
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 sp, 32*4
> ++
> ++/* =A0 =A0t0 =A0 =3D in[0] =A0+ in[31]; =A0t16 =A0=3D MUL(in[0] =A0- in=
[31], costab1);
> ++ =A0 =A0 =A0t1 =A0 =3D in[15] + in[16]; =A0t17 =A0=3D MUL(in[15] - in[1=
6], costab31); */
> ++ =A0 =A0 =A0butterfly2_in =A0 r4/*t0*/, r5/*t16*/, r6/*t1*/, r7/*t17*/,=
 r12, 0, 31, 15, 16, costab1, costab31, r10, r11
> ++
> ++/* =A0 =A0t41 =A0=3D t16 + t17;
> ++ =A0 =A0 =A0t59 =A0=3D MUL(t16 - t17, costab2);
> ++ =A0 =A0 =A0t33 =A0=3D =A0 t0 =A0+ t1;
> ++ =A0 =A0 =A0t50 =A0=3D MUL(t0 =A0- t1, =A0costab2);*/
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r5/*t41*/, r7/*t59*/, r4/*t33*/, r6/*=
t50*/, costab2, r10, r11, lr
> ++
> ++/* =A0 =A0t2 =A0 =3D in[7] =A0+ in[24]; =A0t18 =A0=3D MUL(in[7] =A0- in=
[24], costab15);
> ++ =A0 =A0 =A0t3 =A0 =3D in[8] =A0+ in[23]; =A0t19 =A0=3D MUL(in[8] =A0- =
in[23], costab17); */
> ++ =A0 =A0 =A0butterfly2_in =A0 r0/*t2*/, r1/*t18*/, r2/*t3*/, r3/*t19*/,=
 r12, 7, 24, 8, 23, costab15, costab17, r10, r11
> ++
> ++/* =A0 =A0t42 =A0=3D t18 + t19;
> ++ =A0 =A0 =A0t60 =A0=3D MUL(t18 - t19, costab30);
> ++ =A0 =A0 =A0t34 =A0=3D t2 =A0+ t3;
> ++ =A0 =A0 =A0t51 =A0=3D MUL(t2 =A0- t3, =A0costab30); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r1/*t42*/, r3/*t60*/, r0/*t34*/, r2/*=
t51*/, costab30, r10, r11, lr
> ++
> ++/* =A0 =A0t73 =A0=3D t41 + t42; =A0t94 =A0=3D MUL(t41 - t42, costab4);
> ++ =A0 =A0 =A0t83 =A0=3D t59 + t60; =A0t106 =3D MUL(t59 - t60, costab4); =
*/
> ++
> ++
> ++/* =A0 =A0t69 =A0=3D t33 + t34; =A0t89 =A0=3D MUL(t33 - t34, costab4);
> ++ =A0 =A0 =A0t78 =A0=3D t50 + t51; =A0t100 =3D MUL(t50 - t51, costab4); =
*/
> ++ =A0 =A0 =A0butterfly4 =A0 =A0 =A0r5/*t73*/, r1/*t94*/, r7/*t83*/, r3/*=
t106*/,r4/*t69*/, r0/*t89*/, r6/*t78*/, r2/*t100*/, costab4, r10, r11, lr
> ++
> ++/* =A0 =A0Store away the computed butterflies:
> ++ =A0 =A0 =A0sp[0-7] =3D t83, t78, t73, t69, t106, t100, t94, t89 */
> ++ =A0 =A0 =A0stm =A0 =A0 sp, r0-r7
> ++
> ++
> ++/* =A0 =A0t4 =A0 =3D in[3] =A0+ in[28]; =A0t20 =A0=3D MUL(in[3] =A0- in=
[28], costab7);
> ++ =A0 =A0 =A0t5 =A0 =3D in[12] + in[19]; =A0t21 =A0=3D MUL(in[12] - in[1=
9], costab25); */
> ++ =A0 =A0 =A0butterfly2_in =A0 r4/*t4*/, r5/*t20*/, r6/*t5*/, r7/*t21*/,=
 r12, 3, 28, 12, 19, costab7, costab25, r10, r11
> ++
> ++/* =A0 =A0t43 =A0=3D t20 + t21;
> ++ =A0 =A0 =A0t61 =A0=3D MUL(t20 - t21, costab14);
> ++ =A0 =A0 =A0t35 =A0=3D t4 =A0+ t5;
> ++ =A0 =A0 =A0t52 =A0=3D MUL(t4 =A0- t5, =A0costab14); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r5/*t43*/, r7/*t61*/, r4/*t35*/, r6/*=
t52*/, costab14, r10, r11, lr
> ++
> ++/* =A0 =A0t6 =A0 =3D in[4] =A0+ in[27]; =A0t22 =A0=3D MUL(in[4] =A0- in=
[27], costab9);
> ++ =A0 =A0 =A0t7 =A0 =3D in[11] + in[20]; =A0t23 =A0=3D MUL(in[11] - in[2=
0], costab23); */
> ++ =A0 =A0 =A0butterfly2_in =A0 r0/*t6*/, r1/*t22*/, r2/*t7*/, r3/*t23*/,=
 r12, 4, 27, 11, 20, costab9, costab23, r10, r11
> ++
> ++/* =A0 =A0t44 =A0=3D t22 + t23;
> ++ =A0 =A0 =A0t62 =A0=3D MUL(t22 - t23, costab18);
> ++ =A0 =A0 =A0t36 =A0=3D t6 =A0+ t7;
> ++ =A0 =A0 =A0t53 =A0=3D MUL(t6 =A0- t7, =A0costab18); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r1/*t44*/, r3/*t62*/, r0/*t36*/, r2/*=
t53*/, costab18, r10, r11, lr
> ++
> ++/* =A0 =A0t74 =A0=3D t43 + t44; =A0t95 =A0=3D MUL(t43 - t44, costab28);
> ++ =A0 =A0 =A0t84 =A0=3D t61 + t62; =A0t107 =3D MUL(t61 - t62, costab28);=
 */
> ++
> ++/* =A0 =A0t70 =A0=3D t35 + t36; =A0t90 =A0=3D MUL(t35 - t36, costab28);
> ++ =A0 =A0 =A0t79 =A0=3D t52 + t53; =A0t101 =3D MUL(t52 - t53, costab28);=
 */
> ++ =A0 =A0 =A0butterfly4 =A0 =A0 =A0r5/*t74*/, r1/*t95*/, r7/*t84*/, r3/*=
t107*/, r4/*t70*/, r0/*t90*/, r6/*t79*/, r2/*t101*/, costab28, r10, r11, lr
> ++
> ++/* =A0 =A0Store away the computed butterflies:
> ++ =A0 =A0 =A0sp[8-15] =3D t84, t79, t74, t70, t107, t101, t95, t90 */
> ++ =A0 =A0 =A0sub =A0 =A0 r10, sp, -8*4
> ++ =A0 =A0 =A0stm =A0 =A0 r10, r0-r7
> ++
> ++
> ++/* =A0 =A0t8 =A0 =3D in[1] =A0+ in[30]; =A0t24 =A0=3D MUL(in[1] =A0- in=
[30], costab3);
> ++ =A0 =A0 =A0t9 =A0 =3D in[14] + in[17]; =A0t25 =A0=3D MUL(in[14] - in[1=
7], costab29); */
> ++ =A0 =A0 =A0butterfly2_in =A0 r4/*t8*/, r5/*t24*/, r6/*t9*/, r7/*t25*/,=
 r12, 1, 30, 14, 17, costab3, costab29, r10, r11
> ++
> ++
> ++/* =A0 =A0t45 =A0=3D t24 + t25;
> ++ =A0 =A0 =A0t63 =A0=3D MUL(t24 - t25, costab6);
> ++ =A0 =A0 =A0t37 =A0=3D t8 =A0+ t9;
> ++ =A0 =A0 =A0t54 =A0=3D MUL(t8 =A0- t9, =A0costab6); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r5/*t45*/, r7/*t63*/, r4/*t37*/, r6/*=
t54*/, costab6, r10, r11, lr
> ++
> ++/* =A0 =A0t10 =A0=3D in[6] =A0+ in[25]; =A0t26 =A0=3D MUL(in[6] =A0- in=
[25], costab13);
> ++ =A0 =A0 =A0t11 =A0=3D in[9] =A0+ in[22]; =A0t27 =A0=3D MUL(in[9] =A0- =
in[22], costab19); */
> ++ =A0 =A0 =A0butterfly2_in =A0 r0/*t10*/, r1/*t26*/, r2/*t11*/, r3/*t27*=
/, r12, 6, 25, 9, 22, costab13, costab19, r10, r11
> ++
> ++/* =A0 =A0t46 =A0=3D t26 + t27;
> ++ =A0 =A0 =A0t64 =A0=3D MUL(t26 - t27, costab26);
> ++ =A0 =A0 =A0t38 =A0=3D t10 + t11;
> ++ =A0 =A0 =A0t55 =A0=3D MUL(t10 - t11, costab26); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r1/*t46*/, r3/*t64*/, r0/*t38*/, r2/*=
t55*/, costab26, r10, r11, lr
> ++
> ++/* =A0 =A0t75 =A0=3D t45 + t46; =A0t96 =A0=3D MUL(t45 - t46, costab12);
> ++ =A0 =A0 =A0t85 =A0=3D t63 + t64; =A0t108 =3D MUL(t63 - t64, costab12);=
 */
> ++
> ++/* =A0 =A0t71 =A0=3D t37 + t38; =A0t91 =A0=3D MUL(t37 - t38, costab12);
> ++ =A0 =A0 =A0t80 =A0=3D t54 + t55; =A0t102 =3D MUL(t54 - t55, costab12);=
 */
> ++ =A0 =A0 =A0butterfly4 =A0 =A0 =A0r5/*t75*/, r1/*t96*/, r7/*t85*/, r3/*=
t108*/, r4/*t71*/, r0/*t91*/, r6/*t80*/, r2/*t102*/, costab12, r10, r11, lr
> ++
> ++/* =A0 =A0Store away the computed butterflies:
> ++ =A0 =A0 =A0sp[16-23] =3D t85, t80, t75, t71, t108, t102, t96, t91 */
> ++ =A0 =A0 =A0sub =A0 =A0 r10, sp, -16*4
> ++ =A0 =A0 =A0stm =A0 =A0 r10, r0-r7
> ++
> ++/* =A0 =A0t12 =A0=3D in[2] =A0+ in[29]; =A0t28 =A0=3D MUL(in[2] =A0- in=
[29], costab5);
> ++ =A0 =A0 =A0t13 =A0=3D in[13] + in[18]; =A0t29 =A0=3D MUL(in[13] - in[1=
8], costab27); */
> ++ =A0 =A0 =A0butterfly2_in =A0 r4/*t12*/, r5/*t28*/, r6/*t13*/, r7/*t29*=
/, r12, 2, 29, 13, 18, costab5, costab27, r10, r11
> ++
> ++/* =A0 =A0t47 =A0=3D t28 + t29;
> ++ =A0 =A0 =A0t65 =A0=3D MUL(t28 - t29, costab10);
> ++ =A0 =A0 =A0t39 =A0=3D t12 + t13;
> ++ =A0 =A0 =A0t56 =A0=3D MUL(t12 - t13, costab10); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r5/*t47*/, r7/*t65*/, r4/*t39*/, r6/*=
t56*/, costab10, r10, r11, lr
> ++
> ++/* =A0 =A0t14 =A0=3D in[5] =A0+ in[26]; =A0t30 =A0=3D MUL(in[5] =A0- in=
[26], costab11);
> ++ =A0 =A0 =A0t15 =A0=3D in[10] + in[21]; =A0t31 =A0=3D MUL(in[10] - in[2=
1], costab21);*/
> ++ =A0 =A0 =A0butterfly2_in =A0 r0/*t14*/, r1/*t30*/, r2/*t15*/, r3/*t31*=
/, r12, 5, 26, 10, 21, costab11, costab21, r10, r11
> ++
> ++/* =A0 =A0t48 =A0=3D t30 + t31;
> ++ =A0 =A0 =A0t66 =A0=3D MUL(t30 - t31, costab22);
> ++ =A0 =A0 =A0t40 =A0=3D t14 + t15;
> ++ =A0 =A0 =A0t57 =A0=3D MUL(t14 - t15, costab22);*/
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r1/*t48*/, r3/*t66*/, r0/*t40*/, r2/*=
t57*/, costab22, r10, r11, lr
> ++
> ++/* =A0 =A0t76 =A0=3D t47 + t48; =A0t97 =A0=3D MUL(t47 - t48, costab20);
> ++ =A0 =A0 =A0t86 =A0=3D t65 + t66; =A0t109 =3D MUL(t65 - t66, costab20);=
*/
> ++
> ++/* =A0 =A0t72 =A0=3D t39 + t40; =A0t92 =A0=3D MUL(t39 - t40, costab20);
> ++ =A0 =A0 =A0t81 =A0=3D t56 + t57; =A0t103 =3D MUL(t56 - t57, costab20);=
*/
> ++ =A0 =A0 =A0butterfly4 =A0 =A0 =A0r5/*t76*/, r1/*t97*/, r7/*t86*/, r3/*=
t109*/,r4/*t72*/, r0/*t92*/, r6/*t81*/, r2/*t103*/, costab20, r10, r11, lr
> ++
> ++/* =A0 =A0Store away the computed butterflies:
> ++ =A0 =A0 =A0sp[24-31] =3D t86, t81, t76, t72, t109, t103, t97, t92 */
> ++ =A0 =A0 =A0sub =A0 =A0 r10, sp, -24*4
> ++ =A0 =A0 =A0stm =A0 =A0 r10, r0-r7
> ++
> ++/* =A0 =A0 =A0We now have the following on the stack:
> ++
> ++ =A0 =A0 =A0sp[0-7] =3D t83, t78, t73, t69, t106, t100, t94, t89
> ++ =A0 =A0 =A0sp[8-15] =3D t84, t79, t74, t70, t107, t101, t95, t90
> ++ =A0 =A0 =A0sp[16-23] =3D t85, t80, t75, t71, t108, t102, t96, t91
> ++ =A0 =A0 =A0sp[24-31] =3D t86, t81, t76, t72, t109, t103, t97, t92 =A0 =
=A0*/
> ++
> ++/* =A0 =A0Load =A0 =A0{r0...r7} =3D { t72, t76, t71, t75, t70, t74, t69=
, t73 } */
> ++ =A0 =A0 =A0ld.d =A0 =A0r6, sp[2*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r4, sp[10*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r2, sp[18*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r0, sp[26*4]
> ++
> ++
> ++/* =A0 =A0t113 =3D t69 =A0+ t70;
> ++ =A0 =A0 =A0t141 =3D MUL(t69 - t70, costab8);
> ++
> ++ =A0 =A0 =A0t115 =3D t73 =A0+ t74;
> ++ =A0 =A0 =A0t144 =3D MUL(t73 - t74, costab8); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r6/*t113*/, r4/*t141*/, r7/*t115*/, r=
5/*t144*/, costab8, r10, r11, lr
> ++
> ++/* =A0 =A0t114 =3D t71 =A0+ t72;
> ++ =A0 =A0 =A0t142 =3D MUL(t71 - t72, costab24);
> ++
> ++ =A0 =A0 =A0t116 =3D t75 =A0+ t76;
> ++ =A0 =A0 =A0t145 =3D MUL(t75 - t76, costab24); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r2/*t114*/, r0/*t142*/, r3/*t116*/, r=
1/*t145*/, costab24, r10, r11, lr
> ++
> ++
> ++/*
> ++ =A0 =A0 =A0t191 =3D t113 + t114;
> ++ =A0 =A0 =A0t192 =3D MUL(t113 - t114, costab16)
> ++
> ++ =A0 =A0 =A0t32 =A0=3D t115 + t116;
> ++ =A0 =A0 =A0t177 =3D MUL(t115 - t116, costab16) ;
> ++
> ++ =A0 =A0 =A0t143 =3D t141 + t142;
> ++ =A0 =A0 =A0t190 =3D MUL(t141 - t142, costab16) ;
> ++
> ++ =A0 =A0 =A0t146 =3D t144 + t145;
> ++ =A0 =A0 =A0t184 =3D MUL(t144 - t145, costab16) ; */
> ++ =A0 =A0 =A0butterfly4 =A0 =A0 =A0r6/*t191*/, r2/*t192*/, r7/*t32*/, r3=
/*t177*/, r4/*t143*/, r0/*190*/, r5/*t146*/, r1/*t184*/, costab16, r10, r11=
, lr
> ++
> ++/* =A0 =A0Store away the computed butterflies:
> ++ =A0 =A0 =A0sp[2-3] =3D t32, t191
> ++ =A0 =A0 =A0sp[10-11] =3D t146, t143
> ++ =A0 =A0 =A0sp[18-19] =3D t177, t192
> ++ =A0 =A0 =A0sp[26-27] =3D t184, t190 */
> ++ =A0 =A0 =A0st.d =A0 =A0sp[2*4] , r6
> ++ =A0 =A0 =A0st.d =A0 =A0sp[10*4], r4
> ++ =A0 =A0 =A0st.d =A0 =A0sp[18*4], r2
> ++ =A0 =A0 =A0st.d =A0 =A0sp[26*4], r0
> ++
> ++/* =A0 =A0Load =A0 =A0{r0...r7} =3D { t81, t86, t80, t85, t79, t84, t78=
, t83 } */
> ++ =A0 =A0 =A0ld.d =A0 =A0r6, sp[0*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r4, sp[8*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r2, sp[16*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r0, sp[24*4]
> ++
> ++
> ++/* =A0 =A0t118 =3D t78 =A0+ t79;
> ++ =A0 =A0 =A0t148 =3D MUL(t78 - t79, costab8);
> ++
> ++ =A0 =A0 =A0t121 =3D t83 =A0+ t84;
> ++ =A0 =A0 =A0t152 =3D MUL(t83 - t84, costab8); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r6/*t118*/, r4/*t148*/, r7/*t121*/, r=
5/*t152*/, costab8, r10, r11, lr
> ++
> ++/* =A0 =A0t119 =3D t80 =A0+ t81;
> ++ =A0 =A0 =A0t149 =3D MUL(t80 - t81, costab24);
> ++
> ++ =A0 =A0 =A0t122 =3D t85 =A0+ t86;
> ++ =A0 =A0 =A0t153 =3D MUL(t85 - t86, costab24); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r2/*t119*/, r0/*t149*/, r3/*t122*/, r=
1/*t153*/, costab24, r10, r11, lr
> ++
> ++
> ++
> ++/* =A0 =A0t58 =A0=3D t118 + t119;
> ++ =A0 =A0 =A0t178 =3D MUL(t118 - t119, costab16) ;
> ++
> ++ =A0 =A0 =A0t67 =A0=3D t121 + t122;
> ++ =A0 =A0 =A0t179 =3D MUL(t121 - t122, costab16) ;
> ++
> ++ =A0 =A0 =A0t150 =3D t148 + t149;
> ++ =A0 =A0 =A0t185 =3D MUL(t148 - t149, costab16) ;
> ++
> ++ =A0 =A0 =A0t154 =3D t152 + t153;
> ++ =A0 =A0 =A0t186 =3D MUL(t152 - t153, costab16) ; */
> ++ =A0 =A0 =A0butterfly4 =A0 =A0 =A0r6/*t58*/, r2/*t178*/, r7/*t67*/, r3/=
*t179*/, r4/*t150*/, r0/*185*/, r5/*t154*/, r1/*t186*/, costab16, r10, r11,=
 lr
> ++
> ++/* =A0 =A0Store away the computed butterflies:
> ++ =A0 =A0 =A0sp[0-1] =3D t67, t58
> ++ =A0 =A0 =A0sp[8-9] =3D t154, t150
> ++ =A0 =A0 =A0sp[16-17] =3D t179, t178
> ++ =A0 =A0 =A0sp[24-25] =3D t186, t185 */
> ++ =A0 =A0 =A0st.d =A0 =A0sp[0*4] , r6
> ++ =A0 =A0 =A0st.d =A0 =A0sp[8*4], r4
> ++ =A0 =A0 =A0st.d =A0 =A0sp[16*4], r2
> ++ =A0 =A0 =A0st.d =A0 =A0sp[24*4], r0
> ++
> ++/* =A0 =A0Load =A0 =A0{r0...r7} =3D { t92, t97, t91, t96, t90, t95, t89=
, t94 } */
> ++ =A0 =A0 =A0ld.d =A0 =A0r6, sp[6*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r4, sp[14*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r2, sp[22*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r0, sp[30*4]
> ++
> ++
> ++/* =A0 =A0t125 =3D t89 =A0+ t90;
> ++ =A0 =A0 =A0t157 =3D MUL(t89 - t90, costab8);
> ++
> ++ =A0 =A0 =A0t128 =3D t94 =A0+ t95;
> ++ =A0 =A0 =A0t161 =3D MUL(t94 - t95, costab8); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r6/*t125*/, r4/*t157*/, r7/*t128*/, r=
5/*t161*/, costab8, r10, r11, lr
> ++
> ++/* =A0 =A0t126 =3D t91 =A0+ t92;
> ++ =A0 =A0 =A0t158 =3D MUL(t91 - t92, costab24);
> ++
> ++ =A0 =A0 =A0t129 =3D t96 =A0+ t97;
> ++ =A0 =A0 =A0t162 =3D MUL(t96 - t97, costab24); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r2/*t126*/, r0/*t158*/, r3/*t129*/, r=
1/*t162*/, costab24, r10, r11, lr
> ++
> ++
> ++/*
> ++ =A0 =A0 =A0t93 =A0=3D t125 + t126;
> ++ =A0 =A0 =A0t180 =3D MUL(t125 - t126, costab16) ;
> ++
> ++ =A0 =A0 =A0t98 =A0=3D t128 + t129;
> ++ =A0 =A0 =A0t181 =3D MUL(t128 - t129, costab16) ;
> ++
> ++ =A0 =A0 =A0t159 =3D t157 + t158;
> ++ =A0 =A0 =A0t187 =3D MUL(t157 - t158, costab16) ;
> ++
> ++ =A0 =A0 =A0t163 =3D t161 + t162;
> ++ =A0 =A0 =A0t188 =3D MUL(t161 - t162, costab16) ; */
> ++ =A0 =A0 =A0butterfly4 =A0 =A0 =A0r6/*t93*/, r2/*t180*/, r7/*t98*/, r3/=
*t181*/, r4/*t159*/, r0/*187*/, r5/*t163*/, r1/*t188*/, costab16, r10, r11,=
 lr
> ++
> ++
> ++/* =A0 =A0Store away the computed butterflies:
> ++ =A0 =A0 =A0sp[6-7] =3D t98, t93
> ++ =A0 =A0 =A0sp[14-15] =3D t163, t159
> ++ =A0 =A0 =A0sp[22-23] =3D t181, t180
> ++ =A0 =A0 =A0sp[30-31] =3D t188, t187 */
> ++ =A0 =A0 =A0st.d =A0 =A0sp[6*4] , r6
> ++ =A0 =A0 =A0st.d =A0 =A0sp[14*4], r4
> ++ =A0 =A0 =A0st.d =A0 =A0sp[22*4], r2
> ++ =A0 =A0 =A0st.d =A0 =A0sp[30*4], r0
> ++
> ++/* =A0 =A0Load =A0 =A0{r0...r7} =3D { t103, t109, t102, t108, t101, t10=
7, t100, t106 } */
> ++ =A0 =A0 =A0ld.d =A0 =A0r6, sp[4*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r4, sp[12*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r2, sp[20*4]
> ++ =A0 =A0 =A0ld.d =A0 =A0r0, sp[28*4]
> ++
> ++
> ++
> ++/* =A0 =A0t132 =3D t100 + t101;
> ++ =A0 =A0 =A0t166 =3D MUL(t100 - t101, costab8);
> ++
> ++ =A0 =A0 =A0t136 =3D t106 + t107;
> ++ =A0 =A0 =A0t171 =3D MUL(t106 - t107, costab8); */
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r6/*t132*/, r4/*t166*/, r7/*t136*/, r=
5/*t171*/, costab8, r10, r11, lr
> ++
> ++/* =A0 =A0t133 =3D t102 + t103;
> ++ =A0 =A0 =A0t167 =3D MUL(t102 - t103, costab24);
> ++
> ++ =A0 =A0 =A0t137 =3D t108 + t109;
> ++ =A0 =A0 =A0t172 =3D MUL(t108 - t109, costab24);*/
> ++ =A0 =A0 =A0butterfly2 =A0 =A0 =A0r2/*t133*/, r0/*t167*/, r3/*t137*/, r=
1/*t172*/, costab24, r10, r11, lr
> ++
> ++
> ++/* =A0 =A0t104 =3D t132 + t133;
> ++ =A0 =A0 =A0t182 =3D MUL(t132 - t133, costab16) ;
> ++
> ++ =A0 =A0 =A0t110 =3D t136 + t137;
> ++ =A0 =A0 =A0t183 =3D MUL(t136 - t137, costab16) ;
> ++
> ++ =A0 =A0 =A0t168 =3D t166 + t167;
> ++ =A0 =A0 =A0t189 =3D MUL(t166 - t167, costab16) ;
> ++
> ++ =A0 =A0 =A0t173 =3D t171 + t172;
> ++ =A0 =A0 =A0t208 =3D MUL(t171 - t172, costab16) ; */
> ++ =A0 =A0 =A0butterfly4 =A0 =A0 =A0r6/*t104*/, r2/*t182*/, r7/*t110*/, r=
3/*t183*/, r4/*t168*/, r0/*189*/, r5/*t173*/, r1/*t208*/, costab16, r10, r1=
1, lr
> ++
> ++/* =A0 =A0Store away the computed butterflies:
> ++ =A0 =A0 =A0sp[4-5] =3D t110, t104
> ++ =A0 =A0 =A0sp[12-13] =3D t173, t168
> ++ =A0 =A0 =A0sp[20-21] =3D t183, t182
> ++ =A0 =A0 =A0sp[28-29] =3D t208, t189 */
> ++ =A0 =A0 =A0st.d =A0 =A0sp[4*4] , r6
> ++ =A0 =A0 =A0st.d =A0 =A0sp[12*4], r4
> ++ =A0 =A0 =A0st.d =A0 =A0sp[20*4], r2
> ++ =A0 =A0 =A0st.d =A0 =A0sp[28*4], r0
> ++
> ++/* =A0 =A0Now we have the following stack
> ++
> ++ =A0 =A0 =A0sp[0-7] =A0 =3D t67, =A0t58 , t32, =A0t191, t110, t104, t98=
, =A0t93
> ++ =A0 =A0 =A0sp[8-15] =A0=3D t154, t150, t146, t143, t173, t168, t163, t=
159
> ++ =A0 =A0 =A0sp[16-23] =3D t179, t178, t177, t192, t183, t182, t181, t18=
0
> ++ =A0 =A0 =A0sp[24-31] =3D t186, t185, t184, t190, t208, t189, t188, t18=
7
> ++*/
> ++
> ++ =A0 =A0 =A0/* Get slot, lo and hi from stack */
> ++ =A0 =A0 =A0lddsp =A0 lr, sp[32*4 + 4] /*slot*/
> ++ =A0 =A0 =A0lddsp =A0 r12, sp[32*4 + 8] /*lo*/
> ++ =A0 =A0 =A0lddsp =A0 r11, sp[32*4 + 12] /*hi*/
> ++
> ++ =A0 =A0 =A0add =A0 =A0 r12, r12, lr << 2
> ++ =A0 =A0 =A0add =A0 =A0 r11, r11, lr << 2
> ++
> ++
> ++/* =A0 =A0t49 =A0=3D -(t67 * 2) + t32;
> ++ =A0 =A0 =A0 hi[14][slot] =3D SHIFT(t32);
> ++ =A0 =A0 =A0t87 =A0=3D -(t110 * 2) + t67;
> ++ =A0 =A0 =A0t138 =3D -(t173 * 2) + t110;
> ++ =A0 =A0 =A0t203 =3D -(t208 * 2) + t173; */
> ++
> ++ =A0 =A0 =A0lddsp =A0 r0/*t67*/, sp[0]
> ++ =A0 =A0 =A0lddsp =A0 r1/*t32*/, sp[2*4]
> ++ =A0 =A0 =A0lddsp =A0 r2/*t110*/, sp[4*4]
> ++ =A0 =A0 =A0lddsp =A0 r3/*t173*/, sp[12*4]
> ++ =A0 =A0 =A0lddsp =A0 r5/*t208*/, sp[28*4]
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r4/*t49*/, r1, r0 << 1
> ++ =A0 =A0 =A0scale =A0 r1
> ++ =A0 =A0 =A0sub =A0 =A0 r0/*t87*/, r0, r2 << 1
> ++ =A0 =A0 =A0st.w =A0 =A0r11[14*SLOTS*4], r1
> ++ =A0 =A0 =A0sub =A0 =A0 r2/*t138*/, r2, r3 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r1/*t203*/, r3, r5 << 1
> ++
> ++/* =A0 =A0 =A0Live: r0 =3D t87, r1=3D t203, r2=3D t138, r4 =3D t49
> ++ =A0 =A0 =A0Free: =A0 r3, r5, r6, r7, r8, r9, r10, lr =A0*/
> ++
> ++/* =A0 =A0t68 =A0=3D (t98 * 2) + t49;
> ++ =A0 =A0 =A0hi[12][slot] =3D SHIFT(-t49);
> ++ =A0 =A0 =A0t130 =3D -(t163 * 2) + t98;
> ++ =A0 =A0 =A0t201 =3D -(t188 * 2) + t163;
> ++ =A0 =A0 =A0t200 =3D -(t186 * 2) + t154;
> ++ =A0 =A0 =A0t111 =3D (t154 * 2) + t87;
> ++ =A0 =A0 =A0t77 =A0=3D -(-(t87 * 2) - t68);
> ++ =A0 =A0 =A0t88 =A0=3D (t146 * 2) + t77;
> ++ =A0 =A0 =A0t199 =3D -(t184 * 2) + t146;
> ++ =A0 =A0 =A0hi[ 8][slot] =3D SHIFT(-t77);
> ++ =A0 =A0 =A0hi[10][slot] =3D SHIFT(t68);*/
> ++ =A0 =A0 =A0lddsp =A0 r3/*t98*/, sp[6*4]
> ++ =A0 =A0 =A0lddsp =A0 r5/*t163*/, sp[14*4]
> ++ =A0 =A0 =A0lddsp =A0 r6/*t188*/, sp[30*4]
> ++ =A0 =A0 =A0lddsp =A0 r10/*t186*/, sp[24*4]
> ++
> ++ =A0 =A0 =A0add =A0 =A0 r7/*t68*/, r4, r3 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r4
> ++ =A0 =A0 =A0scale =A0 r4
> ++ =A0 =A0 =A0lddsp =A0 r9/*t154*/, sp[8*4]
> ++ =A0 =A0 =A0sub =A0 =A0 r3/*t130*/, r3, r5 << 1
> ++ =A0 =A0 =A0st.w =A0 =A0r11[12*SLOTS*4], r4
> ++ =A0 =A0 =A0sub =A0 =A0 r8/*t201*/, r5, r6 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r4/*t200*/, r9, r10 << 1
> ++ =A0 =A0 =A0lddsp =A0 lr/*t146*/, sp[10*4]
> ++ =A0 =A0 =A0lddsp =A0 r6/*t184*/, sp[26*4]
> ++ =A0 =A0 =A0add =A0 =A0 r10/*t111*/, r0, r9 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r5/*t77*/,r7, r0 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r0/*t88*/, r5, lr << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r6/*t199*/, lr, r6 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r5
> ++ =A0 =A0 =A0scale =A0 r5
> ++ =A0 =A0 =A0scale =A0 r7
> ++ =A0 =A0 =A0st.w =A0 =A0r11[8*SLOTS*4], r5
> ++ =A0 =A0 =A0st.w =A0 =A0r11[10*SLOTS*4], r7
> ++
> ++/* =A0 =A0 =A0Live: r0 =3D t88, r1=3D t203, r2=3D t138, r3 =3D t130, r4=
 =3D t200,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r6 =3D 199, r8 =3D t201, r10 =3D t111
> ++ =A0 =A0 =A0Free: =A0 r5, r7, r9, lr =A0 =A0*/
> ++
> ++
> ++/*
> ++ =A0 =A0 =A0t123 =3D -(-(t138 * 2) - t111);
> ++ =A0 =A0 =A0t174 =3D (t183 * 2) + t138;
> ++ =A0 =A0 =A0t99 =A0=3D -(t111 * 2) + t88;
> ++ =A0 =A0 =A0hi[ 6][slot] =3D SHIFT(t88); */
> ++ =A0 =A0 =A0lddsp =A0 r5/*t183*/, sp[20*4]
> ++
> ++ =A0 =A0 =A0add =A0 =A0 r7/*t123*/, r10, r2 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r10/*t99*/, r0, r10 << 1
> ++ =A0 =A0 =A0scale =A0 r0
> ++ =A0 =A0 =A0add =A0 =A0 r2/*t174*/, r2, r5 << 1
> ++ =A0 =A0 =A0st.w =A0 =A0r11[6*SLOTS*4], r0
> ++
> ++/* =A0 =A0 =A0Live: r1 =3D t203, r2 =3D t174, r3 =3D t130, r4 =3D t200,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r6 =3D t199, r7 =3D t123, r8 =3D t201, r10 =
=3D t99
> ++ =A0 =A0 =A0Free: =A0 r0, r5, r9, lr =A0 =A0*/
> ++
> ++/* =A0 =A0t112 =3D -(t130 * 2) + t99;
> ++ =A0 =A0 =A0t164 =3D (t181 * 2) + t130;
> ++ =A0 =A0 =A0hi[ 4][slot] =3D SHIFT(-t99); */
> ++ =A0 =A0 =A0lddsp =A0 r0/*t181*/, sp[22*4]
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r5/*t112*/, r10, r3 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r10
> ++ =A0 =A0 =A0scale =A0 r10
> ++ =A0 =A0 =A0add =A0 =A0 r3/*164*/, r3, r0 << 1
> ++ =A0 =A0 =A0st.w =A0 =A0r11[4*SLOTS*4], r10
> ++
> ++/* =A0 =A0 =A0Live: r1 =3D t203, r2 =3D t174, r3 =3D t164, r4 =3D t200,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r5 =3D t112, r6 =3D t199, r7 =3D t123, r8 =
=3D t201
> ++ =A0 =A0 =A0Free: =A0 r0, r9, r10, lr =A0 =A0*/
> ++
> ++
> ++/* =A0 =A0t117 =3D -(-(t123 * 2) - t112);
> ++ =A0 =A0 =A0t139 =3D (t179 * 2) + t123;
> ++ =A0 =A0 =A0hi[ 2][slot] =3D SHIFT(t112); */
> ++ =A0 =A0 =A0lddsp =A0 r0/*t179*/, sp[16*4]
> ++
> ++ =A0 =A0 =A0add =A0 =A0 r9/*t117*/, r5, r7 << 1
> ++ =A0 =A0 =A0scale =A0 r5
> ++ =A0 =A0 =A0add =A0 =A0 r7/*t139*/, r7, r0 << 1
> ++ =A0 =A0 =A0st.w =A0 =A0r11[2*SLOTS*4], r5
> ++
> ++/* =A0 =A0 =A0Live: r1 =3D t203, r2 =3D t174, r3 =3D t164, r4 =3D t200,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r6 =3D t199, r7 =3D t139, r8 =3D t201, r9 =
=3D t117
> ++ =A0 =A0 =A0Free: =A0 r0, r5, r10, lr =A0 =A0*/
> ++
> ++/* =A0 =A0t155 =3D -(t174 * 2) + t139;
> ++ =A0 =A0 =A0t204 =3D -(-(t203 * 2) - t174);
> ++ =A0 =A0 =A0t124 =3D (t177 * 2) + t117;
> ++ =A0 =A0 =A0hi[ 0][slot] =3D SHIFT(-t117);
> ++ =A0 =A0 =A0t131 =3D -(t139 * 2) + t124;
> ++ =A0 =A0 =A0lo[ 1][slot] =3D SHIFT(t124);*/
> ++ =A0 =A0 =A0lddsp =A0 r0/*t177*/, sp[18*4]
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r5/*t155*/, r7, r2 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r2/*t204*/, r2, r1 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r0/*t124*/, r9, r0 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r9
> ++ =A0 =A0 =A0scale =A0 r9
> ++ =A0 =A0 =A0sub =A0 =A0 r7/*t131*/, r0, r7 << 1
> ++ =A0 =A0 =A0scale =A0 r0
> ++ =A0 =A0 =A0st.w =A0 =A0r11[0*SLOTS*4], r9
> ++ =A0 =A0 =A0st.w =A0 =A0r12[1*SLOTS*4], r0
> ++
> ++/* =A0 =A0 =A0Live: r2 =3D t204, r3 =3D t164, r4 =3D t200,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r5 =3D t155, r6 =3D t199, r7 =3D t131, r8 =
=3D t201
> ++ =A0 =A0 =A0Free: =A0 r0, r1, r9, r10, lr =A0 =A0*/
> ++
> ++/* =A0 =A0t140 =3D (t164 * 2) + t131;
> ++ =A0 =A0 =A0lo[ 3][slot] =3D SHIFT(-t131);
> ++ =A0 =A0 =A0t202 =3D -(-(t201 * 2) - t164); =A0*/
> ++ =A0 =A0 =A0add =A0 =A0 r0/*t140*/, r7, r3 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r7
> ++ =A0 =A0 =A0scale =A0 r7
> ++ =A0 =A0 =A0add =A0 =A0 r3/*t202*/, r3, r8 << 1
> ++ =A0 =A0 =A0st.w =A0 =A0r12[3*SLOTS*4], r7
> ++
> ++/* =A0 =A0 =A0Live: r0 =3D t140, r2 =3D t204, r3 =3D t202, r4 =3D t200,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r5 =3D t155, r6 =3D t199
> ++ =A0 =A0 =A0Free: =A0 r1, r7, r8, r9, r10, lr =A0 =A0*/
> ++
> ++
> ++/* =A0 =A0t147 =3D -(-(t155 * 2) - t140);
> ++ =A0 =A0 =A0lo[ 5][slot] =3D SHIFT(t140);
> ++ =A0 =A0 =A0t175 =3D -(t200 * 2) + t155;
> ++ =A0 =A0 =A0t156 =3D -(t199 * 2) + t147;
> ++ =A0 =A0 =A0lo[ 7][slot] =3D SHIFT(-t147); */
> ++ =A0 =A0 =A0add =A0 =A0 r1/*t147*/, r0, r5 << 1
> ++ =A0 =A0 =A0scale =A0 r0
> ++ =A0 =A0 =A0sub =A0 =A0 r5/*t175*/, r5, r4 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r4/*156*/, r1, r6 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r1
> ++ =A0 =A0 =A0scale =A0 r1
> ++ =A0 =A0 =A0st.w =A0 =A0r12[5*SLOTS*4], r0
> ++ =A0 =A0 =A0st.w =A0 =A0r12[7*SLOTS*4], r1
> ++
> ++/* =A0 =A0 =A0Live: r2 =3D t204, r3 =3D t202,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r4 =3D t156, r5 =3D t175
> ++ =A0 =A0 =A0Free: =A0 r0, r1, r6, r7, r8, r9, r10, lr =A0 =A0*/
> ++
> ++
> ++/* =A0 =A0t205 =3D -(-(t204 * 2) - t175);
> ++ =A0 =A0 =A0t165 =3D -(t175 * 2) + t156;
> ++ =A0 =A0 =A0lo[ 9][slot] =3D SHIFT(t156);
> ++ =A0 =A0 =A0t176 =3D -(t202 * 2) + t165;
> ++ =A0 =A0 =A0lo[11][slot] =3D SHIFT(-t165);
> ++ =A0 =A0 =A0t206 =3D -(-(t205 * 2) - t176);
> ++ =A0 =A0 =A0lo[15][slot] =3D SHIFT(-t206)
> ++ =A0 =A0 =A0lo[13][slot] =3D SHIFT(t176) */
> ++ =A0 =A0 =A0add =A0 =A0 r0/*t205*/, r5, r2 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r1/*t165*/, r4, r5 << 1
> ++ =A0 =A0 =A0scale =A0 r4
> ++ =A0 =A0 =A0sub =A0 =A0 r3/*t176*/, r1, r3 << 1
> ++ =A0 =A0 =A0st.w =A0 =A0r12[9*SLOTS*4], r4
> ++ =A0 =A0 =A0neg =A0 =A0 r1
> ++ =A0 =A0 =A0scale =A0 r1
> ++ =A0 =A0 =A0add =A0 =A0 r6/*t206*/, r3, r0 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r6
> ++ =A0 =A0 =A0scale =A0 r6
> ++ =A0 =A0 =A0scale =A0 r3
> ++ =A0 =A0 =A0st.w =A0 =A0r12[11*SLOTS*4], r1
> ++ =A0 =A0 =A0st.w =A0 =A0r12[15*SLOTS*4], r6
> ++ =A0 =A0 =A0st.w =A0 =A0r12[13*SLOTS*4], r3
> ++
> ++/* =A0 =A0t193 =3D -((t190 * 2) - t143)
> ++ =A0 =A0 =A0hi[ 7][slot] =3D SHIFT(t143);
> ++ =A0 =A0 =A0lo[ 8][slot] =3D SHIFT(-t193);
> ++ =A0 =A0 =A0t82 =A0=3D -(t104 * 2) + t58;
> ++ =A0 =A0 =A0hi[13][slot] =3D SHIFT(t58);
> ++ =A0 =A0 =A0t134 =3D -(t168 * 2) + t104;
> ++ =A0 =A0 =A0t196 =3D -(t189 * 2) + t168; */
> ++
> ++ =A0 =A0 =A0lddsp =A0 r0/*t190*/, sp[27*4]
> ++ =A0 =A0 =A0lddsp =A0 r1/*t143*/, sp[11*4]
> ++ =A0 =A0 =A0lddsp =A0 r2/*t104*/, sp[5*4]
> ++ =A0 =A0 =A0lddsp =A0 r3/*t58*/, sp[1*4]
> ++ =A0 =A0 =A0lddsp =A0 r4/*t168*/, sp[13*4]
> ++ =A0 =A0 =A0lddsp =A0 r5/*t189*/, sp[29*4]
> ++ =A0 =A0 =A0sub =A0 =A0 r0/*t193*/, r1, r0 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r0
> ++ =A0 =A0 =A0scale =A0 r1
> ++ =A0 =A0 =A0scale =A0 r0
> ++ =A0 =A0 =A0st.w =A0 =A0r11[7*SLOTS*4], r1
> ++ =A0 =A0 =A0st.w =A0 =A0r12[8*SLOTS*4], r0
> ++ =A0 =A0 =A0sub =A0 =A0 r0/*t82*/, r3, r2 << 1
> ++ =A0 =A0 =A0scale =A0 r3
> ++ =A0 =A0 =A0sub =A0 =A0 r2/*t134*/, r2, r4 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r4/*t196*/, r4, r5 << 1
> ++ =A0 =A0 =A0st.w =A0 =A0r11[13*SLOTS*4], r3
> ++
> ++/* =A0 =A0 =A0Live: r0 =3D t82, r2 =3D t134,
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r4 =3D t196
> ++ =A0 =A0 =A0Free: =A0 r1, r3, r5, r6, r7, r8, r9, r10, lr =A0 =A0*/
> ++
> ++
> ++
> ++/*
> ++
> ++ =A0 =A0 =A0t207 =3D -(t185 * 2) + t150;
> ++ =A0 =A0 =A0t105 =3D (t150 * 2) + t82;
> ++ =A0 =A0 =A0hi[ 9][slot] =3D SHIFT(-t82);
> ++ =A0 =A0 =A0t120 =3D -(-(t134 * 2) - t105);
> ++ =A0 =A0 =A0hi[ 5][slot] =3D SHIFT(t105);
> ++ =A0 =A0 =A0t169 =3D (t182 * 2) + t134;
> ++
> ++ =A0 =A0 =A0t135 =3D (t178 * 2) + t120;
> ++ =A0 =A0 =A0hi[ 1][slot] =3D SHIFT(-t120);
> ++ =A0 =A0 =A0t197 =3D -(-(t196 * 2) - t169);
> ++ =A0 =A0 =A0t151 =3D -(t169 * 2) + t135;
> ++ =A0 =A0 =A0lo[ 2][slot] =3D SHIFT(t135); */
> ++ =A0 =A0 =A0lddsp =A0 r1/*t185*/, sp[25*4]
> ++ =A0 =A0 =A0lddsp =A0 r3/*t150*/, sp[9*4]
> ++ =A0 =A0 =A0lddsp =A0 r5/*t182*/, sp[21*4]
> ++ =A0 =A0 =A0lddsp =A0 r8/*t178*/, sp[17*4]
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r6/*t207*/, r3, r1 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r3/*t105*/, r0, r3 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r0
> ++ =A0 =A0 =A0scale =A0 r0
> ++ =A0 =A0 =A0add =A0 =A0 r7/*t120*/, r3, r2 << 1
> ++ =A0 =A0 =A0scale =A0 r3
> ++ =A0 =A0 =A0st.w =A0 =A0r11[9*SLOTS*4], r0
> ++ =A0 =A0 =A0st.w =A0 =A0r11[5*SLOTS*4], r3
> ++ =A0 =A0 =A0add =A0 =A0 r2/*t169*/, r2, r5 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r8/*t135*/, r7, r8 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r7
> ++ =A0 =A0 =A0scale =A0 r7
> ++ =A0 =A0 =A0add =A0 =A0 r4/*t197*/, r2, r4 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r2/*t151*/, r8, r2 << 1
> ++ =A0 =A0 =A0scale =A0 r8
> ++ =A0 =A0 =A0st.w =A0 =A0r11[1*SLOTS*4], r7
> ++ =A0 =A0 =A0st.w =A0 =A0r12[2*SLOTS*4], r8
> ++
> ++/* =A0 =A0 =A0Live: r2 =3D t151, r4 =3D t197, r6 =3D t207
> ++
> ++ =A0 =A0 =A0Free: =A0 r0, r1, r3, r5, r7, r8, r9, r10, lr =A0 =A0*/
> ++
> ++
> ++
> ++/* =A0 =A0t170 =3D -(t207 * 2) + t151;
> ++ =A0 =A0 =A0lo[ 6][slot] =3D SHIFT(-t151);
> ++
> ++ =A0 =A0 =A0t198 =3D -(-(t197 * 2) - t170);
> ++ =A0 =A0 =A0lo[10][slot] =3D SHIFT(t170);
> ++ =A0 =A0 =A0lo[14][slot] =3D SHIFT(-t198);
> ++
> ++ =A0 =A0 =A0t127 =3D -(t159 * 2) + t93;
> ++ =A0 =A0 =A0hi[11][slot] =3D SHIFT(t93);
> ++ =A0 =A0 =A0t194 =3D -(t187 * 2) + t159; =A0 */
> ++ =A0 =A0 =A0lddsp =A0 r0/*t159*/, sp[15*4]
> ++ =A0 =A0 =A0lddsp =A0 r1/*t93*/, sp[7*4]
> ++ =A0 =A0 =A0lddsp =A0 r3/*t187*/, sp[31*4]
> ++ =A0 =A0 =A0sub =A0 =A0 r5/*t170*/, r2, r6 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r2
> ++ =A0 =A0 =A0scale =A0 r2
> ++ =A0 =A0 =A0add =A0 =A0 r4/*t198*/,r5, r4 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r4
> ++ =A0 =A0 =A0scale =A0 r5
> ++ =A0 =A0 =A0scale =A0 r4
> ++ =A0 =A0 =A0st.w =A0 =A0r12[6*SLOTS*4], r2
> ++ =A0 =A0 =A0st.w =A0 =A0r12[10*SLOTS*4], r5
> ++ =A0 =A0 =A0st.w =A0 =A0r12[14*SLOTS*4], r4
> ++ =A0 =A0 =A0sub =A0 =A0 r7/*t127*/, r1, r0 << 1
> ++ =A0 =A0 =A0scale =A0 r1
> ++ =A0 =A0 =A0sub =A0 =A0 r0/*t194*/, r0, r3 << 1
> ++ =A0 =A0 =A0st.w =A0 =A0r11[11*SLOTS*4], r1
> ++
> ++
> ++/* =A0 =A0 =A0Live: r0 =3D t194, r7 =3D t127
> ++ =A0 =A0 =A0Free: =A0 r1, r2, r3, r4, r6, r5, r8, r9, r10, lr =A0 =A0*/
> ++
> ++/* =A0 =A0t160 =3D (t180 * 2) + t127;
> ++ =A0 =A0 =A0hi[ 3][slot] =3D SHIFT(-t127);
> ++ =A0 =A0 =A0t195 =3D -(-(t194 * 2) - t160);
> ++ =A0 =A0 =A0lo[ 4][slot] =3D SHIFT(t160);
> ++ =A0 =A0 =A0lo[12][slot] =3D SHIFT(-t195);
> ++
> ++ =A0 =A0 =A0hi[15][slot] =3D SHIFT(t191);
> ++ =A0 =A0 =A0lo[ 0][slot] =3D SHIFT(t192); */
> ++ =A0 =A0 =A0lddsp =A0 r1/*t180*/, sp[23*4]
> ++ =A0 =A0 =A0lddsp =A0 r2/*t191*/, sp[3*4]
> ++ =A0 =A0 =A0lddsp =A0 r3/*t192*/, sp[19*4]
> ++ =A0 =A0 =A0add =A0 =A0 r4/*t160*/, r7, r1 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r7
> ++ =A0 =A0 =A0scale =A0 r7
> ++ =A0 =A0 =A0add =A0 =A0 r6/*t195*/, r4, r0 << 1
> ++ =A0 =A0 =A0scale =A0 r4
> ++ =A0 =A0 =A0neg =A0 =A0 r6
> ++ =A0 =A0 =A0scale =A0 r6
> ++ =A0 =A0 =A0st.w =A0 =A0r11[3*SLOTS*4], r7
> ++ =A0 =A0 =A0st.w =A0 =A0r12[4*SLOTS*4], r4
> ++ =A0 =A0 =A0st.w =A0 =A0r12[12*SLOTS*4], r6
> ++ =A0 =A0 =A0scale =A0 r2
> ++ =A0 =A0 =A0scale =A0 r3
> ++ =A0 =A0 =A0st.w =A0 =A0r11[15*SLOTS*4], r2
> ++ =A0 =A0 =A0st.w =A0 =A0r12[0*SLOTS*4], r3
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 sp, -32*4
> ++ =A0 =A0 =A0ldm =A0 =A0 sp++,r0-r7, r9-r11, pc
> +diff --git a/fixed.h b/fixed.h
> +index 4b58abf..0a1350a 100644
> +--- a/fixed.h
> ++++ b/fixed.h
> +@@ -237,6 +237,46 @@ mad_fixed_t mad_f_mul_inline(mad_fixed_t x, mad_fix=
ed_t y)
> + # =A0 define MAD_F_SCALEBITS =A0MAD_F_FRACBITS
> + # =A0endif
> +
> ++/* --- AVR32 ----------------------------------------------------------=
------- */
> ++
> ++# elif defined(FPM_AVR32)
> ++
> ++typedef =A0 signed short mad_coeff_t;
> ++
> ++struct DWstruct {int high, low;};
> ++
> ++typedef union {
> ++ =A0struct DWstruct s;
> ++ =A0long long ll;
> ++} DWunion;
> ++
> ++# =A0define MAD_F_MLX(hi, lo, x, y) =A0\
> ++ =A0{ register DWunion __res; \
> ++ =A0 =A0__res.ll =3D (long long)x * (long long)y; \
> ++ =A0 =A0/* =A0 =A0asm ("muls.d\t%0, %1, %2" : "=3Dr" (__res.ll) : "r" (=
x), "r" (y));*/ \
> ++ =A0 =A0hi =3D __res.s.high; \
> ++ =A0 =A0lo =3D __res.s.low; }
> ++
> ++# =A0define MAD_F_MLA(hi, lo, x, y) =A0\
> ++ =A0{ register DWunion __res; \
> ++ =A0 =A0__res.s.high =3D hi; \
> ++ =A0 =A0__res.s.low =3D lo; \
> ++ =A0 =A0__res.ll +=3D (long long)x * (long long)y; \
> ++/* =A0asm ("macs.d\t%0, %1, %2" : "+r" (__res.ll) : "r" (x), "r" (y));*=
/ \
> ++ =A0 =A0hi =3D __res.s.high; \
> ++ =A0 =A0lo =3D __res.s.low; }
> ++
> ++
> ++# =A0define MAD_F_MLN(hi, lo) =A0\
> ++ =A0 =A0asm ("neg %0\n" =A0\
> ++ =A0 =A0 =A0 "acr =A0 %1\n" =A0\
> ++ =A0 =A0 =A0 =A0 "neg =A0 %1" =A0 =A0\
> ++ =A0 =A0 =A0 : "+r" (lo), "+r" (hi) \
> ++ =A0 =A0 =A0 :: "cc")
> ++
> ++
> ++# =A0define MAD_F_SCALEBITS =A0MAD_F_FRACBITS
> ++
> + /* --- ARM ------------------------------------------------------------=
----- */
> +
> + # elif defined(FPM_ARM)
> +@@ -433,6 +473,8 @@ mad_fixed_t mad_f_mul_inline(mad_fixed_t x, mad_fixe=
d_t y)
> + =A0*
> + =A0* Pre-rounding is required to stay within the limits of compliance.
> + =A0*/
> ++typedef =A0 signed int mad_coeff_t;
> ++
> + # =A0if defined(OPT_SPEED)
> + # =A0 define mad_f_mul(x, y) =A0 =A0(((x) >> 12) * ((y) >> 16))
> + # =A0else
> +diff --git a/imdct_avr32.S b/imdct_avr32.S
> +new file mode 100644
> +index 0000000..d0ee6b4
> +--- /dev/null
> ++++ b/imdct_avr32.S
> +@@ -0,0 +1,789 @@
> ++/*
> ++ =A0 Optimized 36-point Inverse Modified Cosine Transform (IMDCT)
> ++ =A0 Copyright 2003-2006 Atmel Corporation.
> ++
> ++ =A0 Written by Ronny Pedersen, Atmel Norway
> ++
> ++ =A0 This program is free software; you can redistribute it and/or modi=
fy
> ++ =A0 it under the terms of the GNU General Public License as published =
by
> ++ =A0 the Free Software Foundation; either version 2 of the License, or
> ++ =A0 (at your option) any later version.
> ++
> ++ =A0 This program is distributed in the hope that it will be useful,
> ++ =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> ++ =A0 GNU General Public License for more details.
> ++
> ++ =A0 You should have received a copy of the GNU General Public License
> ++ =A0 along with this program; if not, write to the Free Software
> ++ =A0 Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-13=
07, USA. */
> ++
> ++#define MAD_F(x) ((x + (1 << 13)) >> 14)
> ++
> ++ =A0 =A0 =A0.public imdct36_avr32
> ++
> ++/*
> ++ =A0 =A0 =A0void imdct36(mad_fixed_t const x[18], mad_fixed_t y[36])
> ++ =A0 =A0 =A0{
> ++ =A0 =A0 =A0mad_fixed_t tmp[18];
> ++ =A0 =A0 =A0int i;
> ++*/
> ++/* DCT-IV */
> ++imdct36_avr32:
> ++ =A0 =A0 =A0pushm =A0 r0-r7,r11,lr
> ++ =A0 =A0 =A0sub =A0 =A0 sp, 4*18
> ++/*
> ++ =A0 =A0 =A0{
> ++ =A0 =A0 =A0mad_fixed_t tmp2[18];
> ++ =A0 =A0 =A0int i;
> ++
> ++ =A0 =A0 =A0/* scale[i] =3D 2 * cos(PI * (2 * i + 1) / (4 * 18)) */
> ++/*
> ++ =A0 =A0 =A0static mad_fixed_t const scale[18] =3D {
> ++ =A0 =A0 =A0MAD_F(0x1ff833fa), MAD_F(0x1fb9ea93), MAD_F(0x1f3dd120),
> ++ =A0 =A0 =A0MAD_F(0x1e84d969), MAD_F(0x1d906bcf), MAD_F(0x1c62648b),
> ++ =A0 =A0 =A0MAD_F(0x1afd100f), MAD_F(0x1963268b), MAD_F(0x1797c6a4),
> ++ =A0 =A0 =A0MAD_F(0x159e6f5b), MAD_F(0x137af940), MAD_F(0x11318ef3),
> ++ =A0 =A0 =A0MAD_F(0x0ec6a507), MAD_F(0x0c3ef153), MAD_F(0x099f61c5),
> ++ =A0 =A0 =A0MAD_F(0x06ed12c5), MAD_F(0x042d4544), MAD_F(0x0165547c)
> ++ =A0 =A0 =A0};
> ++*/
> ++
> ++ =A0/* scaling */
> ++
> ++/*
> ++ =A0 =A0 =A0for (i =3D 0; i < 18; i +=3D 3) {
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp2[i + 0] =3D mad_f_mul(x[i + 0], scale[i=
 + 0]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp2[i + 1] =3D mad_f_mul(x[i + 1], scale[i=
 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp2[i + 2] =3D mad_f_mul(x[i + 2], scale[i=
 + 2]);
> ++ =A0 =A0 =A0 =A0}
> ++*/
> ++ =A0 =A0 =A0/* even input butterfly */
> ++
> ++/*
> ++ =A0 =A0 =A0for (i =3D 0; i < 9; i +=3D 3) {
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp3[i + 0] =3D tmp2[i + 0] + tmp2[18 - (i =
+ 0) - 1];
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp3[i + 1] =3D tmp2[i + 1] + tmp2[18 - (i =
+ 1) - 1];
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp3[i + 2] =3D tmp2[i + 2] + tmp2[18 - (i =
+ 2) - 1];
> ++ =A0 =A0 =A0 =A0}
> ++ =A0 =A0 =A0for (i =3D 0; i < 9; i +=3D 3) {
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp4[i + 0] =3D tmp2[i + 0] - tmp2[18 - (i =
+ 0) - 1];
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp4[i + 1] =3D tmp2[i + 1] - tmp2[18 - (i =
+ 1) - 1];
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp4[i + 2] =3D tmp2[i + 2] - tmp2[18 - (i =
+ 2) - 1];
> ++ =A0 =A0 =A0 =A0}
> ++*/
> ++
> ++ =A0 =A0 =A0ld.d =A0 =A0r8, r12[0] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0/*r8 =3D x[1], r9 =3D x[0]*/
> ++ =A0 =A0 =A0ld.d =A0 =A0r0, pc[scale_dctIV - .] =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 /*r0 =3D {scale[2], scale[3]}, r1 =3D { scale[0], scale[1] }*/
> ++ =A0 =A0 =A0ld.d =A0 =A0r2, r12[2*4] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0/*r2 =3D x[3], r3 =3D x[2]*/
> ++ =A0 =A0 =A0ld.d =A0 =A0r4, pc[scale_dctIV - . + 14*2] =A0 =A0 =A0 =A0 =
=A0/*r4 =3D {scale[16], scale[17]}, r5 =3D { scale[14], scale[15] }*/
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r9/*tmp2[0]*/, r9, r1:t =A0 =A0 =A0 =A0 /=
*tmp2[0] =3D mad_f_mul(x[0], scale[0]) */
> ++ =A0 =A0 =A0ld.d =A0 =A0r6, r12[16*4] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 /*r6 =3D x[17], r7 =3D x[16]*/
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r8/*tmp2[1]*/, r8, r1:b =A0 =A0 =A0 =A0 /=
*tmp2[1] =3D mad_f_mul(x[1], scale[1]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r3/*tmp2[2]*/, r3, r0:t =A0 =A0 =A0 =A0 /=
*tmp2[2] =3D mad_f_mul(x[2], scale[2]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r2/*tmp2[3]*/, r2, r0:b =A0 =A0 =A0 =A0 /=
*tmp2[3] =3D mad_f_mul(x[3], scale[3]) */
> ++ =A0 =A0 =A0ld.d =A0 =A0r0, r12[14*4] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 /*r0 =3D x[15], r1 =3D x[14]*/
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r7/*tmp2[16]*/, r7, r4:t =A0 =A0 =A0 =A0/=
*tmp2[16] =3D mad_f_mul(x[16], scale[16]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r6/*tmp2[17]*/, r6, r4:b =A0 =A0 =A0 =A0/=
*tmp2[17] =3D mad_f_mul(x[17], scale[17]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r1/*tmp2[14]*/, r1, r5:t =A0 =A0 =A0 =A0/=
*tmp2[14] =3D mad_f_mul(x[14], scale[14]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r0/*tmp2[15]*/, r0, r5:b =A0 =A0 =A0 =A0/=
*tmp2[15] =3D mad_f_mul(x[15], scale[15]) */
> ++
> ++ =A0 =A0 =A0ld.d =A0 =A0r4, r12[4*4] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0/*r4 =3D x[5], r5 =3D x[4]*/
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 lr/*tmp4[0]*/, r9, r6
> ++ =A0 =A0 =A0add =A0 =A0 =A0 =A0 =A0 =A0 r6/*tmp3[0]*/, r9, r6
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r10/*tmp4[1]*/, r8, r7
> ++ =A0 =A0 =A0add =A0 =A0 =A0 =A0 =A0 =A0 r7/*tmp3[1]*/, r8, r7
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r9/*tmp4[2]*/, r3, r0
> ++ =A0 =A0 =A0add =A0 =A0 =A0 =A0 =A0 =A0 r0/*tmp3[2]*/, r3, r0
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r8/*tmp4[3]*/, r2, r1
> ++ =A0 =A0 =A0add =A0 =A0 =A0 =A0 =A0 =A0 r1/*tmp3[3]*/, r2, r1
> ++
> ++ =A0 =A0 =A0ld.d =A0 =A0r2, pc[scale_dctIV - . + 4*2] =A0 =A0 =A0 =A0 =
=A0 /*r2 =3D {scale[6], scale[7]}, r3 =3D { scale[4], scale[5] }*/
> ++
> ++ =A0 =A0 =A0stm =A0 =A0 =A0 =A0 =A0 =A0 --sp, r8-r10, lr =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/*sp[0] =3D tmp4[0],sp[1] =3D tmp4[1],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sp[2] =3D tmp4[2],sp[3] =3D tmp4=
[3] */
> ++
> ++ =A0 =A0 =A0/* Registers used: =A0 =A0 =A0r0 =3D tmp3[2], r1 =3D tmp3[3=
], r6 =3D tmp3[0], r7 =3D tmp3[1], r12 =3D x
> ++ =A0 =A0 =A0 =A0 Free registers: =A0 =A0 =A0r2-r5, r8-r11, lr
> ++ =A0 =A0 =A0*/
> ++ =A0 =A0 =A0ld.d =A0 =A0r8, r12[6*4] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0/*r8 =3D x[7], r9 =3D x[6]*/
> ++ =A0 =A0 =A0ld.d =A0 =A0r10, pc[scale_dctIV - . + 10*2] =A0 =A0 =A0 =A0=
 /*r10 =3D {scale[12], scale[13]}, r11 =3D { scale[10], scale[11] }*/
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r5/*tmp2[4]*/, r5, r3:t =A0 =A0 =A0 =A0 /=
*tmp2[4] =3D mad_f_mul(x[4], scale[4]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r4/*tmp2[5]*/, r4, r3:b =A0 =A0 =A0 =A0 /=
*tmp2[5] =3D mad_f_mul(x[5], scale[5]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r9/*tmp2[6]*/, r9, r2:t =A0 =A0 =A0 =A0 /=
*tmp2[6] =3D mad_f_mul(x[6], scale[6]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r8/*tmp2[7]*/, r8, r2:b =A0 =A0 =A0 =A0 /=
*tmp2[7] =3D mad_f_mul(x[7], scale[7]) */
> ++
> ++ =A0 =A0 =A0ld.d =A0 =A0r2, r12[12*4] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 /*r2 =3D x[13], r3 =3D x[12]*/
> ++ =A0 =A0 =A0ld.w =A0 =A0lr, r12[11*4] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 /*lr =3D x[11] */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r3/*tmp2[12]*/, r3, r10:t =A0 =A0 =A0 /*t=
mp2[12] =3D mad_f_mul(x[12], scale[12]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r2/*tmp2[13]*/, r2, r10:b =A0 =A0 =A0 /*t=
mp2[13] =3D mad_f_mul(x[13], scale[13]) */
> ++ =A0 =A0 =A0ld.w =A0 =A0r10, r12[10*4] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/*r10 =3D x[10] */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 lr/*tmp2[11]*/, lr, r11:b =A0 =A0 =A0 /*t=
mp2[11] =3D mad_f_mul(x[11], scale[11]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r10/*tmp2[10]*/, r10, r11:t =A0 =A0 /*tmp=
2[10] =3D mad_f_mul(x[10], scale[10]) */
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r11/*tmp4[4]*/, r5, r2
> ++ =A0 =A0 =A0add =A0 =A0 r2/*tmp3[4]*/, r5, r2
> ++ =A0 =A0 =A0sub =A0 =A0 r5/*tmp4[5]*/, r4, r3
> ++ =A0 =A0 =A0add =A0 =A0 r3/*tmp3[5]*/, r4, r3
> ++ =A0 =A0 =A0sub =A0 =A0 r4/*tmp4[6]*/, r9, lr
> ++ =A0 =A0 =A0add =A0 =A0 lr/*tmp3[6]*/, r9, lr
> ++ =A0 =A0 =A0sub =A0 =A0 r9/*tmp4[7]*/, r8, r10
> ++ =A0 =A0 =A0add =A0 =A0 r10/*tmp3[7]*/, r8, r10
> ++ =A0 =A0 =A0lddpc =A0 r8, scale_dctIV + 8*2 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 /*r8 =3D {scale[8], scale[9]} */
> ++
> ++ =A0 =A0 =A0stm =A0 =A0 --sp, r4, r5, r9, r11 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 /*sp[0] =3D tmp4[4],sp[1] =3D tmp4[7],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sp[2] =3D tmp4[5],sp[3] =3D tmp4=
[6] */
> ++ =A0 =A0 =A0ld.d =A0 =A0r4, r12[8*4] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0/*r4 =3D x[9], r5 =3D x[8]*/
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r5/*tmp2[8]*/, r5, r8:t =A0 =A0 =A0 =A0 /=
*tmp2[8] =3D mad_f_mul(x[8], scale[8]) */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r4/*tmp2[9]*/, r4, r8:b =A0 =A0 =A0 =A0 /=
*tmp2[9] =3D mad_f_mul(x[9], scale[9]) */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r9/*tmp4[8]*/, r5, r4
> ++ =A0 =A0 =A0add =A0 =A0 =A0 =A0 =A0 =A0 r5/*tmp3[8]*/, r5, r4
> ++
> ++ =A0 =A0 =A0st.w =A0 =A0--sp, r9 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0/* sp[0] =3D tmp4[8] */
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0=3Dtmp3[2], r1=3Dtmp3[3], r2=3Dtmp3[4], r=
3=3Dtmp3[5], r5=3Dtmp3[8], r6 =3D tmp3[0],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r7 =3D tmp3[1], r10=3Dtmp3[7], lr=3Dtmp3[6]
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r4, r8, r9, r11, r12
> ++ =A0 =A0 =A0*/
> ++
> ++
> ++ =A0/* SDCT-II */
> ++/*
> ++
> ++ =A0 =A0 =A0{
> ++ =A0 =A0 =A0mad_fixed_t tmp3[9];
> ++ =A0 =A0 =A0int i;
> ++*/
> ++ =A0 =A0 =A0/* scale[i] =3D 2 * cos(PI * (2 * i + 1) / (2 * 18)) */
> ++/*
> ++ =A0 =A0 =A0static mad_fixed_t const scale[9] =3D {
> ++ =A0 =A0 =A0MAD_F(0x1fe0d3b4), MAD_F(0x1ee8dd47), MAD_F(0x1d007930),
> ++ =A0 =A0 =A0MAD_F(0x1a367e59), MAD_F(0x16a09e66), MAD_F(0x125abcf8),
> ++ =A0 =A0 =A0MAD_F(0x0d8616bc), MAD_F(0x08483ee1), MAD_F(0x02c9fad7)
> ++ =A0 =A0 =A0};
> ++*/
> ++ =A0/* divide the 18-point SDCT-II into two 9-point SDCT-IIs */
> ++
> ++
> ++ =A0/* fastdct */
> ++
> ++/*
> ++ =A0 =A0 =A0{
> ++ =A0 =A0 =A0mad_fixed_t a0, =A0a1, =A0a2, =A0a3, =A0a4, =A0a5, =A0a6, =
=A0a7, =A0a8, =A0a9, =A0a10, a11, a12;
> ++ =A0 =A0 =A0mad_fixed_t a13, a14, a15, a16, a17, a18, a19, a20, a21, a2=
2, a23, a24, a25;
> ++ =A0 =A0 =A0mad_fixed_t m0, =A0m1, =A0m2, =A0m3, =A0m4, =A0m5, =A0m6, =
=A0m7;
> ++*/
> ++// =A0 =A0 =A0enum {
> ++// =A0 =A0 =A0 =A0c0 =3D =A0MAD_F(0x1f838b8d), =A0/* 2 * cos( 1 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c1 =3D =A0MAD_F(0x1bb67ae8), =A0/* 2 * cos( 3 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c2 =3D =A0MAD_F(0x18836fa3), =A0/* 2 * cos( 4 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c3 =3D =A0MAD_F(0x1491b752), =A0/* 2 * cos( 5 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c4 =3D =A0MAD_F(0x0af1d43a), =A0/* 2 * cos( 7 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c5 =3D =A0MAD_F(0x058e86a0), =A0/* 2 * cos( 8 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c6 =3D -MAD_F(0x1e11f642) =A0 /* 2 * cos(16 * PI / 18=
) */
> ++// =A0 =A0 =A0};
> ++
> ++/*
> ++ =A0 =A0 =A0a2 =3D tmp3[6] + tmp3[2];
> ++ =A0 =A0 =A0a6 =3D tmp3[8] + tmp3[0];
> ++ =A0 =A0 =A0a11 =3D a2 =A0- a6;
> ++ =A0 =A0 =A0m5 =3D mad_f_mul(a11, -c6) ;
> ++ =A0 =A0 =A0a4 =3D tmp3[1] + tmp3[7];
> ++
> ++ =A0 =A0 =A0a18 =3D =A0 =A0 tmp3[4] + a4;
> ++ =A0 =A0 =A0a19 =3D -2 * tmp3[4] + a4;
> ++
> ++ =A0 =A0 =A0a0 =3D tmp3[3] + tmp3[5];
> ++
> ++*/
> ++ =A0 =A0 =A0add =A0 =A0 r11/*a4*/, r7, r10
> ++ =A0 =A0 =A0add =A0 =A0 r12/*a18*/, r2, r11
> ++ =A0 =A0 =A0sub =A0 =A0 r11/*a19*/, r11, r2<<1
> ++
> ++ =A0 =A0 =A0add =A0 =A0 r4/*a2*/, lr, r0
> ++ =A0 =A0 =A0add =A0 =A0 r8/*a6*/, r5, r6
> ++ =A0 =A0 =A0sub =A0 =A0 r9/*a11*/, r4, r8
> ++
> ++ =A0 =A0 =A0st.d =A0 =A0--sp, r0 =A0 =A0 =A0 =A0/* sp[0] =3D tmp3[3], s=
p1[1] =3D tmp3[2]*/
> ++
> ++ =A0 =A0 =A0mov =A0 =A0 r2, MAD_F(0x1e11f642)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r9/*m5*/, r9, r2:b
> ++
> ++ =A0 =A0 =A0add =A0 =A0 r2/*a0*/, r1, r3
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r2=3Da0, r3=3Dtmp3[5], r4=3Da2, r5=3Dtmp3[8=
], r6 =3D tmp3[0],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r7 =3D tmp3[1], r8=3Da6, r10=3Dtmp3[7], r9=
=3Dm5, r11=3Da19, r12=3Da18,lr=3Dtmp3[6]
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0, r1
> ++ =A0 =A0 =A0*/
> ++
> ++/*
> ++ =A0 =A0 =A0a8 =A0=3D a0 =A0+ a2;
> ++ =A0 =A0 =A0a12 =3D a8 =A0+ a6;
> ++ =A0 =A0 =A0a10 =3D a0 =A0- a6;
> ++ =A0 =A0 =A0a9 =A0=3D a0 =A0- a2;
> ++ =A0 =A0 =A0m7 =3D mad_f_mul(a9, =A0-c2) ;
> ++ =A0 =A0 =A0m6 =3D mad_f_mul(a10, -c5) ;
> ++*/
> ++
> ++ =A0 =A0 =A0add =A0 =A0 r0/*a8*/, r2, r4
> ++ =A0 =A0 =A0add =A0 =A0 r0/*a12*/, r8
> ++ =A0 =A0 =A0rsub =A0 =A0r8/*a10*/, r2
> ++ =A0 =A0 =A0sub =A0 =A0 r2/*a9*/, r4
> ++ =A0 =A0 =A0mov =A0 =A0 r1, -MAD_F(0x18836fa3)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r2/*m7*/, r2, r1:b
> ++ =A0 =A0 =A0mov =A0 =A0 r1, -MAD_F(0x058e86a0)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r8/*m6*/, r8, r1:b
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0=3Da12, r2=3Dm7, r3=3Dtmp3[5], r5=3Dtmp3[=
8], r6 =3D tmp3[0],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r7 =3D tmp3[1], r8=3Dm6, r10=3Dtmp3[7], r9=
=3Dm5, r11=3Da19, r12=3Da18,lr=3Dtmp3[6]
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r1, r4
> ++ =A0 =A0 =A0*/
> ++
> ++
> ++/*
> ++ =A0 =A0 =A0a21 =3D -a19 - (m5 << 1);
> ++ =A0 =A0 =A0tmp[ 8] =3D a21 - (m6 << 1);
> ++
> ++ =A0 =A0 =A0a20 =3D a19 - (m5 << 1);
> ++ =A0 =A0 =A0tmp[ 4] =3D (m7 << 1) =A0+ a20;
> ++ =A0 =A0 =A0a22 =3D -a19 + (m6 << 1);
> ++ =A0 =A0 =A0tmp[16] =3D a22 + (m7 << 1);
> ++ =A0 =A0 =A0tmp[ 0] =3D a18 + a12;
> ++ =A0 =A0 =A0tmp[12] =3D a12 - 2 * a18;
> ++*/
> ++ =A0 =A0 =A0add =A0 =A0 r1/*a21*/, r11, r9 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r1
> ++ =A0 =A0 =A0sub =A0 =A0 r1/*tmp[8]*/, r1, r8 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*11/*tmp3[..] on the stack*/ + 8*4], r1
> ++ =A0 =A0 =A0sub =A0 =A0 r4/*a20*/, r11, r9 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r4/*tmp[4]*/, r4, r2 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*11/*tmp3[..] on the stack*/ + 4*4], r4
> ++ =A0 =A0 =A0neg =A0 =A0 r11
> ++ =A0 =A0 =A0add =A0 =A0 r1/*a22*/, r11, r8 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r1/*tmp[16]*/, r1, r2 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*11/*tmp3[..] on the stack*/ + 16*4], r1
> ++ =A0 =A0 =A0add =A0 =A0 r4, r12, r0
> ++ =A0 =A0 =A0sub =A0 =A0 r1, r0, r12 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*11/*tmp3[..] on the stack*/ + 0*4], r4
> ++ =A0 =A0 =A0stdsp =A0 sp[4*11/*tmp3[..] on the stack*/ + 12*4], r1
> ++
> ++ =A0 =A0 =A0ld.d =A0 =A0r0, sp++
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0 =3D tmp3[2], r1 =3D tmp3[3], r3=3Dtmp3[5=
], r5=3Dtmp3[8], r6 =3D tmp3[0],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r7 =3D tmp3[1], r10=3Dtmp3[7], r11=3Da19, l=
r=3Dtmp3[6]
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r2,r4,r8,r9,r12
> ++ =A0 =A0 =A0*/
> ++
> ++/*
> ++ =A0 =A0 =A0a5 =3D tmp3[1] - tmp3[7];
> ++ =A0 =A0 =A0a7 =3D tmp3[8] - tmp3[0];
> ++ =A0 =A0 =A0a3 =3D tmp3[6] - tmp3[2];
> ++ =A0 =A0 =A0a1 =3D tmp3[3] - tmp3[5];
> ++ =A0 =A0 =A0a13 =3D a1 =A0- a3;
> ++ =A0 =A0 =A0a14 =3D a13 + a7;
> ++ =A0 =A0 =A0m3 =3D mad_f_mul(a14, -c1) ;
> ++ =A0 =A0 =A0m4 =3D mad_f_mul(a5, =A0-c1) ;
> ++ =A0 =A0 =A0tmp[ 6] =3D m3 << 1;
> ++*/
> ++ =A0 =A0 =A0sub =A0 =A0 r7/*a5*/, r10
> ++ =A0 =A0 =A0sub =A0 =A0 r2/*a7*/, r5, r6
> ++ =A0 =A0 =A0sub =A0 =A0 r4/*a3*/, lr, r0
> ++ =A0 =A0 =A0sub =A0 =A0 r8/*a1*/, r1, r3
> ++ =A0 =A0 =A0sub =A0 =A0 r9/*a13*/, r8, r4
> ++ =A0 =A0 =A0add =A0 =A0 r12/*a14*/, r9, r2
> ++ =A0 =A0 =A0mov =A0 =A0 r0, -MAD_F(0x1bb67ae8)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r12/*m3*/, r12, r0:b
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r7/*m4*/, r7, r0:b
> ++ =A0 =A0 =A0lsl =A0 =A0 r12, 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*9/*tmp3[..] on the stack*/ + 6*4], r12
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r2 =3D a7, r4 =3D a3, r7 =3D m4, r8 =3D a1,=
 r12 =3D m3
> ++
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0, r1, r3, r5, r6, r10, r9, r11, lr
> ++ =A0 =A0 =A0*/
> ++
> ++
> ++/*
> ++ =A0 =A0 =A0a15 =3D a3 =A0+ a7;
> ++ =A0 =A0 =A0m2 =3D mad_f_mul(a15, -c4) ;
> ++ =A0 =A0 =A0a17 =3D a1 =A0+ a3;
> ++ =A0 =A0 =A0m0 =3D mad_f_mul(a17, -c3) ;
> ++ =A0 =A0 =A0a23 =3D (m4 << 1) =A0+ (m2 << 1);
> ++ =A0 =A0 =A0tmp[14] =3D a23 + (m0 << 1); */
> ++ =A0 =A0 =A0add =A0 =A0 r0/*a15*/, r4, r2
> ++ =A0 =A0 =A0mov =A0 =A0 r1, -MAD_F(0x0af1d43a)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r0/*m2*/, r0, r1:b
> ++ =A0 =A0 =A0mov =A0 =A0 r3, -MAD_F(0x1491b752)
> ++ =A0 =A0 =A0add =A0 =A0 r5/*a17*/, r8, r4
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r5/*m0*/, r5, r3:b
> ++ =A0 =A0 =A0lsl =A0 =A0 r7, 1
> ++ =A0 =A0 =A0add =A0 =A0 r6/*a23*/, r7, r0 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r6/*tmp[14]*/, r6, r5 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*9/*tmp3[..] on the stack*/ + 14*4], r6
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0 =3D m2, r2 =3D a7, r5 =3D m0, r7 =3D m4,=
 r8 =3D a1
> ++
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r1, r3, r4, r6, r10, r9, r11, lr
> ++ =A0 =A0 =A0*/
> ++
> ++/*
> ++ =A0 =A0 =A0a16 =3D a1 =A0- a7;
> ++ =A0 =A0 =A0m1 =3D mad_f_mul(a16, -c0) ;
> ++ =A0 =A0 =A0a24 =3D (m4 << 1) =A0- (m2 << 1);
> ++ =A0 =A0 =A0tmp[10] =3D a24 - (m1 << 1);
> ++
> ++ =A0 =A0 =A0a25 =3D (m4 << 1) =A0+ (m1 << 1);
> ++ =A0 =A0 =A0tmp[ 2] =3D (m0 << 1) =A0- a25;
> ++*/
> ++ =A0 =A0 =A0sub =A0 =A0 r3/*a16*/, r8, r2
> ++ =A0 =A0 =A0mov =A0 =A0 r4, =A0-MAD_F(0x1f838b8d)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r3/*m1*/, r3, r4:b
> ++ =A0 =A0 =A0sub =A0 =A0 r1/*a24*/, r7, r0 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r1/*tmp[10]*/, r1, r3 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*9/*tmp3[..] on the stack*/ + 10*4], r1
> ++ =A0 =A0 =A0add =A0 =A0 r7/*a25*/, r7, r3 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r7, r7, r5 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r7
> ++ =A0 =A0 =A0stdsp =A0 sp[4*9/*tmp3[..] on the stack*/ + 2*4], r7
> ++
> ++
> ++
> ++
> ++ =A0/* output to every other slot for convenience */
> ++
> ++ =A0/*} */
> ++ =A0/* End fastdct */
> ++
> ++ =A0/* odd input butterfly and scaling */
> ++
> ++
> ++ =A0 =A0 =A0/* =A0On the stack:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0sp[0] =3D tmp4[8], sp[1] =3D tmp4[4],sp[2] =
=3D tmp4[7], sp[3] =3D tmp4[5],sp[4] =3D tmp4[6]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0sp[5] =3D tmp4[0], sp[6] =3D tmp4[1],sp[7] =
=3D tmp4[2],sp[8] =3D tmp4[3]
> ++ =A0 =A0 =A0*/
> ++
> ++ =A0/*
> ++ =A0 =A0 =A0 =A0tmp3[0] =3D mad_f_mul(tmp4[0], scale[0]);
> ++ =A0 =A0 =A0 =A0tmp3[1] =3D mad_f_mul(tmp4[1], scale[1]) << 1;
> ++ =A0 =A0 =A0 =A0tmp3[2] =3D mad_f_mul(tmp4[2], scale[2]);
> ++ =A0 =A0 =A0 =A0tmp3[3] =3D mad_f_mul(tmp4[3], scale[3]) << 1;
> ++ =A0 =A0 =A0 =A0tmp3[4] =3D mad_f_mul(tmp4[4], scale[4]);
> ++ =A0 =A0 =A0 =A0tmp3[5] =3D mad_f_mul(tmp4[5], scale[5]);
> ++ =A0 =A0 =A0 =A0tmp3[6] =3D mad_f_mul(tmp4[6], scale[6]) << 1;
> ++ =A0 =A0 =A0 =A0tmp3[7] =3D mad_f_mul(tmp4[7], scale[7]);
> ++ =A0 =A0 =A0 =A0tmp3[8] =3D mad_f_mul(tmp4[8], scale[8]) << 1;
> ++ =A0*/
> ++ =A0 =A0 =A0/* Registers used:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r1 =3D tmp4[3], r2 =3D tmp4[2], r3 =3D tmp4=
[1], r4 =3D tmp4[0], r7 =3D tmp4[6]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r10 =3D tmp4[5], r11 =3D tmp4[7], r12 =3D t=
mp4[4], lr =3D tmp4[8]
> ++
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0, r5, r6, r8, r9
> ++ =A0 =A0 =A0*/
> ++ =A0 =A0 =A0ld.d =A0 =A0r8, pc[ scale_sdctII - . + 4*2] /* r8 =3D { sca=
le[6], scale[7] }, r9 =3D { scale[4], scale[5]} */
> ++ =A0 =A0 =A0ldm =A0 =A0 sp++, r1, r2, r3, r4, r7, r10, r11, r12, lr
> ++ =A0 =A0 =A0mov =A0 =A0 r5, MAD_F(0x02c9fad7) =A0 =A0 =A0 =A0 =A0 /* r3=
 =3D scale[8] */
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r5/*tmp3[8]*/, lr, r5:b
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 lr/*tmp3[6]*/, r7, r8:t
> ++ =A0 =A0 =A0ld.d =A0 =A0r6, pc[ scale_sdctII - . + 0*2] /* r6 =3D { sca=
le[2], scale[3] }, r7 =3D { scale[0], scale[1]} */
> ++ =A0 =A0 =A0lsl =A0 =A0 lr, 1
> ++ =A0 =A0 =A0lsl =A0 =A0 r5, 1
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r0/*tmp3[2]*/, r2, r6:t
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r1/*tmp3[3]*/, r1, r6:b
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r6/*tmp3[0]*/, r4, r7:t
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r7/*tmp3[1]*/, r3, r7:b
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r3/*tmp3[5]*/, r10, r9:b
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r2/*tmp3[4]*/, r12, r9:t
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r9/*tmp3[7]*/, r11, r8:b
> ++ =A0 =A0 =A0lsl =A0 =A0 r1, 1
> ++ =A0 =A0 =A0lsl =A0 =A0 r7, 1
> ++
> ++
> ++ =A0/* fastdct */
> ++
> ++/*
> ++ =A0 =A0 =A0{
> ++ =A0 =A0 =A0mad_fixed_t a0, =A0a1, =A0a2, =A0a3, =A0a4, =A0a5, =A0a6, =
=A0a7, =A0a8, =A0a9, =A0a10, a11, a12;
> ++ =A0 =A0 =A0mad_fixed_t a13, a14, a15, a16, a17, a18, a19, a20, a21, a2=
2, a23, a24, a25;
> ++ =A0 =A0 =A0mad_fixed_t m0, =A0m1, =A0m2, =A0m3, =A0m4, =A0m5, =A0m6, =
=A0m7;
> ++*/
> ++// =A0 =A0 =A0enum {
> ++// =A0 =A0 =A0 =A0c0 =3D =A0MAD_F(0x1f838b8d), =A0/* 2 * cos( 1 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c1 =3D =A0MAD_F(0x1bb67ae8), =A0/* 2 * cos( 3 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c2 =3D =A0MAD_F(0x18836fa3), =A0/* 2 * cos( 4 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c3 =3D =A0MAD_F(0x1491b752), =A0/* 2 * cos( 5 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c4 =3D =A0MAD_F(0x0af1d43a), =A0/* 2 * cos( 7 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c5 =3D =A0MAD_F(0x058e86a0), =A0/* 2 * cos( 8 * PI / =
18) */
> ++// =A0 =A0 =A0 =A0c6 =3D -MAD_F(0x1e11f642) =A0 /* 2 * cos(16 * PI / 18=
) */
> ++// =A0 =A0 =A0};
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0=3Dtmp3[2], r1=3Dtmp3[3], r2=3Dtmp3[4], r=
3=3Dtmp3[5], r5=3Dtmp3[8], r6 =3D tmp3[0],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r7 =3D tmp3[1], r9=3Dtmp3[7], lr=3Dtmp3[6]
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r4, r8, r10, r11, r12
> ++ =A0 =A0 =A0*/
> ++
> ++/*
> ++ =A0 =A0 =A0a2 =3D tmp3[6] + (tmp3[2] << 1);
> ++ =A0 =A0 =A0a6 =3D tmp3[8] + (tmp3[0] << 1);
> ++ =A0 =A0 =A0a11 =3D a2 - a6;
> ++ =A0 =A0 =A0m5 =3D mad_f_mul(a11, c6) ;
> ++ =A0 =A0 =A0a4 =3D tmp3[1] + (tmp3[7] << 1);
> ++
> ++ =A0 =A0 =A0a18 =3D =A0 =A0 (tmp3[4] << 1) + a4;
> ++ =A0 =A0 =A0a19 =3D -2 * (tmp3[4] << 1) + a4;
> ++
> ++ =A0 =A0 =A0a0 =3D tmp3[3] + (tmp3[5] << 1);
> ++
> ++*/
> ++ =A0 =A0 =A0add =A0 =A0 r11/*a4*/, r7, r9 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r12/*a18*/, r11, r2 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r11/*a19*/, r11, r2 << 2
> ++
> ++ =A0 =A0 =A0add =A0 =A0 r4/*a2*/, lr, r0 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r8/*a6*/, r5, r6 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r10/*a11*/, r4, r8
> ++
> ++ =A0 =A0 =A0st.d =A0 =A0--sp, r0 =A0 =A0 =A0 =A0/* sp[0] =3D tmp3[3], s=
p1[1] =3D tmp3[2]*/
> ++
> ++ =A0 =A0 =A0mov =A0 =A0 r2, -MAD_F(0x1e11f642)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r10/*m5*/, r10, r2:b
> ++
> ++ =A0 =A0 =A0add =A0 =A0 r2/*a0*/, r1, r3 << 1
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r2=3Da0, r3=3Dtmp3[5], r4=3Da2, r5=3Dtmp3[8=
], r6 =3D tmp3[0],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r7 =3D tmp3[1], r8=3Da6, r9=3Dtmp3[7], r10=
=3Dm5, r11=3Da19, r12=3Da18,lr=3Dtmp3[6]
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0, r1
> ++ =A0 =A0 =A0*/
> ++
> ++/*
> ++ =A0 =A0 =A0a8 =A0=3D a0 =A0+ a2;
> ++ =A0 =A0 =A0a12 =3D a8 =A0+ a6;
> ++ =A0 =A0 =A0a10 =3D a0 =A0- a6;
> ++ =A0 =A0 =A0a9 =A0=3D a0 =A0- a2;
> ++ =A0 =A0 =A0m7 =3D mad_f_mul(a9, =A0-c2) ;
> ++ =A0 =A0 =A0m6 =3D mad_f_mul(a10, -c5) ;
> ++*/
> ++
> ++ =A0 =A0 =A0add =A0 =A0 r0/*a8*/, r2, r4
> ++ =A0 =A0 =A0add =A0 =A0 r0/*a12*/, r8
> ++ =A0 =A0 =A0rsub =A0 =A0r8/*a10*/, r2
> ++ =A0 =A0 =A0sub =A0 =A0 r2/*a9*/, r4
> ++ =A0 =A0 =A0mov =A0 =A0 r1, -MAD_F(0x18836fa3)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r2/*m7*/, r2, r1:b
> ++ =A0 =A0 =A0mov =A0 =A0 r1, -MAD_F(0x058e86a0)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r8/*m6*/, r8, r1:b
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0=3Da12, r2=3Dm7, r3=3Dtmp3[5], r5=3Dtmp3[=
8], r6 =3D tmp3[0],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r7 =3D tmp3[1], r8=3Dm6, r9=3Dtmp3[7], r10=
=3Dm5, r11=3Da19, r12=3Da18,lr=3Dtmp3[6]
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r1, r4
> ++ =A0 =A0 =A0*/
> ++
> ++
> ++/*
> ++ =A0 =A0 =A0a21 =3D -a19 + (m5 << 1);
> ++ =A0 =A0 =A0tmp[ 9] =3D a21 - (m6 << 1);
> ++
> ++ =A0 =A0 =A0a20 =3D -(-a19 - (m5 << 1));
> ++ =A0 =A0 =A0tmp[ 5] =3D (m7 << 1) =A0+ a20;
> ++ =A0 =A0 =A0a22 =3D -a19 + (m6 << 1);
> ++ =A0 =A0 =A0tmp[17] =3D a22 + (m7 << 1);
> ++ =A0 =A0 =A0tmp[ 1] =3D a18 + a12;
> ++ =A0 =A0 =A0tmp[13] =3D a12 - 2 * a18;
> ++*/
> ++ =A0 =A0 =A0sub =A0 =A0 r1/*a21*/, r11, r10 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r1
> ++ =A0 =A0 =A0sub =A0 =A0 r1/*tmp[9]*/, r1, r8 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*2/*tmp3[..] on the stack*/ + 9*4], r1
> ++ =A0 =A0 =A0add =A0 =A0 r4/*a20*/, r11, r10 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r4/*tmp[5]*/, r4, r2 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*2/*tmp3[..] on the stack*/ + 5*4], r4
> ++ =A0 =A0 =A0neg =A0 =A0 r11
> ++ =A0 =A0 =A0add =A0 =A0 r1/*a22*/, r11, r8 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r1/*tmp[17]*/, r1, r2 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*2/*tmp3[..] on the stack*/ + 17*4], r1
> ++ =A0 =A0 =A0add =A0 =A0 r4, r12, r0
> ++ =A0 =A0 =A0sub =A0 =A0 r1, r0, r12 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[4*2/*tmp3[..] on the stack*/ + 1*4], r4
> ++ =A0 =A0 =A0stdsp =A0 sp[4*2/*tmp3[..] on the stack*/ + 13*4], r1
> ++
> ++ =A0 =A0 =A0ld.d =A0 =A0r0, sp++
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0 =3D tmp3[2], r1 =3D tmp3[3], r3=3Dtmp3[5=
], r5=3Dtmp3[8], r6 =3D tmp3[0],
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r7 =3D tmp3[1], r9=3Dtmp3[7], r11=3Da19, lr=
=3Dtmp3[6]
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r2,r4,r8,r10,r12
> ++ =A0 =A0 =A0*/
> ++
> ++/*
> ++ =A0 =A0 =A0a5 =3D tmp3[1] - (tmp3[7] << 1);
> ++ =A0 =A0 =A0a7 =3D tmp3[8] - (tmp3[0] << 1);
> ++ =A0 =A0 =A0a3 =3D tmp3[6] - (tmp3[2] << 1);
> ++ =A0 =A0 =A0a1 =3D tmp3[3] - (tmp3[5] << 1);
> ++ =A0 =A0 =A0a13 =3D a1 =A0- a3;
> ++ =A0 =A0 =A0a14 =3D a13 + a7;
> ++ =A0 =A0 =A0m3 =3D mad_f_mul(a14, -c1) ;
> ++ =A0 =A0 =A0m4 =3D mad_f_mul(a5, =A0-c1) ;
> ++ =A0 =A0 =A0tmp[ 7] =3D m3 << 1;
> ++*/
> ++ =A0 =A0 =A0sub =A0 =A0 r7/*a5*/, r7, r9 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r2/*a7*/, r5, r6 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r4/*a3*/, lr, r0 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r8/*a1*/, r1, r3 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r10/*a13*/, r8, r4
> ++ =A0 =A0 =A0add =A0 =A0 r12/*a14*/, r10, r2
> ++ =A0 =A0 =A0mov =A0 =A0 r0, -MAD_F(0x1bb67ae8)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r12/*m3*/, r12, r0:b
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r7/*m4*/, r7, r0:b
> ++ =A0 =A0 =A0lsl =A0 =A0 r12, 1
> ++ =A0 =A0 =A0stdsp =A0 sp[7*4], r12
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r2 =3D a7, r4 =3D a3, r7 =3D m4, r8 =3D a1,=
 r12 =3D m3
> ++
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0, r1, r3, r5, r6, r9, r10, r11, lr
> ++ =A0 =A0 =A0*/
> ++
> ++
> ++/*
> ++ =A0 =A0 =A0a15 =3D a3 =A0+ a7;
> ++ =A0 =A0 =A0m2 =3D mad_f_mul(a15, -c4) ;
> ++ =A0 =A0 =A0a17 =3D a1 =A0+ a3;
> ++ =A0 =A0 =A0m0 =3D mad_f_mul(a17, -c3) ;
> ++ =A0 =A0 =A0a23 =3D (m4 << 1) =A0+ (m2 << 1);
> ++ =A0 =A0 =A0tmp[15] =3D a23 + (m0 << 1); */
> ++ =A0 =A0 =A0add =A0 =A0 r0/*a15*/, r4, r2
> ++ =A0 =A0 =A0mov =A0 =A0 r1, -MAD_F(0x0af1d43a)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r0/*m2*/, r0, r1:b
> ++ =A0 =A0 =A0mov =A0 =A0 r3, -MAD_F(0x1491b752)
> ++ =A0 =A0 =A0add =A0 =A0 r5/*a17*/, r8, r4
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r5/*m0*/, r5, r3:b
> ++ =A0 =A0 =A0lsl =A0 =A0 r7, 1
> ++ =A0 =A0 =A0add =A0 =A0 r6/*a23*/, r7, r0 << 1
> ++ =A0 =A0 =A0add =A0 =A0 r6/*tmp[15]*/, r6, r5 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[15*4], r6
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0 =3D m2, r2 =3D a7, r5 =3D m0, r7 =3D m4,=
 r8 =3D a1
> ++
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r1, r3, r4, r6, r9, r10, r11, lr
> ++ =A0 =A0 =A0*/
> ++
> ++/*
> ++ =A0 =A0 =A0a16 =3D a1 =A0- a7;
> ++ =A0 =A0 =A0m1 =3D mad_f_mul(a16, -c0) ;
> ++ =A0 =A0 =A0a24 =3D (m4 << 1) =A0- (m2 << 1);
> ++ =A0 =A0 =A0tmp[11] =3D a24 - (m1 << 1);
> ++
> ++ =A0 =A0 =A0a25 =3D (m4 << 1) =A0+ (m1 << 1);
> ++ =A0 =A0 =A0tmp[ 3] =3D (m0 << 1) =A0- a25;
> ++*/
> ++ =A0 =A0 =A0sub =A0 =A0 r3/*a16*/, r8, r2
> ++ =A0 =A0 =A0mov =A0 =A0 r4, =A0-MAD_F(0x1f838b8d)
> ++ =A0 =A0 =A0mulsatrndwh.w =A0 r3/*m1*/, r3, r4:b
> ++ =A0 =A0 =A0sub =A0 =A0 r1/*a24*/, r7, r0 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r1/*tmp[11]*/, r1, r3 << 1
> ++ =A0 =A0 =A0stdsp =A0 sp[11*4], r1
> ++ =A0 =A0 =A0add =A0 =A0 r7/*a25*/, r7, r3 << 1
> ++ =A0 =A0 =A0sub =A0 =A0 r7, r7, r5 << 1
> ++ =A0 =A0 =A0neg =A0 =A0 r7
> ++ =A0 =A0 =A0lddsp =A0 r12, sp[4*18+4] /* Get y from stack */
> ++ =A0 =A0 =A0stdsp =A0 sp[3*4], r7
> ++
> ++
> ++ =A0/* output to every other slot for convenience */
> ++
> ++ =A0/* End fastdct */
> ++
> ++ =A0/* output accumulation */
> ++
> ++/* =A0 =A0for (i =3D 3; i < 18; i +=3D 8) {
> ++ =A0 =A0 =A0 =A0tmp[i + 0] -=3D tmp[(i + 0) - 2];
> ++ =A0 =A0 =A0 =A0tmp[i + 2] -=3D tmp[(i + 2) - 2];
> ++ =A0 =A0 =A0 =A0tmp[i + 4] -=3D tmp[(i + 4) - 2];
> ++ =A0 =A0 =A0 =A0tmp[i + 6] -=3D tmp[(i + 6) - 2];
> ++ =A0 =A0 =A0}
> ++ =A0 =A0 =A0}
> ++*/
> ++
> ++/* End =A0SDCT-II */
> ++
> ++
> ++
> ++ =A0/* scale reduction and output accumulation */
> ++
> ++/*
> ++ =A0 =A0 =A0for (i =3D 1; i < 17; i +=3D 4) {
> ++ =A0 =A0 =A0 =A0tmp[i + 0] =3D tmp[i + 0] =A0- tmp[(i + 0) - 1];
> ++ =A0 =A0 =A0 =A0tmp[i + 1] =3D tmp[i + 1] =A0- tmp[(i + 1) - 1];
> ++ =A0 =A0 =A0 =A0tmp[i + 2] =3D tmp[i + 2] =A0- tmp[(i + 2) - 1];
> ++ =A0 =A0 =A0 =A0tmp[i + 3] =3D tmp[i + 3] =A0- tmp[(i + 3) - 1];
> ++ =A0 =A0 =A0}
> ++ =A0 =A0 =A0tmp[17] =3D tmp[17] - tmp[16];
> ++ =A0 =A0 =A0}
> ++*/
> ++/* End =A0DCT-IV */
> ++
> ++
> ++ =A0/* convert 18-point DCT-IV to 36-point IMDCT */
> ++
> ++/*
> ++ =A0 =A0 =A0for (i =3D =A00; i < =A09; i +=3D 3) {
> ++ =A0 =A0 =A0 =A0y[i + 0] =3D =A0tmp[9 + (i + 0)];
> ++ =A0 =A0 =A0 =A0y[i + 1] =3D =A0tmp[9 + (i + 1)];
> ++ =A0 =A0 =A0 =A0y[i + 2] =3D =A0tmp[9 + (i + 2)];
> ++ =A0 =A0 =A0}
> ++ =A0 =A0 =A0for (i =3D =A09; i < 27; i +=3D 3) {
> ++ =A0 =A0 =A0 =A0y[i + 0] =3D -tmp[36 - (9 + (i + 0)) - 1];
> ++ =A0 =A0 =A0 =A0y[i + 1] =3D -tmp[36 - (9 + (i + 1)) - 1];
> ++ =A0 =A0 =A0 =A0y[i + 2] =3D -tmp[36 - (9 + (i + 2)) - 1];
> ++ =A0 =A0 =A0}
> ++ =A0 =A0 =A0for (i =3D 27; i < 36; i +=3D 3) {
> ++ =A0 =A0 =A0 =A0y[i + 0] =3D -tmp[(i + 0) - 27];
> ++ =A0 =A0 =A0 =A0y[i + 1] =3D -tmp[(i + 1) - 27];
> ++ =A0 =A0 =A0 =A0y[i + 2] =3D -tmp[(i + 2) - 27];
> ++ =A0 =A0 =A0}
> ++ =A0 =A0 =A0}
> ++*/
> ++
> ++ =A0 =A0 =A0/* Registers used:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r0 =3D tmp[8], r1 =3D tmp[7], r2 =3D tmp[6]=
, r3 =3D tmp[5], r4 =3D tmp[4]
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r5 =3D tmp[3], r6 =3D tmp[2], r7 =3D tmp[1]=
, r8 =3D tmp[0], r12 =3D y
> ++
> ++ =A0 =A0 =A0 =A0 Free registers:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0r9, r10, r11, lr
> ++ =A0 =A0 =A0*/
> ++
> ++ =A0 =A0 =A0ldm =A0 =A0 sp++, r0-r8 =A0 =A0 /* Get tmp[0]-tmp[8] from s=
tack */
> ++ =A0 =A0 =A0sub =A0 =A0 r5, r7 =A0 =A0 =A0 =A0 =A0/* tmp[3] -=3D tmp[1]=
*/
> ++ =A0 =A0 =A0sub =A0 =A0 r3, r5 =A0 =A0 =A0 =A0 =A0/* tmp[5] -=3D tmp[3]=
*/
> ++ =A0 =A0 =A0sub =A0 =A0 r1, r3 =A0 =A0 =A0 =A0 =A0/* tmp[7] -=3D tmp[5]=
*/
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r7, r8 =A0 =A0 =A0 =A0 =A0/* tmp[1] -=3D tmp[0]=
*/
> ++ =A0 =A0 =A0sub =A0 =A0 r6, r7 =A0 =A0 =A0 =A0 =A0/* tmp[2] -=3D tmp[1]=
*/
> ++ =A0 =A0 =A0sub =A0 =A0 r5, r6 =A0 =A0 =A0 =A0 =A0/* tmp[3] -=3D tmp[2]=
*/
> ++ =A0 =A0 =A0neg =A0 =A0 r8
> ++ =A0 =A0 =A0st.w =A0 =A0r12[26*4], r8 =A0 /* y[26] =3D -tmp[0] */
> ++ =A0 =A0 =A0st.w =A0 =A0r12[27*4], r8 =A0 /* y[27] =3D -tmp[0] */
> ++ =A0 =A0 =A0neg =A0 =A0 r7
> ++ =A0 =A0 =A0neg =A0 =A0 r6
> ++ =A0 =A0 =A0st.w =A0 =A0r12[25*4], r7 =A0 /* y[25] =3D -tmp[1] */
> ++ =A0 =A0 =A0st.w =A0 =A0r12[24*4], r6 =A0 /* y[24] =3D -tmp[2] */
> ++ =A0 =A0 =A0st.d =A0 =A0r12[28*4], r6 =A0 /* y[28] =3D -tmp[1], y[29] =
=3D -tmp[2]*/
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r4, r5 =A0 =A0 =A0 =A0 =A0/* tmp[4] -=3D tmp[3]=
*/
> ++ =A0 =A0 =A0sub =A0 =A0 r3, r4 =A0 =A0 =A0 =A0 =A0/* tmp[5] -=3D tmp[4]=
*/
> ++ =A0 =A0 =A0neg =A0 =A0 r5
> ++ =A0 =A0 =A0neg =A0 =A0 r4
> ++ =A0 =A0 =A0st.w =A0 =A0r12[23*4], r5 =A0 /* y[23] =3D -tmp[3] */
> ++ =A0 =A0 =A0st.w =A0 =A0r12[22*4], r4 =A0 /* y[22] =3D -tmp[4] */
> ++ =A0 =A0 =A0st.d =A0 =A0r12[30*4], r4 =A0 /* y[30] =3D -tmp[3], y[31] =
=3D -tmp[4]*/
> ++
> ++ =A0 =A0 =A0ldm =A0 =A0 sp++, r4-r11,lr /* Get tmp[9]-tmp[17] from stac=
k */
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r2, r3 =A0 =A0 =A0 =A0 =A0/* tmp[6] -=3D tmp[5]=
*/
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 lr, r1 =A0 =A0 =A0 =A0 =A0/* tmp[9] -=3D tmp[7]=
*/
> ++ =A0 =A0 =A0sub =A0 =A0 r10, lr =A0 =A0 =A0 =A0 /* tmp[11] -=3D tmp[9]*=
/
> ++ =A0 =A0 =A0sub =A0 =A0 r8, r10 =A0 =A0 =A0 =A0 /* tmp[13] -=3D tmp[11]=
*/
> ++ =A0 =A0 =A0sub =A0 =A0 r6, r8 =A0 =A0 =A0 =A0 =A0/* tmp[15] -=3D tmp[1=
3]*/
> ++ =A0 =A0 =A0sub =A0 =A0 r4, r6 =A0 =A0 =A0 =A0 =A0/* tmp[17] -=3D tmp[1=
5]*/
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r1, r2 =A0 =A0 =A0 =A0 =A0/* tmp[7] -=3D tmp[6]=
*/
> ++ =A0 =A0 =A0sub =A0 =A0 r0, r1 =A0 =A0 =A0 =A0 =A0/* tmp[8] -=3D tmp[7]=
*/
> ++ =A0 =A0 =A0neg =A0 =A0 r3
> ++ =A0 =A0 =A0neg =A0 =A0 r2
> ++ =A0 =A0 =A0st.w =A0 =A0r12[21*4], r3 =A0 /* y[21] =3D -tmp[5] */
> ++ =A0 =A0 =A0st.w =A0 =A0r12[20*4], r2 =A0 /* y[20] =3D -tmp[6] */
> ++ =A0 =A0 =A0st.d =A0 =A0r12[32*4], r2 =A0 /* y[32] =3D -tmp[5], y[33] =
=3D -tmp[6]*/
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 lr, r0 =A0 =A0 =A0 =A0 =A0/* tmp[9] -=3D tmp[8]=
*/
> ++ =A0 =A0 =A0sub =A0 =A0 r11, lr =A0 =A0 =A0 =A0 /* tmp[10] -=3D tmp[9]*=
/
> ++ =A0 =A0 =A0neg =A0 =A0 r1
> ++ =A0 =A0 =A0neg =A0 =A0 r0
> ++ =A0 =A0 =A0st.w =A0 =A0r12[19*4], r1 =A0 /* y[19] =3D -tmp[7] */
> ++ =A0 =A0 =A0st.w =A0 =A0r12[18*4], r0 =A0 /* y[18] =3D -tmp[8] */
> ++ =A0 =A0 =A0st.d =A0 =A0r12[34*4], r0 =A0 /* y[34] =3D -tmp[7], y[35] =
=3D -tmp[8]*/
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r10, r11 =A0 =A0 =A0 =A0/* tmp[11] -=3D tmp[10]=
*/
> ++ =A0 =A0 =A0sub =A0 =A0 r9, r10 =A0 =A0 =A0 =A0 /* tmp[12] -=3D tmp[11]=
*/
> ++
> ++ =A0 =A0 =A0st.w =A0 =A0r12[0*4], lr =A0 =A0/* y[0] =3D tmp[9]*/
> ++ =A0 =A0 =A0neg =A0 =A0 lr
> ++ =A0 =A0 =A0st.w =A0 =A0r12[17*4], lr =A0 /* y[17] =3D -tmp[9]*/
> ++ =A0 =A0 =A0st.d =A0 =A0r12[1*4], r10 =A0 /* y[1] =3D tmp[10], y[2] =3D=
 tmp[11] */
> ++ =A0 =A0 =A0neg =A0 =A0 r11
> ++ =A0 =A0 =A0neg =A0 =A0 r10
> ++ =A0 =A0 =A0st.w =A0 =A0r12[16*4], r11 =A0/* y[16] =3D -tmp[10] */
> ++ =A0 =A0 =A0st.w =A0 =A0r12[15*4], r10 =A0/* y[15] =3D -tmp[11] */
> ++
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r8, r9 =A0 =A0 =A0 =A0 =A0/* tmp[13] -=3D tmp[1=
2]*/
> ++ =A0 =A0 =A0sub =A0 =A0 r7, r8 =A0 =A0 =A0 =A0 =A0/* tmp[14] -=3D tmp[1=
3]*/
> ++ =A0 =A0 =A0st.d =A0 =A0r12[3*4], r8 =A0 =A0/* y[3] =3D tmp[12], y[4] =
=3D tmp[13] */
> ++ =A0 =A0 =A0neg =A0 =A0 r9
> ++ =A0 =A0 =A0neg =A0 =A0 r8
> ++ =A0 =A0 =A0st.w =A0 =A0r12[14*4], r9 =A0 /* y[14] =3D -tmp[12] */
> ++ =A0 =A0 =A0st.w =A0 =A0r12[13*4], r8 =A0 /* y[13] =3D -tmp[13] */
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 r6, r7 =A0 =A0 =A0 =A0 =A0/* tmp[15] -=3D tmp[1=
4]*/
> ++ =A0 =A0 =A0sub =A0 =A0 r5, r6 =A0 =A0 =A0 =A0 =A0/* tmp[16] -=3D tmp[1=
5]*/
> ++ =A0 =A0 =A0sub =A0 =A0 r4, r5 =A0 =A0 =A0 =A0 =A0/* tmp[17] -=3D tmp[1=
6]*/
> ++
> ++ =A0 =A0 =A0st.d =A0 =A0r12[5*4], r6 =A0 =A0/* y[5] =3D tmp[14], y[6] =
=3D tmp[15] */
> ++ =A0 =A0 =A0neg =A0 =A0 r7
> ++ =A0 =A0 =A0neg =A0 =A0 r6
> ++ =A0 =A0 =A0st.w =A0 =A0r12[12*4], r7 =A0 /* y[12] =3D -tmp[14] */
> ++ =A0 =A0 =A0st.w =A0 =A0r12[11*4], r6 =A0 /* y[11] =3D -tmp[15] */
> ++
> ++ =A0 =A0 =A0st.d =A0 =A0r12[7*4], r4 =A0 =A0/* y[7] =3D tmp[16], y[8] =
=3D tmp[17] */
> ++ =A0 =A0 =A0neg =A0 =A0 r5
> ++ =A0 =A0 =A0neg =A0 =A0 r4
> ++ =A0 =A0 =A0st.w =A0 =A0r12[10*4], r5 =A0 /* y[10] =3D -tmp[16] */
> ++ =A0 =A0 =A0st.w =A0 =A0r12[9*4], r4 =A0 =A0/* y[9] =3D -tmp[17] */
> ++
> ++ =A0 =A0 =A0popm =A0 =A0r0-r7,r11,pc
> ++
> ++ =A0 =A0 =A0.align =A02
> ++scale_dctIV:
> ++ =A0 =A0 =A0.short =A0MAD_F(0x1ff833fa), MAD_F(0x1fb9ea93), MAD_F(0x1f3=
dd120)
> ++ =A0 =A0 =A0.short =A0MAD_F(0x1e84d969), MAD_F(0x1d906bcf), MAD_F(0x1c6=
2648b)
> ++ =A0 =A0 =A0.short =A0MAD_F(0x1afd100f), MAD_F(0x1963268b), MAD_F(0x179=
7c6a4)
> ++ =A0 =A0 =A0.short =A0MAD_F(0x159e6f5b), MAD_F(0x137af940), MAD_F(0x113=
18ef3)
> ++ =A0 =A0 =A0.short =A0MAD_F(0x0ec6a507), MAD_F(0x0c3ef153), MAD_F(0x099=
f61c5)
> ++ =A0 =A0 =A0.short =A0MAD_F(0x06ed12c5), MAD_F(0x042d4544), MAD_F(0x016=
5547c)
> ++
> ++ =A0 =A0 =A0.align =A02
> ++scale_sdctII:
> ++ =A0 =A0 =A0.short =A0MAD_F(0x1fe0d3b4), MAD_F(0x1ee8dd47), MAD_F(0x1d0=
07930)
> ++ =A0 =A0 =A0.short =A0MAD_F(0x1a367e59), MAD_F(0x16a09e66), MAD_F(0x125=
abcf8)
> ++ =A0 =A0 =A0.short =A0MAD_F(0x0d8616bc), MAD_F(0x08483ee1), MAD_F(0x02c=
9fad7)
> +diff --git a/layer3.c b/layer3.c
> +index 4e5d3fa..dffdab3 100644
> +--- a/layer3.c
> ++++ b/layer3.c
> +@@ -378,6 +378,11 @@ mad_fixed_t const ca[8] =3D {
> + =A0 -MAD_F(0x003a2847) /* -0.014198569 */, -MAD_F(0x000f27b4) /* -0.003=
699975 */
> + };
> +
> ++#ifdef FPM_AVR32
> ++# undef MAD_F
> ++# define MAD_F(x) ((x + (1 << 12)) >> 13)
> ++#endif
> ++
> + /*
> + =A0* IMDCT coefficients for short blocks
> + =A0* derived from section 2.4.3.4.10.2 of ISO/IEC 11172-3
> +@@ -386,7 +391,7 @@ mad_fixed_t const ca[8] =3D {
> + =A0* imdct_s[i /odd][k] =3D cos((PI / 24) * (2 * (6 + (i-1)/2) + 7) * (=
2 * k + 1))
> + =A0*/
> + static
> +-mad_fixed_t const imdct_s[6][6] =3D {
> ++mad_coeff_t const imdct_s[6][6] =3D {
> + # include "imdct_s.dat"
> + };
> +
> +@@ -398,7 +403,7 @@ mad_fixed_t const imdct_s[6][6] =3D {
> + =A0* window_l[i] =3D sin((PI / 36) * (i + 1/2))
> + =A0*/
> + static
> +-mad_fixed_t const window_l[36] =3D {
> ++mad_coeff_t const window_l[36] =3D {
> + =A0 MAD_F(0x00b2aa3e) /* 0.043619387 */, MAD_F(0x0216a2a2) /* 0.1305261=
92 */,
> + =A0 MAD_F(0x03768962) /* 0.216439614 */, MAD_F(0x04cfb0e2) /* 0.3007058=
00 */,
> + =A0 MAD_F(0x061f78aa) /* 0.382683432 */, MAD_F(0x07635284) /* 0.4617486=
13 */,
> +@@ -429,7 +434,7 @@ mad_fixed_t const window_l[36] =3D {
> + =A0* window_s[i] =3D sin((PI / 12) * (i + 1/2))
> + =A0*/
> + static
> +-mad_fixed_t const window_s[12] =3D {
> ++mad_coeff_t const window_s[12] =3D {
> + =A0 MAD_F(0x0216a2a2) /* 0.130526192 */, MAD_F(0x061f78aa) /* 0.3826834=
32 */,
> + =A0 MAD_F(0x09bd7ca0) /* 0.608761429 */, MAD_F(0x0cb19346) /* 0.7933533=
40 */,
> + =A0 MAD_F(0x0ec835e8) /* 0.923879533 */, MAD_F(0x0fdcf549) /* 0.9914448=
61 */,
> +@@ -438,6 +443,11 @@ mad_fixed_t const window_s[12] =3D {
> + =A0 MAD_F(0x061f78aa) /* 0.382683432 */, MAD_F(0x0216a2a2) /* 0.1305261=
92 */,
> + };
> +
> ++#ifdef FPM_AVR32
> ++# undef MAD_F
> ++# define MAD_F(x) =A0 =A0 =A0 =A0 =A0 =A0 ((mad_fixed_t) (x##L))
> ++#endif
> ++
> + /*
> + =A0* coefficients for intensity stereo processing
> + =A0* derived from section 2.4.3.4.9.3 of ISO/IEC 11172-3
> +@@ -879,6 +889,42 @@ void III_exponents(struct channel const *channel,
> + =A0* NAME: =A0 =A0 =A0III_requantize()
> + =A0* DESCRIPTION: =A0 =A0 =A0 requantize one (positive) value
> + =A0*/
> ++
> ++#if 0
> ++/*static*/
> ++mad_fixed_t III_requantize(unsigned int value, signed int exp)
> ++{
> ++ =A0register mad_fixed_t tmp2, tmp3;
> ++ =A0long long tmp_d;
> ++
> ++ =A0asm ("asr\t%0, %1, 2\n"
> ++ =A0 =A0 =A0 "ld.w\t%2, %4[%5 << 2]\n"
> ++ =A0 =A0 =A0 "sub\t%1, %1, %0 << 2\n"
> ++ =A0 =A0 =A0 "asr\t%3, %2, 7\n"
> ++ =A0 =A0 =A0 "andl\t%2, 0x7f, COH\n"
> ++ =A0 =A0 =A0 "add\t%0, %2\n"
> ++ =A0 =A0 =A0 "lsl\t%m0,%3,%0\n"
> ++ =A0 =A0 =A0 "neg\t%0\n"
> ++ =A0 =A0 =A0 "asr\t%3,%3,%0\n"
> ++ =A0 =A0 =A0 "add\t%2, %6, %1 << 2\n"
> ++ =A0 =A0 =A0 "ld.w\t%2, %2[12]\n"
> ++ =A0 =A0 =A0 "cp.w\t%0, 0\n"
> ++ =A0 =A0 =A0 "movlt\t%3, %m0\n"
> ++ =A0 =A0 =A0 "muls.d\t%0, %3, %2\n"
> ++ =A0 =A0 =A0 "cp.w\t%1, 0\n"
> ++ =A0 =A0 =A0 "breq\t0f\n"
> ++ =A0 =A0 =A0 "lsr\t%0, %0, 28\n"
> ++ =A0 =A0 =A0 "or\t%3, %0, %m0 << 4\n"
> ++ =A0 =A0 =A0 "0:\n"
> ++ =A0 =A0 =A0 : "=3D&r"(tmp_d), "+r"(exp), "=3D&r"(tmp2), "=3D&r"(tmp3)
> ++ =A0 =A0 =A0 : "r"(&rq_table), "r"(value), "r"(root_table));
> ++
> ++
> ++ =A0return tmp3;
> ++}
> ++
> ++#else
> ++
> + static
> + mad_fixed_t III_requantize(unsigned int value, signed int exp)
> + {
> +@@ -918,6 +964,7 @@ mad_fixed_t III_requantize(unsigned int value, signe=
d int exp)
> +
> + =A0 return frac ? mad_f_mul(requantized, root_table[3 + frac]) : requan=
tized;
> + }
> ++#endif
> +
> + /* we must take care that sz >=3D bits and sz < sizeof(long) lest bits =
=3D=3D 0 */
> + # define MASK(cache, sz, bits) =A0 =A0 =A0 =A0\
> +@@ -2054,27 +2101,42 @@ void imdct36(mad_fixed_t const X[18], mad_fixed_=
t x[36])
> + }
> + # =A0endif
> +
> ++
> ++#ifdef FPM_AVR32
> ++# undef =A0mad_f_mul
> ++# define mad_f_mul(x, y) __builtin_mulsatrndwh_w(x, y)
> ++#endif
> ++
> + /*
> + =A0* NAME: =A0 =A0 =A0III_imdct_l()
> + =A0* DESCRIPTION: =A0 =A0 =A0 perform IMDCT and windowing for long bloc=
ks
> + =A0*/
> + static
> +-void III_imdct_l(mad_fixed_t const X[18], mad_fixed_t z[36],
> ++void III_imdct_l(mad_fixed_t /*const*/ X[18], mad_fixed_t z[36],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int block_type)
> + {
> + =A0 unsigned int i;
> ++ =A0mad_fixed_t *z_ptr;
> ++ =A0mad_coeff_t *w_ptr;
> +
> + =A0 /* IMDCT */
> +
> ++#ifdef FPM_AVR32
> ++ =A0imdct36_avr32(X, z);
> ++#else
> + =A0 imdct36(X, z);
> ++#endif
> +
> + =A0 /* windowing */
> +
> ++ =A0z_ptr =3D &z[0];
> ++ =A0w_ptr =3D &window_l[0];
> ++
> + =A0 switch (block_type) {
> + =A0 case 0: =A0/* normal window */
> + # if defined(ASO_INTERLEAVE1)
> + =A0 =A0 {
> +- =A0 =A0 =A0register mad_fixed_t tmp1, tmp2;
> ++ =A0 =A0 =A0register mad_coeff_t tmp1, tmp2;
> +
> + =A0 =A0 =A0 tmp1 =3D window_l[0];
> + =A0 =A0 =A0 tmp2 =3D window_l[1];
> +@@ -2091,15 +2153,16 @@ void III_imdct_l(mad_fixed_t const X[18], mad_fi=
xed_t z[36],
> + =A0 =A0 }
> + # elif defined(ASO_INTERLEAVE2)
> + =A0 =A0 {
> +- =A0 =A0 =A0register mad_fixed_t tmp1, tmp2;
> ++ =A0 =A0 =A0register mad_fixed_t tmp1;
> ++ =A0 =A0 =A0register mad_coeff_t tmp2;
> +
> +- =A0 =A0 =A0tmp1 =3D z[0];
> +- =A0 =A0 =A0tmp2 =3D window_l[0];
> ++ =A0 =A0 =A0tmp1 =3D *z_ptr;
> ++ =A0 =A0 =A0tmp2 =3D *w_ptr++;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < 35; ++i) {
> +- =A0 =A0 =A0z[i] =3D mad_f_mul(tmp1, tmp2);
> +- =A0 =A0 =A0tmp1 =3D z[i + 1];
> +- =A0 =A0 =A0tmp2 =3D window_l[i + 1];
> ++ =A0 =A0 =A0*z_ptr++ =3D mad_f_mul(tmp1, tmp2);
> ++ =A0 =A0 =A0tmp1 =3D *z_ptr;
> ++ =A0 =A0 =A0tmp2 =3D *w_ptr++;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 z[35] =3D mad_f_mul(tmp1, tmp2);
> +@@ -2118,23 +2181,28 @@ void III_imdct_l(mad_fixed_t const X[18], mad_fi=
xed_t z[36],
> +
> + =A0 case 1: =A0/* start block */
> + =A0 =A0 for (i =3D =A00; i < 18; i +=3D 3) {
> +- =A0 =A0 =A0z[i + 0] =3D mad_f_mul(z[i + 0], window_l[i + 0]);
> +- =A0 =A0 =A0z[i + 1] =3D mad_f_mul(z[i + 1], window_l[i + 1]);
> +- =A0 =A0 =A0z[i + 2] =3D mad_f_mul(z[i + 2], window_l[i + 2]);
> ++ =A0 =A0 =A0*(z_ptr++) =3D mad_f_mul(*z_ptr, *w_ptr++);
> ++ =A0 =A0 =A0*(z_ptr++) =3D mad_f_mul(*z_ptr, *w_ptr++);
> ++ =A0 =A0 =A0*(z_ptr++) =3D mad_f_mul(*z_ptr, *w_ptr++);
> + =A0 =A0 }
> ++ =A0 =A0z_ptr +=3D 6;
> ++ =A0 =A0w_ptr =3D &window_s[6];
> + =A0 =A0 /* =A0(i =3D 18; i < 24; ++i) z[i] unchanged */
> +- =A0 =A0for (i =3D 24; i < 30; ++i) z[i] =3D mad_f_mul(z[i], window_s[i=
 - 18]);
> +- =A0 =A0for (i =3D 30; i < 36; ++i) z[i] =3D 0;
> ++ =A0 =A0for (i =3D 24; i < 30; ++i) *z_ptr++ =3D mad_f_mul(*z_ptr, *w_p=
tr++);
> ++ =A0 =A0for (i =3D 30; i < 36; ++i) *z_ptr++ =3D 0;
> + =A0 =A0 break;
> +
> + =A0 case 3: =A0/* stop block */
> +- =A0 =A0for (i =3D =A00; i < =A06; ++i) z[i] =3D 0;
> +- =A0 =A0for (i =3D =A06; i < 12; ++i) z[i] =3D mad_f_mul(z[i], window_s=
[i - 6]);
> ++ =A0 =A0w_ptr =3D &window_s[0];
> ++ =A0 =A0for (i =3D =A00; i < =A06; ++i) *z_ptr++ =3D 0;
> ++ =A0 =A0for (i =3D =A06; i < 12; ++i) *z_ptr++ =3D mad_f_mul(*z_ptr, *w=
_ptr++);
> + =A0 =A0 /* =A0(i =3D 12; i < 18; ++i) z[i] unchanged */
> ++ =A0 =A0w_ptr =3D &window_l[18];
> ++ =A0 =A0z_ptr +=3D 6;
> + =A0 =A0 for (i =3D 18; i < 36; i +=3D 3) {
> +- =A0 =A0 =A0z[i + 0] =3D mad_f_mul(z[i + 0], window_l[i + 0]);
> +- =A0 =A0 =A0z[i + 1] =3D mad_f_mul(z[i + 1], window_l[i + 1]);
> +- =A0 =A0 =A0z[i + 2] =3D mad_f_mul(z[i + 2], window_l[i + 2]);
> ++ =A0 =A0 =A0*z_ptr++ =3D mad_f_mul(*z_ptr, *w_ptr++ );
> ++ =A0 =A0 =A0*z_ptr++ =3D mad_f_mul(*z_ptr, *w_ptr++);
> ++ =A0 =A0 =A0*z_ptr++ =3D mad_f_mul(*z_ptr, *w_ptr++);
> + =A0 =A0 }
> + =A0 =A0 break;
> + =A0 }
> +@@ -2146,10 +2214,10 @@ void III_imdct_l(mad_fixed_t const X[18], mad_fi=
xed_t z[36],
> + =A0* DESCRIPTION: =A0 =A0 =A0 perform IMDCT and windowing for short blo=
cks
> + =A0*/
> + static
> +-void III_imdct_s(mad_fixed_t const X[18], mad_fixed_t z[36])
> ++void III_imdct_s(mad_fixed_t /*const*/ X[18], mad_fixed_t z[36])
> + {
> + =A0 mad_fixed_t y[36], *yptr;
> +- =A0mad_fixed_t const *wptr;
> ++ =A0mad_coeff_t const *wptr;
> + =A0 int w, i;
> + =A0 register mad_fixed64hi_t hi;
> + =A0 register mad_fixed64lo_t lo;
> +@@ -2159,11 +2227,56 @@ void III_imdct_s(mad_fixed_t const X[18], mad_fi=
xed_t z[36])
> + =A0 yptr =3D &y[0];
> +
> + =A0 for (w =3D 0; w < 3; ++w) {
> +- =A0 =A0register mad_fixed_t const (*s)[6];
> ++ =A0 =A0register mad_coeff_t const (*s)[6];
> +
> + =A0 =A0 s =3D imdct_s;
> +
> + =A0 =A0 for (i =3D 0; i < 3; ++i) {
> ++#ifdef FPM_AVR32
> ++ =A0 =A0 =A0register long long int acc, tmp1, tmp2, tmp3, tmp4;
> ++ =A0 =A0 =A0asm volatile ("ld.d\t%0, %5++\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%1, %6[0]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%2, %6[2*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%3, %6[4*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%4, %m1, %m0:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%4, %1, %m0:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.w\t%m0, %5++\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%4, %m2, %0:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%4, %2, %0:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%4, %m3, %m0:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%4, %3, %m0:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%0, %5++\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"rol\t%4\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"rol\t%m4\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "=3D&r"(tmp1), "=3D&r"(tmp2),=
 "=3D&r"(tmp3), "=3D&r"(tmp4),
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"=3D&r"(acc), "+r"(s)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "r"(X));
> ++
> ++ =A0 =A0 =A0asm volatile ("st.w\t%1[0], %m0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"neg\t%m0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.w\t%2[5*4], %m0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "+r"(acc)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "r"(&yptr[i]), "r"(&yptr[-i])=
);
> ++
> ++ =A0 =A0 =A0asm volatile ("mulwh.d\t%4, %m1, %m0:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%4, %1, %m0:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.w\t%m0, %5++\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%4, %m2, %0:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%4, %2, %0:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%4, %m3, %m0:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%4, %3, %m0:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"rol\t%4\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"rol\t%m4\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "+r"(tmp1), "+r"(tmp2), "+r"(=
tmp3), "+r"(tmp4),
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"=3D&r"(acc), "+r"(s)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "r"(X));
> ++
> ++ =A0 =A0 =A0asm volatile ( =A0"st.w\t%1[6*4], %m0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.w\t%2[11*4], %m0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:: "r"(acc), "r"(&yptr[i]),=
 "r"(&yptr[-i]));
> ++
> ++
> ++#else
> + =A0 =A0 =A0 MAD_F_ML0(hi, lo, X[0], (*s)[0]);
> + =A0 =A0 =A0 MAD_F_MLA(hi, lo, X[1], (*s)[1]);
> + =A0 =A0 =A0 MAD_F_MLA(hi, lo, X[2], (*s)[2]);
> +@@ -2187,6 +2300,7 @@ void III_imdct_s(mad_fixed_t const X[18], mad_fixe=
d_t z[36])
> + =A0 =A0 =A0 yptr[11 - i] =3D yptr[i + 6];
> +
> + =A0 =A0 =A0 ++s;
> ++#endif
> + =A0 =A0 }
> +
> + =A0 =A0 yptr +=3D 12;
> +@@ -2198,6 +2312,196 @@ void III_imdct_s(mad_fixed_t const X[18], mad_fi=
xed_t z[36])
> + =A0 yptr =3D &y[0];
> + =A0 wptr =3D &window_s[0];
> +
> ++#ifdef FPM_AVR32
> ++ =A0/* =A0 =A0z[0] =3D 0;
> ++ =A0 =A0 =A0 =A0z[1] =3D 0;
> ++ =A0 =A0 =A0 =A0z[2] =3D 0;
> ++ =A0 =A0 =A0 =A0z[3] =3D 0;
> ++ =A0 =A0 =A0 =A0z[4] =3D 0;
> ++ =A0 =A0 =A0 =A0z[5] =3D 0;
> ++ =A0 =A0 =A0 =A0z[30] =3D 0;
> ++ =A0 =A0 =A0 =A0z[31] =3D 0;
> ++ =A0 =A0 =A0 =A0z[32] =3D 0;
> ++ =A0 =A0 =A0 =A0z[33] =3D 0;
> ++ =A0 =A0 =A0 =A0z[34] =3D 0;
> ++ =A0 =A0 =A0 =A0z[35] =3D 0;
> ++ =A0*/
> ++ =A0{
> ++ =A0 =A0register long long int tmp, tmp2, tmp3, w0123, w4567, w891011;
> ++ =A0 =A0asm volatile ("mov\t%m0, 0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mov\t%0, %m0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%1[0], %0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%1[2*4], %0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%1[4*4], %0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%1[30*4], %0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%1[32*4], %0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%1[34*4], %0\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "=3D&r"(tmp) : "r"(z));
> ++
> ++
> ++
> ++ =A0 =A0/*
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[6] =3D mad_f_mul(yptr [0], wptr[0]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[7] =3D mad_f_mul(yptr [1], wptr[1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[8] =3D mad_f_mul(yptr [2], wptr[2]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[9] =3D mad_f_mul(yptr [3], wptr[3]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[10] =3D mad_f_mul(yptr[4], wptr[4]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[11] =3D mad_f_mul(yptr[5], wptr[5]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[24] =3D mad_f_mul(yptr [30], wptr[6]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[25] =3D mad_f_mul(yptr [31], wptr[7]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[26] =3D mad_f_mul(yptr [32], wptr[8]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[27] =3D mad_f_mul(yptr [33], wptr[9]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[28] =3D mad_f_mul(yptr[34], wptr[10]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0z[29] =3D mad_f_mul(yptr[35], wptr[11]);
> ++ =A0 =A0*/
> ++
> ++
> ++ =A0 =A0asm volatile ("ld.d\t%0, %5[0*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%3, %6[0*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%1, %5[2*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%2, %5[4*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%m3, %m3, %m0:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%3, %3, %m0:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%4, %6[2*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%7[6*4], %3\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%m4, %m4, %0:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%4, %4, %0:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%3, %6[4*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%7[8*4], %4\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%m3, %m3, %m1:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%3, %3, %m1:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%4, %6[30*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%7[10*4], %3\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%m4, %m4, %1:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%4, %4, %1:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%3, %6[32*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%7[24*4], %4\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%m3, %m3, %m2:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%3, %3, %m2:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%4, %6[34*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%7[26*4], %3\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%m4, %m4, %2:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulsatrndwh.w\t%4, %4, %2:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%7[28*4], %4\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "=3D&r"(w0123), "=3D&r"(w4567), "=
=3D&r"(w891011), "=3D&r"(tmp), "=3D&r"(tmp2)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "r"(wptr), "r"(yptr), "r"(z));
> ++ =A0 =A0/*
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[6], wptr[6]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[12], wptr[0]);
> ++ =A0 =A0 =A0 z[12] =3D MAD_F_MLZ(hi, lo);
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[7], wptr[7]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[13], wptr[1]);
> ++ =A0 =A0 =A0 z[13] =3D MAD_F_MLZ(hi, lo);
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[8], wptr[8]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[14], wptr[2]);
> ++ =A0 =A0 =A0 z[14] =3D MAD_F_MLZ(hi, lo);
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[9], wptr[9]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[15], wptr[3]);
> ++ =A0 =A0 =A0 z[15] =3D MAD_F_MLZ(hi, lo);
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[10], wptr[10]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[16], wptr[4]);
> ++ =A0 =A0 =A0 z[16] =3D MAD_F_MLZ(hi, lo);
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[11], wptr[11]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[17], wptr[5]);
> ++ =A0 =A0 =A0 z[17] =3D MAD_F_MLZ(hi, lo);
> ++
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[18], wptr[6]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[24], wptr[0]);
> ++ =A0 =A0 =A0 z[18] =3D MAD_F_MLZ(hi, lo);
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[19], wptr[7]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[25], wptr[1]);
> ++ =A0 =A0 =A0 z[19] =3D MAD_F_MLZ(hi, lo);
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[20], wptr[8]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[26], wptr[2]);
> ++ =A0 =A0 =A0 z[20] =3D MAD_F_MLZ(hi, lo);
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[21], wptr[9]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[27], wptr[3]);
> ++ =A0 =A0 =A0 z[21] =3D MAD_F_MLZ(hi, lo);
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[22], wptr[10]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[28], wptr[4]);
> ++ =A0 =A0 =A0 z[22] =3D MAD_F_MLZ(hi, lo);
> ++ =A0 =A0 =A0 MAD_F_ML0(hi, lo, yptr[23], wptr[11]);
> ++ =A0 =A0 =A0 MAD_F_MLA(hi, lo, yptr[29], wptr[5]);
> ++ =A0 =A0 =A0 z[23] =3D MAD_F_MLZ(hi, lo);*/
> ++
> ++
> ++ =A0 =A0asm volatile ("ld.d\t%0, %3[6*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%1, %3[12*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%2, %m0, %5:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%2, %m1, %m4:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%0, %0, %5:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%0, %1, %m4:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%m2, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%2, %m0, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%6[12*4], %2\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%0, %3[18*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%1, %3[24*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%2, %m0, %5:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%2, %m1, %m4:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%0, %0, %5:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%0, %1, %m4:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%m2, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%2, %m0, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%6[18*4], %2\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "=3D&r"(tmp), "=3D&r"(tmp2), "=3D=
&r"(tmp3)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "r"(yptr), "r"(w0123), "r"(w4567)=
, "r"(z));
> ++
> ++ =A0 =A0asm volatile ("ld.d\t%0, %3[8*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%1, %3[14*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%2, %m0, %m5:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%2, %m1, %4:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%0, %0, %m5:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%0, %1, %4:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%m2, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%2, %m0, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%6[14*4], %2\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%0, %3[20*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%1, %3[26*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%2, %m0, %m5:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%2, %m1, %4:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%0, %0, %m5:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%0, %1, %4:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%m2, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%2, %m0, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%6[20*4], %2\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "=3D&r"(tmp), "=3D&r"(tmp2), "=3D=
&r"(tmp3)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "r"(yptr), "r"(w0123), "r"(w89101=
1), "r"(z));
> ++
> ++ =A0 =A0asm volatile ("ld.d\t%0, %3[10*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%1, %3[16*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%2, %m0, %5:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%2, %m1, %m4:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%0, %0, %5:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%0, %1, %m4:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%m2, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%2, %m0, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%6[16*4], %2\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%0, %3[22*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ld.d\t%1, %3[28*4]\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%2, %m0, %5:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%2, %m1, %m4:t\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"mulwh.d\t%0, %0, %5:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"macwh.d\t%0, %1, %m4:b\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%m2, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"lsl\t%2, %m0, 1\n"
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"st.d\t%6[22*4], %2\n"
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "=3D&r"(tmp), "=3D&r"(tmp2), "=3D=
&r"(tmp3)
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0: "r"(yptr), "r"(w4567), "r"(w89101=
1), "r"(z));
> ++
> ++ =A0}
> ++#else
> + =A0 for (i =3D 0; i < 6; ++i) {
> + =A0 =A0 z[i + =A00] =3D 0;
> + =A0 =A0 z[i + =A06] =3D mad_f_mul(yptr[ 0 + 0], wptr[0]);
> +@@ -2218,8 +2522,15 @@ void III_imdct_s(mad_fixed_t const X[18], mad_fix=
ed_t z[36])
> + =A0 =A0 ++yptr;
> + =A0 =A0 ++wptr;
> + =A0 }
> ++#endif
> + }
> +
> ++#ifdef FPM_AVR32
> ++# undef =A0mad_f_mul
> ++# define mad_f_mul(x, y) ((((x) + (1L << 11)) >> 12) * =A0\
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((y) + (1=
L << 15)) >> 16))
> ++#endif
> ++
> + /*
> + =A0* NAME: =A0 =A0 =A0III_overlap()
> + =A0* DESCRIPTION: =A0 =A0 =A0 perform overlap-add of windowed IMDCT out=
puts
> +diff --git a/synth.c b/synth.c
> +index 1d28d43..f42d49b 100644
> +--- a/synth.c
> ++++ b/synth.c
> +@@ -29,20 +29,6 @@
> + # include "frame.h"
> + # include "synth.h"
> +
> +-/*
> +- * NAME: =A0 =A0 =A0synth->init()
> +- * DESCRIPTION: =A0 =A0 =A0 initialize synth struct
> +- */
> +-void mad_synth_init(struct mad_synth *synth)
> +-{
> +- =A0mad_synth_mute(synth);
> +-
> +- =A0synth->phase =3D 0;
> +-
> +- =A0synth->pcm.samplerate =3D 0;
> +- =A0synth->pcm.channels =A0 =3D 0;
> +- =A0synth->pcm.length =A0 =A0 =3D 0;
> +-}
> +
> + /*
> + =A0* NAME: =A0 =A0 =A0synth->mute()
> +@@ -88,6 +74,10 @@ void mad_synth_mute(struct mad_synth *synth)
> +
> + /* FPM_DEFAULT without OPT_SSO will actually lose accuracy and performa=
nce */
> +
> ++# if defined(FPM_AVR32)
> ++# =A0define OPT_SSO
> ++# endif
> ++
> + # if defined(FPM_DEFAULT) && !defined(OPT_SSO)
> + # =A0define OPT_SSO
> + # endif
> +@@ -522,9 +512,15 @@ void dct32(mad_fixed_t const in[32], unsigned int s=
lot,
> + # =A0endif
> + # =A0define ML0(hi, lo, x, y) =A0 ((lo) =A0=3D (x) * (y))
> + # =A0define MLA(hi, lo, x, y) =A0 ((lo) +=3D (x) * (y))
> +-# =A0define MLN(hi, lo) =A0 =A0 =A0 =A0 ((lo) =A0=3D -(lo))
> +-# =A0define MLZ(hi, lo) =A0 =A0 =A0 =A0 ((void) (hi), (mad_fixed_t) (lo=
))
> +-# =A0define SHIFT(x) =A0 =A0 =A0 =A0 =A0 =A0((x) >> 2)
> ++# =A0if defined(FPM_AVR32)
> ++# =A0 define MLN(hi, lo) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MAD_F_MLN((hi),=
 (lo))
> ++# =A0 define MLZ(hi, lo) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(hi)
> ++# =A0 define SHIFT(x) =A0 =A0 =A0 =A0 =A0 ((x) << 2)
> ++# =A0else
> ++# =A0 define MLN(hi, lo) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((lo) =A0=3D -(=
lo))
> ++# =A0 define MLZ(hi, lo) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((void) (hi), (=
mad_fixed_t) (lo))
> ++# =A0 define SHIFT(x) =A0 =A0 =A0 =A0 =A0 ((x) >> 2)
> ++# =A0endif
> + # =A0define PRESHIFT(x) =A0 =A0 =A0 =A0 ((MAD_F(x) + (1L << 13)) >> 14)
> + # else
> + # =A0define ML0(hi, lo, x, y) =A0 MAD_F_ML0((hi), (lo), (x), (y))
> +@@ -541,11 +537,54 @@ void dct32(mad_fixed_t const in[32], unsigned int =
slot,
> + # =A0endif
> + # endif
> +
> ++/*
> ++ * NAME: =A0 =A0 =A0synth->init()
> ++ * DESCRIPTION: =A0 =A0 =A0 initialize synth struct
> ++ */
> ++
> ++#ifdef FPM_AVR32
> ++short Dmod[17][33];
> ++#endif
> ++
> + static
> ++#ifdef FPM_AVR32
> ++short const D[17][32] =3D {
> ++#else
> + mad_fixed_t const D[17][32] =3D {
> ++#endif
> + # include "D.dat"
> + };
> +
> ++void mad_synth_init(struct mad_synth *synth)
> ++{
> ++
> ++ =A0mad_synth_mute(synth);
> ++
> ++ =A0synth->phase =3D 0;
> ++
> ++ =A0synth->pcm.samplerate =3D 0;
> ++ =A0synth->pcm.channels =A0 =3D 0;
> ++ =A0synth->pcm.length =A0 =A0 =3D 0;
> ++
> ++#ifdef FPM_AVR32
> ++ =A0{
> ++ =A0 =A0int i, j;
> ++ =A0 =A0for ( i =3D 0; i < 17; i++ ){
> ++ =A0 =A0 =A0for ( j =3D 0; j < 32; j++ ){
> ++ =A0 =A0 =A0 =A0if ( j & 1 ){
> ++ =A0 =A0 =A0 =A0 =A0Dmod[i][17 + (j >> 1)]=3D D[i][j];
> ++ =A0 =A0 =A0 =A0} else {
> ++ =A0 =A0 =A0 =A0 =A0Dmod[i][(j >> 1)]=3D D[i][j];
> ++ =A0 =A0 =A0 =A0}
> ++ =A0 =A0 =A0}
> ++
> ++ =A0 =A0 =A0Dmod[i][16]=3D Dmod[i][16+8];
> ++ =A0 =A0}
> ++ =A0}
> ++#endif
> ++
> ++}
> ++
> + # if defined(ASO_SYNTH)
> + void synth_full(struct mad_synth *, struct mad_frame const *,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int, unsigned int);
> +@@ -560,9 +599,13 @@ void synth_full(struct mad_synth *synth, struct mad=
_frame const *frame,
> + {
> + =A0 unsigned int phase, ch, s, sb, pe, po;
> + =A0 mad_fixed_t *pcm1, *pcm2, (*filter)[2][2][16][8];
> +- =A0mad_fixed_t const (*sbsample)[36][32];
> ++ =A0mad_fixed_t /*const*/ (*sbsample)[36][32];
> + =A0 register mad_fixed_t (*fe)[8], (*fx)[8], (*fo)[8];
> ++#ifdef FPM_AVR32
> ++ =A0register short const (*Dptr)[32], *ptr;
> ++#else
> + =A0 register mad_fixed_t const (*Dptr)[32], *ptr;
> ++#endif
> + =A0 register mad_fixed64hi_t hi;
> + =A0 register mad_fixed64lo_t lo;
> +
> +@@ -573,6 +616,20 @@ void synth_full(struct mad_synth *synth, struct mad=
_frame const *frame,
> + =A0 =A0 pcm1 =A0 =A0 =3D synth->pcm.samples[ch];
> +
> + =A0 =A0 for (s =3D 0; s < ns; ++s) {
> ++# =A0ifdef FPM_AVR32
> ++/*
> ++ =A0int i;
> ++ =A0for ( i =3D 0; i < 32; i++ ){
> ++ =A0(*sbsample)[s][i] =3D ((*sbsample)[s][i] + (1 << 13)) & 0xFFFFC000;
> ++ =A0}
> ++*/
> ++ =A0 =A0 =A0dct32_avr32((*sbsample)[s], phase >> 1,
> ++ =A0 =A0 =A0 =A0 =A0(*filter)[0][phase & 1], (*filter)[1][phase & 1]);
> ++ =A0 =A0 =A0/* =A0 =A0 =A0printf("dct32: %d\n", GET_CYCLES);*/
> ++ =A0 =A0 =A0pcm1 =3D synth_avr32(phase, (mad_fixed_t *)filter, \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pcm1, (short *)&Dmod[0=
]);
> ++ =A0 =A0 =A0/* =A0 =A0 =A0printf("synth_window: %d\n", GET_CYCLES);*/
> ++# =A0else
> + =A0 =A0 =A0 dct32((*sbsample)[s], phase >> 1,
> + =A0 =A0 =A0 =A0 =A0 (*filter)[0][phase & 1], (*filter)[1][phase & 1]);
> +
> +@@ -679,6 +736,7 @@ void synth_full(struct mad_synth *synth, struct mad_=
frame const *frame,
> + =A0 =A0 =A0 MLA(hi, lo, (*fo)[7], ptr[ 2]);
> +
> + =A0 =A0 =A0 *pcm1 =3D SHIFT(-MLZ(hi, lo));
> ++# =A0endif
> + =A0 =A0 =A0 pcm1 +=3D 16;
> +
> + =A0 =A0 =A0 phase =3D (phase + 1) % 16;
> +diff --git a/synth_avr32.S b/synth_avr32.S
> +new file mode 100644
> +index 0000000..701077b
> +--- /dev/null
> ++++ b/synth_avr32.S
> +@@ -0,0 +1,394 @@
> ++/*
> ++ =A0 Optimized function for speeding up synthesis filter
> ++ =A0 in MPEG Audio Decoding.
> ++ =A0 Copyright 2003-2006 Atmel Corporation.
> ++
> ++ =A0 Written by Ronny Pedersen and Lars Even Alm=E5s, Atmel Norway
> ++
> ++ =A0 This program is free software; you can redistribute it and/or modi=
fy
> ++ =A0 it under the terms of the GNU General Public License as published =
by
> ++ =A0 the Free Software Foundation; either version 2 of the License, or
> ++ =A0 (at your option) any later version.
> ++
> ++ =A0 This program is distributed in the hope that it will be useful,
> ++ =A0 but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ =A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> ++ =A0 GNU General Public License for more details.
> ++
> ++ =A0 You should have received a copy of the GNU General Public License
> ++ =A0 along with this program; if not, write to the Free Software
> ++ =A0 Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-13=
07, USA. */
> ++
> ++
> ++/* *****************
> ++ =A0 Defining macros
> ++ =A0 ***************** */
> ++
> ++ =A0 =A0 =A0.macro =A0window_1 =A0 =A0 =A0 =A0f, ptr, acc, ptr_offset, =
mul, tmp1_lo, tmp1_hi, tmp2_lo, tmp2_hi, tmp3_lo, tmp3_hi
> ++ =A0 =A0 =A0ld.d =A0 =A0 =A0 =A0 =A0 =A0\tmp1_lo, \f[0*4] =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* tmp1 =3D { f[0], f[1] } */
> ++ =A0 =A0 =A0ld.w =A0 =A0 =A0 =A0 =A0 =A0\tmp2_lo, \ptr[0*2+\ptr_offset*=
2] =A0 =A0 =A0 /* tmp2_lo =3D { ptr[0], ptr[1] }*/
> ++ =A0 =A0 =A0ld.d =A0 =A0 =A0 =A0 =A0 =A0\tmp3_lo, \f[6*4] =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* tmp3 =3D { f[6], f[7] } */
> ++ =A0 =A0 =A0ld.w =A0 =A0 =A0 =A0 =A0 =A0\tmp2_hi, \ptr[6*2+\ptr_offset*=
2] =A0 =A0 =A0 /* tmp2_hi =3D { ptr[6], ptr[7] }*/
> ++ =A0 =A0 =A0.if \mul
> ++ =A0 =A0 =A0mulwh.d =A0 =A0 =A0 =A0 \acc, \tmp1_hi, \tmp2_lo:t =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[0] * ptr[0]*/
> ++ =A0 =A0 =A0.else
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp1_hi, \tmp2_lo:t =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[0] * ptr[0]*/
> ++ =A0 =A0 =A0.endif
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp3_lo, \tmp2_lo:b =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[7] * ptr[1]*/
> ++ =A0 =A0 =A0ld.w =A0 =A0 =A0 =A0 =A0 =A0\tmp2_lo, \ptr[2*2+\ptr_offset*=
2] =A0 =A0 =A0 /* tmp2_lo =3D { ptr[2], ptr[3] }*/
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp1_lo, \tmp2_hi:b =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[1] * ptr[7]*/
> ++ =A0 =A0 =A0ld.d =A0 =A0 =A0 =A0 =A0 =A0\tmp1_lo, \f[2*4] =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* tmp1 =3D { f[2], f[3] } */
> ++
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp3_hi, \tmp2_lo:t =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[6] * ptr[2]*/
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp1_hi, \tmp2_hi:t =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[2] * ptr[6]*/
> ++ =A0 =A0 =A0ld.d =A0 =A0 =A0 =A0 =A0 =A0\tmp3_lo, \f[4*4] =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* tmp3 =3D { f[4], f[5] } */
> ++ =A0 =A0 =A0ld.w =A0 =A0 =A0 =A0 =A0 =A0\tmp2_hi, \ptr[4*2+\ptr_offset*=
2] =A0 =A0 =A0 /* tmp2_hi =3D { ptr[4], ptr[5] }*/
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp3_lo, \tmp2_lo:b =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[5] * ptr[3]*/
> ++
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp1_lo, \tmp2_hi:b =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[3] * ptr[5]*/
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp3_hi, \tmp2_hi:t =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[4] * ptr[4]*/
> ++ =A0 =A0 =A0.endm
> ++
> ++ =A0 =A0 =A0.macro =A0window_2 =A0 =A0 =A0 =A0f, ptr, acc, ptr_offset, =
mul, tmp1_lo, tmp1_hi, tmp2_lo, tmp2_hi, tmp3_lo, tmp3_hi
> ++ =A0 =A0 =A0ld.d =A0 =A0 =A0 =A0 =A0 =A0\tmp1_lo, \f[0*4] =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* tmp1 =3D { f[0], f[1] } */
> ++ =A0 =A0 =A0ld.w =A0 =A0 =A0 =A0 =A0 =A0\tmp2_lo, \ptr[7*2+\ptr_offset*=
2] =A0 =A0 =A0 /* tmp2_lo =3D { ptr[7], ptr[8] }*/
> ++ =A0 =A0 =A0ld.d =A0 =A0 =A0 =A0 =A0 =A0\tmp3_lo, \f[2*4] =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* tmp3 =3D { f[2], f[3] } */
> ++ =A0 =A0 =A0ld.w =A0 =A0 =A0 =A0 =A0 =A0\tmp2_hi, \ptr[9*2+\ptr_offset*=
2] =A0 =A0 =A0 /* tmp2_hi =3D { ptr[9], ptr[10] }*/
> ++ =A0 =A0 =A0.if \mul
> ++ =A0 =A0 =A0mulwh.d =A0 =A0 =A0 =A0 \acc, \tmp1_hi, \tmp2_lo:t =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[0] * ptr[7]*/
> ++ =A0 =A0 =A0.else
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp1_hi, \tmp2_lo:t =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[0] * ptr[7]*/
> ++ =A0 =A0 =A0.endif
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp1_lo, \tmp2_lo:b =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[1] * ptr[8]*/
> ++
> ++ =A0 =A0 =A0ld.d =A0 =A0 =A0 =A0 =A0 =A0\tmp1_lo, \f[4*4] =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* tmp1 =3D { f[4], f[5] } */
> ++ =A0 =A0 =A0ld.w =A0 =A0 =A0 =A0 =A0 =A0\tmp2_lo, \ptr[11*2+\ptr_offset=
*2] =A0 =A0 =A0/* tmp2_lo =3D { ptr[11], ptr[12] }*/
> ++
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp3_hi, \tmp2_hi:t =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[2] * ptr[9]*/
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp3_lo, \tmp2_hi:b =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[3] * ptr[10]*/
> ++
> ++ =A0 =A0 =A0ld.d =A0 =A0 =A0 =A0 =A0 =A0\tmp3_lo, \f[6*4] =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* tmp3 =3D { f[6], f[7] } */
> ++ =A0 =A0 =A0ld.w =A0 =A0 =A0 =A0 =A0 =A0\tmp2_hi, \ptr[13*2+\ptr_offset=
*2] =A0 =A0 =A0/* tmp2_hi =3D { ptr[13], ptr[14] }*/
> ++
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp1_hi, \tmp2_lo:t =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[4] * ptr[11]*/
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp1_lo, \tmp2_lo:b =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[5] * ptr[12]*/
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp3_hi, \tmp2_hi:t =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[6] * ptr[13]*/
> ++ =A0 =A0 =A0macwh.d =A0 =A0 =A0 =A0 \acc, \tmp3_lo, \tmp2_hi:b =A0 =A0 =
=A0 =A0 =A0 =A0 =A0/* f[7] * ptr[14]*/
> ++ =A0 =A0 =A0.endm
> ++
> ++ =A0 =A0 =A0.macro =A0scale =A0 res, d_lo, d_hi
> ++ =A0 =A0 =A0lsl =A0 =A0 =A0 =A0 =A0 =A0 \d_hi, 2
> ++ =A0 =A0 =A0.endm
> ++
> ++/* **********************
> ++ =A0 Starting main function
> ++ =A0 ********************** */
> ++
> ++/* Function synth_avr32 is called from synth.c with arguments:
> ++ =A0 =A0 =A0 =A0 =A0 =A0 phase, filter, *pcm1, &D[0] =A0 =A0 =A0 =A0 =
=A0 =A0 =A0*/
> ++
> ++ =A0 =A0 =A0.global synth_avr32
> ++synth_avr32:
> ++ =A0 =A0 =A0pushm =A0 =A0 =A0 =A0 =A0 r0-r7, lr
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 sp, 8
> ++
> ++ =A0 =A0 =A0/* R12 =3D phase, R11 =3D filter, R10 =3D pcm1, r9 =3D D*/
> ++ =A0 =A0 =A0bld =A0 =A0 =A0 =A0 =A0 =A0 r12, 0
> ++ =A0 =A0 =A0brcc =A0 =A0 =A0 =A0 =A0 =A0synth_even
> ++
> ++ =A0 =A0 =A0/* Filter for odd phases */
> ++
> ++ =A0 =A0 =A0/* =A0 =A0 =A0fe =3D &(*filter)[0][1][0];
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0fx =3D &(*filter)[0][0][0];
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0fo =3D &(*filter)[1][0][0]; */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 lr /*fe*/, r11, -16*8*4
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r8 /*fo*/, r11, -16*8*4*2
> ++
> ++ =A0 =A0 =A0/* =A0 =A0 =A0pe =3D phase >> 1; */
> ++ =A0 =A0 =A0lsr =A0 =A0 =A0 =A0 =A0 =A0 r12, 1
> ++ =A0 =A0 =A0stdsp =A0 =A0 =A0 =A0 =A0 sp[4], r12
> ++ =A0 =A0 =A0/* =A0 =A0 =A0ptr =3D (short const *)Dmod + pe; */
> ++ =A0 =A0 =A0add =A0 =A0 =A0 =A0 =A0 =A0 r12, r9, r12 << 1
> ++
> ++ =A0 =A0 =A0/* =A0 =A0 =A0ML0(hi, lo, (*fx)[0], ptr[0 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[1], ptr[7 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[2], ptr[6 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[3], ptr[5 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[4], ptr[4 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[5], ptr[3 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[6], ptr[2 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[7], ptr[1 + 17]); */
> ++ =A0 =A0 =A0window_1 =A0 =A0 =A0 =A0r11/*fx*/,r12/*ptr*/,r0/*acc*/,17/*=
off*/,1/*mul*/,r2,r3,r4,r5,r6,r7
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLN(hi, lo); */
> ++ =A0 =A0 =A0neg =A0 =A0 =A0 =A0 =A0 =A0 r0
> ++ =A0 =A0 =A0acr =A0 =A0 =A0 =A0 =A0 =A0 r1
> ++ =A0 =A0 =A0neg =A0 =A0 =A0 =A0 =A0 =A0 r1
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[0], ptr[0])=
;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[1], ptr[7]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[2], ptr[6]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[3], ptr[5]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[4], ptr[4]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[5], ptr[3]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[6], ptr[2]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[7], ptr[1]); */
> ++ =A0 =A0 =A0window_1 =A0 =A0 =A0 =A0lr/*fe*/,r12/*ptr*/,r0/*acc*/,0/*of=
f*/,0/*mac*/,r2,r3,r4,r5,r6,r7
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*pcm1++ =3D SHIFT(MLZ(hi, lo)=
);
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0pcm2 =3D pcm1 + 31; */
> ++ =A0 =A0 =A0scale =A0 =A0 =A0 =A0 =A0 r1, r0, r1
> ++ =A0 =A0 =A0st.w =A0 =A0 =A0 =A0 =A0 =A0r10/*pcm_1*/++, r1
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r11/*pcm2*/, r10, -4*31
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (sb =3D 1; sb < 16; ++sb)=
 { */
> ++ =A0 =A0 =A0mov =A0 =A0 =A0 =A0 =A0 =A0 r2, 15
> ++ =A0 =A0 =A0stdsp =A0 =A0 =A0 =A0 =A0 sp[0], r2
> ++odd_loop:
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0++fe;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ptr +=3D 33; */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 lr /*fe*/, -8*4
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r12, -33*2
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ML0(hi, lo, (*fo)[0], ptr[0 +=
 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[1], ptr[7 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[2], ptr[6 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[3], ptr[5 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[4], ptr[4 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[5], ptr[3 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[6], ptr[2 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[7], ptr[1 + 17]); */
> ++ =A0 =A0 =A0window_1 =A0 =A0 =A0 =A0r8/*fo*/,r12/*ptr*/,r0/*acc*/,17/*o=
ff*/,1/*mul*/,r2,r3,r4,r5,r6,r7
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLN(hi, lo); */
> ++
> ++ =A0 =A0 =A0neg =A0 =A0 =A0 =A0 =A0 =A0 r0
> ++ =A0 =A0 =A0acr =A0 =A0 =A0 =A0 =A0 =A0 r1
> ++ =A0 =A0 =A0neg =A0 =A0 =A0 =A0 =A0 =A0 r1
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[7], ptr[1])=
;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[6], ptr[2]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[5], ptr[3]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[4], ptr[4]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[3], ptr[5]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[2], ptr[6]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[1], ptr[7]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[0], ptr[0]); */
> ++ =A0 =A0 =A0window_1 =A0 =A0 =A0 =A0lr/*fe*/,r12/*ptr*/,r0/*acc*/,0/*of=
f*/,0/*mac*/,r2,r3,r4,r5,r6,r7
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0ptr -=3D 2*pe; */
> ++ =A0 =A0 =A0lddsp =A0 =A0 =A0 =A0 =A0 r2, sp[4]
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*pcm1++ =3D SHIFT(MLZ(hi, lo)=
); */
> ++
> ++ =A0 =A0 =A0scale =A0 =A0 =A0 =A0 =A0 r1, r0, r1
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r12/*ptr*/, r12, r2/*pe*/<< 2
> ++ =A0 =A0 =A0st.w =A0 =A0 =A0 =A0 =A0 =A0r10/*pcm_1*/++, r1
> ++
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ML0(hi, lo, (*fe)[0], ptr[7 =
=A0+ 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[1], ptr[8 =A0+ 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[2], ptr[9 =A0+ 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[3], ptr[10 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[4], ptr[11 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[5], ptr[12 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[6], ptr[13 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[7], ptr[14 + 17]); */
> ++ =A0 =A0 =A0window_2 =A0 =A0 =A0 =A0lr/*fe*/,r12/*ptr*/,r0/*acc*/,17/*o=
ff*/,1/*mul*/,r2,r3,r4,r5,r6,r7
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[7], ptr[14]=
);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[6], ptr[13]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[5], ptr[12]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[4], ptr[11]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[3], ptr[10]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[2], ptr[9]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[1], ptr[8]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[0], ptr[7]); */
> ++ =A0 =A0 =A0window_2 =A0 =A0 =A0 =A0r8/*fo*/,r12/*ptr*/,r0/*acc*/,0/*of=
f*/,0/*mac*/,r2,r3,r4,r5,r6,r7
> ++
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*pcm2-- =3D SHIFT(MLZ(hi, lo)=
); */
> ++ =A0 =A0 =A0lddsp =A0 =A0 =A0 =A0 =A0 r3, sp[4]
> ++ =A0 =A0 =A0lddsp =A0 =A0 =A0 =A0 =A0 r2, sp[0]
> ++ =A0 =A0 =A0scale =A0 =A0 =A0 =A0 =A0 r1, r0, r1
> ++ =A0 =A0 =A0st.w =A0 =A0 =A0 =A0 =A0 =A0--r11/*pcm_2*/, r1
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ptr +=3D 2*pe; */
> ++ =A0 =A0 =A0add =A0 =A0 =A0 =A0 =A0 =A0 r12/*ptr*/, r12, r3/*pe*/<< 2
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0++fo;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0} */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r8/*fo*/, -8*4
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r2, 1
> ++ =A0 =A0 =A0stdsp =A0 =A0 =A0 =A0 =A0 sp[0], r2
> ++ =A0 =A0 =A0brne =A0 =A0 =A0 =A0 =A0 =A0odd_loop
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ptr +=3D 33; */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r12/*ptr*/, -33*2
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ML0(hi, lo, (*fo)[0], ptr[0 +=
 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[1], ptr[7 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[2], ptr[6 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[3], ptr[5 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[4], ptr[4 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[5], ptr[3 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[6], ptr[2 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[7], ptr[1 + 17]); */
> ++ =A0 =A0 =A0window_1 =A0 =A0 =A0 =A0r8/*fo*/,r12/*ptr*/,r0/*acc*/,17/*o=
ff*/,1/*mul*/,r2,r3,r4,r5,r6,r7
> ++
> ++ =A0 =A0 =A0rjmp =A0 =A0 =A0 =A0 =A0 =A0synth_end
> ++synth_even:
> ++ =A0 =A0 =A0/* Filter for even phases */
> ++
> ++ =A0 =A0 =A0/* =A0 =A0 =A0fe =3D &(*filter)[0][0][0];
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0fx =3D &(*filter)[0][1][0];
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0fo =3D &(*filter)[1][1][0]; */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 lr /*fx*/, r11, -16*8*4
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r8 /*fo*/, r11, -(16*8*4*2 + 16=
*8*4)
> ++
> ++ =A0 =A0 =A0/* =A0 =A0 =A0po =3D ((phase - 1) & 0xF) >> 1; */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r12, 1
> ++ =A0 =A0 =A0andl =A0 =A0 =A0 =A0 =A0 =A0r12, 0xe, COH
> ++ =A0 =A0 =A0stdsp =A0 =A0 =A0 =A0 =A0 sp[4], r12
> ++ =A0 =A0 =A0/* =A0 =A0 =A0ptr =3D (short const *)Dmod + po; */
> ++ =A0 =A0 =A0add =A0 =A0 =A0 =A0 =A0 =A0 r12, r9, r12
> ++
> ++ =A0 =A0 =A0/* =A0 =A0 =A0ML0(hi, lo, (*fx)[0], ptr[0 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[1], ptr[7 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[2], ptr[6 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[3], ptr[5 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[4], ptr[4 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[5], ptr[3 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[6], ptr[2 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fx)[7], ptr[1 + 17]); */
> ++ =A0 =A0 =A0window_1 =A0 =A0 =A0 =A0lr/*fx*/,r12/*ptr*/,r0/*acc*/,17/*o=
ff*/,1/*mul*/,r2,r3,r4,r5,r6,r7
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLN(hi, lo); */
> ++ =A0 =A0 =A0neg =A0 =A0 =A0 =A0 =A0 =A0 r0
> ++ =A0 =A0 =A0acr =A0 =A0 =A0 =A0 =A0 =A0 r1
> ++ =A0 =A0 =A0neg =A0 =A0 =A0 =A0 =A0 =A0 r1
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[0], ptr[0 +=
 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[1], ptr[7 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[2], ptr[6 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[3], ptr[5 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[4], ptr[4 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[5], ptr[3 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[6], ptr[2 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[7], ptr[1 + 1]); */
> ++ =A0 =A0 =A0window_1 =A0 =A0 =A0 =A0r11/*fe*/,r12/*ptr*/,r0/*acc*/,1/*o=
ff*/,0/*mac*/,r2,r3,r4,r5,r6,r7
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*pcm1++ =3D SHIFT(MLZ(hi, lo)=
);
> ++
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0pcm2 =3D pcm1 + 31; */
> ++ =A0 =A0 =A0scale =A0 =A0 =A0 =A0 =A0 r1, r0, r1
> ++ =A0 =A0 =A0st.w =A0 =A0 =A0 =A0 =A0 =A0r10/*pcm_1*/++, r1
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 lr/*pcm2*/, r10, -4*31
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (sb =3D 1; sb < 16; ++sb)=
 { */
> ++ =A0 =A0 =A0mov =A0 =A0 =A0 =A0 =A0 =A0 r2, 15
> ++ =A0 =A0 =A0stdsp =A0 =A0 =A0 =A0 =A0 sp[0], r2
> ++even_loop:
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0++fe;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0ptr +=3D 33; */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r11 /*fe*/, -8*4
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r12, -33*2
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ML0(hi, lo, (*fo)[0], ptr[0 +=
 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[1], ptr[7 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[2], ptr[6 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[3], ptr[5 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[4], ptr[4 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[5], ptr[3 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[6], ptr[2 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[7], ptr[1 + 17]); */
> ++ =A0 =A0 =A0window_1 =A0 =A0 =A0 =A0r8/*fo*/,r12/*ptr*/,r0/*acc*/,17/*o=
ff*/,1/*mul*/,r2,r3,r4,r5,r6,r7
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLN(hi, lo); */
> ++ =A0 =A0 =A0neg =A0 =A0 =A0 =A0 =A0 =A0 r0
> ++ =A0 =A0 =A0acr =A0 =A0 =A0 =A0 =A0 =A0 r1
> ++ =A0 =A0 =A0neg =A0 =A0 =A0 =A0 =A0 =A0 r1
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[7], ptr[1 +=
 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[6], ptr[2 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[5], ptr[3 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[4], ptr[4 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[3], ptr[5 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[2], ptr[6 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[1], ptr[7 + 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[0], ptr[0 + 1]); */
> ++ =A0 =A0 =A0window_1 =A0 =A0 =A0 =A0r11/*fe*/,r12/*ptr*/,r0/*acc*/,1/*o=
ff*/,0/*mac*/,r2,r3,r4,r5,r6,r7
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*pcm1++ =3D SHIFT(MLZ(hi, lo)=
); */
> ++ =A0 =A0 =A0lddsp =A0 =A0 =A0 =A0 =A0 r2, sp[4]
> ++ =A0 =A0 =A0scale =A0 =A0 =A0 =A0 =A0 r1, r0, r1
> ++ =A0 =A0/* =A0 =A0 =A0 =A0ptr -=3D 2*po; */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r12/*ptr*/, r12, r2/*po*/<< 1
> ++ =A0 =A0 =A0st.w =A0 =A0 =A0 =A0 =A0 =A0r10/*pcm_1*/++, r1
> ++
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ML0(hi, lo, (*fe)[0], ptr[7 =
=A0+ 17 - 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[1], ptr[8 =A0+ 17 - 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[2], ptr[9 =A0+ 17 - 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[3], ptr[10 + 17 - 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[4], ptr[11 + 17 - 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[5], ptr[12 + 17 - 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[6], ptr[13 + 17 - 1]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fe)[7], ptr[14 + 17 - 1]); */
> ++ =A0 =A0 =A0window_2 =A0 =A0 =A0 =A0r11/*fe*/,r12/*ptr*/,r0/*acc*/,16/*=
off*/,1/*mul*/,r2,r3,r4,r5,r6,r7
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[7], ptr[14]=
);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[6], ptr[13]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[5], ptr[12]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[4], ptr[11]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[3], ptr[10]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[2], ptr[9]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[1], ptr[8]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[0], ptr[7]); */
> ++ =A0 =A0 =A0window_2 =A0 =A0 =A0 =A0r8/*fo*/,r12/*ptr*/,r0/*acc*/,0/*of=
f*/,0/*mac*/,r2,r3,r4,r5,r6,r7
> ++
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*pcm2-- =3D SHIFT(MLZ(hi, lo)=
); */
> ++ =A0 =A0 =A0lddsp =A0 =A0 =A0 =A0 =A0 r3, sp[4]
> ++ =A0 =A0 =A0lddsp =A0 =A0 =A0 =A0 =A0 r2, sp[0]
> ++ =A0 =A0 =A0scale =A0 =A0 =A0 =A0 =A0 r1, r0, r1
> ++ =A0 =A0 =A0st.w =A0 =A0 =A0 =A0 =A0 =A0--lr/*pcm_2*/, r1
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ptr +=3D 2*po; */
> ++ =A0 =A0 =A0add =A0 =A0 =A0 =A0 =A0 =A0 r12/*ptr*/, r12, r3/*po*/<< 1
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0++fo;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0} */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r8/*fo*/, -8*4
> ++
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r2, 1
> ++ =A0 =A0 =A0stdsp =A0 =A0 =A0 =A0 =A0 sp[0], r2
> ++ =A0 =A0 =A0brne =A0 =A0 =A0 =A0 =A0 =A0even_loop
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ptr +=3D 33; */
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 r12/*ptr*/, -33*2
> ++
> ++ =A0 =A0/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ML0(hi, lo, (*fo)[0], ptr[0 +=
 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[1], ptr[7 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[2], ptr[6 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[3], ptr[5 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[4], ptr[4 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[5], ptr[3 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[6], ptr[2 + 17]);
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0MLA(hi, lo, (*fo)[7], ptr[1 + 17]); */
> ++ =A0 =A0 =A0window_1 =A0 =A0 =A0 =A0r8/*fo*/,r12/*ptr*/,r0/*acc*/,17/*o=
ff*/,1/*mul*/,r2,r3,r4,r5,r6,r7
> ++
> ++
> ++
> ++synth_end:
> ++ =A0 /* =A0 =A0 =A0 =A0 *pcm1 =3D SHIFT(-MLZ(hi, lo)); */
> ++ =A0 =A0 =A0scale =A0 =A0 =A0 =A0 =A0 r1, r0, r1
> ++ =A0 =A0 =A0neg =A0 =A0 =A0 =A0 =A0 =A0 r1
> ++ =A0 =A0 =A0st.w =A0 =A0 =A0 =A0 =A0 =A0r10/*pcm_1*/, r1
> ++
> ++ =A0 =A0 =A0mov =A0 =A0 =A0 =A0 =A0 =A0 r12, r10
> ++ =A0 =A0 =A0sub =A0 =A0 =A0 =A0 =A0 =A0 sp, -8
> ++ =A0 =A0 =A0popm =A0 =A0 =A0 =A0 =A0 =A0r0-r7, pc
> ++
> ++
> ++
> ++
> ++
> diff --git a/meta-oe/recipes-multimedia/libmad/files/mad-mips-h-constrain=
t.patch b/meta-oe/recipes-multimedia/libmad/files/mad-mips-h-constraint.pat=
ch
> new file mode 100644
> index 0000000..b65555e
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libmad/files/mad-mips-h-constraint.patch
> @@ -0,0 +1,70 @@
> +diff -ur libmad-0.15.1b-orig/fixed.h libmad-0.15.1b/fixed.h
> +--- libmad-0.15.1b-orig/fixed.h =A0 =A0 =A0 =A02004-02-17 12:32:03.00000=
0000 +1030
> ++++ libmad-0.15.1b/fixed.h =A0 =A0 2009-08-05 10:46:30.000000000 +0930
> +@@ -299,6 +299,23 @@
> +
> + # elif defined(FPM_MIPS)
> +
> ++/* Test for gcc >=3D maj.min, as per __GNUC_PREREQ in glibc */
> ++#if defined (__GNUC__) && defined (__GNUC_MINOR__)
> ++#define __GNUC_PREREQ(maj, min) \
> ++ =A0 =A0 =A0((__GNUC__ << 16) + __GNUC_MINOR__ >=3D ((maj) << 16) + (mi=
n))
> ++#else
> ++#define __GNUC_PREREQ(maj, min) =A00
> ++#endif
> ++
> ++#if __GNUC_PREREQ(4,4)
> ++ =A0typedef unsigned int u64_di_t __attribute__ ((mode (DI)));
> ++# define MAD_F_MLX(hi, lo, x, y) \
> ++ =A0 do { \
> ++ =A0 =A0 =A0u64_di_t __ll =3D (u64_di_t) (x) * (y); \
> ++ =A0 =A0 =A0hi =3D __ll >> 32; \
> ++ =A0 =A0 =A0lo =3D __ll; \
> ++ =A0 } while (0)
> ++#else
> + /*
> + =A0* This MIPS version is fast and accurate; the disposition of the lea=
st
> + =A0* significant bit depends on OPT_ACCURACY via mad_f_scale64().
> +@@ -328,6 +345,7 @@
> + =A0 =A0 =A0 =A0: "%r" ((x) >> 12), "r" ((y) >> 16))
> + # =A0define MAD_F_MLZ(hi, lo) =A0((mad_fixed_t) (lo))
> + # endif
> ++#endif /* __GNU_PREREQ(4,4) */
> +
> + # if defined(OPT_SPEED)
> + # =A0define mad_f_scale64(hi, lo) =A0\
> +diff -ur libmad-0.15.1b-orig/mad.h libmad-0.15.1b/mad.h
> +--- libmad-0.15.1b-orig/mad.h =A02004-02-17 13:25:44.000000000 +1030
> ++++ libmad-0.15.1b/mad.h =A0 =A0 =A0 2009-08-05 10:42:40.000000000 +0930
> +@@ -344,6 +344,23 @@
> +
> + # elif defined(FPM_MIPS)
> +
> ++/* Test for gcc >=3D maj.min, as per __GNUC_PREREQ in glibc */
> ++#if defined (__GNUC__) && defined (__GNUC_MINOR__)
> ++#define __GNUC_PREREQ(maj, min) \
> ++ =A0 =A0 =A0((__GNUC__ << 16) + __GNUC_MINOR__ >=3D ((maj) << 16) + (mi=
n))
> ++#else
> ++#define __GNUC_PREREQ(maj, min) =A00
> ++#endif
> ++
> ++#if __GNUC_PREREQ(4,4)
> ++ =A0typedef unsigned int u64_di_t __attribute__ ((mode (DI)));
> ++# define MAD_F_MLX(hi, lo, x, y) \
> ++ =A0 do { \
> ++ =A0 =A0 =A0u64_di_t __ll =3D (u64_di_t) (x) * (y); \
> ++ =A0 =A0 =A0hi =3D __ll >> 32; \
> ++ =A0 =A0 =A0lo =3D __ll; \
> ++ =A0 } while (0)
> ++#else
> + /*
> + =A0* This MIPS version is fast and accurate; the disposition of the lea=
st
> + =A0* significant bit depends on OPT_ACCURACY via mad_f_scale64().
> +@@ -373,6 +390,7 @@
> + =A0 =A0 =A0 =A0: "%r" ((x) >> 12), "r" ((y) >> 16))
> + # =A0define MAD_F_MLZ(hi, lo) =A0((mad_fixed_t) (lo))
> + # endif
> ++#endif /* __GNU_PREREQ(4,4) */
> +
> + # if defined(OPT_SPEED)
> + # =A0define mad_f_scale64(hi, lo) =A0\
> diff --git a/meta-oe/recipes-multimedia/libmad/files/mad.diff b/meta-oe/r=
ecipes-multimedia/libmad/files/mad.diff
> new file mode 100644
> index 0000000..851dc01
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libmad/files/mad.diff
> @@ -0,0 +1,24 @@
> +--- /tmp/configure.ac =A02008-07-11 10:19:17.000000000 +0200
> ++++ libmad-0.15.1b/configure.ac =A0 =A0 =A0 =A02008-07-11 10:20:00.31319=
8000 +0200
> +@@ -140,21 +140,14 @@
> + =A0 =A0 case "$optimize" in
> + =A0 =A0 =A0 -O|"-O "*)
> + =A0 =A0 =A0 =A0 =A0 optimize=3D"-O"
> +- =A0 =A0 =A0 =A0 =A0optimize=3D"$optimize -fforce-mem"
> +- =A0 =A0 =A0 =A0 =A0optimize=3D"$optimize -fforce-addr"
> + =A0 =A0 =A0 =A0 =A0 : #x optimize=3D"$optimize -finline-functions"
> + =A0 =A0 =A0 =A0 =A0 : #- optimize=3D"$optimize -fstrength-reduce"
> +- =A0 =A0 =A0 =A0 =A0optimize=3D"$optimize -fthread-jumps"
> +- =A0 =A0 =A0 =A0 =A0optimize=3D"$optimize -fcse-follow-jumps"
> +- =A0 =A0 =A0 =A0 =A0optimize=3D"$optimize -fcse-skip-blocks"
> + =A0 =A0 =A0 =A0 =A0 : #x optimize=3D"$optimize -frerun-cse-after-loop"
> + =A0 =A0 =A0 =A0 =A0 : #x optimize=3D"$optimize -frerun-loop-opt"
> + =A0 =A0 =A0 =A0 =A0 : #x optimize=3D"$optimize -fgcse"
> + =A0 =A0 =A0 =A0 =A0 optimize=3D"$optimize -fexpensive-optimizations"
> +- =A0 =A0 =A0 =A0 =A0optimize=3D"$optimize -fregmove"
> + =A0 =A0 =A0 =A0 =A0 : #* optimize=3D"$optimize -fdelayed-branch"
> + =A0 =A0 =A0 =A0 =A0 : #x optimize=3D"$optimize -fschedule-insns"
> +- =A0 =A0 =A0 =A0 =A0optimize=3D"$optimize -fschedule-insns2"
> + =A0 =A0 =A0 =A0 =A0 : #? optimize=3D"$optimize -ffunction-sections"
> + =A0 =A0 =A0 =A0 =A0 : #? optimize=3D"$optimize -fcaller-saves"
> + =A0 =A0 =A0 =A0 =A0 : #> optimize=3D"$optimize -funroll-loops"
> diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-o=
e/recipes-multimedia/libmad/libmad_0.15.1b.bb
> new file mode 100644
> index 0000000..35a1265
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "MPEG Audio Decoder Library"
> +SECTION =3D "libs"
> +PRIORITY =3D "optional"
> +DEPENDS =3D "libid3tag"
> +LICENSE =3D "GPLv2"
> +PR =3D "r5"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/mad/libmad-${PV}.tar.gz \
> + =A0 =A0 =A0 =A0 =A0 file://add-pkgconfig.patch \
> + =A0 =A0 =A0 =A0 =A0file://mad.diff \
> + =A0 =A0 =A0 =A0 =A0file://mad-mips-h-constraint.patch"
> +
> +S =3D "${WORKDIR}/libmad-${PV}"
> +
> +SRC_URI_append_avr32 =3D " file://libmad-0.15.1b-avr32-optimization.patc=
h"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "-enable-speed --enable-shared"
> +# The ASO's don't take any account of thumb...
> +EXTRA_OECONF_append_thumb =3D " --disable-aso --enable-fpm=3Ddefault"
> +EXTRA_OECONF_append_arm =3D " --enable-fpm=3Darm"
> +
> +do_configure_prepend () {
> +# =A0 =A0 =A0damn picky automake...
> + =A0 =A0 =A0 touch NEWS AUTHORS ChangeLog
> +}
> +
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +SRC_URI[md5sum] =3D "1be543bc30c56fb6bea1d7bf6a64e66c"
> +SRC_URI[sha256sum] =3D "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1be=
e51a76a6e0078690"
> --
> 1.7.0.4
>
>


