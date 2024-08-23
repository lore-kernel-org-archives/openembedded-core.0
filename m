Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17B5C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 12:57:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.15354.1724417826912367241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 05:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+ZO9XYv;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f3e2f07f41so19968021fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724417825; x=1725022625; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXTwqjnpwMRzDFfB1ibNwmtFu20CysWrFcqh7g5d7yA=;
        b=m+ZO9XYv1iuZE9yxgJ0gO+cq7HFZGw+AQt5N+OQJVGJ0HO2+et3GdICq5Ye9lCdMTM
         Jjjak1gOOpkwrmLfol60hFtfq5zfek0r4NVeurQysp5u3N+0Z/E+r5LGffrEhCObdlpb
         7elibI3wgOts2ve058YW9oXIoXfaVDxAUNslqbDYbzkOrPY9ZabyBoT6vR/U0ADa0zSV
         T7zTNwlUlT6Qngvyb3a2S7KYRnLfApHRV5jY9DTnAO2KmF89BinWIh+2IJBESUJcCzg7
         U1eb4fG5ZbB1IjJnQP0z05brnep1jfA+qCNTJZUqPmuaqtY6ZV8+l5nqFDSFKtrWmYQf
         kOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417825; x=1725022625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXTwqjnpwMRzDFfB1ibNwmtFu20CysWrFcqh7g5d7yA=;
        b=FSyE9FvHPzAgVL+5m0TdXs0jHS0z2HZX4PrnHgwqdzDkmGRm5TFVNDtfKdPGDi8Mqa
         MnM0B8rRWb+kLEO1MfeWsOjeE45699PWXRvGmh2+rIn2P8jDtLApuz5em/B6tuhKyyIC
         OchcZv+9Wm0G9e7P81DclAEkQeWPdsKwjCR1q5r92VlfgEN2J6b866YqJ62zNaWIv0VT
         7g7jgDAtLj3zd7PQBSEWq29ot3fJn3VXsxcrCmmnV7c5QMnSHu1DsvtUOfMpotdDb8sq
         f0ld8X+DK2mQSbcp/q4OXyCIm96adit3KLLDHSJpwKSckrYmcRX4bzyWMEn3kn0xwpQ/
         hqlg==
X-Gm-Message-State: AOJu0YxtP9nurXesJLaqZ5HTAVDs0ub3t/WrIdmvxkTxzUrRI2d6VoM0
	7h49EKpd1/OM1ASCtRfR4OzXX1l54m1+vX13DPRUmLq6BSL+nWWMGy08cqsOeyYoigfyxKkPYak
	V0+KPqRAPcNqqKcteF6iFurGksVQ=
X-Google-Smtp-Source: AGHT+IGorvpn0IP8ApjC6Lnt4nboo7a2nnbSfkyCYxE3OnTN6Gy6Ok8s9XqBA9efk334q/RVSYmXWQPfdRTTZKViDIg=
X-Received: by 2002:a05:651c:b2b:b0:2ef:29d4:3d97 with SMTP id
 38308e7fff4ca-2f4f48ef795mr18127441fa.5.1724417824139; Fri, 23 Aug 2024
 05:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <17EE204EC928FF26.29141@lists.openembedded.org>
In-Reply-To: <17EE204EC928FF26.29141@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Aug 2024 14:56:39 +0200
Message-ID: <CA+chaQdHrV+LO7=Fc8B18cS5kr5nHen5gVG+HNM=JhasNFOwBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-numpy: disable ccache
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 12:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203687

It seems to be bigger issue in multiple python recipes (numpy was the
only one shown in my image builds), in world build with ccache enabled
I see:

meta-oe/meta-python/recipes-devtools/python/python3-msgpack_1.0.8.bb:do_com=
pile)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb:do_comp=
ile)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb:do_co=
mpile)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-greenlet_3.0.3.bb:do_co=
mpile)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb:do_=
compile)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.0.bb:do=
_compile)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-kiwisolver_1.4.5.bb:do_=
compile)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb:do_compi=
le)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb:do_comp=
ile)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-icu_2.13.1.bb:do_compil=
e)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.2.bb:=
do_compile)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb:do_co=
mpile)
failed with exit code '1'
meta-oe/meta-python/recipes-devtools/python/python3-pandas_2.0.3.bb:do_comp=
ile)
failed with exit code '1'

probably because of the same issue, so setuptools should probably be
fixed instead.

On Thu, Aug 22, 2024 at 8:27=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> * fails to parse CXX correctly since the setuptools upgrade from 72.1.0 t=
o 72.2.0
> * it can be resolved by upgrading numpy as in:
>   https://lists.openembedded.org/g/openembedded-core/message/203231
>   which switches from setuptools3 to python_mesonpy, but before that
>   is merged, we can just disable ccache here
> * more details in:
>   https://lists.openembedded.org/g/openembedded-core/message/203658
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/recipes-devtools/python/python3-numpy_1.26.4.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/=
recipes-devtools/python/python3-numpy_1.26.4.bb
> index 914245507c..7cd9d30d2d 100644
> --- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
> @@ -24,6 +24,9 @@ inherit ptest setuptools3 github-releases
>
>  S =3D "${WORKDIR}/numpy-${PV}"
>
> +# fails to parse CXX correctly since the setuptools upgrade from 72.1.0 =
to 72.2.0
> +# https://lists.openembedded.org/g/openembedded-core/message/203658
> +CCACHE_DISABLE =3D "1"
>  CLEANBROKEN =3D "1"
>
>  do_compile:prepend() {
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203660): https://lists.openembedded.org/g/openembedde=
d-core/message/203660
> Mute This Topic: https://lists.openembedded.org/mt/108043577/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

