Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1390C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:59:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.115722.1738673977135272545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 04:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JfOQeQbA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC091442D7;
	Tue,  4 Feb 2025 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738673975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9X/57+toOkFht0F52aMXx3Ub5yf/1MrRGdwSzgVN7Kw=;
	b=JfOQeQbADtUQeXAott5UquQkS2LzBSEnnr87mm/pDGrpClhkfYxqLNlSZOSj8kEwEFVtVT
	ilt3UE9khTQ5d7Vjh8GHlLdXyGTeuTOS4300peDqvD5Ugjip2LOy+t7e/H/96tWrHCD92O
	y3hKUjnOKi78dniSa+etHWdeFNHtVdCdb2lBhxZXk9FQpMuz8g8wjvWwDrqFRSbq8PkOfn
	6LdPtnjoJ7iDgVI/gwKf9oxZLYvLPKi5j0vaCLeDHaoCIQsejj4vZ9+1CcsLpaO8jhFAk4
	7nikMmytVWK4voDefI0TQYfzEjDv+mxcQEh2yJmIJ+A+kuyBP/fRewh/pvJBSg==
Message-ID: <b8b405601deb235947cde5aaa002752d49b10c5b.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] u-boot: Convert ${UBOOT_ENV}.cmd into
 ${UBOOT_ENV}.env
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: adrian.freihofer@gmail.com, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Cc: thomas.perrot@bootlin.com, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 04 Feb 2025 13:59:33 +0100
In-Reply-To: <CAB3asfia=NPV8QJjfpS7jxrk1UJEVoZxNV0YUV8zYAUXQp58nQ@mail.gmail.com>
References: <20250128145736.2258098-1-thomas.perrot@bootlin.com>
	 <93d70055fbc62dd0dc765f2d2bd471b73f35df9d.camel@gmail.com>
	 <43a26c5d6a85866fbf86dfacd5a034416abbd636.camel@linuxfoundation.org>
	 <CAB3asfia=NPV8QJjfpS7jxrk1UJEVoZxNV0YUV8zYAUXQp58nQ@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-AlsjcQROXT7LRE0TJ89X"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomhepvfhhohhmrghsucfrvghrrhhothcuoehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugeetiedvhfevieekvefgffdvgfdvudeffeeftdekffelieeigeetvdeivdeltdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvgedtngdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvrhhrohhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprggurhhirghnrdhfrhgvihhhohhfvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpv
 ghrrhhothessghoohhtlhhinhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 12:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210784


--=-AlsjcQROXT7LRE0TJ89X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, 2025-01-29 at 23:48 +0100, Adrian Freihofer via
lists.openembedded.org wrote:
>=20
>=20
> Richard Purdie <richard.purdie@linuxfoundation.org> schrieb am Mi.,
> 29. Jan. 2025, 23:39:
> > On Wed, 2025-01-29 at 23:11 +0100, Adrian Freihofer via
> > lists.openembedded.org wrote:
> > > Hi Thomas
> > >=20
> > > On Tue, 2025-01-28 at 15:57 +0100, Thomas Perrot via
> > > lists.openembedded.org wrote:
> > > > From: Thomas Perrot <thomas.perrot@bootlin.com>
> > > >=20
> > > > It is U-Boot environment files that contain environment
> > > > variables
> > > > in a binary format, that enables compact data storage and
> > > > allows
> > > > for faster loading and processing by U-Boot.
> > >=20
> > > I'm honestly not able to understand the intent of this change
> > > from this
> > > commit message (I'm not a native speaker). But the u-boot and
> > > fitImage
> > > related code is already quite complicated because there are so
> > > many use
> > > cases that might be supported somehow. So it would be very
> > > helpful if
> > > changes were submitted with a clear description of the use case.
> >=20
> > I'd add that for new branches in the code like this we really need
> > new
> > test cases too.
> >=20
> > Here is a branch doing this for the already supported scr script
> > type:
> > https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/fitimage-tes=
t-uboot-env
> >=20

Can I help you with anything?

Kind regards,
Thomas

> > Adrian
>=20
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210420):
> https://lists.openembedded.org/g/openembedded-core/message/210420
> Mute This Topic: https://lists.openembedded.org/mt/110859777/5443093
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> thomas.perrot@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-AlsjcQROXT7LRE0TJ89X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmeiDzUACgkQn8ALBXH+
Cu2ycgv+I8gkdQ4HS6EF9yweTK8NcMbSN/0kQDLHB6L9mpa1IUOWLJvmpD3cSaPO
5ommF4f4ugDyRV1ilzQTbEXH1wGmGfrsnI7jBf7aJXN3CXuh0VH1yodgLo/5ddIp
kPQd4YVavJUabYd/NykcVqYe9BmNjEwHDXlowEUwv0iBzidNIK3qDr1PqRAIiDSi
TUvcBPUj9FA54Z58+cy80fFg1Uj/9aAn0m3V1tRmt9o3QYAxXx2sTsUHzJQlstQg
cc4G8YL5h1rfu+jqpuuknUDBm2LBS10dJh/+NZThgTIvPqZzkuw6MP34GYnwuatN
bPWIkiyGwJ/1SRPBzJbh0XirSyBNYNWHoSziUqywnHKw1nLLGoxLqNNjW+oV8S30
7LbnxCTOyKg8rn3vW51MnIbnwIQdYlrq54kF2bNkQN2SXt9n7PVvV1ASkjy1ckwZ
otj6CE0bFvsDoRbP79TA1daux64oaEsp9pJH8Y8WyWUMR4a+N/BqPmcYXxRL1Z0g
gsffDCIx
=/w2p
-----END PGP SIGNATURE-----

--=-AlsjcQROXT7LRE0TJ89X--

