Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGwf2-0008QK-2R
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:44:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Oct 2011 10:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="65203393"
Received: from jbkonno-mobl.jf.intel.com (HELO [10.7.199.153]) ([10.7.199.153])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 10:38:15 -0700
Message-ID: <4EA05C84.3090409@linux.intel.com>
Date: Thu, 20 Oct 2011 10:38:12 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <9DA5872FEF993D41B7173F58FCF6BE94E2F42F6A@orsmsx504.amr.corp.intel.com>
	<158EAB1C-0C40-4C5B-B47A-A4B8C90A2055@dominion.thruhere.net>
	<1319042998.22985.257.camel@phil-desktop>
	<4E9F018D.7030703@intel.com>
	<CAMKF1srj1OrgnSwihsVGDCVasAc6zTHRJkfAkjFOpM80mUFM9A@mail.gmail.com>
	<4E9F0CCF.3070404@intel.com>
	<CAMKF1sqffiB0WMnhv3wVNseaMcL8TjXUePYXhvdUcwwk4roPag@mail.gmail.com>
	<CAP9ODKoFRiVnimZ3MDvK9S2v8JLykpR2-pWmmwz_2ua0pr-HfA@mail.gmail.com>
	<4E9F5E5A.6040002@intel.com> <1319120752.2410.34.camel@ted>
	<20111020143631.GJ3522@jama.jama.net>
	<1319126135.2410.51.camel@ted>
	<3201B6F2-5E3A-4087-A023-2A7C688452E6@dominion.thruhere.net>
In-Reply-To: <3201B6F2-5E3A-4087-A023-2A7C688452E6@dominion.thruhere.net>
Subject: Re: [CONSOLIDATED PULL 14/16] distro-tracking: update data for some toolchain recipes
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
X-List-Received-Date: Thu, 20 Oct 2011 17:44:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/20/2011 09:24 AM, Koen Kooi wrote:>
> I'm in favour of having info in the recipe (or bbappend!) who is looking after it if it doesn't end up in the output package. 
> 
> Regardless of where to put the info, I would like to propose to orphan every recipe in OE-core and ask for volunteers. There's a ton of stuff I want to look after (bluez, gstreamer, pulse, avahi, X) which already has a maintainer from its yocto/poky/whatever legacy, but I feel is not being looked after with much attention. And adding to the problem is that most yocto people aren't using OE-core, but poky.

I feel the need to point out that you don't have to be the named
maintainer to submit a patch.

Personally I'd be happy to see maintainer ship go to other members of
the community.
I think a better approach would be to seek volunteers before we orphan
things? That way things which don't receive volunteers can stay with the
current maintainer?

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


