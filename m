Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 19A5F6007B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 14:58:10 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Jul 2013 07:58:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,974,1363158000"; d="scan'208";a="325244910"
Received: from unknown (HELO helios.localnet) ([10.252.121.225])
	by azsmga001.ch.intel.com with ESMTP; 01 Jul 2013 07:58:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 01 Jul 2013 15:58:08 +0100
Message-ID: <6242225.xYeWPdnF8o@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CAJTo0LbtyiNhLKvfnn7dE-mUckef7c10wdpj2OKjb5UfrAek5Q@mail.gmail.com>
References: <1372372997-1604-1-git-send-email-sgw@linux.intel.com>
	<2393683.pgSWLXlTRj@helios>
	<CAJTo0LbtyiNhLKvfnn7dE-mUckef7c10wdpj2OKjb5UfrAek5Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] packagegroup-core-boot: used udev-cache for sysvinit
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
X-List-Received-Date: Mon, 01 Jul 2013 14:58:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 01 July 2013 15:49:00 Burton, Ross wrote:
> On 28 June 2013 11:02, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> > I appreciate the intention here but I'm not sure if this is really the
> > appropriate place to put this; packagegroup-core-boot is supposed to only
> > directly pull in the essentials required for booting. This will cause
> > problems for those people using alternative device managers (e.g. busybox
> > mdev) as well.
> > 
> > I'm not sure where this should go, but adding it to VIRTUAL-
> > RUNTIME_dev_manager (in the distro config?) could work. Anyone else have
> > any better suggestion?
> 
> How about making udev RRECOMMEND udev-cache?

It's not that udev-cache might not be available, rather that packagegroup-
core-boot shouldn't have any kind of reference to it. In any case unless udev 
is skipped somehow, an RRECOMMENDS on udev-cache will end up building udev 
even if you haven't selected it in VIRTUAL-RUNTIME_dev_manager so that won't 
help.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

