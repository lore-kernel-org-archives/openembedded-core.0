Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.2890.1626986437278040585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 13:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aa9XbHO/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 14-20020a05600c028eb0290228f19cb433so2323429wmk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 13:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xPFODKS7hVYvnpympX5Na/0zYECAXEBoaiGvymUVSx0=;
        b=aa9XbHO/hBlcSGgcS/mzdcGIyKI533rCxEPA9Wsn+5RzI6BSXTX9mqyQxiOTBtdZK2
         fKrI/Tu4f2wLnGE84rxy0ecPXUmUUHmj09FGU31bmINquxkMDYB1kBbzA4H1spoTxqqU
         7VmQM59GNzUgVw0dY9laupmm2QjFiS7BPHOM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xPFODKS7hVYvnpympX5Na/0zYECAXEBoaiGvymUVSx0=;
        b=V4PThVpZA3jpRgehcci0hhhL5uVtZn0VDJ8XCHcQ7VljjYPBCoGh1TxS5DaxT2Be6y
         WmIQXboQWzprfAZ7XhD5hq9LhTLR43NpglxMASO2vAcBUME7KsZfNpPAwqAuT++EPOey
         KHLy3eV8SuzqFNsn38UQEFawnckcBC73mVz0uasi8QuGmTwqu9xLPlNAnxveQxTw3Y1l
         1IkKPJ7IZ0LELrV1BQV7vp8bdj0TPk3m7nZamKfIwL2LplDJtOavfAzU2SDW2mT20TIP
         A/kw2GY0j9i4ZtEHG/4gU8ajXtWynY5G+mBCuoxbYJ/2oULJkhYO3kIY6TAJ0gZ1COBz
         zICQ==
X-Gm-Message-State: AOAM533L8glFwZx9oy1FPSgmDU4YwtKATiepA7dy8IfFihbYk1LPvZ8p
	NpwRZhcUGESRk6uLe9+XNPoGyw==
X-Google-Smtp-Source: ABdhPJzE+DapQdMVuBpUuXcBsBOpi4vUNpqIYLVEK82NmclRs54eTTo6KqubbGzmGWynn+DMR5Zd+g==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr10767986wmj.76.1626986435790;
        Thu, 22 Jul 2021 13:40:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8? ([2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8])
        by smtp.gmail.com with ESMTPSA id p18sm3386399wmg.46.2021.07.22.13.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:40:35 -0700 (PDT)
Message-ID: <46e544e5cf50de037f49c49d60dbc506804c9669.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] maintainers.inc: remove myself as a Maintainer
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Jul 2021 21:40:34 +0100
In-Reply-To: <d95c257a-7361-9643-52fc-4f1455502283@gmail.com>
References: <1692B6B561129FA3.23903@lists.openembedded.org>
	 <d95c257a-7361-9643-52fc-4f1455502283@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-22 at 06:24 -0700, Armin Kuster wrote:
> 
> On 7/17/21 4:08 PM, Armin Kuster via lists.openembedded.org wrote:
> > I am releasing my responsibilities from these Packages so that those who 
> > are better capable can participate in the Package Maintainer Program. I
> >  have not done anything in years so its time to find better stewards.
> 
> Ping.
> 

I've merged it. Thanks for your work on these, sorry to see you go.

Cheers,

Richard

