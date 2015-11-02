Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 89E3A770A7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 14:47:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 941D06087E2
To: OE Core <openembedded-core@lists.openembedded.org>
References: <c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
	<CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
	<94093E93-77C6-403A-9E9F-69C02C6C8D11@collabora.co.uk>
	<CAJTo0Lada89cW8Hs=P65aHfRKiiZuu13jDu3PO=3NkJq_Wt7xA@mail.gmail.com>
	<11321f065e34ca094a0aff494291662852f05805.1445522417.git.andrew.shadura@collabora.co.uk>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <56377794.4090301@collabora.co.uk>
Date: Mon, 2 Nov 2015 15:47:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <11321f065e34ca094a0aff494291662852f05805.1445522417.git.andrew.shadura@collabora.co.uk>
Subject: Re: [PATCH v2] cups: update systemd support
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
X-List-Received-Date: Mon, 02 Nov 2015 14:47:54 -0000
X-Groupsio-MsgNum: 72816
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ke6dbaPvDVG475ifvRA5v12TL114aHPBU"

--ke6dbaPvDVG475ifvRA5v12TL114aHPBU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22/10/15 16:00, Andrew Shadura wrote:
> Add PACKAGECONFIG for systemd, enable it when systemd is enabled
> in DISTRO_FEATURES. Pass the correct path to systemd units,
> ensure they're installed into the package.
>=20
> Drop custom systemd unit files, use those shipped by the upstream
> instead.
>=20
> Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>

Anything about this patch?

--=20
Cheers,
  Andrew


--ke6dbaPvDVG475ifvRA5v12TL114aHPBU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWN3eUAAoJEEFnG7NKhJOBK/wQAIDOi7lD2Gvwv6oEEDf0yEd5
imgrMqP36wHtVgrj0g7tWr/cZ0IzAFKRobC5ayEiGkfiyp4/M29ECiUu2lEucY57
Zydv+M9C5Q9QSlrPc0peQWRM2xAsCs7eXM4XAWdBnuuupJPtetAvPYw1FxF/aOKX
NWVXlok66HrgFfmxX6oGZfeAuvwSUU1LEYAZlgWKB88ebM+pKMmNVx7PCCko805t
VXROLKwcEUWXQKriKR1pbRF/KZWNX+bIIoL2MkJjdSA/wKMEvukCS1LeE18Y6h8e
NsBFAwqhpmbLKKY5UqSEoo/bHnrw5JXEPmfccK5bPCoB3/WoihKgxlE5SZyX9dyX
P1N4kXGqbLJpRdJLQA6nree3fp7eqfZ1vHF9xf51BwXTyECSIrem+3HdY9ffaNLr
Zj6a5BfQzvWGrZGDwyOHXtY5Qwg/vasS97zpezMGxHjGCNegyRjXjbwI4WRmJfZ6
A6UsvROSLH577E2OBXE1+P3uuQQQm21bdhRIXoCD1d+V5xZChPiKZ1dhJmgdwsbU
qfqmtGQps3G0htl3LGNzjKmHkQvNpA26dqKRkkwI96y/xqnEmUfB5GqJ0RMDybqt
IH5FqNJS0y0o3BQk5zksQI6VusUt/nY1gP/b59PxjA42aji41tfXkHVmJzX5Jilu
Wcj0b61feQKhdQtojSpO
=Pi4K
-----END PGP SIGNATURE-----

--ke6dbaPvDVG475ifvRA5v12TL114aHPBU--
