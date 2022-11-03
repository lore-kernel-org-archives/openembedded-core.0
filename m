Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF312C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 17:40:14 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.1495.1667497209976467971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 10:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=omWZ9o3H;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-13bef14ea06so3008831fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eypNNpPxZie2hYWXBV36odA6zGjPqm3jrI+Hcl+2Vuk=;
        b=omWZ9o3HL8MX7ErmR6FCv0kVTNeehkZiR0P+U/tItmTJcTWp+1BSOpIzOdT7jMGAxo
         VxjdjyL3/wy9CL5u/bOLFkF1XB/EFNOeFpwD2pcy6fR1x05Mtd7cNukthHJOtOV+ktL7
         DRdmz2fuBzK1OK6tkUkav0Q7tmdm/LPU1SPTrZKLYAZYYKvrbN7sjx6uvt7cKC7yCRLE
         evdT8vh2G5RfwMY8EZUiN8NFx8rsPLGYXQC/6jFOyvJPpHF+/QcIpD7BJMOc1LsjjmQ3
         y8t9B5LNoGhIGdrhVPzMppVwRvJgCor3vzVpD4PMXoROxLX8E8rhNRnFIx4advJUiOeQ
         85iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eypNNpPxZie2hYWXBV36odA6zGjPqm3jrI+Hcl+2Vuk=;
        b=NzrdgjoyValgI0LJvLacpg0k4cGbXOatfZwh5N+ONXiqT5GiYgKFlYBy0JnAqbkVSc
         bfQsc0Y70QlCDBv0jXkGQ8WN0CeomiBDpmhbslYf4M5Dsms5I4rJ6cz3BCF52vpteyR0
         9PDbPheX8zYiXoDtD/NWFrpPDJll2y8r/lFujkumA8Pl1Zcz0SgP/wEEVkVE+MsamaOw
         IlpDQB9SZSOyNZwiBgiNwYl3kU9IWzsaq6rFi5T/7/AEBYsaqr1GPaRqeAaNIYg0ex+D
         5UEr/I+4VclAsfuuR7e1ICA/nlqv6cUOledtOuhAK4yoIDjGT1tuAVLcU4gNlUFtXPXZ
         cJug==
X-Gm-Message-State: ACrzQf36M0enVbSIJ1ejAijWMpuxGmtKt8KbEsREPBNqw8+imzySaV/g
	xKDfeLYe8JiQNUFITJGDXWk=
X-Google-Smtp-Source: AMsMyM6XzMpNqAT9m/0azjwESCwK/jvWj/1UKjyt6F+4q+OxxOuxSLIdX01u2F2nqsub5/ufqZKtzw==
X-Received: by 2002:a05:6870:15d3:b0:122:5c72:f21f with SMTP id k19-20020a05687015d300b001225c72f21fmr27810793oad.178.1667497209272;
        Thu, 03 Nov 2022 10:40:09 -0700 (PDT)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id k18-20020a056830151200b00667ff6b7e9esm578980otp.40.2022.11.03.10.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 10:40:08 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <780f2fd1-9e44-664e-eab6-189ee1e7a5fe@gmail.com>
Date: Thu, 3 Nov 2022 12:40:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [PATCH 0/1] create-spdx: default share_src for shared
 sources
Content-Language: en-US
To: Konrad WEIHMANN <kweihmann@witekio.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "steve@sakoman.com" <steve@sakoman.com>
References: <AM8P192MB09633133388817BF0814341EA3389@AM8P192MB0963.EURP192.PROD.OUTLOOK.COM>
 <164f7e3d-59f7-98c7-f75e-e67fc949f462@gmail.com>
 <AM8P192MB09632ED64CA52FB9CA30C13CA3389@AM8P192MB0963.EURP192.PROD.OUTLOOK.COM>
 <40a86fb6-07d3-5491-9202-4114cf963f4a@gmail.com>
In-Reply-To: <40a86fb6-07d3-5491-9202-4114cf963f4a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 17:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172647


On 11/3/22 11:20, Joshua Watt wrote:
>
> On 11/3/22 09:49, Konrad WEIHMANN wrote:
>> so what's the conclusion? I would be okay to add a var like 
>> SPDX_SHARED_SOURCE (default WORKDIR) or something and reference this 
>> as a default - when using a weak default ppl could override that to 
>> their needs...
>
>
> Ya, I think what you have is fine with a minor change; the limitations 
> of not handling non-kernel shared source very well isn't changing. I 
> did leave a minor comment in github, but otherwise LGTM

Per discussion on GitHub, this is fine to merge as is. Thanks

>
>
>>
>> Would that be something that would work?
>> ------------------------------------------------------------------------
>> *From:* Joshua Watt <jpewhacker@gmail.com>
>> *Sent:* Thursday, November 3, 2022 3:28 PM
>> *To:* Konrad WEIHMANN <kweihmann@witekio.com>; 
>> openembedded-core@lists.openembedded.org 
>> <openembedded-core@lists.openembedded.org>
>> *Cc:* steve@sakoman.com <steve@sakoman.com>
>> *Subject:* Re: [OE-core] [PATCH 0/1] create-spdx: default share_src 
>> for shared sources
>> I see the problem, but I'm not quite sure this is the correct solution.
>> It *does* fix the problem for exact recipe that provides the source code
>> (e.g. the llvm-sources recipe), but I don't think it will correctly pick
>> up the sources for anything that actually uses that shared source code
>> (e.g. clang); this isn't necessarily a problem in your patch however, I
>> think it's actually a problem with any non-kernel recipes.
>>
>>
>> On 11/3/22 09:15, Konrad WEIHMANN via lists.openembedded.org wrote:
>> > https://github.com/witekio-kwe/poky spdx-fix
>>
>> Witekio GmbH is registered in Frankfurt. Registered office: Am 
>> Wartfeld 7 - 61169 Friedberg. Registered company number: HRB 95432. 
>> VAT number DE287400071
>> This message contains confidential information and is intended only 
>> for the individual(s) addressed in the message. If you aren't the 
>> named addressee, you should not disseminate, distribute, or copy this 
>> e-mail.
>>
>> We continuously commit to comply with the applicable data protection 
>> laws and ensure fair and transparent processing of your personal 
>> data. Please read our privacy statement including an information 
>> notice and data protection policy for detailed information on our 
>> website.
>>

