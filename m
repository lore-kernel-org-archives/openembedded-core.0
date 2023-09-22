Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEECCD4F46
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 09:50:19 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.18083.1695376217923602061
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 02:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fR7U4PDC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6442C0019;
	Fri, 22 Sep 2023 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695376216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yI9R4/N3slb5oJu6//gDT50k6tUC2Q4eGGMGDMMH8VQ=;
	b=fR7U4PDCBowFIEjzEVFYVRgZdCfROypai4yL85K9gL4b9/0NlQtAF97BUr+pF3kgXIiZc3
	mwaI5MrnsEU9WYFAibtz1QF5G/0nS4Na9T/S6qwhj3QHt/HJ9zvJJrie88T12gPB7ZmQ8i
	wmpiZGSjSe4StSGoVgTo56DXe/hYMVt8p20smOPFw7j16yxTdaGF6sa/tM+49XH5tHolxb
	ttIch51rPcua8/ZB96bkR8CrUkELSjMQTlwb2OqQP3KykATjAl1VMGihklfXDQRxyueM5l
	O1gIPrWh0dugJ1Dk964DpLfnfSFPOzp4Q2iJdWjsrlp7xoX1jYX4AFhkunpIEQ==
Date: Fri, 22 Sep 2023 11:50:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4 0/5] Add bblock helper scripts
Message-ID: <20230922095015a112732f@mail.local>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
 <20230810132113aee9ceff@mail.local>
 <20230811080027d7b75a14@mail.local>
 <202308110845568593abfe@mail.local>
 <CAEHHSvaS6cuNeu3gidGmOnnRiDkOY-ST7M1+NS6BNk4S1Y0BJw@mail.gmail.com>
 <202309211311328bf3a025@mail.local>
 <CAEHHSvZ1aiq0hMV18xSmtib-pQaQ2o0ETDGkMGJbjwz9RHTb9Q@mail.gmail.com>
 <2023092121584606cdad6d@mail.local>
 <CAEHHSvbv5zE5E-s9sMxmRkd3KMdK-r=D76ym_hYM-OpH1DnpkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEHHSvbv5zE5E-s9sMxmRkd3KMdK-r=D76ym_hYM-OpH1DnpkA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 09:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188091

This is started:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5792

On 22/09/2023 10:54:56+0200, Julien Stephan wrote:
> > >
> > > So I can see two possible reasons for that:
> > > * MACHINE=qemuarm block quilt -t compile  is not using the machine I
> > > give on the command line, but why??
> >
> > As I said in the call, look at this log from the build:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5785/steps/13/logs/stdio
> >
> > It tells you that MACHINE = "qemux86-64" ends up in auto.conf which is
> > then used by the build so overriding it from the command line doesn't
> > work.
> >
> 
> Hi Alexandre,
> 
> Thank you, I managed to reproduce it locally and fixed it properly. I
> just force pushed my poky-contrib branch
> (https://git.yoctoproject.org/poky-contrib/log/?h=jstephan/bblock) can
> you start a build? If successful, I'll send the v5 today.
> 
> Cheers
> Julien

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

