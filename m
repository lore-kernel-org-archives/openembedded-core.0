Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E748771B50
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 15:57:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7LFvKen019885
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 21 Aug 2017 08:57:20 -0700
Received: from server.local (128.224.21.62) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 08:57:20 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<1503330934.32591.64.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <a101976a-4d66-ac97-221a-99ed6bc61fc1@windriver.com>
Date: Mon, 21 Aug 2017 11:57:19 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1503330934.32591.64.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 21 Aug 2017 15:57:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2017-08-21 11:55 AM, Richard Purdie wrote:
> On Sun, 2017-08-20 at 22:58 -0400, Bruce Ashfield wrote:
>> Here's the collected set of kernel changes that are ready for the M3
>> builds.
>>
>> We have some kernel meta data changes:
>>
>>    kernel-yocto: configuration updates: x86 features
>>    linux-yocto/4.1: fix fsl-ls10xx sdhci
>>    linux-yocto: add usb-net configs by default
>>
>> Some bug fixes:
>>
>>    kernel-yocto: ensure that only valid BSPs are built
>>    linux-yocto/4.10: CVE & misc fixes
>>
>> And the important changes are the addition of the 4.12 kernel + libc headers
>> and the removal of the 4.1 kernel.
>>
>> I also have some -stable updates queued for the active kernel versions, but
>> they will come out once this series has made it into the tree, since I'm
>> trying to isolate any 4.12 issues from other -stable updates.
>>
>> I built and booted all the qemu targets for 4.12, and have built for
>> core-image-sato, core-image-kernel-dev, glibc and muslc for all of the
>> architectures. My testing didn't pick up any regressions, but I was battling
>> some other build errors (non kernel related) during my testing, so I can
>> never be 100% sure.
>>
>> I've sent patches to poky to remove/bump any references to the 4.1 kernel
>> .. if I've missed any, I'm sure people will shout.
> 
> Thanks for the other fix, not got that tested yet as builds are still
> ongoing. However there appears to be a perf issue:
> 
> https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/429/steps/BuildImages/logs/stdio
> https://autobuilder.yocto.io/builders/nightly-packagemanagers/builds/77/steps/BuildImages/logs/stdio
> https://autobuilder.yocto.io/builders/nightly-packagemanagers/builds/77/steps/BuildImages_1/logs/stdio
> https://autobuilder.yocto.io/builders/nightly-packagemanagers/builds/77/steps/BuildImages_2/logs/stdio
> [and so on]
> 

Again, I'm not going to be much good on fixing this.

I of course have built (and run perf on target) for all the
architectures or I never would have sent the pull request.

I'll see if I can find something wrong on what my building
was producing, but otherwise, I have no way to reproduce it.

Bruce


> Cheers,
> 
> Richard
> 
> 
> 


