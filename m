Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StxOO-0003Xl-JB
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 10:56:28 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2012 01:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="185733620"
Received: from unknown (HELO helios.localnet) ([10.252.121.26])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2012 01:44:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 09:44:57 +0100
Message-ID: <2297267.NMWxXh5jl4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <cover.1343079550.git.paul.eggleton@linux.intel.com>
References: <cover.1343079550.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: Re: [PATCH 0/6] rootfs generation improvements v2
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
X-List-Received-Date: Wed, 25 Jul 2012 08:56:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 23 July 2012 22:42:23 Paul Eggleton wrote:
> Paul Eggleton (5):
>   classes/rootfs_rpm: improve speed of RPM rootfs construction

Seems rpmresolve was missing a DEPENDS on rpm - oops! I've fixed this, and 
rebased and pushed a new paule/rootfs2 branch to openembedded-core-contrib.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


