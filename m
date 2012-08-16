Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T1xZe-0002k9-QP; Thu, 16 Aug 2012 12:45:10 +0200
Received: by weyr6 with SMTP id r6so1703037wey.6
	for <multiple recipients>; Thu, 16 Aug 2012 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WxnZm3r85b4RkjAlMkhIo3jp2A5RCu46fHcGk1SZqR0=;
	b=D1vWvFH91qmvpMqR7cEbU9I9ncaRXr8oOF2eKuz7fUplUFIiZpT48C5+Zp8bYA/mRt
	MAdiFtbtPq0/zNaRsaEGFHJyEeduU3mD49oE/PatsVqkbt10EApli58D6BcfINICIDYZ
	U4Uhb5AiFhacmepfTpGCW7wvP88UvA3QO9oD7ODQ4Cc2MX3M0fsZjtUSmhM+PWXL319R
	j80kgkjNvQV08w3w60l8GloZhKrvYhR4GlCqX/FjhpvPjnOXTQq644k/LYCAYC+a0DCM
	7SwAbSiNsA3zkNCsEiqKQBiXTZRWfG2RnIQuZ8rQwXf5lcdve5Uu2Iqzmt7g7EX5ezz4
	pVdA==
Received: by 10.216.192.85 with SMTP id h63mr407033wen.7.1345113193452;
	Thu, 16 Aug 2012 03:33:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm4776486wix.6.2012.08.16.03.33.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 03:33:12 -0700 (PDT)
Date: Thu, 16 Aug 2012 12:33:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120816103308.GA32088@jama.jama.net>
References: <20120815133202.50B6D10218@opal>
MIME-Version: 1.0
In-Reply-To: <20120815133202.50B6D10218@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Jackie Huang : gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Thu, 16 Aug 2012 10:45:10 -0000
X-Groupsio-MsgNum: 27566
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 01:32:02PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
>=20
> Author: Jackie Huang <jackie.huang@windriver.com>
> Date:   Thu Aug  9 10:30:30 2012 +0800
>=20
> gdk-pixbuf: fix the postinstall script failure when no icon is installed
>=20
> If gtk+ is added to core-image-minimal, postinstall script failed on boot:
>=20
> Running postinst /etc/rpm-postinsts/104...
> gtk-update-icon-cache: No theme index file.
> ERROR: postinst /etc/rpm-postinsts/104 failed.
>=20
> This patch fixed the postinstall script to check for the icon
> file first and not run the gtk-update-icon-cache if no icon
> is installed.
>=20
> [YOCTO #2905]
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>


Even with this patch I get:
Configuring gdk-pixbuf-loader-png.
gtk-update-icon-cache: No theme index file.
Configuring gdk-pixbuf-loader-jpeg.
gtk-update-icon-cache: No theme index file.
Configuring gdk-pixbuf-loader-xpm.
gtk-update-icon-cache: No theme index file.
Configuring gdk-pixbuf-loader-gif.
gtk-update-icon-cache: No theme index file.
Collected errors:
 * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script
 * returned status 1.
 * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
 * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script
 * returned status 1.
 * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
 * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script
 * returned status 1.
 * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
 * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script
 * returned status 1.
 * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.

And even worse on other device, where gtk-update-icon-cache failed with=20
Illegal instruction when postinst was executed for first time.. (probably=
=20
because of binutils-2.23)

SHR root@gjama ~ $ gtk-update-icon-cache -q /usr/share/icons/shr/
Illegal instruction

Configuring gdk-pixbuf-loader-png.
gtk-update-icon-cache: Failed to open file /usr/share/icons/gnome/.icon-the=
me.cache : File exists
gtk-update-icon-cache: Failed to open file /usr/share/icons/hicolor/.icon-t=
heme.cache : File exists
gtk-update-icon-cache: Failed to open file /usr/share/icons/shr/.icon-theme=
=2Ecache : File exists
gtk-update-icon-cache: No theme index file.
Configuring gdk-pixbuf-loader-jpeg.
gtk-update-icon-cache: Failed to open file /usr/share/icons/gnome/.icon-the=
me.cache : File exists
gtk-update-icon-cache: Failed to open file /usr/share/icons/hicolor/.icon-t=
heme.cache : File exists
gtk-update-icon-cache: Failed to open file /usr/share/icons/shr/.icon-theme=
=2Ecache : File exists
gtk-update-icon-cache: No theme index file.
Configuring gdk-pixbuf-loader-xpm.
gtk-update-icon-cache: Failed to open file /usr/share/icons/gnome/.icon-the=
me.cache : File exists
gtk-update-icon-cache: Failed to open file /usr/share/icons/hicolor/.icon-t=
heme.cache : File exists
gtk-update-icon-cache: Failed to open file /usr/share/icons/shr/.icon-theme=
=2Ecache : File exists
gtk-update-icon-cache: No theme index file.
Configuring gdk-pixbuf-loader-gif.
gtk-update-icon-cache: Failed to open file /usr/share/icons/gnome/.icon-the=
me.cache : File exists
gtk-update-icon-cache: Failed to open file /usr/share/icons/hicolor/.icon-t=
heme.cache : File exists
gtk-update-icon-cache: Failed to open file /usr/share/icons/shr/.icon-theme=
=2Ecache : File exists
gtk-update-icon-cache: No theme index file.
Collected errors:
 * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script returned=
 status 1.
 * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
 * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script returne=
d status 1.
 * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
 * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script returned=
 status 1.
 * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
 * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script returned=
 status 1.
 * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.


>=20
> ---
>=20
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/re=
cipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> index 484fb12..159bdae 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> @@ -21,7 +21,7 @@ SRC_URI =3D "http://ftp.acc.umu.se/pub/GNOME/sources/gd=
k-pixbuf/2.24/gdk-pixbuf-${
>  SRC_URI[md5sum] =3D "72f39b34b20f68148c1609bd27415412"
>  SRC_URI[sha256sum] =3D "da7a3f00db360913716368e19e336402755cafa93769f3cf=
a28a969303e4bee1"
> =20
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  inherit autotools pkgconfig gettext
> =20
> @@ -62,7 +62,13 @@ fi
> =20
>  GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixb=
uf-query-loaders --update-cache
> =20
> -test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q ${d=
atadir}/icons/hicolor
> +if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; th=
en
> +    for icondir in /usr/share/icons/*; do
> +        if [ -d ${icondir} ]; then
> +            gtk-update-icon-cache -q ${icondir}
> +        fi
> +    done
> +fi
>  }
> =20
>  PACKAGES_DYNAMIC +=3D "gdk-pixbuf-loader-*"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAszGQACgkQN1Ujt2V2gBwjvwCgl25qMKaK76gKwnul0OBv5oBi
tGEAoJBmF0tFPsKmvzmzGtCTf/H96qXq
=Y//l
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
