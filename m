Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TzrL8-0008UY-Q2
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 17:13:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2013 07:56:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,551,1355126400"; d="scan'208";a="253635316"
Received: from unknown (HELO helios.localnet) ([10.252.123.209])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2013 07:58:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 28 Jan 2013 15:58:04 +0000
Message-ID: <1440434.Jn4S7oh0Xd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.4 (Linux/3.5.0-22-generic; KDE/4.9.4; i686; ; )
In-Reply-To: <ly1ud5l3cg.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<1359385200.7131.11.camel@phil-desktop.brightsign>
	<ly1ud5l3cg.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base: make feature backfilling happen earlier
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
X-List-Received-Date: Mon, 28 Jan 2013 16:13:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 28 January 2013 16:44:15 Enrico Scholz wrote:
> Phil Blundell <pb@pbcl.net> writes:
> > This does seem rather like an abuse of DISTRO_FEATURES_BACKFILL.  Can
> > you explain why you are doing it this way rather than just setting
> > DISTRO_FEATURES directly to what you wanted?
> 
> I need a way to:
> 
> 1. set some defaults on distribution base and avoid nasty details like
>    mandatory ${DISTRO_FEATURES_LIBC} flags in the project configuration
> 
> 2. allow to override these defaults on a per-project base
> 
> 3. add features support by recipes/classes of my distribution
> 
> afaik, DISTRO_FEATURES_BACKFILL + _CONSIDERED exist to allow the first
> two point without an '-=' operator which lacks in bitbake.

No they don't. They exist to allow adding new features that should be enabled 
for all existing distro configs without each of those having to be changed, and 
provide a means for distros to opt out of that enabling if they wish.

> Of course, I could reinvent the wheel and write my own _CONSIDERED
> mechanism.  But until now (resp. without the '=' => '?=' change), it
> worked fine with DISTRO_FEATURES_BACKFILL.

We don't support using the backfill mechanism in this manner; so if it breaks 
you get to keep both pieces.

It's still not clear to me why you could not just set DISTRO_FEATURES 
directly. If you have values you're likely to want to remove, you can put them 
in separate variables that you can clear out later.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


