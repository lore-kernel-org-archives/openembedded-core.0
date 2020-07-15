Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.299.1594843052168385444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 12:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IqBaZ73v;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id l1so3582732ioh.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 12:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lhogL40aQIWHfOs+VU84/LjBnhRVBIxj0iHeRIO6a0A=;
        b=IqBaZ73vvn/TiK95Ua00cpX5Xl3sLc7Wq53Tfo7bz8ivcgvwWGHAeHWbItNFSmqD6p
         C9y5OOazzZyKCiwFFxDBJh1fBpPOeNuj3R+ifGRTjGxGG4h2AbYnr7xeiWkkfrEHFyA1
         D8Z971SDEdbNDyhmp6q+tMberHWEStNBd3DNHoC4HgoQ3YxaLzR9ZAuyAHfBPhFxVCyj
         HfH0Ba5HRGEb9OnAEKtkeQB2dWMZOLFlRinU9UvRHsyf7tY9vHg00/tgaKHRQAgP5G7B
         srjoL+BclHjAdmUMl19WkkAr7420/kAS3ucIT7sR3gxFCm+pxjtXx34m77L656IYG9Ad
         vCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lhogL40aQIWHfOs+VU84/LjBnhRVBIxj0iHeRIO6a0A=;
        b=KIA0ZtC/+yYhoelFG2PXg75vdDZjC/RamkbRI2Rb5x6Y+s1a7QGVH5aAn8jfAQ56uE
         5wDcMIk/F8ZBDn2R5Vp9Hc/v2mPCWJGp/b7uR2SxURit9JFXUe+E496jGq/STBc0mOk2
         e6+OFKuOPFLVPTaG+Uid7BJTLybvApQsw7ZJ94D73b1KqpBu76YMNp3UOxsMJyH3hHYb
         /fqYMswDHYMGYJV06Ei3Bu5ihodK3pMMBkNgrtCFlXkHa4YlnTKkdf7Tzb3etUqo9c0e
         aasx475dYhehtUdC9a9M4K36sB1HUy5QpZruifUD63yKBAvJlDgi/cQcU9ScQaKBIHWD
         Q7qQ==
X-Gm-Message-State: AOAM532Fn1tbWlCCMi+3Q5o472Z5pA30JtNtwnOAxpCzl/qkVMjAhOCq
	iLhXQupDdsk9T+eoPAPLKo0=
X-Google-Smtp-Source: ABdhPJyCpb0dSmWC2PF2iZIgG3HnK6ADE26JHsu3rYsN9687dQW8OetCJiQAsDg0EprJ8FQctA9IeQ==
X-Received: by 2002:a5e:dc03:: with SMTP id b3mr907002iok.97.1594843051506;
        Wed, 15 Jul 2020 12:57:31 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:a8de:37f6:bed5:6e4c? ([2605:a601:ac3d:c100:a8de:37f6:bed5:6e4c])
        by smtp.gmail.com with ESMTPSA id g1sm1797899iov.38.2020.07.15.12.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 12:57:30 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH v8] expat: Added ptest
To: Randy MacLeod <randy.macleod@windriver.com>,
 oleksandr.s.popovych@globallogic.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
 Joshua Watt <JPEW.hacker@gmail.com>
References: <20200430165529.23657-1-oleksandr.s.popovych@globallogic.com>
 <9c6bfc2b37121a36c866bffff3f72efe91e847aa.camel@linuxfoundation.org>
 <CAKqUGW-3RDNU1SFmy9egAbPv8AEOfGBHWb9o34O0P2TxF3boMA@mail.gmail.com>
 <b4996474-6945-9542-0b73-1eeb1499250c@windriver.com>
Message-ID: <dffc8b1e-ba48-eb47-9607-6e4a2bca1393@gmail.com>
Date: Wed, 15 Jul 2020 14:57:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b4996474-6945-9542-0b73-1eeb1499250c@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/15/20 11:54 AM, Randy MacLeod wrote:
> On 2020-06-03 8:48 a.m., Oleksandr via lists.openembedded.org wrote:
>> Hello Richard, Joshua,
>>
>> On Mon, May 11, 2020 at 3:45 PM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> ...
>>>
>>> Thanks, this is definitely getting there. There was only one test
>>> failure this time, with meta-mingw:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/1884
>>>
>>> I've cc'd Joshua in case he has any insights on this.
>>
>> I`ve tested my patch with meta-mingw layer on my host and it seems I
>> have fixed the current compilation error, with making some changes to
>> meta-mingw (by changing "CMAKE_SYSTEM_NAME" variable to "Windows"
>> value during toolchain file generation in
>> "recipes-core/expat/expat_%.bbappend" file using a
>> "recipes-devtools/cmake/cmake_%.bbappend" file as template). However
>> this is only part of a solution, because another error appears next to
>> it: gdb-cross-canadian that depends on expat now fails to build,
>> because it can not find a proper expat library. It seems that expat
>> recipe, which was switched to build with CMake in my patch, does not
>> generate output library in proper format (it compiles only
>> "libexpat.dll.a", when the current version of expat recipe from
>> upstream, that uses Autotools, generates both "libexpat.a" and
>> "libexpat.dll.a"). This is such an error that I can not figure out how
>> to solve it by myself, so I ask for help.
>
> When I was cleaning up my inbox, I noticed this thread had gone idle.
>
> Ugh, I have no idea about Windows, Joshua any ideas?

I don't have any idea either. If you can post a patch to the meta-mingw 
mailing list (yocto@lists.yoctoproject.org with [meta-mingw] in the 
subject), it might help provided a little more context.

>
>>
>> Additionally I would like to ask you: How should I send patches now
>> when at least two separate patches with similar purposes should be
>> sent to different layers (one for [OE-core] and other for
>> [meta-mingw])? Should they be connected with some kind of cover-letter
>> or is there another option?
>
> I think that if you just CC the maintainers and mention the dependency
> in the commit log or wrapper email, then things will work out.
>
> Thanks for continuing to work on this Oleksandr.
> Hopefully v9 will work well and be merged.
>
> ../Randy
>
>>
>> Thanks for your attention.
>>
>>
>> 
>>
>
>
