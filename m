Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QBkXx-0005gl-16
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 11:15:05 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Apr 2011 02:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,231,1301900400"; d="scan'208";a="911015091"
Received: from unknown (HELO helios.localnet) ([10.255.12.202])
	by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2011 02:12:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: poky@yoctoproject.org
Date: Mon, 18 Apr 2011 10:12:13 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic-pae; KDE/4.6.1; i686; ; )
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
	<4DA8CA18.3000801@mlbassoc.com> <4DA8CE4A.6090408@linux.intel.com>
In-Reply-To: <4DA8CE4A.6090408@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201104181012.13920.paul.eggleton@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 2/3] netbase: automatically bring up usb0 on beagleboard
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
X-List-Received-Date: Mon, 18 Apr 2011 09:15:05 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 16 April 2011 00:01:30 Darren Hart wrote:
> On 04/15/2011 03:43 PM, Gary Thomas wrote:
> > eth1 yes, but doesn't the BeagleBoard xM have eth0?
> 
> No. The onboard device is usb0.

Looks like we're not the only ones confused by this:

https://bugs.launchpad.net/linux-linaro/+bug/622429

-- 

Paul Eggleton
Intel Open Source Technology Centre (UK)


