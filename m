Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B867FCCA479
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 17:54:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.184.1657734820668105666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 10:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qr66nKr9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id h17so16598119wrx.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 10:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=7injY9kcV7EHq70OG5arVlRvL9SBfHfmC48+Pdam7KA=;
        b=Qr66nKr9/Blh3DoQJQ7IF34TdZLBg6MTWJ6Y0nZOsUwQkgAlM4WKjyvmSc+2WIso6X
         v8CVV2VRHf8eab1ZGNuS572tyVcQlmmKRrotwPK/w6yraqGGu/Pw5vSV83qn9QYBkMM8
         Ut5aw5jVYMPoyptvFavtAyFf0tJdud0Q05aPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=7injY9kcV7EHq70OG5arVlRvL9SBfHfmC48+Pdam7KA=;
        b=mFn6dbiuDXyfx2IFafKW1nprjLezuqa8lYTJbxs0Jc/mH+U+inWIlRlVd8Z6Ywb+ZA
         i+DVF9shzFMCe6dCoL6nWCEb0XykJlBeY7NtkUzwX3dUc9RNpaY2w3mHibcwKwDb2FSx
         YUlymLG+h0vKSq+Ku/aCHuRZ4oV5aP1GtTvQT1XAuc/6g9o/goIgAs5ZpSjheanQOM1/
         aKCffphEqa8xjr0FUaes4FNFrepVkrNb+YhAnkHVfPURVSIiIWQDEb8X7M3BPS7a2Qpa
         gD8BDYCANlR/+i9QgrtM97qEsJtYQ1FNsVwdXrUFy+tj0TbYsqaqNCOCMTJcSLZ51Ucy
         6S1g==
X-Gm-Message-State: AJIora/80KTsDXNhEdtC3LbFAJNk2k28HqxU/TeziHaELnw5OvMt1PK+
	EkMCBJZIPOwxkhyvUx98vlSoSQ==
X-Google-Smtp-Source: 
 AGRyM1v57z30KXW0+aB6quZOQVw04CMaOurDUpLubXX2kxwrM1DsGpIA3Galu+nvE/xaDR9B0H2lSA==
X-Received: by 2002:a5d:4ccd:0:b0:21d:7369:e3b3 with SMTP id
 c13-20020a5d4ccd000000b0021d7369e3b3mr4224043wrt.585.1657734818929;
        Wed, 13 Jul 2022 10:53:38 -0700 (PDT)
Received: from max.broadband ([90.254.144.239])
        by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c190900b0039db31f6372sm3467373wmq.2.2022.07.13.10.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 10:53:38 -0700 (PDT)
Message-ID: 
 <8189a37bf619f781f8e9437fd5a4b2c7c06c7457.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/2] poky-altcfg: enable usrmerge
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2022 18:53:37 +0100
In-Reply-To: <20220713165533.125600-1-luca.boccassi@gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
	 <20220713165533.125600-1-luca.boccassi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 17:54:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167979

On Wed, 2022-07-13 at 17:55 +0100, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> Ensure it gets tested by the CI
>=20
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta-poky/conf/distro/poky-altcfg.conf | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/conf/dist=
ro/poky-altcfg.conf
> index f03306e798..57a76e8bb9 100644
> --- a/meta-poky/conf/distro/poky-altcfg.conf
> +++ b/meta-poky/conf/distro/poky-altcfg.conf
> @@ -9,6 +9,8 @@ DISTROOVERRIDES =3D "poky:poky-altcfg"
>  #DISTROOVERRIDES =3D "poky:linuxstdbase"
> =20
>  INIT_MANAGER:poky-altcfg =3D "systemd"
> +# systemd will soon require usrmerge
> +DISTRO_FEATURES:poky-altcfg +=3D "usrmerge"
>  # systemd isn't suitable with musl
>  INIT_MANAGER:poky-altcfg:libc-musl =3D "sysvinit"
> =20

This blew up builds since it clears everything else out of
DISTRO_FEATURES which isn't what was intended. I've tweaked the patch
and re-queued.

Cheers,

Richard

