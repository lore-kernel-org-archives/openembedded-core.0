Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF05A7318D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 06:28:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7Q6SX1D007443
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Aug 2016 23:28:33 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Aug 2016 23:28:32 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
	<1471943106.16712.101.camel@linuxfoundation.org>
	<180a3a72-1b44-dafa-77e7-1905f9374947@windriver.com>
	<6ee635df-666d-90bb-b296-7aa76714cbcc@windriver.com>
	<1472161955.29583.1.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <31242381-f39c-37f7-2c59-f670874ab451@windriver.com>
Date: Fri, 26 Aug 2016 14:28:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472161955.29583.1.camel@linuxfoundation.org>
Subject: Re: [PATCH V4 00/11] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Fri, 26 Aug 2016 06:28:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/26/2016 05:52 AM, Richard Purdie wrote:
> Hi Robert,
>
> On Thu, 2016-08-25 at 22:36 +0800, Robert Yang wrote:
>> I've fixed the problem and will send a V5. I have tried to test it on
>> my
>> autobuilder, but it's running out of disk space last tonight. It is
>> still in
>> building today, and didn't see any problems by now, I will reply if I
>> see.
>
> We're getting closer, there was just one issue I noticed in the last
> test run:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds
> /536/steps/Running%20Sanity%20Tests/logs/stdio

Sorry, it was caused by a typo, fixed in the repo now:

   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
 
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu

Robert Yang (10):
   qemuboot.bbclass: add it for runqemu
   qemuarm.conf: set vars for runqemu
   qemuarm64.conf: set vars for runqemu
   qemux86.conf/qemux86-64.conf: set vars for runqemu
   qemumips/qemumips64.conf: set vars for runqemu
   qemuppc.conf: set vars for runqemu
   qemu.inc: inherit qemuboot.bbclass
   runqemu: refactor it and remove machine knowledge
   nativesdk-qemu-helper: fix for new runqemu
   qemurunner.py/qemutinyrunner.py: remove runqemu-internal

// Robert


>
>>>> and:
>>>>
>>>> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-sel
>>>> ftest/builds/652/steps/Running%20oe-selftest/logs/stdio
>>>>
>>>>
>>>> I'm also not sure what caused these, whether it was this patchset
>>>> or
>>>> not:
>>>>
>>>> https://autobuilder.yoctoproject.org/main/builders/nightly-arm/bu
>>>> ilds/927/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
>>>>
>>>> https://autobuilder.yoctoproject.org/main/builders/nightly-mips/b
>>>> uilds/901/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
>>>>
>>>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/bu
>>>> ilds/914/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
>>>>
>>>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86/bu
>>>> ilds/914/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
>>>>
>>>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64
>>>> /builds/935
>>>
>>> I'm not sure either, need more investigations.
>>
>> I think that this isn't caused by runqemu patches since the error
>> doesn't
>> seem like relate to runqemu, and I can't reproduce it.
>
> I think we can blame one of Ross' patches for this one!
>
> Cheers,
>
> Richard
>
>

