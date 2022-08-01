Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B32C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 22:47:36 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.3950.1659394047122297899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 15:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TYB6bGZ+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id j15so7714745wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 15:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=nMFi6XUnThOAXaAMUwmhSEIHLrLvylFQXjUGbdYnssM=;
        b=TYB6bGZ+QvXi0j20EQT/bF/EMpQbUO0S3Ks424F4x6qRxQeQK57WElSaBT1BIlUt42
         G95/G/O2kMe20+IQ13gBkc9uXnVzoGXPqW3xBz4dxqn0X6J0obVXa7Lm8W+nD27ez2sV
         Q8wHyhpDNfbf+/jPvaG7L3tUE9BjuJ/y7Fgcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=nMFi6XUnThOAXaAMUwmhSEIHLrLvylFQXjUGbdYnssM=;
        b=i1TVm9p1CKX1azdHt+WckQe/6taMCeeD0ahFkl/mUcpQn3mlYdfU20Al1cqaKjGzs9
         ZxKetl7SwoDikdTrqrue22v5mm/WwxmZWxJdfeUJdMILxXosdA9L7Oe/8PUbEfKJQDmO
         7HzgucdGETQ9gU//OInxkABcqJQGgb9sEz1htUuzzPjYOdQdUMubLuMpnbaiLRK+nKHu
         K523T5PVkR4yMtELdVd2OJy9TE6V/kxxBzUDe9ajUtAb68dF9XQ7P31CCVlYife1JZ6G
         DX0G0VPWoWZc2gSCJvxO8xzfzQrv+Q+UCs+9RG2oNu1VNDxagmxWFVcgk8gEPMBuc36z
         Kz7Q==
X-Gm-Message-State: ACgBeo0AKRpcteSZFnARo5AWA+5PWCFG/Chgl1LSBlMaA+t0M96Hj85g
	aGFduQx6C95TJKX1k2xTSqlrig==
X-Google-Smtp-Source: 
 AA6agR7ayDvl16J6IALcyoGiQ/uSdaU0bhxVlzEIMsT9nu6vzJ5FmKqMhvwoLThtAERPe38ZxPwcwQ==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr11501369wrz.690.1659394045501;
        Mon, 01 Aug 2022 15:47:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2e5a:83:f743:7e5b?
 ([2001:8b0:aba:5f3c:2e5a:83:f743:7e5b])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a5d524c000000b002205ffe88edsm5940702wrc.31.2022.08.01.15.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 15:47:24 -0700 (PDT)
Message-ID: 
 <7080b3df677002145713e495cbed15f27cb36c3b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/own-mirror: Add hierarchical premirrors
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 01 Aug 2022 23:47:24 +0100
In-Reply-To: <20220801224305.251616-1-JPEWhacker@gmail.com>
References: <20220801224305.251616-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 22:47:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168762

On Mon, 2022-08-01 at 17:43 -0500, Joshua Watt wrote:
> Reworks own-mirrors.bbclass to allow multiple URLs to be listed in the
> SOURCE_MIRROR_URL variable. This allows a hierarchy of premirrors to be
> defined where URLs earlier in the list will be tried before the later
> ones.
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/own-mirrors.bbclass | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.=
bbclass
> index ef972740ce..dcb4456222 100644
> --- a/meta/classes/own-mirrors.bbclass
> +++ b/meta/classes/own-mirrors.bbclass
> @@ -1,14 +1,17 @@
> -PREMIRRORS:prepend =3D " \
> -cvs://.*/.*     ${SOURCE_MIRROR_URL} \
> -svn://.*/.*     ${SOURCE_MIRROR_URL} \
> -git://.*/.*     ${SOURCE_MIRROR_URL} \
> -gitsm://.*/.*   ${SOURCE_MIRROR_URL} \
> -hg://.*/.*      ${SOURCE_MIRROR_URL} \
> -bzr://.*/.*     ${SOURCE_MIRROR_URL} \
> -p4://.*/.*      ${SOURCE_MIRROR_URL} \
> -osc://.*/.*     ${SOURCE_MIRROR_URL} \
> -https?://.*/.*  ${SOURCE_MIRROR_URL} \
> -ftp://.*/.*     ${SOURCE_MIRROR_URL} \
> -npm://.*/?.*    ${SOURCE_MIRROR_URL} \
> -s3://.*/.*      ${SOURCE_MIRROR_URL} \
> -"
> +python() {
> +    for m in reversed(d.getVar("SOURCE_MIRROR_URL").split()):
> +        d.prependVar("PREMIRRORS", " \
> +cvs://.*/.*     {m} \
> +svn://.*/.*     {m} \
> +git://.*/.*     {m} \
> +gitsm://.*/.*   {m} \
> +hg://.*/.*      {m} \
> +bzr://.*/.*     {m} \
> +p4://.*/.*      {m} \
> +osc://.*/.*     {m} \
> +https?://.*/.*  {m} \
> +ftp://.*/.*     {m} \
> +npm://.*/?.*    {m} \
> +s3://.*/.*      {m} \
> +".format(m=3Dm))
> +}

It makes me a little sad every time I see us turning variables into
anonymous python :(

I can understand why here but it still makes me sad and it does come at
a performance price.

Cheers,

Richard

