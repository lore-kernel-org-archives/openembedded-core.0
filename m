Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 427A36B5D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 02:57:49 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so7511380eek.21
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jan 2014 18:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0vsJI7xUPDzfPzsxFFNyQK1uGRrV5octRrDuSR1CHsM=;
	b=hw4LTVRP8NbZGGpND4GnQsoy2mtwONe1y4gX6SdQVT7KxqvkjGXJNmoWXXThU4tjGC
	WPfsI5abUCthyaeIIfuHSuG0w3pxa0nBf1DiTFnN+oWESynBLpixJu9JrPdqlnf3LWKS
	WuVonIgdvM4b58meT2qxHac6D62ru6pDRL3GQEQ/T3x3qgw3h1sp53pZIfmHBYLEtloj
	M9UmBfWzYbtqS9fW8BLAORFmTU2pBqk843sqatvM3dhyqnN/w+dePF87t6exuEdTRbWu
	Hf4xyoc84XDNGSn1Edj9vURUCEqregB0lWn90h55V9jNnxSt5QtkYT+REh4MkXxjjQCt
	27ag==
X-Received: by 10.14.204.70 with SMTP id g46mr13872795eeo.84.1388977069752;
	Sun, 05 Jan 2014 18:57:49 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	e43sm166997357eep.7.2014.01.05.18.57.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Jan 2014 18:57:48 -0800 (PST)
Date: Mon, 6 Jan 2014 03:57:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Jacob Kroon <jacob.kroon@mikrodidakt.se>
Message-ID: <20140106025756.GD3709@jama>
References: <1388975494-14104-1-git-send-email-jacob.kroon@mikrodidakt.se>
MIME-Version: 1.0
In-Reply-To: <1388975494-14104-1-git-send-email-jacob.kroon@mikrodidakt.se>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-qt5][jansa/qt5-5.2.0][PATCH] Re-add qtjsbackend dependency for qtdeclarative in Qt 5.1.1
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
X-List-Received-Date: Mon, 06 Jan 2014 02:57:50 -0000
X-Groupsio-MsgNum: 48609
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline

--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 03:31:34AM +0100, Jacob Kroon wrote:
> The dependency was removed in efd3f947a08e0976e24bc266de4ec229298115cf.
> Since the .inc files are shared between the 5.1.1 and git recipes,
> add the dependency in the 5.1.1 recipe.

Wrong ML (see README), but merged now, thanks!

>=20
> Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
> ---
>  recipes-qt/qt5/qtdeclarative_5.1.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-qt/qt5/qtdeclarative_5.1.1.bb b/recipes-qt/qt5/qtdec=
larative_5.1.1.bb
> index be72469..344b7db 100644
> --- a/recipes-qt/qt5/qtdeclarative_5.1.1.bb
> +++ b/recipes-qt/qt5/qtdeclarative_5.1.1.bb
> @@ -13,3 +13,5 @@ SRC_URI[sha256sum] =3D "0ee989a5d45a94e927609b22e2413c7=
f2788a7b4a23af66ecfa15c31db
>  FILES_${PN}-qmlplugins +=3D " \
>      ${OE_QMAKE_PATH_QML}/*/*/*/*.png \
>  "
> +
> +DEPENDS +=3D "qtjsbackend"
> --=20
> 1.8.4.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLKG7QACgkQN1Ujt2V2gBzUzQCgjTK/tjKeBd367Z9PaGyvZdnK
+k8AmgKOn7v7w4odudetSn2c4IJY/YuH
=2FWn
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
