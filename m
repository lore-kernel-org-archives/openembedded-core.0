Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sp3pL-00065L-9l
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 22:48:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Jul 2012 13:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121306590"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jul 2012 13:36:49 -0700
Message-ID: <4FFDE3E0.2040900@linux.intel.com>
Date: Wed, 11 Jul 2012 13:36:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FFD0425.7040004@intel.com> <1342004414.7934.11.camel@ted>
	<CAEsOVNfeZBjERBFsXSWqihHccROAR3N4kRGgW8XhpJd4iKzRdw@mail.gmail.com>
	<1625033.FUQGRG6suy@helios> <1342032628.11939.37.camel@ted>
In-Reply-To: <1342032628.11939.37.camel@ted>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Upcoming Yocto 1.2.1 "denzil" release this week.
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
X-List-Received-Date: Wed, 11 Jul 2012 20:48:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2012 11:50 AM, Richard Purdie wrote:
> On Wed, 2012-07-11 at 19:00 +0100, Paul Eggleton wrote:
>> On Wednesday 11 July 2012 17:55:18 McClintock Matthew-B29882 wrote:
>>> On Wed, Jul 11, 2012 at 6:00 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Wed, 2012-07-11 at 09:57 +0100, Jack Mitchell wrote:
>>>>> Are Khems eglibc patches going to make it in for this - 2.16 is playing
>>>>> havoc with my builds at the moment and surely will with everyone else
>>>>> when the major distros catch up.
>>>>
>>>> Its too late to get those pieces into 1.2.1, they're not even in master
>>>> yet, let alone in a stable release branch.
>>>>
>>>> I'm proposing we get 1.2.1 out, get the 2.16 pieces tested in master,
>>>> then port them to the denzil branch quickly post release so they'd make
>>>> any 1.2.2 release and are available on the git branch for people using
>>>> the stable branch.
>>>
>>> Can you fill me in? Why would a point release include such a dramatic
>>> upgrade?
>>
>> I think what we would be looking at would be just adding the fixes to allow the
>> native packages to build against eglibc 2.16 so it can work on host distros
>> that use it, not bringing eglibc 2.16 itself in for the target.
>
> Right, this would just be to allow edison to work on systems that have a
> native eglibc 2.16. I'm not convinced we have the patches worked out yet
> though. Target eglibc would remain with whatever is in edison (2.13?).
>
I assume you mean denzil, not edison, or do we also need to be planning 
a 1.1.3?

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
>



