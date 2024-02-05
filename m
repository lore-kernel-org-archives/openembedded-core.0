Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B99C48292
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 17:42:38 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.176.1707154955174736994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 09:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kttM9Vy0;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2196dd318f5so1424564fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707154954; x=1707759754; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIYY2+BMiIkaRzXaA8wIbzsFOfKLqF+Zqik5kjLX39U=;
        b=kttM9Vy0l1r2ExRYOU/I+sYO3ddNWAcw2KdItbo51itU6+36ltd0q+2v/TQvi5+ASV
         WWVdGmNiJJgErmE0YcJ9ft1r2zk8ZjyZ69MCFw7iAmN/IIqj78hdoWYAMnCHABgQu9AI
         hh1oFFfYCyLGbWH1owlEhxsZ4b2EOFnLrh8f3gXAYPAv7QXifLjXmzVHTby8KLoILtyN
         VxdNWEUm1vHr+eDMOID8ZBk8NQi2sSaHDZsI6uP4cn4bC9XLXLAexgCXiDQgXoMGXDnT
         VvG0ouN9h7YJBK7IxM9WVVIpKlZGcI64Q5FheLbAAHbyduznBVKzw4mdIla+XkousqUn
         ebhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707154954; x=1707759754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIYY2+BMiIkaRzXaA8wIbzsFOfKLqF+Zqik5kjLX39U=;
        b=IjGCfucLWEOtPgdMq84Yjkun1rnxqFBIxXp7h2hQrRg2GsUWSE/63XumlzzUPD0K0u
         uTnKU7DWUNoE7HtlrAvuFbQfcraqVlAC+y1ibdvIqbwWeRYGbownwnjPGf6WqBzNasjX
         ekQcWy2aXMn2SxAA/7jw17YQd+ktAAPCegSbTc1vy7HroZjv16yATUD8gyHuSLhkSgwS
         li9FuEjhW6q4RdvhI0gQXwjYi1NZife2/7OovX+nNG/ss5vA3zOgEoWAACPc7TTYearh
         viql8X/fIslbZTNQLEjNXs5AA6v9kgaMpuvxIWMcJnrjHwIp/2UzM5V5KGAZ48r+Su0G
         cz1A==
X-Gm-Message-State: AOJu0Ywlt9bKUETn2Ym35e0ku85fqQbkfv+kDugSTiKEA3ixeg3H2p0u
	RGJeQFEE+GbB5dAD2ibrkyTVk2ha7rrbMHqhlqFlyuLBi973tOw9JZNKERkuiHCelpr/GkmyUPB
	XFv/ekMvywh8Ho1p4La3yJ/XpqeKszqXa/Vw=
X-Google-Smtp-Source: AGHT+IE9zf+NZvPTvBm72Li3gcQ5xsrUGBFPuYH7i24greZEvtnCVi+DZy8dojgxJaPCxrXCKZWlrjiLF7HRKL+JqVE=
X-Received: by 2002:a05:6870:9693:b0:210:b468:6a5d with SMTP id
 o19-20020a056870969300b00210b4686a5dmr452278oaq.16.1707154954201; Mon, 05 Feb
 2024 09:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20240205124053.14205-1-jon.mason@arm.com> <20240205124053.14205-2-jon.mason@arm.com>
In-Reply-To: <20240205124053.14205-2-jon.mason@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Feb 2024 09:42:08 -0800
Message-ID: <CAMKF1spqPJfn1qV-Jw-ijMXx_sD9LwFcwvrTjszrHQMtyoYTyQ@mail.gmail.com>
Subject: Re: [OE-core] [master-next PATCH 2/2] arm/armv*: add all the Arm
 tunes in GCC 13.2.0
To: Jon Mason <jon.mason@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 17:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194960

wood be good to consider gcc-14 as well while you are here as an
incremental patch perhaps.

On Mon, Feb 5, 2024 at 4:40=E2=80=AFAM Jon Mason <jon.mason@arm.com> wrote:
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../machine/include/arm/arch-armv8-1a.inc     | 18 +++++++++++++++
>  .../machine/include/arm/arch-armv8-3a.inc     | 22 +++++++++++++++++++
>  .../machine/include/arm/arch-armv8-6a.inc     | 22 +++++++++++++++++++
>  .../include/arm/armv8-2a/tune-cortexa78ae.inc | 15 +++++++++++++
>  .../include/arm/armv8-2a/tune-cortexa78c.inc  | 15 +++++++++++++
>  .../include/arm/armv8-2a/tune-cortexx1.inc    | 15 +++++++++++++
>  .../include/arm/armv8-2a/tune-cortexx1c.inc   | 15 +++++++++++++
>  .../arm/armv8-4a/tune-neoverse512tvb.inc      | 15 +++++++++++++
>  .../include/arm/armv8-4a/tune-neoversev1.inc  | 15 +++++++++++++
>  .../include/arm/armv8r/tune-cortexr82.inc     | 15 +++++++++++++
>  .../include/arm/armv9a/tune-cortexa510.inc    | 15 +++++++++++++
>  .../include/arm/armv9a/tune-cortexa710.inc    | 15 +++++++++++++
>  .../include/arm/armv9a/tune-cortexa715.inc    | 15 +++++++++++++
>  .../include/arm/armv9a/tune-cortexx2.inc      | 15 +++++++++++++
>  .../include/arm/armv9a/tune-cortexx3.inc      | 15 +++++++++++++
>  .../include/arm/armv9a/tune-neoversev2.inc    | 15 +++++++++++++
>  16 files changed, 257 insertions(+)
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8-1a.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8-3a.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8-6a.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa78=
ae.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa78=
c.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexx1.=
inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexx1c=
.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-4a/tune-neoverse5=
12tvb.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-4a/tune-neoversev=
1.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8r/tune-cortexr82.i=
nc
>  create mode 100644 meta/conf/machine/include/arm/armv9a/tune-cortexa510.=
inc
>  create mode 100644 meta/conf/machine/include/arm/armv9a/tune-cortexa710.=
inc
>  create mode 100644 meta/conf/machine/include/arm/armv9a/tune-cortexa715.=
inc
>  create mode 100644 meta/conf/machine/include/arm/armv9a/tune-cortexx2.in=
c
>  create mode 100644 meta/conf/machine/include/arm/armv9a/tune-cortexx3.in=
c
>  create mode 100644 meta/conf/machine/include/arm/armv9a/tune-neoversev2.=
inc
>
> diff --git a/meta/conf/machine/include/arm/arch-armv8-1a.inc b/meta/conf/=
machine/include/arm/arch-armv8-1a.inc
> new file mode 100644
> index 000000000000..be8e814a39aa
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8-1a.inc
> @@ -0,0 +1,18 @@
> +DEFAULTTUNE ?=3D "armv8-1a"
> +
> +TUNEVALID[armv8-1a] =3D "Enable instructions for ARMv8.1-a"
> +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1a'=
, ' -march=3Darmv8.1-a', '', d)}"
> +# TUNE crypto will be handled by arch-armv8a.inc below
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1a',=
 'armv8-1a:', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +AVAILTUNES                                  +=3D "armv8-1a armv8-1a-cryp=
to"
> +ARMPKGARCH:tune-armv8-1a                    ?=3D "armv8-1a"
> +ARMPKGARCH:tune-armv8-1a-crypto             ?=3D "armv8-1a"
> +TUNE_FEATURES:tune-armv8-1a                  =3D "aarch64 armv8-1a"
> +TUNE_FEATURES:tune-armv8-1a-crypto           =3D "${TUNE_FEATURES:tune-a=
rmv8-1a} crypto"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-1a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-1a"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-1a-crypto     =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-1a} armv8-1a-crypto"
> +BASE_LIB:tune-armv8-1a                       =3D "lib64"
> +BASE_LIB:tune-armv8-1a-crypto                =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/arch-armv8-3a.inc b/meta/conf/=
machine/include/arm/arch-armv8-3a.inc
> new file mode 100644
> index 000000000000..49493fb3b50e
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8-3a.inc
> @@ -0,0 +1,22 @@
> +DEFAULTTUNE ?=3D "armv8-3a"
> +
> +TUNEVALID[armv8-3a] =3D "Enable instructions for ARMv8.3-a"
> +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-3a'=
, ' -march=3Darmv8.3-a', '', d)}"
> +# TUNE crypto will be handled by arch-armv8a.inc below
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-3a',=
 'armv8-3a:', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +AVAILTUNES                                  +=3D "armv8-3a armv8-3a-cryp=
to armv8-3a-crypto-sve"
> +ARMPKGARCH:tune-armv8-3a                    ?=3D "armv8-3a"
> +ARMPKGARCH:tune-armv8-3a-crypto             ?=3D "armv8-3a"
> +ARMPKGARCH:tune-armv8-3a-crypto-sve         ?=3D "armv8-3a"
> +TUNE_FEATURES:tune-armv8-3a                  =3D "aarch64 armv8-3a"
> +TUNE_FEATURES:tune-armv8-3a-crypto           =3D "${TUNE_FEATURES:tune-a=
rmv8-3a} crypto"
> +TUNE_FEATURES:tune-armv8-3a-crypto-sve       =3D "${TUNE_FEATURES:tune-a=
rmv8-3a-crypto} sve"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-3a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-3a"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-3a-crypto     =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-3a} armv8-3a-crypto"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-3a-crypto-sve =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-3a-crypto} armv8-3a-crypto-sve"
> +BASE_LIB:tune-armv8-3a                       =3D "lib64"
> +BASE_LIB:tune-armv8-3a-crypto                =3D "lib64"
> +BASE_LIB:tune-armv8-3a-crypto-sve            =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/arch-armv8-6a.inc b/meta/conf/=
machine/include/arm/arch-armv8-6a.inc
> new file mode 100644
> index 000000000000..27f85325caf6
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8-6a.inc
> @@ -0,0 +1,22 @@
> +DEFAULTTUNE ?=3D "armv8-6a"
> +
> +TUNEVALID[armv8-6a] =3D "Enable instructions for ARMv8.6-a"
> +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-6a'=
, ' -march=3Darmv8.6-a', '', d)}"
> +# TUNE crypto will be handled by arch-armv8a.inc below
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-6a',=
 'armv8-6a:', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +AVAILTUNES                                  +=3D "armv8-6a armv8-6a-cryp=
to armv8-6a-crypto-sve"
> +ARMPKGARCH:tune-armv8-6a                    ?=3D "armv8-6a"
> +ARMPKGARCH:tune-armv8-6a-crypto             ?=3D "armv8-6a"
> +ARMPKGARCH:tune-armv8-6a-crypto-sve         ?=3D "armv8-6a"
> +TUNE_FEATURES:tune-armv8-6a                  =3D "aarch64 armv8-6a"
> +TUNE_FEATURES:tune-armv8-6a-crypto           =3D "${TUNE_FEATURES:tune-a=
rmv8-6a} crypto"
> +TUNE_FEATURES:tune-armv8-6a-crypto-sve       =3D "${TUNE_FEATURES:tune-a=
rmv8-6a-crypto} sve"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-6a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-6a"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-6a-crypto     =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-6a} armv8-6a-crypto"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-6a-crypto-sve =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-6a-crypto} armv8-6a-crypto-sve"
> +BASE_LIB:tune-armv8-6a                       =3D "lib64"
> +BASE_LIB:tune-armv8-6a-crypto                =3D "lib64"
> +BASE_LIB:tune-armv8-6a-crypto-sve            =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78ae.inc =
b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78ae.inc
> new file mode 100644
> index 000000000000..fe68bda9a03c
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78ae.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for cortex-a78ae
> +#
> +DEFAULTTUNE ?=3D "cortexa78ae"
> +
> +TUNEVALID[cortexa78ae] =3D "Enable cortex-a78ae specific processor optim=
izations"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78ae', '=
 -mcpu=3Dcortex-a78ae', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +AVAILTUNES                                           +=3D "cortexa78ae"
> +ARMPKGARCH:tune-cortexa78ae                           =3D "cortexa78ae"
> +TUNE_FEATURES:tune-cortexa78ae                        =3D "aarch64 crypt=
o cortexa78ae"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa78ae                  =3D "${PACKAGE_EXT=
RA_ARCHS:tune-armv8-2a-crypto} cortexa78ae"
> +BASE_LIB:tune-cortexa78ae                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78c.inc b=
/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78c.inc
> new file mode 100644
> index 000000000000..cb1fe91dfca5
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa78c.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for cortex-a78c
> +#
> +DEFAULTTUNE ?=3D "cortexa78c"
> +
> +TUNEVALID[cortexa78c] =3D "Enable cortex-a78c specific processor optimiz=
ations"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa78c', ' =
-mcpu=3Dcortex-a78c', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +AVAILTUNES                                          +=3D "cortexa78c"
> +ARMPKGARCH:tune-cortexa78c                           =3D "cortexa78c"
> +TUNE_FEATURES:tune-cortexa78c                        =3D "aarch64 crypto=
 cortexa78c"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa78c                  =3D "${PACKAGE_EXTR=
A_ARCHS:tune-armv8-2a-crypto} cortexa78c"
> +BASE_LIB:tune-cortexa78c                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1.inc b/m=
eta/conf/machine/include/arm/armv8-2a/tune-cortexx1.inc
> new file mode 100644
> index 000000000000..0a99156e6297
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for cortex-x1
> +#
> +DEFAULTTUNE ?=3D "cortexx1"
> +
> +TUNEVALID[cortexx1] =3D "Enable cortex-x1 specific processor optimizatio=
ns"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexx1', ' -m=
cpu=3Dcortex-x1', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +AVAILTUNES                                        +=3D "cortexx1"
> +ARMPKGARCH:tune-cortexx1                           =3D "cortexx1"
> +TUNE_FEATURES:tune-cortexx1                        =3D "aarch64 crypto c=
ortexx1"
> +PACKAGE_EXTRA_ARCHS:tune-cortexx1                  =3D "${PACKAGE_EXTRA_=
ARCHS:tune-armv8-2a-crypto} cortexx1"
> +BASE_LIB:tune-cortexx1                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1c.inc b/=
meta/conf/machine/include/arm/armv8-2a/tune-cortexx1c.inc
> new file mode 100644
> index 000000000000..2a16d1695de5
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexx1c.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for cortex-x1c
> +#
> +DEFAULTTUNE ?=3D "cortexx1c"
> +
> +TUNEVALID[cortexx1c] =3D "Enable cortex-x1c specific processor optimizat=
ions"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexx1c', ' -=
mcpu=3Dcortex-x1c', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +AVAILTUNES                                         +=3D "cortexx1c"
> +ARMPKGARCH:tune-cortexx1c                           =3D "cortexx1c"
> +TUNE_FEATURES:tune-cortexx1c                        =3D "aarch64 crypto =
cortexx1c"
> +PACKAGE_EXTRA_ARCHS:tune-cortexx1c                  =3D "${PACKAGE_EXTRA=
_ARCHS:tune-armv8-2a-crypto} cortexx1c"
> +BASE_LIB:tune-cortexx1c                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-4a/tune-neoverse512tvb.i=
nc b/meta/conf/machine/include/arm/armv8-4a/tune-neoverse512tvb.inc
> new file mode 100644
> index 000000000000..450bf748963e
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv8-4a/tune-neoverse512tvb.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for neoverse-512tvb
> +#
> +DEFAULTTUNE ?=3D "neoverse512tvb"
> +
> +TUNEVALID[neoverse512tvb] =3D "Enable neoverse-512tvb specific processor=
 optimizations"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neoverse512tvb'=
, ' -mcpu=3Dneoverse-512tvb', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-4a.inc
> +
> +AVAILTUNES                                              +=3D "neoverse51=
2tvb"
> +ARMPKGARCH:tune-neoverse512tvb                           =3D "neoverse51=
2tvb"
> +TUNE_FEATURES:tune-neoverse512tvb                        =3D "aarch64 cr=
ypto neoverse512tvb"
> +PACKAGE_EXTRA_ARCHS:tune-neoverse512tvb                  =3D "${PACKAGE_=
EXTRA_ARCHS:tune-armv8-4a-crypto} neoverse512tvb"
> +BASE_LIB:tune-neoverse512tvb                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-4a/tune-neoversev1.inc b=
/meta/conf/machine/include/arm/armv8-4a/tune-neoversev1.inc
> new file mode 100644
> index 000000000000..2b4da7db3cd5
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv8-4a/tune-neoversev1.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for neoverse-v1
> +#
> +DEFAULTTUNE ?=3D "neoversev1"
> +
> +TUNEVALID[neoversev1] =3D "Enable neoverse-v1 specific processor optimiz=
ations"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neoversev1', ' =
-mcpu=3Dneoverse-v1', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-4a.inc
> +
> +AVAILTUNES                                          +=3D "neoversev1"
> +ARMPKGARCH:tune-neoversev1                           =3D "neoversev1"
> +TUNE_FEATURES:tune-neoversev1                        =3D "aarch64 crypto=
 neoversev1"
> +PACKAGE_EXTRA_ARCHS:tune-neoversev1                  =3D "${PACKAGE_EXTR=
A_ARCHS:tune-armv8-4a-crypto} neoversev1"
> +BASE_LIB:tune-neoversev1                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr82.inc b/me=
ta/conf/machine/include/arm/armv8r/tune-cortexr82.inc
> new file mode 100644
> index 000000000000..84b2471c6b15
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr82.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for cortex-r82
> +#
> +DEFAULTTUNE ?=3D "cortexr82"
> +
> +TUNEVALID[cortexr82] =3D "Enable cortex-r82 specific processor optimizat=
ions"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexr82', ' -=
mcpu=3Dcortex-r82', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8r.inc
> +
> +AVAILTUNES                                         +=3D "cortexr82"
> +ARMPKGARCH:tune-cortexr82                           =3D "cortexr82"
> +TUNE_FEATURES:tune-cortexr82                        =3D "${TUNE_FEATURES=
:tune-armv8r-crc-simd} cortexr82"
> +PACKAGE_EXTRA_ARCHS:tune-cortexr82                  =3D "${PACKAGE_EXTRA=
_ARCHS:tune-armv8r-crc-simd} cortexr82"
> +BASE_LIB:tune-cortexr82                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv9a/tune-cortexa510.inc b/m=
eta/conf/machine/include/arm/armv9a/tune-cortexa510.inc
> new file mode 100644
> index 000000000000..09219ec7f1c1
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv9a/tune-cortexa510.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for cortex-a510
> +#
> +DEFAULTTUNE ?=3D "cortexa510"
> +
> +TUNEVALID[cortexa510] =3D "Enable cortex-a510 specific processor optimiz=
ations"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa510', ' =
-mcpu=3Dcortex-a510', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv9a.inc
> +
> +AVAILTUNES                                          +=3D "cortexa510"
> +ARMPKGARCH:tune-cortexa510                           =3D "cortexa510"
> +TUNE_FEATURES:tune-cortexa510                        =3D "aarch64 crypto=
 cortexa510"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa510                  =3D "${PACKAGE_EXTR=
A_ARCHS:tune-armv9a-crypto} cortexa510"
> +BASE_LIB:tune-cortexa510                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv9a/tune-cortexa710.inc b/m=
eta/conf/machine/include/arm/armv9a/tune-cortexa710.inc
> new file mode 100644
> index 000000000000..19743d67db40
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv9a/tune-cortexa710.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for cortex-a710
> +#
> +DEFAULTTUNE ?=3D "cortexa710"
> +
> +TUNEVALID[cortexa710] =3D "Enable cortex-a710 specific processor optimiz=
ations"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa710', ' =
-mcpu=3Dcortex-a710', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv9a.inc
> +
> +AVAILTUNES                                          +=3D "cortexa710"
> +ARMPKGARCH:tune-cortexa710                           =3D "cortexa710"
> +TUNE_FEATURES:tune-cortexa710                        =3D "aarch64 crypto=
 cortexa710"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa710                  =3D "${PACKAGE_EXTR=
A_ARCHS:tune-armv9a-crypto} cortexa710"
> +BASE_LIB:tune-cortexa710                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv9a/tune-cortexa715.inc b/m=
eta/conf/machine/include/arm/armv9a/tune-cortexa715.inc
> new file mode 100644
> index 000000000000..2f6d8c6f8f56
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv9a/tune-cortexa715.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for cortex-a715
> +#
> +DEFAULTTUNE ?=3D "cortexa715"
> +
> +TUNEVALID[cortexa715] =3D "Enable cortex-a715 specific processor optimiz=
ations"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa715', ' =
-mcpu=3Dcortex-a715', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv9a.inc
> +
> +AVAILTUNES                                          +=3D "cortexa715"
> +ARMPKGARCH:tune-cortexa715                           =3D "cortexa715"
> +TUNE_FEATURES:tune-cortexa715                        =3D "aarch64 crypto=
 cortexa715"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa715                  =3D "${PACKAGE_EXTR=
A_ARCHS:tune-armv9a-crypto} cortexa715"
> +BASE_LIB:tune-cortexa715                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv9a/tune-cortexx2.inc b/met=
a/conf/machine/include/arm/armv9a/tune-cortexx2.inc
> new file mode 100644
> index 000000000000..c116e30ff591
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv9a/tune-cortexx2.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for cortex-x2
> +#
> +DEFAULTTUNE ?=3D "cortexx2"
> +
> +TUNEVALID[cortexx2] =3D "Enable cortex-x2 specific processor optimizatio=
ns"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexx2', ' -m=
cpu=3Dcortex-x2', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv9a.inc
> +
> +AVAILTUNES                                        +=3D "cortexx2"
> +ARMPKGARCH:tune-cortexx2                           =3D "cortexx2"
> +TUNE_FEATURES:tune-cortexx2                        =3D "aarch64 crypto c=
ortexx2"
> +PACKAGE_EXTRA_ARCHS:tune-cortexx2                  =3D "${PACKAGE_EXTRA_=
ARCHS:tune-armv9a-crypto} cortexx2"
> +BASE_LIB:tune-cortexx2                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv9a/tune-cortexx3.inc b/met=
a/conf/machine/include/arm/armv9a/tune-cortexx3.inc
> new file mode 100644
> index 000000000000..7982079ef86e
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv9a/tune-cortexx3.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for cortex-x3
> +#
> +DEFAULTTUNE ?=3D "cortexx3"
> +
> +TUNEVALID[cortexx3] =3D "Enable cortex-x3 specific processor optimizatio=
ns"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexx3', ' -m=
cpu=3Dcortex-x3', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv9a.inc
> +
> +AVAILTUNES                                        +=3D "cortexx3"
> +ARMPKGARCH:tune-cortexx3                           =3D "cortexx3"
> +TUNE_FEATURES:tune-cortexx3                        =3D "aarch64 crypto c=
ortexx3"
> +PACKAGE_EXTRA_ARCHS:tune-cortexx3                  =3D "${PACKAGE_EXTRA_=
ARCHS:tune-armv9a-crypto} cortexx3"
> +BASE_LIB:tune-cortexx3                             =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversev2.inc b/m=
eta/conf/machine/include/arm/armv9a/tune-neoversev2.inc
> new file mode 100644
> index 000000000000..5d1e108468d2
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/armv9a/tune-neoversev2.inc
> @@ -0,0 +1,15 @@
> +#
> +# Tune Settings for neoverse-v2
> +#
> +DEFAULTTUNE ?=3D "neoversev2"
> +
> +TUNEVALID[neoversev2] =3D "Enable neoverse-v2 specific processor optimiz=
ations"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neoversev2', ' =
-mcpu=3Dneoverse-v2', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv9a.inc
> +
> +AVAILTUNES                                          +=3D "neoversev2"
> +ARMPKGARCH:tune-neoversev2                           =3D "neoversev2"
> +TUNE_FEATURES:tune-neoversev2                        =3D "aarch64 crypto=
 neoversev2"
> +PACKAGE_EXTRA_ARCHS:tune-neoversev2                  =3D "${PACKAGE_EXTR=
A_ARCHS:tune-armv9a-crypto} neoversev2"
> +BASE_LIB:tune-neoversev2                             =3D "lib64"
> --
> 2.39.3 (Apple Git-145)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194933): https://lists.openembedded.org/g/openembedde=
d-core/message/194933
> Mute This Topic: https://lists.openembedded.org/mt/104174754/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

