Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qoz7c-0003Dv-99
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:42:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Aug 2011 07:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,316,1309762800"; d="scan'208";a="34408393"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Aug 2011 07:37:39 -0700
Message-ID: <4E3AAEB3.6070907@linux.intel.com>
Date: Thu, 04 Aug 2011 07:37:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311846297-30202-1-git-send-email-koen@dominion.thruhere.net>	<1311846558.30326.420.camel@phil-desktop>
	<D489697C-D752-4255-8110-9AC1468D4D87@dominion.thruhere.net>
In-Reply-To: <D489697C-D752-4255-8110-9AC1468D4D87@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCHv2] gst-plugins: partially sync packaging with OE .dev
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
X-List-Received-Date: Thu, 04 Aug 2011 14:42:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 03:14 AM, Koen Kooi wrote:
>
> Op 28 jul. 2011, om 11:49 heeft Phil Blundell het volgende geschreven:
>
>> On Thu, 2011-07-28 at 11:44 +0200, Koen Kooi wrote:
>>> +ALLOW_EMPTY = "1"
>>
>> Is that necessary?  You seem to be setting ALLOW_EMPTY_${PN}-meta=1 in
>> your python code anyway.
>
> In OE classic that was to keep ${PN} alive after all libs and apps were removed, I'm not sure we need it in OE-core.
>
Koen,

Are you re-submitting a v2 pf this patch or do you still want it to go 
as is?

Sau!

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


