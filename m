Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6731961788
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:19:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Sep 2013 05:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="373890307"
Received: from unknown (HELO helios.localnet) ([10.252.123.106])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2013 05:19:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <philb@brightsign.biz>,
	Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 05 Sep 2013 13:19:05 +0100
Message-ID: <3518999.x3yV6XY4Eo@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1378382840.6940.78.camel@phil-desktop.brightsign>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<20130905115913.GC17481@lpalcu-linux>
	<1378382840.6940.78.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 12:19:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 05 September 2013 13:07:20 Phil Blundell wrote:
> On Thu, 2013-09-05 at 06:59 -0500, Laurentiu Palcu wrote:
> > On Thu, Sep 05, 2013 at 12:40:26PM +0100, Phil Blundell wrote:
> > > Actually, that last sentence is slightly incorrect.  image.bbclass does
> > > have the knowledge, it just seems to be failing to act on it.  So
> > > perhaps the easiest fix for the time being is simply to move the
> > > remove_packaging_data_files call in rootfs_uninstall_unneeded () a few
> > > lines higher up so that it's inside the "if [ -z $(delayed_postinsts) ]"
> > > block.
> > 
> > What you're suggesting means that we will have the PM metadata present
> > if there are delayed postinstalls present. But, since the PM is not
> > present, what's the use of that?
> 
> Well, er, that it will make the postinstalls work.  Isn't that exactly
> the problem here?

I'm clearly missing something here. If we have a generic mechanism to run 
postinstall scripts now, and "package-management" is not in IMAGE_FEATURES, 
why do we need or want the package manager to be in control of running the 
postinstalls?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

