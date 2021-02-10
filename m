Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web12.6662.1612970131871959818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 07:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nigwjhxc;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id n14so2237370iog.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 07:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1uVQLOP4rUFh5ImezURFfruOSrNUcrcEc7yzqSPVdf4=;
        b=nigwjhxczUmydfKTN6f18UjKATBcNBE9jRSyNTnAOa1z/nV2cA0JD6JF9NxgOqQymV
         b/Jfh0CwxLxUXmeUQFHGPyP79Mx0zxeOuzMVqctsdEGNfEbwUhtTKziUrehnIAmhjaee
         Fr6sehQLgOxAZzv6EbBfuHNm7f8Rzrz8Hnwm6tQz4UlDbditugC0pAvmVjdEuyQZpDvQ
         fW2tnez7VVULkG1+4N3eyng+xg1vLFrcx2tFLO9e8Wxbnl/pQUszh1nY+RJfBakxDS23
         U/ZItndQ85ZdUOzZKsw7CT775uxP7B8taF0P/ZP5nchc4dGsS+H5vWTgO1FhNa6+ZvYW
         wKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1uVQLOP4rUFh5ImezURFfruOSrNUcrcEc7yzqSPVdf4=;
        b=V1ms9yxqpkpr2b7lO1PfYaNE2UdgbbDN5DyogAb9cUaTKm/kpP9dM93T9GT0rCMcqL
         JP9b3IYpwMGPUTPFrcBGy+o3e3iXrzI4uVIRQUhn0WskjujeVF+7sN1Tihf3psRwAoGA
         h0cPU0SbrXbEh0jmlplSbTzjUhKO06CUXtoth9IzjyPFE5JIuE+/vaa5Kzity3QnniVB
         VSUIuLMzAuIP+wkomSvdvgxmqwQ1cupxqXBpuVKA9JDIDIH3GHQeIRzZKUQQIZ4c+F6k
         R4LwMAc0+cQtt8ExVtX69lJFdPiV1+xuvl6rx1bei7awAnMxJ74xTMwl4kUA3ObES7zZ
         5tuA==
X-Gm-Message-State: AOAM531OD9Mz6Kc+spOeOyB+DnjsjBzMEJ4f4w6zooRL/WRqxan12AVf
	OPu/Exo/CS3BJEaGmPHtIgV5Ho/xOitI7w==
X-Google-Smtp-Source: ABdhPJyIx0FI3fha8/HtF8Bnu7nHtWnLLwrHjQSRS8dqh0KpnHJlSpKWppdPoOJKc+dfOIBg2c2Z/w==
X-Received: by 2002:a5d:81d1:: with SMTP id t17mr921702iol.208.1612970131029;
        Wed, 10 Feb 2021 07:15:31 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5c13:19:1e34:e0ed? ([2601:202:4180:a5c0:5c13:19:1e34:e0ed])
        by smtp.gmail.com with ESMTPSA id l14sm1148451ilc.33.2021.02.10.07.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 07:15:30 -0800 (PST)
Subject: Re: [OE-core] [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
To: Ray Smith <raymsmithuk@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210210111113.17318-1-raymsmithuk@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <37de26c1-3d02-313b-dd91-7e3fabe93928@gmail.com>
Date: Wed, 10 Feb 2021 07:15:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210111113.17318-1-raymsmithuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/10/21 3:11 AM, Ray Smith wrote:
> Mesa doesn't _require_ either of these features of the distribution,
> it (conditionally) _provides_ them.
>
> This has a desirable side-effect of enabling a build of mesa that
> supports only OpenGL ES and EGL, without having the rest of the
> distribution think that full OpenGL is available.
>
> Without this, a distribution can't support different machines with
> (non-mesa) OpenGL ES/EGL-only drivers alongside mesa drivers, even
> when the distribution only needs OpenGL ES/EGL.
>
> (Note that currently mesa internally requires OpenGL support to be
> built in order for OpenGL ES support to be built, but this is a
> detail internal to mesa that should not be exposed to the wider
> build)

Did you run yocto-check-layer to ensure this passes?

-armin
> Signed-off-by: Ray Smith <raymsmithuk@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index cb075a8b89..bdb978de95 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -44,12 +44,10 @@ PROVIDES = " \
>      virtual/mesa \
>      "
>  
> -inherit meson pkgconfig python3native gettext features_check
> +inherit meson pkgconfig python3native gettext
>  
>  BBCLASSEXTEND = "native nativesdk"
>  
> -ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
> -
>  PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
>  
>  export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
>
> 
>

