Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q8knO-0004FI-4s
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 04:54:38 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJE006ERYJB22A0@vms173007.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sat, 09 Apr 2011 20:52:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9394914AF5B; Sat,
	09 Apr 2011 21:52:23 -0400 (EDT)
Date: Sat, 09 Apr 2011 21:52:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20110410015223.GA672@denix.org>
References: <cover.1301923706.git.josh@linux.intel.com>
	<52BC8856-1494-4AC6-B04F-0A9DC5A8AB2B@dominion.thruhere.net>
	<1302088073.2355.3.camel@scimitar>
MIME-version: 1.0
In-reply-to: <1302088073.2355.3.camel@scimitar>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 0/1] Clutter-1.6 fix
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
X-List-Received-Date: Sun, 10 Apr 2011 02:54:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 06, 2011 at 12:07:52PM +0100, Joshua Lock wrote:
> On Mon, 2011-04-04 at 15:39 +0200, Koen Kooi wrote:
> > Op 4 apr 2011, om 15:31 heeft Joshua Lock het volgende geschreven:
> > 
> > > From: Joshua Lock <josh@linux.intel.com>
> > > 
> > > I found a couple of issues with the Clutter 1.6 recipes I submitted recently
> > > which I've addressed in the attached patch.
> > > 
> > > As an aside I've noticed that we have a COMPATIBLE_MACHINE line in
> > > clutter.inc, I think we're going to need to find a more suitable mechanism
> > > for specifying compatible machines for this recipe set going forwards.
> > > 
> > > Any ideas? Perhaps some MACHINE_FEATURE which must exist for Clutter (and
> > > other GL dependent recipes) to build?
> > 
> > What we did in OE .dev was:
> > 
> > 1) introduce SOC_FAMILY to group, well, SOC families (e.g. OMAP3)
> > 2) Extend base.bbclass to allow COMPATIBLE_MACHINE = $SOC_FAMILY.
> > 3) Add COMPATIBLE_MACHINE = omap3 to the GLES recipes
> > 4) DEPENDS_omap3 = libgles-omap3 in clutter.inc
> > 
> > So for machines in the omap3 class it will build libgles-omap3 and not
> > for others. So the compatibility is defined at the GL level instead of
> > the clutter level.
> 
> Thanks for sharing Koen. This sounds like a reasonable approach. I'd be
> curious to hear if there are any objections before I try and work up a
> patch series.

FWIW, it would be very nice to bring SOC_FAMILY feature from OE to oe-core, as 
it's being heavily used in many TI recipes, not just omap3...

-- 
Denys


