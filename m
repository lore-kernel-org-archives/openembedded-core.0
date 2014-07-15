Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ADA21701E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:30:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2014 08:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="573488936"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2014 08:30:04 -0700
Message-ID: <53C548FC.2010309@linux.intel.com>
Date: Tue, 15 Jul 2014 08:30:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1403218403-3303-1-git-send-email-denis@denix.org>	<20140620171338.GX27324@denix.org>
	<20140625005255.GB1580@denix.org>	<2450957.82MqDgnpjo@peggleto-mobl5.ger.corp.intel.com>	<20140625162209.GC1580@denix.org>
	<1403736065.2104.287.camel@ted>	<20140626174353.GE1580@denix.org>
	<20140715024119.GS1580@denix.org>
In-Reply-To: <20140715024119.GS1580@denix.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] udev: update init script for conditional probing of platform bus
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
X-List-Received-Date: Tue, 15 Jul 2014 15:30:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/14/2014 07:41 PM, Denys Dmytriyenko wrote:
> On Thu, Jun 26, 2014 at 01:43:53PM -0400, Denys Dmytriyenko wrote:
>> On Wed, Jun 25, 2014 at 11:41:05PM +0100, Richard Purdie wrote:
>>> On Wed, 2014-06-25 at 12:22 -0400, Denys Dmytriyenko wrote:
>>>> On Wed, Jun 25, 2014 at 05:20:23PM +0100, Paul Eggleton wrote:
>>>>> On Tuesday 24 June 2014 20:52:55 Denys Dmytriyenko wrote:
>>>>>> Ping? Any comments? Any better suggestions?
>>>>>
>>>>> Looks like Richard has merged this, FWIW.
>>>>
>>>> Yes, I saw it. Already submitted backport for daisy... :)
>>>
>>> I'd like this to see some testing in master for a while before we
>>> backport it...
>>
>> I'm Ok waiting a bit longer to test it in master. I'll ping on it later...
>>
>> But this fixes a very common issue that affects different platforms from
>> different BSP layers, including BeagleBone Black in meta-yocto-bsp. The goal
>> is to be least intrusive and preserve the old udev cache behavior as much as
>> possible. Alternative options were to disable udev cache completely or
>> forcefully load necessary modules when they won't be probed on subsequent
>> boots.
>
> Hi, Richard,
>
> Was it enough wait time to get the change tested in master? Should I re-submit
> the patch for daisy one more time or you have it in the archives? Thanks!
>
I have it in my daisy-next (1.6.2) branch (I know it's not in daisy yet).

Sau!


