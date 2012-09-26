Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGrEq-0000U9-75
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 15:01:16 +0200
Received: by wibhn17 with SMTP id hn17so569157wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FTvbg75FFYedZQHoq9gMTimC4/MF+zkWW97pVFIyZgs=;
	b=M7rpwj+yRSlk4RPxay2xxF8bHelpGZhWRytJ94ursJn252TjVm+fJVwClgoT1qwxQQ
	aUeWGuxdR5cbVrPz1j5GWPic2FGavewpRzRLZYedeuhAZ48Xq8OM+xMfPKe7R7/arIYb
	Xhz/OiJMm7WUuuxs6gXhf3VF6eR67w8R58oUa2wz1IkxT2Z/7YtuaCgr/WRuFtRItfFU
	lM0bsjU/qKDzZ7QafwFZTPQs2i7C9WIvGqj2XzC11tMYfBaZ0VE1/29uTURexdWubBbm
	b4dJOszN5Lo5GiSlhPgVKtFiseqMJf73Xa9iA0dZf4Cyp+fQfVpioBLwm8THkvtfPkGQ
	vR9w==
Received: by 10.180.104.5 with SMTP id ga5mr1033614wib.10.1348662231914;
	Wed, 26 Sep 2012 05:23:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id do5sm6574671wib.10.2012.09.26.05.23.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 05:23:50 -0700 (PDT)
Date: Wed, 26 Sep 2012 14:23:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120926122357.GJ3313@jama.jama.net>
References: <1348661505.31293.106.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348661505.31293.106.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Use qemu to run postinsts in offline root mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 13:01:16 -0000
X-Groupsio-MsgNum: 29915
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VSaCG/zfRnOiPJtU"
Content-Disposition: inline

--VSaCG/zfRnOiPJtU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 01:11:44PM +0100, Phil Blundell wrote:
> This makes it possible to use gdk-pixbuf on a read-only rootfs.

Isn't this issue resolved in "[RFC 0/7] Postinstall improvements" too?

Cheers,

> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   19 ++++++++++++--=
-----
>  1 file changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/re=
cipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> index 82a7eaa..df35b8d 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd00=
2f49e7bb854063f7e7 \
> =20
>  SECTION =3D "libs"
> =20
> -DEPENDS =3D "libpng glib-2.0 jpeg"
> +DEPENDS =3D "libpng glib-2.0 jpeg qemu-native"
>  DEPENDS_append_linuxstdbase =3D " virtual/libx11"
> =20
>  SRC_URI =3D "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk=
-pixbuf-${PV}.tar.xz \
> @@ -21,9 +21,9 @@ SRC_URI =3D "http://ftp.acc.umu.se/pub/GNOME/sources/gd=
k-pixbuf/2.24/gdk-pixbuf-${
>  SRC_URI[md5sum] =3D "72f39b34b20f68148c1609bd27415412"
>  SRC_URI[sha256sum] =3D "da7a3f00db360913716368e19e336402755cafa93769f3cf=
a28a969303e4bee1"
> =20
> -PR =3D "r7"
> +PR =3D "r8"
> =20
> -inherit autotools pkgconfig gettext
> +inherit autotools pkgconfig gettext qemu
> =20
>  LIBV =3D "2.10.0"
> =20
> @@ -41,26 +41,31 @@ PACKAGES =3D+ "${PN}-xlib"
>  FILES_${PN}-xlib =3D "${libdir}/*pixbuf_xlib*${SOLIBS}"
>  ALLOW_EMPTY_${PN}-xlib =3D "1"
> =20
> +loadersdir =3D "${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders"
> +
>  FILES_${PN} =3D "${bindir}/gdk-pixbuf-query-loaders \
>  	${libdir}/lib*.so.*"
> =20
>  FILES_${PN}-dev +=3D " \
>  	${bindir}/gdk-pixbuf-csource \
>  	${includedir}/* \
> -	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.la \
> +	${loadersdir}/*.la \
>  "
> =20
>  FILES_${PN}-dbg +=3D " \
>          ${libdir}/.debug/* \
> -	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
> +	${loadersdir}/.debug/* \
>  "
> =20
>  postinst_pixbufloader () {
>  if [ "x$D" !=3D "x" ]; then
> -    exit 1
> +	if [ ! -f "$D${loadersdir}/../loaders.cache" ]; then
> +		${@qemu_target_binary(d)} -drop-ld-preload -L $D $D${bindir}/gdk-pixbu=
f-query-loaders > "$D${loadersdir}/../loaders.cache"
> +	fi
> +	exit 0
>  fi
> =20
> -GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixb=
uf-query-loaders --update-cache
> +GDK_PIXBUF_MODULEDIR=3D"${loadersdir}" gdk-pixbuf-query-loaders --update=
-cache
> =20
>  if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; th=
en
>      for icondir in /usr/share/icons/*; do
> --=20
> 1.7.10.4
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VSaCG/zfRnOiPJtU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBi890ACgkQN1Ujt2V2gBy4BgCdEH8Lon95ZyfHzeRdA8hnwaQf
6dAAn2sFDWNmNiArFROEHHbuA5GJS2A2
=vdF1
-----END PGP SIGNATURE-----

--VSaCG/zfRnOiPJtU--
