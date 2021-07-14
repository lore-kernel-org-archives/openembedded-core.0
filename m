Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.9966.1626283108700486066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 10:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V3VWLnNM;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id v18-20020a17090ac912b0290173b9578f1cso3984133pjt.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 10:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IHSFl6T0CZ0ATJyjQ0uxPHvW94ThySx6K1PA6y0P9Co=;
        b=V3VWLnNMenU7T0oOL79qAr3GOKFKjgk43Xe9VYYfKYtan+PBo8oPZO9LPzmsqSKx5j
         u0MtFoQ6UOhrszkoYuO8IU3rI9kWa67awt2dus75KYtVPz7R3HANrsEdYJNJDzuPa4Ji
         IjsP5Z+RRF29QpW3vYwad2hp2VgOSVRQa6Qby0IQlmAytUzJW+NZ3ifYUN7JgBWwiYC7
         SKa7lYwInARBGxMAPn2yApqNvBhvSfx4vx8JC43esM4LudoPw8y6gsj0UYwB0xrkSB74
         xKKbYa3DesMSPtUQ+VHCDwsjTMypopZaeK9xgENuGB27iIzFA+aL0JURPKDjX13TkXLv
         nTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IHSFl6T0CZ0ATJyjQ0uxPHvW94ThySx6K1PA6y0P9Co=;
        b=ocnSGww+NqYXqq9Sel3mQdPgSyRFbMwhLGeyqri6qH56FqrK14DJvyaWieLtifgFIf
         QXrRQ1jPcCSTwaK46QK5C8UgybIn6mRopekmYe5e4KIR3fWv5Gs/gxeKE0yJEGtF4+q1
         wMTAoElmsLZ/vKe//DD2m1785O4/hJdnlnVOhVStAuOFqHTe21QxddbBKzj+x/hG9UDw
         7lmpA4/WVXsRaRkQIlHs2UT7UE5HdxFroSzj7LeQc9at8E1xSG4Q2eiK2vlJ8t5+EMqf
         h363N9hODlHie7/n2n2ZX5KAgieqZU7ICnPLKu+pONIwEuj4agQI72uR+xuQJgwBkmfB
         NDGA==
X-Gm-Message-State: AOAM532YyHMYirNCcGLGGnmIcLjUc0aVM9MqnEeieXo1ypMWOMtK0ka/
	/jYmgIQkjQ4UXPCX/kRnKd5wOwFafPOjwQ==
X-Google-Smtp-Source: ABdhPJzFioAA24lfCyBY1E4Tmj9m2KBNmyV/O9vSidpPZE1uqjFz/JoSaL3to2lPQ8gEDyqgaK9B6Q==
X-Received: by 2002:a17:903:49:b029:12b:1c88:101b with SMTP id l9-20020a1709030049b029012b1c88101bmr8324828pla.30.1626283107838;
        Wed, 14 Jul 2021 10:18:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9c22:5530:e06f:dd43? ([2601:646:9200:a0f0:9c22:5530:e06f:dd43])
        by smtp.gmail.com with ESMTPSA id g2sm2869450pjt.51.2021.07.14.10.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 10:18:27 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 03/21] llvm: make upgradable via devtool
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
 <20210714122606.605142-3-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f90997b4-7734-5e4e-d6bd-402b7676958f@gmail.com>
Date: Wed, 14 Jul 2021 10:18:26 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714122606.605142-3-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/14/21 5:25 AM, Alexander Kanavin wrote:
> Assembling PV from bits is too clever for devtool; but it can be
> done in the opposite direction.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/recipes-devtools/llvm/llvm_git.bb | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> index 8a5d3dc9bf..de79adc410 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -19,11 +19,9 @@ inherit cmake pkgconfig
>   
>   PROVIDES += "llvm${PV}"
>   
> -MAJOR_VERSION = "12"
> -MINOR_VERSION = "0"
> -PATCH_VERSION = "0"
> +PV = "12.0.0"

may be rename the recipe to have PV instead of _git as well, while here
>   
> -PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
> +MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
>   
>   LLVM_RELEASE = "${PV}"
>   LLVM_DIR = "llvm${LLVM_RELEASE}"
> @@ -178,7 +176,7 @@ FILES_${PN}-llvmhello = "\
>   FILES_${PN}-dev += " \
>       ${libdir}/${LLVM_DIR}/llvm-config \
>       ${libdir}/${LLVM_DIR}/libRemarks.so \
> -    ${libdir}/${LLVM_DIR}/libLLVM-${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}.so \
> +    ${libdir}/${LLVM_DIR}/libLLVM-${PV}.so \
>   "
>   
>   FILES_${PN}-staticdev += "\
> 
> 
> 
> 
> 
