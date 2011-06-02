Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QS1ql-00055Z-8u
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 08:57:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Jun 2011 23:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; 
   d="scan'208";a="5742786"
Received: from unknown (HELO [10.255.12.203]) ([10.255.12.203])
	by azsmga001.ch.intel.com with ESMTP; 01 Jun 2011 23:54:34 -0700
Message-ID: <4DE733A9.4010502@linux.intel.com>
Date: Wed, 01 Jun 2011 23:54:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306909184.git.sgw@linux.intel.com>	<f1c4bd3cef1b384787b418e737c93cd105635196.1306909184.git.sgw@linux.intel.com>	<1306949369.27470.443.camel@rex>	<1306952390.14389.1.camel@lenovo.internal.reciva.com>
	<A58DF9E1-A81F-41E0-B687-CFBB3FE66E82@dominion.thruhere.net>
In-Reply-To: <A58DF9E1-A81F-41E0-B687-CFBB3FE66E82@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [CONSOLIDATED PULL 24/32] bitbake.conf: Create	static-dev pacakge for static libraries
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
X-List-Received-Date: Thu, 02 Jun 2011 06:57:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2011 11:27 AM, Koen Kooi wrote:
>
> Op 1 jun 2011, om 20:19 heeft Phil Blundell het volgende geschreven:
>
>> On Wed, 2011-06-01 at 18:29 +0100, Richard Purdie wrote:
>>> I've also a slight preference for "staticdev" just to make these clearly
>>> different from -dev packages.
>>
>> Agreed.  I think even "-static" might be better still.
>
> That's what we did in OE and it caused some troubles in the busybox-static and mplayer-static cases. But that were the only ones I encountered.
>
What about -staticlibs since that what they the packages actaully contain?

Sau!
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


