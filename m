Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C82EA77230
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 22:42:03 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id c4so3725289wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 14:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=crrl5+s5hVZiWFLv3BgobykS3jyGx/BrPL+jVgI44P4=;
	b=Id7CWzZcTGcw30n1eEIIhnRCOm269endv73+0X8BYdZuSw3R25wbzYwvM60Fx6HL8I
	oYZjXblxlafkbEaFZ4stlO+CwszWkmhcNzML/Es6iAekdO/rSExU3ixnpyDWWllEVpX8
	EadzzBu+m6MRiENY7Db70JiYf4/N55TR/VvFD7MZErL96rkVPzE4R9h4Fjobdi7T9xFZ
	Uc3FdZO2qZAaK80y0AxqYdWyOejRrywSvzAXmIvsQzXsZ0CiU50r0sXDTxhmFuSOd4NH
	SwNoBDfacfkzoCsHLM0eacs25yyqPfJzOpq6DR8uboaFswiYQNzLEwgO3BpU+t/gX77c
	1zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=crrl5+s5hVZiWFLv3BgobykS3jyGx/BrPL+jVgI44P4=;
	b=KpOdRJvwu4QSaPcKPk8eVylAtn5XxXtDyrQhuujMkBbrQstp1V9vfpzXTz42tvC5Qf
	avhyOYzXmudBT35Rp1CLlvQHpioZuxeZr7XaguyK9EenVoZWg0Ss9ESYRlAjxTNUmO4n
	7A5OkZ13jJkACrYYpskvZm5uQceXVv+F6knXAs5/YP8y7D1sEx5V/lhAPBkJqo7xYAmx
	HWvhVEiz8wa32CW3IFmyzu1pVU77yB1LIJUbDn2aq42R4voJDLu9Kafjw/Yr9dxyREBh
	UPn4xgSTiXUZ704N38l9jwH5Q8AgfiqkKFv6Uf1xqKWMqaprqBcrqGvQNQvsy+6V78FY
	f09w==
X-Gm-Message-State: AMke39kzQijwjsi950w6uvRpFwGxD5igl69R17XPEpaxDeLHUJB4RklSeuuKKPtKv/SrcA==
X-Received: by 10.223.173.181 with SMTP id w50mr26983953wrc.177.1487112122960; 
	Tue, 14 Feb 2017 14:42:02 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t30sm2433066wra.52.2017.02.14.14.42.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Feb 2017 14:42:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 14 Feb 2017 23:42:03 +0100
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20170214224203.GA3023@jama>
References: <cover.1487065337.git.jussi.kukkonen@intel.com>
	<741d53dfad8951845bcae6ad8f7dfb75936db620.1487065337.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <741d53dfad8951845bcae6ad8f7dfb75936db620.1487065337.git.jussi.kukkonen@intel.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/11] mesa: Upgrade 13.0.4 -> 17.0.0
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
X-List-Received-Date: Tue, 14 Feb 2017 22:42:04 -0000
X-Groupsio-MsgNum: 93365
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2017 at 11:54:58AM +0200, Jussi Kukkonen wrote:
> * New feature release with lots of changes
> * Versioning change (17 as in 2017, no longer relates to GL bumps)

There is also this paragraph in release notes:
https://www.mesa3d.org/relnotes/17.0.0.html

Mesa 17.0.0 is a new development release. People who are concerned with
stability and reliability should stick with a previous release or wait
for Mesa 17.0.1.

If you don't want to wait for 17.0.1 than maybe mention it in commit
message.

> * OpenGL 4.5 support on Haswell
> * mesa now implements its own sha1 instead of having 5
>   configurable sha-providers
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../mesa/{mesa-gl_13.0.4.bb =3D> mesa-gl_17.0.0.bb}                 | 0
>  meta/recipes-graphics/mesa/mesa.inc                               | 8 +-=
------
>  meta/recipes-graphics/mesa/{mesa_13.0.4.bb =3D> mesa_17.0.0.bb}     | 7 =
+++----
>  3 files changed, 4 insertions(+), 11 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_13.0.4.bb =3D> mesa-gl_17.0.0=
=2Ebb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_13.0.4.bb =3D> mesa_17.0.0.bb} (=
74%)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb b/meta/recipes-=
graphics/mesa/mesa-gl_17.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_17.0.0.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 5d882b1..befb35e 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
> =20
>  EXTRA_OECONF =3D "--enable-shared-glapi"
> =20
> -PACKAGECONFIG ??=3D "gbm egl gles dri ${MESA_CRYPTO} \
> +PACKAGECONFIG ??=3D "gbm egl gles dri \
>  		${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
>  		${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
>  		"
> @@ -67,12 +67,6 @@ PACKAGECONFIG[xa]  =3D "--enable-xa, --disable-xa"
>  OSMESA =3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium-os=
mesa', 'osmesa', d)}"
>  PACKAGECONFIG[osmesa] =3D "--enable-${OSMESA},--disable-${OSMESA}"
> =20
> -# Mesa requires one of the following crypto implementation, pick one of =
them
> -MESA_CRYPTO ??=3D "openssl"
> -PACKAGECONFIG[openssl] =3D "--with-sha1=3Dlibcrypto,,openssl"
> -PACKAGECONFIG[nettle] =3D "--with-sha1=3Dlibnettle,,nettle"
> -PACKAGECONFIG[gcrypt] =3D "--with-sha1=3Dlibgcrypt,,libgcrypt"
> -
>  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>  FULL_OPTIMIZATION_append =3D " -fno-omit-frame-pointer"
> =20
> diff --git a/meta/recipes-graphics/mesa/mesa_13.0.4.bb b/meta/recipes-gra=
phics/mesa/mesa_17.0.0.bb
> similarity index 74%
> rename from meta/recipes-graphics/mesa/mesa_13.0.4.bb
> rename to meta/recipes-graphics/mesa/mesa_17.0.0.bb
> index 1416c9f..6576e3c 100644
> --- a/meta/recipes-graphics/mesa/mesa_13.0.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa_17.0.0.bb
> @@ -1,13 +1,12 @@
>  require ${BPN}.inc
> =20
> -SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
> +SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
>             file://replace_glibc_check_with_linux.patch \
>             file://disable-asm-on-non-gcc.patch \
>             file://0001-Use-wayland-scanner-in-the-path.patch \
>  "
> -
> -SRC_URI[md5sum] =3D "d088a921e935218833a8071cb672a574"
> -SRC_URI[sha256sum] =3D "a95d7ce8f7bd5f88585e4be3144a341236d8c0fc91f6feae=
c59bb8ba3120e726"
> +SRC_URI[md5sum] =3D "932e4171a86b14940c06812356486155"
> +SRC_URI[sha256sum] =3D "39db3d59700159add7f977307d12a7dfe016363e760ad822=
80ac4168ea668481"
> =20
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKOHugAKCRA3VSO3ZXaA
HP6hAJoCTqpl9w6l4ZF1pIyzlhTXwhu7+QCdEQdzei691ugVIes2XZiDgQGYRP0=
=EW0z
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
