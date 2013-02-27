Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UAiYu-0004zB-Cz
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 16:05:08 +0100
Message-ID: <512E1CBE.5010605@communistcode.co.uk>
Date: Wed, 27 Feb 2013 14:48:30 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <512E0E4E.8060205@communistcode.co.uk>
	<512E0FA9.3030007@communistcode.co.uk>
	<512E10A8.2080407@communistcode.co.uk>
	<512E1184.1040202@communistcode.co.uk>
	<512E13DD.3070106@communistcode.co.uk>
	<CAMKF1sqzyqx1FpCHROTJkgrAjQ+xze8bEeT4-vOdCDDN94TzVQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqzyqx1FpCHROTJkgrAjQ+xze8bEeT4-vOdCDDN94TzVQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GCC + Texinfo 5
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
X-List-Received-Date: Wed, 27 Feb 2013 15:05:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/13 14:42, Khem Raj wrote:
> On Wed, Feb 27, 2013 at 6:10 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> On 27/02/13 14:00, Jack Mitchell wrote:
>>> On 27/02/13 13:56, Jack Mitchell wrote:
>>>> On 27/02/13 13:52, Jack Mitchell wrote:
>>>>> On 27/02/13 13:46, Jack Mitchell wrote:
>>>>>> As with the recent binutils texinfo5 compatibility I believe GCC now
>>>>>> also has the same failings, please see attached log.
>>>>>>
>>>>>> I've had a quick look for patches but I am not at all familiar with the
>>>>>> GCC development process and I came up empty handed.
>>>>>>
>>>>>> Cheers,
>>>>>>
>>>>> Ok, one patch found, there seems to be some @anchor problems too; I'll
>>>>> see if I can dig anything up.
>>>>>
>>>>> http://lists.gnu.org/archive/html/bug-coreutils/2012-07/msg00045.html
>>>>>
>>>> Appologies, that isn't even for GCC :(
>>>>
>>> Ok, this is the patch; I'll look into trying to use it in the GCC recipes
>>> but they're pretty complicated...
>>>
>>> http://patchwork.ozlabs.org/patch/222861/
>>
>> Ok, this doesn't apply cleanly and I can't unwind the patch trail to get to
>> this state; if someone knows of a way to do that I would be grateful!
>>
>>
> open a bug for it too
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3947

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



