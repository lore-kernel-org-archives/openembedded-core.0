Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.1100.1600355056756064080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2020 08:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d8ug/Nss;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id nw23so3765168ejb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2020 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=woL3ITO6g2wPGShA7tK4VCn4F4fVFjaiO/wif4hUQ/A=;
        b=d8ug/Nss5tah2f5L8C5Dp3FVwQNFSUztacn4FaJqxznzsU2KyJeYFro57YrKvi1UFo
         hcIvF6xo3Lz8sr0o8UmvyzFJt0oWgkbKkJ8gG+7uxKZINeft1A867u8J7FSI61cPW8qC
         wZY/rznxnqPnGSVWSLpN3vX5Tt7X7aLOQ7iBCqvRXSoAlBnjxkIJ7UuxFait8eiS9Yam
         z3GYGfLpwYwql5LtkmkFMxiHjNLSQJgh/VLsJPXHoisHyc7OCUp6raoFbuugIAWAbwZe
         BJxBw1VaKbHgnazo63nUKv3YAeyNgUKxVrfl8OCGXNainAtP7Lcc2oKP7Y/LP/iU5ZAb
         ZhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=woL3ITO6g2wPGShA7tK4VCn4F4fVFjaiO/wif4hUQ/A=;
        b=pyN5LkEDp2ZTIcN77ZPRaiQjWRWKw7FIVDPzTr2IVX/P6j/o9yMpad58Ckh5oJXLl6
         664srSO6wIPLO6Q6Fu9ziPlLdMWSEF0J8pbPc9srEa2mGXnwo+y+jZ4beRGLtIKsHbd6
         UzV8yGceMSosXnHQWCWaPKAkAJyVr4Du1LlEqZwPWa4I/aLZOMQR1fVqsu5F8rHZ18S/
         uViU2lYOjHZI2+0hKa43bhp0+ALiIPcjrwui6uasOCZ25vTjA5PiSzcsVrdqnZKIeeUW
         9F/gykLdX56jRIMHplGB7rxpb49C0j+xuqTGEMvNEONs4n3euTEMCEDM446Acb4bc9Hv
         UU5Q==
X-Gm-Message-State: AOAM533/kMOqvF2lOG+d/gHRZfFD3vLgpbNrG7dRe2D75xlTsIA7LnKx
	sY0tfi/du1vjn2Jmvo3VWKA=
X-Google-Smtp-Source: ABdhPJzywhkeLFvVdieYgBMZ4OZwwDtxZibZZSZHZ+jPFfwr9vi0J/8KIEUp/JuIGUaLJCxc5vXUyw==
X-Received: by 2002:a17:906:2e83:: with SMTP id o3mr32328226eji.47.1600355055091;
        Thu, 17 Sep 2020 08:04:15 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o92sm37484edd.68.2020.09.17.08.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 08:04:14 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Sep 2020 17:04:13 +0200
To: Jens Rehsack <sno@NetBSD.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] image-artifact-names: make variables overridable
Message-ID: <20200917150413.y7ciinczbbdvv3xz@jama>
References: <20200917144534.17549-1-sno@NetBSD.org>
MIME-Version: 1.0
In-Reply-To: <20200917144534.17549-1-sno@NetBSD.org>
X-Groupsio-MsgNum: 142637
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cl5vqqo5wqyugwet"
Content-Disposition: inline

--cl5vqqo5wqyugwet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2020 at 04:45:34PM +0200, Jens Rehsack wrote:
> From: Jens Rehsack <sno@netbsd.org>
>=20
> Since the newly introduced image-artifact-names class is inherited at lat=
er
> processing stage, individual IMAGE_NAME settings are overridden (hopefully
> by accident instead on purpose).

The purpose was was to make it easier for DISTRO to define own scheme,
so LGTM.

You can still override the values from distro layer, but I agree that
this makes it a bit easier to do that, thanks!

> Allow derived distributions define their own name schema by setting defau=
lts
> iwth question mark.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/classes/image-artifact-names.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/image-artifact-names.bbclass b/meta/classes/ima=
ge-artifact-names.bbclass
> index 5ab8f1b7aa..3ac8dd731a 100644
> --- a/meta/classes/image-artifact-names.bbclass
> +++ b/meta/classes/image-artifact-names.bbclass
> @@ -2,11 +2,11 @@
>  # Specific image creation and rootfs population info.
>  ##################################################################
> =20
> -IMAGE_BASENAME =3D "${PN}"
> -IMAGE_VERSION_SUFFIX =3D "-${DATETIME}"
> +IMAGE_BASENAME ?=3D "${PN}"
> +IMAGE_VERSION_SUFFIX ?=3D "-${DATETIME}"
>  IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D "DATETIME"
> -IMAGE_NAME =3D "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
> -IMAGE_LINK_NAME =3D "${IMAGE_BASENAME}-${MACHINE}"
> +IMAGE_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
> +IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}-${MACHINE}"
> =20
>  # IMAGE_NAME is the base name for everything produced when building imag=
es.
>  # The actual image that contains the rootfs has an additional suffix (.r=
ootfs
> --=20
> 2.17.1
>=20

--cl5vqqo5wqyugwet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCX2N67AAKCRA3VSO3ZXaA
HPvMAKCDT2iv7mQv/i264WayZh/t22Zc/wCfaHplFOIu5e4BM3TbEJIzqr/gCf4=
=ftpk
-----END PGP SIGNATURE-----

--cl5vqqo5wqyugwet--
