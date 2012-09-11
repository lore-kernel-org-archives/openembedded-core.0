Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBTQY-0002hX-Nj
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:35:06 +0200
Received: by eekb57 with SMTP id b57so543630eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 09:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RAs6hOSpFrBY4dcC89671PXWS3DeSsa/2EOfPyLG3wg=;
	b=Z02qP1mATzQqkr7MXXc5m3BcyMuSU0Ctfo91Ou5EU8ICobTv+T/WD6G/QByG2vsxec
	0O/iu/GJOJNGdUwFycJkaEmyiZl7g2jF+CRsW7GdTt3qBy2TgRCkKXie6yqf85kpu4Fm
	OncVeyRCTIGlTOxBYbKQIE0QeRhlTNNCaoEAj1zVrib50Q+C9k1zL6FA3Mzp6YD8XjY+
	jnHK0eYl5b/ojXo0NgfI2gpAizA5OL9qg/euHkxWLz5f+5HgdJ3W+X5gklwi2KSFAqZM
	eKz6H0PZsAYKYLscmtdtTgwdZ/VQ/pZz9BMudJv9UCwn7mzkTAJd/MwIN0Rg2C2huCm5
	RWHw==
Received: by 10.205.127.77 with SMTP id gz13mr4949262bkc.17.1347380552831;
	Tue, 11 Sep 2012 09:22:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m9sm10150609bkm.10.2012.09.11.09.22.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 09:22:31 -0700 (PDT)
Date: Tue, 11 Sep 2012 18:22:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20120911162231.GI14077@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<20120911134814.GF14077@jama.jama.net>
	<504F5E0C.7040502@windriver.com>
	<20120911155930.GH14077@jama.jama.net>
	<504F6251.8020702@windriver.com>
MIME-Version: 1.0
In-Reply-To: <504F6251.8020702@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: ARM-tuning -- was qemuarm: should it really have TUNE_ARCH armv5te?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 16:35:06 -0000
X-Groupsio-MsgNum: 29071
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jQIvE3yXcK9X9HBh"
Content-Disposition: inline

--jQIvE3yXcK9X9HBh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 11:09:53AM -0500, Mark Hatle wrote:
> On 9/11/12 10:59 AM, Martin Jansa wrote:
> > On Tue, Sep 11, 2012 at 10:51:40AM -0500, Mark Hatle wrote:
> >> On 9/11/12 8:48 AM, Martin Jansa wrote:
> >>> On Tue, Sep 11, 2012 at 03:01:55PM +0200, Martin Jansa wrote:
> >>>> Hi,
> >>>>
> >>>> when building spitz and qemuarm (both produces packages in armv5te f=
eed)
> >>>> resulting packages are tuned with -mtune=3Dxscale (when built for sp=
itz)
> >>>> or -mtune=3Darm926ej-s (when built for qemuarm).
> >>
> >> I argued this when we original did the work for the tunings, and I los=
t....
> >>
> >>>> From
> >>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916#c5
> >>>> Firstly, if you go changing the tune parameters in a given machine, =
you are expected to use a different PACKAGE_ARCH. If you do that, you will =
get a different package feed for the different binaries, different WORKDIR =
and so on. This was always the way the package architectures was intended t=
o work and nothing has changed there. Yes, you as the user changing various=
 variables can create inconsistent package feeds. There are 101 ways you ca=
n do that, the simple answer is just don't. We're therefore unlikely to add=
 MACHINE to DEPLOY_DIR or remove PACKAGE_ARCH, please just use it as its in=
tended.
> >>
> >> That is certainly my expectation.  I'm not sure that the arm926ej-s ca=
n produce
> >> binaries that are -not- arm5te binaries -- as that seems to be the sta=
ndard for
> >> what an armv5te is.  The xscale on the other hand is capable of having=
 different
> >> tuning parameters and had a few additional instructions.  In the past =
I've
> >> generated a tuning simple called "xscale" that was compatible w/ armv5=
te.  This
> >> way you could share non-optimized things, and go w/ xscale as necessar=
y.
> >
> > Few more comments I did on IRC:
> >
> > 16:41:23 < JaMa> let's hope RP will comment on that as that was his com=
ment I was copy&pasting
> > 16:41:53 < JaMa> e.g. ppc seems to set TUNE_PKGARCH for each tune-*
> > 16:44:24 < JaMa> but it would be better to set xscale/arm926 tune only =
for packages where such -mtune brings some speedup (and for those where we =
set PACKAGE_ARCH =3D MACHINE_ARCH already) and build the rest only with -ma=
rch
> > 16:45:36 < JaMa> but mixed feed and -mtune=3Dxscale packages on arm926 =
targets looks like worst case
> > 16:50:20 < JaMa> oe-classic had the same issue with mixed -mtune in pac=
kage arch feeds, but at least it wasn't rebuilding them after each machine =
switch
> >
> > And I'm not sure where we could decide what's worth -mtune and what is =
not,
> > because in recipe we can do it only with a lot of _arch overrides and i=
n tune
> > file with lot of _pn-foo overrides (and some could be also in other lay=
ers then oe-core etc.)
> >
> > But it would be nice to share most packages as "general" armv5te betwee=
n e.g. spitz and qemuarm builds.
>=20
> This really hints that defining the tunings become a distribution configu=
ration.
>=20
> You should be able to do:
>=20
> DEFAULTTUNE_pn-openssl =3D "xscale"

Where? in some distro config? What after I switch machine to some armv7a
machine? (that's why I said a lot of _arch overrides)

something like:
# to set only armv5te as default (for most PN)
DEFAULTTUNE_armv5te =3D "armv5te"
# then use "optimized" DEFAULTTUNE where it's worth
DEFAULTTUNE_pn-openssl_spitz =3D "xscale"
DEFAULTTUNE_pn-openssl_mycorei7 =3D "corei7"

But that sucks because I have to list all MACHINES which have some
"optimized" DEFAULTTUNE.

What about something like this:
bitbake.conf:
OPTDEFAULTTUNE ??=3D "${DEFAULTTUNE}"

conf/machine/include/tune-xscale.inc:
-DEFAULTTUNE ?=3D "xscale"
+OPTDEFAULTTUNE ?=3D "xscale"

conf/machine/include/tune-arm926ejs.inc
-DEFAULTTUNE ?=3D "arm926ejs"
+OPTDEFAULTTUNE ?=3D "arm926ejs"

conf/distro/include/opt-default-tune.inc:
DEFAULTTUNE_pn-openssl =3D ${OPTDEFAULTTUNE}
DEFAULTTUNE_pn-mplayer =3D ${OPTDEFAULTTUNE}

That would be easier to manage I guess.

>=20
> To enable just openssl benefits from the xscale tunings.  (The pn- may no=
t be=20
> needed.. I can never remember anymore...)  But that was the original idea=
 with=20
> the tunings, make a way to specify DEFAULTTUNE for various things when=20
> alternative, but compatible tunings made a difference...  set that in the=
=20
> distro.conf and you have an optimized distribution for specific uses.  (Y=
ou of=20
> course could also move that to a machine setting or similar file.)
>=20
> --Mark
>=20
> > Cheers,
> >
> >>
> >>>> Does qemuarm use oe-core as it's intended?
> >>>
> >>> CCing bluelightning because xscale is used in lot of meta-handheld ma=
chines:
> >>>
> >>> Does this make sense?
> >>>
> >>> OE @ ~/openembedded-core/meta/conf/machine/include $ diff -uNr tune-a=
rm926*; diff -uNr tune-xscale.inc*
> >>> --- tune-arm926ejs.inc  2012-09-11 15:45:47.958202057 +0200
> >>> +++ tune-arm926ejs.inc.new      2012-09-11 15:45:40.579194777 +0200
> >>> @@ -8,4 +8,4 @@
> >>>    AVAILTUNES +=3D "arm926ejs"
> >>>    TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} ar=
m926ejs"
> >>>    PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv5te}"
> >>> -
> >>> +TUNE_PKGARCH_tune-arm926ejs =3D "armv5te-arm926ejs"
> >>
> >> I'd suggest simply arm926ejs....
> >>
> >>> --- tune-xscale.inc     2012-08-28 11:01:04.899070433 +0200
> >>> +++ tune-xscale.inc.new 2012-09-11 15:43:24.560060591 +0200
> >>> @@ -8,10 +8,12 @@
> >>>    AVAILTUNES +=3D "xscale"
> >>>    TUNE_FEATURES_tune-xscale =3D "${TUNE_FEATURES_tune-armv5te} xscal=
e"
> >>>    PACKAGE_EXTRA_ARCHS_tune-xscale =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv5te}"
> >>> +TUNE_PKGARCH_tune-xscale =3D "armv5te-xscale"
> >>
> >> Again simplify to xscale
> >>
> >>>    AVAILTUNES +=3D "xscale-be"
> >>>    TUNE_FEATURES_tune-xscale-be =3D "${TUNE_FEATURES_tune-armv5teb} x=
scale bigendian"
> >>>    PACKAGE_EXTRA_ARCHS_tune-xscale-be =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv5teb}"
> >>> +TUNE_PKGARCH_tune-xscale-be =3D "armv5teb-xscale"
> >>
> >> And xscaleeb (or be)
> >>
> >> --Mark
> >>
> >>>    # webkit-gtk has alignment issues with double instructions on armv=
5 so
> >>>    # disable them here
> >>>
> >>>>
> >>>> Shouldn't spitz produce something like armv5te-xscale and qemuarm ar=
mv5te-arm926ejs?
> >>>> It would cause all recipes to build again (cannot share armv5te feed=
 anymore),
> >>>> but at least it would build it and user will really get it on target=
, right now
> >>>> opkg upgrade can download some packages with xscale some with arm926=
ej-s.
> >>>>
> >>>> $ ~/bitbake/bin/bitbake-diffsigs
> >>>>     stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-head=
ers-3.4.3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
> >>>>     stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc-he=
aders-3.4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
> >>>>     basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8dd2f=
f8613d0aafe60bef1a1e9469a1
> >>>>     Variable TUNE_CCARGS value changed from
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${=
ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${=
ARMPKGSFX_THUMB}", "", d)}
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OP=
T}", "", d)}
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mn=
o-thumb-interwork", "-mthumb-interwork", d)}
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("=
TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=
=3Dsoftfp", d), "" ,d)}
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=3Dxscale=
", "", d)}
> >>>>     to
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${=
ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${=
ARMPKGSFX_THUMB}", "", d)}
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OP=
T}", "", d)}
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mn=
o-thumb-interwork", "-mthumb-interwork", d)}
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("=
TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=
=3Dsoftfp", d), "" ,d)}
> >>>>     ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=3Darm=
926ej-s", "", d)}
> >>>>
> >>>> --
> >>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>>
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jQIvE3yXcK9X9HBh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPZUcACgkQN1Ujt2V2gBzMmgCgtbtiDrmW/B9t7voYUBrIMS6j
/Z4AniZTbayLTn/UujYbkReEv3eD3vxa
=6pDt
-----END PGP SIGNATURE-----

--jQIvE3yXcK9X9HBh--
