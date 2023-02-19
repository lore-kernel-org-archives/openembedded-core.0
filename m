Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831F7C61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 15:15:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.34206.1676819711526353825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 07:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UTfnP15d;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 057EB20009;
	Sun, 19 Feb 2023 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676819709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=92m6nmn6EwnkPXgGJVxdAtwSuJhuxObP8aGywrINbS8=;
	b=UTfnP15d+hqqcBcjLQeF0mLRjcX/KcEiVuW9t7B1O1Zbo+2iueSIJLu9VVkJODd7AYYrtc
	KhQ3YNTpNGLi5pp4Nw61M0g1fPtS4FBCk/rH8VZK2ClJORm5KX9eSyFbOvQRCQ1M7YTAPx
	IbztkIh7VJqUsFMbXAzdh3/KmmsLQ0mGb8EU74dtcVoTLhmqzXTlwTn2D45pQ2XTpj2e7Q
	VqgHrN8rdhbAPmxLVSt0yBdSeE24n3nn/59qbrf3mPOKn0ONH8wNrO0TCZnU5CZ5JmLlRJ
	uA4e21oHdaT14ULK2Bguhih29pXyZGAC2yioo0tfpn8YpkPWZ4ycvrVmuNRM+A==
Date: Sun, 19 Feb 2023 16:15:07 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, mv <sdoshi@mvista.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [[kirkstone][PATCH] openssl : Upgrade OpenSSL 3.0.7 ->
 3.0.8] openssl: Upgrade 3.0.7 -> 3.0.8
Message-ID: <Y/I8+y9BjKCcRl3x@mail.local>
References: <20230209080022.147333-1-sdoshi@mvista.com>
 <CA+chaQfPjoRQfsYrnqDwMq6OiE5JtR0mFMXQsrHOOuA-0CSgyA@mail.gmail.com>
 <CAOSpxdbUkXEn0uEfzN21jncJ_n8Ur66uskWZ4b7KGKN+1w3_MQ@mail.gmail.com>
 <CA+chaQeL3aRd4tB7t5Eh4rQ-Nxe8QwO+OM8kO1h4t-XYVweP2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+chaQeL3aRd4tB7t5Eh4rQ-Nxe8QwO+OM8kO1h4t-XYVweP2w@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 15:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177334

On 19/02/2023 16:05:11+0100, Martin Jansa wrote:
> On Sun, Feb 19, 2023 at 3:13 PM Steve Sakoman <steve@sakoman.com> wrote:
> 
> > On Sun, Feb 19, 2023 at 2:36 AM Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> > >
> > > Hello Steve, Siddharth,
> > >
> > > are you waiting for PATCHv3 with commit summary update requested in
> > corresponding langdale review:
> > >
> > https://patchwork.yoctoproject.org/project/oe-core/patch/20230209143708.20705-1-sdoshi@mvista.com/
> > ?
> > >
> > > or is something else blocking this upgrade?
> > >
> > > I'm a bit surprised that this high security issue wasn't yet merged even
> > in oe-core/master-next and I don't see it in
> > oe-core-contrib/stable/kirkstone-nut nor
> > oe-core-contrib/stable/langdale-nut.
> >
> > If a patch is intended for multiple branches I typically wait until
> > master has merged the patch before taking it into the other branches.
> >
> > So that is why it isn't yet in langdale/kirkstone.
> >
> 
> Thanks Steve!
> 
> So I guess it's now question for Alexandre or RP as it isn't in:
> https://git.openembedded.org/openembedded-core-contrib/log/?h=abelloni/master-next
> https://git.openembedded.org/openembedded-core/log/?h=master-next

Changes were requested on all the versions of the patches that were sent
so I guess we are waiting for v3


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

