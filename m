Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UcYco-0001Qk-Pt
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 12:08:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 May 2013 02:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,675,1363158000"; d="scan'208";a="313906181"
Received: from unknown (HELO helios.localnet) ([10.255.12.118])
	by orsmga001.jf.intel.com with ESMTP; 15 May 2013 02:49:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2013 10:49:34 +0100
Message-ID: <3057509.dy5Cs7AUqs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <5193533D.70503@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <1824887.iAjz2He6PC@helios>
	<5193533D.70503@r-finger.com>
MIME-Version: 1.0
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2013 10:08:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 May 2013 10:19:57 Tomas Frydrych wrote:
> On 14/05/13 17:55, Paul Eggleton wrote:
> > Having clutter in OE-Core does not preclude such testing with additional
> > BSPs, and I'm unclear on how moving it out to another layer helps at all
> > with this specific issue.
> 
> It prevents efficiently supporting clutter on any real machine that does
> not use mesa's GL, which means all machines not in meta-intel, and some
> machines in meta-intel. This is the main issue, real HW support.

How does it prevent that? Surely if machine-specific changes are required then 
they will be required on top of a separate layer as much as they are if the 
recipes remain in OE-Core.

> > This could present a problem. What if I want Clutter but I don't want the
> > latest version of glib, but instead the version that is being shipped with
> > OE- Core that is tested with the other pieces of the system that depend
> > upon it (especially given glib has recent history of breaking other
> > packages)? Surely the safest alternative is the last stable version of
> > Clutter that works with that version of glib? That would make it
> > difficult to depend upon an external layer that provides its own newer
> > version of glib would it not?
> 
> Sometimes a 6 month old release is not enough, and having to provide the
> updated packages yourself is the least desirable of all options. In a
> small layer, such issues can be handled gracefully, and their impact
> limited.

Yes, I agree, "sometimes"; the same could be said for almost any piece of 
software; new features and fixes come along and some of those will be too 
important to some users to ignore. The layer mechanism exists to allow specific 
recipes to be extended if needed. Having the recipes in OE-Core does not 
preclude their extension or replacement with newer versions elsewhere for 
those that need it.

> > There's no denying that the maintenance of the Clutter recipes in OE-Core
> > has slipped. I don't think that is an argument in itself to split them
> > out, that just means we need to recognise that and maintain those recipes
> > more effectively.
> 
> The lack of maintenance reflects the relative importance of Clutter for
> oe-core, and is an orthogonal issue. I am not complaining that it is not
> being maintained, I am arguing that it cannot be properly maintained
> with just reference to mesa and qemu, hence the suggestion to split it out.

You may well be right about the need to test on other GL implementations. That 
does not explain how moving them to a separate layer directly helps to address 
that need. You must also expect to make some changes to the recipes 
themselves, so what changes would you be making?
 
> > Honestly I think if Clutter continues to be something that people are
> > using to develop applications we're much better off with the "canonical"
> > stable version being in OE-Core.
> 
> Where 'canonical' means 'unusable on non-Intel HW', but I am repeating
> myself ...

See above.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


