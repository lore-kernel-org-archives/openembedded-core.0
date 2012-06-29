Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SkYxA-0002vY-1R
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 13:01:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jun 2012 03:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="162195603"
Received: from unknown (HELO helios.localnet) ([10.252.120.185])
	by azsmga001.ch.intel.com with ESMTP; 29 Jun 2012 03:50:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jun 2012 11:50:33 +0100
Message-ID: <1515296.CLmyHfUsyt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <4FED1743.4050203@gmail.com>
References: <cover.1340908084.git.paul.eggleton@linux.intel.com>
	<1fb664d76463830cf80997e2e13891adfff7a6eb.1340908084.git.paul.eggleton@linux.intel.com>
	<4FED1743.4050203@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] apr: fix incorrect size of pid_t
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
X-List-Received-Date: Fri, 29 Jun 2012 11:01:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 28 June 2012 19:47:31 Khem Raj wrote:
> I think this may not be correct thing for 64bit targets. You are
> better of adding this to appropriate site files.

pid_t is apparently always an int on Linux and our siteinfo files state that 
ac_cv_sizeof_int is 4 for every target. Nevertheless, if we see the need to 
define ac_cv_sizeof_int even though the value isn't currently different 
anywhere, it seems at least consistent to set ac_cv_sizeof_pid_t there as 
well.

However, I can't help feeling that these files are a bit of a mess and it's not 
totally clear to me where I should be putting this value. Should it go in 
common-linux? Or do I have to add it to the specific site file for every arch?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


