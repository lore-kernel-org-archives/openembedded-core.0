Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SEoR7-00034v-Iv
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 23:05:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Apr 2012 13:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="84491033"
Received: from unknown (HELO helios.localnet) ([10.252.120.26])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Apr 2012 13:56:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>
Date: Mon, 02 Apr 2012 21:56:01 +0100
Message-ID: <9212261.tfl0GIN7V6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CABcZANmXVJe1Jw005U5u3USmZeMC9vjwOFCBQABA3moKcN5A9g@mail.gmail.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<2119548.Y71LEXUF5X@helios>
	<CABcZANmXVJe1Jw005U5u3USmZeMC9vjwOFCBQABA3moKcN5A9g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] scripts/bitbake: ensure user is in build directory
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
X-List-Received-Date: Mon, 02 Apr 2012 21:05:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 02 April 2012 13:32:15 Chris Larson wrote:
> On Mon, Apr 2, 2012 at 1:12 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > This has been implemented differently now:
> > 
> > http://cgit.openembedded.org/openembedded-core/commit/?id=769384decb095fb3
> > c49eb13b8f7f69c978d0bcba
> This'll break the ability to run bitbake from subdirs underneath
> BUILDDIR, which is perfectly valid, and supported by bitbake's code
> which traverses up the current working path to find
> conf/bblayers.conf.

I don't know if you've tried this recently but it no longer works with current 
versions of OE-Core and bitbake (can't find local.conf). I'm not exactly sure 
why not and it's likely we should fix it, but right now it's broken anyway.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


