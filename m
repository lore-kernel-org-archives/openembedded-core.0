Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.5157.1627408717400135477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 10:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Th0ej17l;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso5951766pjf.4
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 10:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aUpxOJ7Q4TnYtf0X4IslLkkGQSyVF1Kl2lxoDQryFpU=;
        b=Th0ej17lCFS/amTpFIbbiKsi8GIFErNSv7xT6ev7u3caFyk8SlzikAR8eGo3IKOv3a
         rF8z2M3AULRSyf6KxA9249spKrT2LfAMj+s8moVE4kOtphfGI5yDdL8sQBGZDduNuqwD
         AdMVL/U5I5EFa86swqIPshLCH50OFr5OKaUcu0jOYQPH+5HZRNorP8AbD3p+eqQ/5io8
         78zW53Xw34JOwF0nz48wlqLjyQ/33rRanX0WgWIvnH1J+AmfVcYd2QqqgVmV9tOSua5l
         bPnBR4PA95CTe9TXmN1nUrn0oR8LBIS+PGTuv9iC+amsN8iNSPMlpCgg5KcgnGlKpDH5
         3K7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aUpxOJ7Q4TnYtf0X4IslLkkGQSyVF1Kl2lxoDQryFpU=;
        b=JuaKb1HA3n+GNl3mj67U6XJUx48qAXMpl0urC0HZd5LW+A5d+biGrKWa8arGBI2Yfe
         krcrWrAOZ9S+/BabtHedMhRr4Hy0chhTyKKs7glTapDRHl4h8JcgtcIgwk9A0S5MD/da
         kay2Sg94N9eyaPL5DQX6+8jeisHWT6SyxZ9ibZdPXpixHQpa8Dc5rAuBqBtXI5dzQ9LS
         8SG+Prbpa/4Aq8bvaPvHs6d3U5J0diMuQUJjkV8ahKVPcnZQFpyLdwuHRNGliXkfQ+t1
         X/CtuZVFNx5DUpdUTS4FhC9jpeS8Adxw9yN70scs9G2ScXd1NcSEwGU3EhYiKWTBVtmI
         rkHA==
X-Gm-Message-State: AOAM5337c9zG9FqEIiGlKLDDnHSyWeq35tlJoy6HDX1mLfB74DdMfXNn
	khbmuCEjm1VJmNHevEvrJyQ=
X-Google-Smtp-Source: ABdhPJy2g5C1xU5OC7+/Mjarv76gqM5RuyqHb4zSAj4sodtRSsk47XI5tRqAPkr3jhjbmav0Nmw8Gg==
X-Received: by 2002:a63:1656:: with SMTP id 22mr24819181pgw.163.1627408716927;
        Tue, 27 Jul 2021 10:58:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4888:96cd:7ffd:e939? ([2601:646:9200:a0f0:4888:96cd:7ffd:e939])
        by smtp.gmail.com with ESMTPSA id o8sm3541487pjm.21.2021.07.27.10.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 10:58:36 -0700 (PDT)
Subject: Re: [OE-core] [master][PATCH 3/4] bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
To: Tony Battersby <tonyb@cybernetics.com>,
 openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
References: <30028597-3dcb-cbe2-f7a7-54b0e7bd8e1f@cybernetics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <7927ac56-e5ad-1276-e9d0-38392ad93bb7@gmail.com>
Date: Tue, 27 Jul 2021 10:58:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <30028597-3dcb-cbe2-f7a7-54b0e7bd8e1f@cybernetics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/27/21 6:36 AM, Tony Battersby wrote:
> -f*-prefix-map flags are required when linking with LTO enabled to make
> the output binary reproducible.
> 
> See discussion here:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473
> 
> [YOCTO #14481]
> 

Looks ok

> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> ---
> 
> /usr/sbin/lspci from pciutils is a good program to test that shows how
> adding -f*-prefix-map to LDFLAGS makes a program binary reproducible
> with LTO enabled.
> 
>   meta/conf/bitbake.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 160abf40ee..c0d2e3f82f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -595,7 +595,7 @@ TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_
>   ASNEEDED ?= "-Wl,--as-needed"
>   
>   export LDFLAGS = "${TARGET_LDFLAGS}"
> -TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
> +TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBUG_PREFIX_MAP}"
>   # mips does not support GNU hash style therefore we override
>   LINKER_HASH_STYLE_mipsarch_libc-musl = "sysv"
>   
> 
> 
> 
> 
> 
