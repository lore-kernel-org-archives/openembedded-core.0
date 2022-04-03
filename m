Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EFFC38A04
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.22234.1648989321604153884
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 05:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MtNuHBEQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 m67-20020a1ca346000000b0038e6a1b218aso1576037wme.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ZqmY2ycV+/BCC7pHHWzdKodTaHetxBM0J6UFJnMLDHc=;
        b=MtNuHBEQSkrB/tvlLZWsqHeps9Ii3IQaoDnaUWB2fZta5W6j63X99MGvLmmLg1AuKO
         V7tER692PavbLIlHqA5jlAj5psKqRUmTheVG5jDrI2LogH3y6QHCrx+E7NTqavz3ovvk
         pfYHpE5UlxZoZFLL1Fy4b04/lgp6Hik5eNs6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZqmY2ycV+/BCC7pHHWzdKodTaHetxBM0J6UFJnMLDHc=;
        b=I9aD9r/zIKRgHAX06OwTgELzVDV0E9LbtTh0f7LXpAgYQmc9YFPQiatpvE08RZnx0D
         axogD2kck4PAu9tOsnXPU9MqG6bknfFaQTtXfDtBzA+5t5fJ+YAPVRwxKBaWjXJmhjF9
         6DODn03u5Oq80LJoBeVZfqahAbDkMpBcf68KoZ8u1hN3qBYilqDgJNqaC74Rnsfc1lgN
         2GLzuqQIAHv4iqNp0ryvyPnFwIx2EGXyEDiLW0DvC6nfg17wEGvyFzuztVLh6kxPJCBt
         QfDoEQzLHF10YqEVArjLeXAFklinYvrC+rrNbHsFlDPF6DAf3XaxojZU6vkrIEfaOn7o
         oZ+w==
X-Gm-Message-State: AOAM533pUeu/Qfy/y9eg04W7u8ZwloL87NJlZZ7+ZdXZUrPwi8CFQ7Ti
	CL73vR15pZgMMRIuH3N0/ETJfA==
X-Google-Smtp-Source: 
 ABdhPJwo7txvisQt5ulB8sF16X65RtAzm5U/ujrnyPpNeTtaeEUW+tDkczhVBTNHVPEfbEtipqaSUw==
X-Received: by 2002:a05:600c:4f86:b0:38c:bd13:e074 with SMTP id
 n6-20020a05600c4f8600b0038cbd13e074mr15765212wmq.97.1648989320112;
        Sun, 03 Apr 2022 05:35:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:819:f853:3436:28c4?
 ([2001:8b0:aba:5f3c:819:f853:3436:28c4])
        by smtp.gmail.com with ESMTPSA id
 k129-20020a1ca187000000b0038e6e789f08sm2038879wme.39.2022.04.03.05.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 05:35:19 -0700 (PDT)
Message-ID: 
 <e6666c965f187b3575c7ba861d0989be0d11ea60.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] python3-mako: update to 1.2.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 03 Apr 2022 13:35:14 +0100
In-Reply-To: <20220402114035.2395065-1-open.source@oleksandr-kravchuk.com>
References: <20220402114035.2395065-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163958

On Sat, 2022-04-02 at 13:40 +0200, Oleksandr Kravchuk wrote:
> License-Update: copyright years changed.
> 
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb} (68%)
> 
> diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
> similarity index 68%
> rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb
> rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb
> index 71e5d96ba1..8abdddf362 100644
> --- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
> +++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
> @@ -2,13 +2,13 @@ SUMMARY = "Templating library for Python"
>  HOMEPAGE = "http://www.makotemplates.org/"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=943eb67718222db21d44a4ef1836675f"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b32291f107a8f1ea94c4a41e00a6a18d"
>  
>  PYPI_PACKAGE = "Mako"
>  
>  inherit pypi python_setuptools_build_meta
>  
> -SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
> +SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
>  
>  RDEPENDS:${PN} = "${PYTHON_PN}-html \
>                    ${PYTHON_PN}-netclient \

This change seems to break mesa builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/5287

Cheers,

Richard


