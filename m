Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Si4AZ-0003LC-31
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 15:45:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2012 06:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="157124030"
Received: from unknown (HELO helios.localnet) ([10.252.120.123])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2012 06:34:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 22 Jun 2012 14:34:13 +0100
Message-ID: <25294393.hmh001VYMW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1206210454080.17361@oneiric>
References: <alpine.DEB.2.02.1206210454080.17361@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: superfluous download locations in oe-core's bitbake.conf
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
X-List-Received-Date: Fri, 22 Jun 2012 13:45:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 21 June 2012 04:56:51 Robert P. J. Day wrote:
>   given that oe-core is defined as being a really minimal
> configuration with no extraneous cruft, there seems to be a number of
> unnecessary download locations in the shipped bitbake.conf, things
> like:
> 
> ADOBE_MIRROR =
> FREEBSD_MIRROR =
> 
> and so on.  obviously, they're not doing any harm but there seems to
> be little value in defining download locations that aren't used by
> anything actually in oe-core.

These are present for largely historical reasons - namely in OE-Classic we had 
a number of recipes needing this same mirror defined and it was deemed that it 
was easier to edit it in one place if it needed to change. Some of them are 
even completely useless now as the sites to which they point are now gone, 
e.g. HANDHELDS_CVS.

I think the way to approach this would be to just submit a patch removing the 
more extraneous ones and see if anyone complains. Note that some of them that 
aren't used in OE-Core might be used within meta-oe or other OE community 
layers, so those might need to stay at least for the time being.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


