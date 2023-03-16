Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D9AC6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 10:37:56 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.8986.1678963068185542214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 03:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jYsOD9hO;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id l12so1032738wrm.10
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 03:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678963066;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3tGzabhUQ4x7+lNPlQKiK/JMbDYB9UfXtN+1yOwldU=;
        b=jYsOD9hOZ/4fFE3Lm3hUuRcpfW4gE0M6TlBphmNakSLEAD3p6MkECO4UaEtcd0rapm
         tHYVmXlASgKNcoxzfRGjutFjIC50Iuutrqn5jgdrTx1YN5nBWjmC+/lA+RfusRngP/Cn
         hWsRI6kS8UxRkopdQjK1unHmF0pve9z5PoRnjCpmw+DsSz2gZu5I2YQvM/DSGDiEsMnA
         jp29xV0IEUFGzWJjjBxY+Y9++4o1GORcFMiX7Malsy93cAwvEkyqtzYGAjPOSc9r4/s/
         hC+uOyQVncG6Ci26AKUXxgsGlWmJVXAOaAcxK4RC+7rnRvR/WTuX9YZJhohtQamrDbB1
         4gPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678963066;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3tGzabhUQ4x7+lNPlQKiK/JMbDYB9UfXtN+1yOwldU=;
        b=txg3qBqO/ijmp4q5byswRavXB89xnnqg7XZjMwhfxzWl3dBSs45ll40/yQ5I51PArt
         bcee2BHynX5rMqD0dk7oHvIPES91EmQWeQQ10qaErt4JYtFESyj1VBqxPMFYu1jjsjO/
         UFkSev/NETe0lAt90kDIozMvEOF10dDQShvE92cbehg70JaUjbLQ47fnCKWS5qVC4TAm
         uikip+Xuq+PUXaxnSFvZKPQ6FQrQoM3WKOveemsnWRs6C/Cai3wyB0Ew+PB4fjaqoKpy
         +fJYX8fzsq1YkN6HpHgD+qtwyjn47sRF58otF9GJu+dywCUBHzWP32D81lJ/1oFJrPN0
         iM0w==
X-Gm-Message-State: AO0yUKXAzAJxxlnwxWeMZRsr9KxqGe2NksOgtT1u14B7lFENLvxc+Ew9
	SFIcil4NraOXAYPzfIELt3s=
X-Google-Smtp-Source: AK7set/R6fnXPe4089yf/AmgduqN1tPMOmTneggNRrhq8XYCrM9yZ3z3VccGZiydtjcjGn5SLuTH7Q==
X-Received: by 2002:adf:f946:0:b0:2ca:e856:5a4 with SMTP id q6-20020adff946000000b002cae85605a4mr3912705wrr.26.1678963066305;
        Thu, 16 Mar 2023 03:37:46 -0700 (PDT)
Received: from [192.168.1.143] (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id p9-20020adfce09000000b002cdbb26bb48sm7160208wrn.33.2023.03.16.03.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 03:37:46 -0700 (PDT)
Message-ID: <07abaf0e-333f-5a9f-8501-b1b7a33ae5d6@gmail.com>
Date: Thu, 16 Mar 2023 11:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH] meson.bbclass: Split into meson-common and
 meson classes
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230315080020.2648416-1-zboszor@gmail.com>
 <0FA14024-12BF-4952-8E22-3D8A64B472FB@arm.com>
 <efae316a-c655-ab08-13cb-214be93b59f2@gmail.com>
 <4ffadaa158a865afd1bc4c76c79244d904fefb54.camel@linuxfoundation.org>
 <174CDF317CB46FA2.18629@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <174CDF317CB46FA2.18629@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 10:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178699

2023. 03. 16. 11:22 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 03. 16. 0:08 keltezéssel, Richard Purdie írta:
>> On Wed, 2023-03-15 at 18:20 +0100, Zoltan Boszormenyi wrote:
>>> 2023. 03. 15. 17:52 keltezéssel, Ross Burton írta:
>>>> On 15 Mar 2023, at 08:00, Zoltan Boszormenyi via lists.openembedded.org 
>>>> <zboszor=gmail.com@lists.openembedded.org> wrote:
>>>>
>>>>    apart from the CONFIGURE_FILES line which would still be needed in the 
>>>> python-meson case anyway.
>>>>
>>>> I can’t see what is gained here, just inherit meson.
>>> The problem is that "inherit meson python_pep517" ends up with
>>>
>>> do_configure () {
>>>       meson_do_configure
>>> }
>>>
>>> do_compile () {
>>>       meson_do_compile
>>> }
>>>
>>> when the python_pep517_ prefixed ones are needed.
>>> It has something to do with the fact that both has the line
>>>
>>> EXPORT_FUNCTIONS do_configure do_compile do_install
>>>
>>> Which one wins may depend on inheritance order but
>>> who's to say for sure and why can't this be order agnostic?
>> Which one wins being due to inheritance order is by design.
>>
>> The export functions code adds wrappers meaning by default,
>> XXXX_do_configure is called by do_configure but if needed you can write
>> a custom function which does something like:
>>
>> do_configure () {
>>      pep517_do_configure
>>      meson_do_configure
>>      autotools_do_configure
>> }
>>      i.e. call class specific definitions in an order of your choosing. I
>> appreciate the above wouldn't make much sense but you see the idea
>> behind it.
>>
>>> I need most of meson.bbclass for the settings in the new
>>> meta_mesonpy class to pass to meson but using the pep517
>>> machinery.
>> I really dislike these "common" class abstractions and I think we need
>> to find a better way to handle things. Order does matter to class
>> inheritance already so we can rely and document that if needed.
>
> So, if I were to use this in the new meta_mesonpy class:
>
> inherit python_pep517 meson
>
> then it will do what I need, even without splitting meson.bbclass into two, right?
>
> I will test this.

The result is that still meson_do_configure et.al. are generated
into the build scripts.

Something is not right with with EXPORT_FUNCTIONS then,
it doesn't obey inheritance order if meson always wins.


