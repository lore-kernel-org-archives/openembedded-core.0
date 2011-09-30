Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R9hm6-0000d9-C2
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 20:25:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Sep 2011 11:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,468,1312182000"; d="scan'208";a="57487566"
Received: from unknown (HELO [10.255.15.62]) ([10.255.15.62])
	by azsmga001.ch.intel.com with ESMTP; 30 Sep 2011 11:19:59 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 11:19:54 -0700
In-Reply-To: <1317319633.2134.1.camel@scimitar>
References: <1317307935.12332.89.camel@ted> <1317319633.2134.1.camel@scimitar>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1317406800.11645.23.camel@scimitar>
Mime-Version: 1.0
Subject: Re: autotools: Remove help2man dependency
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
X-List-Received-Date: Fri, 30 Sep 2011 18:25:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-29 at 11:07 -0700, Joshua Lock wrote:
> On Thu, 2011-09-29 at 15:52 +0100, Richard Purdie wrote:
> > The help2man script is pretty useless to us. It requires to run the target
> > binary to extract help information which is not possible for any of our
> > cross compiled target binaries.
> > 
> > We're not interested in man pages for -cross/-native tools.
> > 
> > It therefore makes no sense to have this as a core build dependency.
> > 
> > This patch removes the dependeny and replaces it with a script
> > returning false. This will trigger autotool's missing utility
> > to use the copy of the man page included with the sources which
> > is what would already happen when we tried to run cross compiled
> > binaries anyway.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> 
> Great!

By way of a follow on this patch "resolves" Yocto #1533 by no longer
calling help2man on the host.

http://bugzilla.yoctoproject.org/show_bug.cgi?id=1533

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



