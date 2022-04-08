Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7372C35274
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.1502.1649447736679694567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DWnBoq5K;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id n8so8830188plh.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=S1bPOg8HGRis4+b0OHV12C/QhOFbfRMQV1jVCeeJYI0=;
        b=DWnBoq5Ku4VPxUAeAFnmPcvOyV8Dq4gnsdjZ49Mi5gzCa7XOWppnUTXpNS9ljfljMw
         hmNFZNbx3eQ6tJIcaslMtot0Url1EZGO5uxQUV19+Ja8mWpP/7fUePURLo2FoW7Zsbko
         KhwsPkOtSTPq8MV72m8hkcDIJX4cGF3TQOMYCbde8r5wmuDVRezoZsIjCFwKrrUzn54X
         lbTgWZwxPqRsYztm5vvRlgPDT8zQWyOSuRNzpFn8cJXTfEr2G8t/CLudXDu4doIOsM+f
         Gc5hQGk0n78VpQFp/bTHHsbBApWSl9rXCJtJcRyCAcnR0t49mYYSJycEvlORn7cPEVV7
         k2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=S1bPOg8HGRis4+b0OHV12C/QhOFbfRMQV1jVCeeJYI0=;
        b=i0pt8KuMuTFrttoK56w+wlnF1MrQhStcUJ4Jkzj6BZXjcJRc/Xb6vQszGx5iPBUD3u
         z2Q4j8GwUtsHqgwPYpRbWTBabQrgYgQY2oLZcDoPVkqRpfl66RHsv47v4YsEM3t6mAGl
         GsJQxJXK/ZBbcZjNieXDOSbQVEbV+DKA993cVWTl/r/WEpVfxbD4oJ/3pk8O+03PLQX1
         dEtvv2YT7k37VvKdEX1Fv9GklV/1R7rvvRTM/sIGGDEZ8ychiw/EGviibHh/80mH+lru
         TrGV8Zy47xPeRk3wF+JW8q4ygd4Bp+Awtr5P/4//O5UOm/lrWa6CXEF8mvJ6qKPt72aQ
         ma5w==
X-Gm-Message-State: AOAM530kdQOhNcwRDQwGX8veqwLAAFuWc+k3XFBUS+1mTSJ9rGr6k/fx
	AiCRmAllW+F8EJOs/qXngCv0zbcAs+EBfw==
X-Google-Smtp-Source: 
 ABdhPJxZrhVC0gH7hwWQWBvA67FgG+g4UM0G+aGVL9fxlfiKdMsgkEo93EXnLgV47O6VgPzBxoqc6g==
X-Received: by 2002:a17:90b:314b:b0:1c7:3023:c218 with SMTP id
 ip11-20020a17090b314b00b001c73023c218mr23512114pjb.167.1649447736146;
        Fri, 08 Apr 2022 12:55:36 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:55c2:182d:f2d6:dc4b?
 ([2601:646:9200:a0f0:55c2:182d:f2d6:dc4b])
        by smtp.gmail.com with ESMTPSA id
 129-20020a621687000000b0050579d13b1csm3348932pfw.137.2022.04.08.12.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 12:55:35 -0700 (PDT)
Message-ID: <9a2e4fc1-0352-1468-315f-a25a53688cd2@gmail.com>
Date: Fri, 8 Apr 2022 12:55:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2 6/6] poky-tiny: enable qemuarmv5/qemuarm64
 and cleanups
Content-Language: en-US
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
References: <20220408192521.1608764-1-jdmason@kudzu.us>
 <20220408192521.1608764-7-jdmason@kudzu.us>
 <5fdfba27-f618-e1c5-106a-85d967fa77f9@gmail.com>
 <CAPoiz9xwgBZCWM3uaat7ifXAOEMth0ss22PFvGQU7=2toYiPrg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CAPoiz9xwgBZCWM3uaat7ifXAOEMth0ss22PFvGQU7=2toYiPrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164172



On 4/8/22 12:53 PM, Jon Mason wrote:
> On Fri, Apr 8, 2022 at 3:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 4/8/22 12:25 PM, Jon Mason wrote:
>>> Add support for qemuarmv5 and qemuarm64, and remove qemuarm specific
>>> entries, as it should be generic now.
>>>
>>> Signed-off-by: Jon Mason <jdmason@kudzu.us>
>>> ---
>>>    meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 4 +---
>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
>>> index d8ce5dc518d5..43a5ad728a5d 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
>>> @@ -1,5 +1,4 @@
>>>    KBRANCH ?= "v5.15/standard/tiny/base"
>>> -KBRANCH:qemuarm  ?= "v5.15/standard/tiny/arm-versatile-926ejs"
>>>
>>>    LINUX_KERNEL_TYPE = "tiny"
>>>    KCONFIG_MODE = "--allnoconfig"
>>> @@ -15,7 +14,6 @@ DEPENDS += "openssl-native util-linux-native"
>>>    KMETA = "kernel-meta"
>>>    KCONF_BSP_AUDIT_LEVEL = "2"
>>>
>>> -SRCREV_machine:qemuarm ?= "cc9e92e826af229b841fcaf8c645e638a86eba43"
>>>    SRCREV_machine ?= "c3d54a67cbf3fb8e6df2d88c80e9d2c74f69aba4"
>>>    SRCREV_meta ?= "63e25b5717751b4b33685bd5991d10c52934a4c6"
>>>
>>> @@ -24,7 +22,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>>>    SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>>>               git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
>>>
>>> -COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
>>> +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"


>>
>> why are we dropping qemuarm ?
> 
> What?  It's adding qemuarm64, which looks like a change of qemuarm to
> qemuarm64, but you can see qemuarm after qemuarm64.

heh, not enough sleep.

> 
>>
>>>
>>>    # Functionality flags
>>>    KERNEL_FEATURES = ""
>>>
>>>
>>>
>>>
>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#164169): https://lists.openembedded.org/g/openembedded-core/message/164169
>> Mute This Topic: https://lists.openembedded.org/mt/90343240/3616920
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

