Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QOw1R-0006VW-4u
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 20:08:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2011 11:04:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,262,1304319600"; 
   d="scan'208";a="793486"
Received: from unknown (HELO [10.255.12.149]) ([10.255.12.149])
	by azsmga001.ch.intel.com with ESMTP; 24 May 2011 11:04:58 -0700
Message-ID: <4DDBF34B.1030403@linux.intel.com>
Date: Tue, 24 May 2011 11:04:59 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DDBDE9D.5000709@linux.intel.com>
	<CA4E693D-F5FC-4344-9CDD-E208C08DA62E@dominion.thruhere.net>
In-Reply-To: <CA4E693D-F5FC-4344-9CDD-E208C08DA62E@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Tue, 24 May 2011 18:08:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/24/2011 10:13 AM, Koen Kooi wrote:
> 
> Op 24 mei 2011, om 18:36 heeft Darren Hart het volgende geschreven:
> 
>> I've started pulling in the 15 or so patches to u-boot from
>> meta-ti. In doing so I've come across some questions I'd like you
>> thoughts on. Specifically, where to put these changes. Some points
>> of context:
>> 
>> 1) oe-core is intended to support emulated machines only 2) oe-core
>> has a "virgin" u-boot recipe (no patches) 3) meta-yocto does not
>> have a u-boot recipe (no bbappend either) 4) meta-ti has it's own
>> u-boot recipe with per-machine patches
>> 
>> A stated goal was to bring the Yocto Project's u-boot support for
>> the Beagleboard in line with that in meta-ti. There are several
>> ways I can go about this.
>> 
>> a) create a bbappend in meta-yocto and duplicate the meta-ti 
>> modifications in bbappend form. b) Modify the oe-core recipe
>> directly
> 
> You're forgetting:
> 
> c) Have yocto use meta-ti for beagleboard.

Per our discussion at ELC, according to the notes I took anyway, we
agreed that in order for meta-yocto to support the Beagleboard we would
have a two stage effort.

The first would be to update the meta-yocto uboot and kernel recipes
(and this meant the linux-yocto*.git kernel repositories and meta data)
with the meta-ti recipes. This is the aspect I'm working on now.

Second would be to work with meta-ti through the layer tooling which is
being actively discussed on the lists.


> TI is actively participating in yocto and it's getting way too weird
> that you yocto guys keep refusing to use the meta-ti layer. I've
> heard the arguments why you refuse it, but at this point this is
> becoming a farce.


Your approach here is not conducive to arriving at a mutually acceptable
solution, neither is it in keeping with the plan laid out at ELC with
your input.


>> 
>> While a) is the most direct approach to accomplish our goal, it
>> requires continual maintenance and duplicates effort. I don't care
>> for this approach. b) has the potential to consolidate all
>> beagleboard u-boot recipe work into a single place. It could
>> simplify the meta-ti and eliminate the need for a bbappend in the
>> meta-yocto layer.
>> 
>> The question of whether bootloaders have a place in oe-core should 
>> probably be addressed. While they aren't needed for the emulated 
>> machines, they are a highly reusable component for real systems,
>> and that seems justify keeping them in oe-core. Does anyone
>> disagree with this assessment?
>> 
>> I propose pulling the necessary changes to u-boot from meta-ti
>> into oe-core.
> 
> I most strongly object to that.


You object to moving the changes into oe-core? Or you object to any
changes to a u-boot recipe that don't involve simply referencing
meta-ti? If the latter, we need to revisit our previously agreed upon
course of action because we seem to have different views of what that is.


> But given that you are still refusing
> to use meta-ti, I suspect it doesn't matter what I say as the
> maintainer for beagleboard. 


I asked for your opinion by Cc'ing you Koen.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


