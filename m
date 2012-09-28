Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1THYXm-0006hi-MM
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 13:15:42 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1THYLL-0000gW-40; Fri, 28 Sep 2012 13:02:51 +0200
From: Phil Blundell <philb@gnu.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 28 Sep 2012 12:02:50 +0100
In-Reply-To: <5064A1DB.40506@windriver.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
	<5ac0bc525f5ac3f07c5749efc31e91c3fe6145c1.1348330479.git.Martin.Jansa@gmail.com>
	<1348335944.10108.211.camel@ted> <20120927083701.GC3454@jama.jama.net>
	<5064A1DB.40506@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348830171.32611.47.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/5] tune-xscale, tune-arm926ejs: add OPTDEFAULTTUNE variable and use more generic DEFAULTTUNE as default
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
X-List-Received-Date: Fri, 28 Sep 2012 11:15:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-27 at 13:58 -0500, Mark Hatle wrote:
> I've been an advocate for a while that the processor optimization (CCARGS) does 
> make it into the PKGARCH.  ARMPKGSFX_CPU seems like a reasonable approach to do 
> this.  It allows each tune to set something to tell people what that binary is 
> really built for, and for the 'base' tunes (i.e. armv5) it can be left off.

I think we've discussed this before but, just to reiterate, this sort of
thing is a matter of DISTRO policy.  It is perfectly legitimate to want
to build binaries with, say, -march=armv5te -mtune=arm926ej-s and have
them end up with PACKAGE_ARCH="armv5te" or even just "arm".

It seems to me that we are in danger of adding a lot of complicated and
hard-to-understand machinery to oe-core in an attempt to solve a problem
that ought to be getting solved by the DISTRO, and that by doing so we
might be making life harder rather than easier for DISTROs which happen
to want a slightly different labelling model to the default.

p.




