Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StbpM-0004lI-8t
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 11:54:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jul 2012 02:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="184833090"
Received: from unknown (HELO helios.localnet) ([10.252.121.60])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2012 02:43:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 24 Jul 2012 10:43:21 +0100
Message-ID: <1906764.DupgyPkgTn@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <CA+chaQdQwBe9Z7Np9fqGXGbC1Ghe9MFAP0E2vOFEM-MiTWb4eg@mail.gmail.com>
References: <alpine.DEB.2.02.1207240455440.18822@oneiric>
	<1610928.T7hSJDQ7P6@helios>
	<CA+chaQdQwBe9Z7Np9fqGXGbC1Ghe9MFAP0E2vOFEM-MiTWb4eg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: more pedantry: inconsistent presentation of how to introduce layers
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
X-List-Received-Date: Tue, 24 Jul 2012 09:54:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 July 2012 11:29:26 Martin Jansa wrote:
> > As I mentioned before, the priority currently has no bearing on the order
> > of BBPATH - that is determined by the order in which the layer conf files
> > are parsed and (as you highlight) whether they prepend or append to
> > BBPATH. Remember that the BBPATH only affects how class and conf files
> > are found - it does not have anything to do with recipes.
> 
> And order of .bbappends applied, no? In case some recipe has
> .bbappends in multiple layers and
> later layer is trying to override some setting which is also altered
> by some bbappend in layer between.

No. The order of bbappend application is layer priority order, or if bbappends 
for the same recipe are in layers with the same layer priority, the order is 
the order in which the layers are parsed (= the order in which the layers 
appear in bblayers.conf).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


