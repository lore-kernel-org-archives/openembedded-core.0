Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 654096083B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 06:10:33 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id lf12so3465161vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 23:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TKOUKEBfOh8DafrRtmv8twAgGBP54ISjwCHKjBH76oo=;
	b=FanlaLmF1Uzuq0F03DASEHRI9eDJ6qZBKFitJ3CYkFr4qg49FiG8l18Em+7TkFOY1z
	a5QG32hFPpUChunxfa1xrBqXKYXXYkDl1fDbTbM9EqHXdzScydPkf3iTU0rku+pqo9HE
	Bp4XwpNnwU+k4WsIR9EvOLhFNvHzQ8CycMrJeMLNSgRHQbRdLi2DO431y2xTd8jTnczS
	tupLDSEkqm1QV2og0xtSbNLh+jnwt737M3ZQ55oPokfkpHiTIs7Y/GRJFbFVxkfYJ3Iu
	gzULeWqj6MoMlNEIaaYD3i6mZWiO+DwcX3aPYY5IcGR/uskJuILMZuVCUKDxORjviPaW
	W+4A==
X-Received: by 10.58.31.136 with SMTP id a8mr7473734vei.20.1398924634534;
	Wed, 30 Apr 2014 23:10:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	zz3sm20469923vdb.21.2014.04.30.23.10.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 23:10:33 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 1 May 2014 08:10:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140501061048.GQ2486@jama>
References: <1398890453-24966-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1398890453-24966-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: Enable GTK support for X11, Wayland and DirectFB
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 May 2014 06:10:39 -0000
X-Groupsio-MsgNum: 52720
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UPatEw4DQAkUPfEY"
Content-Disposition: inline

--UPatEw4DQAkUPfEY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2014 at 05:40:53PM -0300, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

This should include required bitbake version bump.

> ---
>  meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/rec=
ipes-multimedia/alsa/alsa-tools_1.0.27.bb
> index dfa9b97..3113481 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
> @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM =3D "file://hdsploader/COPYING;md5=3D9=
4d55d512a9ba36caa9b7df079bae1
>  SRC_URI =3D "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.b=
z2 \
>             file://mips_has_no_io_h.patch \
>             file://autotools.patch \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://ma=
kefile_no_gtk.patch', d)}"
> +           ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland dire=
ctfb', '', \
> +                                    'file://makefile_no_gtk.patch', d)}"
> =20
>  SRC_URI[md5sum] =3D "1ea381d00a6069a98613aa7effa4cb51"
>  SRC_URI[sha256sum] =3D "6562611b5a6560712f109e09740a9d4fa47296b07ed9590c=
b44139c5f154ada2"
> @@ -20,7 +21,7 @@ inherit autotools-brokensep
> =20
>  EXTRA_OEMAKE +=3D "GITCOMPILE_ARGS=3D'--host=3D${HOST_SYS} --build=3D${B=
UILD_SYS} --target=3D${TARGET_SYS} --with-libtool-sysroot=3D${STAGING_DIR_H=
OST} --prefix=3D${prefix}'"
> =20
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk=
+', '', d)}"
> +PACKAGECONFIG ??=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wa=
yland directfb', 'gtk+', '', d)}"
>  PACKAGECONFIG[gtk+] =3D ",,gtk+ gtk+3,"
> =20
>  # configure.ac/.in doesn't exist so force copy
> --=20
> 2.0.0.rc0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UPatEw4DQAkUPfEY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNh5WgACgkQN1Ujt2V2gBwuvACgmDFRfRNnO8QlprtD0KNVmF9D
ZsMAoJG1j+RjpigpInj4VakWTNralKTR
=d2k8
-----END PGP SIGNATURE-----

--UPatEw4DQAkUPfEY--
