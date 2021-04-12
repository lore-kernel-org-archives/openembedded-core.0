Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.34430.1618241238662862898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 08:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EM7CZ0iz;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id z22so1426012plo.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=75Z+AOUqYzmYX6jExfNxIXV1Y2IsFu3gNGW/59jQZo4=;
        b=EM7CZ0izSSeg7LLKHtQ1ggw46CmB7G0RWdoEaAVq6uZdiAdB4PBVJDEzMKSZCpVvZ/
         9o1rq09OA2v23OiWVLrNYZST6kPCLvKEL2Xz/KaaRQqCx+fuNPzy9QQQ4D+ugAU7X/gc
         4IGlslrQRT+teQUuL8TJPROIrbV+u66AQk2Fbk6u7H7/VYqd0s41+GH/kegO/EZl4Z61
         r+zvuPnr18m+toO3mm80uZwM87CSFjXGtAax3MYzBnH8CbWNe4uVy3W7VbjhR0uKtklF
         aANexbzxldkavBh/bT/jH5E0AkR8jleljExNtCLJ9e0HTyM212V2yPJpahKTCTG87Ij4
         prZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=75Z+AOUqYzmYX6jExfNxIXV1Y2IsFu3gNGW/59jQZo4=;
        b=JSgKVkWVRtDUnQhHticWfQmKxt/p9rZ3lxenTGDd/9Mj81wWy2+wCC105Uu2bGPHwg
         skRH1uLJuyXL9dJrkn/dpXS7Z0g+epufB2EAGv/6WZYctHw53dNOBNOLnEos8ylv8t7n
         fx0JqQSORVw9Rh27QKZL77izg2GiFxCL7ZD2GOvggLQyhyiE5pgf/7oCujNpVlm/4g/G
         Sls2itok1PRwAecPJPGmPuZfPjbuGTQDGT+cneiXrkbZSFKT4QNACEBEvvuMEsY9wD2i
         z3Q29TTPDTRA2m1oamu0uuwXxaGNVkdB4vdiy8Q75T0Y2xme96N5Ps5+fnrlfukuvcfz
         QjEg==
X-Gm-Message-State: AOAM531WdcBlxPLZy0+xKVyUuKCUvudVJsAguR5AAlA15chkScLp9fk4
	jSyCy6350QTJ5WKeb+J6oNjQOZnrasRy5g==
X-Google-Smtp-Source: ABdhPJwQeSwEhzqpi7eJR+0Ht83H3vP+4qipdVWRywK2SaOI17P58riV8NIGeE2L1JCEwzK3C1cztw==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id lb14mr2259012pjb.155.1618241237793;
        Mon, 12 Apr 2021 08:27:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:fdf3:54f7:6dd5:3559? ([2601:646:9200:a0f0:fdf3:54f7:6dd5:3559])
        by smtp.gmail.com with ESMTPSA id p10sm10074370pfn.109.2021.04.12.08.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 08:27:17 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v3] gcc: Upgrade to 10.3.0 bug-fix release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210411202746.388822-1-raj.khem@gmail.com>
 <dd4c72b2aaf48cb7f015030e232bc2641e38f2ef.camel@linuxfoundation.org>
 <CAMKF1spL71KJfmpPT7F09gc=RB8NPgKFRewAtHhj7bFNp-H8Sg@mail.gmail.com>
 <b5a702f99841616420c8d82b013fd91aa0c11d9d.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <2fa1da72-593b-a064-5591-f75e571fe11b@gmail.com>
Date: Mon, 12 Apr 2021 08:27:16 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <b5a702f99841616420c8d82b013fd91aa0c11d9d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/12/21 2:54 AM, Richard Purdie wrote:
> On Sun, 2021-04-11 at 16:20 -0700, Khem Raj wrote:
>> On Sun, Apr 11, 2021 at 3:12 PM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Sun, 2021-04-11 at 13:27 -0700, Khem Raj wrote:
>>>> Drop aarch64 backports which are already upstream
>>>> List of bugs fixed is [1]
>>>>
>>>> [1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=298084&resolution=FIXED&target_milestone=10.3
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> v2: Fix BINV
>>>> v3: Fix maintainer entry to use PV
>>>>      Fix include poison patch which was old version
>>>
>>> Not sure we can put PV into a maintainer's entry like that as it is in the global
>>> namespace, it isn't gcc specific.
>>
>> I checked it with bitbake -e and seems to be effective.
>>
> 
> "bitbake -e" didn't show the correct thing for me so I tweaked the patch
> in master-next.

OK but its a bit confusing, here is what master-next shows fot me

% bitbake -e gcc-source-10.3.0 | grep "RECIPE_MAINTAINER="
RECIPE_MAINTAINER="Khem Raj <raj.khem@gmail.com>"


> 
>>> I also couldn't get this patch to apply, is it on a branch somewhere?
>>> ]
>>
>> Its on kraj/gcc11 branch on contrib tree
>>
>> https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc11
> 
> Thanks, I've queued up another test run.
> 
> Cheers,
> 
> Richard
> 
