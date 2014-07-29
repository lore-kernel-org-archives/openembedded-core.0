Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93F06708B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 00:53:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6T0rK2O021095
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 17:53:20 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 28 Jul 2014 17:53:19 -0700
Message-ID: <53D6F081.5080200@windriver.com>
Date: Tue, 29 Jul 2014 08:53:21 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1406545263-7393-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1soxPmXjX6bbcto=c1qHvJB1bgdJdgTpz8dA-ibBp-7Tgg@mail.gmail.com>
	<53D6EC88.1000001@windriver.com>
	<CAMKF1so6G_mGW0jMXYS6Mf+PFVXQV8Vt=fkb=55Gc6p4LsRoTA@mail.gmail.com>
In-Reply-To: <CAMKF1so6G_mGW0jMXYS6Mf+PFVXQV8Vt=fkb=55Gc6p4LsRoTA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: redefine a function
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
X-List-Received-Date: Tue, 29 Jul 2014 00:53:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/29/2014 08:43 AM, Khem Raj wrote:
> On Mon, Jul 28, 2014 at 5:36 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
>>
>>
>> On 07/29/2014 01:25 AM, Khem Raj wrote:
>>>
>>> On Mon, Jul 28, 2014 at 4:01 AM,  <rongqing.li@windriver.com> wrote:
>>>>
>>>> +[PATCH] reimplement umul_ppmm to make it be able to building on mips64
>>>> 64bit ABI
>>>> +
>>>> +Upstream-Status: Pending[This version was not maintained by upstream,
>>>> larger versions have been fixed]
>>>> +
>>>
>>>
>>> if you mean newer release have been fixed then this patch should be
>>> marked 'Backport'
>>>
>>
>>
>> newer releases are GPLv3, we can not backport patch from them
>
> I see. So you did a clean room implementation then ? if not then
> you could request the original patch author to release it under GPLv2
> license for back portability
>

Ok, I will ask;
But If the author do not like to release it under GPLv2, what should I do?

-Roy


>>
>> -R
>>
>>>
>>
>> --
>> Best Reagrds,
>> Roy | RongQing Li
>
>

-- 
Best Reagrds,
Roy | RongQing Li

