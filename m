Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Ubobp-0003ev-Gf
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:00:48 +0200
Message-ID: <5190A747.6090403@communistcode.co.uk>
Date: Mon, 13 May 2013 09:41:43 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130428 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
	<9E4F6205-6171-4D60-A669-609A49F763C1@gmail.com>
	<518FD2F2.5070105@linux.intel.com>
	<020E3790-121B-49E9-87E3-55ACA9095B10@gmail.com>
	<5190166A.5050000@windriver.com>
In-Reply-To: <5190166A.5050000@windriver.com>
Subject: Re: [RFC] tcmode-default: Set 4.8 as default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 09:01:48 -0000
X-List-Received-Date: Mon, 13 May 2013 09:01:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/13 23:23, Bruce Ashfield wrote:
> On 13-05-12 5:49 PM, Khem Raj wrote:
>>
>> On May 12, 2013, at 10:35 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>>> On 05/12/2013 09:29 AM, Khem Raj wrote:
>>>> Hi Saul
>>>>
>>>> There is one serious problem that I ran into was that qemuarm 3.8 
>>>> kernel segfaulted
>>>> is it working for you ?
>>>>
>>> Nope your right there does appear to be a problem with ARM, I 
>>> thought we where have sanity test issues again, I just completed a 
>>> build and verified that I get a Kernel paninc with 3.8 Kernel and 
>>> 4.8 GCC.
>>>
>>> Not ready yet!
>>>
>>> Khem, are you looking into it?  I have CC'ed Bruce for the kernel also.
>>
>> haven't looked into the problem in detail. Its one of those either a 
>> problem in gcc or gcc uncovering a latent bug in kernel.
>
> I'll get myself set up and do a build on Monday, see if anything obvious
> pops up (i.e. start with the latest and see if it works, then bisect
> back). I'm already poking at mips64, so I can do this in parallel.
>
> Bruce
>
>>
>>
>

I know the beaglebone kernel was segfaulting on me until Koen updated to 
3.8.11, I think it included some important backports. Would definitely 
be worth a try, Koen can point to you to commit which fixed it, I seem 
to have lost the link into the IRC nether.

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



