Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYxtc-0003Hp-0B for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 11:41:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9AYorY031568
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2011 10:34:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30716-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2011 10:34:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB9AYgLK031562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2011 10:34:43 GMT
Message-ID: <1323426892.5309.120.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Dec 2011 10:34:52 +0000
In-Reply-To: <CB3A9DC8-124F-4314-A7B5-17C34B59E9D0@dominion.thruhere.net>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<7ceb01f6db6edfad6c78c5a7ebc685c23bb11358.1323327959.git.xiaofeng.yan@windriver.com>
	<67C6F211-C6C2-4655-889A-A254F4E0D7D9@dominion.thruhere.net>
	<1323363345.5309.42.camel@ted>
	<1323364334.26081.383.camel@phil-desktop>
	<1323381564.5309.65.camel@ted>
	<CB3A9DC8-124F-4314-A7B5-17C34B59E9D0@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 04/10] gtk.inc: add feature based on directfb
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
X-List-Received-Date: Fri, 09 Dec 2011 10:41:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-09 at 07:51 +0100, Koen Kooi wrote:
> Op 8 dec. 2011, om 22:59 heeft Richard Purdie het volgende geschreven:
> 
> > On Thu, 2011-12-08 at 17:12 +0000, Phil Blundell wrote:
> >> On Thu, 2011-12-08 at 16:55 +0000, Richard Purdie wrote:
> >>> The question is whether it makes sense to have directfb and X based gtk
> >>> in the same builds and package feeds or not. I can see that it might be
> >>> desired and that it likely is possible.
> >> 
> >> This is true, though there's nothing to stop a distro that particularly
> >> wants this from inventing their own stub recipes which just set
> >> PACKAGECONFIG appropriately and then require the generic version.  So
> >> it's really just a question of what we want to be the default in
> >> oe-core.
> >> 
> >> Also note that, although you can parallel install multiple versions of
> >> the gtk+ runtime on the target system, if you want the build system to
> >> be deterministic then (in the absence of per-recipe sysroot
> >> construction) you need some way to decide which one gets to provide the
> >> gtk+-2.0.pc that other recipes will build against.  (The different
> >> targets have different library sonames so you can't just swap them out
> >> at run time: a given binary will remain coupled to the particular Gtk
> >> variant that it was compiled against.)  And if the two variants could
> >> conceivably be different versions of GTK then you also need a way to
> >> deconflict ${includedir}/gtk-2.0.  
> >> 
> >> So it isn't quite as simple as just having the two recipes, there is a
> >> bit of extra policy involved as well.  And of course there would be all
> >> the normal overhead in terms of parse time, memory footprint and
> >> maintenance burden associated with having more recipes.  
> > 
> > This is the key detail I was missing. I thought they just might have
> > been a drop in replacement.
> > 
> > That isn't the case so this makes the choice easier, I think separate
> > recipes don't make sense based on this.
> > 
> >> So, in light of all the above plus the fact that everything is different
> >> with Gtk+3 anyway, my preference for supporting directfb on gtk+2 in
> >> oe-core would be to use PACKAGECONFIG and not have separate recipe
> >> files.
> > 
> > Agreed, given the above.
> 
> So to be safe and give other directfb implementations a change, can
> this PACKAGECONFIG option be named 'gtk-directfb' in DISTRO_FEATURES?

I think that is reasonable.

Cheers,

Richard



