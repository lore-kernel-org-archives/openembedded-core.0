Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ryj2M-0007HJ-MD
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Feb 2012 13:05:10 +0100
Received: by eekd41 with SMTP id d41so1421514eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2012 03:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.183.136 as permitted sender) client-ip=10.14.183.136; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.183.136 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.183.136])
	by 10.14.183.136 with SMTP id q8mr6730792eem.60.1329566214327 (num_hops
	= 1); Sat, 18 Feb 2012 03:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ln0zkYN3xNr36/qq9gJwNMI4A2pQLjcDqJa0gR2fejc=;
	b=SmmBZco87/VdkcP5TD/FRcsjrgTTuKgCepA5tDFUakqwXD3OhTNGoGrG988ybS6cGi
	rUoXJvYvSDj/c9DR2p6ocxFqZCb9TbtmWQdFmrj1xyqdz5nnUjvTMTcg+qSZYCb6u6Gk
	RELZbLALzVdGEscI6i2IBihVsj+IOuf7hFQfs=
Received: by 10.14.183.136 with SMTP id q8mr5441135eem.60.1329566214262;
	Sat, 18 Feb 2012 03:56:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm21286230eef.10.2012.02.18.03.56.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 18 Feb 2012 03:56:52 -0800 (PST)
Date: Sat, 18 Feb 2012 12:56:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120218115651.GA11351@jama.jama.net>
References: <1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
	<b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
	<4F3ED680.5020909@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F3ED680.5020909@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 18 Feb 2012 12:05:10 -0000
X-Groupsio-MsgNum: 17578
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2012 at 02:36:48PM -0800, Saul Wold wrote:
> On 02/13/2012 07:40 AM, Martin Jansa wrote:
> > * seems like config/config in -L was also wrong
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   meta/recipes-devtools/gdb/gdb-cross-canadian.inc |   10 ++++++++--
> >   1 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/re=
cipes-devtools/gdb/gdb-cross-canadian.inc
> > index b5746ce..bac63b7 100644
> > --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > @@ -10,12 +10,18 @@ RDEPENDS +=3D "python-nativesdk-core python-natives=
dk-lang python-nativesdk-re \
> >
> >   EXTRA_OECONF_append =3D "--with-python=3D${WORKDIR}/python"
> >
> > +NATIVESDK_NAME =3D "oecore-${SDK_ARCH}-${SDK_ARCH}"
> > +NATIVESDK_PATH =3D "/usr/local/${NATIVESDK_NAME}"

Ah, I was reusing definition from bitbake.conf:
meta/conf/bitbake.conf:SDK_NAME =3D "oecore-${SDK_ARCH}-${TARGET_ARCH}"

with only TARGET_ARCH replaced with SDK_ARCH.

Can we move "oecore" to extra varible like:

bitbake.conf:
-SDK_NAME =3D "oecore-${SDK_ARCH}-${TARGET_ARCH}"
+SDK_NAME_PREFIX =3D "oecore"
+SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"

meta-yocto/conf/distro/poky.conf:
-SDK_NAME =3D "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${TARGET_ARCH}"
+SDK_NAME_PREFIX =3D "${DISTRO}-${TCLIBC}"

SDK_PATH is worse:
meta/conf/bitbake.conf:SDKPATH =3D "/usr/local/${SDK_NAME}"
meta-yocto/conf/distro/poky.conf:SDKPATH =3D "/opt/${DISTRO}/${SDK_VERSION}"

Maybe this patch is not going in right direction, but nobody replied in
"SDK confusion Was: [oe] [meta-oe] gdb-cross-canadian: build gdb with pytho=
n support"
thread so I have sent this version which works in default (distroless)
oe-core (and also for SHR as we don't override default SDK* variables.

If this variables make sense globally, then we can move them to
bitbake.conf and pokyt.conf (and maybe Angstrom too) can overwrite them
like they do with other SDK*.

Cheers,


> Martin,
>=20
> These two lines will not work in the general case, since the NATIVESDK=20
> might be for a different distro (not oecore) or in a different directory=
=20
> such as /opt vs /usr/local.
>=20
> The Poky build fails with this patch for example.
>=20
> Sau!
>=20
> > +NATIVESDK_PATHNATIVE =3D "${NATIVESDK_PATH}/sysroots/${SDK_SYS}"
> > +NATIVESDK_LIBDIR =3D "${NATIVESDK_PATHNATIVE}${libdir_nativesdk}"
> > +NATIVESDK_INCLUDEDIR =3D "${NATIVESDK_PATHNATIVE}${includedir_nativesd=
k}"
> > +
>=20
> >   do_configure_prepend() {
> >   cat>  ${WORKDIR}/python<<  EOF
> >   #! /bin/sh
> >   case "\$2" in
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
> >           --exec-prefix) echo "/usr" ;;
> >           *) exit 1 ;;
> >   esac

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8/kgMACgkQN1Ujt2V2gBx6NgCdGNcIqq1FITKsxO8Hv3qzLAa3
TBcAn0j2d4QO3gz7xwPOi8Kh2vCgNksR
=gtkf
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
