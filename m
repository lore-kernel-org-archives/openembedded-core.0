Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SEnkm-00020K-2i
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 22:21:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Apr 2012 13:12:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="84470706"
Received: from unknown (HELO helios.localnet) ([10.252.120.26])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Apr 2012 13:12:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 02 Apr 2012 21:12:12 +0100
Message-ID: <2119548.Y71LEXUF5X@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <20120402200015.GA26494@sakrah.homelinux.org>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<e4d001f8c6f8945c8c70c2558ad5f9e1fd85dfad.1331685330.git.paul.eggleton@linux.intel.com>
	<20120402200015.GA26494@sakrah.homelinux.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] scripts/bitbake: ensure user is in build directory
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
X-List-Received-Date: Mon, 02 Apr 2012 20:21:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 02 April 2012 13:00:15 Khem Raj wrote:
> On (14/03/12 00:36), Paul Eggleton wrote:
> > If the user is in any directory other than $BUILDDIR when the bitbake
> > wrapper script is run, then show an error an exit.
> > 
> > Fixes [YOCTO #2071].
> 
> angstrom e.g. does not have this restriction but uses script/bitbake
> so this fix seems to be wrong here since its specific to OE-Core's
> default build env.

This has been implemented differently now:

http://cgit.openembedded.org/openembedded-core/commit/?id=769384decb095fb3c49eb13b8f7f69c978d0bcba

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


