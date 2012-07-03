Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sm8op-00056p-IY
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 21:31:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2012 12:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188087287"
Received: from unknown (HELO helios.localnet) ([10.252.120.234])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2012 12:20:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 03 Jul 2012 20:20:23 +0100
Message-ID: <1484893.ioyN9DmM2T@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-26-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <4FF3310A.6000000@windriver.com>
References: <4FF320DD.8090301@palm.com> <20120703174702.GD3771@jama.jama.net>
	<4FF3310A.6000000@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: local.conf & bblayers.conf changes...
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
X-List-Received-Date: Tue, 03 Jul 2012 19:31:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 03 July 2012 12:51:06 Mark Hatle wrote:
> It has to be := and not .=.  If it's not immediately resolved, then
> ${LAYERDIR} will go to undefined later.

I previously thought this too, but it turns out that because we call 
data.expandVarref('LAYERDIR') in the bitbake layer handling code, these 
references are expanded immediately after parsing each layer config file, so the 
:= is not needed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


