Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Tpnnf-0005dN-EK
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 23:26:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 31 Dec 2012 14:09:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,387,1355126400"; d="scan'208";a="265567981"
Received: from unknown (HELO helios.localnet) ([10.252.123.27])
	by orsmga002.jf.intel.com with ESMTP; 31 Dec 2012 14:10:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Radu Moisan <radu.moisan@intel.com>
Date: Mon, 31 Dec 2012 22:10:33 +0000
Message-ID: <4078626.EH4CM1sFWo@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <50DDABA4.70309@intel.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
	<50D8FDBE.4030203@linux.intel.com> <50DDABA4.70309@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28][RFC] systemd Integration
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
X-List-Received-Date: Mon, 31 Dec 2012 22:26:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 December 2012 16:24:36 Radu Moisan wrote:
> On 12/25/2012 03:13 AM, Saul Wold wrote:
> > Also, you do not provide very clear information at the beginning, but
> > I assume to enable systemd, it's just setting DISTRO_FEATURE +=
> > "systemd", or is there more?
> 
> DISTRO_FEATURES_INITMAN = "systemd" it's all you need. DISTRO_FEATURE +=
> "systemd" might also work in some extent since I'm checking against
> DISTRO_FEATURES, however there are variables like
> VIRTUAL_RUNTIME_init_manager (which is inherited legacy) which get set
> from DISTRO_FEATURES_INITMAN. The way to go is with DISTRO_FEATURES_INITMAN.

Can you explain why we need another variable for this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


