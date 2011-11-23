Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RT84g-0002cH-8d
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 09:20:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Nov 2011 00:14:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,557,1315206000"; d="scan'208";a="40411032"
Received: from unknown (HELO envy.home) ([10.255.12.75])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Nov 2011 00:14:25 -0800
Message-ID: <4ECCAB63.6080906@linux.intel.com>
Date: Wed, 23 Nov 2011 00:14:27 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4ECC9A64.4080009@linux.intel.com>
	<C39A2CE4-DFD3-4C4D-B9F3-B37406404A1C@dominion.thruhere.net>
	<4ECCA876.4080201@linux.intel.com> <1410925.ON6BTprex7@helios>
In-Reply-To: <1410925.ON6BTprex7@helios>
X-Enigmail-Version: 1.3.3
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: RFC: grub-efi native tools
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
X-List-Received-Date: Wed, 23 Nov 2011 08:20:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 11/23/2011 12:10 AM, Paul Eggleton wrote:
> On Wednesday 23 November 2011 00:01:58 Darren Hart wrote:
>> On 11/22/2011 11:36 PM, Koen Kooi wrote:
>>> One way:
>>>
>>> DEPENDS = "grub-efi-native"
>>> DEPENDS_virtclass-native = ""
>>
>> Ah, nice. I presume I can also zero out a function for the virtclass-native?
>>
>> do_compile_append() {
>> 	... non-native stuff ...
>> }
>>
>> do_compile_append_virtclass-native() {
>>
>> }
> 
> Unfortunately no, the second will not wipe out the first since appends are 
> cumulative. The non-native append would have to be qualified with an override 
> (or its content wrapped in a conditional statement).

Right, duh. Thanks for clarifying that.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


