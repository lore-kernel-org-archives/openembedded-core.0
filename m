Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RSnS4-0003VX-S6 for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 11:19:45 +0100
Received: from f053034066.adsl.alicedsl.de ([78.53.34.66]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RSmL6-0004dg-ON for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 09:08:28 +0000
Message-ID: <1321952894.3457.3.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 10:08:14 +0100
In-Reply-To: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
References: <1321899155-19575-1-git-send-email-koen@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 22 Nov 2011 10:19:46 -0000
X-Groupsio-MsgNum: 12704
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-o0FmlfkBV916+PaV5wQL"

--=-o0FmlfkBV916+PaV5wQL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Koen,


Am Montag, den 21.11.2011, 19:12 +0100 schrieb Koen Kooi:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-devtools/libjson/libjson_0.9.bb |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
>=20
> diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb b/meta/recipes-=
devtools/libjson/libjson_0.9.bb
> new file mode 100644
> index 0000000..4d609a6
> --- /dev/null
> +++ b/meta/recipes-devtools/libjson/libjson_0.9.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "JSON-C - A JSON implementation in C"
> +
> +LICENSE =3D "MIT/X11"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D30a276a476b02c2dcd0849bde417f=
b17"

please add at least the field `HOMEPAGE` as it is done in OE-classic
[1].

> +SRC_URI =3D "http://oss.metaparadigm.com/json-c/json-c-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "3a13d264528dcbaf3931b0cede24abae"
> +SRC_URI[sha256sum] =3D "702a486c9bf8e19137d484ab5c49b4ad314eb5e1fe37062a=
72c0a0fa39439475"
> +
> +S =3D "${WORKDIR}/json-c-${PV}"
> +
> +
> +inherit autotools


Thanks,

Paul


[1] http://git.openembedded.org/openembedded/tree/recipes/libjson/libjson_0=
.9.bb?id=3D55b3912f14b1919bf2cd330e48546f11c179794f

--=-o0FmlfkBV916+PaV5wQL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7LZn4ACgkQPX1aK2wOHVjw7gCfQceQXiJ6FqHyTESwkMx/o9h8
WVAAn3x1aLSBmYwR6Wt+plDTOeGD2+69
=M+Qs
-----END PGP SIGNATURE-----

--=-o0FmlfkBV916+PaV5wQL--
