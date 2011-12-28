Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RfyVJ-0004gp-O4
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 19:45:33 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Dec 2011 10:37:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="51356546"
Received: from unknown (HELO [10.255.13.80]) ([10.255.13.80])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Dec 2011 10:37:53 -0800
Message-ID: <4EFB6201.7010900@linux.intel.com>
Date: Wed, 28 Dec 2011 10:37:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324661415.git.scott.a.garman@intel.com>
	<4EF4BDA1.2060906@intel.com> <4EF8E344.2020800@intel.com>
In-Reply-To: <4EF8E344.2020800@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] Upgrade chrpath and libevent
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
X-List-Received-Date: Wed, 28 Dec 2011 18:45:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/2011 01:12 PM, Scott Garman wrote:
> On 12/23/2011 12:42 PM, Scott Garman wrote:
>> On 12/23/2011 09:31 AM, Scott Garman wrote:
>>> Hello,
>>>
>>> This pull request upgrades the chrpath and libevent recipes. It has
>>> been build-tested on all 5 of our qemu architectures.
>>
>> Please hold off on accepting this pull request. I forgot to include the
>> distro tracking field updates, and when I just went to do so, I noticed
>> that libevent had a NO_UPDATE_REASON field suggesting that libevent2 was
>> not compatible. Which means I have to do a lot more testing on this
>> before I can feel comfortable submitting it.
>>
>> I will likely not get to this until I return on January 2.
>
> Just a note:
>
> I did a grep for DEPENDS references to libevent in our tree and
> nfs-utils is the only recipe that lists it. I have tested building
> nfs-utils with the new libevent and there were no build errors.
>
This will probably require a PR bump for nfs-utils then.

Sau!

> Can anyone tell me if there are other applications known to use libevent
> that we include which I could do some runtime testing? If there are
> none, then I think in fact it should be safe to take this pull request.
>
> If nothing else, the chrpath recipe upgrade commit is safe.
>
> Thanks,
>
> Scott
>


