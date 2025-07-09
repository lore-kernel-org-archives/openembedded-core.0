Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD88C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 16:26:35 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.1366.1752078389243029100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 09:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NvEpSwae;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747fba9f962so177933b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 09:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752078389; x=1752683189; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qh5t4iP7b6eh7dTj6FNZhQMHQL5IaVaWEDwez71bdI4=;
        b=NvEpSwaehayMjwl8AKCewaz4quS8eWfNUCcIpHLuzBcY+7hdidJ2iAbo0H9a9e8bk4
         AT/AIECwX19uqY11lqDTjLiDYWbeR01jyhWvjcMR23SI7PhhqDiC7lME+s12HgJUWe3o
         9n4mHHlWS32ZpVZUjD5gopFR72RAdglYHDGdqMSEctGVJg7dec64nB9iHWNQwWRRKAqq
         mxax/bCi3ZGLcQpmr+Lhpl2LFHFvzObRdbg6Agp0YlPKScv452LgPAAS2SoS+sgrq/ba
         dyNBngEooC1thyW7mVraoWk+yhtgLwelqTljEN9zAs2gdXLY5p4L1g5zDqUTN95h3OOT
         4XpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752078389; x=1752683189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh5t4iP7b6eh7dTj6FNZhQMHQL5IaVaWEDwez71bdI4=;
        b=d1Rk66jJuZz0VuEScxHek/qIvYzue2LL5MAntkRzW1vguC5bmCs9jn2Ljr/glfPfd8
         ybMrYQTz4Lf8cMWidV/eM08r4ID6qd6CgYEn44Wtoz2ea1DR6WE0kf2PLt9dzqqo95rY
         AqrdC5Xm86plI546CPbvsC7bi1z+dZPc2YUFyYmP4nvrcW9YdX4YebRxOMmPiRrvnQOn
         qnkAw9owG5fxeyaKrC0CZUdDRVh5vEMel1nMS9IEEo3dgu2YbVMHYBqTjSjzTD8eV8T8
         UhZdy6ymMcbSnrsL2o3oe2EeixHaO9TLJRcEsl4NDAqxjAu5aEcVmthATm1k5asLfPnB
         x+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1vdgjjo9W4SORdT27je9kFt/sAbM2omzxXzmn6p00jOhrYpc6XlPQazJSTojW9/Gm+dbWbm9jMr9vGWzSfA73hA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHJGIDOgZrUx2B0hmp3vU6uXXB+pyxrCKQVQkQiNACuH2yhyMf
	R21qjMliUtX7NqtVxG2POzdy7YImQZq5cOOjvJ2kRUwHeSUFpDEY+eKMT9NblYHr
X-Gm-Gg: ASbGncskZLcRG001qENI576BeGIzuMoWWXUhKAEQO9n/PqfOTFnHGoq4gVZnM0/8t0h
	o+vt/W8KoNzXHxQ2rLDXmG/QyOk8AUnXSbyj9CX+8DvwIX2NPu44Fv3ZQ3YBep0eHHH4+H8byss
	IowpGL+PazLos13JSYSCbBCn8ND45nJhGw3iNo6VR9Ugaf5dmh9FYe42HQbtHKPy8qfwJ/Eq+VJ
	H9jXO5yGJFsle5+ILsNDc0asKjfEOnByj2iqaKtGeNAcGKEu2FZzifNHu06FW92BN6aUiXSCufv
	BtY+jSfbexzjIUzNmggZ7/QH2wbFhDgyxP7roa3yaItUNCzF2iawUjVEaWiwEAAIgSZ+R4ZEf1Y
	D7jgAPyEZ+nkyq+Y2ypqnhsJQAQnLw10gg9Y+yUEV0ujm3zaL1Q==
X-Google-Smtp-Source: AGHT+IHETvBHwbRLT3qt/tPP5OC5CzJlF1wnUbDpBKuK9/6W/fp08XgkfJrIk5ewI/8l6gaainf9eQ==
X-Received: by 2002:a05:6a00:3d47:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-74eb5895454mr117032b3a.2.1752078388385;
        Wed, 09 Jul 2025 09:26:28 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:d1b7:aad6:2c95:a1d8? ([2601:646:8201:fd20:d1b7:aad6:2c95:a1d8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417dd9asm15610317b3a.72.2025.07.09.09.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 09:26:27 -0700 (PDT)
Message-ID: <704306bd-c01b-4120-9a79-38390403fea8@gmail.com>
Date: Wed, 9 Jul 2025 09:26:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 0/6] ISA based RISC-V tune implementation
To: richard.purdie@linuxfoundation.org, mark.hatle@kernel.crashing.org,
 openembedded-core@lists.openembedded.org
References: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
 <34c254bbc44e6940138e9c49f9f58980dfe99aa2.camel@linuxfoundation.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <34c254bbc44e6940138e9c49f9f58980dfe99aa2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 16:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220104



On 7/9/25 12:42 AM, Richard Purdie via lists.openembedded.org wrote:
> Hi Mark,
> 
> On Wed, 2025-07-02 at 16:44 -0500, Mark Hatle via lists.openembedded.org wrote:
>> From: Mark Hatle <mark.hatle@amd.com>
>>
>> The following implements the risc-v processor tune based on the ISA approach
>> as documented in the oe-architecture post:
>>
>> https://lists.openembedded.org/g/openembedded-architecture/message/2155
>>
>> This set also attempts to make u-boot and kernel configurations dynamic
>> based on the TUNE_FEATURES.
>>
>> For the linux-yocto, I suspect that the config fragments should be
>> sent to the kmeta (kernel-cache), but I'd like a review from Bruce and
>> others before I do this.
>>
>> Additionally, this enables a new (optional) features_check for TUNE_FEATURES.
>>
>> I've found numerous items in the system have certain RISC-V ISA expectations
>> that may need to be addressed over time, however the obvious one is the
>> Linux kernel requires ima_zicsr_zifencei.  Since it has it's own -march=
>> setting this will ensure the processor defintion will be compatible.
>>
>> Also dynamically configure the QEMU cpu based on the tune_features.  This
>> is nice to ensure that what we're actually building should be able to run
>> on real hardware.  However, it does highlight some of the (extension)
>> limitations in the current design.  (limitations as in extension not yet
>> enabled.)
>>
>> Note: OpenSBI _requires_ the 'c' extension or it will not execute.  I
>> suspect this can be fixed, but it's beyond my capabilities at this time.
> 
> I've narrowed it down to something in these patches which causes these
> ptest failures on qemuriscv64:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/187
> 
> We need to track down and fix those regressions before this can merge.
> 

I think the extension selection should match the base platform spec for
rvb23 profile for default qemu machine, perhaps something regressed 
there with Mark's extension based construction of default tunes.

> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220078): https://lists.openembedded.org/g/openembedded-core/message/220078
> Mute This Topic: https://lists.openembedded.org/mt/113956552/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


