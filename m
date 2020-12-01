Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.10639.1606832119354601572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 06:15:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FP+ZXIGk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f190so5355889wme.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 06:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=J4d0a3miaX+nn+3X0XolcHccPey/WnBANdvvvXlOuXw=;
        b=FP+ZXIGk6ajBbcSMcYmATAWBSfeLP8sZct8NhVsAxoRnKTa5SqTEC1xZsVsoV44R9n
         yuhyllJ7JPpzyqz3WwS4qcM9P1bqL4j+KkaQ5ve9mUOfoSekqMD1osqxO6Gn0w9TcjZN
         Og/5F00oXw/1mB5xVK44GqsfRVq/ID495qHSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=J4d0a3miaX+nn+3X0XolcHccPey/WnBANdvvvXlOuXw=;
        b=W2hGIFG/GOrYY78ZIaEhsktUL0swEdP0GyIkcEexLUNiy0SDtaMd3O7oC6SMAi3hPg
         lEjsoBM6j/lY67YXmQ3xwpUQVkOU5mN9ZFl9u9yZii6CCGXaVWLmrpS/WSgWNnIqZ9bm
         u+gxzusaAPC8WeibdghN036iN43q0btkbObC7c12MH65s4qqB+gEnmIIxZr5Hs1ObBEr
         xsJo6VbI2T3KTbPcIspRmF+auP1/hvIjspz/Sr/+qBDq24cKgqlPbocox0my4mvjUcZm
         3kk0xqFc36JH0nZBlvGe7CfIoFUwKqZnp8TejREJiRxoV9Mim2E0uD2IP9pEbirERF9G
         jtew==
X-Gm-Message-State: AOAM530A9CXaAzuiW1GRdg4O6i+6AamGX8LAqh5NZnvcZp5P/65Q21WZ
	IQEHB1SEUS2DUr2FvOBxIPhonQ==
X-Google-Smtp-Source: ABdhPJzB1DR6gpbYBaughh96yWIvI78deAJSzukw5m54BnwE4VqatoNleER8/irfH0tNFISrTH3kYg==
X-Received: by 2002:a1c:5a08:: with SMTP id o8mr2970281wmb.142.1606832117689;
        Tue, 01 Dec 2020 06:15:17 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b1c8:3e5a:82cc:7486])
        by smtp.gmail.com with ESMTPSA id j14sm3412876wrs.49.2020.12.01.06.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 06:15:16 -0800 (PST)
Message-ID: <0976a2df7109d102b71033dc444ba9414670d4aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] procps: split into binary subpackages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Sinan Kaya <okaya@kernel.org>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Dec 2020 14:15:14 +0000
In-Reply-To: <CAP9ODKokNQw_HmiX6MC2wbB47tapHXC-9Za5tKzkbbtYsFHr6A@mail.gmail.com>
References: <20201201034326.11447-1-okaya@kernel.org>
	 <2d6b4cd69ed05454b7936f0a3a1c320db1c56558.camel@linuxfoundation.org>
	 <CAP9ODKokNQw_HmiX6MC2wbB47tapHXC-9Za5tKzkbbtYsFHr6A@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-12-01 at 08:29 -0300, Otavio Salvador wrote:
> Hello Richard,
> 
> Em ter., 1 de dez. de 2020 às 07:37, Richard Purdie
> <richard.purdie@linuxfoundation.org> escreveu:
> > On Tue, 2020-12-01 at 03:43 +0000, Sinan Kaya wrote:
> ...
> > I am starting to get a little worried about the direction these
> > patches
> > are heading in. How much of the system are we going to split into
> > individual package per binaries?
> 
> I am wondering why this is a concern for you? If we keep the old
> package rdepends on the new ones I see no problem in allowing this
> granular packaging.

Taking this to a conclusion its heading towards, most recipes
generating more than one binary would end up with this splitting code.
I don't like having large blocks of python in each recipe and heading
that way means we should probably change approach somehow.

My worry is that simpler recipes are easier to maintain, test and
upgrade.

Cheers,

Richard

