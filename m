Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1HYM-0005kK-6B
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 14:20:46 +0100
Received: by eekd41 with SMTP id d41so1544493eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 05:12:22 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.97.131 as permitted sender) client-ip=10.14.97.131; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.97.131 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.97.131])
	by 10.14.97.131 with SMTP id t3mr3906226eef.3.1330175542553 (num_hops =
	1); Sat, 25 Feb 2012 05:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PWqIobJVEiLGmOfUokk9kcd7JD+aQPnudpX1UW+OLTM=;
	b=kUia09po1Dlg8mzDQjDdtan2usM2+7t06doTAZB6gful34SEH6EtfkuoZzjmKm/GCq
	n64FAfUEvVyGra7c2gsmp5p41ObVFt0HZjLY0ya6YAN92J74F2DX275pMUph3GywyTFX
	8UKHR7wPCaxfXgULHqQ6Vm6ku2PmBw4JAoCCY=
Received: by 10.14.97.131 with SMTP id t3mr2946728eef.3.1330175542370;
	Sat, 25 Feb 2012 05:12:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm31385458eea.5.2012.02.25.05.12.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Feb 2012 05:12:21 -0800 (PST)
Date: Sat, 25 Feb 2012 14:12:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120225131218.GP3769@jama.jama.net>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
	<1329992873.32110.58.camel@ted>
	<20120225000546.GO3769@jama.jama.net>
	<1330131768.13788.6.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1330131768.13788.6.camel@ted>
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
X-List-Received-Date: Sat, 25 Feb 2012 13:20:46 -0000
X-Groupsio-MsgNum: 17964
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F4Nz7zOi0wR5AkzI"
Content-Disposition: inline

--F4Nz7zOi0wR5AkzI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2012 at 01:02:48AM +0000, Richard Purdie wrote:
> On Sat, 2012-02-25 at 01:05 +0100, Martin Jansa wrote:
> > On Thu, Feb 23, 2012 at 10:27:53AM +0000, Richard Purdie wrote:
> > > On Mon, 2012-02-13 at 16:40 +0100, Martin Jansa wrote:
> > > > * seems like config/config in -L was also wrong
> > > >=20
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  meta/recipes-devtools/gdb/gdb-cross-canadian.inc |   10 ++++++++--
> > > >  1 files changed, 8 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/met=
a/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > index b5746ce..bac63b7 100644
> > > > --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > > @@ -10,12 +10,18 @@ RDEPENDS +=3D "python-nativesdk-core python-nat=
ivesdk-lang python-nativesdk-re \
> > > > =20
> > > >  EXTRA_OECONF_append =3D "--with-python=3D${WORKDIR}/python"
> > > > =20
> > > > +NATIVESDK_NAME =3D "oecore-${SDK_ARCH}-${SDK_ARCH}"
> > > > +NATIVESDK_PATH =3D "/usr/local/${NATIVESDK_NAME}"
> > > > +NATIVESDK_PATHNATIVE =3D "${NATIVESDK_PATH}/sysroots/${SDK_SYS}"
> > > > +NATIVESDK_LIBDIR =3D "${NATIVESDK_PATHNATIVE}${libdir_nativesdk}"
> > > > +NATIVESDK_INCLUDEDIR =3D "${NATIVESDK_PATHNATIVE}${includedir_nati=
vesdk}"
> > > > +
> > > >  do_configure_prepend() {
> > > >  cat > ${WORKDIR}/python << EOF
> > > >  #! /bin/sh
> > > >  case "\$2" in
> > > > -        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk$=
{HOST_VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/=
" ;;
> > > > -        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${=
HOST_VENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config =
-lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> > > > +        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk$=
{HOST_VENDOR}-${HOST_OS}${NATIVESDK_INCLUDEDIR}/python${PYTHON_BASEVERSION}=
/" ;;
> > > > +        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${=
HOST_VENDOR}-${HOST_OS}${NATIVESDK_LIBDIR}/python${PYTHON_BASEVERSION}/conf=
ig -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> > > >          --exec-prefix) echo "/usr" ;;
> > > >          *) exit 1 ;;
> > > >  esac
> > >=20
> > > I made some experiments with "bitbake gdb-cross-canadian-x86-64 -e" a=
nd
> > > it seems to me that:
> > >=20
> > >        --includes) echo "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSI=
ON}/" ;;
> > >        --ldflags) echo "-L${STAGING_LIBDIR}/../python${PYTHON_BASEVER=
SION}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
> > >=20
> > > should work ok here?
> >=20
> > No it's not the same.
> >=20
> > With default oe-core settings it behaves like this:
> >=20
> > python-nativesdk is staged in the same directory for all 3 MACHINEs I
> > was using for test (qemuarm, qemux86, qemux86-64)
> >=20
> > SDKMACHINE=3Di686:   SYSROOTS/i686-nativesdk-oesdk-linux/usr/local/oeco=
re-i686-i686/sysroots/i686-oesdk-linux/
> > SDKMACHINE=3Dx86-64: SYSROOTS/x86_64-nativesdk-oesdk-linux/usr/local/oe=
core-x86_64-x86_64/sysroots/x86_64-oesdk-linux
> >=20
> > while STAGING_INCDIR is different for each machine
> > SDKMACHINE=3Di686:
> >   STAGING_LIBDIR=3D"SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecor=
e-i686-i586/sysroots/i686-oesdk-linux/usr/lib/i586-oe-linux"
> >   STAGING_LIBDIR=3D"SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecor=
e-i686-x86_64/sysroots/i686-oesdk-linux/usr/lib/x86_64-oe-linux"
> >   STAGING_LIBDIR=3D"SYSROOTS/i686-oesdk-linux-nativesdk/usr/local/oecor=
e-i686-arm/sysroots/i686-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi"
> > SDKMACHINE=3Dx86-64:
> >   STAGING_LIBDIR=3D"SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oec=
ore-x86_64-i586/sysroots/x86_64-oesdk-linux/usr/lib/i586-oe-linux"
> >   STAGING_LIBDIR=3D"SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oec=
ore-x86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux"
> >   STAGING_LIBDIR=3D"SYSROOTS/x86_64-oesdk-linux-nativesdk/usr/local/oec=
ore-x86_64-arm/sysroots/x86_64-oesdk-linux/usr/lib/armv5te-oe-linux-gnueabi"
> >=20
> > notice that not only SDK_NAME tripple is changing
> > SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
> > so we keep it the same across all MACHINES with:
> > NATIVESDK_SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_ARCH}-${SDK_ARCH}"
> >=20
> > but also toplevel SYSROOT is different
> > i686-nativesdk-oesdk-linux
> > i686-oesdk-linux-nativesdk
> > and
> > x86_64-nativesdk-oesdk-linux
> > x86_64-oesdk-linux-nativesdk
> >=20
> > So nativesdk staging is broken and python-nativesdk should be staged
> > separately for each SDK_ARCH/TARGET_ARCH combination or we need those
> > NATIVESDK_SDK_NAME variables for cross-canadian -> nativesdk deps.
>=20
> All becomes clear now.=20
>=20
> I seem to remember strongly disagreeing with:
>=20
> SDK_NAME =3D "oecore-${SDK_ARCH}-${TARGET_ARCH}"
> SDKPATH =3D "/usr/local/${SDK_NAME}"
>=20
> that is in bitbake.conf but probably wasn't able to articulate why at
> the time. You'll note that poky.conf does:
>=20
> SDK_VERSION :=3D "${@'${DISTRO_VERSION}'.replace('snapshot-${DATE}','snap=
shot')}"
> SDK_NAME =3D "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${TARGET_ARCH}"
> SDKPATH =3D "/opt/${DISTRO}/${SDK_VERSION}"
>=20
> so the SDKPATH is not dependent on TARGET_ARCH. It doesn't need to
> depend on SDK_ARCH either although that is not the problematic part
> here.
>=20
> If you think about what is happening, bitbake will reuse the sstate
> files for each nativesdk, they are meant to be equivalent for each
> SDKMACHINE. If you hardcode TARGET_ARCH into the path, they are not.

I'll update my first patch to remove TARGET_ARCH, I'm testing
SDKPATH =3D "/usr/local/${SDK_NAME_PREFIX}"
now, then we still have to deal with different toplevel SYSROOT (if we
want to use STAGING_LIBDIR etc).

x86_64-nativesdk-oesdk-linux (python-nativesdk)
x86_64-oesdk-linux-nativesdk (gdb-cross-canadian-*)

And that looks even more like another wrong variable to me, but as I've
said in 1st thread (SDK confusion) I normaly don't build SDKs so maybe
there are hidden reasons to stage them in different dirs.

I can use Eric's
${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}
to look into right sysroot, but maybe it's again not right direction.

> So I'd say that SDKPATH containing SDK_NAME is clearly bogus and
> TARGET_ARCH needs to be removed in somehow at the very least. Fix that
> and your problems should go away.=20

Not really but it's getting better :).

> The patches you're sending don't fix the root problem though.

Originaly they were meant mostly to show the difference between
nativesdk and cross-canadian paths.. so I'm not much surprised :).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--F4Nz7zOi0wR5AkzI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9I3jIACgkQN1Ujt2V2gBwBWwCfWV3x4EkIhmTl8y68dUIJa+z9
OWUAnim+sjPcS1OczXF3cX8jEQeqJu1f
=9jW3
-----END PGP SIGNATURE-----

--F4Nz7zOi0wR5AkzI--
