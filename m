Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rs12X-0003Qw-Gp
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 00:53:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2012 15:45:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="102051320"
Received: from unknown (HELO [10.255.14.89]) ([10.255.14.89])
	by orsmga001.jf.intel.com with ESMTP; 30 Jan 2012 15:45:43 -0800
Message-ID: <4F272BA7.9060305@linux.intel.com>
Date: Mon, 30 Jan 2012 15:45:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CALbNGRS-WsE45UakTV5VE2T5bAxb1C2iWgPeN+Ys+OTx-i48Rw@mail.gmail.com>
	<CALbNGRR8cJJfDcHm1hX8cRf7JOKwkoU-sySx1mYujMgXJYHBdA@mail.gmail.com>
	<CALbNGRQza2-LE2bH2Z51nC9jVsNk6Vind3JqOfk1vU7z3+x13g@mail.gmail.com>
	<7463040.mHMHaff4Os@helios>
	<CALbNGRRdC_Au4174RUZvr20hB1+PTqNuOmkHpoykEOtwbF-8ww@mail.gmail.com>
	<CALbNGRT4=F0cbdJ4oO1HmuhXnfmmmoBG1mWqziyDLM+vb-BKiw@mail.gmail.com>
In-Reply-To: <CALbNGRT4=F0cbdJ4oO1HmuhXnfmmmoBG1mWqziyDLM+vb-BKiw@mail.gmail.com>
Subject: Re: [oe] evince: who is responsible to pack all within usr/lib/evince/3/backends to ${PN}?
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
X-List-Received-Date: Mon, 30 Jan 2012 23:53:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/28/2012 04:08 PM, Andreas Müller wrote:
> On Sat, Jan 28, 2012 at 11:46 PM, Andreas Müller
> <schnitzeltony@googlemail.com>  wrote:
>> On Sat, Jan 28, 2012 at 4:03 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com>  wrote:
>>> On Saturday 28 January 2012 00:29:28 Andreas Müller wrote:
>>>> Have modified bitbake.conf here to
>>>>
>>>> PACKAGES = "${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN} ${PN}-doc
>>>> ${PN}-locale"
>>>>
>>>> now I get the expected behavior.
>>>>
>>>> Will start a build from scratch for the night to see if there is some
>>>> fallout..
>>>
>>> We would need to be extremely careful before changing the default value of
>>> PACKAGES. I would strongly suggest you enable buildhistory when you do this so
>>> you can spot any changes easily, particularly in package content.
>>>
>> I am afraid you are so right: First build fallout is db. It shows that
>> the current implementation
>>
>> SOLIBS = ".so.*"
>> SOLIBSDEV = ".so"
>>
>> fails at least here. The main shared lib is found in -dev!
>>
>> Uhhh cold in here...
>>
> How about splitting bitbake.conf changes:
> 1. Now: move ${PN}-staticdev before ${PN}. This should not have the
> dramatic impact and makes it easier to fix new QA warnings.
> 2. (Much) later ${PN}-dev before ${PN}. This has huge impact and needs
> massive testing
>
 From my understanding there are reasons (that I can't remember right 
now) why ${PN} is where it is. As you note it might not be helpful in 
this case anyways because of the ${BPN}/3.

Sau!

> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


