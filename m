Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.8372.1592982402226353103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 00:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TLe5filq;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id d7so700841lfi.12
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 00:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=G1vEYXOG73AwSU9mMVNUizPlNBruSAr5aEd63IAhNgQ=;
        b=TLe5filqwedScxnOLYkWcXoqnn22LMBRhOXsJXtP2uzQ7XMAzjK1va11NwUFDyLB/s
         n1C8vZ9SySXNYQ86i6TRkoTpkHyGtmhczHzOwXmntGwiJMCvExVhzt/Jxq2+HkHZp6lX
         ObM4i92UEv3o/7QNpvreyEN3ugjzT7tyjkjmmfxlpPClp0Ss0ycYfZGDjwLq2ilgVVWL
         ae8Uxaw3QwDVSpMAxu+/34LS2ndJXz89HMK5vppbArqb0IRdz8bfcnlmFNBYQA/Kc/3B
         JiOUZz1GWZfQAyMVDi2tOVJCnEG0uqjhFHpvIqovUh+kU2bbgS/YcSUsYeWzjuCDt2Rw
         huFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G1vEYXOG73AwSU9mMVNUizPlNBruSAr5aEd63IAhNgQ=;
        b=Bh8ZkmGmZpFK7XMOFc+Gn3xdwai4MSitcfPijl5LZAju395IwHKsdzNr+iBDMd7FkG
         mper6TmNtNK0VTSJW4SfA8ohlq7RJ2vt3KfCZVD4wKDMMworP/BIsYIjqdisCnfkNyqU
         ynz0n7kGX5ZAWt7wFke1RQU2kAgHXNJbDrRpzSAecl13Ki17mN2IKEuQlbOkhenENOoA
         QWlDiKSluDHCcKwDMbcYpaYxwSJLDByK3Mqx1de8zxllhGaXpSzKhGzzMUR9bZhZt50y
         gkqtSY46TM24op4NynYRlH5r9wjdz3r9wy2j2o3M9rKdiGiFWSYyvdYQqadbj3gIekud
         cDJA==
X-Gm-Message-State: AOAM530PnIbmYVJcpUOFn7TOxMM2kpA5lMzAOL/GaQuYUS2OLPZK8Ys2
	b6AGhA+FCNQ0HaJvpZgP3h7UaO8u
X-Google-Smtp-Source: ABdhPJz+VAtkoHGN/o4rotbC2pXK1V38MgC7UrbsM1aKRiuAG0XGb4/VPVZdMJIy6IeFHB1GlN6K3w==
X-Received: by 2002:a19:848e:: with SMTP id g136mr14578034lfd.151.1592982399924;
        Wed, 24 Jun 2020 00:06:39 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id 2sm4459694lfr.48.2020.06.24.00.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 00:06:35 -0700 (PDT)
Subject: Re: [OE-core] [V2][PATCH] xinit: add rxvt-unicode in RDEPENDS
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200624011700.1451586-1-changqing.li@windriver.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <e14115aa-3b6b-1c20-4483-b5d57ba82997@gmail.com>
Date: Wed, 24 Jun 2020 09:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624011700.1451586-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/24/20 3:17 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix below error:
> /etc/X11/xinit/xinitrc: line 55: exec: xterm: not found
> 
> by default, xinit will generate /etc/X11/xinit/xinitrc,
> and have below config in it:
> XTERM -geometry 80x50+494+51 &
> XTERM -geometry 80x20+494-0 &
> exec XTERM -geometry 80x66+0+0 -name login
> 
> the default XTERM is xterm, but xterm is in meta-oe,
> use rxvt instead
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-graphics/xorg-app/xinit_1.4.1.bb | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> index c9e28d9bba..ed11830cf2 100644
> --- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> +++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> @@ -19,4 +19,7 @@ SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa
>   
>   EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
>   
> -RDEPENDS_${PN} += "util-linux-mcookie"
> +PACKAGECONFIG ??= "rxvt"
> +PACKAGECONFIG[rxvt] = "--with-xterm=rxvt,,,rxvt-unicode,"
> +
> +RDEPENDS_${PN} += "util-linux-mcookie rxvt-unicode"

As Richard has already pointed out, the fourth argument to PACKAGECONFIG 
is the additional RDEPENDS the config introduces, so no need to list it 
here again.

Jacob
