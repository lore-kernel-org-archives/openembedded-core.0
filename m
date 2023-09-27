Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50231E7F12B
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 12:58:32 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.16358.1695819509271725488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 05:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BPriHvdc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 188F2FF805;
	Wed, 27 Sep 2023 12:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695819507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZG6d8AiPCIKanKwsxcD2/ldJAV0DjAsWT6R7d5EeKXk=;
	b=BPriHvdcxNG3vGBKDEu2Tn2vdivbi5rklKwC6g02nT2pqBpoRS74/k9JqN+tnumgR9HUO7
	waTTha4t9rkWXeeHdwEXDaT/OH1YhjB7fAQ8Bq+S0dGaW9aIX3Q5rJvxixLUKd4eyPbhKc
	eJ3QEfRR0nLu8Zojd4Gk2aW6N3tjy0o5lU3Lm31RT5mzaF8EcEWs4tM8A0In06Kr6mMzFQ
	J2nX5MPjnglAtAaPJgBC4At08g52BnQbfeX24nZDP09fFDP9+Cj51XD7FXQ23+JaLN53eu
	bCE2rmtTjU69FYY2QV6TfiVq0IYpR4LUPlFRqj+y5X3QmmGLcltNKL6uOJuFpg==
Date: Wed, 27 Sep 2023 14:58:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
Message-ID: <2023092712582624483437@mail.local>
References: <20230925080452.803540-1-jstephan@baylibre.com>
 <20230927101614dd0d974d@mail.local>
 <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 12:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188315

On 27/09/2023 14:47:57+0200, Julien Stephan wrote:
> Le mer. 27 sept. 2023 � 12:16, Alexandre Belloni
> <alexandre.belloni@bootlin.com> a �crit :
> >
> > Hello,
> >
> > I had a build were all the tests passed, then I had this failure:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5812/steps/14/logs/stdio
> >
> 
> Hi Alexandre,
> I only see
> 
>    bblock.BBLock.test_lock_single_recipe_all_tasks: FAILED
> 
> but I can't see the actual error :( Is it possible to have it somewhere?
> 

You can scroll up or click on the looking glass on the top right.

Alternatively, you can download the log here:
https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/8276762/raw
(the button is also on the top right)


The assertion error is fairly large, that's why I didn't copy it.


> Cheers
> Julien
> 
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

