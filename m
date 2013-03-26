Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKXha-0000EH-Rs
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:30:31 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Mar 2013 10:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="219088521"
Received: from unknown (HELO helios.localnet) ([10.255.13.152])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Mar 2013 10:13:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 26 Mar 2013 17:13:24 +0000
Message-ID: <1538359.cY3zV3t8dQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <5151D55D.4050300@windriver.com>
References: <cover.1364316411.git.ross.burton@intel.com>
	<cb33f47af852b62bcb4cc816b10bcbe425bb5f34.1364316411.git.ross.burton@intel.com>
	<5151D55D.4050300@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/24] core-image-minimal-initramfs: don't install busybox-syslog
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
X-List-Received-Date: Tue, 26 Mar 2013 17:30:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 26 March 2013 12:05:33 Mark Hatle wrote:
> On 3/26/13 11:50 AM, Ross Burton wrote:
> > This uses BAD_RECOMMENDATIONS which isn't supported by all package
> > backends, but it's a start.
> 
> Since it's not supported in all backends, can you add a bugzilla to add
> support to the various backends?

FYI, Ross already filed one for RPM:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3916

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


