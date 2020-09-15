Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.323.1600185376402095840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 08:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NsMxRsf1;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id g29so2227952pgl.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V8SRagJn8Iec8TUA9pKWTYrKGAZbAvG288gtNNznfjs=;
        b=NsMxRsf1ttuhpZWDaLXLnS203L1ffBOCa/V7V4ItcuY/ibTRftUsaI1tMswsNGfzx5
         O8VXSKYf99Qvxg68tgMnRDUwvWNfiHDf/w0UvmtXcbbTS2EOKlDsMafdh1R/2KtiFwAk
         +dK1VTe/l87FtAp1B7P28//fM2N9gzx0yj8WkMDnGw6XIlSne8//QM5Oerls8Qh+K+1h
         BapB5i6MuE07OhIFNPfexKB1iMUAFUrCpehySlX7+v7Uq4FLfaXKTxUDwsYUrNzDr9JQ
         NOvZzKYlonGk3ff0TpBvSR5BCrVR2G4F9JcHfRvR7JhgVb3/phAdaUvDLSmZQBuZJRQC
         3ZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=V8SRagJn8Iec8TUA9pKWTYrKGAZbAvG288gtNNznfjs=;
        b=o/TpJnpdnLuy6uZQerxk9rVHgJyZ2gf1w9uhiN7J9e6cFbJxf0FOdTvmKYHcQQkM10
         EIzCpFyXsjK/YP4oPHntU4tPzf+WqCl83yoIRLHcra9dR9T46goVdi8+9a1rO9M6aKDc
         ql23oUhmh8drL7hYWSY5aaVzmHUk4K/eM0k0lQQ6mkcmViXgSAfGigSWrADQmkHe5DCB
         ZiHsU6KPcNtjGXUJqdBr6+No+ifvZvit4fRIZT/7InHoOyGaLicXeJrm5tAosd0w/UjN
         MdO09gzYX1Mgx2d7LjNt+QGdqHasj4V54ca2op0PsJ7/A/QWBEDAv5uuXmWHjmeBd0Vp
         Kh0g==
X-Gm-Message-State: AOAM5303IX1STsozu6CiDEwgUWxhFhrsSFPsGIG/74AoXK0+16IznK7e
	uTaDp5BvoPlq5IhPQfW29KGNrny2yLfYcw==
X-Google-Smtp-Source: ABdhPJyz1KMjg/4YyDig0b9gByxPqUUkhKayWp9mWqx1Vc3GbGxLRHF0gu1VpweB25W7B3H0VeT9Hw==
X-Received: by 2002:a65:4984:: with SMTP id r4mr14770583pgs.261.1600185375407;
        Tue, 15 Sep 2020 08:56:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:65be:52e2:459a:b2e1? ([2601:646:9200:4e0:65be:52e2:459a:b2e1])
        by smtp.gmail.com with ESMTPSA id ga3sm16403pjb.18.2020.09.15.08.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 08:56:14 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 3/4] weston-init: Enable RDP screen share
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200912210406.3328090-1-raj.khem@gmail.com>
 <20200912210406.3328090-3-raj.khem@gmail.com>
 <CAAnfSTtv9uqkKKddk2PNxK=j-p=-zH0g-1tcvePmADhaCSg7KA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <76288a67-ea1d-6d53-0915-52de72b5bc9f@gmail.com>
Date: Tue, 15 Sep 2020 08:56:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTtv9uqkKKddk2PNxK=j-p=-zH0g-1tcvePmADhaCSg7KA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 9/15/20 3:21 AM, Ross Burton wrote:
> Is this really something we want on by default?
> 

it is only launched on demand, I see other layers overriding default ini 
file to add this so thats why I added it here so they can use this 
config from core.

> Ross
> 
> On Sat, 12 Sep 2020 at 22:04, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-graphics/wayland/weston-init/weston.ini | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
>> index 1e6dff68fd..b48726d59c 100644
>> --- a/meta/recipes-graphics/wayland/weston-init/weston.ini
>> +++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
>> @@ -68,8 +68,8 @@ require-input=false
>>   #min_accel_factor = 0.16
>>   #max_accel_factor = 1.0
>>
>> -#[screen-share]
>> -#command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
>> +[screen-share]
>> +command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
>>
>>   #[xwayland]
>>   #path=/usr/bin/Xwayland
>> --
>> 2.28.0
>>
>> 
