Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628A9C3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 23:04:07 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.49920.1672700636771431648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 15:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VsB1sQnT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id h16so27598000wrz.12
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 15:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8GdHUtFHfBOTJ6VWW2Poj9GHjYdR0L5VnDDDNx4Rck=;
        b=VsB1sQnTnvPuc3G7RhFWEoqcRuDphNuOFbbV4srBPn/44VNNWqatvGG3ckHA0zmnA5
         T8AdFHDN87+/SiQwdT3GLNwJnP7KwfV4/2gtOicv4LWf8JlmKgY1fz/w7ieRLWCdW8eN
         RG8asP/7fuDGDzzD2/Uevi73KgDQ7bwX3HcBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b8GdHUtFHfBOTJ6VWW2Poj9GHjYdR0L5VnDDDNx4Rck=;
        b=6HOJNVBU9R995T3WxRYLh4Tti18T/sy8RkTZofq43NQM0J6Spdu3PsN7abUHfdBAFP
         YhyqQ8iu0B3Dp6VMjuzfQI4fEAdEU+DkgSF1723clG0l3l58u9TbbWeIx2BUzt+IXNX/
         pysMgjRT9Ob0JLUvaz79Y3n/MX2G2pZkimSss7YhZl9LUmzGUxntrzoMLfrf5lg1EnqQ
         I42V75RZ1E9H0ncTw5pykr1jPJVk0lFZrKqZomGx9mUnOjRAIwqcVHub4alqhKeOAIrr
         xEDKmHSIaDjkxyhRSz7cXZjD4IJKdItTbSZ8qEoKY1l7+0S9DaQgSRcnK0dVO7TltE/+
         vbiQ==
X-Gm-Message-State: AFqh2kr6pcTRW7F/2emV1lW44yxwTwgmZIO9WeVW6N+QY500zBy9JzZe
	cLsHKxIcdruoFHsfzk/Oo+m+sg==
X-Google-Smtp-Source: AMrXdXsT0LAq3l76HXMFmaQmnNwmeche1eUyeMHkb1DnRUhlGjJ8Kw+F5UvzXEjZDEsHuJsD1K2rsg==
X-Received: by 2002:a5d:46c3:0:b0:242:7676:689d with SMTP id g3-20020a5d46c3000000b002427676689dmr25409630wrs.19.1672700634828;
        Mon, 02 Jan 2023 15:03:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d934:7269:d594:9ac2? ([2001:8b0:aba:5f3c:d934:7269:d594:9ac2])
        by smtp.gmail.com with ESMTPSA id c4-20020adfe704000000b00241b5af8697sm29900425wrm.85.2023.01.02.15.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 15:03:54 -0800 (PST)
Message-ID: <d11d0390a0022a2659a6aa224b7b1d92e290fa7c.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 2/2] default-distrovars: Include "c" in
 IMAGE_LINGUAS for glibc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 02 Jan 2023 23:03:53 +0000
In-Reply-To: <20230102224744.287985-2-alex.kiernan@gmail.com>
References: <20230102224744.287985-1-alex.kiernan@gmail.com>
	 <20230102224744.287985-2-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 23:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175330

On Mon, 2023-01-02 at 22:47 +0000, Alex Kiernan wrote:
> glibc 2.35 introduced C.UTF-8, we should include this by default.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>=20
>  meta/conf/distro/include/default-distrovars.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index abf48f79f08a..5324bd543d22 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -5,6 +5,8 @@ KERNEL_CONSOLE ?=3D "ttyS0"
>  KEEPUIMAGE ??=3D "yes"
> =20
>  IMAGE_LINGUAS ?=3D "en-us en-gb"
> +IMAGE_LINGUAS:libc-glibc ?=3D "c en-us en-gb"
> +
>  ENABLE_BINARY_LOCALE_GENERATION ?=3D "1"
>  LOCALE_UTF8_ONLY ?=3D "0"
>  LOCALE_UTF8_IS_DEFAULT ?=3D "1"

I suspect this will catch people out since if someone does:

IMAGE_LINGUAS =3D "xxx"

then it won't work for glibc due to the override. I suspect what we
need will be more like:

DEFAULT_IMAGE_LINGUAS =3D "en-us en-gb"
DEFAULT_IMAGE_LINGUAS:libc-glibc =3D "c en-us en-gb"
IMAGE_LINGUAS ?=3D "${DEFAULT_IMAGE_LINGUAS}"

?

Cheers,

Richard




