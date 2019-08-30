Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id D9FED7F45D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 20:05:14 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id w67so6242226lff.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 13:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=95q6OIdbIDjiisDEQMGCM/KsuqBx9HBfI9zym4jx488=;
	b=nbzl9ziS7HpguNDrZX8BWWRM5k+ELebIihM0+V4Bzkfb+DJB3Yxd8Z8dyCIx4M1qhY
	og3rQztSLmYT8rb7Ml3J8Ivai93cIGXre8UCQBQXxifvcCjFj08ISJrVMrjH+T21W8NV
	u9a+KI/zIEf18cYLHh5w9viOYe1afKoRjacfDQpY3tkR95er1f9mk88nQ1Gi9/Q4lQug
	3cmIjVCJ3elvRsWsNSlBg1uv49CgOOhcR4TnndRo54w4y59W+U5ZKCET3GMzBv8R5MlH
	C46xzcLSU8IIIW7M33GUzXKVatCuGZ6F/pp/GGcUR97wE6DmBWNABHlKcNohHn8e+fWr
	Iobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=95q6OIdbIDjiisDEQMGCM/KsuqBx9HBfI9zym4jx488=;
	b=mXSNm9/8hA/OvaE/gVQBlcOBdkuDpuKyr3qGxiZw0v2qmdZELi3ErnGNenNNTYhCo/
	UBdCNOWdmgens6MGUtIzlAkioleKTos/yD4vm57kQ0gYM75iTp92TBrXrAh3UC1KaT6m
	3LYvh/ZH+bLNXcowK1k1yG4BYWhA6gTYs2jxg5Vsoy7bbrznK0sKZm5oqBuw6Z2tPuOQ
	gH5kbx3DQ0+nIxfl3x2bjw2nKEJwOH6QFLzDkj4w/bIn2NNWNhZw3j8gT0UW8+HFsRvx
	YGuHWhW5LAwMHtmytx5WBFlBLk3JvtqzBYwS0ixvwCX0YF59EmZDgPNE1l5GMS/UCnN8
	3Khw==
X-Gm-Message-State: APjAAAV6nXVw9MUpMv7Fzl+vik2lm2a9uHzed0sm0CAZTREuy8zRU7CE
	+v7uogaSMDbx3ltAFZPJXPP1T9++jl+tBU0ak/k=
X-Google-Smtp-Source: APXvYqysW6LYEwCaeaPIhE+1y+AL55byTZfJ7a/9TOq6I4dO6Ormae0X/iV8LDffgQ0S9XYV7TkGZO175i3iIIo5CDY=
X-Received: by 2002:a19:4912:: with SMTP id w18mr10221816lfa.93.1567195515195; 
	Fri, 30 Aug 2019 13:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567181039.git.bruce.ashfield@gmail.com>
	<8808749c65285dd434105d0583d5f16b7bbf2ac8.1567181039.git.bruce.ashfield@gmail.com>
In-Reply-To: <8808749c65285dd434105d0583d5f16b7bbf2ac8.1567181039.git.bruce.ashfield@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 30 Aug 2019 13:01:03 -0700
Message-ID: <CAKmqyKMOmCXRoNjni=0-Rt2mQ5UMQ3mQwz-AXhHjdptVgRpz2g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] linux-yocto: introduce 5.2 recipes
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
X-List-Received-Date: Fri, 30 Aug 2019 20:05:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 9:07 AM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Introducing the 5.2 linux-yocto reference kernels. 5.0 is EOL and will
> be removed, leaving 4.19 (LTS) and 5.2 as the reference kernels.
>
> This has been build/boot tested on all qemu architectures for
> core-image-kernel-dev, and graphics tesed via core-image-sato. No
> blocking issues have been found.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.2.bb               | 44 +++++++++++++++
>  .../linux/linux-yocto-tiny_5.2.bb             | 32 +++++++++++
>  meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 +++++++++++++++++++
>  3 files changed, 130 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> new file mode 100644
> index 0000000000..1126734dbb
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> @@ -0,0 +1,44 @@
> +KBRANCH ?= "v5.2/standard/preempt-rt/base"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +# Skip processing of this recipe if it is not explicitly specified as the
> +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
> +# to build multiple virtual/kernel providers, e.g. as dependency of
> +# core-image-rt-sdk, core-image-rt.
> +python () {
> +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
> +        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> +}
> +
> +SRCREV_machine ?= "abe36b584560b3ab9c4c2ece15d5e44494f02427"
> +SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> +
> +LINUX_VERSION ?= "5.2.10"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> +
> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> +DEPENDS += "openssl-native util-linux-native"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +KMETA = "kernel-meta"
> +KCONF_BSP_AUDIT_LEVEL = "2"
> +
> +LINUX_KERNEL_TYPE = "preempt-rt"
> +
> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
> +
> +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> +
> +# Functionality flags
> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> new file mode 100644
> index 0000000000..03525509df
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> @@ -0,0 +1,32 @@
> +KBRANCH ?= "v5.2/standard/tiny/base"
> +KBRANCH_qemuarm  ?= "v5.2/standard/tiny/arm-versatile-926ejs"
> +
> +LINUX_KERNEL_TYPE = "tiny"
> +KCONFIG_MODE = "--allnoconfig"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +LINUX_VERSION ?= "5.2.10"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> +
> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> +DEPENDS += "openssl-native util-linux-native"
> +
> +KMETA = "kernel-meta"
> +KCONF_BSP_AUDIT_LEVEL = "2"
> +
> +SRCREV_machine_qemuarm ?= "de3456fa6c9c2bec7ffc907be0d19c0ffb8ef459"
> +SRCREV_machine ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> +SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> +
> +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
> +
> +# Functionality flags
> +KERNEL_FEATURES = ""
> +
> +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> new file mode 100644
> index 0000000000..8bafeb3c46
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> @@ -0,0 +1,54 @@
> +KBRANCH ?= "v5.2/standard/base"
> +
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +# board specific branches
> +KBRANCH_qemuarm  ?= "v5.2/standard/arm-versatile-926ejs"
> +KBRANCH_qemuarm64 ?= "v5.2/standard/qemuarm64"
> +KBRANCH_qemumips ?= "v5.2/standard/mti-malta32"
> +KBRANCH_qemuppc  ?= "v5.2/standard/qemuppc"
> +KBRANCH_qemuriscv64  ?= "v5.2/standard/base"
> +KBRANCH_qemux86  ?= "v5.2/standard/base"
> +KBRANCH_qemux86-64 ?= "v5.2/standard/base"
> +KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
> +
> +SRCREV_machine_qemuarm ?= "c9b6ba7aba803fdf715e93c22fe5927767b08a64"
> +SRCREV_machine_qemuarm64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> +SRCREV_machine_qemumips ?= "31f1ce49e00a7bbb136a81480da135865da0ea90"
> +SRCREV_machine_qemuppc ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> +SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"

Can the qemuriscv64 machine also be updated to
55dd15336b7301b686a0c183f5372b49c1003d03?

Alistair

> +SRCREV_machine_qemux86 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> +SRCREV_machine_qemux86-64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> +SRCREV_machine_qemumips64 ?= "898f35c813f9d89acd456c193b9005771ab37a60"
> +SRCREV_machine ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> +SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
> +
> +# remap qemuarm to qemuarma15 for the 5.2 kernel
> +# KMACHINE_qemuarm ?= "qemuarma15"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> +LINUX_VERSION ?= "5.2.10"
> +
> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> +DEPENDS += "openssl-native util-linux-native"
> +
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +
> +KMETA = "kernel-meta"
> +KCONF_BSP_AUDIT_LEVEL = "2"
> +
> +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> +
> +COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
> +
> +# Functionality flags
> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

