Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rgujd-0005A8-9Z
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Dec 2011 09:56:13 +0100
Received: by wibhq7 with SMTP id hq7so7540420wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Dec 2011 00:48:56 -0800 (PST)
Received: by 10.216.137.97 with SMTP id x75mr28394497wei.57.1325321336699;
	Sat, 31 Dec 2011 00:48:56 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fi6sm92072604wib.2.2011.12.31.00.48.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Dec 2011 00:48:55 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Sat, 31 Dec 2011 09:48:54 +0100
In-Reply-To: <47d6afe044383d6ca97c3972a25663eda145a56c.1325318523.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325318523.git.liezhi.yang@windriver.com>
	<47d6afe044383d6ca97c3972a25663eda145a56c.1325318523.git.liezhi.yang@windriver.com>
Message-Id: <62EA68FF-FDFA-4F2A-B7EF-DEE961ED47AE@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/2] V2 Incremental image generation(rpm based rootfs)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Dec 2011 08:56:13 -0000
X-Groupsio-MsgNum: 14984
Content-Type: multipart/signed;
	boundary="Apple-Mail=_ABCFF411-2F94-4BF3-BA9E-1A566CD3875E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_ABCFF411-2F94-4BF3-BA9E-1A566CD3875E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 31 dec. 2011, om 09:10 heeft Robert Yang het volgende geschreven:

> Incremental image generation, the rootfs would be totally removed and
> re-created in the second generation by default, but with INC_IMAGE_GEN =
=3D
> "1", the rootfs would be kept, and will do update(remove/add some =
pkgs)
> on it.
> NOTE: This is not suggested when you want to create a productive =
rootfs
>=20
> For example:
>  1) Add the follow config option to a conf file:
>     INC_IMAGE_GEN =3D "1"
>=20
>  2) bitbake core-image-sato
>     modify a package
>     bitbake core-image-sato
>=20
> The rootfs would not be totally removed and re-created in the second
> generation, it would be simply updated based on the "package".
>=20
> Implatation:
> 1) Figure out the pkg which need to be removed or re-installed, then =
use
> 'rpm -e to remove the old one. Use the rpm's BUILDTIME to determine
> which pkg has been rebuilt.
>=20
> 2) Figure out the pkg which is newly added, and use 'rpm -U' to =
install
> it.
>=20
> This only for the rpm based rootfs, I don't know whether we also need
> this for ipk or deb  based rootfs.

If you insist on calling it "INC_IMAGE_GEN" then yes, you need to =
implement it for every package format.


--Apple-Mail=_ABCFF411-2F94-4BF3-BA9E-1A566CD3875E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)

iEYEARECAAYFAk7+zHkACgkQMkyGM64RGpF4+gCfQWpbxc5rrflufaN4cdKfBzIN
8MEAoJ1zvT7+8Ob43aeUcg0NZOuvHswn
=ze9C
-----END PGP SIGNATURE-----

--Apple-Mail=_ABCFF411-2F94-4BF3-BA9E-1A566CD3875E--
