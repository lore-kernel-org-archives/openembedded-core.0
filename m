Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 79D06745FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 05:50:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id j192-v6so8013347wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 22:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OG9Na33CZ8cMB2zD6+mHn62DTxshoPGzesSdMznmEb8=;
	b=mhvARZOKjtXVgh3IrWQe7PKz6NWa9WyLxUO5ym5SmicYUdYAvl+vQuDQqmMZqupk+p
	cWne45UGDxSo5LUW6y0tBixhH4mCjQPyy87FFfhndPy+svdVkVNUJYSKte86j1f6rEUj
	vPxUvv8pKN1zkM+HRMqq7fbF3pTv7qhg//g4gOAUgVahHgtDKH3mnpG5D8JrHEF5rcOe
	dcMglERjwPOCcu4tQ+NocoIZxz0QxQpZO2DSBqBqXsNfNDveRREtmXXfDNS4rjegMJGB
	r3t+Aznm6SMQnqkPRXX3sxvqugScdrisVQFrvFs+/bdyY/4x0C0+5hszHXw/e1UbsU52
	NTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OG9Na33CZ8cMB2zD6+mHn62DTxshoPGzesSdMznmEb8=;
	b=mqEqetb/IKhqE9QksX87mupolgsMzUc/HV+bBifAA4kqGbvNKZyhVcFSNasRHPWqzu
	XUgMNqELruo1KthPgt/2itpgAOy2RutvIp4FHPL7SIWuCdHS5pkBmdPvH2iDfTOXni6t
	3rgLqWpDSOxrEOb2NAYxbcr6yQfmiiQwMX5nbgJ/TaAXtUwya7EnZlZ9tcNC7+OnbNNj
	N1nRzlyzwnXI2w9tdOTrfoku/4G8wXz+ixsS8RSxJbQNCixP9xXNwq3MnQVZq5UHLElc
	jFspOHtnCcwvRcOy302Wy6nBKGsCyW+QaD+jSlU2bnW2ZdyqPWbisB7nfyvTynezejrg
	VkJw==
X-Gm-Message-State: APzg51DlAZvlMwcQX5GFxYJ29UGrw7ZCUnfAixq7OCCLE+SxvC3DECRa
	qurCogb/YQoFQTc+GTgJubaJsbFR
X-Google-Smtp-Source: ANB0VdaibVQaLlT7lr+y3YvrJNt2a08BQcxPok0DpRLcf4LF7vJHQOVOJT8bhLMMMil8/AIg3xHdoQ==
X-Received: by 2002:a1c:8c0b:: with SMTP id
	o11-v6mr10273625wmd.11.1537163436070; 
	Sun, 16 Sep 2018 22:50:36 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y184-v6sm5211385wmg.17.2018.09.16.22.50.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Sep 2018 22:50:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 17 Sep 2018 07:50:35 +0200
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20180917055034.GA3408@jama>
References: <cover.1536248856.git.kai.kang@windriver.com>
	<2824ade62c3ec58c96074aba632740a8118c15f2.1536248856.git.kai.kang@windriver.com>
	<20180913182007.GA1437@jama> <20180913201046.GB1437@jama>
	<20180914112512.GA1369@jama> <20180914141236.GD1369@jama>
	<dabc02da-9972-8e06-6624-a567f8aefe48@windriver.com>
MIME-Version: 1.0
In-Reply-To: <dabc02da-9972-8e06-6624-a567f8aefe48@windriver.com>
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
X-List-Received-Date: Mon, 17 Sep 2018 05:50:35 -0000
X-Groupsio-MsgNum: 116332
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2018 at 10:25:38AM +0800, Kang Kai wrote:
> On 2018=E5=B9=B409=E6=9C=8814=E6=97=A5 22:12, Martin Jansa wrote:
> > On Fri, Sep 14, 2018 at 01:25:12PM +0200, Martin Jansa wrote:
> >> On Thu, Sep 13, 2018 at 10:10:46PM +0200, Martin Jansa wrote:
> >>> On Thu, Sep 13, 2018 at 08:20:07PM +0200, Martin Jansa wrote:
> >>>> On Thu, Sep 06, 2018 at 11:52:24PM +0800, kai.kang@windriver.com wro=
te:
> >>>>> From: Kai Kang <kai.kang@windriver.com>
> >>>>>
> >>>>> Some allarch packages rdepends non-allarch packages. when multilib =
is
> >>>>> used, it doesn't expand the dependency chain correctly, e.g.
> >>>>>
> >>>>> core-image-sato -> ca-certificates(allarch) -> openssl
> >>>>>
> >>>>> we expect dependency chain for lib32-core-image-sato:
> >>>>>
> >>>>> lib32-core-image-sato -> ca-certificates(allarch) -> lib32-openssl
> >>>>>
> >>>>> it should install lib32-openssl for ca-certificates but openssl is =
still
> >>>>> wrongly required.
> >>>>>
> >>>>> Only enable allarch when multilib is not used to fix the issue.
> >>>>>
> >>>>> signed-off-by: kai kang <kai.kang@windriver.com>
> >>>>> ---
> >>>>>   meta/classes/allarch.bbclass         | 12 +++++++++++-
> >>>>>   meta/classes/icecc.bbclass           |  2 +-
> >>>>>   meta/classes/multilib.bbclass        |  3 ++-
> >>>>>   meta/classes/multilib_global.bbclass |  4 +---
> >>>>>   meta/classes/package.bbclass         |  9 ++++++---
> >>>>>   5 files changed, 21 insertions(+), 9 deletions(-)
> >>>>>
> >>>>> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bb=
class
> >>>>> index 1eebe0bf2e..45f62a5939 100644
> >>>>> --- a/meta/classes/allarch.bbclass
> >>>>> +++ b/meta/classes/allarch.bbclass
> >>>>> @@ -2,7 +2,17 @@
> >>>>>   # This class is used for architecture independent recipes/data fi=
les (usually scripts)
> >>>>>   #
> >>>>>  =20
> >>>>> -PACKAGE_ARCH =3D "all"
> >>>>> +python allarch_package_arch_handler () {
> >>>>> +    if bb.data.inherits_class("nativesdk", d) or bb.data.inherits_=
class("crosssdk", d):
> >>>>> +        return
> >>>>> +
> >>>>> +    variants =3D d.getVar("MULTILIB_VARIANTS")
> >>>>> +    if not variants:
> >>>>> +        d.setVar("PACKAGE_ARCH", "all" )
> >>>>> +}
> >>>>> +
> >>>>> +addhandler allarch_package_arch_handler
> >>>>> +allarch_package_arch_handler[eventmask] =3D "bb.event.RecipePreFin=
alise"
> >>>> Maybe I'm overlooking something, but doesn't this overwrite whatever
> >>>> PACKAGE_ARCH as set before this?
> >>>>
> >>>> I have some recipes where the PACKAGE_ARCH is set to MACHINE_ARCH th=
rough
> >>>> another bbclass, but then overwritten with "all" by allarch_package_=
arch_handler:
> >>>>
> >>>> # $PACKAGE_ARCH [5 operations]
> >>>> #   set oe-core/meta/conf/bitbake.conf:150
> >>>> #     [_defaultval] "${TUNE_PKGARCH}"
> >>>> #   set meta-lg-webos/meta-webos/conf/distro/include/webos.inc:241
> >>>> #     "${MACHINE_ARCH}"
> >>>> #   set oe-core/meta/conf/documentation.conf:304
> >>>> #     [doc] "The architecture of the resulting package or packages."
> >>>> #   set meta-lg-webos/meta-webos/classes/webos_machine_impl_dep.bbcl=
ass:11
> >>>> #     "${MACHINE_ARCH}"
> >>>> #   set allarch.bbclass:12 [allarch_package_arch_handler]
> >>>> #     "all"
> >>>> # pre-expansion value:
> >>>> #   "all"
> >>>> PACKAGE_ARCH=3D"all"
> >>>>
> >>>> But surprisingly if I do the same with e.g. packagegroup-core-boot i=
n oe-core I get:
> >>>>
> >>>> # $PACKAGE_ARCH [4 operations]
> >>>> #   set /OE/build/oe-core/openembedded-core/meta/conf/bitbake.conf:1=
50
> >>>> #     [_defaultval] "${TUNE_PKGARCH}"
> >>>> #   set /OE/build/oe-core/openembedded-core/meta/conf/documentation.=
conf:304
> >>>> #     [doc] "The architecture of the resulting package or packages."
> >>>> #   set /OE/build/oe-core/openembedded-core/meta/recipes-core/packag=
egroups/packagegroup-core-boot.bb:9
> >>>> #     "${MACHINE_ARCH}"
> >>>> #   set? /OE/build/oe-core/openembedded-core/meta/classes/packagegro=
up.bbclass:12
> >>>> #     "all"
> >>>> # pre-expansion value:
> >>>> #   "${MACHINE_ARCH}"
> >>>> PACKAGE_ARCH=3D"qemux86_64"
> >>>>
> >>>> Why isn't allarch_package_arch_handler executed in the 2nd case?
> >>> Now I see the difference, I was still living in the days when
> >>> "disabling" allarch was possible just by setting PACKAGE_ARCH before
> >>> inheritting allarch, but now I see that packagegroups do conditional
> >>> inherit as well since:
> >>> http://git.openembedded.org/openembedded-core/commit/?id=3D9c826962ec=
8fa45c2b035427442b90a41517144e
> >>> http://git.openembedded.org/openembedded-core/commit/?id=3D2c9b1d304d=
aade7b0907320aeb9c522e7ab9dcab
> >>> so I'll modify currently failing recipes to do the same and stop
> >>> inheritting allarch when PACKAGE_ARCH is set to something else.
> >>  From public layers I've found with test-signatures script only
> >> fbset-nodes recipe in meta-oe which was setting PACKAGE_ARCH after
> >> allarch inherit, allarch removal sent here:
> >> http://lists.openembedded.org/pipermail/openembedded-devel/2018-Septem=
ber/120560.html
> > target-sdk-provides-dummy seems to be affected as well:
> >   =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata b=
etween qemux86 and qemux86copy =3D=3D=3D
> > ERROR: lib32-target-sdk-provides-dummy different signature for task do_=
populate_sysroot.sigdata between qemux86 and qemux86copy
> > basehash changed from b0a44b2c7003b6b4aa3a023d9cb9fe82 to 3a59fa25ddb6a=
95aff079d477ebf3457
> > Variable SSTATE_MANMACH value changed from 'qemux86' to 'qemux86copy'
> >
> > ERROR: target-sdk-provides-dummy different signature for task do_popula=
te_sysroot.sigdata between qemux86 and qemux86copy
> > basehash changed from 9e44f1deb3d15886ee96db1a3332764c to 6b417d08a5113=
c9b06d13b3681f5ab4f
> > Variable SSTATE_MANMACH value changed from 'qemux86' to 'qemux86copy'
> >
> >
> > It's using:
> > inherit allarch
> >
> > python() {
> >      # Put the package somewhere separate to ensure it's never used exc=
ept
> >      # when we want it
> >      # (note that we have to do this in anonymous python here to avoid
> >      # allarch.bbclass disabling itself)
> >      d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
> > }
> >
> > and DUMMYARCH =3D "sdk-provides-dummy-target"
> >
> > The difference as shown with bitbake -e before and after reverting this=
 commit:
> >
> > before revert:
> > # $SSTATE_MANMACH [2 operations]
> > #   set? oe-core/meta/classes/sstate.bbclass:61
> > #     "${SSTATE_PKGARCH}"
> > #   set sstate.bbclass:100 [__anon_111_oe_core_meta_classes_sstate_bbcl=
ass]
> > #     "machineName"
> > # pre-expansion value:
> > #   "machineName"
> > SSTATE_MANMACH=3D"machineName"
> >
> > # $SSTATE_PKGARCH
> > #   set oe-core/meta/classes/sstate.bbclass:11
> > #     "${PACKAGE_ARCH}"
> > SSTATE_PKGARCH=3D"sdk-provides-dummy-target"
> >
> > # $PACKAGE_ARCH [3 operations]
> > #   set oe-core/meta/conf/bitbake.conf:150
> > #     [_defaultval] "${TUNE_PKGARCH}"
> > #   set oe-core/meta/conf/documentation.conf:304
> > #     [doc] "The architecture of the resulting package or packages."
> > #   set dummy-sdk-package.inc:12 [__anon_12_oe_core_meta_recipes_core_m=
eta_dummy_sdk_package_inc]
> > #     "${DUMMYARCH}"
> > # pre-expansion value:
> > #   "${DUMMYARCH}"
> > PACKAGE_ARCH=3D"sdk-provides-dummy-target"
> >
> > after revert:
> > # $SSTATE_MANMACH
> > #   set? oe-core/meta/classes/sstate.bbclass:61
> > #     "${SSTATE_PKGARCH}"
> > SSTATE_MANMACH=3D"allarch"
> >
> > # $SSTATE_PKGARCH [2 operations]
> > #   set oe-core/meta/classes/sstate.bbclass:11
> > #     "${PACKAGE_ARCH}"
> > #   set sstate.bbclass:98 [__anon_111__oe_core_meta_classes_sstate_bbcl=
ass]
> > #     "allarch"
> > # pre-expansion value:
> > #   "allarch"
> > SSTATE_PKGARCH=3D"allarch"
> >
> > # $PACKAGE_ARCH [4 operations]
> > #   set oe-core/meta/conf/bitbake.conf:150
> > #     [_defaultval] "${TUNE_PKGARCH}"
> > #   set oe-core/meta/conf/documentation.conf:304
> > #     [doc] "The architecture of the resulting package or packages."
> > #   set oe-core/meta/classes/allarch.bbclass:5
> > #     "all"
> > #   set dummy-sdk-package.inc:12 [__anon_12_oe_core_meta_recipes_core_m=
eta_dummy_sdk_package_inc]
> > #     "${DUMMYARCH}"
> > # pre-expansion value:
> > #   "${DUMMYARCH}"
> > PACKAGE_ARCH=3D"sdk-provides-dummy-target"
> >
> >
> > the relevant part of the anonymous python in sstate.bbclass:
> >
> >      elif bb.data.inherits_class('allarch', d) and d.getVar("PACKAGE_AR=
CH") =3D=3D "all":
> >          d.setVar('SSTATE_PKGARCH', "allarch")
> >      else:
> >          d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
> >
> > So with your change, the PACKAGE_ARCH isn't set to "all" because multil=
ib is enabled,
> > but that causes sstate.bbclass to set SSTATE_MANMACH to MACHINE instead=
 of SSTATE_PKGARCH
> > allarch, where it got MACHINE is still a bit of mystery to me.
>=20
> The original story is that multilib packages such as lib32-curl depends=
=20
> on non-multilib package openssl that allarch package ca-certificates
> is in the dependency chain:
>=20
> lib32-curl -> ca-certificates -> openssl
>=20
> I sent some versions of commits to Richard but he thought these=20
> solutions affect current non-multilib build too much. And Richard proposed
> this solution which not affect current non-multilib build. When multilib=
=20
> is enabled/used, allarch packages are eliminated and treated as common
> packages. The vars SSTATE_*=C2=A0 are set as the same as normal packages =
such=20
> as zlib.
>=20
> Package target-sdk-provides-dummy is a little special that it sets its=20
> PACKAGE_ARCH in its own recipe. And affects vars which depends on=20
> PACKAGE_ARCH.

I've sent possible work around:
http://lists.openembedded.org/pipermail/openembedded-core/2018-September/15=
5743.html

>=20
> Regards,
> Kai
>=20
> >
> > Cheers,
> >
> >>> Cheers,
> >>>
> >>>>>   python () {
> >>>>>       # Allow this class to be included but overridden - only set
> >>>>> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> >>>>> index 0ca8de86c2..b5a8457747 100644
> >>>>> --- a/meta/classes/icecc.bbclass
> >>>>> +++ b/meta/classes/icecc.bbclass
> >>>>> @@ -171,7 +171,7 @@ def use_icecc(bb,d):
> >>>>>       return "yes"
> >>>>>  =20
> >>>>>   def icecc_is_allarch(bb, d):
> >>>>> -    return d.getVar("PACKAGE_ARCH") =3D=3D "all" or bb.data.inheri=
ts_class('allarch', d)
> >>>>> +    return d.getVar("PACKAGE_ARCH") =3D=3D "all"
> >>>>>  =20
> >>>>>   def icecc_is_kernel(bb, d):
> >>>>>       return \
> >>>>> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.=
bbclass
> >>>>> index f2ac8bdfef..7b4d6472b0 100644
> >>>>> --- a/meta/classes/multilib.bbclass
> >>>>> +++ b/meta/classes/multilib.bbclass
> >>>>> @@ -50,7 +50,8 @@ python multilib_virtclass_handler () {
> >>>>>       if bb.data.inherits_class('nativesdk', e.data) or bb.data.inh=
erits_class('crosssdk', e.data):
> >>>>>           raise bb.parse.SkipRecipe("We can't extend nativesdk reci=
pes")
> >>>>>  =20
> >>>>> -    if bb.data.inherits_class('allarch', e.data) and not bb.data.i=
nherits_class('packagegroup', e.data):
> >>>>> +    if bb.data.inherits_class('allarch', e.data) and not d.getVar(=
'MULTILIB_VARIANTS') \
> >>>>> +        and not bb.data.inherits_class('packagegroup', e.data):
> >>>>>           raise bb.parse.SkipRecipe("Don't extend allarch recipes w=
hich are not packagegroups")
> >>>>>  =20
> >>>>>       # Expand this since this won't work correctly once we set a m=
ultilib into place
> >>>>> diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/mu=
ltilib_global.bbclass
> >>>>> index d2ec1adfea..1bb62427b0 100644
> >>>>> --- a/meta/classes/multilib_global.bbclass
> >>>>> +++ b/meta/classes/multilib_global.bbclass
> >>>>> @@ -165,9 +165,7 @@ python multilib_virtclass_handler_global () {
> >>>>>           return
> >>>>>  =20
> >>>>>       if bb.data.inherits_class('kernel', e.data) or \
> >>>>> -            bb.data.inherits_class('module-base', e.data) or \
> >>>>> -            (bb.data.inherits_class('allarch', e.data) and\
> >>>>> -             not bb.data.inherits_class('packagegroup', e.data)):
> >>>>> +            bb.data.inherits_class('module-base', e.data):
> >>>>>               variants =3D (e.data.getVar("MULTILIB_VARIANTS") or "=
").split()
> >>>>>  =20
> >>>>>               import oe.classextend
> >>>>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bb=
class
> >>>>> index 0b6f65a855..d1e9138c66 100644
> >>>>> --- a/meta/classes/package.bbclass
> >>>>> +++ b/meta/classes/package.bbclass
> >>>>> @@ -494,7 +494,8 @@ def get_package_mapping (pkg, basepkg, d):
> >>>>>  =20
> >>>>>       if key in data:
> >>>>>           # Have to avoid undoing the write_extra_pkgs(global_varia=
nts...)
> >>>>> -        if bb.data.inherits_class('allarch', d) and data[key] =3D=
=3D basepkg:
> >>>>> +        if bb.data.inherits_class('allarch', d) and not d.getVar('=
MULTILIB_VARIANTS') \
> >>>>> +            and data[key] =3D=3D basepkg:
> >>>>>               return pkg
> >>>>>           return data[key]
> >>>>>  =20
> >>>>> @@ -1413,7 +1414,8 @@ fi
> >>>>>       if bb.data.inherits_class('kernel', d) or bb.data.inherits_cl=
ass('module-base', d):
> >>>>>           write_extra_pkgs(variants, pn, packages, pkgdatadir)
> >>>>>  =20
> >>>>> -    if (bb.data.inherits_class('allarch', d) and not bb.data.inher=
its_class('packagegroup', d)):
> >>>>> +    if bb.data.inherits_class('allarch', d) and not variants \
> >>>>> +        and not bb.data.inherits_class('packagegroup', d):
> >>>>>           write_extra_pkgs(global_variants, pn, packages, pkgdatadi=
r)
> >>>>>  =20
> >>>>>       workdir =3D d.getVar('WORKDIR')
> >>>>> @@ -1502,7 +1504,8 @@ fi
> >>>>>       if bb.data.inherits_class('kernel', d) or bb.data.inherits_cl=
ass('module-base', d):
> >>>>>           write_extra_runtime_pkgs(variants, packages, pkgdatadir)
> >>>>>  =20
> >>>>> -    if bb.data.inherits_class('allarch', d) and not bb.data.inheri=
ts_class('packagegroup', d):
> >>>>> +    if bb.data.inherits_class('allarch', d) and not variants \
> >>>>> +        and not bb.data.inherits_class('packagegroup', d):
> >>>>>           write_extra_runtime_pkgs(global_variants, packages, pkgda=
tadir)
> >>>>>  =20
> >>>>>   }
> >>>>> --=20
> >>>>> 2.18.0
> >>>>>
> >>>>> --=20
> >>>>> _______________________________________________
> >>>>> Openembedded-core mailing list
> >>>>> Openembedded-core@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>> --=20
> >>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>>
> >>>
> >>> --=20
> >>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>
> >>
> >> --=20
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
>=20
> --=20
> Regards,
> Neil | Kai Kang
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW59AogAKCRA3VSO3ZXaA
HARCAJ4mmA6wspZmX+kyPX5ACQVDsn/QMQCfZ9MIxZKVlTMKqKb7YF5ottGbmHk=
=jnzr
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
