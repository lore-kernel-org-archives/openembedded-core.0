Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QcOOb-0007Vw-QX
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 23:03:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jun 2011 13:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,454,1304319600"; d="scan'208";a="20284335"
Received: from miles.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga002.jf.intel.com with ESMTP; 30 Jun 2011 13:59:49 -0700
Message-ID: <4E0CE3C3.9080302@intel.com>
Date: Thu, 30 Jun 2011 13:59:47 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>	<4E0C9D43.6020504@mentor.com>
	<4E0C9F74.9040301@windriver.com>
	<21BC0569-3028-4DBA-90CB-D7CEC814DBC1@dominion.thruhere.net>
In-Reply-To: <21BC0569-3028-4DBA-90CB-D7CEC814DBC1@dominion.thruhere.net>
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal	errors
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
X-List-Received-Date: Thu, 30 Jun 2011 21:03:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/30/2011 01:35 PM, Koen Kooi wrote:
>
> Op 30 jun 2011, om 18:08 heeft Mark Hatle het volgende geschreven:
>
>> On 6/30/11 10:58 AM, Tom Rini wrote:
>>> On 06/30/2011 08:11 AM, Koen Kooi wrote:
>>>> These were turned off by:
>>>>
>>>> commit fae8d5e985e9b05ce90f1eca434ad4dbf2259725 Author: Richard
>>>> Purdie<rpurdie@linux.intel.com> Date:   Thu Jul 8 23:51:06 2010
>>>> +0100
>>>>
>>>> insane.bbclass: Relax fatal errors for now until we get have
>>>> time to work through the backlog
>>>>
>>>> The current metadata triggers so many of these that they need
>>>> to be made fatal so people will actually fix them.
>>>>
>>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>>
>>> Given that a number of them can probably just be pulled from
>>> oe.dev as fixes too:
>>>
>>> Acked-by: Tom Rini<tom_rini@mentor.com>
>>
>> I'm really worried about the current warnings/QA issues that keep
>> coming up.. so I agree we really need to do this.. (note, we also
>> really need to tell people to expect some breakage as we go and fix
>> the mess!)
>
> During todays TSC meeting the proposed date to switch was the 11th
> and encourage people to start fixing things *NOW*. What are peoples
> thought on that?

Sounds like an excellent compromise!

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


