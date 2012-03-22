Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SAZtz-0002cW-CX
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 05:45:31 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M19001LEOOP0DR1@vms173011.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:36:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CF2562016F; Wed,
	21 Mar 2012 23:36:24 -0400 (EDT)
Date: Wed, 21 Mar 2012 23:36:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120322033624.GI6857@denix.org>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<1332361627.9740.180.camel@ted> <4F6A9B02.7090201@windriver.com>
MIME-version: 1.0
In-reply-to: <4F6A9B02.7090201@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 04:45:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 22, 2012 at 11:22:42AM +0800, Robert Yang wrote:
> 
> 
> On 03/22/2012 04:27 AM, Richard Purdie wrote:
> >On Wed, 2012-03-21 at 21:14 +0100, Koen Kooi wrote:
> >>Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
> >>
> >>>On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
> >>>>* This move will allow the testing of meta-kde for users without meta-openembedded.
> >>>>
> >>>So what other layers are using giflib?
> >>>
> >>>Your suggesting that we need to have it in oe-core so people don't need to add the meta-openembedded layer when using meta-kde?
> >>>
> >>>I am just trying to get more data before making a decision.
> >>
> >>Let's put everything in oe-core!
> >
> >Let's try and be constructive ;-).
> >
> >I think to make a good decision about this we need to understand which
> >layers use giflib.
> >
> >Is this really the only component from meta-oe that meta-kde needs? If
> 
> Yes, as far as we know, this is the only component from meta-oe that
> meta-kde needs.

Are you talking about kdelibs/kdebase or the entire KDE world? Building any of 
the standard KDE apps (kdenetwork, kdemultimedia, etc.) will bring additional 
dependencies...

-- 
Denys


