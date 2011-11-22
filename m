Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RSnfZ-0003rr-Rj for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 11:33:42 +0100
Received: from f053034066.adsl.alicedsl.de ([78.53.34.66]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RSnZM-0004oK-JY for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 10:27:16 +0000
Message-ID: <1321957632.3457.6.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 11:27:12 +0100
In-Reply-To: <3B1350D1-672D-47EB-9BB1-29E2F292F67B@dominion.thruhere.net>
References: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
	<1321952894.3457.3.camel@mattotaupa>
	<3B1350D1-672D-47EB-9BB1-29E2F292F67B@dominion.thruhere.net>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [RFC][PATCH 1/2] libjson: add 0.9
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
X-List-Received-Date: Tue, 22 Nov 2011 10:33:42 -0000
X-Groupsio-MsgNum: 12706
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-A++NrhxKS8KsRHrpS+XC"

--=-A++NrhxKS8KsRHrpS+XC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 22.11.2011, 11:19 +0100 schrieb Koen Kooi:
> Op 22 nov. 2011, om 10:08 heeft Paul Menzel het volgende geschreven:

> > Am Montag, den 21.11.2011, 19:12 +0100 schrieb Koen Kooi:
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> meta/recipes-devtools/libjson/libjson_0.9.bb |   13 +++++++++++++
> >> 1 files changed, 13 insertions(+), 0 deletions(-)
> >> create mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
> >>=20
> >> diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb b/meta/recip=
es-devtools/libjson/libjson_0.9.bb
> >> new file mode 100644
> >> index 0000000..4d609a6
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/libjson/libjson_0.9.bb
> >> @@ -0,0 +1,13 @@
> >> +DESCRIPTION =3D "JSON-C - A JSON implementation in C"
> >> +
> >> +LICENSE =3D "MIT/X11"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D30a276a476b02c2dcd0849bde4=
17fb17"
> >=20
> > please add at least the field `HOMEPAGE` as it is done in OE-classic
> > [1].
> >=20
> >> +SRC_URI =3D "http://oss.metaparadigm.com/json-c/json-c-${PV}.tar.gz"
>=20
> Since the homepage can be derived from SRC_URI, is it really needed?

I always thought these metadata fields are used by interfaces like
package managers to allow people to know more about the package/program.


Thanks,

Paul

--=-A++NrhxKS8KsRHrpS+XC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7LeQAACgkQPX1aK2wOHVgz8gCfQkS9Fk6GW3AcB9l5heVruZZN
xYMAn2lnXOOo2b3GSPvyMPnw2WdgSH75
=aj2A
-----END PGP SIGNATURE-----

--=-A++NrhxKS8KsRHrpS+XC--
