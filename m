Return-Path: <jlaw@ventanamicro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4631AC25B4E
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 04:02:57 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.7687.1674532974508401104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 20:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ventanamicro.com header.s=google header.b=Ov8l8yCU;
 spf=pass (domain: ventanamicro.com, ip: 209.85.210.174, mailfrom: jlaw@ventanamicro.com)
Received: by mail-pf1-f174.google.com with SMTP id z31so7281336pfw.4
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 20:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cILlkIUjpTbO+Oc8e6fVuPY7OdoTK95N0Om/Nkf3J3I=;
        b=Ov8l8yCUi8Nnqpb+3UHxjpQ7YHbJjYi0/82U/WYaKEirAgSk1lKZN1r9AUarOcjIVq
         l6gFpNButBPYpCZoPrFfYsiq0z2osfSSWvDZNAosgWJWaS9eoOcJ8lzn/n30OrqNACdm
         Bfo9qMqb75WUZEbASroWAIsuNIxFTNgXxTpaYLYPCRrjlhhLNCbi6qvodPqB5QKv9G7v
         kkT2iWNLtP27ncaoBz8y0qKLvsZ/zmMXnLcH72pvWuAOQS+Leyfr3cSg8C1Z1HXAztCq
         pj25hUZYxlc26Pv3f/QBw9lrt4fzzLXtkYfGVmLQqkwJIrybbbwDeG4BN1PrwrNqlhpw
         pc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cILlkIUjpTbO+Oc8e6fVuPY7OdoTK95N0Om/Nkf3J3I=;
        b=yKA+/SA/bGld28nN/F99IZ5MxaDLc3rgolgLzvdwUECqNC3VbutJBV2IBh/q2SF8Nt
         HQYWcfs5Vn5BdkgBP4XD0tRkOBGIOUDncspjwKMjb17IUwRV7kZeuTCXeAlBBKP02d/z
         RMuj9ulZWtxiVE5wrfon57VQKCnFI+gY0S/yn805oRy0aEhyvTYR6CJbPchfV19QRgRk
         1hKK88jESSUDNQH+YuSeLy4uC0DiQiB6qP3nwdIK3hOZhZpAOWdf7Op/eTV0wevKCMdM
         n+Zj9j3/YOviuxwkf71pCEu9dTV01ARb0EWsMeFnj29JBTl7taamfHgsomPz87vpuwA9
         oIrQ==
X-Gm-Message-State: AFqh2kpLXfM9SE3iCTi69NbD923PbCynYbcTfRig361Xd1VIWH9+rQUG
	IYsgczbgCyN6vnMhy6mM1WZkxw==
X-Google-Smtp-Source: AMrXdXvCnkbuWoqpEq3P8W/gyD3KthmUVxxFt3+gvxp/c0QjoEjPYMjz9PWt6O6PNM1m6wWkWmvLiw==
X-Received: by 2002:a05:6a00:d68:b0:576:dc40:6db9 with SMTP id n40-20020a056a000d6800b00576dc406db9mr22914019pfv.13.1674532973896;
        Mon, 23 Jan 2023 20:02:53 -0800 (PST)
Received: from ?IPV6:2601:681:8600:13d0::f0a? ([2601:681:8600:13d0::f0a])
        by smtp.gmail.com with ESMTPSA id 201-20020a6218d2000000b0058baf8694e1sm392936pfy.71.2023.01.23.20.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 20:02:53 -0800 (PST)
Message-ID: <bacdbd7a-57f3-7cb0-aa7c-9591244de3e4@ventanamicro.com>
Date: Mon, 23 Jan 2023 21:02:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [OE-core] [PATCH v2 1/3] binutils: Upgrade to 2.40 release
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alejandro Hernandez <aehs29@gmail.com>, Richard Purdie <rpurdie@rpsys.net>,
 Nelson Chu <nelson@rivosinc.com>
References: <20230119042724.1413857-1-raj.khem@gmail.com>
 <a42ac89e-a844-6790-ad68-d5f7852b4e87@ventanamicro.com>
 <CAMKF1so-ZMwLME=bVp+w85RhyP8APxSJ1okcCWxsJ4zkODX6ZA@mail.gmail.com>
From: Jeff Law <jlaw@ventanamicro.com>
In-Reply-To: <CAMKF1so-ZMwLME=bVp+w85RhyP8APxSJ1okcCWxsJ4zkODX6ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 04:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176324



On 1/23/23 16:38, Khem Raj wrote:
> On Thu, Jan 19, 2023 at 9:25 AM Jeff Law <jlaw@ventanamicro.com> wrote:
>>
>>
>>
>> On 1/18/23 21:27, Khem Raj wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> v1 -> v2:
>>> - Fix build on mingw
>>> - Backport fix to build with --disable-gdb
>> [ ... ]
>> Note I think this is going to run afoul of grub2 mkimage.
>>
>> In binutils-2.40 the assembler for risc-v was changed to use CALL_PLT
>> relocations rather than CALL relocations.  grub2 does not handle
>> CALL_PLT relocations which in turn will cause a failure when
>> grub2-mkimage is used on risc-v.
>>
>> As far as I can tell, the assembler change literally just changes the
>> relocation number, they are otherwise treated the same.  So I think
>> grub2 can be fixed by just treating R_RISCV_CALL_PLT just like
>> R_RISCV_CALL in kern/riscv/dl.c.
>>
>> Nelson, can you confirm that all your assembler change did was change
>> the relocation used in the resultant object?
> 
> The binutils change is here
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=70f35d72ef04cd23771875c1661c9975044a749c
> 
> I tried something like this
> 
> http://sprunge.us/ZjpFCI
> 
> I still get
> | grub-mkimage: error: relocation 0x13 is not implemented yet.
> 
> need to look more.
That's what I would think the right fix ought to be.  Weird.

I think mkimage is run as a host tool, so I'd dig into the build of that 
on the host.

jeff

