Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SymeH-0007ii-Vc
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 18:28:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2012 09:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="177046563"
Received: from unknown (HELO envy.home) ([10.255.12.197])
	by orsmga001.jf.intel.com with ESMTP; 07 Aug 2012 09:16:47 -0700
Message-ID: <50213F03.1000004@linux.intel.com>
Date: Tue, 07 Aug 2012 09:14:59 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343697966-29777-1-git-send-email-Martin.Jansa@gmail.com>
	<1343732826.9526.1.camel@ted> <20120731111002.GR3261@jama.jama.net>
	<5019580E.4070906@linux.intel.com> <1344343119.9756.248.camel@ted>
In-Reply-To: <1344343119.9756.248.camel@ted>
X-Enigmail-Version: 1.4.3
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [RFC] gdb-cross: add pythonnative
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
X-List-Received-Date: Tue, 07 Aug 2012 16:28:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/07/2012 05:38 AM, Richard Purdie wrote:
> On Wed, 2012-08-01 at 09:23 -0700, Darren Hart wrote:
>>
>> On 07/31/2012 04:10 AM, Martin Jansa wrote:

>>>> Is python enabled for gdb-cross in OE-Core?
>>>
>>> Explicitly only in gdb-cross-canadian, so I guess gdb-cross autodetected
>>> it (sorry I don't have config.log anymore).
>>>
>>
>> This resolves my gdb-cross build issue on poky-tiny. Thanks Martin.
> 
> I fixed this properly by disabling python in gdb-cross.

Great, thanks RP!


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


