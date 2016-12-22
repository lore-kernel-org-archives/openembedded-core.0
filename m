Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25A99774DE;
	Thu, 22 Dec 2016 08:39:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m203so34722675wma.3;
	Thu, 22 Dec 2016 00:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1als5OyHzRrQUB++0UEiTmJ8S+8YfGucDI9JzuP8hZA=;
	b=FNMtpLXcVcaWbq1yUutbMCIGNLLpILgzAGBgFYHdYBZ6kJfTqX4gDsizauXpAQ9cis
	sDfppTHDMua43YcsXYwPoyoHsEVc9xczxQHNUNQVi4YTN6uiTsVUE50gIXP97TG/S/vk
	ANW59YLh77xInj1sdsmUYKhF3Ldy/P8+1JULCRxA76wWlW22xv5q17vCSjQuzXM3rerb
	zgOiablrcaZ1s6lRcjWsKxDS8ma+qxbjQ1hjKA973257C7ND8QiNk4sX6UHuVvp+svSQ
	3/K6ZBXveI59g+Z8vVOyxFEt7mVYez88OQl98UlAS/9nZA0YlcRaEDrlEbBdtGs+oBCr
	J4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1als5OyHzRrQUB++0UEiTmJ8S+8YfGucDI9JzuP8hZA=;
	b=KTpiRktd8wMH+hUodJ8BgDvN9MHluP1vIIVveDjF0zvyFeolrFlqw4Nv9WsWoov28b
	YOpxisDbQQuSwnjAbHZSb9byJZyJDKBJ00Z+gsEHKhYgB7/wU4nyLeuHauhZrjnKIKHA
	bblNOLcL8GKT89zuHvN8VwuiyE8qfG2eYfJat+5+tsvqTFwWL7sSU+pFBefTs1B5w9QI
	6OPztIrguLCgi+KTRJwfiOfHB0JfoPSEZeNNb52+sWe3GPv9I7w0+GFnxR1lgHaoGHwH
	Bi7N5+cwzxikV3Wa0yU/Vg9pfNZwrODVJPyX61adaFNFunUD6reH55/un0OddzuMCanP
	+kwA==
X-Gm-Message-State: AIkVDXKhaB5tEe018wcgW2dW0XyuFTaYiAMTvvV/omA0wr/KSJk/MKEe/lUAVGgLS9Cmiw==
X-Received: by 10.28.230.72 with SMTP id d69mr8780077wmh.119.1482395970566;
	Thu, 22 Dec 2016 00:39:30 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	204sm30973339wmj.7.2016.12.22.00.39.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Dec 2016 00:39:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 Dec 2016 09:39:29 +0100
To: openembedded-core@lists.openembedded.org,
	Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20161222083929.GA3544@jama>
References: <20161213225618.5301.37218@opal.openembedded.org>
	<20161213225620.32205501DD@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20161213225620.32205501DD@opal.openembedded.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 07/63: mesa: update to 13.0.2
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
X-List-Received-Date: Thu, 22 Dec 2016 08:39:30 -0000
X-Groupsio-MsgNum: 91158
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 10:56:25PM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit 0b3e3415c51dd534d8fc585ea1e3916375ddcc66
> Author: Andreas M=FCller <schnitzeltony@googlemail.com>
> AuthorDate: Tue Dec 6 01:19:17 2016 +0100
>=20
>     mesa: update to 13.0.2
>    =20
>     Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>

There are couple QA issues in mesa now:
mesa-13.0.2: mesa: Files/directories were installed but not shipped in
any package:
  /usr/lib/vdpau/libvdpau_r300.so.1.0.0
  /usr/lib/vdpau/libvdpau_nouveau.so.1.0.0
  /usr/lib/vdpau/libvdpau_nouveau.so.1.0
  /usr/lib/vdpau/libvdpau_nouveau.so.1
  /usr/lib/vdpau/libvdpau_nouveau.so
  /usr/lib/vdpau/libvdpau_r300.so.1.0
  /usr/lib/vdpau/libvdpau_r300.so.1
  /usr/lib/vdpau/libvdpau_r300.so
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
mesa: 8 installed and not shipped files. [installed-vs-shipped]


It might not be caused by this upgrade, but by addition of libvdpau, can
someone please look and fix it?

> ---
>  meta/recipes-graphics/mesa/{mesa-gl_13.0.1.bb =3D> mesa-gl_13.0.2.bb} | 0
>  meta/recipes-graphics/mesa/{mesa_13.0.1.bb =3D> mesa_13.0.2.bb}       | =
4 ++--
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_13.0.1.bb b/meta/recipes-=
graphics/mesa/mesa-gl_13.0.2.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_13.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_13.0.2.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_13.0.1.bb b/meta/recipes-gra=
phics/mesa/mesa_13.0.2.bb
> similarity index 83%
> rename from meta/recipes-graphics/mesa/mesa_13.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa_13.0.2.bb
> index 37ac15f..bef1fa5 100644
> --- a/meta/recipes-graphics/mesa/mesa_13.0.1.bb
> +++ b/meta/recipes-graphics/mesa/mesa_13.0.2.bb
> @@ -6,8 +6,8 @@ SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mes=
a-${PV}.tar.xz \
>             file://0001-Use-wayland-scanner-in-the-path.patch \
>  "
> =20
> -SRC_URI[md5sum] =3D "72b7f4d0c2407f367484abd201cb8276"
> -SRC_URI[sha256sum] =3D "71962fb2bf77d33b0ad4a565b490dbbeaf4619099c6d9722=
f04a73187957a731"
> +SRC_URI[md5sum] =3D "9442c2dee914cde3d1f090371ab04113"
> +SRC_URI[sha256sum] =3D "a6ed622645f4ed61da418bf65adde5bcc4bb79023c36ba7d=
6b45b389da4416d5"
> =20
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWFuRQAAKCRA3VSO3ZXaA
HB3OAJ9KVDFh7AncjjTbE/5R9FU2AAy20QCgujGfEmg3Ex737M55tprCjqNfy0M=
=a79Z
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
