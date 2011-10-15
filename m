Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RF1kz-0007UY-TK
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 12:46:21 +0200
Received: by bkat8 with SMTP id t8so3131226bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 03:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JQZvxK5VQHryQsCVRF2TWOmch6dZGRTL9wRF1hMbhuA=;
	b=c4CE3DRJLt5r+DhaTMV9cbPre52tPRSgnnl7/+dWKxdT4O+ST3imN/c85Lzavz6mgU
	I5e6SanWcB3P/+izKYgk/s/vnfxamQJhfrIUIHcIR8lchjylU50KtMfvw4HCh7Nrx4On
	y2EZz/3/XJjyE2FBflEX/iBYjpzRijZ3zQq90=
Received: by 10.223.62.15 with SMTP id v15mr10329073fah.22.1318675235705;
	Sat, 15 Oct 2011 03:40:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b10sm9558176fam.1.2011.10.15.03.40.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 03:40:34 -0700 (PDT)
Date: Sat, 15 Oct 2011 12:40:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111015104027.GA12684@jama.jama.net>
References: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
	<1318674260-8320-2-git-send-email-Martin.Jansa@gmail.com>
	<363ECAF1-8602-4139-ADC9-2044FCB5456C@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <363ECAF1-8602-4139-ADC9-2044FCB5456C@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Sat, 15 Oct 2011 10:46:22 -0000
X-Groupsio-MsgNum: 11068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 15, 2011 at 12:29:52PM +0200, Koen Kooi wrote:
>=20
> Op 15 okt. 2011, om 12:24 heeft Martin Jansa het volgende geschreven:
>=20
> > * this way we can use
> >  EXTRA_DRIMODULES_armv4t +=3D ",glamo" in meta-openmoko layer and
> >  EXTRA_DRIMODULES_armv4t +=3D ",foo" in meta-bar layer without knowledge
> >  of other modules in other layers in stack
>=20
> The above talks about 'MODULES', the actual patch about 'DRIVERS' :)

thanks for catching this.. I had it in meta-openmoko layer too :/

send new version simplified a bit more as nobody wants to disable swrast
and extra trailing ',' seems to be ignored fine

>=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > meta/recipes-graphics/mesa/mesa-dri.inc |    6 ++++--
> > 1 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-gra=
phics/mesa/mesa-dri.inc
> > index 795144a..4557bf8 100644
> > --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> > +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> > @@ -4,9 +4,11 @@ LIB_DEPS +=3D "libdrm expat"
> > # most of our targets do not have DRI so will use mesa-xlib
> > DEFAULT_PREFERENCE =3D "-1"
> >=20
> > +EXTRA_DRIDRIVERS =3D ""
> > +EXTRA_DRIDRIVERS_x86 =3D ",i915,i965"
> > +EXTRA_DRIDRIVERS_x86-64 =3D ",i915,i965"
> > DRIDRIVERS =3D "swrast"
> > -DRIDRIVERS_x86 =3D "swrast,i915,i965"
> > -DRIDRIVERS_x86-64 =3D "swrast,i915,i965"
> > +DRIDRIVERS +=3D "${EXTRA_DRIDRIVERS}"
> >=20
> > EXTRA_OECONF +=3D "--with-driver=3Ddri --disable-egl --disable-gallium =
--without-gallium-drivers --with-dri-drivers=3D${DRIDRIVERS}"
> >=20
> > --=20
> > 1.7.7
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6ZYxsACgkQN1Ujt2V2gBwYFwCfRnlKC8JTqlpHOMCeHUjjmpO3
Y68An1mTSZY3YcvvvWYgQWTHHQbKQti4
=JpBv
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
