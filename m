Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLFeD-00009J-Pg
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 15:49:05 +0100
Received: by mail-ww0-f43.google.com with SMTP id 4so2634077wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 07:43:02 -0700 (PDT)
Received: by 10.227.58.18 with SMTP id e18mr24416182wbh.23.1320158581827;
	Tue, 01 Nov 2011 07:43:01 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff6sm38739055wbb.10.2011.11.01.07.42.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 07:43:00 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 1 Nov 2011 15:42:58 +0100
In-Reply-To: <1320157543.15387.8.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320157543.15387.8.camel@ted>
Message-Id: <9DF0EE52-2451-4CAF-8AA1-7EA28AD6F7FF@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] package_ipk: There is no longer any need to force owners/groups to root
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
X-List-Received-Date: Tue, 01 Nov 2011 14:49:05 -0000
X-Groupsio-MsgNum: 11747
Content-Type: multipart/signed;
	boundary="Apple-Mail=_417CF7D3-FC6A-4F6E-A2F8-3D630E1A212B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_417CF7D3-FC6A-4F6E-A2F8-3D630E1A212B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 nov. 2011, om 15:25 heeft Richard Purdie het volgende geschreven:

> Since the packaging process is run under pseudo, the default user
> is now root so there is no longer any need to hardcode this. Also
> take this opportunity to move the variable to package_ipk.bbclass
> since this is the only user of it.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Koen Kooi <k-kooi@ti.com>

> ---
> diff --git a/meta/classes/package_ipk.bbclass =
b/meta/classes/package_ipk.bbclass
> index c0893a6..c97e36e 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -7,6 +7,9 @@ IPKGCONF_SDK =3D  "${WORKDIR}/opkg-sdk.conf"
>=20
> PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
>=20
> +# Program to be used to build opkg packages
> +OPKGBUILDCMD ??=3D "opkg-build"
> +
> python package_ipk_fn () {
> 	bb.data.setVar('PKGFN', bb.data.getVar('PKG',d), d)
> }
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e2c1b6f..0d05805 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -623,10 +623,6 @@ MKTEMPCMD =3D "mktemp -q ${TMPBASE}"
>=20
> export PATCH_GET=3D"0"
>=20
> -# Program to be used to build opkg packages
> -
> -OPKGBUILDCMD =3D "opkg-build -o 0 -g 0"
> -
> ##################################################################
> # Not sure about the rest of this yet.
> ##################################################################
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_417CF7D3-FC6A-4F6E-A2F8-3D630E1A212B
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6wBXIACgkQMkyGM64RGpEZ2ACfdoqMXJN8Tu4XemXD1x8ItpgP
IEYAoJGken1Nryu3V5ArFAKj7vpB3bHG
=PLJ7
-----END PGP SIGNATURE-----

--Apple-Mail=_417CF7D3-FC6A-4F6E-A2F8-3D630E1A212B--
