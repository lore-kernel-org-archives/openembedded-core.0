Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBT4F-0001zz-In
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:12:03 +0200
Received: by eekb57 with SMTP id b57so523871eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 08:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wtREIkCGIsrjgx1pJ7Pl+INXcRDy4Xu5+R1wat3X9Xw=;
	b=YNWz/0tdDxWi+XPKmmnOy8s/M2IaMjJSqovDxWJh2xI7AlHYxcvlkDgBOy70bTa7eg
	EwkWdQ3nurIns76JL+ygn44eRKuSeWlQJIOj7fbbotNbGEWueEBE84Wm7I3igciwBZbH
	IH8KWtJfVE/M+w/E+UTJWaBrKbU9uC+Wv1yXTiFJPybsdyLOF0WYeLkNpdkthhqDkqJ7
	GIQYA0AOvk64jqSJcYCmvezIcyBkqrpfjbRDhU8wGZ2/3u+4wizHhJKhmQJFQ5/mVElM
	345ooTpq3zC8Ax7DEa5F19TFDMgh/NyXT4yWb83UP8phK4geBWlKPOfMTagFe0rAe7G2
	+WiQ==
Received: by 10.204.156.68 with SMTP id v4mr4899185bkw.68.1347379172500;
	Tue, 11 Sep 2012 08:59:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j9sm10086635bkv.0.2012.09.11.08.59.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 08:59:30 -0700 (PDT)
Date: Tue, 11 Sep 2012 17:59:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20120911155930.GH14077@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<20120911134814.GF14077@jama.jama.net>
	<504F5E0C.7040502@windriver.com>
MIME-Version: 1.0
In-Reply-To: <504F5E0C.7040502@windriver.com>
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
X-List-Received-Date: Tue, 11 Sep 2012 16:12:03 -0000
X-Groupsio-MsgNum: 29058
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZYOWEO2dMm2Af3e3"
Content-Disposition: inline

--ZYOWEO2dMm2Af3e3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 10:51:40AM -0500, Mark Hatle wrote:
> On 9/11/12 8:48 AM, Martin Jansa wrote:
> > On Tue, Sep 11, 2012 at 03:01:55PM +0200, Martin Jansa wrote:
> >> Hi,
> >>
> >> when building spitz and qemuarm (both produces packages in armv5te fee=
d)
> >> resulting packages are tuned with -mtune=3Dxscale (when built for spit=
z)
> >> or -mtune=3Darm926ej-s (when built for qemuarm).
>=20
> I argued this when we original did the work for the tunings, and I lost..=
=2E.
>=20
> >> From
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916#c5
> >> Firstly, if you go changing the tune parameters in a given machine, yo=
u are expected to use a different PACKAGE_ARCH. If you do that, you will ge=
t a different package feed for the different binaries, different WORKDIR an=
d so on. This was always the way the package architectures was intended to =
work and nothing has changed there. Yes, you as the user changing various v=
ariables can create inconsistent package feeds. There are 101 ways you can =
do that, the simple answer is just don't. We're therefore unlikely to add M=
ACHINE to DEPLOY_DIR or remove PACKAGE_ARCH, please just use it as its inte=
nded.
>=20
> That is certainly my expectation.  I'm not sure that the arm926ej-s can p=
roduce=20
> binaries that are -not- arm5te binaries -- as that seems to be the standa=
rd for=20
> what an armv5te is.  The xscale on the other hand is capable of having di=
fferent=20
> tuning parameters and had a few additional instructions.  In the past I'v=
e=20
> generated a tuning simple called "xscale" that was compatible w/ armv5te.=
  This=20
> way you could share non-optimized things, and go w/ xscale as necessary.

Few more comments I did on IRC:

16:41:23 < JaMa> let's hope RP will comment on that as that was his comment=
 I was copy&pasting
16:41:53 < JaMa> e.g. ppc seems to set TUNE_PKGARCH for each tune-*
16:44:24 < JaMa> but it would be better to set xscale/arm926 tune only for =
packages where such -mtune brings some speedup (and for those where we set =
PACKAGE_ARCH =3D MACHINE_ARCH already) and build the rest only with -march
16:45:36 < JaMa> but mixed feed and -mtune=3Dxscale packages on arm926 targ=
ets looks like worst case
16:50:20 < JaMa> oe-classic had the same issue with mixed -mtune in package=
 arch feeds, but at least it wasn't rebuilding them after each machine swit=
ch

And I'm not sure where we could decide what's worth -mtune and what is not,=
=20
because in recipe we can do it only with a lot of _arch overrides and in tu=
ne
file with lot of _pn-foo overrides (and some could be also in other layers =
then oe-core etc.)

But it would be nice to share most packages as "general" armv5te between e.=
g. spitz and qemuarm builds.

Cheers,

>=20
> >> Does qemuarm use oe-core as it's intended?
> >
> > CCing bluelightning because xscale is used in lot of meta-handheld mach=
ines:
> >
> > Does this make sense?
> >
> > OE @ ~/openembedded-core/meta/conf/machine/include $ diff -uNr tune-arm=
926*; diff -uNr tune-xscale.inc*
> > --- tune-arm926ejs.inc  2012-09-11 15:45:47.958202057 +0200
> > +++ tune-arm926ejs.inc.new      2012-09-11 15:45:40.579194777 +0200
> > @@ -8,4 +8,4 @@
> >   AVAILTUNES +=3D "arm926ejs"
> >   TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} arm92=
6ejs"
> >   PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv5te}"
> > -
> > +TUNE_PKGARCH_tune-arm926ejs =3D "armv5te-arm926ejs"
>=20
> I'd suggest simply arm926ejs....
>=20
> > --- tune-xscale.inc     2012-08-28 11:01:04.899070433 +0200
> > +++ tune-xscale.inc.new 2012-09-11 15:43:24.560060591 +0200
> > @@ -8,10 +8,12 @@
> >   AVAILTUNES +=3D "xscale"
> >   TUNE_FEATURES_tune-xscale =3D "${TUNE_FEATURES_tune-armv5te} xscale"
> >   PACKAGE_EXTRA_ARCHS_tune-xscale =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5=
te}"
> > +TUNE_PKGARCH_tune-xscale =3D "armv5te-xscale"
>=20
> Again simplify to xscale
>=20
> >   AVAILTUNES +=3D "xscale-be"
> >   TUNE_FEATURES_tune-xscale-be =3D "${TUNE_FEATURES_tune-armv5teb} xsca=
le bigendian"
> >   PACKAGE_EXTRA_ARCHS_tune-xscale-be =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv5teb}"
> > +TUNE_PKGARCH_tune-xscale-be =3D "armv5teb-xscale"
>=20
> And xscaleeb (or be)
>=20
> --Mark
>=20
> >   # webkit-gtk has alignment issues with double instructions on armv5 so
> >   # disable them here
> >
> >>
> >> Shouldn't spitz produce something like armv5te-xscale and qemuarm armv=
5te-arm926ejs?
> >> It would cause all recipes to build again (cannot share armv5te feed a=
nymore),
> >> but at least it would build it and user will really get it on target, =
right now
> >> opkg upgrade can download some packages with xscale some with arm926ej=
-s.
> >>
> >> $ ~/bitbake/bin/bitbake-diffsigs
> >>    stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-headers=
-3.4.3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
> >>    stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc-heade=
rs-3.4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
> >>    basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8dd2ff86=
13d0aafe60bef1a1e9469a1
> >>    Variable TUNE_CCARGS value changed from
> >>    ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARM=
PKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> >>    ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARM=
PKGSFX_THUMB}", "", d)}
> >>    ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}"=
, "", d)}
> >>    ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-t=
humb-interwork", "-mthumb-interwork", d)}
> >>    ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUN=
E_FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dso=
ftfp", d), "" ,d)}
> >>    ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=3Dxscale", =
"", d)}
> >>    to
> >>    ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARM=
PKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> >>    ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARM=
PKGSFX_THUMB}", "", d)}
> >>    ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}"=
, "", d)}
> >>    ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-t=
humb-interwork", "-mthumb-interwork", d)}
> >>    ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUN=
E_FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dso=
ftfp", d), "" ,d)}
> >>    ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=3Darm926=
ej-s", "", d)}
> >>
> >> --
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZYOWEO2dMm2Af3e3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPX+IACgkQN1Ujt2V2gByqOwCeOLBgH/5w6sTN9sSAEsxwm7mg
JRsAoKdILD8MOUtYCr3ij6E8dsZNtxtH
=YkvI
-----END PGP SIGNATURE-----

--ZYOWEO2dMm2Af3e3--
