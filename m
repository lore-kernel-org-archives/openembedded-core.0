Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SIRTz-0002Kp-Nr
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 23:23:11 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2D00K9NXMJLEM0@vms173001.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 16:13:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 16F5920099; Thu,
	12 Apr 2012 17:13:30 -0400 (EDT)
Date: Thu, 12 Apr 2012 17:13:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120412211330.GG13291@denix.org>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
	<D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>
	<CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
	<1334256020.7309.45.camel@ted> <4F873102.6020603@balister.org>
	<DE32AA93-7E17-480C-9027-DB6EA6F2A0C0@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <DE32AA93-7E17-480C-9027-DB6EA6F2A0C0@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 12 Apr 2012 21:23:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 12, 2012 at 09:57:02PM +0200, Koen Kooi wrote:
> 
> Op 12 apr. 2012, om 21:46 heeft Philip Balister het volgende geschreven:
> 
> > On 04/12/2012 11:40 AM, Richard Purdie wrote:
> >> On Thu, 2012-04-12 at 14:32 -0300, Otavio Salvador wrote:
> >>> On Thu, Apr 12, 2012 at 14:22, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >>>> You just volunteered to handle all the "Does it work with yocto 1.2?" questions :)
> >>>> 
> >>>> Simply put: people are stupid, they need explicit PHB compliant names in tags, even if it isn't 100% politically correct to say "yocto" when we actually mean "oe-core".
> >>>> 
> >>>> Unless the yocto 1.2 release note state that it's based on oe-core "foo" and all layers compatible with "foo" use "foo" in tags/branches.
> >>> 
> >>> I think layers ought to have tags for both ...
> >>> 
> >>> <layer>-oe-core-<tag>
> >>> <layer>-yocto-<tag>
> >> 
> >> This would be rather sad if it were necessary. The whole point is we're
> >> trying to build things which are compatible with each other. If that
> >> turns out not to be the case I want to fix it, not encourage it.
> > 
> > We need a coherent tag name to use across layers. The Yocto Project is
> > the umbrella project, so using the yocto-project in the tag name is a
> > good way to show this coordination among projects to people not familiar
> > with how things are working. (As Koen notes, this makes communication
> > with people whose primary exposure to the Yocto Project is watching
> > youtube videos)
> > 
> > I do not want to see table containing Yocto Project release information
> > and they relate to a set of seemingly random tags in other layers.
> > 
> > Philip
> > 
> > PS: For various reasons, the tag needs to be yocto-project.... not yocto....
> 
> "yoctoproject", without the hyphen to be consistent with the domainname :)

Technically, yocto-project.org is a valid domain name too, as it properly 
redirects to yoctoproject.org and both are registered by the Linux Foundation.

Should we put it to vote? While we still have time before the release, we need 
to agree on the naming eventually.

-- 
Denys


