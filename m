Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397EBC433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 13:42:59 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web09.84565.1657028573443671920
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TKCuF1bV;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id i11so13663323qtr.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kvtNT7PZcWuAT3BB5sSYLb382YZdx4fmtw23KHklhG8=;
        b=TKCuF1bVYZ+yYtOMM2fLVyhg44HGabf+Ha+MsABuLe/w09mUei5k4qlLSL5hSfocpR
         BpHOZ4kXhQKa9n4t7RUyPtWLiMEjQPGSNC8RWIo96juQAGCgH9QOrWPQQn1gucO5GeGg
         /L0gRuyrToK8tjWYG1XuH1Bx7R2+W01Nqw84UWOSCSXpUei6ZeBOAwOqaZ3h+4LP4wGP
         yWOZNNacLA6kGq2dEq8mVr6Vf+qHupD2bxfQlOalTUIVmH1Yq0hVrKhzICMPWvB9PxKN
         AECfqdCUV34voI+7USCWYamLPWniI9fGD+IMWYdZ96dSMZEsuicZEsmRC1jFjiK2QcSH
         ycHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kvtNT7PZcWuAT3BB5sSYLb382YZdx4fmtw23KHklhG8=;
        b=TtGPe+vxmUmNcHr5NVectOgd+SYzFME5OnxDWECKKXCIuoRBhHKcgVAkJWvzIvtPqA
         Bh1G0itdWG/1tIdje89rSI+RBL/b6AADBn975k4ecB0vCGWAZyNIwv8zosswo4dS9tEN
         tL9twerlweDPlEboU1Ys+VsAMbbKIDzgX1BiLcCcDM4j2TkZrddEyfCNWWDGzo0xYwb2
         W2BA+ZJJL8jmd5ZO2knQsjT1Di1k3jScQnsvlVggsMyyAd2Ogj+QkVKrDt0z2YKqq7rb
         +z/hu06nu+bB8E8Yx62oI7+yl0lzM/F+/KIFlKXmwENERAb//B0YwC4tWyXQcFPlsE8l
         MPvg==
X-Gm-Message-State: AJIora87900sDCQA91mu8Gavk2MkBgC2MamOGnbyMDcwOX7QP8M77kDa
	IU0HaGWsJyz8QeZ154OuCpw=
X-Google-Smtp-Source: 
 AGRyM1upUB12jF1hDRf1VQYK5UAQf1IlyY0Aqcv8qkujaObzhNpOsgqBcks1vWWxc6RGNz7ycwCnLA==
X-Received: by 2002:a05:6214:27ea:b0:470:7042:3901 with SMTP id
 jt10-20020a05621427ea00b0047070423901mr32544703qvb.69.1657028572409;
        Tue, 05 Jul 2022 06:42:52 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:959d:d09a:db6c:637c?
 ([2607:fea8:95df:9730:959d:d09a:db6c:637c])
        by smtp.gmail.com with ESMTPSA id
 bp10-20020a05622a1b8a00b0031d4044c464sm7012952qtb.46.2022.07.05.06.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 06:42:51 -0700 (PDT)
Message-ID: <d3e30820-335c-0069-cd74-104210d969ee@gmail.com>
Date: Tue, 5 Jul 2022 09:42:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0
Subject: Re: [OE-core] [kirkstone] Binutils, Glibc: Updated with latest
 commits
Content-Language: en-US
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
 'Richard Purdie' <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20220704071832.3400931-1-sundeep.kokkonda@gmail.com>
 <26024.1656921064972068793@lists.openembedded.org>
 <9e541f91d002db8ef50b187ea8a6ad470e6dc49a.camel@linuxfoundation.org>
 <002101d89058$89ef9010$9dceb030$@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <002101d89058$89ef9010$9dceb030$@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 13:42:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167656


On 7/5/22 6:18 AM, Sundeep KOKKONDA wrote:
> Hello Richard,
>
>> -----Original Message-----
>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Sent: 04 July 2022 14:20
>> To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>; openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [OE-core] [kirkstone] Binutils, Glibc: Updated with latest commits
>>
>> On Mon, 2022-07-04 at 00:51 -0700, Sundeep KOKKONDA wrote:
>>> The regression test for Binutils and Glibc is performed.
>>>
>>> 1) Binutils test shows no regression after update.
>>>
>>> 2) Glibc test result:
>>> Test summary before glibc update on Kirkstone:
>>>      204 FAIL
>>>     4320 PASS
>>>       43 UNSUPPORTED
>>>       12 XFAIL
>>>        6 XPASS
>>>
>>> Test summary after glibc update on Kirkstone:
>>>      204 FAIL
>>>     4339 PASS
>>>       41 UNSUPPORTED
>>>       12 XFAIL
>>>        6 XPASS
>>>
>>> Test results analysis:
>>> Total 4585 test cases before Glibc update & Total 4602 test cases
>>> after Glibc update.
>>> 17 new test cases added (out of those 16 PASS & 1 FAIL)
>>> 12 new FAIL test cases after glibc update
>>> 14 new PASS test cases after glibc update
>> Do we know why some of the failing test cass now pass and why some of the
>> passing test cases now fail? Is this some issue with the way we're testing things?
>> I'm wondering if this is "normal" noise between test runs and if there is some
>> underlying instability or glibc changes do cause changes in pass/fails of tests like
>> this in general?
>
> Hello Richard,
>
> The test results are impacted by Execution procedure OR by Changes in glibc.
>
> Execution procedure:
> I tested the glibc with the cross-compiler method given in https://sourceware.org/glibc/wiki/Testing/Testsuite for the aarch64 architecture on qemu.
> However, based on our past test experience, we're following a few additional steps like copying the 'glibc-locale/2.28-r0/image/usr/*' to booted qemu image /usr/ directory (This step is not mentioned the glibc wiki) etc.
> Also, the glibc test is aborted when the -Werror=format-security flag is used and to get the test done we've removed this error flag and compiled glibc sources.
>
> Since the glibc test not performed very frequently, I am not sure the additional steps what we followed are obsolete or not. I am now working on adhering to the test procedure mentioned in the glibc test wiki and will see the results.

Perhaps run few iterations on unmodified setup and see if the results 
vary. If they do then we know that there are some jitter to look into. 
otherwise, its perhaps a combination of updates which would also be good 
to know. Failing one's are more important to look into as they may cause 
unwanted regressions.

> Changes in glibc:
> To comment on the code change impact on the test failures I've to look into each failed test case by case and what are the changes in glibc and how it is impacting the test.
>
>
> I'll keep you posted on this and since the glibc test execution is taking a lot of time my response may be delayed.
>
>
>
> Thanks,
> Sundeep K.
>
>
>> Cheers,
>>
>> Richard
>>
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167648): https://lists.openembedded.org/g/openembedded-core/message/167648
> Mute This Topic: https://lists.openembedded.org/mt/92160650/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

