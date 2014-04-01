Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 601AD60DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 12:54:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s31Csj00000298
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Apr 2014 05:54:45 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 1 Apr 2014 05:54:45 -0700
Message-ID: <533AB712.2000809@windriver.com>
Date: Tue, 1 Apr 2014 08:54:42 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>	<e6015802086cbf8199d112a3e75a7391a417ede6.1396288310.git.bruce.ashfield@windriver.com>	<CAMKF1srOv27-6SwSfYxFLL0-BvHk7hxWBmn6twtY+hpQ9rTYww@mail.gmail.com>	<5339C30B.1060005@windriver.com>
	<CAMKF1srfDpeGkQMnHkK_AFPy6N7pujtLwMRsgbsDeHem82_5nA@mail.gmail.com>
	<5339C6FD.1070506@windriver.com>
	<A5D0F3B0-A739-4D0D-A9C5-926BBEB9CD35@gmail.com>
In-Reply-To: <A5D0F3B0-A739-4D0D-A9C5-926BBEB9CD35@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libc-headers: set TC default to 3.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 12:54:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-04-01 02:42 AM, Khem Raj wrote:
>
> On Mar 31, 2014, at 12:50 PM, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>
>>> i dont believe you tested all layer combinations
>>
>> I've tested everything I can, as has the autobuilder. I can't offer
>> any more than this.
>>
>>>>
>>>>
>>>>> at this point. 3.10 being LTS
>>>>> I would assume its a better option to keep at 3.10
>>>>
>>>>
>>>> I disagree, this is consistent with other releases and the documented
>>>> plan of action. I'd rather not have a massive version jump in the fall.
>>>
>>> its probably not a bad option to stick to LTS version for kernel headers
>>> after all
>>
>> Again, I disagree.
>>
>> We can maybe keep the 3.10 recipe around,
>
> Thats ugly too. We decided to stick to one version of headers last time.
>
>> but the default should
>> be 3.14, we need a matched kernel and libc-headers to get the best integration
>> and leveraging of the latest features.
>>
>> If we pull the headers, pull the kernel.
>
> this all is understood, however we have to get better with timings especially
> changing something like kernel headers whose impact is far reaching then
>   just updating kernel proper.

We do the best we can and I can only play the timing that is dealt
by the upstream projects ... but we all know that!

We arranged for as much soak testing and building as we could behind
the scenes.

That being said, we are going to introduce the versioned kernel and
libc-headers recipes in the -rc1 timeframe next time around and we
captured that intention on the kernel planning wiki for 1.7 .. so that
should help in the next cycle.

Cheers,

Bruce

>


