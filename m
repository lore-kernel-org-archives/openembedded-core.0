Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BA9C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 20:53:52 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.15626.1651265629621915687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 13:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XaJO8+ME;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 17so11887212lji.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 13:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=GUJiF2Izh2qcNfxnXxFd0w3ZlGyXtdPMH1S9PEIWt3w=;
        b=XaJO8+MEJem59sE9SX/qEWH7lPCBuFfgWUfcRYhdxZ5t2ocKsg03yMcSKlLko+Q412
         VxnuizIWxRec2dkCfvbNOh5m97UCRBEw98IHM3WLwPn7wz/ynGTiooEPOgXzgbWjtDF0
         oYDKUgkfAUAPJylyN1JpQCCP/qLwcs0TBtkTK/askclN7LgnJjBz8iOajaFd2aBLO7y4
         fE2Cy1H8akfGFdeIOavY9VN9hWbgWSeku4xLDvae/5xF8ntUEU0cWXCdsdBkaDiURdln
         R/QgCeim5qXpikjiyUw+ucAqFMdESo0zc/HekaMvroM6/v6GbHvThhI/+oFWxFI6vEF3
         zLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GUJiF2Izh2qcNfxnXxFd0w3ZlGyXtdPMH1S9PEIWt3w=;
        b=tF6DufRf9CKMTX79yiYnilsC7IgUQsvYiPzxUrOaElI6ugSEwxvaM4B+GSI5gnpzcJ
         hZFQcgSeHaR0tjeu/k/0FquLua5RhXW6v0jZASjdgFyPd88/0wTMM+o1mu6JX8w3eaYY
         qVGjAm9glGkVCn/doaFoLiWSLBGXKS2x7NqfF9Y/5Ru8DueMxv+7tF8d/VOyWq8/JgI0
         cMauI4crmWa9WELV1tQEnw8IH+B8hT3ZuqnDRWdpqc2/PtnadSrpltp9To2Qdb2Uyf6R
         lPnlSzYV+hQAa7AzE9q+hpB+DZBKe2ZaL6Syo/Yyg/OGUcPOTQVPKSojkZRfl7eBnWGJ
         kRHw==
X-Gm-Message-State: AOAM533ozgYxPT2k42F7Hhtp5hXfvtWyTexl8wn9b2PVJ1qokquXEJ7B
	kZuN36BYdkiTz5jKs5YDIzg=
X-Google-Smtp-Source: 
 ABdhPJzLJvFGm0HzbfqkCrB078pS51M+M09UbCvCoADPYO/DG+ESvonAyXaFdk0HoHQsRDU7OtUyUw==
X-Received: by 2002:a2e:9a88:0:b0:24f:2fa8:2796 with SMTP id
 p8-20020a2e9a88000000b0024f2fa82796mr623664lji.440.1651265627403;
        Fri, 29 Apr 2022 13:53:47 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 c26-20020ac244ba000000b0047255d211afsm21527lfm.222.2022.04.29.13.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 13:53:46 -0700 (PDT)
Message-ID: <98ed4653-93a0-2559-c6ab-4054b1c43be6@gmail.com>
Date: Fri, 29 Apr 2022 22:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] image.bbclass: allow overriding dependency on
 virtual/kernel:do_deploy
Content-Language: en-US
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220427073739.4015660-1-dmitry.baryshkov@linaro.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20220427073739.4015660-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 20:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165058

On 4/27/22 09:37, Dmitry Baryshkov wrote:
> Since the commit fe26b2379ecd ("image.bbclass: Depend on
> virtual/kernel:do_deploy"), the image.bbclass made building images
> depend on virtual/kernel. For some images, including small initramfs,
> this is not the case. Allow overriding this dependency in case
> developers knows what they are doing.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  meta/classes/image.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 7f1f6f80a464..47776db2b0e6 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -132,7 +132,12 @@ def rootfs_variables(d):
>  
>  do_rootfs[vardeps] += "${@rootfs_variables(d)}"
>  
> -do_build[depends] += "virtual/kernel:do_deploy"
> +# This is needed to have kernel image in DEPLOY_DIR.
> +# This follow many common usecases and user expectations.
> +# But if you are building an image which doesn't need the kernel image at all,
> +# you can unset this variable manually.
> +KERNELDEPLOYDEPEND ?= "virtual/kernel:do_deploy"
> +do_build[depends] += "${KERNELDEPMODDEPEND}"
>  

I saw this got merged to master.

The patch doesn't make sense.

It sets

KERNELDEPLOYDEPEND

then uses

KERNELDEPMODDEPEND

?

And please make it readable by adding some underscores, like

KERNEL_DEPLOY_DEPEND

Jacob

