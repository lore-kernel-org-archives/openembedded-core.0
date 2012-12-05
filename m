Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TgIPr-0002x3-NO
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 18:05:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Dec 2012 08:50:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,223,1355126400"; d="scan'208";a="252438903"
Received: from unknown (HELO envy.home) ([10.255.13.60])
	by orsmga002.jf.intel.com with ESMTP; 05 Dec 2012 08:51:21 -0800
Message-ID: <50BF7B88.6060309@linux.intel.com>
Date: Wed, 05 Dec 2012 08:51:20 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1353532567.git.bruce.ashfield@windriver.com>
	<CAJTo0LYjTzrvDgDXA-r1f4B8+-TSfv1tUkC-Hyw_J-2toHEQkQ@mail.gmail.com>
	<1354723571.1715.17.camel@empanada>
	<1354724873.25268.119.camel@ted>
In-Reply-To: <1354724873.25268.119.camel@ted>
X-Enigmail-Version: 1.4.6
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 05 Dec 2012 17:05:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/05/2012 08:27 AM, Richard Purdie wrote:
> On Wed, 2012-12-05 at 10:06 -0600, Tom Zanussi wrote:
>> On Wed, 2012-12-05 at 15:48 +0000, Burton, Ross wrote:
>>> On 21 November 2012 21:32, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>>>> atom-pc should probably be using the 3.4 kernel, but that's a
>>>> question for Darren/Tom/Nitin (so I've added them to the cc), since
>>>> there may be a reason (with respect to graphics) as to why it is on
>>>> 3.0.
>>>
>>> Ping Darren/Tom/Nitin.
>>>
>>> atom-pc is certainly lagging behind by still being on 3.0, and I can't
>>> see any reason why we'd want to stick with 3.0 for graphics.  In fact
>>> as the most common graphics driver used on atom-pc is a i965 we want a
>>> modern kernel as that is where the development is.
>>>
>>
>> I don't know of any technical reason for it to still be at 3.0.
>>
>> Until recently all of the 'core machines' were at 3.0 and probably the
>> assumption was that whoever upgraded those in the past would also be
>> upgrading atom-pc - has that changed?.
>>
>> So who does own the core machines and if that doesn't cover atom-pc,
>> then who owns that?
> 
> As I understood it, WR owns the non-IA core machines, you (as in the
> Intel team) own the IA ones, namely atom-pc.

Agreed, it should be updated. Tom, Nitin, and I will discuss and select
an owner.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


