Return-Path: <jlaw@ventanamicro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA2EC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 17:25:42 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.51551.1674149134666330525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 09:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ventanamicro.com header.s=google header.b=BqurOaue;
 spf=pass (domain: ventanamicro.com, ip: 209.85.216.46, mailfrom: jlaw@ventanamicro.com)
Received: by mail-pj1-f46.google.com with SMTP id d8so3060446pjc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 09:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6cm3GR9/cXmEZSxLQ1D2/r+neLmlr5P9fy7JhAF9xM=;
        b=BqurOaueKbtiB6jq2MtuFCze9GX9TKw6yva0o3nPF88bOC0K1wr1odL3mYiMF1gcEc
         4I9uSbxscMGHkOb05F3OYZxWTnbjpdgBpSjgHEat2nVlr7mvHivXc1cYeYkh/7LrApkW
         pIUpYCWa7Sc4j+qSGJAgnaKl7wRF072fnfXU29imOpqJ7HHaS2OBpOpT5mVXPa5/2UEs
         TC2OfphQEJ0pmlqagE6XUljtr9v/p/bk0Mu7Jn4FgdO0Pm9LvVByxbm+reDYUmFsj2Oi
         2w1qGOdhe75SNpS5vXUfqXZH97+ckMTlMeUAnJbJoGM3Br1TkPq5YhzxDnIACX5LKSn0
         Qm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6cm3GR9/cXmEZSxLQ1D2/r+neLmlr5P9fy7JhAF9xM=;
        b=IUqLxDSwS0ln/Gbj/D6rWfeWuCbithUiHA+RgMdv3U5boD2jDb/7QrjOXwx142flt7
         cIVAnQ6M/sx/II3F8InZepnmp9CUww6wTiu/wU/D4PYDdzePyvdUqxgq4qWvFFsD7wAH
         2FBrxUeEjjXU2GyFdY+sgQVL12Ay0mwn0ag7fQXI8uRIoACKGeYSE1DplzxMakmJ+NPb
         KqKdN3/k9n+pYq0QDftJihQ/M22FgzlTf/FNqTw3kW6JhyMASQjyBtDYWsK6grwmj1KX
         FNzGa++MFS5BGdx1rTEyI6K1+ZjnVvtJMmSWrT04SjOB2QxtPwlJWffG7uMIe7Fj0X6S
         QLNg==
X-Gm-Message-State: AFqh2kq75Wh1LLAjKtny3LtZogx6p7wyTcLluKKpzFiAW04/Oydavksi
	tP9a//286/I8MhXvn4RXW3W11w==
X-Google-Smtp-Source: AMrXdXtYhuykPLHGZVLKe8D842Vv9gdJu82gBCM8MI9bGGqtKGRMH5tIo9eTGbsQ0VJv+5zzuwVIBA==
X-Received: by 2002:a17:90a:7041:b0:226:f8dc:b241 with SMTP id f59-20020a17090a704100b00226f8dcb241mr11883580pjk.36.1674149134106;
        Thu, 19 Jan 2023 09:25:34 -0800 (PST)
Received: from ?IPV6:2601:681:8600:13d0::f0a? ([2601:681:8600:13d0::f0a])
        by smtp.gmail.com with ESMTPSA id g6-20020a17090a708600b00229199f5792sm3437791pjk.15.2023.01.19.09.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 09:25:33 -0800 (PST)
Message-ID: <a42ac89e-a844-6790-ad68-d5f7852b4e87@ventanamicro.com>
Date: Thu, 19 Jan 2023 10:25:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [OE-core] [PATCH v2 1/3] binutils: Upgrade to 2.40 release
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alejandro Hernandez <aehs29@gmail.com>, Richard Purdie <rpurdie@rpsys.net>,
 Nelson Chu <nelson@rivosinc.com>
References: <20230119042724.1413857-1-raj.khem@gmail.com>
From: Jeff Law <jlaw@ventanamicro.com>
In-Reply-To: <20230119042724.1413857-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176155



On 1/18/23 21:27, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v1 -> v2:
> - Fix build on mingw
> - Backport fix to build with --disable-gdb
[ ... ]
Note I think this is going to run afoul of grub2 mkimage.

In binutils-2.40 the assembler for risc-v was changed to use CALL_PLT 
relocations rather than CALL relocations.  grub2 does not handle 
CALL_PLT relocations which in turn will cause a failure when 
grub2-mkimage is used on risc-v.

As far as I can tell, the assembler change literally just changes the 
relocation number, they are otherwise treated the same.  So I think 
grub2 can be fixed by just treating R_RISCV_CALL_PLT just like 
R_RISCV_CALL in kern/riscv/dl.c.

Nelson, can you confirm that all your assembler change did was change 
the relocation used in the resultant object?

Jeff

