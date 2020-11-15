Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.24279.1605467846916024266
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 11:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lTdf6gt2;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id x15so7041534pll.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2020 11:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MYp8BkstkZpnGvOU9eUPhr87GVP0R2tL5MRlsTg3arM=;
        b=lTdf6gt2WZnkT7s8A/gzj3S1kQ3qe64khR78C76phCRZcY1QcRfg75G3rSsex6K1Ut
         tRUc2N9PCChUGkzPHDpYvEsR4CH9FgqaMHglvA6qMQpMZcpcUmBrEAPM8aTlmewjncP8
         wpI1PNbB87XwvzX5Jj7xFVhJFuJYLDrKovSTK2xA6j30LZae0kvm1vZpvwmmx/SGg2vC
         UHTjqRh0uBmuL219S5CtuoZbPfJy7x9HU8d5Ufbb0Cx03apf1ckRuLuxaYRGJovdbuvD
         eJRyQY+XP+jCnZj1FYWFvT6/+M44P8YxpCf4j1hHCr46m/lV6k9VkI8t53DOZXDy4VmU
         x//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MYp8BkstkZpnGvOU9eUPhr87GVP0R2tL5MRlsTg3arM=;
        b=IdQopH5jU3uoTttZPKDlEXqni9mmRxc9awBT7Fpok2WBhN48f0pyY1gv4Ao0fgnCPu
         kp82PhnZbP6cEhY83qE7WGetUvwfBwypdonmZDNV9GZeRvxwf9K9y861Gq7YWwtJy+SU
         4hvW/LxJ8AkLkZCeTMB07M1ooRh6QQCCW81z8FdilUoDx/sMPFpFJvFfNHz8z7Y8Fuln
         RroZ/GlRNN5vtK5WFdRUK7NjkpTX1rYcy3H+hq9Z4VQskqCyEPwcZ2gUAKWFqtDhowLX
         +PTViQRhY0qCgwwFJG2YaEAk7WrTVjlwEnNwubK4pVjBfiG30DII74n4aecgaKNhR0ty
         vtdw==
X-Gm-Message-State: AOAM531A8wYVPyGBiTcSK6Uc5yAOvjXpMLpHFvslkc56744M1UPtDayv
	IPap95fXHnZdNN2/mwNYkGjQWIe3ZnU=
X-Google-Smtp-Source: ABdhPJwaBPlYYK660pO7HcJY/w+qJnOxONDJhgYzUDXdBAljksiE5y2FOfCxTPnvlVU6gKS7XMkrrg==
X-Received: by 2002:a17:902:9f86:b029:d6:d25f:7ad8 with SMTP id g6-20020a1709029f86b02900d6d25f7ad8mr9992248plq.4.1605467846079;
        Sun, 15 Nov 2020 11:17:26 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c937:fb7f:b6e0:3eef? ([2601:202:4180:a5c0:c937:fb7f:b6e0:3eef])
        by smtp.gmail.com with ESMTPSA id mt2sm16549168pjb.7.2020.11.15.11.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2020 11:17:25 -0800 (PST)
Subject: Re: [OE-core] [PATCH 1/5] python3: split python target configuration into own class
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20201113194854.21266-1-alex.kanavin@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <4ddd847d-1dba-6845-6c66-917cb3e7dc41@gmail.com>
Date: Sun, 15 Nov 2020 11:17:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113194854.21266-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 11/13/20 11:48 AM, Alexander Kanavin wrote:
> Setting _PYTHON_SYSCONFIGDATA_NAME in python3native class globally was
> problematic as it was leaking into host python environment, which
> was causing tracebacks depending on host distro and action
> (typically anything involving importing sysconfig module).
>
> The new class sets the variable only in specific tasks where it is needed,
> and should be inherited explicitly:
> - use python3native to run scripts with native python
> - use python3targetconfig to run scripts with native python
> if those scripts need to access target config data (such
> as correct installation directories). This also adds a dependency
> on target python, so should be used carefully to avoid lengthening builds.

cool.  I wonder if this fixes this open defect.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14076
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/python3native.bbclass       |  2 --
>  meta/classes/python3targetconfig.bbclass | 15 +++++++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 meta/classes/python3targetconfig.bbclass
>
> diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
> index d98fb4c758..2e3a88c126 100644
> --- a/meta/classes/python3native.bbclass
> +++ b/meta/classes/python3native.bbclass
> @@ -17,8 +17,6 @@ export STAGING_LIBDIR
>  export PYTHON_LIBRARY="${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so"
>  export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
>  
> -export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> -
>  # suppress host user's site-packages dirs.
>  export PYTHONNOUSERSITE = "1"
>  
> diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python3targetconfig.bbclass
> new file mode 100644
> index 0000000000..640d0c97b6
> --- /dev/null
> +++ b/meta/classes/python3targetconfig.bbclass
> @@ -0,0 +1,15 @@
> +inherit python3native
> +
> +DEPENDS_append = " python3"
> +
> +do_configure_prepend() {
> +        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> +}
> +
> +do_compile_prepend() {
> +        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> +}
> +
> +do_install_prepend() {
> +        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
> +}
>
> 
>

