Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QCxzB-000662-3P
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 19:48:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Apr 2011 10:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,252,1301900400"; d="scan'208";a="736597600"
Received: from vorpal.jf.intel.com (HELO [10.7.199.145]) ([10.7.199.145])
	by orsmga001.jf.intel.com with ESMTP; 21 Apr 2011 10:45:48 -0700
From: Joshua Lock <josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <6252772B-4D5D-4E5D-BCD5-1A53C1D25AFA@dominion.thruhere.net>
References: <8313867A-EA5C-473D-A82B-D8338186BF5F@dominion.thruhere.net>
	<201104211605.28351.paul.eggleton@linux.intel.com>
	<1303404025.9960.6.camel@vorpal>
	<6252772B-4D5D-4E5D-BCD5-1A53C1D25AFA@dominion.thruhere.net>
Date: Thu, 21 Apr 2011 10:41:45 -0700
Message-ID: <1303407705.9960.51.camel@vorpal>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC] Working toward a GNOME layer
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
X-List-Received-Date: Thu, 21 Apr 2011 17:48:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-04-21 at 19:29 +0200, Koen Kooi wrote:
> Op 21 apr 2011, om 18:40 heeft Joshua Lock het volgende geschreven:
> 
> > On Thu, 2011-04-21 at 16:05 +0100, Paul Eggleton wrote:
> >> On Thursday 21 April 2011 15:02:49 Koen Kooi wrote:
> >>> and possibly more. I would like to create a meta-gnome layer in the
> >>> meta-openembedded repository where new recipes get added and things from
> >>> meta-demoapps can get moved over into. Long term recipes-gnome in oe-core
> >>> should move there as well.
> >>> 
> >>> What are your thoughts on this?
> > 
> > +1
> > 
> >> 
> >> From my perspective this sounds like a great idea. The only question would be 
> >> how much of the "GNOME" libs would remain in oe-core as some of them are quite 
> >> widely used outside of GNOME proper; however that can easily be worked out as 
> >> these things mature.
> > 
> > +1
> > 
> > My personal opinion would be that we start with glib & gtk+ (plus their
> > dependencies, i.e. pango, atk, etc) in core and move the rest out to a
> > layer.
> > 
> > I feel that Gtk+ is used by enough non-gnome software that it belongs in
> > core but others may disagree?
> > 
> > Between meta/recipes-gnome and meta-demoapps we have a reasonable start
> > to a meta-gnome/
> 
> Where did meta-demoapps go? It's not in OE-core anymore by the looks of it.

Hmm, still exists for me:

joshual@vorpal:~/Projects/Yocto/oe-core/meta-demoapps[master]
$ pwd
/home/joshual/Projects/Yocto/oe-core/meta-demoapps


> 
> > I'd be happy to help with this layer.
> 
> Awesome, do you have any objection to put meta-gnome into the meta-openembedded repo for the time being? Once we get better tooling we can move it elsewhere, of course.

None whatsoever. I keep meaning to push some recipes into that layer
anyway.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Center



