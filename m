Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA2BC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 14:50:15 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.6429.1657205411368096878
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 07:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gcT3xBmi;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id v16so15231784wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=8eenwE+lEXt9L3Y9UmvCPVXf22O6ZOLb+9a3tuErSM4=;
        b=gcT3xBmiWHPnJ9fObEEG0JX5GYGUMBbm1+tAun7SLbg0w/uG/YzHhTDEkPxHuR0kad
         92o4Q7fAfI2byeTNkfMYVdsvQm5j7BUMoPtIr0+bGk9P/QKvPPHzihYTzPnevsS+rMBa
         HSbrGydvjcY2CUPyCT6kAY4KWQc9e/M9FnCtjgLEktOqNXWQ+gGcFGuDC2YIQRAxUKDX
         pu+WqIfx5/lxTHw4Lyoafa/D3gP8fgUXeN9r/Z3Ip1qHXk4Tl5s637mj6cbwTEk8C3Rl
         hUiHUDwwyWBVyLhrqwbyfWSZXSB2lgo3j1SemaY9J784y4hychBs9JAddGemqaqO2k+m
         SAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8eenwE+lEXt9L3Y9UmvCPVXf22O6ZOLb+9a3tuErSM4=;
        b=bewjwJMlYo5XjGow+dJCw0qqczWLVjBOhHBKUS3t/hnKEM3bfcJHcbVJOfCPqeyUkk
         EjDXa7MvCnOOdbfexdBQKGfha3CNzdMTVDCLRWF4/G5EjwD0KO5OJe6v4OvoRyh6t9NR
         RE229fyqt8mF43ZkhPtxYDs5AwqkpK8XEW2IoJDqRTLJGnzDPdN5V1wCUdV7DW5pNTM/
         gbgwiWwgop8xrWeAtMgXG9Ef1M2BAG8fFcNQwjFgS9ZTzYlX0MfmEPEZsJV1EUKFXlKC
         Jj2ODkp9y9ErWuIWYAME5GvTSo/gPlbmt98k5VJWH4FZaf7KkZNRIm9FVOdu2j/zj3K7
         ci6Q==
X-Gm-Message-State: AJIora+y+aJu57C3C4gxCL4SG687dtVy8D4IPod++pHggsnZR2Wtz4Sn
	cKCgA0/DLqbNCzdz9Udh2A==
X-Google-Smtp-Source: 
 AGRyM1sU5sH12n34xMlnVtcWwLNUBvSjhSk+AQv4noqPLYAECuxgHUJrjM3EldpDeRm6+kE2ZBCmoQ==
X-Received: by 2002:a05:6000:1549:b0:21b:c7fb:9dd0 with SMTP id
 9-20020a056000154900b0021bc7fb9dd0mr41019246wry.446.1657205409699;
        Thu, 07 Jul 2022 07:50:09 -0700 (PDT)
Received: from [192.168.1.10] (83.11.75.211.ipv4.supernova.orange.pl.
 [83.11.75.211])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a0560001acd00b0021d78b570dfsm7567529wry.108.2022.07.07.07.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:50:09 -0700 (PDT)
Message-ID: <3720b151-5f66-30ef-2dd5-b07c35b0c960@gmail.com>
Date: Thu, 7 Jul 2022 16:50:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 2/3] oeqa/sysroot.py: Check bitbake return
 status
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220703114114.2313369-1-ptsneves@gmail.com>
 <20220703114114.2313369-2-ptsneves@gmail.com>
 <69be22a57b1786c0e8a86a64fea2717a2fc73868.camel@linuxfoundation.org>
 <8e071b38-0ec1-c5ab-a14f-776ec826d5d4@gmail.com>
 <d3756ea92c2bbcd4e32e405784b69ed1a79ed5d9.camel@linuxfoundation.org>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: 
 <d3756ea92c2bbcd4e32e405784b69ed1a79ed5d9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 14:50:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167785

After re-thinking this is the correct version of the patch. We need to 
ignore_status because we are asserting that it actually fails. Otherwise 
the bitbake() will fail the test on the desired failure.

Paulo Neves

On 7/4/22 16:30, Richard Purdie wrote:
> On Mon, 2022-07-04 at 16:28 +0200, Paulo Neves wrote:
>> On 7/4/22 16:16, Richard Purdie wrote:
>>> On Sun, 2022-07-03 at 13:41 +0200, Paulo Neves wrote:
>>>> bitbake ran but we incorrectly did not assert the exit status needs to
>>>> be non 0. Now all sysroot tests commands expected to fail are verified
>>>> to do so.
>>>>
>>>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>>>> ---
>>>>    meta/lib/oeqa/selftest/cases/sysroot.py | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
>>>> index 588fc8c713..294ba4a4a0 100644
>>>> --- a/meta/lib/oeqa/selftest/cases/sysroot.py
>>>> +++ b/meta/lib/oeqa/selftest/cases/sysroot.py
>>>> @@ -45,6 +45,7 @@ TESTSTRING:pn-sysroot-test-arch2 = "%s"
>>>>            expected = "maximum shebang size exceeded, the maximum size is 128. [shebang-size]"
>>>>            res = bitbake("sysroot-shebang-test-native -c populate_sysroot", ignore_status=True)
>>>>            self.assertTrue(expected in res.output, msg=res.output)
>>>> +        self.assertTrue(res.status != 0)
>>>>    
>>>>        def test_sysroot_la(self):
>>>>            """
>>> I did have a question on this patch. Wouldn't it be simpler to remove
>>> the "ignore_status=True" from the bitbake() call?
>>>
>>> Cheers,
>>>
>>> Richard
>> You are right. I guess the assert is more explicit and with the removal
>> of the ignore_status it becomes implicit. Let me know if you want me to
>> remove the assert and the ignore status and will submit a v2.
> Please, I think that would be cleaner.
>
> Cheers,
>
> Richard


