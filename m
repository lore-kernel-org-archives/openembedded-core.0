Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.3306.1611882944360226157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 17:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qlBqbr31;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id q2so4363615plk.4
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 17:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bSjKZO7E0rTW/CGqPkMjn1xUUWt8AbLUnfHd+zGVre0=;
        b=qlBqbr310RargonDJ7q0cHWB/hDeJgaa46UywHM6ELax4tTtj5AbB9ZOlwj4RX7XRc
         9BeycMIEHbo2IhhmB99yECsdTO0ooHC1v6s7KfK5GXp3Z0wAu9meiI3rRCOQHWYSKv2U
         0t1iATvaptjUDygmSeZwN6mFkWazP/cc+/ZAZ9fbPs+dHTzpeG07FcgQQ/HTc4ciJc1D
         MqIaxtOpPpG9i8FKaEU9BY4J5HoxKQfIdBpHFW83/LvU4n85/XUcLpgXrEmcAZJGi1Y2
         NbbnPstzWr8mFbEyddNIHQukIqxVvKhu1OJbTkVBlyUtBblZW26dvjsMaD1C54TDei7O
         BlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bSjKZO7E0rTW/CGqPkMjn1xUUWt8AbLUnfHd+zGVre0=;
        b=DlFx8SYBNikcrH8+jrTa/U5jjXEhCIHs3PZe/PSwf97MXyNYU54sn7brOsRx7WgD/y
         rXcFGd4Y/d+zy+OGpMCh/S7v6v0JULtvcyIl1xM9zNa0umG2V4y7UHeisdjN3thNvCp7
         4hR++lAnskPcjws0B0vSK7ZP7EYvTLs9cYt3wltpd2xaw6bE5VYKTL5XH+phSaLwAGod
         9r0PPc8DL2Gap3o6Uz3A8W5EyZge0Dlaj5sQh9oUu8NkBfXoZNL6Au076sn8MIQllgCS
         1phQeI5HGBySyH/4lfOx6qTKdkbLdEFJgvrOKKLHdfDhanyfOO6k9o93bLBKl7PQQC13
         1m9A==
X-Gm-Message-State: AOAM53289S6QLV0dO8MY1we1kc0RxsZjFqelcMvtRCyodr0OtQS13DbC
	ZAd6g0kOYbqHsucdg1BTo8I=
X-Google-Smtp-Source: ABdhPJxsArj7eLV3mNoMkm9pxieGK3at2ET0An3Ub50+9mIkcG9yO+BbMalCxtG3+QQuoQ0V5HW3fQ==
X-Received: by 2002:a17:902:b604:b029:df:fe41:f55d with SMTP id b4-20020a170902b604b02900dffe41f55dmr1851524pls.43.1611882943782;
        Thu, 28 Jan 2021 17:15:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4cc0:6157:4a24:8f68? ([2601:646:9200:a0f0:4cc0:6157:4a24:8f68])
        by smtp.gmail.com with ESMTPSA id p7sm6707738pfn.52.2021.01.28.17.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 17:15:43 -0800 (PST)
Subject: Re: [OE-core] [PATCH] [RFC] openssl: Enable cryptodev-linux by default
To: Tom Hochstein <tom.hochstein@nxp.com>,
 openembedded-core@lists.openembedded.org
Cc: otavio@ossystems.com.br
References: <20210128213504.3821-1-tom.hochstein@nxp.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a525b7f9-c4d2-f28d-5be2-4d97590c9730@gmail.com>
Date: Thu, 28 Jan 2021 17:15:41 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128213504.3821-1-tom.hochstein@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 1/28/21 1:35 PM, Tom Hochstein wrote:
> This is a Request for Comment. Would it be a good idea to enable cryptodev-linux
> by default, gaining hardware acceleration where supported? Are there any
> unacceptable drawbacks? What happens on hardware without acceleration?
> 

this perhaps helps with devices that include a hardware crypto device 
but not as much with one;s thats fine but we use qemu machines quite a 
bit in testing so it would be good to get a readout on qemu secondly, if 
it does not, then maybe we should see if defining it via 
MACHINE_FEATUREs might be an option to enable it.

> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>   meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> index 5617f337e0..d4c19f1a52 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> @@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee0
>   inherit lib_package multilib_header multilib_script ptest
>   MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
>   
> -PACKAGECONFIG ?= ""
> +PACKAGECONFIG ?= "cryptodev-linux"
>   PACKAGECONFIG_class-native = ""
>   PACKAGECONFIG_class-nativesdk = ""
>   
> 
> 
> 
> 
> 
