Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6D6C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 00:46:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.7201.1633999595094921939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 17:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XCgmrpk2;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id o20so61195481wro.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 17:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bAiLIjEgAk57ijb0NV80hJIP8eigZJk+kIhR/PFSX/M=;
        b=XCgmrpk2CunvGFdoShEjY+cRfMnrNUrTe58n+xPcYfbIFrWxHuaSiVxnRvCwzNhHZz
         T8NQcLbvjbw3ADn0PZ9GrSuzXSHN4R1awYaGaE8KI38DaA79UaJhYGAwvE5xuFdt3BUh
         E1kwcTJQCAD+HNfTC2JdZO8MfCwDQ9A8bVEcq+u7W74XLZMCydbB1nec1WePttDdHrL6
         OS7v3/nyZzCXD+bKEeR1SjDnvnpPxSBRyJycOt1WHVt3ZUn3tvj2Gll5QVPVO5PpBGwk
         v466XSaOo2VZoHr3RoGUHBJV9p5Hh0ziBBN27FgsBZd28k++9/HMFnXapcLX/+43QoCD
         BdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bAiLIjEgAk57ijb0NV80hJIP8eigZJk+kIhR/PFSX/M=;
        b=q7+mFuURckWjMGfkhpDUt5MHrRufjcPNxjeqdMPUbxwLR3EnsDlfELtGVww46Og5G5
         f9jNz+o2ie5qMrIE+ewBoTQIiHu46hZuHSqt36vhqJdDKzT8lp+XQz0I6CSyciHTd++m
         45hk7onmt+HrgsDwdKpGlrCVcRzjlQTYFE9pWkBDl1PdnJU9cuir/QrQ9+qHav6l5VN9
         UruASLTTu2WnhnVw9AXIX/2SKnirJj8J2STWZ1M2+neSLitRpovzQ6H6X7OQEojVwkxX
         f5ZUntAwnllvU7VmNN5g46RSb2VCc0nZDukYQw+QVVC96pwgVoXfqyp8+qrzcFiF1d0B
         0xiA==
X-Gm-Message-State: AOAM532wyrx6bUKZSAXDTsP9q3PR0/INTbyOwVCHeo0lSWlSKjVBRF2g
	F5PDaI9BYBFubHx4vtxXRhI=
X-Google-Smtp-Source: 
 ABdhPJxUvTX3ZePuMAteuboFaXiTy5eTvxf1WRq+XQ2TRLWgTi+XV4AioNHxAgxlllBuYkQplNKklw==
X-Received: by 2002:adf:a4c8:: with SMTP id h8mr28524825wrb.227.1633999593589;
        Mon, 11 Oct 2021 17:46:33 -0700 (PDT)
Received: from [192.168.42.52] (ppp-2-86-134-166.home.otenet.gr.
 [2.86.134.166])
        by smtp.gmail.com with ESMTPSA id
 c185sm930289wma.8.2021.10.11.17.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 17:46:33 -0700 (PDT)
Subject: Re: [OE-core] [meta-java] OpneJDK nativesdk recipe
To: Akira Shibakawa <arabishi900@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: 
 <CAE84iWW+eiFK7bEU3fRZL62G7L2xmEbSQQfAkpzj5oQwM-fWgw@mail.gmail.com>
 <CAMKF1so5t-v0Xt0dQbnP+dZYKk7pyVGG7kbrt+QkTz9PvsmgDg@mail.gmail.com>
From: Robert Berger <oecore.mailinglist@gmail.com>
Message-ID: <92dd2523-33aa-5f82-9550-67344c8aeeee@gmail.com>
Date: Tue, 12 Oct 2021 03:46:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CAMKF1so5t-v0Xt0dQbnP+dZYKk7pyVGG7kbrt+QkTz9PvsmgDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 00:46:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156851

Hi,

On 11/10/2021 19:47, Khem Raj wrote:
> On Mon, Oct 11, 2021 at 2:50 AM Akira Shibakawa <arabishi900@gmail.com> wrote:
>>
>> Hi
>> I want to let my customer compile java code on Yocto SDK.
>> But, there is no nativesdk recipe of OpenJDK in meta-java.
>> Is there any reason to it ?
> 
> I guess no one submitted a patch to enhance the recipe to do nativesdk
> builds so far.
> 
>> Or, is there any plan to add it ?

It's Java - write once debug everywhere - so I guess the use case you 
want is not frequently needed.

A quick grep shows this:

bitbake-layers show-recipes | grep -B 1 meta-java | grep native
ant-contrib-native:
ant-native:
cacao-initial-native:
classpath-initial-native:
classpath-native:
ecj-bootstrap-native:
ecj-initial-native:
icedtea7-native:
jamvm-initial-native:
jikes-initial-native:
libecj-bootstrap-native:
openjdk-8-native:

meaning there is no nativesdk- recipe in meta-java

There are -native recipes like openjdk-8-native but they are only 
accessible to your customer in "cooker mode" after bitbaking everything.

something like:

bitbake openjdk-8-native -c addto_recipe_sysroot
oe-run-native openjdk-8-native <whatever you want to call from there>

As a workaround you could build an extensible SDK, write a recipe and 
let your customer compile like that.

>>
>> thanks

Regards,

Robert

-- 
Robert Berger
Embedded Software Evangelist

Reliable Embedded Systems
Consulting Training Engineering
URL: https://www.reliableembeddedsystems.com

Schedule a web meeting:
https://calendly.com/reliableembeddedsystems/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--

