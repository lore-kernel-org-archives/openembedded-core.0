Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446C5ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 12:11:23 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.11265.1662034276698667872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 05:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RrWm5FP1;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id z25so24116715lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1P62rQYR2XsUBGQgZscuJHm1vkBeixNOubjepNQSiqE=;
        b=RrWm5FP1kq/UtWrgApQ6m3R/kcpbOhuZwlL+LGoAvs5Essvl7P8LvhKidSa5gRZVkG
         zuolopWyDu6B6OXKTZ3yFVaeu+Oj2r6niqrs+RTC8JxPq1ST9w7QpAvuEjZeqbHpHp3I
         AAJwMg+IfQ0LkJu0VJ4qj8x9h0mJ1NTLZuuL1jz5y/IK81C+4+FGws/FfSKqEY8PRc7x
         zvLVgTbljVKRaV269h0r1fxxvQc93G0qTefFLDfLOxZnZ58Rn0SO6A3iCicfVRI63xBw
         cEnQDKrVM9GcYBc80CgZ/hPN8BlEAmJ/6uxKVbSXi/1syUI84f0leAl5VelMtSB7P8T5
         DSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1P62rQYR2XsUBGQgZscuJHm1vkBeixNOubjepNQSiqE=;
        b=oGT38uMxNyaViTWGZlnNmxOCsEdPNPVtmOqyvrtuH2XomV8tWydG+aaHla7mR3EVmt
         PVm1mC0RAzCLNMMBd57HZvVomrKcJSLeyBUgGxLEqFG7RHNmflnyRKce7LvKoMGsLJ2O
         WM8sXC2ZeBFLzqV93Yfg3liEg6SW8n55AFsRSpRRavyHvuAs3fZhVqqMfYyEXgpIyuNw
         nlZvscCs1XQ/yIsD11Bd0FtiQgdQLm7ifPG9wIM8yhFxHf4Z7Tu/VlBWUPJDRGib8H6B
         wknUSd5lEPBtVSDo4mc71joDsV/ISJ2DBUK4QRkJSQNvIQTNj7FJ1ueNgJzq5pi7Ll4k
         tSpw==
X-Gm-Message-State: ACgBeo1jSwNqR6FeUJj9zRA+0imsNu5fv1PoE1bWIZgfrGHBYlCKFMQS
	O0rOxyJEOx/uIR5F8J2RhczKb+L9h7D+pg==
X-Google-Smtp-Source: 
 AA6agR4re8cfN3OdbHlZqSxiWbjlKUmvTKdf2vWJ40l9gEXmAJebx/KYqkrikLkuDtQrQ1QtJtldmA==
X-Received: by 2002:a05:6512:3992:b0:48b:3f6c:9222 with SMTP id
 j18-20020a056512399200b0048b3f6c9222mr9918862lfu.561.1662034274653;
        Thu, 01 Sep 2022 05:11:14 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 c19-20020a056512075300b0048b3926351bsm1404132lfs.56.2022.09.01.05.11.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 05:11:14 -0700 (PDT)
Message-ID: <dd196c7c-93e5-2854-1479-8e51996929fd@gmail.com>
Date: Thu, 1 Sep 2022 14:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [OE-core] Error with TEMPLATECONF value
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <1710BA34037FD8E9.1438@lists.openembedded.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <1710BA34037FD8E9.1438@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 12:11:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170161

On 9/1/22 13:49, Jacob Kroon via lists.openembedded.org wrote:
> Hi,
> 
> After updating to master branches I'm getting:
> 
>> Error: TEMPLATECONF value (which is 
>> /home/jkroon/Projects/codab-linux/openembedded-core/meta/conf) must 
>> point to meta-some-layer/conf/templates/template-name
> 
> What is the proper solution to this ?
> 

After wiping build/conf/* and rerunning bitbake the problem seems to 
have resolved itself.

Jacob

