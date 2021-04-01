Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.5719.1617272351008807286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 03:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hjeJQkhk;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id l18so1323987edc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 03:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QDkQGaSwbFzHDcyGDaYCBvtoZGzq7kjngzeC6I6sgZo=;
        b=hjeJQkhkQiTPaUcCr0uhREJaxY6bCSfxNiN9R0hNtWfOTGQDbAu9Z/4jyec2PiGery
         Nl8pMGUccLl9s+vzYmcIWZXQ/fgCLxltjO2oe/nKeHEzkv+TGBVCogGbSwuqL5vih5qu
         VF/YVpNlX+USCaWg8WTpvrOcPamjvLV/NERSMLLIJmVhnTgSAd8fK+ZK8eDACCtK3Dj9
         I5IEGKFautLlbbMYk+zdPTizYP1HauPxf/ggR5KzRvXpQq81Itc+OSHZriCNMYpIsjU1
         VKYWSO5nZyWv6xbVT3jpWMcbVh/5B8+WhBKU9mf2TGuUg+e3jdELdPg9gKNvrb8c4D88
         9gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QDkQGaSwbFzHDcyGDaYCBvtoZGzq7kjngzeC6I6sgZo=;
        b=uPPM2esLfBDf6wACMBHo1TN21JeaxMiPE3k6rLkngjvjmZkbBYUavnk8AULC6XwvVL
         rVwA1FX+dN1Zc11ytZsluKAfnI0m6H9dwPPwG24aPC6s3jO238/tvUE1rFX8EYxjEE4F
         xu8sR8TMAJkB6r/8e/I3bX1ZpIlh226lcAMXVLBEUXcCZRDorOWK+e9Yy9gKafX8m6Xb
         Nm3ypD4UyPtj9M0tHdWE77wGRQb0KqAifAfyWgRD1sR++vuow0dPWJbatOq8zweDQTEp
         TJiY94kLURD89rzHkBuB7/h0rGE0EtEr5ObKBBSfJNMXvv0GXlGV8hAFAghJia51pKcj
         L7uw==
X-Gm-Message-State: AOAM5322tN5o6TyQBp1/fRpv8KvkBRiv0fyEb9is0LTejg3p+3s5UIYQ
	L8H7JVx23gQGW1gzM50q7Vc=
X-Google-Smtp-Source: ABdhPJybJqgWCMNe2lNZ8IxGvlknTbK4P2aSM6LLSnV6vu8NtaQkYvwF9f5QBnovejfH6Sy3TBTLLw==
X-Received: by 2002:a05:6402:104c:: with SMTP id e12mr8747592edu.108.1617272349359;
        Thu, 01 Apr 2021 03:19:09 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g11sm3306469edt.35.2021.04.01.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 03:19:08 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 1 Apr 2021 12:19:08 +0200
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa-gl: Use swrast gallium driver
Message-ID: <20210401101908.qsyswliokyze37tm@jama>
References: <20210331225051.3823769-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210331225051.3823769-1-raj.khem@gmail.com>
X-Groupsio-MsgNum: 150141
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="in26mtb7lp4txqd4"
Content-Disposition: inline

--in26mtb7lp4txqd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 03:50:51PM -0700, Khem Raj wrote:
> Fixes
> ../mesa-21.0.0/meson.build:21:0: ERROR: Options "swrast" are not in allow=
ed choices: "auto, i915, i965, r100, r200, nouveau"
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb b/meta/recipes-=
graphics/mesa/mesa-gl_21.0.0.bb
> index e50782be1c..fc8b4f7504 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> @@ -12,4 +12,4 @@ PACKAGECONFIG ??=3D "opengl dri ${@bb.utils.contains('D=
ISTRO_FEATURES', 'x11', 'x1
>  PACKAGECONFIG_class-target =3D "opengl dri ${@bb.utils.contains('DISTRO_=
FEATURES', 'x11', 'x11', 'osmesa', d)}"
> =20
>  # When NOT using X11, we need to make sure we have swrast available.
> -DRIDRIVERS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ''=
, ',swrast', d)}"
> +GALLIUMDRIVERS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11'=
, '', ',swrast', d)}"

With:
DISTRO_FEATURES_remove =3D "x11"
PREFERRED_PROVIDER_virtual/libgl =3D "mesa-gl"
PREFERRED_PROVIDER_virtual/mesa =3D "mesa-gl"
in local.conf this is unfortunately still failing, now with:

=2E./mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered: building dr=
i drivers require at least one windowing system

whole log:
http://errors.yoctoproject.org/Errors/Details/575265/

adding nouveau to DRIDRIVERS like normal mesa doesn't help in this case,
because I was building for qemux86-64 which already has bunch of
DRIDRIVERS added by default (but adding at least one DRIDRIVER might be sti=
ll
needed for other architectures).

# $DRIDRIVERS [4 operations]
#   _append[x86_class-target] /OE/build/oe-core/openembedded-core/meta/reci=
pes-graphics/mesa/mesa.inc:107
#     ",r100,r200,nouveau,i965,i915"
#   _append[x86-64_class-target] /OE/build/oe-core/openembedded-core/meta/r=
ecipes-graphics/mesa/mesa.inc:108
#     ",r100,r200,nouveau,i965,i915"
#   override[class-native]:set /OE/build/oe-core/openembedded-core/meta/rec=
ipes-graphics/mesa/mesa.inc:105
#     "nouveau"
#   override[class-nativesdk]:set /OE/build/oe-core/openembedded-core/meta/=
recipes-graphics/mesa/mesa.inc:106
#     "nouveau"
# pre-expansion value:
#   ",r100,r200,nouveau,i965,i915"
DRIDRIVERS=3D",r100,r200,nouveau,i965,i915"

Reverting Alex's upgrade to 21.0.0 allows to build mesa-gl again and it sho=
uld surely pass AB build :).

--in26mtb7lp4txqd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYGWeGgAKCRA3VSO3ZXaA
HG9yAKCKyjqIzV4SUHLggv9Id6Vs/vWcaQCfcxbP/9kou7gGWRV7xYdKKvXJZas=
=DFhl
-----END PGP SIGNATURE-----

--in26mtb7lp4txqd4--
