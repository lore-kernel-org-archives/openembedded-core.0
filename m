Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.932.1629480870141718928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 10:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f/bFM84/;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id t42so6641054pfg.12
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=jsw4BsNFCXKeOle7+aaLlL5WRoiT6vuERMm1tN0op0c=;
        b=f/bFM84/bdtcs7mT91nrwdam+QjCWWGgjCPHYv3OYJoAfCt9RVx/jrc9e9ks829Qje
         cKdZ0p9dNShGNYK7kGImWjON5DnEH1uWso5F8mkVpw9Aj+aU9IP6PvnbbW9B2POIHgOy
         oFI+BaFvBzDhyynzeyDjrpQcRmZPNa9zhQWFTuWCXULoRCSThsNfZGCNE6xvcLIDK9vr
         pu8MBUphHxHp1BAYz0hpcB+wpk3u+bBBe1KkSs7dRkOVAJM09xiHFOsmqAL5GW8WPMCT
         YppwAPI4d2JilEYN2ImIJHaMDpYjN9xNoT5dJ/pfH0lj+dC98nvqfi5qsErL+x9dSNPi
         GPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=jsw4BsNFCXKeOle7+aaLlL5WRoiT6vuERMm1tN0op0c=;
        b=O/L/0U+1b+sjkLvShmqAITqajoVYRtXgAEEuwDE7voJnK6037lQWrMtVkv/ZpZEaRQ
         ah5lNNKcjQVqDhmUfRrqsdXnUdqhu5xYkCiBhskJRFPya61EbeWmRlSe7k/XFJecdmrV
         N9mowpL6tudVrhXEFHRD+qgz6NpgH2PALztYhmhA5Y2tXzJRj3BPhVBc8MH6T8+5PbqC
         wZYcx3fACKTuQvg+fRG6uVvuKQbmyXABE0suSfs/zWFHQBjg4rMDc9GTWB1VvdIKvkzC
         Yqa465IsqFGzHWjXRfi7FTjiy4laMYyQH5qHsGoOwkwzsqSVBUIGu5m75oyTcbGGGI7V
         f4Fg==
X-Gm-Message-State: AOAM5331A7Ep+tIQzLH49ve0GOumue3PjUQhgWIFOByFOIs/Qo9pnC1q
	qztQjmWigqwZPIHpkuI+gEYaQk448VE4ew==
X-Google-Smtp-Source: ABdhPJyXK6TeCH77I1WYeshct9MX2Mj7CfZCAd/ysB7WZTtvCXjoesre/kP5j2mSRTqc7Ilw/xFy1A==
X-Received: by 2002:a63:154d:: with SMTP id 13mr12265268pgv.404.1629480869321;
        Fri, 20 Aug 2021 10:34:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:7cf5:888d:b618:582d? ([2601:646:9200:a0f0:7cf5:888d:b618:582d])
        by smtp.gmail.com with UTF8SMTPSA id a6sm6621044pjs.40.2021.08.20.10.34.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 10:34:28 -0700 (PDT)
Message-ID: <bd668eb2-7062-cf7f-f03b-0432aa59894e@gmail.com>
Date: Fri, 20 Aug 2021 10:34:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0
Subject: Re: [OE-core] [PATCH 0/2] support building for Android target
To: openembedded-core@lists.openembedded.org
References: <20210820061150.146518-1-randy.li@synaptics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210820061150.146518-1-randy.li@synaptics.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/19/21 11:11 PM, Hsia-Jun Li wrote:
> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> 
> You may check the meta-android-ndk I posted to the -devel
> list before.
> 

These patches look ok. Can you explain why we want to ignore canadian 
sdk for bionic ?

> Hsia-Jun Li (2):
>    cross-canadian: skip it for Android bionic
>    machine_dict: Add Android OS to it
> 
>   meta/classes/cross-canadian.bbclass | 2 +-
>   meta/lib/oe/elf.py                  | 8 ++++++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> 
> 
> 
> 
