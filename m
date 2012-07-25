Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Styig-0005PC-2t
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 12:21:30 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 Jul 2012 03:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="126678151"
Received: from unknown (HELO helios.localnet) ([10.252.121.26])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Jul 2012 03:09:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Date: Wed, 25 Jul 2012 11:09:57 +0100
Message-ID: <17225760.ocbdZxpBHY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Package recipes change proposal (system-wide) - name wise
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
X-List-Received-Date: Wed, 25 Jul 2012 10:21:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 25 July 2012 07:23:31 Iorga, Cristian wrote:
> For me, having the version number contained in the name of package recipe is
> a little bit puzzling. For example: libpcre/libpcre_8.31.bb
> 
> Is there a solid technical reason to not have it like this?
> 
> libpcre/libpcre.bb
> and inside the recipe to have a PV variable defined:
> PV="8.31"

The benefit of having PV in the recipe file name is that you can then easily 
have different recipes for different versions of the same piece of software, 
which is particularly useful when those different versions may need to be built 
slightly differently.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


