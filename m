Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 08AF56A961
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 15:33:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 24 Jun 2013 08:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,929,1363158000"; d="scan'208";a="354916515"
Received: from unknown (HELO helios.localnet) ([10.252.122.47])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jun 2013 08:34:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Mon, 24 Jun 2013 16:33:19 +0100
Message-ID: <3878661.HXvFaDnT7J@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <2548324.aKRkUFvefN@helios>
References: <1372085235-30550-1-git-send-email-mark.hatle@windriver.com>
	<2548324.aKRkUFvefN@helios>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildtools-tarball: Change the way the SDK is sanitized
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
X-List-Received-Date: Mon, 24 Jun 2013 15:33:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 24 June 2013 16:31:13 Paul Eggleton wrote:
> On Monday 24 June 2013 09:47:15 Mark Hatle wrote:
> > +	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
> 
> I could be wrong but I think this may be a bashism...

Actually, I spoke too soon, it isn't. Ignore me...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

