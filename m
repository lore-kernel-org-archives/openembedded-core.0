Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDD16007C;
	Thu, 20 Jun 2013 10:16:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Jun 2013 03:16:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,903,1363158000"; d="scan'208";a="356670888"
Received: from unknown (HELO helios.localnet) ([10.252.122.59])
	by orsmga002.jf.intel.com with ESMTP; 20 Jun 2013 03:16:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jun 2013 11:16:37 +0100
Message-ID: <3004132.t7dk9348rv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CANyK_8eXUptxF52CmcJftYZD+oht4gfkDfRsbY3gOnmTRwyzaQ@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<FB95243C-761D-4268-96A1-B0893DA616AF@gmail.com>
	<CANyK_8eXUptxF52CmcJftYZD+oht4gfkDfRsbY3gOnmTRwyzaQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Thu, 20 Jun 2013 10:16:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 20 June 2013 10:39:13 Paul Barker wrote:
> >> mplayer2 is failing to find <mad.h>, this needs the same sort of fix I
> >> made to vlc
> >> (http://git.openembedded.org/meta-openembedded/commit/?id=3d6369b7c39d78
> >> b0d424dbe5a97e736b694e3c48).
> >> 
> >> Full logs, conf files, etc:
> >> http://www.paulbarker.me.uk/yocto/20130617_poky/> 
> > I think missing dependencies. Best is to turn this into PACKAGECONFIG
> 
> The dependencies are enabled if ENTERPRISE_DISTRO=0 but I'm building
> with it set to 1. However mplayer2 is still looking for them, much
> like vlc did.
> 
> I could remove the ENTERPRISE_DISTRO logic and replace it all with
> PACKAGECONFIG options but it would lead to a "Nothing PROVIDES" error
> if a PACKAGECONFIG option was set for a dependency which isn't built
> when ENTERPRISE_DISTRO=1. The error message doesn't even mention
> ENTERPRISE_DISTRO so it may be confusing for a user.

To be honest I think ENTERPRISE_DISTRO needs to go. It's not even clear what 
it should mean, and it's not consistently implemented. For things we want to 
be optional we have PACKAGECONFIG; for items that have licensing requirements 
that might be troublesome in certain deployments we have LICENSE_FLAGS, and 
LICENSE_FLAGS. I would suggest ENTERPRISE_DISTRO be phased out in favour of 
usage of one or both of those two depending on the situation.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

