Return-Path: <patrick@stwcx.xyz>
X-Greylist: delayed 905 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Jun 2017 05:30:45 UTC
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE636B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 05:30:45 +0000 (UTC)
Received: from localhost (125.16.236.161 [125.16.236.161]) by mx.zohomail.com
	with SMTPS id 1498108536614964.0406900554373;
	Wed, 21 Jun 2017 22:15:36 -0700 (PDT)
Date: Thu, 22 Jun 2017 00:15:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170622051524.GB1200@asimov.in.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1497645034-3917-1-git-send-email-lgonzalez@us.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
Cc: Leonel Gonzalez <lgonzalez@us.ibm.com>
Subject: [PATCH v3] rng-tools: Add service file and systemd package config to rngd
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
X-List-Received-Date: Thu, 22 Jun 2017 05:30:46 -0000
X-Groupsio-MsgNum: 99218
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline

--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Signed-off-by: Leonel Gonzalez <lgonzalez at us.ibm.com>
> ---
>  meta/recipes-support/rng-tools/rng-tools/rngd.service |  8 ++++++++
>  meta/recipes-support/rng-tools/rng-tools_5.bb         | 17 +++++++++++++=
++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/rng-tools/rng-tools/rngd.service

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAllLUmoACgkQqwNHzC0A
wRndcA//TWpyEetWZ0cjdsXh8d5aqdkzYZNsEkGcD6gkDeo5Fgk4u6FN2JkYWqup
eSrJDWSr7Ur6HuQfXSbCpE6kWA2GEQVepVVPp5hA4FUNWYKY1zu4okkRnXnneNX9
gA/wkjiBoue8fgUFUOl5xtVfxCNfOLXpmIySFEiprciCUgeyb6SrnZEC2iNXjjwS
aTO3aDPu2nLW9DbgnsNVxE9wKqwC7dV7ITwJx9lR2TYWILavqvpcHtJrLsVY4uws
xJi1LWwHlkQIAUzuOOGv7yxe4EpZAjvBRf2L8E2vXc5pFQTbonAkszCnp0stEKZD
kRCWRg63ZG/oGvj7qr7qgsaKaXELfkGn6/RU+vyE0Z2lRyTjdlbz/wy8uwN6DMxf
GyLDkKddJmFpwR1OJtTU2hEBrZ5lWIHtquFATStHomGYpxu5qEP5fzxrvw0P/qLV
zLQEZjsEFs2LFrtOmKNaBGkm1y3IQlFayqhQFzUb7W8R9vMbgb2+SULTAndM67Qc
+dD6kY+C2Ed6Z5F1iZhePLu+hSCUS9kgnztNexc+toM1edpO7vsizwdqLrHrmOPQ
bBs5dEvve6Xr2gQK5lMQ0ruuYSf5GjWki9At7uurNFuJzccuemZP2AN0PQTs9j4t
rFD2Ku/GM4LPZPcaJ7JXkd2GSyPcoG0czXlqSd8xVUq4Pz/vAfk=
=MKGL
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
