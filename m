Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CFA137850C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 14:09:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 31 Jul 2017 07:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,442,1496127600"; d="scan'208";a="999151533"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga003.jf.intel.com with ESMTP; 31 Jul 2017 07:09:37 -0700
Date: Mon, 31 Jul 2017 17:10:25 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: rpjday@crashcourse.ca
Message-ID: <20170731141025.GB15641@mbabyjoh-desk.ger.corp.intel.com>
References: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
	<ca8a860d-0894-e604-6108-359ccd094e72@linux.intel.com>
	<1501498850.18633.1.camel@linuxfoundation.org>
	<20170731071523.Horde.D4ds4jNhxwzGV9es7N9Nh3V@crashcourse.ca>
	<20170731125017.GA15641@mbabyjoh-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170731125017.GA15641@mbabyjoh-desk.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: worth adding a "git"-versioned of i2c-tools to oe-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Jul 2017 14:09:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
On Mon, Jul 31, 2017 at 03:50:17PM +0300, Maxin B. John wrote:
> Hi,
> 
> On Mon, Jul 31, 2017 at 07:15:23AM -0400, rpjday@crashcourse.ca wrote:
> > 
<snip>
> > 
> >   well, here's a possible conundrum ... in that same package (i2c-tools),
> > there appears to be an *obvious* flaw in that the "eeprog" utility uses a
> > sleep that is far too short for proper operation, as described here:
> > 
> > https://www.toradex.com/community/questions/10243/write-issue-with-eeprog-in-eeprom.html
> > 
> > there is a link to a patch on that page that simply cranks up a few sleep
> > calls from 10usec to 5msec, which apparently solves the problem. i've been
> > involved in a discussion on the i2c-tools mailing list about this very
> > issue after i tripped over it, but there seems to be little enthusiasm on
> > that list for "fixing" this -- i was told that people use the kernel driver
> > instead and access via /sys rather than calling "eeprog".
> 
> dl.lm-sensors.org has been down for a while and doesn't show any positive signs that
> it will be back in near future. One possibility will be to use the unofficial mirrors
> listed below and upgrade to version 3.1.2

Sorry, I meant to use the most recent version (we already have the latest released verion - 3.1.2) 

> 1. https://fossies.org/linux/misc/
> 2. http://jdelvare.nerim.net/mirror/i2c-tools/
> 
> >   so, from my perspective, this should definitely be fixed so that "eeprog"
> > functions properly, but it's not clear upstream is all that interested in it.
> > what would the protocol be here?
> 
> Since this genuinely fixes an error, we should be able to include this patch with:
> "Inappropriate [bug workaround]" status. 
> 
> > rday
> 
> Best Regards,
> Maxin

