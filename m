Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 714016B26D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 15:13:17 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jul 2013 08:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,702,1367996400"; d="scan'208";a="333903511"
Received: from unknown (HELO helios.localnet) ([10.252.122.96])
	by azsmga001.ch.intel.com with ESMTP; 19 Jul 2013 08:13:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>, "Shakeel,
	Muhammad" <muhammad_shakeel@mentor.com>
Date: Fri, 19 Jul 2013 16:13:15 +0100
Message-ID: <76349842.krt1SjzMLB@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CABcZAN=z2JMb9XzkCfwFSYwezY7otMGxbYfQr_RboUxkSHcNPg@mail.gmail.com>
References: <1374234806-31680-1-git-send-email-muhammad_shakeel@mentor.com>
	<1374234806-31680-2-git-send-email-muhammad_shakeel@mentor.com>
	<CABcZAN=z2JMb9XzkCfwFSYwezY7otMGxbYfQr_RboUxkSHcNPg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] update-rc.d: Remove init.d dir if sysvinit is not in distro features
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
X-List-Received-Date: Fri, 19 Jul 2013 15:13:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 19 July 2013 08:02:32 Chris Larson wrote:
> On Fri, Jul 19, 2013 at 4:53 AM, Shakeel, Muhammad 
> <muhammad_shakeel@mentor.com> wrote:
> > From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> > 
> > If sysvinit is not supported DISTRO_FEATURE than there is no need to
> > package related initialization scripts.
> > 
> > Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> 
> If we stop shipping init.d for non-sysvinit distros, which makes sense, we
> should also consider automatically enabling/disabling sysv compat support
> in the systems build based on that distro feature also. So, I support this
> commit, but am proposing adding another for consistency :)

Yes, actually at the moment I think we cannot delete the sysvinit initscripts 
unless the recipe also inherits systemd, otherwise there will be no fallback 
to sysvinit compatibility and the daemon will no longer be started.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

