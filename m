Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RZ5Vv-00052y-SR for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 19:49:43 +0100
Received: from f053037064.adsl.alicedsl.de ([78.53.37.64]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RZ5PV-0002tv-9b for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 18:43:05 +0000
Message-ID: <1323456167.25802.5.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 09 Dec 2011 19:42:47 +0100
In-Reply-To: <234071f22c2183ea28cda55bac8f68cb47e8f0e1.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
	<234071f22c2183ea28cda55bac8f68cb47e8f0e1.1322607016.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 06/26] xinit: Update to 1.3.1
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
X-List-Received-Date: Fri, 09 Dec 2011 18:49:44 -0000
X-Groupsio-MsgNum: 13968
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-WtNJDZWWWXy9U8UJnUsu"

--=-WtNJDZWWWXy9U8UJnUsu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Saul,


Am Dienstag, den 29.11.2011, 15:00 -0800 schrieb Saul Wold:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../xorg-app/{xinit_1.3.0.bb =3D> xinit_1.3.1.bb}    |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/xorg-app/{xinit_1.3.0.bb =3D> xinit_1.3.1.b=
b} (80%)
>=20
> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb b/meta/recipes=
-graphics/xorg-app/xinit_1.3.1.bb
> similarity index 80%
> rename from meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
> rename to meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
> index 08dfe12..2ddebe6 100644
> --- a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
> +++ b/meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
> @@ -13,11 +13,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0d4b5eef75=
f1584ccbdc5e4a34314407"
>  PR =3D "r2"

when upgrading recipes please remember to reset `PR` to 0. I just
spotted that now when looking through the =E2=80=9Crecent=E2=80=9D changes =
[1].

>  PE =3D "1"
> =20
> +SRC_URI[md5sum] =3D "ee234056d8a3dbf37b61b4bcb35b88e4"
> +SRC_URI[sha256sum] =3D "c7468dfae94bdb42785d79623c27156dc4bf379d83729928=
30482cb04d8439b0"
> +
>  EXTRA_OECONF =3D "ac_cv_path_MCOOKIE=3D${bindir}/mcookie"
> =20
>  RDEPENDS_${PN} +=3D "util-linux-mcookie"
> =20
>  FILES_${PN} +=3D "${libdir}X11/xinit"
> -
> -SRC_URI[md5sum] =3D "bc4e8b7d1919597cc37a0d24aa149dda"
> -SRC_URI[sha256sum] =3D "ba76e36e1a42a7cf76505b7e6fc4777f5d14f45ddff74341=
abfb7dd10d5fe04c"


Thanks,

Paul


[1] http://git.openembedded.org/openembedded-core/commit/?id=3D234071f22c21=
83ea28cda55bac8f68cb47e8f0e1

--=-WtNJDZWWWXy9U8UJnUsu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7iVqcACgkQPX1aK2wOHViBBACdEFxTqRlMgBzs0Q5vXoC6aLwW
QlUAn3sjx8jHFneqSIZsQi6DXE8LoPKD
=7G5i
-----END PGP SIGNATURE-----

--=-WtNJDZWWWXy9U8UJnUsu--
