Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2536BA11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 08:55:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w2so20009066wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JFfvXTvmiVaYUp/TjABA/FRR/glPSdg09rc9u6hTqRQ=;
	b=aXfnxNT7O88vYNSBBpPtW1MOWw9XIkWCeUexHqqxAUUFuR0wLAziFzqiQ1hJbTPdto
	FnyYQwi5dBfaE3icXmJayQyWhv8uKyzmpQKLGuESs4X08aMTZVhtHGflAKKiidZaH62j
	uE+4TUaqHx7qqmNQ39cnljwnA91WDYudOCh7RWrJFxeGF5nnhGAKAmKLIYYi7mqamH3s
	Ax2HYfkphTXfLxJNaJMDh5ZO2lWBWtLY/QJA0s7HvHWPcoMFh1CynvTOJmGG/D4q+gyG
	N+v9POwr/M2lgGlfQtJ/z9LbaMrrHv7nrOFwnR02G99o1476KEewVQ4pilE9yl4AHTzU
	m2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JFfvXTvmiVaYUp/TjABA/FRR/glPSdg09rc9u6hTqRQ=;
	b=PLWnR0omXtK9WQN+zD7JJccvQ8t4xoAKhpdWD6cGygrKPuQzrM5lotDOuOOLZR7h8k
	W1raSzeNGvIHuBUyw7gR+RVE44aserSUl/yzkuB8aP3+i9FEQ72iJR2LEwQJdtphLpTP
	TyLqfgJ60D7RWeQ+FxIEnkXvsCc6TYvIm48AvSCDmCjLkFBWTwPKHBqZ+pOWGR1OsLdt
	NEEcpWINyu2TAfDkxdmr93KXpUI5wD+LZCgMXQsON3ysc0vPzyU6dDH73o2aZGZ4En4N
	4/b5mhDKIK0rPDd89zt06Mj9GSVpjGYL7fcSiIYxduYh9z+HCepajGjWsbObxPfFV1S0
	RbWg==
X-Gm-Message-State: APjAAAU4yglinAY3xy6x2GFRsHSqXlDpMkySZzANtH74691j5yrZc5me
	wDXzV5Nr4oSgl6Ek1ii1WgI=
X-Google-Smtp-Source: APXvYqzGy1YCqfE2Ml7o8ZQf84BAhjj8LAoahTe994/9A590qCRN9pYDfZdhztWLjOiVUqKmOhbY3A==
X-Received: by 2002:adf:b3d1:: with SMTP id x17mr15926593wrd.15.1552985729264; 
	Tue, 19 Mar 2019 01:55:29 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	j13sm11632607wrx.74.2019.03.19.01.55.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Mar 2019 01:55:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Mar 2019 09:55:32 +0100
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190319085532.GF1994@jama>
References: <cover.1552962581.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1552962581.git.akuster808@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/26] thud patch review
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
X-List-Received-Date: Tue, 19 Mar 2019 08:55:28 -0000
X-Groupsio-MsgNum: 122395
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ChQOR20MqfxkMJg9"
Content-Disposition: inline

--ChQOR20MqfxkMJg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2019 at 07:36:29PM -0700, Armin Kuster wrote:
> Responses should be made by Wed March 20th 22:00:00 UTC 2019
>=20
> The following changes since commit f5a57e939e626a5b7c6de5b51799ca602ed355=
ed:
>=20
>   mesa: ship /etc/drirc in mesa-megadriver (2019-03-05 22:24:13 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib stable/thud-next
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/thud-=
next
>=20
> Alexander Kanavin (1):
>   ca-certificates: upgrade 20180409 -> 20190110

This depends on openssl >=3D 1.1.1 since:
https://salsa.debian.org/debian/ca-certificates/commit/d5e425c8405448e5034d=
1e16ca52be6a10cb3334
some people might not use new openssl with thud.

More detail in:
http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280234=
=2Ehtml

Cheers,

--ChQOR20MqfxkMJg9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJCugwAKCRA3VSO3ZXaA
HLqDAKCs86jdNdC5gGrRiBe0IiMwHBqf/wCfWCxdwuWFJplQNY4QGUCYGnNrkeU=
=ZNSq
-----END PGP SIGNATURE-----

--ChQOR20MqfxkMJg9--
