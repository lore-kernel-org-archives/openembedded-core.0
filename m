Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651AFC6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 13:38:45 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.8079.1680874717750088655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 06:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=TMY523gS;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id h17so42321378wrt.8
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680874716;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nt9PqW0kAb9k97T4/liId5NfOgi9gGNaEaGOL7zdwbE=;
        b=TMY523gS7jAYT+B7UPKVloZqfIfN/WTSuAugslghtionnUsj6l2K/hdkwmw2i31OTc
         zFsDLz86kjE2DGeePrG+mVzA9UbpvJNeRlmX83Vi+mvgC6NCG13D1aAkppWMCQs8Jeyh
         cNefycj/oBm6vOQQgzAXmG8nKXPzy7gFZfZl48PH0eBcRonYQTbWL28/ODZ+QhPTx7kb
         3BvuBEybHUFiqv1IKS40OnB1XSUk3FAsebONplnIeRWJghEFBPgGkiXiTinuGTk+Q8D+
         rU5TnUYn8Bx/Dzds+ctevVCHROIuwRv8WB31wJDD7BFp3FMlqlw1H8gIB6eTTLmgD5pF
         xbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680874716;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nt9PqW0kAb9k97T4/liId5NfOgi9gGNaEaGOL7zdwbE=;
        b=2Xd3U6pXKtF7AfGFZJu027CS21RyHltbqgcF3t0w2mRSekr4ki7dvLWK+ByNR5X+yo
         Hoju1WcVXSMoOKBEnurk+QHODRqRghRq9fE3brlSaajUpHCyupG7c1gpOyDwRuXnvc6t
         MWPayMC1V8TNri1O/n1u6NHaT2Cvb7Zu8PHRkMDPup0+Z/EHGc7l8kqwEbdJ+AguSQ23
         Mxge/nmHRKoQLafXMPLJW5TD7jNd91+mlX28rbeCIduvUOy+P4F+3GcyItimDgr2Ji/9
         gdpzAvUGy681RUPYnqsZoHzeF1s6EChW1jZocYkmff1rusUVmx2kruWnrRs7e3q1BP50
         Evtg==
X-Gm-Message-State: AAQBX9fd8e/zuLx9VW8/O6rwbjpzgyJ98p17tujufrnXKsFSS+4xrU3p
	7578yNf4798/7ytppf+XDgivxw==
X-Google-Smtp-Source: AKy350ahyhl/W+EQlqGrz/9VIkNs+qGMMRW6YUbZ1pmhMnfXwNnbGW3+YPiyaLtJz2djn13oPPul6w==
X-Received: by 2002:adf:cf05:0:b0:2d2:29a4:4457 with SMTP id o5-20020adfcf05000000b002d229a44457mr1192256wrj.13.1680874715839;
        Fri, 07 Apr 2023 06:38:35 -0700 (PDT)
Received: from [192.168.0.10] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id m15-20020adfe0cf000000b002c7163660a9sm4489448wri.105.2023.04.07.06.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 06:38:35 -0700 (PDT)
Message-ID: <6179e5dc-6d8d-948a-16c9-7d9c0eb43933@smile.fr>
Date: Fri, 7 Apr 2023 15:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] cve-exclusions: Document some further
 linux-yocto CVE statuses
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230407105840.635561-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20230407105840.635561-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 13:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179819

Hi,

On 4/7/23 12:58, Richard Purdie wrote:
> Add some information about some further kernel CVEs which don't apply for
> either linux-yocto or don't apply for linux-yocto 6.1.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/cve-extra-exclusions.inc |  7 +++++++
>  meta/recipes-kernel/linux/cve-exclusion_6.1.inc   | 13 +++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> index 0b895985015..76dab1d630a 100644
> --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -438,6 +438,13 @@ CVE_CHECK_IGNORE += "CVE-2023-1073"
>  # Backported in version 6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
>  CVE_CHECK_IGNORE += "CVE-2023-1074"
>  
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-1076
> +CVE-2023-1076: linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1076 *

This line is a misplaced copy/paste maybe? (the URL a redirect from/to the one in the line just above)

> +# Patched in kernel v6.3 a096ccca6e503a5c575717ff8a36ace27510ab0a
> +# Backported in version 6.1.16 b4ada752eaf1341f47bfa3d8ada377eca75a8d44
> +# Backported in version 5.15.99 67f9f02928a34aad0a2c11dab5eea269f5ec> +CVE_CHECK_IGNORE += "CVE-2023-1076"

If you want it, here is the full list of backports for this fix : 
# Backported in version v5.4.235 d92d87000eda9884d49f1acec1c1fccd63cd9b11
# Backported in version v5.10.173 9a31af61f397500ccae49d56d809b2217d1e2178
# Backported in version v5.15.99 67f9f02928a34aad0a2c11dab5eea269f5ecf427
# Backported in version v6.1.16 b4ada752eaf1341f47bfa3d8ada377eca75a8d44
# Backported in version v6.2.3 4aa4b4b3b3e9551c4de2bf2987247c28805fb8f6

> +
>  # https://nvd.nist.gov/vuln/detail/CVE-2023-1077
>  # Patched in kernel 6.3rc1 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
>  # Backported in version 5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11f7
> diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
> index ec7ff9c1a7b..b74e9675e15 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
> @@ -13,3 +13,16 @@ CVE_CHECK_IGNORE += "CVE-2022-3566"
>  # Patched in kernel since v6.1 364f997b5cfe1db0d63a390fe7c801fa2b3115f6
>  CVE_CHECK_IGNORE += "CVE-2022-3567"
>  
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-38457
> +# https://nvd.nist.gov/vuln/detail/CVE-2022-40133
> +# Patched in kernel v6.2 a309c7194e8a2f8bd4539b9449917913f6c2cd50
> +# Patched in kernel 6.1.7 7ac9578e45b20e3f3c0c8eb71f5417a499a7226a
This is a backport, this line should read:
# Backported in version v6.1.7 7ac9578e45b20e3f3c0c8eb71f5417a499a7226a

> +CVE_CHECK_IGNORE += "CVE-2023-38457 CVE-2022-40133"

This overlaps with the patch I sent here :
[PATCH 1/2] cve-exclusions_6.1: ignore patched CVE-2022-38457 & CVE-2022-40133
https://lists.openembedded.org/g/openembedded-core/message/179775


> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-1075
> +# Introduced in v4.20 a42055e8d2c30d4decfc13ce943d09c7b9dad221
> +# Patched in kernel v6.2 ffe2a22562444720b05bdfeb999c03e810d84cbb
> +# Backported in version 6.1.11 37c0cdf7e4919e5f76381ac60817b67bcbdacb50
> +# 5.15 still has issue, include/net/tls.h:is_tx_ready() would need patch
> +CVE_CHECK_IGNORE += "CVE-2023-1075"
> +

That said, the content is good :
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

