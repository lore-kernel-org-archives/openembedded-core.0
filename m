Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SwxVB-0003nD-Eq
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 17:39:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Aug 2012 08:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="192505247"
Received: from unknown (HELO helios.localnet) ([10.252.121.75])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2012 08:28:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 02 Aug 2012 16:28:11 +0100
Message-ID: <5252580.R5epMZ2pSF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <0AF90D68-14FE-4555-9293-75450B061A51@dominion.thruhere.net>
References: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LakdrRqVVx+jAeUK7Upx570=jLo=PYONZ63=xDNiwD5jA@mail.gmail.com>
	<0AF90D68-14FE-4555-9293-75450B061A51@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] usbutils: Upgrade usbutils to upstream v006
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
X-List-Received-Date: Thu, 02 Aug 2012 15:39:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 August 2012 16:14:07 Koen Kooi wrote:
> Op 2 aug. 2012, om 15:55 heeft "Burton, Ross" <ross.burton@intel.com> het 
volgende geschreven:
> > On 2 August 2012 14:50, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> That's the default value, so you can drop this hunk
> > 
> > Can we settle this once and for all?  Sure, it's the default, but it's
> > also going to be added back in again the moment there's a change...
> > I'm a fan of leaving a PR in there, even at r0, so its not constantly
> > being added and removed.
> 
> The complete PR field is scheduled to get removed, so the more recipes
> without it being said to that stupid default value, the better.

Since such a removal will just be a blanket search and replace, what difference 
does it make?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


