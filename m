Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Slfdd-00080y-2B
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 14:21:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 05:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163077804"
Received: from unknown (HELO helios.localnet) ([10.252.120.232])
	by azsmga001.ch.intel.com with ESMTP; 02 Jul 2012 05:10:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 02 Jul 2012 13:10:53 +0100
Message-ID: <2305047.YA09gvIVbH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-26-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1207020726170.23135@oneiric>
References: <alpine.DEB.2.02.1206300602360.13626@oneiric>
	<1341219932.23146.187.camel@ted>
	<alpine.DEB.2.02.1207020726170.23135@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: is the PRIORITY variable actually used anywhere?
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
X-List-Received-Date: Mon, 02 Jul 2012 12:21:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 02 July 2012 07:29:08 Robert P. J. Day wrote:
>   oelint.bbclass currently suggests it can be any of "standard",
> "required", "optional" or "extra".  and perhaps a dumb question -- how
> are there *two* default values?  not sure what that means.

It's worth pointing out that oelint.bbclass is somewhat out-of-date with 
current practice, so I would take anything you find in it with a pinch of salt.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


