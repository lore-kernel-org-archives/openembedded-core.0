Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPpXq-0002XH-0q
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 07:25:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 22:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="5690631"
Received: from unknown (HELO [10.255.12.184]) ([10.255.12.184])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 22:22:03 -0700
Message-ID: <4DDF34FC.3060100@linux.intel.com>
Date: Thu, 26 May 2011 22:22:04 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1306218459.git.sgw@linux.intel.com>	<1306443683.5911.1.camel@vorpal.jf.intel.com>	<4DDEC006.30701@linux.intel.com>	<201105262214.44529.paul.eggleton@linux.intel.com>
	<4DDF237C.20506@linux.intel.com> <4DDF2893.7090306@linux.intel.com>
In-Reply-To: <4DDF2893.7090306@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] IMAGE_ROOTFS_SIZE Cleanup
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
X-List-Received-Date: Fri, 27 May 2011 05:25:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/26/2011 09:29 PM, Saul Wold wrote:
> On 05/26/2011 09:07 PM, Darren Hart wrote:
>>
>>
>> On 05/26/2011 02:14 PM, Paul Eggleton wrote:
>>> On Thursday 26 May 2011 22:03:02 Darren Hart wrote:
>>>> Yeah, this wasn't clear to me either. And my question in 2/2 still
>>>> stands - what is the goal of the overhead factor?
>>>
>>> I think the thinking was that the more software you have installed to begin
>>> with the more user data you're likely to need to store. Personally I think it
>>> would be simpler if we just set some additional overhead as an absolute value
>>
>> I had the same thought, so "seconded".
>>
> It used to be that way and failed in unpredictable ways, what would work 
> for one image would be way over kill for another or be too little, so 
> the overhead factor works better.
> 

Seems to me this is just slightly more complicated, but every bit as
likely to fail in unexpected ways in the future. Perhaps the simplest,
most robust, and most explicit way to address this would be to set the
IMAGE_ROOTFS_EXTRA_SPACE in each IMAGE file, just as we set the base size?

This still ensures you get at least IMAGE_ROOTFS_EXTRA_SPACE freespace
since the base size will expand to be at least the size the image requires.

My final 0.02 USD on the matter.

> If you want a known amount of space then you can use the 
> IMAGE_ROOTFS_EXTRA_SPACE.
> 
> Sau!

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


