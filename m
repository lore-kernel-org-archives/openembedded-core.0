Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.1910.1587588014250428160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 13:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RjvZSR5h;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id g2so1413081plo.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 13:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5h3rovzuIYbdo4T61aBnyqdE7QsBXvrA50ylt6hAXAg=;
        b=RjvZSR5hjEmY+6JtCoH5ABALbK/adt8NJ6420RXWbfQMg/HUAiUAtd73uMLTjDXBJS
         +m7xBSA+m4TE1Ask0bV1McTd54ruuNaPFUsqcSR7c87lN9Rwo9ZRxGUlTPcvkPeJnX8L
         jeJ7s/MRNn9M11u5U2nqYE9osWyyMucrEk33YW18QXacFA57nd7OfTYQHmwbzrJ6kEXu
         4ZX2gtpK8y5DNQZThW4TxJ2cpA1spr3cqr1Z3oB1XYMROritnNK3UX3qU4eLEKZZ6ZQv
         N5KPCAXgtZu9Q5uDshewfc3iJwmmr3SsuoryN92VZwmqcumVl5KwU23mxUhRD8N66JhE
         SUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=5h3rovzuIYbdo4T61aBnyqdE7QsBXvrA50ylt6hAXAg=;
        b=oqvRsfq6K5sRNTc/G4m/ZOLKrqJX51QAD5XWZpLeMkt/KinTevhK67b48mxR3hajHm
         MukAlkhvN0DScw/cVnBoMDyVt8V97zqhjrqIL807RrY8pwKhy7j9V5R859O+b9j3yDXR
         tyuKggGIXfpuTX1sFyLkuqjBcX9tFt9POprxCVHUwwOYk9egrGh7tNBtmRmNhubWBt7G
         uwjOe4UpZ+R8ZMsV669UHUjGnzsPAfZ+iTnbhf7+NnFweEmNieg6Kl1M7xmx7wpJ0z1x
         gbrVh7grhUT1ztPh8a2/FwzV6dSUpSimDI2/A0CcVUDy66u650I4E6RhAhuFJLMzstaC
         FbqQ==
X-Gm-Message-State: AGi0PuZguKD1kVdtqfCJ++P2j1BU4snMGqaNcJsbaPryiUXFsA0l5x2w
	kEm9JUZ+Ak2dTb27LM61S1w=
X-Google-Smtp-Source: APiQypLVRKT2yfJLfBKeijbOrwBBW77rbsT91LmcFWtryuJaDLvMzK4N6FWa1fzHSG6t+ymPAvQ8/g==
X-Received: by 2002:a17:90b:1104:: with SMTP id gi4mr581541pjb.115.1587588013701;
        Wed, 22 Apr 2020 13:40:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:503a:d0d7:51f9:c1bb? ([2601:202:4180:a5c0:503a:d0d7:51f9:c1bb])
        by smtp.gmail.com with ESMTPSA id dw12sm114799pjb.31.2020.04.22.13.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 13:40:13 -0700 (PDT)
Subject: Re: [OE-core] [zeus][PATCH] qemu: Replace stime() API with clock_settime
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20200422143824.2634423-1-Martin.Jansa@gmail.com>
 <21d8e101-e86a-0c23-4c5c-13464d26bd82@gmail.com>
 <20200422170426.6uat7mepwdo6yyfc@jama>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <fb80b29b-4c07-d814-d15b-dc380f22db73@gmail.com>
Date: Wed, 22 Apr 2020 13:40:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422170426.6uat7mepwdo6yyfc@jama>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/22/20 10:04 AM, Martin Jansa wrote:
> On Wed, Apr 22, 2020 at 09:54:20AM -0700, akuster808 wrote:
>>
>> On 4/22/20 7:38 AM, Martin Jansa wrote:
>>> From: Khem Raj <raj.khem@gmail.com>
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>>>  ...linux-user-remove-host-stime-syscall.patch | 61 +++++++++++++++++++
>>>  2 files changed, 62 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>>> index f451017f6d..ad4ff52892 100644
>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>> @@ -27,6 +27,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>>>             file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
>>>             file://0009-Fix-webkitgtk-builds.patch \
>>>             file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
>>> +           file://0011-linux-user-remove-host-stime-syscall.patch \
>>>             file://CVE-2019-15890.patch \
>>>             file://CVE-2019-12068.patch \
>>>             file://CVE-2020-1711.patch \
>>> diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
>>> new file mode 100644
>>> index 0000000000..659e6be45d
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
>>> @@ -0,0 +1,61 @@
>>> +From 0f1f2d4596aee037d3ccbcf10592466daa54107f Mon Sep 17 00:00:00 2001
>>> +From: Laurent Vivier <laurent@vivier.eu>
>>> +Date: Tue, 12 Nov 2019 15:25:56 +0100
>>> +Subject: [PATCH] linux-user: remove host stime() syscall
>>> +
>>> +stime() has been withdrawn from glibc
>>> +(12cbde1dae6f "Use clock_settime to implement stime; withdraw stime.")
>>> +
>>> +Implement the target stime() syscall using host
>>> +clock_settime(CLOCK_REALTIME, ...) as it is done internally in glibc.
>>> +
>>> +Tested qemu-ppc/x86_64 with:
>>> +
>>> +	#include <time.h>
>>> +	#include <stdio.h>
>>> +
>>> +	int main(void)
>>> +	{
>>> +		time_t t;
>>> +		int ret;
>>> +
>>> +		/* date -u -d"2019-11-12T15:11:00" "+%s" */
>>> +		t = 1573571460;
>>> +		ret = stime(&t);
>>> +		printf("ret %d\n", ret);
>>> +		return 0;
>>> +	}
>>> +
>>> +        # date; ./stime; date
>>> +        Tue Nov 12 14:18:32 UTC 2019
>>> +        ret 0
>>> +        Tue Nov 12 15:11:00 UTC 2019
>>> +
>>> +Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=0f1f2d4596aee037d3ccbcf10592466daa54107f]
>>> +Buglink: https://bugs.launchpad.net/qemu/+bug/1852115
>>> +Reported-by: Cole Robinson <crobinso@redhat.com>
>>> +Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>> +Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> +Message-Id: <20191112142556.6335-1-laurent@vivier.eu>
>> Who signed this patch off?
> Are SOBs in .patch files more strict for .patch files for zeus than for
> master?
Not really.

>
> It was merged to master here:
> https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/qemu/?id=2cca75155baec8358939e2aae822e256bed4cfe0
> in this exact form with SOB from Laurent Vivier, if you think it's worth
> modifying the .patch just for this, then I'll send v2 with SOB from
> Khem.
I tried looking for it in dunfell for it before I sent my reply so its a
no-op as it looks I my hunting skills nee
>
> At least the .patch was already removed from master in:
> https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/qemu/qemu?id=ca276b77904429a1ff3188d2373535a462afe266
> so it won't show as unnecessary diff between zeus and dunfell.
>
>> - armin
>>> +---
>>> + linux-user/syscall.c | 8 +++++---
>>> + 1 file changed, 5 insertions(+), 3 deletions(-)
>>> +
>>> +--- a/linux-user/syscall.c
>>> ++++ b/linux-user/syscall.c
>>> +@@ -7651,10 +7651,12 @@ static abi_long do_syscall1(void *cpu_en
>>> + #ifdef TARGET_NR_stime /* not on alpha */
>>> +     case TARGET_NR_stime:
>>> +         {
>>> +-            time_t host_time;
>>> +-            if (get_user_sal(host_time, arg1))
>>> ++            struct timespec ts;
>>> ++            ts.tv_nsec = 0;
>>> ++            if (get_user_sal(ts.tv_sec, arg1)) {
>>> +                 return -TARGET_EFAULT;
>>> +-            return get_errno(stime(&host_time));
>>> ++            }
>>> ++            return get_errno(clock_settime(CLOCK_REALTIME, &ts));
>>> +         }
>>> + #endif
>>> + #ifdef TARGET_NR_alarm /* not on alpha */
>>>
>>> 

