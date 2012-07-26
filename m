Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuNQX-0007KG-8h
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 14:44:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 05:32:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173454540"
Received: from unknown (HELO helios.localnet) ([10.252.121.37])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2012 05:32:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 26 Jul 2012 13:32:51 +0100
Message-ID: <1515360.HL1K52tqqg@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <2CA706BF-4D5B-4488-B128-B665F32A0DD3@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LZx5E7tcvLUMrjPdH2B5p+DnFxU63tbtL6tsDX5dVfVSQ@mail.gmail.com>
	<2CA706BF-4D5B-4488-B128-B665F32A0DD3@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 12:44:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 26 July 2012 14:29:14 Koen Kooi wrote:
> Op 26 jul. 2012, om 14:00 heeft Burton, Ross het volgende geschreven:
> > On 26 July 2012 12:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> It would be nice if other layers that have RDEPENDS_foo = "dbus-x11" keep
> >> working till their maintainers get around fixing them. Note that you
> >> might need to do a -c cleansstate on dbus first to trigger any errors.> 
> > Yes, and isn't that what the RPROVIDES is for?
> 
> I'm not sure if bitbake can map RPROVIDES to PROVIDES, I vaguely remember
> that it doesn't, but it will pick it up *after* do_package has run. I broke
> OE way too many times doing things like that :)

Why would it need to if we're talking about RDEPENDS and more specifically 
RDEPENDS defined before do_package?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


