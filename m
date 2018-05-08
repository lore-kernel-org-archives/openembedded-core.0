Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id F15CB74E5F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 21:18:37 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a8so21049707wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 14:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=INL9RWh8pGiXPMR4umzCz+/kIZVjABJvMEXYXRtk7Y4=;
	b=Fjtc0c0khHVnW64SvlAAAMLMQyjZh8qyvTEFA+pGmNNkumKHbWuSw7QRxN1dqsfatm
	WAlbu97eydCy3k1Jc0KPEQaRGOrtxpwwKJ/ajCzcOSLYeRYt/5x/pmAeu5bbbxPLoIT6
	g9O7M7Pgs8It+xcehIOmfm2aMoCTqn7gDIpXFI24/wa4J2H/Q52sXwoFk2Z9M2Lef5mB
	DnVKr8H2kC6l5ed1gxRLpmy2htSj6eJ/+V+XHk3qrs1eAHSeaIlU5w9hFjpf4TVEE/QR
	gPr7TBR7m7jjVrATmwzLSi9SQVHfhrItFVkvHrVrY+5XtDdKyLuXf4jOtkZhFcCkWtgi
	pZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=INL9RWh8pGiXPMR4umzCz+/kIZVjABJvMEXYXRtk7Y4=;
	b=nTpbcNWZBMb0nTMtrL5JoiviHykBSoRal96H0T+7h2+pB2ulKH/sR1dPpK/RZoUGy8
	eTV1HtMfg7sd66jJrKoAZFLlWolhe1obI8BdtQFKR0DlRtrhWtLSuFi75mZC/L6tesHG
	05X6cY4F1u4F5KkDkwzMEtOi5DvlePOdk9DdSE/caMdOvYyUhvh+1c+i8bIIMXQec2In
	driLTwQFT/0mpXRJ5xj2qSMpR7hSZE+bNOEviEjnSeKEHsJWoYF0cliAL047fLaCe4Bd
	xfEQa4O18lPc1XZCUCQDp9KgyniuTgEDshOXOeBdJsFzBbV75ahKcezZBQVfXtjEsEhl
	wYmQ==
X-Gm-Message-State: ALKqPweD2jiq0vHw4T42M+DnKaLdUQIoEy8RlEFLI+L1cBlWpPqMYD88
	8Qi2z8jr/Cz9paETNwygATQ=
X-Google-Smtp-Source: AB8JxZojolf1n+IZ97lpaAp1W2nKgqcCQVHAQkORuzGUegd2Qu8jVO8fDSHnJvF/cSCanU+ruw1zng==
X-Received: by 2002:a1c:d53:: with SMTP id 80-v6mr4502845wmn.138.1525814318280;
	Tue, 08 May 2018 14:18:38 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g7-v6sm29581390wrb.60.2018.05.08.14.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 May 2018 14:18:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 May 2018 23:18:44 +0200
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20180508211844.GA2573@jama>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1523387170-30191-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] wayland: upgrade to 1.15.0
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
X-List-Received-Date: Tue, 08 May 2018 21:18:38 -0000
X-Groupsio-MsgNum: 111137
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2018 at 03:06:09PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Official announcement:
> https://lists.freedesktop.org/archives/wayland-devel/2018-April/037767.ht=
ml
>=20
> | libwayland-egl is now part of libwayland, and will presumably be removed
> | from mesa in the not too distant future.
>=20
> Update mesa recipe by removing corresponding libwayland-egl entries.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc                                | 7 +=
+++---
>  .../wayland/{wayland_1.14.0.bb =3D> wayland_1.15.0.bb}               | 4=
 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
>  rename meta/recipes-graphics/wayland/{wayland_1.14.0.bb =3D> wayland_1.1=
5.0.bb} (92%)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index b501b7e..c3a8e76 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -119,7 +119,6 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libgles1-mesa libgles1-mesa-dev \
>               libgles2-mesa libgles2-mesa-dev \
>               libgles3-mesa libgles3-mesa-dev \
> -             libwayland-egl libwayland-egl-dev \
>               libxatracker libxatracker-dev \
>               mesa-megadriver mesa-vulkan-drivers \
>              "
> @@ -134,6 +133,10 @@ do_install_append () {
>      # it was packaged in libdricore9.1.3-1 and preventing upgrades when =
debian.bbclass was used=20
>      rm -f ${D}${sysconfdir}/drirc
>      chrpath --delete ${D}${libdir}/dri/*_dri.so || true
> +
> +    # libwayland-egl has been moved to wayland 1.15+
> +    rm -f ${D}${libdir}/libwayland-egl.so*
> +    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc

Shouldn't /usr/lib/libwayland-egl.la be removed as well? Now I'm getting
many do_prepare_recipe_sysroot failures because both mesa and wayland
provide this file.

>  }
> =20
>  # For the packages that make up the OpenGL interfaces, inject variables =
so that
> @@ -204,7 +207,6 @@ FILES_libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
>  FILES_libgl-mesa =3D "${libdir}/libGL.so.*"
>  FILES_libglapi =3D "${libdir}/libglapi.so.*"
>  FILES_libosmesa =3D "${libdir}/libOSMesa.so.*"
> -FILES_libwayland-egl =3D "${libdir}/libwayland-egl.so.*"
>  FILES_libxatracker =3D "${libdir}/libxatracker.so.*"
> =20
>  FILES_${PN}-dev =3D "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan"
> @@ -216,7 +218,6 @@ FILES_libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* $=
{includedir}/GLES ${libdir}/p
>  FILES_libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 $=
{libdir}/pkgconfig/glesv2.pc"
>  FILES_libgles3-mesa-dev =3D "${includedir}/GLES3"
>  FILES_libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h=
 ${libdir}/pkgconfig/osmesa.pc"
> -FILES_libwayland-egl-dev =3D "${libdir}/pkgconfig/wayland-egl.pc ${libdi=
r}/libwayland-egl.*"
>  FILES_libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxatra=
cker.la \
>                            ${includedir}/xa_tracker.h ${includedir}/xa_co=
mposite.h ${includedir}/xa_context.h \
>                            ${libdir}/pkgconfig/xatracker.pc"
> diff --git a/meta/recipes-graphics/wayland/wayland_1.14.0.bb b/meta/recip=
es-graphics/wayland/wayland_1.15.0.bb
> similarity index 92%
> rename from meta/recipes-graphics/wayland/wayland_1.14.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.15.0.bb
> index 1a9ff98..788105b 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.14.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
> @@ -15,8 +15,8 @@ DEPENDS =3D "expat libxml2 libffi wayland-native"
>  SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
>  	   file://fixpathinpcfiles.patch \
>             "
> -SRC_URI[md5sum] =3D "0235f6075c32c3be61cff94fa0b9f108"
> -SRC_URI[sha256sum] =3D "ed80cabc0961a759a42092e2c39aabfc1ec9a13c86c98bbe=
2b812f008da27ab8"
> +SRC_URI[md5sum] =3D "b7393c17fdce9a8d383edab656c92fd2"
> +SRC_URI[sha256sum] =3D "eb3fbebb8559d56a80ad3753ec3db800f587329067962dbf=
65e14488b4b7aeb0"
> =20
>  inherit autotools pkgconfig
> =20
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvIUMgAKCRA3VSO3ZXaA
HP3dAJ9N2lf2WnMxG264I1RyLUURDOzrJgCdFAYmj9lcj42eQeVP2MaRdQLGQr0=
=V1Z1
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
