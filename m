Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DF3C7320F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 05:49:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7M5nwYE025428
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 21 Aug 2016 22:49:58 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 21 Aug 2016 22:49:57 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1471589537.git.liezhi.yang@windriver.com>
	<1471723778.16712.74.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a9c2595b-ddeb-f1fb-bad8-c8e98c8767fe@windriver.com>
Date: Mon, 22 Aug 2016 13:49:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471723778.16712.74.camel@linuxfoundation.org>
Subject: Re: [PATCH V3 0/8] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Mon, 22 Aug 2016 05:49:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/21/2016 04:09 AM, Richard Purdie wrote:
> On Thu, 2016-08-18 at 23:55 -0700, Robert Yang wrote:
>> * V3
>>   - Move the qemu boot settings out of tune files (e.g., arch
>> -x86.inc)
>>     to avoid mixing BSP settings with the tunings as Mark suggested.
>> and
>>     put them to <machine>.conf or <qemuboot>.inc file.
>
> I tried pulling this into master-next and testing on the autobuilder.
> It seems there is a problem with the networking and device
> locking/allocation:

Sorry, I can't use "with open(lock, 'w') as f:" since the file would be
closed automatically when "with" section is done, and the file will be
unlocked when closed.

>
> https://autobuilder.yoctoproject.org/main/builders/nightly-deb/builds/8
> 55/steps/Running%20Sanity%20Tests/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds
> /531
>
> [and many others]
>
> Also a problem with runqemu-internal being removed:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/bu
> ilds/886/steps/BuildImages/logs/stdio

Sorry, I will fix this in V4.


// Robert

>
> Cheers,
>
> Richard
>

