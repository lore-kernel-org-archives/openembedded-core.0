Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TEGIh-0001kk-2N
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 11:10:31 +0200
Received: by wibhn17 with SMTP id hn17so727326wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tPl+3cAAYtmWQjB0DqMfqhdN7DN7l92+PQhhTI7BBGA=;
	b=DxQRmeldsoa0kH1PY4KmtGTyNr9+N1IA6hWaVAeb7MOWSgrrbfrHJe9XO64F7b+SDj
	zmh6+YVVNpaagB02ej6N/zCLutL7ghPYHKt84RG4pz7h/wtpQYJsRSp3wooaLmreat1X
	Od6ddwr9xF2hQiO2CpLx/j9kFXz96QCRXkZtuGYUmBQF8Wr+8QZLdRcHdWHxUuRWqTic
	bIvMXqSV0MWxjogYukjVjb2SQsE9ldr1O6ZVoKknLCHvLEbYYoiAMCZHxUbWPP+xHwxk
	fZ3xDMUtFKMe9smMGnXymh6sT6XP7aP5+CUcZJ+EsQlCMiljOTBPXq9Go4MymG6JTuW4
	2r+Q==
Received: by 10.180.74.133 with SMTP id t5mr5506045wiv.2.1348045069984;
	Wed, 19 Sep 2012 01:57:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r9sm4006128wia.2.2012.09.19.01.57.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 01:57:49 -0700 (PDT)
Date: Wed, 19 Sep 2012 10:57:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120919085744.GE3498@jama.jama.net>
References: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
	<60C9B225-F04B-4B56-9137-C0F24872475D@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <60C9B225-F04B-4B56-9137-C0F24872475D@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Scott Garman <scott.a.garman@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [for-denzil][pulseaudio-updates 01/10] pulseaudio: disable tcpwrap by default
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
X-List-Received-Date: Wed, 19 Sep 2012 09:10:31 -0000
X-Groupsio-MsgNum: 29516
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EgVrEAR5UttbsTXg"
Content-Disposition: inline

--EgVrEAR5UttbsTXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2012 at 07:57:00AM +0200, Koen Kooi wrote:
> So Scott asked me to explain why these pulseaudio updates are needed in d=
enzil, and it's mainly because of udev. The old bluez is using deprecated u=
dev API that went away in newer releases and I'm trying to get a more recen=
t udev into meta-oe to fix bugs people have reported.
> I must admit that pulseaudio 1.x to 2.x is a big step, so patch 7 through=
 10 are questionable and could be replaced with backporting the udev api fi=
x from git. But I opted for cherry-picking from master to leverage the oe-c=
ore QA.

I'm not using denzil, but something like this could help in meta-oe
http://git.openembedded.org/meta-openembedded/commit/?id=3D9e2751773cd523b3=
38d7962030356a1bce327174

> regards,
>=20
> Koen
>=20
> Op 17 sep. 2012, om 14:07 heeft Koen Kooi <koen@dominion.thruhere.net> he=
t volgende geschreven:
>=20
> > From: Saul Wold <sgw@linux.intel.com>
> >=20
> > This ensures that tcpwrapper usage is always disabled, this was
> > inconsistent because it would test for libwrap and sometimes enable
> > and sometimes not.
> >=20
> > This ensures consistent build reproducibility.
> >=20
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> > meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 +
> > .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
> > 2 files changed, 2 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/r=
ecipes-multimedia/pulseaudio/pulseaudio.inc
> > index a653af5..a2f0d9f 100644
> > --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > @@ -31,6 +31,7 @@ EXTRA_OECONF =3D "\
> > 		--without-hal \
> > 		--disable-hal \
> > 		--disable-orc \
> > +		--enable-tcpwrap=3Dno \
> > 		--with-access-group=3Daudio \
> > "
> >=20
> > diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/met=
a/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> > index fd61149..d2ed3c8 100644
> > --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> > +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> > @@ -1,6 +1,6 @@
> > require pulseaudio.inc
> >=20
> > -PR =3D "r8"
> > +PR =3D "r9"
> >=20
> > DEPENDS +=3D "libjson gdbm speex libxml-parser-perl-native"
> >=20
> > --=20
> > 1.7.7.6
> >=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EgVrEAR5UttbsTXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBZiQgACgkQN1Ujt2V2gBzbogCfdN2jyOVV9aoScU61xznuOVAA
9GIAnj75HYFlYZs7rOuTS3WpJr8i1RB9
=uKFr
-----END PGP SIGNATURE-----

--EgVrEAR5UttbsTXg--
