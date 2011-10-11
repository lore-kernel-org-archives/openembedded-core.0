Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDWXW-0005bZ-4Z
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 09:14:14 +0200
Received: by bke11 with SMTP id 11so9540222bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 00:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HyXfCFqqOZik2lknpaDksxmKlzzvh46SgPGRq064FWQ=;
	b=i6dGQ79DunvuarAVPnVnKeCfEgX9OKJx77TrfGfqWvTbCnF6B3wEbuuHkYyReG9DVF
	tzPmzgoz+mLSGGHdD/ACfOAO7X1/XCskV+hBGE4ERhdOqtI+yK9xKyEtaWjlTJMCI4KI
	RdHs0o+DBCHozPMxuP0STUID040ri9AA2PdBk=
Received: by 10.204.145.15 with SMTP id b15mr8720739bkv.52.1318316909812;
	Tue, 11 Oct 2011 00:08:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d17sm20013953bkq.11.2011.10.11.00.08.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 00:08:27 -0700 (PDT)
Date: Tue, 11 Oct 2011 09:08:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111011070820.GB27073@jama.jama.net>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
	<A8FC601D-2A25-46D0-8AB0-3FE9E8561B01@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <A8FC601D-2A25-46D0-8AB0-3FE9E8561B01@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv3 00/31] Xorg related changes
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
X-List-Received-Date: Tue, 11 Oct 2011 07:14:14 -0000
X-Groupsio-MsgNum: 10786
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2011 at 12:40:08PM +0200, Koen Kooi wrote:
>=20
> Op 7 okt. 2011, om 19:05 heeft Martin Jansa het volgende geschreven:
>=20
> > this patchset brings meta-oe and oe-core xorg stuff together and most of
> > xorg recipes will be removed from meta-oe (sending another pull request=
 now).
> >=20
> > This step is needed to be able to separate common x11 to meta-x11 or wh=
atever later.
> >=20
> > The following changes since commit 808b3123e359f1aebabb8af44694275e4075=
e031:
> >=20
> >  gnutls: Disable p11-kit dependency explicitly to resolve build failure=
s (2011-10-07 15:40:42 +0100)
> >=20
> > are available in the git repository at:
> >  git://git.openembedded.org/openembedded-core-contrib jansa/x11-v2
> >  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Djansa/x11-v2
> >=20
> > Martin Jansa (31):
> >=20
> >  xserver-xorg-common: move RDEPENDS_${PN} +=3D xorg-minimal-fonts to
> >    shared .inc
>=20
> I have been running X images without minimal fonts for some time now, so =
AFAICS it can be dropped completely.

I'm also fine without (as it was in meta-oe and OE-classic), but it's
quite small:
276	KiB /all/xorg-minimal-fonts_1.0-r1_all.ipk
so I've kept it as it was..

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6T62QACgkQN1Ujt2V2gBw+7QCglfHvMLBlki7UbD8cUQEhyEHv
Hx8AniC24IatLNVqBz7aD6oB1ChMzy+k
=YZVI
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
