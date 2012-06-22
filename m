Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Si5HS-00052h-3p
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:56:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jun 2012 07:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="168958730"
Received: from unknown (HELO helios.localnet) ([10.252.120.123])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2012 07:45:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Jun 2012 15:45:24 +0100
Message-ID: <1722786.sz61Qr6Lvv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <20120622143812.GO9352@jama.jama.net>
References: <alpine.DEB.2.02.1206210454080.17361@oneiric>
	<1340375063.394.39.camel@ted> <20120622143812.GO9352@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: superfluous download locations in oe-core's bitbake.conf
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
X-List-Received-Date: Fri, 22 Jun 2012 14:56:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 22 June 2012 16:38:12 Martin Jansa wrote:
> Is there easy way for layer to define additional MIRRORs with global
> scope for layer? e.g. putting them layer.conf?

I believe that works yes.

> e.g. FREESMARTPHONE_GIT is used in few recipes in meta-oe and in many in
> meta-fso layer and right now is only defined but not used in oe-core.
> 
> So moving FREESMARTPHONE_GIT definition from oe-core to meta-oe will add
> aditional dependency on meta-oe, but still better then duplicating it in
> both layer or even in many .inc files.

I don't think we want to remove any that are going to cause that kind of pain. 
If the value is still valid and more than one layer is using the variable then 
it's reasonable to keep there. On the other hand, if it's invalid or only one 
layer is likely to ever use it (e.g. the Opie ones that I removed earlier) 
then it's a candidate for moving out, IMHO.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


