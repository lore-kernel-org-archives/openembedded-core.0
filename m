Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D92DC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 16:49:00 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.264.1642610938898006442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 08:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dpndc+7j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id w26so6371417wmi.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 08:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=R8Dk89HbduXF6T1j0Q0LsHyWgq+FtC4i2tFvKU3qawo=;
        b=Dpndc+7jsxOGWT5loZEEwnQJx30mCt9i0/eKqn1Kzzsnyc2E7HmzfH+dmdXmmxQXK9
         Xj0yvVwIr1aIyM2zEPbiazy7fVWdp5tNx/C3k+ODdxzMlm4KcfxWQ7k29rqrBBhG/kjL
         A77IXV2UVYlkvq0qttgRoDHhPjXqF3AF65x1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=R8Dk89HbduXF6T1j0Q0LsHyWgq+FtC4i2tFvKU3qawo=;
        b=5xGDZMZsyMJTW+Hel8u78QGqxGS/rD0htAACCRjnI95+yh7QmjolncLrMk3umBhMgN
         9sk2RiLYzPqXiImOtu6LAPMXLiiZ1OzESvgI0LCWsZf7Zcb33ypu359OfJnApjqDHhPW
         TKaoH0Lj9yFNuuKzzq8isc19mw+A7B07fSuXJ1oS7YJ0sSMd7FeE/SZCWMLreoKmOZ/n
         KlE9YV1jZC7WxvINI7Rl8vlFG9HEiL4ZzeLyVmjxupRc89x6V0QjO8SvuqB1wklYUB9e
         ifRKK6uOV1mf88qVayipr0oJJuVh8CZJCfvra6Cfw32KUCaCv9panqJZQngjCUKQgGwc
         LOPA==
X-Gm-Message-State: AOAM530wFXG65OxJmQnPcawTtLlqQTIafb1zRnpt4iSK/HPbxhr+CYHB
	6+eoexw4NcEvFi9YvalRN+f8MA==
X-Google-Smtp-Source: 
 ABdhPJzqfnDooAKN/J/HWyA0qLc8IihXk/ivvJz5WKUN0MOfMJjrzKk/jmztyRsK0acnj6NCUDYnrg==
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr19300392wry.366.1642610937157;
        Wed, 19 Jan 2022 08:48:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4e1a:65bf:4ced:cc2d?
 ([2001:8b0:aba:5f3c:4e1a:65bf:4ced:cc2d])
        by smtp.gmail.com with ESMTPSA id
 g189sm6838806wme.18.2022.01.19.08.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 08:48:56 -0800 (PST)
Message-ID: 
 <59f559e8a8f7a1ec6fccb9de63002c781cbe7acf.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] kernel: add missing path to search for debug
 files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>,
	openembedded-core@lists.openembedded.org
Cc: saul.wold@windriver.com
Date: Wed, 19 Jan 2022 16:48:54 +0000
In-Reply-To: <20220119115759.1390792-1-andrej.valek@siemens.com>
References: <20220119115759.1390792-1-andrej.valek@siemens.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 16:49:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160741

On Wed, 2022-01-19 at 12:57 +0100, Andrej Valek wrote:
> Since explicit debug package creation via ${KERNEL_PACKAGE_NAME}-dbg has
> been added to kernel, it has to cover all PACKAGE_DEBUG_SPLIT_STYLE
> options. For ex. when the variable "debug-file-directory" package search
> path has to be set explicitly, otherwise it will not find any files.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/classes/kernel.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 473e28be47..9ea201c936 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -647,6 +647,7 @@ FILES:${KERNEL_PACKAGE_NAME}-image = ""
>  FILES:${KERNEL_PACKAGE_NAME}-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>  FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>  FILES:${KERNEL_PACKAGE_NAME}-modules = ""
> +FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"

This seems to highlight that we have no tests for KERNEL_PACKAGE_NAME. At the
very least we need a bugzilla entry for creating some...

Cheers,

Richard


