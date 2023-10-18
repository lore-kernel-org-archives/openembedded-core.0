Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5F2CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 10:36:55 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.278728.1697625414599779369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 03:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=llt22xzU;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: erik.schilling@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-504a7f9204eso8821556e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697625413; x=1698230213; darn=lists.openembedded.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFYejEZ0p13lwbexlI7bDXAmUJAqMISJmSDAuk26RSw=;
        b=llt22xzUhwMGNM7EkI/4rzyKNgwlnPQI+lUpZC+jfivM+uEKcjSAL2dHAVpTZYVi62
         zXiBdSaEYFZtULVy7aL2mamZvWRtLKLjko6QWH8txS17URETDXEUkwKlMFmyxjF9Dcy1
         neG/U3EVgCUK1TYlpdUsOdEVLMNW2vvkedlQHj5PrLXA0PQWhSepI2/tV6IZ79dmEiJm
         j1oZ/YqhgzWrfWVNVX48NaIj5pcF9MfsT9e5u67m85O/j0yC4XhcWdJ2qMMXDf5LCJtS
         Vzs8v77Ub3hgE4aE4eVWjRxhwmrhnUM7ma8FW3TOWTL3/c4nI9Nr2DypZY1PsWtfLd1e
         UKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697625413; x=1698230213;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rFYejEZ0p13lwbexlI7bDXAmUJAqMISJmSDAuk26RSw=;
        b=RBedYU0ommTYK/ayQ3z/IyhaPiarJC1jX/VMqs5/8uORgAJQ0zh458apY35ZwtB4IW
         HQwtgCEZxwRZXcd7l7+f4OXSKYHowcnYY1404akWqUJFflxHIsxgXAPWncjiMCR8fmyy
         SM6SqKRfD3Plfc8IwE7dHXYixbRihazYYKfPEJzcXmCExqKYPPG9oNH2+13EOcj71iqW
         eQUL0OcrgfNOyafleZ8tihuo+HydWGZkf3urtMZ1HspFvYMw6/QY6HhqLj6IQtAqox0x
         X0rDQmgd9kNH7jOj9CvWl+zR90xpWBE09yrgbpL6Vpdlh74vGPd5oXuTabl7y62yEWES
         ljoQ==
X-Gm-Message-State: AOJu0Yz2tlmm6PjyMVpy19NfEjkakugTV/df3k2WjOvwEgf8GJsmoIlO
	+ZeS0jwicGvo1UZhj8TMCmWwsw==
X-Google-Smtp-Source: AGHT+IEioezJ2KEHqjv8g/OWrrVNtDRT4uFSIQHDjG3YdHQ0qbGuO0FtcfGH0CHPZPNncHPyRxjD/w==
X-Received: by 2002:ac2:46ed:0:b0:500:b7ed:1055 with SMTP id q13-20020ac246ed000000b00500b7ed1055mr3724255lfo.56.1697625412635;
        Wed, 18 Oct 2023 03:36:52 -0700 (PDT)
Received: from localhost (i5387884E.versanet.de. [83.135.136.78])
        by smtp.gmail.com with ESMTPSA id z9-20020adff749000000b00323287186aasm1806215wrp.32.2023.10.18.03.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 03:36:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Oct 2023 12:36:51 +0200
Message-Id: <CWBHZFPISD4K.3RO0WCE8T7OII@ablu-work>
Subject: Re: [OE-core][PATCH 2/4] systemd: add systemd-crypt package
Cc: "Jose Quaresma" <jose.quaresma@foundries.io>
To: "Jose Quaresma" <quaresma.jose@gmail.com>,
 <openembedded-core@lists.openembedded.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231017091900.114311-1-jose.quaresma@foundries.io>
 <20231017091900.114311-2-jose.quaresma@foundries.io>
In-Reply-To: <20231017091900.114311-2-jose.quaresma@foundries.io>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 10:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189374

On Tue Oct 17, 2023 at 11:18 AM CEST, Jose Quaresma wrote:
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-core/systemd/systemd_254.4.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-co=
re/systemd/systemd_254.4.bb
> index d24bf0cb06..2146c130d5 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -387,6 +387,7 @@ PACKAGE_BEFORE_PN =3D "\
>      ${PN}-analyze \
>      ${PN}-binfmt \
>      ${PN}-container \
> +    ${PN}-crypt \
>      ${PN}-extra-utils \
>      ${PN}-gui \
>      ${PN}-initramfs \
> @@ -446,6 +447,11 @@ USERADD_PARAM:${PN}-journal-upload =3D "--system -d =
/ -M --shell /sbin/nologin sys
> =20
>  FILES:${PN}-analyze =3D "${bindir}/systemd-analyze"
> =20
> +FILES:${PN}-crypt =3D "${bindir}/systemd-cryptenroll \
> +                     ${nonarch_libdir}/cryptsetup \

Won't there be .so plugin files in this folder that are arch-specific?
I assumed ${nonarch_libdir} should only be used for non-architecture
specific files?

- Erik

> +                    "
> +RRECOMMENDS:${PN} +=3D "${PN}-crypt"
> +
>  FILES:${PN}-initramfs =3D "/init"
>  RDEPENDS:${PN}-initramfs =3D "${PN}"
> =20
> @@ -552,7 +558,6 @@ FILES:${PN}-extra-utils =3D "\
>                          ${bindir}/systemd-run \
>                          ${bindir}/systemd-cat \
>                          ${bindir}/systemd-creds \
> -                        ${bindir}/systemd-cryptenroll \
>                          ${bindir}/systemd-delta \
>                          ${bindir}/systemd-cgls \
>                          ${bindir}/systemd-cgtop \


