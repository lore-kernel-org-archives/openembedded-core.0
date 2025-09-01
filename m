Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7AECA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 10:29:49 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.47982.1756722587454073033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 03:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NyYvBf/r;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b042cc39551so111487066b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756722586; x=1757327386; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2GLAIMj2YUI8tgyDApg4JCB6NUkmS4K7LwVJErk8bU=;
        b=NyYvBf/rp9y/LZgrYr7ESEJGSWBdu+8yeO2kspbm18kvFh1kEVFid50VQ85X6rB7mK
         GDF4mYiFLhiV0NcQCbiMgXT3H1nYf+ZDIhmA+6m7mHG+lBpngU5K58MkZzuGaFHK5nc5
         Xh7Lu5+rqYX9njWlmCv1k45+m0Kac2yOIvmY8IrAwn49AOfGJs2HjJbQiO/TXHE3I9y9
         ybrx3jKv4k0y6bntcZqjOW/xstc0mVvFUSylA+ELkoshoXyL5CsweWuyFk9uITcM8NKR
         rDsPtGuLMLs7faJY5YC3BfS5DglOv7zuR5NMmMYTdXWR8X5nN77nHSq5/YZNBuaCVTvI
         u3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756722586; x=1757327386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2GLAIMj2YUI8tgyDApg4JCB6NUkmS4K7LwVJErk8bU=;
        b=HcnzblkIZu/q/h1vVexB8F4+8dIO3cMWqo01enIYoGivZpsN2etcZ3hi4KSq0xuCyS
         gj83htZax535u4XPxPlurCqlrXRp0z231gnkHgCzZCl1n40NU4LH2/6HQJJ/JMvpOPFu
         Vna8l9ntkHtbv3aXxtn+8mVvrRK6ouRZR59XzqHg8i2uqhWwCXJ83/N9RYlW+ziSaL0W
         umWAuI64nUH2jDHW0vwtjuNTPC/xemQGWl19X8edl2PCW+ktfHpMavbIrcb4G9e/m070
         AdipNVLeV9kFn2fiKMXDMhSlxeGe35pSWY9pMDSkZyG2roI6PFrmARPQFn5NU4NGOEju
         wX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX52i1GnH6Tw5DHkODQmlJ2a8sLVIeZiylP/tvkZVQYPQ8xzWlAl/FKo/EZhZBd9kgPRLHZveaBvEJW2/T0mmA5tQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlurIOCBTtvp9CCL/uQ7bJ2OkG1TCsSPNEm/xjepjWYgRgqd4y
	NUJchIdtqW5mFQmNz3FleKBHvmoebVBIJzaw/oz86rwpWXGMQnfVIERF
X-Gm-Gg: ASbGncsHUCK0duQ/QRtSKqyUIwzk7P4j5iDVqxjWtvHIWXqXExDWrlX3ICzPqt5aq0w
	ta9JlGmf2/9kEQ3jJvy3l3NkQDQFgI7KnMOsAWdEreY1k/1nJ8w5Dis5sk7LQ/PfZmYjF+J77Dd
	ggSf7kwL2FzIczpMNdLEcoeJYJFMCTyTNJiLa5AXKNrOqS8J6I8zSxzxiMNIMj1Kdu4lYcjZneO
	ClbFzSDdaWQM6h6I6Vq237HFtJjAYZ+XoVDFdRzH+mhqD/MvqKyibqCGugQWTVX+xWgL/yTqihw
	rxbok56g/a+oXtQnTMixAjOnIxC++w571Y3pjTiI0Fs2cZI3XHmiuXDDSTarC5FejjlrWjrSKCA
	PQb0yy22vk77mRwhvQ6SzvY92f2x9WUJKYiX8kKJbiQ==
X-Google-Smtp-Source: AGHT+IEw05aZOJGT/xShpV6ruMBVt6IwgAT0u1nWjtbT6eFg7/4KJl2wuRn0+QwSaKefMCfxDZbpOg==
X-Received: by 2002:a17:907:7b8d:b0:b04:4175:62f7 with SMTP id a640c23a62f3a-b04417565a1mr55151366b.33.1756722585510;
        Mon, 01 Sep 2025 03:29:45 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff3dd9574fsm642611566b.84.2025.09.01.03.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 03:29:44 -0700 (PDT)
Message-ID: <64ec9cce-9ae9-4d0b-8be7-e1d0bec144cd@gmail.com>
Date: Mon, 1 Sep 2025 12:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
To: peter.marko@siemens.com, "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250712140638.3099109-1-gudni.m.g@gmail.com>
 <24850.1752329523627965940@lists.openembedded.org>
 <AS1PR10MB5697C5226761702F5C7B4E68FD4AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1860EED7D31477F1.5475@lists.openembedded.org>
 <1860F3C42441CCDB.24627@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1860F3C42441CCDB.24627@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 10:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222655

On 8/31/25 22:24, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 8/31/25 20:54, Gyorgy Sarvari via lists.openembedded.org wrote:
>> On 7/12/25 16:25, Peter Marko via lists.openembedded.org wrote:
>>> I don’t think it’s worth to send the same patch again.
>>>
>>> It did not fail on normal autobuilder builds which build images and
>>> testimages.
>>>
>>> Also my private builds were fine before I sent my patches.
>>>
>>>  
>>>
>>> The problem is in oe-selftest run on autobuilder, where the conditions
>>> are different.
>>>
>>> Oe-selftest is a huge beast (taking more than a day on regular
>>> machines) and AB config is hard to decode.
>>>
>>> I’ll eventually build it myself as part of ppc-32 support, but I’m not
>>> so far yet.
>>>
>> I managed reproduce this on my machine.
>>
>> 1. Apply this patch, and do at least 50% of world build (the more the
>> better, I think).
>> 2. Set BB_NUMBER_THREADS = "100" in local.conf
>> 3. Delete the tmp folder (but keep the sstate cache, the idea is to
>> abuse it)
>> 4. Start "bitbake world" again, and let it run until it runs out of
>> setscene tasks, or fails.
>> 5. If it doesn't fail, stop the build and go back to step 3.
>>
>> I don't know how frequently this reproduces, but, it looks at  least 3
>> out of 4 tries fail on my end.
>> I will try to look at it as time allows, but if you have experience with
>> sqlite, don't hold yourself back, feel free to look into this. I start
>> blind here.
>>
>> (Btw that 100 threads for setscene isn't a killer, I'm using an aging
>> Ryzen 5600G.)
> A few additions:
> - It reproduces 100% of the time currently on my machine
> - The thread number modification isn't actually required
> - It seems to fail always at the same place - if I restart bitbake world
> after a failure without deleting the tmp folder, it fails again. At this
> time I struggle capturing the exact task.
> - The error message from pseudo is "error while loading shared
> libraries: libsqlite3.so.3.50.2: cannot open shared object file: No such
> file or directory"
> - At the time when this error occurs, there is indeed no such file in
> sysroots-components folder
> - If I run "bitbake sqlite3-native" after such a failure, and do bitbake
> world again, it succeeds.
> - I wonder if the reason for the behavior change is the "--soname=${PV}"
> argument in the new recipe. ldd shows that pseudo is linked against
> "libsqlite3.so.3.50.2", but before this patch it linked against
> "libsqlite3.so.0". I suspect that until now it fell back to the host
> OS's libsqlite, and that's why it didn't fail. (My main OS has 3.50.4,
> so it doesn't match)
>
> But I will stop spamming for the day, will try that tomorrow, unless
> someone else is faster.

I'm 97.89% confident that I figured out the problem, but I could use
some advice, how to solve it.
So the issue is indeed that pseudo-native has a runtime dependency on
sqlite3, but currently it isn't guaranteed to be available in the Yocto
folders.

Until now pseudo was linked to unversioned sqlite libs, and if it
couldn't find it in the Yocto folders, it just grabbed the one from the
host. But now that it is linked to a versioned library, it needs exact
version.
Generally speaking the sysroots-components/$BUILD_ARCH/sqlite3-native
folder should be populated by the time pseudo-native is first used,
which doesn't happen always.

So I tried to add the following to the pseudo recipe:

python __anonymous () {
    if d.getVar("PN").endswith("-native"):
        d.appendVarFlag('do_populate_sysroot', 'depends', '
sqlite3-native:do_populate_sysroot')
}

I have also tried
do_populate_sysroot[depends] += 'sqlite3-native:do_populate_sysroot'

However when building from sstate cache, these don't seem to be
deterministic - rarely it seems to work, but more often pseudo-native is
populated before sqlite3-native, and just fails still.

I wonder, are these inter-task dependencies ignored when populating
sysroots from sstate cache?
Or should I rather add the dependency to base.bbclass next to pseudo-
(if fakeroot == pseudo, then add sqlite3-native:do_populate_sysroot as a
dep too)? 
Or am I completely misguided here?

Thanks

>>>  
>>>
>>> Peter
>>>
>>>  
>>>
>>> *From:*openembedded-core@lists.openembedded.org
>>> <openembedded-core@lists.openembedded.org> *On Behalf Of *Guðni Már
>>> Gilbert via lists.openembedded.org
>>> *Sent:* Saturday, July 12, 2025 16:12
>>> *To:* openembedded-core@lists.openembedded.org
>>> *Subject:* Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
>>>
>>>  
>>>
>>> Previous discussion thread:
>>> https://lists.openembedded.org/g/openembedded-core/topic/113866512
>>>
>>>  
>>>
>>> I built today /core-image-minimal/ on latest master (Git HEAD for
>>> reference:
>>> https://git.openembedded.org/openembedded-core/commit/?id=cf89a121f93e404485983b92abc88a46a7f24890)
>>> and also upgraded SQLite from 3.50.1 to 3.50.2 for bug fixes.
>>>
>>>  
>>>
>>> So far I haven't been able to reproduce the issue with pseudo I saw
>>> with SQLite 3.50.1, and I wonder if the autobuilder/test system will
>>> catch any issues?
>>>
>>>
>>>
>>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222636): https://lists.openembedded.org/g/openembedded-core/message/222636
> Mute This Topic: https://lists.openembedded.org/mt/114116736/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


