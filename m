Return-Path: <zach@mandolincreek.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50943C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 03:40:26 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.3573.1653622825567788011
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 20:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aquabyte-ai.20210112.gappssmtp.com header.s=20210112
 header.b=7Axkgkuw;
 spf=none, err=SPF record not found (domain: aquabyte.ai, ip: 209.85.214.170,
 mailfrom: zach@aquabyte.ai)
Received: by mail-pl1-f170.google.com with SMTP id q4so3065166plr.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 20:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aquabyte-ai.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=txcBSHnEwZxzAbI5lWIZ7suCgD03pq3464AmhbtecYI=;
        b=7Axkgkuw66BNWefHHRiA56Um3oAUSDWZZxB4nudEJ0g961K6rJCISTHmqRzW6eEbOM
         Jxo24x7qPIzN1qtY7vGhweTTlI1cGQo3P8BtPExqFek8dhUDlxe3lCqsSKXCnP3dwIGj
         mBckan6qTnuYrCP8ECwNgXKZi9XNseYw0H0wAQgqjD/WtloZJSNKDf4aFlZssAdoIRlz
         SELV4mFHOpSj2+RSMClF0/jZqsBbjCvIp/slEfV11USN7Qak/pbHxyJ7KP5ZzUbzq0wg
         Gdw5/ZEtB4oVXwcF7c86EeEIT+i/8b8pQivRO3zWINaJM6MLIUk0N7NU3sOAyRUBiMOk
         ye4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=txcBSHnEwZxzAbI5lWIZ7suCgD03pq3464AmhbtecYI=;
        b=8H7n+6bJGWrZollomuSzwmJl+X9/YRhQ16BktuKA6JrqE/DVIlwKF8fkkvNjyB6omP
         11N1U7wZSGSdeigUZ9MJN2uV5tvrm33Bd8DPUmWQc4ljSvBInZF8lMy9s4p3eed2VLYd
         +oFAsoGlcQWpMgfeVJqXy84LFIGaH+Iy7lGr9gWlt0DeiGjzNr+7+IDdU8Q5lpt8AXCg
         chCvOsIxuPpvcVgUrny8tsNmHchpLPDJsEtAFtw6qVCap78z45TbVO6nbZhUCJWuj19R
         qvlTOKHVNd4yTASqEpWPy2VROnwKsUYbCPmyKjhe+1Y3qu++pS2W8rND1eWHlhKkIhRm
         KooQ==
X-Gm-Message-State: AOAM531vdNEZnItoYdGWsGvg5gkvndpuA7MOGRlSOTdvxdrP/2LuiTxJ
	bWg/5GkEg42NCJGB1+dQCs5I7w==
X-Google-Smtp-Source: 
 ABdhPJwOv4Kja67+IvNAmFxgL9L3BZI+3CiVsXC6qWRn7R4Z4wFkct2ZJO0RBVdr5USe0NsCVDVHZQ==
X-Received: by 2002:a17:902:9044:b0:15d:1c51:5bef with SMTP id
 w4-20020a170902904400b0015d1c515befmr40812978plz.170.1653622824847;
        Thu, 26 May 2022 20:40:24 -0700 (PDT)
Received: from [10.0.0.170] (fluffy.mandolincreekfarm.com. [192.173.156.26])
        by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e5ca00b001619cec6f95sm2351460plf.257.2022.05.26.20.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 20:40:24 -0700 (PDT)
Message-ID: <7f2a1d34-7793-b34a-a79b-f2765743af64@aquabyte.ai>
Date: Thu, 26 May 2022 20:40:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH] ccache.bbclass: document CCACHE_MAXSIZE
 variable
Content-Language: en-US
To: Andre McCurdy <armccurdy@gmail.com>, Zach Welch <zach@mandolincreek.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20220527000610.648627-1-zach@aquabyte.ai>
 <CAJ86T=VL4og2ZXJpTjmzmkzRxdis5hM6q9f2R8PD7XHpcR5WkA@mail.gmail.com>
From: Zach Welch <zach@aquabyte.ai>
Organization: Aquabyte, Inc.
In-Reply-To: 
 <CAJ86T=VL4og2ZXJpTjmzmkzRxdis5hM6q9f2R8PD7XHpcR5WkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 03:40:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166200

On 5/26/22 18:53, Andre McCurdy wrote:
> On Thu, May 26, 2022 at 5:06 PM Zach Welch <zach@mandolincreek.net> wrote:
>>
>> Setting this avoids premature cache object eviction during large builds.
...
> The default (ie 5GB) would seem safer for most users. Apart from some
> potential loss in performance, there's no downside to reaching the
> limit (i.e. there's no "overflow" as you describe it) and 5GB of
> compressed object code is already quite a lot. Growing much beyond
> that risks just filling the cache up with old stuff that's never going
> to be reused anyway.
> 
> What kind of "large builds" are you seeing issues with?

For some reason, I had it in my head that the CCACHE_MAXSIZE limit was 
being applied to the CCACHE_TOP_DIR.  Obviously, that's not the case; 
it applies to each individual per-arch/per-recipe cache.  I ran a clean 
build, removed the tmp and sstate dirs, and built again; it looks like 
the default limit will be fine in most situations.

Please drop this patch; sorry for the noise.

Thanks,
Zach

