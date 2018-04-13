Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 98E21747E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 19:55:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3DJt0gX008062
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Apr 2018 12:55:00 -0700 (PDT)
Received: from server.local (128.224.22.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 13 Apr 2018 12:54:59 -0700
To: Cal Sullivan <california.l.sullivan@intel.com>,
	=?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>, Trevor Woerner
	<twoerner@gmail.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <dccff540-a3ab-06da-35a0-26702720ce27@windriver.com>
Date: Fri, 13 Apr 2018 15:54:58 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Fri, 13 Apr 2018 19:55:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-04-12 5:38 PM, Cal Sullivan wrote:
> If you're using a non-linux-yocto kernel you likely need to apply this 
> patch to your kernel as well:
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-kernel/linux/linux-intel/0001-menuconfig-check-lxdiaglog.sh-Allow-specification-of.patch 
> 
> 
> (This is in all linux-yocto kernels, I'm only linking to meta-intel 
> because I knew where it was off the top of my head)
> 
> This was sent upstream but last I looked it didn't gain any traction. I 
> think Bruce resent it recently but I can't be sure.

Yes, and I'm sending it yet again! :D

Bruce

> 
> Thanks,
> Cal
> 
> On 04/12/2018 01:28 PM, Andreas Müller wrote:
>> On Mon, Apr 2, 2018 at 11:57 PM, Trevor Woerner <twoerner@gmail.com> 
>> wrote:
>>> On Sun 2018-04-01 @ 11:49:58 PM, Andreas Müller wrote:
>>>> When running bitbake -cmenuconfig virtual/kernel I get a flood of
>>>> undefined reference errors. Am I alone here?
>>> Sadly, I think you might be.
>>>
>>>          $ bitbake virtual/kernel -c menuconfig
>>>
>>> works fine for me.
>>>
>>> I assume you're doing this for something RaspberryPi-ish?
>>>
>>>          Build Configuration:
>>>          BB_VERSION           = "1.37.0"
>>>          BUILD_SYS            = "x86_64-linux"
>>>          NATIVELSBSTRING      = "opensuse-42.3"
>>>          TARGET_SYS           = "arm-oe-linux-gnueabi"
>>>          MACHINE              = "raspberrypi3"
>>>          DISTRO               = "nodistro"
>>>          DISTRO_VERSION       = "nodistro.0"
>>>          TUNE_FEATURES        = "arm armv7ve vfp thumb neon vfpv4 
>>> callconvention-hard cortexa7"
>>>          TARGET_FPU           = "hard"
>>>          meta-raspberrypi     = 
>>> "master:63e53f919089027259a513dc2cd4b140789bf1a3"
>>>          meta                 = 
>>> "master:4cedddb83623c79980b354642dfeaf78218ca4b7"
>>>          meta-oe
>>>          meta-gnome
>>>          meta-python
>>>          meta-networking
>>>          meta-multimedia      = 
>>> "master:b9d1d8718834f7287e5a65373b952cbfe9ce83fe"
>>>          meta-qt5             = 
>>> "master:e60e849de1158c879bd2c150fe79b207cdac031a"
>>>          meta-qt5-extra       = 
>>> "master:a0cf057b2f335e8d2be9180f20770773334ec209"
>>>          meta-realtime        = 
>>> "master:250bc6eaa47e550c1db5e2b0ebd42d86ee43650e"
>>>          meta-browser         = 
>>> "master:d1c902440cba26a9d1271cfb914633c68ee3791c"
>> OK I found that I am not alone [1] and followed the suggestion to
>> install ncurses-devel. Strange: it install ncurses-libs x86_64. Now I
>> have back menuconfig but it looks horrible: All framing chars are
>> displayed as '@'. If I remember correct there was such an issue long
>> lime ago.
>>
>> However it is not beautiful but I can work with it.
>>
>> [1] https://github.com/crops/poky-container/issues/17
>>
>> Andreas
> 


