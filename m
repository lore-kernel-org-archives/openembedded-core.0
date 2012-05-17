Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SV8Mp-0006W3-He
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 23:36:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 May 2012 14:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141850824"
Received: from unknown (HELO helios.localnet) ([10.252.120.128])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2012 14:26:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tom Rini <tom.rini@gmail.com>
Date: Thu, 17 May 2012 22:25:59 +0100
Message-ID: <2398024.EpgDMcMvMx@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <20120517211637.GD23562@bill-the-cat>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted>
	<20120517211637.GD23562@bill-the-cat>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Thu, 17 May 2012 21:36:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 17 May 2012 14:16:37 Tom Rini wrote:
> All that's happened is that meta-oe has been working as intended and put
> in a newer version of a recipe, before oe-core can move to it, and found
> problems that need to be addressed.

This is where I disagree - IMHO meta-oe should be split such that you can get 
the additional recipes in it without unexpected surprises like critical system 
components (like udev) being up-revved and then breakage resulting. There is 
some work needed to get to this point but we need to keep moving towards it I 
think.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


