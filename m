Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EDCC77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 10:00:27 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.4238.1681984819532966630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 03:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@konsulko.com header.s=google header.b=FS1PcIFH;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id dx24so4956390ejb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1681984818; x=1684576818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BlKSsYRIQePxwGVas0LiJpfhikC0squBkHIn8C7YRzE=;
        b=FS1PcIFHOMrMpNW/tRAxyNlocEDHum70yxizwJhJsf9aFP4Y5DcDkcUL/z1Yrsbi1A
         OT+onuGpKBOoZQQCquHHjl2OpC/qoqOHgDgniQlevrw+EZIKn34wnp9Zfhi3a83jVbE/
         k71jYfVg7vOavMD6afsO6e/Es8deKaxNUvRao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681984818; x=1684576818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlKSsYRIQePxwGVas0LiJpfhikC0squBkHIn8C7YRzE=;
        b=k9qkJ/Hcwk2zF1Dfq0DFBkavLWMZca4nzax6BjQOaI/PjXcqRGiWlyJhi9tTPfB4Nh
         kYyE5cSUvJwTgjqHnNW2q7qClmukB9h6sBCI2qi42Q9ENeS/J2kMt9sSqb11pbYLXLFW
         +dPg9+V/hXwFfLywoW9brqqznHc/XCTMlH9AKpDSqP1cjBrUbNiCmhBWomVpTIo1n4Aa
         7idQKg6SJptLMIxnKnVoXgrJdivHgTLPi/9B0d2aB0zhJgeXelyCvmNSSBXq+qhdAFcH
         jVDpGQJwIu+54Czx2b/mysbQptUsvJC99tvqWsJFTimqcl+Yey9vHnD8Rv3azpSA3kOU
         ZzVQ==
X-Gm-Message-State: AAQBX9dS72o3eMAJvgbiKrMfqN3HTHs2xAES5Bke5BVTjlzz023hEQbr
	nP8cBqji9+ddEHoyPr/VCtTA5Q==
X-Google-Smtp-Source: AKy350bugISqUZaifr8ay1vcbHjatIwueLMGRTUQRrwnY0Z4rEf4+f4aM7J+4KuZvyY/tjmPUfKOXw==
X-Received: by 2002:a17:906:716:b0:94d:57d2:7632 with SMTP id y22-20020a170906071600b0094d57d27632mr982245ejb.31.1681984817563;
        Thu, 20 Apr 2023 03:00:17 -0700 (PDT)
Received: from [192.168.5.249] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id k18-20020a1709060cb200b0094ed72b6552sm544671ejh.98.2023.04.20.03.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:00:17 -0700 (PDT)
Message-ID: <8a4872eb-076d-2807-add3-fe7b68de03a8@konsulko.com>
Date: Thu, 20 Apr 2023 13:00:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCHv3] python3-manifest.json: Fix re in core
Content-Language: en-US
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: openembedded-core@lists.openembedded.org
References: <20221103122755.3818894-1-leon.anavi@konsulko.com>
 <2427094.jE0xQCEvom@linc>
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <2427094.jE0xQCEvom@linc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 10:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180247

Hi Paul,

On 20.04.23 г. 7:59 ч., Paul Eggleton wrote:
> Hi Leon
>
> On Friday, 4 November 2022 01:27:55 NZST Leon Anavi wrote:
>> Following the update from 3.10.6 to 3.11.0, the source code of
>> module re for regular expression operations has been moved to
>> Lib/re/. File python3-manifest.json has been modified according
>> to the new path.
>>
>> According to the instructions the new python3-manifest.json
>> version was created by running bitbake python3 -c create_manifest.
>> Because of this it also updated other files and rdepends in it.
> Maybe you're already aware, but just in case not, this patch appears to have
> effectively undone the change you made earlier ("Move urllib to netclient"):
>
>    https://git.openembedded.org/openembedded-core/commit/?id=e74ab2c144042b0a9f788b1b15f11b2800e2c7a1
Thank you for pointing this out. Sorry, I have been quite busy for 
several months and I didn't have the time to follow up with the upstream 
of meta-python recently. I vaguely remember these patches so I am not 
sure about the current state of urllib to netclient. I think it still 
makes sense to have urllib in netclient.

Best regards, Leon

> Cheers
> Paul
>
>
-- 
Leon Anavi
Software Engineer
konsulko.com


