Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63F4C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 09:51:07 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.126136.1680688263055029816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 02:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=tZ8WSVCW;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso2472141wmq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 02:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680688261;
        h=content-transfer-encoding:in-reply-to:cc:organization:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SisAxKJ4d1XAmVsxyTyw576oTy2+g3W9T0tgUVxVn1s=;
        b=tZ8WSVCWoAs41D+HpGfeTSKxJmPDx3yfvDNSJXvAOqZKaYTR8baYlmQcb9m3bAYwYI
         mSiLREbfKORouQRD+hIkyVAV53lWKQe7uXX/YrXiWWmy9GNvMcAVKyRmQf+bMnOhXmup
         xx6zXTLeTqvg4hlGAb4aiIk41BEBqxzzB0+QhOGC24IRW1B5Ktd0GSxAmIQpgDxHAycU
         SHFHLirdJal+3ZuNyhSU47KIHXDuzRKyALWC8B+R5L4Mx5XzEdRe0Xwy1lbZM5TaLTQR
         YelOIm0vqNG+S6s9uRnfQcBNjGb4/CQypqrHANgEEBMdAEfEE7MctVQRRScIEATreRNo
         4yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680688261;
        h=content-transfer-encoding:in-reply-to:cc:organization:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SisAxKJ4d1XAmVsxyTyw576oTy2+g3W9T0tgUVxVn1s=;
        b=lTVE4wYiUx8CFT0WdUGion2ItFTcQQv5IKNunVh/dX1di8kTZQIk6lQk4DShl1uUOt
         yfXc/yfe1Wj67tprYbgvsNbTvA3BqRixjiYV+Nciw7NIPZEaK9yYX8OOSsUeZpjvgTlT
         6bnXor+4fbHpQKr8Dkzfj+hyXEsfuKfbXSRdi32qAh90OjDuL9kq+kaZdawViM6BuHtt
         Obs7uyrl4WbWPZ6nHQkarDPAa8c0x5y0eUuqIxQlPVskHkkgvVASK2fhRRDSMKgw5jP1
         pd/FHG4PUYEm+V08PYi1gessp4dMAEJo4N4mnBgeJM/rOdDDPFmZdqywJLrPBpxcG5FR
         Ffvw==
X-Gm-Message-State: AAQBX9d+RPCB33QPM9rRZdQAGxsQDmuV1N8QO4NE3U55iDWhcxprFCEv
	dMXugMDUXnN+/L4XplXRwSPT2A==
X-Google-Smtp-Source: AKy350ZjzYs207vjvBlsXg3utX4qBQzJYFeXzEThdaU5F29jmXeNOJp/nI4NjmQ4A7FdKReBdonhLg==
X-Received: by 2002:a7b:c04b:0:b0:3eb:39e7:3607 with SMTP id u11-20020a7bc04b000000b003eb39e73607mr4502296wmc.4.1680688261317;
        Wed, 05 Apr 2023 02:51:01 -0700 (PDT)
Received: from [192.168.0.10] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c025500b003f04646838esm1614636wmj.39.2023.04.05.02.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 02:51:01 -0700 (PDT)
Message-ID: <9eab4d61-3939-0703-1d81-e998f8957e99@smile.fr>
Date: Wed, 5 Apr 2023 11:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: Exclude some issues
 not present in linux-yocto
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230404164400.403462-1-richard.purdie@linuxfoundation.org>
 <9cb0aae1-c1be-ab0d-2263-1ab2f928c885@smile.fr>
 <eaa125c5ba2c1a13837c65df4a961abab5f5373b.camel@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
Cc: Geoffrey GIRY <geoffrey.giry@smile.fr>
In-Reply-To: <eaa125c5ba2c1a13837c65df4a961abab5f5373b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 09:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179730

Hi Richard,

On 4/5/23 00:26, Richard Purdie wrote:
> .../...
> Thanks, I tweaked those bits. I did a bit more research and the other
> easier looking linux-yocto ones to mark up are listed below along with
> the versions known to contain fixes. I'd still need to map out the
> revisions and so on for these but several look like they can be
> resolved for our versions if this data is correct.
> 
> That left 13 linux-yocto CVEs that would need more work to track down
> and 5 non linux-yocto ones.

Some of these will be part of a patch from Geoffrey (in cc) that he will send in an hour or 2.

> 
> CVE-2022-2196: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2196 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=2e7eab81425ad6c875f2ed47c0ce01e78afc38a5
> 5.10.170
> 5.15.96
> 6.1.14> 
> CVE-2022-3424: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3424 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=643a16a0eb1d6ac23744bb6e90a00fc21148a9dc
> 5.10.163
> 5.15.86
> 6.1.2
> 
> CVE-2022-3523: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3523 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=16ce101db85db694a91380aa4c89b25530871d33
> 
> CVE-2022-3566: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3566 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=f49cd2f4d6170d27a2c61f1fecb03d8a70c91f57
> 
> CVE-2022-3567: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3567 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=364f997b5cfe1db0d63a390fe7c801fa2b3115f6

All of the above will be included.

> 
> CVE-2022-38457: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38457 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=a309c7194e8a2f8bd4539b9449917913f6c2cd50
> 6.1.7> 
> CVE-2022-40133: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40133 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=a309c7194e8a2f8bd4539b9449917913f6c2cd50
> 
> CVE-2023-0179: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0179 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=696e1a48b1a1b01edad542a1ef293665864a4dd0
> 5.10.164
> 5.15.89
> 6.1.7
> 
> CVE-2023-1079: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1079 *
> Fixed in
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=4ab3a086d10eeec1424f2e8a968827a6336203df
> 5.10.173
> 5.15.99
> 6.1.16

Not these 4 above.

> 
> CVE-2023-1118: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1118 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=29b0589a865b6f66d141d79b2dd1373e4e50fe17
> 5.10.173
> 5.15.99
> 6.1.16
> 
> CVE-2023-1281: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1281 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=ee059170b1f7e94e55fa6cadee544e176a6e59c2
> 5.10.169
> 5.15.95
> 6.1.13

These 2 above will be included.

> CVE-2023-1513: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1513 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=2c10b61421a28e95a46ab489fd56c0f442ff6952
> 5.10.169
> 5.15.95
> 6.1.13
> 
> CVE-2023-23005: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23005 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=4a625ceee8a0ab0273534cb6b432ce6b331db5ee
> Disputed?

These 2 above will not be included.

> 
> CVE-2023-28466: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28466 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=49c47cc21b5b7a3d8deb18fc57b0aa2ab1286962
> 5.15.105
> 6.1.20
Included
> 
> CVE-2023-28866: linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28866 *
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=bce56405201111807cc8e4f47c6de3e10b17c1ac
> 6.1.22

Not included.

Should I write a patch including the missing CVEs from Geoffrey's patch or that will clash with your work-in-progress?

> Cheers,
> 
> Richard

Regards,

-- 
Yoann Congal
Smile ECS - Tech Expert

