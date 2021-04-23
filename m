Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.34.1619200873030298554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 11:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W8yCnGlN;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id z16so35706818pga.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 11:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yrReaftsqXxgMmd9Noj0nzVCYFWwrgIbUMAe+BVszSE=;
        b=W8yCnGlNj1vQIZtQ+rK5S/F02TSIxGPOPFw1AobHgZmlOuW1LpN4wSBiF6+gqpiDma
         2b4x3W9pQE1MdKHgynZtbI2GR64PF+jo83dy6h91in3FSx1+IHM6yz3osM1vd66nIt/h
         cj+hQxvqeIaLg43IUKYJ7iZypG8/l2DUCMn8Hrkm9zDJiYK+GhULynMyZCPMnZ1aF7ha
         1UrIuaBkddL+6FlRsOGfp7dKDL+hervOi9VaJV2u3BS/hMVmRHur3GPJBECpcraRVA4S
         pJ7brqNZiBPBlNVU+SAlDU7Ylkox91TQrY142PNNVduv8I6Nc93wz7Cjp+kSGCefiAAJ
         Oixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yrReaftsqXxgMmd9Noj0nzVCYFWwrgIbUMAe+BVszSE=;
        b=HieitSj/AxsKp3uaPOgJGocfvw4srbnp3LKvvcqlBwAx4wT5UU53SlDUDiJO3nNyrG
         RH/CRduN/UcUGRQE3910GJ3eWB+9gRKGwRflCMkZw3eToDt/HFR5NLyetXj0P1WurZiL
         fcwmON7B9s6pBhXgzHBL2oQFxLoA9rpJxFKsbB9bKuOFANseiVqNkoXfCJrzFyw1Dkqp
         WmcEA9BIGWUbl2hKJPTf3B8E6kR0FTm4gn2h/pntcNPaOmWenDi8kv3hj185+rW4vK0A
         T4BLx4/zPqfPvNTz7IFxo51GDvEWaQpt0AIFXPp18wZNzlBPrNTc5UK/AuKjo6YjAEOu
         CT8w==
X-Gm-Message-State: AOAM533x8SinwsTIVci+NZOOHibZ/V0/Qzwgb04hAPonfvjlc9rtr5Kn
	TdESlIswKTmu438PMfESuw9tMYgOtypWgA==
X-Google-Smtp-Source: ABdhPJzJ4Uif0fZBU3Sc+s6YUpJNhUO7Lx2wCdjhZ8EcISptP+bycGRAMEsWtrUkZjVuhivQyoHEOA==
X-Received: by 2002:aa7:93aa:0:b029:25e:31ca:756f with SMTP id x10-20020aa793aa0000b029025e31ca756fmr5195322pff.70.1619200872183;
        Fri, 23 Apr 2021 11:01:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:11fe:f444:6c85:56b? ([2601:646:9200:a0f0:11fe:f444:6c85:56b])
        by smtp.gmail.com with ESMTPSA id 186sm4913851pfe.212.2021.04.23.11.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 11:01:11 -0700 (PDT)
Subject: Re: [OE-core] Need suggestions: in case where linux-lib-headers and the kernel versions differ
To: Sourabh Banerjee <sbanerje@codeaurora.org>,
 openembedded-core@lists.openembedded.org
References: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <57e178c2-1711-9e6a-ce71-227d4dd7e7cd@gmail.com>
Date: Fri, 23 Apr 2021 11:01:10 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/23/21 8:03 AM, Sourabh Banerjee wrote:
> Hi All,
> I need your suggestion on how to reconcile if the linux-libc-headers and 
> kernel versions are different?
> For this discussion let's consider we are using the LTS branch YP-3.1 
> (Dunfell).
> With Dunfell let's consider following 3 cases:
> 
> 1) Machine is supported on 5.4 kernel
> *Kernel Recipe:* linux-yocto_5.4.bb
> *libc-headers:* meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>      There is no conflict in this case as libc-headers and linux-yocto 
> are on same version.
> 
> 2) Machine is supported on a higher kernel (let's say 5.10)
> *Kernel Recipe:* Let's assume provided by a BSP layer, linux_5.10.bb
> *libc-headers:* meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>      The kernel version is higher in this case. But, should be okay as 
> 5.10 UAPI is backward compatible and supports  
> linux-libc-headers_5.4 completely.
> 
> 3) Machine is supported on a lower kernel (let's say 4.19)
> Kernel Recipe: Let's assume provided by a BSP layer, linux_4.19.bb
> libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>      The kernel version is lower in this case. I suppose, this may lead 
> to some runtime issues? As the kernel built from 4.19 will not be able 
> to support 5.4 UAPI fully.
>      What's the recommendation here? Should the BSP provider port 
> linux-libc-header_4.19.bb in BSP layer and 
> set PREFERRED_VERSION_linux-libc-headers = "4.19%"
> 
>      I suspect this as UAPI headers such as following differ, and what 
> if this leads to runtime issues in case #3
>        -  videodev2.h: This header is enhanced in 5.4
>        -  fsverity.h : this header is not present in 4.19
> 

right. all this combos should work fine in general case, however they 
all are not tested with equal coverage. So best is always to try have 
UAPIs older or equal to the kernel you intend to use. Generally releases 
support supported LTS kernels and that should be good enough, however if 
you have very old kernel and want to use latest yocto release, be aware 
that we are not testing it with those old UAPIs so all testing falls on 
your in this regard.

> -- 
> Regards,
> Sourabh
> 
> 
> 
> 
