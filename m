Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931F1C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 22:27:56 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.4515.1654122473170402779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 15:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MCWAn65h;
 spf=pass (domain: mvista.com, ip: 209.85.219.44,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-qv1-f44.google.com with SMTP id c12so2472238qvr.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 15:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=sYaXKxnLd8GRMyvgubv7zviMCcfMM1OSTMdMJTkAY0A=;
        b=MCWAn65h3iqvlpC/4dlHy/zxx+lO97AK3xam0esBBn1dm/dqG6BPPK4timcqVn0Qi1
         WtgmUQFnpC2VMsVWgGsS97TNlO/7YDGRUxXFPCwCvzxdomWZJ+BwW9aW9iuKJ3HD6Xme
         9cRX6CByqSnHPjRy3Xy5UmR5ToEwITF0UvyVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sYaXKxnLd8GRMyvgubv7zviMCcfMM1OSTMdMJTkAY0A=;
        b=bBulpKVE7kB0wssIamV/anlWcgf2m6mr0y9WXb3Y3Kp7THkcY4O4366IJGw/3ciED8
         F8uyXgpoIF1ndUuqbrplG7V9IwpzFl7dgUPmaYqRf9y0hyeZQ0AZBwdVR9VzYo2VpcOr
         afN+LQ0VBpaAXLOHvUa9utiq1M7lYmWxlxWgtTsHmiM7DPSx48UozSTJZiU8UBRfV2dT
         K+jZCzu3vh+VBOSvjhBdtzM4uHICaKws4iTzZfeFrxeKI2TfGFCrbpSzy19W/wQJ2haC
         sLLA8wh5DfLpGmx1G3kk4UUhUe32EQ6+e5Yhj2VWkxQ1VY6eY1VnLXLRBTuaqS8V9Z0J
         B6qg==
X-Gm-Message-State: AOAM533ekpOdDjErW6z/KYpcYxBOjCAnh7jxtMQHwcZC7Z2ec4khYTWP
	MU5LAdnLOjB16ASpkvvG/+d97w==
X-Google-Smtp-Source: 
 ABdhPJyvxDCe/+hhwT5jhZwHAvFRv7xtyJO3wxuIIDZWBnxuwdG7EtBfICFFF7naINcTnTZ9WBeQQw==
X-Received: by 2002:a05:6214:27eb:b0:45a:b022:c97d with SMTP id
 jt11-20020a05621427eb00b0045ab022c97dmr56450758qvb.24.1654122472206;
        Wed, 01 Jun 2022 15:27:52 -0700 (PDT)
Received: from [192.168.1.34] (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a37bf02000000b0069fc13ce24asm2002752qkf.123.2022.06.01.15.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 15:27:51 -0700 (PDT)
Message-ID: <b282c6d5-454c-43ed-e9b2-3737a8120558@mvista.com>
Date: Wed, 1 Jun 2022 15:27:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [OE-core] [kirkstone][PATCH] gcc: depend on zstd-native
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220601205504.3464879-1-jpuhlman@mvista.com>
 <17046dccfb415c1afa9851ab45b90fe04114798a.camel@linuxfoundation.org>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: 
 <17046dccfb415c1afa9851ab45b90fe04114798a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 22:27:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166444



On 6/1/2022 3:15 PM, Richard Purdie wrote:
> On Wed, 2022-06-01 at 16:55 -0400, Jeremy Puhlman wrote:
>> Sharing sstate cache binaries between two systems, one with libzstd installed
>> and the other without, leads to various gcc components being linked against
>> the system libzstd and failing to run on the system with out it installed.
>>
>> Make zstd-native from our system available.
>>
>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-11.2.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
>> index 68e0d203fc..e2a28468f5 100644
>> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
>> @@ -11,7 +11,7 @@ BINV = "11.2.0"
>>   FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
>>   
>>   DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
>> -NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
>> +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
>>   
>>   LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> Does master have that issue?
>
> Cheers,
>
> Richard

I would would be really surprised if it didn't, since it appears gcc is 
explicilty decidding to use the library if it is there. The patch 
cherry-picks with
name fuzzing so if we want to start it there, I can resubmit on master.

