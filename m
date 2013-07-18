Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7D14C6AF69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 12:16:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2013 05:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,692,1367996400"; d="scan'208";a="347745505"
Received: from unknown (HELO helios.localnet) ([10.252.122.61])
	by orsmga001.jf.intel.com with ESMTP; 18 Jul 2013 05:16:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 13:16:31 +0100
Message-ID: <2691932.dGi55gTP8y@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAJTo0La1=YTa2rXasY2LhRkA0O4-uV0UDUUGUc-0kNrLasX83A@mail.gmail.com>
References: <cover.1374128654.git.sgw@linux.intel.com>
	<1374146123.6324.5.camel@phil-desktop.brightsign>
	<CAJTo0La1=YTa2rXasY2LhRkA0O4-uV0UDUUGUc-0kNrLasX83A@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/40] Review and ACK
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
X-List-Received-Date: Thu, 18 Jul 2013 12:16:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 18 July 2013 12:35:04 Burton, Ross wrote:
> On 18 July 2013 12:15, Phil Blundell <pb@pbcl.net> wrote:
> > Seeing this discussion makes me wonder: if the target perl hasn't
> > actually been built at this point, how does rpmdeps know what package to
> > add a dependency on in the first place?  Does it just have some random
> > hard-coded list somewhere?
> 
> It adds a dependency on /usr/bin/perl as a file, not perl itself, as
> the error is "no package provides /usr/bin/perl".

Right, and at the moment this only works for RPM; I'm not sure if any of the 
others natively support file-based dependencies like this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

