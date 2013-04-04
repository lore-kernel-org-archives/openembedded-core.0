Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UNmfE-0002hf-JG
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 18:05:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Apr 2013 08:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,409,1363158000"; d="scan'208";a="280825630"
Received: from unknown (HELO helios.localnet) ([10.255.13.167])
	by azsmga001.ch.intel.com with ESMTP; 04 Apr 2013 08:48:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 04 Apr 2013 16:48:08 +0100
Message-ID: <1433160.8b2eM7nW6I@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <20130404153930.GD1271@jama.dyndns-home.com>
References: <20130320202206.GD3220@jama>
	<1364984074-3636-1-git-send-email-Martin.Jansa@gmail.com>
	<20130404153930.GD1271@jama.dyndns-home.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/2] packagedata: show error when there are multiple pkgdata directories
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
X-List-Received-Date: Thu, 04 Apr 2013 16:05:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 04 April 2013 17:39:30 Martin Jansa wrote:
> On Wed, Apr 03, 2013 at 12:14:33PM +0200, Martin Jansa wrote:
> > * when PACKAGE_ARCH is changed e.g. from MACHINE_ARCH to TUNE_PKGARCH
> > 
> >   get_subpkgedata_fn is still reading old MACHINE_ARCH directory instead
> >   of newer with TUNE_PKGARCH
> This is too strict in some cases, e.g.:
> 
> ERROR: More then one pkgdata dir found for pkg 'opkg-collateral'
> (
> '/OE/shr-core/tmp-eglibc/pkgdata/cortexa8-vfp-neon-oe-linux-gnueabi/runtime/
> opkg-collateral',
> '/OE/shr-core/tmp-eglibc/pkgdata/armv5te-oe-linux-gnueabi/runtime/opkg-coll
> ateral'), returning first
> 
> Why do we need to look in all pkgdatadirs? Why not just PACKAGE_ARCH?

So this code may well not be doing the right thing, but PACKAGE_ARCH won't 
work either because this is called to get a list of all packages not just one, 
and we therefore have no context to know PACKAGE_ARCH.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


