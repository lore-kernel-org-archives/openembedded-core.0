Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B7FCF782EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:50:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 31 Jul 2017 05:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,442,1496127600"; d="scan'208";a="999125759"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga003.jf.intel.com with ESMTP; 31 Jul 2017 05:50:30 -0700
Date: Mon, 31 Jul 2017 15:50:17 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: rpjday@crashcourse.ca
Message-ID: <20170731125017.GA15641@mbabyjoh-desk.ger.corp.intel.com>
References: <20170731064114.Horde.DvVIF0q0YvJ5HlL1pcjzGe4@crashcourse.ca>
	<ca8a860d-0894-e604-6108-359ccd094e72@linux.intel.com>
	<1501498850.18633.1.camel@linuxfoundation.org>
	<20170731071523.Horde.D4ds4jNhxwzGV9es7N9Nh3V@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <20170731071523.Horde.D4ds4jNhxwzGV9es7N9Nh3V@crashcourse.ca>
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
X-List-Received-Date: Mon, 31 Jul 2017 12:50:30 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

On Mon, Jul 31, 2017 at 07:15:23AM -0400, rpjday@crashcourse.ca wrote:
> 
> Quoting Richard Purdie <richard.purdie@linuxfoundation.org>:
> 
> >On Mon, 2017-07-31 at 13:41 +0300, Alexander Kanavin wrote:
> >>On 07/31/2017 01:41 PM, rpjday@crashcourse.ca wrote:
> >>>
> >>>
> >>>    given that some significant changes have been made to i2c-tools
> >>> since
> >>> version 3.1.2, is it worth adding a git-versioned recipe of that
> >>> to 
> >>> oe-core,
> >>> and using DEFAULT_PREFERENCE to force people to select it if they
> >>> want it?
> >>> in particular, the code base has been restructured, and a new
> >>> utility,
> >>> "i2ctransfer", has been added.
> >>It's better to ask the upstream to make a new release.
> >>
> >>We've had dual git/release recipes in the past, and they were all an 
> >>utter failure. In the sense, that only one version of the recipe was 
> >>maintained, and the other was completely neglected.
> >
> >Going forward we may accept patches using this instead:
> >
> >http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/devupstream.bbclass
> >
> >Cheers,
> >
> >Richard
> 
>   well, here's a possible conundrum ... in that same package (i2c-tools),
> there appears to be an *obvious* flaw in that the "eeprog" utility uses a
> sleep that is far too short for proper operation, as described here:
> 
> https://www.toradex.com/community/questions/10243/write-issue-with-eeprog-in-eeprom.html
> 
> there is a link to a patch on that page that simply cranks up a few sleep
> calls from 10usec to 5msec, which apparently solves the problem. i've been
> involved in a discussion on the i2c-tools mailing list about this very
> issue after i tripped over it, but there seems to be little enthusiasm on
> that list for "fixing" this -- i was told that people use the kernel driver
> instead and access via /sys rather than calling "eeprog".

dl.lm-sensors.org has been down for a while and doesn't show any positive signs that
it will be back in near future. One possibility will be to use the unofficial mirrors
listed below and upgrade to version 3.1.2

1. https://fossies.org/linux/misc/
2. http://jdelvare.nerim.net/mirror/i2c-tools/

>   so, from my perspective, this should definitely be fixed so that "eeprog"
> functions properly, but it's not clear upstream is all that interested in it.
> what would the protocol be here?

Since this genuinely fixes an error, we should be able to include this patch with:
"Inappropriate [bug workaround]" status. 

> rday

Best Regards,
Maxin

