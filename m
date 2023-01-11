Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE270C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 11:25:09 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.21361.1673436300717677147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 03:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TcMduaSa;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id e13so15734636ljn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 03:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqKFm4sq7+Vl5AdPIGAa1DRb0hwYJ0nQSFCaWjdXQ+g=;
        b=TcMduaSa+DApfyJ26RCTItWDiKQRAyM1Em4pgCODieauo32PtABvVNV4zA1FLKQari
         5opobjz8mH4gFfg/xStilmKZe6htYIM+WacJokiZXm3v4ta2Zs/CV7VsvRCVwzTHSMDt
         O1djYjZn84DQRiu0E1Et8yfcl0341ZumFy0x2qWkgi+l2cmjo0ChgW1yYsx17tw6m7ZG
         1uLU4sERFj4+29etvRqigH0eTASQXuZoev0RUlmY7cdvkXSlFeamUD7+AyAPkqnz8ZDS
         DUhDBnOUjuSmJ3dGoLBbiOOyNPkkcry8QnzeRLvfFmkWsbMYZ9NTntD/1TsfzbtKClVI
         1wBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqKFm4sq7+Vl5AdPIGAa1DRb0hwYJ0nQSFCaWjdXQ+g=;
        b=xthC/LQt4cpko3Y7rObeaghnl2+96gQh9Prcg++QITMGD3wePHBKOd8If8QlpngBRD
         2lwV5LpX04X8TKjfVcpCTltrkvdfELkCzxa+gYlQeXeUbxPyFWb+eWYz0Ut3mwUCa2OV
         HNUCOE5q3U4fL4iw0dVASU0mqbGYMG6o2/Uu0QbN2WTJfTU6dag1UW+7GMABU7MbBFJs
         Zs6SUytKQRkMAvHnQTQ9ksHQHVFTg+KZq57mUI2Zm29xgnG0af2XuBDGl/z6d/fBcNB/
         IO8kgckvt7jmlnsYZodIBcfeyxZl+cXBogJXXv54prCVfZIlUhplAABMbpEMVQvjPlZQ
         3+1A==
X-Gm-Message-State: AFqh2krbBoZr15/u+Ku2QLwJEvx5qbJ61xCDAl2Oc4PTDyZkKgfkp8j9
	6uau9Sr9znhtqRiNsBXw1g8=
X-Google-Smtp-Source: AMrXdXs7ErCk2xh2LiIhk/tInHinZxumDJdWRYXzYOri3ClHLN5qHgm+LsQDvcxEt8NszlfMEaE4Bg==
X-Received: by 2002:a2e:bd0c:0:b0:27f:aa2b:61da with SMTP id n12-20020a2ebd0c000000b0027faa2b61damr18271300ljq.14.1673436298670;
        Wed, 11 Jan 2023 03:24:58 -0800 (PST)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se. [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id q18-20020a2e8752000000b00279d206a43bsm1684263ljj.34.2023.01.11.03.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 03:24:57 -0800 (PST)
Message-ID: <94a9b8a6-f4c5-cb3a-6f6f-467e24086b19@gmail.com>
Date: Wed, 11 Jan 2023 12:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-core] [PATCH] elfutils: disable deprecation errors in all
 builds, not just native
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20230106161621.1288055-1-ross.burton@arm.com>
Content-Language: en-US
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20230106161621.1288055-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175733

On 1/6/23 17:16, Ross Burton wrote:
> The curl-related deprecation errors affect all builds not just native,
> so set CFLAGS instead of BUILD_CFLAGS.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/elfutils/elfutils_0.188.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
> index c94e36071cd..084908a38c0 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.188.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
> @@ -34,7 +34,7 @@ EXTRA_OECONF = "--program-prefix=eu-"
>   
>   BUILD_CFLAGS += "-Wno-error=stringop-overflow"
>   # compatibility with curl 7.87; can be removed when elfutils upstream fixes the deprecation fails
> -BUILD_CFLAGS += "-Wno-error=deprecated-declarations"
> +CFLAGS:append = " -Wno-error=deprecated-declarations"
>   

Why use ":append" and not "+=" ? I thought the general idea is that "+=" 
is preferred, since it is easier to remove the snippet in a .bbappend, 
so core should avoid :append when possible ?

>   DEPENDS_BZIP2 = "bzip2-replacement-native"
>   DEPENDS_BZIP2:class-target = "bzip2"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175598): https://lists.openembedded.org/g/openembedded-core/message/175598
> Mute This Topic: https://lists.openembedded.org/mt/96096249/4454410
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jacob.kroon@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

