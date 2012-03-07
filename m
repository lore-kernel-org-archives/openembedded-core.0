Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S5GLG-0001Vl-A6 for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 13:51:42 +0100
Received: from g225081112.adsl.alicedsl.de ([92.225.81.112]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S5GD2-0004pi-LW; Wed, 07 Mar 2012 12:43:12 +0000
Message-ID: <1331124185.3539.20.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 07 Mar 2012 13:43:05 +0100
In-Reply-To: <1331123568-23178-1-git-send-email-Chase.Maupin@ti.com>
References: <1331123568-23178-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCHv2] bluez4: add dependency on libcheck to enable test modules
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
X-List-Received-Date: Wed, 07 Mar 2012 12:51:42 -0000
X-Groupsio-MsgNum: 18500
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-81SHr09cEsX8XgKeH3da"

--=-81SHr09cEsX8XgKeH3da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 07.03.2012, 06:32 -0600 schrieb Chase Maupin:
> * The later versions of bluez such as 4.98 require libcheck
>   in order to build the test packages as enabled by the
>   --enable-test option passed in EXTRA_OECONF.
> * Failure to have the libcheck package availalbe results in the

availa*bl*e

>   configure script ignoring the --enable-test option and not
>   building the test modules.
> * Adding libcheck, which is greater than the minimum required
>   version of the check library of 0.9.6 allows building the
>   test modules.
> * Build tested for am335x-evm MACHINE type and run time tested
>   by back porting this fix to the oe-classic and arago setup
>   and booting on am335x-evm.

Do you have a patch for that so that others can profit from this work
too?

> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> * Updated in version 2:
>     * Bumped the PR of the bluez4_4.98 recipe.  I assume this is the
>       way to handle changes to the .inc file since there is no INC_PR
>=20
> ---
>  meta/recipes-connectivity/bluez/bluez4.inc     |    2 +-
>  meta/recipes-connectivity/bluez/bluez4_4.98.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-co=
nnectivity/bluez/bluez4.inc
> index 9158687..fbbe0bf 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff8=
7c09e5b7ccc2c4ca7e \
>                      file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90f=
b0e09 \
>                      file://src/main.c;beginline=3D1;endline=3D24;md5=3D9=
bc54b93cd7e17bf03f52513f39f926e \
>                      file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a=
40781ed30d50d8639323a184aeb191"
> -DEPENDS =3D "udev alsa-lib libusb dbus-glib glib-2.0"
> +DEPENDS =3D "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
>  RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> =20
>  ASNEEDED =3D ""
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.98.bb b/meta/recipe=
s-connectivity/bluez/bluez4_4.98.bb
> index 2412b1b..9a4c682 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.98.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.98.bb
> @@ -1,6 +1,6 @@
>  require bluez4.inc
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI +=3D "file://bluetooth.conf \
>              file://sbc_mmx.patch \

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-81SHr09cEsX8XgKeH3da
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk9XV9kACgkQPX1aK2wOHVimPQCdG8u6KAUn5vmUeyOtUOHIw3Tr
s94AnA/9hUMOukzWYV4KZsfCSO//RDG7
=bxKr
-----END PGP SIGNATURE-----

--=-81SHr09cEsX8XgKeH3da--
