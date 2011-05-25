Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPM0j-0005Cx-5u
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 23:53:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2011 14:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,269,1304319600"; 
   d="scan'208";a="1755118"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 14:49:38 -0700
Message-ID: <4DDD7971.5060703@linux.intel.com>
Date: Wed, 25 May 2011 14:49:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1306354721-16325-1-git-send-email-koen@dominion.thruhere.net>
	<1306359819.27470.68.camel@rex>
In-Reply-To: <1306359819.27470.68.camel@rex>
Subject: Re: [PATCH] dbus: split X11 dependant dbus-launch into its own subpackage
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
X-List-Received-Date: Wed, 25 May 2011 21:53:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/25/2011 02:43 PM, Richard Purdie wrote:
> On Wed, 2011-05-25 at 22:18 +0200, Koen Kooi wrote:
>> This makes dbus usable in non-X enviroments like QT/e
>>
>>  From the original commit in OE .dev:
>>
>> commit 8e25448fb01b6fa6ea3a86f9327f080cd753dfbc
>> Author: John Lee<john_lee@openmoko.org>
>> Date:   Fri Sep 5 11:37:39 2008 +0000
>>
>>      dbus: enable x support and put dbus-launch into new package dbus-x11
>>      * Enable x support only add rdepends to dbus-launch.  Make it a
>>        seperate package so other packages like dbus does not rdepend on
>>        libx11.
>
> Which pieces of the system use dbus-launch and do we need to add
> dependencies to them after this change to pull in the dbus-x11 package?
>
Richard there is a patch from Khem back on 5/7 that replaces gconf-dbus 
but did not have all the parts in place, I think this is the first steps 
to getting the parts in place to beable  to untangle the gconf dbus stuff

Sau!

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



