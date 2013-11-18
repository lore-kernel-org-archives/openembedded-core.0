Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 629276D433
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:26:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAICQKGh028207
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Nov 2013 04:26:20 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 18 Nov 2013 04:26:19 -0800
Message-ID: <528A0755.2060100@windriver.com>
Date: Mon, 18 Nov 2013 20:25:57 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, "Wold, Saul"
	<saul.wold@intel.com>
References: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>	<5283F507.7050607@linux.intel.com>	<CAP9ODKotnjmFwd3SqG_=HDpDWXBDkuaJsqUerM_8BnT9mPU0GQ@mail.gmail.com>	<CADkTA4M8GkRVnHr5bW-1=Ff2PSdsYaOo6ROisjZDybnNpom2OA@mail.gmail.com>	<5284F5D1.4010004@linux.intel.com>	<CADkTA4ObDkKgm+_-RG650m2TtugDh4tZ+OHyOateGSUvv9hmhQ@mail.gmail.com>	<CADkTA4MCL8pe8jACx8T9o7S17XvjUiBj5GwSp9nW2snWjpCQxQ@mail.gmail.com>
	<CAP9ODKo+dR_FSj4djpGKcbQFWRiWqSK6XApGtjS6NM1r5scJDg@mail.gmail.com>
In-Reply-To: <CAP9ODKo+dR_FSj4djpGKcbQFWRiWqSK6XApGtjS6NM1r5scJDg@mail.gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lttng-modules: Update revision to grab last bugfix releases
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
X-List-Received-Date: Mon, 18 Nov 2013 12:26:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2013 01:48 AM, Otavio Salvador wrote:
> On Thu, Nov 14, 2013 at 3:15 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Thu, Nov 14, 2013 at 11:18 AM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>>> On Thu, Nov 14, 2013 at 11:09 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>>> On 11/13/2013 07:08 PM, Bruce Ashfield wrote:
>>>>>
>>>>> On Wed, Nov 13, 2013 at 8:45 PM, Otavio Salvador
>>>>> <otavio@ossystems.com.br> wrote:
>>>>>>
>>>>>> On Wed, Nov 13, 2013 at 7:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>>>>
>>>>>>> On 11/01/2013 06:31 AM, Otavio Salvador wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> This updates lttng-modules for 2.3.2 and also includes a bugfix
>>>>>>>> imported from 3.4 kernel. The changes included are:
>>>>>>>>
>>>>>>>> 6c26b01 Blacklist Linux kernels 3.10+
>>>>>>>> b97d469 LTTng trace-clock: shrink kernel blacklist
>>>>>>>> 7d40f8e Version 2.3.1
>>>>>>>> 2aecb9b Blacklist kernels 3.10.13 and 3.11.2
>>>>>>>> 4f1217f Version 2.3.2
>>>>>>>> 92fff0c Import fix from LTSI: 3.4+ RT kernels use
>>>>>>>> CONFIG_PREEMPT_RT_FULL
>>>>>>>> 1874075 lttng-statedump-impl: Fix lttng_list_interrupts for empty
>>>>>>>> implementation
>>>>>>>>
>>>>>>>
>>>>>>> Otavio,
>>>>>>>
>>>>>>> Tried to build this locally and got the following failure with
>>>>>>> genericx86
>>>>>>> and master:
>>>>>>>
>>>>>>> |   CC [M]
>>>>>>>
>>>>>>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.o
>>>>>>> | In file included from
>>>>>>>
>>>>>>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-tracer.h:37:0,
>>>>>>> |                  from
>>>>>>>
>>>>>>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.c:24:
>>>>>>> |
>>>>>>>
>>>>>>> /srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/wrapper/trace-clock.h:40:2:
>>>>>>> error: #error "Linux kernels 3.10 and 3.11 introduce a deadlock in the
>>>>>>> timekeeping subsystem. Fixed by commit
>>>>>>> 7bd36014460f793c19e7d6c94dab67b0afcfcb7f \"timekeeping: Fix HRTICK
>>>>>>> related
>>>>>>> deadlock from ntp lock changes\" in Linux."
>>>>>>> |  #error "Linux kernels 3.10 and 3.11 introduce a deadlock in the
>>>>>>> timekeeping subsystem. Fixed by commit
>>>>>>> 7bd36014460f793c19e7d6c94dab67b0afcfcb7f \"timekeeping: Fix HRTICK
>>>>>>> related
>>>>>>> deadlock from ntp lock changes\" in Linux."
>>>>>>> |   ^
>>>>>>> | make[2]: ***
>>>>>>>
>>>>>>> [/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git/lttng-ring-buffer-client-discard.o]
>>>>>>> Error 1
>>>>>>> | make[1]: ***
>>>>>>>
>>>>>>> [_module_/srv/ssd/sgw/builds/world/tmp/work/genericx86-poky-linux/lttng-modules/2.3.2+gitAUTOINC+1874075076-r0/git]
>>>>>>> Error 2
>>>>>>> | make[1]: Leaving directory
>>>>>>> `/srv/ssd/sgw/builds/world/tmp/sysroots/genericx86/usr/src/kernel'
>>>>>>> | make: *** [default] Error 2
>>>>>>> | ERROR: oe_runmake failed
>>>>>>>
>>>>>>> So I am going to hold off on this patch set until you can resolve this.
>>>>>>
>>>>>>
>>>>>> Yes; this is becase the linux-yocto seems to not have been updated to
>>>>>>>
>>>>>>> 3.10.13; so in fact it is failing to build to avoid people to
>>>>>>
>>>>>> trigger the deadlock.
>>>>>>
>>>>>> The change which introduces this in lttng-modules is:
>>>>>>
>>>>>>
>>>>>> http://git.lttng.org/?p=lttng-modules.git;a=commit;h=2aecb9b1cbb63f6c524ad9195d8fd06299ef9296
>>>>>>
>>>>>> I can update this patch as 2.3.3 has been released and it includes the
>>>>>> 3.12 fixes but please check when linux-yocto will be updated so we can
>>>>>> fix it.
>>>>>
>>>>>
>>>>> Saul: What board are you building ? I've had linux-yocto on 3.10.17
>>>>> for over a week
>>>>> now.
>>>>
>>>>
>>>> As mentioned above this is for genericx86, so maybe not all the BSPs are
>>>> updated yet.
>>>
>>> Buried in the context, sorry about missing that.
>>>
>>> Yes, I'm about to update the reference boards, but there's a install
>>> error that I'm fixing first, but I'll have the series out by end of day.
>>
>> I just sent the update for this (cc'd poky@yoctoproject.org), but I haven't
>> seen it loop around.
>>
>> If you didn't get the patch, let me know and I'll try again.
>
> I have sent the new patch version.
>
> It does the update to the 2.3.3 which include all the previous
> backported patches.
>
> This should be considered for Dora as well as it fixes the deadlock
> and building with 3.12 kernels.
>

Hi Otavio, thanks for suggesting this for dora, but dora's kernel is 3.10.11,
and this is an update for lttng-modules, I'm not sure whether dora needs this.

Add Saul in the CC list.

// Robert



