Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVJ7d-0005nJ-Hi
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:33:01 +0100
Received: by eaad13 with SMTP id d13so2769997eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 00:26:23 -0800 (PST)
Received: by 10.213.101.17 with SMTP id a17mr3268095ebo.78.1322554754953;
	Tue, 29 Nov 2011 00:19:14 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 8sm28704248eei.8.2011.11.29.00.19.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 00:19:14 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1322550845-2441-1-git-send-email-ulf@emagii.com>
Date: Tue, 29 Nov 2011 09:19:10 +0100
Message-Id: <59DEA6F6-3102-4995-BAD0-3139036E3F6B@dominion.thruhere.net>
References: <1322550845-2441-1-git-send-email-ulf@emagii.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [PATCH V2] meta-ti u-boot: Add COMPATIBLE_MACHINE to avoid disturbing other builds
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:01 -0000
X-Groupsio-MsgNum: 13039
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6434D840-9DAC-4905-8A68-028B39AAF12D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6434D840-9DAC-4905-8A68-028B39AAF12D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Please read the README in the repository, it tells you where to send the =
patches.

Op 29 nov. 2011, om 08:14 heeft ulf@emagii.com het volgende geschreven:

> From: Ulf Samuelsson <ulf@emagii.com>
>=20
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
> recipes-bsp/u-boot/u-boot_git.bb |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_git.bb =
b/recipes-bsp/u-boot/u-boot_git.bb
> index 022d7fc..00414a3 100644
> --- a/recipes-bsp/u-boot/u-boot_git.bb
> +++ b/recipes-bsp/u-boot/u-boot_git.bb
> @@ -1,10 +1,11 @@
> require u-boot.inc
> -PR =3D"r67"
> +PR =3D"r68"
>=20
> DEFAULT_PREFERENCE_ti814x =3D "-1"
> DEFAULT_PREFERENCE_ti816x =3D "-1"
>=20
> FILESPATHPKG =3D. "u-boot-git:"
> +COMPATIBLE_MACHINE =3D "(beagleboard)"
>=20
> SRC_URI_beagleboard =3D "git://www.denx.de/git/u-boot.git;protocol=3Dgit=
 \
>                        =
file://0001-OMAP3-Beagle-Pin-Mux-initialization-glitch-fix.patch \
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_6434D840-9DAC-4905-8A68-028B39AAF12D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7UlYAACgkQMkyGM64RGpEj4QCeIz5PSsN/Otsi4+JxbPffpTM3
d4MAn107WjfKqFYPsdNSgFxMlHTDwAgB
=40Ec
-----END PGP SIGNATURE-----

--Apple-Mail=_6434D840-9DAC-4905-8A68-028B39AAF12D--
