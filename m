Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8CB79966
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 11:25:11 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n2-v6so10175551wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 04:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ufepQIvAxnbfI3WDrPLirHP1u87WQfDbbG1d4SV53+M=;
	b=dW3Tdfy17v4P8gOI8uGJ3rbUOi4LewxTyumGjWYgjrdvCh0wTiJ0Di/8to8N5IHLoo
	DJSocU0Clu6fVAeAU43HP3V/HhwamxwdOq6PZ/1wOMBCkWi2QOI9CpjFlw9OS0VqVrzH
	Kui+9y6MyOusJRwmucfJOcayIltoWDDW7pfOKCGhvzL+0Hh7lYsWLHas+qwJgq8Om3aF
	yjMr1HCiIpLeGC3+9tPtqlkp9BoZvd4QE+/gYKPJqHMcZegGidaugdIXQt0ZpxiEA14C
	/mJ5/cHqUlhB+Bx8ObWq3c0DEpKWacg9JLYxaK1zTdBbgB9TNPj1XafLKcuuYbuEVzr0
	pt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ufepQIvAxnbfI3WDrPLirHP1u87WQfDbbG1d4SV53+M=;
	b=a+zqQCJeD/EW76hVZleWFz0OGAWeydv/Quw3p4g0q1UlqSjswUqjl6ffchFnBfaUPa
	z82BzIdxfeDZgY2RRnfw3JNI0uKD0VHtI8OTR7G/3t7NZidb3Wn0KuQGxpAFcHo2q4rS
	M+epCD0wCc4sQoSy4b3Sh3Q+0DxI2C4D3tvYM4Sb7WEVUrcItYNeokZ5PfLpiMPeOGp3
	/PfxKTyNWJiOBEm+sNdY0BqQ4JF5EfXr0DvGCnaASptPtPzcu1c1GB/pfEoL8pN1bJJH
	TSf6mGe9u3f/57dg+apjnBLOQYikxs5oEdEjg666v5CZF3vNQU5RC2Jxb1+K/wDTcgbb
	9BhA==
X-Gm-Message-State: APzg51BCyvPcbVxxNd04rHoVKeWBbH32KbKhf/JHgwEhQiCx/xad1p+S
	UoN5z8YhQ9I0cX7pMBMBo3Y=
X-Google-Smtp-Source: ANB0VdatzifyKAsIN+drYFrgp91IpNKIvcvlJgXvtFCraenj8SY5fNFDiIPFjvk/1I0XCHUg44zzTg==
X-Received: by 2002:adf:de85:: with SMTP id
	w5-v6mr9986585wrl.270.1536924311900; 
	Fri, 14 Sep 2018 04:25:11 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	144-v6sm1661191wma.45.2018.09.14.04.25.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 14 Sep 2018 04:25:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 Sep 2018 13:25:12 +0200
To: kai.kang@windriver.com
Message-ID: <20180914112512.GA1369@jama>
References: <cover.1536248856.git.kai.kang@windriver.com>
	<2824ade62c3ec58c96074aba632740a8118c15f2.1536248856.git.kai.kang@windriver.com>
	<20180913182007.GA1437@jama> <20180913201046.GB1437@jama>
MIME-Version: 1.0
In-Reply-To: <20180913201046.GB1437@jama>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] allarch: only enable allarch when multilib is not used
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2018 11:25:11 -0000
X-Groupsio-MsgNum: 116276
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2018 at 10:10:46PM +0200, Martin Jansa wrote:
> On Thu, Sep 13, 2018 at 08:20:07PM +0200, Martin Jansa wrote:
> > On Thu, Sep 06, 2018 at 11:52:24PM +0800, kai.kang@windriver.com wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > >=20
> > > Some allarch packages rdepends non-allarch packages. when multilib is
> > > used, it doesn't expand the dependency chain correctly, e.g.
> > >=20
> > > core-image-sato -> ca-certificates(allarch) -> openssl
> > >=20
> > > we expect dependency chain for lib32-core-image-sato:
> > >=20
> > > lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
> > >=20
> > > it should install lib32-openssl for ca-certificates but openssl is st=
ill
> > > wrongly required.
> > >=20
> > > Only enable allarch when multilib is not used to fix the issue.
> > >=20
> > > signed-off-by: kai kang <kai.kang@windriver.com>
> > > ---
> > >  meta/classes/allarch.bbclass         | 12 +++++++++++-
> > >  meta/classes/icecc.bbclass           |  2 +-
> > >  meta/classes/multilib.bbclass        |  3 ++-
> > >  meta/classes/multilib_global.bbclass |  4 +---
> > >  meta/classes/package.bbclass         |  9 ++++++---
> > >  5 files changed, 21 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbcl=
ass
> > > index 1eebe0bf2e..45f62a5939 100644
> > > --- a/meta/classes/allarch.bbclass
> > > +++ b/meta/classes/allarch.bbclass
> > > @@ -2,7 +2,17 @@
> > >  # This class is used for architecture independent recipes/data files=
 (usually scripts)
> > >  #
> > > =20
> > > -PACKAGE_ARCH =3D "all"
> > > +python allarch_package_arch_handler () {
> > > +    if bb.data.inherits_class("nativesdk", d) or bb.data.inherits_cl=
ass("crosssdk", d):
> > > +        return
> > > +
> > > +    variants =3D d.getVar("MULTILIB_VARIANTS")
> > > +    if not variants:
> > > +        d.setVar("PACKAGE_ARCH", "all" )
> > > +}
> > > +
> > > +addhandler allarch_package_arch_handler
> > > +allarch_package_arch_handler[eventmask] =3D "bb.event.RecipePreFinal=
ise"
> >=20
> > Maybe I'm overlooking something, but doesn't this overwrite whatever
> > PACKAGE_ARCH as set before this?
> >=20
> > I have some recipes where the PACKAGE_ARCH is set to MACHINE_ARCH throu=
gh
> > another bbclass, but then overwritten with "all" by allarch_package_arc=
h_handler:
> >=20
> > # $PACKAGE_ARCH [5 operations]
> > #   set oe-core/meta/conf/bitbake.conf:150
> > #     [_defaultval] "${TUNE_PKGARCH}"
> > #   set meta-lg-webos/meta-webos/conf/distro/include/webos.inc:241
> > #     "${MACHINE_ARCH}"
> > #   set oe-core/meta/conf/documentation.conf:304
> > #     [doc] "The architecture of the resulting package or packages."
> > #   set meta-lg-webos/meta-webos/classes/webos_machine_impl_dep.bbclass=
:11
> > #     "${MACHINE_ARCH}"
> > #   set allarch.bbclass:12 [allarch_package_arch_handler]
> > #     "all"
> > # pre-expansion value:
> > #   "all"
> > PACKAGE_ARCH=3D"all"
> >=20
> > But surprisingly if I do the same with e.g. packagegroup-core-boot in o=
e-core I get:
> >=20
> > # $PACKAGE_ARCH [4 operations]
> > #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:150
> > #     [_defaultval] "${TUNE_PKGARCH}"
> > #   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.con=
f:304
> > #     [doc] "The architecture of the resulting package or packages."
> > #   set /OE/build/oe-core/openembedded-core/meta/recipes-core/packagegr=
oups/packagegroup-core-boot.bb:9
> > #     "${MACHINE_ARCH}"
> > #   set? /OE/build/oe-core/openembedded-core/meta/classes/packagegroup.=
bbclass:12
> > #     "all"
> > # pre-expansion value:
> > #   "${MACHINE_ARCH}"
> > PACKAGE_ARCH=3D"qemux86_64"
> >=20
> > Why isn't allarch_package_arch_handler executed in the 2nd case?
>=20
> Now I see the difference, I was still living in the days when
> "disabling" allarch was possible just by setting PACKAGE_ARCH before
> inheritting allarch, but now I see that packagegroups do conditional
> inherit as well since:
> http://git.openembedded.org/openembedded-core/commit/?id=3D9c826962ec8fa4=
5c2b035427442b90a41517144e
> http://git.openembedded.org/openembedded-core/commit/?id=3D2c9b1d304daade=
7b0907320aeb9c522e7ab9dcab
> so I'll modify currently failing recipes to do the same and stop
> inheritting allarch when PACKAGE_ARCH is set to something else.

=46rom public layers I've found with test-signatures script only
fbset-nodes recipe in meta-oe which was setting PACKAGE_ARCH after
allarch inherit, allarch removal sent here:
http://lists.openembedded.org/pipermail/openembedded-devel/2018-September/1=
20560.html

>=20
> Cheers,
>=20
> > >  python () {
> > >      # Allow this class to be included but overridden - only set
> > > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > > index 0ca8de86c2..b5a8457747 100644
> > > --- a/meta/classes/icecc.bbclass
> > > +++ b/meta/classes/icecc.bbclass
> > > @@ -171,7 +171,7 @@ def use_icecc(bb,d):
> > >      return "yes"
> > > =20
> > >  def icecc_is_allarch(bb, d):
> > > -    return d.getVar("PACKAGE_ARCH") =3D=3D "all" or bb.data.inherits=
_class('allarch', d)
> > > +    return d.getVar("PACKAGE_ARCH") =3D=3D "all"
> > > =20
> > >  def icecc_is_kernel(bb, d):
> > >      return \
> > > diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bb=
class
> > > index f2ac8bdfef..7b4d6472b0 100644
> > > --- a/meta/classes/multilib.bbclass
> > > +++ b/meta/classes/multilib.bbclass
> > > @@ -50,7 +50,8 @@ python multilib_virtclass_handler () {
> > >      if bb.data.inherits_class('nativesdk', e.data) or bb.data.inheri=
ts_class('crosssdk', e.data):
> > >          raise bb.parse.SkipRecipe("We can't extend nativesdk recipes=
")
> > > =20
> > > -    if bb.data.inherits_class('allarch', e.data) and not bb.data.inh=
erits_class('packagegroup', e.data):
> > > +    if bb.data.inherits_class('allarch', e.data) and not d.getVar('M=
ULTILIB_VARIANTS') \
> > > +        and not bb.data.inherits_class('packagegroup', e.data):
> > >          raise bb.parse.SkipRecipe("Don't extend allarch recipes whic=
h are not packagegroups")
> > > =20
> > >      # Expand this since this won't work correctly once we set a mult=
ilib into place
> > > diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/mult=
ilib_global.bbclass
> > > index d2ec1adfea..1bb62427b0 100644
> > > --- a/meta/classes/multilib_global.bbclass
> > > +++ b/meta/classes/multilib_global.bbclass
> > > @@ -165,9 +165,7 @@ python multilib_virtclass_handler_global () {
> > >          return
> > > =20
> > >      if bb.data.inherits_class('kernel', e.data) or \
> > > -            bb.data.inherits_class('module-base', e.data) or \
> > > -            (bb.data.inherits_class('allarch', e.data) and\
> > > -             not bb.data.inherits_class('packagegroup', e.data)):
> > > +            bb.data.inherits_class('module-base', e.data):
> > >              variants =3D (e.data.getVar("MULTILIB_VARIANTS") or "").=
split()
> > > =20
> > >              import oe.classextend
> > > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcl=
ass
> > > index 0b6f65a855..d1e9138c66 100644
> > > --- a/meta/classes/package.bbclass
> > > +++ b/meta/classes/package.bbclass
> > > @@ -494,7 +494,8 @@ def get_package_mapping (pkg, basepkg, d):
> > > =20
> > >      if key in data:
> > >          # Have to avoid undoing the write_extra_pkgs(global_variants=
=2E..)
> > > -        if bb.data.inherits_class('allarch', d) and data[key] =3D=3D=
 basepkg:
> > > +        if bb.data.inherits_class('allarch', d) and not d.getVar('MU=
LTILIB_VARIANTS') \
> > > +            and data[key] =3D=3D basepkg:
> > >              return pkg
> > >          return data[key]
> > > =20
> > > @@ -1413,7 +1414,8 @@ fi
> > >      if bb.data.inherits_class('kernel', d) or bb.data.inherits_class=
('module-base', d):
> > >          write_extra_pkgs(variants, pn, packages, pkgdatadir)
> > > =20
> > > -    if (bb.data.inherits_class('allarch', d) and not bb.data.inherit=
s_class('packagegroup', d)):
> > > +    if bb.data.inherits_class('allarch', d) and not variants \
> > > +        and not bb.data.inherits_class('packagegroup', d):
> > >          write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
> > > =20
> > >      workdir =3D d.getVar('WORKDIR')
> > > @@ -1502,7 +1504,8 @@ fi
> > >      if bb.data.inherits_class('kernel', d) or bb.data.inherits_class=
('module-base', d):
> > >          write_extra_runtime_pkgs(variants, packages, pkgdatadir)
> > > =20
> > > -    if bb.data.inherits_class('allarch', d) and not bb.data.inherits=
_class('packagegroup', d):
> > > +    if bb.data.inherits_class('allarch', d) and not variants \
> > > +        and not bb.data.inherits_class('packagegroup', d):
> > >          write_extra_runtime_pkgs(global_variants, packages, pkgdatad=
ir)
> > > =20
> > >  }
> > > --=20
> > > 2.18.0
> > >=20
> > > --=20
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW5ualwAKCRA3VSO3ZXaA
HBYsAJ98kcgMOaF8GXTgFJJDxH6NuJUiFACgsfD0DC+voQA/WSHs4WMnoU5tY80=
=806m
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
