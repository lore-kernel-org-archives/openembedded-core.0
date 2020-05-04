Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
 by mx.groups.io with SMTP id smtpd.web11.2399.1588581541862602858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 01:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.14, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 49Fx8y458pz5tlD;
	Mon,  4 May 2020 10:38:58 +0200 (CEST)
Date: Mon, 4 May 2020 10:38:57 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] can i blacklist a particular .bbclass file when there are more than one?
Message-ID: <20200504083857.r6lng72jt2ywlaux@qschulz>
References: <alpine.LFD.2.21.2004300945580.19276@localhost.localdomain>
 <20200430170116.GT11927@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200430170116.GT11927@denix.org>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 30, 2020 at 01:01:16PM -0400, Denys Dmytriyenko wrote:
> On Thu, Apr 30, 2020 at 09:49:32AM -0400, Robert P. J. Day wrote:
> > 
> >   given an odd collection of layers wherein there are multiple
> > instances of a particular .bbclass file, it turns out that all of the
> > recipes i'm interested in build with an older version of the class
> > file, and all but one build consulting the newer form of the file
> > contained in another layer, so is there any way to blacklist a
> > particular class file, either globally or even on a per-recipe basis?
> > 
> >   i realize this is really, really bad design style, but it will give
> > me the chance to use the proper class file for most of the recipes
> > while i debug the problematic recipe.
> 
> The order of BBLAYERS in bblayers.conf affects which class will be used 
> globally for the build. Don't believe can be done per-recipe.
> 

To be exact, the order in BBPATH will be used to get the class. It
defaults to BBPATH .= in conf/layer.conf so that the actual order of
parsing of layers (given in bblayers.conf) matters because all append to
BBPATH but you could prepend to it in one of your layer so that it has
higher priority than anything else.

To answer your question, maybe there is some trickery possible per machine
or distro for bbpath but I wouldn't count on it.

Quentin
