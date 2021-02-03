Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.11090.1612366846431620107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NJ097lKR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id u14so3018689wri.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 07:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xbV9MBiuW5AtrNDcz6VQmoKUi9Wx1g4XaKHUeAXGVFo=;
        b=NJ097lKRWpyqXBXT0dF7EznK7vQJO+YmH8bgtUqvRWL5Yp1dXl76WJriTttnS2Df7m
         ASQWvOeGCRCc4oDWdXKLYMCvHWVFctaFLYRYo9QbYzxBChduU7Q8vIyIeUC09gMfLI1x
         /eDytZu10ZB2jl5BPNJ8BhV1q660cQ+YBJ9fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xbV9MBiuW5AtrNDcz6VQmoKUi9Wx1g4XaKHUeAXGVFo=;
        b=fZzj8BonOMO+2MgGVjP/d8T4gDM4kPd+vM3bBC1LCgRDmWVgVgUo7GvkmVFUMZygci
         ufkwX1mOFZr6MhP1YKyGcoZ+iFDGkUuLko1MlR4MHS+jS4nvcKNwrAncXq2rqdC2A+8N
         yOe46r5ESHU3xEEM30XMmTS/2839ZRJOu5Ber4yWOMZarHWhDHjIyXSiZWHC8YMvzMiN
         klxgLoHw6dlU6G5y0lTTeMxIyIf5pfXSQ6r6xOd7ija3y86xYGQgORZbceIXrD3d7Isa
         GUstxXnhyeQiJffhmcy5BM0F4U8pOny10W0harus0xLwZ3YR1mubbdDdj3rJ5ZIU1A2Z
         HgUQ==
X-Gm-Message-State: AOAM532NMnsI88VeW21YqqhugVpbvf5lqw/qZabvFUu7WDSLX6IrGQgv
	Lv1sT3dwwzupleiDGj2ntGuYaw==
X-Google-Smtp-Source: ABdhPJwCnN/hca7r8riG74qdmm/ND/oDFq3JNIWvy+kYCA3cFmQ+nS1SVCpul7uCIqjzXpI4Yr/A5A==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr4162486wrm.277.1612366844978;
        Wed, 03 Feb 2021 07:40:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a910:113:8225:ce6d? ([2001:8b0:aba:5f3c:a910:113:8225:ce6d])
        by smtp.gmail.com with ESMTPSA id e4sm4088876wrw.96.2021.02.03.07.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 07:40:44 -0800 (PST)
Message-ID: <b7ff42adf3698e3f94404358ed5cff2a7dc129f7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.33
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 03 Feb 2021 15:40:40 +0000
In-Reply-To: <CAMKF1sqAKen0iJWEUHnfQu3vH6mNyTywwH3hThChBpCgHia4yg@mail.gmail.com>
References: <20210201183910.145052-1-raj.khem@gmail.com>
	 <6557c3fc0dfcfa0968186079d6db005856b745a9.camel@linuxfoundation.org>
	 <CAMKF1sqAKen0iJWEUHnfQu3vH6mNyTywwH3hThChBpCgHia4yg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-02-03 at 07:21 -0800, Khem Raj wrote:
> On Wed, Feb 3, 2021 at 2:30 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Mon, 2021-02-01 at 10:39 -0800, Khem Raj wrote:
> > > Drop backported patches
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > 
> > Patches fail to apply, e.g.:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/1911
> > 
> > (but basically everything failed)
> 
> yes there is a dependency for this patch where it has to apply before
> the binutils 2.36 series.
> I can rebase and send it to apply after it

That isn't it, I got the patches to apply, the glibc recipe fails in
the do_patch task though!

Cheers,

Richard

