Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RcD1b-0007ra-P7
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 10:27:20 +0100
Received: by wgbds11 with SMTP id ds11so7570580wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 01:20:15 -0800 (PST)
Received: by 10.180.92.197 with SMTP id co5mr2199268wib.7.1324200015038;
	Sun, 18 Dec 2011 01:20:15 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	bl10sm20710502wib.15.2011.12.18.01.20.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 01:20:14 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Sun, 18 Dec 2011 10:20:12 +0100
In-Reply-To: <1324170197-10720-1-git-send-email-schnitzeltony@gmx.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1324170197-10720-1-git-send-email-schnitzeltony@gmx.de>
Message-Id: <DEFC46C0-A381-485A-BABF-711F2A56A8A1@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] xorg-font-common.inc: break runtime dependency loop
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
X-List-Received-Date: Sun, 18 Dec 2011 09:27:20 -0000
X-Groupsio-MsgNum: 14392
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B7FC2A02-6B9F-49FB-9BD2-5982885A265C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B7FC2A02-6B9F-49FB-9BD2-5982885A265C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 18 dec. 2011, om 02:03 heeft Andreas M=FCller het volgende =
geschreven:

> required since opkg update [1]
>=20
> [1] =
http://cgit.openembedded.org/openembedded-core/commit/?id=3D2feba313c99117=
0747381c7cf821a45c2cd04632
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@gmx.de>

I was planning to send something reallly similar looking on monday :)

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> .../xorg-font/xorg-font-common.inc                 |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc =
b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> index d93b4ee..5a8ae56 100644
> --- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> +++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
> @@ -5,10 +5,10 @@ SECTION =3D "x11/fonts"
> LICENSE =3D "MIT-X"
>=20
> DEPENDS =3D " encodings font-alias font-util-native mkfontdir-native =
mkfontscale-native"
> -RDEPENDS_${PN} =3D "encodings font-util font-alias"
> +RRECOMMENDS_${PN} =3D "encodings font-util font-alias"
>=20
> XORG_PN =3D "${BPN}"
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
>=20
> SRC_URI =3D "${XORG_MIRROR}/individual/font/${XORG_PN}-${PV}.tar.bz2"
> S =3D "${WORKDIR}/${XORG_PN}-${PV}"
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_B7FC2A02-6B9F-49FB-9BD2-5982885A265C
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7tsE4ACgkQMkyGM64RGpGwzACeIVAfRODRJw79/pvCnaDPhyQm
vskAn3gcPEUGleQTNYag72zMsqgu2hs/
=BjwW
-----END PGP SIGNATURE-----

--Apple-Mail=_B7FC2A02-6B9F-49FB-9BD2-5982885A265C--
