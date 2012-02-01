Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RsWYW-0008Sh-Kq for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 10:32:44 +0100
Received: from f053046240.adsl.alicedsl.de ([78.53.46.240]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RsWQz-0000qf-9b; Wed, 01 Feb 2012 09:24:57 +0000
Message-ID: <1328088290.4185.11.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 01 Feb 2012 10:24:50 +0100
In-Reply-To: <1328031918-23871-3-git-send-email-steve@sakoman.com>
References: <1328031918-23871-1-git-send-email-steve@sakoman.com>
	<1328031918-23871-3-git-send-email-steve@sakoman.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH v5 2/3] gnupg: add recipe for 2.0.18
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
X-List-Received-Date: Wed, 01 Feb 2012 09:32:44 -0000
X-Groupsio-MsgNum: 16821
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-rriucXkUIhD2mDCUwCuf"

--=-rriucXkUIhD2mDCUwCuf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 31.01.2012, 09:45 -0800 schrieb Steve Sakoman:

gnupg: add 2.0.18 (initial recipe)

> GnuPG 2.0 is the new modularized version of GnuPG supporting OpenPGP and =
S/MIME
>=20
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-support/gnupg/gnupg_2.0.18.bb |   25 ++++++++++++++++++++++=
+++
>  1 files changed, 25 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
>=20
> diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-su=
pport/gnupg/gnupg_2.0.18.bb
> new file mode 100644
> index 0000000..bdf6e3e
> --- /dev/null
> +++ b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "gnupg - GNU privacy guard"

Could we get a better description? Debian has the following as the
summary.

    GNU privacy guard - a free PGP replacement (new v2.x)

Could you also please add the field `HOMEPAGE` set to [1].

> +LICENSE =3D "GPLv3 & LGPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949 \
> +                    file://COPYING.LIB;md5=3D6a6a8e020838b23406c81b19c1d=
46df6"
> +
> +DEPENDS =3D "pth libassuan libksba zlib bzip2 readline"
> +
> +inherit autotools gettext
> +
> +SRC_URI =3D "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2"

Change that to the following?

    ftp://ftp.gnupg.org/gcrypt/${PN}/${P}.tar.bz2

> +
> +SRC_URI[md5sum] =3D "2f37e0722666a0fedbe4d9f9227ac4d7"
> +SRC_URI[sha256sum] =3D "48aedd762ca443fb952a9e859efe3c66706d7c2c9c77c32d=
bdbac4fe962dae5b"
> +
> +S =3D "${WORKDIR}/gnupg-${PV}"

Is not that the default?

> +
> +EXTRA_OECONF =3D "--disable-ldap \
> +		--with-zlib=3D${STAGING_LIBDIR}/.. \
> +		--with-bzip2=3D${STAGING_LIBDIR}/.. \
> +                --with-readline=3D${STAGING_LIBDIR}/.. \
> +               "
> +
> +do_install_append() {
> +	ln -sf gpg2 ${D}${bindir}/gpg
> +}

With these changes this patch is

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-rriucXkUIhD2mDCUwCuf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8pBOIACgkQPX1aK2wOHVhz7ACdHV41xxb7FAP+5SuDT1dCx7v0
bcEAn0tbM+p6u3DPHtLGZRIYfjFMVFQc
=aX72
-----END PGP SIGNATURE-----

--=-rriucXkUIhD2mDCUwCuf--
