Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RnutF-0000qa-7I
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 17:31:05 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Jan 2012 08:23:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97597025"
Received: from unknown (HELO helios.localnet) ([10.252.122.198])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 08:23:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 19 Jan 2012 16:22:59 +0000
Message-ID: <3942902.xzUfbUZCA0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <4F183F80.8060508@windriver.com>
References: <1326978483.2511.68.camel@ted> <3069877.zIVnnZc8iy@helios>
	<4F183F80.8060508@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Buildhistory in action
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
X-List-Received-Date: Thu, 19 Jan 2012 16:31:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 19 January 2012 10:06:24 Mark Hatle wrote:
> Does the build history due any scanning of either package or shared library
> dependencies?

For packages, it relies on the output of do_package, however this includes the 
final value of RDEPENDS which is influenced by shared library dependencies.

> I hit a case recently working on a custom layer, where everything built
> properly, I made a few changes and I happened to notice by accident that it
> was no longer linking to the shared library, but instead the static
> library.  This changed both the package (runtime) dependencies and the
> shared library usage in the problem... the resulting binary suddenly jumped
> in size as well.

If the runtime package dependency doesn't change as a result then we wouldn't 
notice the change the way it currently works; however for this specific issue 
it did so we would have. We would also have picked up the jump in package size 
if it was over a specified threshold (currently 20%, it's possible this value 
may need some tweaking).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


