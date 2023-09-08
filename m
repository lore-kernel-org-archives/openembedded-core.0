Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC567EE57C9
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 05:46:32 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.33273.1694151984149795914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 22:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iMVB1Web;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5738949f62cso1045648eaf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 22:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694151983; x=1694756783; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+2U6sPRHlyo2PdZHqr6tV746wqvQMUWIOTULo2jW/A=;
        b=iMVB1WebrWVIPH48+4kTTJQpJoJvQ3LRS09fqqTh8LvQVAaXD4k9lLh34zFqEiwqSf
         TZltvb0NSoddyeTVVFK2RBPHoOpjyOl2FhaycFgKCkemgAeFHpuwy4cY0YsaAF99xs/f
         4WTxqSOxC+KYoxI06RwAN0P4BB0Woy9IGZh+QLvwmboE3IdJfV9aUn+5s20o6Y/4T4LD
         F3GIYL1IxIeI3crwNLukxfnOHkhRfWlEaODtBcmfP8Q+BCzhIHDV8vWgnD7zszK+sCg9
         FjvOTy905DWiWUdoulPGDbpO69ysevgfmuM4dZjArK/lOh1XDVfr816dHdZ55XBRXZJy
         7cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694151983; x=1694756783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+2U6sPRHlyo2PdZHqr6tV746wqvQMUWIOTULo2jW/A=;
        b=e5R7gompThrJhJRkLHsGy8RYqC6uPkV64Dj0GGrG+pdl9qEPewViV/VwmQyGCy5DGi
         xPMwwnbh+YSZwwT76rr6QotF0vYRbOVnIk6vontaLhv72YfQV4lqaKRr/VEHBW9Mgt8E
         /5kbX3Mow+Q0QWv3rdlNPQyN3FeVsd6fMLjnCyjPEf9BGBy0ZDNllDReB8ZsJH4JU5CO
         skKZ3N/jc8sxKXn1bgmNdit6pkVwWIh+1y+q+RR2K5wARKXqtLNHBEGmOCcjwk+xjars
         /8VmyM3ws1LQRpdG5bYJfr0kMOQKI/eFiiQs6nxApXoAOCZNqlWBSLMu89f3L2B/YvMJ
         19LQ==
X-Gm-Message-State: AOJu0YwdhkFvaEggx7KLNUB9dvaICKh/LYR77gS6cUsObpjspBO6xKCL
	ZprHP+e0exrxS3RKKQKJ9B6nwI8Vtq9wrK8igrY=
X-Google-Smtp-Source: AGHT+IEaacziBRJK7R2ysOLvdD6wqbA2jmcWL7QfiMAn0Id6nNAE6KZ0RVP2FJlIAqq5oCDTMNiQdwPYfr3fiRt/wWY=
X-Received: by 2002:a4a:621a:0:b0:56c:e17e:72ab with SMTP id
 x26-20020a4a621a000000b0056ce17e72abmr1674247ooc.2.1694151983116; Thu, 07 Sep
 2023 22:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230908041616.3574595-1-mingli.yu@windriver.com>
 <CAMKF1soEMxdpLxM1DuY7zvs4Mn5k=BmtUwD4+-X_FF6Fd+bOYA@mail.gmail.com> <CO1PR11MB50095FA1B569A25F5BB3F8C9F1EDA@CO1PR11MB5009.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB50095FA1B569A25F5BB3F8C9F1EDA@CO1PR11MB5009.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Sep 2023 22:45:57 -0700
Message-ID: <CAMKF1sqdubOkGf8OzwfZcd-MPD5A6ovXvKxybs69Z9UwFg1GRQ@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH v2] fixup! python3-numpy: remove
 NPY_INLINE, use inline instead
To: "Yu, Mingli" <Mingli.Yu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 05:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187406

On Thu, Sep 7, 2023 at 10:29=E2=80=AFPM Yu, Mingli <Mingli.Yu@windriver.com=
> wrote:
>
> We will encounter the build failure when debug enabled(add DEBUG_BUILD =
=3D "1" in local.conf) [1].
>

I would suggest to keep it limited to this option then

> [1] https://git.openembedded.org/openembedded-core/commit/?h=3Dmickledore=
&id=3D77a64a8686b6c9ef3bc6adbce6cdc442096decfd
>
> Thanks,
> ________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Friday, September 8, 2023 12:46
> To: Yu, Mingli <Mingli.Yu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core] [mickledore][PATCH v2] fixup! python3-numpy: remov=
e NPY_INLINE, use inline instead
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> when do we see these errors ? how does this impact performance?
>
> On Thu, Sep 7, 2023 at 9:16=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windrive=
r.com> wrote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> >  Fixes:
> >    /usr/lib/gcc/x86_64-redhat-linux/13/include/avx512fintrin.h:314:1: e=
rror: inlining failed in call to 'always_inline' '_mm512_setzero_ps': targe=
t specific option mismatch
> >    314 | _mm512_setzero_ps (void)
> >        | ^~~~~~~~~~~~~~~~~
> >    numpy/core/src/umath/simd.inc.src:977:20: note: called from here
> >    977 |     @vtype@ zeros =3D _mm512_setzero_@vsuffix@();
> >        |                    ^~~~~~~~~~~~~~~~~~~
> >    numpy/core/src/umath/simd.inc.src:596:1: error: inlining failed in c=
all to =E2=80=98always_inline=E2=80=99 =E2=80=98avx512_get_full_load_mask_p=
s=E2=80=99: target specific option mismatch
> >    596 | avx512_get_full_load_mask_ps(void)
> >        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   numpy/core/src/umath/simd.inc.src:976:27: note: called from here
> >    976 |     @mask@ load_mask =3D avx512_get_full_load_mask_@vsuffix@()=
;
> >        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  .../0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch       | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.s=
rc-Change-NPY_INLINE-to-inline.patch b/meta/recipes-devtools/python/python3=
-numpy/0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch
> > index d733dda333..73c9c79bdd 100644
> > --- a/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Chan=
ge-NPY_INLINE-to-inline.patch
> > +++ b/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Chan=
ge-NPY_INLINE-to-inline.patch
> > @@ -117,7 +117,7 @@ index d6c9a7e..39aec9a 100644
> >
> >   #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined =
NPY_HAVE_SSE2_INTRINSICS
> >  -static NPY_GCC_OPT_3 NPY_INLINE NPY_GCC_TARGET_AVX512F void
> > -+static NPY_GCC_OPT_3 inline NPY_GCC_TARGET_AVX512F void
> > ++static inline NPY_GCC_TARGET_AVX512F void
> >   AVX512F_@func@_@TYPE@(@type@ * op,
> >                         @type@ * ip,
> >                         const npy_intp array_size,
> > @@ -126,7 +126,7 @@ index d6c9a7e..39aec9a 100644
> >
> >   #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined =
NPY_HAVE_SSE2_INTRINSICS
> >  -static NPY_GCC_OPT_3 NPY_INLINE NPY_GCC_TARGET_AVX512F void
> > -+static NPY_GCC_OPT_3 inline NPY_GCC_TARGET_AVX512F void
> > ++static inline NPY_GCC_TARGET_AVX512F void
> >   AVX512F_absolute_@TYPE@(@type@ * op,
> >                           @type@ * ip,
> >                           const npy_intp array_size,
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#187402): https://lists.openembedded.org/g/openembed=
ded-core/message/187402
> > Mute This Topic: https://lists.openembedded.org/mt/101231101/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

