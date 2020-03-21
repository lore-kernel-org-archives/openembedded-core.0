Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.18599.1584827873173211759
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 14:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U0iIOqpW;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id f206so5338305pfa.10
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2020 14:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=lwAI+BN2ZTb4OjCcoBvyjqwg7Bl7qf8E0XBAAFfwNvU=;
        b=U0iIOqpW8FAx0/Dr7hf6zJiAvAUUZauq7UJUMpO/NxwIpgxEM2pjc8L1q7fzyzsHwh
         tWT013V1zWz9NRd7LGOOygyyygJ+fsCYSPmutuCQj+Jj+UhOD6/XHudxZiRfNm914VYg
         ZaaPcXgr56zK4+sQZMOL324/OR3H3tVf6fdfIAOeejLoKiDV5VmADps4tCf8tQVkb2Z9
         +e+6f8ujpEgiZAsZshd56TFOKFI63nvXT6xt1488ZxDgdK72PosB6KjACAy8XtVVG/ll
         hE/jubA6C98sjQBGcNHxdCSrBhZvzhHLwz4AG+7OuQQOBborUon8r+MvGlPm4/kiUXSj
         +eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lwAI+BN2ZTb4OjCcoBvyjqwg7Bl7qf8E0XBAAFfwNvU=;
        b=eShgFltBshcvVyFiVg5bJpdCSyWzYdw6EO0iqdYx03Ey5Ou8T7nIbt4lVfvWJcac0Z
         hP0gz8FvlLzH4tpgrF0rTFb6Wy2f9zWntpuWBUwNXnF3dDtq/RneiQ2A2gSCAhaZYMj9
         qIIZlAq76u9CX47YNaZbMgnadHF7yeNtVGaSJasrJrX/5qK7LNPwjPsdRfUjXvqTbkql
         9ahOZrIBtEbRM0yZ44qxtfe62nU3kf75Q1Q/7O3wBXInScEIT3eRs7WHYF8jAxpaFWvT
         HcEaJYh4i0FIZWR3PuO97zKiJQJ39vX3IwsJd0g4M8Hn5aJVO1JaTS1qsexNs5RBCd5q
         Ic5A==
X-Gm-Message-State: ANhLgQ1ti2rvJzG7SLG3eLsKA2jr2TTMcOQnYCjnUlNETDuAHg1bSEbD
	krjtqzUDjos3E0klOgeMeGnpGMNXQm0=
X-Google-Smtp-Source: ADFU+vv4QRYZ5Cvi3ppsXAhpCsMkNvZxjvC65LU+omR2QdlT7W6K0SMK5WXvhGkKKMdZVw518sA8qg==
X-Received: by 2002:a62:cf84:: with SMTP id b126mr16756603pfg.316.1584827872222;
        Sat, 21 Mar 2020 14:57:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:24a5:af12:d349:bb13? ([2601:646:9200:4e0:24a5:af12:d349:bb13])
        by smtp.gmail.com with ESMTPSA id d4sm9069802pfo.217.2020.03.21.14.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2020 14:57:51 -0700 (PDT)
Subject: Re: [OE-core][PATCH v2 2/2] wayland: Fix wayland-scanner missing from SDK
To: Tom Hochstein <tom.hochstein@nxp.com>,
 openembedded-core@lists.openembedded.org
References: <20200321052650.24220-1-tom.hochstein@nxp.com>
 <20200321052650.24220-2-tom.hochstein@nxp.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <1764300b-ff3d-ff62-29ba-47d428734f47@gmail.com>
Date: Sat, 21 Mar 2020 14:57:51 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200321052650.24220-2-tom.hochstein@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/20/20 10:26 PM, Tom Hochstein wrote:
> The FILES variable was customized to package wayland-scanner
> in the -dev package. However, this is only correct for the
> target package and causes wayland-scanner to be missing from
> the SDK.
> 
> Fix the nativesdk packaging by properly limiting the
> wayland-scanner -dev packaging to the target.
> 

Perhaps it should be packaged into a separate package like
wayland-tools or somesuch. It does not belong to -dev package

Then perhaps nativesdk-packagegroup-sdk-host.bb should be adjusted to 
include nativesdk-wayland-tools as well.

> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>   meta/recipes-graphics/wayland/wayland_1.18.0.bb | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> index 00be3aac27..4d110a6e1f 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> @@ -54,8 +54,10 @@ sysroot_stage_all_append_class-target () {
>   	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
>   }
>   
> -FILES_${PN} = "${libdir}/*${SOLIBS}"
> -FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
> +# Place wayland-scanner in the -dev package for the target.
> +# Leave it in the main package for native so it is included
> +# in the SDK.
> +FILES_${PN}-dev_append_class-target = " ${bindir} ${datadir}/wayland"
>   
>   BBCLASSEXTEND = "native nativesdk"
>   
> 
