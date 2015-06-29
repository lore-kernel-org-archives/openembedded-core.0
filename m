Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA5A72D64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 07:24:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5T7O9ef001545
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Jun 2015 00:24:09 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Jun 2015 00:24:08 -0700
Message-ID: <5590F297.9060108@windriver.com>
Date: Mon, 29 Jun 2015 15:24:07 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1435126503.git.liezhi.yang@windriver.com>	
	<1435514866.7287.3.camel@linuxfoundation.org>	
	<5590D7BA.5030306@windriver.com>
	<1435562320.7287.12.camel@linuxfoundation.org>
In-Reply-To: <1435562320.7287.12.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] perl 5.20.0 -> 5.22.0 and fix test cases
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
X-List-Received-Date: Mon, 29 Jun 2015 07:24:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/29/2015 03:18 PM, Richard Purdie wrote:
> On Mon, 2015-06-29 at 13:29 +0800, Robert Yang wrote:
>>
>> On 06/29/2015 02:07 AM, Richard Purdie wrote:
>>> On Tue, 2015-06-23 at 23:26 -0700, Robert Yang wrote:
>>>> * Upgrade perl 5.20.0 -> 5.22.0
>>>> * Tested on qemux86, qemuarm, qemuarm64, qemuppc, qemumips, qemux86-64.
>>>> * Fix for test cases, the test result:
>>>>     Failed 9 tests out of 2269, 99.60% okay.
>>>
>>> This series seems to cause:
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/367/steps/BuildImages/logs/stdio
>>>
>>> on non-gplv3 builds.
>>
>> Yes, it would fail when non-gplv3 build, here is a patch to fix
>> the problem:
>
> Thanks!
>
> More puzzlingly, selftest also failed in that build with:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/45
>
> Which looks similar but isn't GPLv3 excluded. Any ideas on that?

It seems that it is the same error, it builds gdbm-1.8.3, which is a GPLv2,
while the higher version is gdbm-1.11.

// Robert

>
> I just realised there is no DEPENDS on gdbm-native in perl-native as far
> as I can tell?
>
> Cheers,
>
> Richard
>
>
>

