Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFB5C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 16:54:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.7674.1647017657008467176
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xi2u5v+p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id u10so13828216wra.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=b7BxjNQTk3deCWwNxd0LMUul/U7/cczIusVkElaCLeU=;
        b=Xi2u5v+pA/4/XrTg8YWr3o+cAhLrdIpekFH6roUtYl2o478V3MxBdVOjG1PUv9aGAw
         l8G9IukICS4X1u7V2iGJVPdzLM58UmR1qQWgl+gn3qUB868o3rNxMamPHJNfGbFXcwje
         fuFRl+re5CpRskcSnQXxCbOEXqK1qOLzIziJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=b7BxjNQTk3deCWwNxd0LMUul/U7/cczIusVkElaCLeU=;
        b=JbP0HkdM6JBfY6eoJeHjrCvGhHlatOKfD9gUEKd6sdxPBASCUoBXoNOv2NIo5Lpsz3
         vgtWw7uz0W4O9PPOkvyoH5xXZCMz39/V7bhgJQ+twHVKQILmtV4kGxJ7QbZUgeA1p7O6
         SajaWQr/q/XOLGTuq8T9Hez5a7XE20FgScWl02FLw0ZAW1uk9yg+cos6UHlg6b/7ex6H
         dDn26HxbINoG5GIMPwjovnz6eSmWkueioQ9F9fPKMNUtfj//6CM8WiC8lm/voEt8xa7m
         tDd+ubTdAXxWVGpZvX1UcId+gkc5u+Re4alK5YGzvOIl9Qn18cDU7TbaYJwcrlhc+Hes
         2KHQ==
X-Gm-Message-State: AOAM533mIBccY8/MCR4YKx2W28+eDdXkvxzRVvZcEeZpjQZozKuB3t14
	PvP6YJNInQp47hwKTYqNK4xQYw==
X-Google-Smtp-Source: 
 ABdhPJwSr6ftwUlLnOGPSpgwKJgQsfHUjgnGRBw5WnRf1NjjVXKDp/ma4B7Ab128W2A/0eP9WJA9Ig==
X-Received: by 2002:a05:6000:144b:b0:1fe:ac08:7038 with SMTP id
 v11-20020a056000144b00b001feac087038mr7993599wrx.318.1647017655264;
        Fri, 11 Mar 2022 08:54:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2661:a90e:1786:ea48?
 ([2001:8b0:aba:5f3c:2661:a90e:1786:ea48])
        by smtp.gmail.com with ESMTPSA id
 v12-20020a5d4a4c000000b001e68ba61747sm6951329wrs.16.2022.03.11.08.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 08:54:14 -0800 (PST)
Message-ID: 
 <b3e2f344391a1d4d409d903dc3b8793d0a30b728.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] mesa: update to 22.0.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2022 16:54:11 +0000
In-Reply-To: <20220311151836.1541579-1-f_l_k@t-online.de>
References: <20220311151836.1541579-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 16:54:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163059

On Fri, 2022-03-11 at 16:18 +0100, Markus Volk wrote:
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 2f79e8b34d..c9dab15f4f 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
>  BUGTRACKER = "https://bugs.freedesktop.org"
>  SECTION = "x11"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://docs/license.rst;md5=17a4ea65de7a9ab42437f3131e616a7f"
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=9a383ee9f65a4e939d6630e9b067ff58"
>  
>  PE = "2"
>  

Thanks for the patch, what changed in the license?

We require license changes to be noted in the commit message just to show that
someone checked the license hasn't changed.

Cheers,

Richard




