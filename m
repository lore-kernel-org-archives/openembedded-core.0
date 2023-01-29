Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F347AC05027
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 05:00:38 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.10958.1674968429712746461
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jan 2023 21:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hC88xoS/;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-16346330067so11441101fac.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 21:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cxg1Y538K22P7LaL8SR3kw7sHhgQVd2S1qF4R0pN9x0=;
        b=hC88xoS/0zuUU+/M+iuXLNDWk4M8lHUYOxaY7tOLOKEOmo9UZ9iTrBzDfNWHSu4MeI
         tq1lrV9gkHvobcTxC6dHVtwFWwGh605WtdrIOuWp1gb7IRWlml4RJy24S9d2LPC5oBye
         XiPSQGo27QQmGYA7YRcSL12EAxhfGIHiw3PPQIfvZLklNxCEX59HSUrPb361qnIqI9cm
         SfB8cbsi6KNgyyMijPEKddiA3vi3t6Cd/ZmQQkuZB8GJWj9mGcU9WKvu4kDnvqvAM/a7
         7RUIleHHPOmgjGSCT8bo7L+ZoPo67uyW6DyZGPQ9CKxBTIC6rIfllVThL9AuPl0xw+f8
         gX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxg1Y538K22P7LaL8SR3kw7sHhgQVd2S1qF4R0pN9x0=;
        b=um0pqNV7Dg2RGTHsW8mN2bbWi4yEdscbNoBy6kLgb23CNTezw6CIqrbUtGuyt5woQD
         eXxMADsbi7Ys2+jOWckiRYIeMJ0N+HedBL6eQwyHE1oQHY+1GCRLPWy0j3PYzJIuxp4G
         2bqfcnrBIGN3C0sMrECIAkLDAevE6iqNfDPqQi2+HpBMRlEavq/gKdeQwTWEXIDR4Dc+
         R8IsHMUchEPnRLtJiZh7UO0O4I53yM8/JulDYrx+QK395NcM0IN6DJbSAguIzOxajqcW
         aXjx8iaek5j54z9jNxN1hqDTkTrNv2A+UactYnge3qx9gZzs+2zB5Cetcn9DFN/UyU2Y
         Rrfg==
X-Gm-Message-State: AO0yUKX8/LQ8kaKZmKL5jsU19GMlmsQryuYZTGx+FIsEHzwEJo9lb3fN
	UwBtV3p6lqz6dOlGyA4gxNjk14/6JBKwQX3sBntjl5MYVyY=
X-Google-Smtp-Source: AK7set98hi0cImf1LhGXBst4JLNP6VW7YV4bOVCKett6cS/zZJTQkas8n+8tmToYYllDtVZ09zWzQCZtNxLiTohHtz4=
X-Received: by 2002:a05:6870:c34a:b0:161:d899:6ee0 with SMTP id
 e10-20020a056870c34a00b00161d8996ee0mr1821899oak.262.1674968428554; Sat, 28
 Jan 2023 21:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20230128233021.2230473-1-raj.khem@gmail.com>
In-Reply-To: <20230128233021.2230473-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jan 2023 21:00:02 -0800
Message-ID: <CAMKF1sr3zaLHeoevd7B=vQW+XELjLqxbFUePcbBeFt+w+Si_XQ@mail.gmail.com>
Subject: Re: [PATCH] nghttp2: Always enable python bindings
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 05:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176469

I have sent a v2, please disregard this one.

On Sat, Jan 28, 2023 at 3:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This makes the build host agnostic, otherwise on some hosts e.g. (archlinux)
> it ends up using cython compiler from build host, mixing python3-native
> and cython from host is not a tested combination and can result in
> obscure errors. Lets make it use cython from OE native packages and also
> enable the bindings explicitly.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/nghttp2/nghttp2_1.51.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
> index fc1a592200..4402b80d1a 100644
> --- a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
> +++ b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
> @@ -4,6 +4,8 @@ SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
>
> +DEPENDS += "python3-cython-native"
> +
>  SRC_URI = "\
>      ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
>      file://0001-fetch-ocsp-response-use-python3.patch \
> @@ -15,7 +17,7 @@ PACKAGECONFIG[manpages] = ""
>
>  # examples are never installed, and don't need to be built in the
>  # first place
> -EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
> +EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF -DENABLE_PYTHON_BINDINGS=ON"
>
>  PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
>
> --
> 2.39.1
>

