Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.5730.1625576666359446501
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 06:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZSMDz+Mo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t6so16062617wrm.9
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 06:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DzfNQkadNAgt9VyMX8cuR838ceTx+LJ7nS1GFNiVR9c=;
        b=ZSMDz+MoSmslTavAxvRXZyggWYau9W9n6uzGGBZWx47Kl/YkZrIF7WyIeJmee6Ipdq
         R04ifGn+/AQI0OmbS1Fe5CPyffEslDWaIwzBsH+OsaqOLbAaBLDgDsBgm7c/qHR1Goj1
         ZVnJZvanYc2Upo85Fhi904QSZVUwYN/J4Yxiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DzfNQkadNAgt9VyMX8cuR838ceTx+LJ7nS1GFNiVR9c=;
        b=la5FwmvcKkHn2+dN3dLyyo5JqqnH7nwipzfzA9L/jS5+bfWsClKQeGso6rADHC/O/j
         1/RaG92L83AmYI+SImPCSuayEC/vJaIKRA40Mo7LaVcMcqrKGh3J3ZKIerhOQLGpzfNq
         hx0qW8rbjh+NG8rc0pztXkNaA9uoei9gd0cTW1LHTsYygE1Fwc7zjPMs6nf+l6zaKcOE
         CdbTRWaHp21i4CELOKbVZAmzGMUXxDfjlyKIg8LtrKT6hRhaWJ7bGxJeTI5FQUzMpmfL
         IMdl48TLqvIkqLl4Pr5v2hN9NCLFPxd07W5tz0ntqKk46qU9xOyHRem+uGMOUy4+rbyI
         sZqg==
X-Gm-Message-State: AOAM533p5H486AwBP4aASJxF4w/TT8/81KZ+OuhqwdbcYnzVmdS13ohy
	Gla5cYGKjzwgXaUpNcaPG85YBQ==
X-Google-Smtp-Source: ABdhPJy88RuiankC6zEGYVMhaRkeGcpH76gLD9MZdiEMXpGI7FMp7jFI9mqsARtqoyP78E++0JTrow==
X-Received: by 2002:a5d:4849:: with SMTP id n9mr14145768wrs.186.1625576664934;
        Tue, 06 Jul 2021 06:04:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e563:c72:c3fb:aae5? ([2001:8b0:aba:5f3c:e563:c72:c3fb:aae5])
        by smtp.gmail.com with ESMTPSA id x17sm1150507wru.6.2021.07.06.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 06:04:24 -0700 (PDT)
Message-ID: <1c1b7296ea99691d5e7c90fee5f15f9d91e4ff1b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "peter@berginkonsult.se"
	 <peter@berginkonsult.se>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>, 
	"liu.ming50@gmail.com"
	 <liu.ming50@gmail.com>
Date: Tue, 06 Jul 2021 14:04:22 +0100
In-Reply-To: <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
References: <20210702115900.19417-1-peter@berginkonsult.se>
	 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
	 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se>
	 <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
	 <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-07-06 at 02:44 +0000, Mittal, Anuj wrote:
> Hi Peter,
> 
> On Sun, 2021-07-04 at 10:21 +0100, Richard Purdie wrote:
> > On Sun, 2021-07-04 at 10:59 +0200, Peter Bergin wrote:
> > > On 2021-07-03 16:55, Mittal, Anuj wrote:
> > > > On Fri, 2021-07-02 at 13:59 +0200, Peter Bergin wrote:
> > > > > This reverts commit 10aa1291979fb90bed1beb49be4d406ed0e1e4d5.
> > > > > 
> > > > > As there is no build dependency between libubootenv and the
> > > > > configuration
> > > > > of u-boot there is no reason to check for UBOOT_CONFIG or
> > > > > UBOOT_MACHINE
> > > > > by adding the class uboot-config. Revert this in order to
> > > > > remove
> > > > > useless
> > > > > workaround in bsp layer (meta-freescale).
> > > > This was added to address failures in world builds:
> > > > 
> > > > https://lists.openembedded.org/g/openembedded-core/message/141757
> > > > 
> > > > If this is not required, then I think we'd need to address those
> > > > failures.
> > > 
> > > Thanks for the pointer about the reason for this patch. I searched
> > > a bit 
> > > but could not find it.
> > > 
> > > Can you please help me define 'world builds'?
> > 
> > "bitbake world"
> > 
> > i.e. build everything
> > 
> > > By reading the mail thread my thoughts are that the obvious thing
> > > is 
> > > that the build has a bad configuration as u-boot is skipped. This
> > > should 
> > > be the thing to solve.
> > 
> > Not every MACHINE will support u-boot or have a configuration for it.
> 
> Do you have a fix for this? This patch was applied and now the world
> builds for MACHINEs not supporting u-boot are failing. Do you mind if I
> send a revert of your patch?

I agree with reverting it FWIW.

Cheers,

Richard

