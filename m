Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4F960825;
	Thu, 20 Jun 2013 10:25:47 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Jun 2013 03:25:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,904,1363158000"; d="scan'208";a="356673808"
Received: from unknown (HELO helios.localnet) ([10.252.122.59])
	by orsmga002.jf.intel.com with ESMTP; 20 Jun 2013 03:25:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 11:25:46 +0100
Message-ID: <1886786.nfT3SfR8Pm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <3004132.t7dk9348rv@helios>
References: <20121213174202.GE3356@jama.jama.net>
	<CANyK_8eXUptxF52CmcJftYZD+oht4gfkDfRsbY3gOnmTRwyzaQ@mail.gmail.com>
	<3004132.t7dk9348rv@helios>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 20 Jun 2013 10:25:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 20 June 2013 11:16:37 Paul Eggleton wrote:
> To be honest I think ENTERPRISE_DISTRO needs to go. It's not even clear what
> it should mean, and it's not consistently implemented. For things we want
> to be optional we have PACKAGECONFIG; for items that have licensing
> requirements that might be troublesome in certain deployments we have
> LICENSE_FLAGS, and LICENSE_FLAGS

Sorry, that should have read "and LICENSE_FLAGS already has a mechanism to 
prevent a recipe being built based on the current settings and report why."

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

