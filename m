Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpN9J-0005Br-6U for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:21:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GGxf1013745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:16:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13123-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:16:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GGsGE013739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:16:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F8A1@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<e4f4b9c5a4b28f252e30c4b92cdfc3c624bc22e5.1312469790.git.nitin.a.kamble@intel.com>
	<1312494624.3169.1.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4BE@orsmsx504.amr.corp.intel.com>
	<1312530725.3169.13.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F8A1@orsmsx504.amr.corp.intel.com>
Date: Fri, 05 Aug 2011 17:16:32 +0100
Message-ID: <1312560992.14274.130.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Fri, 05 Aug 2011 16:21:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 08:41 -0700, Kamble, Nitin A wrote:
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Phil Blundell
> > Sent: Friday, August 05, 2011 12:52 AM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 06/10] kernel, module-base.bbclass: fix
> > KERNEL_LD & KERNEL_AR vars
> > 
> > On Thu, 2011-08-04 at 15:03 -0700, Kamble, Nitin A wrote:
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core-bounces@lists.openembedded.org
> > > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of
> > > > Phil Blundell
> > > > Sent: Thursday, August 04, 2011 2:50 PM
> > > > To: Patches and discussions about the oe-core layer
> > > > Subject: Re: [OE-core] [PATCH 06/10] kernel, module-base.bbclass:
> > fix
> > > > KERNEL_LD & KERNEL_AR vars
> > > >
> > > > On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> > > > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > > >
> > > > > KERNEL_LD was using ${LD} in it's definition, which is not
> > correct
> > > > for
> > > > > different ABIs such as x32 or i386 on x86_64 machine.
> > > > >
> > > > > Same with KERNEL_AR var.
> > > >
> > > > Why is ar an issue?  That doesn't have any unusual args, does it?
> > > >
> > > > p.
> > >
> > > No special args for ar, but The change makes definition of KERNEL_AR
> > consistent with other definitions like KERNEL_CC & KERNEL_LD.
> > 
> > Okay, fair enough.  Please say that in the checkin message, though.
> > The
> > existing text makes it sound as though KERNEL_AR was actually broken
> > before.
>  
> Point noted, Changed the commit message.

I've merged this with an updated commit message.

Cheers,

Richard



