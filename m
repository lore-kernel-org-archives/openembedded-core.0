Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.32810.1589758140012460779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 16:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VVzOZ3Pu;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id m7so3457024plt.5
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 16:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=U287simCWue5MYtH/Vx0QwNi62DtY/KbLqJR8cfQuA0=;
        b=VVzOZ3PufdmU/lQvmBA6mHeRnU18PCIKw7kWyigOlMW/WZuboo6JXv2u6NfB6IQg9N
         xjTpO+OQPgbqt+igooNkzm3qkXrrX8rO5N15FRPsE5HNGrVUly6vhesBYsMY9RiNvXvs
         MpgFMkZEMRQ4UlXek7Iy48VU9eCYS7pF5jn5XaFe0ZP4Ks2BDT4mHmy4oZSsPaDP7tKN
         XefI36hSipFkA5AsL3pZeDF4AuKmvYu9QqmT6v7dphMQoaj5ccckaXqdil/Trb95cSfz
         h8q5puuIZv1bTFcMQ3jWcTom7eKgolsnM3xg3RBokMGlfCYUlMnNu8QY4ljzgl2s8GYH
         /Ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=U287simCWue5MYtH/Vx0QwNi62DtY/KbLqJR8cfQuA0=;
        b=BEo+edKMAl5KXc8/uc6UqDbTsKAASiLwtlR4FJZmklHV51fdXrU1i8KmExo2iZEPdq
         jE9C5hNu07tRHwCAaurRIuKWtaCm2CisuxbgHCa/q4Erg9hDvy/I9HwyVqRCU60sG0oa
         wLvgfp9ea+Jw9r4ANiPNk9fdT826GjTqU40Qw4BdPraARp+CGIKw30e3psKIyXXOZVxb
         VpDPzB9xYvIsr13K22iVNcf58ODlHTrMguvQOGF2VEvAr5VmDOX0O0tU/AqxVX8qIIqB
         q1uq2N2iRUgQKJzJ0pYUZW/tohdj0ytkOXc4xelQiEFIkJQVskhEtscozgz1S1FAV5S1
         fAPA==
X-Gm-Message-State: AOAM531OWv0MdmfdMvOvRTVBoNkJ7jPNm9a0jfwlyzhqlmfd0AWDk98P
	ts4AaprfApH2nK8BiqT6dcBBFeRcx0k=
X-Google-Smtp-Source: ABdhPJwlx90mTkUG6x7a14AAAR4I4WAWvoT+phKuUy3uCfvghxSwk+ZsbmkplM2Tbh1WnASByuWnYg==
X-Received: by 2002:a17:902:ab98:: with SMTP id f24mr6864845plr.6.1589758138718;
        Sun, 17 May 2020 16:28:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2264? ([2601:646:9200:4e0::2264])
        by smtp.gmail.com with ESMTPSA id m188sm7095303pfd.67.2020.05.17.16.28.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2020 16:28:58 -0700 (PDT)
Subject: Re: [OE-core][PATCH] gcc: Remove mudflap remnants
To: openembedded-core@lists.openembedded.org
References: <20200517125952.25245-1-bunk@stusta.de>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <e2be2ff5-3cbb-303f-74b6-c84b5edcba32@gmail.com>
Date: Sun, 17 May 2020 16:28:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200517125952.25245-1-bunk@stusta.de>
X-Groupsio-MsgNum: 138386
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="9FJp5yuSnybZKdIdwmhCQSIazfihdlBuy"

--9FJp5yuSnybZKdIdwmhCQSIazfihdlBuy
Content-Type: multipart/mixed; boundary="wsjwBh44pMufdVfJTwvUjs5LEMFSkODAx";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <e2be2ff5-3cbb-303f-74b6-c84b5edcba32@gmail.com>
Subject: Re: [OE-core][PATCH] gcc: Remove mudflap remnants
References: <20200517125952.25245-1-bunk@stusta.de>
In-Reply-To: <20200517125952.25245-1-bunk@stusta.de>

--wsjwBh44pMufdVfJTwvUjs5LEMFSkODAx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/17/20 5:59 AM, Adrian Bunk wrote:
> mudflap was removed in gcc 4.9.
>=20

This looks ok.

> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-devtools/gcc/gcc-10.1.inc    |  2 --
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 15 ---------------
>  2 files changed, 17 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-10.1.inc b/meta/recipes-devto=
ols/gcc/gcc-10.1.inc
> index 041d426187..a3de91a2c6 100644
> --- a/meta/recipes-devtools/gcc/gcc-10.1.inc
> +++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
> @@ -87,7 +87,6 @@ EXTRA_OECONF_BASE =3D "\
>      ${SSP} \
>      --enable-libitm \
>      --disable-bootstrap \
> -    --disable-libmudflap \
>      --with-system-zlib \
>      ${@'--with-linker-hash-style=3D${LINKER_HASH_STYLE}' if '${LINKER_H=
ASH_STYLE}' else ''} \
>      --enable-linker-build-id \
> @@ -99,7 +98,6 @@ EXTRA_OECONF_BASE =3D "\
>  "
>  
>  EXTRA_OECONF_INITIAL =3D "\
> -    --disable-libmudflap \
>      --disable-libgomp \
>      --disable-libitm \
>      --disable-libquadmath \
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-de=
vtools/gcc/gcc-runtime.inc
> index e12c74613f..df1432e68d 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -47,7 +47,6 @@ RUNTIMETARGET =3D "${RUNTIMELIBSSP} libstdc++-v3 libgo=
mp libatomic ${RUNTIMELIBITM
>  RUNTIMETARGET_libc-newlib =3D "libstdc++-v3"
>  
>  # libiberty
> -# libmudflap
>  # libgfortran needs separate recipe due to libquadmath dependency
>  
>  SLIB =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> @@ -167,9 +166,6 @@ PACKAGES =3D "\
>      libssp \
>      libssp-dev \
>      libssp-staticdev \
> -    libmudflap \
> -    libmudflap-dev \
> -    libmudflap-staticdev \
>      libquadmath \
>      libquadmath-dev \
>      libquadmath-staticdev \
> @@ -242,17 +238,6 @@ SUMMARY_libquadmath-dev =3D "GNU quad-precision mat=
h library - development files"
>  FILES_libquadmath-staticdev =3D "${libdir}/libquadmath.a"
>  SUMMARY_libquadmath-staticdev =3D "GNU quad-precision math library - st=
atic development files"
>  
> -# NOTE: mudflap has been removed as of gcc 4.9 and has been superseded =
by the address sanitiser
> -FILES_libmudflap =3D "${libdir}/libmudflap*.so.*"
> -SUMMARY_libmudflap =3D "Pointer debugging library for gcc"
> -FILES_libmudflap-dev =3D "\
> -    ${libdir}/libmudflap*.so \
> -    ${libdir}/libmudflap.la \
> -"
> -SUMMARY_libmudflap-dev =3D "Pointer debugging library for gcc - develop=
ment files"
> -FILES_libmudflap-staticdev =3D "${libdir}/libmudflap.a"
> -SUMMARY_libmudflap-staticdev =3D "Pointer debugging library for gcc - s=
tatic development files"
> -
>  FILES_libgomp =3D "${libdir}/libgomp*${SOLIBS}"
>  SUMMARY_libgomp =3D "GNU OpenMP parallel programming library"
>  FILES_libgomp-dev =3D "\
>=20
>=20
>=20
>=20


--wsjwBh44pMufdVfJTwvUjs5LEMFSkODAx--

--9FJp5yuSnybZKdIdwmhCQSIazfihdlBuy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXsHIswAKCRC7BTNVkZ0z
FAX0AJsGDD27dVFwAS06UrQz+JQvRjBa6QCgh+3HFqyhCEfAN3RFZwxHg5+6Bgk=
=Tn3I
-----END PGP SIGNATURE-----

--9FJp5yuSnybZKdIdwmhCQSIazfihdlBuy--
