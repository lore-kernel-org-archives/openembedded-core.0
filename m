Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMTrX-0000of-OC
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 01:39:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2011 16:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,228,1304319600"; 
   d="scan'208";a="51795"
Received: from doubt.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2011 16:36:47 -0700
Message-ID: <4DD306A2.7030702@linux.intel.com>
Date: Tue, 17 May 2011 16:37:06 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4DD2FE07.4030708@linux.intel.com> <1305674113.3424.292.camel@rex>
In-Reply-To: <1305674113.3424.292.camel@rex>
Subject: Re: [RFC PATCH] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Tue, 17 May 2011 23:39:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/17/2011 04:15 PM, Richard Purdie wrote:
> On Tue, 2011-05-17 at 16:00 -0700, Darren Hart wrote:
>> oe-core does not define any machines, so it does not make sense to
>> add machine specific information in the oe-core u-boot recipe and
>> infrastructure.
>>
>> Since every machine wishing to use the u-boot recipe would need to add itself to
>> COMPATIBLE_MACHINES, typically via a bbappend recipe, the mechanism loses any
>> utility it may have had and unecessarily complicates using the u-boot recipe. By
>> removing it, we simplify the task of adding support for new machines.
> 
> NAK.
> 
> This break usability of things like "bitbake world" since all of a
> sudden it will try and build u-boot in cases where it makes no sense
> (qemu* machines for example).

OK, I thought there might be something like that surrounding
COMPATIBLE_MACHINE, thus the RFC.

> 
> I know it sounds strange but we do want this recipe enabled on a case by
> case basis (and we have the beagleboard as a reference platform using it
> which is handy). This means the default of no supported machine is
> correct even if it looks odd.
> 
> Having the recipe deselect itself (raise a skip parsing event) if
> UBOOT_MACHINE isn't set instead of using COMPATIBLE_MACHINE would be
> acceptable though.

That sounds promising. I'd like to avoid having to create a
u-boot_git.bbappend everytime you want to use u-boot. Is there an
example you can think of that does this? greping for "deselect" and
"skip pars" didn't yield any results.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


