Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren.hart@intel.com>) id 1S7q2f-0006aN-2H
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:23:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2012 08:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118828092"
Received: from unknown (HELO envy.home) ([10.255.15.199])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2012 08:13:07 -0700
Message-ID: <4F60B557.5060304@intel.com>
Date: Wed, 14 Mar 2012 08:12:23 -0700
From: Darren Hart <darren.hart@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331684953.git.scott.a.garman@intel.com>
	<78b7df910bf1d5d25f5cc637a15c8e867d7bd712.1331684953.git.scott.a.garman@intel.com>
	<4F60B1F4.4040705@linux.intel.com>
	<20120314150033.GJ3919@jama.jama.net>
In-Reply-To: <20120314150033.GJ3919@jama.jama.net>
Cc: Scott Rifenbark <scott.m.rifenbark@linux.intel.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] ncurses: fix packaging of moved libraries
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
X-List-Received-Date: Wed, 14 Mar 2012 15:23:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/14/2012 08:00 AM, Martin Jansa wrote:
> On Wed, Mar 14, 2012 at 07:57:56AM -0700, Darren Hart wrote:
>>
>>
>> On 03/13/2012 05:31 PM, Scott Garman wrote:

...

>>>  PACKAGES += " \
>>> +  ${PN}-libncurses \
>>> +  ${PN}-libncursesw \
>>
>> This one needs to be dependent on ENABLE_WIDEC
> 
> isn't just
> ALLOW_EMPTY_${PN}-libncursesw = "1"
> enough?

Perhaps. ALLOW_EMPTY is not defined in poky/documentation/* nor in
poky/conf/documentation.conf.

(I realize this oe-core and not poky, but this is the best reference I
know of)

Could you provide a terse description of how ALLOW_EMPTY* is meant to be
used, its effects, and any needful cautionary text? Scott can then add
it to the above documentation.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


