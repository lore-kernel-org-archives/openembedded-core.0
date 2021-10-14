Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A3AC433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 21:48:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.1524.1634248128210158405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 14:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=On+A4jH3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso680151wms.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 14:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Wm3qhr2ojf19LynJF1UjwvQY+Tv5xYxGu5FqupWTwWE=;
        b=On+A4jH3tqzvjoXi8Yb9d9gsp+8Vso6m5zhhYPEiBfBRbxx0lnI2nZJg9N/0S3Lg6c
         Fmar770f3XtiAqA2xpeu81SIOqLaz3OghXF5cfAX1mUf0qKiCNPKM13mfxIAzmGVAGa6
         cz9sIHY8Mwn3trEbfgDuzcLXx265wRawEwo+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Wm3qhr2ojf19LynJF1UjwvQY+Tv5xYxGu5FqupWTwWE=;
        b=4Jv/YdTwL7JPLEKZTrSAzzARHKTwLBdWzHUivJz7tdcvv2acrfUm4zUYn+9OBMuSvF
         yMw3UjXrjPzSIKxzWxQeaxPwJsQdIP6tAIxq23WQ9Nobj5FcqYs2swYYUuvCQLufW4ks
         BnOkpifP0y42q21ezNi+C2BjVuicunRWhen+guUjNaPbKx4XfmY56kHGweB2GMfimKAN
         +sr52+w9+DXEN8DAIMuWjSv+Qlab2gadXy6uyXjpKqjRj9QgmKdoxTLWPYZOSHfmc/mz
         OCUulgrySLhZDPZOERMZqA+08JXPTnxGduh/jXTRATyc9/Fu1uHQ92tzzz11ekHXCqhR
         TPoQ==
X-Gm-Message-State: AOAM531PgGwdenSc6c8MEUfE5vBODyHrceREOQcQcdGo+yxLJO5+/suk
	oqi9BsuK2qYhvnWLdNEaTvJJrg==
X-Google-Smtp-Source: 
 ABdhPJzGsHkgOdgARxM9qbjSvI/JhygI6aJy3X0FuwhiFig6/hzdnWhiKyJ8x/yY/wvZNWny7Y/RnQ==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr8839659wmc.94.1634248126593;
        Thu, 14 Oct 2021 14:48:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1?
 ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 d1sm3596758wrr.72.2021.10.14.14.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:48:46 -0700 (PDT)
Message-ID: 
 <050ca4d9a76319a1b68820287daf73fe7e657138.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/7] reproducible_build: Drop now unneeded
 compiler warning
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 14 Oct 2021 22:48:45 +0100
In-Reply-To: <ca870211-18f1-8387-2d4a-354bd70a897f@gmail.com>
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
	 <ca870211-18f1-8387-2d4a-354bd70a897f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 21:48:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156976

On Thu, 2021-10-14 at 09:36 -0700, Khem Raj wrote:
> 
> On 10/14/21 5:10 AM, Richard Purdie wrote:
> > We now pass compiler options that mean the compiler will adjust these values to
> > SOURCE_DATE_EPOCH, the compiler warnings are now unneeded.
> > 
> 
> Is there a chance of it being overwritten by component's build system
> in that case this warning may still be handy

The warnings are basically lost as noise in the log.do_compile files so I'm not
sure it buys us anything...

Cheers,

Richard


