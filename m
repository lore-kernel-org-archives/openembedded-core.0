Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC4E6025E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 15:56:53 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id y192so1872271pgd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=d2Rz6fA3psTJgOhh3jjxevWbiN2qMHSJ6rg/RT3K71k=;
	b=m+8UyiD8IHOTzbmuakuqmcbH6CvHHov3Q6K3EL+YoqYLGDMX+zlXi9QU+VwQ8DnUgT
	LjBTdJ7KpPp6uXGYYlbXg3zC5AhbOq9jMtu/apsb9AxVIfU2Fw7g1XlH8GJdDcQi2ESJ
	Sg/PB9zp0C7guvR+peBShMPq9bgS/pz79acIqb1f/BybpyCVq8wYOZ5SUuThxZDkBjVA
	bOFAhB6RPogCICekT7CeEHL0HGLbhCZ5MEdScSC+2K7iA5j4EqEIIPi7T7MjCFxPVJOp
	baPCgCvpcSCvos9bx/OkU+SK0iMmYb4K3W7dgWAyOWguV4Dkq5kuJe8FMhAh2asw2wGa
	7DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=d2Rz6fA3psTJgOhh3jjxevWbiN2qMHSJ6rg/RT3K71k=;
	b=Qe7SqmxjsU/SKjia+wECKxz8sajfHbHc8/A5llh1u/78naB0i+VRtoA+gQDHLUSi/y
	f7RguPnnbw3ZRwLFDZWdsAWDJa+hvQx8dU7ps1eHz+E0jCbJkbTGq22sisovJ91MVhmH
	XS1aQTAaszQIWPdIj5bTQ/HdIzN60qvXQBuF6USe4rxj5KC/3xqmK14S6/oDfgzyNKhZ
	/h/D3qsfJAiH1M0j0gLITKoVAGvyTW9axRFIcgy0xDddkIQAb3NgAETXgfHl5PefkIkD
	GMopa/n/NRm3Nv1eSiGTZe1zIqWRRz8FpsmqO3R4biNTV3388eRJboSLW3l57WEx45eK
	LqoQ==
X-Gm-Message-State: AIVw113yLXgYOwwg7Pdmy6Ta1C6woeLHNtvtfpms/8eoaGkKq99Zz9nx
	p5r8zGYmdWYQ65M4
X-Received: by 10.98.102.74 with SMTP id a71mr2135475pfc.73.1501775815374;
	Thu, 03 Aug 2017 08:56:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:495b:a874:3d87:cf06?
	([2601:202:4001:9ea0:495b:a874:3d87:cf06])
	by smtp.gmail.com with ESMTPSA id
	n3sm72146951pfb.87.2017.08.03.08.56.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 08:56:54 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, Mark Hatle <mark.hatle@windriver.com>
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
	<1501521367-17192-2-git-send-email-akuster808@gmail.com>
	<b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
	<1984b5e8-8d54-4f03-dcdb-b086605b4a91@gmail.com>
	<c5907c3e-ae33-625a-d214-30d130a5a37b@windriver.com>
	<e0e65de3-e49a-b1af-9bd7-67a6d33ba859@gmail.com>
	<ef1580a9-9643-f8ad-1865-78fc5f6aeec4@gmail.com>
	<CAMKF1sp+4C4XPUf5Xhc=fhKiidy-YHqrkLZzhGpToTexCV=1pg@mail.gmail.com>
	<0ba13ea2-54b8-f447-1e85-5f84a15c3f82@windriver.com>
	<CAMKF1sp4xrp0hEXh2sY3tb0Sk61S8k_ToX=LBQfp5e3ioYUtOQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9ed788dd-bac2-378d-5263-23a5dfab40a4@gmail.com>
Date: Thu, 3 Aug 2017 08:56:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp4xrp0hEXh2sY3tb0Sk61S8k_ToX=LBQfp5e3ioYUtOQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] armv8: update to use armv8-a tune
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
X-List-Received-Date: Thu, 03 Aug 2017 15:56:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 08/01/2017 08:46 AM, Khem Raj wrote:
> On Tue, Aug 1, 2017 at 8:24 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 8/1/17 10:20 AM, Khem Raj wrote:
>>> On Tue, Aug 1, 2017 at 8:17 AM, akuster808 <akuster808@gmail.com> wrote:
>>>>
>>>> On 07/31/2017 12:04 PM, Khem Raj wrote:
>>>>>
>>>>> On 7/31/17 10:51 AM, Mark Hatle wrote:
>>>>>> On 7/31/17 12:40 PM, akuster808 wrote:
>>>>>>>
>>>>>>> On 07/31/2017 10:31 AM, Mark Hatle wrote:
>>>>>>>> On 7/31/17 12:16 PM, Armin Kuster wrote:
>>>>>>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>>>>>>> ---
>>>>>>>>>    meta/conf/machine/include/arm/arch-armv8.inc | 25
>>>>>>>>> +++++++++++++++++++++++++
>>>>>>>>>    1 file changed, 25 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>>> b/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>>> index 5e832fa..dc1ba5e 100644
>>>>>>>>> --- a/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>>> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>>>>> @@ -1 +1,26 @@
>>>>>>>>> +DEFAULTTUNE ?= "armv8-a"
>>>>>>>> do we want the '-a'?  The other arm (7) are of the format armv7a (no
>>>>>>>> '-').
>>>>>>> works for me either way.
>>>>>>>
>>>>>>> While we are at it. How would we want ‘armv8.1-a’, ‘armv8.2-a’,
>>>>>>> ‘armv8.3-a'
>>>>>>> formated as?
>>>>>> My preference is to drop the '-'.  As for the '.', I'm not sure.. not
>>>>>> something
>>>>>> we've run across before.
>>>>>>
>>>>>> We could just drop it (the '.'), but it really depends on if armv81a
>>>>>> would
>>>>>> confuse someone (familiar with arm) or not.
>>>>> I would suggest to also sync  with other distros and ensure that we dont
>>>>> do something different. Its very costly later. Since applications get
>>>>> ported to most common combination
>>>> Sync what part? naming of file? ( sorry lost regarding your comment)
>>> naming convention for arch e.g.
>>>
>> I'd say Debian/Ubuntu -- Fedora/RH would be the two primary sources I'd look at.
>>   Between debian package names and RPM package names, it should give a clue if
>> there is any community standard forming for those names.
>>
>> (May still be too premature for those environments for the armv8.X-a naming...
>> and I've not seen it discussed on any other lists either.)
> yeah, it will be good to not go through the pain of community doing
> something else later
> like *-*-gnueabihf triplet was invented and to date we keep fixing
> packages for OE
> to account for gnueabihf can be gnueabi + -mfloat-abi=hard but
> packages just assume

I think I now understand the issue. Any interest in having additional 
tune files warehoused somewhere so folks don't have to reinvent the 
wheel? Something like "meta-extra-tunes" ?

I prefer fostering contributions for additional tune files that get 
vetted by the community rather than the multitude of unseen 
implementations I have found sitting around.

regards,
armin

>
>
>> --Mark


