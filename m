Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84722C83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 01:51:19 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.3064.1753149078366761737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 18:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bv4kFCxm;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748feca4a61so2733857b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 18:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753149078; x=1753753878; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5usdwYXHel01I2B/DGCUL3YYQbpnudjXgM/bM5/wpk=;
        b=Bv4kFCxmVO5z1YSozDvsjbfqsvdsox8r6QJlZ07VOyZxn5jjnVeft7lumAIO6ZagZc
         posSmqlz4YRRGW3UU/pj7oH7s0wKcPLSn3ZB3Fso27fr+Mp+zBTWDfaKV6YHWem+IcM2
         FpQGcoYoh/C5W/fE21TC6Vvn/U9DfZAdJC2zm7mX9GACPvYyplzNf4o7OyflnQNJ0b6v
         aKXvSWcC/BszJtHRBo0H656bskImTWV6+ruSjmR42y92Ymqd5q97foFFjJAywp0MkUuD
         52wO4y8z+tP7+9zntBl3UYFLZf5AMIarG7e0051lvzRt/2Wlx6BrQe7BEpFkhh7X9pU8
         RKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753149078; x=1753753878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5usdwYXHel01I2B/DGCUL3YYQbpnudjXgM/bM5/wpk=;
        b=S4TSByYtnBqCNSNQpTPe/0MA/jQ92twxbiFWVUTAUNrGHfAkTTuB5Y9tLM0g1BZV/L
         WdHw4B1tautNIm99WjLcrqEmlDb2bQQ5x+2h8w3XWaEGcGNXMyZhg7O2BN+lYCGEFvQb
         4+qaKDtjth6PMIKXE4PzXkKB2EhslmnY7bKgKjR/0V2XMqxPvsHJIwPhzqD82olgQYyr
         iSyCBDwOZJVMconiJtcO2GiEUTh/Q+TPES/6Ba34/yFrz/LKn5cEyO/2HcHsCee247kg
         XtgDeM2OeB44utdXIkqqmGGIKCcqL2nFy1j09A2ZwDyGZpy0qzYwf29kySQVreq9gmjO
         xreg==
X-Gm-Message-State: AOJu0YwT9DNdyP/mAKW33kHzFI1otoenib624diLdJNZu83FWDo38ATF
	yDCgD9J6kVN3qM9Uq8Rr6TTFxhMeqVL/89nclDuQiJXCKyhPpgCZxKsU
X-Gm-Gg: ASbGncu2t+9Q9Ir1do8/aG2LvEqzX/E5xM7YDsLQuGVyhxUAkTS1cMHDLA8AHa3kCwA
	mYyhW+R52wioyid00F8RZ+B6juF4lM33xY3T2+C61BK5l8gPyW6lzgkWBCFfctXR8BTvSKmZAd9
	7kSJyvEKwkbmV5nph0+ycA2z/8i0Gp32kTulbsKGhFKuSaxkGrup3RLKPfmLnv7lXCIoZbIGS8Y
	kLjlE3lZXa+DB23WbNBW/2zxIFEU++rh0gakg14W6GbHX0w0K1b2ZgZWO3XKB/RxUKWCARsgWXc
	HMT2DswiwfuahcPjYdGQJcVM7LPgInxBLUipSkMexszQkkGY7N+NvoNvBMRKgOhwiFtvX9G51Q9
	uJ4wgFhzrJ9B/aQzNh50l/68BgvWsVyHjikwa
X-Google-Smtp-Source: AGHT+IGrn4RBZkoJ/m/karZygXT2C4Z0vIuWfteyktU2hb5MYLTsVF+GmZpebnIaY+NEDil37GaRdQ==
X-Received: by 2002:a05:6a20:3d8a:b0:204:4573:d855 with SMTP id adf61e73a8af0-23811d5b33amr37707461637.9.1753149077587;
        Mon, 21 Jul 2025 18:51:17 -0700 (PDT)
Received: from [10.15.13.154] ([209.129.148.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc680absm6551987b3a.144.2025.07.21.18.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 18:51:17 -0700 (PDT)
Message-ID: <813a317a-96a5-494f-99b8-a5bb8c612ef1@gmail.com>
Date: Mon, 21 Jul 2025 18:51:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][walnascar][scarthgap][PATCH] xserver-xorg:
 upgrade 21.1.6 -> 21.1.18
To: steve@sakoman.com, Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250701103252.6703-1-vanusuri@mvista.com>
 <CANQUz18dZfkQWXPC9ZgVc-VP86Q3-pPcpHL31K8PbTF7k-17Ng@mail.gmail.com>
 <CAOSpxdbY5+VfZcxHvpEsQw3GJytp2qg93trwSrT6zbe1hDiDfw@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAOSpxdbY5+VfZcxHvpEsQw3GJytp2qg93trwSrT6zbe1hDiDfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 01:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220718



On 7/21/25 8:15 AM, Steve Sakoman via lists.openembedded.org wrote:
> On Mon, Jul 21, 2025 at 12:16 AM Vijay Anusuri <vanusuri@mvista.com> wrote:
>>
>> Hi Team,
>>
>> Any update on this ?


hmmm, its same patch which is intended for all three branches. Master 
branch maintainers might miss this patch accidentally since it has 
release branch names in them and stable maintainers are not same, 
atleast it has happened to me for meta-openembedded.

> 
> I'll let Richard comment on the status for master branch.
> 
> I obviously can't take it for stable branches until it is accepted in master.
> 
> A couple of comments though:
> 
> 1. a typo in the short log, 21.1.6 should be 21.1.16
> 2. Sending a patch targeted for master and stable branches greatly
> increases the odds that it will get overlooked for the stable
> branches.
> 
> I use patchworks to track stable branch patches.  When the patch is
> accepted in master it gets marked as Accepted.  Unless it is top of
> mind for me I am unlikely to notice this change and take the patch for
> the stable branches.
> 
> Best to send the patch for master first and then send separately for
> each stable branch when it has been accepted in master.  This makes
> tracking things in patchworks much more reliable!
> 
> Steve
> 
>>
>> Thanks & Regards,
>> Vijay
>>
>> On Tue, Jul 1, 2025 at 4:03 PM <vanusuri@mvista.com> wrote:
>>>
>>> From: Vijay Anusuri <vanusuri@mvista.com>
>>>
>>> xorg-server 21.1.17
>>> This release contains the fixes for the issues reported in today's security
>>> advisory: https://lists.x.org/archives/xorg/2025-June/062055.html
>>>
>>>     * CVE-2025-49175
>>>     * CVE-2025-49176
>>>     * CVE-2025-49177
>>>     * CVE-2025-49178
>>>     * CVE-2025-49179
>>>     * CVE-2025-49180
>>>
>>> Additionally, this release includes a fix for CVE-2022-49737 which was
>>> issued after the fix was merged back in 2022 and several other various fixes.
>>>
>>> Ref: https://lists.x.org/archives/xorg-announce/2025-June/003609.html
>>>
>>> xorg-server 21.1.18
>>> This release contains an additional fix for CVE-2025-49176 from June 17
>>> security advisory: https://lists.x.org/archives/xorg/2025-June/062055.html
>>>
>>> Ref: https://lists.x.org/archives/xorg-announce/2025-June/003612.html
>>>
>>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>>> ---
>>>   .../{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb}        | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>   rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.18.bb} (92%)
>>>
>>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
>>> similarity index 92%
>>> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
>>> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
>>> index 38c81f2372..14c45be432 100644
>>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
>>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
>>> @@ -3,7 +3,7 @@ require xserver-xorg.inc
>>>   SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
>>>              file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
>>>              "
>>> -SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
>>> +SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
>>>
>>>   # These extensions are now integrated into the server, so declare the migration
>>>   # path for in-place upgrades.
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#220700): https://lists.openembedded.org/g/openembedded-core/message/220700
>>> Mute This Topic: https://lists.openembedded.org/mt/113925021/1997914
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


