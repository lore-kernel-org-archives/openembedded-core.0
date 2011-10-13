Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REM27-0000UP-3L
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 16:13:16 +0200
Received: by bkat8 with SMTP id t8so622356bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KShs2tdn5o2kfQ9SfoJok1N0ayFi8dOyJheJBLNll/g=;
	b=U+GDBktpj6NuYG/0kBTtK1JWANq1qvOJQgskgD8UDmbD3UoCuTZyxdzjRch6PQEAC9
	akdd+ASy2gyOHXidANyevUUOlW6D8EBnwB1ivaJdZkWT5TwLrla5Rf03uiOrAHa/oAER
	pHUwIS1XL64/sW9tMSmfqmmjHswoikVThOSmo=
Received: by 10.204.142.144 with SMTP id q16mr2887308bku.75.1318514846863;
	Thu, 13 Oct 2011 07:07:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm3818173bkv.3.2011.10.13.07.07.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 07:07:25 -0700 (PDT)
Date: Thu, 13 Oct 2011 16:07:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111013140718.GD28525@jama.jama.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<c30a13301850b76b1e7362b99322ffad72598612.1318505196.git.Martin.Jansa@gmail.com>
	<1318512243.23801.217.camel@ted>
	<20111013133221.GC28525@jama.jama.net>
	<1318514192.23801.229.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1318514192.23801.229.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core 14/20] mesa-dri: introduce MACHINE_DRI_MODULES
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
X-List-Received-Date: Thu, 13 Oct 2011 14:13:16 -0000
X-Groupsio-MsgNum: 10938
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline

--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 02:56:24PM +0100, Richard Purdie wrote:
> On Thu, 2011-10-13 at 15:32 +0200, Martin Jansa wrote:
> > On Thu, Oct 13, 2011 at 02:23:54PM +0100, Richard Purdie wrote:
> > > On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
> > > > * not everybody needs i915, i965
> > > >=20
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  meta/recipes-graphics/mesa/mesa-dri.inc     |    4 ++++
> > > >  meta/recipes-graphics/mesa/mesa-dri_7.11.bb |    2 --
> > > >  2 files changed, 4 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes=
-graphics/mesa/mesa-dri.inc
> > > > index 603438e..be6905c 100644
> > > > --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> > > > +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> > > > @@ -6,6 +6,10 @@ DEFAULT_PREFERENCE =3D "-1"
> > > > =20
> > > >  EXTRA_OECONF +=3D "--with-driver=3Ddri --disable-egl --disable-gal=
lium --without-gallium-drivers"
> > > > =20
> > > > +MACHINE_DRI_MODULES ?=3D ""
> > > > +PACKAGE_ARCH =3D "${@['${MACHINE_ARCH}','${TUNE_PKGARCH}'][bb.data=
=2EgetVar('MACHINE_DRI_MODULES',d,1) =3D=3D '']}"
> > > > +EXTRA_OECONF +=3D "--with-dri-drivers=3Dswrast,${MACHINE_DRI_MODUL=
ES}"
> > > > +
> > > >  python populate_packages_prepend() {
> > > >  	import os.path
> > >=20
> > > Whilst I understand the problem, I don't like this solution.
> > > Particularly, it means that the meas-dri package needs to be marked as
> > > machine specific which I don't like the idea of at all.
> > >=20
> > > How about we do this on a per architecture basis?
> >=20
> > taken from cover-letter:
> > but maybe we can use it as distro variable and keep it with default arc=
h.
> > But then we cannot just add ie glamo dri module from meta-openmoko like=
 this:
> > http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D=
b50c8d00cf764c276b0792c0623b8eda3d18d343
> > without distro (setting MACHINE_DRI_MODULES) depending on such bsp laye=
r.
>=20
> Whilst I hadn't seen the patch I was guessing you were doing something
> like this. Will the glamo module build on all arm platforms or just
> gta02 specifically?

It should build on all arm platforms, but depends on another patch to
libdrm
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D0a84=
6fa3dec896751b44811cd909013874920aae
which should also build on all arm platforms.

I was using both patches for all machines (distr=3D=3DSHR basis) in OE-clas=
sic,=20
but with BSP layers I found it nice to keep them only in respective layer=
=20
and now I would need to move them to upper layer again..

Regards,

> > per architecture has same problem as distro basis
> >=20
> > btw: in old recipes there was --with-dri-drivers with only one -, so ma=
ybe it=20
> > wasn't actually working even for i915, i965 before or configure has ben=
evolent syntax
>=20
> It defaults to enable all modules. We don't have libdrm-nouveau (or
> llvm) so we had to change the config options to explicitly enable the
> pieces I know are cared about on x86 in the latest version. This is why
> the COMPATIBLE_HOST is there too since that recipe was always meaning to
> compile these modules.
>=20
> FWIW, if a patch needs some change in behaviour such as the introduction
> of a variable like MACHINE_DRI_MODULES, we need to spell this out very
> clearly. I know its better in this series but that was a major problem
> in the last version. I'm spelling this out for anyone else on the
> mailing list to take note of!
>=20
> Cheers,
>=20
> Richard
> =20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6W8JYACgkQN1Ujt2V2gBzp2wCeNuojiKwRvlKxjTYnQS+qSjzz
jpQAn0V9VUpkRyKb5z4gkoXYWIx7ZepV
=sh50
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
