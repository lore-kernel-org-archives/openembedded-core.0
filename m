Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 97F626E7A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 09:00:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2014 01:00:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,546,1389772800"; d="scan'208";a="489987990"
Received: from unknown (HELO [10.255.12.165]) ([10.255.12.165])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2014 01:00:41 -0800
Message-ID: <530DAD38.7010506@linux.intel.com>
Date: Wed, 26 Feb 2014 11:00:40 +0200
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1392891203.git.raj.khem@gmail.com>	<20140221151607.GG3854@jama>
	<1392996116.1560.14.camel@ted>	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>	<1393058961.5181.4.camel@ted>	<FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
	<6631D5B8-751A-458C-B9B2-7ACFDE88B065@gmail.com>
In-Reply-To: <6631D5B8-751A-458C-B9B2-7ACFDE88B065@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Feb 2014 09:00:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 02/26/2014 09:14 AM, Khem Raj wrote:
>>>
>>> I did run test builds of the git version on the autobuilders and didn't
>>> see any failures?
>>
>>
>> builds might work but they won’t run and yes so far IFUNC support is needed so it won’t work on non-x86
>> architectures. One common runtime problem I am seeing is logind not being able to talk to dbus
>> across all architectures. I have pushed my latest rework to pull branch
>
> I have now refreshed my contrib tree
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/systemd-210
>
> I have documented additional change you might need in your distro if you are not
> using OE-Core’s fs-perms.txt, systemd now needs /var/run to be symlinked to /run
> or else it won’t be able to talk to d-bus and kdbus is too new to enable yet.
>
> Please try this patch, it now builds and boots fine on x86 and arm here. I am also
> testing out other architecture in meantime
>

Khem,

Did you test with ptest enabled in DISTRO_FEATURES?  I just built it 
locally and got the following error:

> | cp: cannot stat '/home/sgw/yocto/builds/world/tmp/work/core2-64-poky-linux/systemd/1_210-r0/build/rules': No such file or directory
> | WARNING: /home/sgw/yocto/builds/world/tmp/work/core2-64-poky-linux/systemd/1_210-r0/temp/run.do_install_ptest_base.9533:1 exit 1 from
> |   cp -rf /home/sgw/yocto/builds/world/tmp/work/core2-64-poky-linux/systemd/1_210-r0/build/rules /home/sgw/yocto/builds/world/tmp/work/core2-64-poky-linux/systemd/1_210-r0/image/usr/lib/systemd/ptest/
> | ERROR: Function failed: do_install_ptest_base (log file is located at /home/sgw/yocto/builds/world/tmp/work/core2-64-poky-linux/systemd/1_210-r0/temp/log.do_install_ptest_base.9533)


Sau!


> -Khem
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

