Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38DD27952D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 08:19:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w868Jq3W000940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 01:19:52 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.161) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 01:19:51 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<57018506-c661-a554-01a9-42f4de2cabb9@windriver.com>
	<cea8be2755a95002fb28718121baa756a7e4f668.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <0b2eb458-7af6-3f7f-396c-461bb2bdb54c@windriver.com>
Date: Thu, 6 Sep 2018 16:22:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cea8be2755a95002fb28718121baa756a7e4f668.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/8] python: Run pybench once for optimisation task in pgo
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
X-List-Received-Date: Thu, 06 Sep 2018 08:19:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 09/06/2018 04:17 PM, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2018-09-06 at 16:15 +0800, Robert Yang wrote:
>> What's the fault if I don't run it, please ? This is very slow, here
>> are some rough thoughts to speed it up:
>>
>> 1) Make it optional to run, and default to no if there isn't any
>> faults without running it.
> 
> Without running it, python is not profile optimised and runs slower.
> 
>> 2) Use qemu-kvm to run the tests if qemu kvm has been setup (I tried
>> it, it can
>>      reduce form 12m -> 4m, saved 8 mins:
>>      * Without kvm
>>        $ bitbake python3 -ccleansstate && time bitbake python3
>>        real    12m28.070s
>>        user    0m1.316s
>>        sys     0m0.184s
>>
>>      * With kvm:
>>      real    3m53.781s
>>      user    0m1.080s
>>      sys     0m0.220s
>>
>>     We may need a oe-core/scripts/qemu-kvm-check to check strictly
>> whether kvm
>>     can be used or not.
>>
>> Please feel free to give your comments.
> 
> Ross has some patches coming in this area which should improve things a
> lot so I'd suggest we wait for those. I merged the n10 -> n1 change
> simply because it was an easy fix to same some time whilst the other
> patches a debugged.

Sounds great, thanks.

// Robert

> 
> Cheers,
> 
> Richard
> 

