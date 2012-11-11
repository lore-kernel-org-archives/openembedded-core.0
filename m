Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TXdnG-0004zP-Qp; Sun, 11 Nov 2012 21:06:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so200549eei.6
	for <multiple recipients>; Sun, 11 Nov 2012 11:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0VvcmWQOsO0jIXRUa8zhkuBOAkCCd4xmZJWjDp5vPK8=;
	b=Jdg5IxHpkZkyLCshGXHfJ1jp4SPTcEm3X2v+rVG9hASTc+wSJwBUQ2579eSFVbpvg/
	7LPknwJr1NdHIKIbNJIGSkrAXhpMWus9uz5Apo/2suf9QOy3EB+kJNnnYDeBUy2eXe52
	87aFW+dz1/7qMJsOrAioLI5eUiUffnTLX2g+m7RkSnsIqkDYroZau98d8wz+zGtydgwX
	8iK2n3uunOtCNM9vRiK2yDf69LLnlGQCOATL1s0Z+SICWmnxxTlXknOhgiD7fskoAVVs
	OGL1Tj1qaz2pZSrdHby3gdq5i7sYJM/lokyJ6D0DEPhKi5+49emJzrTdDnyjM1gYy+N1
	ZLJA==
Received: by 10.14.213.65 with SMTP id z41mr55742204eeo.29.1352663538982;
	Sun, 11 Nov 2012 11:52:18 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm11715248eeo.7.2012.11.11.11.52.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Nov 2012 11:52:18 -0800 (PST)
Date: Sun, 11 Nov 2012 20:52:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121111195226.GA3407@jama.jama.net>
References: <12301427.Yf0uchSh3U@helios>
MIME-Version: 1.0
In-Reply-To: <12301427.Yf0uchSh3U@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: OE-Classic recipe migration status
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
X-List-Received-Date: Sun, 11 Nov 2012 20:06:11 -0000
X-Groupsio-MsgNum: 31199
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 11, 2012 at 07:11:28PM +0000, Paul Eggleton wrote:
> Hi all,
>=20
> Whilst the OE-Core-based layer landscape has grown quite a bit over the l=
ast=20
> year and we now have a wealth of clean and up-to-date recipes, I've heard=
 a=20
> few people commenting that we've still lost quite a few recipes along the=
 way.=20
> Nobody who did make that comment has seemed to be able to be specific abo=
ut=20
> what they thought we were missing however, so I figured it would be worth=
=20
> trying to determine exactly which recipes are only available in OE-Classi=
c.
>=20
> With the help of some scripts I've produced a list of the recipes, made s=
ome=20
> notes and categorised some of them. I've published the list on the wiki=
=20
> (unfortunately I had to split it into two pages since it was too large to=
 put=20
> into one):
>=20
>  http://www.openembedded.org/wiki/OE-Classic_Recipes_A-I
>  http://www.openembedded.org/wiki/OE-Classic_Recipes_J-Z
>=20
> I don't know much about a lot of these recipes, so if you can help to fil=
l in=20
> the gaps particularly by marking the obsolete ones as such or adding othe=
r=20
> comments, that would be great. Either edit the pages directly or make you=
r=20
> comments here and I'll merge them.

I've noticed quite a few recipes listed here, which does exist in some
layer (recipes mostly from meta-fso, meta-aurora, meta-shr), should I
remove them from that wiki page or add layer name in 2nd column?

Cheers,

> Using some more hacky scripts to break down the recipes into groups, I've=
=20
> produced the following numbers (with the incomplete data as it stands):
>=20
>    1484 other
>     218 BSP
>     211 BugLabs
>     195 libs
>     193 obsolete
>     155 obsolete directory (OE-Classic)
>     136 PERL
>     119 python
>      92 distro
>      89 tasks
>      84 nonworking directory (OE-Classic)
>      80 GPE
>      79 X11 drivers
>      59 images
>      59 games
>      41 fonts
>      23 security
>      20 in another layer
>      18 pending
>      11 EFL
>=20
> So clearly there are quite a few recipes left that could be brought back,=
=20
> assuming there is demand; on the other hand there are a significant numbe=
r that=20
> can probably just be discarded. For those that are still of interest, we =
need=20
> motivated individuals to do the migration and maintain the recipes going=
=20
> forward.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCgAfoACgkQN1Ujt2V2gBwtfQCgs/gvlO+viXkCXMS8E//72Y+K
h7QAn3XINZ8Ykr63CRV1huR+ZSgH8Ns6
=Tl+O
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
