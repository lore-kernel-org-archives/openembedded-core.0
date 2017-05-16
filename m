Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5E12C77E32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 14:04:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 16 May 2017 07:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="87466017"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2017 07:04:26 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<79e18217-d4ed-8356-9532-7da63a420d6f@topic.nl>
	<1494922912.1179.306.camel@intel.com>
	<aaeaad51-6bd1-10c4-ce22-4381c07bd9a8@linux.intel.com>
	<1494942469.28624.10.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4da20a5f-4d38-e3fb-b31e-f42ce8505564@linux.intel.com>
Date: Tue, 16 May 2017 17:02:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494942469.28624.10.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/6] development vs. production builds
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
X-List-Received-Date: Tue, 16 May 2017 14:04:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2017 04:47 PM, Patrick Ohly wrote:

> Then why is not already done like that in practice? Is it just because
> OE-core and Poky set such a bad precedence with teaching developers to
> add EXTRA_IMAGE_FEATURES ?= "debug-tweaks" to make the images usable,
> and then that approach gets copied?

It is done like that already, it's just not very consistent from what I 
can see. For example, core-image-sato-dev.bb:
=============
require core-image-sato.bb

DESCRIPTION = "Image with Sato for development work. It includes 
everything \
within core-image-sato plus a native toolchain, application development 
and \
testing libraries, profiling and debug symbols."

IMAGE_FEATURES += "dev-pkgs"
=============

> I think everyone agrees that removing "debug-tweaks" would be a good
> idea. But completely removing the global (sic!) EXTRA_IMAGE_FEATURES in
> local.conf.sample would go even further, and I am not sure how the
> reactions to that would be. I suspect there are people who find it
> useful to have just one image recipe that gets build in different
> configurations (dangerous and not so dangerous).

I'm not sure either, but I think that's not actually a bad idea - 
dropping support for it altogether. :)

I'm not a big fan of placing INHERIT into local.conf either, by the way. 
I believe in functional programming principles, and this goes directly 
against them.

Alex

