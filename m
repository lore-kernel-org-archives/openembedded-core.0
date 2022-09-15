Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC37ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 07:28:30 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.7228.1663226901021939373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 00:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pTY5ClTq;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id z25so28996111lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 00:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nFrtITttYx7ohzA9vyFgYcvsHREvuGCWzT8xV9SwqHg=;
        b=pTY5ClTq+oH8gNvnn/QlmS9mlX523ba8M3FfsW28kRAeWoukXRVSFC4GlmSbGoCKBq
         swybkzvcYjQjkbcLt/Lvlpa3bb4Yo8IPuO1mUMB6LWB0CnOoyi+2XDYV0K4eNPBsfus4
         Rp26idns/bRQmQ0iEjzvQiA2s1Ji5/nHOSMybsEHK+ZNIJi7Uv47DLUxxrTb6OVFEBSp
         PH+OuZktFsKyR1HQ92h77kpIYJnZF3xOnS9OzSIOG8m1lN1Aw4RkEHX1cgMMVgDVptnU
         uOrXBV5H5TwwB2P4ssxCWRuUwTvE3sMjqZXnEjMMIqUbtS/UfE0a2pWxZHvxte9keRAE
         fluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nFrtITttYx7ohzA9vyFgYcvsHREvuGCWzT8xV9SwqHg=;
        b=LQTHqh+RIdslp7b09jgD4jNDpNzdGC23Hou+c4X32SGoYqkAlDj6Uxei+HLEgIzPVL
         ECURIXviPf/JYjRd+JYUH0uiPXKf+1V6HiG/8/f/leTKXjGXRwUhM3fItNJ7iKb+Ly6C
         C9qFUqSWUqUtBDNQ2VEEXtoC9E8W9HNelInxtMMQsbZ6NbPQludRyZT5IUSH9rO99J0N
         tE2YLSJdvA6EVDqWOPMZC6OsEHbQJO3oRL3z0Cvh0HF2584I2Vj9M0kwn90mx5/GCNaq
         3+isSPaH9ZU54dA/lAo5o5jkF/OJlnSmGnBANb65dVUtPaUPfMARiuU7G1aDZ0jrKhAf
         pKag==
X-Gm-Message-State: ACgBeo1Ry10CdVvawyX5fUQpoCJWMN/nOVCyBtRCwLDpHUBbHjzXkmiI
	Ls9Cs7+7I4OOPBP19h3JuA==
X-Google-Smtp-Source: 
 AA6agR5I3kcG00TkFXvOFGXPCDJ0eJx5bUBfJsGBSeZaVPinj0hmlFwUth0E+BuuOZEahmpTB8RDbg==
X-Received: by 2002:a05:6512:1520:b0:492:daab:8382 with SMTP id
 bq32-20020a056512152000b00492daab8382mr14042144lfb.151.1663226899148;
        Thu, 15 Sep 2022 00:28:19 -0700 (PDT)
Received: from [192.168.1.248]
 (031011128148.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.148])
        by smtp.gmail.com with ESMTPSA id
 c3-20020a056512324300b004946b7593fesm2821422lfr.198.2022.09.15.00.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 00:28:18 -0700 (PDT)
Message-ID: <41567c10-d4b1-9d9a-6a7a-bfb282da06fa@gmail.com>
Date: Thu, 15 Sep 2022 09:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH v3 2/2] nfs-ganesha: Replace unfs3 with
 nfs-ganesha
Content-Language: en-US
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220828174356.3074391-1-ptsneves@gmail.com>
 <20220828174356.3074391-2-ptsneves@gmail.com>
 <17143CF1C30D4B98.24896@lists.openembedded.org>
 <04dc909a54c792368fa9285f32160c4c3e39ae8d.camel@gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: <04dc909a54c792368fa9285f32160c4c3e39ae8d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 07:28:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170681

Hello Adrian,

Sorry for my late replies but i can only work on this effort 
sporadically. I was not aware of the issue of runqemu and given that i 
am progressing slowly i definitely will follow the breakdown you suggest.

It is taking me quite longer due to the fact that ntirpc is not 
compatible with tirpc. I spent sometime trying to make it so but it is 
huge increase in scope for the current delivery.

ntirpc is also requiring some adaptations with musl that i did not 
anticipate. Some upstream discussions are also taking a bit longer than 
expected.

Paulo Neves

On 9/14/22 23:19, Adrian Freihofer wrote:
> Hi Paulo
>
> Is it possible to do the transition from unfsd to nfs-ganesha step by
> step?
>
>     1. Add nfs-ganesha
>     2. Refactor runqemu-export-rootfs to work with ganesha.nfsd instead
>        of unfsd.
>     3. Remove unfs3
>
> My conclusion so far is that just removing the unfs3 recipe would break
> runqemu-export-rootfs and some features of runqemu. Therefore I would
> suggest that you send a V4 which only adds nfs-ganesha as a first step.
> Note: There is also a typo: The "-D" from USE_ACL_MAPPING=OFF is
> missing.
>
> Regards,
> Adrian
>
>
>


