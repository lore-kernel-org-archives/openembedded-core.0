Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SD6Jq-00018O-6z
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 05:46:38 +0200
Received: by eekc1 with SMTP id c1so529509eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 20:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BjRoBJG+nS5B5RNJtoM713+O8+ki1E2MHwR0M0sJh4M=;
	b=JFxC5NFzK+aWN+3GLSQlqXThTI0DohzIgSaw0rahtZnfrjFn7B6mk67zQjBzEkziIG
	Bfjth2aiFj3dRjhP7fH9W/wdcYjfvi7j8+rZDaYZzgVvUy2iMI3m5ZW4SEMJgSiXUCrZ
	9tVsfD7AJvstPCF91shYZewEV5SIEVH19aINlyyg9e9IrPSnfjww1bDjWafMd26mzawO
	v7qRwAD4Fezwxt/5yaDZoYZidPqPrIxssfosZ8AEG/Hd3v3IMskqQSZ3s9DoF8c6Ql/W
	eFyg8PTIVRswUPe6kXtst9x1Dgd91pAkkJ0npix6HvI7++S7cE3dXnryXdnTwW6pnx0A
	cDig==
Received: by 10.180.80.104 with SMTP id q8mr1368896wix.14.1332992255394;
	Wed, 28 Mar 2012 20:37:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 9sm22207776wid.2.2012.03.28.20.37.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 20:37:34 -0700 (PDT)
Date: Thu, 29 Mar 2012 05:37:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120329033735.GH4004@jama.jama.net>
References: <cover.1332929227.git.edwin.zhai@intel.com>
	<af00d9bd88e6322d5080f985a36ac38afdf67ea5.1332929227.git.edwin.zhai@intel.com>
	<20120328105837.GB4004@jama.jama.net>
	<20120329013128.GD1450@edwin-gen>
MIME-Version: 1.0
In-Reply-To: <20120329013128.GD1450@edwin-gen>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] virtual/libgl: switch back to mesa-xlib for qemuarm/qemumips
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
X-List-Received-Date: Thu, 29 Mar 2012 03:46:38 -0000
X-Groupsio-MsgNum: 19917
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6lXr1rPCNTf1w0X8"
Content-Disposition: inline

--6lXr1rPCNTf1w0X8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 09:31:28AM +0800, Zhai, Edwin wrote:
> On Wed, Mar 28, 2012 at 12:58:37PM +0200, Martin Jansa wrote:
> > On Wed, Mar 28, 2012 at 06:10:26PM +0800, edwin.zhai@intel.com wrote:
> > > From: Martin Jansa <martin.jansa@gmail.com>
> >=20
> > I don't think I've ever sent something like this.
> > Actually I've sent patch:
> > default-providers: switch virtual/libgl from mesa-xlib to mesa-dri
> > * to match default virtual/xserver
>=20
> Yes, this is just a revert to fix the GL failure. Sorry, I don't notice t=
hat git=20
> keep the original author when you revert:(

FWIW: It doesn't keep the original author here, but maybe you have
different git..

> Could you pls. explain why mesa-xlib doesn't match xserver-xorg?

see:
http://patches.openembedded.org/patch/13631/

>=20
> Thanks,
> Edwin
>=20
> >=20
> > And this just reverts it + adds suspicious COMPATIBLE_MACHINE..
> >=20
> > Cheers,
> >=20
> > > Still need mesa-xlib for emulation of GLX interface on qemuarm/qemumi=
ps, where
> > > mesa-dri doesn't work for pure qemu emulator.
> > >=20
> > > [YOCTO #2066] fixed.
> > > ---
> > >  meta/conf/distro/include/default-providers.inc |    2 +-
> > >  meta/recipes-graphics/mesa/mesa-xlib.inc       |    2 ++
> > >  2 files changed, 3 insertions(+), 1 deletions(-)
> > >=20
> > > diff --git a/meta/conf/distro/include/default-providers.inc b/meta/co=
nf/distro/include/default-providers.inc
> > > index 54c90d3..3850a2f 100644
> > > --- a/meta/conf/distro/include/default-providers.inc
> > > +++ b/meta/conf/distro/include/default-providers.inc
> > > @@ -5,7 +5,7 @@ PREFERRED_PROVIDER_virtual/db ?=3D "db"
> > >  PREFERRED_PROVIDER_virtual/db-native ?=3D "db-native"
> > >  PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> > >  PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xorg"
> > > -PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa-dri"
> > > +PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa-xlib"
> > >  PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "update-alternat=
ives-cworth"
> > >  PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-nat=
ive"
> > >  PREFERRED_PROVIDER_virtual/libx11 ?=3D "libx11-trim"
> > > diff --git a/meta/recipes-graphics/mesa/mesa-xlib.inc b/meta/recipes-=
graphics/mesa/mesa-xlib.inc
> > > index b720e14..c431eab 100644
> > > --- a/meta/recipes-graphics/mesa/mesa-xlib.inc
> > > +++ b/meta/recipes-graphics/mesa/mesa-xlib.inc
> > > @@ -1 +1,3 @@
> > >  EXTRA_OECONF +=3D " --with-driver=3Dxlib --without-gallium-drivers"
> > > +
> > > +COMPATIBLE_MACHINE =3D "(qemuarm|qemumips|qemuppc)"
> > > --=20
> > > 1.7.5.4
> > >=20
> > >=20
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> --=20
> best rgds,
> edwin
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6lXr1rPCNTf1w0X8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk9z2P8ACgkQN1Ujt2V2gBxTSwCgqeHTE/lA9UyTjQ/6ob5Ck6rJ
lAAAn2eygzrdnBTwDeZFeBp0g4GZvKGJ
=B/Fe
-----END PGP SIGNATURE-----

--6lXr1rPCNTf1w0X8--
