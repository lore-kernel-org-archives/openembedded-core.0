Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPJ3G-0001P8-3F
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 20:43:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 May 2011 11:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,268,1304319600"; 
   d="scan'208";a="7530343"
Received: from unknown (HELO [10.255.12.181]) ([10.255.12.181])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2011 11:40:22 -0700
Message-ID: <4DDD4D1B.5050301@linux.intel.com>
Date: Wed, 25 May 2011 11:40:27 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DDBDE9D.5000709@linux.intel.com>
	<1306338695.27470.41.camel@rex>	<BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>
	<20110525164919.GB11519@mail.familie-heinold.de>
In-Reply-To: <20110525164919.GB11519@mail.familie-heinold.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Wed, 25 May 2011 18:43:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/25/2011 09:49 AM, Henning Heinold wrote:
> Hi,
> 
> I agree with khem, each machine should maintain it's bootloader in his bsp
> or layer.

I'm leaning this way as well. I think oe-core should remain at an
official u-boot tagged release, like 2011.03 and layers can then extend
that with a proper .bbappend file. Then we can share the u-boot core
recipe and just add backported patches in the layers as needed.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


