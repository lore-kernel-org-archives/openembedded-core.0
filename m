Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB40C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 19:46:08 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.1477.1645127167235247689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 11:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JkFaTsol;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d17so593892pfl.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 11:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=NqwOh1jnYrmK/X2zn9HelUtAJkHt6ckl+4Vle0+b+yQ=;
        b=JkFaTsolUFXtT7bnWRwwESsyudUy8lgst3ngsf9DeIDtRv3f1C4lMRS3ARMwEuUhGY
         unC1t1U1nilTjQU6DiJ9FbPH4BHPbHWoSJe0iQ/xgn3ExGfGMVLuLFXkX6h4T5usi0mT
         H3YlrxdbFlGn6LG5tsBcxEADhTk8F+6Aoz/07v8ZmMmQvIKIrSGdWdUZgxAeSH0WezgR
         8bDnV9BgunlNPHjtd7eLiQE8VzG1NqZKzdcsLFfBdViyzUjyVfaSEE4w4LHEC4I2nuda
         3ile4ECIPqHIpOhYRxfF4HLgtDm5rABhy0z2a9LirI5dFmIRAcGFKJAxFw7ug6bZ2gpE
         UBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=NqwOh1jnYrmK/X2zn9HelUtAJkHt6ckl+4Vle0+b+yQ=;
        b=XvIRbyllkKh83aDXoA4s8NiheIEAkqulH4zF4Ldrqjg4AFc4S0VFA+ZN8ybqogYjuh
         Rm4fesO2Uac//aEzH9xeqxHfr0KNscJfSZNyF3MkSwB1udVFvw7TA5KU7yG8Km9eyy0e
         IQjZIWJN67flSIpOQBlqFx6Rpx84VDgFNw3PVcKAnlfX7CizMvkRNdV2lnahwlRrn10Q
         14p9vqqAVLI4t5BIE9MTstcTK0hDMQbpTipnJUWdJQnshahA304ry4RDDUp8H+5qxlS6
         A/iiV4H1xh6N16i6W4eTv3O/UqfvNXtbOYjAhojozrOfl9jR11o1UNe6P7VgNhmLac3q
         FycQ==
X-Gm-Message-State: AOAM532I6RIeB5sgyITCtpr1N0OIQtZs7iZDFLaCZI1tmJSwroa0i9XV
	OvCVSEvGLAx9EyJ9SaNMrMM=
X-Google-Smtp-Source: 
 ABdhPJwRhGjXbBQhOQDUq0+As2VgrJ/TvuvAu0HVY3zADJM9Im8CPGqBLrAuifEG3gyJeZ57iuO0qQ==
X-Received: by 2002:a63:e44c:0:b0:372:81b0:77bc with SMTP id
 i12-20020a63e44c000000b0037281b077bcmr3645062pgk.128.1645127166599;
        Thu, 17 Feb 2022 11:46:06 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:9887:2763:ad87:2b2e?
 ([2601:646:9200:a0f0:9887:2763:ad87:2b2e])
        by smtp.gmail.com with ESMTPSA id
 x6sm369552pfo.152.2022.02.17.11.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 11:46:06 -0800 (PST)
Message-ID: <db1cfd4d-6a62-26c8-27e7-4ea707aacb61@gmail.com>
Date: Thu, 17 Feb 2022 11:46:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [OE-core] [PATCHv2] cmake: remove CMAKE_ASM_FLAGS variable in
 toolchain file
Content-Language: en-US
To: Martin Beeger <martin.beeger@online.de>,
 openembedded-core@lists.openembedded.org
References: <20220217155729.20280-1-martin.beeger@online.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220217155729.20280-1-martin.beeger@online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 19:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161853



On 2/17/22 7:57 AM, Martin Beeger wrote:
> As discussied in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
> file to configure the toolchain correctly in cross-compile build for recipes
> using cmake. The CMAKE_ASM_FLAGS are the configuration are meant for  assembly,
> but the spelling is incorrect and the Flag is ASFLAGS for gcc and other compilers.
> So this variable might neever have worked and it is better for
> recipes to specify their own.
> 
> Signed-off-by: Martin Beeger <martin.beeger@online.de>
> ---
>   meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> index 86446c3ace..3ddef12c83 100644
> --- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> +++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> @@ -1,7 +1,6 @@
>   set( CMAKE_SYSTEM_NAME Linux )
>   set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
>   set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
> -set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )

We do have global ASFLAGS so why not use that.

>   set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
>   
>   set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161817): https://lists.openembedded.org/g/openembedded-core/message/161817
> Mute This Topic: https://lists.openembedded.org/mt/89212148/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

