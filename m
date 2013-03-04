Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UCYDC-0001J4-Fu
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 17:26:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2013 08:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,780,1355126400"; d="scan'208";a="293324755"
Received: from unknown (HELO envy.home) ([10.255.12.152])
	by orsmga002.jf.intel.com with ESMTP; 04 Mar 2013 08:09:32 -0800
Message-ID: <5134C73C.2000300@linux.intel.com>
Date: Mon, 04 Mar 2013 08:09:32 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1362217827.git.liezhi.yang@windriver.com>
	<1362224344.11004.14.camel@ted> <5133852E.2010504@linux.intel.com>
	<513394C2.6030004@linux.intel.com> <5134A4BD.9030201@windriver.com>
	<1362406238.29587.28.camel@ted>
In-Reply-To: <1362406238.29587.28.camel@ted>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] Fully support ext3/ext4 rootfs generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 16:26:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03/04/2013 06:10 AM, Richard Purdie wrote:
> On Mon, 2013-03-04 at 21:42 +0800, Robert Yang wrote:
>>
>> On 03/04/2013 02:21 AM, Darren Hart wrote:
>>>
>>>
>>> On 03/03/2013 09:15 AM, Darren Hart wrote:
> 
>> Yes, we do have hard links in the rootfs, e.g: core-image-sato and 
>> core-image-sato-sdk:
>>
>> # The sato
>> $ find core-image-sato/1.0-r0/rootfs/ -type f -printf "%p %i %n\n" | grep -v '1$'
>> core-image-sato/1.0-r0/rootfs/etc/terminfo/v/vt200 26977609 2
>> core-image-sato/1.0-r0/rootfs/etc/terminfo/v/vt220 26977609 2
>> core-image-sato/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld.bfd 26978690 2
>> core-image-sato/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld 26978690 2
> 
> What if the count was 11? or 21? I'm just mentioning we need to improve
> that command!

Yes a -v ' 1$' would be better.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


