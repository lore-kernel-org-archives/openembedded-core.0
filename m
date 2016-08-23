Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19791731C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 09:21:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7N9LLao021513
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 23 Aug 2016 02:21:21 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 23 Aug 2016 02:21:20 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
	<1471943106.16712.101.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <180a3a72-1b44-dafa-77e7-1905f9374947@windriver.com>
Date: Tue, 23 Aug 2016 17:21:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1471943106.16712.101.camel@linuxfoundation.org>
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
X-List-Received-Date: Tue, 23 Aug 2016 09:21:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/23/2016 05:05 PM, Richard Purdie wrote:
> On Mon, 2016-08-22 at 00:52 -0700, Robert Yang wrote:
>> * V4
>>   - Now the conf files can use @TAP@, @ROOTFS@ and @PORT@ when set
>> vars
>>     for runqemu, so all the arch info are gone. And also update
>> comments
>>     in qemuboot.bbclass.
>>   - Add var QB_SLIRP_OPT for slirp mode as Nathan suggested, also add
>>     QB_TAP_OPT whichi is for tap mode.
>>   - Print "Try 'runqemu help' on how to use it" when failed to parse
>> args
>>     as Nathan suggested.
>>   - Fix device locking problems.
>>   - Fix nativesdk-qemu-helper.
>>   - Fix comments for qemurunner.py/qemutinyrunner.py
>
> This is looking much better, thanks but we've still had some issues:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-rpm/builds/870/steps/Running%20Sanity%20Tests/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-deb/builds/856/steps/Running%20Sanity%20Tests/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-rpm/builds/870/steps/Running%20Sanity%20Tests/logs/stdio

Sorry, these should be race issues, I will fix it.

>
> and:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/652/steps/Running%20oe-selftest/logs/stdio
>
> I'm also not sure what caused these, whether it was this patchset or
> not:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/927/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/901/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/914/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/914/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/935

I'm not sure either, need more investigations.

// Robert

>
> Cheers,
>
> Richard
>
>
>

