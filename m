Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sx1fc-0001pg-82
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 22:06:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Aug 2012 12:55:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="180882558"
Received: from unknown (HELO envy.home) ([10.7.199.82])
	by orsmga002.jf.intel.com with ESMTP; 02 Aug 2012 12:55:15 -0700
Message-ID: <501ADAB6.5030004@linux.intel.com>
Date: Thu, 02 Aug 2012 12:53:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343639174-29579-1-git-send-email-rongqing.li@windriver.com>
	<lyk3xlfutp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<50174FD1.6020805@windriver.com>
In-Reply-To: <50174FD1.6020805@windriver.com>
X-Enigmail-Version: 1.4.3
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] perf-3.4: fix hardcoded slang include dir
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
X-List-Received-Date: Thu, 02 Aug 2012 20:06:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/30/2012 08:24 PM, Rongqing Li wrote:
> 
> 
> On 2012年07月30日 17:43, Enrico Scholz wrote:
>> <rongqing.li-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:
>>
>>> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
>>> ...
>>> +	sed -i "s:-I/usr/include/slang:-I${STAGING_INCDIR}:" ${S}/tools/perf/Makefile
>>
>> You are patching an already staged file here:
>>
>>   | S = "${STAGING_KERNEL_DIR}"
>>
>> When want to fix it in this way (another workaround might be adding
>> 'WERROR=0' to EXTRA_OEMAKE), it must be done in kernel.bbclass.

That will indeed suppress the warning, but it doesn't resolve the host
contamination. A proper fix would be a patch against the kernel sources
. Every kernel will need this.

We can help you merge into the linux-yocto kernel.

>>
> Thanks, I will modify it.
> 
> -Roy
> 
>> Enrico
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


