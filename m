Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0D66BC88;
	Mon,  2 Sep 2013 09:54:23 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Sep 2013 02:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1006,1367996400"; d="scan'208";a="289793083"
Received: from unknown (HELO helios.localnet) ([10.252.123.85])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Sep 2013 02:54:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>, Chase Maupin <chase.maupin@ti.com>,
	Denys Dmytriyenko <denys@ti.com>
Date: Mon, 02 Sep 2013 10:54:20 +0100
Message-ID: <5772089.rktQrocuuR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
X-PRIORITY: 2 (High)
Priority: urgent
MIME-Version: 1.0
Subject: Heads up: _remove in recipe namespace - check your layers
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
X-List-Received-Date: Mon, 02 Sep 2013 09:54:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

With the recent addition of a _remove operator into BitBake in master [1] any 
use of _remove_ within a name or _remove at the end of a name within recipe 
namespace (i.e. function and variable names) needs to be changed to avoid 
unexpected behaviour. This change is now in master and will be in the upcoming 
release. Please check the layers you maintain and change any instances of 
these to avoid the use of _remove. You can use the following command to find 
these (of course ignoring anything that's not in a recipe, bbclass, inc file 
etc.):

  git grep _remove[^a-zA-Z]

In particular I've checked a number of layers that I have fetched locally, and 
references exist in meta-arago-distro and meta-angstrom, so these will need to 
be fixed as soon as possible.

Cheers,
Paul

[1] 
http://cgit.openembedded.org/bitbake/commit/?id=9c91948e10df278dad4832487fa56888cd58d187

-- 

Paul Eggleton
Intel Open Source Technology Centre

