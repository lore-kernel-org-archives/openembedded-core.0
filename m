Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1THYF5-0006B7-J7
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 12:56:23 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1THY2e-0000gI-Jp; Fri, 28 Sep 2012 12:43:32 +0200
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 28 Sep 2012 11:43:31 +0100
In-Reply-To: <1348781754.15753.21.camel@ted>
References: <1348467993.4444.252.camel@x121e.pbcl.net>
	<1348476693.10108.221.camel@ted>
	<1348479655.31293.19.camel@phil-desktop>
	<1348480442.4486.3.camel@ted> <1348780727.4422.12.camel@x121e.pbcl.net>
	<1348781754.15753.21.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348829012.32611.41.camel@phil-desktop>
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Avoid staging the same binaries again and again
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 10:56:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-27 at 22:35 +0100, Richard Purdie wrote:
> The release is now at -rc2 and this patch hasn't reached the threshold
> of things I'm willing to take. I've tried to at least get some of the
> patches you're posted in but I wish we'd had them a couple of weeks
> ago :/.

Okay, fair enough.  There's no particular rush with any of that stuff
and it can perfectly well wait until your release is out of the way.  Do
you want me to resend those patches at some later date?

You might like to consider taking the eglibc patch from a few days ago
since it is arguably a regression that eglibc has a build dependency on
perl when it didn't use to.  But of course this may not matter for the
majority of yocto users so it might not be a problem in practice.

p.




