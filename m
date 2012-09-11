Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1TBTCB-00026P-5G
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:20:15 +0200
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 09:07:32 -0700
Received: by obhx4 with SMTP id x4so1926704obh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 09:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=u+W/MuJquyp/cZ1SxBYoUVKO/SyYNLPQhQivhQ9suFY=;
	b=VP/vwUYDkqEvvrsNLB4Znf2IIfCfPSqwVgga4xsDOTg8UMA/0AXXpA6Rb3nIkJAaPE
	mdt7j3Yim5Q6YNX8R8/9xi2HXA7HGOAvNxGgyN14FDxjspVPkKurHnU9DKABGmtcomQF
	C/ott/C9BR4KZBi7rVy7pQLMdh8Wpqw5CLnu+Tn7H9lcAMc6NZ9yumbtcHYG3YMPCBcu
	ZyTZC3vw/NWlkrSl7n6Qea1bKaf5kM+nuV+byENu+CSTYc1bgH9p1dRPQ9wpOWT3Eebs
	75WN7+H0c6bxKQ4GStSeTmgaXwt+bzB0XOr93bwpadbARQI35oCKZRXtaxuMibP1d3m2
	Id6w==
Received: by 10.50.88.229 with SMTP id bj5mr17164473igb.21.1347379656205;
	Tue, 11 Sep 2012 09:07:36 -0700 (PDT)
Received: by 10.50.88.229 with SMTP id bj5mr17164453igb.21.1347379655900;
	Tue, 11 Sep 2012 09:07:35 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id aa4sm2475194igc.15.2012.09.11.09.07.30
	(version=SSLv3 cipher=OTHER); Tue, 11 Sep 2012 09:07:34 -0700 (PDT)
Message-ID: <504F61BF.30902@intel.com>
Date: Tue, 11 Sep 2012 09:07:27 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1347376358.git.bruce.ashfield@windriver.com>
	<ea700a4897d82d27177a0583f01b6432ac7ec379.1347376358.git.bruce.ashfield@windriver.com>
	<504F59B1.60308@intel.com> <504F5B17.5070500@windriver.com>
	<504F5B9A.7070501@intel.com> <1347379081.2122.48.camel@ted>
In-Reply-To: <1347379081.2122.48.camel@ted>
X-Gm-Message-State: ALoCoQmBBK5045qxuknYUYJIqaXHYHaaei4B0Uo2iZFGzbkIa1hl7oM04gztKXVPd4cVMQMMUtTLZGB47Ejb+sLmQLufkgqV/SJqZytz65UqXhWfhrFlhQ5Zind1a3VZbYX0T7A4/BPCZHf6XW+noUWvfTheKRtyCRWdx7I93Kuj+gqMt7XsEtg4Ydcss/yguwYwSoG7LGeF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/3.4: add x32 configuration fragment and tuning hook
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 16:20:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 08:58 AM, Richard Purdie wrote:
> On Tue, 2012-09-11 at 08:41 -0700, Saul Wold wrote:
>> On 09/11/2012 08:39 AM, Bruce Ashfield wrote:
>>> On 12-09-11 11:33 AM, Saul Wold wrote:
>>>> On 09/11/2012 08:17 AM, Bruce Ashfield wrote:
>>>>> When x32 is the tuning for a x86 MACHINE, the kernel should also have
>>>>> CONFIG_X86_X32=y.
>>>>>
>>>>> This can be accomplished by adding the x32 configuraion fragment to the
>>>>> KERNEL_FEATURES when x32 is the tuning for a given machine.
>>>>>
>>>>> cc: Saul Wold <sgw@linux.intel.com>
>>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>>> ---
>>>>> meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb | 3 ++-
>>>>> meta/recipes-kernel/linux/linux-yocto_3.4.bb | 3 ++-
>>>>> 2 files changed, 4 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>>>>> b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>>>>> index 4fd3845..156fb93 100644
>>>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>>>>> @@ -10,7 +10,7 @@ KMETA = "meta"
>>>>>
>>>>> SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
>>>>> SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
>>>>> -SRCREV_meta ?= "d9d5fc63d8b38705036e946ea77d971d95de11ad"
>>>>> +SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
>>>>>
>>>>> PR = "${INC_PR}.0"
>>>>> PV = "${LINUX_VERSION}+git${SRCPV}"
>>>>> @@ -27,3 +27,4 @@ KERNEL_FEATURES_append = " features/netfilter"
>>>>> KERNEL_FEATURES_append = " features/taskstats"
>>>>> KERNEL_FEATURES_append_qemux86 = " cfg/sound"
>>>>> KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
>>>>> +KERNEL_FEATURES_append_x32 = " cfg/x32"
>>>>
>>>> Scratch this bit and below, as I think I will use the other mechanism
>>>> you talked about to go from a .conf file.
>>>
>>> Works for me. The meta change is staged and pushed out, I'll update this
>>> patch to not have the KERNEL_FEATURES portion.
>>>
>> Thanks, see my other email to RP, since x32 is a feature that any x86-64
>> machine might want to enable based on the DEFAULTTUNE it makes more
>> sense to be in the machine config includes.
>
> No, it doesn't.
>
> What we need here is:
>
> -KERNEL_FEATURES_append = " features/taskstats"
> +KERNEL_FEATURES_append = " features/taskstats ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32", "" ,d)}"
>
No, this would then only address the qemu machine, what about all the HW 
BSP that might want it, they would need to add this same line.  If I add 
the KERNEL_FEATURES_append to the arch-ia32.inc, conditional on mx32, 
then any x86-64 BSP can just enable that TUNE, isn't that the point of 
the machine config tuning?


> which is simple, effective and to the point. If we start needing lots of
> these, we can look at an x32 override but right now I don't see the
> need.
>
And it does not have to be an x32 override, we just set it in the 
arch-ia32.inc file where we define that TUNE.

That seems the best way.

Sau!


> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



