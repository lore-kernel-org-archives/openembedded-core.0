Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TCD01-0002e1-UX
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 19:14:46 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TCCnu-0000lx-DZ
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 19:02:14 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 18:02:13 +0100
In-Reply-To: <50520E2E.1040804@windriver.com>
References: <20120911130155.GC14077@jama.jama.net>
	<1347460383.11710.34.camel@ted> <20120913062017.GA11252@jama.jama.net>
	<1347532926.11710.66.camel@ted> <50520E2E.1040804@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1347555734.1786.19.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Thu, 13 Sep 2012 17:14:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-13 at 11:47 -0500, Mark Hatle wrote:
> ARM seems to be the one exception, where you have three levels.. ABI 
> (EABI/hf-EABI), processor family (armv4, armv5, armv7, cortext....), and then 
> CPU optimization.  This seems to cause additional confusion, as the CPU 
> optimizations are not being captured in the current package ARCH, which makes it 
> difficult to optimize on a feed.

I guess that by "processor family" you mean ISA.  (I'm not aware of an
ARM ISA variant named "cortext", though I haven't really been keeping up
with the latest developments there so I could imagine that one might
exist.)

Anyway, the basic three-way scenario (ISA, ABI, optimisation) that you
describe above isn't in any sense unique to ARM; the concept of
per-cpu-model optimisation/tuning applies equally to other architectures
(x86 for example) as well.  It's probably less of an issue for MIPS but
I suspect that's more a reflection of gcc's weaker optimisation
capabilities on that architecture rather than a homogeous CPU
population.  I don't know PowerPC well enough to make any comment about
that.

There's no particular reason that the per-cpu tuning couldn't be
captured in PACKAGE_ARCH if one wanted to do it.  But the decision about
how to structure a binary feed is clearly one for the DISTRO and the
question of how to map that into PACKAGE_ARCH is, equally clearly, one
that the distro ought to be solving.  Since oe-core itself doesn't build
any feeds, I don't think there's any reason for it to make heroic
efforts to sort out the package architectures that would go into them.

p.




