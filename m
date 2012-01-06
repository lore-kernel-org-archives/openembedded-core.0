Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RjIuq-0000S8-3b
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 00:09:40 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Jan 2012 15:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="54065420"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Jan 2012 15:02:14 -0800
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1325877612.3234.1.camel@lenovo.internal.reciva.com>
References: <4c91ccffa882d1c01bd7abc18b662dce388192be.1325867350.git.tom.zanussi@intel.com>
	<e0e076a614e96c92eb02758f77bfab293509be92.1325867350.git.tom.zanussi@intel.com>
	<1325870130.12160.10.camel@phil-desktop>
	<1325873019.15053.40.camel@elmorro>
	<1325877612.3234.1.camel@lenovo.internal.reciva.com>
Date: Fri, 06 Jan 2012 17:01:49 -0600
Message-ID: <1325890909.15053.71.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: [PATCH 2/5] Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
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
X-List-Received-Date: Fri, 06 Jan 2012 23:09:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 19:20 +0000, Phil Blundell wrote:
> On Fri, 2012-01-06 at 12:03 -0600, Tom Zanussi wrote:
> > On Fri, 2012-01-06 at 17:15 +0000, Phil Blundell wrote:
> > > If I'm understanding the mechanism correctly then just setting all of
> > > these to "Commercial" seems like a bit of a retrograde step.  Is there
> > > an easy way in this new world for me to say that (for the sake of
> > > argument) gst-fluendo-mp3 is acceptable for inclusion but libomixl
> > > isn't?
> > > 
> > 
> > Hmm, I don't think it's retrograde - it's true, this patchset simply
> > replaces the existing functionality, where those particular packages
> > previously were all essentially marked "COMMERCIAL" by virtue of all
> > existing within the one-and-all COMMERCIAL_LICENSE variable, whereas now
> > they're all marked as "Commercial" instead.
> 
> Well, the sense in which it seems retrograde to me is that, previously,
> COMMERCIAL_LICENSE named a list of packages and I could add or remove
> things as I saw fit depending on my distro policy requirements.  Now,
> they're all just marked "Commercial" in an undifferentiated way and
> there doesn't seem to be any easy mechanism for me to take some but not
> all of them.
> 

Yeah, the global COMMERCIAL_LICENSE is convenient in that there's one
place you can go to see a list of affected packages, but it's kind of at
odds with allowing per-recipe flexibility for layers to add their own
license terms.

To accomplish the same thing as COMMERCIAL_LICENSE with LICENSE_FLAGS,
we could simply have each of the packages now listed in
COMMERCIAL_LICENSE define LICENSE_FLAGS = "Commercial_${PN}".

The downside is that to enable only the ones you want, you'd have to
know which are the ones you want in order to name them, which I guess
you should anyway (rather then have them all in convenient list to
remind you).  For convenience and to sort of address that problem for
the packages in oe-core, we could add a commented-out
LICENSE_FLAGS_WHITELIST containing all the currently-listed packages in
COMMERCIAL_LICENSE to the default local.conf.  Users of other layers
would have to know which additional packages to put in the whitelist,
but again, shouldn't they be conscious of that anyway?

Tom

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




