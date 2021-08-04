Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.12717.1628099674557224573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qyFgFPz1;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id u16so3864671ple.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 10:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4dY6wNF4ZAQuPbAAI+oV5lT/Ho9Al7VsE6QLPU8IzBY=;
        b=qyFgFPz14LZ77YP0HIZzP1/TSFRSWB3pZbptn9vGJYo80GJlAxe8uGJvQeNHEDMx1F
         +xnyI9bw3oibCdlvNn46seXBMQ3JGl1fwIZfzq/dLoDLMl832nPmkBvf+4vqWFmbzpkq
         2BsTB5SRLFTB7VpNBIBlmYYDiohPlC7VHPTLOop5z5qOpiUz9kC0awFY2eVYwzdo6tT3
         X8NQ7qJzTB2dkEDarIlNSCvUi+q+vbkY+ieeJvTYNsttOwEpMAA/C+hXBQPTqLJqSD2Y
         UIoz02SRa/vRpvpJlFNRVdSOWW0BGwx9WN+YW5dgX/zD7V4bwHdaCr1ptJ4XBuJj18g0
         4Ciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4dY6wNF4ZAQuPbAAI+oV5lT/Ho9Al7VsE6QLPU8IzBY=;
        b=bQd6brBt74qcVkR5rBwQQ2tp7eaTFLaVdUy34rDa3SMr6ovwdcW5BaI1U+gqhoXbJJ
         RiS9p2GNqUfk/kuYRkMNmQTgHCDFwVEsLT7gzCdyEF+J4FR632NLaqYaWxOs7mKwsRuv
         pKnM8zdomncY2WwpNRe4T+KMqOw3vNqpZfkrdS0+oG/91n8tJTC/UeEevWWCDMy8j4w2
         VQWh1OhUjXFrGy7e+BpW7sdbT5QlCoh0jLoUItf6rpintLRMj8X+J2Dk9OihFvVcE7AU
         3m1uOQalawTHla+aUgWpmcu0y2CCaNrJsRyRFUYMx1m9uFbRR1/X4gebp3FaliMD7R9k
         MJBg==
X-Gm-Message-State: AOAM5337lNSd5+UNrU+F9skE71GiYZPwzzbxyLewm3ZIRBP3zx+rN+Jb
	OIF+efLc4R302z+Dh+jyWOc2k/3MQFmPZA==
X-Google-Smtp-Source: ABdhPJyC/hZgHM0shvv5ToiLA4vyw2ydadGlEq62chrGdo2OQw3JTAgWXYpfG8hngoadg3iIyH5QHw==
X-Received: by 2002:a17:90a:b00f:: with SMTP id x15mr311035pjq.59.1628099673648;
        Wed, 04 Aug 2021 10:54:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:61bd:9658:157a:c74c? ([2601:646:9200:a0f0:61bd:9658:157a:c74c])
        by smtp.gmail.com with ESMTPSA id 20sm4528695pgg.36.2021.08.04.10.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 10:54:33 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] libwpe: remove rpi-specific custom code
To: Denys Dmytriyenko <denis@denix.org>,
 openembedded-core@lists.openembedded.org
References: <1628040856-46307-1-git-send-email-denis@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d12919cd-3e16-5980-dd3f-60df68590e61@gmail.com>
Date: Wed, 4 Aug 2021 10:54:32 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628040856-46307-1-git-send-email-denis@denix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 8/3/21 6:34 PM, Denys Dmytriyenko wrote:
> This recipe was ported from another layer, which had special handling for rpi.
> 
> OE-Core doesn't have 'rpi' override, doesn't define 'vc4graphics' DISTRO_FEATURES
> and overall, BSP-specifics should be handled in downstream layers, not in OE-Core.
> 

Thats fine, however, this will regress rpi BSPs, so either send a patch 
to add it via a bbappend to meta-raspberrypi or open a ticket so someone 
can get it done

> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>   meta/recipes-sato/webkit/libwpe_1.10.1.bb | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/meta/recipes-sato/webkit/libwpe_1.10.1.bb b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
> index 22fff93..6f2fe1d 100644
> --- a/meta/recipes-sato/webkit/libwpe_1.10.1.bb
> +++ b/meta/recipes-sato/webkit/libwpe_1.10.1.bb
> @@ -6,9 +6,6 @@ LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=371a616eb4903c6cb79e9893a5f615cc"
>   DEPENDS = "virtual/egl libxkbcommon"
>   
> -# Workaround build issue with RPi userland EGL libraries.
> -CFLAGS:append_rpi = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', '-D_GNU_SOURCE', d)}"
> -
>   inherit cmake features_check
>   
>   REQUIRED_DISTRO_FEATURES = "opengl"
> 
> 
> 
> 
> 
