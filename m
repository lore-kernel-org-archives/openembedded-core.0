Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 525457FBEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 03:27:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00K3QM8s004970
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 19 Jan 2020 19:26:38 -0800
Received: from [128.224.162.144] (128.224.162.144) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 19 Jan 2020 19:26:18 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <1579405812-336202-1-git-send-email-mingli.yu@windriver.com>
	<20200119053240.2276.68036@do> <5E23EC1D.2080407@windriver.com>
	<2583767.pvHsQr8YWX@shodan> <5E250399.1000807@windriver.com>
	<54d24332531b41c2a29671f2181f9458@XBOX03.axis.com>
	<5E2518BC.7090306@windriver.com>
	<f8005a9c8aae479db77809bb1132e04c@XBOX03.axis.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5E251E3F.5070703@windriver.com>
Date: Mon, 20 Jan 2020 11:27:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <f8005a9c8aae479db77809bb1132e04c@XBOX03.axis.com>
X-Originating-IP: [128.224.162.144]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIE9wZW4gZmlsZSB3aXRoIE9fQ0xPRVhFQyB0byBhdm9pZCBmZCBsZWFrIChyZXYzKQ==?=
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
X-List-Received-Date: Mon, 20 Jan 2020 03:27:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 01/20/20 11:15, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Yu, Mingli <mingli.yu@windriver.com>
>> Sent: den 20 januari 2020 04:04
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Paul Eggleton
>> <paul.eggleton@linux.intel.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] ✗ patchtest: failure for Open file with O_CLOEXEC
>> to avoid fd leak (rev3)
>>
>> On 01/20/20 10:28, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-
>>>> bounces@lists.openembedded.org> On Behalf Of Yu, Mingli
>>>> Sent: den 20 januari 2020 02:34
>>>> To: Paul Eggleton <paul.eggleton@linux.intel.com>
>>>> Cc: openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] ✗ patchtest: failure for Open file with
>> O_CLOEXEC
>>>> to avoid fd leak (rev3)
>>>>
>>>> On 01/20/20 09:29, Paul Eggleton wrote:
>>>>> Hi Mingli
>>>>>
>>>>> On Sunday, 19 January 2020 6:41:49 PM NZDT Yu, Mingli wrote:
>>>>>> On 01/19/20 13:32, Patchwork wrote:
>>>>>>> == Series Details ==
>>>>>>>
>>>>>>> Series: Open file with O_CLOEXEC to avoid fd leak (rev3)
>>>>>>> Revision: 3
>>>>>>> URL   : https://patchwork.openembedded.org/series/22123/
>>>>>>> State : failure
>>>>>>>
>>>>>>> == Summary ==
>>>>>>>
>>>>>>>
>>>>>>> Thank you for submitting this patch series to OpenEmbedded Core.
>> This
>>>> is
>>>>>>> an automated response. Several tests have been executed on the
>>>> proposed
>>>>>>> series by patchtest resulting in the following failures:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> * Issue             Series does not apply on top of target branch
>>>> [test_series_merge_on_head]
>>>>>>>       Suggested fix    Rebase your series on top of targeted branch
>>>>>>>       Targeted branch  master (currently at 9d7a521971)
>>>>>>
>>>>>> Have already rebased on the master branch of
>>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/, why still issue
>> out
>>>>>> the above issue? Any hint?
>>>>>
>>>>> It's assuming that patches sent to this list are for OE-Core (which
>> they
>>>>> generally are). I wasn't aware but apparently the documented place to
>>>>> send pseudo patches is this list, so I think in this case you can just
>>>>> ignore patchtest.
>>>>
>>>> Okay, many thanks Paul for your hint!
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> Cheers,
>>>>> Paul
>>>
>>> But it is probably a good idea to include a "[pseudo]" tag in the
>> subject
>>> when sending patches related to pseudo to this list, as the expectation
>>> otherwise is that they are for OE-Core.
>>
>> Thanks Peter! And already add the "pseudo_util.c" tag in the subject in
>> the v3, please check the mail with the subject "[OE-core] [PATCH v3]
>> pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak".
>
> That is not the same. The "pseudo_util.c:" is part of the commit subject
> and will end up in the Git repository. A "[pseudo]" tag is for anyone
> seeing the mail (possibly including patchwork and patchtest), letting
> them know that this commit is about pseudo, not OE-Core (similar to the
> "[PATCH v3]" tag, which is also information about the commit).

Got it! V4 is incoming.

Thanks,

>
>> Thanks,
>>
>>> //Peter
>
> //Peter
>

