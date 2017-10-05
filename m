Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3877C60102
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 21:18:43 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Oct 2017 14:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,482,1500966000"; d="scan'208";a="157257216"
Received: from pnaidu-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.147.41])
	by orsmga005.jf.intel.com with ESMTP; 05 Oct 2017 14:18:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Fri, 06 Oct 2017 10:18:38 +1300
Message-ID: <4488567.fOZDuWkyH7@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
References: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Recipe versions and layer confusion
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
X-List-Received-Date: Thu, 05 Oct 2017 21:18:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike,

On Friday, 6 October 2017 3:49:28 AM NZDT Mike Looijmans wrote:
> I'm confused.
> 
> Layer "meta-xilinx" defines:
> 
> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.1.bb
> 
> This recipe is too old for my liking, so I made a newer one in "meta-topic"
> 
> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.3.bb
> 
> 
> Much to my surprise, when I build, OE picks the 2017.1 version and not the 
> 2017.3 version.
> 
> bitbake-layers show-layers reveils:
> ..
> meta-xilinx           /home/mike/projects/zynq-platform/meta-xilinx  5
> meta-topic            /home/mike/projects/zynq-platform/meta-topic  6
> ..
> 
> so that means that my meta-topic should win even if my PV were lower, right?

At face value I would have to agree - it doesn't sound like it's working the 
way it should.

What does bitbake-layers show-recipes  arm-trusted-firmware show ?

Another diagnostic would be to do bitbake -DDD arm-trusted-firmware and see if 
it gives any explanation as to why it's picking the older version (you'll have 
to wade through all of the other irrelevant debug info though).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

