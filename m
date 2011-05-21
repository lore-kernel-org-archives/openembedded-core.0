Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QNZpW-0001zL-JL
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 02:14:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 May 2011 17:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,244,1304319600"; 
   d="scan'208";a="1809924"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by orsmga001.jf.intel.com with ESMTP; 20 May 2011 17:10:51 -0700
Message-ID: <4DD7030B.909@intel.com>
Date: Fri, 20 May 2011 17:10:51 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1305655392.git.nitin.a.kamble@intel.com>
	<4DD6FEC2.9030503@linux.intel.com>
In-Reply-To: <4DD6FEC2.9030503@linux.intel.com>
Cc: poky@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/1] switch to gcc 4.6.0 for x86 x86-64 & arm
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
X-List-Received-Date: Sat, 21 May 2011 00:14:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/20/2011 04:52 PM, Darren Hart wrote:
>
>
> On 05/17/2011 11:07 AM, Nitin A Kamble wrote:
>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>>
>> gcc 4.6.0 is good enough to switch for x86, x86-64&  arm now.
>>
>> I could build core-sdk images and run them through the qemu machines
>> when compiled with gcc 4.6.0.
>
> Has all of meta-intel been built using 4.6.0? If not, that would be a
> good test-case for the x86* architectures. Perhaps we could get a manual
> scheduler up on the autobuilder for that to make it easy to kick off?
>
> What do you think Beth?
>
Maybe after M1 RC1 gets built

Sau!

>>
>> mips&  ppc are still not ready, mainly the kernel compilation issues
>> with gcc 4.6.0. These kernel issues are being worked on by Bruce.
>>
>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>>    Branch: nitin/misc
>>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>>
>> Thanks,
>>      Nitin A Kamble<nitin.a.kamble@intel.com>
>> ---
>>
>>
>> Nitin A Kamble (1):
>>    tcmode-default: switch to gcc 4.6.0 for x86, x86-64&  arm
>>
>>   meta/conf/distro/include/tcmode-default.inc |    8 ++++++--
>>   1 files changed, 6 insertions(+), 2 deletions(-)
>>
>



