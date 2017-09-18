Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7BC77ACB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 15:20:32 +0000 (UTC)
Received: (qmail 12611 invoked by uid 1003); 18 Sep 2017 15:20:33 -0000
Received: from unknown (HELO ?10.50.10.211?) (philip@opensdr.com@69.7.123.146)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	18 Sep 2017 15:20:33 -0000
To: Martin Jansa <martin.jansa@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
	<CA+chaQec-cL6x3i3TfOi7yBhmCQ9Gf=-4jXkXqJ2-yJQmPmcmw@mail.gmail.com>
	<5e66c357-fda0-17d8-1d78-5b877fdc47e5@gmail.com>
	<CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
	<1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com>
	<20170918083915.GB3340@jama>
From: Philip Balister <philip@balister.org>
Message-ID: <51b6874b-551a-3983-4002-77e166822521@balister.org>
Date: Mon, 18 Sep 2017 09:20:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170918083915.GB3340@jama>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Mon, 18 Sep 2017 15:20:32 -0000
X-Groupsio-MsgNum: 103065
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="hWdUECNkPlJBoGGc9eag9cgDQ9tfOLuFT"

--hWdUECNkPlJBoGGc9eag9cgDQ9tfOLuFT
Content-Type: multipart/mixed; boundary="2Qlm7cfpxcQ9PuGMid1btnRSsjRmGFOke";
 protected-headers="v1"
From: Philip Balister <philip@balister.org>
To: Martin Jansa <martin.jansa@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
 OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Message-ID: <51b6874b-551a-3983-4002-77e166822521@balister.org>
Subject: Re: [OE-core] [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
References: <20170911203056.22156-1-otavio@ossystems.com.br>
 <CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
 <CA+chaQec-cL6x3i3TfOi7yBhmCQ9Gf=-4jXkXqJ2-yJQmPmcmw@mail.gmail.com>
 <5e66c357-fda0-17d8-1d78-5b877fdc47e5@gmail.com>
 <CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
 <1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com> <20170918083915.GB3340@jama>
In-Reply-To: <20170918083915.GB3340@jama>

--2Qlm7cfpxcQ9PuGMid1btnRSsjRmGFOke
Content-Type: text/plain; charset=windows-1252
Content-Language: en-MW
Content-Transfer-Encoding: quoted-printable

On 09/18/2017 02:39 AM, Martin Jansa wrote:
> On Mon, Sep 18, 2017 at 10:31:05AM +0200, Marek Vasut wrote:
>> On 09/18/2017 09:54 AM, Martin Jansa wrote:
>>> u-boot-fw-utils-cross is broken for at least a year, if it breaks a l=
ot
>>> of boards, why nobody complained yet?
>>
>> Didn't you say it worked for 2017.07 or did I misunderstand that ?
>=20
> u-boot-fw-utils did work, u-boot-fw-utils-cross no, read it again:
>=20
> And that u-boot-fw-utils-cross was broken even with Yocto 2.3 Pyro and
> 2017.01 version there, maybe it's time to remove cross version? As
> nobody is using it and it's not tested?

What is the policy on doing u-boot version upgrades this late in the
release cycle? SHouldn't this wait until after the release?

Philip


--2Qlm7cfpxcQ9PuGMid1btnRSsjRmGFOke--

--hWdUECNkPlJBoGGc9eag9cgDQ9tfOLuFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEBTQvNQJFZ+nvGDylwMl3iuvSZ6sFAlm/5D8UHHBoaWxpcEBi
YWxpc3Rlci5vcmcACgkQwMl3iuvSZ6vqMAf+P/07SwcAvvNGlw9V3zdjIOliTt8Z
9hDEEG3Oo7622wRy1m/SAODX4a7tBk9ZkfdO4odMyD5AMikYwY97+33nYyqqfvqn
ymSs8LaUGsNNYAg9YvWGfMz5r+AY6E1SUlfkn+SUHg37OopwiTxDRM9RatKcrtex
nzzNUMZIDtsPSL7iUSHgZGs9hwoiXq1N5bFhO1XNZpWlaQbrzZ4Oe0zzIq2a3yN9
dDYb2WDXUeLylEJts5nghcvggPJkrxrD3H5KgM5Fe/tfHKtBWIKRBD6ruOBnXwyy
iNir8Y3SNe/EgJRqN5ERBYJQdaUKfxhopUzZS+ExbACk3ZZyKk9KPAoF1Q==
=LqMV
-----END PGP SIGNATURE-----

--hWdUECNkPlJBoGGc9eag9cgDQ9tfOLuFT--
