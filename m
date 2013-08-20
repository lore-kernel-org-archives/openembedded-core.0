Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id AEE9B6B7CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 18:24:29 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Aug 2013 11:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,921,1367996400"; d="scan'208";a="284450459"
Received: from unknown (HELO helios.localnet) ([10.252.122.243])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Aug 2013 11:24:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 20 Aug 2013 19:24:27 +0100
Message-ID: <4800620.CZQFbUAUEs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAP9ODKp7OF=yREqDpGhqcSRNdYAC9+S_SsRhoE6KPR4bJR5V9Q@mail.gmail.com>
References: <1377017488-32708-1-git-send-email-fcooper@ti.com>
	<1377017488-32708-3-git-send-email-fcooper@ti.com>
	<CAP9ODKp7OF=yREqDpGhqcSRNdYAC9+S_SsRhoE6KPR4bJR5V9Q@mail.gmail.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for dylan][PATCH 3/3] linux-dtb.inc: Fix dtb generation for kernels newer than 3.8
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
X-List-Received-Date: Tue, 20 Aug 2013 18:24:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Otavio,

On Tuesday 20 August 2013 15:17:16 Otavio Salvador wrote:
> On Tue, Aug 20, 2013 at 1:51 PM, Franklin S. Cooper Jr <fcooper@ti.com> 
wrote:
> > From: Otavio Salvador <otavio@ossystems.com.br>
> > 
> > The 3.8 kernel has change the default directory where the dtb file is
> > stored. The change has been done at:
> > 
> > ,----[ Quote of 3.8 kernel change ]
> > 
> > | commit 499cd8298628eeabf0eb5eb6525d4faa0eec80d8
> > | Author: Grant Likely <grant.likely@secretlab.ca>
> > | Date:   Tue Nov 27 16:29:11 2012 -0700
> > | 
> > |     ARM: dt: change .dtb build rules to build in dts directory
> > |     
> > |     The current rules have the .dtb files build in a different directory
> > |     from the .dts files. The only reason for this is that it was what
> > |     PowerPC has done historically. This patch changes ARM to use the
> > |     generic
> > |     dtb rule which builds .dtb files in the same directory as the source
> > |     .dts.
> > |     
> > |     Cc: Russell King <linux@arm.linux.org.uk>
> > |     Cc: Arnd Bergmann <arnd@arndb.de>
> > |     Acked-by: Olof Johansson <olof@lixom.net>
> > |     Cc: linux-arm-kernel@lists.infradead.org
> > |     Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> > |     [swarren: added rm command for old stale .dtb files]
> > |     Signed-off-by: Stephen Warren <swarren@nvidia.com>
> > |     Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> > 
> > `----
> > 
> > This change adds support for both places to backward and forward
> > compatibility.
> > 
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> 
> Franklin, I agree this is the way to go but I think it is a bit risky
> to change it in dylan.
> 
> I think it could be included in meta-ti or other layers (in case it is
> need for dylan) but it has breakage risk as noticed today in some
> behaviour change as found in meta-xilinx.
> 
> Paul, please be conservative about this and my previous linux-dtb
> patch. In case it is going to be applied in dylan we need to let it
> sleep some more time in master to find any other side effect due the
> behaviour change.

Agreed, I'd very much prefer to hold on this until it has had time to soak in 
master.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

