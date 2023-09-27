Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCB8E7F14F
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 13:04:42 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.16940.1695819876577610474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 06:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Twziuhpx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89FE1E0010;
	Wed, 27 Sep 2023 13:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695819874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YPuNv345ou7opjKa2qBk8WXB+KTt8+AWyju0Dw9RAb0=;
	b=TwziuhpxwRko+FhWnApOhmnrCiyOdzQ/10ycXssmEbrJi3JkkuM/0YhPNa3WwOyh8KZtbB
	zhaqem95YoI15SvqgCrt2fG9iXJaNvp0iWpkV1ejbR+X+IymyglX/izTFtXoLvZQrhx6Ml
	e6HyWjbchvmiiGyv7Kt2ZaBPwZDKraD98726SsYPb+gD1P3fQMTWKi+WcPgozccXLzCb8j
	Lz514ITBbPIXqyg7Iowuma0S/pzC3HDC5GSwbe97vjbSxzNPy7f63wogGLSi6K8Lpwyt4W
	snmBUpR8eRE/Z7kQZAfG5Q/4UUPIc3e5prWG6Ol3Wx9IzBYNTknHQ2llkS2uUw==
Date: Wed, 27 Sep 2023 15:04:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
Message-ID: <202309271304337b1a977e@mail.local>
References: <20230925080452.803540-1-jstephan@baylibre.com>
 <20230927101614dd0d974d@mail.local>
 <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
 <CANNYZj89k7MbA0zBKb3s6LF0Lz65Yv-q9Qp5igimgSqeiWu6+Q@mail.gmail.com>
 <CAEHHSvZkyZaRXSzhV8X=-xH8UY9TnaBxQjGQmLivxAx+wmNuVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvZkyZaRXSzhV8X=-xH8UY9TnaBxQjGQmLivxAx+wmNuVw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 13:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188318

On 27/09/2023 15:02:00+0200, Julien Stephan wrote:
> Le mer. 27 sept. 2023 � 14:59, Alexander Kanavin
> <alex.kanavin@gmail.com> a �crit :
> >
> > You need to scroll up. The failure is in lines 557 to 609.
> 
> Hmm stange ctrl-f didn't work. I can see it now. Thank you, I'll look at it
> 

By default the log is not fully downloaded, you have to click on the
looking glass before ctrl-f.

> Julien
> >
> > Alex
> >
> >
> > On Wed, 27 Sept 2023 at 14:48, Julien Stephan <jstephan@baylibre.com> wrote:
> > >
> > > Le mer. 27 sept. 2023 � 12:16, Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> a �crit :
> > > >
> > > > Hello,
> > > >
> > > > I had a build were all the tests passed, then I had this failure:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5812/steps/14/logs/stdio
> > > >
> > >
> > > Hi Alexandre,
> > > I only see
> > >
> > >    bblock.BBLock.test_lock_single_recipe_all_tasks: FAILED
> > >
> > > but I can't see the actual error :( Is it possible to have it somewhere?
> > >
> > > Cheers
> > > Julien
> > >
> > > >
> > > >
> > > > --
> > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#188313): https://lists.openembedded.org/g/openembedded-core/message/188313
> > > Mute This Topic: https://lists.openembedded.org/mt/101570279/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

