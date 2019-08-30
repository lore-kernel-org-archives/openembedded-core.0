Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id DC3137F359
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 20:14:39 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id z17so7623932ljz.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 13:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qz5kt7h99ukukntPevhJ8MimB5ffOtiKxXPz/RF/Cio=;
	b=sR+iM6lSwVloJrkKxMkXPB/2IIuJKWxWhPhFyX4h/F/o9V3AG7FSaA3VZEXiwzzTQU
	Ta86Ahrt+PnyrAgn0xw1NmJ8b5NnbFEl+y9rkavq3rcR7yx4xWSo9WqH28tbUSCROaDY
	5TwSfOuUdUl7N4uHWgzQuSK8adXK3afE7P6QiHluldB/ptjnvzcVDVFe4rdzoTQrxtP6
	NcDmZvWdHHFbcjiVYHaW0rAyI9yBYhQZEtbN1bkc2I2ZFWoaiUV3suZXSYACxMdKTyM9
	DzYVow4a2jHiNrIsQAO4UlMKaVJaAHuwTiKvWLLimR7Zqa/mJK+20EFuKoUCxNOewj2x
	PXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qz5kt7h99ukukntPevhJ8MimB5ffOtiKxXPz/RF/Cio=;
	b=hDsqhw0C9yr34zRpoA1axeAM74FYT46F520LI4v6684Uipox2dTuLOSKG1+pAraHLI
	dnTO3FOoQTRN8907XYlsw6q7Fq7L0wDWx5qYD0SU+niIRXri9Pi6ICumbNSh4/em2s9G
	4l/k3ghMf8+aExx2JgpfRDSmK1nxWRZcMLeCuyuN7QTV42dY72z3FasuPNNbrrnF8kBR
	RkOZ9OmNleQ5yZUwg2lPEQL45JJxwYoe7TqCw7PTKlGaD0wnBRsafROROa2/YXy2I26i
	16rdAPtjgFPRlq500a2+mLvYD58xHOrN9rWIUnxJN46yQx4TGrwfL44rfCbrFERZcQav
	33Tg==
X-Gm-Message-State: APjAAAWt9/66vAdbwNdxfcdxu/uez38lTR4WSdXZ5iawCyik9YtOEp58
	Q20CCAiQGGdZzevEz4/I2LIaq146ut8dytsLd3s=
X-Google-Smtp-Source: APXvYqyGAV82Yt94zb1y+0pPxy9aHtnbpWetR9713kUwTEX3F2/z0DR2MUs6oX7K07RJc7Ev/aIZ29ZIRXoBG5YtnDY=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr3171456ljh.104.1567196080311; 
	Fri, 30 Aug 2019 13:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567181039.git.bruce.ashfield@gmail.com>
	<8808749c65285dd434105d0583d5f16b7bbf2ac8.1567181039.git.bruce.ashfield@gmail.com>
	<CAKmqyKMOmCXRoNjni=0-Rt2mQ5UMQ3mQwz-AXhHjdptVgRpz2g@mail.gmail.com>
	<CAKmqyKOuKuanH8YAQFUpn5gMneooRqvFzgtxzNiNVEyBuL6tXw@mail.gmail.com>
In-Reply-To: <CAKmqyKOuKuanH8YAQFUpn5gMneooRqvFzgtxzNiNVEyBuL6tXw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 16:14:29 -0400
Message-ID: <CADkTA4Os1Ms92fEC4xF2CHgj0Nt1BZqiGWWetkNCAGMEokgjjQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Fri, 30 Aug 2019 20:14:40 -0000
Content-Type: text/plain; charset="UTF-8"

I have a script that takes care of the SRCREV bumps, and it didn't
have the qemuriscv in it!

I've tweaked my config and will send a new SRCREV bump (not a new
version) that has that update.

Cheers,

Bruce

On Fri, Aug 30, 2019 at 4:11 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Aug 30, 2019 at 1:01 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Fri, Aug 30, 2019 at 9:07 AM <bruce.ashfield@gmail.com> wrote:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Introducing the 5.2 linux-yocto reference kernels. 5.0 is EOL and will
> > > be removed, leaving 4.19 (LTS) and 5.2 as the reference kernels.
> > >
> > > This has been build/boot tested on all qemu architectures for
> > > core-image-kernel-dev, and graphics tesed via core-image-sato. No
> > > blocking issues have been found.
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  .../linux/linux-yocto-rt_5.2.bb               | 44 +++++++++++++++
> > >  .../linux/linux-yocto-tiny_5.2.bb             | 32 +++++++++++
> > >  meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 +++++++++++++++++++
> > >  3 files changed, 130 insertions(+)
> > >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> > >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> > >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> > > new file mode 100644
> > > index 0000000000..1126734dbb
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> > > @@ -0,0 +1,44 @@
> > > +KBRANCH ?= "v5.2/standard/preempt-rt/base"
> > > +
> > > +require recipes-kernel/linux/linux-yocto.inc
> > > +
> > > +# Skip processing of this recipe if it is not explicitly specified as the
> > > +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
> > > +# to build multiple virtual/kernel providers, e.g. as dependency of
> > > +# core-image-rt-sdk, core-image-rt.
> > > +python () {
> > > +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
> > > +        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > > +}
> > > +
> > > +SRCREV_machine ?= "abe36b584560b3ab9c4c2ece15d5e44494f02427"
> > > +SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
> > > +
> > > +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > > +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> > > +
> > > +LINUX_VERSION ?= "5.2.10"
> > > +
> > > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > +
> > > +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > > +DEPENDS += "openssl-native util-linux-native"
> > > +
> > > +PV = "${LINUX_VERSION}+git${SRCPV}"
> > > +
> > > +KMETA = "kernel-meta"
> > > +KCONF_BSP_AUDIT_LEVEL = "2"
> > > +
> > > +LINUX_KERNEL_TYPE = "preempt-rt"
> > > +
> > > +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
> > > +
> > > +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > > +
> > > +# Functionality flags
> > > +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
> > > +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> > > +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
> > > +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> > > new file mode 100644
> > > index 0000000000..03525509df
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> > > @@ -0,0 +1,32 @@
> > > +KBRANCH ?= "v5.2/standard/tiny/base"
> > > +KBRANCH_qemuarm  ?= "v5.2/standard/tiny/arm-versatile-926ejs"
> > > +
> > > +LINUX_KERNEL_TYPE = "tiny"
> > > +KCONFIG_MODE = "--allnoconfig"
> > > +
> > > +require recipes-kernel/linux/linux-yocto.inc
> > > +
> > > +LINUX_VERSION ?= "5.2.10"
> > > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > +
> > > +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > > +DEPENDS += "openssl-native util-linux-native"
> > > +
> > > +KMETA = "kernel-meta"
> > > +KCONF_BSP_AUDIT_LEVEL = "2"
> > > +
> > > +SRCREV_machine_qemuarm ?= "de3456fa6c9c2bec7ffc907be0d19c0ffb8ef459"
> > > +SRCREV_machine ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > +SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
> > > +
> > > +PV = "${LINUX_VERSION}+git${SRCPV}"
> > > +
> > > +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > > +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> > > +
> > > +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
> > > +
> > > +# Functionality flags
> > > +KERNEL_FEATURES = ""
> > > +
> > > +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > > new file mode 100644
> > > index 0000000000..8bafeb3c46
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > > @@ -0,0 +1,54 @@
> > > +KBRANCH ?= "v5.2/standard/base"
> > > +
> > > +require recipes-kernel/linux/linux-yocto.inc
> > > +
> > > +# board specific branches
> > > +KBRANCH_qemuarm  ?= "v5.2/standard/arm-versatile-926ejs"
> > > +KBRANCH_qemuarm64 ?= "v5.2/standard/qemuarm64"
> > > +KBRANCH_qemumips ?= "v5.2/standard/mti-malta32"
> > > +KBRANCH_qemuppc  ?= "v5.2/standard/qemuppc"
> > > +KBRANCH_qemuriscv64  ?= "v5.2/standard/base"
> > > +KBRANCH_qemux86  ?= "v5.2/standard/base"
> > > +KBRANCH_qemux86-64 ?= "v5.2/standard/base"
> > > +KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
> > > +
> > > +SRCREV_machine_qemuarm ?= "c9b6ba7aba803fdf715e93c22fe5927767b08a64"
> > > +SRCREV_machine_qemuarm64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > +SRCREV_machine_qemumips ?= "31f1ce49e00a7bbb136a81480da135865da0ea90"
> > > +SRCREV_machine_qemuppc ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > +SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> >
> > Can the qemuriscv64 machine also be updated to
> > 55dd15336b7301b686a0c183f5372b49c1003d03?
>
> Whoops, copied the wrong commit SHA.
>
> I meant: 35276d20c01a78ee3640a074446b0c15c486c5d0 (the same one the
> other "v5.2/standard/base" machines are using).
>
> Alistair
>
> >
> > Alistair
> >
> > > +SRCREV_machine_qemux86 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > +SRCREV_machine_qemux86-64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > +SRCREV_machine_qemumips64 ?= "898f35c813f9d89acd456c193b9005771ab37a60"
> > > +SRCREV_machine ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > +SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
> > > +
> > > +# remap qemuarm to qemuarma15 for the 5.2 kernel
> > > +# KMACHINE_qemuarm ?= "qemuarma15"
> > > +
> > > +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
> > > +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> > > +
> > > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > +LINUX_VERSION ?= "5.2.10"
> > > +
> > > +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > > +DEPENDS += "openssl-native util-linux-native"
> > > +
> > > +PV = "${LINUX_VERSION}+git${SRCPV}"
> > > +
> > > +KMETA = "kernel-meta"
> > > +KCONF_BSP_AUDIT_LEVEL = "2"
> > > +
> > > +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > > +
> > > +COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
> > > +
> > > +# Functionality flags
> > > +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> > > +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> > > +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
> > > +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> > > +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > > --
> > > 2.19.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

