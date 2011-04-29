Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QFfJd-0006V8-Rm
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 06:28:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2011 21:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,284,1301900400"; d="scan'208";a="740020090"
Received: from unknown (HELO [10.255.13.24]) ([10.255.13.24])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2011 21:25:54 -0700
Message-ID: <4DBA3DD1.7050908@linux.intel.com>
Date: Thu, 28 Apr 2011 21:25:53 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1303539961.git.sgw@linux.intel.com>	<a0629aa0dc55829565b7ab1725875eac065ab2f1.1303539961.git.sgw@linux.intel.com>	<4DB562CF.1020100@mlbassoc.com>
	<4DB59811.5040109@linux.intel.com>	<4DB5ABDB.9070201@mlbassoc.com>
	<4DB65C5B.2050409@linux.intel.com>	<BANLkTik6odYsapq-n82ytd0H7HdYKTLV5g@mail.gmail.com>
	<1303982741.21461.48.camel@rex>
In-Reply-To: <1303982741.21461.48.camel@rex>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 07/37] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Fri, 29 Apr 2011 04:28:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/28/2011 02:25 AM, Richard Purdie wrote:
> On Tue, 2011-04-26 at 10:51 -0700, Khem Raj wrote:
>> On Mon, Apr 25, 2011 at 10:47 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>>> On 04/25/2011 10:14 AM, Gary Thomas wrote:
>>>
>>> Right, so for clarification, for 2.4 kernels, images should be built
>>> using just the modutils_2.4.27.bb recipe. For 2.6 kernels, images should
>>> be built using module_init_tools and modutils-initscripts.
>>>
>>> In oe-core, task-base requires module-init-tools and task-core-boot
>>> requires modutils-initscripts. That actually seems backwards to me as
>>> modutils-initscripts is useless without module-init-tools.
>>>
>>> There is a considerable amount of cruft in the kernel base classes
>>> related to older kernels which I'd like to see purged. Perhaps a
>>> meta-linux-2.4 layer would be a good place to keep things like these as
>>> well as the modutils_2.4.27 recipe.
>>
>> Do we have usecases to even support 2.4 anymore ? I would suggest
>> to remove it if no use cases are reported.
> 
> I think the time has come for OE-Core to clean out kernel.bbclass of the
> 2.4 code. If anyone does want to support 2.4, they can do it with a
> separate kernel-2.4 class.

Excellent. Added to my todo list for the not toooo distant future.

> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


