Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0682BC05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 16:41:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.15842.1675442474786350390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 08:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NanvRyI1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 78A441C0005;
	Fri,  3 Feb 2023 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675442472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7nn9LxBhQ0HWpaFCptjHRd/x5+8Cmh14MoxWQ3K944s=;
	b=NanvRyI1qMQCrGx+MhRpaNvDAVKAlKlbTEfobT6JoCIlOScCMhIghAMcTlQvJ4Ftc/Hcm+
	ZmYZ66HjBOzsEmf8NYk0xr24Tk5WBxZ2hwN/J2egj3Xs0ShpZibMfgJWEd7kc+taKn6/Qa
	8Pj+MQPea0SbGix7xOVAl8fpnj04wp6gFtQV7EyH7mr1fw+wfsQX4u1kR0MajersAfK3aM
	MdwCVbkQrvPnnTYj+gpX9QxUV0ZOKqkTgMpoW5Am2wbmNTSfUrU7RTgMGHqOC2xvpucN1y
	qF86pV5fRZTlXIY0fInT6Ui0VvrYqiJ4+bp9wqeI/m24NBFrh+/o+a/t80hq0g==
Date: Fri, 3 Feb 2023 17:41:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] meta: remove True option to getVar and
 getVarFlag calls (again)
Message-ID: <Y905KBFZRnbl9J3y@mail.local>
References: <20230201155038.539949-1-Martin.Jansa@gmail.com>
 <Y9002wNuWoRMTyCs@mail.local>
 <ea794fe14ee22b5c7163bd14b63b9b6f2942c5bb.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea794fe14ee22b5c7163bd14b63b9b6f2942c5bb.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 16:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176731

On 03/02/2023 16:32:08+0000, Richard Purdie wrote:
> On Fri, 2023-02-03 at 17:22 +0100, Alexandre Belloni via
> lists.openembedded.org wrote:
> > I'm not sure what you based the patch on, it didn't apply for me.
> 
> I did already take most of this one except the bits to report-
> error.bbclass which Martin said were a process error on irc and can be
> ignored.
> 

Ok, thanks, I didn't check!

> Cheers,
> 
> Richard

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

