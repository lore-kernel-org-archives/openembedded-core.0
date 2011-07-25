Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlRUL-0003jJ-4y
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 22:10:53 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlRQJ-000115-36
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 22:06:43 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E2DA3CB.7070902@windriver.com>
References: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
	<bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<1311602099.30326.217.camel@phil-desktop>
	<4E2DA3CB.7070902@windriver.com>
Date: Mon, 25 Jul 2011 21:06:37 +0100
Message-ID: <1311624397.3098.13.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/5] multilib_header.bbclass: Add oe_multilib_header wrapper
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2011 20:10:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 12:11 -0500, Mark Hatle wrote:
> On 7/25/11 8:54 AM, Phil Blundell wrote:
> > On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
> >> +/*  Copyright (c) 2005-2011 Wind River Systems, Inc.
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU Lesser General Public License version 2.1 as
> >> + * published by the Free Software Foundation.
> 
> I believe we're flexibly with the license statement in the file.. (Just
> verifying it to make sure I am allowed to change it.)
> 
> I personally don't believe it's a big deal, but I understand the concern.  Is
> there a different wording/license statement that would make more sense?  My
> concern is that if we make the license dynamic it's a lot of pain for no real
> technical reason.

The metadata itself is MIT-licensed, and I believe the MIT license is
fairly uncontroversial/non-viral.  So that seems like the obvious choice
for the header as well (if we have to have it, though as I mentioned in
my mail in the other thread just now, maybe we'd be better off without
it).

> I'd like to see if we (WR) can just put a statement on it that it can be used
> for any purpose -- whatever the legalize is for that -- and if that would
> satisfy your concerns.  (BTW: Our goal of course is NOT to change the license of
> the produced binary in any way...)

Yes, I think that would be fine.  The GNU project has some boilerplate
text for disclaiming copyright and you might be able to just use that.

p.



