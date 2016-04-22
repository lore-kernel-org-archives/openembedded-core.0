Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C29B6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 01:40:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3M1eEa9020196
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Apr 2016 18:40:15 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 18:40:14 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, oe-core
	<openembedded-core@lists.openembedded.org>
References: <57187FA8.5050804@windriver.com>
	<1461224521.31320.112.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <571980FC.3020100@windriver.com>
Date: Fri, 22 Apr 2016 09:40:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1461224521.31320.112.camel@linuxfoundation.org>
Subject: Re: About PV = "0.0+git${SRCPV}"
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
X-List-Received-Date: Fri, 22 Apr 2016 01:40:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/21/2016 03:42 PM, Richard Purdie wrote:
> On Thu, 2016-04-21 at 15:22 +0800, Robert Yang wrote:
>> There are several recipes in oe-core which has:
>> PV = "0.0+git${SRCPV}"
>>
>> These recipes don't have a release version, so we use
>> "0.0+git${SRCPV}",
>> but the package manager such as opkg/rpm/smart may not upgrade them
>> correctly when the recipes is upgraded since we can't make sure that
>> SRCPV_new > SRCPV_old.
>>
>> How about we use date for these recipes which doesn't have a release
>> version? For example, if we integrate them to oe-core today, then
>> PV = "20160421". And when we upgrade them in the future, we can
>> change
>> the PV to that day. We can change all the current version 0.0 target
>> recipes to today, and add a sanity check for version 0.0.
>
> No, this is the whole idea behind having the PR Server which injects a
> revision before the hash in SRCPV. We have the same problem with other
> git recipes even where there are versions since the revision can change
> and we need to be able to sort the versions correctly.

Thanks, I saw that PR Server will change git0 -> git1 -> git2 when SRCREV
is changed, it works.

// Robert

>
> Cheers,
>
> Richard
>

