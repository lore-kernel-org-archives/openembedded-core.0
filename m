Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF9A617EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 12:46:28 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v4so1714398wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 04:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=p+yGFYH9vCfGcV4oOpKgIpdTHbC6ZbCTSF6PLm1TeC0=;
	b=RIsr0z+ObyJI4s7lzPydDlG+gYjIlUDDUSoAMLDbhuMonnTxKkunXgs5KN1Ol88Pr2
	VlII278ueNExtLqmXkc68pqseguGoPUQLeM2kaDpohLbtmSIRR9eSoJRHxhJ0h+Ww+UA
	lK/Z736oVO9fq6Tp0n4AwxtkQf3yj/9YxKU5FTCJHm1lPhK4pgeMS+pDbcX8k2OTBaOc
	uFgOOZkZoWqCRqa7//yA9lH5NDRMjM9UIQBhOk0nC7CcIWBPF8Ny/YrCgFCEZ8gxqXMq
	QrouuTK3CvquV4AKqoJqMiD3NsS/3YWWIupZT8UmuSeaZt1LL4cioB/c4lFPMkUXaEhQ
	BQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=p+yGFYH9vCfGcV4oOpKgIpdTHbC6ZbCTSF6PLm1TeC0=;
	b=OaWCUXsCg8Er2rSbELbHfGo1jkGLeYkclU7fu21THxL9as0glIx/i4DorK5hsoI2KW
	j/3gv5Khj2gbX+L6mscROZPiQ9uwEI8dAPWO/4hARtxqvtFBgmSZFPgrdKMg5f6637dY
	RBA95QTbujRdd/lHLbggXpKwhdFxaMzFq3JYO79uM7eQu+C0I8CbzeqVYAAyv0unYXSN
	ejZ7v0QD2moPqXulhLNZJHA1R1+tasOCCFdeTrPf8BUgCZqtzCGHsmaZ+BAVDDm1uQcE
	3R8lZNDcc0rZcxceyPXq5QsGzH11Su841VDUEH7TlTp6m8M2MZKojzi7CPL57aftQnKh
	xqHA==
X-Gm-Message-State: APjAAAUnl8Dj/nzKUMPAgH0zJYsM8qRRsK5dTRE7uSdopTJHx6oJkcCK
	EmiTxQZLsEMVLy8EYEPteco=
X-Google-Smtp-Source: APXvYqzCqRJ5DHj9v9eBvXFfpIutgJamOp0Ugo4hiyld7DokjNPYr6tfVSQjHOWMLZJjGLGqRngKJg==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr69772762wru.427.1582634788914;
	Tue, 25 Feb 2020 04:46:28 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	q125sm3500794wme.19.2020.02.25.04.46.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 04:46:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 25 Feb 2020 13:46:27 +0100
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20200225124627.23tpu5eknidqxrg3@jama>
References: <20200223182933.6168-1-bunk@stusta.de>
	<fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
	<20200224104635.GA27036@localhost>
	<20200224140801.GC27036@localhost>
	<CANNYZj91N68ocXm=UKzcH6U7nEnVLuQzDStR3O0_cO3GsY9uag@mail.gmail.com>
	<20200225111955.GA13902@localhost>
	<CANNYZj-VbMxS52x78goiAA3jvKnyRQiyxd8G5TfEKZ8hBSXdDA@mail.gmail.com>
	<20200225123807.GB13902@localhost>
MIME-Version: 1.0
In-Reply-To: <20200225123807.GB13902@localhost>
User-Agent: NeoMutt/20180716
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
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
X-List-Received-Date: Tue, 25 Feb 2020 12:46:28 -0000
X-Groupsio-MsgNum: 135574
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhgs3zpbufdi2j4p"
Content-Disposition: inline

--zhgs3zpbufdi2j4p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 02:38:07PM +0200, Adrian Bunk wrote:
> On Tue, Feb 25, 2020 at 12:32:55PM +0100, Alexander Kanavin wrote:
> > I would probably look into how
> > REQUIRED_DISTRO_FEATURE/ANY_OF_DISTRO_FEATURS is actually implemented, =
and
> > see if you can convince it to do the right thing, or maybe write a cust=
om
> > re-implementation.
>=20
> I did already check meta/classes/features_check.bbclass, there is no=20
> obvious simple way for expressing more complicated dependencies.

Doesn't this do what you wanted?

REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayl=
and', 'wayland opengl', 'x11', d)}"

>=20
> The low-effort way forward will be to keep opengl required even for x11,
> with a comment why.
>=20
> > Alex
>=20
> cu
> Adrian
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--zhgs3zpbufdi2j4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXlUXIgAKCRA3VSO3ZXaA
HOznAJ4oy/fvjuS3JY6dBqbUs0McsXNStwCfThet+cNxytlnKzAViW2hhnRSsP8=
=twDE
-----END PGP SIGNATURE-----

--zhgs3zpbufdi2j4p--
