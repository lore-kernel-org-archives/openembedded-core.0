Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.1780.1594343977361682849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 18:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EnKh5aFk;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id j19so1753620pgm.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 18:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OkAd6vDmOAxqwrBsV1hL7gJK/S57Wt6wvf6f5QPJDiI=;
        b=EnKh5aFkUtliuBnmNAlMFWPHlZ0xIDESZqI2cwTgQ0ET89o7iAYQnrurTHkhwobbIt
         EEjCM+RpzdBnLcLIg1klIPo0DZbG8gfQS77EC/cf4QAjlpVNIldnzp0pT4cpbTg8Mn2R
         9C78P9ErWnkN28mlDmig0yOmG1xiNJtU7ZXNYSTM5AmIDSV9M/vhXmzlZtcYNeL2XPEe
         9jDVUU6x0um5D7tLud0Y31bKlRRHqC0QHdUxqSQ4XhA9xT35jdVZW1ph8M5dRQg8uXHS
         ZUelwCGJiwrUAoVOl+Ox0Yihs5RqyLWibwMipZmwARUt7FDReh24OE68UfCF3us20BEv
         QKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OkAd6vDmOAxqwrBsV1hL7gJK/S57Wt6wvf6f5QPJDiI=;
        b=XN7SzTUOzeHk1dI4smMU//7T+l2GmOaqi5xYy7AwOTwsagm8tDLFjvO8wSeMteH4lu
         8d0TjuRk+uvB8vx9oQhpn+Vz2LnGNL4bLUALwEiMj0fLiiuMnBQ+1cvIJF0bFXkaZVJ8
         8nnbKgdsFhVY/8C5tVxSJ+dYknxfrVmQ4W5zCC/3L6PmXPH/dmxW5VXJd3F5wLDoOYKR
         cZDhlYDQ5BXh2npy4t22RGRvFG/HmqrC3UsF8kdaSTAxECxHpFlsNBVpRXsm5TdUYWsl
         QBJG9Ro0LQl92kPAVRwHfUQnZiOcFnNxWsCKQk1NNFUhCkwPpQ+LlvmDOw5uKwjmD1KT
         TYMg==
X-Gm-Message-State: AOAM530IA6YxkvQb828Ambhplpa0wnDlENwEG239/RtG2m1ZcwoXV3dI
	81E9fqooGYHm9yxPS4HYBak=
X-Google-Smtp-Source: ABdhPJwupYjVVvD3oXwfufNd4jpOM5ucWrND2Mnr6wOCoiLQrGxevTiVbn8FOrjgKSKeZ4vPoyEiBw==
X-Received: by 2002:a05:6a00:10:: with SMTP id h16mr58682047pfk.214.1594343976741;
        Thu, 09 Jul 2020 18:19:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::c85a? ([2601:646:9200:4e0::c85a])
        by smtp.gmail.com with ESMTPSA id z1sm3922474pgk.89.2020.07.09.18.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 18:19:36 -0700 (PDT)
Subject: Re: [PATCH v2] go: Disbale CGO for riscv64
To: openembedded-core@lists.openembedded.org, sakoman@gmail.com
References: <20200709195729.2224354-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <b0af7c7c-4e62-9c48-98bc-e696f17e3f81@gmail.com>
Date: Thu, 9 Jul 2020 18:19:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709195729.2224354-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Please consider it for dunfell as well once in master

On 7/9/20 12:57 PM, Khem Raj wrote:
> cgo is still not available in go for riscv64, we will re-evaluate it
> once we upgrade to 1.15
> 
> Fixes
> | /usr/src/debug/go-runtime/1.14.4-r0/go/src/runtime/cgo/gcc_util.c:23: undefined reference to `_cgo_sys_thread_start'
> 
> [YOCTO #13966]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix go as well along with go-runtime
> 
>  meta/recipes-devtools/go/go-runtime_1.14.bb | 1 +
>  meta/recipes-devtools/go/go_1.14.bb         | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/go/go-runtime_1.14.bb b/meta/recipes-devtools/go/go-runtime_1.14.bb
> index 43b68b4e46..4eeee65e0c 100644
> --- a/meta/recipes-devtools/go/go-runtime_1.14.bb
> +++ b/meta/recipes-devtools/go/go-runtime_1.14.bb
> @@ -1,2 +1,3 @@
> +export CGO_ENABLED_riscv64 = ""
>  require go-${PV}.inc
>  require go-runtime.inc
> diff --git a/meta/recipes-devtools/go/go_1.14.bb b/meta/recipes-devtools/go/go_1.14.bb
> index 5d40cf9d04..bc90a1329e 100644
> --- a/meta/recipes-devtools/go/go_1.14.bb
> +++ b/meta/recipes-devtools/go/go_1.14.bb
> @@ -2,7 +2,7 @@ require go-${PV}.inc
>  require go-target.inc
>  
>  export GOBUILDMODE=""
> -
> +export CGO_ENABLED_riscv64 = ""
>  # Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips/riscv
>  # doesn't support -buildmode=pie, so skip the QA checking for mips/riscv and its
>  # variants.
> 
