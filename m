Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLFdt-00009J-5o
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 15:48:45 +0100
Received: by wwf4 with SMTP id 4so2634077wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 07:42:38 -0700 (PDT)
Received: by 10.216.221.31 with SMTP id q31mr4636172wep.37.1320158558152;
	Tue, 01 Nov 2011 07:42:38 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff6sm38739055wbb.10.2011.11.01.07.42.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 07:42:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 1 Nov 2011 15:42:32 +0100
In-Reply-To: <1320157872.15387.12.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320157872.15387.12.camel@ted>
Message-Id: <D4412D3B-5E5D-4534-86B8-BBD6C98416E7@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] dbus: Ensure localstatedir is added to the package
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
X-List-Received-Date: Tue, 01 Nov 2011 14:48:45 -0000
X-Groupsio-MsgNum: 11746
Content-Type: multipart/signed;
	boundary="Apple-Mail=_63F945D5-7287-4D5F-9DE6-672B2C20F2D5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_63F945D5-7287-4D5F-9DE6-672B2C20F2D5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 nov. 2011, om 15:31 heeft Richard Purdie het volgende geschreven:

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-core/dbus/dbus.inc =
b/meta/recipes-core/dbus/dbus.inc
> index b378bda..68d3535 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -10,7 +10,7 @@ DEPENDS =3D "expat virtual/libintl =
${@base_contains('DISTRO_FEATURES', 'x11', '${X
> DEPENDS_virtclass-native =3D "expat-native virtual/libintl-native"
> DEPENDS_virtclass-nativesdk =3D "expat-nativesdk =
virtual/libintl-nativesdk virtual/libx11"
>=20
> -PR =3D "r1"
> +PR =3D "r2"

As the PR police I must point out that the dbus_1.4.12.bb file also has =
PR =3D "r1", which will win. With all the intermediate patches going =
round, could you please bump it up to r6 please? Pretty, pretty please?

regards,

Koen


--Apple-Mail=_63F945D5-7287-4D5F-9DE6-672B2C20F2D5
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6wBVgACgkQMkyGM64RGpHE5wCdHxCP32ojgMAsI3Tb4PYgjEha
goIAnjyX/nSWfkudmkCJwEos3U2BlOPv
=er7V
-----END PGP SIGNATURE-----

--Apple-Mail=_63F945D5-7287-4D5F-9DE6-672B2C20F2D5--
