Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC72C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 18:16:07 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web09.16552.1643220966713505542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 10:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YZIoWdLr;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id t7so631594qvj.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b2tJvgt6FIUk5y2ZjiRovi6dNk7ZFq/iWF261ZmoAhI=;
        b=YZIoWdLriEDFkb3qXX6ju/V73ku6tZ9AuUdOnQxX+OktxRfg92c7vkupuPIEbUFNmW
         Ek2s4VVhMgfvL5EYcFPvDMcbldzhup58LQ3UHrGz1gWMi5vl3IlDJOGbbG2r/6ssOocD
         U/h5mCy+k/UNAinThr1htWuueOr3yBPQhuhAt1exH6Kh9jpe8JOz1HqX1zY8gdguY0qI
         zVm+ZDKD5rmc+xwQUz1fyoi+AJqg4Ve2Xc1JYZs93Ln5z2avIlueTkOtj4ffcDXsoksJ
         aE7h6BSpgzM9maeQ+4jUdWYJgR4Ehpf/NuIRnIE5U2xs9XeD99RKiu7XZsrvS6cJtcz2
         cl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b2tJvgt6FIUk5y2ZjiRovi6dNk7ZFq/iWF261ZmoAhI=;
        b=XBNIZxNJtcQDHFGhDvQhileGKhzMsvv39rGXsB6O6gkMhaGy5GHc9YEADnXty72Mpq
         7ByE6G6GJQk1Xp7G8y7DO4KWCIrwV2E8X3iJJQw36Hdr+gA3C7uzDnBQoOADnnTi15t+
         TkBUc8L3olMCa6bHbBW9FHWkB7BhC0bPQmXI7n4aJ+jp0GaVVMzzde/KgtiaE9/kW0wC
         9FLmX5tpQQQXFnVYQJaUGWCi1G1PZvvgtZ+QMkiun/ef3dFiFzOtY8Tp+ovarN2C5sIv
         u68TEaws/p90VxfMI0nszX++3/qeIcS/bgqoBT39XtyuznUCL86axMVi9W9xrsiXp8MR
         D5wQ==
X-Gm-Message-State: AOAM531pL5h3mHTpjtiil8smUYfC1GmiBXp6IyoqXWvTewxco9hcR3tc
	vKdTsyAVcrAkqG+AjlaHTVFL7+xkj1GU2PIeUtc=
X-Google-Smtp-Source: 
 ABdhPJytkRSavTqWe1ihAkc/X6/rhwr6P1KSdfHN52JBPkETr4rYrSu1ZwnDwys+boSiK1USjzztbeXg27zEGIsFdJc=
X-Received: by 2002:a05:6214:27e8:: with SMTP id
 jt8mr162209qvb.110.1643220965737;
 Wed, 26 Jan 2022 10:16:05 -0800 (PST)
MIME-Version: 1.0
References: <20220123150358.1306062-1-festevam@gmail.com>
 <5813000.lOV4Wx5bFT@dhcp-192-168-0-28.wgnetz.xx>
 <CAOMZO5CGeRP5Kdv4LjUz5aBEK--da=OR03O6WLVEcRX9XpbA5Q@mail.gmail.com>
 <YfFSrTW5oTe+5zCe@piout.net>
In-Reply-To: <YfFSrTW5oTe+5zCe@piout.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Jan 2022 10:15:39 -0800
Message-ID: 
 <CAMKF1sqbjdYh5yzt5RyTvz7zKeUO_vTTY9f-L0WSZMzX-aFZzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH meta-oe] rtc-tool: Add a recipe
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Fabio Estevam <festevam@gmail.com>, Christian Eggers <ceggers@arri.de>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Heiko Schocher <hs@denx.de>,
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 18:16:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160991

please send it to oe-devel ml if you intend to propose it for meta-oe

On Wed, Jan 26, 2022 at 5:54 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Fabio,
>
> On 24/01/2022 16:18:34-0300, Fabio Estevam wrote:
> > Hi Christian,
> >
> > On Mon, Jan 24, 2022 at 6:57 AM Christian Eggers <ceggers@arri.de> wrote:
> > >
> > > Hi Fabio,
> > >
> > > from my experience, custom build systems (including "bare" Makefiles)
> > > are often hard to integrate/maintain for distributors.
> >
> > rtc-tools is a straightforward package and I have sent the Makefile
> > patch upstream.
> >
> > Not sure why it can be hard to integrate or maintain it.
> >
> > > What about using CMake instead?
> >
> > I can do that if needed, but it is up to the rtc-tools maintainer, Alexandre.
> >
> > Alexandre, any advice?
> >
>
> My plan is to probably go for the Makefile. I don't think it will cause
> any issue and this doesn't care about portability to other systems as
> the tool is Linux only.

thats fine, well written makefiles can do cross compilation just fine.
>
> I'm just checking with buildroot whether they prefer having all the
> binaries installed with a single target or if rtc-range has to be
> separated out.
>
> rtc-range is supposed to be a debugging tool. I'd also separate it in a
> different package.
>
> Note that there is a daemon that should be coming up (well when I will
> have time) with the goal of monitoring both battery status and clock
> drift.
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160987): https://lists.openembedded.org/g/openembedded-core/message/160987
> Mute This Topic: https://lists.openembedded.org/mt/88625470/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

