Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0DoJ-0004Qd-RX
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 16:08:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Feb 2012 07:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120100494"
Received: from unknown (HELO helios.localnet) ([10.252.123.31])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2012 07:00:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 15:00:28 +0000
Message-ID: <3560864.DXtqnyRg82@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <4F450191.20609@opendreambox.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
	<1329917474.20261.142.camel@ted> <4F450191.20609@opendreambox.org>
MIME-Version: 1.0
Subject: Re: [RFC][PATCH 0/5] drop dependency on GNOME if x11 is disabled
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
X-List-Received-Date: Wed, 22 Feb 2012 15:08:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 22 February 2012 15:54:09 Andreas Oberritter wrote:
> Nevertheless, I understand that 'x11' isn't appropriate. The upside of
> using 'x11' was that it wouldn't break distributions, like new flags
> would do.

Incidentally, I sent an RFC patch yesterday to add a mechanism to make it 
possible to add new DISTRO_FEATURES without breaking existing distro 
configurations. So far I haven't had any comments.
 
Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


