Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QK9bS-0001pg-B8 for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 15:37:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BDYeQi019833
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 14:34:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18989-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 14:34:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BDYWV1019827
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 14:34:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8941115E-22C9-45BD-90EE-4F8A1936AF54@dominion.thruhere.net>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<6a6f3589dba7aff0cb89f233807e5d051d8d3e08.1305035617.git.richard.purdie@linuxfoundation.org>
	<CD6AE1D1-3C36-4269-B773-14C648F63736@dominion.thruhere.net>
	<1305104979.30391.310.camel@rex>
	<FC1EF862-120F-4563-AF61-17A657491F21@dominion.thruhere.net>
	<1305113041.30391.347.camel@rex>
	<8941115E-22C9-45BD-90EE-4F8A1936AF54@dominion.thruhere.net>
Date: Wed, 11 May 2011 14:34:27 +0100
Message-ID: <1305120867.30391.353.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/6] bitbake.conf: Include the new default-providers.inc and default-versions.inc files
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
X-List-Received-Date: Wed, 11 May 2011 13:37:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-11 at 13:43 +0200, Koen Kooi wrote:
> Op 11 mei 2011, om 13:24 heeft Richard Purdie het volgende geschreven:
> 
> > On Wed, 2011-05-11 at 12:08 +0200, Koen Kooi wrote:
> >> Op 11 mei 2011, om 11:09 heeft Richard Purdie het volgende geschreven:
> >> 
> >>> On Tue, 2011-05-10 at 16:20 +0200, Koen Kooi wrote:
> >>>> Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende geschreven:
> >>>>> +++ b/meta/conf/distro/include/default-providers.inc
> >>>>> @@ -0,0 +1,34 @@
> >>>>> 
> >>>>> +PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
> >>>> 
> >>>> the dbus port has long been merged upstream, so proper gconf would be
> >>>> a better choice. We could ignore it and just use dconf in meta-gnome,
> >>>> though ;)
> >>> 
> >>> I agree we should be using gconf, could someone send me the recipe
> >>> though? ;-).
> >> 
> >> I think we want to keep gconf in meta-gnome and pull the dependants out of oe-core
> > 
> > We have a slight dependency conflict here as we've said we want sato in
> > OECore so we have something we can actually test.
> > 
> > Are we now saying sato also needs to be separated out into its own
> > layer?
> 
> I think that's the best way forward.
> 
> > Or can we define meta-gnome as being the gnome pieces without direct
> > requirements in OECore for a minimal gtk desktop?
> 
> If it's using gconf, it's not a minimal gtk desktop anymore. I see the
> point in having something like sato in oe-core, but I don't think
> that's worth having gconf(-dbus) in oe-core. But this is a different
> discussion, since there are other things that can use gconf (e.g.
> gstreamer) in oe-core, which we would need to take a look at.

It could be argued that gtk with no way to store settings is a little
useless. I'm in favour of having the core graphics testable so I'm not
100% convinced of your argument above. It certainly goes against the
viewpoint that came out of the TSC meetings so we need further
discussion.

In the meantime, replacing gconf-dbus with gconf would seem to move us
closer to where we want to be overall.

> Let's get your distro set merged and then improve on it.

Done :)

Cheers,

Richard



