Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1C973F08
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 14:58:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t46Ewb6J021255
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 May 2015 07:58:37 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 6 May 2015 07:58:36 -0700
Message-ID: <554A2C1C.5040304@windriver.com>
Date: Wed, 6 May 2015 10:58:36 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com> <20150502081346.GD2366@jama>
	<55458D0D.6070904@windriver.com> <20150506144241.GA2067@jama>
In-Reply-To: <20150506144241.GA2067@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 06 May 2015 14:58:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-06 10:42 AM, Martin Jansa wrote:
> On Sat, May 02, 2015 at 10:50:53PM -0400, Bruce Ashfield wrote:
>> On 2015-05-02 4:13 AM, Martin Jansa wrote:
>>> On Fri, May 01, 2015 at 07:30:24PM -0400, Bruce Ashfield wrote:
>>>> On 2015-05-01 6:59 PM, Richard Purdie wrote:
>>>>> On Thu, 2015-04-30 at 21:34 -0400, Bruce Ashfield wrote:
>>>>>> Here is the latest consolidated pull request for the supported linux-yocto
>>>>>> kernels.
>>>>>>
>>>>>>     - We have a refresh of the 3.14-rt support
>>>>>>     - bluetooh configuration changes for common-pc/qemux86
>>>>>>     - braswell BSP features and fixes
>>>>>>     - Introduction of the 4.1-rc1 -dev kernel (and associated perf fix).
>>>>>> I've built and booted these on my local machines and qemu, and
>>>>>> everything was sane.
>>>
>>> Does it fix the issue I've reported few days ago?
>>> http://lists.openembedded.org/pipermail/openembedded-core/2015-April/104344.html
>>
>> Nope. But one config warning is far down on the list when I'm
>> trying to introduce new -stable's and an entire -dev kernel.
>>
>> I didn't forget about it, it'll just get done in priority order.
>
> OK, now it fails completely in default qemux86 builds:
>

At this point, all I can say is file a bug. My builds of the same
board work, and the autobuilder show up green.

That screams race condition, so I'll look into it from that angle.

Bruce

> ERROR: Function failed: do_kernel_configme (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19.5+gitAUTOINC+7215fe4313_d5d30ba4d2-r0/temp/log.do_kernel_configme.1159)
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19.5+gitAUTOINC+7215fe4313_d5d30ba4d2-r0/temp/log.do_kernel_configme.1159
> Log data follows:
> | DEBUG: Executing shell function do_kernel_configme
> | NOTE: kernel configme
> | [INFO] Configuring target/machine combo: "standard/qemux86"
> | [INFO] collecting configs in .meta/meta-series
> | [ERROR] frag /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/kernel-source/.meta/cfg/kernel-cache/bsp/common-pc/common-pc-drivers-32.cfg does not exist
> | Error running the meta series for collecting config data
> | config of "standard/qemux86" failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_kernel_configme (log file is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19.5+gitAUTOINC+7215fe4313_d5d30ba4d2-r0/temp/log.do_kernel_configme.1159)
> NOTE: recipe linux-yocto-3.19.5+gitAUTOINC+7215fe4313_d5d30ba4d2-r0: task do_kernel_configme: Failed
> ERROR: Task 30162 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux/linux-yocto_3.19.bb, do_kernel_configme) failed with exit code '1'
>
> http://errors.yoctoproject.org/Errors/Details/10481/
>
>>>>>> The -dev kernel obviously isn't something for deployment yet, but
>>>>>> it builds, and forms the base for follow up config changes, features
>>>>>> and development work. I built and booted core-image-kernel dev with
>>>>>> the 4.1 changes in place.
>>>>>
>>>>> The autobuilder showed up this for an x32 build :/.
>>>>
>>>> Can one of the intel folks have a look at this ? I won't be able to get
>>>> to it until Tuesday at the earliest.
>>>>
>>>> Bruce
>>>>
>>>>>
>>>>> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/282/steps/BuildImages/logs/stdio
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>


