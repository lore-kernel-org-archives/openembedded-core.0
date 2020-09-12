Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.24074.1599937888098465908
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 12:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HRL1EHWu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id l15so3266193wmh.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 12:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=GdH9H4QLs5JzANAZCv5XVhFgvdFGS47C23W+6wzaAqY=;
        b=HRL1EHWu5b/xJKR67RGshFoV/QQkuoSk6krmc3Y3gC7mpV9AwnPBMaKtm3+ikci+0H
         yO2rmneAJoI6SJtzPfiTtjax4HGnD/rk/u0xlLFTOP1fbvFiA2iokO09wSPjKjVe81lg
         ETHJVZbSz9C9Qakn3wd4AeMntvQLPFj/rx+8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GdH9H4QLs5JzANAZCv5XVhFgvdFGS47C23W+6wzaAqY=;
        b=DdL4xwOQfimqoDedyffkw5tCtDhRVRavyW+hRW6wHvTbREOY4O+bSv6wCYmPLl+zR8
         cx4OWNBpGvkufYtDfQMcV0WLX9w6VQGo37dqbXFqn7VreGwoHza7FNHUwpF9U9hJCHyK
         j//dHDpUyflf12On1rDO2JeApYoIQaW2Ajqu1bksH8KuwhQDi1Z3V9sL1CFO53bEiTQp
         0L5PcRxGrWIwLpjklkvTwv7Y1hmtRJVCmT43ziSuhCXE9RLT12TwNYPqkH1cWPH3psYM
         1GJnvZ2IbIIkE0du90ZqD3ha8I5hq+WNQcRSkyutsZcs3CE3XP2BDqOQddM2/JVjExWR
         62/Q==
X-Gm-Message-State: AOAM532fNVZlyOz/K10I7YGf56655Iq1maghYgRu1469tgCuP51Sz8dT
	hll0unbEfI90EsOVvs833XD9nf4a8fOVDw==
X-Google-Smtp-Source: ABdhPJxWkp8+U/G08h/O2rmsmYtaAqHw8Ivq91rxB8r9c30iAAbdVqlBkSHQML9SB5j9oO3o/BhRpA==
X-Received: by 2002:a1c:7f14:: with SMTP id a20mr7990536wmd.95.1599937886321;
        Sat, 12 Sep 2020 12:11:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 8.4.6.b.e.8.e.4.6.7.0.3.a.2.d.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (8.4.6.b.e.8.e.4.6.7.0.3.a.2.d.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2d2a:3076:4e8e:b648])
        by smtp.gmail.com with ESMTPSA id j14sm11911622wrr.66.2020.09.12.12.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 12:11:25 -0700 (PDT)
Message-ID: <84342cda07aa41fb6f03a1dda815c22e1609bd44.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] sysvinit: Remove ${B} assignment
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Gloff <mgloff@emacinc.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 12 Sep 2020 20:11:24 +0100
In-Reply-To: <20200912164811.978100-1-mgloff@emacinc.com>
References: <20200912164811.978100-1-mgloff@emacinc.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-09-12 at 11:48 -0500, Michael Gloff wrote:
> In order for the VERSION variable to be set, the
> top level Makefile should be used, which only
> builds the code in /src anyway.
> 
> Signed-off-by: Michael Gloff <mgloff@emacinc.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit_2.97.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> index 80ab9d70e7..98916f7f19 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.97.bb
> @@ -24,7 +24,6 @@ SRC_URI =
> "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
>  SRC_URI[sha256sum] =
> "2d5996857519bfd8634d2e1debabb3238fb38440f65fbfdc46420ee8bdf25110"
>  
>  S = "${WORKDIR}/sysvinit-${PV}"
> -B = "${S}/src"
>  
>  inherit update-alternatives features_check
>  DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"

I don't understand what you're saying. Why do we need the VERSION
variable to be set? Does sysvinit not support a separate build
directory?

Can you rewrite the commit message so that someone who hasn't looked at
the code can understand what the problem is we're fixing, why its a
problem and why this is the correct solution.

Thanks!

Richard

