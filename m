Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGrtB-0001Al-Di
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 15:42:57 +0200
Received: by wibhn17 with SMTP id hn17so627578wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 06:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SLFjBiYEhSWkL8IOWt5NUma9rMmkLQWNhNWA/0AAbgY=;
	b=OFQ70nt7X9GUUoBjaZN4NlZovEK73rfsvL+l3ZiJo+8br787bMiycZgdEgRsioPYzp
	GPTcGIgmey/4Kbbptlj9PeUqrnM8MRKYJwCFQPeS0bSRZGoKwSZ8OiFIMy1Go/Pttilk
	d8nwmSEsOGakbSvRWU9gQfjwj1k2byfs7q1GBIh9Clgz794iQVkuGRaIicY/2CPJOKJP
	UtsRT1yQGoaIMiL1MlFw51gEio3PL9DQOXZkR6/v8ID++QazIGyMyn7Mg35obe5jQXrl
	ECd04jfC0pCCRb3kp6UDFtwQnZtGYEulBsxxUfNw5gCaLc9ylC+J1Qk+U5s2c/bKKXIJ
	fGFQ==
Received: by 10.180.83.234 with SMTP id t10mr1556847wiy.7.1348666207133;
	Wed, 26 Sep 2012 06:30:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm25669599wiz.4.2012.09.26.06.30.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 06:30:05 -0700 (PDT)
Date: Wed, 26 Sep 2012 15:30:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120926133013.GM3313@jama.jama.net>
References: <1348659245-14209-1-git-send-email-paul.eggleton@linux.intel.com>
	<2280743.CHvCEmHVFs@helios> <20120926123257.GK3313@jama.jama.net>
	<1985929.Ib8AKayW0V@helios>
MIME-Version: 1.0
In-Reply-To: <1985929.Ib8AKayW0V@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer: make pulseaudio support dependent on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 26 Sep 2012 13:42:57 -0000
X-Groupsio-MsgNum: 29919
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Aaj1jBvBEV7KRjLi"
Content-Disposition: inline

--Aaj1jBvBEV7KRjLi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 02:24:07PM +0100, Paul Eggleton wrote:
> On Wednesday 26 September 2012 14:32:57 Martin Jansa wrote:
> > On Wed, Sep 26, 2012 at 01:31:10PM +0100, Paul Eggleton wrote:
> > > On Wednesday 26 September 2012 13:38:19 Martin Jansa wrote:
> > > > On Wed, Sep 26, 2012 at 12:34:05PM +0100, Paul Eggleton wrote:
> > > > > This should be no change to the previous situation unless you
> > > > > explicitly have pulseaudio in DISTRO_FEATURES_BACKFILL_CONSIDERED
> > > > > (currently).
> > > >=20
> > > > Why not use PACKAGECONFIG for this?
> > >=20
> > > Only because I didn't see the need complicate it just to be able to
> > > configure it on a per-recipe basis - you almost certainly want pulsea=
udio
> > > either on or off everywhere. If you want it for stylistic reasons, su=
re,
> > > I guess... it is a bit ugly though.
> >=20
> > Well it looked to me like ideal use-case for PACKAGECONFIG.
>=20
> It does encapsulate the DEPENDS and EXTRA_OECONF into one piece, yes, but=
 then=20
> when you make the PACKAGECONFIG option set from DISTRO_FEATURES anyway it=
 gets=20
> ugly, and here I'm not convinced it adds anything useful.

Yes, but that's the case for almost every other PACKAGECONFIG use in
oe-core too AFAIK and I was asked to convert similar commit to use
PACKAGECONFIG before so I was expecting that the ultimate goal is to
replace all such DISTRO_FEATURE tests with PACKAGECONFIG where possible,
not to add more of them.

Cheers,

> FWIW, this also matches how the same configuration is implemented for Qt.=
 If we=20
> want to switch everything over to PACKAGECONFIG later we can with no pena=
lty.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Aaj1jBvBEV7KRjLi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBjA2UACgkQN1Ujt2V2gBw8/QCdHItT9C7g1QbkVz1YqRL9o6yo
19IAoJ16Y/EB1nnF8nbgroKIOcT9r9Xl
=dNJ+
-----END PGP SIGNATURE-----

--Aaj1jBvBEV7KRjLi--
