Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.7119.1626958021961692043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 05:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FTlaJrFr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id d2so5860440wrn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 05:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JEspthNrEzEru5xGuyIMXfcjCLq6UthcUdhD3jMqBZc=;
        b=FTlaJrFr3gT8jkDumTVrdRhYs4VgRzWQUUIJ0/n/Ow1cK1WkZnWFXtbVDKUAwE8Wht
         dD5/C0sNjF7oodvO5HazxOVixRsOcPUURJTKTq+BBQVcBqHXUB9KIpqcpaXgQoemzEjn
         wgxrHyZWuNXr14eUr+lIHswuuJhjepGGCR60M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JEspthNrEzEru5xGuyIMXfcjCLq6UthcUdhD3jMqBZc=;
        b=l+O0aeRW/x9MnKW7XJA1pC+lp42rzDbzXSc7WXYWnyHRfm6YuoBnATvmz6KJJQJpsG
         P8ZhJ+gfLKyeHalocv2gIZao9B4heNDZrC3Pbbo/XKw15f3lXG1LT6e0+NDV8zthgsyr
         d3GOLv4LCtbrkArLDmJ9W8mWfx7ndgc6AlQTcVq1k6tlVOA65eqM8w7Nns+nNGnI6qLn
         akEJu2akEhNKa1tiNEcczDnEyMN14QKFEJVQ4NQyBs6o6Pv5jhjM5piGpDNdPlitwyxE
         zz9WvMDHEExjFyOBm7n5uPZJG5b4zcH56wSDKbk5jT3toTdVvOu+nyL3rZ8xltPJ9gYF
         Ohtw==
X-Gm-Message-State: AOAM532STt8Ql3MfWj5ST7eeIHjlmKsd/z7aYe7voF/z3whRjznj4PYQ
	23Jy5nzEI9ZbUoFqf2nmNGb32g==
X-Google-Smtp-Source: ABdhPJxAzpXR2mUiMx9habkrU6uYI1+O7y9WvzFXYQ1K/FlU/hrk6kO4u2GaG5U2QseXUdp/7AQHiA==
X-Received: by 2002:a5d:64c2:: with SMTP id f2mr48160168wri.374.1626958020326;
        Thu, 22 Jul 2021 05:47:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:40b3:3f27:e412:a801? ([2001:8b0:aba:5f3c:40b3:3f27:e412:a801])
        by smtp.gmail.com with ESMTPSA id e3sm30096256wra.15.2021.07.22.05.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:47:00 -0700 (PDT)
Message-ID: <4a2223e5f3429811786cd2f3dc41ee7e7134af2b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot_2021.07: incompatible with qemumips and qemumips64
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 22 Jul 2021 13:46:57 +0100
In-Reply-To: <20210722094903.27281-1-kai.kang@windriver.com>
References: <20210722094903.27281-1-kai.kang@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-22 at 17:49 +0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> u-boot 2021.07 is not compatible with qemumips and qemumips64:
> 
> > *** Can't find default configuration "arch/../configs/qemu_mips64_defconfig"!
> 
> The supports have been removed by upstream:
> 
> https://source.denx.de/u-boot/u-boot/-/commit/5308a71
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot_2021.07.bb | 3 +++
>  1 file changed, 3 insertions(+)

Reading the link above, shouldn't we change the UBOOT_MACHINE definition
for qemumips/qemumips64 to point at malta instead?

Cheers,

Richard

