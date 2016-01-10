Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id C32AE60851
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 18:01:58 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 3E648181537;
	Sun, 10 Jan 2016 19:01:58 +0100 (CET)
To: roman@khimov.ru
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<568B0B5D.8000209@windriver.com>
	<5692911F.1050601@universe-factory.net>
	<2644403.ISKvOHQyRX@masala.hex>
From: Matthias Schiffer <mschiffer@universe-factory.net>
X-Enigmail-Draft-Status: N1110
Message-ID: <56929C95.4020900@universe-factory.net>
Date: Sun, 10 Jan 2016 19:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <2644403.ISKvOHQyRX@masala.hex>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Sun, 10 Jan 2016 18:01:59 -0000
X-Groupsio-MsgNum: 75788
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="eIqmUXV5keRK82S60BkhQKrqFVU502hU8"

--eIqmUXV5keRK82S60BkhQKrqFVU502hU8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/10/2016 06:52 PM, Roman Khimov wrote:
> =D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 10 =D1=8F=D0=BD=
=D0=B2=D0=B0=D1=80=D1=8F 2016 18:13:03 =D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D0=BE=
=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Matthias Schiffer =D0=BD=D0=B0=D0=BF=
=D0=B8=D1=81=D0=B0=D0=BB:
>> * I stand by my opinion that moving files automatically is a bad idea,=

>=20
> But that's exactly what can make many of /usr merge changes automatical=
ly.=20
> Take the kernel as an example, you just don't need the first two hunks =
of the=20
> kernel.bbclass patch, fs-perms fixes that for you if it's told that /li=
b is a=20
> symlink to 'usr/lib'.

I can see that it makes things simpler, but I'm more interested in a
correct solution than a simple one.

>=20
>> and the FILES issue mentioned in the other thread further backs my poi=
nt
>=20
> IMO, FILES just shouldn't use hard-coded /lib or any other hard-coded p=
ath=20
> like that.
>=20

But if FILES depends on ${base_libdir} etc., the rest of the package
should also be adjusted to install all its files into ${base_libdir}
instead of /lib. Installing files to /lib, but putting ${base_libdir}
into FILES seems extremely broken to me.

Matthias


--eIqmUXV5keRK82S60BkhQKrqFVU502hU8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAEBCgAGBQJWkpyVAAoJEBbvP2TLIB2cT04P+ME4ql+nUUWXNKEq5eqiD7YW
wkfCAvLnJoP/jopJO6od0U/U6w40tFq+2tBpzdL2Hh2/Fz/ShCOQh54RPOtvTaG/
Zt05Qg2gHbFdfeUBKCJzHu1S9hA/ztFN6jdcEwWEYAr/SyyaO8uXiDvQ9smSJcqH
TQutNX1EaDak6J0zNpULcxw5gK/u8JXmDgZcfGDX7cwTnde3YBPlb2HrLzh5cWxB
h2bGJJslSKVILMuTjgwnaM4IumpFRHvhJUeJfzP7fJ+mWtzvovn2AhUtE221fPLP
c+D7qwusXcUWmSWBA7iDA+h+9R/wBn1YJfmMFUVAotanw7uHP042K1g+TaNBRncE
q2Gea2E0DWG//ASNC3V1UNCUR4gQhaSl1mYRtXPHJ5mf6nKiCRkETOU8fyk3wMc0
GHHu1XP9GnEbzZJCQFHYl8CMpvNuZZ+BouMVPiVBf9PvPuvLmO/WXjuqhJQ8weLb
f8faI/BwZjyGR6M4ufGzH3F4Z7o7vKNW5cX0okugll4CsTy9uVF/t2hdMEvoTPiK
ILMXkkNXJ36q0xNSaVxMYe5jNJiF74FcltyfNZ5Nq3Ck9ap5Zhjwa4qft3cD3ycu
p6WQsiu7GjDaQrmqu/Fdo+jXC5TRJJeJW29IpSDn0W9OOUcw6FI+tuYcN3VfBuvG
1Cz/AIAf2FCHH5K1Bug=
=vt89
-----END PGP SIGNATURE-----

--eIqmUXV5keRK82S60BkhQKrqFVU502hU8--
