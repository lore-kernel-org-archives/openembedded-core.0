Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEAFC4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.16254.1649588372991215438
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 03:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YWHfEoHQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id r7so8202123wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 03:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+lF4zLoiwom813jZ67+7TLxB7s2jRtvuKUdUazh2o1E=;
        b=YWHfEoHQw5ZbojtfjiejdiD0en1PpH4xNLypge5iQzO+NILN4IfdBZ7X1e8ExPrfwR
         hkAl/Kboikr0F6DPqmUC0BJGEO1hcWs45DeOjnBIEajeZzlq3ykSWulaJl2O8pqeFLoY
         M4EwWtMZ76N+LDhsS2L+mIoM2cTAmoVh6Lys8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+lF4zLoiwom813jZ67+7TLxB7s2jRtvuKUdUazh2o1E=;
        b=Tm+AApOabWcWPKImjgouPE9MtbG53JdU5Dcqh5NsCytUoMDhwo8tEbG8QIhoKVRMoT
         G5d6NR8MTosAGALaNGVj+uP6LOaKv/KxvjLsW3t5Dw1D6V4owSIu1LmBgFpYSmzVbuNI
         ZSoUXqqFcGlckZ/H6lc9JgajHLTzhUIC/1PhOIlJQtGKmNpLU9YmpxhqMg3RU3x2XR0R
         vV7Fout7YT8HNsY5upuIk3EcfTuPzvgq5VJWGYwgFV0qwhZMi1gRdE2FhB7pAf+37FO0
         id6H02gvGD+GchVH1Kbnry4/s8q9c8Y0q2vaM7jfvXRPdyIoh9t2uvgAM7FL4vAnpl+b
         3sQg==
X-Gm-Message-State: AOAM53368+yRu398FcNWQTyDQASwW+9b04E0xpyJa/NbhE1L68JJO72Y
	Xd4pTS3bte99+Y8kODb9mcFnbA==
X-Google-Smtp-Source: 
 ABdhPJzbZTHsplcHSfQc2ePEVJvrw7xo1YLudk5A0Nb7N0bscHPsP9XLcoYluLLDo6X4bCxnpm8jjg==
X-Received: by 2002:a7b:c258:0:b0:38e:8c78:8967 with SMTP id
 b24-20020a7bc258000000b0038e8c788967mr16044510wmj.104.1649588371486;
        Sun, 10 Apr 2022 03:59:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1d9b:707d:8b0b:b1df?
 ([2001:8b0:aba:5f3c:1d9b:707d:8b0b:b1df])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038ca3500494sm22082946wmq.27.2022.04.10.03.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 03:59:30 -0700 (PDT)
Message-ID: 
 <d8cea58b0ae302518cae6e1d53c5a29b79771f6e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] python3-mako: update to 1.2.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 10 Apr 2022 11:59:29 +0100
In-Reply-To: <20220409141500.815506-1-open.source@oleksandr-kravchuk.com>
References: <20220409141500.815506-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164196

On Sat, 2022-04-09 at 16:14 +0200, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb => python3-mako_1.2.0.bb} (82%)
> 
> diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
> similarity index 82%
> rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb
> rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb
> index 71e5d96ba1..1acbda533d 100644
> --- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
> +++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
> @@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
>  
>  inherit pypi python_setuptools_build_meta
>  
> -SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
> +SRC_URI[sha256sum] = "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
>  
>  RDEPENDS:${PN} = "${PYTHON_PN}-html \
>                    ${PYTHON_PN}-netclient \

There is some issue with this update unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/5322/steps/12/logs/stdio

Cheers,

Richard



