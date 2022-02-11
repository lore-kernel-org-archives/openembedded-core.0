Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE0BC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 19:36:31 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web09.453.1644608189585017464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 11:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V4NCeesW;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id x15so1328515lfu.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 11:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tK/6IJAC0DVlYHPdo8uZWE+GgZ1j6BB/NN4AoMisxTE=;
        b=V4NCeesWm5LfIBNVWjZSZATZbjTLIrUOUVJffnHjM/rhp0t3DVHclOjk8bbevQc4iz
         RVEEluAwTn8wHLikouYux74uta2gY+rtrZfL7MW9vRwfPkV5SZFlzGJM+RciwdgqpyaP
         MghzauQAhQSErhpeK7KGUKg5H1UDvACfd3Iqt/sjbnU6i8VubMBzetms9sMbzkLpsn4d
         UgBeAhZYxBCFHf+gU+bt7jA0ru4s4wY1BQzeZk2BgEGB9h10I1KtaxEEy99u3ZDamdrl
         z0rgxN8CGC3fHwOaTjT8CO5D0WKSh1HnNtnwn6BNzdTAqrxRchRh94eZNJO0IgLdxf3X
         Hutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tK/6IJAC0DVlYHPdo8uZWE+GgZ1j6BB/NN4AoMisxTE=;
        b=KrpNTMFzfFxlpS/kKqc79sLURIBdMMUBGC+6Yzw83/bLbuHzigLs3CYM4jCygmWysJ
         8edStbQpV9lmZqwZ0SClWx/zhudcsCcy9LQTJhu1rcOu1fwVHGcYAWumNhelw8TkMQak
         a217TNdhK6US+KxYQFR3so4A8FfTr4GBsmVwO+GkoNDejTuTKJNhnxcNqXj0xq5TGWx0
         6w+u9fgVtlY0+wHffLPK9gjnWfJJPpI6tIDjrSErNs3t9xRHaWNsaiLvJu78fTWzOZgC
         xJ7WaZG/GRMnctVQ5c6zblYuKaS9lwvEDGCxBhzLdIPQTHtXXegwvDpt7Uga8CRj0tMl
         4xXA==
X-Gm-Message-State: AOAM532Liv7CI1M3F0F4mvgZCgYFRbJByebe7/JuzF85SuAaerPznZr5
	wg4UlDQFCxltuKKr6Ft9X/I=
X-Google-Smtp-Source: 
 ABdhPJwKR1gQsvfdf9CnlJD4CSbPIr9defJXiu/jZTRiPbEp4fAdVPQNds/v3d4bs5r3v3jf2c60Aw==
X-Received: by 2002:a05:6512:139e:: with SMTP id
 p30mr2293659lfa.502.1644608187763;
        Fri, 11 Feb 2022 11:36:27 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 u12sm686068lfo.117.2022.02.11.11.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 11:36:27 -0800 (PST)
Message-ID: <b5070bcc-c01b-6011-2788-2b5e15397e6c@gmail.com>
Date: Fri, 11 Feb 2022 20:36:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] default-distrovars.inc: Switch connectivity
 check to a yoctoproject.org page
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20220211174613.2732343-1-richard.purdie@linuxfoundation.org>
 <CAAnfSTvhtTsY1SjWrSdf=3LydUS_RrGnjc1xkM+vQ_Jh3h9Etw@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <CAAnfSTvhtTsY1SjWrSdf=3LydUS_RrGnjc1xkM+vQ_Jh3h9Etw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 19:36:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161663

fwiw, +1 from me too

On 2/11/22 20:27, Ross Burton wrote:
> +1
> 
> On Fri, 11 Feb 2022 at 17:46, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> example.com is proving unreliable at present so switch to our own connectivity
>> page instead. That page is very simple avoiding app overhead on our web server
>> which was an original reason for switching to example.com.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/classes/sanity.bbclass                     | 2 +-
>>  meta/conf/distro/include/default-distrovars.inc | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>> index f288b4c84c9..773902e619d 100644
>> --- a/meta/classes/sanity.bbclass
>> +++ b/meta/classes/sanity.bbclass
>> @@ -353,7 +353,7 @@ def check_connectivity(d):
>>                  msg += "    Please ensure your host's network is configured correctly.\n"
>>                  msg += "    If your ISP or network is blocking the above URL,\n"
>>                  msg += "    try with another domain name, for example by setting:\n"
>> -                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
>> +                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.example.com/\""
>>                  msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
>>                  msg += "    access if all required sources are on local disk.\n"
>>              retval = msg
>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
>> index fb0f1097da9..3bba651a776 100644
>> --- a/meta/conf/distro/include/default-distrovars.inc
>> +++ b/meta/conf/distro/include/default-distrovars.inc
>> @@ -54,4 +54,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
>>  # fetch from the network (and warn you if not). To disable the test set
>>  # the variable to be empty.
>>  # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
>> -CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
>> +CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
>> --
>> 2.32.0
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#161662): https://lists.openembedded.org/g/openembedded-core/message/161662
>> Mute This Topic: https://lists.openembedded.org/mt/89077055/4454410
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jacob.kroon@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

