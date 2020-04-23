Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.5179.1587644819760134755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 05:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aWlcmvIf;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id g12so6327925wmh.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0k+YL0ssnVvfk/pvTQ4zN/a9Lm6sGK4Pp3TexOKYHHM=;
        b=aWlcmvIfX7txDeMTgZ7bH45xAUJ2xP5QG2dvv0hfG3ghf2/nuu+2hy7VL0qfAteon9
         Gb2be47fKy41YBMcdNIx/THBxmpOdN9sNRSqc4eiNKcu4lTK9n50vWoNMD2yOhC55uaX
         2zsUiy5lqBN6IaUxRlyM0RIcx5DQOBTW1CDzLRQgyuu2BPhsYPOzZpjVcYwdES/ewpFk
         GI1S9jv5LbYRLJ3NncN1Wni6eEncNeC0MNaPBxjud79J7+wASjInF+Si6Dz69OatnGzl
         8ikkh113zyX2dE/r3uP/Qojzc0VaPZUPLG/0qrA/de19sBIlvh82cm4gdtD7TMJ5mtM/
         nPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0k+YL0ssnVvfk/pvTQ4zN/a9Lm6sGK4Pp3TexOKYHHM=;
        b=WMLV3oGb6nGfsqVk80EfC7Spv8u+IJUJ0w55dgcx+N4aUpcW18dLmhhgPtfZCHRJqM
         o12VJhEQ+UOdqtf1YpjVPQ8aW1sgeCTPG+smxiTXjVEpM2Og9TfzW20koQxSjq0hAkCh
         Gy5xXeSSd6NvNs0OaW0uRzyt6mnc51QLMmNoG1DZxwDIr63MDe2PxNSP2ZZ72g39U7Lp
         xLXxdEUQXTosikDHhJEM/VP6g3PvPyBuah4Zm4sowvCqiLmToXRV6k/cO78GwAVw0PT0
         Kjd6QG90jfYmPezhg3q6lymrPJdQTa3w/aoz42YLAuIuRErJxWgmRPCZEPNFtxV8jeqd
         wvYg==
X-Gm-Message-State: AGi0PuamrpF9hqL0u5y5+HFBrO02F7/aQ5JSQOE2gWjiS6vXVVK4mUX3
	r6toaDjy0Ww5M7BZWF9wAI0=
X-Google-Smtp-Source: APiQypIGp4WG/y0k2RYM+dfbltB4sM0n8SyE0VEam/e2ZbyrxPec1j1aKA+eki+ySXMe/D8TohSsjQ==
X-Received: by 2002:a1c:dc55:: with SMTP id t82mr4159465wmg.12.1587644818278;
        Thu, 23 Apr 2020 05:26:58 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p6sm3547206wrt.3.2020.04.23.05.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 05:26:57 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Apr 2020 14:26:56 +0200
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] json-c: upgrade 0.13.1 -> 0.14
Message-ID: <20200423122656.5v76gl7ouiqpxlt2@jama>
References: <20200423131129.86186-1-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20200423131129.86186-1-wangmy@cn.fujitsu.com>
X-Groupsio-MsgNum: 137416
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="la5aonfgmnx2cbwd"
Content-Disposition: inline

--la5aonfgmnx2cbwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2020 at 06:11:29AM -0700, Wang Mingyu wrote:
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
>=20
> add-disable-werror-option-to-configure.patch
> removed since it is included in 0.14
>=20
> Make mode changes from autotools to cmake.
>=20
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...d-disable-werror-option-to-configure.patch | 45 -------------------
>  .../{json-c_0.13.1.bb =3D> json-c_0.14.bb}      |  7 ++-
>  2 files changed, 3 insertions(+), 49 deletions(-)
>  delete mode 100644 meta/recipes-devtools/json-c/json-c/add-disable-werro=
r-option-to-configure.patch
>  rename meta/recipes-devtools/json-c/{json-c_0.13.1.bb =3D> json-c_0.14.b=
b} (74%)
=2E..
> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes=
-devtools/json-c/json-c_0.14.bb
> similarity index 74%
> rename from meta/recipes-devtools/json-c/json-c_0.13.1.bb
> rename to meta/recipes-devtools/json-c/json-c_0.14.bb
> index 522879f21f..6f1d80c25e 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.14.bb
> @@ -5,17 +5,16 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee21=
6f2"
> =20
>  SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar=
=2Egz \
> -           file://add-disable-werror-option-to-configure.patch \
>             "
> -SRC_URI[md5sum] =3D "04969ad59cc37bddd83741a08b98f350"
> -SRC_URI[sha256sum] =3D "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e=
6002a369d36f4873"
> +SRC_URI[md5sum] =3D "72cbb065b43376d825cd521d115ae1f6"
> +SRC_URI[sha256sum] =3D "b377de08c9b23ca3b37d9a9828107dff1de5ce208ff4ebb3=
5005a794f30c6870"
> =20
>  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
>  UPSTREAM_CHECK_REGEX =3D "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
> =20
>  RPROVIDES_${PN} =3D "libjson"
> =20
> -inherit autotools
> +inherit cmake
> =20
>  EXTRA_OECONF =3D "--disable-werror"

I think this last line isn't used at all with cmake, please drop it as
well.

--la5aonfgmnx2cbwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXqGJkAAKCRA3VSO3ZXaA
HL1iAJ9/b4tDpAJ3NdEsTeTwdch9HTAvBwCdGnTnDnpvfOSqLRLbiEcXXKTA+A8=
=JA2t
-----END PGP SIGNATURE-----

--la5aonfgmnx2cbwd--
