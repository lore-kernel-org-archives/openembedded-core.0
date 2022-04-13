X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Wed, 13 Apr 2022 22:46:02 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] libbsd: upgrade 0.11.5 -> 0.11.6
Message-ID: <Ylc2ih7dovPZ2wFh@mail.local>
References: <1649364599-24962-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1649364599-24962-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-id: <openembedded-core.lists.openembedded.org>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org

Hello,

I fixed it up but this is now the third time this happens. Your patch
has a declared charset of 'y' which is not a thing and git am fails
with:

error: cannot convert from y to UTF-8
fatal: could not parse patch

You once again got the following prompt:

The following files are 8bit, but do not declare a Content-Transfer-Encodin=
g.
something.patch
Which 8bit encoding should I declare [UTF-8]?

At that point, you pressed y but you should simply press enter. Please
remember to do so next time.

On 08/04/2022 04:49:59+0800, wangmy wrote:
> License-Update:
> -  Copyright year updated to 2022
> -  License ISC changed as following:
>    remove "src/arc4random_openbsd.h" from Files
>    add "test/explicit_bzero.c" and "test/strtonum.c" to Files
>    add "Copyright =A9 2004 Otto Moerbeek <otto@drijf.net>"
>    add "Copyright =A9 2014 Google Inc."
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libbsd/{libbsd_0.11.5.bb =3D> libbsd_0.11.6.bb}             | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/libbsd/{libbsd_0.11.5.bb =3D> libbsd_0.11.6.=
bb} (90%)
>=20
> diff --git a/meta/recipes-support/libbsd/libbsd_0.11.5.bb b/meta/recipes-=
support/libbsd/libbsd_0.11.6.bb
> similarity index 90%
> rename from meta/recipes-support/libbsd/libbsd_0.11.5.bb
> rename to meta/recipes-support/libbsd/libbsd_0.11.6.bb
> index bb8766a070..74fc8ef4e5 100644
> --- a/meta/recipes-support/libbsd/libbsd_0.11.5.bb
> +++ b/meta/recipes-support/libbsd/libbsd_0.11.6.bb
> @@ -29,12 +29,12 @@ HOMEPAGE =3D "https://libbsd.freedesktop.org/wiki/"
>  # License: public-domain-Colin-Plumb
>  LICENSE =3D "BSD-3-Clause & BSD-4-Clause & ISC & PD"
>  LICENSE:${PN} =3D "BSD-3-Clause & ISC & PD"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0b31944ca2c1075410a30f0c17379=
d3b"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc2c635b94c8dcd3593f53e10fa8a4=
99e"
>  SECTION =3D "libs"
>=20
>  SRC_URI =3D "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
>=20
> -SRC_URI[sha256sum] =3D "1a9c952525635c1bb6770cb22e969b938d8e6a9d7912362b=
98ee8370599b0efd"
> +SRC_URI[sha256sum] =3D "19b38f3172eaf693e6e1c68714636190c7e48851e45224d7=
20b3b5bc0499b5df"
>=20
>  inherit autotools pkgconfig
>=20
> --
> 2.25.1
>=20

>=20
>=20
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
