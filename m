Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.7955.1589296637233712159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 08:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OQo9Jo3P;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id n11so6284044pgl.9
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=AzcuVkTua4G31XL1efAA/2z9uy9ibzl1raTe5BaTO/A=;
        b=OQo9Jo3P/RIkYYpMu3W2bZa1rm5r6zdAyWSzvGyOouRe9zx5541Owu2OZk8KdorNVQ
         b1BbHedhsgM9Tsv2h+7fElHOJN1b/bw6YB16mvZioeT3kPG8wtciwE565pvuTVnL12HP
         NwhfWfz+qcjrVCwsAkK5vJ3WlOD56aVgyRU8fI4FnheFHeuiE41iWRj/D2h1Lu1FdwYM
         rDt+je7hYfGh/GZGGy/pXiQ3+AeJEru6vpSyXZMXv5DJsvi6DWM7ioZEf336kpiHunf0
         R7Dqf87M4WR3hqQVNl7t2wzmbb/X9xsH6VrEkc97wVxe1AK9rCCjXXF87Vk64pkUgPWu
         b5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AzcuVkTua4G31XL1efAA/2z9uy9ibzl1raTe5BaTO/A=;
        b=WJ4bW4ZxPIjngtvo9tWOtZkbQADplSDA0rUzLKffD64D83cpf84CrhuaoGmPjaZEKw
         SDEyOe4NAbRkYbDZn08qpoPzi8zQxHCabpW1dMkjhf7vxOTORzCan7FCkCcoO0zXsNwI
         xtq+enEB+DE4enZjQoiS3c+b/Mi09cZXRz+AFLjDJcii/2f5TtxJ/MycIuaAf2ywv0BR
         F0m3wOW66+CZRAns0ag6R9enxznTL5+bod8reoE5uQ+VXHdIX1hHNmZHQearptPKBpvt
         BWaDWCchUc/qj5cBeSzhusrN7fuRXWVSOULoQb9NoWCPBl56R4Ax3faDOCL7yl0OQTPs
         tnWA==
X-Gm-Message-State: AOAM5303dgYJWVLh4ekVqFHJM+XW5u/xP/sx+LeFFbiY4X6HbjiZgqKo
	gvCE/JyIwMT7k3Ngv917jMM1jF/powk=
X-Google-Smtp-Source: ABdhPJxVUvK5/pdVArEmol8mWeYhj4ZMdthdxXu9/sO0eOU9cJfVnm9kp9CR9SONZLaF03DmW+2QeA==
X-Received: by 2002:a63:fc1b:: with SMTP id j27mr11748566pgi.251.1589296636247;
        Tue, 12 May 2020 08:17:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e967:869:15dc:c2fd? ([2601:646:9200:4e0:e967:869:15dc:c2fd])
        by smtp.gmail.com with ESMTPSA id p66sm11929064pfb.65.2020.05.12.08.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2020 08:17:15 -0700 (PDT)
Subject: Re: [OE-core][PATCH] llvm: Remove -fcommon
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20200512141416.5327-8-bunk@stusta.de>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <68c654c4-9a33-d06c-eba0-13e507d25606@gmail.com>
Date: Tue, 12 May 2020 08:17:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512141416.5327-8-bunk@stusta.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/12/20 7:14 AM, Adrian Bunk wrote:
> I cannot reproduce the problem.
> 

have you built the target recipe with gcc10 with -fno-common default ?

> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   meta/recipes-devtools/llvm/llvm_git.bb | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> index a8607f5008..d24ed761bf 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -92,8 +92,6 @@ EXTRA_OECMAKE_append_class-nativesdk = "\
>                     -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
>                    "
>   
> -CFLAGS += "-fcommon"
> -
>   do_configure_prepend() {
>   # Fix paths in llvm-config
>   	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
> 
> 
> 
> 
