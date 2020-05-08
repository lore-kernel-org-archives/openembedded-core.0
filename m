Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.11137.1588946674488181548
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 07:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 1AE0E2E892B;
	Fri,  8 May 2020 09:04:32 -0500 (CDT)
Date: Fri, 8 May 2020 09:04:30 -0500
From: "Seebs" <seebs@seebs.net>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_ipc.h: Fix enum typedef
Message-ID: <20200508090430.686c8f88@seebsdell>
In-Reply-To: <b554cabf-b8dd-5cf2-40ca-9aa5ffc53834@gmail.com>
References: <20200503042712.1878496-1-jacob.kroon@gmail.com>
	<20200503002852.1273f3a1@seebsdell>
	<e8a9982b-1412-087f-b8ac-283b657106aa@gmail.com>
	<20200503112621.32e1e1ed@seebsdell>
	<b554cabf-b8dd-5cf2-40ca-9aa5ffc53834@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 8 May 2020 08:09:58 +0200
Jacob Kroon <jacob.kroon@gmail.com> wrote:

> Hi Peter,
> 
> On 5/3/20 6:26 PM, Seebs wrote:
> > On Sun, 3 May 2020 17:49:09 +0200
> > "Jacob Kroon" <jacob.kroon@gmail.com> wrote:
> > 
> >> The type has never been used, so an alternative fix would be to get
> >> rid of it altogether, and just keep the enum identifiers.
> > 
> > I think I anticipated the type being used for something but it did
> > indeed not happen. It could also just be changed to 'enum [type]
> > { ... }', I guess.
> > 
> > But I think your fix is the simplest and closest to what I probably
> > thought I was doing at the time.
> > 
> 
> Do you have any plans on merging this, and also the pending patches
> in oe-core, anytime soon ? Then we could bump the pseudo git rev in
> oe-core and remove those patches, if not then I can add the patch to
> the pseudo recipe. Any way you'd prefer ?

It probably makes sense to add things to the pseudo recipe for now, I'm
still trying to catch up on my task backlog from March.

-s
