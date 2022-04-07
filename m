Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38915C433FE
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 23:49:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.427.1649368728622685607
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 14:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HHmlAfLc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id a2so684716wrh.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 14:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=fsScFJh12HzaD4yKp9Vw8G/FB72SyDzhonvBdneNwxc=;
        b=HHmlAfLcmmE3I/g207FGp3af3bcLQyxCFQ04h0cZA5hYMfAvDP7yKDsrWdGKH4ugon
         tiQMjBdyomEiQuE2M4gvKR/SQR1M+PCtU0+fToHxm6r0p0Lgy5FVbdtrstd2I4YhG7Ek
         kqTveEAo/CuV4azkXrKIMkBdcYTke3+HshrQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fsScFJh12HzaD4yKp9Vw8G/FB72SyDzhonvBdneNwxc=;
        b=E9CV74IuFmbgL6lwuvPJXH11BMWf6KiSLgmGF2vW6/b9CoLCz5nMCZ5NZGCufZ36KS
         JSnsPcsDVTB73jNtwHQY2IYDRKmMdHx8uP2/gvis0XuPLnxwXopcEOfx+SKEzrJ6NHme
         QEr//muP7+OEJ+pwgVi9yebZgfGCD75B4QpsCGgftIrPZusbVVY7FXCoXyc/+EU8qOCS
         KbX/V+SSwL30zJAu5iPwKO6JscemJMwdLZeTcBdTg/So2k7IGrFPIqKRKtig8kKm/i/I
         UP5C35xjFTGUYemhGyEplfIulcLgOmo4YiibFaV3qlJqlT2i6wye2ABDozejliXOX4Vm
         +MKg==
X-Gm-Message-State: AOAM5325BeEa1Xd08BZe+azjk9SHbV4dN88sXMHdxMWaB1qQAPEv9uYc
	4VyguYjLFJc2QrldEIruwc3bpA==
X-Google-Smtp-Source: 
 ABdhPJz8aGgQwFz2XBoMsAswvlCUQIGO5fKCwKPhV1PupKTdNBcBIyh8zrhxX4atNV4jtC/mgcfJBw==
X-Received: by 2002:a5d:6b8e:0:b0:206:1d5f:b8dd with SMTP id
 n14-20020a5d6b8e000000b002061d5fb8ddmr12161839wrx.187.1649368727037;
        Thu, 07 Apr 2022 14:58:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7523:62f1:cfc1:cb4e?
 ([2001:8b0:aba:5f3c:7523:62f1:cfc1:cb4e])
        by smtp.gmail.com with ESMTPSA id
 w7-20020a1cf607000000b00389a5390180sm8568442wmc.25.2022.04.07.14.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 14:58:46 -0700 (PDT)
Message-ID: 
 <006bb5c68332e695639653fa2379df3e0c669768.camel@linuxfoundation.org>
Subject: Re: [OE-core] python3-sphinx: upgrade 4.4.0 -> 4.5.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "xuhuan.fnst@fujitsu.com" <xuhuan.fnst@fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 07 Apr 2022 22:58:42 +0100
In-Reply-To: <1649312356-25963-4-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1649312356-25963-1-git-send-email-xuhuan.fnst@fujitsu.com>
	 <1649312356-25963-4-git-send-email-xuhuan.fnst@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 23:49:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164148

On Thu, 2022-04-07 at 14:19 +0800, xuhuan.fnst@fujitsu.com wrote:
> From: Xu Huan <xuhuan.fnst@fujitsu.com>
> 
> License-Update:
> - The following description added to "License for Sphinx":
>   # +Unless otherwise indicated, all code in the Sphinx project is licenced under the
>   # +two clause BSD licence below.

Are there pieces of the code which use BSD-3-Clause or MIT? Do we need to update
LICENSE?

Cheers,

Richard

> 
> Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
> ---
>  .../{python3-sphinx_4.4.0.bb => python3-sphinx_4.5.0.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-sphinx_4.4.0.bb => python3-sphinx_4.5.0.bb} (84%)
> 
> diff --git a/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb b/meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
> similarity index 84%
> rename from meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
> rename to meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
> index 97ec2619cb..f4d27f3275 100644
> --- a/meta/recipes-devtools/python/python3-sphinx_4.4.0.bb
> +++ b/meta/recipes-devtools/python/python3-sphinx_4.5.0.bb
> @@ -2,11 +2,11 @@ DESCRIPTION = "Python documentation generator"
>  HOMEPAGE = "http://sphinx-doc.org/"
>  SECTION = "devel/python"
>  LICENSE = "BSD-2-Clause & MIT & BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=de4349dda741c550eb8b20f6b92f38d7"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
>  
>  PYPI_PACKAGE = "Sphinx"
>  
> -SRC_URI[sha256sum] = "6caad9786055cb1fa22b4a365c1775816b876f91966481765d7d50e9f0dd35cc"
> +SRC_URI[sha256sum] = "7bf8ca9637a4ee15af412d1a1d9689fec70523a68ca9bb9127c2f3eeb344e2e6"
>  
>  inherit setuptools3 pypi
>  
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164101): https://lists.openembedded.org/g/openembedded-core/message/164101
> Mute This Topic: https://lists.openembedded.org/mt/90307725/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [richard.purdie@linuxfoundation.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



