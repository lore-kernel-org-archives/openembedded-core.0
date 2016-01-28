Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D58DC6E5CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 13:29:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2016 05:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,358,1449561600"; d="scan'208";a="900141263"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 28 Jan 2016 05:29:57 -0800
Date: Thu, 28 Jan 2016 15:32:19 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160128133218.GC1902@mbabyjoh-mobl.fi.intel.com>
References: <1453984641-1849-1-git-send-email-maxin.john@intel.com>
	<CAJTo0La7EzDZ5ocG+++=7gp0PqNNquVv6a4H66p3orL3+c+GLA@mail.gmail.com>
	<20160128131355.GB1902@mbabyjoh-mobl.fi.intel.com>
	<CAJTo0LYFHTzv3vF0fz3VQ2sLFgBVfqKw4HO15cUJanCt76REbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYFHTzv3vF0fz3VQ2sLFgBVfqKw4HO15cUJanCt76REbw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libical: update to 2.0.0
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
X-List-Received-Date: Thu, 28 Jan 2016 13:29:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Jan 28, 2016 at 01:13:05PM +0000, Burton, Ross wrote:
>On 28 January 2016 at 13:13, Maxin B. John <maxin.john@intel.com> wrote:
>
>    These library dependencies do get detected automatically. This line can be removed
>        if we don't want to explicitly mention the dependencies.
>
>        We only need to mention library dependencies explicitly if they're opened at runtime and the dependency magic can't see them.  Please send a v2 for this patch.
>        Presumably although the ABI changed, the API is the same so bluez5 and so on still builds against libical 2?

Thanks for explaining that (bit carried away by the buildhistory-diff tool output). 
Sure, will send a v2 soon.

Yes, bluez5 build works fine with the libical 2.

> Ross

Best Regards,
Maxin

