Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SsEPW-0008UL-1m
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 16:42:30 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 20 Jul 2012 07:31:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="124781812"
Received: from unknown (HELO helios.localnet) ([10.252.121.25])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Jul 2012 07:31:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>
Date: Fri, 20 Jul 2012 15:31:04 +0100
Message-ID: <4851908.FI1zozqsjq@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <CABcZANm_becV-qGHud3=kbyoBMuG9xqcTTLNdT5RCu-MZMGn1g@mail.gmail.com>
References: <20120720093208.GD3534@jama.jama.net>
	<1342793560.21788.27.camel@ted>
	<CABcZANm_becV-qGHud3=kbyoBMuG9xqcTTLNdT5RCu-MZMGn1g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Yocto style guide change proposal
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
X-List-Received-Date: Fri, 20 Jul 2012 14:42:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 20 July 2012 07:15:28 Chris Larson wrote:
> If you don't see two different types of indentation in one file as
> inconsistent, I think you need to look up consistency in a dictionary.

You're not wrong - but that's not the point. Personally I'd really prefer we 
had four spaces everywhere; I'm not entirely sure why we chose this convention 
in the first place. However, it's the convention we have now and changing it 
has serious implications - almost every recipe will have to be changed; 
backporting changes to stable releases will be made more difficult; submitted 
patches crossing the switch will be difficult to apply, history will be 
polluted, etc.

Changing this is not a small undertaking.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


