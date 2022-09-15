Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDC9ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 11:18:51 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.8608.1663240730152365575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hSX0HjMu;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id o2so27649323lfc.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=EEe0QFRJzapkvTM/lsfsZlKNd4i4I2ORWZDJwIUT+Ws=;
        b=hSX0HjMumBSbQOGaLgkrGGatsZotkFrLLhMGzw9CdGSB0gjlPwiQKNKckecNk0/A5I
         x2Jaw3oZblfiBSTjzPb1zaWmv5FaqjmTBU69qH6m6sCXx3wWSy8PXFFWCZMvzPRLPeQO
         0UhoFkbOZVYnBDUPvm7j2enYKMxF3xN1J3Zw3K5weveGBuVeUYLJv6/F4G4Jq9cEzNLE
         +xWe/aaBy27adNBMZngrjzKMFN2bU/OuILYQk6rdEr1Ar9GUU8NJu4TbbPfINzG/d11y
         HdHvSJn9dKobtH+E1Uydj9UCGgxMdDlUwHiBVg2FmPrwVW1cf5Bl9sK9q/cp0cqjH1kU
         5m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=EEe0QFRJzapkvTM/lsfsZlKNd4i4I2ORWZDJwIUT+Ws=;
        b=VW+5SP6Oxq3JpNWG7xlUDwCC0zLzM+7cHG9MoJgfEg6jMACCKv5Q68IuudfzwiPLLs
         90MJZfK2DLzWxKcVaJ2y66T0eHcjAquIkc8RYbHLFQUSgOl6iWEb9+RTcL6rZFKOWudp
         jfocUeCNmMOgXhFlWKcNjnYJ8Rw6qYKEVoXWfwp8QqqgY3wriSM2WenJnP3ULaDeS+6r
         WR/AtffVf4KvipG3MrDv+NNEWKOpWEU7UBFsV9Q1HmoC+CljpegMDQ2RIzyM3+jmAJhe
         zOh/KoIoGsSgOBBZ+d00meq41qBgTpBkbEhQxOGEgKKP7T8Z6CqHUeEK1he+835VZfVw
         D50w==
X-Gm-Message-State: ACgBeo2Yj+ZO/IaJaMvzV5A4wOC6Roy/hMaSRpBq8nep0MNb4HGEHt7T
	EAJnoTRXBAZMtDfpBbSceQ==
X-Google-Smtp-Source: 
 AA6agR5m0PPVcMX/sPXx03isOObOkqiHOhtsH89o5isVPUXafeweHOqxzklAKKmze5IzNB2MV67eCg==
X-Received: by 2002:a05:6512:2627:b0:492:d275:eb01 with SMTP id
 bt39-20020a056512262700b00492d275eb01mr12620086lfb.284.1663240728234;
        Thu, 15 Sep 2022 04:18:48 -0700 (PDT)
Received: from [192.168.1.248]
 (031011128148.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.148])
        by smtp.gmail.com with ESMTPSA id
 a24-20020a2eb558000000b0026c12b9b354sm2199561ljn.0.2022.09.15.04.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 04:18:47 -0700 (PDT)
Message-ID: <4084d4d1-5cc4-fdb7-0c26-543dfd30c1b4@gmail.com>
Date: Thu, 15 Sep 2022 13:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH v3 1/2] ntirpc: Add ntirpc recipe
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220828174356.3074391-1-ptsneves@gmail.com>
 <C8950D71-C267-4624-A510-E0F81BFB4FD2@arm.com>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: <C8950D71-C267-4624-A510-E0F81BFB4FD2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 11:18:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170689

libntirpc is not compatible with libtirpc. Some work would make it so, 
but it is not a trivial change, i tried it :)

Not only the API is different, the pkgconfig presents itself as ntirpc 
whereas most dependencies of litbtirpc specifically try to detect 
libtirpc. A good summary of the differences and the feasibility is in 
this page [1].

I can break the extending of liburcu into another commit no problem.

I was able to break the circular dependency as well, with a patch that 
is already for review upstream.

[1] https://bugs.launchpad.net/ubuntu/+source/nfs-ganesha/+bug/1843403

On 9/15/22 12:50, Ross Burton wrote:
> On 28 Aug 2022, at 18:43, Paulo Neves via lists.openembedded.org <ptsneves=gmail.com@lists.openembedded.org> wrote:
>> ntirpc is an actively maintained rpc implementation. We cannot completely
>> remove libtirpc due to arising circular dependencies where ntirpc
>> depends on libnsl2, which in turn depends on an RPC implementation.
> Can you split this into a series of commits?  Extend liburcu, add ntirpc, update the recipes to use ntirpc.
>
> Ross


