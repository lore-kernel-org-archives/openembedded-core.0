Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QvnPu-0005Nw-BB
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 11:37:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Aug 2011 02:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,268,1312182000"; d="scan'208";a="44138406"
Received: from unknown (HELO helios.localnet) ([10.255.18.129])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2011 02:32:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2011 10:32:19 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
	<20110823064454.GA8170@chargestorm.se>
	<1314091333.6733.311.camel@phil-desktop>
In-Reply-To: <1314091333.6733.311.camel@phil-desktop>
MIME-Version: 1.0
Message-Id: <201108231032.19140.paul.eggleton@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] image.bbclass, kernel.bbclass: create warning file about deleting deploydir files
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
X-List-Received-Date: Tue, 23 Aug 2011 09:37:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 23 August 2011 10:22:12 Phil Blundell wrote:
> Irrespective of whether it happens to work or not on some or other
> distro, "cp -n" isn't POSIX and we shouldn't be relying on it.
> 
> I can't really see why the -n option is needed here anyway.  It looks to
> me like it could just be removed with no ill effects.

Sorry, I wasn't aware that it was a non-standard option. I'll post a new 
version with it removed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


