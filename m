Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id BAAFD6A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 02:32:16 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id eo20so1899080lab.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 19:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1usJDbkPSEsZXyq6Ir8XtSJqqI6+ni3p/3Vm89ljZo8=;
	b=cXmDXXeB5/utIS883etbuMnHT5qykgFCgvyd3DMrvLK7D72XrjndcbrV8Cm+bH4OIl
	r3Sh8VEqevOtXOzjkWzE6H10ucQaB+sGieE33yiCLop3wBddfMVb5VzfADDHkeqCb7Yc
	A2c0hcT/lPAs48YEqkkN/nxaw/RrHGrTP7tmOV7V/nHwwqAkpngk1rXVBxcdNPRPg2I8
	Hf0onp1d1xe2PtlV/tZTReCUowdWWxCGFH0TtQbdI5/vzeCqff/YFm+wBpZjDx/lsSeq
	Ue8h3t9Zby0gpqtQP+Wd5t/HHAxNBqsiaJI1mSXPryxZ1oNsDDbRTtSiLZifg0xwEr3G
	ZeqQ==
MIME-Version: 1.0
X-Received: by 10.152.8.12 with SMTP id n12mr11620824laa.10.1377484336544;
	Sun, 25 Aug 2013 19:32:16 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Sun, 25 Aug 2013 19:32:16 -0700 (PDT)
In-Reply-To: <521ABDA8.3080702@linux.intel.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<2a6e1a99b776f536e12c0de196eaa5d2f0a1025d.1377405083.git.bruce.ashfield@windriver.com>
	<521ABDA8.3080702@linux.intel.com>
Date: Sun, 25 Aug 2013 22:32:16 -0400
Message-ID: <CADkTA4NkAVH3WoYmawbWVGLQ1A_d4hg=1JEwXshbO2sfpLYegQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Mon, 26 Aug 2013 02:32:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Aug 25, 2013 at 10:30 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/24/2013 10:16 PM, Bruce Ashfield wrote:
>>
>> With the introduction of the 3.10 linux-yocto tree, 3.4 being the previous
>> LTSI kernel, and no reference BSPs using 3.8 as their reference BSP it
>> 3.8 is no longer supported or required.
>>
> This make both the atom-pc and new genericx86 BSP unbuildable since they are
> 3.8 based still.

That was already discussed in detail. Darren was to follow up with changes for
the genericx86 BSP to move to 3.10 .. it won't ever be supported on 3.8. Same
with the atom-pc. It wasn't my change to make, so I don't have it in my series.

Everyone shall be warned, whether you drop that part of the change or not,
the 3.8 kernel is no longer supported.

Cheers,

Bruce

>
> Dropping this for now, also your meta-yocto-bsp added 3.10, but did not
> remove 3.8.bbappend further causing problems.
>
>
> Sau!
>
>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |   30
>> --------------------
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |   26
>> -----------------
>>   meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   31
>> ---------------------
>>   3 files changed, 87 deletions(-)
>>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
>>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.8.bb
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>> deleted file mode 100644
>> index 647ace6..0000000
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -require recipes-kernel/linux/linux-yocto.inc
>> -
>> -KBRANCH = "standard/preempt-rt/base"
>> -KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
>> -
>> -LINUX_VERSION ?= "3.8.13"
>> -LINUX_KERNEL_TYPE = "preempt-rt"
>> -
>> -KMETA = "meta"
>> -
>> -SRCREV_machine ?= "4fb187301ca153d496b2a96293dffde34d3b1a56"
>> -SRCREV_machine_qemuppc ?= "547c4ea570933ab7ece9f10d2c46875b460cd337"
>> -SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
>> -
>> -PR = "${INC_PR}.1"
>> -PV = "${LINUX_VERSION}+git${SRCPV}"
>> -
>> -SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>> -
>> -# Omit broken machines from COMPATIBLE_MACHINE
>> -#   qemuppc hangs at boot
>> -#   qemumips panics at boot
>> -COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
>> -
>> -# Functionality flags
>> -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
>> features/taskstats/taskstats.scc"
>> -KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>> -KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
>> " cfg/x32.scc", "" ,d)}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
>> b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
>> deleted file mode 100644
>> index 06d6b12..0000000
>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -require recipes-kernel/linux/linux-yocto.inc
>> -
>> -# We need lzma (as CONFIG_KERNEL_LZMA=y)
>> -DEPENDS += "xz-native"
>> -
>> -KBRANCH_DEFAULT = "standard/tiny/base"
>> -KBRANCH = "${KBRANCH_DEFAULT}"
>> -LINUX_KERNEL_TYPE = "tiny"
>> -KCONFIG_MODE = "--allnoconfig"
>> -
>> -LINUX_VERSION ?= "3.8.13"
>> -
>> -KMETA = "meta"
>> -
>> -SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
>> -SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
>> -
>> -PR = "${INC_PR}.1"
>> -PV = "${LINUX_VERSION}+git${SRCPV}"
>> -
>> -SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>> -
>> -COMPATIBLE_MACHINE = "(qemux86)"
>> -
>> -# Functionality flags
>> -KERNEL_FEATURES = ""
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> deleted file mode 100644
>> index 790e3e3..0000000
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -require recipes-kernel/linux/linux-yocto.inc
>> -
>> -KBRANCH_DEFAULT = "standard/base"
>> -KBRANCH = "${KBRANCH_DEFAULT}"
>> -
>> -SRCREV_machine_qemuarm ?= "aa76cc28408376814752bd36fb0dcf0e25aa5ba3"
>> -SRCREV_machine_qemumips  ?= "aa0affda03c955678b26b2fb586f1d9505127871"
>> -SRCREV_machine_qemumips64 ?= "077bff22c9951db6b35470ba17b1df2f2a91fefb"
>> -SRCREV_machine_qemuppc ?= "698eada61d9385b42dd117858b943655b565084b"
>> -SRCREV_machine_qemux86 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
>> -SRCREV_machine_qemux86-64 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
>> -SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
>> -SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
>> -
>> -SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>> -
>> -LINUX_VERSION ?= "3.8.13"
>> -
>> -PR = "${INC_PR}.2"
>> -PV = "${LINUX_VERSION}+git${SRCPV}"
>> -
>> -KMETA = "meta"
>> -
>> -COMPATIBLE_MACHINE =
>> "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>> -
>> -# Functionality flags
>> -KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>> -KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>> -KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
>> " cfg/x32.scc", "" ,d)}"
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

