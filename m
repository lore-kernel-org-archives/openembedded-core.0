Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0DCC46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 11:59:24 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.49201.1695038354158622190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 04:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZD7JHrBg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40413ccdd4cso25629225e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695038352; x=1695643152; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJXWVWXsszdtZ9YZrd2wzO0YeshF77Uo4bPmtWXzkpM=;
        b=ZD7JHrBgkdudjadXQ4c+1rSwOxig3iegUCwe1xt5sxi0zLsPl88ypK4/vtUm7fk6vo
         +Y09q42PyKzXHa9c/3/l0UegGdiaRl0vOZ/5Rt+dDVBqe1WzMemC4dao+M6r1SjxCoTG
         1Uv8JoNDnTlsj8fzVjcFnFT3d1oikZlcIXMy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695038352; x=1695643152;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jJXWVWXsszdtZ9YZrd2wzO0YeshF77Uo4bPmtWXzkpM=;
        b=Wzku4ofOW/PvGM8NxgHGmm8+cLxvzb8JweIOOKXVfQYNedV/8PMEsBhIqnedle1Tj2
         zJhBCBZA7+pgh6eRHKdclPvbcH/Nrs/1W2PUAOaxEf9vjA/aTlrXyZJUw8KFIW5ISH/6
         N4e3ZfJGGXa491fYJyKJnC7KUEST8ydALD0Q9USEwh1ydH9s2AuG5HUiyG3Eeo8Bl6ba
         UY6Mb/l+KrAsmGDfLyUp105mHsybzFJAaudIlOz8ZScQco8mUwWVGPap+DkJWMKPYAlZ
         GxSMk0N+f7YgXVdXJLLlB6stQMxq/aqx3D594QDLr+hSP9BNgpKq6jCt3PD/6HFyUCDB
         o1Cg==
X-Gm-Message-State: AOJu0YxoTzm1sqh+19D0FIzOTzC/mzZbyq/yWznA4CJ/hOobjDjyIrLA
	DvGwMu3fPfJnAZJIlEJ2J5yC7Lu+VAnn1gnMUIM=
X-Google-Smtp-Source: AGHT+IFF9O5E7G8hLSxjVdcGRjl834BdZt+XL7TGHAPpj+6uZvkNlyeyAPHNgrCXfnZRWB7x6vjAIw==
X-Received: by 2002:a5d:684d:0:b0:31d:caae:982d with SMTP id o13-20020a5d684d000000b0031dcaae982dmr6648300wrw.12.1695038352560;
        Mon, 18 Sep 2023 04:59:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c207:9dee:97a6:8348? ([2001:8b0:aba:5f3c:c207:9dee:97a6:8348])
        by smtp.gmail.com with ESMTPSA id j3-20020a056000124300b0031fb91f23e9sm12533144wrx.43.2023.09.18.04.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 04:59:12 -0700 (PDT)
Message-ID: <a91ac1e923426bcd1848a54f8aeec34155ffa13a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] curl: Update from 8.2.1 to 8.3.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: robert.joslyn@redrectangle.org, openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2023 12:59:11 +0100
In-Reply-To: <20230918015735.391442-1-robert.joslyn@redrectangle.org>
References: <20230918015735.391442-1-robert.joslyn@redrectangle.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 11:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187827

On Sun, 2023-09-17 at 18:57 -0700, Robert Joslyn via
lists.openembedded.org wrote:
> NSS support was removed, so adjust PACKAGECONFIG options.
>=20
> The --enable-crypto-auth option was removed and split into separate
> options for basic-auth, bearer-auth, digest-auth, kerberos-auth,
> negotiate-auth, and aws. Enable basic, bearer, digest, and negotiate by
> default as these are probably the most common.
>=20
> Disable test 1279 since this requires libcurl and hangs the tests.
>=20
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  meta/recipes-support/curl/curl/disable-tests       |  1 +
>  .../curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb}          | 14 +++++++++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)
>  rename meta/recipes-support/curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb} (88%=
)
>=20
> diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-=
support/curl/curl/disable-tests
> index b687b2bb76..fdac795662 100644
> --- a/meta/recipes-support/curl/curl/disable-tests
> +++ b/meta/recipes-support/curl/curl/disable-tests
> @@ -21,6 +21,7 @@
>  # This test is scanning the source tree
>  1222
>  # These CRL tests need --libcurl option to be enabled
> +1279
>  1400
>  1401
>  1402

Thanks for the patch. Unfortunately there were warnings generated on
the autobuilder test run for this:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5452
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5631

I'd also wondered if you'd mind setting your from address correctly for
patches please? For more info see:

https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixing-=
your-from-identity

Cheers,

Richard

