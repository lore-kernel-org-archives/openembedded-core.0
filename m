Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QBkd8-0005lG-9F
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 11:20:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Apr 2011 02:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,231,1301900400"; d="scan'208";a="911016696"
Received: from unknown (HELO helios.localnet) ([10.255.12.202])
	by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2011 02:18:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: poky@yoctoproject.org
Date: Mon, 18 Apr 2011 10:17:59 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic-pae; KDE/4.6.1; i686; ; )
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
	<72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
	<4DA88DE3.2050702@linux.intel.com>
In-Reply-To: <4DA88DE3.2050702@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201104181017.59589.paul.eggleton@linux.intel.com>
Cc: "Wold, Saul" <saul.wold@intel.com>,
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
X-List-Received-Date: Mon, 18 Apr 2011 09:20:26 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 15 April 2011 19:26:43 Saul Wold wrote:
> There was some initial discussion at ELC this last week about what goes
> where and how layers are going to work moving forward.  I know that we
> are committed to the qemu* machines in oe-core (meta), and that
> currently meta-yocto contains a set of core HW (beagleboard among them),
> so the question then is should the HW specific stuff, such as this patch
> move to meta-yocto or some other layer?  There are a couple other
> recipes such as x-load and formfactor that contain HW specific files.

Ah, yes, you're right - we definitely don't want this file in oe-core. I should 
have pushed this particular patch to meta-yocto (in support of the 
basic/temporary beagleboard support we have there), so please ignore this one.

Cheers,
Paul


