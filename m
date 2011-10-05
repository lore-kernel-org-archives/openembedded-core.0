Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RBQlj-0004az-29
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 14:40:15 +0200
Received: by bke11 with SMTP id 11so2081011bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yEx4znfttD6fznL7zVMUQ2QbYF1JOb+IO0gVq7RbKaA=;
	b=j5wrZMImvCBttmIm6cPnS2TkSqzRH0RGPXhunYfiJA2ZFjcoxuZ8go5V6r5hQ2YjBU
	D6wBRhDGwC0oLixYKm972atcWzoEytpaDj1NNxWkjFBaeCqt29d3+Pj7z+y/3W4lSoY1
	f0FRu2heKA6CF/LKoZv+Y7kChnl3oZYXTj/cQ=
Received: by 10.204.150.80 with SMTP id x16mr1485406bkv.263.1317818080599;
	Wed, 05 Oct 2011 05:34:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm1714346bkn.7.2011.10.05.05.34.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Oct 2011 05:34:38 -0700 (PDT)
Date: Wed, 5 Oct 2011 14:34:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20111005123433.GG19366@jama.jama.net>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted>
	<20110930164658.GB7364@jama.jama.net>
	<1317402578.12332.218.camel@ted>
	<CAP9ODKqb8RGLi_5-_+uegLmtZ7Wo-70oDJcF_R6yaSJ2q9mGwg@mail.gmail.com>
	<1317765609.14671.118.camel@ted>
	<CAP9ODKrfDeDMomqeJCeyJBWqD_KqdMO=WBvjVY5d_j+btn3DfQ@mail.gmail.com>
	<11F8FF03-4C38-4D33-9250-66B5C180698C@dominion.thruhere.net>
	<CAP9ODKp5+nmtPfm+AabX5K9YoGnY_KVE6E1HxP=DJ2c+H2WdcQ@mail.gmail.com>
	<7F30A97F-D852-4A45-9023-D979D974866A@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <7F30A97F-D852-4A45-9023-D979D974866A@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Wed, 05 Oct 2011 12:40:15 -0000
X-Groupsio-MsgNum: 10535
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I3tAPq1Rm2pUxvsp"
Content-Disposition: inline

--I3tAPq1Rm2pUxvsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2011 at 07:29:10AM -0500, Koen Kooi wrote:
>=20
>=20
> Op 5 okt. 2011 om 07:27 heeft Otavio Salvador <otavio@ossystems.com.br> h=
et volgende geschreven:
>=20
> > On Wed, Oct 5, 2011 at 09:22, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> >> Op 5 okt. 2011 om 07:10 heeft Otavio Salvador <otavio@ossystems.com.br=
> het volgende geschreven:
> >>> On Tue, Oct 4, 2011 at 19:00, Richard Purdie
> >>> <richard.purdie@linuxfoundation.org> wrote:
> >>>> Really? hal doesn't really replace udev though, we can just use udev
> >>>> directly in place of it for many things now?
> >>>=20
> >>> Yes, many moved from hal to udev.
> >>>=20
> >>>> Specifically which applications are people using with dependencies on
> >>>> hal? As has been pointed out we can fix the xserver and that appears=
 to
> >>>> be the only thing remaining in OE-Core?
> >>>=20
> >>> OE-Core can be easily hal-less but I just ask for hal to not be
> >>> removed from meta data as I and probably others hasn't finish the move
> >>> to udev yet.
> >>=20
> >> Put it in your own layer if you need it. No point in keeping obsolete =
stuff in oe-core.
> >=20
> > I wouldn't call it obsolete as it is still a valid option to Xorg and
> > maybe others. So people might want to use it. I use it.
>=20
> So put it in your own layer, it has no place in oe-core anymore.

Agreed, that it has no place in oe-core anymore, but not sure if we can
keep
CONFIG_MANAGER_OPTION +=3D
"${@['--disable-config-hal','--enable-config-hal',''][bb.data.getVar('DISTR=
O_XORG_CONFIG_MANAGER',d)
in ['hal']]}"

in xserver-xorg or we'll force averybody with hal in his layer to
=2Ebbappend xserver-xorg too.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--I3tAPq1Rm2pUxvsp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6MTtkACgkQN1Ujt2V2gBzizACgiQQs7K75s5xLFmJn7EcO0W6X
XMwAn29/2EyaE7utOgFMDL/MB4gbd1+D
=1ulu
-----END PGP SIGNATURE-----

--I3tAPq1Rm2pUxvsp--
