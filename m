Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.250.1616173132366479238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 09:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ecb8erQX;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id q5so6320627pfh.10
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=nAF6eB5LZ7Vqvm0IyLhhi/tUs3yu4Z0k5Sj+fNwl3Zk=;
        b=Ecb8erQXzeB07xLzRekOfRX3vc8lIvDXXCsJX1SaasKmRwpuO56RSfNjr14FIvo7f8
         lX+TS/Khp4AQtTmUHcPn5dz9nLW1O3ovcfiKP9AEpYyNnH5M0o4+fvodODmdGTwtPIq6
         CgxWDG3sveKIg2xt189C1sHVbjUjM9yiosBt3nM2pji3W2Njgsc9SZNhYgf2RE2htiAv
         X4ZdKRl5UFwVYccAUldKesvGXStyWzj978G7UobQkCnEVRTfJiAtpnvp//ODFGJWefQp
         bqE99vAFOSBd4LoLpqAwzf7L2uhglSc/rblMNLSAxLGncux5eSpFfqEVvUENmL7lY6PN
         yUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nAF6eB5LZ7Vqvm0IyLhhi/tUs3yu4Z0k5Sj+fNwl3Zk=;
        b=Olpldtfgm/mdcnX3zhn2Vsh6GKfZzNrvSaKVV4zY61HvZ7g9QyvDHTHZt6HfRjbg2W
         2D9CRXTG2fVDzE5390eYSpGUc8APerFDUyUH8TLVO9ppd79xjZFS8jD9DX7NGfjvwmqf
         zMkenXePc1hdfdHjRxa/Fyj2ssDWHPNQ0E52Xbqp1DpthaOvbc1+UVLB83/KSaG3s2kF
         nA7coIcyTXda0Vn3Df/UrFeU8NQGJW9gfQKnUgVsBalzPSOGcYgGeAhadznmYgjLzikm
         03jHojVU8ZboDuRctAhOXtknT5z54l7WO5b3Uk56yDetBJ3QeH9wkbxw7FdYE7onVmyk
         0TtQ==
X-Gm-Message-State: AOAM532V/u9ont91qllS2fRvDGm5H+TE+84JVG5EO9ziCXfwmecZ/hPz
	je3LUVlRkthwDM2u+fQo/tUdimaXE7gDRA==
X-Google-Smtp-Source: ABdhPJzCVQGcvOXs4IdOoUB/kPWREXDAwMDiVDFydKWjGyo7/MpwtutFRBxuzKDt25LacU+eqkvhgg==
X-Received: by 2002:aa7:8f04:0:b029:1f7:d71b:6a51 with SMTP id x4-20020aa78f040000b02901f7d71b6a51mr10074492pfr.4.1616173131105;
        Fri, 19 Mar 2021 09:58:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::b117? ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id a8sm6213349pfk.138.2021.03.19.09.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 09:58:50 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 15/16] apt: mark as incompatible with musl
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
 <20210319084401.576728-15-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <722122d5-7fa8-56b2-116d-10169ada8051@gmail.com>
Date: Fri, 19 Mar 2021 09:58:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319084401.576728-15-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/19/21 1:44 AM, Alexander Kanavin wrote:
> There are multiple failures with the new version; unless

Can you share details of failures ?
it would be better to not regress whats working

> someone steps up to fix them, let's exclude for now.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   meta/recipes-devtools/apt/apt_2.2.2.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.2.bb
> index b838495da8..52ca7e97a1 100644
> --- a/meta/recipes-devtools/apt/apt_2.2.2.bb
> +++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
> @@ -39,6 +39,8 @@ BBCLASSEXTEND = "native nativesdk"
>   
>   DEPENDS += "db gnutls lz4 zlib bzip2 xz libgcrypt xxhash"
>   
> +COMPATIBLE_HOST_libc-musl = 'null'
> +
>   EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
>       -DUSE_NLS=False -DDPKG_DATADIR=${datadir}/dpkg \
>       -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
> 
> 
> 
> 
> 
