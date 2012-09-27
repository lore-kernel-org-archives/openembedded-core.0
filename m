Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1THFvo-0008Mm-FA
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:23:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Sep 2012 08:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="198597350"
Received: from unknown (HELO helios.localnet) ([10.252.122.29])
	by orsmga001.jf.intel.com with ESMTP; 27 Sep 2012 08:10:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Sep 2012 16:10:20 +0100
Message-ID: <2523654.gPkJCTUPfL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <cover.1348697518.git.Martin.Jansa@gmail.com>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] qt4: upgrade to 4.8.3 and cleanup
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
X-List-Received-Date: Thu, 27 Sep 2012 15:23:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 27 September 2012 00:27:05 Martin Jansa wrote:
> Please test on more architectures.
> I've tested complete qt4-native + qt4-free-x11 on armv4t.
> And only do_patch for nativesdk-qt4-tools, qt-mobility-*, qt4-embedded.

So this is great work and these patches look good, although I'm still not 
particularly happy with breaking out so many of the configure options because 
I'm convinced it won't stop here; but it's possible I might be overruled on 
this issue. 

The bigger problem is when these patches are arriving - we're late into the 
stabilisation period and given the choice I'd prefer not to merge them until 
the next development cycle.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


