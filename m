Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C1E9D6B41A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 08:36:16 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Jul 2013 01:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,776,1367996400"; d="scan'208";a="275198111"
Received: from unknown (HELO helios.localnet) ([10.252.122.217])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 01:36:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 30 Jul 2013 09:36:15 +0100
Message-ID: <3142379.RoO2xEFs45@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <51F6FE24.7090502@windriver.com>
References: <1374835703-9222-1-git-send-email-paul.eggleton@linux.intel.com>
	<51F6FE24.7090502@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/sanity: check for suid root command evility
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
X-List-Received-Date: Tue, 30 Jul 2013 08:36:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 29 July 2013 18:43:32 Mark Hatle wrote:
> On 7/26/13 5:48 AM, Paul Eggleton wrote:
> > Some users have been found to have an unnamed third-party piece of
> > software installed which sets chmod, chown and mknod as suid root as
> > part of its installation process. This interferes with the operation of
> > pseudo and can result in files really being owned by root within the
> > build output, and therefore breaks the build, apart from being a
> > security issue. Check for this and bail out early if it is found.
> > 
> > Reported-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Should these items be added to the buildtools-tarball target?  It might help
> avoid the problem in the same way we already do to detect the bad make,
> tar, etc..

To be honest I'd rather not try to work around misconfiguration such as this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

