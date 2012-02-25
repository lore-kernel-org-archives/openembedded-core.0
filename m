Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S15HB-0006EN-H6
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 01:14:13 +0100
Received: by eaal10 with SMTP id l10so1374651eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:05:50 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.4.145 as permitted sender) client-ip=10.213.4.145; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.4.145 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.4.145])
	by 10.213.4.145 with SMTP id 17mr1338459ebr.116.1330128350693 (num_hops
	= 1); Fri, 24 Feb 2012 16:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UfcVBT+QEAr4TivswaCalGbln5UH+b/i6LG7/oDDbt8=;
	b=pMcyAblrpBEXXv4vSaXgHMMORo7EtYAQ8NuWZkZlRjlaIpakCuBEE7I7CW1FUUEozg
	itJAfMHAMCSwFbl9qqrYDBv60naQIinseNULTIKbJDavlg9RrSUkywaa0jKsqhPqZloK
	JePREWjmZ5SeZawYi/L43teDGt6SLBPYhn1RY=
Received: by 10.213.4.145 with SMTP id 17mr989454ebr.116.1330128350545;
	Fri, 24 Feb 2012 16:05:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u11sm16860703eeb.1.2012.02.24.16.05.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 16:05:48 -0800 (PST)
Date: Sat, 25 Feb 2012 01:05:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120225000546.GO3769@jama.jama.net>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
	<1329992873.32110.58.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1329992873.32110.58.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/4] gdb-cross-canadian: use NATIVESDK paths as it happens to be here
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
X-List-Received-Date: Sat, 25 Feb 2012 00:14:13 -0000
X-Groupsio-MsgNum: 17956
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U2TwCo+MHNvvM16y"
Content-Disposition: inline

--U2TwCo+MHNvvM16y
Content-Type: multipart/mixed; boundary="JH9OCe1BwbSt0K9U"
Content-Disposition: inline

--JH9OCe1BwbSt0K9U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 10:27:53AM +0000, Richard Purdie wrote:
> On Mon, 2012-02-13 at 16:40 +0100, Martin Jansa wrote:
> > * seems like config/config in -L was also wrong
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-devtools/gdb/gdb-cross-canadian.inc |   10 ++++++++--
> >  1 files changed, 8 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/re=
cipes-devtools/gdb/gdb-cross-canadian.inc
> > index b5746ce..bac63b7 100644
> > --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > @@ -10,12 +10,18 @@ RDEPENDS +=3D "python-nativesdk-core python-natives=
dk-lang python-nativesdk-re \
> > =20
> >  EXTRA_OECONF_append =3D "--with-python=3D${WORKDIR}/python"
> > =20
> > +NATIVESDK_NAME =3D "oecore-${SDK_ARCH}-${SDK_ARCH}"
> > +NATIVESDK_PATH =3D "/usr/local/${NATIVESDK_NAME}"
> > +NATIVESDK_PATHNATIVE =3D "${NATIVESDK_PATH}/sysroots/${SDK_SYS}"
> > +NATIVESDK_LIBDIR =3D "${NATIVESDK_PATHNATIVE}${libdir_nativesdk}"
> > +NATIVESDK_INCLUDEDIR =3D "${NATIVESDK_PATHNATIVE}${includedir_nativesd=
k}"
> > +
> >  do_configure_prepend() {
> >  cat > ${WORKDIR}/python << EOF
> >  #! /bin/sh
> >  case "\$2" in
> > -        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOS=
T_VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
> > -        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST=
_VENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpt=
hread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> > +        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOS=
T_VENDOR}-${HOST_OS}${NATIVESDK_INCLUDEDIR}/python${PYTHON_BASEVERSION}/" ;;
> > +        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST=
_VENDOR}-${HOST_OS}${NATIVESDK_LIBDIR}/python${PYTHON_BASEVERSION}/config -=
lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> >          --exec-prefix) echo "/usr" ;;
> >          *) exit 1 ;;
> >  esac
>=20
> I made some experiments with "bitbake gdb-cross-canadian-x86-64 -e" and
> it seems to me that:
>=20
>        --includes) echo "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}/=
" ;;
>        --ldflags) echo "-L${STAGING_LIBDIR}/../python${PYTHON_BASEVERSION=
}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
>=20
> should work ok here?

No it's not the same.

With default oe-core settings it behaves like this:

python-nativesdk is staged in the same directory for all 3 MACHINEs I
was using for test (qemuarm, qemux86, qemux86-64)

SDKMACHINE=3Di686:   SYSROOTS/i686-nativesdk-oesdk-linux/usr/local/oecore-i=
686-i686/sysroots/i686-oesdk-linux/
SDKMACHINE=3Dx86-64: SYSROOTS/x86_64-nativesdk-oesdk-linux/usr/local/oecore=
-x86_64-x86_64/sysroots/x86_64-oesdk-linux

while STAGING_INCDIR is different for each machine
SDKMACHINE=3Di686:
  STAGING_LIBDIR=3D"SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i6=
86-i586/sysroots/i686-oesdk-linux/usr/lib/i586-oe-linux"
  STAGING_LIBDIR=3D"SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i6=
86-x86_64/sysroots/i686-oesdk-linux/usr/lib/x86_64-oe-linux"
  STAGING_LIBDIR=3D"SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i6=
86-arm/sysroots/i686-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi"
SDKMACHINE=3Dx86-64:
  STAGING_LIBDIR=3D"SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-=
x86_64-i586/sysroots/x86_64-oesdk-linux/usr/lib/i586-oe-linux"
  STAGING_LIBDIR=3D"SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-=
x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux"
  STAGING_LIBDIR=3D"SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-=
x86_64-arm/sysroots/x86_64-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi"

notice that not only SDK_NAME tripple is changing
SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
so we keep it the same across all MACHINES with:
NATIVESDK_SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${SDK_ARCH}"

but also toplevel SYSROOT is different
i686-nativesdk-oesdk-linux
i686-oesdk-linux-nativesdk
and
x86_64-nativesdk-oesdk-linux
x86_64-oesdk-linux-nativesdk

So nativesdk staging is broken and python-nativesdk should be staged
separately for each SDK_ARCH/TARGET_ARCH combination or we need those
NATIVESDK_SDK_NAME variables for cross-canadian -> nativesdk deps.

Attaching complete list of combinations I've built to be sure :).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JH9OCe1BwbSt0K9U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="nativesdk.paths.txt"

SYSROOTS = /OE/oe-core/SYSROOTS
= SDKMACHINE=x86-64 ==
SDKMACHINE=x86-64 MACHINE=qemux86 bitbake python-nativesdk
                  SYSROOTS/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include/python2.7/Python.h
                  SYSROOTS/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.7/config/
SDKMACHINE=x86-64 MACHINE=qemux86 bitbake gdb-cross-canadian-i586
  STAGING_INCDIR="SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-i586/sysroots/x86_64-oesdk-linux/usr/include"
  STAGING_LIBDIR="SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-i586/sysroots/x86_64-oesdk-linux/usr/lib/i586-oe-linux"
                                     NATIVESDK_LIBDIR="/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib"
                                     NATIVESDK_INCDIR="/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include"

SDKMACHINE=x86-64 MACHINE=qemux86-64 bitbake python-nativesdk
                  SYSROOTS/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include/python2.7/Python.h
                  SYSROOTS/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.7/config/
SDKMACHINE=x86-64 MACHINE=qemux86-64 bitbake gdb-cross-canadian-x86-64
  STAGING_LIBDIR="SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux"
  STAGING_INCDIR="SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include"
                                     NATIVESDK_LIBDIR="/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib"
                                     NATIVESDK_INCDIR="/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include"

SDKMACHINE=x86-64 MACHINE=qemuarm bitbake python-nativesdk
                  SYSROOTS/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include/python2.7/Python.h
                  SYSROOTS/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.7/config/
SDKMACHINE=x86-64 MACHINE=qemuarm bitbake gdb-cross-canadian-arm
  STAGING_LIBDIR="SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi"
  STAGING_INCDIR="SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/usr/include"
                                     NATIVESDK_INCDIR="/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include"
                                     NATIVESDK_LIBDIR="/usr/local/oecore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib"

== SDKMACHINE=i686 ==
SDKMACHINE=i686 MACHINE=qemux86 bitbake python-nativesdk
                  SYSROOTS/i686-nativesdk-oesdk-linux/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/include/python2.7/Python.h
                  SYSROOTS/i686-nativesdk-oesdk-linux/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/lib/python2.7/config/
SDKMACHINE=i686 MACHINE=qemux86 bitbake gdb-cross-canadian-i586
  STAGING_LIBDIR="SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i686-i586/sysroots/i686-oesdk-linux/usr/lib/i586-oe-linux"
  STAGING_INCDIR="SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i686-i586/sysroots/i686-oesdk-linux/usr/include"
                                   NATIVESDK_LIBDIR="/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/lib"
                                   NATIVESDK_INCDIR="/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/include"

SDKMACHINE=i686 MACHINE=qemux86-64 bitbake python-nativesdk
                  SYSROOTS/i686-nativesdk-oesdk-linux/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/include/python2.7/Python.h
                  SYSROOTS/i686-nativesdk-oesdk-linux/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/lib/python2.7/config/
SDKMACHINE=i686 MACHINE=qemux86-64 bitbake gdb-cross-canadian-x86-64
  STAGING_LIBDIR="SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i686-x86_64/sysroots/i686-oesdk-linux/usr/lib/x86_64-oe-linux"
  STAGING_INCDIR="SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i686-x86_64/sysroots/i686-oesdk-linux/usr/include"
                                   NATIVESDK_LIBDIR="/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/lib"
                                   NATIVESDK_INCDIR="/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/include"

SDKMACHINE=i686 MACHINE=qemuarm bitbake python-nativesdk
                  SYSROOTS/i686-nativesdk-oesdk-linux/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/include/python2.7/Python.h
                  SYSROOTS/i686-nativesdk-oesdk-linux/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/lib/python2.7/config/
SDKMACHINE=i686 MACHINE=qemuarm bitbake gdb-cross-canadian-arm
  STAGING_LIBDIR="SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i686-arm/sysroots/i686-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi"
  STAGING_INCDIR="SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecore-i686-arm/sysroots/i686-oesdk-linux/usr/include"
                                   NATIVESDK_LIBDIR="/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/lib"
                                   NATIVESDK_INCDIR="/usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/include"

--JH9OCe1BwbSt0K9U--

--U2TwCo+MHNvvM16y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9IJdoACgkQN1Ujt2V2gByB3gCgquf42KJSZLxOUAsLubmaG13b
nUoAn1FYVv4A11iAMLWqttVJc8drG26S
=mai/
-----END PGP SIGNATURE-----

--U2TwCo+MHNvvM16y--
