Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.10225.1607058258822923291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 21:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zxg2ArUj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id x6so111780wro.11
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 21:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=emnir1PsiDwAUVvQ9cWZ2QYf319zBTBpmXfyiRU2qEY=;
        b=Zxg2ArUj3xsRjpAoSdiaRXwZarmKWa8ZE43oa+5IwpHcnVAy/wh7Gj9pDyDpe95vrn
         cv9D6wgcHzubMH6EZQ16wX6mLZhWrV8cdakfgRkSCLPsDZ0CDD4uVm7xgJk45a1S+AVb
         ozX/EATuSldbZ1kS9DbgyM8wlUBCIDXPCmyfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=emnir1PsiDwAUVvQ9cWZ2QYf319zBTBpmXfyiRU2qEY=;
        b=OMZpqN8LrGK0kSpv6E/6QN+LI9HcFXNKdEcQuYHsirflNGDtNXSvynmOgDLuID/XQ0
         znoFKaKzn3IEqacHycazJVZlbjCKGYSickPMMxEpcw1pihTa1b/aDlF7PLLfUlp0MVLR
         StvN6+7zG0UZpa6rn5wuFwocfhj1TK0jmr3OqZxeJio8IkKujBgN1ReAyb6/sgQKtBP8
         6d7AkJ1QvqGhvNnEz3xMCT2ui7FJM4PBoFizURm5e8fEhqxop0nxZyeVEaItaDk+eCkr
         y/8rpMqHBXbGJ3q4kRdcUZIYKP1TAoBcDEgPeNdpVJKlVmDWNbcWvgU8qhQCd1Qmaozg
         EQQA==
X-Gm-Message-State: AOAM533/CwjAvzP/kC7aW9Hu1bKBUcNyDIcWI9Q+CjTlGhDd7HHBW7uw
	st755u7Q/HNnwWgp9iD3QYN+/Q==
X-Google-Smtp-Source: ABdhPJyfyQNbWdfVOQxYRvs3AkUtCJSfPWVhJceSpomFmdjczp6imtTeRIutN/LxayHCcLY5iO4uLg==
X-Received: by 2002:adf:8b4a:: with SMTP id v10mr2747566wra.212.1607058257170;
        Thu, 03 Dec 2020 21:04:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c4a7:c281:e12e:8d29])
        by smtp.gmail.com with ESMTPSA id l14sm1552487wmi.33.2020.12.03.21.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 21:04:16 -0800 (PST)
Message-ID: <ad40fd1f62c7d837ca8052a2931f73fda43dba7c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/containerimage: update for improved cleanup
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Cc: Anibal Limon <anibal.limon@linaro.org>
Date: Fri, 04 Dec 2020 05:04:15 +0000
In-Reply-To: <20201203161611.1346206-1-ross.burton@arm.com>
References: <20201203161611.1346206-1-ross.burton@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-03 at 16:16 +0000, Ross Burton wrote:
> ldconfig/aux-cache isn't generated anymore, and the opkg directories
> are correctly removed now.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oeqa/selftest/cases/containerimage.py | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py
> b/meta/lib/oeqa/selftest/cases/containerimage.py
> index 4ad7f0e654..5d498f5bf2 100644
> --- a/meta/lib/oeqa/selftest/cases/containerimage.py
> +++ b/meta/lib/oeqa/selftest/cases/containerimage.py
> @@ -58,13 +58,7 @@ IMAGE_INSTALL_remove = "ssh-pregen-hostkeys"
>                      '.{sysconfdir}/ld.so.cache',
>                      '.{sysconfdir}/timestamp',
>                      '.{sysconfdir}/version',
> -                    './run/',
> -                    '.{localstatedir}/cache/',
> -                    '.{localstatedir}/cache/ldconfig/',
> -                    '.{localstatedir}/cache/ldconfig/aux-cache',
> -                    '.{localstatedir}/cache/opkg/',
> -                    '.{localstatedir}/lib/',
> -                    '.{localstatedir}/lib/opkg/'
> +                    './run/'
>                  ]
>  

Nearly, but:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1602/steps/15/logs/stdio

I've a fixup I'll test and squash in -next.

Cheers,

Richard

