Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A21271BFC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 16:30:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v81GUmlp009672
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Sep 2017 09:30:48 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Sep 2017 09:30:47 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
	<1504282084.2175.59.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <0579b565-b8e0-9995-84d0-7a239a268e14@windriver.com>
Date: Fri, 1 Sep 2017 12:30:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504282084.2175.59.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] kernel-yocto: conslidated pull request
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
X-List-Received-Date: Fri, 01 Sep 2017 16:30:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/01/2017 12:08 PM, Richard Purdie wrote:
> On Thu, 2017-08-31 at 15:30 -0400, Bruce Ashfield wrote:
>> Now that 4.12 + headers are in the tree, this is the next (and
>> possibly final)
>> around of -stable updates for the active kernels.
>>
>> I've built and booted them on all four architectures. But as usual,
>> this is a lot of combinations to confirm.
>>
>> The 4.12 update doesn't specifically address the kernel traces that
>> RP has been seeing, but it also doesn't regress things here. I'd be
>> interested to know if they help/hinder in the search to find the root
>> cause.
>>
>> I'll of course continue to track it down myself.
>>
>> I also have some functionality fixes as well as configuration updates
>> as part of this update.
> 
> I ran these on the autobuilder. We did see:
> 
> https://autobuilder.yocto.io/builders/nightly-ppc/builds/465
> 
> which is the latest 4.12 kernel and the latest qemu hanging with no
> boot output (but the pid did appear).
> 
> So we're still seeing something odd with ppc occasionally. Why? Don't
> know :(

The only thing crappier than IDE support, is the PPC platforms that
qemu supports for system emulation.

I'll continue to try and track down the issues.

Bruce

> 
> Cheers,
> 
> Richard
> 


