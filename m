Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QfCuF-0001LX-FL
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:23:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2011 08:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,499,1304319600"; d="scan'208";a="23176147"
Received: from unknown (HELO [10.255.13.187]) ([10.255.13.187])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2011 08:19:57 -0700
Message-ID: <4E17201D.6040205@linux.intel.com>
Date: Fri, 08 Jul 2011 08:19:57 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1309881139.2410.14.camel@phil-desktop>	<201107051731.12273.paul.eggleton@linux.intel.com>	<1309891044.3176.7.camel@lenovo.internal.reciva.com>	<201107061506.04010.paul.eggleton@linux.intel.com>
	<4E14F23C.5050001@linux.intel.com>
In-Reply-To: <4E14F23C.5050001@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] bluez-dtl1-workaround: remove PRIORITY
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
X-List-Received-Date: Fri, 08 Jul 2011 15:23:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/06/2011 04:39 PM, Saul Wold wrote:
> On 07/06/2011 07:06 AM, Paul Eggleton wrote:
>> On Tuesday 05 July 2011 19:37:24 you wrote:
>>> On Tue, 2011-07-05 at 17:31 +0100, Paul Eggleton wrote:
>>>> Is it possible some people are still using PCMCIA/CF cards with this
>>>> hardware in it?
>>>
>>> It's certainly possible, yes.  But I don't think that the mere
>>> possibility is a very strong argument for keeping the recipe in oe-core.
>>> Maybe it would be better suited to meta-oe or some BSP layer,
>>
>> You're right, I guess it doesn't really belong in oe-core.
>>
> Phil,
> 
> I will take a patch that deletes from here and adds it into the 
> meta-extra's layer.


In some cases this is simple enough to do - move one recipe from here to
there. In other cases, not so much. Note that in addition to the removal
of these recipes, Phil also kindly cleaned up kernel.bbclass by removing
a bunch of special casing that was in place for this specific module.
Adding that support to meta-extras is a considerable effort and not
particularly sustainable as more old-and-crusty code is purged from OE.
It is also not likely to be well tested, which makes meta-extra less and
less useful.

We need an exit-path for old-and-crusty code - the git repository has
the history, so if it's needed we can always pull it into meta-extras
and properly test it when we know there is an interest, but if some due
diligence has been performed to determine the code is no longer of any
use, it seems like a lot of effort for very little gain to move any and
all removal of code from oe-core to meta-extras.

Thanks,

Darren

> 
> Sau!
> 
>> Cheers,
>> Paul
>>
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


