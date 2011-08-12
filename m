Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrvb2-0001FP-Ho
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 19:32:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2011 10:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37247216"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by orsmga002.jf.intel.com with ESMTP; 12 Aug 2011 10:28:02 -0700
Message-ID: <4E4562A1.4050603@linux.intel.com>
Date: Fri, 12 Aug 2011 10:28:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313078412-6872-1-git-send-email-noor_ahsan@mentor.com>	<201108121010.51135.paul.eggleton@linux.intel.com>	<B10F3DBD-4A1F-45AE-886D-A08FDDA130E8@dominion.thruhere.net>
	<201108121129.23973.paul.eggleton@linux.intel.com>
In-Reply-To: <201108121129.23973.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] bluez4: Added new recipe version 4.96
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
X-List-Received-Date: Fri, 12 Aug 2011 17:32:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2011 03:29 AM, Paul Eggleton wrote:
> On Friday 12 August 2011 11:11:24 Koen Kooi wrote:
>> On a more serious note, how does one become a maintainer for a recipe in
>> OE-core? Bluez4 only seems to get updates when someone tries to update
>> recipes-connectivity/* and doesn't seem to get actually used or runtime
>> tested.
>
> Surely maintainer or not you can just test and send patches for the BlueZ
> recipe in OE-core as you would any other recipe? I suspect if you do this
> often enough you'll become the de-facto maintainer anyway.
>
Koen,

Paul is right, and you also have a good point about becoming a 
maintainer. Currently as you have seen, its mostly the Yocto Team doing 
updates with some other fixes and updates coming from the community and 
that these updates are when a team member goes through and does a load 
of them at once.

If you would like to update a recipe, feel free to send tested patches. 
Moving forward, I will propose a process to the OE-Core TSC that would 
include some basic requirements of maintainership, so things don't drift 
into staleness.

Thanks
	Sau!


> Cheers,
> Paul
>


