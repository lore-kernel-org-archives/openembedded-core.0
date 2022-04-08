Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC00C4167D
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.1286.1649446799039781625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JYsyu4Bl;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id be5so2804223plb.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=5iRJILtENjOnDh/amiA7kFR6sfXPr0Ni3SJ2v8SBqeQ=;
        b=JYsyu4BlZmpx0Xf9+2UMSzhroGuYpY7dSu2DEkDDBGrxU2lyAdqyRXuR3oMTgmBxuW
         uCPIB3vOPbnAlgXNcoS1D9fUTNgmcoGNJeIdRb1+Lx5mAWA2J1sI34zeYym4FNB9kcPZ
         7S8BB3/DfivnS2OxZ/QEqfC2a+GIGSpOpqZBETu0n2T1yEvorm4q9HEmkcYoNFILljcV
         ng1K7gwskPJff4IaPBdTRLJHm61ChNN27ZjUzgfqLrRWvYPAM5Krv4hnVsnFrhfEg1pq
         M9r80/bTSfSwu+lfSs4SBVenjEY1N8PG6NyTk4pPE5hMmOGfyQihDy53D0eUOBbM8uvd
         0+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=5iRJILtENjOnDh/amiA7kFR6sfXPr0Ni3SJ2v8SBqeQ=;
        b=XodcICC2GjfkJ+u10cbgq0sbSXZMk7hQcv+f0GwjQzo6kQUAbz3KAZ2tb276oG3fCh
         xvRkDr4NHQhIFo5BMEiBMpEAJb1/vEObfu9QwH2TyaaTzYRSaEVhJD+AwwXX8cVABMhm
         Uy3drZ7OLqv6hcpliPtg0iux+fVg3+LdRUeHYlbSkVDHzrdqqMOamOb0wpClVaNExJZg
         q10ltp9lX0BGFj6fohoC/GgY01NnhVokjHjYRsmLq8gUvjVPLHGx4BrcRsRtUxegN+MH
         ds834EYBJYaK2TrTE/LQOrDQbrBBevoOChQ4sg8NKnaR9qoRGTcDpDnB0rdviTkfn2vK
         nEmA==
X-Gm-Message-State: AOAM533Umslx0YG/gCWQFYJzGM3HwaDjrphHXf42QhmQJUVEQaoh5UJg
	O2bnTcRP/+ovvCulJCKJ/hNwwnTcqV7JMw==
X-Google-Smtp-Source: 
 ABdhPJxNMOJzM4J6qzMJ/o23O4OczYDn5+kyP1BUyA1uKgMKgWPg3lf7MvN/oT5mRPMFYuGm3+ZZrA==
X-Received: by 2002:a17:902:8c96:b0:157:990:c9b7 with SMTP id
 t22-20020a1709028c9600b001570990c9b7mr9558731plo.118.1649446798323;
        Fri, 08 Apr 2022 12:39:58 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:55c2:182d:f2d6:dc4b?
 ([2601:646:9200:a0f0:55c2:182d:f2d6:dc4b])
        by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm26895629pfu.62.2022.04.08.12.39.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 12:39:57 -0700 (PDT)
Message-ID: <6f6d562e-f33f-e528-4dda-ccc4bc444b74@gmail.com>
Date: Fri, 8 Apr 2022 12:39:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2 5/6] poky-tiny: add a distro description
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220408192521.1608764-1-jdmason@kudzu.us>
 <20220408192521.1608764-6-jdmason@kudzu.us>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220408192521.1608764-6-jdmason@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164170



On 4/8/22 12:25 PM, Jon Mason wrote:
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>   meta-poky/conf/distro/poky-tiny.conf | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
> index 499af906a898..91c596faf182 100644
> --- a/meta-poky/conf/distro/poky-tiny.conf
> +++ b/meta-poky/conf/distro/poky-tiny.conf
> @@ -32,6 +32,7 @@ require conf/distro/poky.conf
>   require conf/distro/include/gcsections.inc
>   
>   DISTRO = "poky-tiny"
> +DISTRO_NAME = "Poky Tiny (The Smallest Yocto Project Reference Distro)"

maybe replace 'Distro' with Distribution

>   DISTROOVERRIDES = "poky:poky-tiny"
>   TCLIBC = "musl"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164167): https://lists.openembedded.org/g/openembedded-core/message/164167
> Mute This Topic: https://lists.openembedded.org/mt/90343239/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

