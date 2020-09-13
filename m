Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.32569.1599972755664319837
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 21:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wirp5sGH;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id t7so3711544pjd.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 21:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bw3nfaFRleazCs2+L0H53+t481VFnO6p/0r0qx++0bQ=;
        b=Wirp5sGHbxkJ4cEUpmPqg58mnLOSF1/uGGEskjzGfrAAINJymb6Bz3RJpiOwbA/SKo
         P1TporV6glEhILNUQoDqlOKw9k3SzAlstw+2O7JN7cGBoXBfmZ/07sYuaMog4JdN48/o
         89Wo/YvXKWSEyI58g++nnOq8kL/suy+Udjt7YjLFc+8X73t/XwOCgkb+cowVD7xgHVho
         NiZyAgQvkAHCg6BAlgktBoqaCd0TSo/JMQQOr6QxTE68t9gXfYrveQ0agT0MmorvK6Ce
         QQpOHN05bfoE3pi6UAFQiHBF3w4QTea722Sd99SwWx771hzUGJaVcOiW5vAhGsE1xRYd
         Jtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bw3nfaFRleazCs2+L0H53+t481VFnO6p/0r0qx++0bQ=;
        b=fz6PJ+5Wvi1t8Dp/bc9U+G3Gf2xk7h1tH7eKZLdhRfVCfA8rhngn3hp0qAgPRHdUbH
         0O0FH+mQ12OyBJ39U69eRxFyIjhYmraZt06i02rsGtwS4zGxjmpvClqMqav+/8Yjt7h0
         ozMVozZwZnha3riJojdgEI/VIZfxL/tscBXcgqOs8Z6IGipgXV+rj+C0u41XrY0qeQPV
         vN0J8x1bMB4i32t0LAL0apIctTzaFx+AOgCw1yQWKwWstXirEhu+yWlay+xnPRt0IGEs
         gwIEfI1h1cIl0ATqiIoP1yxzV3fErxqC5facwG1xBo84SXuYHqp+9uy1Q5vRtAZMTBeF
         3zSQ==
X-Gm-Message-State: AOAM533lktUCorvitn0wlmbWnoy9Y1pHzurnDMQqo+nbqql+WoRusFiq
	qwPMNzYmE69FFfGwuqa8SCg=
X-Google-Smtp-Source: ABdhPJzEbK4QPMLQ5JtgiNt6xTeoBV96XWjiDIkLfPPdhp/cLU8eHUHKFCviloe7KLuEBt+V8IDB9w==
X-Received: by 2002:a17:90a:e981:: with SMTP id v1mr8634673pjy.177.1599972755107;
        Sat, 12 Sep 2020 21:52:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:75a2:d73b:aa9:a0b3? ([2601:646:9200:4e0:75a2:d73b:aa9:a0b3])
        by smtp.gmail.com with ESMTPSA id a74sm6555824pfa.16.2020.09.12.21.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2020 21:52:34 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] core-image-sato: qemumips use 512 mem
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.comt>
References: <20200913035916.24165-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <0bc412be-9d07-643b-4fbf-a22c57fd9d40@gmail.com>
Date: Sat, 12 Sep 2020 21:52:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200913035916.24165-1-akuster808@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 9/12/20 8:59 PM, akuster wrote:
> From: Armin Kuster <akuster808@gmail.comt>
> 
> Fixes:
> 
> WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Couldn't login into serial console as root using blank password
> WARNING: core-image-sato-sdk-1.0-r0 do_testimage: The output:
> root
> <<< run_serial(): command timed out after 60 seconds without output >>>
> 
> In another run, this error was seen:
> 
> Failed to reload daemon: Refusing to reload, not enough space available on /run/systemd. Currently, 14.3M are free, but a safety buffer of 16.0M is enforced.
> 
> With updates to systemd and Qemu we should revert: 499a31cf06 core-image-sato: don't use 512MB in qemumips
> 
> Signed-off-by: Armin Kuster  <akuster808@gmail.com>
> ---
>   meta/recipes-sato/images/core-image-sato.bb | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> index 673106eb6d..878e0eaa8d 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -12,4 +12,3 @@ TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
>   TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
>   
>   QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
> -QB_MEM_qemumips = "-m 256"

Incidently, I was testing similar patch, which essentially is a revert 
of [1], I think we have to ensure that these issues seen by Ross a year 
ago are hopefully gone with time

[1] 
https://git.openembedded.org/openembedded-core/commit/?id=499a31cf06c934b40b5866d5eb77c9ad20c9a15f

> 
> 
> 
> 
