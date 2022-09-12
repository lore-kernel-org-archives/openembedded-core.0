Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDA0ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 14:58:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.8733.1662994707638890434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 07:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KA5FuDG5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso7402449wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=h1mpYK1y3ClY/MY4MIAE+B0Su9FG2+G/QDd5eLs1vDc=;
        b=KA5FuDG5l+tRjcWOnW4UDWCUp8EEoLaXl0nNstACa6gVm9ZQGKOu+3CHGPkhuW0hSN
         mrzdAxyUXHslIY/lVJvUrGXiHQZ4N1oT3uzYcSanVTSRhZZxPRnPS7AuTCC+EGJZyfq7
         EqSeqkWN4aoK9wE5TIpU1/G2RQ5EQfzumZcZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=h1mpYK1y3ClY/MY4MIAE+B0Su9FG2+G/QDd5eLs1vDc=;
        b=pj+Ka+or1XpmM4RB6s06Ckza4pcx10/tNeFUACm+Snf5ZiMa8Tq9bojibfzUYH8dBc
         6a0b6AJttRVP4maY945EbaR36h6Us4kkkpXEVduk3+yxd/AGzDObERmgrQ9c6V6egWys
         h1K9wSi+c7bLfjLoravFrNOSFy5KO2lczhClDXnStqKp02MPcKTledNeSo91oocQXoNw
         LM+/nEeciDFJsXGHKUdxS7kHLvbKyxxmqmStO1HRGNt/k14QYD/iKegh63KF1LdToPIr
         tkzflfvrLtblXpPdaiLbgADNRsHfWK1na0Fc7GaWNC9sXjEnBP2h4abMjR4ajtdHy7dp
         YvcQ==
X-Gm-Message-State: ACgBeo3MaXMobuOfX4QAFtkckeMmiV1KFpkIZrUmWspsE2z7kLycyakA
	hy8duDWFAyCX7jQUu1YLT23eog==
X-Google-Smtp-Source: 
 AA6agR6hZ8gznnoyPdz7q0oNgKKhBIEpc2wWbujj9ehODJY/gBCKqA+eyFwY5ME1NCdSRZsUh/hxgg==
X-Received: by 2002:a7b:c2a9:0:b0:3a6:2400:722c with SMTP id
 c9-20020a7bc2a9000000b003a62400722cmr14207139wmk.108.1662994705805;
        Mon, 12 Sep 2022 07:58:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e7a0:efc:484a:7ca5?
 ([2001:8b0:aba:5f3c:e7a0:efc:484a:7ca5])
        by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c511600b003a5b6086381sm10526225wms.48.2022.09.12.07.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 07:58:25 -0700 (PDT)
Message-ID: 
 <25a7f967e61230b78da3b59dd687e82aca414f82.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: update USE_ALTERNATIVES_FOR for
 symlink files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2022 15:58:23 +0100
In-Reply-To: <20220911084756.10315-1-kai.kang@windriver.com>
References: <20220911084756.10315-1-kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 14:58:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170536

On Sun, 2022-09-11 at 16:47 +0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> It provides more binary files by binutils 2.39. Then add them to
> USE_ALTERNATIVES_FOR as others to handle symlink files via
> update-alternative mechanism.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 789c8bec21..9d33a64371 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -47,7 +47,13 @@ USE_ALTERNATIVES_FOR =3D " \
>  	as \
>  	c++filt \
>  	elfedit \
> +	gp-archive \
> +	gp-collect-app \
> +	gp-display-html \
> +	gp-display-src \
> +	gp-display-text \
>  	gprof \
> +	gprofng \
>  	ld \
>  	ld.bfd \
>  	${LDGOLD_ALTS} \

This throws tons of warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4219

e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5896/step=
s/12/logs/warnings

but many more.

Cheers,

Richard

