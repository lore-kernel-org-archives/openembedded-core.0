Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id D3662601F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 02:51:36 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id n85so69027094pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 19:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=ypIsT+kgQJIbWKWOYulTg7o2qw6vtp+L+eSt8UoeCuE=;
	b=Rvo2TCtO90EjwvT/Zr1nMYC0g1K1R9RWfVWHVIB4GS2KN1DATpHG6qv9+XwL26zB1g
	SuLmJlUTdoXHV0MGX9eELdLRmaZ/rw1Tl5CxP5jNh8kVrauW3xg8Bx22GUII2P/Kq3i9
	28xY9NeGlguPN/f+mQw5oBGsjuDV8ah6ryKeqpTMpfQkWHReE79tmVBQKkehq86UbkVT
	6ZtMvqwsWKcypRzs+AIeFENtUnaCDoF92+mz+kvVvEAU2uMZwgADIB+k/Km9m6LVAXiZ
	3DvZ/hJiYewzH1SAnjmAwVOq1U5wTaC+c/iRW4QG4H3eaOf/aNUKCRhmIIqAi05gw88X
	x9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ypIsT+kgQJIbWKWOYulTg7o2qw6vtp+L+eSt8UoeCuE=;
	b=GL9oTe9oGy2rwqGs2zMOVHy2otY8ZKEEl8tJok2VkkEUrjQO3L+nQtj9BpJ0U5PqTF
	2iTry35clW0Ot4ROQ6p8aPrf3lda6zaLg6Sj1OKQrUar1AfXM10eE9SiM/6X7frt7qNe
	4EaKmhjffJFhS83S9l+FDeHFfiq2tf+FQwUOcQdpvponb3XuF8pdKg3dHCskObB2asOH
	+wX0x/hMc2y6wzcbR+DRUlnXilNchN4zXZVVcpn0PLEo/R4KLUFZJyzq91c3UJRtMm6x
	vqPdyNDKR4u8I+EbRXiELI1yRIjOnOvYpYicMau2GhrChoryZ9ebra9Iubk2B6JO3ofR
	Lcqw==
X-Gm-Message-State: ABUngvfEfXEnsH0GlgFSBk9Fdk6Q2CzSTq+ZT8+OQwwbcuNPMZwS++DTHsfxACqrpkDR/A==
X-Received: by 10.99.167.75 with SMTP id w11mr37669910pgo.16.1477882297991;
	Sun, 30 Oct 2016 19:51:37 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:21ec:cda8:5c43:1476?
	([2601:646:8882:b8c:21ec:cda8:5c43:1476])
	by smtp.gmail.com with ESMTPSA id
	73sm32350182pfn.45.2016.10.30.19.51.37
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Oct 2016 19:51:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1610300507330.27931@localhost.localdomain>
Date: Sun, 30 Oct 2016 19:51:30 -0700
Message-Id: <FB84115D-98FF-497A-8252-CD05EBA1E1E6@gmail.com>
References: <alpine.LFD.2.20.1610300507330.27931@localhost.localdomain>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: any issue with duplicate recipes spread over different layers?
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
X-List-Received-Date: Mon, 31 Oct 2016 02:51:36 -0000
X-Groupsio-MsgNum: 88772
Content-Type: multipart/signed;
	boundary="Apple-Mail=_85570E2B-366A-46F1-AF97-2160C98E2333";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_85570E2B-366A-46F1-AF97-2160C98E2333
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 30, 2016, at 2:10 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
>=20
>  not a burning issue, but while cataloguing some python recipes, i'm
> running across stuff like this:
>=20
> $ find . -name python-six_1.10.0.bb
> ./meta-virtualization/recipes-devtools/python/python-six_1.10.0.bb
> ./openembedded-core/meta/recipes-devtools/python/python-six_1.10.0.bb
> =
./meta-openembedded/meta-python/recipes-devtools/python/python-six_1.10.0.=
bb
> ...
>=20
> $ find . -name python3-six_1.10.0.bb
> ./openembedded-core/meta/recipes-devtools/python/python3-six_1.10.0.bb
> =
./meta-openembedded/meta-python/recipes-devtools/python/python3-six_1.10.0=
.bb
> ...
>=20
>  so it appears the same(?) recipe for python-six appears in three
> different layers ... is there any effort expended to identify
> redundancy and remove it?

since its in OE-Core ( since July 2016 ), it would have been good if a
pull request to these layers went out atomically to remove them. But
its never too late, I encourage you to send removal patches to these
layers

>=20
> rday
>=20
> --
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, =
CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       =
http://twitter.com/rpjday
> LinkedIn:                               =
http://ca.linkedin.com/in/rpjday
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_85570E2B-366A-46F1-AF97-2160C98E2333
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgWsbgACgkQuwUzVZGdMxQb/ACfQBq7XJPFISdLAAqtuIUcAeei
47MAn2ZzB3odHGuHwPPiPfy16EKEZpq6
=zPc5
-----END PGP SIGNATURE-----

--Apple-Mail=_85570E2B-366A-46F1-AF97-2160C98E2333--
