Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CFBBC6D290
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 10:01:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Nov 2013 02:01:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,631,1378882800"; d="scan'208";a="427527680"
Received: from pauljbro-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.96])
	by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2013 02:01:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 04 Nov 2013 10:01:19 +0000
Message-ID: <1557371.bvju1MZl3L@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <527542CF.5040909@linux.intel.com>
References: <1383358116-997-1-git-send-email-raj.khem@gmail.com>
	<527542CF.5040909@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH V3] expect: Add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Nov 2013 10:01:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 02 November 2013 11:22:07 Saul Wold wrote:
> > +DEPENDS = "tcl"
> > +RDEPENDS_${PN} = "tcl"
> 
> You don't need an RDEPENDS_${PN} if it matches with the DEPENDS

For the sake of others reading, it's not as simple as that. DEPENDS is for 
build-time dependencies, RDEPENDS is for runtime dependencies; if tcl is 
needed both at build time and at runtime, and the runtime dependency isn't a 
shared library dependency, it would be valid to have both in the recipe. It 
depends on the situation.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

