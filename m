Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.17109.1611354887565252793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 14:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bwxud5LJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d16so5844484wro.11
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 14:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pBEiM+OjkufTfyWuu0UkBTpJmGoPd05lRBs/YjsoZjw=;
        b=bwxud5LJ1kvt4gXiRDIg9uApuyA5rn7M3HpXZfLmHIW8FMPKdw0rARRjCWZMxS1Psk
         /YGWM3BfxB53YlkVELnsW5gH2vN5j/gYLhsw+Qy9AyCC4WLMXJiRPictWqoPVfEdAbuK
         +fWHXaV5ByWfUDxvZdG3lN71YgV1x43Sy3hEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pBEiM+OjkufTfyWuu0UkBTpJmGoPd05lRBs/YjsoZjw=;
        b=m/blFxmr8AFUaa1ZM//71WApBPkkGFPPtCxY47irueOnpHwDLL+xZqR4LHu0Y3XOLn
         vjrkaYQ1B5ZYPqprAOMVirsQdqRYyMqZrADM1vECtn0gC6XwqW81f02GaoVfU283T5MV
         /2NhIFiYhf+6eyHeQ20KhnnEJef1T7pskeZwZhb0RmUR7lqa5x7C11EBxPQT3iMO9Ju7
         Jr6DAW/GQ2MCFWVDAL3vHhcOlmRKG9dIwG6ixtQwkSXih3HPsYzncLgbfCD1E2pzdFmU
         yUnO3p3PrB0aduhr+g+Iou1vm/i19fLI9jIur4in94doIZMyrZCASfI70w67970vxuuY
         emMA==
X-Gm-Message-State: AOAM530+0tEojpAUjmAUxPnr1Qh7/co47WFPIa381ZEk0hiH4kuhQCd6
	Nsi/UNQHrkEVX1Uta81ZZyzWCA==
X-Google-Smtp-Source: ABdhPJzY87deJV7AFQH+W2CcjGeqruO3eRhLHI0WVby/BAoIZgpk1+tg9x0NnSj4SHZPOaOrTIbYDQ==
X-Received: by 2002:adf:fa92:: with SMTP id h18mr6519401wrr.142.1611354885843;
        Fri, 22 Jan 2021 14:34:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ffa6:412:4146:4305? ([2001:8b0:aba:5f3c:ffa6:412:4146:4305])
        by smtp.gmail.com with ESMTPSA id s4sm12856673wme.38.2021.01.22.14.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 14:34:45 -0800 (PST)
Message-ID: <223f2187cf62d0e3414418436197072c328746d6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] elfutils: split libdebuginfod into its own package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Dorinda <dorindabassey@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2021 22:34:44 +0000
In-Reply-To: <20210121203853.1461-1-dorindabassey@gmail.com>
References: <20210121203853.1461-1-dorindabassey@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-01-21 at 21:38 +0100, Dorinda wrote:
> add package options for libdebuginfod
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.181.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks for these, at a quick glance without testing they look good to
me. Master has moved to elfutils 0.182, would you be able to update
against that and resend so I can queue them please?

Cheers,

Richard

