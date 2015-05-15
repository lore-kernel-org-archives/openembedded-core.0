Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D24F474071
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 07:18:17 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Yt9sv-0006g8-Q3 from Dmitry_Eremin@mentor.com ;
	Fri, 15 May 2015 00:18:18 -0700
Received: from [137.202.140.150] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Fri, 15 May 2015 08:18:16 +0100
Message-ID: <55559DB6.3000600@mentor.com>
Date: Fri, 15 May 2015 10:18:14 +0300
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Andre McCurdy <armccurdy@gmail.com>
References: <1431373976-20993-1-git-send-email-dmitry_eremin@mentor.com>	
	<CAJTo0LZUd4bcbfTL+TbtiXOU1wc9ZaFGP0mTM_Y0hVMb1eMqWg@mail.gmail.com>	
	<20150512144749.GD2714@jama>	
	<CAJ86T=X08DRhpZjH8Ge0vjXXuk1dfa2RbXiDarNX153-oE1Cmw@mail.gmail.com>
	<1431611197.30971.212.camel@linuxfoundation.org>
	<5554B329.2090708@windriver.com>
In-Reply-To: <5554B329.2090708@windriver.com>
X-Originating-IP: [137.202.0.76]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND][PATCH 1/3] meta: add new qemuarma9 machine definition
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
X-List-Received-Date: Fri, 15 May 2015 07:18:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2015 05:37 PM, Bruce Ashfield wrote:
> On 2015-05-14 09:46 AM, Richard Purdie wrote:
>> On Wed, 2015-05-13 at 18:17 -0700, Andre McCurdy wrote:
>>> On Tue, May 12, 2015 at 7:47 AM, Martin Jansa
>>> <martin.jansa@gmail.com> wrote:
>>>> On Tue, May 12, 2015 at 03:25:43PM +0100, Burton, Ross wrote:
>>>>> On 11 May 2015 at 20:52, Dmitry Eremin-Solenikov
>>>>> <dmitry_eremin@mentor.com>
>>>>> wrote:
>>>>>
>>>>>> Currently qemuarm is limited to 256 Mb of RAM. Sometimes this is too
>>>>>> little to run necessary applications. Add a new arm configuration
>>>>>> based
>>>>>> on Versatile Express board, Cortex-A9 CPU, allowing up to 1Gb of RAM.
>>>>>>
>>>>>
>>>>> Not sure I'm keen on oe-core having two almost-identical qemuarm
>>>>> machines.
>>>>> Why not just change the qemuarm machine to use the A9?
>>>>
>>>> Then we should officially drop thumb1 support, because current qemuarm
>>>> builds are quite broken when thumb is enabled and dropping current
>>>> qemuarm or replacing it with A9 variant will prevent oe-core to be
>>>> testable on autobuilder. See
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>>>
>>> +1 for updating qemuarm to an ARMv7 CPU.
>>
>> One thing I did notice about the new proposed arm machine was the lack
>> of graphics support. We really do need a machine with graphics. If we
>> could get a machine which had graphics and more memory that would be
>> much more attractive to switch to.
>>
>> This also has implications on the kernel support (cc Bruce).
>
> I've been using the qemuarma9 machine in some different contexts for
> a while now, and in fact, there's a BSP definition in linux-yocto
> already for it.
>
> So from that point of view, the kernel impacts are understood.
>
> But not only does the qemuarma9 lack graphics, it also has issues
> with disk and USB, so generally it isn't as usable as the arm926
> qemu variant.

I ended up enabling virtio to get disc working in qemuarma9. Such setup 
is used in provided runqemu patches. However I did not include a patch 
to linux-yocto recipe/git tree.

>
> There are other options that have newer CPUs, or just changing the
> cpu .. but a wholesale switch to the "qemuarma9" machine tends to
> bring some new challenges.

Yes, that is why in the patches I proposed qemuarma9 as an alternative 
(rather then a replacement) to plain qemuarm.

-- 
With best wishes
Dmitry

