Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGxiF-0003De-MA
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 20:51:31 +0200
Received: by bkat8 with SMTP id t8so4099719bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 11:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jd5qwbmi4bhQ7TmaGITPsrcbfPiMYoJmyyNl8DoXRGo=;
	b=a66bm4tWoyLOvU7rfVG5nfhdbsklCpB17rR8iRom4oWSA2OQnBQDQ7xDx0RYA4JFKE
	eb/8uWh9QMCAYqEKjMp3Uo9IaSu0cuZESgQUmtZnFYddze8DtkFB4375MlsRIAfhwGFp
	DnYXn11Q8zYO8TtwYih6qy+RXhrz+30RnQnWc=
Received: by 10.204.7.90 with SMTP id c26mr1856147bkc.92.1319136336216;
	Thu, 20 Oct 2011 11:45:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb9sm10778349bkc.4.2011.10.20.11.45.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 11:45:35 -0700 (PDT)
Date: Thu, 20 Oct 2011 20:45:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111020184529.GK3522@jama.jama.net>
References: <cover.1319135920.git.josh@linux.intel.com>
	<64effb846c8f9b1e6fe57a7e213d24d046439b99.1319135920.git.josh@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <64effb846c8f9b1e6fe57a7e213d24d046439b99.1319135920.git.josh@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] gst-plugins-good: correctly handle gconf schema
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
X-List-Received-Date: Thu, 20 Oct 2011 18:51:32 -0000
X-Groupsio-MsgNum: 11358
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P7Tqkd/m/Jnohiaz"
Content-Disposition: inline

--P7Tqkd/m/Jnohiaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 11:40:37AM -0700, Joshua Lock wrote:
> Add the shipped gconf schema to the gconfelements package and inherit the=
 gconf
> class so that schema processing is handled via post* scripts.
>=20
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  .../gstreamer/gst-plugins-good_0.10.30.bb          |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.b=
b b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
> index 96855aa..728175b 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
> @@ -7,9 +7,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6=
cdffcea4f398e37343 \
> =20
>  DEPENDS +=3D "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3t=
ag flac \
>  	    speex libsoup-2.4 pulseaudio"
> -PR =3D "r2"
> +PR =3D "r3"
> =20
> -inherit gettext
> +inherit gettext gconf
> =20
>  EXTRA_OECONF +=3D "--disable-aalib --disable-esd --disable-shout2 --disa=
ble-libcaca --disable-hal --without-check"
> =20
> @@ -20,3 +20,5 @@ do_configure_prepend() {
> =20
>  SRC_URI[md5sum] =3D "62fd7a3ef187c4f99b3d7c352d58dae9"
>  SRC_URI[sha256sum] =3D "b12cba90b27d8423cd0a808939098d19db3996cfb9bf5285=
07c6321782e095f6"
> +
> +FILES_${PN}-gconfelements +=3D "${sysconfdir}/gconf/schemas/gstreamer-0.=
10.schemas"

where do we get ${PN}-gconfelements in PACKAGES?

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--P7Tqkd/m/Jnohiaz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6gbEkACgkQN1Ujt2V2gBz/hwCfZYepyN/KSnUAfdLI6/vf7UQR
nzwAn3nmPPjTlsKYR1BlrLTDeNo/Edjd
=c7CH
-----END PGP SIGNATURE-----

--P7Tqkd/m/Jnohiaz--
