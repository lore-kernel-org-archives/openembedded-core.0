Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QrlIC-0000Zt-5C
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 08:32:28 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LPS006ABXY3GTW0@vms173001.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 01:27:45 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8FBD614AF5D; Fri,
	12 Aug 2011 02:27:39 -0400 (EDT)
Date: Fri, 12 Aug 2011 02:27:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20110812062739.GC13857@denix.org>
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Questions about the layer structure in	OpenEmbedded-Core
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
X-List-Received-Date: Fri, 12 Aug 2011 06:32:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Aug 12, 2011 at 08:17:52AM +0200, Samuel Stirtzel wrote:
> Hi,
> lately I looked a bit into the structure of OE-Core and found pages
> like: http://www.yoctoproject.org/projects/openembedded-core, and
> http://openembedded.org/index.php/LayerIndex
> 
> 1. question: Are these informations reliable (the layer index page
> seems outdated). From the information I found, this graphic was
> created as conclusion:
> http://imageshack.us/photo/my-images/155/openembeddedlayers.png/
> 
> 2.: Currently the "UI layer" seems to be contained in
> meta-openembedded, so is this _the_ layer for UI and windowmanager
> recipes or is this a subject to change?
> 
> 3.: The commercial layer is nowhere found, what are the plans for this
> layer, or was this just an idea?

Commercial layers are what envisioned to be provided by OSVs, such as Mentor, 
MontaVista, TimeSys etc...

> 4.: In which layer would distributions fit in the graphic?

In one of the earlier discussions it was said that distribution layer is 
rather vertical and can span across multiple other layers by modifying and 
adjusting different aspects through config files and .bbappends

> 5.: Is something important missing / wrong in my graphic (other than
> the distro stuff)?

-- 
Denys


