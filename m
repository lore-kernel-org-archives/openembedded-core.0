Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id A1312705E3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 18:19:48 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id 10so2872348lbg.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S3OowAGPXkhiW5CrefdlKDBwO16duH4ZtjWjsPk+fn4=;
	b=bi4dX+qC5VKr3D8LwEtv2HkFlH2bykv8z4tG1uUkvKvk2VxkDVfiWchANDyXmbHQIg
	Lj9/u5Qqsa3Q65jVtilOWjpaUHZCMz+P9yVK+zg96Y4CBHiKape/RY5gmPzH/0ZcBM4N
	JGjxmB+NU3qx8b1F7P0LVhrhT2VlVWiQCEDNbT/w+k/OMJkpkkqtV/yDKznAv0XwU91B
	0yN0goaFgaJ8CdlCk9f2eaYaIuoGZdIAOcL7ZTI2vxX0f6IQZTIluWNzenbkNmMwlgRe
	1xh/R1FvNrpkDREpfDY6CyyXvPtd6iyAcd5JOzpWDzqvLw2dTcKs2EA2JuAFo2Bd2M3q
	n0EQ==
X-Received: by 10.152.45.8 with SMTP id i8mr19087012lam.3.1408213189400;
	Sat, 16 Aug 2014 11:19:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a17sm18518100lbh.45.2014.08.16.11.19.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Aug 2014 11:19:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 16 Aug 2014 20:19:47 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20140816181947.GA3660@jama>
References: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
	<1407600483-31215-5-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1407600483-31215-5-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 5/8] piglit: add dependency on libxrender
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
X-List-Received-Date: Sat, 16 Aug 2014 18:19:52 -0000
X-Groupsio-MsgNum: 56612
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 09, 2014 at 06:08:00PM +0200, Martin Jansa wrote:
> * fixes floating dependency:
>   piglit/piglit/latest lost dependency on  libxrender

ping

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
> index 64289ed..32e73af 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -11,7 +11,7 @@ PV =3D "1.0+gitr${SRCPV}"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -DEPENDS =3D "virtual/libx11 waffle virtual/libgl libglu python-mako-nati=
ve python-numpy-native"
> +DEPENDS =3D "virtual/libx11 libxrender waffle virtual/libgl libglu pytho=
n-mako-native python-numpy-native"
> =20
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES =3D "x11"
> --=20
> 2.0.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPvoMMACgkQN1Ujt2V2gBxZXQCePfF/DvCHz1j/cnxFFTYQLvrB
QJYAn07x9wcxnXf9Q8L8EMJ+vMBxYhtk
=ZKGV
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
