Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QbWCH-0005GH-QJ
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 13:11:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Jun 2011 04:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,437,1304319600"; d="scan'208";a="19664004"
Received: from unknown (HELO helios.localnet) ([10.255.17.88])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2011 04:07:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 12:07:23 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1309239001.git.dexuan.cui@intel.com>
	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
In-Reply-To: <3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201106281207.23516.paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Tue, 28 Jun 2011 11:11:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 28 June 2011 07:45:09 Koen Kooi wrote:
> So it works as expected, but the output is a bit confusing. I have a few
> (conflicting) suggestions:
> 
> 1) replace _BRANCH and _REVISION with ' branch' and ' revision', e.g.:
> 
> 	meta-archos branch          = "master"
> 	meta-archos revision        = "413933fb5f62574e38a9a1e38905ba6e9c1be4ad"
> 
> 2) for the extra layers put branch and revision on a single line:
> 
> 	meta-archos          = "master/413933fb5f62574e38a9a1e38905ba6e9c1be4ad"

I'd go with option 2 over 1, personally - the list gets rather long on 
something like Angstrom, better to keep it short.
 
> 3) Move the revision info down, e..g
> 
> OE Build Configuration:
> BB_VERSION                  = "1.13.1"
> TARGET_ARCH                 = "arm"
> TARGET_OS                   = "linux-gnueabi"
> MACHINE                     = "beagleboard"
> DISTRO                      = "angstrom"
> DISTRO_VERSION              = "v2011.06-core"
> TARGET_FPU                  = "hard"
> METADATA_BRANCH             = "master"
> METADATA_REVISION           = "364ca0d2d0399c8cc6d3b3fc28308e1e14673544"
> meta-angstrom_BRANCH        = "master"
> meta-angstrom_REVISION      = "c19c342c62416752117c2dce4696840bc864f647"
> 
> etc.
> 
> What do you think about that?

Sounds good to me.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


