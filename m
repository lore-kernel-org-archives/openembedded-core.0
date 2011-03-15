Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1PzZvv-0002nU-6n
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 20:29:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2011 12:27:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,190,1299484800"; d="scan'208";a="720479673"
Received: from unknown (HELO [10.255.12.146]) ([10.255.12.146])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2011 12:27:48 -0700
Message-ID: <4D7FBDAB.7040501@linux.intel.com>
Date: Tue, 15 Mar 2011 12:27:39 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <161e1f47c2460d5b2463300e31bf5eebb46b8698.1300172958.git.dvhart@linux.intel.com>	
	<ACE0CCC0-8D25-4FC2-93B2-73C60636721A@beagleboard.org>	
	<4D7F9CC2.2030002@linux.intel.com>	
	<AANLkTikC7yWvzTzf1Od2WLiBhQjz1iactGCaPCN+aAmR@mail.gmail.com>
	<1300213438.30423.1820.camel@rex>
In-Reply-To: <1300213438.30423.1820.camel@rex>
Cc: Koen Kooi <koen@beagleboard.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
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
X-List-Received-Date: Tue, 15 Mar 2011 19:29:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/15/2011 11:23 AM, Richard Purdie wrote:
> On Tue, 2011-03-15 at 10:24 -0700, Khem Raj wrote:
>> On Tue, Mar 15, 2011 at 10:07 AM, Darren Hart<dvhart@linux.intel.com>  wrote:
>>>
>>> What are the ownership and perms on those?
>>>
>>> I suppose we could avoid the .pc directory - but it's going to require
>>> something more than cp or some additional scripting. Something like tar's
>>> exclude functionality might be needed - but I hate to add the intermediate
>>> step as the kernel recipes are already so slow.
>>
>>
>> hmmm I wonder why those are marked non readable in .pc directory  that
>> seems wrong to me
>
> Its quilt that does this. Kind of annoying but its been doing that for a
> few versions now...

I recall purging .pc for this reason (just in other development, outside 
of poky).

I take it deleting .pc from the build dir would be bad as it would make 
build/hack/build fail to work on the workdir tree. That leaves changing 
the permissions and copying it, or just avoiding the copy. I'm leaning 
towards avoiding the copy - but I hate to add a ton of scripting logic 
in the copy, but that may be the best solution.

>
> Cheers,
>
> Richard
>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


