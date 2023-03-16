Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F30C7618A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 10:22:46 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.8839.1678962164379253766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 03:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XwC+ZzzK;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id cy23so5364108edb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678962162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D28q8MrB4gUtqM1gjyI4RROdb7dQWFNBT0SSM4HndeM=;
        b=XwC+ZzzKLAi4cxgQFzXTEXVh3lMeC510yua6AkhjsBiNikTu9BmVJadhtWp2JckMFY
         Mhyzw/LrCJD08UytY/y+AaTCCYu5WTbVc9haJ7lGnXLst6vuHI6+scIt5AmS0etb+z2/
         xx7rlcHK/5HvlvvkltC+NUVay1Guc81XWflwGJEkJ1iy7PcyvE8oiLRX0Ac7WcJi2H01
         QWvef37NqC9RR5TJwsw7lotWJhjf1gg8oq4WcN5pinsEz5nnAJWUz37bSXJJckzh9NOK
         QI1mnK0l/LNYrzro2VcufqL2f3n0UxQnbQ5J/oyqDvYUuD8AMrQ1Q+FSHmF42h9gVpsz
         Ghpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678962162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D28q8MrB4gUtqM1gjyI4RROdb7dQWFNBT0SSM4HndeM=;
        b=HqjDW7xvJtXYWGMLWVJssXklDBw8z635eImfHm7M5DwW/AFkkCyMXFd8iCR0h67Doj
         UTzfbm5tk36iNCf1itoWb10Qi6qM2nAWGDHtBJBPGNqnsT6zTBiDFofS1jU0aBnIxVuV
         9BCVzX3AYnWONixo/NP6t4lMdFqaO2kuaFqYFaRxYIwyCob9oYSn+h8Xov3rVYpeDMJa
         mcXcNe8cqYuB69RVPCx01olb3T9qHdfSwOpmTDQIJkS0R5fp/T6L/uIyZCg1HvLiwCBs
         vPuJisyHkyrOY6kOoUhuflwsJ/68D58teMrTskZ+5eX7VMh4YQgTbc1uX/dn8tmgTqJ2
         U6Cw==
X-Gm-Message-State: AO0yUKWCpfQ3hT6q0py9SOSrzznGvu1DZLaxu0iarD1ljUouPtDX9a9A
	UJS6udgp+qWU14NLgP2HMWg=
X-Google-Smtp-Source: AK7set/GjdJPf4lz/mvKfMgtLAJg7T0OT1s+zeoEHCKJM4ZyOLD9oTYi+RlDwgWA/gNg07+oVwH1dg==
X-Received: by 2002:a50:fe81:0:b0:4fd:2a29:ceac with SMTP id d1-20020a50fe81000000b004fd2a29ceacmr5665881edt.14.1678962162490;
        Thu, 16 Mar 2023 03:22:42 -0700 (PDT)
Received: from [192.168.1.143] (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id u22-20020a170906125600b008db605598b9sm3663919eja.67.2023.03.16.03.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 03:22:42 -0700 (PDT)
Message-ID: <053e63e0-210f-0d5d-6fdd-cc7988bd7e0b@gmail.com>
Date: Thu, 16 Mar 2023 11:22:41 +0100
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
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <4ffadaa158a865afd1bc4c76c79244d904fefb54.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 10:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178698

2023. 03. 16. 0:08 keltezéssel, Richard Purdie írta:
> On Wed, 2023-03-15 at 18:20 +0100, Zoltan Boszormenyi wrote:
>> 2023. 03. 15. 17:52 keltezéssel, Ross Burton írta:
>>> On 15 Mar 2023, at 08:00, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>>>
>>>    apart from the CONFIGURE_FILES line which would still be needed in the python-meson case anyway.
>>>
>>> I can’t see what is gained here, just inherit meson.
>> The problem is that "inherit meson python_pep517" ends up with
>>
>> do_configure () {
>>       meson_do_configure
>> }
>>
>> do_compile () {
>>       meson_do_compile
>> }
>>
>> when the python_pep517_ prefixed ones are needed.
>> It has something to do with the fact that both has the line
>>
>> EXPORT_FUNCTIONS do_configure do_compile do_install
>>
>> Which one wins may depend on inheritance order but
>> who's to say for sure and why can't this be order agnostic?
> Which one wins being due to inheritance order is by design.
>
> The export functions code adds wrappers meaning by default,
> XXXX_do_configure is called by do_configure but if needed you can write
> a custom function which does something like:
>
> do_configure () {
>      pep517_do_configure
>      meson_do_configure
>      autotools_do_configure
> }
>      
> i.e. call class specific definitions in an order of your choosing. I
> appreciate the above wouldn't make much sense but you see the idea
> behind it.
>
>> I need most of meson.bbclass for the settings in the new
>> meta_mesonpy class to pass to meson but using the pep517
>> machinery.
> I really dislike these "common" class abstractions and I think we need
> to find a better way to handle things. Order does matter to class
> inheritance already so we can rely and document that if needed.

So, if I were to use this in the new meta_mesonpy class:

inherit python_pep517 meson

then it will do what I need, even without splitting meson.bbclass into two, right?

I will test this.


