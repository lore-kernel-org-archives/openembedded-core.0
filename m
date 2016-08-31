Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0B6B601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 01:08:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7V18hqe008252
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Aug 2016 18:08:43 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 30 Aug 2016 18:08:42 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Randle, William C"
	<william.c.randle@intel.com>, "Burton, Ross" <ross.burton@intel.com>
References: <cover.1472120966.git.liezhi.yang@windriver.com>
	<CAJTo0LbNHqJB4ipWdmtSJ1vDT_pEJHFS1J2+ZtxiVsecrL86xQ@mail.gmail.com>
	<1472162353.11000.34.camel@intel.com>
	<1472598098.29583.61.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <fda8f2b2-dcb4-40e6-54ba-8fd3aa81e633@windriver.com>
Date: Wed, 31 Aug 2016 09:08:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472598098.29583.61.camel@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V5 00/10] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Wed, 31 Aug 2016 01:08:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/31/2016 07:01 AM, Richard Purdie wrote:
> On Thu, 2016-08-25 at 21:59 +0000, Randle, William C wrote:
>> On Thu, 2016-08-25 at 22:45 +0100, Burton, Ross wrote:
>>> Hi Robert,
>>>
>>> So close!  qemuarm64 is breaking on the AB:
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/bu
>>> ilds/536/steps/Running%20Sanity%20Tests/logs/stdio
>>>
>>> I suspect we're passing some options to runqemu that you didn't
>>> cover in your testing.
>>>
>>> Ross
>>>
>> It looks like it's just a missing space between the -m arg and
>> -device:
>>   -m 512-device
>
> I added an attempt at a fix for this into -next FWIW

Thanks, I had fixed this in the repo, and the fix is the same as RP's,
I should reply to this thread, too, but sorry I replied to another thread:

Re: [OE-core] [PATCH V4 00/11] runqemu: refactor it and remove machine knowledge

// Robert

>
> Cheers,
>
> Richard
>

