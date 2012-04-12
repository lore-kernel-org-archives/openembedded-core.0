Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SIPu3-00008C-3X
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 21:41:59 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2D0006ZQ4ZF480@vms173003.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 13:31:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BC32C20099; Thu,
	12 Apr 2012 14:31:47 -0400 (EDT)
Date: Thu, 12 Apr 2012 14:31:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120412183147.GD13291@denix.org>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
	<D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>
	<CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 19:41:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 12, 2012 at 02:32:00PM -0300, Otavio Salvador wrote:
> On Thu, Apr 12, 2012 at 14:22, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > You just volunteered to handle all the "Does it work with yocto 1.2?" questions :)
> >
> > Simply put: people are stupid, they need explicit PHB compliant names in tags, even if it isn't 100% politically correct to say "yocto" when we actually mean "oe-core".
> >
> > Unless the yocto 1.2 release note state that it's based on oe-core "foo" and all layers compatible with "foo" use "foo" in tags/branches.
> 
> I think layers ought to have tags for both ...
> 
> <layer>-oe-core-<tag>
> <layer>-yocto-<tag>

And <layer>-poky-<tag> for completeness?

Seriously, "yocto"-naming schema is not that bad. For shortness, it can be 
"yp-1.2" as a suffix to the layer-specific tags...

But I'm flexible with other naming schemas, such as "YYYY.MM" or "YYYY.#"

-- 
Denys


