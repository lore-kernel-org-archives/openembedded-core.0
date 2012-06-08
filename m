Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sd96t-0005r4-JM
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 02:01:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jun 2012 16:50:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="150393200"
Received: from unknown (HELO envy.home) ([10.255.12.197])
	by orsmga001.jf.intel.com with ESMTP; 08 Jun 2012 16:50:23 -0700
Message-ID: <4FD28F79.5030003@linux.intel.com>
Date: Fri, 08 Jun 2012 16:49:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FCE71F6.3060001@linux.intel.com> <4FCF8999.4000405@windriver.com>
In-Reply-To: <4FCF8999.4000405@windriver.com>
X-Enigmail-Version: 1.4.2
Cc: Anders Darander <anders@chargestorm.se>,
	Koen Kooi <koen@dominion.thruhere.net>, damien.lespiau@intel.com,
	"Wold, Saul" <saul.wold@intel.com>
Subject: Re: RFC: Braindump on Bootloaders, Image Types, and Installers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Jun 2012 00:01:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Restoring the CC list.

On 06/06/2012 09:47 AM, Mark Hatle wrote:
> I don't have specific comments below, but I can share some of what I will be 
> working on for my company in the next 6 months or so.
> 
> I will be working on moving the image generation: filesystem construction, 
> filesystem -> image generation, and similar into a framework that can reside 
> externally of OE-core/bitbake.
> 
> The idea is that we should have a single framework that can construct the 
> filesystem from the package feeds, construct the images (using the parameters 
> and more that you list below), and then eventually deploy these images onto the 
> target system.
> 
> Having this external of oe-core will allow it to be invoked by OE-core, as it is 
> today, as well as for on-target installers, people who want to start w/ the 
> package feeds, etc.
> 
> I believe this fits within the vision you have below, but may throw in some 
> issues when we start talking about external capable tooling.

I've been considering external tools to assemble images as well to keep
root permission requirements out of bitbake. This would greatly simplify
partitioning and loop mounting images. Preparing filesystem images in
bitbake, and bootable images outside of bitbake seems like a reasonable
approach to me as well.



-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


