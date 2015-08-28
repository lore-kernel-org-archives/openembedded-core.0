Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8C84D60043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 08:34:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2015 01:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="633864513"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.13.245])
	by orsmga003.jf.intel.com with ESMTP; 28 Aug 2015 01:34:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Aug 2015 09:34:18 +0100
Message-ID: <14855649.MLpkRK5kp1@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <26B844B8-BE69-427B-8DA7-B649C46A5632@gmail.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
	<762e79dfb769e885758bdcc627fadbe4dc6454fd.1440678731.git.paul.eggleton@linux.intel.com>
	<26B844B8-BE69-427B-8DA7-B649C46A5632@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Fri, 28 Aug 2015 08:34:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 27 August 2015 23:07:44 Khem Raj wrote:
> > On Aug 27, 2015, at 5:36 AM, Paul Eggleton <paul.eggleton@linux.intel.com>
> > wrote:
> > 
> > Allow restricting recipes brought from a layer to a specified list. This
> > is similar in operation to blacklist.bbclass, but instead specifies a
> > per-layer whitelist of recipes (matched by PN or BPN) that are able to
> > be built from the layer - anything else is skipped. This is potentially
> > useful where you want to bring in a select set of recipes from a larger
> > layer e.g. meta-oe.
> 
> For the record, I am not in favor of such feature in OE, Distros can still
> use BBMASK if they wish to

This is significantly easier to use than BBMASK though. (Perhaps that's why you 
don't like it?)

I think we need to be realistic here as I said in my most recent reply to the 
other thread - people will do this using whatever mechanism is available 
whether we like it or not. And what are they saying by doing so? They're 
effectively telling us that they can't consume the recipes in the way we are 
currently collecting them together. We know what the proper fix for the problem 
is (increased splitting of large layers such as meta-oe), it may not be easy 
but other than workarounds like this I don't see an alternative.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

