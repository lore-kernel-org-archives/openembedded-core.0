Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5396D86B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 16:19:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 08:18:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,811,1378882800"; d="scan'208";a="445395741"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 08:18:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 02 Dec 2013 16:18:52 +0000
Message-ID: <1471026.rDxeBhQvgN@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
MIME-Version: 1.0
Subject: RFC: external toolchain recipes in OE-Core
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
X-List-Received-Date: Mon, 02 Dec 2013 16:19:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

Currently we have an external-sourcery-toolchain recipe in OE-Core; one of the 
main reasons we have it there is as an example of how to create a working 
external toolchain recipe for those that need to create their own. Since the 
creation of the meta-sourcery layer however, this recipe has been left largely 
unmaintained. Even assuming nobody tries to use it as-is with the CodeSourcery 
toolchain, without testing and maintenance the recipe can bitrot (and has 
broken as a result of changes elsewhere in OE-Core), and thus any external 
toolchain recipe created based upon it may end up not working either. We need 
to come up with a plan for what to do with this recipe - here are some 
possibilities:

A) Keep it in OE-Core and ensure it is tested and maintained

B) Remove it and just point to meta-sourcery as a maintained and working 
example of how to write an external toolchain recipe

C) Replace it with a less concrete example recipe in meta-skeleton that we 
maintain going forward

What do people think?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

