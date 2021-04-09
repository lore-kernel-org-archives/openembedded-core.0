Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.11812.1617985154232800353
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 09:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W9okis3B;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id a85so4121916pfa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 09:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P1NXCoNGXhiBkJwb4BDRmPGvCiZ2XWLWcRWoajlu1QA=;
        b=W9okis3BOiL1w4HVw8OOBKUybXqG9jlvpSyq/s6YIh93jcmKP/l2ZTEWTBOMIROMJs
         8mGTyX07KrnewRdgFRuWrBside4AVcDTLqn+i6FAbaTMYMaNfhrL+YhJ+AejYLpKyAOB
         F55qIVZfCII+SCZmhdzfg6h75igNADxmTlXKVy9FoDG4ghIzQV7qCRNhIMJ1Rnv5pgkz
         OyOUD70EbjaauIfr0f0buzAhjF8xl7s3Qd+yKuKmLXLIo+aHgze9FubDQEyDIrjiZrK6
         6X9Rbnkzl/G3dUhdKf0PllRMKxRzO03xqnPK38MR3Mwk0hG07OO7fuDDilON7th1ND3J
         QhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=P1NXCoNGXhiBkJwb4BDRmPGvCiZ2XWLWcRWoajlu1QA=;
        b=Nlopk2fYdbY9O48zWRTR91TbbbPi+uhUr0RGgfwToPTHa1gfonDcSD9CNI3CR3iJq+
         ltnlks+MqymyCNh2N+gKgQn79F0oZNwTUTiL0o/94mahI62Akq33pRVfKvuVEawKqftj
         s8n8evYtraK68BgHyTfR6iX4u0Tnb4r4nnZs/JA3urig7EL1YWxm8Iehpfm+FioG/Je+
         6NtpKKefa/BxbMk8hFZ+GNUhINY/xJl0sHYJVspausV1/W8AuqG4YoC+sLollm7rqnLr
         6Yt0rnM7eXUMG1Xhr/gtxxt5IPvoLtpuEXCC/zabwRl9uCI26C+ISYfgxccyNDt5Rx7l
         6AFw==
X-Gm-Message-State: AOAM532D5wO8h/ulIE+UAw0dhISS4XypufAumboFoZLBxInYg8i276eD
	+bAnXfZS+FwCvvISMZoYVuEJ5xxxSEPK7g==
X-Google-Smtp-Source: ABdhPJyGOLeOL/TFqlYZHOYkg/XTqlmyo4TJBdmSs82eKFfy893sQDOiuUceIFdyNOC8kHvcQkwycQ==
X-Received: by 2002:a65:654a:: with SMTP id a10mr1181224pgw.410.1617985153324;
        Fri, 09 Apr 2021 09:19:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:351b:2de3:223:1924? ([2601:646:9200:a0f0:351b:2de3:223:1924])
        by smtp.gmail.com with ESMTPSA id a16sm3210172pgl.12.2021.04.09.09.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 09:19:12 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] glslang: strip whitespace in pkgconfig file
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20210409150014.3643624-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <84147805-5d2b-ea08-4cb3-a8e54fbfaa7a@gmail.com>
Date: Fri, 9 Apr 2021 09:19:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210409150014.3643624-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/9/21 8:00 AM, Ross Burton wrote:
> Whilst pkg-config is fine with .pc files containing leading whitespace,
> pkgconf is less forgiving.
> 

thanks, I was thinking this could be painful, perhaps a QA check might 
ease out the issue a bit as well. I dont know how many .pc files will 
have this issue. What are usual signs when this fails in this way ?

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   .../0001-generate-glslang-pkg-config.patch    | 22 +++++++++----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
> index ef092f17a1..cddd330971 100644
> --- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
> +++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
> @@ -34,14 +34,14 @@ index 00000000..64b6882d
>   --- /dev/null
>   +++ b/glslang/glslang.pc.cmake.in
>   @@ -0,0 +1,11 @@
> -+    prefix=@CMAKE_INSTALL_PREFIX@
> -+    exec_prefix=@CMAKE_INSTALL_PREFIX@
> -+    libdir=${exec_prefix}/@CMAKE_INSTALL_LIBDIR@
> -+    includedir=${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
> -+
> -+    Name: @PROJECT_NAME@
> -+    Description: OpenGL and OpenGL ES shader front end and validator
> -+    Requires:
> -+    Version: @GLSLANG_VERSION@
> -+    Libs: -L${libdir} -lglslang -lOSDependent -lHLSL -lOGLCompiler -lSPVRemapper
> -+    Cflags: -I${includedir}
> ++prefix=@CMAKE_INSTALL_PREFIX@
> ++exec_prefix=@CMAKE_INSTALL_PREFIX@
> ++libdir=${exec_prefix}/@CMAKE_INSTALL_LIBDIR@
> ++includedir=${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
> ++
> ++Name: @PROJECT_NAME@
> ++Description: OpenGL and OpenGL ES shader front end and validator
> ++Requires:
> ++Version: @GLSLANG_VERSION@
> ++Libs: -L${libdir} -lglslang -lOSDependent -lHLSL -lOGLCompiler -lSPVRemapper
> ++Cflags: -I${includedir}
> 
> 
> 
> 
> 
