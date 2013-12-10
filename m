Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0507C6DB5B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 14:35:12 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e53so2288841eek.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iEUEaU20dkvsnFgrjImdWHQIzvK2ie0Cna8RR3S6alQ=;
	b=y614V2lZIbZMcId7SGxuClu8Zwstf209GY2KJaHBRbHp7UgWqoqw9/pI6kJCGhLw5J
	ucQpGx+McgbOa0vCcikZUqz6KI6LPVG9E/qo/tgjLGWmsEoFMKfWOFc+rVfi/R9JXMIQ
	DZWPR9WnFEzg6qgVjarqus0PrAIdgdeyv3IX6XhVCXlYkbIvhywvK46wWaRmIMKsYbLu
	vNiRYFYb46sdJdtm247YUAIPkk+WQfdwZFGz2hRJ8gUik1Y4DR9cVOiu5zwDPl8912AR
	HnCjOCFRmOFkaEx4POmoMLRVxdphLxKLvrvnVoGBr6y4ggOHDsjNXVk6AvnQA4IBwwOo
	RDrQ==
X-Received: by 10.15.52.197 with SMTP id p45mr8932864eew.98.1386686112198;
	Tue, 10 Dec 2013 06:35:12 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a45sm41889994eem.6.2013.12.10.06.35.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Dec 2013 06:35:11 -0800 (PST)
Date: Tue, 10 Dec 2013 15:35:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
Message-ID: <20131210143530.GF3721@jama>
References: <20130420225659.GM2489@jama> <20130420232835.GN2489@jama>
	<8672BB614B4CCA40A6B3BDD6FD82050B4D568A9C@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B4D568A9C@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: bash-completion
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
X-List-Received-Date: Tue, 10 Dec 2013 14:35:14 -0000
X-Groupsio-MsgNum: 48068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V32M1hWVjliPHW+c"
Content-Disposition: inline

--V32M1hWVjliPHW+c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2013 at 09:37:14AM +0000, Matthieu CRAPET wrote:
> Hi,
>=20
> What's the status of this ? Is bash-completion recipe available somewhere?

I don't know about any change since my question.

Are you talking about bash-completion definition for bitbake, right?

I wasn't asking about recipe for "generic" bash-completion.

> -----Message d'origine-----
> De=A0: openembedded-core-bounces@lists.openembedded.org [mailto:openembed=
ded-core-bounces@lists.openembedded.org] De la part de Martin Jansa
> Envoy=E9=A0: dimanche 21 avril 2013 01:29
> =C0=A0: bitbake-devel
> Cc=A0: openembedded-core@lists.openembedded.org
> Objet=A0: Re: [OE-core] bash-completion
>=20
> On Sun, Apr 21, 2013 at 12:56:59AM +0200, Martin Jansa wrote:
> > There is old thread on oe-devel about it=20
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-December/
> > 003764.html
> >=20
> > Is there any reason why it wasn't added to contrib yet?
> >=20
> > Would it be applied if I send git patch adding it and update commands=
=20
> > to include cleansstate and packagedata + new options like -S and maybe=
=20
> > more?
>=20
> Or maybe in oe-core/contrib, as list of possible commands is not defined =
in bitbake.
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V32M1hWVjliPHW+c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKnJrIACgkQN1Ujt2V2gBztrACgr/HPSyQE6BGQvafnCNNI/Bb7
GNYAn1k9ESbKv6SYWcyvBcDeefq/Mq/7
=GSVz
-----END PGP SIGNATURE-----

--V32M1hWVjliPHW+c--
