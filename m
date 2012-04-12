Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SILHU-0007dW-0c
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 16:45:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Apr 2012 07:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="152825959"
Received: from unknown (HELO helios.localnet) ([10.252.120.59])
	by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2012 07:36:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Date: Thu, 12 Apr 2012 15:36:28 +0100
Message-ID: <1711875.SIkgiBNdgV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4F86E3FF.3050905@communistcode.co.uk>
References: <1334238147-15338-1-git-send-email-ml@communistcode.co.uk>
	<2244DB0D-6E70-4128-BBBA-EFABB2C489EE@dominion.thruhere.net>
	<4F86E3FF.3050905@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] New recipe - jansson, C library for encoding, decoding and manipulating JSON data
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
X-List-Received-Date: Thu, 12 Apr 2012 14:45:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 12 April 2012 15:17:35 Jack Mitchell wrote:
> It was in oe-classic so I believed it would be useful to port it over
> oe-core. I thought that the location I chose was the most suitable place
> for it. There doesn't seem to be a general 'user-cotrib/devel' layer
> into which these packages can go, I was unsure of it's relevance but a
> patch declined is a patch archived, right?

I think that this recipe is definitely useful, but there's a question as to 
where the best place for it is. FYI, the (loose) criteria for something being 
included in OE-Core itself is it is either something everyone will need or it 
is something needed by something else in OE-Core.

If there isn't an obvious place then meta-oe is where it should probably go.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


