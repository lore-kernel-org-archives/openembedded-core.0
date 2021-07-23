Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.2067.1626998734687684524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 17:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MFlNaUOB;
 spf=pass (domain: konsulko.com, ip: 209.85.222.171, mailfrom: trini@konsulko.com)
Received: by mail-qk1-f171.google.com with SMTP id c68so7162709qkf.9
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 17:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ulY+r15tcOG6XIXs9Oj1M0GxrQJfZ/+B63vgHaO4+c0=;
        b=MFlNaUOBzEmTWyz4ZdLD3l7feliTkbtmM2rvU+r3FyJ3FNqDizra6yIJtXTIF8Ga5c
         ZugG08QSn0vZWdbhr6/4JsTZkn7rFcHVBrPp0oQg7xDYDwIvvy7wTFnozF+hkhLqZRlr
         ijP3IxEOc/ZjLS9/RdkkzbMofwVZgxBtnXGuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ulY+r15tcOG6XIXs9Oj1M0GxrQJfZ/+B63vgHaO4+c0=;
        b=o8L4+7eNmXbqvV2iwiNE9+xFVHQo5wnW4oDQ31lhT1JmukNeila2Peve207XOliwXA
         QvlyRRkMbhe9EFe6IvgGJow6O2F/IwLvIiI8PNmolK6w0hNGWItnXGwCzMxkalTQK0CR
         RYRYPDtuvIDbFVpYPVxSe42O2IOrzVG7MCoP384v0XF70q0h5rFY8A2RfnEqRrffQ1Ht
         mTJSt6uWXFMMm8abVN4O007zhgmHL5Vvrx+OdOMwJWp3a8SCQ4lWd3J+pGbLBNz9W0ZY
         WFTHaFAIiLQ+qN8h8faHqRGz1J3sVTA1419yWsNQSr68+FUxmDu1HkPxj6Sv1UK+Zj+X
         Hygw==
X-Gm-Message-State: AOAM530kAHWx5gohBpfkbPTIynI0xJkTk8KO8fnO8x8lib/VdfJiqVHh
	+bj7WyxW/yUzLr2zFwFmzlQNAA==
X-Google-Smtp-Source: ABdhPJzESZm7t6W+J0d15nexkZcvGSJuejVcvycf1AX4P3lUu46U0OscO7EfBCxeU0x+x78KUxjD/A==
X-Received: by 2002:a05:620a:1998:: with SMTP id bm24mr2347490qkb.471.1626998733836;
        Thu, 22 Jul 2021 17:05:33 -0700 (PDT)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-5560-078f-fb66-41c1.res6.spectrum.com. [2603:6081:7b01:cbda:5560:78f:fb66:41c1])
        by smtp.gmail.com with ESMTPSA id v11sm6493823qtc.0.2021.07.22.17.05.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 17:05:33 -0700 (PDT)
Date: Thu, 22 Jul 2021 20:05:31 -0400
From: "Tom Rini" <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libubootenv: Disable for ppc/ppc64 qemu machines
Message-ID: <20210723000531.GJ9379@bill-the-cat>
References: <20210704210740.581650-1-raj.khem@gmail.com>
 <CAMKF1sqg7QMojTsPo=GSjzpEEb-QwmF8_GNXXj8SaC45wtJ73Q@mail.gmail.com>
 <CAMKF1sr0M_Tz066uNr55jGW5pOvDh_i+W9vYor50zB83rHK3Bg@mail.gmail.com>
 <20210722194912.GH9379@bill-the-cat>
 <CAMKF1sohpY6hOfaEgG94chqLUtLts2-T7YxQ6+CFn41cJKHdtA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sohpY6hOfaEgG94chqLUtLts2-T7YxQ6+CFn41cJKHdtA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 22, 2021 at 05:02:16PM -0700, Khem Raj wrote:
> On Thu, Jul 22, 2021 at 12:49 PM Tom Rini <trini@konsulko.com> wrote:
> 
> > On Thu, Jul 22, 2021 at 12:34:47PM -0700, Khem Raj wrote:
> >
> > > ping^2
> > >
> > > Is there any issue with this patch ? If so please let me know
> >
> > Note that qemu-ppce500_defconfig would be a good target to use for ppc
> 
> It would be far from what we emulate though as qemuppc machine
> 
> 
> > for U-Boot, but not ppc64 and wouldn't cover the mac99 machine type OE
> > uses anyhow.
> 
> 
> Same here
> 
> We don’t use uboot
> On these machines so I don’t see any harm in disabling it here do you ?

I guess I only high-level wonder why the target in OE is an old powermac
and not the e500 class machines.  I mean it could be related to how the
qemu target in U-Boot wasn't that useful for a while, a long while back.
So no, I don't object to this specific change, but I do wonder why OE
targets what it targets rather than (what I understand anyhow to be) the
common use case of qemu for ppc32 systems.  I could just be mistaken
there, however.

-- 
Tom
