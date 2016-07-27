Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 87EA1606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 15:18:26 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id hh10so1929963pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=eTcXBtndP3t4QUB574wHg16eAhblO1RuxYxbivQDTns=;
	b=tIEOrvSfjryia88F6ng0xIl6ltn9LngI8ITsCzl8ZfEk31+8ClEioMFdHhnHFrm5T/
	jQWtpMMEnRrnMjEw/kVaDoE8rK/SexWyJQ2I61uf1A9oAFojb7Enb5gL7UVGeCUnKmXQ
	j2wrW7ipaSNVXt0vr7ZDoRzESVeFZC06S9cW59JlNLNO7dgCY4WioCLswliEExpE7Ku0
	jL3j1R3D+c016U8ozlyjDKlEn+/1FyJ328uvKC5QELCHdz4rllglNywYrgm5P9ol+YXy
	JdeB85G9c78jaNCk2wdSCLChUhQpAtRQZosfKir3FrL75Xf6BGM2f5wxwgHUX/EnDQ4P
	+7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=eTcXBtndP3t4QUB574wHg16eAhblO1RuxYxbivQDTns=;
	b=dK474thi4zL3kuxjrUalycdXuQxjXPtlWb5mgWJTU9Ozui+AEKcf/gLgQLa/ai/M6t
	L61dPWBGSWR/o0GWUehPUJkUsi17VpxniKgoxPWOydSJ/8Ubun9jYhvgDPIDuUmI8Y/s
	kRho6vVG4UqyI3li0RcbY+IKhJTx3o7QLvSy+n65gtlRHxczeyLCdKKngL7RV7w9+SvN
	sMghWRq1CF50DxnYjQvzk3C13NXJ9WAQni4qLqEiaOSmJmVMb1/ZVaHOfLnLmDvvWiYp
	3QAnH0OTyPOd1rzDjIsGzPe1Eqee/PreqTsnd+/r6nQBfwkilAE9U2blfVchuyDUmEmK
	kOyg==
X-Gm-Message-State: AEkoouvJVjO39IT33ewwMEUTeCtC0UJz1DpUxwTkBXpICeMQbMpiEP6UCKfZqXBSXAHK+g==
X-Received: by 10.66.138.108 with SMTP id qp12mr50246653pab.65.1469632706954; 
	Wed, 27 Jul 2016 08:18:26 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:9114:c173:494d:8f0f?
	([2601:646:8882:b8c:9114:c173:494d:8f0f])
	by smtp.gmail.com with ESMTPSA id
	b14sm10031891pfd.82.2016.07.27.08.18.25
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 08:18:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1469621486.18503.9.camel@ts.fujitsu.com>
Date: Wed, 27 Jul 2016 08:18:25 -0700
Message-Id: <0AFF0F4F-BAA0-43F7-ABE3-32ABEC5D924C@gmail.com>
References: <1469194596.6594.13.camel@ts.fujitsu.com>
	<CAMKF1srBan-tupS7qGb3kDnAn-2-u8dox3vFk5ssGwQLzeGaHw@mail.gmail.com>
	<1469455403.6896.29.camel@ts.fujitsu.com>
	<CAMKF1soyDLFePf+JqwQeyqCeig=CeZqHADwJJ7yZ=Nz9PcW0Hg@mail.gmail.com>
	<1469525795.6937.1.camel@ts.fujitsu.com>
	<AA7383CF-888C-4605-97BB-BB016A5EB450@gmail.com>
	<1469621486.18503.9.camel@ts.fujitsu.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building for armv7athf-neon but toolchain is softfp
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
X-List-Received-Date: Wed, 27 Jul 2016 15:18:28 -0000
X-Groupsio-MsgNum: 85000
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D78565DE-D993-469C-899E-42C464651572";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D78565DE-D993-469C-899E-42C464651572
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 27, 2016, at 5:14 AM, thilo.cestonaro@ts.fujitsu.com wrote:
>=20
> Hey Khem,
>=20
> I figured, when I do the compile in 2 steps, so compile then link and =
change the link command to use the ubuntu arm-linux-gnueabihf-gcc =
instead of the gcc from the sdk, the binary is useable.

this could be a gnu_hash issue then. Can you add -Wl,--hash-style=3Dgnu =
to compiler cmd when linking using OE SDK

>=20
> I hope that helps a bit!
>=20
> Cheers,
> Thilo
>=20
>=20
> On Mi, 2016-07-27 at 02:57 -0700, Khem Raj wrote:
>>>=20
>>> On Jul 26, 2016, at 2:39 AM, thilo.cestonaro@ts.fujitsu.com wrote:
>>>=20
>>> Hey Khem,
>>>=20
>>>>=20
>>>> Seems steps are all ok. Can you upload your hello world somewhere.
>>> http://thilo.cestona.ro/~ephraim/public/helloworld.zip
>>>=20
>>> Hope you can find out whats going on here :).
>>>=20
>> This seems to contain C++ it seems. Can you try a simple C hello.c =
and see if that works.
>>=20
>>>=20
>>> Cheers,
>>> Thilo


--Apple-Mail=_D78565DE-D993-469C-899E-42C464651572
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleY0MEACgkQuwUzVZGdMxTlBwCdH/BfoWU6v8nXTnZV8L0acjjJ
X5cAmQEiZxuo7LUJLIuk7v3pQo+MZb8L
=hZIN
-----END PGP SIGNATURE-----

--Apple-Mail=_D78565DE-D993-469C-899E-42C464651572--
