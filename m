Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9CEAA74CB8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 16:27:09 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id n11-v6so3386899wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fTpXuilF9208877fXfTmwuugrosNNBlKOSzl01+kMVs=;
	b=WDk6xgIhbCOtmGoVMLUgoC53QFKSZEiJ2bFSMUy5MPfRPzBODPC2BIqmWFIKdQIYj/
	UTNeu6DSxwhdnZboqG2SckFfPFcYEoyGAW/WNxMZjfGABwh3kLLUv5yA9lRT6+c77/LN
	sBvCX0g+7LTmF/GzZrtYRvorcBPQKPsmSODURYFiI1RO4gY5rt0BxgqOj+EJmUq4nhuY
	UGLmP0r5Ctqt/j897c8mlkIzZh0yifmsviDrpC4BL+XEWnXZxcJyX1gbXs2QXpUUTRVl
	A1rjTauOmd/kQweQCOUUrb6Sh8otrYcrJew2NqAC3OQSMIKapOp0sOXrS3YM6M0KxWjg
	iBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fTpXuilF9208877fXfTmwuugrosNNBlKOSzl01+kMVs=;
	b=ttWGFSTGAK1N7tes0dTdFkSVx/7nyojXwtELpX2PviJN78G0pDFt7p2kgo1cabe+XU
	fbXGamB4w1zlf3CkfEGPso6ZF7eZIXCD70ULiW+Yu25nDOyyRgMnirDVwNq7vB7IkJ2G
	FsOleDhfeDhIHvQJ3OaEdXNvmQOt/YOGqtXrU+U052VX6c3++BtyRensNRdzHLeK+pHP
	nn1+1c2W86boqp9W/A9X78PQCjzKdpSqCzek6PboKv3jOGaYBtprDn23qEZvSW0OD2gW
	pvoYYYbWVwJT7eJA8KjOvEleO3i/F5EAmbuN7cjHhZUwaETpZRYPC3H00FNoEg8eixyI
	JBMw==
X-Gm-Message-State: AOUpUlFkqf+kkk8GnqTUAtrt5g8THlPUBMVRtA/uIA+457fJdyo+VTjq
	SAQaAVoglTO7hBo2Ajd0Grc=
X-Google-Smtp-Source: AA+uWPwREcz1u7tGkc7W3n6noHz0azc9YzGEzcwUU/oYHVv4BkBE4Tz4wNqZOhZmZk85uaMlubxHbg==
X-Received: by 2002:a1c:1182:: with SMTP id
	124-v6mr2368355wmr.75.1533745630376; 
	Wed, 08 Aug 2018 09:27:10 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j6-v6sm6008704wrs.91.2018.08.08.09.27.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Aug 2018 09:27:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Aug 2018 18:27:10 +0200
To: Eric BENARD <ebenard@free.fr>
Message-ID: <20180808162710.GA1418@jama>
References: <CABS_+k8mSL+Cnzz0jK=xovQHt_J_HL1m0Rhn6SD+y4FArzApEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABS_+k8mSL+Cnzz0jK=xovQHt_J_HL1m0Rhn6SD+y4FArzApEQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SRCPV / prserv problem
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
X-List-Received-Date: Wed, 08 Aug 2018 16:27:09 -0000
X-Groupsio-MsgNum: 114510
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2018 at 05:34:51PM +0200, Eric BENARD wrote:
> Hi,
>=20
> I have a strange issue with a recipe fetching from git for which I fix the
> HASH in a conf file :
> I'm using PRSERV_HOST =3D "localhost:0"
> The recipe has PV =3D "gitr${SRCPV}" so I expect the package numbering to=
 be
> handled by the prserv.
>=20
> If I add a SRCREV_pn-mysw =3D "1ad58b2488ce91ce4d0c4aae4189108b0281aae6",=
 I
> see in buildhistory :
> PV =3D gitrAUTOINC+1ad58b2488
> PKGV =3D gitr0+1ad58b2488
>=20
> If I then fix the hash to 6bd8208a0754a23b5437cb34a361fc22d7dc0c3b, I see
> in buildhistory :
> -PKGV =3D gitr0+1ad58b2488
> +PKGV =3D gitr0+6bd8208a07
> +PKGR =3D r0.0
> which is expected

Is this really expected? It should get gitr1 here.

> But then if I come back to the hash
> 1ad58b2488ce91ce4d0c4aae4189108b0281aae6, I see :
> -PKGV =3D gitr2+6bd8208a07
> -PKGR =3D r0.1
> +PKGV =3D gitr0+1ad58b2488
> and thus I have the package numbering going backward with a QA error.

This is expected, when it gets 1ad58b2488 which is already recorded in
the database it will return the old number.

That's for multiple builders using different SRCREV and the same PRSERV,
they should get stable AUTOINC numbers, not incrementing both of these
every time they ask PRSERV.

> Do you have any idea on what is causing this behavior and where to dig to
> fix this ?

Checking the sqlite database for recorded AUTOINC numbers and hashes is
usually useful starting point.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW2sZ3QAKCRA3VSO3ZXaA
HKMRAJ0eL1+qxmz7RN59dW6cuB3qkuE6OgCfdDNoCbVdBtJJFeqHERo37EXSAKs=
=Lka7
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
