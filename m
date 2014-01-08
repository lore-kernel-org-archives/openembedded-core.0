Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 12FE26D1ED;
	Wed,  8 Jan 2014 16:27:42 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so951611eaj.9
	for <multiple recipients>; Wed, 08 Jan 2014 08:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=M5MRYX9b4G7WBuNm+KE8e+c7a2+dif3nlcWf3mYB+8w=;
	b=a0YhoCumwksI0z8ZU2uB9/ap0Qbwk3kgXVwtvDkCubHAQhZzALDguVDQnYNQozKQSa
	0V2oWqm5eU5m7sR6PxHlQnItRadYXTW041Yd7+xBbVQ6be9x6D9fHrozMJkd6Ii4agJk
	okoCxaiXRmbzCYEyRCRrJ9MuETZBbhmDx5aLc/47NQIL2cBBR3qK+GDRpsvvKwmAPRp6
	Vndj+QYSpyx0f6UhdTQ0bWNAygCpqnZt/N2woyX3D0LduWhv1m0uWntRAWsTEUHYVwhV
	fekGsArzx/AeyAZXwZBGZx1JWa2U671ryARgn8LbHedYpTvX1GheRfoJArRRanFtMbyt
	w9UA==
X-Received: by 10.14.179.130 with SMTP id h2mr47230633eem.34.1389198463613;
	Wed, 08 Jan 2014 08:27:43 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm191106082eem.21.2014.01.08.08.27.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 08:27:42 -0800 (PST)
Date: Wed, 8 Jan 2014 17:27:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140108162753.GZ3709@jama>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<52B8DECA.6060704@balister.org>
	<CAJTo0LaEgLWZHk34e-_-+z69Zw3J+S1zGFFJAONjfYBDQ1TehQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaEgLWZHk34e-_-+z69Zw3J+S1zGFFJAONjfYBDQ1TehQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Poky Project <poky@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Piglit in Poky
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
X-List-Received-Date: Wed, 08 Jan 2014 16:27:43 -0000
X-Groupsio-MsgNum: 48715
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VOAkKSXG6MhRWuAn"
Content-Disposition: inline

--VOAkKSXG6MhRWuAn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2014 at 04:09:10PM +0000, Burton, Ross wrote:
> Hi,
>=20
> Despite a good start this thread got rapidly hijacked, so let's try again!
>=20
> On 24 December 2013 01:09, Philip Balister <philip@balister.org> wrote:
> >> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
> >> and pushes the boundaries of "core platform".  In a sense this is a
> >> repeat of the discussion we had with Midori...  does oe-core contain
> >> everything needed to sufficiently exercise the core components it
> >> ships or not?
> >
> > I expect Richard will push back on this, and I would support him here.
>=20
> Probably best to let Richard speak for himself here. :)
>=20
> >> 2) Add piglit and deps to meta-yocto.  Probably a new layer called
> >> meta-yocto-qa (or similar) because the Yocto Compatible guidelines
> >> forbid mixing distribution policy and recipes.  We'd need to sync
> >> meta-yocto-qa with the pieces of meta-oe that we want somehow, but
> >> that's our problem.
> >
> > So meta-yocto is right out. I'm a user of numpy, and I certainly do not
> > want to include something called meta-yocto-qa just to pick up numpy.
>=20
> Right, so my point with the syncing was that this meta-yocto-qa layer
> would be a copy of recipes from other places through combo-layer, and
> would be clearly marked as such.
>=20
> Reviewing the options:
>=20
> 1) Add python-mako, python-numpy, waffle and piglit to oe-core, for
> all BSPs to use.
> 2) Add python-mako, python-numpy, waffle and piglit to meta-yocto
> (effectively read-only clones with combo-layer, maintained in meta-oe
> still) for Poky to use.
> 3) Add meta-python layer to Poky, and waffle/piglit to meta-yocto
> (read-only clones) for Poky to use.

4) meta-python in meta-oe (at least for easier copy somewhere else with com=
bo-layer)

>=20
> Paul raises a good point about other BSPs potentially using Piglit to
> test their GL stacks.  Do any other BSPs test their GL integration,
> and if so what tooling to they use?  I'm only pushing for Piglit
> because it's what the Intel driver team use to test Mesa, but if
> nobody else wants to use it then that's an argument for keeping it in
> Poky (or even cloning it into meta-intel?).
>=20
> Ross
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VOAkKSXG6MhRWuAn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLNfIkACgkQN1Ujt2V2gBzgdQCfc8X7gaiEPdI5xtYCvOSAuEDQ
dEYAnjT2J7k1brLPMayj46T58EBT93fk
=Nf/V
-----END PGP SIGNATURE-----

--VOAkKSXG6MhRWuAn--
