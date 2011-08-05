Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QpFGn-0005n9-3X
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 09:56:37 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QpFCV-0005Dd-4O
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 09:52:13 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F4BE@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<e4f4b9c5a4b28f252e30c4b92cdfc3c624bc22e5.1312469790.git.nitin.a.kamble@intel.com>
	<1312494624.3169.1.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4BE@orsmsx504.amr.corp.intel.com>
Date: Fri, 05 Aug 2011 08:52:05 +0100
Message-ID: <1312530725.3169.13.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 06/10] kernel, module-base.bbclass: fix KERNEL_LD & KERNEL_AR vars
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
X-List-Received-Date: Fri, 05 Aug 2011 07:56:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 15:03 -0700, Kamble, Nitin A wrote:
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Phil Blundell
> > Sent: Thursday, August 04, 2011 2:50 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 06/10] kernel, module-base.bbclass: fix
> > KERNEL_LD & KERNEL_AR vars
> > 
> > On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >
> > > KERNEL_LD was using ${LD} in it's definition, which is not correct
> > for
> > > different ABIs such as x32 or i386 on x86_64 machine.
> > >
> > > Same with KERNEL_AR var.
> > 
> > Why is ar an issue?  That doesn't have any unusual args, does it?
> > 
> > p.
> 
> No special args for ar, but The change makes definition of KERNEL_AR consistent with other definitions like KERNEL_CC & KERNEL_LD.

Okay, fair enough.  Please say that in the checkin message, though.  The
existing text makes it sound as though KERNEL_AR was actually broken
before.

p.




