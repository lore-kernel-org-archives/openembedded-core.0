Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S4tKD-0004JY-Uj for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 13:17:05 +0100
Received: from g225138053.adsl.alicedsl.de ([92.225.138.53]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S4tBz-00012z-NH for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 12:08:36 +0000
Message-ID: <1331035711.6166.25.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 06 Mar 2012 13:08:31 +0100
In-Reply-To: <1331035393-27558-1-git-send-email-koen@dominion.thruhere.net>
References: <1331035393-27558-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] xz: split out liblzma as seperate packages
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
X-List-Received-Date: Tue, 06 Mar 2012 12:17:06 -0000
X-Groupsio-MsgNum: 18435
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-ECygp1p3IImzZuAZsuP1"

--=-ECygp1p3IImzZuAZsuP1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Koen,


Am Dienstag, den 06.03.2012, 13:03 +0100 schrieb Koen Kooi:

sep*a*rate in the commit summary.

> As usual, this creates problems for upgrade paths, but splitting out the =
lib is worth the short term hassle

Is there some documentation what distros or users should do facing this
hassle?

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-extended/xz/xz_5.0.3.bb |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extended=
/xz/xz_5.0.3.bb
> index bae71ec..e8f96b6 100644
> --- a/meta/recipes-extended/xz/xz_5.0.3.bb
> +++ b/meta/recipes-extended/xz/xz_5.0.3.bb
> @@ -14,8 +14,15 @@ SRC_URI =3D "http://tukaani.org/xz/xz-${PV}.tar.gz"
>  SRC_URI[md5sum] =3D "fefe52f9ecd521de2a8ce38c21a27574"
>  SRC_URI[sha256sum] =3D "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8=
e5b392b8f09681bf"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  inherit autotools gettext
> =20
> +PACKAGES =3D+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
> +
> +FILES_liblzma =3D "${libdir}/liblzma*${SOLIBS}"
> +FILES_liblzma-dev =3D "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV=
} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
> +FILES_liblzma-staticdev =3D "${libdir}/liblzma.a"
> +FILES_liblzma-dbg =3D "${libdir}/.debug/liblzma*"
> +
>  BBCLASSEXTEND =3D "native"

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-ECygp1p3IImzZuAZsuP1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk9V/j8ACgkQPX1aK2wOHVhaFwCdFory7n9DtnqUxScjElCpmpSf
5S4An3QR7aUK2uiESyUhlLRFU62GQTV8
=n6vh
-----END PGP SIGNATURE-----

--=-ECygp1p3IImzZuAZsuP1--
