Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPb3f-0002pJ-Tb
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 15:57:04 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 May 2011 06:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,273,1304319600"; 
   d="scan'208";a="8132757"
Received: from unknown (HELO [10.255.12.181]) ([10.255.12.181])
	by fmsmga002.fm.intel.com with ESMTP; 26 May 2011 06:53:59 -0700
Message-ID: <4DDE5B87.6010700@linux.intel.com>
Date: Thu, 26 May 2011 06:54:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DDBDE9D.5000709@linux.intel.com>
	<1306338695.27470.41.camel@rex>	<BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>	<20110525164919.GB11519@mail.familie-heinold.de>	<4DDD4D1B.5050301@linux.intel.com>
	<BANLkTiki898J_iurgJQ971o4aA1A3Yko0g@mail.gmail.com>
In-Reply-To: <BANLkTiki898J_iurgJQ971o4aA1A3Yko0g@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 May 2011 13:57:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/25/2011 11:12 PM, Anders Darander wrote:
> On Wed, May 25, 2011 at 20:40, Darren Hart <dvhart@linux.intel.com> wrote:
>> On 05/25/2011 09:49 AM, Henning Heinold wrote:
>>> I agree with khem, each machine should maintain it's bootloader in his bsp
>>> or layer.
>>
>> I'm leaning this way as well. I think oe-core should remain at an
>> official u-boot tagged release, like 2011.03 and layers can then extend
>> that with a proper .bbappend file. Then we can share the u-boot core
>> recipe and just add backported patches in the layers as needed.
> 
> This definitely seems like the best solution.
> 
> BSP specific patches and modifications can normally easily be handled
> in a .bbappend file. Together with the suggestion in another e-mail
> (or even thread) to keep one old u-boot version around in oe-core, to
> ease the transition to a new version in the BSP layers, this should be
> no real problem.
> 
> If a machine for some reason needs a specific custom version, then it
> might be necessary for that particular BSP layer to carry a complete
> u-boot recipe.

Even then they should usually be able to just override the SRCREV. But
yes, I agree.

> But this shouldn't be a common situation. (And if it
> happens frequently, then the machine specific patches really has to be
> submitted to upstream u-boot.).




-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


