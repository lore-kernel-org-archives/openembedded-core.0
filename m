Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFABC38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 08:58:28 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.10774.1674550703490243017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 00:58:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ctPju+7Y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2852DC0005;
	Tue, 24 Jan 2023 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674550701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rIhI+l4e6FkFTW6783/LnyoNllQs8HRt2AILO52nG0=;
	b=ctPju+7YER6Ba92H6VdzcShJ3vykOFpATazyya/tQRm/V9EjfmnhAQV5a1JfUnzjZi8djs
	vZRFeJutSA6sqPwd+SOolqKcXpQhyeLnjoE1Qw6by9C6/sim77tmcQCvlWzVwUrtP4FY12
	2nbdGBOe2BhPcnAHESgKDTQEeLClgAHgsyOxxSOsFjlGQDqlBeuvL5+2nOfkjFcl15xZOm
	vh0C8ZBgMX9STHDBvKd+cDishS7szycrkiZEkx26uxGTObtoex2oJKNKnIMmzBURvqtDvt
	BHiFDCF0ZJXmGTpZz0kS8g0J5BU1d6FDc+OkYw9nRP6Edfn4eeL9HZoO1CysAA==
Date: Tue, 24 Jan 2023 09:58:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 1/3] binutils: Upgrade to 2.40 release
Message-ID: <Y8+drDtXX6bdBdFm@mail.local>
References: <20230119235141.1603399-1-raj.khem@gmail.com>
 <20230120124754.14c0e5d3@booty>
 <CAMKF1soVuu3kOksuFZEzQKW2BsSqrZ9FSOF3Yg=oJvNfPCf_Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMKF1soVuu3kOksuFZEzQKW2BsSqrZ9FSOF3Yg=oJvNfPCf_Kw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 08:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176326

Hello,

I guess this is the cause of this ptest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/4587/steps/12/logs/stdio

AssertionError: Failed ptests:
{'elfutils': ['run-native-test.sh']}


/usr/lib/elfutils/ptest/tests/funcretval: dwfl_module_return_value_location: cannot handle DWARF type description
FAIL: run-native-test.sh


On 20/01/2023 10:11:12-0800, Khem Raj wrote:
> On Fri, Jan 20, 2023 at 3:47 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> >
> > Hi Khem,
> >
> > On Thu, 19 Jan 2023 15:51:39 -0800
> > "Khem Raj" <raj.khem@gmail.com> wrote:
> >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > I'm afraid this time the patch does _really_ not apply, and the simple
> > sorcery I did for v1 and v2 is not working anymore. If you could
> > recreate the patches based on a clean oe-core master branch that would
> > be good.
> 
> I have pushed the related patchset to a branch on poky-contrib here
> 
> https://git.yoctoproject.org/poky-contrib/log/?h=kraj/binutils-2.40
> 
> Let me know how it goes.
> 
> >
> > Thank you!
> >
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176225): https://lists.openembedded.org/g/openembedded-core/message/176225
> Mute This Topic: https://lists.openembedded.org/mt/96390083/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

