Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web08.96.1629818800334197482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 08:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=DlaXfNpa;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 40A2B3200B2E;
	Tue, 24 Aug 2021 11:26:36 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute5.internal (MEProxy); Tue, 24 Aug 2021 11:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm2; bh=tHEeYyHn6444j0t+0PPuJb7XuLfb3dC
	JmDB+Uxb0UwY=; b=DlaXfNpa0EcKDIJAg0JUvNooQJCSSQwRfuJxVVgdI4f0c4o
	2UliYn8XxIAgAAaihBPy+4E5cV9JZUewLm7JVps4MzZ+ld5EO12NTmYCcnyLwYoT
	8nbYsA+H/kprR1I8uhxwCf2qTYl97J+7D3Md9/+f+RVVqoLQtBI4Wa+nmgfKynWW
	pume5RbvF1TpuRqmf75UWrFiEZiQ4H0NCut9DJNz265+S7acb6ORyq2sFl/raMoY
	YNstlO+bHNdSceS9vzI4Ovd747bqq7P5gk9C3JwudptCOoc9wjGEDv8XJr6gzpMr
	3qQKJ/DyORA09lewzYRNGtKejCgInZvv40kQ2FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tHEeYy
	Hn6444j0t+0PPuJb7XuLfb3dCJmDB+Uxb0UwY=; b=dFRcZNhFcqQ+X6nXXbnELH
	Yluv/T8OULYNdbkib1s+k2RGbbFr3Bkq/bGzkzhJmlmNHPxmgOo1iuxA4HZpVngn
	7lU1DCwj0wRgGDCMmG6mAoobL1PbSGCd+PNUBVfc79DcRZf19gUEYRwGFKQeyhF2
	uB+qX3FUBovyVD07Lfto2xvqHLUovBKyt3lHD8if/p9GwpFTSOkg5EciBltd2SJ/
	p0SmPJoEd1+eo+2YkEu7RsLkiD3Wu9+IdVCHlVaW2Y/SDpS3AEIHRcBzgzAGqWHz
	kESjVeFDykUYJEXt1xyevt02uwNFQYqi96XdAnWmdP1jkJtXyIBWrZcV+z8FgS9A
	==
X-ME-Sender: <xms:qw8lYbCqv9mW96raUWqtCj_xrjxC2xU-fYykZ-eo4LxqV68WFtl7Ow>
    <xme:qw8lYRjpKyyjrj2-by6qKaFxE2F8Y3QtbRe0JM3pnFImxYegNg8LrQGl9k5zG-fpa
    PEDw2tHXvILZc9bv7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtjedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeekffdvhffggeevudfgffelleeglefhtdejuefhveetieehieel
    gfffveekfeegvdenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghi
    sehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:qw8lYWknnussrKk6AF3xu6MD5422YoJWivmi65nugDQE3-rH_liXag>
    <xmx:qw8lYdyJbhFG_E3gTZ8HFL9jxrUX91SvpXFL73lxkoB2Op4X7wiNMg>
    <xmx:qw8lYQQfANee6TKWpT1udOsrwyUxm0RFMAfcZQ9LBkROtuvHsaPung>
    <xmx:qw8lYbJ0ApOye29UmIE8eEfWkeNIZfZH09PawSuk8vnIFOpDnsytoQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5486C3C0F72; Tue, 24 Aug 2021 11:26:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <f0b5a5db-2648-43dc-97f2-ee41b6f730f2@www.fastmail.com>
In-Reply-To: 
 <d248b212e6724aac56ae6b1638e438f25d350486.camel@linuxfoundation.org>
References: <20210823135250.767173-1-andrei@gherzan.com>
 <CAOSpxdYA6FchYLNRASehUkPcQkdHkjRJyjE6VaX0z--y6m3BWg@mail.gmail.com>
 <d248b212e6724aac56ae6b1638e438f25d350486.camel@linuxfoundation.org>
Date: Tue, 24 Aug 2021 16:25:57 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 "Steve Sakoman" <steve@sakoman.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>,
 "Leif Middelschulte" <leif.middelschulte@klsmartin.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] bitbake: fetch2: fix handling of `\` in file:// SRC_URI
Content-Type: text/plain

On Tue, 24 Aug 2021, at 15:24, Richard Purdie wrote:
> On Tue, 2021-08-24 at 04:20 -1000, Steve Sakoman wrote:
> > On Mon, Aug 23, 2021 at 3:53 AM Andrei Gherzan <andrei@gherzan.com> wrote:
> > > 
> > > From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> > > 
> > > Using backslashes in file:// URIs was broken.
> > > Either the resolver would fail or the subsequent `cp` command.
> > > Try to avoid this by putting the filenames into quotes.
> > > 
> > > Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=8161
> > > 
> > > (Bitbake rev: aa857fa2e9cf3b0e43a9049b04ec4b0b3c779b11)
> > 
> > Patches for bitbake should be sent to: bitbake-devel@lists.openembedded.org
> > 
> > I tried applying this patch, but found that it caused errors on the autobuilder:
> > 
> > https://errors.yoctoproject.org/Errors/Build/129189/
> > 
> 
> We dropped wildcard support in master but that is still present in dunfell. That
> means we can't quote things as we are relying on expansion of the wildcards for
> some SRC_URIs. This could be difficult to fix with the compatibility constraints
> of an older release funfortunately :/.

Got it now. That's going to be painful indeed. I can't think of an easy way out of this either.

Andrei
