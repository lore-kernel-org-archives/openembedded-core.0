Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SWVE3-0004Uk-1J
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 18:12:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 May 2012 09:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102447311"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by AZSMGA002.ch.intel.com with ESMTP; 21 May 2012 09:02:41 -0700
Message-ID: <4FBA6721.1000405@linux.intel.com>
Date: Mon, 21 May 2012 09:02:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337581961.git.sgw@linux.intel.com>
	<4FBA63A2.9090005@windriver.com>
	<CABcZAN=0JDHip7=E99Dh_mNUgkmtny5z0HbyEq0uh2_+-ehsUg@mail.gmail.com>
In-Reply-To: <CABcZAN=0JDHip7=E99Dh_mNUgkmtny5z0HbyEq0uh2_+-ehsUg@mail.gmail.com>
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [RFC v1 0/1] Reorder ${PN} and ${PN}-dev
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
X-List-Received-Date: Mon, 21 May 2012 16:12:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2012 08:54 AM, Chris Larson wrote:
> On Mon, May 21, 2012 at 8:47 AM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> On 5/21/12 1:42 AM, Saul Wold wrote:
>>>
>>> This RFC is the first pass at reordering the above 2 items in
>>> the PACKAGES list. This is in part an out cropping of the bug
>>> #2367 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=2367),
>>> which show the miss packaged pcap-config file.
>>
>>
>> I've often wondered why the order is the way it is.  If I were to do this
>> from scratch, I'd move the ${PN} item to last in the default order.  Have
>> you considered this more radical approach, that would then allow all of the
>> default splits to occur before the ${PN} processing.  (It might also allow
>> the ${PN} to simply be a "/*" instead of more complex rules.)
>
> This would be quite nice, if we could pull it off without breaking
> anything horribly.

I will give it a try and post a buildhistory repo in a couple of days, 
it will be alot to compare!

Sau!


