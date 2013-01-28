Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Tzu3U-0007Jb-RZ
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 20:07:49 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2013 10:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,554,1355126400"; d="scan'208";a="277597697"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.77])
	by orsmga002.jf.intel.com with ESMTP; 28 Jan 2013 10:52:05 -0800
Message-ID: <5106C8D5.9000705@linux.intel.com>
Date: Mon, 28 Jan 2013 10:52:05 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Michael_E_Brown@Dell.com
References: <DB6E482E89290547898851B8CC9D8110DC3609D8@AUSX7MCPS302.AMER.DELL.COM>
In-Reply-To: <DB6E482E89290547898851B8CC9D8110DC3609D8@AUSX7MCPS302.AMER.DELL.COM>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: udev blacklist ineffective
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 19:07:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/28/2013 08:36 AM, Michael_E_Brown@Dell.com wrote:
> I have two embedded systems that share some devices over an i2c bus. Only one system may load the device driver at a time, and loading the device driver is already well-controlled by the HA subsystem.
> 
> Our new yocto build with udev enabled is auto-loading these device drivers with catastrophic results. We must absolutely prohibit such automatic behaviour for our list of devices. I have tried:
> 
> $ cat etc/modprobe.d/blacklist.conf 
> blacklist seepmtd
> ... cut ...
> 
> And this does *NOT* work. I have tried renaming blacklist.conf to
> modprobe.conf as well as creating modprobe.conf with these blacklist
> entries.
> 
> This is a huge blocking issue and I have been unable to figure out a
> workaround for it. I would appreciate any suggestions.


OK, so... this needs to be addressed.

However, can you just not build/install the drivers for the system that
shouldn't be accessing them? Or do you require a more general image?

You will need to provide details about the version of oe-core you are
using, kmod or modutils, and any relevant DISTRO configurations you have
made, which bit of software do you expect to be honoring the blacklist, etc.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


