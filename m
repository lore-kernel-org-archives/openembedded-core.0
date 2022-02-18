Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2BCC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 14:30:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.11452.1645194641790166293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 06:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GoGU0CxH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 66D801BF203;
	Fri, 18 Feb 2022 14:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1645194639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G05uYiDovgvcyEc2bKlgSmHja3/2kjg2wkoGTT2/sbQ=;
	b=GoGU0CxH+LXLXjSmgg6BJ4ovGP+mJdgyWasVeEL457CkNoREdaWL3vRH5igEksTCM61+uL
	ygAaWUmNT2bidKD1cv80geNE+5nMHJbVBMrmRleJ4+VSOW/5YJhG56uti/U7ak1fRndtNe
	q/nFmJiLcKQK4FHv3GR1poTceyNoEQm1DWOjPDLio2PXcWdPsyz16RkGEUyNJsJ7WnnKQ1
	ZGzDF6tc26b1ELhI1YEHakJc1t/ca8WSmXVRPnJl6tQmPukkicKLGtqrvmfau5dqIKs9aZ
	B3Eu1tlZJtEzppLaL9H4JqsbZ33z0in8cdWAooEI0lyvGhbtDv1foxpzkoeFWw==
Date: Fri, 18 Feb 2022 15:30:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>,
	"Elberger, Richard" <elberger@amazon.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Scott Murray <scott.murray@konsulko.com>,
	Alejandro Hernandez Samaniego <alejandro@enedino.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [Openembedded-architecture] Kirkstone Layer
 Compatibility
Message-ID: <Yg+tjtp5IPpmUe0T@piout.net>
References: 
 <CAHMutra5px9Egp6VXpBqyrxYCSCfX-437so6D+HSXZUPBc62sg@mail.gmail.com>
 <CA+chaQfB9J1FQCWjWW4+x1m-PKUL9kZDO3uSPfGpcjFd8UJ35w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CA+chaQfB9J1FQCWjWW4+x1m-PKUL9kZDO3uSPfGpcjFd8UJ35w@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 14:30:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161942

Hello,

+layer maintainers to ensure they see that.

On 18/02/2022 12:37:04+0100, Martin Jansa wrote:
> The [3] should be
> https://git.openembedded.org/openembedded-core/commit/?id=311e61ae14b7216f5b98f1afe0e791644a07c9d0
> that's where LAYERSERIES_CORENAMES was changed to kirkstone (it's not due
> to LAYERSERIES_COMPAT changes, these changes are what people need to update
> in their layer).
> 
> On Fri, Feb 18, 2022 at 7:57 AM Alejandro Hernandez Samaniego <
> alejandro@enedino.org> wrote:
> 
> > Hello everyone,
> >
> > There have been a number of failures in the autobuilder today [1] [2] due
> > to the change currently sitting in master-next that switches
> > LAYERSERIES_COMPAT from honister to kirkstone[3].
> >
> > Since the change will soon be merged into master I thought it'd be a good
> > idea to send an email so layer maintainers become aware of the upcoming
> > issue and update their corresponding layers accordingly.
> >
> > Cheers,
> >
> > Alejandro
> >
> > [1] https://swatbot.yoctoproject.org/mainindex/swat/
> > [2] https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3243
> > [3]
> > https://git.yoctoproject.org/poky/commit/?h=master-next&id=7145b34de02fffa97bb1238f4777d817efcdc78f
> >
> >
> >
> > 
> >
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161936): https://lists.openembedded.org/g/openembedded-core/message/161936
> Mute This Topic: https://lists.openembedded.org/mt/89230590/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

