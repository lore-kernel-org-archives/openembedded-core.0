Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.4004.1629585077849114440
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 15:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QhPJ5zx+;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: o.kranz.88@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so3104682wmh.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=li9mt50Qu/yzwBIhBknxPKWJK/NTAkwtnvkddRw97YA=;
        b=QhPJ5zx+zfBUutqNDzGzgSiQMLNFNgNQyxI/vjZ+qzodaACxp5dTddu2P+1nv2us+L
         0Gc2EgqcYUlZqQAXM5ZplIk+TB6KJEUDNmnX4FQ96H6OEWzs+L84oaL+ZGASab+DUGLT
         kw0qus8fQJceXkuhr+dr5NWwqsvo6DPnzaMnVRu0m0cpbwtQI33lhWgmTj5XHrfx+/uw
         aL2pMLjUrYbpp4SulyeumejJGhLPQq4LQIyXxQIpzbm6r74xje9RQfhfzEP5do3xdfoX
         X4eisZH6fyVuSOXwfQseBeaxWQWaqWpy0wzrUgpXxVah/Q8GyCCCxirxDUeFWwa5tKd7
         NoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=li9mt50Qu/yzwBIhBknxPKWJK/NTAkwtnvkddRw97YA=;
        b=Z8Z6GBkHoAf2BCRgl2NQTO/xYiDVWmZQjbNEifVAzOL23FBpWDyQ/8Z2d4UVlo9Nyy
         KWoTp2olgGaqUlHdYvvIZWvY35pdrP7wY51eETTUCmSJGEiiMm3CxGOm9CZbqII2ff0f
         I+rkU81BLnqOnlj2bfmIebASP/qXQNJVm+/Kopht8sdRisQk3wAk1MgDueNz2q1ij71N
         hZRgufhjL+7E0M2S825oBXZJ5tJm0GqUaShdgDLrbpYgNXm4zc59HnefWfpKYO7Z4ueo
         5CnHAJ3h5056wn/jmorf8E8Yo+JC8zaiqUr6i4yEqTWpD3Dzx6fPir1dt1X7hRL7vdJ6
         BOQA==
X-Gm-Message-State: AOAM530pWpGTjSc+OqyFanpa8eERAbV+mDjMnQ5SoYd77NxwICFRPkia
	5zdE7crWKHrtCH/aiEOMYYY=
X-Google-Smtp-Source: ABdhPJz5V1t+K1pBHazzQLoQTXCaTBlm4FBRh4DLseSYsU3TaeUbKmmJUZJJuIlsvT0PkcwHVydAgg==
X-Received: by 2002:a05:600c:1ca7:: with SMTP id k39mr10256111wms.115.1629585076261;
        Sat, 21 Aug 2021 15:31:16 -0700 (PDT)
Return-Path: <o.kranz.88@gmail.com>
Received: from [172.16.1.139] (p54ab5306.dip0.t-ipconnect.de. [84.171.83.6])
        by smtp.gmail.com with ESMTPSA id b12sm9332078wmd.42.2021.08.21.15.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Aug 2021 15:31:15 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] goarch.bbclass: Disable GO_DYNLINK by default
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20210821200919.3064381-1-o.kranz.88@gmail.com>
 <AS8PR09MB46459A00E870A5B364082DCFA8C29@AS8PR09MB4645.eurprd09.prod.outlook.com>
From: "Oliver Kranz" <o.kranz.88@gmail.com>
Message-ID: <32bdbcc1-469b-2d7d-8a4e-7413f88fc4e2@gmail.com>
Date: Sun, 22 Aug 2021 00:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <AS8PR09MB46459A00E870A5B364082DCFA8C29@AS8PR09MB4645.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.08.21 22:26, Konrad Weihmann wrote:
> I'd truly like to oppose the idea of static linking by default, how 
> juicy this idea may sound...
> But if we switch to static linking, literary no one can be be sure about 
> licensing anymore (to me one of the major weak spots of go).
> 
I see your point here. The main concern was to get rid of the 37MB go 
std lib but I missed the licensing part. I'll have a deeper look into 
the golang linking.

> And I'm quite missing some numbers to back the claim that overall image 
> size decreases - for a certain component that might be true, but what 
> about the example of having a lot of go components in the system?
> 
> Judging from the commit message all I see as an advantage is that one 
> single module (which isn't even served by the core layer) is now building.
> 
> Could you please provide some numbers for the rest?
> 
You are right that it depends on the amount of go components and their 
usage of std-lib. Right now, I wasn't able to collect enough components 
to reach the memory overhead of go-runtime. There should be a break-even 
point.

So I can totally see the benefits of dynamic linking by default with an 
opt-out option (which is given by GO_LINKSHARED) to respect the 
licensing part here.

> On 21.08.21 22:09, Oliver Kranz wrote:
>> Static linking has the following benefits:
>>   - go-md2man (-> podman) compiles
>>   - imagesize reduces, combined linking overhead needs
>>      to be > 37643776 (go-runtime) for dynamic linking
>>      to be beneficial
>>   - reflects the default golang setup
>>
>> User can still enable it, if they needs to.
>> docker-ce, k3s, skopeo are ignoring the flag anyways.
>>
>> Signed-off-by: Oliver Kranz <o.kranz.88@gmail.com>
>> ---
>>   meta/classes/goarch.bbclass | 10 +---------
>>   1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> index 92fec16b82..6e9128e44a 100644
>> --- a/meta/classes/goarch.bbclass
>> +++ b/meta/classes/goarch.bbclass
>> @@ -31,15 +31,7 @@ BASE_GOARM:armv5 = '5'
>>   # Go supports dynamic linking on a limited set of architectures.
>>   # See the supportsDynlink function in 
>> go/src/cmd/compile/internal/gc/main.go
>> -GO_DYNLINK = ""
>> -GO_DYNLINK:arm ?= "1"
>> -GO_DYNLINK:aarch64 ?= "1"
>> -GO_DYNLINK:x86 ?= "1"
>> -GO_DYNLINK:x86-64 ?= "1"
>> -GO_DYNLINK:powerpc64 ?= "1"
>> -GO_DYNLINK:powerpc64le ?= "1"
>> -GO_DYNLINK:class-native ?= ""
>> -GO_DYNLINK:class-nativesdk = ""
>> +GO_DYNLINK ?= ""
>>   # define here because everybody inherits this class
>>   #
>>
>>
>>
>> 
>>

