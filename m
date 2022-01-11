Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A16C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 17:49:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.11126.1641923341779887524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 09:49:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zu0rV7cx;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id a5so30478789wrh.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 09:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=c/VTnNpYkustGu3pA9yaxjd7S0NNYHDfnzyTvKy0uuk=;
        b=Zu0rV7cx7re1ThThhzQ58LbAiuYF/c2dev+XwT7Hlq7Ezh89fYCPHWUvmdrWKSDbC6
         I2Dz7AR3jMGKZ6jiB66JyZko1EkvgdrRefh0tzMB4uiu2UK5NJvufJsEt8fh9HRExWRe
         LdPVlZK7dPXBACko2Lla3sAHZnNdVtp0oUUjmw6C5Mjv54me634hOWnAe1jJ43Gj/P2G
         M6Mtzyh6x5ythFLpJZTdCucl8PZUsmy5z/GH/OkFMJFeXfRHVGmjk9R17lFOXzg34aTo
         7H1SutHCOnyWGeyemPu/X92iPsEQtWGTYPreHhgs+5j5JGm42Xi++cWFp/ijecqo2jL6
         ++6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c/VTnNpYkustGu3pA9yaxjd7S0NNYHDfnzyTvKy0uuk=;
        b=yq+ClhpTKcKtOzpsQoCzhWGOiGu3JryxXzKegptBXx7kKz3R74HpkTfMx7S7lTk8TX
         ZRvOYDZaO5eI93PDyE8dZzaQFcvzbc6nDUPo1dq4XAQF11+VASk8TVDIueSq02CPtJEV
         GN8vvASGl7uhouy8GMQXgM2pptEw5ZrDsNTJTf6nqiKdTocNx72XInMefsyUPhyUswsy
         Qi+KZCrvYGIVm8eniPB+9+lZo0Z3c1USNzlno2bKIhzfkqZPO52X6xxjI51ddTCuq4tJ
         tqkqIcQv8F8FaymUPAzD2grZysfY3QvB3FrV3kftrg0s6hMsat4/qtY1s0sGhBtwAWTP
         xg0Q==
X-Gm-Message-State: AOAM530a5iwZp2YM0Ri7qUvUT32ON1v/Du80fUHQc9c0LsXK0KrhiZCx
	A9G9BFX4XEO795fr00IL+iw=
X-Google-Smtp-Source: 
 ABdhPJz5i9nHa1ROOtQge7WKR6WWFbhssLRXviUDpmwOP0W3W+8vOUV1MbMguQSD+saWzP6QX9Swag==
X-Received: by 2002:adf:c10e:: with SMTP id r14mr4833847wre.558.1641923340168;
        Tue, 11 Jan 2022 09:49:00 -0800 (PST)
Received: from [192.168.42.52] (ppp-2-86-129-173.home.otenet.gr.
 [2.86.129.173])
        by smtp.gmail.com with ESMTPSA id
 f8sm11230841wry.16.2022.01.11.09.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 09:48:59 -0800 (PST)
Subject: Re: [OE-core] [PATCH] oeqa/selftest: add test that kernels build with
 defconfig
To: Ross Burton <ross@burtonini.com>,
 openembedded-core@lists.openembedded.org,
 "Mittal, Anuj" <anuj.mittal@intel.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20220111135540.2874535-1-ross.burton@arm.com>
 <CAAnfSTuYa5wJEJWwqAFTp8cRYBndYeuh-2opSEYcatcqBo0sZQ@mail.gmail.com>
From: Robert Berger <oecore.mailinglist@gmail.com>
Message-ID: <923ce81d-23e3-8ed9-14b9-e03f27bf05d9@gmail.com>
Date: Tue, 11 Jan 2022 19:48:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAAnfSTuYa5wJEJWwqAFTp8cRYBndYeuh-2opSEYcatcqBo0sZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 17:49:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160422

Hi,

On 11/01/2022 15:57, Ross Burton wrote:
> On Tue, 11 Jan 2022 at 13:55, Ross Burton via lists.openembedded.org
> <ross=burtonini.com@lists.openembedded.org> wrote:
>> The standard linux-yocto builds using config fragments, but it's a
>> supported option to use the standard defconfig.
>>
>> However, our enhanced config checking means that defconfig will often
>> cause configure warnings.  Add a test suite that exercises a defconfig
>> build is successful without any warnings.
> 
> Note that this breaks with current oe-core master:
> https://www.irccloud.com/pastebin/nAapZUm6/

I am a bit confused what exactly breaks.

Is this only one defconfig and nothing else or a defconfig plus fragments?

I build with an upstream 5.15.13 kernel with multi_v7_defconfig and it 
does not spit out any warnings. Not even after adding some of my own 
fragments.

I really like that Bruce finally outputs some warnings, since they 
typically indicate some configuration inconsistencies which would be 
otherwise hard to find.

Regards,

Robert

-- 
Robert Berger
Embedded Software Evangelist

Reliable Embedded Systems
Consulting Training Engineering
URL: https://www.reliableembeddedsystems.com

Schedule a web meeting:
https://calendly.com/reliableembeddedsystems/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--

