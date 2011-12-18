Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RcDV8-0000DQ-Ie
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 10:57:50 +0100
Received: by eeit10 with SMTP id t10so824302eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 01:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=96xr78EOORL2hANxFQHXgUYO/1hMuQTb016OdHXdLE0=;
	b=r+9rlYyDVeX/rwLbH9NszGF9pIDvxv+fEM6tj9c0Y5Ho9Z/Z+u7Ziwc8yIaWZSTkFw
	tj35nyCnzPKyd9edqSHgh5Jo1hH8FzcHUwYa9IsKRpiQpCYfGP1JCBlyyNHDNsfVXTFz
	QodpmECKP9HVoUpm1I8o61gQahwWwwc+sVA1c=
Received: by 10.14.28.14 with SMTP id f14mr2343676eea.93.1324201849372;
	Sun, 18 Dec 2011 01:50:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z43sm27558045eef.7.2011.12.18.01.50.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Dec 2011 01:50:48 -0800 (PST)
Date: Sun, 18 Dec 2011 10:50:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111218095036.GJ3997@jama.jama.net>
References: <1324200731-10753-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1324200731-10753-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] libsdl 1.2.14: fix packaging
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
X-List-Received-Date: Sun, 18 Dec 2011 09:57:50 -0000
X-Groupsio-MsgNum: 14396
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fU0UwhtRbpo05rnG"
Content-Disposition: inline

--fU0UwhtRbpo05rnG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 18, 2011 at 10:32:11AM +0100, Koen Kooi wrote:
> For some reason the -config script was shipped in ${PN} leading to shlibs=
 renaming issues:
>=20
> What we want, and how meta-oe used to do it:
> 	libsdl-1.2-0_1.2.14-r0.0_armv7a.ipk
>=20
> Current OE-core status:
> 	libsdl_1.2.14-r2_armv7a.ipk
>=20
> With this commit we get both proper shlib renaming and the -dev package n=
ow has all the dev files
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes=
-graphics/libsdl/libsdl_1.2.14.bb
> index a28a88a..761995e 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
> @@ -15,7 +15,7 @@ PROVIDES =3D "virtual/libsdl"
>  DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libg=
l', '', d)} virtual/libx11 libxext libxrandr libxrender tslib"
>  DEPENDS_virtclass-nativesdk =3D "libx11-nativesdk libxrandr-nativesdk li=
bxrender-nativesdk libxext-nativesdk"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
>             file://configure_tweak.patch \
> @@ -57,4 +57,6 @@ do_configure_prepend() {
>          export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR
>  }
> =20
> +FILES_${PN}-dev +=3D "${bindir}/sdl-config""

Looks like extra quote                      ^

Cheers,

> +
>  BBCLASSEXTEND =3D "nativesdk"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fU0UwhtRbpo05rnG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7tt2wACgkQN1Ujt2V2gBxDaQCdH2kGBt705uhsfdlxSzkjtvrv
+U8AoIueLqjvMgdjrB6+2gWERJZslztf
=1h9G
-----END PGP SIGNATURE-----

--fU0UwhtRbpo05rnG--
