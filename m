Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RjEGG-00069C-Fe
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 19:11:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Jan 2012 10:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53977224"
Received: from unknown (HELO [10.255.13.145]) ([10.255.13.145])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Jan 2012 10:04:03 -0800
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1325870130.12160.10.camel@phil-desktop>
References: <4c91ccffa882d1c01bd7abc18b662dce388192be.1325867350.git.tom.zanussi@intel.com>
	<e0e076a614e96c92eb02758f77bfab293509be92.1325867350.git.tom.zanussi@intel.com>
	<1325870130.12160.10.camel@phil-desktop>
Date: Fri, 06 Jan 2012 12:03:39 -0600
Message-ID: <1325873019.15053.40.camel@elmorro>
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
X-List-Received-Date: Fri, 06 Jan 2012 18:11:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 17:15 +0000, Phil Blundell wrote:
> On Fri, 2012-01-06 at 10:45 -0600, tom.zanussi@intel.com wrote:
> > diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
> > index 5975513..0a90f9c 100644
> > --- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
> > @@ -2,6 +2,7 @@ require gst-fluendo.inc
> >  
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=98326cbb1723a5a97e9b1db62e9faa05"
> > +LICENSE_FLAGS = "Commercial"
> 
> If I'm understanding the mechanism correctly then just setting all of
> these to "Commercial" seems like a bit of a retrograde step.  Is there
> an easy way in this new world for me to say that (for the sake of
> argument) gst-fluendo-mp3 is acceptable for inclusion but libomixl
> isn't?
> 

Hmm, I don't think it's retrograde - it's true, this patchset simply
replaces the existing functionality, where those particular packages
previously were all essentially marked "COMMERCIAL" by virtue of all
existing within the one-and-all COMMERCIAL_LICENSE variable, whereas now
they're all marked as "Commercial" instead.

But the new mechanism is much more flexible, since it now allows you to
make the distinctions you're mentioning, which was impossible with the
previous scheme.  So yeah, the idea is that you can use a string as
specific as you want for any give recipe e.g. have gst-fluendo-mp3
define LICENSE_FLAGS = "Commercial-gst-fluendo-mp3" and have something
similar for libomixl, or you might decide that libomxl is just fine
falling under the more general "Commercial" along with anything else
that might fall in the same general category.

I would expect whoever knows more about those particular packages to
actually submit changes for those if applicable.  For now, this just
replaces it all with a more flexible mechanism that allows you to do
that, but doesn't make judgments about the particular packages, which I
actually don't know much about wrt licensing. 

> It seems to me that, for this feature to be much use, the LICENSE_FLAGS
> need to be a bit more explicit about spelling out what the requirements
> really are for each package.  So, if the issue here is that you need to
> pay the MP3 decoder licence on each unit you ship, let's say something
> like LICENSE_FLAGS = "mp3-decoder-royalties" rather than just
> "Commercial".

I think the new mechanism provides the ability do whatever's necessary,
but as far as it goes, and as mentioned in the commentary for patch 1,
these are just strings and matches between two sets of them,
LICENSE_FLAGS and LICENSE_FLAGS_WHITELIST.  I'm afraid I don't know
enough about the distinctions between the different license categories
that might be needed.  To me defining those falls under the heading of
'policy', and is something I'll have to leave for others.  I'm simply
providing the mechanism with this patch.

Thanks,

Tom

> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




