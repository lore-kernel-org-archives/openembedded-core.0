Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D06AC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:45:22 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.30122.1644428721672135542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:45:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GM1HX/Aq;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id y8so2819092pfa.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=82aSlzP6f1rZKT7Fimmv1dcopt7c/CDovUHiVLzcXc0=;
        b=GM1HX/AqMdUB/pHeAVonRjbJUJRiW+SOMfUYbE2aIQTl9lJas11pBTk2aarqRClgdf
         2qin/I6CNScEu75bHVziCk2xkrAyke4MN8DKcyedwVE/I4pq5s4ozD1/AiWKvEtRPVtP
         +Vxpjrl555xYmyzCdMQoE2TrHz94Q6DCUADJ7RU4O4ykxN4d++/Bwqdi2HbwxCxZRXOU
         NB8v8UXGMFt2fgZNq9F+p1Wmy+3y8DtOBX/bA55y/nV/eQ6vboYB5+bIqV1b3twVMZ0c
         x9ZhbpYO3Tzx5ziu91A6AsnghEqse2WGcBPbS/GSIm2u4TrOl+ff/OMPupzESPHBAAQs
         3hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=82aSlzP6f1rZKT7Fimmv1dcopt7c/CDovUHiVLzcXc0=;
        b=49aclARUOCLeSakEWKRk9e02ky8Qrb9Bd0M0VNuw3kJrxWKVYPknV/026Da7heV20V
         JBAJDx2blFEUypeN76ZlRQKavXXZHxE1hVFbB+v/k2YBUlBpuDs6BMyY8WYymPErjBNk
         Yg2eb0gu0egcdhUpxOcN5GNECy5q+NbH3PwqLGSy5IvzqTIh5f18Wb9rV042CblYTcoT
         6ZikG3NwWqOpdCS9fstWx9L1nrSrVf5S6iMV7nk06nbFkCrfDLPjTzisZDFhII+wHa/T
         xkgn/RxIzCYf9VE0UphAeAl4QWpYsls2MIW/BDafs1W0M0ef7cyyvH5W2PQcW/OD+ncQ
         QrKw==
X-Gm-Message-State: AOAM533jMa4Ue0H3pUJr8kbCk2fBoDlIt//hRNMgzc/SBR1fX+E4ayu7
	B248yLpH2fldEReqV2Rmh3PXQZBXtRUZ7A==
X-Google-Smtp-Source: 
 ABdhPJzSPKTRkj4RJCVTjX0vTbVBKPO56C0PRVTcXY8HzPuoe3jkuag4gFX1nF3JuhW6tloQiN+/pw==
X-Received: by 2002:a63:1664:: with SMTP id 36mr2701908pgw.332.1644428720939;
        Wed, 09 Feb 2022 09:45:20 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:b8cb:a55c:1806:a3de?
 ([2601:646:9200:a0f0:b8cb:a55c:1806:a3de])
        by smtp.gmail.com with ESMTPSA id
 q13sm20284423pfj.44.2022.02.09.09.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 09:45:20 -0800 (PST)
Message-ID: <1fa6164c-8a8b-e706-2385-d9c04ace1c5e@gmail.com>
Date: Wed, 9 Feb 2022 09:45:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] cmake: stop FetchContent from fetching content
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20220209125315.3177811-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220209125315.3177811-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:45:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161580



On 2/9/22 4:53 AM, Ross Burton wrote:
> CMake includes a FetchContent module, which will download further
> source code at configure time.  With the network isolation this will now
> fail, but as not all environments support network isolation we can tell
> cmake to not download either for extra safety.
> 

what is cmake's default ? I think it could become a constant source of 
pain if it is not default. Since many cmake based packages might start 
to depend on it indirectly in future.

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/classes/cmake.bbclass | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 92b9197c487..fac7bbca7a3 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -189,6 +189,7 @@ cmake_do_configure() {
>   	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
>   	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
>   	  -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON \
> +	  -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
>   	  ${EXTRA_OECMAKE} \
>   	  -Wno-dev
>   }
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161554): https://lists.openembedded.org/g/openembedded-core/message/161554
> Mute This Topic: https://lists.openembedded.org/mt/89020454/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

