Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web10.18813.1590690827852510059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 11:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gn+nSHeM;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id u23so3135651otq.10
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 11:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WvFaX5ACICfP/6W9X2haDEPxRJ0A3psF6GOaOVQTXuc=;
        b=Gn+nSHeMZ+sWx/aHJjxWmrg5Yj2ZqDT/EfsJLjwtoi4l3ToI7rRVvKiH8vuQPPO1ql
         y4T+9qqkOEFQll+NsXyXjhkIY8J0I1YwdiCtQ7ULGZEG8ojHGHHShK2R5kjz5PStKAU6
         azzRF3nd5K5LIsR8xcnqJ8SajFz+iavdY2lkuR45wZJ55A5KFyNJjHH/Da09HL0jk9B8
         bE50Xvx53GYWZfszXC8u1bydTofX1yBnrV0t/vhNEF0EDxFpkxHUE26BSQmbh+1S9kk0
         O7B1iUBxonbv2c5ishRkxV/w2hqtg2NK6iI9QFSB4RshoK20LWgdeG4e2teSABHMwOVJ
         PGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WvFaX5ACICfP/6W9X2haDEPxRJ0A3psF6GOaOVQTXuc=;
        b=cTEfvkRefBp/7FRVAUWQl8O9mOLJ31VFfYBO5sdgMkxMqDBX+QxrwniVdB3b4/Kg56
         wruAocfME5UBzD79zK/TbgPXQMX2FZdpCnk8OhSJT7zQnCm5/OMpyrdAEA2NYvcZTMA7
         OiG0swDnZXAsLsZ9g2pkpMWd1JlQH60vKZEHPkLCLO8nw3LjlNNG/zJtF/TwTCGZW++a
         UQLNvREyNs5GPjKFWo40HS+5W+RDEwoWplhv0CvfhVQEa6+0sdIbEv+Xdpp/CanQUzOb
         dAuseVkUL626Kqkp7wvANX+MC+ug+M+nQ78mE3LasHPgFqhEGknuRZ1CH7aPpBdApLot
         sssg==
X-Gm-Message-State: AOAM530Gjr72c0LxKXz1GFhIvtuX2zOSbr7hUSFIEQPMs2SL1f1YVILJ
	7V7pjQ0RUCS4vO/0u/tEEZCXy6LuwAM=
X-Google-Smtp-Source: ABdhPJxv62ZeHzxSFcSHXALz8T1fLOSh87j+s1qkmXlb2kyVP8PLri6E3mLqk/QIOGKGMGFojIXVgQ==
X-Received: by 2002:a9d:4a85:: with SMTP id i5mr3104683otf.358.1590690826852;
        Thu, 28 May 2020 11:33:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5cfb:80e2:2942:9b65? ([2601:646:9200:4e0:5cfb:80e2:2942:9b65])
        by smtp.gmail.com with ESMTPSA id h8sm649040ooq.39.2020.05.28.11.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 11:33:46 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
References: <20200527155011.3165976-1-raj.khem@gmail.com>
 <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <20200527231145.GO17660@denix.org>
 <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <7f778511-3aff-016c-4c54-10990ba2b033@gmail.com>
Date: Thu, 28 May 2020 11:33:45 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/28/20 6:20 AM, Richard Purdie wrote:
> On Wed, 2020-05-27 at 19:11 -0400, Denys Dmytriyenko wrote:
>> On Wed, May 27, 2020 at 10:25:31PM +0100, Richard Purdie wrote:
>>> On Wed, 2020-05-27 at 11:59 -0400, Denys Dmytriyenko wrote:
>>>> On Wed, May 27, 2020 at 08:50:11AM -0700, Khem Raj wrote:
>>>>> asm/bpf_perf_event.h does not exist in older kernels e.g. ( 4.1
>>>>> )
>>>>> this helps in using common header across multiple versions of
>>>>> kernel
>>>>> going back
>>>>
>>>> This check should have been there from the beginning and for
>>>> every
>>>> header
>>>> file. It's big PITA to sync this list up, especially when dealing
>>>> with
>>>> different glibc or kernel than OE-Core, e.g. external toolchains,
>>>> etc.
>>>>
>>>> Any objections to making this check more generic for every entry
>>>> in
>>>> the list?
>>>
>>> Yes, a strong objection. We don't want to support or encourage
>>> every
>>> kernel version out there.
>>>
>>> I also don't understand why people need to change the libc-headers
>>> anyway :(
>>
>> I already explained my use-case with external toolchains - those
>> usually come
>> with specific set of libc-headers. And when those don't match the
>> list from
>> OE-Core, it causes problems, trying to support some resemblance of
>> multilib.
>> I believe that got disabled completely now for external-toolchains
>> anyway...
> 
> Right, external toolchains I can understand having specific version
> requirements. What I don't really understand is external toolchains
> would come with their own headers in most cases I can think of?
> 

this is not a freestanding toolchain, but hosted one, so they need to 
provide OS (linux) headers. think of case where apps are build just by
using this toolchain outside OE, app devs are not expected to provide 
these headers.

> Cheers,
> 
> Richard
> 
> 
