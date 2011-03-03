Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Pv8K4-0007qJ-3Q
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 14:12:05 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Mar 2011 05:09:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,258,1297065600"; d="scan'208";a="396926954"
Received: from unknown (HELO [10.255.17.39]) ([10.255.17.39])
	by azsmga001.ch.intel.com with ESMTP; 03 Mar 2011 05:09:24 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <41F9E0FC-E0A1-4C7F-8999-3E1B53FDDEE1@dominion.thruhere.net>
References: <4D6E7EB1.5080602@windriver.com>
	<41F9E0FC-E0A1-4C7F-8999-3E1B53FDDEE1@dominion.thruhere.net>
Date: Thu, 03 Mar 2011 13:09:17 +0000
Message-ID: <1299157757.2550.5.camel@scimitar>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 (2.32.1-1.fc14) 
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 13:12:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 13:46 +0100, Koen Kooi wrote:
> Op 2 mrt 2011, om 18:30 heeft Mark Hatle het volgende geschreven:
> 
> > I finally got a chance to look at the oe-core and where it currently is..  Some
> > suggestions below:
> > 
> > LICENSE file, this may need to be cleaned up to only cover the components
> > actually in the oe-core.
> > 
> > README likely needs some revision
> > 
> > README.hardware needs a lot of revision.  Anything outside of support for QEMU
> > should be removed.
> 
> Agreed on the above
> 
> > The meta-demoapps
> 
> That has a lot of GNOME bits I need, so I would suggest meta-oe, a seperate gnome layer or the easiest way, keep it as a seperate layer, but outside of yocto. I think a GNOME (2) layer would make a lot of sense, but I don't know how many people will be looking after it.
> With my beagleboard.org hat on, a full GNOME desktop is one of our deliverables to go on the SD card included with the board at the factory, so sorting out the duplication between the layers for GNOME components would be nice.

I'd be inclined to suggest the separate GNOME layer, though see below
for some further thoughts.

> 
> > and meta-rt components, will those be staying or going?
> 
> I don't have a real opinion on that.
> 
> > The meta/recipes.txt needs to be verified as still what we want -- I assume it
> > is at this point..
> 
> It looks OK to me
> 
> > meta/recipes-...  sato, qt, gnome, I thought were going elsewhere?
> 
> See above for GNOME layer, QT is likely a similar case. Layers would also benefit from having their own git repository, but I can see the combinatorial explosion that could bring.

I agree with this in principle, but before we dive into this we need to
decide where we draw the line. GNOME and Qt are not comparable. GNOME
and KDE are, Gtk+ and Qt are.

Where should Gtk+ and Qt live? E.g: if Gtk+ lives in meta-gnome does
that mean someone creating a meta-xfce needs to either a) provide their
own (copy of the) Gtk+ recipe OR b) depend on the meta-gnome's presence.

I'll accept "We'll cross that bridge when we come to it" as an answer
but I at least feel it's worth pointing this out.

Cheers,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre



