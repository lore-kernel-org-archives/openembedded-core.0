Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DAB5A60796
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:36:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id u125so4928259wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GorY1G2Oc0ZAEBY1EskFLwNEDuwg/JOyBku24VXwQaw=;
	b=oUrU1eQbUI55ooG7ZOim1FFFTrW2e/0BQNdazouIOmABhnNnblJo2V/0tqiQKyIytF
	68aKmjhGYlG08Tv+jcdu/oghg1VoIJ1IzsjcwKYO3qs4uoYr+ePBAFv5frXuCKdnWbkN
	/BOrBxTIG88RtVAGpBsfRliknv8eGtYsHLvsjo/IfTy5/9VI9mmbBco1Ha8vDahNEYIn
	4fE+Bgiydx+p7uqrkIiIJggoen3g+J79F0yfOdwh/iKWgobth+6ZrToY1OUiWkPfjqEA
	lWCANrYeZUOdcJRgyDkf5vUoTlFAta3yXlOJ/6VfUl1R+2qoPLWqZKoIidKfBRv3eRLK
	Xy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GorY1G2Oc0ZAEBY1EskFLwNEDuwg/JOyBku24VXwQaw=;
	b=ha7l6WtpqENYCTUxVTH8PfHcqM/ZuUT4x40qeVP+ffI6Paubcp/1Axx9Lyi8NyUKWG
	mc0PweEAEKwSP2cbs8mrR8MtDwWC5x6o7UP+/MIMg8jWdG3BsAB5OfiLarFizlzUHW7F
	rgL7v82rP+oREucSvzscYVpq8V5G4vK4ew037boA3x1GACetbn7zqAvYx8lY4miW8VMi
	vXMsR1ESRlbm7eaJesoNsZYKgz098oevB2AojIPRYs6JFv2AX1hgx1xvF40gqC/985sS
	b8a4T9OT/XW4BTHcTUAiSDgbwNLOjtISAlvGflT+rLA8Qv+8LR1e8ZZOVVRd7icwhwee
	Wkjw==
X-Gm-Message-State: AD7BkJKWo928Y8F4Vp+hmw2xwKyFnVxsW6Zp+NovXmCfqbLUiAu/piA/Dipn1F19dA8zeg==
X-Received: by 10.28.126.131 with SMTP id z125mr4542973wmc.77.1458743795916;
	Wed, 23 Mar 2016 07:36:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v5sm22462589wmg.16.2016.03.23.07.36.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Mar 2016 07:36:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Mar 2016 15:41:07 +0100
To: Ming Liu <liu.ming50@gmail.com>
Message-ID: <20160323144107.GD2565@jama>
References: <1458742798-9890-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1458742798-9890-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: yue.tao@windriver.com, Peter Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] libmad: avoid using legacy _thumb overrides
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
X-List-Received-Date: Wed, 23 Mar 2016 14:36:36 -0000
X-Groupsio-MsgNum: 80037
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline

--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2016 at 03:19:58PM +0100, Ming Liu wrote:
> From: Peter Liu <peter.x.liu@external.atlascopco.com>
>=20
> _thumb had been dropped from overrides since commit 351443d7:
> [ feature-arm-thumb.inc: drop legacy _thumb and _thumb-interwork over-rid=
es ]
>=20
> Change to set EXTRA_OECONF_append by checking ARM_INSTRUCTION_SET instead.

This also isn't right, ARM_INSTRUCTION_SET can be set to "thumb" even
when MACHINE doesn't support it by having "thumb" in TUNE_FEATURES.

You'll need to replicate the conditionals which were used in the tune
files or just revert that cleanup if you find "thumb" override still
useful.

> [YOCTO #9323]
>=20
> Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/recipes-multimedia/libmad/libmad_0.15.1b.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/reci=
pes-multimedia/libmad/libmad_0.15.1b.bb
> index 9e08b16..4c15db2 100644
> --- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
> +++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
> @@ -27,7 +27,7 @@ inherit autotools pkgconfig
> =20
>  EXTRA_OECONF =3D "-enable-speed --enable-shared"
>  # The ASO's don't take any account of thumb...
> -EXTRA_OECONF_append_thumb =3D " --disable-aso --enable-fpm=3Ddefault"
> +EXTRA_OECONF_append =3D " ${@['', '--disable-aso --enable-fpm=3Ddefault'=
][d.getVar('ARM_INSTRUCTION_SET', True) =3D=3D 'thumb']}"
>  EXTRA_OECONF_append_arm =3D " --enable-fpm=3Darm"
> =20
>  do_configure_prepend () {
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbyqwIACgkQN1Ujt2V2gBz2RwCcDDntGR2FHlUBIyN104ftDmY5
Oo4AnRotT4/IXsloLNuJkHuxAUQczDaz
=wUnA
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
