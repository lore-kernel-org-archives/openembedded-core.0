Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CBFC4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 16:20:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.49207.1671726043139702397
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 08:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VenVCrU8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id z10so2143899wrh.10
        for <Openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 08:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wQV7LD3459f4bNilTcpYyd63mwKu84XJcMk0S038yE=;
        b=VenVCrU8Mq0ranDOSzdpxhlxGkgoaTg0YZyxvAJaAqvzV0ZPFbxOMFwbGSfHTdaD3v
         8PztfSHdZ3P8roZfsKvg3ciWtwLSUssq9QGF1DIbUH82LhiHT4l17ssvZVmgFbsxOSHw
         56xoNXM+m3+t8nMr8ksgUHEDgDUZEEa1tH/xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wQV7LD3459f4bNilTcpYyd63mwKu84XJcMk0S038yE=;
        b=Ot2Fahf1AZYGjKmN8+ci7tokFLSgN/OG3qHI0eUTdQdSNnEZONKODsx+MXH0D6FxbZ
         J+hO15Gt/Mx55T4ioSmf+bT3jEkxxwoxQdKTsRQLD1vt8xy7VGQXrq+ebZb6aR9VasNq
         6PTHQjprSN29jOfC5y842iVhjiCA8bXGhGF0XtTjGKe7Btd9NR4rOayz4xUgIlIUczOp
         6dk/MyyyZrWAdYhyWZs/XIkYGOmeOzayPWu6245xVwmGGUQfL/C7CuI9x1X1gR/CRfrQ
         3CkvrQfDqKkrbKwnIHbOIZWPuj3IPL5SkaPw8fEPCSuc4kHveXTr5L8M7Ff/thfpLWK8
         qSnw==
X-Gm-Message-State: AFqh2kocPQnPAK2UwS8DVGsok9qVjgulr12QZzCtydg0C6BVqchqCGcL
	MjKqJ2MOv7gon9RangGi4mjE0A==
X-Google-Smtp-Source: AMrXdXsd8QRcTag89d7OiSPBEK3HIPEUI/3BPg99NXelXFPoDAlXx6Z/JWkfuIZBB/tx6eIY5skvHQ==
X-Received: by 2002:a5d:430f:0:b0:244:48b3:d12b with SMTP id h15-20020a5d430f000000b0024448b3d12bmr3756899wrq.45.1671726041502;
        Thu, 22 Dec 2022 08:20:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a8db:6d5d:f54f:c6b2? ([2001:8b0:aba:5f3c:a8db:6d5d:f54f:c6b2])
        by smtp.gmail.com with ESMTPSA id j10-20020adff54a000000b002420d51e581sm918809wrp.67.2022.12.22.08.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 08:20:41 -0800 (PST)
Message-ID: <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2022 16:20:40 +0000
In-Reply-To: <20221222150246.91423-1-uvv.mail@gmail.com>
References: <20221222150246.91423-1-uvv.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 16:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174968

On Thu, 2022-12-22 at 16:02 +0100, Vyacheslav Yurkov wrote:
> This is a workaround to allow using go-mod until a proper solution is in
> place. Possible solutions were discussued ealier this year in these
> threads:
>=20
> https://lists.openembedded.org/g/openembedded-core/topic/89464905
> https://lists.openembedded.org/g/openembedded-architecture/topic/90782883
>=20
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/classes-recipe/go-mod.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-=
mod.bbclass
> index 61571596bc..da9a583288 100644
> --- a/meta/classes-recipe/go-mod.bbclass
> +++ b/meta/classes-recipe/go-mod.bbclass
> @@ -24,3 +24,8 @@ inherit go
> =20
>  GO_WORKDIR ?=3D "${GO_IMPORT}"
>  do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
> +do_compile[network] =3D "1"
> +
> +do_compile:prepend() {
> +    bbwarn "Using go-mod enables network during compilation to be able t=
o fetch dependencies. This breaks reproducibility of the build!"
> +}

This patch is not in master and is not a backport therefore not
eligible for kirkstone/langdale.

Cheers,

Richard


