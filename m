Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 932B070D1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 22:17:58 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id mc6so1754272lab.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mtbtTtlycfHTWExu0M+2awI1QmyTB2W/BKqiMESJ6Yc=;
	b=MpAG0l+Dp7Y/+qhLviZ6hysxu3WHMfBgMYPOe7nKPPagRfEaaDDx4xVX3pWNS7S6+o
	JkC2H1QtfYi+VBh1yCGeuy3pr2+ddjfDQT2sjn1F1v7Qmfx65CefuNiV6XqSNgUlg8nh
	+qLH2w2Zl+kYB8yT5A3IWaPUrRbhPw0xb53ZmsVg04WMFWP3Wgk6mXUU+mi4TSLuk4hu
	CWGtmgYJf+lO9s58q4cuY84ZeyoVdDRQn9yU7Ek4GzLt81j6NmH7v1mEn5oW1VXv7cOD
	YNrgWH/gn3AsvBxIiy/dt7pLDPYnI8Y99S06swlpr3lT4zVjr2jC9xoB6oqW3TlTdLm4
	Z+Bw==
X-Received: by 10.152.19.5 with SMTP id a5mr1774302lae.21.1408054678875;
	Thu, 14 Aug 2014 15:17:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lm8sm3819883lac.36.2014.08.14.15.17.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 15:17:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Aug 2014 00:18:35 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140814221835.GQ14848@jama>
References: <1408054245.21596.6.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1408054245.21596.6.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-ust/lttng-modules: Update LICENSE to reflect MIT
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
X-List-Received-Date: Thu, 14 Aug 2014 22:18:06 -0000
X-Groupsio-MsgNum: 56551
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v/TrXvwt1ekXxwZL"
Content-Disposition: inline

--v/TrXvwt1ekXxwZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 11:10:45PM +0100, Richard Purdie wrote:
> The code in question clearly states MIT is a third license. Update
> LICENSE to reflect this (in one case, we did list BSD which is effectively
> the same thing but this removes confusion).

Thank you

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/reci=
pes-kernel/lttng/lttng-modules_2.5.0.bb
> index d873741..9310f0f 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> @@ -1,7 +1,7 @@
>  SECTION =3D "devel"
>  SUMMARY =3D "Linux Trace Toolkit KERNEL MODULE"
>  DESCRIPTION =3D "The lttng-modules 2.0 package contains the kernel trace=
r modules"
> -LICENSE =3D "LGPLv2.1 & GPLv2"
> +LICENSE =3D "LGPLv2.1 & GPLv2 & MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1412caf5a1aa90d6a48588a4794c0=
eac \
>                      file://gpl-2.0.txt;md5=3D751419260aa954499f7abaabaa8=
82bbe \
>                      file://lgpl-2.1.txt;md5=3D243b725d71bb5df4a1e5920b34=
4b86ad"
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb b/meta/recipes-=
kernel/lttng/lttng-ust_2.5.0.bb
> index 1595627..1468fc1 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "The LTTng UST 2.x package contains the u=
serspace tracer library t
>  HOMEPAGE =3D "http://lttng.org/ust"
>  BUGTRACKER =3D "https://bugs.lttng.org/projects/lttng-ust"
> =20
> -LICENSE =3D "LGPLv2.1+ & BSD & GPLv2"
> +LICENSE =3D "LGPLv2.1+ & MIT & GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc963eb366b781252b0bf0fdf1624d=
9e9 \
>                      file://snprintf/snprintf.c;endline=3D32;md5=3Dd3d544=
959d8a3782b2e07451be0a903c \
>                      file://snprintf/various.h;endline=3D31;md5=3D89f2509=
b6b4682c4fc95255eec4abe44"
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--v/TrXvwt1ekXxwZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPtNbsACgkQN1Ujt2V2gBzSGACfUSdsVmRZ++NfojiN+Ch+5HXG
KboAn0aa2Ths00BdSP3v1ZcpmqEET7s/
=wExH
-----END PGP SIGNATURE-----

--v/TrXvwt1ekXxwZL--
