Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.82.1630686719699147473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 09:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mv6AXu8K;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id v1so3605420plo.10
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=PTgxxdUNZNFcZttM8XAa0DFTsmqPVfrMInXa6iYH4q4=;
        b=mv6AXu8KogOgBPcy37/ggxWdjLr8jkbkReubdj/nXce5XZf4x/voXP0nySmjv6cqui
         D1OQDAELt1JHKOw/KurYz3ZXaRrNbYt8yN/gqcOPxB5h3kX5st7hUhyB9Z6BmkDoauXE
         MMfzb6W/B9r/PKud6eG3FfegfQEfZSmFVQ6defaSQtXVPy5dIXolMRImmQWPEcQEQPy6
         0m5lWQAWxQvFbh5xZiQCA8IPuNBaa+xQ4EqGYFktAerXfh9cTrYcjCO9rKxWIP7rOQ+/
         lbm5tCeC22o0bUtUMVOYlcJnH2kNnlZgAB0b362B8vzwITEAtqmDcWrGu4mJ7QKWtUDA
         XSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=PTgxxdUNZNFcZttM8XAa0DFTsmqPVfrMInXa6iYH4q4=;
        b=JzPB//A+mZhr46DlDi+ih0KlnPtN48dePceqdBOxK55yFsG8GeECM72c4MLnRyMFl0
         0YYHyMEZyDD0LXXG7aNPbi9O9P/dnKUR0cj0HADXt7MZLStOdNXgjCFD1lVxUS10q2mU
         tXHdY9VzRywLlMX0WDHvcozwjLX8r1hnpBj9PCADC6EeS1Rv0CnECz5ovbKRkjjFthKk
         LHwvow4zNj1oNoVPx08jL/Bm1YsQOb8q7MBdV0JhTNAnzXKAwNX4IoGDIg9Nya10Gw3O
         +vwVYG/9RLojQ7I/s9kkbFvpSZEf5tCahKomIDo1aaz/u4+lzJwp16oUc+R8o91iVmeV
         YkmQ==
X-Gm-Message-State: AOAM532b6+drDHdVnW0SSlP1nDRi7OI8ToPE6Tn0ACL/i//q01UklRkN
	CsbrmfNp/zKdtEbXt7oo7Ig=
X-Google-Smtp-Source: ABdhPJxQcGPQKgVhbqinJeRB9B8dP5xxRsj2Sujjbfmk1uc5gos3REP6xqI52lOjT2q1BHox1BxlAw==
X-Received: by 2002:a17:90a:bb82:: with SMTP id v2mr10597841pjr.125.1630686718926;
        Fri, 03 Sep 2021 09:31:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:fc1f:bf2e:354:14db? ([2601:646:9200:a0f0:fc1f:bf2e:354:14db])
        by smtp.gmail.com with ESMTPSA id o16sm5667865pfk.86.2021.09.03.09.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 09:31:58 -0700 (PDT)
Message-ID: <d23ebcf2-c0f2-29c9-6a7e-60f4804310c7@gmail.com>
Date: Fri, 3 Sep 2021 09:31:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [OE-core] [PATCH] rust: remove rust_versions.inc since there can be only one.
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20210903162036.221917-1-Randy.MacLeod@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210903162036.221917-1-Randy.MacLeod@windriver.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/3/21 9:20 AM, Randy MacLeod wrote:
> oe-core has only one version of the Rust toolchain,
> so remove the ability to change versions.
> This file belongs in the meta-rust layer.
> 

I think we should still keep it around. For external rust toolchains 
much like we do for gcc, but move it to 
meta/conf/distro/include/tcmode-default.inc

> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>   meta/conf/distro/include/rust_versions.inc | 13 -------------
>   1 file changed, 13 deletions(-)
>   delete mode 100644 meta/conf/distro/include/rust_versions.inc
> 
> diff --git a/meta/conf/distro/include/rust_versions.inc b/meta/conf/distro/include/rust_versions.inc
> deleted file mode 100644
> index a11ba22a8f..0000000000
> --- a/meta/conf/distro/include/rust_versions.inc
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -# include this in your distribution to easily switch between versions
> -# just by changing RUST_VERSION variable
> -
> -RUST_VERSION ?= "1.51.0"
> -
> -PREFERRED_VERSION_cargo ?= "${RUST_VERSION}"
> -PREFERRED_VERSION_cargo-native ?= "${RUST_VERSION}"
> -PREFERRED_VERSION_libstd-rs ?= "${RUST_VERSION}"
> -PREFERRED_VERSION_rust ?= "${RUST_VERSION}"
> -PREFERRED_VERSION_rust-cross-${TARGET_ARCH} ?= "${RUST_VERSION}"
> -PREFERRED_VERSION_rust-llvm ?= "${RUST_VERSION}"
> -PREFERRED_VERSION_rust-llvm-native ?= "${RUST_VERSION}"
> -PREFERRED_VERSION_rust-native ?= "${RUST_VERSION}"
> 
> 
> 
> 
> 
