Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45E7C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 17:30:03 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.363.1642008602960050670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XdeQkZEk;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so13539609pja.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=0/W+BMyiVgS0VkrF7XiOJScXnkrgQxbrPRdo5D3OpXY=;
        b=XdeQkZEktJOCTA1LvpKZpoDllTksj0ed2KFhUMbvSAUlPXtzTatN+gKiG1xSht44Ut
         mYO+9+RPW1cW0iNNMHHoqn6h5YVwhgUkFd4Te2vhLshvrgHFbXOxeqmBPAVvkn/rrdNX
         it/KDWUZ2K6OrhbLLrlHaoidKToiC5tCnk7nC1i+7/HiJ68dKaouWQ7C5rF1svMMMq9H
         ie4azw+fIktsB8TiqX+AyUzj0hZo+wN1vFh3o5ghEb2K3qAglSIrZY25fOf0IopdIE/X
         qtnmsJfvaManKPDrxH9sQAcZmUunJUaQGH266JL1jo8JB4dt5wB+oew+61zXStlZ7Td5
         XMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=0/W+BMyiVgS0VkrF7XiOJScXnkrgQxbrPRdo5D3OpXY=;
        b=P4TpLnk6b6sW1xlZ100XOhKT/A40R6l7uBQFCGPosICBlKpNrZUbFbb8HL2katpIcP
         GmxAFc3nTTxQmX74XEBJLTsLPDc0w/P7EAwHrA+6W+bxKbKOTYu9GLxrJl3PBNLwSfVj
         ALd+NSZtfz9n/RyeEY6HPJv7I1pFUgvYUdsafgLqAQg1bLVnHkQ+nNlub0a/YuDELxkj
         APZA9iQwK3bYF1obFeThMJx5c9/AtYVSctyhxK6wE1f2JRkr0M9gi8evTGtmgYHRDFei
         4kw2kp0e7rbZS5T0p7KE9bXB1xu4x3oT3lnj66LfKHl6UPHnYhCgVSFlG/cKUZi4Tu3p
         VECQ==
X-Gm-Message-State: AOAM530I+14IldYWdRRykGjjwQzB4bEq+KSVK+IAwSXo488Sau8Hhz/s
	LS42a3BBN4eee39APLvdVltNzU71zo46YQ==
X-Google-Smtp-Source: 
 ABdhPJzHb2TSeNkdri6J1EKt78zF8M6HGzXdi85OQUJiYp+0NzQ0JI50XS4nrYECVV/kzLRleyzvpw==
X-Received: by 2002:a63:ac55:: with SMTP id z21mr627352pgn.72.1642008602313;
        Wed, 12 Jan 2022 09:30:02 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:9932:4bf6:8df9:9596?
 ([2601:646:9200:a0f0:9932:4bf6:8df9:9596])
        by smtp.gmail.com with ESMTPSA id
 nk19sm307959pjb.26.2022.01.12.09.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 09:30:01 -0800 (PST)
Message-ID: <337f48d3-805c-a061-1aa7-d30e6845490f@gmail.com>
Date: Wed, 12 Jan 2022 09:30:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] tune-cortexa72: Enable the crc extension by
 default for cortexa72
Content-Language: en-US
To: Kevin Hao <kexin.hao@windriver.com>,
 openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220112090708.1597301-1-kexin.hao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220112090708.1597301-1-kexin.hao@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 17:30:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160496



On 1/12/22 1:07 AM, Kevin Hao wrote:
> The crc extension is optional for the ARMv8.0 but is mandatory for the
> cortexa72, so there is no reason not to enable it for the cortexa72
> tune. With this change, the cortexa72-crc seems redundant. But we
> had better to keep it to be compatible with the BSP which already used
> that tune.

this looks good. Is there a way to warn such users to migrate to better 
option ?

> 
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> ---
>   .../machine/include/arm/armv8a/tune-cortexa72.inc    | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> index 3651cf6e802b..4c9add32f5f5 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> @@ -10,12 +10,12 @@ AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
>   ARMPKGARCH:tune-cortexa72             = "cortexa72"
>   ARMPKGARCH:tune-cortexa72-crc         = "cortexa72"
>   ARMPKGARCH:tune-cortexa72-crc-crypto  = "cortexa72"
> -TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a} cortexa72"
> -TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72} crc"
> -TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crc crypto"
> -PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8} cortexa72"
> -PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72 cortexa72-crc"
> -PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
> +TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72"
> +TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72}"
> +TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crypto"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8-crc} cortexa72"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
>   BASE_LIB:tune-cortexa72            = "lib64"
>   BASE_LIB:tune-cortexa72-crc        = "lib64"
>   BASE_LIB:tune-cortexa72-crc-crypto = "lib64"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160480): https://lists.openembedded.org/g/openembedded-core/message/160480
> Mute This Topic: https://lists.openembedded.org/mt/88369540/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

