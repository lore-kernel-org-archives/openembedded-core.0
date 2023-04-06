Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1630C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 08:24:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.153435.1680769436544619622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 01:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=ALSQrLUw;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so23325770wms.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680769435;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ruv/rUudFPn+X5nlagwEHXFod3SGhUr8L7YJYp8gRY=;
        b=ALSQrLUwJa/7eZ+ysH8H1Bz45AjmVaf7f5/MigHY2/HZ7zJ5N/T/YmzMqZXA4/ul/b
         FB8o/JHQiJ6lfg2YCpOrqpv9v4kW5n4E6kOwg/mJX4eg7cbxNh7k8tFdf64u8BOxEMQx
         R5lKpyyz8X7KWONyBW8A0TFFrjoLON0yh7WrDbXCGz7JpqrYJKx1TS1sZ6Rr9A+gr5pQ
         wyW5quDbk0aFmgGglDRcH3EuupGaSP1URsHwehFh/RgJlDkCzKf2nS/VIVITzxjvYwAk
         yU2nJlH7ZKGhcA1g2ZA7m6cZacEZiPM/nIciL3jXpz7dVyBspKJ0K8VMpS2nxCcFZtcR
         7r8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680769435;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ruv/rUudFPn+X5nlagwEHXFod3SGhUr8L7YJYp8gRY=;
        b=TQcWi5YZ318tWpY5vYK61QHKzeapfNdLm/Gxb7snYSc3ok8sFvoQgJ8iK7kgWWeDmn
         LxvwwVC7xxZmqlZcnz8NbxNnHNxtiBOajkmIU2lcq7l0axwnqlqsX8/qF8XTkSQLkeSx
         HIpTNfzyFwtAu9MxozPhHyBwqCsBN8NVSaxDXI6KwU257uW4uQIJ+XdNQ1OHPUb6FcTm
         HAFwve9CpBxdGR533oGBUP3MbkBen2BZWPTpWx46ElxYfQZHPGiPs1SKbbfjTwGfT+De
         uYRXBKXmL+CkQMRsm+fez70+xmexjKXkizbdQchQQ0KLgU4pVYACJdmlJS1h3wBsVNiO
         erMg==
X-Gm-Message-State: AAQBX9d8AsZHNPnOPX+N9wHHnJf0AAod+/0a3fPvolxOuricBEacwG2a
	XxX25BjRqCisu71bilVAd3cQiw==
X-Google-Smtp-Source: AKy350bKCh2VJkJkEgxbKVjktVi8KSfGCoBvit3qPY2Ye2M6c5NI8hxW4jCcglcAhWxUvbYbJaFtKw==
X-Received: by 2002:a1c:7219:0:b0:3ef:6819:b2ad with SMTP id n25-20020a1c7219000000b003ef6819b2admr6555466wmc.37.1680769434855;
        Thu, 06 Apr 2023 01:23:54 -0700 (PDT)
Received: from [192.168.0.27] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id a5-20020a5d4d45000000b002c3f81c51b6sm1050188wru.90.2023.04.06.01.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 01:23:54 -0700 (PDT)
Message-ID: <b481324c-62ee-8d82-3147-1c677020ae00@smile.fr>
Date: Thu, 6 Apr 2023 10:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: Exclude some issues
 not present in linux-yocto
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Geoffrey GIRY <geoffrey.giry@smile.fr>
References: <20230404164400.403462-1-richard.purdie@linuxfoundation.org>
 <9cb0aae1-c1be-ab0d-2263-1ab2f928c885@smile.fr>
 <eaa125c5ba2c1a13837c65df4a961abab5f5373b.camel@linuxfoundation.org>
 <9eab4d61-3939-0703-1d81-e998f8957e99@smile.fr>
 <432346f305541dc9e25b0e7fe34de1fd12aab978.camel@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <432346f305541dc9e25b0e7fe34de1fd12aab978.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 08:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179758

Hi

On 4/5/23 11:55, Richard Purdie wrote:
> On Wed, 2023-04-05 at 11:51 +0200, Yoann Congal wrote:
>> Hi Richard,
>>
>> On 4/5/23 00:26, Richard Purdie wrote:
>>> .../...
>>> Thanks, I tweaked those bits. I did a bit more research and the other
>>> easier looking linux-yocto ones to mark up are listed below along with
>>> the versions known to contain fixes. I'd still need to map out the
>>> revisions and so on for these but several look like they can be
>>> resolved for our versions if this data is correct.
>>>
>>> That left 13 linux-yocto CVEs that would need more work to track down
>>> and 5 non linux-yocto ones.
>>
>> Some of these will be part of a patch from Geoffrey (in cc) that he will send in an hour or 2.
>>
>>>
>>> CVE-2022-2196: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2196 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=2e7eab81425ad6c875f2ed47c0ce01e78afc38a5
>>> 5.10.170
>>> 5.15.96
>>> 6.1.14> 
>>> CVE-2022-3424: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3424 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=643a16a0eb1d6ac23744bb6e90a00fc21148a9dc
>>> 5.10.163
>>> 5.15.86
>>> 6.1.2
>>>
>>> CVE-2022-3523: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3523 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=16ce101db85db694a91380aa4c89b25530871d33
>>>
>>> CVE-2022-3566: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3566 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=f49cd2f4d6170d27a2c61f1fecb03d8a70c91f57
>>>
>>> CVE-2022-3567: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3567 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=364f997b5cfe1db0d63a390fe7c801fa2b3115f6
>>
>> All of the above will be included.
>>
>>>
>>> CVE-2022-38457: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38457 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=a309c7194e8a2f8bd4539b9449917913f6c2cd50
>>> 6.1.7> 
>>> CVE-2022-40133: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40133 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=a309c7194e8a2f8bd4539b9449917913f6c2cd50
>>>
>>> CVE-2023-0179: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0179 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=696e1a48b1a1b01edad542a1ef293665864a4dd0
>>> 5.10.164
>>> 5.15.89
>>> 6.1.7
>>>
>>> CVE-2023-1079: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1079 *
>>> Fixed in
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=4ab3a086d10eeec1424f2e8a968827a6336203df
>>> 5.10.173
>>> 5.15.99
>>> 6.1.16
>>
>> Not these 4 above.
>>
>>>
>>> CVE-2023-1118: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1118 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=29b0589a865b6f66d141d79b2dd1373e4e50fe17
>>> 5.10.173
>>> 5.15.99
>>> 6.1.16
>>>
>>> CVE-2023-1281: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1281 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=ee059170b1f7e94e55fa6cadee544e176a6e59c2
>>> 5.10.169
>>> 5.15.95
>>> 6.1.13
>>
>> These 2 above will be included.
>>
>>> CVE-2023-1513: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1513 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=2c10b61421a28e95a46ab489fd56c0f442ff6952
>>> 5.10.169
>>> 5.15.95
>>> 6.1.13
>>>
>>> CVE-2023-23005: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23005 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=4a625ceee8a0ab0273534cb6b432ce6b331db5ee
>>> Disputed?
>>
>> These 2 above will not be included.
>>
>>>
>>> CVE-2023-28466: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28466 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=49c47cc21b5b7a3d8deb18fc57b0aa2ab1286962
>>> 5.15.105
>>> 6.1.20
>> Included
>>>
>>> CVE-2023-28866: linux-yocto
>>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28866 *
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=bce56405201111807cc8e4f47c6de3e10b17c1ac
>>> 6.1.22
>>
>> Not included.
>>
>> Should I write a patch including the missing CVEs from Geoffrey's patch or that will clash with your work-in-progress?
> 
> I haven't done anything yet with these so I'd happily take a patch!

I'll send a patch later today for CVE-2023-0179, CVE-2023-1079 and CVE-2023-1513 (currently in internal review).

For CVE-2022-38457 and CVE-2022-40133, I can't track the commit properly.
Yes, linuxkernelcves.com gives commits for these CVEs but is this safe enough to ignore? 
Until now, we have only ignored CVE from commits present in the NVD database.

CVE-2023-23005 is disputed (as you noted), I'll look into it but at a quick glance, the dispute has good arguments and we might ignore this one safely.

We are vulnerable to CVE-2023-28866 : It was introduced in 5.17 (bce56405201111807cc8e4f47c6de3e10b17c1ac from Fixes: tag).
On the 6.1 branch, this is fixed in 6.1.22 and we are at 6.1.20.

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

