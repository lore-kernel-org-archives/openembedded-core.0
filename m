Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A779C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 11:18:38 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.4070.1636111100594346456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 04:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E82R6MnO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id c4so13135609wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 04:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bnWKw6QPFd5KSY+1gKMTD6fiXZFVUtD57zGGyAhNkwI=;
        b=E82R6MnO12z8LCj+5Lqx/ce/FxaXaURuB+15OGoBjLUQNqncfot2+kP5sVM6qHwYVM
         WF4RcxEityOcFG0Lx5/AxLNQ8Ns4Bo+nyWR6b62k2zxTYsc8ePz1TZzFrPCimmunse2w
         PFgUOpT2/aNWp+84G7nPNlanJln7SX7UrAcrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bnWKw6QPFd5KSY+1gKMTD6fiXZFVUtD57zGGyAhNkwI=;
        b=eQ5JWl70XR2BEmhN+Ree6KeUk1R+KScKffQQoQG/+RBgHSbja8UUb2pdswRXjl5GX8
         Df2qI82LY3URSLlupIZcxYuhwY072tcc4gxTT0P/Xqg0infiWfVAwWuAxBIugc8EgcNQ
         uU/wWjEu2SYKqbuGVFDBUQw9JOfJqq3ByQYkaC953pm9pK7Konnh0hAdDPmMb2G8he5k
         rURysWA8yzKz/pSWB3IFzLJjpNkCY4E6g9RGZFWwXNu/AHLMo4geyIzz7N9GuIKP4jm4
         mjQbpF+JUVLl0VgTlTUQQ9kbruFJfXwNGg9O84Z7AaySwdqXXf87C7GmcveIgqRUl5Lz
         d3iA==
X-Gm-Message-State: AOAM5311WQnspsuycfk4TRLll6FFCw4E1wncQsAJUxdePlNJ6vnslf9x
	UrKbSSm/dyMkfJG+f17RCpyK5A==
X-Google-Smtp-Source: 
 ABdhPJwHxkwo+KIJPH+qtvdVHm6w0MJa/zcxFQqJ08C1lNURFf5W2hQVfFGHw4gdsdkRr92qE+Y9wA==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr17628582wri.308.1636111098973;
        Fri, 05 Nov 2021 04:18:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:38e6:15ea:3134:28e5?
 ([2001:8b0:aba:5f3c:38e6:15ea:3134:28e5])
        by smtp.gmail.com with ESMTPSA id
 u5sm7995272wrg.57.2021.11.05.04.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 04:18:18 -0700 (PDT)
Message-ID: 
 <c13e0bd91696d38e2a42292f2098324591a6a6d0.camel@linuxfoundation.org>
Subject: Re: [PATCH 3/6] linux-libc-headers: update to v5.15
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 05 Nov 2021 11:18:17 +0000
In-Reply-To: 
 <57d58cf2b9094e474cf01c17e475b0526ee969d8.1636054726.git.bruce.ashfield@gmail.com>
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
	 <57d58cf2b9094e474cf01c17e475b0526ee969d8.1636054726.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 11:18:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157889

On Thu, 2021-11-04 at 15:48 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> No patches needed refreshing or removal, so we just update the
> SRC_URI and pick up the latest uapi / kernel headers.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc                   | 2 +-
>  ...{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} (81%)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 58f49800c4..86a6b50433 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.37%"
>  GDBVERSION ?= "10.%"
>  GLIBCVERSION ?= "2.34"
> -LINUXLIBCVERSION ?= "5.14%"
> +LINUXLIBCVERSION ?= "5.15%"
>  QEMUVERSION ?= "6.1%"
>  GOVERSION ?= "1.16%"
>  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> similarity index 81%
> rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
> rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> index 282c04d79c..588cc3acd1 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
> @@ -14,7 +14,7 @@ SRC_URI:append = "\
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>  
> -SRC_URI[md5sum] = "a082ef5748b813abca0649dab8be5f52"
> -SRC_URI[sha256sum] = "7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2"
> +SRC_URI[md5sum] = "071d49ff4e020d58c04f9f3f76d3b594"
> +SRC_URI[sha256sum] = "57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8"
>  
> 

Looks like there is a musl issue with the ipx.h header in ppp:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4299
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4313

Cheers,

Richard





