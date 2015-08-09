Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E9A01766E8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Aug 2015 21:30:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 09 Aug 2015 14:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,641,1432623600"; d="scan'208";a="765229421"
Received: from pbenavol-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.136])
	by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2015 14:30:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 09 Aug 2015 22:30:32 +0100
Message-ID: <6888320.kH9hAkXKUb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAMKF1srqaXwG8v+FJz0G2M3ys9ArcWD1fkX_7h3F8z1AZqi3oA@mail.gmail.com>
References: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
	<1981963.0BZJNaCbRs@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1srqaXwG8v+FJz0G2M3ys9ArcWD1fkX_7h3F8z1AZqi3oA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] dosfstools-2.11: Fix memory leak in mkdosfs
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
X-List-Received-Date: Sun, 09 Aug 2015 21:30:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 09 August 2015 10:03:25 Khem Raj wrote:
> On Aug 9, 2015 9:21 AM, "Paul Eggleton" <paul.eggleton@linux.intel.com>
> wrote:
> > On Saturday 08 August 2015 11:54:45 Khem Raj wrote:
> > > > On Aug 7, 2015, at 12:54 PM, Paul Eggleton <
> paul.eggleton@linux.intel.com>
> > > > wrote:>
> > > > 
> > > > On Friday 07 August 2015 12:26:56 Khem Raj wrote:
> > > >>> On Aug 7, 2015, at 2:51 AM, Paul Eggleton
> > > >>> <paul.eggleton@linux.intel.com>
> > > >>> wrote:>
> > > >> devtool modify dosfstools -x ~/projects/dosfstools
> > > >> ERROR: This script can only be run after initialising the build
> > > >> environment
> > > >> (e.g. by using oe-init-build-env)
> > > >> 
> > > >> so is it must now to use the setup script ? or can be extract some
> > > >> needed setup from it to let it work with setups not using the init
> > > >> script
> > > >
> > > > Well it needs to be able to run bitbake internally (directly and using
> > > > tinfoil), hence the need to have the environment set up to do so. I
> > > > don't really see a way around that.
> > > 
> > > Then limited use of  devtool should be documented as available
> > 
> > How is this limited? It operates under the same conditions as bitbake
> > itself does.
> 
> Your last email indicated as if it always needs internal build environment.
> If that's not the case then it's what I was requesting for the settings
> that are required to execute it provided bitbake is in path and is building
> fine but it's not using the settings provided by setup environment script

There aren't any special settings though - if you can run bitbake, you should 
be able to run devtool. If you're getting the error you pasted, it's because 
BUILDDIR is not set.

I just fetched Angstrom's setup-scripts, checked out the angstrom-v2015.06-
yocto1.8 branch, and ran through the steps mentioned in the README. 
Unfortunately it didn't check out all the layers successfully (someone should 
probably look at that...) once I tweaked bblayers.conf to remove the missing 
layers, devtool ran just fine. (Of course as part of setting up I had run 
. environment-angstrom - you are doing that, right?)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

