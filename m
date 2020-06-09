Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.2092.1591687813933018093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 00:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: aehs29@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id n24so23696029lji.10
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 00:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MomU44l8gRUKCzgi5R1gWcMRO+aH97VcCmQOYpDbLZA=;
        b=aU4VmMyrHdUyyAC0vmzlkjHRumQ4ctcZoZQnaXQt90YbLkzmral+DRlbfFCxi+ytOa
         qIuO9+bt71/ZkRaWmIv4YHxZQgQO/FpLi2PFNCXxDd/2tyH30Z+3i29jIIfJFL1WzGKh
         AeXPM6k1r3aY+D6LBYwuD17nPH36Rf0gdS8EvLTVPrDChXbQjSaaHAdaA7EUs5tlGZJX
         A4h9gWeASDS43mWPpCY+Wr8d6eZhpUnuKxRbTm86a9Fa2CVfUuacSs+I+0tX98WCnlk6
         YOIpmNnxKmQ1+3mcjZMfgfdkKQ4DAaeI+JAXj0o89E0qpEj39Q4Hs45KSDbOppkevS4p
         GeCg==
X-Gm-Message-State: AOAM533+VZ/wgGaIUevG+fc73r8xXfXErjgaH2mNk5OyMbtpNiQZA7x9
	McxFvUYnaDA0KWpfTTGXtblVxmbR4UE=
X-Google-Smtp-Source: ABdhPJyT6aGfUsPbuEGBDDpYCYson2i5WkICxFB8E2UVkkBRc6BJ5/qwzi8fMIVMM/tSFIHqwFyjrw==
X-Received: by 2002:a2e:6a11:: with SMTP id f17mr12371298ljc.109.1591687811670;
        Tue, 09 Jun 2020 00:30:11 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id k22sm4909925lfg.69.2020.06.09.00.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 00:30:11 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id c21so11828067lfb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 00:30:11 -0700 (PDT)
X-Received: by 2002:a19:2250:: with SMTP id i77mr14762209lfi.133.1591687810901;
 Tue, 09 Jun 2020 00:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200526231037.2626327-1-raj.khem@gmail.com>
In-Reply-To: <20200526231037.2626327-1-raj.khem@gmail.com>
From: "Alejandro Hernandez" <alejandro@enedino.org>
Date: Tue, 9 Jun 2020 00:29:58 -0700
X-Gmail-Original-Message-ID: <CAHMutrbae=hs4_0gzWzKZHmm0meTvT4WQYGr67bveo=whqxXSA@mail.gmail.com>
Message-ID: <CAHMutrbae=hs4_0gzWzKZHmm0meTvT4WQYGr67bveo=whqxXSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] armv8/tunes: Set TUNE_PKGARCH_64 based on ARMPKGARCH
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000008feb2805a7a1b250"

--0000000000008feb2805a7a1b250
Content-Type: text/plain; charset="UTF-8"

Hello Khem,


On Tue, 26 May 2020 at 16:10, Khem Raj <raj.khem@gmail.com> wrote:

> The setting is to modify TUNE_PKGARCH which is filled with
> TUNE_PKGARCH_64 or TUNE_PKGARCH_32 in arm-arch64.inc
> This lets higher up tune files for arm64 SOCs override them if needed,
> this can help building multiple armv8 machines with different tunes in
> same workspace.
>
> No need to set TUNE_PKGARCH in tune files as it is synthesized from
> ARMPKGARCH
>
> Add ARMPKGARCH for aarch64 tunes
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> v2: Differentiate triplet for crypto feature
>
>  meta/conf/machine/include/arm/arch-arm64.inc           | 4 +++-
>  meta/conf/machine/include/tune-cortexa53.inc           | 5 +----
>  meta/conf/machine/include/tune-cortexa55.inc           | 1 -
>  meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 1 -
>  meta/conf/machine/include/tune-cortexa57.inc           | 4 +---
>  meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 4 +---
>  meta/conf/machine/include/tune-cortexa72.inc           | 1 -
>  meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 4 +---
>  8 files changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc
> b/meta/conf/machine/include/arm/arch-arm64.inc
> index 53f4566815..6d5b22fff0 100644
> --- a/meta/conf/machine/include/arm/arch-arm64.inc
> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> @@ -12,6 +12,8 @@ ARMPKGARCH_tune-aarch64 ?= "aarch64"
>  ARMPKGARCH_tune-aarch64_be ?= "aarch64_be"
>  TUNE_FEATURES_tune-aarch64 = "aarch64"
>  TUNE_FEATURES_tune-aarch64_be = "${TUNE_FEATURES_tune-aarch64} bigendian"
> +TUNE_PKGARCH_64_tune-aarch64 = "aarch64"
> +TUNE_PKGARCH_64_tune-aarch64_be = "aarch64_be"
>


I'm trying to accommodate my machines to the TUNE_PKGARCH changes and I'm a
bit confused by looking at the way these variables are now set.

The way these overrides are behaving, is this meant to be desired behavior?

# $TUNE_PKGARCH [9 operations]
...
override[64_tune-aarch64]:set
/poky/meta/conf/machine/include/arm/arch-arm64.inc:15
#     "aarch64"
#   override[64_tune-aarch64_be]:set
/oky/meta/conf/machine/include/arm/arch-arm64.inc:16
#     "aarch64_be"

Is the 64_tune_aarch64 meant to be an override for TUNE_PKGARCH or is that
supposed to be set for the TUNE_PKGARCH_64 variable instead?

Cheers,

Alejandro





>  BASE_LIB_tune-aarch64 = "lib64"
>  BASE_LIB_tune-aarch64_be = "lib64"
>
> @@ -20,7 +22,7 @@ PACKAGE_EXTRA_ARCHS_tune-aarch64_be = "aarch64_be"
>
>  ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian',
> '_be', '', d)}"
>  TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
> -TUNE_PKGARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
> +TUNE_PKGARCH_64 = "${ARMPKGARCH}${ARMPKGSFX_ENDIAN_64}"
>  ABIEXTENSION_64 = ""
>  TARGET_FPU_64 = ""
>
> diff --git a/meta/conf/machine/include/tune-cortexa53.inc
> b/meta/conf/machine/include/tune-cortexa53.inc
> index b7327d00c4..c0bb28a19e 100644
> --- a/meta/conf/machine/include/tune-cortexa53.inc
> +++ b/meta/conf/machine/include/tune-cortexa53.inc
> @@ -8,14 +8,11 @@ require conf/machine/include/arm/arch-armv8a.inc
>  # Little Endian base configs
>  AVAILTUNES += "cortexa53 cortexa53-crypto"
>  ARMPKGARCH_tune-cortexa53             = "cortexa53"
> -ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53"
> +ARMPKGARCH_tune-cortexa53-crypto      = "cortexa53-crypto"
>  TUNE_FEATURES_tune-cortexa53          = "aarch64 cortexa53 crc"
>  TUNE_FEATURES_tune-cortexa53-crypto   = "aarch64 cortexa53 crc crypto"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa53             =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
>
> -TUNE_PKGARCH_tune-cortexa53 = "cortexa53"
> -TUNE_PKGARCH_tune-cortexa53-crypto = "cortexa53-crypto"
> -
>  BASE_LIB_tune-cortexa53               = "lib64"
>  BASE_LIB_tune-cortexa53-crypto        = "lib64"
> diff --git a/meta/conf/machine/include/tune-cortexa55.inc
> b/meta/conf/machine/include/tune-cortexa55.inc
> index 274944819e..89032b59ec 100644
> --- a/meta/conf/machine/include/tune-cortexa55.inc
> +++ b/meta/conf/machine/include/tune-cortexa55.inc
> @@ -9,6 +9,5 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES += "cortexa55"
>  ARMPKGARCH_tune-cortexa55             = "cortexa55"
>  TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc crypto"
> -TUNE_PKGARCH_tune-cortexa55           = "cortexa55"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa55    =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55"
>  BASE_LIB_tune-cortexa55               = "lib64"
> diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> index b95d63e86b..ba4b073852 100644
> --- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> +++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> @@ -11,6 +11,5 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES += "cortexa57-cortexa53"
>  ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
>  TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 cortexa57-cortexa53"
> -TUNE_PKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 =
> "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa57-cortexa53"
>  BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
> diff --git a/meta/conf/machine/include/tune-cortexa57.inc
> b/meta/conf/machine/include/tune-cortexa57.inc
> index e8ddeb5786..0811d503cc 100644
> --- a/meta/conf/machine/include/tune-cortexa57.inc
> +++ b/meta/conf/machine/include/tune-cortexa57.inc
> @@ -8,12 +8,10 @@ require conf/machine/include/arm/arch-armv8a.inc
>  # Little Endian base configs
>  AVAILTUNES += "cortexa57 cortexa57-crypto"
>  ARMPKGARCH_tune-cortexa57             = "cortexa57"
> -ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57"
> +ARMPKGARCH_tune-cortexa57-crypto      = "cortexa57-crypto"
>  TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
>  TUNE_FEATURES_tune-cortexa57-crypto   = "aarch64 cortexa57 crc crypto"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa57             =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
> -TUNE_PKGARCH_tune-cortexa57 = "cortexa57"
> -TUNE_PKGARCH_tune-cortexa57-crypto = "cortexa57-crypto"
>  BASE_LIB_tune-cortexa57               = "lib64"
>  BASE_LIB_tune-cortexa57-crypto        = "lib64"
> diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> index fd1ffeb177..e857f875ff 100644
> --- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> @@ -10,13 +10,11 @@ require conf/machine/include/arm/arch-armv8a.inc
>  # cortexa72.cortexa53 implies crc support
>  AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
>  ARMPKGARCH_tune-cortexa72-cortexa53                  =
> "cortexa72-cortexa53"
> -ARMPKGARCH_tune-cortexa72-cortexa53-crypto           =
> "cortexa72-cortexa53"
> +ARMPKGARCH_tune-cortexa72-cortexa53-crypto           =
> "cortexa72-cortexa53-crypto"
>  TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc
> cortexa72-cortexa53"
>  TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "aarch64 crc
> crypto cortexa72-cortexa53"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53
> cortexa72-cortexa53-crypto"
> -TUNE_PKGARCH_tune-cortexa72-cortexa53                =
> "cortexa72-cortexa53"
> -TUNE_PKGARCH_tune-cortexa72-cortexa53-crypto         =
> "cortexa72-cortexa53-crypto"
>  BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
>  BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
>
> diff --git a/meta/conf/machine/include/tune-cortexa72.inc
> b/meta/conf/machine/include/tune-cortexa72.inc
> index 23640d5c1f..00f7745a22 100644
> --- a/meta/conf/machine/include/tune-cortexa72.inc
> +++ b/meta/conf/machine/include/tune-cortexa72.inc
> @@ -10,5 +10,4 @@ AVAILTUNES += "cortexa72"
>  ARMPKGARCH_tune-cortexa72             = "cortexa72"
>  TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa72    =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
> -TUNE_PKGARCH_tune-cortexa72           = "cortexa72"
>  BASE_LIB_tune-cortexa72               = "lib64"
> diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> index ab87c88747..ba2b9b1951 100644
> --- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> +++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> @@ -10,13 +10,11 @@ require conf/machine/include/arm/arch-armv8a.inc
>  # cortexa73.cortexa53 implies crc support
>  AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
>  ARMPKGARCH_tune-cortexa73-cortexa53                  =
> "cortexa73-cortexa53"
> -ARMPKGARCH_tune-cortexa73-cortexa53-crypto           =
> "cortexa73-cortexa53"
> +ARMPKGARCH_tune-cortexa73-cortexa53-crypto           =
> "cortexa73-cortexa53-crypto"
>  TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc
> cortexa73-cortexa53"
>  TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "aarch64 crc
> crypto cortexa73-cortexa53"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53
> cortexa73-cortexa53-crypto"
> -TUNE_PKGARCH_tune-cortexa73-cortexa53                =
> "cortexa73-cortexa53"
> -TUNE_PKGARCH_tune-cortexa73-cortexa53-crypto         =
> "cortexa73-cortexa53-crypto"
>  BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
>  BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
>
> --
> 2.26.2
>
> 
>

--0000000000008feb2805a7a1b250
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace;font-size:small">Hello Khem,</div><div class=3D"gmail_de=
fault" style=3D"font-family:monospace"><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 26 May 2020 at 16:=
10, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
e setting is to modify TUNE_PKGARCH which is filled with<br>
TUNE_PKGARCH_64 or TUNE_PKGARCH_32 in arm-arch64.inc<br>
This lets higher up tune files for arm64 SOCs override them if needed,<br>
this can help building multiple armv8 machines with different tunes in<br>
same workspace.<br>
<br>
No need to set TUNE_PKGARCH in tune files as it is synthesized from ARMPKG=
ARCH<br>
<br>
Add ARMPKGARCH for aarch64 tunes<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
v2: Differentiate triplet for crypto feature<br>
<br>
=C2=A0meta/conf/machine/include/arm/arch-arm64.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0| 4 +++-<br>
=C2=A0meta/conf/machine/include/tune-cortexa53.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0| 5 +----<br>
=C2=A0meta/conf/machine/include/tune-cortexa55.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 1 -<br>
=C2=A0meta/conf/machine/include/tune-cortexa57.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0| 4 +---<br>
=C2=A0meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 4 +---<br>
=C2=A0meta/conf/machine/include/tune-cortexa72.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 4 +---<br>
=C2=A08 files changed, 7 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/mach=
ine/include/arm/arch-arm64.inc<br>
index 53f4566815..6d5b22fff0 100644<br>
--- a/meta/conf/machine/include/arm/arch-arm64.inc<br>
+++ b/meta/conf/machine/include/arm/arch-arm64.inc<br>
@@ -12,6 +12,8 @@ ARMPKGARCH_tune-aarch64 ?=3D &quot;aarch64&quot;<br>
=C2=A0ARMPKGARCH_tune-aarch64_be ?=3D &quot;aarch64_be&quot;<br>
=C2=A0TUNE_FEATURES_tune-aarch64 =3D &quot;aarch64&quot;<br>
=C2=A0TUNE_FEATURES_tune-aarch64_be =3D &quot;${TUNE_FEATURES_tune-aarch64=
} bigendian&quot;<br>
+TUNE_PKGARCH_64_tune-aarch64 =3D &quot;aarch64&quot;<br>
+TUNE_PKGARCH_64_tune-aarch64_be =3D &quot;aarch64_be&quot;<br></blockquot=
e><div><br></div><div>=C2=A0</div><div><div class=3D"gmail_default" style=
=3D"font-family:monospace;font-size:small">I&#39;m trying to accommodate m=
y machines to the TUNE_PKGARCH changes and I&#39;m a bit confused by=C2=A0l=
ooking at the=C2=A0way these variables are now set.</div><div class=3D"gmai=
l_default" style=3D"font-family:monospace"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:monospace">The way these overrides are behaving=
, is this meant to be desired behavior?</div><div class=3D"gmail_default" s=
tyle=3D"font-family:monospace"><br></div><div class=3D"gmail_default" style=
=
=3D"font-family:monospace"># $TUNE_PKGARCH [9 operations]<br></div><div cl=
ass=3D"gmail_default" style=3D"font-family:monospace">...</div><div class=
=3D"gmail_default" style=3D"font-family:monospace">override[64_tune-aarch6=
4]:set /poky/meta/conf/machine/include/arm/arch-arm64.inc:15<br># =C2=A0 =
=C2=A0 &quot;aarch64&quot;<br># =C2=A0 override[64_tune-aarch64_be]:set /o=
ky/meta/conf/machine/include/arm/arch-arm64.inc:16<br># =C2=A0 =C2=A0 &quot=
;aarch64_be&quot;<br></div><div class=3D"gmail_default" style=3D"font-famil=
y:monospace"><br></div><div class=3D"gmail_default" style=3D"font-family:mo=
nospace">Is the 64_tune_aarch64 meant to be an override for TUNE_PKGARCH or=
 is that supposed to be set for the TUNE_PKGARCH_64 variable instead?</div>=
<div class=3D"gmail_default" style=3D"font-family:monospace"><br></div><div=
 class=3D"gmail_default" style=3D"font-family:monospace">Cheers,</div><div =
class=3D"gmail_default" style=3D"font-family:monospace"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:monospace;font-size:small">Alejand=
ro</div><br></div><div><br></div><div><br></div><div>=C2=A0<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
=C2=A0BASE_LIB_tune-aarch64 =3D &quot;lib64&quot;<br>
=C2=A0BASE_LIB_tune-aarch64_be =3D &quot;lib64&quot;<br>
<br>
@@ -20,7 +22,7 @@ PACKAGE_EXTRA_ARCHS_tune-aarch64_be =3D &quot;aarch64_be=
&quot;<br>
<br>
=C2=A0ARMPKGSFX_ENDIAN_64 =3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURE=
S&#39;, &#39;bigendian&#39;, &#39;_be&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0TUNE_ARCH_64 =3D &quot;aarch64${ARMPKGSFX_ENDIAN_64}&quot;<br>
-TUNE_PKGARCH_64 =3D &quot;aarch64${ARMPKGSFX_ENDIAN_64}&quot;<br>
+TUNE_PKGARCH_64 =3D &quot;${ARMPKGARCH}${ARMPKGSFX_ENDIAN_64}&quot;<br>
=C2=A0ABIEXTENSION_64 =3D &quot;&quot;<br>
=C2=A0TARGET_FPU_64 =3D &quot;&quot;<br>
<br>
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/mach=
ine/include/tune-cortexa53.inc<br>
index b7327d00c4..c0bb28a19e 100644<br>
--- a/meta/conf/machine/include/tune-cortexa53.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa53.inc<br>
@@ -8,14 +8,11 @@ require conf/machine/include/arm/arch-armv8a.inc<br>
=C2=A0# Little Endian base configs<br>
=C2=A0AVAILTUNES +=3D &quot;cortexa53 cortexa53-crypto&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa53&quot;<br>
-ARMPKGARCH_tune-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa53&=
quot;<br>
+ARMPKGARCH_tune-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa53-=
crypto&quot;<br>
=C2=A0TUNE_FEATURES_tune-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
quot;aarch64 cortexa53 crc&quot;<br>
=C2=A0TUNE_FEATURES_tune-cortexa53-crypto=C2=A0 =C2=A0=3D &quot;aarch64 co=
rtexa53 crc crypto&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53&qu=
ot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =3D &q=
uot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypt=
o&quot;<br>
<br>
-TUNE_PKGARCH_tune-cortexa53 =3D &quot;cortexa53&quot;<br>
-TUNE_PKGARCH_tune-cortexa53-crypto =3D &quot;cortexa53-crypto&quot;<br>
-<br>
=C2=A0BASE_LIB_tune-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;lib64&quot;<br>
=C2=A0BASE_LIB_tune-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;=
lib64&quot;<br>
diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/mach=
ine/include/tune-cortexa55.inc<br>
index 274944819e..89032b59ec 100644<br>
--- a/meta/conf/machine/include/tune-cortexa55.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa55.inc<br>
@@ -9,6 +9,5 @@ require conf/machine/include/arm/arch-armv8a.inc<br>
=C2=A0AVAILTUNES +=3D &quot;cortexa55&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa55&quot;<br>
=C2=A0TUNE_FEATURES_tune-cortexa55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
quot;aarch64 cortexa55 crc crypto&quot;<br>
-TUNE_PKGARCH_tune-cortexa55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &=
quot;cortexa55&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa55=C2=A0 =C2=A0 =3D &quot;${PACKAGE_=
EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55&quot;<br>
=C2=A0BASE_LIB_tune-cortexa55=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;lib64&quot;<br>
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta=
/conf/machine/include/tune-cortexa57-cortexa53.inc<br>
index b95d63e86b..ba4b073852 100644<br>
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc<br>
@@ -11,6 +11,5 @@ require conf/machine/include/arm/arch-armv8a.inc<br>
=C2=A0AVAILTUNES +=3D &quot;cortexa57-cortexa53&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa57-cortexa53 =3D &quot;cortexa57-cortexa53&qu=
ot;<br>
=C2=A0TUNE_FEATURES_tune-cortexa57-cortexa53 =3D &quot;aarch64 cortexa57-c=
ortexa53&quot;<br>
-TUNE_PKGARCH_tune-cortexa57-cortexa53 =3D &quot;cortexa57-cortexa53&quot;=
<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 =3D &quot;${PACKAGE_EXT=
RA_ARCHS_tune-aarch64} cortexa57-cortexa53&quot;<br>
=C2=A0BASE_LIB_tune-cortexa57-cortexa53 =3D &quot;lib64&quot;<br>
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/mach=
ine/include/tune-cortexa57.inc<br>
index e8ddeb5786..0811d503cc 100644<br>
--- a/meta/conf/machine/include/tune-cortexa57.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa57.inc<br>
@@ -8,12 +8,10 @@ require conf/machine/include/arm/arch-armv8a.inc<br>
=C2=A0# Little Endian base configs<br>
=C2=A0AVAILTUNES +=3D &quot;cortexa57 cortexa57-crypto&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa57=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa57&quot;<br>
-ARMPKGARCH_tune-cortexa57-crypto=C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa57&=
quot;<br>
+ARMPKGARCH_tune-cortexa57-crypto=C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa57-=
crypto&quot;<br>
=C2=A0TUNE_FEATURES_tune-cortexa57=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
quot;aarch64 cortexa57 crc&quot;<br>
=C2=A0TUNE_FEATURES_tune-cortexa57-crypto=C2=A0 =C2=A0=3D &quot;aarch64 co=
rtexa57 crc crypto&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa57=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57&qu=
ot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto=C2=A0 =C2=A0 =C2=A0 =3D &q=
uot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypt=
o&quot;<br>
-TUNE_PKGARCH_tune-cortexa57 =3D &quot;cortexa57&quot;<br>
-TUNE_PKGARCH_tune-cortexa57-crypto =3D &quot;cortexa57-crypto&quot;<br>
=C2=A0BASE_LIB_tune-cortexa57=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;lib64&quot;<br>
=C2=A0BASE_LIB_tune-cortexa57-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;=
lib64&quot;<br>
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta=
/conf/machine/include/tune-cortexa72-cortexa53.inc<br>
index fd1ffeb177..e857f875ff 100644<br>
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc<br>
@@ -10,13 +10,11 @@ require conf/machine/include/arm/arch-armv8a.inc<br>
=C2=A0# cortexa72.cortexa53 implies crc support<br>
=C2=A0AVAILTUNES +=3D &quot;cortexa72-cortexa53 cortexa72-cortexa53-crypto=
&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa72-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa72-cortexa53&quot;<br>
-ARMPKGARCH_tune-cortexa72-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;cortexa72-cortexa53&quot;<br>
+ARMPKGARCH_tune-cortexa72-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;cortexa72-cortexa53-crypto&quot;<br>
=C2=A0TUNE_FEATURES_tune-cortexa72-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64 crc cortexa72-cortexa53&quot;=
<br>
=C2=A0TUNE_FEATURES_tune-cortexa72-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;aarch64 crc crypto cortexa72-cortexa53&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 cortexa72-cortexa53&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto=C2=A0 =3D &quot;=
${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72=
-cortexa53-crypto&quot;<br>
-TUNE_PKGARCH_tune-cortexa72-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa72-cortexa53&quot;<br>
-TUNE_PKGARCH_tune-cortexa72-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa72-cortexa53-crypto&quot;<br>
=C2=A0BASE_LIB_tune-cortexa72-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
=C2=A0BASE_LIB_tune-cortexa72-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
<br>
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/mach=
ine/include/tune-cortexa72.inc<br>
index 23640d5c1f..00f7745a22 100644<br>
--- a/meta/conf/machine/include/tune-cortexa72.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa72.inc<br>
@@ -10,5 +10,4 @@ AVAILTUNES +=3D &quot;cortexa72&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa72&quot;<br>
=C2=A0TUNE_FEATURES_tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &=
quot;aarch64 cortexa72 crc crypto&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa72=C2=A0 =C2=A0 =3D &quot;${PACKAGE_=
EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72&quot;<br>
-TUNE_PKGARCH_tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &=
quot;cortexa72&quot;<br>
=C2=A0BASE_LIB_tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;lib64&quot;<br>
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta=
/conf/machine/include/tune-cortexa73-cortexa53.inc<br>
index ab87c88747..ba2b9b1951 100644<br>
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc<br>
@@ -10,13 +10,11 @@ require conf/machine/include/arm/arch-armv8a.inc<br>
=C2=A0# cortexa73.cortexa53 implies crc support<br>
=C2=A0AVAILTUNES +=3D &quot;cortexa73-cortexa53 cortexa73-cortexa53-crypto=
&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa73-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa73-cortexa53&quot;<br>
-ARMPKGARCH_tune-cortexa73-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;cortexa73-cortexa53&quot;<br>
+ARMPKGARCH_tune-cortexa73-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;cortexa73-cortexa53-crypto&quot;<br>
=C2=A0TUNE_FEATURES_tune-cortexa73-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64 crc cortexa73-cortexa53&quot;=
<br>
=C2=A0TUNE_FEATURES_tune-cortexa73-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D &quot;aarch64 crc crypto cortexa73-cortexa53&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0=3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 cortexa73-cortexa53&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto=C2=A0 =3D &quot;=
${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73=
-cortexa53-crypto&quot;<br>
-TUNE_PKGARCH_tune-cortexa73-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa73-cortexa53&quot;<br>
-TUNE_PKGARCH_tune-cortexa73-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa73-cortexa53-crypto&quot;<br>
=C2=A0BASE_LIB_tune-cortexa73-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;lib64&quot;<br>
=C2=A0BASE_LIB_tune-cortexa73-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br>
<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div></div>

--0000000000008feb2805a7a1b250--
