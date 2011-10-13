Received: from mail-yx0-f173.google.com ([209.85.213.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REV9w-00070g-AI
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 01:57:56 +0200
Received: by yxk38 with SMTP id 38so226668yxk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 16:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=PVUQkp7lDa7/vnUOC7nQO5P26lo/j8aTXpkdj13v8pU=;
	b=X9QZjox41/IZAa8WrGhl2dlJ25o5Uqe62sdJYzjvHhw7DzzxVhyhxtI1Gko6QfbzMP
	6B1ZpgNDrkgJcYoBtJfBSFtGpWqUSbNs5TAvwGhKjLIktvFGq/tFCZtuR36Jz4cKs1aH
	JvPBzPKp6p/usJLr2DYzr1wyW3PuUWTr1wO14=
Received: by 10.68.32.162 with SMTP id k2mr12197122pbi.132.1318549931077; Thu,
	13 Oct 2011 16:52:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 13 Oct 2011 16:51:41 -0700 (PDT)
In-Reply-To: <57a9134211e3be47d7072ad2b1aa06b443a95927.1318496401.git.kai.kang@windriver.com>
References: <cover.1318496401.git.kai.kang@windriver.com>
	<57a9134211e3be47d7072ad2b1aa06b443a95927.1318496401.git.kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2011 16:51:41 -0700
Message-ID: <CAMKF1spV0qOs6tt4HLbZi7DJ0x43Xuv+b5a6PJq+6MkobfyayQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] mesa-dri/xlib: use target commands in mklib file
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
X-List-Received-Date: Thu, 13 Oct 2011 23:57:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 2:05 AM, Kang Kai <kai.kang@windriver.com> wrote:
> the bin/mklib file in mesa-dri/xlib source code uses commands on
> hosts, this may cause build failed on some platform.
>

you might want to say 'cross-tools' instead of 'target commands'

> Patches are from WindRiver Linux, and CQID are:
> =C2=A0 =C2=A0WIND00266791
> =C2=A0 =C2=A0WIND00266497

I dont think we need this in oe-core

>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
> =C2=A0.../mesa-use-target-commands-in-mklib.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0104 ++++++++++++++++++++
> =C2=A0meta/recipes-graphics/mesa/mesa-dri_7.11.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A03 +-
> =C2=A0meta/recipes-graphics/mesa/mesa-xlib_7.11.bb =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A03 +-
> =C2=A03 files changed, 108 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 meta/recipes-graphics/mesa/mesa-dri/mesa-use-tar=
get-commands-in-mklib.patch
>
> diff --git a/meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-commands=
-in-mklib.patch b/meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-comma=
nds-in-mklib.patch
> new file mode 100644
> index 0000000..1bc2a57
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-dri/mesa-use-target-commands-in-mkl=
ib.patch
> @@ -0,0 +1,104 @@
> +This patch is merged from WindRiver linux commits, and it is to avoid bu=
ild failed on some platform because of using the commands on host.
> +
> +And original commits are:
> +
> +commit 8d5ccc8113e1b51b0529a00c18a4aba956247e1b
> +Author: Yulong Pei <Yulong.pei@windriver.com>
> +Date: =C2=A0 Tue Apr 12 22:14:10 2011 +0800
> +
> + =C2=A0 =C2=A0fix mesa-dri build fails on x86-64
> +
> + =C2=A0 =C2=A0CQID: WIND00266791
> +
> + =C2=A0 =C2=A01. mesa-dri uses it's own script (mklib) to generate libra=
ries, and it
> + =C2=A0 =C2=A0calls the host's ar/ranlib/gcc/g++. This fixes mklib so th=
at it calls the
> + =C2=A0 =C2=A0cross-compiling tools properly.
> +
> + =C2=A0 =C2=A02. override PYTHON2 with 'python', 'python2' is not availa=
ble in host-tools python.
> + =C2=A0 =C2=A0Only 'python' and 'python2.6' are provided. So force confi=
gure to use 'python'.
> +
> + =C2=A0 =C2=A0And the above two changes are ported from mesa-xlib.
> +
> + =C2=A0 =C2=A0Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> +
> +commit 5c4212084b871a0c0fb7d174280ec9a634637deb
> +Author: Bowen <Bowen.zhu@windriver.com>
> +Date: =C2=A0 Mon Apr 11 16:25:02 2011 +0800
> +
> + =C2=A0 =C2=A0Fix freeglut build failed for mips64_octeon-glibc_std_xapp=
s
> +
> + =C2=A0 =C2=A0CQID: 266497
> +
> + =C2=A0 =C2=A0freeglut build failed on some hosts, because of mesa-xlib =
uses host ar command,
> + =C2=A0 =C2=A0in some hosts, host ar command can't recognize target libr=
ary, which will make some
> + =C2=A0 =C2=A0symbols in libGL undefined.
> +
> + =C2=A0 =C2=A0The fix is modifing mklib script in mesa-xlib, change fixe=
d "ar" command to variable
> + =C2=A0 =C2=A0$AR that set by our LDAT.
> +
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +
> +--- Mesa-7.10.2/bin/mklib.orig 2011-09-28 16:15:34.170000074 +0800
> ++++ Mesa-7.10.2/bin/mklib =C2=A0 =C2=A0 =C2=A02011-09-28 16:15:42.370000=
073 +0800
> +@@ -49,8 +49,8 @@
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=
*) ;;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=
) =C2=A0FILE=3D"$ORIG_DIR/$FILE" ;;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esac
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEMBERS=3D`ar t=
 $FILE`
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ar x $FILE
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MEMBERS=3D`${AR=
} t $FILE`
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${AR} x $FILE
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for MEMBER in $=
MEMBERS ; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 N=
EWFILES=3D"$NEWFILES $DIR/$MEMBER"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
> +@@ -77,7 +77,7 @@
> + make_ar_static_lib() {
> + =C2=A0 =C2=A0 OPTS=3D$1
> + =C2=A0 =C2=A0 shift;
> +- =C2=A0 =C2=A0RANLIB=3D$1
> ++ =C2=A0 =C2=A0USE_RANLIB=3D$1
> + =C2=A0 =C2=A0 shift;
> + =C2=A0 =C2=A0 LIBNAME=3D$1
> + =C2=A0 =C2=A0 shift;
> +@@ -87,11 +87,11 @@
> + =C2=A0 =C2=A0 rm -f ${LIBNAME}
> +
> + =C2=A0 =C2=A0 # make static lib
> +- =C2=A0 =C2=A0ar ${OPTS} ${LIBNAME} ${OBJECTS}
> ++ =C2=A0 =C2=A0${AR} ${OPTS} ${LIBNAME} ${OBJECTS}
> +
> + =C2=A0 =C2=A0 # run ranlib
> +- =C2=A0 =C2=A0if [ ${RANLIB} =3D 1 ] ; then
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0ranlib ${LIBNAME}
> ++ =C2=A0 =C2=A0if [ ${USE_RANLIB} =3D 1 ] ; then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0${RANLIB} ${LIBNAME}
> + =C2=A0 =C2=A0 fi
> +
> + =C2=A0 =C2=A0 echo ${LIBNAME}
> +@@ -313,9 +313,9 @@
> + =C2=A0 =C2=A0 =C2=A0 if [ "x$LINK" =3D "x" ] ; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # -linker was not specified so set d=
efault link command now
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $CPLUSPLUS =3D 1 ] ; the=
n
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LINK=3Dg++
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LINK=3D$CXX
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LINK=3Dgcc
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LINK=3D$CC
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 fi
> +
> +@@ -531,9 +531,9 @@
> + =C2=A0 =C2=A0 =C2=A0 if [ "x$LINK" =3D "x" ] ; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # -linker was not specified so set d=
efault link command now
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $CPLUSPLUS =3D 1 ] ; the=
n
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LINK=3Dg++
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LINK=3D${CXX}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LINK=3Dgcc
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LINK=3D${CC}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 fi
> +
> diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-g=
raphics/mesa/mesa-dri_7.11.bb
> index 6fc8d95..0f026b1 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> +++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> @@ -9,11 +9,12 @@ LIB_DEPS =3D "libdrm virtual/libx11 libxext libxxf86vm =
libxdamage libxfixes expat
> =C2=A0DEPENDS =3D "${PROTO_DEPS} =C2=A0${LIB_DEPS} makedepend-native pyth=
on-native"
> =C2=A0DEPENDS +=3D "mesa-dri-glsl-native"
>
> -PR =3D "r5"
> +PR =3D "r6"
>
> =C2=A0SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}=
.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://crossfix.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://uclibc.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mesa-use-target-commands-in-m=
klib.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
> =C2=A0SRC_URI[md5sum] =3D "ff03aca82d0560009a076a87c888cf13"
> diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-=
graphics/mesa/mesa-xlib_7.11.bb
> index ea4acc6..3301068 100644
> --- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> +++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> @@ -4,6 +4,7 @@ FILESPATH =3D. "${FILE_DIRNAME}/mesa-dri:"
>
> =C2=A0SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}=
.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://uclibc.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mesa-use-target-commands-in-m=
klib.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0SRC_URI[md5sum] =3D "ff03aca82d0560009a076a87c888cf13"
> @@ -17,7 +18,7 @@ LIB_DEPS =3D "virtual/libx11 libxext libxxf86vm libxdam=
age libxfixes libxml2-nativ
> =C2=A0DEPENDS =3D "${PROTO_DEPS} =C2=A0${LIB_DEPS} makedepend-native"
>
> =C2=A0PE =3D "1"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =C2=A0EXTRA_OECONF +=3D "--with-driver=3Dxlib --without-gallium-drivers"
>
> --
> 1.7.5.1.300.gc565c
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


