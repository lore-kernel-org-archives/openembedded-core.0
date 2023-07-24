Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8FEC0015E
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 13:49:11 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.46868.1690206546200489357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 06:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XICTAvzI;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: zboszor@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9352ff1aeso63280791fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690206544; x=1690811344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8G46Ma3IluZLEvnh4HAAWJiLgztQ+pPWwAVw9vNmXA=;
        b=XICTAvzIIKF2TAKeeMltn8xtsFVcUlqigFme8YCTjRxPYFUMz7hbZcQB9C0HzEEUqe
         K6l9inailZQCHlIeMoa4z5VdTAokVglKcXpDsbuMsD4SKi3R6fHyT3MxmG6jVdWqk9Hl
         D95nW1p8qta0FP9m37sMdU7zLIACtb5VE1aOhgtbdRxHOH35wE59PIqc1IDbywE/ZxWS
         7u/YZcgx9AWBmbWW0EXZ7g2FFqi+RzwO87PV+BltwBC83tT4hOSn+FUAm5xw7q0rU/4O
         7ahOGKBqB4xpbFftEQ+jnNP8bM/ZoigDXqLVKkm6EoRcjq051Sq7GypgT/x2umUCiZrL
         vm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690206544; x=1690811344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8G46Ma3IluZLEvnh4HAAWJiLgztQ+pPWwAVw9vNmXA=;
        b=RL+Pd2z+++tKe4sE9867ShtEvm9EcoovApzZEzxl80nIjvswjXutV9gXXQjQU20fCP
         XUXvFeojnjd5QP+p5V5nVVmthV1+XKqQJoPDqe+g/2fzOMylJCgETqMWogLE8qimVgfk
         kydC89/tH6DTyW2O+eL9HZ3o7lYt28rMy+A99rEAzbHta7Mm/EtN5EshG8TebPK8pBHO
         A2uYSsPSMd/xlIh+ZL7T3lJ5k5CUqE/KmdtRGGE12JX6r+hz4Azy/z0VvTnJ0G1T1mQP
         Iru41zcBhY9bfOxk6FRulejASQ7WEFgnoG5ZsEUmNwfa8F0Ab+1M/CS0x+J5Gsj08zjR
         jxsQ==
X-Gm-Message-State: ABy/qLaYy4NoQ/cVixPjPrG84FGrMLA9jTa0mv0WW6MSHqgRloHqxAp8
	5xgSTe5b3vABr1gPf9fhF2HA30bGpLc6AQ==
X-Google-Smtp-Source: APBJJlHImNMgPFUTv5g++RSXnYVqOecfALNrIlP+gQkQ8NC3poKWOK46UR+l8mSJaxGmvu9kHt/5cw==
X-Received: by 2002:a05:6512:2115:b0:4fb:89f2:594d with SMTP id q21-20020a056512211500b004fb89f2594dmr4353049lfr.63.1690202424121;
        Mon, 24 Jul 2023 05:40:24 -0700 (PDT)
Received: from [192.168.2.52] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id qc12-20020a170906d8ac00b0098866a94f14sm6673189ejb.125.2023.07.24.05.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 05:40:23 -0700 (PDT)
Message-ID: <a60ce570-d472-8823-9fe0-6385d675035d@gmail.com>
Date: Mon, 24 Jul 2023 14:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] rpmbuild doesn't work on the target system out of the
 box with standard macros in the specfile
To: Ross Burton <Ross.Burton@arm.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
References: <d8337e11-0727-a5cb-d3db-1cd6b5ad9190@gmail.com>
 <98E1AB5A-E531-457D-97B5-CFFD1C4A1103@arm.com>
 <1771C00C48FCDC1F.28005@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1771C00C48FCDC1F.28005@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 13:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184785

2023. 07. 14. 15:48 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 07. 14. 15:23 keltezéssel, Ross Burton írta:
>> On 14 Jul 2023, at 13:53, Zoltan Boszormenyi via lists.openembedded.org 
>> <zboszor=gmail.com@lists.openembedded.org> wrote:
>>> It would be nice if Yocto's rpm recipe added the possible
>>> buildarchtranslate lines for BSP target archs automatically.
>> As you’re in the perfect position to test this, would you be willing to come up with a 
>> patch?
>
> I am trying to.
> Currently I am stuck with making this work for Yocto 3.4.
> Later I may be able to come up with something that works for Yocto master.
>
>> It might be as simple as only changing the macro files in native builds, so the target 
>> rpm has conventional macros.  Then again I don’t know much about RPM so may be wrong!
>
> rpmrc and the platform specific macros file need changing.

It seems only the latter needs to be changed.
In case of MACHINE=genericx86-64, RPM packages with
.genericx86_64.rpm suffix will be generated this way.

I just sent the patch against the rpm recipe. Please
review and comment.

I hope I got it right for architectures I don't usually build for.

>
> rpm --eval '%{_arch}' also not correct. strace shows that
> it looks at the contents of /etc/rpm/platform and then
> wants to read /usr/lib/rpm/platform/<platform>/macros
> which doesn't exist for e.g. platform=genericx86-64 or
> other BSPs.
>
> Also, I am not using multiarch so the default
> /usr/lib/rpm/platform/x86_64-linux/macros is not correct
> as it tells rpmbuild to use /usr/lib64 as opposed to use /usr/lib.
>
> Not sure what to do with a multiarch Yocto build.
>
>> A test case that does a simple build using rpm would be a good step too.
>>
>> Cheers,
>> Ross
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184265): https://lists.openembedded.org/g/openembedded-core/message/184265
> Mute This Topic: https://lists.openembedded.org/mt/100140377/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


