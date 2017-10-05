Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 47AFD77F85
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 15:10:10 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Oct 2017 08:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,481,1500966000"; d="scan'208";a="159790552"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga006.fm.intel.com with SMTP; 05 Oct 2017 08:09:47 -0700
Date: Thu, 5 Oct 2017 10:19:18 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-Id: <20171005101918.282f15658ac2a600e3c4c251@linux.intel.com>
In-Reply-To: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
References: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 05 Oct 2017 15:10:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 5 Oct 2017 16:49:28 +0200
Mike Looijmans <mike.looijmans@topic.nl> wrote:

> ﻿I'm confused.
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

"For example, a layer that has a recipe with a higher PV value but for which the BBFILE_PRIORITY is set to have a lower precedence still has a lower precedence."

taken from

http://www.yoctoproject.org/docs/2.3.2/mega-manual/mega-manual.html#var-BBFILE_PRIORITY

> 
> 
> Kind regards,
> 
> Mike Looijmans
> System Expert
> 
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> 
> 
> Visit us at the Space Tech Expo Europe (Stand E-71)
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

