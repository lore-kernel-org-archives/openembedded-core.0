Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F04C77B61
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 16:02:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.12618.1680883356112411613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 09:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=JS8Tqg/C;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id s13so24245198wmr.4
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680883354;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcAz53+u49t8OFUXZcpj94Ugz3mfhotc/scz6JyJFQw=;
        b=JS8Tqg/CE/HVdQd+rbF6KTOLWIWm7ESAHfeQmHCytlcT3t6vICaqxdQlC+tO7HRkHF
         oraLm8VfTaFumJeYZ8Tu1RVU6YE+dBzADQTHavPNJEGhZOMbiNlB0IJUYQzFd8imMTdH
         3xl3Jic8Hoa12onJaGAhPdFi4OOn3dJmQcy94wME15LPAwMRKJDD7qYqUQw6204kYEdF
         MRJMnTws7BNryc0MNo00TgboOGbxSjktq60IqjD1pUy77dqIH4KvXZtgqFxsRT+VorDa
         dPigdw5J459yREjuTf+vnRfgRtPIojj5n9gwGcsyehqJ/wKcv12nVIqA2QFIgSWVIWDB
         vedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680883354;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcAz53+u49t8OFUXZcpj94Ugz3mfhotc/scz6JyJFQw=;
        b=hB0wO6P+gOciW5HS1MriETqGZLrP0oyqvDkUxiAhciQcZq+ieScrECLV/+akPTXMpU
         qE4ZTneWOQB8WmcDy2zLOZa0MX5XfyEAZwp4qUSu93fIEk7Q6S2M85bXR+1VVe+AAj8e
         ChEgg9GPea6G9RLtFrIk98zQvkm7HtGQr5aFpzWGxE+LHmZz0xjxFZO7SljsKfcIbtCs
         LZcksBhwhffy9LzX5UkIueosTx8eCwmo+eDKBQKwqhslyxGZQr42IFsw1EB43aBGlVD9
         RzTwUkSYTaGMU3YUqr88A87GvlAGvjZ7lgMynpMU9za34HvcTjRreg8NKX0LwgS184fQ
         os7A==
X-Gm-Message-State: AAQBX9fOFhaYJBdnpjq1UjK6MVe4R1StdJ8DEo3fJH91Ns7rA51HDsJr
	Q8WoleKuAC+DyQufCNhvrRnUcg==
X-Google-Smtp-Source: AKy350bIZJ+97Fi9MyLug/4veXbrQwdKFPBcy6aUzNh48IG68rV2K91z8Xl09yL1xvPSZJGFsWCN3A==
X-Received: by 2002:a7b:cd0b:0:b0:3ef:d8c6:4bc3 with SMTP id f11-20020a7bcd0b000000b003efd8c64bc3mr1572155wmj.24.1680883354161;
        Fri, 07 Apr 2023 09:02:34 -0700 (PDT)
Received: from [192.168.0.10] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c1d8b00b003ef36ef3833sm8779514wms.8.2023.04.07.09.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 09:02:33 -0700 (PDT)
Message-ID: <a52e3cef-be07-509d-6c9d-01c14f7a0414@smile.fr>
Date: Fri, 7 Apr 2023 18:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH v2] cve-exclusions: Document some further
 linux-yocto CVE statuses
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230407142427.642876-1-richard.purdie@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20230407142427.642876-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 16:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179827

On 4/7/23 16:24, Richard Purdie wrote:
> Add some information about some further kernel CVEs which don't apply for
> either linux-yocto or don't apply for linux-yocto 6.1.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Perfect!
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

> ---
>  meta/conf/distro/include/cve-extra-exclusions.inc | 9 +++++++++
>  meta/recipes-kernel/linux/cve-exclusion_6.1.inc   | 9 ++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> index 439d569f7d0..8965a15b371 100644
> --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -438,6 +438,15 @@ CVE_CHECK_IGNORE += "CVE-2023-1073"
>  # Backported in version 6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
>  CVE_CHECK_IGNORE += "CVE-2023-1074"
>  
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-1076
> +# Patched in kernel v6.3 a096ccca6e503a5c575717ff8a36ace27510ab0a
> +# Backported in version v5.4.235 d92d87000eda9884d49f1acec1c1fccd63cd9b11
> +# Backported in version v5.10.173 9a31af61f397500ccae49d56d809b2217d1e2178
> +# Backported in version v5.15.99 67f9f02928a34aad0a2c11dab5eea269f5ecf427
> +# Backported in version v6.1.16 b4ada752eaf1341f47bfa3d8ada377eca75a8d44
> +# Backported in version v6.2.3 4aa4b4b3b3e9551c4de2bf2987247c28805fb8f6
> +CVE_CHECK_IGNORE += "CVE-2023-1076"
> +
>  # https://nvd.nist.gov/vuln/detail/CVE-2023-1077
>  # Patched in kernel 6.3rc1 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
>  # Backported in version 5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11f7
> diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
> index 8b32c2b2dfb..aeea77a2249 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
> @@ -13,7 +13,6 @@ CVE_CHECK_IGNORE += "CVE-2022-3566"
>  # Patched in kernel since v6.1 364f997b5cfe1db0d63a390fe7c801fa2b3115f6
>  CVE_CHECK_IGNORE += "CVE-2022-3567"
>  
> -
>  # 2023
>  
>  # https://nvd.nist.gov/vuln/detail/CVE-2022-38457
> @@ -27,3 +26,11 @@ CVE_CHECK_IGNORE += "CVE-2022-3567"
>  #  * https://www.linuxkernelcves.com/cves/CVE-2022-40133
>  #  * https://lore.kernel.org/all/CAODzB9q3OBD0k6W2bcWrSZo2jC3EvV0PrLyWmO07rxR4nQgkJA@mail.gmail.com/T/
>  CVE_CHECK_IGNORE += "CVE-2022-38457 CVE-2022-40133"
> +
> +# https://nvd.nist.gov/vuln/detail/CVE-2023-1075
> +# Introduced in v4.20 a42055e8d2c30d4decfc13ce943d09c7b9dad221
> +# Patched in kernel v6.2 ffe2a22562444720b05bdfeb999c03e810d84cbb
> +# Backported in version 6.1.11 37c0cdf7e4919e5f76381ac60817b67bcbdacb50
> +# 5.15 still has issue, include/net/tls.h:is_tx_ready() would need patch
> +CVE_CHECK_IGNORE += "CVE-2023-1075"
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179822): https://lists.openembedded.org/g/openembedded-core/message/179822
> Mute This Topic: https://lists.openembedded.org/mt/98125330/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

