Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Smmga-0005ZT-Vq
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:05:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Jul 2012 06:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119140418"
Received: from unknown (HELO [10.255.13.33]) ([10.255.13.33])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jul 2012 06:54:31 -0700
Message-ID: <1341496467.6761.25.camel@trz-ThinkPad-T420>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jul 2012 08:54:27 -0500
In-Reply-To: <1341495730.19821.14.camel@ted>
References: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
	<0856ecabc55e047a8d4aeb67bf213a8d11cf385a.1341338051.git.tom.zanussi@intel.com>
	<1341410543.3906.29.camel@ted>
	<1341429396.6761.18.camel@trz-ThinkPad-T420>
	<1341495730.19821.14.camel@ted>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Subject: Re: [PATCH 7/9] perf: add perf-scripting MACHINE_FEATURE
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
X-List-Received-Date: Thu, 05 Jul 2012 14:05:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-05 at 14:42 +0100, Richard Purdie wrote:
> On Wed, 2012-07-04 at 14:16 -0500, Tom Zanussi wrote:
> > On Wed, 2012-07-04 at 15:02 +0100, Richard Purdie wrote:
> > > On Tue, 2012-07-03 at 13:10 -0500, tom.zanussi@intel.com wrote:
> > > > From: Tom Zanussi <tom.zanussi@intel.com>
> > > > 
> > > > Add a new MACHINE_FEATURE named 'perf-scripting'.  Adding this into
> > > > any machine configuration will enable perf scripting on the target,
> > > > which will turn on all the language bindings currently aavailable in
> > > > perf (Perl and Python), if perf is included in an image.
> > > > 
> > > > If 'perf-scripting' isn't named as a feature (the default), all perf
> > > > language bindings will be disabled and unavailable.
> > > > 
> > > > Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> > > > ---
> > > >  meta/recipes-kernel/perf/perf_3.4.bb |   11 ++++++++---
> > > >  1 files changed, 8 insertions(+), 3 deletions(-)
> > > 
> > > Does this make sense as a MACHINE specific feature? Wouldn't it make
> > > sense done on a per architecture basis for example?
> > > 
> > 
> > To me it made sense to do it as a machine-specific feature e.g. although
> > scripting would probably be something that all x86-64-based machines
> > could be assumed to easily handle and would therefore probably want, for
> > x86 it might not always be so clear.  For example, the crownbay and
> > cedartrail machines might have the horsepower for scripting to make
> > sense on the target, while the n450 or some similarly underpowered Atom
> > machines, maybe not.
> > 
> > So, making it a per-machine feature would allow for that kind of
> > flexibility...
> 
> What is the implication if the machine lacks horsepower though? Isn't
> this something you'd only hit when trying to use specific features?
> 

Nothing earth-shattering in that it won't break anything, it's just that
you're now dragging in the perl and python dependencies for no good
reason, since the scripting feature won't be too usable on the
underpowered machine.

> I'm just not feeling this is the best way to make this decision.
> 

Yeah, let me come up with something per architecture that also allows
individual machines to opt out...

Tom

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




