Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A69EE57C3
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 04:46:41 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.33000.1694148395890709989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 21:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KVzwXaet;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3ab3aa9ae33so1236043b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 21:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694148395; x=1694753195; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UieY1c39HEHbc7ZIKcUrhvOnEtW/MteRTz57iPxlCtQ=;
        b=KVzwXaetxb6XTk/olUubmp+drN3z+DLK0Wk1Czz0UmOU3Vc4Fpi0Yt70s+N1TXsUE7
         kjFSX4gh80UULIM6h42PXasG3g3AQHZ2lkj4EDgJ29X0hxDSdsSJQVb+Y1UC2lz87/+Z
         nccuY6CY13AZZJTM2/4+YxRxukpqwenjVs1u1rUlIx50QEvBTFNcgqx4QB0/JK14ox1A
         FDFOADsA2ZiyKp1rfet3cHRm5Mgk8SEVcRsWGoEFK+8jTc0dbzjulqp/wxUunSEmpT91
         BWbda88w2l3VhHFICCIgQ+x22iE9oIOuY3H0XpI0e7Q223rgbUw3ug01KT3Qa93/COh9
         E5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694148395; x=1694753195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UieY1c39HEHbc7ZIKcUrhvOnEtW/MteRTz57iPxlCtQ=;
        b=KJ6jSnaIVJ2rVtfvPFdLxG8lyFv6WDdwpNGTDdVvkpJWiNIFWDg+D5q0OlHdwUGoaf
         4XA18E6b2NRPlWEe6nasrDFJifMiUflqZNEYcTRLHJygjn+02a2Rre7zc94TYIJTF+BW
         EiCOPbYHOwaF8iVNx/VUdBCTshDluF+f1nnJn/lbv+SlRQrbM5BsaEsaImJso8jzUobD
         qYwKQtcd5BzaZrkD+uj/YFKnmE4LzUpZSCxM+2MKZArQMyPJL4hOMe7oxKl/TEmOl9YX
         NIh7v/gegoLvaL72F6cMg7uvX9pLiU4MtH1ESw+RvjlsrKxppiOhK0S0DuPi00p5crHU
         D4Dw==
X-Gm-Message-State: AOJu0YyltY0HIfCDnz2JgM0TOIg+1JD9nwchcjoj903pSWmYoOzWmtTF
	ZDGyfal676uanQ/zq9rBFMzTxTG7kS7U+SwL3x3JwThtX7k=
X-Google-Smtp-Source: AGHT+IGmb6iI1P2cGm1yNYkGBmZz0qZ+z0Rt6JSN6wHrWmQyf9raVIzAFgyiGGf1kn8rVJJ55ieI/JpcEYoPMe+tVyE=
X-Received: by 2002:a05:6808:2396:b0:3a7:612:f62b with SMTP id
 bp22-20020a056808239600b003a70612f62bmr1841330oib.25.1694148395061; Thu, 07
 Sep 2023 21:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230908041616.3574595-1-mingli.yu@windriver.com>
In-Reply-To: <20230908041616.3574595-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Sep 2023 21:46:08 -0700
Message-ID: <CAMKF1soEMxdpLxM1DuY7zvs4Mn5k=BmtUwD4+-X_FF6Fd+bOYA@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH v2] fixup! python3-numpy: remove
 NPY_INLINE, use inline instead
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 04:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187403

when do we see these errors ? how does this impact performance?

On Thu, Sep 7, 2023 at 9:16=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windriver.=
com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
>  Fixes:
>    /usr/lib/gcc/x86_64-redhat-linux/13/include/avx512fintrin.h:314:1: err=
or: inlining failed in call to 'always_inline' '_mm512_setzero_ps': target =
specific option mismatch
>    314 | _mm512_setzero_ps (void)
>        | ^~~~~~~~~~~~~~~~~
>    numpy/core/src/umath/simd.inc.src:977:20: note: called from here
>    977 |     @vtype@ zeros =3D _mm512_setzero_@vsuffix@();
>        |                    ^~~~~~~~~~~~~~~~~~~
>    numpy/core/src/umath/simd.inc.src:596:1: error: inlining failed in cal=
l to =E2=80=98always_inline=E2=80=99 =E2=80=98avx512_get_full_load_mask_ps=
=E2=80=99: target specific option mismatch
>    596 | avx512_get_full_load_mask_ps(void)
>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   numpy/core/src/umath/simd.inc.src:976:27: note: called from here
>    976 |     @mask@ load_mask =3D avx512_get_full_load_mask_@vsuffix@();
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src=
-Change-NPY_INLINE-to-inline.patch b/meta/recipes-devtools/python/python3-n=
umpy/0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch
> index d733dda333..73c9c79bdd 100644
> --- a/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Change=
-NPY_INLINE-to-inline.patch
> +++ b/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Change=
-NPY_INLINE-to-inline.patch
> @@ -117,7 +117,7 @@ index d6c9a7e..39aec9a 100644
>
>   #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NP=
Y_HAVE_SSE2_INTRINSICS
>  -static NPY_GCC_OPT_3 NPY_INLINE NPY_GCC_TARGET_AVX512F void
> -+static NPY_GCC_OPT_3 inline NPY_GCC_TARGET_AVX512F void
> ++static inline NPY_GCC_TARGET_AVX512F void
>   AVX512F_@func@_@TYPE@(@type@ * op,
>                         @type@ * ip,
>                         const npy_intp array_size,
> @@ -126,7 +126,7 @@ index d6c9a7e..39aec9a 100644
>
>   #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NP=
Y_HAVE_SSE2_INTRINSICS
>  -static NPY_GCC_OPT_3 NPY_INLINE NPY_GCC_TARGET_AVX512F void
> -+static NPY_GCC_OPT_3 inline NPY_GCC_TARGET_AVX512F void
> ++static inline NPY_GCC_TARGET_AVX512F void
>   AVX512F_absolute_@TYPE@(@type@ * op,
>                           @type@ * ip,
>                           const npy_intp array_size,
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187402): https://lists.openembedded.org/g/openembedde=
d-core/message/187402
> Mute This Topic: https://lists.openembedded.org/mt/101231101/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

