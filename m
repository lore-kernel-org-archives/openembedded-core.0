Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.10673.1592800842599078210
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2020 21:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lrBogZF9;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id d27so8782552lfq.5
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2020 21:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=idIyNSSQXoglc2YJjRax+SpappHv0cQsZO5oUTeW8/w=;
        b=lrBogZF9GykLiO641AuXH/hMvt/EfZ4Mknv0mZpTc1arKF0hnRMfXaJrCkt1+EV4qE
         Ry/Z/qCtl5Ld6pR6R0Q1bvF7leu85JBXZPTYKdeTJDoaC5jz8JRQeFsq6wqfmZxpZn+N
         Pg5jTiDa5Pc+t9yrwPjPG3qHQ9p+/QAs/BUJuFj19EwoOUaRdvoZNqitkUsS+Cm4sps3
         5YA7i7UfJ/9fCx+F/CcAlX6Q726kT+JHy40b7PljZVFq6rw3BextzQPKCeIdvvnp3djz
         +M/oEpFZhhIDrSKNVc/pTMwgIAloOnzJkwjxlpVk0ZOc0BNoxkYCUyr5Aeq8/ZbnHssY
         1ZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=idIyNSSQXoglc2YJjRax+SpappHv0cQsZO5oUTeW8/w=;
        b=b7Zk+eHUvkLrD3S4D/66cQqxkeI0+5Rt/g04wu9P449V5SjRA9Hs8iP9oW6lBGtduk
         /GO2zdFb2AreQv3SmXJWZ79hYQ3JYvUfPl1HwauUtDjbJmg5+GBIjlzpzxuhtUI/aYmM
         sKxsPeyVa0OcOi99QI4kEu35nk14Vq9koaDkZnHvA3LL8DXUP8mXAdcbbGsFATZ6HvFN
         g/i2o2PBFVHYniq2yBgtduJDsGexAa9Vp202BDvO13K8z36akjDm0rNb8ZA3agzkvdAR
         adlZcE0Rbmweq2+yVEkMw31tFuc55negol1tHdom0lMSlcUwui7jElMUQl5cHP8z92Jj
         Mwcw==
X-Gm-Message-State: AOAM5307G+zvL6ODle7pj2aufflBsiqZrzfIns2+FicGpTIgSCyUdnFp
	n+M3WiynxKFnbgbBEef/nBLhjnJz
X-Google-Smtp-Source: ABdhPJwtN9yPiLUf64iOwe3yjnGKZYl1+MQosw/8bACvLvWIdOLD4TJXx2yENrCSkTGsWP/wH/G3Og==
X-Received: by 2002:a19:7f02:: with SMTP id a2mr8480987lfd.193.1592800840436;
        Sun, 21 Jun 2020 21:40:40 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id m15sm3177273lfk.65.2020.06.21.21.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2020 21:40:39 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] xinit: add rxvt in RDEPENDS
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200622015153.3877288-1-changqing.li@windriver.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <5c541bf2-f2ee-f792-3371-99d577d3f8cb@gmail.com>
Date: Mon, 22 Jun 2020 06:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622015153.3877288-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/22/20 3:51 AM, Changqing Li wrote:
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
> index c9e28d9bba..2f2ba3af71 100644
> --- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> +++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> @@ -19,4 +19,7 @@ SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa
>   
>   EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
>   
> -RDEPENDS_${PN} += "util-linux-mcookie"
> +PACKAGECONFIG ??= "xterm"
> +PACKAGECONFIG[xterm] = "--with-xterm=rxvt,,,"
> +

Maybe "rxvt" would be a more suitable name for the PACKAGECONFIG ?

Jacob
