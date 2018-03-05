Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AD212788BB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 11:58:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z9so14869020wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 03:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XzzVWYQN8Y/WE3xGIw8O1ATk01lsdJBNIe9+iebqW/s=;
	b=ZpyHniA40BkJi6LbkwlIic4PnakExP8yTrTiBxmoOqnMYgD3sZDwmHVtQEwjyWzf8x
	Om3n13PfQVlqzqR0PXUER5Q+YS7amu8jUjk8Y0E2fQ8ufDF/TI0gm3s8ChgKEpphmyS0
	IBx2VC7D5aBz4oK2IKD+EFLTl/3zFEFjr1e1H3UKD132dfKHRJsFJGxKrfGYUZU0LlNZ
	/Uq3TOcmfSco5IqzZhWvD4Fz0hG/+STqdSSJ2/qPonaCp/CQFmVyB7OLSWoHsrYAgxDc
	iCESsvvjhsmQJEmqOEI/Cka9MvTyXZy64pEWxj2ge+W7rpASALIDGvxcDnrRIneN3ia+
	/yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XzzVWYQN8Y/WE3xGIw8O1ATk01lsdJBNIe9+iebqW/s=;
	b=QWJibZwxrGD0lxQj1v3Bw9CFhovjNpmiw109/fkADdzZQW+tn1IqJY8jiWWYC3UzI2
	RKdxAJkg5wfBHdPFUWCBRZAXGtAp1hbP2D3tza/Bgtt9Npr/HQaQEpC10/HBbCLxkDON
	TPMIjXZ7w+hxXdZnvnhvQDkSoC9MZm0M9u+3fEgd+GhSaDNlw5LEAbM3clBZCWW/4sS5
	ploraNrZcXduaFTeOZd3BgPGkR/AfBmxMakiKPurv/YkEL2oKlXgdOyVqUxgYjkUvLSN
	Z9poBu9+YlSnBiMZiAQMNtxjEBcFah8ciWOZlTKrcylvDBeL3FI5EdE/rKhi535xL2y3
	zc+g==
X-Gm-Message-State: AElRT7HTCPIUKUz1ieF5hqlWYz6U+I3tMS1WBMvTE5fPU5bjJqF1GquF
	lwJN0InRvdoL9LLqUVLczCg=
X-Google-Smtp-Source: AG47ELv9rz2EFOLmPZHxXu8D+JJf55DCz1HrEvmb4na0FV5x6EEs7FGnKDu4DIuTBwBH0VDWJmJhRA==
X-Received: by 10.28.74.199 with SMTP id n68mr7715414wmi.83.1520251085401;
	Mon, 05 Mar 2018 03:58:05 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n127sm2544773wmb.5.2018.03.05.03.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Mar 2018 03:58:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Mar 2018 12:58:08 +0100
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20180305115808.GB19075@jama>
References: <20180305110158.10308-1-ross.burton@intel.com>
	<20180305110158.10308-4-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180305110158.10308-4-ross.burton@intel.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] populate_sdk_base: depend on nativesdk-glibc-locale
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
X-List-Received-Date: Mon, 05 Mar 2018 11:58:05 -0000
X-Groupsio-MsgNum: 108885
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline

--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 05, 2018 at 11:01:58AM +0000, Ross Burton wrote:
> If we're building a SDK and we're using glibc so may be installing locale=
s,
> add a build-dependency on natiesdk-glibc-locale so the locales we need wi=
ll
> exist.
>=20

Thanks, fixes the sdk build failures I was seeing since Sunday.

Tested-by: Martin Jansa <Martin.Jansa@gmail.com>

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/popula=
te_sdk_base.bbclass
> index be5970a4bbc..60a5abc7dc8 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -47,6 +47,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-toolchain-${SDK_=
VERSION}"
> =20
>  SDK_RDEPENDS =3D "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
>  SDK_DEPENDS =3D "virtual/fakeroot-native pixz-native cross-localedef-nat=
ive"
> +SDK_DEPENDS_append_libc-glibc =3D " nativesdk-glibc-locale"
> =20
>  # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PAC=
KAGE_ARCH as it
>  # could be set to the MACHINE_ARCH
> --=20
> 2.11.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWp0wVgAKCRA3VSO3ZXaA
HDquAJwPX9RKMU1NtUi5a7ggq8DJYNMiXgCfY+sTWYXwJaAJ2UcQU3zToKVFr7s=
=nLNg
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--
