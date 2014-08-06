Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 44B2865CC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 09:03:29 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so2307345wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 02:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J31e01Ew5b37Z5NNnNPc+0PytAnx+iNxPpJrWcswkWw=;
	b=jFsOY8eN4F6BRRmOwgZKSncMCxwbnn5gOfqSrLwOINnDOXjmUJRIzFkm38mq5+0aD7
	jthV8YWr3/rGKaEcs+54MiXm3z0Et0nWIWAeXX7/V3Ahjx4rrgU9RlfXvRr3Pchip1OG
	4K2vr+2h5dKdpkIBV6e8f5/fanA9LawyY2uSAIFc1B3YQJ2txFi18bHHBxw+CvRbBqbA
	q5K10+JGShh99zWK2x9XoZNH9yAOp8XT+07PAjmrEs2uo1MvQqWIcQqaYDdQdVD0vfhJ
	QOFV9ZG60yANYCziti1wnBWLZa0tob+lklLZ40PbNazikOKxo83pA4wA4mFqTS2j/g8C
	zlaw==
X-Received: by 10.194.84.69 with SMTP id w5mr14399728wjy.0.1407315810818;
	Wed, 06 Aug 2014 02:03:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o2sm16206139wij.24.2014.08.06.02.03.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 02:03:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 11:03:59 +0200
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20140806090359.GD14848@jama>
References: <alpine.LFD.2.11.1408060435001.1524@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1408060435001.1524@localhost>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is the proper way to define a blacklist?
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
X-List-Received-Date: Wed, 06 Aug 2014 09:03:37 -0000
X-Groupsio-MsgNum: 56038
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline

--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 04:39:29AM -0400, Robert P. J. Day wrote:
>=20
>   from blacklist.bbclass:
>=20
> # To use the blacklist, a distribution should include this
> # class in the INHERIT_DISTRO
>=20
>   the only way i see that class being inherited is with the simpler
> form:
>=20
>   INHERIT +=3D "blacklist"
>=20
> even in distro conf files, except in defaultsetup.conf, which uses:
>=20
>   INHERIT_BLACKLIST =3D "blacklist"
>=20
> so should that comment be adjusted? what should it say?

That it's included by default.

see oe-core/74e377eeb6de606b99ed0ff840922261f4a27abc

>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPh738ACgkQN1Ujt2V2gBxw5ACaA1uKozKMYgW5F68dnLmSsT98
xCEAn2o5gAKGtMqQdpTjrgFxtxWRzVsU
=nIcX
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
