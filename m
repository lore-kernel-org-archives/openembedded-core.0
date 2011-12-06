Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RXuZb-00071V-26
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 13:56:39 +0100
Received: by eaac1 with SMTP id c1so1509090eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 04:49:51 -0800 (PST)
Received: by 10.213.25.82 with SMTP id y18mr2410241ebb.94.1323175791430;
	Tue, 06 Dec 2011 04:49:51 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v3sm70836024eej.7.2011.12.06.04.49.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 04:49:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 6 Dec 2011 13:49:47 +0100
In-Reply-To: <1323174430-24886-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CA+chaQfBfNs57Be9N-T1QzfZ=aXzDMN7QjKeKV8ZGnULORZjng@mail.gmail.com>
	<1323174430-24886-1-git-send-email-Martin.Jansa@gmail.com>
Message-Id: <81E52FEC-6497-4945-9E14-1F3205D3A5DC@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] ppl: fix libgmp paths
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
X-List-Received-Date: Tue, 06 Dec 2011 12:56:39 -0000
X-Groupsio-MsgNum: 13671
Content-Type: multipart/signed;
	boundary="Apple-Mail=_84FCEAA6-9913-46FE-A51D-518C2A572FE3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_84FCEAA6-9913-46FE-A51D-518C2A572FE3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 6 dec. 2011, om 13:27 heeft Martin Jansa het volgende geschreven:

[..]

>=20
> ---
> meta/recipes-support/ppl/ppl_0.11.2.bb |    6 +++++-
> 1 files changed, 5 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-support/ppl/ppl_0.11.2.bb =
b/meta/recipes-support/ppl/ppl_0.11.2.bb
> index 7536364..b31fc4d 100644
> --- a/meta/recipes-support/ppl/ppl_0.11.2.bb
> +++ b/meta/recipes-support/ppl/ppl_0.11.2.bb
> @@ -11,6 +11,10 @@ SRC_URI[sha256sum] =3D =
"e3fbd1c19ef44c6f020951807cdb6fc6a8153cd3a5c53b0ab9cf4c4f6e
> S =3D "${WORKDIR}/ppl-${PV}"
> BBCLASSEXTEND =3D "native nativesdk"
>=20
> -EXTRA_OECONF =3D "--enable-watchdog --disable-debugging =
--disable-assertions --disable-ppl_lcdd --disable-ppl_lpsol =
--disable-ppl_pips --enable-interfaces=3D'c cxx'"
> +# do we have something shorter then this? or can native.bbclass =
overwrite STAGING_DIR_HOST like nativesdk does?
> +GMP_PREFIX =3D "${STAGING_DIR_HOST}"
> +GMP_PREFIX_virtclass-native =3D "${STAGING_DIR_NATIVE}"
> +
> +EXTRA_OECONF =3D "--with-gmp-prefix=3D${GMP_PREFIX} --enable-watchdog =
--disable-debugging --disable-assertions --disable-ppl_lcdd =
--disable-ppl_lpsol --disable-ppl_pips --enable-interfaces=3D'c cxx'"
>=20
> acpaths =3D "-I m4"
> --=20

That is missing a PR bump :)

regards,

Koen=

--Apple-Mail=_84FCEAA6-9913-46FE-A51D-518C2A572FE3
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEUEARECAAYFAk7eD24ACgkQMkyGM64RGpGMNgCYpeJq/PPtKEyYKkYiQDm/1zRj
dQCeK/W+w+RsZoy5RudNsgs6WZYPygI=
=44OA
-----END PGP SIGNATURE-----

--Apple-Mail=_84FCEAA6-9913-46FE-A51D-518C2A572FE3--
