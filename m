Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.4589.1616473746404194999
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 21:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZTc/EXxv;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id b184so12976496pfa.11
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 21:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LzSrNprzE5essKP/0oha3eS8++v5OfgS4tfNGWo/GdQ=;
        b=ZTc/EXxvbJ/5ZN9nR54asBuRhYSxoc/Xcs+uTLBlWVq+28ES4T+Cw2Z46mxjvKSgmS
         REstQLhjFRLVntrEEjkS59HiBfJlFr7EIb2y3tC9ICttWqQ1WK1hA/PmHVSwB7sCczcJ
         O1TkPuYXm9gjlwqxPq/2C7GETGdWcfish+cZf8yXHK/kumuYlHmgXATnQs2ZzcOpaD2T
         e5mZQBWsVwzf+5iN1VwXyHzIf/5s7G9zhQWnti4T/lqhSFMGFfOjkcxL5TCWG7LjmhWU
         vI4wN7dva1As8fgUKT7eXk2JSTDyuAtW2ZNjH1ZT5TP5jFgjSffocyS5rZx18tfJYIuZ
         w3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LzSrNprzE5essKP/0oha3eS8++v5OfgS4tfNGWo/GdQ=;
        b=fFEUO+XY0UxWB2dtGTZRP1RtStwDMFnF4fSHJRPhuLN3UluNL8hRiho+OJP5SsG1Vg
         hnSgBjEmBjUAQeMA1VtAauAW+Otb/sSCqznD3bXLBEW90xlslZkJ3gvEd9InDK32IjMl
         59lesrTAPkZ0jYlmWOgsdbe/Pi6y7drjJdgvTH4ZiTlSFX2VhkB3YWCxUwtMPnJ0rPsJ
         xw7MxOtOk6lVLjrlI1Z6GnrQekV650Detf8cYrIPCWP1Hhd6BGRSnYBxWw+V565+bKgD
         el/KGGoQl7E/nk3CEJP5qwdWOstwLlm6tt8Gw/BOQopuuEE6Oi6D0iKk5DoS+TxPBCXY
         q+ww==
X-Gm-Message-State: AOAM531P5hUV48CfcNKFrQDZUXJdXKYI5HBUqvzIGW7Q6pd8CvSM2OhC
	jGWQqq9xIH2pvQSdX5cbjWTy5vkA0lHagg==
X-Google-Smtp-Source: ABdhPJwTZHf5S4k0ZhCU+Gm6b1FXO4X1GlbCTUn2AWGswElSrLBMdOvytKr3P91WmLiXbJ10TwExQA==
X-Received: by 2002:a63:4460:: with SMTP id t32mr2320432pgk.139.1616473745564;
        Mon, 22 Mar 2021 21:29:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::bd03? ([2601:646:9200:a0f0::bd03])
        by smtp.gmail.com with ESMTPSA id h137sm3327305pfe.151.2021.03.22.21.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 21:29:05 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] linux-yocto/5.10: update qemuriscv32 v5.10.23
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <20210322184455.35623-1-bruce.ashfield@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c9c62fdd-4dcd-5451-b4fd-3576c275d9ca@gmail.com>
Date: Mon, 22 Mar 2021 21:29:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322184455.35623-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/22/21 11:44 AM, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> The kernel SRCREV updates were missing riscv32, so stayed back on
> 5.10.21, which causes build issues as PV is out of sync with the
> actual kernel version.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto_5.10.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> index 9c122832f4..83e70d01d1 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> @@ -18,7 +18,7 @@ SRCREV_machine_qemuarm64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>   SRCREV_machine_qemumips ?= "68527a50a2f5b0992ba85255325d76a9f187c237"
>   SRCREV_machine_qemuppc ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>   SRCREV_machine_qemuriscv64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> -SRCREV_machine_qemuriscv32 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
> +SRCREV_machine_qemuriscv32 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>   SRCREV_machine_qemux86 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>   SRCREV_machine_qemux86-64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>   SRCREV_machine_qemumips64 ?= "c19b50af1e3680ff6050a0cce8dcd888accafd9b"
> 

I wonder if we really need to lock the machines using tip of
v5.10/standard/base e.g. x86/x86_64/ppc64/rv64/rv32
> 
> 
> 
> 
