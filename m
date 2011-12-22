Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RdnYu-0007lT-55
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 19:40:16 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Dec 2011 10:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99392275"
Received: from unknown (HELO helios.localnet) ([10.252.122.57])
	by fmsmga001.fm.intel.com with ESMTP; 22 Dec 2011 10:33:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 18:33:05 +0000
Message-ID: <2359656.ub2hYRIHg6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
MIME-Version: 1.0
Subject: Internal compiler error
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
X-List-Received-Date: Thu, 22 Dec 2011 18:40:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Nitin/Khem/all,

We saw a failure on the Yocto Project autobuilder recently which appears to be 
the result of an internal compiler error [1] (note this is with the edison 
branch of Yocto, so it's somewhat older than what we have in master). Some 
searching brought up a Linaro gcc bug that looks remarkably similar [2].

Do you guys know anything about this? Do we need to bring in the fix from the 
bug report above?

Cheers,
Paul

[1] http://autobuilder.yoctoproject.org:8010/builders/nightly-
arm/builds/232/steps/shell_81/logs/stdio
[2] https://bugs.launchpad.net/gcc-linaro/+bug/723185

-- 

Paul Eggleton
Intel Open Source Technology Centre


