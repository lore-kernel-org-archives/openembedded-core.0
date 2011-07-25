Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlLga-0001bk-R6
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 15:59:08 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlLcZ-0000r3-1f
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 15:54:59 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 14:54:58 +0100
In-Reply-To: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
References: <cover.1311601422.git.richard.purdie@linuxfoundation.org>
	<bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311602099.30326.217.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 25 Jul 2011 13:59:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
> +/*  Copyright (c) 2005-2011 Wind River Systems, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License version 2.1 as
> + * published by the Free Software Foundation.

This is going to cause LGPL 2.1 content to appear in the output
packages.  For things like binutils this is probably not a big deal,
since they are GPL already, but for ncurses (previously MIT-licensed)
this is a potentially significant change.  In any case I think there
needs to be some way of making sure that the LICENSE is updated
appropriately when this file is included.

p.




