Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1419F6B4BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 04:10:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 25 Aug 2013 21:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,955,1367996400"; d="scan'208";a="386380164"
Received: from unknown (HELO [10.255.14.139]) ([10.255.14.139])
	by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2013 21:10:32 -0700
Message-ID: <521AD538.9040607@linux.intel.com>
Date: Sun, 25 Aug 2013 21:10:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<2a6e1a99b776f536e12c0de196eaa5d2f0a1025d.1377405083.git.bruce.ashfield@windriver.com>
	<521ABDA8.3080702@linux.intel.com>
	<CADkTA4NkAVH3WoYmawbWVGLQ1A_d4hg=1JEwXshbO2sfpLYegQ@mail.gmail.com>
In-Reply-To: <CADkTA4NkAVH3WoYmawbWVGLQ1A_d4hg=1JEwXshbO2sfpLYegQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] linux-yocto: remove 3.8 recipes
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
X-List-Received-Date: Mon, 26 Aug 2013 04:10:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/25/2013 07:32 PM, Bruce Ashfield wrote:
> On Sun, Aug 25, 2013 at 10:30 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 08/24/2013 10:16 PM, Bruce Ashfield wrote:
>>>
>>> With the introduction of the 3.10 linux-yocto tree, 3.4 being the previous
>>> LTSI kernel, and no reference BSPs using 3.8 as their reference BSP it
>>> 3.8 is no longer supported or required.
>>>
>> This make both the atom-pc and new genericx86 BSP unbuildable since they are
>> 3.8 based still.
>
> That was already discussed in detail. Darren was to follow up with changes for
> the genericx86 BSP to move to 3.10 .. it won't ever be supported on 3.8. Same
> with the atom-pc. It wasn't my change to make, so I don't have it in my series.
>
> Everyone shall be warned, whether you drop that part of the change or not,
> the 3.8 kernel is no longer supported.
>
I understand, but I don't have those other bits and it blocks building 
on the Autobuilder, which would in turn block my ability to test and 
accept this complete patch set for 1.5.

I want to get this tested and in tomorrow if possible and then content 
with what comes in overnight also!

Thanks for understanding

	Sau!

> Cheers,
>
> Bruce
>
>>
>> Dropping this for now, also your meta-yocto-bsp added 3.10, but did not
>> remove 3.8.bbappend further causing problems.
>>
>>
>> Sau!
>>
>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> ---
>>>    meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |   30
>>> --------------------
>>>    meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |   26
>>> -----------------
>>>    meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   31
>>> ---------------------
>>>    3 files changed, 87 deletions(-)
>>>    delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>>>    delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
>>>    delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.8.bb
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>>> deleted file mode 100644
>>> index 647ace6..0000000
>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>>> +++ /dev/null
>>> @@ -1,30 +0,0 @@
>>> -require recipes-kernel/linux/linux-yocto.inc
>>> -
>>> -KBRANCH = "standard/preempt-rt/base"
>>> -KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
>>> -
>>> -LINUX_VERSION ?= "3.8.13"
>>> -LINUX_KERNEL_TYPE = "preempt-rt"
>>> -
>>> -KMETA = "meta"
>>> -
>>> -SRCREV_machine ?= "4fb187301ca153d496b2a96293dffde34d3b1a56"
>>> -SRCREV_machine_qemuppc ?= "547c4ea570933ab7ece9f10d2c46875b460cd337"
>>> -SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
>>> -
>>> -PR = "${INC_PR}.1"
>>> -PV = "${LINUX_VERSION}+git${SRCPV}"
>>> -
>>> -SRC_URI =
>>> "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>>> -
>>> -# Omit broken machines from COMPATIBLE_MACHINE
>>> -#   qemuppc hangs at boot
>>> -#   qemumips panics at boot
>>> -COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
>>> -
>>> -# Functionality flags
>>> -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
>>> features/taskstats/taskstats.scc"
>>> -KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>>> -KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
>>> " cfg/x32.scc", "" ,d)}"
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
>>> deleted file mode 100644
>>> index 06d6b12..0000000
>>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
>>> +++ /dev/null
>>> @@ -1,26 +0,0 @@
>>> -require recipes-kernel/linux/linux-yocto.inc
>>> -
>>> -# We need lzma (as CONFIG_KERNEL_LZMA=y)
>>> -DEPENDS += "xz-native"
>>> -
>>> -KBRANCH_DEFAULT = "standard/tiny/base"
>>> -KBRANCH = "${KBRANCH_DEFAULT}"
>>> -LINUX_KERNEL_TYPE = "tiny"
>>> -KCONFIG_MODE = "--allnoconfig"
>>> -
>>> -LINUX_VERSION ?= "3.8.13"
>>> -
>>> -KMETA = "meta"
>>> -
>>> -SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
>>> -SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
>>> -
>>> -PR = "${INC_PR}.1"
>>> -PV = "${LINUX_VERSION}+git${SRCPV}"
>>> -
>>> -SRC_URI =
>>> "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>>> -
>>> -COMPATIBLE_MACHINE = "(qemux86)"
>>> -
>>> -# Functionality flags
>>> -KERNEL_FEATURES = ""
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>>> b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>>> deleted file mode 100644
>>> index 790e3e3..0000000
>>> --- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>>> +++ /dev/null
>>> @@ -1,31 +0,0 @@
>>> -require recipes-kernel/linux/linux-yocto.inc
>>> -
>>> -KBRANCH_DEFAULT = "standard/base"
>>> -KBRANCH = "${KBRANCH_DEFAULT}"
>>> -
>>> -SRCREV_machine_qemuarm ?= "aa76cc28408376814752bd36fb0dcf0e25aa5ba3"
>>> -SRCREV_machine_qemumips  ?= "aa0affda03c955678b26b2fb586f1d9505127871"
>>> -SRCREV_machine_qemumips64 ?= "077bff22c9951db6b35470ba17b1df2f2a91fefb"
>>> -SRCREV_machine_qemuppc ?= "698eada61d9385b42dd117858b943655b565084b"
>>> -SRCREV_machine_qemux86 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
>>> -SRCREV_machine_qemux86-64 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
>>> -SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
>>> -SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
>>> -
>>> -SRC_URI =
>>> "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>>> -
>>> -LINUX_VERSION ?= "3.8.13"
>>> -
>>> -PR = "${INC_PR}.2"
>>> -PV = "${LINUX_VERSION}+git${SRCPV}"
>>> -
>>> -KMETA = "meta"
>>> -
>>> -COMPATIBLE_MACHINE =
>>> "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>>> -
>>> -# Functionality flags
>>> -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>>> -KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>>> -KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
>>> " cfg/x32.scc", "" ,d)}"
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

