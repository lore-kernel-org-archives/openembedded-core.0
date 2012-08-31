Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7Uab-0005iG-Eh
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 19:01:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Aug 2012 09:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,348,1344236400"; d="scan'208";a="187665746"
Received: from unknown (HELO [10.255.12.251]) ([10.255.12.251])
	by orsmga001.jf.intel.com with ESMTP; 31 Aug 2012 09:48:42 -0700
Message-ID: <5040EAEA.7050000@linux.intel.com>
Date: Fri, 31 Aug 2012 09:48:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1346369662-17265-1-git-send-email-sgw@linux.intel.com>
	<A19E8B5D-4A0F-439C-B67C-8CBB0CE84E16@dominion.thruhere.net>
In-Reply-To: <A19E8B5D-4A0F-439C-B67C-8CBB0CE84E16@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: Ignore eth0 cleanup when booting over the network
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
X-List-Received-Date: Fri, 31 Aug 2012 17:01:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2012 12:28 AM, Koen Kooi wrote:
>
> Op 31 aug. 2012, om 01:34 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
>
>> There was a change to connman, such that it cleans up the
>> route table for devices at startup, this was causing the
>> network to get lost and NFS to loose it connection.
>>
>> The -I option will cause the device to be ignored.
>
> Apart from the missing PR bump, what happens when you don't boot of the network? Will connman keep ignoring eth0?
> FWIW I asked about nfsroot and connman and Marcel said: don't do that! So I'm inclined to say that if you're using nfsroot you shouldn't be using connman.
>
What if there are multiple network interfaces, but just one (eth0, usb0, 
...) is the nfsroot provider?

Is there a way to determine which interface nfs is active on and only 
ignore that one?

I am going to disable connmand for now in a v2 patch, but I think we 
need to address this better either via connman or here in oe-core.

Sau!



