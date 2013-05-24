Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2EA62110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 10:49:38 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2013 03:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="307307585"
Received: from unknown (HELO helios.localnet) ([10.255.12.195])
	by azsmga001.ch.intel.com with ESMTP; 24 May 2013 03:49:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
Date: Fri, 24 May 2013 11:49:37 +0100
Message-ID: <8034383.RmDQ9sqPeb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <985E5BBDA0968D48ABDF343456A521B3022AB2D0@IRSMSX105.ger.corp.intel.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
	<2891613.OHSbzUYamb@helios>
	<985E5BBDA0968D48ABDF343456A521B3022AB2D0@IRSMSX105.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] libsoup-2.4: Update from 2.42.1 to 2.43.1
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
X-List-Received-Date: Fri, 24 May 2013 10:49:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 24 May 2013 10:40:24 Ciobanu, Emilia Maria Silvia wrote:
> On Friday, May 24, 2013 12:36 PM, Paul Eggleton wrote:
> > Could we just add some logic to distrodata.bbclass so that we don't get
> > reports of needing to upgrade to these unstable releases?
> 
> We thought about this situation. Because for different packages, the
> development  versions have their own naming convention, the solution
> was to hardcode each case individually.

We do have a number of common recipes (mostly from the GNOME project) that use 
odd numbers as versions though don't we? Even if the part of the version that 
is odd or even is different surely we could have some form of pattern that 
would parse out the part that needs to be checked in a way that could be 
specified on a per-recipe basis?

Cheers,
Paul
 
-- 

Paul Eggleton
Intel Open Source Technology Centre

