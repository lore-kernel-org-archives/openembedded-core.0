Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.8965.1615297740253943093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 05:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XaqHX5M3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l12so15692674wry.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 05:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Grget9NZkyIDbuzEcguzRf+Ou2vf9o2PtRHot/XIQxo=;
        b=XaqHX5M3UImoIWk6gKUIe1AOrGRMkZ/HDwOwXJjZ8bOo+8YqrVm1395L0cYSQboIlT
         iAH2OHU0XYR0cJv7xSYi/ecfqR0pVzsb7Ifhd6L5a+A5aliiNt65ePdrhwgUyb73wApi
         fcbpoZ0dKpDBifZJyWG4T/343GMFmNyKVnmOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Grget9NZkyIDbuzEcguzRf+Ou2vf9o2PtRHot/XIQxo=;
        b=CN4bWQjhyaH95+yTsxatgnIYsMf07IknEnzsyekEw8KKYBeYuTZ7WNbn+BJWNJ/D7B
         Ga+8DxvDpHlO/D3c9FRXqCvU0j7JK1pbAqFNzGQphGPcmJHAmF4K8Bof3cKxPtvWgZpa
         ewFbvdX69y6yxJuKleJ4ghwWXvaE2mc0sGONOWTjeFGD1zekkAv3+NfJWuFue68EDUDI
         pVkkgNMxK617a39xc4I7+x6UaMTQ+8smC3r/5n4RYhXTbECZUY0F/U96PDwmM6JcwfCd
         KYT9UoA50wnJJmOhtgyjFiSq/eqYVLKpVdZJUE48B5KEfcBUBe/pR1DMdwR4VyWB83c6
         ZRmg==
X-Gm-Message-State: AOAM531Im+I49q66KvJW8BnVbIGZ/tGP64gxXRuGwFip7Ln6ODHUcYSJ
	wO9Q2GYbtmTli10mm3N97+GtZA==
X-Google-Smtp-Source: ABdhPJxirA65c0d/FPrrEVyLUcViVmuIVjXVUx04oNOkoiFQ+L9zi1mTNczZvt940NKR5UvQXXG9hQ==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr28020236wrq.69.1615297738743;
        Tue, 09 Mar 2021 05:48:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226? ([2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226])
        by smtp.gmail.com with ESMTPSA id l21sm4097387wmg.41.2021.03.09.05.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:48:58 -0800 (PST)
Message-ID: <2c2120081009a89543d1c1929d9abc88cf37136d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>, Luca
	Boccassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 bluelightning@bluelightning.org,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Tue, 09 Mar 2021 13:48:55 +0000
In-Reply-To: <20210309144734.7203cbb7@kmaincent-XPS-13-7390>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210305110218.24635-1-luca.boccassi@gmail.com>
	 <58bcb66c9e15d4121defef93cb6b34266fd89037.camel@linuxfoundation.org>
	 <20210309121859.053dbeb1@kmaincent-XPS-13-7390>
	 <c8159284d8980632a111126f61885e401a1eac90.camel@gmail.com>
	 <20210309144734.7203cbb7@kmaincent-XPS-13-7390>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-03-09 at 14:47 +0100, Köry Maincent wrote:
> On Tue, 09 Mar 2021 13:26:55 +0000
> Luca Boccassi <luca.boccassi@gmail.com> wrote:
> 
> > > 
> > > It miss also the Maintainer description for linux-util-uuid recipe:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1901/steps/14/logs/stdio
> > > 
> > > Regards, 
> > > 
> > > Köry  
> > 
> > Hi,
> > 
> > The DESCRIPTION field is in the util-linux.inc which is included by the
> > recipe. Or is that something else entirely? What is it, precisely?
> > 
> 
> Sorry I was not enough explicit.
> When you add a new recipe to oe-core you need to update the file:
> meta/conf/distro/include/maintainers.inc

The test which failed can be run as:

oe-selftest -r distrodata.Distrodata.test_maintainers

Cheers,

Richard

