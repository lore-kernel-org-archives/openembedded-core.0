Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2D5798E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 14:12:36 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v17-v6so10773936wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 07:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bUH66vVwifgjpbW+B+lZqKsKwbTZpDl80+Lo89jozF8=;
	b=eR5HpU/UJLkNnCBZSlaedafI/t6NysixOzyps0dBqRnlqAW+lDvWHC4AVZtclRcIj3
	kdAmnKoB44+ISlegy85l+9XCo1SXcUrbdAcpCzWW1bSVKl20dKpIYWxoXyNkMfYuXWLh
	MsXJBybud39MQgCOc+YBNq06dwQ1rgM5SrzTZyUfeq4NrXvzNduRgEGEFNsjbgXvDoJZ
	JJQjyFCv11z7Jce5FWZmm65vfzjHh043zWklhg/FXyo3SXEH+MIhJ/0VJrCuvwgxKVxA
	aUXkS2VgF76BgmhTXriRuX/x7cbufW8CdScmWnDcOVRtmkc+jg2dxFQABoqQw43b5McX
	19YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bUH66vVwifgjpbW+B+lZqKsKwbTZpDl80+Lo89jozF8=;
	b=BCFCE9X9FdwITmhAkShBAyZKrFRbb7s9iAwvoN8WkjEEzGyi6LyH3HJiAg06r/mK7/
	6b3yJDJ+Wy1Od0mUFZC+pBpC/FNBQTSA4DFMJs6bL/KSQBId53E5m469CZzZrrU010PM
	0HB5VbmNCu42uIicn0qq74Q2z5IxH9QEjrxOZ13VGRt0JpxH2riuDzzffUav0dyBYhh5
	jQAnKXE3meIczAMhRkvbUSFqK/q2gYUYjM8T2y8vaLSjxgSp7jWwPbovrF5U8Xubpzw3
	869lAkCj/EUdiXO/SVeRZyEQKqnO7aTCvei3CKkYYRty3X4kNatXS5YNHwBOyejzEN49
	WJNg==
X-Gm-Message-State: APzg51AjhU1XS84AgMVuOYV9ALENzFBtWlykGVyZApXrK5scPqxuB1Tb
	fXdXO/phbkLlsreBU0mApBI=
X-Google-Smtp-Source: ANB0VdY6O2fKSmODq4cATZrKkuITlA7XVGQJy9u0fUCL3SOWVa8hKX8rny8KHRdE+Xxs8NSRHfkpnQ==
X-Received: by 2002:a1c:638a:: with SMTP id
	x132-v6mr2413756wmb.33.1536934356571; 
	Fri, 14 Sep 2018 07:12:36 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o15-v6sm6985957wru.23.2018.09.14.07.12.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 14 Sep 2018 07:12:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 Sep 2018 16:12:36 +0200
To: kai.kang@windriver.com
Message-ID: <20180914141236.GD1369@jama>
References: <cover.1536248856.git.kai.kang@windriver.com>
	<2824ade62c3ec58c96074aba632740a8118c15f2.1536248856.git.kai.kang@windriver.com>
	<20180913182007.GA1437@jama> <20180913201046.GB1437@jama>
	<20180914112512.GA1369@jama>
MIME-Version: 1.0
In-Reply-To: <20180914112512.GA1369@jama>
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
X-List-Received-Date: Fri, 14 Sep 2018 14:12:37 -0000
X-Groupsio-MsgNum: 116282
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Content-Disposition: inline

--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 14, 2018 at 01:25:12PM +0200, Martin Jansa wrote:
> On Thu, Sep 13, 2018 at 10:10:46PM +0200, Martin Jansa wrote:
> > On Thu, Sep 13, 2018 at 08:20:07PM +0200, Martin Jansa wrote:
> > > On Thu, Sep 06, 2018 at 11:52:24PM +0800, kai.kang@windriver.com wrot=
e:
> > > > From: Kai Kang <kai.kang@windriver.com>
> > > >=20
> > > > Some allarch packages rdepends non-allarch packages. when multilib =
is
> > > > used, it doesn't expand the dependency chain correctly, e.g.
> > > >=20
> > > > core-image-sato -> ca-certificates(allarch) -> openssl
> > > >=20
> > > > we expect dependency chain for lib32-core-image-sato:
> > > >=20
> > > > lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
> > > >=20
> > > > it should install lib32-openssl for ca-certificates but openssl is =
still
> > > > wrongly required.
> > > >=20
> > > > Only enable allarch when multilib is not used to fix the issue.
> > > >=20
> > > > signed-off-by: kai kang <kai.kang@windriver.com>
> > > > ---
> > > >  meta/classes/allarch.bbclass         | 12 +++++++++++-
> > > >  meta/classes/icecc.bbclass           |  2 +-
> > > >  meta/classes/multilib.bbclass        |  3 ++-
> > > >  meta/classes/multilib_global.bbclass |  4 +---
> > > >  meta/classes/package.bbclass         |  9 ++++++---
> > > >  5 files changed, 21 insertions(+), 9 deletions(-)
> > > >=20
> > > > diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bb=
class
> > > > index 1eebe0bf2e..45f62a5939 100644
> > > > --- a/meta/classes/allarch.bbclass
> > > > +++ b/meta/classes/allarch.bbclass
> > > > @@ -2,7 +2,17 @@
> > > >  # This class is used for architecture independent recipes/data fil=
es (usually scripts)
> > > >  #
> > > > =20
> > > > -PACKAGE_ARCH =3D "all"
> > > > +python allarch_package_arch_handler () {
> > > > +    if bb.data.inherits_class("nativesdk", d) or bb.data.inherits_=
class("crosssdk", d):
> > > > +        return
> > > > +
> > > > +    variants =3D d.getVar("MULTILIB_VARIANTS")
> > > > +    if not variants:
> > > > +        d.setVar("PACKAGE_ARCH", "all" )
> > > > +}
> > > > +
> > > > +addhandler allarch_package_arch_handler
> > > > +allarch_package_arch_handler[eventmask] =3D "bb.event.RecipePreFin=
alise"
> > >=20
> > > Maybe I'm overlooking something, but doesn't this overwrite whatever
> > > PACKAGE_ARCH as set before this?
> > >=20
> > > I have some recipes where the PACKAGE_ARCH is set to MACHINE_ARCH thr=
ough
> > > another bbclass, but then overwritten with "all" by allarch_package_a=
rch_handler:
> > >=20
> > > # $PACKAGE_ARCH [5 operations]
> > > #   set oe-core/meta/conf/bitbake.conf:150
> > > #     [_defaultval] "${TUNE_PKGARCH}"
> > > #   set meta-lg-webos/meta-webos/conf/distro/include/webos.inc:241
> > > #     "${MACHINE_ARCH}"
> > > #   set oe-core/meta/conf/documentation.conf:304
> > > #     [doc] "The architecture of the resulting package or packages."
> > > #   set meta-lg-webos/meta-webos/classes/webos_machine_impl_dep.bbcla=
ss:11
> > > #     "${MACHINE_ARCH}"
> > > #   set allarch.bbclass:12 [allarch_package_arch_handler]
> > > #     "all"
> > > # pre-expansion value:
> > > #   "all"
> > > PACKAGE_ARCH=3D"all"
> > >=20
> > > But surprisingly if I do the same with e.g. packagegroup-core-boot in=
 oe-core I get:
> > >=20
> > > # $PACKAGE_ARCH [4 operations]
> > > #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:150
> > > #     [_defaultval] "${TUNE_PKGARCH}"
> > > #   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.c=
onf:304
> > > #     [doc] "The architecture of the resulting package or packages."
> > > #   set /OE/build/oe-core/openembedded-core/meta/recipes-core/package=
groups/packagegroup-core-boot.bb:9
> > > #     "${MACHINE_ARCH}"
> > > #   set? /OE/build/oe-core/openembedded-core/meta/classes/packagegrou=
p.bbclass:12
> > > #     "all"
> > > # pre-expansion value:
> > > #   "${MACHINE_ARCH}"
> > > PACKAGE_ARCH=3D"qemux86_64"
> > >=20
> > > Why isn't allarch_package_arch_handler executed in the 2nd case?
> >=20
> > Now I see the difference, I was still living in the days when
> > "disabling" allarch was possible just by setting PACKAGE_ARCH before
> > inheritting allarch, but now I see that packagegroups do conditional
> > inherit as well since:
> > http://git.openembedded.org/openembedded-core/commit/?id=3D9c826962ec8f=
a45c2b035427442b90a41517144e
> > http://git.openembedded.org/openembedded-core/commit/?id=3D2c9b1d304daa=
de7b0907320aeb9c522e7ab9dcab
> > so I'll modify currently failing recipes to do the same and stop
> > inheritting allarch when PACKAGE_ARCH is set to something else.
>=20
> From public layers I've found with test-signatures script only
> fbset-nodes recipe in meta-oe which was setting PACKAGE_ARCH after
> allarch inherit, allarch removal sent here:
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-September=
/120560.html

target-sdk-provides-dummy seems to be affected as well:
 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86 and qemux86copy =3D=3D=3D
ERROR: lib32-target-sdk-provides-dummy different signature for task do_popu=
late_sysroot.sigdata between qemux86 and qemux86copy
basehash changed from b0a44b2c7003b6b4aa3a023d9cb9fe82 to 3a59fa25ddb6a95af=
f079d477ebf3457
Variable SSTATE_MANMACH value changed from 'qemux86' to 'qemux86copy'

ERROR: target-sdk-provides-dummy different signature for task do_populate_s=
ysroot.sigdata between qemux86 and qemux86copy
basehash changed from 9e44f1deb3d15886ee96db1a3332764c to 6b417d08a5113c9b0=
6d13b3681f5ab4f
Variable SSTATE_MANMACH value changed from 'qemux86' to 'qemux86copy'


It's using:
inherit allarch

python() {
    # Put the package somewhere separate to ensure it's never used except
    # when we want it
    # (note that we have to do this in anonymous python here to avoid
    # allarch.bbclass disabling itself)
    d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
}

and DUMMYARCH =3D "sdk-provides-dummy-target"

The difference as shown with bitbake -e before and after reverting this com=
mit:

before revert:
# $SSTATE_MANMACH [2 operations]
#   set? oe-core/meta/classes/sstate.bbclass:61
#     "${SSTATE_PKGARCH}"
#   set sstate.bbclass:100 [__anon_111_oe_core_meta_classes_sstate_bbclass]
#     "machineName"
# pre-expansion value:
#   "machineName"
SSTATE_MANMACH=3D"machineName"

# $SSTATE_PKGARCH
#   set oe-core/meta/classes/sstate.bbclass:11
#     "${PACKAGE_ARCH}"
SSTATE_PKGARCH=3D"sdk-provides-dummy-target"

# $PACKAGE_ARCH [3 operations]
#   set oe-core/meta/conf/bitbake.conf:150
#     [_defaultval] "${TUNE_PKGARCH}"
#   set oe-core/meta/conf/documentation.conf:304
#     [doc] "The architecture of the resulting package or packages."
#   set dummy-sdk-package.inc:12 [__anon_12_oe_core_meta_recipes_core_meta_=
dummy_sdk_package_inc]
#     "${DUMMYARCH}"
# pre-expansion value:
#   "${DUMMYARCH}"
PACKAGE_ARCH=3D"sdk-provides-dummy-target"

after revert:
# $SSTATE_MANMACH
#   set? oe-core/meta/classes/sstate.bbclass:61
#     "${SSTATE_PKGARCH}"
SSTATE_MANMACH=3D"allarch"

# $SSTATE_PKGARCH [2 operations]
#   set oe-core/meta/classes/sstate.bbclass:11
#     "${PACKAGE_ARCH}"
#   set sstate.bbclass:98 [__anon_111__oe_core_meta_classes_sstate_bbclass]
#     "allarch"
# pre-expansion value:
#   "allarch"
SSTATE_PKGARCH=3D"allarch"

# $PACKAGE_ARCH [4 operations]
#   set oe-core/meta/conf/bitbake.conf:150
#     [_defaultval] "${TUNE_PKGARCH}"
#   set oe-core/meta/conf/documentation.conf:304
#     [doc] "The architecture of the resulting package or packages."
#   set oe-core/meta/classes/allarch.bbclass:5
#     "all"
#   set dummy-sdk-package.inc:12 [__anon_12_oe_core_meta_recipes_core_meta_=
dummy_sdk_package_inc]
#     "${DUMMYARCH}"
# pre-expansion value:
#   "${DUMMYARCH}"
PACKAGE_ARCH=3D"sdk-provides-dummy-target"


the relevant part of the anonymous python in sstate.bbclass:

    elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_ARCH") =
=3D=3D "all":
        d.setVar('SSTATE_PKGARCH', "allarch")
    else:
        d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))

So with your change, the PACKAGE_ARCH isn't set to "all" because multilib i=
s enabled,
but that causes sstate.bbclass to set SSTATE_MANMACH to MACHINE instead of =
SSTATE_PKGARCH
allarch, where it got MACHINE is still a bit of mystery to me.

Cheers,

>=20
> >=20
> > Cheers,
> >=20
> > > >  python () {
> > > >      # Allow this class to be included but overridden - only set
> > > > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > > > index 0ca8de86c2..b5a8457747 100644
> > > > --- a/meta/classes/icecc.bbclass
> > > > +++ b/meta/classes/icecc.bbclass
> > > > @@ -171,7 +171,7 @@ def use_icecc(bb,d):
> > > >      return "yes"
> > > > =20
> > > >  def icecc_is_allarch(bb, d):
> > > > -    return d.getVar("PACKAGE_ARCH") =3D=3D "all" or bb.data.inheri=
ts_class('allarch', d)
> > > > +    return d.getVar("PACKAGE_ARCH") =3D=3D "all"
> > > > =20
> > > >  def icecc_is_kernel(bb, d):
> > > >      return \
> > > > diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.=
bbclass
> > > > index f2ac8bdfef..7b4d6472b0 100644
> > > > --- a/meta/classes/multilib.bbclass
> > > > +++ b/meta/classes/multilib.bbclass
> > > > @@ -50,7 +50,8 @@ python multilib_virtclass_handler () {
> > > >      if bb.data.inherits_class('nativesdk', e.data) or bb.data.inhe=
rits_class('crosssdk', e.data):
> > > >          raise bb.parse.SkipRecipe("We can't extend nativesdk recip=
es")
> > > > =20
> > > > -    if bb.data.inherits_class('allarch', e.data) and not bb.data.i=
nherits_class('packagegroup', e.data):
> > > > +    if bb.data.inherits_class('allarch', e.data) and not d.getVar(=
'MULTILIB_VARIANTS') \
> > > > +        and not bb.data.inherits_class('packagegroup', e.data):
> > > >          raise bb.parse.SkipRecipe("Don't extend allarch recipes wh=
ich are not packagegroups")
> > > > =20
> > > >      # Expand this since this won't work correctly once we set a mu=
ltilib into place
> > > > diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/mu=
ltilib_global.bbclass
> > > > index d2ec1adfea..1bb62427b0 100644
> > > > --- a/meta/classes/multilib_global.bbclass
> > > > +++ b/meta/classes/multilib_global.bbclass
> > > > @@ -165,9 +165,7 @@ python multilib_virtclass_handler_global () {
> > > >          return
> > > > =20
> > > >      if bb.data.inherits_class('kernel', e.data) or \
> > > > -            bb.data.inherits_class('module-base', e.data) or \
> > > > -            (bb.data.inherits_class('allarch', e.data) and\
> > > > -             not bb.data.inherits_class('packagegroup', e.data)):
> > > > +            bb.data.inherits_class('module-base', e.data):
> > > >              variants =3D (e.data.getVar("MULTILIB_VARIANTS") or ""=
).split()
> > > > =20
> > > >              import oe.classextend
> > > > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bb=
class
> > > > index 0b6f65a855..d1e9138c66 100644
> > > > --- a/meta/classes/package.bbclass
> > > > +++ b/meta/classes/package.bbclass
> > > > @@ -494,7 +494,8 @@ def get_package_mapping (pkg, basepkg, d):
> > > > =20
> > > >      if key in data:
> > > >          # Have to avoid undoing the write_extra_pkgs(global_varian=
ts...)
> > > > -        if bb.data.inherits_class('allarch', d) and data[key] =3D=
=3D basepkg:
> > > > +        if bb.data.inherits_class('allarch', d) and not d.getVar('=
MULTILIB_VARIANTS') \
> > > > +            and data[key] =3D=3D basepkg:
> > > >              return pkg
> > > >          return data[key]
> > > > =20
> > > > @@ -1413,7 +1414,8 @@ fi
> > > >      if bb.data.inherits_class('kernel', d) or bb.data.inherits_cla=
ss('module-base', d):
> > > >          write_extra_pkgs(variants, pn, packages, pkgdatadir)
> > > > =20
> > > > -    if (bb.data.inherits_class('allarch', d) and not bb.data.inher=
its_class('packagegroup', d)):
> > > > +    if bb.data.inherits_class('allarch', d) and not variants \
> > > > +        and not bb.data.inherits_class('packagegroup', d):
> > > >          write_extra_pkgs(global_variants, pn, packages, pkgdatadir)
> > > > =20
> > > >      workdir =3D d.getVar('WORKDIR')
> > > > @@ -1502,7 +1504,8 @@ fi
> > > >      if bb.data.inherits_class('kernel', d) or bb.data.inherits_cla=
ss('module-base', d):
> > > >          write_extra_runtime_pkgs(variants, packages, pkgdatadir)
> > > > =20
> > > > -    if bb.data.inherits_class('allarch', d) and not bb.data.inheri=
ts_class('packagegroup', d):
> > > > +    if bb.data.inherits_class('allarch', d) and not variants \
> > > > +        and not bb.data.inherits_class('packagegroup', d):
> > > >          write_extra_runtime_pkgs(global_variants, packages, pkgdat=
adir)
> > > > =20
> > > >  }
> > > > --=20
> > > > 2.18.0
> > > >=20
> > > > --=20
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >=20
> > > --=20
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >=20
> >=20
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

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW5vB0wAKCRA3VSO3ZXaA
HLJ9AKCPmF9aBOklz7CPbZQWQZEz0araogCfY1BF9RCNcNT4jM1ET05SSN+ebTE=
=m6mx
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
