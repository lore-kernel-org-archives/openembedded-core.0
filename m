Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AF8EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:15:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5783.1689164137863986589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=OkBR8S88;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso70406645e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 05:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689164136; x=1691756136;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nc2yEM8q0DA9KHfNvqtXnvUQ/apU5NkhZ64vWWiURrw=;
        b=OkBR8S8812ueTZYmWh/VDxttiuB+2cLU5WTwcBaZmuEu4Z1a35isbsKvkhdm0idn33
         LjJif7kMwtAC4onXvRkugbYvKWxYiviFIybA9wkjObFdTBiNbxOmw8v38jAD9ZSlSotg
         Gdqlys0BSSs9JFtGo2DR1xeBNwdSVEoehWK3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689164136; x=1691756136;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nc2yEM8q0DA9KHfNvqtXnvUQ/apU5NkhZ64vWWiURrw=;
        b=g9Tv5m3NqIY3wLMBoTB77mKTND/qcPf1cz8pcLPfAd3UhCfNNEgtLnf1ZBw1UE001c
         t1yPA5G8DN/O28lmju/cj6rLSapkNbXRk0tPnksgdIhETbCVnXXF58TJ6FsUSJ3TdQr9
         8EkE4myv6xc4ZRnyGYfZ53Ob1eVx3MPhoD6fGAKo23EZJKmHQzoagO8Dqk7ykKOQfa/7
         EN9EG0+X0aqi8Xi0JESFTMAhEDpjMzlUzAfaqeTxz0pSR+FYgaZQTns92qP9guzf88l8
         DBkBTT60170f1hRuiTaF1VXRMbqiyrqnMa0hNfE/0921TqxXMb3/oARP/AW7pBVEtp4i
         hkMg==
X-Gm-Message-State: ABy/qLZog3Vr0Edl3vx9nZcr+v4y0zqbZmmXMbqAKMjl6LREuO9eblss
	ParU3G41upfQmTrkuOUpkzuRnA==
X-Google-Smtp-Source: APBJJlECTYUnPebT9ovGLEKDOXJTcSWMzYMa9BSTid2P44EzNj2OP5px12PVj2P0SbC76rSN2blHNg==
X-Received: by 2002:a05:600c:22c1:b0:3fb:31b:d516 with SMTP id 1-20020a05600c22c100b003fb031bd516mr13403180wmg.29.1689164136202;
        Wed, 12 Jul 2023 05:15:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:339c:939c:6851:d3b0? ([2001:8b0:aba:5f3c:339c:939c:6851:d3b0])
        by smtp.gmail.com with ESMTPSA id z9-20020a1c4c09000000b003fa74bff02asm4936246wmf.26.2023.07.12.05.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:15:35 -0700 (PDT)
Message-ID: <956c0e383088df5f8568961f57741452a2cb1920.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2023 13:15:34 +0100
In-Reply-To: <20230710095800.2033309-1-p.lobacz@welotec.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184187

On Mon, 2023-07-10 at 11:57 +0200, Piotr =C5=81obacz wrote:
> Include support for ACLs and extended file attributes for native
> builds, depending on which distro target features has been turned
> on.
>=20
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9625a6fef4..da01e9b66f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
> =20
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
> -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> +DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 ${@bb.utils.filter('DISTRO_FEATURE=
S', 'acl xattr', d)}"
>  DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> =20
>  # Normally target distro features will not be applied to native builds:

Is there much benefit to making it depend on the target config?

I'm wondering if we should enable acl support in native distro tooling
unconditionally in the same way we already do for xattr? That should
just cause some minor build dependencies if I understand correctly?

Cheers,

Richard


