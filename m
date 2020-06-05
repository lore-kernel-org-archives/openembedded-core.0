Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.211.1591385287076035342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 12:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TzWe47xP;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id y17so4096634plb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 12:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dag7CrxK5P734ehj6+ElGIVJiNPbgUPAzsXBjYxbpww=;
        b=TzWe47xP+Jz+1i5VJjZ/5pubV/u/5rPUVlZkLIPuPAWfw4mnlX5MCUWWPOxTdgLvno
         OOJxXr/fnq2LpSs9VvFHm5dBiiFrMm3MIxIPS9gl4N8VXR5bZCBlXmAp5eVdkDQ6Kf1S
         SPPImXjo05vDKz9VVEEWTLNTqgNVkJxEZVmH0nvkPwX4asClczJ0v85rPMLO6U7A6ENK
         aFSBP7QuatnM4EtnARsUVTu/ccqchp2WqmZjgJogizZ2S9haMufYqkqu6nfAmk8scOI1
         h4SOnv16+IwOT8wWYtDyF80ELngRw+qPuwSvXz60lUatBkBcZgXvQgyv5gaE8TQxJFfj
         YD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dag7CrxK5P734ehj6+ElGIVJiNPbgUPAzsXBjYxbpww=;
        b=mBiKpcsUOKTNIPhjIY/ulta44yIWml28XwonXDRAYVKnA35DjwAlMW7PQTDWzw9R6L
         hRCIoA2zOvEMc67pj1pvG9u6nnXld/17yh1Eoi7DBU4kpk0TZSY10Zzq+sKyfYr3jv3k
         xhMG+o2rFeKliLdsJCu6NtgkjFRRSjWT/lJ7n4NaBHk3XC5/ri8rG0hY8WUwXTpYkxIQ
         QVaVZY4ryHr3MciIhE3HT60/O8ye0QkoLR29wy4qz6DB3DHGcl5rFv4rd6XfSi0xGeqa
         VyhqUx5v0eNcygdhx/Z4hPvW+H4JLqcoxv8eCkre3fWn3GHidckC9N9O82Osb2KvEOFQ
         4HsQ==
X-Gm-Message-State: AOAM530DGifTYWqL/yoTaNpwlPZQSIXAiB2YsVwAvx7crSAV+K7hfpJ6
	nP8vmzU2ZslVg62tA/VsBW4=
X-Google-Smtp-Source: ABdhPJzpdyt0sxTn9RZM/AXAlK8/RUr77HAT3BVpIxjW2DPsRSqDXFa/GZchoyIB8sw97P/XbZYjxg==
X-Received: by 2002:a17:902:d711:: with SMTP id w17mr10814615ply.139.1591385286441;
        Fri, 05 Jun 2020 12:28:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:392e:a386:560f:8a74? ([2601:646:9200:4e0:392e:a386:560f:8a74])
        by smtp.gmail.com with ESMTPSA id k11sm281537pgq.10.2020.06.05.12.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2020 12:28:05 -0700 (PDT)
Subject: Re: [OE-core] Status of support for recent host glibc
To: Yann Dirson <yann.dirson@blade-group.com>,
 openembedded-core@lists.openembedded.org
Cc: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <CA+4=imbTdacbhmydbXLTMQm8jvNoZJfzt17Y0ZcR2gRAC7LQSg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <b5226094-b53d-e9b2-d23b-224bdb305dd7@gmail.com>
Date: Fri, 5 Jun 2020 12:28:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CA+4=imbTdacbhmydbXLTMQm8jvNoZJfzt17Y0ZcR2gRAC7LQSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 6/5/20 6:10 AM, Yann Dirson wrote:
> I just got hit by the following dunfell build issue on my debian/testing 
> dev box:
> 
>   argp-fmtstream.c:(.text+0x4ca): undefined reference to `_IO_fwide'
>   /home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld: argp-fmtstream.c:(.text+0x51d): undefined reference to `_IO_fwide'
>   /home/yann/yocto/meta-blade/meta-shadow-os/build-boxv2/tmp/hosttools/ld: argp-help.o: in function `argp_failure':
>   argp-help.c:(.text+0x1fb1): undefined reference to `_IO_fwide'
>   collect2: error: ld returned 1 exit status
>   make: *** [Makefile:60: localedef] Error 1
> 
> After some digging I found 
> https://patchwork.openembedded.org/series/20136 whose patch 4
> addresses this very problem.
> 

Please send a backport request if its not already done so and Cc Steve 
Sakoman ( dunfell maintainer ), also  check the supported hosts list for 
dunfell

https://www.yoctoproject.org/docs/3.1/ref-manual/ref-manual.html#detailed-supported-distros

this case is not seen on commonly supported distros hence no request to 
backport perhaps. Debian testing is rolling distibution and its hard to 
support time based releases on top of rolling host distributions.

> I could not find any discussion about those patches (it's hard to be 
> sure though, I found the
> new mail archive quite impractical).
> 
> Are there any reasons why this 2019-09 series is still NEW ?

I know its confusing but
For OE-core and bitbake too, patchwork is not primary tool for 
cherry-picking patches from mailing list, its email based, since its 
primarily driven by maintainer's convenience more than anything else. so 
dont read into status of the patchwork series status.

