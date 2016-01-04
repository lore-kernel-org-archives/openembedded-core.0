Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 69F0B6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 22:38:02 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id CE183181500;
	Mon,  4 Jan 2016 23:38:02 +0100 (CET)
To: Phil Blundell <pb@pbcl.net>
References: <c00e9825d8e0221666adffd95ed157f9affe06b8.1451778497.git.mschiffer@universe-factory.net>
	<7ef127138c4ba5c89b42b892c84aaa7766f78a4c.1451778497.git.mschiffer@universe-factory.net>
	<1451826066.2002.96.camel@pbcl.net>
From: Matthias Schiffer <mschiffer@universe-factory.net>
X-Enigmail-Draft-Status: N1110
Message-ID: <568AF44A.2040804@universe-factory.net>
Date: Mon, 4 Jan 2016 23:38:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1451826066.2002.96.camel@pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] base-files: create typical merged /usr symlinks if the "merged-usr" distro feature is set
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
X-List-Received-Date: Mon, 04 Jan 2016 22:38:04 -0000
X-Groupsio-MsgNum: 75404
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="00WEUsJpEMO8Uca9FK3icRmuT0lXcB2C7"

--00WEUsJpEMO8Uca9FK3icRmuT0lXcB2C7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/03/2016 02:01 PM, Phil Blundell wrote:
> On Sun, 2016-01-03 at 00:53 +0100, Matthias Schiffer wrote:
>> +PACKAGECONFIG ??=3D " \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'merged-us=
r','merged-usr', '', d)} \
>=20
> Why is this DISTRO_FEATURE (or the corresponding PACKAGECONFIG)
> required?  Surely it ought to suffice to simply set ${base_bindir} etc,=

> and everything else should follow from that.  This, albeit the other wa=
y
> around, is what micro has been doing for years.
>=20
> p.
>=20
>=20

Basically, I didn't want to break existing configurations. There might
be unusual distros which don't want these symlinks (or want different
ones). Of course, the alternative would be to force such distros to
override the bases-files recipe in a .bbappend.

I don't know of any OE-based distros with such unusual setups, but
Debian is an example: they basically set base_libdir to /lib/$TARGET,
but don't symlink /lib64 to this on 64bit targets. Instead, /lib64 is
empty except of a symlink to the dynamic linker which is expected in /lib=
64.

Matthias


--00WEUsJpEMO8Uca9FK3icRmuT0lXcB2C7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWivRKAAoJEBbvP2TLIB2cUcIQAKQcnEqpl+glFftOVI4tIxEy
d7ylElqHeLXeWivc7nqm0YPPtDsUZh/Dmu+b/q1Syu3yKED9yy9igho92AkSKkGQ
w9MR9fbJMLIIijLVOeUv5hqEXUryUjv0UplrrWLtsAD0Uc4cIleexFSToh3MrpAl
pkR3QLOXScKD1HUe1QAHT+vvLnwbGpEjEQC47sCH8cSjNYmdIBvnFiJ8MpaENyvz
UJHMvu+IdYaQx+kvMMT+1Eyjg51LZ2xoVuOOMuu0bZH5viSYyLG9icIlrg7IKlkI
Mpi+YzpaO5xZfVcRztED8JO0g/WBEAQIx5POZWyc3gooqEvBJNG8gpciW/eDSA/2
VQ2fSSosFaq4slgm7DNNPtVVuUmsdKAIlAYUL4ZpDR/hKZn05zPAB8o8JRIMjRT+
tMWPj5r15UO7DoAPNiQ9+nkYKm5y2vMyifam8gfyXID/JD6l7KJ7V6ZT8XmUuyHu
w860vE1nXScgO+zJBV5SlFy6IX+dTHDh5NXFywJXUJ8ucqwmG8FOH12R15JfIksD
wuLp2n8iLN6jlSE8+lLq/8W4Hmz0lqkbO6jWbytIM+SomJcIh9HSCm69UyL2MHKR
1eFEEVX4zgwbOoAuwtJR6wijPXTwm9arDp6UTr01+cpn6QB6oWWSGgW1K7mw395n
LjLAddsCGGbLnwjLgK/X
=n3aS
-----END PGP SIGNATURE-----

--00WEUsJpEMO8Uca9FK3icRmuT0lXcB2C7--
