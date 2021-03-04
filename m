Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.4372.1614899531021724966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 15:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jiSxDLFo;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id j8so3615634otc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 15:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3LTCh9n1+T1G+XvEDyehUdzgz3XPaVVoFO+5u3TAt8w=;
        b=jiSxDLForMnpIatYo3HaNLA4agOkp5NBLnK3QQbZyhqqCnKWQLDIB2MS/ckW/wAf1a
         1wtXOuNbZ39wTG3VjXG6XpJP/Mv+vIdpomEDgmVUiJJhraRGrLqr383f6B3vOhtDxcvo
         /KhZoZfjeOy7YqEEVTJv42BACtyNu8QycDCJfoFuuwSGmHq5Sj7EDgdrELp9tNgTShSZ
         Bddw2M62+RS+KD/6z+6O2EaIvVOA182WYSpjd4DIwKqG0LMMPHBHHuegf7fFOG0HaBMw
         qAytW7HAz9Mb+xetwoRkDSbsnecjHGRKt6EHwNAeRiAJK7GrslJRR1nNatG6n8ws/JMl
         +LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3LTCh9n1+T1G+XvEDyehUdzgz3XPaVVoFO+5u3TAt8w=;
        b=IlApKJdFrhwVvyE0HEZSPJld3lUAaREdKmLjb5CD4vSE6KBbgFLPK8XBD2u7JgWCO6
         v1Mk2aDyFfey6I6z+jECM+B5SN9i5CvMihaUzTD646TrcgNKTPgLBxc+h1ln3nBvHPRO
         r0l0dw6MlKRkI1v/gXur5zzr/uwDGkFutZjMUTCtiKOg9d7yLqwUX41D681XrZ2H1ULh
         V/fCuQ/ZMoLpL1fiaLQ0x/f7R+nVaHEzdAGfIJYwRGkQt4yGYr2zRIp1iRJudYBosnnc
         nGFmrH7urbF25GVieUEG3TVQXaSDj6l65qMtAbrugFI2Gp4bSl+uxcU4P3BsnbK9S85t
         FF5g==
X-Gm-Message-State: AOAM531AYQn0baQK/8yaejARICaS/IAcdJ1kIMFC2Q4Fj298QX4ZNtKv
	3/mxxG0JsN02Jw2ai52KoqGErUFYY4o=
X-Google-Smtp-Source: ABdhPJzfnlWn+zjt63rrDTBzhzq/B/d3A7T2tpWSNefuxzKW7hMEH5c0CdswMQbpK/aqYf9fTG9DRw==
X-Received: by 2002:a9d:7196:: with SMTP id o22mr5367540otj.107.1614899530073;
        Thu, 04 Mar 2021 15:12:10 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:819c:344d:6859:4a23? ([2601:202:4180:a5c0:819c:344d:6859:4a23])
        by smtp.gmail.com with ESMTPSA id b7sm137871oiy.29.2021.03.04.15.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 15:12:09 -0800 (PST)
Subject: Re: [OE-core] [PATCH] lttng-tools: upgrade 2.12.2 -> 2.12.3
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
 openembedded-core@lists.openembedded.org
References: <1614817602-40383-1-git-send-email-wangmy@cn.fujitsu.com>
 <1614817602-40383-3-git-send-email-wangmy@cn.fujitsu.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <c9a7aabb-3190-9c00-c57e-bdd877289c54@gmail.com>
Date: Thu, 4 Mar 2021 15:12:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1614817602-40383-3-git-send-email-wangmy@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/3/21 4:26 PM, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>

There is an open Yocto bug
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14263

Any data if this ptest passes with this update or can you help look into
the failure noted in the bug?

-armin
> ---
>  .../lttng/{lttng-tools_2.12.2.bb => lttng-tools_2.12.3.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.12.2.bb => lttng-tools_2.12.3.bb} (98%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
> similarity index 98%
> rename from meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
> rename to meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
> index 52bfd36370..7074096ee7 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
> @@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>             file://determinism.patch \
>             "
>  
> -SRC_URI[sha256sum] = "9ed9161795ff023b076f9f95afaa4f1f822ec42495c0fa04c586ab8fa74e84f1"
> +SRC_URI[sha256sum] = "2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153"
>  
>  inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
>  
>
> 
>

