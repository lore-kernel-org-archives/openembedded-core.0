Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URi5V-0003j8-D4
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 14:00:47 +0200
Received: by mail-pa0-f50.google.com with SMTP id bg2so2494070pad.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 04:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=eIaO/Olfh3TvAuaKUmBLUyxQI3S6M750nuap7ifuTQE=;
	b=yc8oMg+cm3EMr+xLOLmadWH6lYSacB2fiXukhg3iMOOOx7iXpuokXRYMhZD/L3HE5l
	4wk0rsZDTS8xQRAbeP5tqgeKduWqGlNy73rMFNvFYiHBGN/nX61Qykexae8LWHQEIkyb
	tdUIc94qNr5yXKR4Yt3El/uhY75LmVI3g2yO861iUv/gVPzT5U179asbvhVlIG6kS9Rf
	hqQhd1PYx8Sz7dlgqtfrczAVVeaoFCGOheL4yK5DnIHFvbjrmxNBhS4uzBGIOcAAaAGt
	tKHMGBKxx0KraDOMi+xZdY0TR5UMYrKA46xcEcNRFnoXgWZZYV2KSumpwPHCqmqwa6BB
	OM4A==
X-Received: by 10.68.94.227 with SMTP id df3mr27932627pbb.182.1366026195871;
	Mon, 15 Apr 2013 04:43:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ef4sm20023566pbd.38.2013.04.15.04.43.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 04:43:14 -0700 (PDT)
Date: Mon, 15 Apr 2013 13:43:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130415114312.GP2475@jama>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1366024028-24911-2-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1366024028-24911-2-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipes: Fix ALLOW_EMPTY with no package specified
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
X-List-Received-Date: Mon, 15 Apr 2013 12:01:04 -0000
X-Groupsio-MsgNum: 37935
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYfJCIN5rqlfy3K0"
Content-Disposition: inline

--WYfJCIN5rqlfy3K0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 12:07:02PM +0100, Richard Purdie wrote:
> There are various usages of ALLOW_EMPTY with no packages specified. This
> is not recommended syntax, nor is it likely to be supported in the future.
> This patch improves the references in OE-Core, either removing them if th=
ey're
> pointless (e.g. when PACKAGES=3D"") or specifying which package it applie=
s to.

Was this one sent by accident?

http://git.openembedded.org/openembedded-core/commit/?id=3Dfe81bd4f600877e6=
3433184cfc2e22c33bb77db6

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-connectivity/openssl/ocf-linux.inc           |    2 +-
>  meta/recipes-core/meta/package-index.bb                   |    1 -
>  meta/recipes-devtools/installer/adt-installer_1.0.bb      |    2 --
>  meta/recipes-extended/psmisc/psmisc.inc                   |    2 +-
>  meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb   |    6 +++++-
>  meta/recipes-multimedia/gstreamer/gst-plugins-package.inc |    2 --
>  6 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/ocf-linux.inc b/meta/recip=
es-connectivity/openssl/ocf-linux.inc
> index dba1f02..4efdc2f 100644
> --- a/meta/recipes-connectivity/openssl/ocf-linux.inc
> +++ b/meta/recipes-connectivity/openssl/ocf-linux.inc
> @@ -20,5 +20,5 @@ do_install() {
>      install -m 0644 ${S}/ocf/*.h ${D}${includedir}/crypto/
>  }
> =20
> -ALLOW_EMPTY =3D "1"
> +ALLOW_EMPTY_${PN} =3D "1"
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/=
meta/package-index.bb
> index 99ac1a8..76bf331 100644
> --- a/meta/recipes-core/meta/package-index.bb
> +++ b/meta/recipes-core/meta/package-index.bb
> @@ -2,7 +2,6 @@ DESCRIPTION =3D "Rebuild the package index"
>  LICENSE =3D "MIT"
> =20
>  INHIBIT_DEFAULT_DEPS =3D "1"
> -ALLOW_EMPTY =3D "1"
>  PACKAGES =3D ""
> =20
>  do_fetch[noexec] =3D "1"
> diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/=
recipes-devtools/installer/adt-installer_1.0.bb
> index 227e866..0cc3b33 100644
> --- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
> +++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
> @@ -26,8 +26,6 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D=
3f40d7994397109285ec7b81fdeb3
>                      file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
>  LICENSE =3D "MIT"
> =20
> -ALLOW_EMPTY =3D "1"
> -
>  PACKAGES =3D ""
> =20
>  PR =3D "r11"
> diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-exten=
ded/psmisc/psmisc.inc
> index 76af99e..68e0656 100644
> --- a/meta/recipes-extended/psmisc/psmisc.inc
> +++ b/meta/recipes-extended/psmisc/psmisc.inc
> @@ -15,7 +15,7 @@ S =3D "${WORKDIR}/psmisc-${PV}"
> =20
>  inherit autotools gettext
> =20
> -ALLOW_EMPTY =3D "1"
> +ALLOW_EMPTY_${PN} =3D "1"
> =20
>  PACKAGES =3D+ "fuser fuser-doc killall killall-doc pstree pstree-doc"
>  PACKAGES +=3D "psmisc-extras"
> diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/me=
ta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> index 37c70c2..210da37 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> @@ -14,7 +14,11 @@ PACKAGES =3D "\
>      gst-meta-debug \
>      gst-meta-video"
> =20
> -ALLOW_EMPTY =3D "1"
> +ALLOW_EMPTY_gst-meta-base =3D "1"
> +ALLOW_EMPTY_gst-meta-x11-base =3D "1"
> +ALLOW_EMPTY_gst-meta-audio =3D "1"
> +ALLOW_EMPTY_gst-meta-debug =3D "1"
> +ALLOW_EMPTY_gst-meta-video =3D "1"
> =20
>  RDEPENDS_gst-meta-base =3D "\
>      ${@base_contains('DISTRO_FEATURES', 'x11', 'gst-meta-x11-base', '', =
d)} \
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/=
meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> index f26aca5..3e9ef92 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> @@ -24,8 +24,6 @@ python populate_packages_prepend () {
>      d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
>  }
> =20
> -ALLOW_EMPTY =3D "1"
> -
>  PACKAGES +=3D "${PN}-apps ${PN}-meta ${PN}-glib"
>  FILES_${PN}-apps =3D "${bindir}"
> =20
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WYfJCIN5rqlfy3K0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFr59AACgkQN1Ujt2V2gByzNwCeI6+KxxiW8tKK5l2h4tZC77p7
wN4AoJ7qeHeFsGR3clDGGRIF51h+yh2k
=b7c/
-----END PGP SIGNATURE-----

--WYfJCIN5rqlfy3K0--
