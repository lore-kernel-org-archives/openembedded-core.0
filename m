Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1146D193
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 08:38:36 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y1so9910747wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Dw117WI2/H2vO2b+FfG8qBB1Ay3/2RRsMgvmKaKBz2I=;
	b=sx6D2032iXFiCzYLQx5zIekhuGybKEzTKyfIRC5qtL4yaj02olGL/U3H+FTsINohgJ
	0Vr61A49Hxt6SzwTy0HIS45ly9zpbnyLZk+gWsklNgA2wzP4k10VqOlCDf4RV2FP/43x
	c4nJ0TRUgkKnztRB3iyvr1T0xjVsGczzfL9m8tLyL1xtCBPTBFfAVfmBSPF+y4mkRAMV
	atAYZlFTT2HMr3mILj8XCk8tV+gm161Zjv7z6Gl6a5/5Y38q33pFHQvXkD0RdRAKx8h2
	1h1Mro/E6G6wk5tFtKzcC15/VyOmgbFPVwDaIOVhteLkJc3f1tQo3sUQ3M0DRJ0RJGRz
	UpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Dw117WI2/H2vO2b+FfG8qBB1Ay3/2RRsMgvmKaKBz2I=;
	b=GG2CsWrjgbrjLWo+AD1t0yiRzdwVq8wvZiYtb9cmVjs/5gIsptMYGKD6zgfPR+aW17
	VzuGM+9KpgsrNGytQGODo4tPLrIoSZELLsqfOAdRGbE/20y5EenrgU2ClDRfRhkTEMi2
	F/9pPkMgoayU1Q/SKPbDLsgbUWDxhe0QcUqzTFt23UBEH09qai4tJs1qcFlvFoBuZ9Es
	rlJwJQl89/MibH9dcp5RWCtUuNNwJ3/0VWXtP10Y9nv0FzHc5AqGJ9zpR2iQqD68cYHN
	DhgKcdbx9KzTGgdKUgjrS/ROrPdx7bJ4o58gy34I1o8h4n7aAy+4wsW7N6pX+kWms38j
	57Vg==
X-Gm-Message-State: AA+aEWYClXPYaBVNbjsGeUMjJyNFp9eix8VeanKO/51EAmcxpyUsYICS
	q2gGgDJIx7zoMMGvVToogw4=
X-Google-Smtp-Source: AFSGD/UtqqdRP8IaqsOr/hy5WJBh70jymaGoQqk6SOOY1VuqTzuj4blBE4J9qpbCgOVeLm6GJmPD/w==
X-Received: by 2002:a1c:aad2:: with SMTP id t201mr9373902wme.148.1544431116948;
	Mon, 10 Dec 2018 00:38:36 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w18sm8024331wru.54.2018.12.10.00.38.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Dec 2018 00:38:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 10 Dec 2018 09:38:36 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20181210083836.GA1470@jama>
References: <cover.1544408339.git.liezhi.yang@windriver.com>
	<d8d5c615ca2b0527b3927161c2401dc6cbe72512.1544408339.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <d8d5c615ca2b0527b3927161c2401dc6cbe72512.1544408339.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] apr/openssl10: Enable ccache for them
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
X-List-Received-Date: Mon, 10 Dec 2018 08:38:38 -0000
X-Groupsio-MsgNum: 119007
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 09, 2018 at 06:24:23PM -0800, Robert Yang wrote:
> The work well now.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb | 3 ---
>  meta/recipes-support/apr/apr_1.6.5.bb                 | 1 -
>  2 files changed, 4 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta=
/recipes-connectivity/openssl/openssl10_1.0.2q.bb
> index 6518dac..1986cf2 100644
> --- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
> +++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
> @@ -76,9 +76,6 @@ EXTRA_OEMAKE =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'manpages', '', 'OE_DISABL
> =20
>  export OE_LDFLAGS =3D "${LDFLAGS}"
> =20
> -# openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.=
cgi?id=3D12810
> -CCACHE =3D ""
> -
>  TERMIO ?=3D "-DTERMIO"
>  TERMIO_libc-musl =3D "-DTERMIOS"
> =20
> diff --git a/meta/recipes-support/apr/apr_1.6.5.bb b/meta/recipes-support=
/apr/apr_1.6.5.bb
> index c2f5900..ed93a7e 100644
> --- a/meta/recipes-support/apr/apr_1.6.5.bb
> +++ b/meta/recipes-support/apr/apr_1.6.5.bb
> @@ -40,7 +40,6 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_file__dev_zero=3Dyes"
>  # Otherwise libtool fails to compile apr-utils
>  # x86_64-linux-libtool: compile: unable to infer tagged configuration
>  # x86_64-linux-libtool:   error: specify a tag with '--tag'
> -CCACHE =3D ""

Remove the comment as well.

>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXA4mDAAKCRA3VSO3ZXaA
HK3zAKCOqCnrHkp9vE9bSbp1Dmu1mMZzswCfZ/nLBgSnNYQXYDurG0Rz3gfPvhY=
=brh+
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
