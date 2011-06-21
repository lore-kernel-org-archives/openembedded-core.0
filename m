Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QZ585-0001PC-Li
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 19:52:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jun 2011 10:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,402,1304319600"; d="scan'208";a="16468333"
Received: from unknown (HELO helios.localnet) ([10.255.17.54])
	by orsmga002.jf.intel.com with ESMTP; 21 Jun 2011 10:49:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 18:49:13 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1308677220.git.paul.eggleton@linux.intel.com>
	<1046625816b98aaab44b810e2376ed3689a2af5f.1308677220.git.paul.eggleton@linux.intel.com>
	<1308677603.2218.8.camel@scimitar>
In-Reply-To: <1308677603.2218.8.camel@scimitar>
MIME-Version: 1.0
Message-Id: <201106211849.13735.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] u-boot: set SRCREV to a git revision instead of a tag reference
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
X-List-Received-Date: Tue, 21 Jun 2011 17:52:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 21 June 2011 18:33:17 Joshua Lock wrote:
> Great work tracking this down!

Thanks, actually Dexuan gets the credit for at least pointing me in the right 
direction.

> I wonder if it's worth mentioning in the metadata that the revision
> corresponds to the tag?

Done, have updated the contrib branch:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=paule/fix-
uboot-srcrev

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


