Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RXpPp-0007vP-Ro
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 08:26:13 +0100
Received: by eaac1 with SMTP id c1so1269725eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 23:19:24 -0800 (PST)
Received: by 10.213.27.15 with SMTP id g15mr1973195ebc.111.1323155964008;
	Mon, 05 Dec 2011 23:19:24 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d6sm67871838eec.10.2011.12.05.23.19.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 23:19:23 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 6 Dec 2011 08:19:24 +0100
In-Reply-To: <5832c4a0c7709d5ff5d2612c509516689aa4da3f.1323137480.git.josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323137480.git.josh@linux.intel.com>
	<5832c4a0c7709d5ff5d2612c509516689aa4da3f.1323137480.git.josh@linux.intel.com>
Message-Id: <94875780-269D-4415-947A-0E3B28AB7931@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/4] omap3-sgx-modules: set SRC_URI checksums
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
X-List-Received-Date: Tue, 06 Dec 2011 07:26:13 -0000
X-Groupsio-MsgNum: 13655
Content-Type: multipart/signed;
	boundary="Apple-Mail=_94A2D208-4CA1-4DD6-9AB5-B0D4E37B1D0F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_94A2D208-4CA1-4DD6-9AB5-B0D4E37B1D0F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 6 dec. 2011, om 03:17 heeft Joshua Lock het volgende geschreven:

> We'd like to make missing SRC_URI checksums an error, so all
> appropriate recipes need to have a checksum value set.
>=20
> Signed-off-by: Joshua Lock <josh@linux.intel.com>

NAK, this recipe needs to get deleted from OE, it belongs in a BSP. =
FWIW, meta-ti already has a more up to date version of it.

regards,

Koe=20=

--Apple-Mail=_94A2D208-4CA1-4DD6-9AB5-B0D4E37B1D0F
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7dwfwACgkQMkyGM64RGpGQVwCgn8hN6O8BW9ARUiYEdVChrUot
J38An0YZnZ8X83HucOzIhbJwSA6zYOx5
=n8EJ
-----END PGP SIGNATURE-----

--Apple-Mail=_94A2D208-4CA1-4DD6-9AB5-B0D4E37B1D0F--
