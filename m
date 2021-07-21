Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.1951.1626860189396160327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 02:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h+xeW7Nr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id k14-20020a05600c1c8eb02901f13dd1672aso510908wms.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jul 2021 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=bjV7+vNGgh+FjO0tH6b7scfbRgRiu2ZMScAyMhzokFY=;
        b=h+xeW7Nrh3ksdHRcuUX5Thu46UCqIVzXCFYA0JcnVqg+9MBzmM+gX9sw8ID1OwvgaV
         66lshGYd4rxxMzOYmnwbi72mLFlUjjEU6nfTC7lVFGRuaZ7/iq0sBwfPQYj+1HAw6tXz
         pwoodwdKXbePLb7NaepUtJZakyz8wz1VfNS08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bjV7+vNGgh+FjO0tH6b7scfbRgRiu2ZMScAyMhzokFY=;
        b=DmcZTCAFXEu8TJgmEYo+d3E1XafDC4L1zryeTKzb60Jg5ZUxedYN21EtDeZtJyayX4
         O+lzyH3Qg/E23qgGpl0aBy43O107XjAiQ3UxNykcW5VjwJuWAQno0M8xE3LM/XW3AX5u
         rMMnhzdcqUaxHKs60oKXgV18Av79gzKe7pSeB8DE+oBjvmwf+LmWu3FRAsFySJBu+osy
         fYZ1HPlYb4gkU6x5gXlA3t4NNKLqjw7z3Lf5I44PL8agYQSch9dOzgx6Iahbld9/dITM
         CD+hRAIhdhPMdKQFDYEapHT2YTObYPUydFhNqMSV+SoPlJYi58PYeD9Cy4m8o1IEUWYN
         68nw==
X-Gm-Message-State: AOAM530THWGywFW27LQQWffqRSLcmKCN+YDeKtir8mI28grx/CKgHzox
	LvsOVCXfXD2zP8OURUaddajR1g==
X-Google-Smtp-Source: ABdhPJy93LL8f78YT73MFYQxvibVZkKfIC55lcsS0GhSLoLoWLLIyJgaW888cK1YfecUp0sD8Inw/g==
X-Received: by 2002:a1c:7e44:: with SMTP id z65mr3107623wmc.1.1626860187563;
        Wed, 21 Jul 2021 02:36:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ca4a:a3b0:9d05:9957? ([2001:8b0:aba:5f3c:ca4a:a3b0:9d05:9957])
        by smtp.gmail.com with ESMTPSA id e8sm4725325wrc.6.2021.07.21.02.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 02:36:27 -0700 (PDT)
Message-ID: <530d825cf7c40b354a4127df8181e5311267d1ef.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libcap-ng: use update-alternatives for libcap-ng.so
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Wed, 21 Jul 2021 10:36:25 +0100
In-Reply-To: <1626829912-1826-1-git-send-email-wangmy@fujitsu.com>
References: <1626829912-1826-1-git-send-email-wangmy@fujitsu.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-21 at 09:11 +0800, wangmy wrote:
>     open-iscsi-user also uses the doc 'libcap-ng.so'.

A "doc"? If it is in libdir this is a dev symlink? Is it an alternate 
provider of this library or is this some  kind of linking intercept 
functionality? It seems like a bad idea...
> 
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE_${PN}-dev = "libcap-ng.so"
> +ALTERNATIVE_LINK_NAME[libcap-ng.so] = "${libdir}/libcap-ng.so"


Cheers,

Richard

