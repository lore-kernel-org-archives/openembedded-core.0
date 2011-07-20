Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qjdm9-0002jP-G5
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 22:53:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Jul 2011 13:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,237,1309762800"; d="scan'208";a="29583575"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 20 Jul 2011 13:49:40 -0700
Message-ID: <4E273F64.9080305@linux.intel.com>
Date: Wed, 20 Jul 2011 13:49:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Kumar Gala <galak@kernel.crashing.org>
References: <1311097296-17200-1-git-send-email-galak@kernel.crashing.org>
	<4E270AF4.3050401@linux.intel.com>
	<40CB4CC7-500E-4976-82BD-400979681CEE@kernel.crashing.org>
In-Reply-To: <40CB4CC7-500E-4976-82BD-400979681CEE@kernel.crashing.org>
Cc: yocto@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] Add support for PowerPC e500v2/SPE
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
X-List-Received-Date: Wed, 20 Jul 2011 20:53:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 01:33 PM, Kumar Gala wrote:
>
> On Jul 20, 2011, at 12:05 PM, Saul Wold wrote:
>
>> On 07/19/2011 10:41 AM, Kumar Gala wrote:
>>> The majority of support for the PowerPC e500v2/SPE target already
>>> exists.  However some minor cleans are required to get things working
>>> completely.
>>>
>>> The e500v2 utilizes a unique floating point programming model / ABI from
>>> other PowerPC targets and thus requires special handling.
>>>
>>> - k
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> Merged into OE-Core
>>
>> Thanks
>> 	Sau!
>
> Thanks, how does this propagate to poky?
>
> - k
>
Kumar,

Once it's in OE-Core Richard (the maintainer of both) does a merge into 
the poky git repo, so by the time you get an ACK email, it should be 
propagated already.

Sau!


