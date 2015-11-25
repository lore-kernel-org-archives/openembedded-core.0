Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1C3D760132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 15:01:33 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so141521229wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 07:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lrsXDUgVRWLJOOKGyDzr09CrXOHHC7fxneK3fqbOB34=;
	b=Jy6xMeNu8PSmd1E/UkZ3u6tby4c/8QI667k62WGLrs0uXYdn4TFcy2lODs+eE6vsCW
	xf/vl1CsCdf687i+JkJ6IVtTxvX9SSiuia1N8Cg/xYoDqyXmxJNszAqUv/9hh+Z5cS6Y
	baXnukC8UqBEW/capmfkQN/u5XzuYmE+VXecemKM745lim8kfnMVtLYYOcJ6vr6kBf3b
	DyD5mE7JtxPWholaXh38B4TDj46ctKh9SsGRppsVA0E8dvclWJawTov54CDw0vSwTUup
	Kngnl4+Z1DcOxqKApBttl1XOhUuy4qsicrBaJSbnJdDNACuPVVJYimYc6LzzWE1dSRu+
	lG4w==
X-Received: by 10.194.192.198 with SMTP id hi6mr43853378wjc.141.1448463694009; 
	Wed, 25 Nov 2015 07:01:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	vr10sm23559799wjc.38.2015.11.25.07.01.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Nov 2015 07:01:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Nov 2015 16:02:07 +0100
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20151125150207.GP17303@jama>
References: <cover.1448455166.git.jussi.kukkonen@intel.com>
	<21d1633f21cba7e686512da7bc843de7e3ccf3d7.1448455166.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <21d1633f21cba7e686512da7bc843de7e3ccf3d7.1448455166.git.jussi.kukkonen@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] gstreamer1.0-plugins-good: Fix gudev dependency
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
X-List-Received-Date: Wed, 25 Nov 2015 15:01:34 -0000
X-Groupsio-MsgNum: 73952
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjXtncIm5b3tWrFJ"
Content-Disposition: inline

--qjXtncIm5b3tWrFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2015 at 03:05:37PM +0200, Jussi Kukkonen wrote:
> libgudev is now it's own library (also provided by udev).

Duplicates http://patchwork.openembedded.org/patch/107479/

>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.=
inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> index 1119e10..c2ada4d 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
> @@ -20,7 +20,7 @@ PACKAGECONFIG[pulseaudio] =3D "--enable-pulse,--disable=
-pulse,pulseaudio"
>  PACKAGECONFIG[cairo]      =3D "--enable-cairo,--disable-cairo,cairo"
>  PACKAGECONFIG[flac]       =3D "--enable-flac,--disable-flac,flac"
>  PACKAGECONFIG[gdk-pixbuf] =3D "--enable-gdk_pixbuf,--disable-gdk_pixbuf,=
gdk-pixbuf"
> -PACKAGECONFIG[gudev]      =3D "--with-gudev,--without-gudev,udev"
> +PACKAGECONFIG[gudev]      =3D "--with-gudev,--without-gudev,libgudev"
>  PACKAGECONFIG[jack]       =3D "--enable-jack,--disable-jack,jack"
>  PACKAGECONFIG[jpeg]       =3D "--enable-jpeg,--disable-jpeg,jpeg"
>  PACKAGECONFIG[libpng]     =3D "--enable-libpng,--disable-libpng,libpng"
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

--qjXtncIm5b3tWrFJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZVzW4ACgkQN1Ujt2V2gBy3PQCeJZyPAtRh0fkT7BeziNk5qTce
2FQAoI+XORDKWy2xGlXJmP1SI8n7lAd8
=oKUJ
-----END PGP SIGNATURE-----

--qjXtncIm5b3tWrFJ--
