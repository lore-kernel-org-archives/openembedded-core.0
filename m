Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3428ECAAD4
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 13:36:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.13486.1662298603842007990
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 06:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gDO3fY7d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so4309160wms.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=8HP/av5Zixl6QX09eIbKX0mrFJFEjOHIRweA/XWm9X4=;
        b=gDO3fY7dniQjLoxa9hAVvAwntZV14wC0mYoHq5YQaho2mknpjJG0p3vG+1mvAkc3in
         u86mxY+jR7qxk8KFabPPAVcrl4vsrDE2IGKCk7Zkp5l6bVYWJrzj+1hWElhhRT3feBEG
         QDGUp2bDWVu6DrTe+QjDX+cWOWhwyjc/beRho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=8HP/av5Zixl6QX09eIbKX0mrFJFEjOHIRweA/XWm9X4=;
        b=fh3AFx9wdjAu3oBO8AGu26knFRe7NGluQQdoNX6t0wKUoAGokzTYEmGRZsGkspajBt
         mnk/kUWbX51eIqyAD4FF9k2DGmalh4h3S8jHrHKK/UM3Ix/5x1wLjF+puPGXdfCDjIKk
         JQORF3QcA8/UB3VtQ1QtMmM62oO6ybfQWsk6CQWZGKnZeEhf7lpovQHqLXp+RmfNOzUh
         i6oxcnaVXLvDgd6nxAd6K1xiDSg50azX+ts7ULLTAeGxrCusIjWWKuuyAkjy1sWU2CBb
         r9BT3NSesqAu+aF8wky8V21PcwaieaOiLWdc0T33n5ssNHKFBQc3cvcYzYzYoDiMbK6P
         zlUw==
X-Gm-Message-State: ACgBeo382yssN6O3f7//5PM7SHniAqGLU5lrpK0CWaUJt9z9SVlCZUV4
	GWPCTWILhxCn7yzLycH0nPrI9RqBba9ybg==
X-Google-Smtp-Source: 
 AA6agR5ptKYUdPXQJN3RVyxl/r85Onf0cGtdkPlUKRfpURA8ovQ5zco50peWlOBsape3WqLcY3bzpg==
X-Received: by 2002:a05:600c:5105:b0:3a8:3f3c:ca90 with SMTP id
 o5-20020a05600c510500b003a83f3cca90mr8105935wms.81.1662298602357;
        Sun, 04 Sep 2022 06:36:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:df52:563:aee3:2030?
 ([2001:8b0:aba:5f3c:df52:563:aee3:2030])
        by smtp.gmail.com with ESMTPSA id
 z14-20020a5d4c8e000000b0021e4829d359sm6254786wrs.39.2022.09.04.06.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 06:36:41 -0700 (PDT)
Message-ID: 
 <96bdb03cc090c285bc90c2811c52478dfbd43d27.camel@linuxfoundation.org>
Subject: Re: [PATCH] rust: Add linker configurations for cross compilation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda.cve@gmail.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, vinay.m.engg@gmail.com
Date: Sun, 04 Sep 2022 14:36:41 +0100
In-Reply-To: <20220904070403.2706101-1-pgowda.cve@gmail.com>
References: <20220904070403.2706101-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 13:36:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170287

On Sun, 2022-09-04 at 12:34 +0530, pgowda.cve@gmail.com wrote:
> From: pgowda <pgowda.cve@gmail.com>
>=20
> Adds the cross compilation linker for build, host and target.
> Ensure the main rust config has the appropriate sections added
> to match the configurations.
>=20
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/=
rust/rust.inc
> index 284347dedc..20fd797a90 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -81,6 +81,7 @@ python do_configure() {
> =20
>      config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
>      config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
> +    config.set(host_section, "linker", e(d.expand("${RUST_TARGET_CCLD}")=
))
>      if "musl" in host_section:
>          config.set(host_section, "musl-root", e(d.expand("${STAGING_DIR_=
HOST}${exec_prefix}")))
> =20
> @@ -94,6 +95,7 @@ python do_configure() {
> =20
>          config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")=
))
>          config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
> +	config.set(build_section, "linker", e(d.expand("${RUST_BUILD_CCLD}")))
> =20
>      target_section =3D "target.{}".format(d.getVar('RUST_TARGET_SYS', Tr=
ue))
>      if target_section !=3D host_section and target_section !=3D build_se=
ction:

Your mailer somehow converted 8 spaces to a tab above. In the interests
of moving forward, I'll fix this one up and test it.

Cheers,

Richard


