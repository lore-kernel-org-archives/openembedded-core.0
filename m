Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RQKxw-00022v-2U
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 16:30:28 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Nov 2011 07:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,515,1315206000"; d="scan'208";a="90764951"
Received: from unknown (HELO helios.localnet) ([10.252.121.171])
	by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2011 07:24:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2011 15:24:02 +0000
Message-ID: <5045623.7HHBYH2g0Q@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-12-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <0B9C45DF-86DC-4D1C-8D66-C59EB17C9D8C@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<1321368170.26881.221.camel@ted>
	<0B9C45DF-86DC-4D1C-8D66-C59EB17C9D8C@dominion.thruhere.net>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Tue, 15 Nov 2011 15:30:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 November 2011 15:55:38 Koen Kooi wrote:
> Op 15 nov. 2011, om 15:42 heeft Richard Purdie het volgende geschreven:
> > On Tue, 2011-11-15 at 14:59 +0100, Koen Kooi wrote:
> >> Op 15 nov. 2011, om 14:43 heeft Richard Purdie het volgende geschreven:
> >>> To put this quite simply, I think there is no good reason we
> >>> shouldn't
> >>> use the mechanism we've selected to handle this kind of problem. We
> >>> should have defaults the reflect backwards compatibility. Other than
> >>> that where is the problem other than a general objection to
> >>> PACKAGECONFIG?
> >> 
> >> It forces a choice when there is a solution where things can coexist.
> > 
> > There are multiple ways of coexisting and the configuration changing
> > based on DISTRO_FEATURES doesn't force a choice either.
> 
> It does force a choice, since you don't want to change DISTRO_FEATURES when
> distributing binaries. If changing it is safe, then it isn't a
> DISTRO_FEATURE.

It forces nothing - in fact it allows a distro to make choices.

DISTRO_FEATURES and PACKAGECONFIG are both expressions of distro policy which 
is intended to be set before binaries are produced; PACKAGECONFIG is simply on 
a per-recipe basis rather than across multiple recipes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


