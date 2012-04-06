Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SG2U3-0005Hi-65
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 08:17:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Apr 2012 23:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="150270340"
Received: from unknown (HELO envy.home) ([10.255.12.143])
	by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2012 23:08:05 -0700
Message-ID: <4F7E881E.1000106@linux.intel.com>
Date: Thu, 05 Apr 2012 23:07:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: "Cui, Dexuan" <dexuan.cui@intel.com>
References: <A25F549E4D43CD42B4C02DF47A1913230FCFD3A2@SHSMSX102.ccr.corp.intel.com>
	<4F7E6914.7080908@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD49B@SHSMSX102.ccr.corp.intel.com>
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCFD49B@SHSMSX102.ccr.corp.intel.com>
X-Enigmail-Version: 1.4
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Do we have a package that installs the kernel headers and config into the target?
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
X-List-Received-Date: Fri, 06 Apr 2012 06:17:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/05/2012 09:41 PM, Cui, Dexuan wrote:
> Darren Hart wrote on 2012-04-06:
>> On 04/05/2012 08:20 PM, Cui, Dexuan wrote:
>>> In a typical Linux distribution, there is a build link(or directory)
>>> that specifies the directory where the kernel headers and kernel config
>>> are put.
>>>
>>> E.g. in my Ubuntu 11.04, a package linux-headers-2.6.38-8-generic
>> installs .config, include/ and Kconfig into
>> /usr/src/linux-headers-2.6.38-8-generic/ and makes a link
>> /lib/modules/2.6.38-8-generic/build to point to the directory.
>>>
>>> However, looks in Yocto, we don't have such a package? Do we have a
>>> plan to add it?
>>>
>>> I'm asking the question because in the ESDC contest, the students found in
>> Yocto they couldn't build the wifi driver's source code that was
>> downloaded from realtek.com:
>> http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=1&PFid=4
>> 8&Level=5&Conn=4&ProdID=226&DownTypeID=3&GetDown=false&Downloads =true
>>> In Ubuntu, they can build the driver fine.
>>
>> There is an open bug:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=1614
> 
> Glad to know this is a know bug.
> I personally think it would be pretty nice if we can fix this bug soon
> since the students are being frustrated by this...
> 
> And, in the Build Appliance (self-hosted-image) work, we want to
> enable the vmware guest's VMware Tools. This also requires the ability
> to build kernel module in the target.
> 

While I understand there are valid use cases, I think this is generally
contrary to workflow of the project. We build the OS, it runs on the
target. This is building a general purpose OS, and then having it build
itself out more. It doesn't feel like an embedded workflow.

That said, there are valid use cases, but I don't consider this a
particularly high priority at the moment. I'm happy to hear other
thoughts on why this should be bumped in prio though.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


