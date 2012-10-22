Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TQIbA-0004bS-J5
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 16:03:23 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TQIOA-0000kp-2F; Mon, 22 Oct 2012 15:49:54 +0200
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 22 Oct 2012 14:49:51 +0100
In-Reply-To: <1350913259.2520.90.camel@ted>
References: <50854312.5040502@dresearch-fe.de> <1350913259.2520.90.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1350913794.3259.299.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Profiling binaries?
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
X-List-Received-Date: Mon, 22 Oct 2012 14:03:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-22 at 14:40 +0100, Richard Purdie wrote:
> On Mon, 2012-10-22 at 14:58 +0200, Steffen Sledz wrote:
> > Just a short question: Does oe[-core] provide a generic method to
> > create packages containing binaries/libraries with profiling support?
> 
> Have a look at the section "Optimization flags" in bitbake.conf. You
> should be able to add the -pg flag to
> FULL_OPTIMIZATION/DEBUG_OPTIMIZATION and get what you're looking for.

I think you need a bit of special handling around eglibc as well.  But
otherwise yes, I've done basically this in the past and it seems to work
fine.

p.




