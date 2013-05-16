Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1UcuUg-0000sb-Rp; Thu, 16 May 2013 11:29:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2013 02:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,683,1363158000"; d="scan'208";a="338198842"
Received: from unknown (HELO helios.localnet) ([10.255.12.131])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2013 02:10:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 May 2013 10:10:45 +0100
Message-ID: <24887939.8KrA2KDk4J@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <20130516085954.GC24809@jama.dyndns-home.com>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<2253707.h5Yg7SAvOu@helios>
	<20130516085954.GC24809@jama.dyndns-home.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Thu, 16 May 2013 09:29:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 16 May 2013 10:59:54 Martin Jansa wrote:
> On Thu, May 16, 2013 at 09:29:48AM +0100, Paul Eggleton wrote:
> > On Thursday 16 May 2013 08:31:33 Koen Kooi wrote:
> > > Removing layers is pretty much impossible, though.
> > 
> > With PRINC gone would there be any other issue that would make removing
> > layers a problem?
> 
> Does PR service really fix removing layers? I don't think so, if you add
> layer and checksum of foo is changed AUTOPR is incremented, but then you
> remove the layer and the checksum is unfortunately the same as what you
> had before AUTOPR will go backwards.

Then I would have to say if that's not the behaviour you want we should change 
it or at least make it optional to force it to always increment even if the 
checksum is the same as a previous value.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


