Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RsWSb-0008KP-Gu for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 10:26:37 +0100
Received: from f053046240.adsl.alicedsl.de ([78.53.46.240]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RsWL3-0000pq-Sg; Wed, 01 Feb 2012 09:18:50 +0000
Message-ID: <1328087923.4185.6.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 01 Feb 2012 10:18:43 +0100
In-Reply-To: <1328031918-23871-2-git-send-email-steve@sakoman.com>
References: <1328031918-23871-1-git-send-email-steve@sakoman.com>
	<1328031918-23871-2-git-send-email-steve@sakoman.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH v5 1/3] libksba: add recipe for 1.2.0
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
X-List-Received-Date: Wed, 01 Feb 2012 09:26:37 -0000
X-Groupsio-MsgNum: 16819
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-BzPWX4Ob9OIIl14BbRPo"

--=-BzPWX4Ob9OIIl14BbRPo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 31.01.2012, 09:45 -0800 schrieb Steve Sakoman:
> Libksba provides an easy API to create and parse X.509 and CMS related ob=
jects
> and is required for gnupg
>=20
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-support/libksba/libksba_1.2.0.bb |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb
>=20
> diff --git a/meta/recipes-support/libksba/libksba_1.2.0.bb b/meta/recipes=
-support/libksba/libksba_1.2.0.bb
> new file mode 100644
> index 0000000..1fadd48
> --- /dev/null
> +++ b/meta/recipes-support/libksba/libksba_1.2.0.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION =3D "Libksba provides an easy API to create and parse X.509 =
and CMS related objects"

I am not sure if the description should be considered a sentence and
therefore a full stop should be added at the end.

Could you also please add the field `HOMEPAGE` set to [1]?

> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949"
> +
> +DEPENDS =3D "libgpg-error"
> +
> +inherit autotools binconfig
> +
> +SRC_URI =3D "ftp://ftp.gnupg.org/gcrypt/${PN}/${PN}-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "e797f370b69b4dc776499d6a071ae137"
> +SRC_URI[sha256sum] =3D "09afce65b03d027cbec10d21464f4f651cdfd269e38b404f=
83e48d3e2a3c934b"

With these changes this patch is

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul


[1] http://www.gnupg.org/related_software/libksba/

--=-BzPWX4Ob9OIIl14BbRPo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk8pA3MACgkQPX1aK2wOHVidyACfUsWwRq4q6eBUtJ3XOU4lzlVZ
o6EAniEImLN79RbFPfdaMhU1NokrkI7s
=W1Q8
-----END PGP SIGNATURE-----

--=-BzPWX4Ob9OIIl14BbRPo--
