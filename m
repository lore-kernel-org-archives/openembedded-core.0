Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43266C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 10:27:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.8671.1636626455716410379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vc/rsdSk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id d24so9033841wra.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uodOvey1O+Z3q+FE2owlXhFQbF/2F+2KdiiZd2X4cMw=;
        b=Vc/rsdSkNwELcEGwPg30CSFkXz0v5Gw4CvCJ8pBnd3kgBWPQnH2Zpq2O+OT0Tgq6LU
         A/AaTJ+LUiQmtrTEIxq5p5itvO4+M4qjG3UbXgI3rJE+5tFkuyKMTGo+5yiOzrEdZz6x
         KN3cygYR+3D9TPBU5baw3CuR54wzPIDLwi02Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uodOvey1O+Z3q+FE2owlXhFQbF/2F+2KdiiZd2X4cMw=;
        b=AXEyCvyNFNHRxCDeq0lcdD6oplM99WbQko2dVZIY9A83LQLekjGL0qpSItb9DP0p7X
         wa7/RVrdAdCPBkiN7tVYdamVdm6Ypz1PPOxtmEIb0F02TRBZ38lMPKWjbb6OnV7XCAuV
         IIfjnpWK7AQWq0ZV9D7lZ223cbGH0gO0slsyvjI67dIv0wOIzlMqXT0Vyu6sXJNwBj6p
         owOQgdz1SdBrCZluaNXA86E5KqF9HBuzJF6QrGKOe/0XZcl/hAz9FpyjjelbndITuGNt
         8p7BRBlYjUnsqzBDaP4JGJ9m/o4YAkByEysVN8z4xpE9ErX+09+EqbiH7EVjhXQYG4JL
         sykg==
X-Gm-Message-State: AOAM532fLDrkRrhF3ZagrtWDcYKbQZgdKKGO4sDbIX4hXfSisPtnJN1t
	K4OBC8sgba3HmvkyYjNyPyNGHA==
X-Google-Smtp-Source: 
 ABdhPJzx/6AZBolvZifORqhc6tEgP4Wj4oC9yovRofBxORV5jxlvanuuRhJpNhH1vv6IpaKcFujIpQ==
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr7481888wry.407.1636626454261;
        Thu, 11 Nov 2021 02:27:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc?
 ([2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc])
        by smtp.gmail.com with ESMTPSA id
 y7sm2456793wrw.55.2021.11.11.02.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 02:27:34 -0800 (PST)
Message-ID: 
 <78932c364d7ab967ad0733ac5b5d0d95bf7af5ed.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 04/24] xserver-xorg: update 1.20.13 -> 21.1.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Eric Anholt
	 <eric@anholt.duckdns.org>, =?ISO-8859-1?Q?An=EDbal_Lim=F3n?=
	 <anibal.limon@linaro.org>, Khem Raj <raj.khem@gmail.com>, Ross Burton
	 <ross.burton@intel.com>
Date: Thu, 11 Nov 2021 10:27:33 +0000
In-Reply-To: <16B67702B21FC1CD.14836@lists.openembedded.org>
References: <20211110193937.2606747-1-alex@linutronix.de>
	 <20211110193937.2606747-4-alex@linutronix.de>
	 <16B67702B21FC1CD.14836@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 10:27:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158160

On Thu, 2021-11-11 at 10:26 +0000, Richard Purdie via lists.openembedded.org
wrote:
> On Wed, 2021-11-10 at 20:39 +0100, Alexander Kanavin wrote:
> > libxcvt is a new dependency (thanks Oleksandr!).
> > 
> > Include ${libdir}/xorg/modules/input/*.so into the main
> > package (if for someone separate packaging matters, please
> > investigate what they do).
> > 
> > Remove options no longer present upstream.
> > 
> > Remove patches available upstream; drop a chunk as well.
> > 
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../xorg-xserver/xserver-xorg.inc             |  7 +--
> >  ...-duplicate-definitions-of-IOPortBase.patch | 24 ++-------
> >  ...probing-a-non-PCI-platform-device-on.patch | 34 -------------
> >  ...t-xtest-Initialize-array-with-braces.patch | 36 -------------
> >  .../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 -------------
> >  .../xserver-xorg/sdksyms-no-build-path.patch  | 50 -------------------
> >  ...xorg_1.20.13.bb => xserver-xorg_21.1.1.bb} |  6 +--
> >  7 files changed, 7 insertions(+), 184 deletions(-)
> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
> >  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb => xserver-xorg_21.1.1.bb} (77%)
> > 
> 
> I think there is some dependency issue:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/4349
> 
> but I'm wondering why this only showed up on this rebuild and not previously
> too...

Sorry, it did and the buildbot UI let me miss it, it also failed here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/4344

Cheers,

Richard



