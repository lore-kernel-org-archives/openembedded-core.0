Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C0D566FF9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 15:31:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n129so13866186wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=n6NRNAhafcaRSiGEiNniid2c1r79plb/4JPzyK+klqE=;
	b=B5dtS4fl484jDlZ3hH0TJDH3c8d0PlJP1tOVsmnRy3GgM8x6UW6/gH8xyNPzEvqSQT
	sWIOQgXwRQmpjeVeadzOehhbPX8DAwhatSmd9LUt27E6LcCirFfE0QUT6ZGzOTMoSZ20
	gfwHj9g8/AwZv9lU8+fJzfjjNaUiqtuqa8BPBZ7p36boXX+NQ/vZFVebO/iR7+mBCHXl
	siw7MZJfQhRSMxsZxuuTaOlxZDfH43RaMxtFYn1xD9jbVq/ii4s8yy436euAGt3wffEH
	Vt8kFiEOtm0p/YJM+xeHH3tgy3kWcQo8b29zvaZufZM5wm8PzwAyV2301oldC18EFzWR
	BkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=n6NRNAhafcaRSiGEiNniid2c1r79plb/4JPzyK+klqE=;
	b=EPMhiHhquuyTJ2H1uR/lIif3PbSWtPdjSsKelnyjLFUHbMjvMu93Z7G+Mn93nj3W2W
	Z+QjFcX6Va18SBkGrs1sv5SfgyL1hHG7NsRLuTY39OoKPgQwyu5jQHhimab2p947aKMt
	ho/pNg/2/SyYyskeQEI9pXHB7knNbXv6qgwvVhdPsGw3OEVHWsSrZdxpuUZNtUyrhPaU
	TqebQ9d3nPrdIycmcZtN4Y+wlFdpDlul4cRnIaYlCwzusnUU+7l+nlKITayycySWxZRn
	18XatuDDpV1sx4dOPlZs67VfxeCRl89/ZTBXX4zeGAuc8LNSlu6vBPNHnWfXTrH0hzFb
	9n3g==
X-Gm-Message-State: AOPr4FU/W74eLYYZpezEIFxEJrrAnw8xMmwMtF7RR00i1184ykJpLE+zC0bs2d1x+sJ9zg==
X-Received: by 10.28.212.8 with SMTP id l8mr7858079wmg.11.1463585517472;
	Wed, 18 May 2016 08:31:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a63sm9694956wmh.11.2016.05.18.08.31.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 May 2016 08:31:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 May 2016 17:32:27 +0200
To: Herve Jourdain <herve.jourdain@neuf.fr>
Message-ID: <20160518153227.GE2579@jama>
References: <1463574817-22238-1-git-send-email-herve.jourdain@neuf.fr>
	<1463574817-22238-2-git-send-email-herve.jourdain@neuf.fr>
	<20160518141444.GC2579@jama>
	<01a701d1b119$a0f58a00$e2e09e00$@neuf.fr>
MIME-Version: 1.0
In-Reply-To: <01a701d1b119$a0f58a00$e2e09e00$@neuf.fr>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [mesa][PATCH v2 1/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 15:31:58 -0000
X-Groupsio-MsgNum: 82300
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Content-Disposition: inline

--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2016 at 05:26:16PM +0200, Herve Jourdain wrote:
> Hi Martin,
>=20
> Even though the line just below uses "+"? Or shall I modify both?

Ah that's where it came from. Sorry I haven't noticed that it was
already there.

Please ignore what I said, os.path.join won't work anyway, because
libdir starts with slash so os.path.join would just return that part.

Thanks and sorry for noise

> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
> Sent: mercredi 18 mai 2016 16:15
> To: Herve Jourdain <herve.jourdain@neuf.fr>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [mesa][PATCH v2 1/1] Fix mesa_populate_packages()
> when dri is disabled
>=20
> On Wed, May 18, 2016 at 08:33:37PM +0800, Herve Jourdain wrote:
> > When compiling mesa, if dri is disabled in PACKAGECONFIG, or if the list
> of DRI drivers is empty, it will cause populate_package to fail, because =
it
> can't find - rightfully - the directory for the DRI drivers.
> > This patch checks that the directory indeed exists before trying to get=
 a
> list of the files in it
> >=20
> > Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> > ---
> >  meta/recipes-graphics/mesa/mesa.inc | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> > index a4e5351..0e46092 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -143,15 +143,16 @@ python mesa_populate_packages() {
> > =20
> >      import re
> >      dri_drivers_root =3D os.path.join(d.getVar('libdir', True), "dri")
> > -    dri_pkgs =3D os.listdir(d.getVar('PKGD', True) + dri_drivers_root)
> > -    lib_name =3D d.expand("${MLPREFIX}mesa-megadriver")
> > -    for p in dri_pkgs:
> > -        m =3D re.match('^(.*)_dri\.so$', p)
> > -        if m:
> > -            pkg_name =3D " ${MLPREFIX}mesa-driver-%s" %
> legitimize_package_name(m.group(1))
> > -            d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
> > -            d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
> > -            d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
> > +    if os.path.isdir(d.getVar('PKGD', True) + dri_drivers_root):
>=20
> Use os.path.join instead of +
>=20
> > +        dri_pkgs =3D os.listdir(d.getVar('PKGD', True) + dri_drivers_r=
oot)
> > +        lib_name =3D d.expand("${MLPREFIX}mesa-megadriver")
> > +        for p in dri_pkgs:
> > +            m =3D re.match('^(.*)_dri\.so$', p)
> > +            if m:
> > +                pkg_name =3D " ${MLPREFIX}mesa-driver-%s" %
> legitimize_package_name(m.group(1))
> > +                d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
> > +                d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
> > +                d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
> > =20
> >      pipe_drivers_root =3D os.path.join(d.getVar('libdir', True),
> "gallium-pipe")
> >      do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$',
> 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends=3D'')
> > --=20
> > 2.7.4
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc8iwoACgkQN1Ujt2V2gByeQQCfQyVAr7VByuvdE5iTL3Dyx69p
zXkAoJr/xVqhr8YfqeVur6uhVzRbjZzn
=cV0s
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--
