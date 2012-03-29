Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SDO1b-0002Jt-8x
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 00:40:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Mar 2012 15:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="123314586"
Received: from unknown (HELO helios.localnet) ([10.252.123.240])
	by orsmga001.jf.intel.com with ESMTP; 29 Mar 2012 15:31:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	McClintock Matthew-B29882 <B29882@freescale.com>
Date: Thu, 29 Mar 2012 23:31:52 +0100
Message-ID: <2577166.UTuqosjzVt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CAEsOVNdZ5DrAb-HUq+0tTO8Jnf+_NbBRxV=KSLxAR_Gnr3Fc7g@mail.gmail.com>
References: <cover.1332952962.git.dexuan.cui@intel.com>
	<1333058859.18082.44.camel@ted>
	<CAEsOVNdZ5DrAb-HUq+0tTO8Jnf+_NbBRxV=KSLxAR_Gnr3Fc7g@mail.gmail.com>
MIME-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Re: [PATCH 0/1] genext2fs: support large files and filesystems without using large amounts of memor
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
X-List-Received-Date: Thu, 29 Mar 2012 22:40:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 29 March 2012 22:27:54 McClintock Matthew-B29882 wrote:
> Can fuse offer some option here?

Only if we could rely on fuse being available on everyone's system, which I'm 
not sure is the case.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


