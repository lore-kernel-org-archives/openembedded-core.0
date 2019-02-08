Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9AA71A0C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 23:12:54 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f16so5956585wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 15:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ycJvgGECRrYddugyBB6AsMTuV7SB1c9gpWhVJ3CcLuw=;
	b=Zt9ZUF/FWAntvt9QISa4bfUljXC3NJTYbuGiXeVhdEHXrU+qb3YO5zSPRI/4EY1bpE
	lPglKnaeG1VWwv3YTEC0bbvo8k9BO3fB+SMmSVGaIzxpSvriCQMp9DojrgcoukyCssIX
	SjFblCiZYxbiR1NZqRXrZpkXTXfWxvdDeVwlXqYEA9pq4HOEKnzjpujcspet7eulv3Ji
	IqjrchHeAgti/HgzNooxTBUb2BZ0BAvZjG9fAAiNykmKmWAF+N5CXTQOTJkecynl4vNe
	nZYQTSIh7+8HAWDYzWXq/aO5wTHPwYJQREo0ox0CWxPhZ4YxmvkxyaSMH7DzdGApZP2Z
	nQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ycJvgGECRrYddugyBB6AsMTuV7SB1c9gpWhVJ3CcLuw=;
	b=PUZd/rU5iASNwnZRlPd06ZU4OzWD3qK/Dy52rhwjLWMWX8y6epEVO1wt2oaxW+ttWX
	qhn2JPEPs53NLvKc3I60kabjllbd0BRBLHgxn/dWtbvFtvWuqt6ZXuLniy/AP09G1uTE
	J0Vi8Lpe1v4s1KsHdM48F1Wq6F6usMIt5SAhIObYOTgSmQD216pngAmur2C6PcJWJkoF
	WDAbkS1Z7qCuQ91/opUJxR0l1nBMr1xnkAyY/Vn3TqNIu3lNt/AhKjdV1LTFk2bFt7Mr
	YXp+tkRsxZB2eGw78tnWyFnPgpGACjxzQVUeO2PrUnJcL5yvC4c4a0n1lEnbTrIove/8
	ANmA==
X-Gm-Message-State: AHQUAuafUw/7IvbDTdv7hVBlijP3Cy3HKmFA/MKs29twIMO0rqiS+zg5
	1IQpzunro9+NLDEwTMEWEKg=
X-Google-Smtp-Source: AHgI3IabPFGoCOjY0FUPBXP8v8CQCkVMqMggZEKtpzU8d4CjLFBC89WnmcVdS5TZnKjNbQDq3HujFQ==
X-Received: by 2002:adf:f903:: with SMTP id b3mr19179813wrr.82.1549667575631; 
	Fri, 08 Feb 2019 15:12:55 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id z17sm539281wrs.75.2019.02.08.15.12.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Feb 2019 15:12:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 9 Feb 2019 00:12:55 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190208231255.GA2258@jama>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<bb8c993db03526b5f7ef16b2c076055b1ce6de40.1549637121.git.alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <bb8c993db03526b5f7ef16b2c076055b1ce6de40.1549637121.git.alex.kanavin@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/12] qemu: enable virglrenderer and glx options for native/nativesdk builds
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
X-List-Received-Date: Fri, 08 Feb 2019 23:12:55 -0000
X-Groupsio-MsgNum: 120997
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 08, 2019 at 03:45:43PM +0100, Alexander Kanavin wrote:
> Except for ming32/darwin, which do not support them.
>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index c127434b020..95e9e0ede77 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -74,15 +74,15 @@ PACKAGECONFIG ??=3D " \
>      fdt sdl kvm \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
>  "
> -PACKAGECONFIG_class-native ??=3D "fdt alsa kvm"
> -PACKAGECONFIG_class-nativesdk ??=3D "fdt sdl kvm"
> +PACKAGECONFIG_class-native ??=3D "fdt alsa kvm virglrenderer glx"
> +PACKAGECONFIG_class-nativesdk ??=3D "fdt sdl kvm virglrenderer glx"

Didn't you want to enable gtk+ here as well?

>  # Handle distros such as CentOS 5 32-bit that do not have kvm support
>  PACKAGECONFIG_class-native_remove =3D "${@'kvm' if not os.path.exists('/=
usr/include/linux/kvm.h') else ''}"
> =20
> -# Disable kvm on targets that do not support it
> -PACKAGECONFIG_remove_darwin =3D "kvm"
> -PACKAGECONFIG_remove_mingw32 =3D "kvm"
> +# Disable kvm/virgl/mesa on targets that do not support it
> +PACKAGECONFIG_remove_darwin =3D "kvm virglrenderer glx gtk+"
> +PACKAGECONFIG_remove_mingw32 =3D "kvm virglrenderer glx gtk+"
> =20
>  PACKAGECONFIG[sdl] =3D "--enable-sdl --with-sdlabi=3D2.0,--disable-sdl,l=
ibsdl2"
>  PACKAGECONFIG[virtfs] =3D "--enable-virtfs --enable-attr,--disable-virtf=
s,libcap attr,"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXF4M9wAKCRA3VSO3ZXaA
HL8TAKCclaa521Fxh/4shedvqLNq0NtK4QCdHIV+SMIfVWNM6oXqXXZPyUr8/3M=
=96n5
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
