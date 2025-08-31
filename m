Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F9FCA0FF2
	for <webhook@archiver.kernel.org>; Sun, 31 Aug 2025 20:24:45 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.36136.1756671878057473455
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Aug 2025 13:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EvOcKjgV;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61e3b74672cso988006a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 13:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756671876; x=1757276676; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1xSwjbErAES046LieWmP+lIDRpemdPKxbeeplCPGAfk=;
        b=EvOcKjgVT3onQgtRqK3xCn95na+s8LJUid4kEwfaT8QHpK/hRmgQRXAvjkvtzThBA1
         ISTc/iUBrXJe1biAT6u5ZgN8ba5Q6U0f9c52/nwFlr0KrABJsN/WR8yKtaWgJ4WTJaSk
         I45mpzIz647y2pRG4YJTgKXjlTNDTXB/QAgAy2MmIh5phwHlQWwMDf6KhMSvv00eQLIt
         Wcr4PnhUJT2ITYiWxs85T6oiTk4Gx0bxeI7up/DV7bD2ZRy2MQvTAA59Ashb1h9WugAQ
         fiELTrkm2sirzBINwiuWtCevMAn0a4rkfvbGG320KCF/KACrpXtUkKjTZx/qcR7FnQTb
         jkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756671876; x=1757276676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xSwjbErAES046LieWmP+lIDRpemdPKxbeeplCPGAfk=;
        b=RMio0xasJJCKl/rhQq8O0A8gm6tTrNVFIw1OClr+bENu2Jfzr8YFMjDaZfSdblLIRU
         mSxcZPLkWWL2m4paqaCafFbeUIhjWE1hqgM+Ea7O1uQ/hgpjYuQD0hI4I6pX2lJxg4jF
         t4CjZzYblRLF+2EziIHyMdKU4l90TruPWjffZdfM9fIcdUATxR4jvokFJ4t7J0Pju2GQ
         Zd0rgM/pRF7Ljt3vzYkE0bGbDDu8+DXBI4KYnsAz/TDo4ZqhNCA1FrxiAH2gtNbc3d8+
         pSMj2n7PA88TNRN8414dk1u7t5F1eLlCj9nB7ARCK7sUI/TehVOlH/NBJresgFxBMpqD
         FO3A==
X-Forwarded-Encrypted: i=1; AJvYcCUHCPpJ28ebjkQiTthUmhoQTjwwIQUjW7SnI1AMGXTscmBk4JNOf2grl+EVIqGlAtxiWEdtrwcjdIHbLSKWzx+x4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3Vlf6yEPUfjgf78+FV07GTgId0KB92NJ0iSFnAXa551VEyL/7
	LBnpxucj39DUP4/hwkkpcWxOBySHWjBcfSZElCShr291h2z1aZWG6K7T
X-Gm-Gg: ASbGncsOO2KLA1bJHRiwzAgIN+NC9MQbK6P+X+qC7vM0N5Z/RmJc8LvNNGrC9I8USST
	5Zfn0ylHCMztqm8XS3N7b5rrWcDgrkhbLV287qWpRK+rz8zy9CkQZpSo7Bq6avcP6C8n8BbKhAN
	OPI+gMLTfNuSPizVxFIcTnXco1pWmb4bM1480lFB2M9kjmVm6RooQVVkF6T3rkAL8qYXfJkKBMx
	V3oA8ivyiVi5+ji+vFf8u1RwqOL7ZQ2kt231qXr9/EbfOVj8Mym4YG3beTN5ovNukAqIz168rlI
	yVDR5uDqa1glK6FM/1MM89JsBY9pjQtJ9KF4JiQugu+c4vOhjsaz5HhZPrDAZybFKbZW6AQU+6a
	cF53aaEY1yBQGq6aJhWqs93+LtW1IMO0=
X-Google-Smtp-Source: AGHT+IGRdOG5N+a/4gKTIR+hnUsx6AfFxhux4hQPwmrMbk/PdizpThgwH/be0p7lN/TLcICumbG66A==
X-Received: by 2002:a05:6402:43cc:b0:61c:b5a5:9912 with SMTP id 4fb4d7f45d1cf-61d26eb6150mr4897296a12.17.1756671876078;
        Sun, 31 Aug 2025 13:24:36 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc51e0c1sm5709067a12.42.2025.08.31.13.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 13:24:35 -0700 (PDT)
Message-ID: <ca5e2dd9-fac3-489c-ae3e-8a4e7a74e708@gmail.com>
Date: Sun, 31 Aug 2025 22:24:34 +0200
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
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1860EED7D31477F1.5475@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 20:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222636

On 8/31/25 20:54, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 7/12/25 16:25, Peter Marko via lists.openembedded.org wrote:
>> I don’t think it’s worth to send the same patch again.
>>
>> It did not fail on normal autobuilder builds which build images and
>> testimages.
>>
>> Also my private builds were fine before I sent my patches.
>>
>>  
>>
>> The problem is in oe-selftest run on autobuilder, where the conditions
>> are different.
>>
>> Oe-selftest is a huge beast (taking more than a day on regular
>> machines) and AB config is hard to decode.
>>
>> I’ll eventually build it myself as part of ppc-32 support, but I’m not
>> so far yet.
>>
> I managed reproduce this on my machine.
>
> 1. Apply this patch, and do at least 50% of world build (the more the
> better, I think).
> 2. Set BB_NUMBER_THREADS = "100" in local.conf
> 3. Delete the tmp folder (but keep the sstate cache, the idea is to
> abuse it)
> 4. Start "bitbake world" again, and let it run until it runs out of
> setscene tasks, or fails.
> 5. If it doesn't fail, stop the build and go back to step 3.
>
> I don't know how frequently this reproduces, but, it looks at  least 3
> out of 4 tries fail on my end.
> I will try to look at it as time allows, but if you have experience with
> sqlite, don't hold yourself back, feel free to look into this. I start
> blind here.
>
> (Btw that 100 threads for setscene isn't a killer, I'm using an aging
> Ryzen 5600G.)

A few additions:
- It reproduces 100% of the time currently on my machine
- The thread number modification isn't actually required
- It seems to fail always at the same place - if I restart bitbake world
after a failure without deleting the tmp folder, it fails again. At this
time I struggle capturing the exact task.
- The error message from pseudo is "error while loading shared
libraries: libsqlite3.so.3.50.2: cannot open shared object file: No such
file or directory"
- At the time when this error occurs, there is indeed no such file in
sysroots-components folder
- If I run "bitbake sqlite3-native" after such a failure, and do bitbake
world again, it succeeds.
- I wonder if the reason for the behavior change is the "--soname=${PV}"
argument in the new recipe. ldd shows that pseudo is linked against
"libsqlite3.so.3.50.2", but before this patch it linked against
"libsqlite3.so.0". I suspect that until now it fell back to the host
OS's libsqlite, and that's why it didn't fail. (My main OS has 3.50.4,
so it doesn't match)

But I will stop spamming for the day, will try that tomorrow, unless
someone else is faster.

>>  
>>
>> Peter
>>
>>  
>>
>> *From:*openembedded-core@lists.openembedded.org
>> <openembedded-core@lists.openembedded.org> *On Behalf Of *Guðni Már
>> Gilbert via lists.openembedded.org
>> *Sent:* Saturday, July 12, 2025 16:12
>> *To:* openembedded-core@lists.openembedded.org
>> *Subject:* Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.2
>>
>>  
>>
>> Previous discussion thread:
>> https://lists.openembedded.org/g/openembedded-core/topic/113866512
>>
>>  
>>
>> I built today /core-image-minimal/ on latest master (Git HEAD for
>> reference:
>> https://git.openembedded.org/openembedded-core/commit/?id=cf89a121f93e404485983b92abc88a46a7f24890)
>> and also upgraded SQLite from 3.50.1 to 3.50.2 for bug fixes.
>>
>>  
>>
>> So far I haven't been able to reproduce the issue with pseudo I saw
>> with SQLite 3.50.1, and I wonder if the autobuilder/test system will
>> catch any issues?
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222635): https://lists.openembedded.org/g/openembedded-core/message/222635
> Mute This Topic: https://lists.openembedded.org/mt/114116736/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


