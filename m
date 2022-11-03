Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EDEC43219
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 12:35:02 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.18633.1667478901345643531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 05:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=t8bOnD6D;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id y14so4767478ejd.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rs2hO31gRcoInnKFVM9BbTpV6iykNWuFZEE3xR+bvwU=;
        b=t8bOnD6D/vAKBIP2Fq3RYLxRISg77e9LKVi7H0JIopvcbPuSw4m1jEzhrN5YplEnDj
         7R3oGfCj8uKN9i6gJAC6vjoME456Axj3j8X0dSWjwIk+6w8QG3Dc9AaQb81cuAhde2ZU
         hodaVGj4j0moe4NhaMdykf7QHqAk12PLwvufA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rs2hO31gRcoInnKFVM9BbTpV6iykNWuFZEE3xR+bvwU=;
        b=7/UxvbuagkwboyMlLM8VjGr4LZMiZBiOtIkm5BCFXIrGYpZHZ14oiJvadQgZToaD+d
         Ndb+LiSJhFcj0x+6zeFWi1eUPpk3VUX09thABWU6ZcY8lQJQVcY0qL/ena4M60IFKGvn
         iz1kdNk1UDT4m9O4R7VU13YahinxqHZgoadwBfmu+zWBkn89NtMNod0um8vtJOS+uYvy
         BZVg1ReL9S5Bodx5GsNWo2UA5br+iHQuWBe0WgSSudRRDdIvtLnQYuhoBCeBrHHSRAhX
         TNkYksyoZrcnQtfbfz3I1SVriwqEXYZ0Vhl/ql/CJwMb4FtQ4XQN3m09iy0JZpBKOBo1
         dtEA==
X-Gm-Message-State: ACrzQf2LH9VGkrGYzCrb+NUFBzUeI73ujI07T6rJ6RNkaeHN9NSRapb7
	3mEsFQUPcQuDmj3OXZLcAfpYgQ==
X-Google-Smtp-Source: AMsMyM4ZihdUN6H4gjhaYZZMNvBk2jfrGuAq31kXalSEtISsyYYWDjFQ7my5nTh85BNoS4X3T/69/w==
X-Received: by 2002:a17:907:7fa5:b0:791:9a5f:101a with SMTP id qk37-20020a1709077fa500b007919a5f101amr28877845ejc.453.1667478899683;
        Thu, 03 Nov 2022 05:34:59 -0700 (PDT)
Received: from [192.168.5.100] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a13-20020a17090680cd00b00787a6adab7csm442594ejx.147.2022.11.03.05.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 05:34:59 -0700 (PDT)
Message-ID: <127f2641-6624-2ffa-070f-ce874e54f6fa@konsulko.com>
Date: Thu, 3 Nov 2022 14:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [PATCHv2] python3-manifest.json: Fix re in core
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 openembedded-core@lists.openembedded.org
References: <20221102190935.1700103-1-leon.anavi@konsulko.com>
 <ac210bf3-ebcb-7dcf-1d41-f3e35aa3b532@theobroma-systems.com>
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <ac210bf3-ebcb-7dcf-1d41-f3e35aa3b532@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 12:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172625

Hi Quentin,

On 3.11.22 г. 11:39 ч., Quentin Schulz wrote:
> Hi Leon,
>
> On 11/2/22 20:09, Leon Anavi wrote:
>> Following the update from 3.10.6 to 3.11.0, the source code of
>> module re for regular expression operations has been moved to
>> Lib/re/. File python3-manifest.json has been modified according
>> to the new path.
>>
>
> I guess the changes are more than just about re module in v2? In that 
> case the commit title and log should be changed to mention what the 
> commit is now doing?
Thank you for the feedback. You are right. I ran bitbake python3 -c 
create_manifest and it also updated other files and rdepends in the 
manifest. I've submitted v3 of the patch with explanation in the git 
commit message.

Thanks,
Leon
>
> Cheers,
> Quentin

-- 
Leon Anavi
Software Engineer
konsulko.com


