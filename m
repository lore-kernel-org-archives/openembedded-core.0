Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.1701.1587789983836559210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 21:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KFZtin5w;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id t4so4514447plq.12
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2020 21:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=3AGu/CP/F5aC811cxS+CPH12Q+h5gxNx9Z/tvMfaRoI=;
        b=KFZtin5wsXPNpxZCEqESMhCkssaZdTBIOw/BLlwhFIfzUHmRjwaVsmIuPPa+KNC6Vg
         qBC5eO5NXVTr4nLvPulaAF4eCK7J2lKibP0sC28T8ivtZclbwJ5r/vO1n2h+Wz+HjixX
         D96ZhUJncBjWMCAXkGu3Uu/Z6up/z2g0Wz1jeJVqCXz8542CEXT5TsA3mYVtNvhnWsBn
         IgCrXSjzXflPdKEpLG63aPZT92sWIPUWf5HmkFV2bu3fZD6JlGH5EN5dKoMKa5xbJezA
         Mx/U4he4Cps4TlbqpHENlRbF0D65Nk67S8iHrs2ysD2fys20k1hhlRH6+eVZmMlbRb8l
         XrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=3AGu/CP/F5aC811cxS+CPH12Q+h5gxNx9Z/tvMfaRoI=;
        b=dlBP0HPL5Nmq7KpC7NUYIgCdVZSSvedvXL+HzcQWYUhlSJ8rXOsq/ChbLsgKCHpN8f
         jAWlC8Uw22SZKBBhvd7KvdHv5fnVYNm0LQIDR0yFgxHjc/i79l5z1S+ONZZq+RTTyCbY
         t6ldOXGgnDTTnqZWxC6gBFuoVfJhdB+XQSc7kuo1mSjuSBeuxxGb5NpafBy8Ac346BLz
         ZZek87aA1D5K01li+DGIi2QcsZiEaFkbLCvvMxNNsQjxRz0WBGaKT/oTh5WQQFOnWPQC
         PwtcVMu2+76LRPUXx6l+tOZYaWx34hVPvVpqlqUgIFSVpk0ziOdXPpQnotQipC7piB7h
         KFSw==
X-Gm-Message-State: AGi0PuZFcTq/PYvii9TlyNnU7G6BAuggDo+FR7qMdlwl9sbhDu18H8zJ
	EHi2Hb6JzaZv+kM01YYNgrrtXBBL5mE=
X-Google-Smtp-Source: APiQypINuf/nF4lmInTEKqZNGDtSHu+8ojpN3jgT2SgieM0ERaZwwRbC1353ApPyfmkVgjTSfQGxeA==
X-Received: by 2002:a17:902:5a8e:: with SMTP id r14mr12796002pli.81.1587789983070;
        Fri, 24 Apr 2020 21:46:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::ac76? ([2601:646:9200:4e0::ac76])
        by smtp.gmail.com with ESMTPSA id 1sm6215599pjc.32.2020.04.24.21.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 21:46:22 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
To: =?UTF-8?Q?Bart=c5=82omiej_Burdukiewicz?=
 <bartlomiej.burdukiewicz@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200424150143.374520-1-bartlomiej.burdukiewicz@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 mQGiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
 Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
 miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
 /1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
 4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
 ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
 jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
 6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdLQdS2hlbSBSYWog
 PHJhai5raGVtQGdtYWlsLmNvbT6IYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQIIAwQWAgMB
 Ah4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0gAJ9wRt36PqfjNe90
 4evWolFf5cMmp7kEDQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
 DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
 2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
 I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
 RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
 6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
 584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
 HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
 KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
 seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
 3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
 9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
 EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
 X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
 3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
 jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
 UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
 mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
 suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
 XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiiEkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
 VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Organization: HIMVIS LLC
Message-ID: <7de2a86b-e32c-35ae-716d-505845a837b2@gmail.com>
Date: Fri, 24 Apr 2020 21:46:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424150143.374520-1-bartlomiej.burdukiewicz@gmail.com>
X-Groupsio-MsgNum: 137456
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="kDnE9gSXuuUVlmEQ7qXUGI08JSKsTDXbC"

--kDnE9gSXuuUVlmEQ7qXUGI08JSKsTDXbC
Content-Type: multipart/mixed; boundary="KJESWgmU4xiZYuuoDWp6CvYEikYsracqt";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: =?UTF-8?Q?Bart=c5=82omiej_Burdukiewicz?=
 <bartlomiej.burdukiewicz@gmail.com>, openembedded-core@lists.openembedded.org
Message-ID: <7de2a86b-e32c-35ae-716d-505845a837b2@gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
References: <20200424150143.374520-1-bartlomiej.burdukiewicz@gmail.com>
In-Reply-To: <20200424150143.374520-1-bartlomiej.burdukiewicz@gmail.com>

--KJESWgmU4xiZYuuoDWp6CvYEikYsracqt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 4/24/20 8:01 AM, Bart=C5=82omiej Burdukiewicz wrote:
> Mesa can be compiled with libva support, in order to avoid recursive
> dependency between mesa and libva, virtual/mesa must be removed
> from libva recipe.
>=20
> Signed-off-by: Bart=C5=82omiej Burdukiewicz <bartlomiej.burdukiewicz@gma=
il.com>
> ---
>  meta/recipes-graphics/libva/libva_2.6.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-g=
raphics/libva/libva_2.6.1.bb
> index 92cea83bc1..c1a441a18b 100644
> --- a/meta/recipes-graphics/libva/libva_2.6.1.bb
> +++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
> @@ -23,7 +23,7 @@ SRC_URI[sha256sum] =3D "6c57eb642d828af2411aa38f55dc10=
111e8c98976dbab8fd62e4862940
>  
>  UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
>  
> -DEPENDS =3D "libdrm virtual/mesa"
> +DEPENDS =3D "libdrm"

I am not sure how it will work with non-mesa graphics stacks. Or is it
non-issue ?

>  
>  inherit meson pkgconfig features_check
>  
>=20
>=20
>=20
>=20


--KJESWgmU4xiZYuuoDWp6CvYEikYsracqt--

--kDnE9gSXuuUVlmEQ7qXUGI08JSKsTDXbC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXqPAmQAKCRC7BTNVkZ0z
FDdlAJ9yJGJyFmmjl3osT3l2oirPovI/1wCeOfCu1dEFARa/ouP2TI5VgWbt3v4=
=su16
-----END PGP SIGNATURE-----

--kDnE9gSXuuUVlmEQ7qXUGI08JSKsTDXbC--
