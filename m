Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SaGJS-0001s5-JI
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 03:06:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 May 2012 17:55:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173477903"
Received: from edwin-gen.sh.intel.com (HELO edwin-gen) ([10.239.36.4])
	by fmsmga002.fm.intel.com with SMTP; 31 May 2012 17:55:35 -0700
Received: by edwin-gen (sSMTP sendmail emulation);
	Fri, 01 Jun 2012 08:56:59 +0800
Date: Fri, 1 Jun 2012 08:56:59 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120601005659.GA2242@edwin-gen>
References: <cover.1338368508.git.edwin.zhai@intel.com>
	<2255c64e0eb4a2b5b7f063dbc5ff421e606458c8.1338368508.git.edwin.zhai@intel.com>
	<1338396045.20169.162.camel@ted> <4FC66D5B.7090201@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4FC66D5B.7090201@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/1] webkit-gtk: Use glib as unicode backend to avoid browser crash
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
X-List-Received-Date: Fri, 01 Jun 2012 01:06:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 30, 2012 at 12:56:27PM -0600, Gary Thomas wrote:
> On 2012-05-30 10:40, Richard Purdie wrote:
> >
> >I've merged this however I'm not 100% happy with this as the final fix.
> >I'd ask that:
> >
> >a) The bug remains open (re-prioritised appropriately) about the
> >remaining issues that still exist in ICU
> >b) We add something to the ICU recipe which stops it building when the
> >endianess isn't correct (host matches target) so nobody can built it and
> >have it not work.
> 
> Why not accept my patch that provides a working dataset?  I doubt

Provideding a big binary in yocto website is not clean, but it should avoid 
potential side effect. 

> that you're ever going to get the ICU folks interested to the point
> of fixing this correctly and this solves the problem without the
> [IMO undesirable] side effect of using different libraries on

This is ultimate solution. I remember ICU community is not so active to do it.

> different architectures (for webkit-gtk).
> 
> -- 
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
best rgds,
edwin


