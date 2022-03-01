Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB01C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 14:13:15 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.8480.1646143994522309528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 06:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M4vVUp5l;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id bd1so13499071plb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 06:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=c+1S19RB7itzHDb8lPjkZSEHCJaRq3Vs2NhuC35+mzE=;
        b=M4vVUp5lTDda6sYfmXGXURrSijGMo8TPmVrXGYL97Ac4ReqZJdSb+0G3G/7P7PTPCl
         wYf7FHrfa7E5w0awQZIOQe2yVQ2xGnnNjDis7q9c0XgN7rOjmp6/mm0sjTdUxq2wdEvu
         dYNUtI1LFFO+36m7SZdJxtSF+viC2sMNLYhqIJ+v3AngzB2Di8/YM44zG3uVBWa2kdHX
         hx7fZhk5UETak/UPn+VRH17OOmnpu2WdmBAH98neCBLT4LHMLh12p8gB8MMGPkc0DT0n
         ELOLDCQOIuVLTfjuo/U1uQjGdKov0LuRiB4p9KO9/ZFpVUf/a2IpOEy9q8VPq3jpUrKx
         bCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c+1S19RB7itzHDb8lPjkZSEHCJaRq3Vs2NhuC35+mzE=;
        b=gwudc7aPpHBqqv4ERWYWasurX0SbyU+fDvUu0l3YPnStyT6cCclC41Mm4pYhZsVWJg
         q7kSgVmy0RUEQ724rjwfPNo8LyZ5TE9p5RH2ZlDZojLVtTXO2tnT0RGT4227BnVq0TBe
         kbIFkABW/g63z7oURVjmHP4BWe21jpXXGXcQ9ic6uo15lwwOYal2Jhiv7uqGM1lYIVsN
         oqGJkS7TxPhva4/WjuzrtagAJoWRxDxwy7TxgEGIbmX8xkVy2mow3Zn2DlyqeJTR83PG
         NW7LN1hL73ffZlkLKR8vQjzYKDIIoEVvh0TMSOxWLmOqMVUn7FF+eDmvRpYyTbRBQgq5
         vJUw==
X-Gm-Message-State: AOAM53212X3LtLE9ROxDfTcurVIn1Kad9ENB//C9Wsizeevnbr4A4IxS
	BcnqFVhQ3RFrAYqiXZutQNoDAmK2AZQ=
X-Google-Smtp-Source: 
 ABdhPJyEW49Ma3IoRmpMMcx+WTeaPpYKEOTd/zEs3liLu4sKcKIV5JvwPGTq6VSEpZ3dnAGofBXK6g==
X-Received: by 2002:a17:90a:ce87:b0:1bc:e78f:993e with SMTP id
 g7-20020a17090ace8700b001bce78f993emr21877384pju.41.1646143993754;
        Tue, 01 Mar 2022 06:13:13 -0800 (PST)
Received: from ?IPV6:2601:202:4180:a5c0:e318:f2cc:acb5:a058?
 ([2601:202:4180:a5c0:e318:f2cc:acb5:a058])
        by smtp.gmail.com with ESMTPSA id
 kb6-20020a17090ae7c600b001bee8664d82sm988440pjb.35.2022.03.01.06.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 06:13:13 -0800 (PST)
Message-ID: <1cf08e1b-a113-af04-fa1a-7056aef5f711@gmail.com>
Date: Tue, 1 Mar 2022 06:13:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [qa-build-notification] [yocto] QA notification for completed
 autobuilder build (yocto-3.3.5.rc1)
Content-Language: en-US
To: qa-build-notification@lists.yoctoproject.org,
 yocto@lists.yoctoproject.org,
 OE-core <openembedded-core@lists.openembedded.org>
References: 
 <3060b5d3e361823a872bf956f6d09ef816d6857c.camel@linuxfoundation.org>
 <DM5PR1101MB2348B0D3AA38CFD2B77E4F89BB019@DM5PR1101MB2348.namprd11.prod.outlook.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: 
 <DM5PR1101MB2348B0D3AA38CFD2B77E4F89BB019@DM5PR1101MB2348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 14:13:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162556



On 2/28/22 11:44, Teoh, Jay Shen wrote:
> Hi Everyone,
>
> This is the full report for yocto-3.3.5.rc1:
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
>
> ======= Summary ========
> No high milestone defects.
>
> No new issue found.

As a YP TSC member, I am fine releasing this build.

I will let Richard send the final word once the rest of the YP TSC respond.

- Armin

>
>
> Thanks,
> Jay
>> -----Original Message-----
>> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
>> Behalf Of Richard Purdie
>> Sent: Tuesday, 22 February, 2022 5:51 PM
>> To: <yocto@lists.yoctoproject.org> <yocto@lists.yoctoproject.org>
>> Cc: qa-build-notification <qa-build-notification@lists.yoctoproject.org>
>> Subject: [yocto] QA notification for completed autobuilder build (yocto-
>> 3.3.5.rc1)
>>
>> A build flagged for QA (yocto-3.3.5.rc1) was completed on the autobuilder
>> and is available at:
>>
>>
>>      https://autobuilder.yocto.io/pub/releases/yocto-3.3.5.rc1
>>
>>
>> Build hash information:
>>
>> bitbake: aaa7f7af23d5f89fe4a5ed48c57ea3dfca07c79d
>> meta-agl: 9a50bd62dfac0d6ea1320b2ee083529cb98b9f92
>> meta-arm: fe35ff5ba809bf4826adfe65899a84e9c99494e8
>> meta-aws: 6801abf40bb255a31bce5061c5c6b72f5e2a8f58
>> meta-gplv2: 9e119f333cc8f53bd3cf64326f826dbc6ce3db0f
>> meta-intel: 36e915402dfe317654568f09f18fb6f7653603bc
>> meta-mingw: 422b96cb2b6116442be1f40dfb5bd77447d1219e
>> meta-openembedded: 23598caeafce0af0dde8d1339cf5edff021f6823
>> oecore: 29cd1d796057ef5599fe17c39b42aa099f7b1c29
>> poky: 8d3e054f6d432b5ca0fcd613e0c767fab3c85f24
>>
>>
>>
>> This is an automated message from the Yocto Project Autobuilder
>> Git: git://git.yoctoproject.org/yocto-autobuilder2
>> Email: richard.purdie@linuxfoundation.org
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105): https://lists.yoctoproject.org/g/qa-build-notification/message/105
> Mute This Topic: https://lists.yoctoproject.org/mt/89459365/3616698
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/8918815/3616698/368265748/xyzzy [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>


