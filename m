Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAzFu-00047g-Cw
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 09:17:34 +0200
Received: by bke11 with SMTP id 11so292863bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 00:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=faQalTYZeuOQDSw1diPAkbDvyaq/AgRQyNr741Zwzkk=;
	b=BIRTdbxXV3AjRSmyIZu2XPrYbzhzABhYqwCzI1DXaEoeVgtr7FzrI8DPuJsE5ZDNoZ
	EEaxXi6dJ6ceK76zUz5RPkcnqevNj5XNinHAzPxnrQRAhUaIncN3A/RXt2ypPHDfUMNc
	M5q4uEbcLuHDI0po4mz5RctJD/gisvQf4ZHek=
Received: by 10.204.135.73 with SMTP id m9mr455607bkt.340.1317712320040;
	Tue, 04 Oct 2011 00:12:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm11799304bks.1.2011.10.04.00.11.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Oct 2011 00:11:58 -0700 (PDT)
Date: Tue, 4 Oct 2011 09:11:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111004071152.GA19366@jama.jama.net>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
	<c341f97c3102144d6ae36e6669c69905ac9de240.1317367429.git.Martin.Jansa@gmail.com>
	<4E8A169A.5080207@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4E8A169A.5080207@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 02/13] xserver-xf86-dri-lite: remove COMPATIBLE_HOST
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
X-List-Received-Date: Tue, 04 Oct 2011 07:17:34 -0000
X-Groupsio-MsgNum: 10461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 03, 2011 at 01:10:02PM -0700, Khem Raj wrote:
> On 9/30/2011 12:27 AM, Martin Jansa wrote:
> > * ie om-gta02 has mesa-dri module too
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   .../xorg-xserver/xserver-xf86-dri-lite.inc         |    3 ---
> >   1 files changed, 0 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.i=
nc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
> > index 093e049..2e35917 100644
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
> > @@ -10,6 +10,3 @@ EXTRA_OECONF +=3D "\
> >                    --with-pic \
> >                    --with-int10=3Dx86emu \
> >   "
> > -
> > -# Due to mesa-dri
> > -COMPATIBLE_HOST =3D '(i.86.*-linux|x86_64.*-linux)'
>=20
> how about powerpc and mips ? they will also become supported with this=20
> change have you tested that

Haven't tested it but iirc building dri extension worked even for
powerpc and mips in OE-classic and because xserver-xf86-dri-lite get's
default later in this patchset I think it's better without
overrestrictive COMPATIBLE_HOST.

And as the comment says, the restriction should be in mesa-dri if
somewhere (at least only in one place to .bbappend my COMPATIBLE_HOSTs
in layer).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6KsbgACgkQN1Ujt2V2gBwM9QCgmB6YM0Bu5ftRgZbDfHcKI8lO
nOIAnAtThGj5cv/5BQ5wV+y7M+7n9MhN
=DNTO
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
