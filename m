Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RE2wa-0007gN-M2
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 19:50:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Oct 2011 10:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,335,1315206000"; d="scan'208";a="72822668"
Received: from unknown (HELO [10.255.15.65]) ([10.255.15.65])
	by fmsmga001.fm.intel.com with ESMTP; 12 Oct 2011 10:44:29 -0700
Message-ID: <4E95D1FD.3020608@linux.intel.com>
Date: Wed, 12 Oct 2011 10:44:29 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1318371066.git.josh@linux.intel.com>
	<1318423185.23801.153.camel@ted>
In-Reply-To: <1318423185.23801.153.camel@ted>
Subject: Re: [RFC PATCH 0/1] QA check for defined packages
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
X-List-Received-Date: Wed, 12 Oct 2011 17:50:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 10/12/2011 05:39 AM, Richard Purdie wrote:
> On Tue, 2011-10-11 at 15:29 -0700, Joshua Lock wrote:
>> Folks,
>>
>> I'm looking for some comments on this WIP patch.
>>
>> The reason I've added this is because the hob GUI requires us to offer much
>> more reliable metadata - we show the user available packages, as defined by
>> each recipe, to add to their image. Should a recipe define a package and yet
>> not actually create it and the user has included that in their image we cause
>> errors at build time.
>>
>> However whilst the idea seems sound enough, there are some caveats - running
>> a world build with this patch I see failures fairly early on at least a few
>> of which I'd expect we'll need to special-case:
>> * eglibc-local
>> * linux-yocto
>> * linux-libc-headers
>> * gcc-runtime
> 
> You'd probably get much better results from this patch if you account
> for ALLOW_EMPTY_<pkgname> btw...

Indeed, that does look useful.

So, ignoring the Hob discussion I still think this QA check will be
generally useful. Are others open to this if I work on it further?

Regards,

Joshua
--
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


