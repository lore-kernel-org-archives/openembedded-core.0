Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.1679.1615435157944478841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 19:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WsoWMgy9;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id 18so13607358pfo.6
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 19:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sr44iteO468Qo1MjAHX9i4+u2H7nHitfOLgzbm0WphI=;
        b=WsoWMgy9pM7mzuUD+vJivvRQua86m8n0dFpRH3+eVCZtHEcBcHB0q9pYnxpehuZlhR
         r/pjt1Hw/lb0jnSx3ZnFPKMom9jwCtCf2xpR6h3GrDm4ehFBTct25/wlT2vcKuBDTF3k
         pv/o6wZi9CjjxlV22IIXHqx6c0u46JnLDKnojgDgW2NcGVs7EoTI/xWe27Ul/ji6EQJp
         mbiHOwo+GGoQ3EutkHZ6ZQcFLaTUupH03wLLRUob92X4//Ada/oknVWCt1hqt42Pu8Hq
         1uEvBXMACcosfz+ytt9Ie5T+jAy2y2SjwRikkFZOJJjd6+FiOGJt4/S4CKiRMnlY+NAk
         h1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=sr44iteO468Qo1MjAHX9i4+u2H7nHitfOLgzbm0WphI=;
        b=Cms+42y6g3fFh8RYWCMNqwpJhiku+mADvrNdRKYCnsV++9XcjO66VyrFEVwv6iPbQl
         Rz5Kun4DlggI8kX65J6sdz8Y7VvzZKLxdHh8TDSe7SX/NURoswUefm56Wb2VaDdqBqru
         iV0q3g0/GrQaVMXpr6UXygbwu3tV3msYgiDbZ7PPLwY/g96vC7jkW8Jdqm3PlPP8pkPX
         esnN8GQoXvEMLmRQ/MUlQJmUkgu1edJmxalRH/rE+cNnt7MXisDaLz2DXcvJ9/fWwpCd
         VpLjHnJLuTwZPw1AHaQ63J4iAaQEwF2yoQ2wblumZWl8zKBtxbfFfuSNl1+wcI+L3n2a
         E1Ng==
X-Gm-Message-State: AOAM532qk9h5yrvuZXZss4MwI3u2KJHToGc6Thl13EKKUyb0dZLlUmPi
	sRM+xGgoc1irRxokFonC7vc=
X-Google-Smtp-Source: ABdhPJyloSuxbS+DWYoJlNjXt3tk6A8HimqWNcK340gQeb1z/TeiYixKbt6Fo8NCRluNOSIUULpI7Q==
X-Received: by 2002:aa7:9182:0:b029:1de:e96f:a866 with SMTP id x2-20020aa791820000b02901dee96fa866mr5863273pfa.67.1615435157226;
        Wed, 10 Mar 2021 19:59:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::d2c6? ([2601:646:9200:a0f0::d2c6])
        by smtp.gmail.com with ESMTPSA id w203sm873418pff.59.2021.03.10.19.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 19:59:16 -0800 (PST)
Subject: Re: [OE-core] [PATCH 2/2] core-image-sato: qemuarmv5 doesn't work with >256M RAM
To: Jon Mason <jdmason@kudzu.us>, Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Jon Mason <jon.mason@arm.com>
References: <20210310230433.29983-1-jdmason@kudzu.us>
 <20210310230433.29983-2-jdmason@kudzu.us>
 <CAJ86T=VPLEr=u5O=D1bo6du0nBw3fOnN5O1i_tja0hoJxca-sg@mail.gmail.com>
 <CAPoiz9xVGGS6S5LpjO3OX-Zg9A56u6NJAq=oRbFYVmN4hBSZ=g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <622f75d8-819f-5c6d-ef56-5c7780f1cccf@gmail.com>
Date: Wed, 10 Mar 2021 19:59:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAPoiz9xVGGS6S5LpjO3OX-Zg9A56u6NJAq=oRbFYVmN4hBSZ=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/10/21 7:16 PM, Jon Mason wrote:
> On Wed, Mar 10, 2021 at 6:30 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Wed, Mar 10, 2021 at 3:04 PM Jon Mason <jdmason@kudzu.us> wrote:
>>>
>>> Currently seeing the following error when running runqemu on qemuarmv5:
>>> runqemu - ERROR - Failed to run qemu: qemu-system-arm: versatilepb: memory size must not exceed 256MB
>>>
>>> This is due to the memory size being set to 512 instead of the max
>>> allowable of 256.  Limit to this and everything is happy.
>>>
>>> Signed-off-by: Jon Mason <jon.mason@arm.com>
>>> Change-Id: I3339e50a53464b95f52a987ed37868ebf0935b07
>>> ---
>>>   meta/recipes-sato/images/core-image-sato.bb | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
>>> index e50b24a47691..8ed8f75e9f92 100644
>>> --- a/meta/recipes-sato/images/core-image-sato.bb
>>> +++ b/meta/recipes-sato/images/core-image-sato.bb
>>> @@ -14,3 +14,4 @@ TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesd
>>>
>>>   QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
>>>   QB_MEM_qemumips = "-m 256"
>>> +QB_MEM_qemuarmv5 = "-m 256"
>>
>> Grepping for QB_MEM suggests there are other images which need the
>> same fix. Maybe good to fix all of them at once rather than one at a
>> time.
> 
> I do not know if other machines have this same issue with qemu, and
> this is probably not the best way to resolve this (as I really think
> this should be part of the machine config file, and have runqemu be
> smarter logic about setting the memory size).  I can open a bug in
> bugzilla and get back to it later.

perhaps we should define MAX_MEMORY to define this limit for every 
emulated machine and present a diagnostic if QB_MEM exceded MAX value

> 
>>
>>> 2.20.1
>>>
>>>
>>>
>>>
>>>
>>>
>>> 
>>>
