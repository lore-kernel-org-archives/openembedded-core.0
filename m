Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgfNn-0006Jm-H1
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 18:37:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Dec 2012 09:22:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,230,1355126400"; d="scan'208";a="177073118"
Received: from unknown (HELO helios.localnet) ([10.252.123.5])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Dec 2012 09:22:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 06 Dec 2012 17:22:42 +0000
Message-ID: <84679094.m94MdvPd6U@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <50C0D026.8050600@windriver.com>
References: <cover.1354650148.git.mark.hatle@windriver.com>
	<50C0286B.60406@linux.intel.com> <50C0D026.8050600@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Integrate Smart for RPM image generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 17:37:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 06 December 2012 11:04:38 Mark Hatle wrote:
> On 12/5/12 11:08 PM, Saul Wold wrote:
> > On 12/04/2012 11:49 AM, Mark Hatle wrote:
> >> The following patch set relies on the previous "Misc fixes" sent out
> >> earlier today.
> >> 
> >> The set replaces the existing rootfs generation with one based on Smart.
> >> The work was tested using buildhistory over a wide range of image types:
> >> core-image-minimal
> >> core-image-base
> >> core-image-basic
> >> core-image-lsb
> >> core-image-sato
> >> build-appliance
> > 
> > Did you try with the DISTRO = poky-lsb when doing the lsb build?  There
> 
> > are failures across the board with the LSB builds, see this example:
> There is no poky-lsb within oe-core, so no I did not.
> 
> Do you have a branch with this integrated into Poky, if so I can try to
> reproduce it locally.

I've just updated the poky-contrib paule/smart branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


