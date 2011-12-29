Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RgHfM-0004WG-HM
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 16:13:12 +0100
Received: from mail-qy0-f180.google.com ([209.85.216.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 29 Dec 2011 07:05:56 -0800
Received: by qcse1 with SMTP id e1so8154867qcs.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 07:05:55 -0800 (PST)
Received: by 10.229.77.13 with SMTP id e13mr13281789qck.31.1325171154971;
	Thu, 29 Dec 2011 07:05:54 -0800 (PST)
Received: from [192.168.2.56] (c-76-24-45-209.hsd1.nh.comcast.net.
	[76.24.45.209])
	by mx.google.com with ESMTPS id v5sm65728028qao.21.2011.12.29.07.05.53
	(version=SSLv3 cipher=OTHER); Thu, 29 Dec 2011 07:05:54 -0800 (PST)
Message-ID: <4EFC81D0.1010402@intel.com>
Date: Thu, 29 Dec 2011 10:05:52 -0500
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1324661415.git.scott.a.garman@intel.com>
	<4EF4BDA1.2060906@intel.com> <4EF8E344.2020800@intel.com>
	<4EFB6201.7010900@linux.intel.com>
In-Reply-To: <4EFB6201.7010900@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 29 Dec 2011 15:13:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/2011 01:37 PM, Saul Wold wrote:
> On 12/26/2011 01:12 PM, Scott Garman wrote:
>> On 12/23/2011 12:42 PM, Scott Garman wrote:
>>> On 12/23/2011 09:31 AM, Scott Garman wrote:
>>>> Hello,
>>>>
>>>> This pull request upgrades the chrpath and libevent recipes. It has
>>>> been build-tested on all 5 of our qemu architectures.
>>>
>>> Please hold off on accepting this pull request. I forgot to include the
>>> distro tracking field updates, and when I just went to do so, I noticed
>>> that libevent had a NO_UPDATE_REASON field suggesting that libevent2 was
>>> not compatible. Which means I have to do a lot more testing on this
>>> before I can feel comfortable submitting it.
>>>
>>> I will likely not get to this until I return on January 2.
>>
>> Just a note:
>>
>> I did a grep for DEPENDS references to libevent in our tree and
>> nfs-utils is the only recipe that lists it. I have tested building
>> nfs-utils with the new libevent and there were no build errors.
>>
> This will probably require a PR bump for nfs-utils then.

Are you sure? I thought this was handled automatically as long as the 
recipe in question includes the build dependency in DEPENDS, as 
nfs-utils does for libevent.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


