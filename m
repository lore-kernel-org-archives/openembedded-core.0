Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990FCC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 09:09:06 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.4076.1752570542323563804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 02:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K5uboLDO;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so9853796a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 02:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752570541; x=1753175341; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JmMeQIpxdOZC+2BB+1Y4eoV3gsYAcDChfmqo1kR5Zi0=;
        b=K5uboLDOU8pLpK2TcyU0x50MdeOkyI+QmQ0wYEYdqoRk4xOdncBYIFWdmDLmL4sUWZ
         lOUfr6+X18SlaBKUFRNTnUcx8qmc8rG87W1r0KD8IDll0SoUN0NanSZRirdMBpYvPtmN
         scIUta7wlfQ4vEefjZQmIj/ASBw9kjFLX3fNejuXN52tTr10rpcWjpRvtRxwiEzGotMp
         jADhU75jWH6od1twh6MlxkEEJ9fs0zDV1fhVFKkacPA1kt7AYGYavkdn94lBEGXB1fMk
         DPSx5SGlwegUcAHM0V3leikI99Sv7ZaiHvOfEXJBw2lyOBWZVdn9PO6jPgnguVfmNJ4n
         fq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570541; x=1753175341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JmMeQIpxdOZC+2BB+1Y4eoV3gsYAcDChfmqo1kR5Zi0=;
        b=Q2fVEAh0VFiW1XF0sVxWy5QHigSP2O75QEL5+E84bERM0V+Ez/QftoQCn7dxOGwoUl
         B8DOjhoAgaclwOWJOpSQFM9TRySrrKXrBNoOijsrb3a4O8cE+9/e7PCAN74tj6dUJ5dE
         iXfxihANFL2Ay24mdbEAdUgbQSRWCB5cn3PXiHmPH6m/e8SIZzBzF8ZhLZ3qrbLS6GMl
         pv+lxArUo6rJuZ+9MlpaHtmDHP3WS/QNZBoEcVzgMyX+SYfITN0cQMDoJS/UYKSHt8rw
         8dJXekKBzil+pHaWoylNxBSOAlOy0ZEnC+hlYYZXv6H5MEtg2Awo/8L03vEi3JMrX0yN
         X5Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWcCf/H/XYZTfsV4dmWyqztu6P5geq9solE0FVkUb6oNoZQRxYv0soc56+u15IcaosGVOr0ZLw6+pNqUNVKu8T8PQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyvPdW7s4tUwpwaJA6xUxb74VfbtMWk2GyTyHFj7mv/MP0O8dEP
	BZ+S+32G1BSKu9f2gUWzVXH2/7yEP7gk8EEokAersGOXbDxUMo9bK9AZ
X-Gm-Gg: ASbGncssC8F6vaSKflm06zNCNAqKo2s1rNe4SgcKZvQR5iBKYLV5isMfo7PnH82ZNaZ
	RN++Evfb+oX1C2USB4rstvuVB0BzwRsLykfr5g6xiOL2v89GfYiyhESDHpUGUG/nJzrIxVitpmz
	5D+ACLN9GquXKMXujasiOV+R2cAdxBhH1rRCf9+/AoyVvAgwa4tu7mUH2HsAGP2FvTRwybqgUid
	6dbCA3RLbmuNXyueF++0eFIbg/ppBdFramoql/G8Ep5I5bkz0finizeHkeRHRXO4APcgexKSsHh
	Dn0YW2vVwaLFVQCAuVgAQZ4N24fvcq9a8tcCYyDPbLauyhmLMoUNIEKkk11vM0H5uwoOCLzN2XM
	R6pfLYBS4SL9SaPEXXtdshKuB5MUTzmPzcaibbw/U
X-Google-Smtp-Source: AGHT+IF6fUYt0gvGAkjcMUEEV4/TMo2ri9t4AzZuTjkTWt4XXOMJZ4TEITP7igcSVRTSho76UBK4pg==
X-Received: by 2002:a05:6402:84d:b0:608:3b9d:a1b with SMTP id 4fb4d7f45d1cf-611e8490819mr14601528a12.19.1752570540426;
        Tue, 15 Jul 2025 02:09:00 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9542fe5sm6939075a12.35.2025.07.15.02.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:08:59 -0700 (PDT)
Message-ID: <07ce6170-7943-4470-808f-74d81d0a648f@gmail.com>
Date: Tue, 15 Jul 2025 11:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 18/19] u-boot: upgrade 2025.04 -> 2025.07
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
References: <20250715080819.622-1-wangmy@fujitsu.com>
 <20250715080819.622-18-wangmy@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250715080819.622-18-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 09:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220290

This patch looks identical to
https://lists.openembedded.org/g/openembedded-core/message/220004 -
however there are some build failures (see same thread)

On 7/15/25 10:08, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
>  .../u-boot/{u-boot-tools_2025.04.bb => u-boot-tools_2025.07.bb} | 0
>  .../recipes-bsp/u-boot/{u-boot_2025.04.bb => u-boot_2025.07.bb} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb => u-boot-tools_2025.07.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb => u-boot_2025.07.bb} (100%)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index 8600d4bab6..2734b318d7 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -12,7 +12,7 @@ PE = "1"
>  
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
> +SRCREV = "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
>  
>  SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
>  
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
> rename to meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb b/meta/recipes-bsp/u-boot/u-boot_2025.07.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2025.04.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2025.07.bb
>

