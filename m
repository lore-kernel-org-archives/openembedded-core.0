Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T1dWQ-00060g-QQ
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 15:20:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Aug 2012 06:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,773,1336374000"; d="scan'208";a="186715692"
Received: from unknown (HELO helios.localnet) ([10.252.121.76])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2012 06:08:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@gnu.org>
Date: Wed, 15 Aug 2012 14:08:32 +0100
Message-ID: <4456392.mCXMPqtakO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1345029924.23275.444.camel@phil-desktop>
References: <2404459.dJBf5OQotX@helios>
	<1345029924.23275.444.camel@phil-desktop>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: OE-Core task rework
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
X-List-Received-Date: Wed, 15 Aug 2012 13:20:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 August 2012 12:25:23 Phil Blundell wrote:
> On Wed, 2012-08-15 at 10:46 +0100, Paul Eggleton wrote:
> > 1) Do we rename "task" to something a little more understandable to the
> > uninitiated, such as "package group"? The word "task" is already used in a
> > much more natural sense within bitbake as a unit of work. Historically I
> > believe we picked up this term from Debian but I'm not aware of
> > significant use by other mainstream distributions.
> 
> Yeah, I think OE inherited it from Familiar, which in turn got it from
> Debian.  But the meaning of the term has drifted slightly through the
> generations and, as you say, it is no longer a very accurate reflection
> of what the packages in question are doing.
> 
> It's never been totally obvious to me that there is much need for
> tasks/package group recipes as such in oe-core itself; they're rather
> more of a DISTRO policy thing and their presence in the metadata does
> obviously have a cost in terms of parse time and memory usage.  It might
> perhaps be worth exploring what they're actually being used for in
> oe-core and whether those things could be better done in a different way
> that doesn't involve having a .bb file for them.

I would say without checking that these days that cost is negligible. Off the 
top of my head, the benefits we get from using recipes for tasks as opposed to 
variables or some similar construct:

 * The tasks can be used and referred to on the target if desired, not just 
when you compose the image (i.e. task packages are produced and thus the 
package manager knows about them).

 * It should be slightly easier to find where tasks are defined within the 
metadata. In practice that's not always the case with the way we have named 
some of the tasks, hopefully that can be improved.

 * Related to the above, they can be customised in a visible manner using 
bbappends in your own layer.

 * If you inherit from task.bbclass you automatically get -dev and -dbg 
complements for the tasks defined by the recipe, which can sometimes be useful.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


