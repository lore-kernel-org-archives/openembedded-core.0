Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web11.18702.1590690684476793212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 11:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sGepObr8;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id 69so3165128otv.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dFMvqmvq1AGNYPdt24nMELjsL0mKCZTGV/Rd5ULDzfc=;
        b=sGepObr8nmdjKuILI3sABk8TI0GQ31wUxYlexTv7SJ5iyYGHWzvPlcflh164BhPCK8
         +dQaTVnlM2X/LwjArlEBzplMZ/T6MqOy3NRQIxKeM2xvn+fbT4CZTtXmJ9hE/aVb51/3
         PYnwdyC6e8gYSJvEowkZw1OoFTIL5vHnrrJS3e5el7X94RmvbZ2UTn2To7FZQEzZw9t0
         IS3VQkNrtHI2WQ65nBXMmR75ZI7aRlY0+EDgDcGNNr7Fdx01hw7GNVT0/qE+TlRr6Wu8
         govYBF8hqw6AkDyJRryUgom3r/wCexGC/OnNGFKuJZBrKYSoQ/6EDwX1KIsxGV/6iLZc
         mFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dFMvqmvq1AGNYPdt24nMELjsL0mKCZTGV/Rd5ULDzfc=;
        b=gOvIh2BdkEJFArM7/D13lPm82WK8JeaaJnpU1W2wsjs6rVx11X7zstjwJ8jW22HVJZ
         srK8hkq3p7YdFTNgpPkd9ACy+HbMZuXm2VfN3fsHGEukRWjC7zVxYujpwQZB1JZNSy4O
         o3ZMqZX/1C6Fljj75B9bylFfTIVmx/e+rf+LyiPnEBfD66kEQ05DXUrLaB85FassbIMe
         83YQlRnFP+I7SHDz6bdUwr9MD7ApD98hu5oaFN7WLUutPQh2jkh0NZvTM2bYpRwUhojf
         l/kjZxz+NvgK4CL/rpKY6fyvwd6RHQSqopBb+mQqk0qErKHIlzIe7/RoVpq5SWYKx6bl
         O/RQ==
X-Gm-Message-State: AOAM533jUok9o3O8BKcfF9eW30c1TIXKz/VOkHHZrzkNqxPPC2PhwUXs
	zFbu+W7kqk/KmyHRewiY6FSfIcn5fNQ=
X-Google-Smtp-Source: ABdhPJwBDcvhoSsGCZqHmVaYjVTtJWgdrdLGSTzAdsnYjv5IibCYlP0KlpU1iK7obzuu1DaqtNXzAA==
X-Received: by 2002:a9d:a6a:: with SMTP id 97mr2932720otg.305.1590690683318;
        Thu, 28 May 2020 11:31:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5cfb:80e2:2942:9b65? ([2601:646:9200:4e0:5cfb:80e2:2942:9b65])
        by smtp.gmail.com with ESMTPSA id d93sm1814685otb.19.2020.05.28.11.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 11:31:22 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Adrian Bunk <bunk@stusta.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>,
 openembedded-core@lists.openembedded.org
References: <20200527155011.3165976-1-raj.khem@gmail.com>
 <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <20200527231145.GO17660@denix.org>
 <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
 <20200528133912.GB12536@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <43053348-df9f-8375-ee93-848873f0d446@gmail.com>
Date: Thu, 28 May 2020 11:31:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528133912.GB12536@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/28/20 6:39 AM, Adrian Bunk wrote:
> On Thu, May 28, 2020 at 02:20:02PM +0100, Richard Purdie wrote:
>>
>> Right, external toolchains I can understand having specific version
>> requirements. What I don't really understand is external toolchains
>> would come with their own headers in most cases I can think of?
> 
> What I don't really understand is why kernel 4.1 was mentioned
> in the submission.

it is set as an example when using kernel 4.1 to provide kernel headers, 
since its a .inc file it can be includes by other linux-libc-headers 
recipes, if thats not the intention then it should be merged into .bb 
and intent made clear.

> 
> At kernel 4.1 times the latest gcc was gcc 5.
> 
> gcc 5 is not even supported as host gcc in master,
> and target builds are only tested with gcc 10.
> 

what is this statement for ?

>> Cheers,
>>
>> Richard
> 
> cu
> Adrian
> 
