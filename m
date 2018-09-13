Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2857379957
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 20:10:45 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z96-v6so7899192wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ohvLPA+Olmle4AOV7siNsjOWzjOprIXtCm0a/BxNgu8=;
	b=pwa08039/nMJrtFOws+YyxtyyRSWtPguYSYig03gM/9Kkkqki9gYa08e5QlwEdOtcW
	81O+9uRjHPiux8EwdfheWzzlSLKDKg3yVPYvaSx0TFEzr1iYoiR0774ttpE4891xvGQi
	8LsK6JH4H1pP6DJyDgcCj6y0AyqldfZ4P5hkbaFLPVPy1wIZXchn7HbUOrX7YUCRrYZk
	IN48duNIJbnnmo5jlmX1hZ5rMzilit9qoPfHrc7G2f7+iomlnFcj9OZWdElJpR6I/CvQ
	t7HBBM6fgw6GW6wkRhGKe5XBNIV8h7hP7/GckFX+ZKyvy733FS/tKyKANjiLvFlIdmUn
	mtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ohvLPA+Olmle4AOV7siNsjOWzjOprIXtCm0a/BxNgu8=;
	b=ijgMF0csjREVhLRn0wdD0jYZrpnKYLxsBklA4VnX3iI9Q7qYqruWeGnUibDCHqm8sn
	YS2Y/XGVeIWv1pgjCwfb93mDKWGML06eNgPlEY5lLLNmM7yOHkrtpzlvjeTnHaVawx0/
	dnuiozvYRWEy2d5L92VRX3Nafm+lKFyEeD7dn+ppn6cEdSMTAkQ6mEIg9wdCFMYEBQ2L
	DLgFb+qJmsWKx0DcqVC23g4bNW+cIxMz2vsHgtvwgE3XcFglEWJ7nCUHUIBCGMWDBUcr
	HnDL6cQ6CHuxQ2+dKykz3eMoX6T0ZGN92MHwlsDX8ffK65YitUzDLy1DHJXN4gEpatVk
	nlQw==
X-Gm-Message-State: APzg51ByboWzrUeTG2cMb44wcQHGq+XCi65r+o4sqjLB319nl2dO4o/2
	fbTEkWFK/ZIMQiQLtwhPhsmOQy+P
X-Google-Smtp-Source: ANB0Vda6KMaak6mdlriA5uDNPCvOgKTNSs8VTZVcLfBIAATLb/jKRusL8HHjCS7gKzChmDZb7wU5vg==
X-Received: by 2002:adf:db51:: with SMTP id
	f17-v6mr6960603wrj.212.1536869446525; 
	Thu, 13 Sep 2018 13:10:46 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n14-v6sm3758988wmc.14.2018.09.13.13.10.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Sep 2018 13:10:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 13 Sep 2018 22:10:46 +0200
To: kai.kang@windriver.com
Message-ID: <20180913201046.GB1437@jama>
References: <cover.1536248856.git.kai.kang@windriver.com>
	<2824ade62c3ec58c96074aba632740a8118c15f2.1536248856.git.kai.kang@windriver.com>
	<20180913182007.GA1437@jama>
MIME-Version: 1.0
In-Reply-To: <20180913182007.GA1437@jama>
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
X-List-Received-Date: Thu, 13 Sep 2018 20:10:46 -0000
X-Groupsio-MsgNum: 116252
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2018 at 08:20:07PM +0200, Martin Jansa wrote:
> On Thu, Sep 06, 2018 at 11:52:24PM +0800, kai.kang@windriver.com wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> >=20
> > Some allarch packages rdepends non-allarch packages. when multilib is
> > used, it doesn't expand the dependency chain correctly, e.g.
> >=20
> > core-image-sato -> ca-certificates(allarch) -> openssl
> >=20
> > we expect dependency chain for lib32-core-image-sato:
> >=20
> > lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
> >=20
> > it should install lib32-openssl for ca-certificates but openssl is still
> > wrongly required.
> >=20
> > Only enable allarch when multilib is not used to fix the issue.
> >=20
> > signed-off-by: kai kang <kai.kang@windriver.com>
> > ---
> >  meta/classes/allarch.bbclass         | 12 +++++++++++-
> >  meta/classes/icecc.bbclass           |  2 +-
> >  meta/classes/multilib.bbclass        |  3 ++-
> >  meta/classes/multilib_global.bbclass |  4 +---
> >  meta/classes/package.bbclass         |  9 ++++++---
> >  5 files changed, 21 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> > index 1eebe0bf2e..45f62a5939 100644
> > --- a/meta/classes/allarch.bbclass
> > +++ b/meta/classes/allarch.bbclass
> > @@ -2,7 +2,17 @@
> >  # This class is used for architecture independent recipes/data files (=
usually scripts)
> >  #
> > =20
> > -PACKAGE_ARCH =3D "all"
> > +python allarch_package_arch_handler () {
> > +    if bb.data.inherits_class("nativesdk", d) or bb.data.inherits_clas=
s("crosssdk", d):
> > +        return
> > +
> > +    variants =3D d.getVar("MULTILIB_VARIANTS")
> > +    if not variants:
> > +        d.setVar("PACKAGE_ARCH", "all" )
> > +}
> > +
> > +addhandler allarch_package_arch_handler
> > +allarch_package_arch_handler[eventmask] =3D "bb.event.RecipePreFinalis=
e"
>=20
> Maybe I'm overlooking something, but doesn't this overwrite whatever
> PACKAGE_ARCH as set before this?
>=20
> I have some recipes where the PACKAGE_ARCH is set to MACHINE_ARCH through
> another bbclass, but then overwritten with "all" by allarch_package_arch_=
handler:
>=20
> # $PACKAGE_ARCH [5 operations]
> #   set oe-core/meta/conf/bitbake.conf:150
> #     [_defaultval] "${TUNE_PKGARCH}"
> #   set meta-lg-webos/meta-webos/conf/distro/include/webos.inc:241
> #     "${MACHINE_ARCH}"
> #   set oe-core/meta/conf/documentation.conf:304
> #     [doc] "The architecture of the resulting package or packages."
> #   set meta-lg-webos/meta-webos/classes/webos_machine_impl_dep.bbclass:11
> #     "${MACHINE_ARCH}"
> #   set allarch.bbclass:12 [allarch_package_arch_handler]
> #     "all"
> # pre-expansion value:
> #   "all"
> PACKAGE_ARCH=3D"all"
>=20
> But surprisingly if I do the same with e.g. packagegroup-core-boot in oe-=
core I get:
>=20
> # $PACKAGE_ARCH [4 operations]
> #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:150
> #     [_defaultval] "${TUNE_PKGARCH}"
> #   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.conf:=
304
> #     [doc] "The architecture of the resulting package or packages."
> #   set /OE/build/oe-core/openembedded-core/meta/recipes-core/packagegrou=
ps/packagegroup-core-boot.bb:9
> #     "${MACHINE_ARCH}"
> #   set? /OE/build/oe-core/openembedded-core/meta/classes/packagegroup.bb=
class:12
> #     "all"
> # pre-expansion value:
> #   "${MACHINE_ARCH}"
> PACKAGE_ARCH=3D"qemux86_64"
>=20
> Why isn't allarch_package_arch_handler executed in the 2nd case?

Now I see the difference, I was still living in the days when
"disabling" allarch was possible just by setting PACKAGE_ARCH before
inheritting allarch, but now I see that packagegroups do conditional
inherit as well since:
http://git.openembedded.org/openembedded-core/commit/?id=3D9c826962ec8fa45c=
2b035427442b90a41517144e
http://git.openembedded.org/openembedded-core/commit/?id=3D2c9b1d304daade7b=
0907320aeb9c522e7ab9dcab
so I'll modify currently failing recipes to do the same and stop
inheritting allarch when PACKAGE_ARCH is set to something else.

Cheers,

> >  python () {
> >      # Allow this class to be included but overridden - only set
> > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > index 0ca8de86c2..b5a8457747 100644
> > --- a/meta/classes/icecc.bbclass
> > +++ b/meta/classes/icecc.bbclass
> > @@ -171,7 +171,7 @@ def use_icecc(bb,d):
> >      return "yes"
> > =20
> >  def icecc_is_allarch(bb, d):
> > -    return d.getVar("PACKAGE_ARCH") =3D=3D "all" or bb.data.inherits_c=
lass('allarch', d)
> > +    return d.getVar("PACKAGE_ARCH") =3D=3D "all"
> > =20
> >  def icecc_is_kernel(bb, d):
> >      return \
> > diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbcl=
ass
> > index f2ac8bdfef..7b4d6472b0 100644
> > --- a/meta/classes/multilib.bbclass
> > +++ b/meta/classes/multilib.bbclass
> > @@ -50,7 +50,8 @@ python multilib_virtclass_handler () {
> >      if bb.data.inherits_class('nativesdk', e.data) or bb.data.inherits=
_class('crosssdk', e.data):
> >          raise bb.parse.SkipRecipe("We can't extend nativesdk recipes")
> > =20
> > -    if bb.data.inherits_class('allarch', e.data) and not bb.data.inher=
its_class('packagegroup', e.data):
> > +    if bb.data.inherits_class('allarch', e.data) and not d.getVar('MUL=
TILIB_VARIANTS') \
> > +        and not bb.data.inherits_class('packagegroup', e.data):
> >          raise bb.parse.SkipRecipe("Don't extend allarch recipes which =
are not packagegroups")
> > =20
> >      # Expand this since this won't work correctly once we set a multil=
ib into place
> > diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multil=
ib_global.bbclass
> > index d2ec1adfea..1bb62427b0 100644
> > --- a/meta/classes/multilib_global.bbclass
> > +++ b/meta/classes/multilib_global.bbclass
> > @@ -165,9 +165,7 @@ python multilib_virtclass_handler_global () {
> >          return
> > =20
> >      if bb.data.inherits_class('kernel', e.data) or \
> > -            bb.data.inherits_class('module-base', e.data) or \
> > -            (bb.data.inherits_class('allarch', e.data) and\
> > -             not bb.data.inherits_class('packagegroup', e.data)):
> > +            bb.data.inherits_class('module-base', e.data):
> >              variants =3D (e.data.getVar("MULTILIB_VARIANTS") or "").sp=
lit()
> > =20
> >              import oe.classextend
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index 0b6f65a855..d1e9138c66 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -494,7 +494,8 @@ def get_package_mapping (pkg, basepkg, d):
> > =20
> >      if key in data:
> >          # Have to avoid undoing the write_extra_pkgs(global_variants..=
=2E)
> > -        if bb.data.inherits_class('allarch', d) and data[key] =3D=3D b=
asepkg:
> > +        if bb.data.inherits_class('allarch', d) and not d.getVar('MULT=
ILIB_VARIANTS') \
> > +            and data[key] =3D=3D basepkg:
> >              return pkg
> >          return data[key]
> > =20
> > @@ -1413,7 +1414,8 @@ fi
> >      if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('=
module-base', d):
> >          write_extra_pkgs(variants, pn, packages, pkgdatadir)
> > =20
> > -    if (bb.data.inherits_class('allarch', d) and not bb.data.inherits_=
class('packagegroup', d)):
> > +    if bb.data.inherits_class('allarch', d) and not variants \
> > +        and not bb.data.inherits_class('packagegroup', d):
> >          write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
> > =20
> >      workdir =3D d.getVar('WORKDIR')
> > @@ -1502,7 +1504,8 @@ fi
> >      if bb.data.inherits_class('kernel', d) or bb.data.inherits_class('=
module-base', d):
> >          write_extra_runtime_pkgs(variants, packages, pkgdatadir)
> > =20
> > -    if bb.data.inherits_class('allarch', d) and not bb.data.inherits_c=
lass('packagegroup', d):
> > +    if bb.data.inherits_class('allarch', d) and not variants \
> > +        and not bb.data.inherits_class('packagegroup', d):
> >          write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
> > =20
> >  }
> > --=20
> > 2.18.0
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW5rERQAKCRA3VSO3ZXaA
HKkIAJ4wm5vFzpzq5jGq4wou5+NGt8LoRgCdHo4Be4SJcpwEya7/eV5Yhwt2ois=
=JkW8
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
