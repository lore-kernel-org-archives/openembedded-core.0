Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6E50D71ACA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 19:29:35 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP; 30 Nov 2016 11:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,574,1473145200"; d="scan'208";a="37351277"
Received: from abhijitr-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.93])
	by orsmga005.jf.intel.com with ESMTP; 30 Nov 2016 11:29:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, ed.bartosh@linux.intel.com
Date: Thu, 01 Dec 2016 08:29:31 +1300
Message-ID: <6146107.hgZcsOnPEO@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20161130152923.GA4811@linux.intel.com>
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<420c72b7-b5dd-14f3-a4b0-c57eb3512252@mender.io>
	<20161130152923.GA4811@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Wed, 30 Nov 2016 19:29:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 30 Nov 2016 17:29:23 Ed Bartosh wrote:
> On Wed, Nov 30, 2016 at 02:30:12PM +0100, Kristian Amlie wrote:
> > In the interest of saving me some build time, am I correct in assuming
> > that I need the "qemux86-64" MACHINE target for this to work? It appears
> > to be dependent on syslinux which has COMPATIBLE_HOSTS set to non-arm
> > only. Sorry, I'm a bit new to this framework.
> 
> You're right. oe-selftest requires qemux86-64 target.

That's definitely not a design decision of oe-selftest. If we have certain 
tests that can only work with a particular configuration, those tests need to 
be explicitly skipped if that configuration is not active.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

