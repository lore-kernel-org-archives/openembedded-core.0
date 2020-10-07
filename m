Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.2526.1602108276042326830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 15:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TaAEBmGx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id d81so4070988wmc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QEswr6q4h2//RbjfJHojDfVpqMSYsGqiSIqXNuC/Psg=;
        b=TaAEBmGxM7W2FOmje/czvq8kv6RmdeRc23fkIfpSbMypdkfPdzD6+brPrQ4rY+yBsz
         bwdKSOBRa2GT3KsatCrbmYcWO3zZyUIlu4lHOvU3hx3fwR6WrVnuorOeLqR4UP2+Gxcu
         RS76Idag08c2DekBLuXVl0lFhMg/XsciKYIy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QEswr6q4h2//RbjfJHojDfVpqMSYsGqiSIqXNuC/Psg=;
        b=Tw3RmK3soHGe++VCZphL+6+k/H6pi+XzGchQfEaACyDjMtbAN9Jxz6bbSsvYEjt1HW
         1zv4yQjEBFUSABGpA1Bdq2zIVUBzc20bsjogU+HS+8afwhXr6+Q0oJW1mNUaoltXsboA
         dHNoDXBOm/0a3IzgBmBEb66E5IIjQIO4izzMZHKHAjMnfk4jGwwyYizgpc3u/BUi9YDM
         AEKE5FIBvWkX1znrAvNreClFvFAcqRufwy6OSHbeqn1O0srdgVLhWqgpJBYdbae44FOD
         78Gp9YcHqnQt9mYbQF1BMrvy9I+trm6yDRdvNZA5R5JoE6v43qdJZeJfeZSGAaWfpBUC
         RPUw==
X-Gm-Message-State: AOAM5330VnY+KIZF3ReDUvOKkTJUSRbSYqvt6xdMhdc1tzVJq/Ce9Brh
	FhiyMrK1YSIuuA9gAJWDRMFl+A==
X-Google-Smtp-Source: ABdhPJyJDytc+j6jTvxO6adxqaufPT8rd7kDTBo504PggsX3t8WM7RGq9d4P0xSvva8fgits0rTOVA==
X-Received: by 2002:a1c:6788:: with SMTP id b130mr5751965wmc.91.1602108274392;
        Wed, 07 Oct 2020 15:04:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id l3sm4129104wmh.27.2020.10.07.15.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 15:04:33 -0700 (PDT)
Message-ID: <769d0e90ad1512b1a3fa62bf40687a7210660968.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>, kamensky@cisco.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Khem Raj
	 <raj.khem@gmail.com>
Date: Wed, 07 Oct 2020 23:04:32 +0100
In-Reply-To: <CAM9ZRVst-JLA3aOa+U2Sd1Cqj8ARsAyVhCu0Yhhk5we+FKsmdQ@mail.gmail.com>
References: <20201007203838.19096-1-kamensky@cisco.com>
	 <20201007203838.19096-2-kamensky@cisco.com>
	 <CAM9ZRVst-JLA3aOa+U2Sd1Cqj8ARsAyVhCu0Yhhk5we+FKsmdQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-07 at 21:46 +0100, Paul Barker wrote:
> On Wed, 7 Oct 2020 at 21:39, Victor Kamensky via
> lists.openembedded.org <kamensky=cisco.com@lists.openembedded.org>
> wrote:
> > [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c
> > 2c2
> > <         .name = "34Kf",
> > >         .name = "34Kf-64tlb",
> > 6c6
> > <         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 <<
> > CP0C1_MMU) |
> > >         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 <<
> > > CP0C1_MMU) |
> > 
> > Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
> 
> Forgive my ignorance as to the range of MIPS processors available but
> does any real MIPS CPU have 64 TLBs? If such a CPU model exists
> shouldn't we be using this instead of inventing a new model?
> 
> I'm a bit worried that targeting a unique, fictitious CPU model will
> lead to us wasting time debugging obscure failures that other
> projects have never seen and that would never occur on real hardware.

In this case we're playing with a single configuration value which is
dynamically handled by the kernel and used at this range in other areas
like mips64 so whilst I don't like doing this, a 40% speedup for
qemumips is very very tempting.

I think the maintenance burden and risk is low, the win is significant.

I have to thank Victor for some great analysis and what I think is
quite an ingenious solution!

I'll put it in for some testing and see where things go...

Cheers,

Richard

