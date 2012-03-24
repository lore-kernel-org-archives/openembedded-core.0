Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SBQiX-0004dK-0k
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 14:09:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Mar 2012 06:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="124614895"
Received: from unknown (HELO helios.localnet) ([10.252.123.212])
	by orsmga002.jf.intel.com with ESMTP; 24 Mar 2012 06:00:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 24 Mar 2012 13:00:12 +0000
Message-ID: <2937662.gyefi2Imhp@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1203240842340.2840@oneiric>
References: <alpine.DEB.2.02.1203240842340.2840@oneiric>
MIME-Version: 1.0
Subject: Re: what means "FILES_${PN}_nylon"?
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
X-List-Received-Date: Sat, 24 Mar 2012 13:09:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 24 March 2012 08:43:53 Robert P. J. Day wrote:
>   meta/recipes-connectivity/ppp/ppp_2.4.5.bb:FILES_${PN}_nylon = ...

I think this is another distro override I missed when I did the cleanup at the 
time of the OE-Core split out, and should be removed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


