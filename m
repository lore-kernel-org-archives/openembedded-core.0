Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RkZ1f-00035z-GT
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:33:55 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Jan 2012 02:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="96450338"
Received: from unknown (HELO helios.localnet) ([10.252.122.95])
	by orsmga002.jf.intel.com with ESMTP; 10 Jan 2012 02:26:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 10:26:23 +0000
Message-ID: <1326195469.B1rBFhU1YM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <1326190107.12160.45.camel@phil-desktop>
References: <20120110100306.GB3664@ad.chargestorm.se>
	<1326190107.12160.45.camel@phil-desktop>
MIME-Version: 1.0
Subject: Re: Preventing RRECOMMENDS from installing
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
X-List-Received-Date: Tue, 10 Jan 2012 10:33:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 January 2012 10:08:24 Phil Blundell wrote:
> On Tue, 2012-01-10 at 11:03 +0100, Anders Darander wrote:
> > Is there a simple way, in a bbappend-file to prevent packages in an
> > RRECOMMENDS from being installed? E.g. if package foo has:
> > RRECOMMENDS_${PN} += "bar"
> 
> If you mean you just want to stop them getting installed during rootfs
> construction, you can achieve that by declaring them to be
> BAD_RECOMMENDATIONS.

FWIW, it should be noted that this currently works for ipk packaging only.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


