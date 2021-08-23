Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.26330.1629735158241267392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 09:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AI5+646A;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id e15so10438582plh.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 09:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=IlKcuu2mpB4yINAVvw561TdE+p+mrcixzWkgwmBeUmU=;
        b=AI5+646AkJwM/SX0DKbVuZfSQOy+fRy/ZarHtuve+VJMzzHiPrXw/+qyBoFiCVJ490
         knXXX6csO+yhlcziTTRMql4HWgUqnxVJoElUR/s1jhyAmZBlp8VGS+QeF47DYihJ13HT
         d8vanw8QgMk1TkTWzvFf2WeMP4q78tAOe0y5vBOrc8rbdUhJzF0U59IlMdSLDWiYZpqZ
         BQzaDYDnhYyI8OciI0GcbK9iTpB8BvrqrLGyHUQI7pBvn++M03fDOHQulpWiQ6Ng77oN
         TQTgzmExPUf4dCGb2sZLgE/mO9ToUKMszComwIACTG/IcWMhlrzaVBZysPk/zyFI+G/V
         T/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=IlKcuu2mpB4yINAVvw561TdE+p+mrcixzWkgwmBeUmU=;
        b=YBToURcJ/pnIa6cqkvOcwJbFY+7a50khwvZNpawLpYa6kYbMwEB3s/1583vvUibTmR
         /1gSUpZyGNEwZ8Dq8qZUz4SZB5MwLJqU5cDrrjKPibbhI8OKUCLXKDB09x17vUQc9Ech
         hER2joOKWEtsQLRSY8/6zfkDS56S5AofRuX+ed5uxGtWIkGZp9IgS33dRDZbXqf6ZzT4
         8OzkldU8RRp/X9ojVPIw0gdy96G56THzFNiBbCnf9qIILiwjmxOsNuCKTyEGt+WBjxmA
         FyOq4nVs2BNHWaclL4KYHWN81QLEarhMXwjgcj0coai4KurxsDXcgr6k4Sgl0Z3BTpna
         JPCg==
X-Gm-Message-State: AOAM530WOcMTPeHFmY56zyYdmZkveDCCK8Ewl18fsWiTRCBjESCWixDe
	nct1wCRlSx8VXcRV+I1EOUQ=
X-Google-Smtp-Source: ABdhPJwZJB5ZF86REEzTc/uiGYyHeEFB5AzxgWD8SDuyiqmWOiRTbHYPT2DH/kQq1N6XDO+zhy12OQ==
X-Received: by 2002:a17:902:c401:b0:12d:b1c4:5df3 with SMTP id k1-20020a170902c40100b0012db1c45df3mr29242832plk.15.1629735157749;
        Mon, 23 Aug 2021 09:12:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:7cf5:888d:b618:582d? ([2601:646:9200:a0f0:7cf5:888d:b618:582d])
        by smtp.gmail.com with UTF8SMTPSA id q26sm16850181pff.174.2021.08.23.09.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 09:12:37 -0700 (PDT)
Message-ID: <ce3005b3-6213-9528-2c82-c4f612f3b549@gmail.com>
Date: Mon, 23 Aug 2021 09:12:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.1
Subject: Re: [OE-core][PATCH] vim: add option to disable NLS support
To: Andrej Valek <andrej.valek@siemens.com>,
 openembedded-core@lists.openembedded.org
References: <20210823101205.29267-1-andrej.valek@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210823101205.29267-1-andrej.valek@siemens.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/23/21 3:12 AM, Andrej Valek wrote:
> - Some distributions with UTF-8 locale have problem when National Language
>   Support is enabled. Add there an option to disable it.
> - refresh options based on configure.ac
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>   meta/recipes-support/vim/vim.inc | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 17d1c24a7c..7cc47884f2 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -54,19 +54,21 @@ do_compile() {
>       autotools_do_compile
>   }
>   
> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny, selinux, elfutils, nls
>   PACKAGECONFIG ??= ""
>   PACKAGECONFIG += " \
>       ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
> +    nls \
>   "
>   
>   PACKAGECONFIG[gtkgui] = "--enable-gui=gtk3,--enable-gui=no,gtk+3"
> -PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> +PACKAGECONFIG[acl] = "enable_acl="yes",--disable-acl,acl,"

is 'yes' needed to be explicit ? I thought --enable-XYZ meant it implicitly

>   PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
>   PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
> -PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
> +PACKAGECONFIG[selinux] = "enable_selinux="yes",--disable-selinux,libselinux,"
>   PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
> +PACKAGECONFIG[nls] = "enable_nls="yes",--disable-nls,,"
>   
>   EXTRA_OECONF = " \
>       --disable-gpm \
> 
> 
> 
> 
> 
