Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.2146.1602184547444364259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 12:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DRRkVS2O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id e2so7632159wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 12:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NR/AIhBraG3Sc6aih1lpWGslJVI0RsblMofdr1gtW1Y=;
        b=DRRkVS2OpO3+b0e2I2xE3984bqVO55xNCznuotBI3Y67rq6f7Eh9dMKyijwEA4LCbn
         hFnQRPzMC3r2XYeyCtRoZrdKltR0OU222Ivzwas5eqlKKQw4M9K1o5cNZI+12RLA2vgD
         UHqBrg/IpIp2CZHjd5ZS7LrKtTpM6iuv73FSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NR/AIhBraG3Sc6aih1lpWGslJVI0RsblMofdr1gtW1Y=;
        b=an/QuQUqv4THpCv0HfsZM7ECnctid1pF1qws54pY4OCdAhIyJMktJh9EpURzD/E7zm
         ZXo7hH+2+FqQKjFuX1QQ+0Mn4r/w8QoWe8IuXleZwzxT0Szr9baHs/060lyjtVh4vlfk
         dEiOUEkbLMfzn0ku1aVA4YD7Ws0t43DU+Sud3s8rPZ1pxg5h3QUMAmHRiWmFRrwXwHWP
         xljFvZi3ugT/2mm1JMFtdLR5HyKlfXA7NgRLxnp+dSd0/WHAprkYA782p+/5axLyPmFz
         lWfUS9iukuOCq95sVWUwu6j6N+3R6UuaZ8HFI8Ii/KpTWSCf6Mv+xuNADWSIxENoI+5d
         bICw==
X-Gm-Message-State: AOAM530vVuGPfEMchDHU4DkzrE0YjAmk5HHBUuea5xI/BNa2vf0rrxaQ
	xrsy+z2KaLVAv22H9InaN8mX0Q==
X-Google-Smtp-Source: ABdhPJxqUI9/t2haQnLvCdePtmyAtGnGwn79L+JIWFZmL8e4GwKIpPSUXNP3b+1LQw/QxCXkM/AMqg==
X-Received: by 2002:a1c:9d90:: with SMTP id g138mr10221927wme.5.1602184545508;
        Thu, 08 Oct 2020 12:15:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id j101sm9324997wrj.9.2020.10.08.12.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 12:15:44 -0700 (PDT)
Message-ID: <16e3c3331f61997942e612e58cfee6f8f8ab01c5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] waf: explicitly run waf under Python 3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Oct 2020 20:15:42 +0100
In-Reply-To: <20201008162359.3098059-1-ross.burton@arm.com>
References: <20201008162359.3098059-1-ross.burton@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-08 at 17:23 +0100, Ross Burton wrote:
> We don't assume Python 2 is on the host and don't expose an
> unversioned
> python in HOSTTOOLS, but waf uses the unversion python binary.
> 
> Typically this is solved by patching waf (see the glmark2 recipe) but
> this can be solved centrally by invoking python3 directly.  All
> wscripts
> that needed Python 2 would have been fixed by now.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/waf.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Please rebase against master-next, Joshua beat you in patch submission
against the class!

Cheers,

Richard

