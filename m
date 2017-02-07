Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 13BB765CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 20:18:15 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 07 Feb 2017 12:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="56312751"
Received: from gowdasan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.208])
	by orsmga004.jf.intel.com with ESMTP; 07 Feb 2017 12:17:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Wed, 08 Feb 2017 09:17:48 +1300
Message-ID: <2301139.i2tsUjesZx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/5.3.3 (Linux/4.9.6-200.fc25.x86_64; KDE/5.29.0; x86_64; ; )
In-Reply-To: <CAMKF1sqJSgjLMOPo7pkpfNDUOWLu4R0F9BNzbPFzWYgha5gwHw@mail.gmail.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
	<CAMKF1sqJSgjLMOPo7pkpfNDUOWLu4R0F9BNzbPFzWYgha5gwHw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Tue, 07 Feb 2017 20:18:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 7 February 2017 9:44:46 AM NZDT Khem Raj wrote:
> On Tue, Feb 7, 2017 at 9:35 AM, Burton, Ross <ross.burton@intel.com> wrote:
> > On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com> wrote:
> >> This is converging the recipes for go from
> >> meta-virtualization and oe-meta-go
> > 
> > I'm still of the opinion that this should be in meta-go, not oe-core...
> 
> I think we have to make multiple layers agree on using one layer
> I find atleast 3 which carry go recipes along with, if its in OE-Core
> either these layers become redundant or layers which are housing go
> recipes for
> different purpose like meta-virtualization can then drop the compiler
> recipes it will be easier from consolidation point of view.
> 
> if we dont want to take it into OE-Core, we should create a new layer
> meta-golang on yp git and then help request community to converge to
> it, it still can be ignored by layers.

Have we tried asking all of the various people involved if they'd mind working 
together? If not, I have my doubts as to whether putting it in OE-Core is 
going to entirely resolve the situation.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

