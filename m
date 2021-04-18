Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.375.1618783446013837134
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 15:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MkfRRJbM;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id f6-20020a17090a6546b029015088cf4a1eso1564462pjs.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 15:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2szWl5O4NhjKLaYqUP7uCBuDQ3+yCVQlBvDgEL8mYVM=;
        b=MkfRRJbM2h4ypljy7+K4ruwURMRXd2mnzmuJyYA4lVOk4bhwaNTTfZiCT9V0tqtYzT
         RDD5Kt6hHY2Sj8clXBanPTv3qnNNz4Odn9rKNjka/o95ZEwxISs15auPGYhXWDkvxCPc
         SeAZ//GhrdFgrwvNQzS3C6XRGusOHOK6sM1K8VUUl2FXLXQkv76sfvRZnmx5TeoBVavS
         GzQS5KiDPOqiUNsABZ3npyyCFht7rL3dt6bgngaNT52BjRez6v0bf2RwDvffunC/GI0H
         hcDDqKqQzCl4J0gdDsalfSdeteLAYy5549xY9C0Tc5SFz0XPUuoIv+s/qiO6sS5QX4tg
         Ri1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2szWl5O4NhjKLaYqUP7uCBuDQ3+yCVQlBvDgEL8mYVM=;
        b=pFUaaWfxP470zB8CaJXPmSIJM0mXM/LDAdDaAgm88MUMXxkgBsUqTrlREPR2HM8A9O
         jNwytHO76JqAkjFt45VNX3RWlKnvBRQ/iRvZahjCFvBY4nMXou4EnHrVho8zin58A5OA
         5XaYTEd6GoNhrCS9cZ1w9Neix+RyHKL1inLCm19i/MVZ5UVtDvCFgfTXwFlxSKjN04Sx
         9rxTXCamb9DwKbTg7MNQbXXEtc6pEMBSU3Fy3FLp/r5L58NxvosnzmTOjgYYtfOrR3qQ
         zLolUUCmnx36wxS2sX+pi/rvWJVR/MayjKsfOOPGfzK9tVhxeQBxw02VLHMpJkfPZemB
         QSBA==
X-Gm-Message-State: AOAM533Rl1wfPiCFIEjmlTApk1r9Uzu4I5ouBSb/XWOhXZoIwfczavvR
	TPxhLJSB1ieldLpOUg8MZEjYZWveewZcNA==
X-Google-Smtp-Source: ABdhPJxoekvxbrjHml5IoAVW1BTA735Tg+KzCBbCqHe9Sovd4ggRnUn/pSDpVxkb9oSNUsqSUW7Kkw==
X-Received: by 2002:a17:90b:3507:: with SMTP id ls7mr20803563pjb.172.1618783445302;
        Sun, 18 Apr 2021 15:04:05 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:583f:8ddf:b9ae:1b76? ([2601:202:4180:a5c0:583f:8ddf:b9ae:1b76])
        by smtp.gmail.com with ESMTPSA id j26sm10351718pfn.47.2021.04.18.15.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Apr 2021 15:04:04 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 3/6] wpa-supplicant: Enable openssl
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210418081634.3169548-1-raj.khem@gmail.com>
 <20210418081634.3169548-3-raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <6c865d2c-240d-0fe0-ed32-b8976a792ee2@gmail.com>
Date: Sun, 18 Apr 2021 15:03:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210418081634.3169548-3-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/18/21 1:16 AM, Khem Raj wrote:
> Use openSSL for TLS/SSL implementation

I wonder if leveraging the "virtual" framework might work here so that
openssl, gnutls or wolfssl (whatever)  would trickle down and use the
same TLS/SSl package evenly across all recipes in a single image?

-armin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
> index cddcfb6811..16c5918522 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=279b4f5abb9c153c285221855ddb78cc \
>  DEPENDS = "dbus libnl"
>  RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
>  
> -PACKAGECONFIG ??= "gnutls"
> +PACKAGECONFIG ??= "openssl"
>  PACKAGECONFIG[gnutls] = ",,gnutls libgcrypt"
>  PACKAGECONFIG[openssl] = ",,openssl"
>  
>
> 
>

