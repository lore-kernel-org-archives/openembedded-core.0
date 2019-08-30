Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8746F7F45D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 20:24:08 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u13so6256846lfm.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 13:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R/kemctFXZTRtY5OgSDrOYa6FPCGf/Xq4yA/qwgHVsw=;
	b=DdvILfqnOWkPeuSEjDDyX9fO5xbEv10cwkfBU+UWNkvXW82yIxY2vmjAu2qEK5DJdg
	JW45e+dDxOIQFhQZCHNI9QsBW1zSzqo5DKpegveXSmsJckwbiCj67tZVoHhTZgOMtQIp
	9bQwltlRIyUeIUaK1+WpVzQPC5nhMaUs+NuRk/m0vSylO4kLxujHiVt8QCYZR8K89QFL
	ewmdvA/32V0A/Db0rljOc9VX2pTfqb0U/PNoQwp7Gt+AzOKzwLWBQjz8vppfe7qG3I7K
	7PV3+I+a9vo8b0YqWnGFsPxzXZTpBl0+z/Wra0rNMY5gwYRB0W75sW+FPc6pteKk3FBJ
	gcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R/kemctFXZTRtY5OgSDrOYa6FPCGf/Xq4yA/qwgHVsw=;
	b=XrNrZOkjH4/DTE3QBDg06+F9Jeuz4oqD+BgvZs+lH0NLLNrice4iF/Riyw0Cc7Z0tr
	5Bdnsg7i+flsg1xs2/CD0Il4/SGCYkHJf3W6tr0TV8hGytGIh5QkwyPuxKnTnQrpLQNu
	ALzzGBopDftCnyNNaftleTYBrjsAy+dqnu54nHuKYgQnHD2q1bMBu6HLSqv/S5zy32me
	kw0DYaYshK4g29KFejBEZDdlK9oHVll18qUcMl9Yl15EObdMvPJT7T0/h+6ili0Xpq9T
	fPqvfyjXd7pXzoJssDyY2Urrh1Q4WJ/KR/wbCnyyHfxJvfX25soHLcUqw9rFKpWMxazS
	N/ug==
X-Gm-Message-State: APjAAAW9Emnu9CrzoHICvDOaFuf9Cy2WubM53b4uRshFBV2VUIlyqImb
	24XtZT/c971qDe0S2UDUckdeBVNFzEjwjZRNOOU=
X-Google-Smtp-Source: APXvYqxuSX+xrDuAI77d30A+huO7IZi32PRA3iyNwWDJTG5DqvE8b2o+Fks4BcUbA/OnzbTfbqseRu/BPiDIMPk5j2Q=
X-Received: by 2002:ac2:562c:: with SMTP id b12mr6588545lff.156.1567196649007; 
	Fri, 30 Aug 2019 13:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567181039.git.bruce.ashfield@gmail.com>
	<8808749c65285dd434105d0583d5f16b7bbf2ac8.1567181039.git.bruce.ashfield@gmail.com>
	<CAKmqyKMOmCXRoNjni=0-Rt2mQ5UMQ3mQwz-AXhHjdptVgRpz2g@mail.gmail.com>
	<CAKmqyKOuKuanH8YAQFUpn5gMneooRqvFzgtxzNiNVEyBuL6tXw@mail.gmail.com>
	<CADkTA4Os1Ms92fEC4xF2CHgj0Nt1BZqiGWWetkNCAGMEokgjjQ@mail.gmail.com>
In-Reply-To: <CADkTA4Os1Ms92fEC4xF2CHgj0Nt1BZqiGWWetkNCAGMEokgjjQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 30 Aug 2019 13:19:58 -0700
Message-ID: <CAKmqyKOBy5fpxFPWcR8hM6HbwPOksYw7+pYLfemzkeGJdu0TXQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Aug 2019 20:24:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 1:14 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> I have a script that takes care of the SRCREV bumps, and it didn't
> have the qemuriscv in it!
>
> I've tweaked my config and will send a new SRCREV bump (not a new
> version) that has that update.

Thanks for updating the script!

That works for me.

Alistair

>
> Cheers,
>
> Bruce
>
> On Fri, Aug 30, 2019 at 4:11 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Fri, Aug 30, 2019 at 1:01 PM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Fri, Aug 30, 2019 at 9:07 AM <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Introducing the 5.2 linux-yocto reference kernels. 5.0 is EOL and will
> > > > be removed, leaving 4.19 (LTS) and 5.2 as the reference kernels.
> > > >
> > > > This has been build/boot tested on all qemu architectures for
> > > > core-image-kernel-dev, and graphics tesed via core-image-sato. No
> > > > blocking issues have been found.
> > > >
> > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > ---
> > > >  .../linux/linux-yocto-rt_5.2.bb               | 44 +++++++++++++++
> > > >  .../linux/linux-yocto-tiny_5.2.bb             | 32 +++++++++++
> > > >  meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 +++++++++++++++++++
> > > >  3 files changed, 130 insertions(+)
> > > >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> > > >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> > > >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> > > > new file mode 100644
> > > > index 0000000000..1126734dbb
> > > > --- /dev/null
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> > > > @@ -0,0 +1,44 @@
> > > > +KBRANCH ?= "v5.2/standard/preempt-rt/base"
> > > > +
> > > > +require recipes-kernel/linux/linux-yocto.inc
> > > > +
> > > > +# Skip processing of this recipe if it is not explicitly specified as the
> > > > +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
> > > > +# to build multiple virtual/kernel providers, e.g. as dependency of
> > > > +# core-image-rt-sdk, core-image-rt.
> > > > +python () {
> > > > +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
> > > > +        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > > > +}
> > > > +
> > > > +SRCREV_machine ?= "abe36b584560b3ab9c4c2ece15d5e44494f02427"
> > > > +SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
> > > > +
> > > > +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > > > +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> > > > +
> > > > +LINUX_VERSION ?= "5.2.10"
> > > > +
> > > > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > > +
> > > > +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > > > +DEPENDS += "openssl-native util-linux-native"
> > > > +
> > > > +PV = "${LINUX_VERSION}+git${SRCPV}"
> > > > +
> > > > +KMETA = "kernel-meta"
> > > > +KCONF_BSP_AUDIT_LEVEL = "2"
> > > > +
> > > > +LINUX_KERNEL_TYPE = "preempt-rt"
> > > > +
> > > > +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
> > > > +
> > > > +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > > > +
> > > > +# Functionality flags
> > > > +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
> > > > +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> > > > +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
> > > > +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > > +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > > +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> > > > new file mode 100644
> > > > index 0000000000..03525509df
> > > > --- /dev/null
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> > > > @@ -0,0 +1,32 @@
> > > > +KBRANCH ?= "v5.2/standard/tiny/base"
> > > > +KBRANCH_qemuarm  ?= "v5.2/standard/tiny/arm-versatile-926ejs"
> > > > +
> > > > +LINUX_KERNEL_TYPE = "tiny"
> > > > +KCONFIG_MODE = "--allnoconfig"
> > > > +
> > > > +require recipes-kernel/linux/linux-yocto.inc
> > > > +
> > > > +LINUX_VERSION ?= "5.2.10"
> > > > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > > +
> > > > +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > > > +DEPENDS += "openssl-native util-linux-native"
> > > > +
> > > > +KMETA = "kernel-meta"
> > > > +KCONF_BSP_AUDIT_LEVEL = "2"
> > > > +
> > > > +SRCREV_machine_qemuarm ?= "de3456fa6c9c2bec7ffc907be0d19c0ffb8ef459"
> > > > +SRCREV_machine ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > > +SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
> > > > +
> > > > +PV = "${LINUX_VERSION}+git${SRCPV}"
> > > > +
> > > > +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > > > +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> > > > +
> > > > +COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
> > > > +
> > > > +# Functionality flags
> > > > +KERNEL_FEATURES = ""
> > > > +
> > > > +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > > > new file mode 100644
> > > > index 0000000000..8bafeb3c46
> > > > --- /dev/null
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > > > @@ -0,0 +1,54 @@
> > > > +KBRANCH ?= "v5.2/standard/base"
> > > > +
> > > > +require recipes-kernel/linux/linux-yocto.inc
> > > > +
> > > > +# board specific branches
> > > > +KBRANCH_qemuarm  ?= "v5.2/standard/arm-versatile-926ejs"
> > > > +KBRANCH_qemuarm64 ?= "v5.2/standard/qemuarm64"
> > > > +KBRANCH_qemumips ?= "v5.2/standard/mti-malta32"
> > > > +KBRANCH_qemuppc  ?= "v5.2/standard/qemuppc"
> > > > +KBRANCH_qemuriscv64  ?= "v5.2/standard/base"
> > > > +KBRANCH_qemux86  ?= "v5.2/standard/base"
> > > > +KBRANCH_qemux86-64 ?= "v5.2/standard/base"
> > > > +KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
> > > > +
> > > > +SRCREV_machine_qemuarm ?= "c9b6ba7aba803fdf715e93c22fe5927767b08a64"
> > > > +SRCREV_machine_qemuarm64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > > +SRCREV_machine_qemumips ?= "31f1ce49e00a7bbb136a81480da135865da0ea90"
> > > > +SRCREV_machine_qemuppc ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > > +SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> > >
> > > Can the qemuriscv64 machine also be updated to
> > > 55dd15336b7301b686a0c183f5372b49c1003d03?
> >
> > Whoops, copied the wrong commit SHA.
> >
> > I meant: 35276d20c01a78ee3640a074446b0c15c486c5d0 (the same one the
> > other "v5.2/standard/base" machines are using).
> >
> > Alistair
> >
> > >
> > > Alistair
> > >
> > > > +SRCREV_machine_qemux86 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > > +SRCREV_machine_qemux86-64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > > +SRCREV_machine_qemumips64 ?= "898f35c813f9d89acd456c193b9005771ab37a60"
> > > > +SRCREV_machine ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
> > > > +SRCREV_meta ?= "552f94eb15525c2be2e56615880f1018c3bfbb8a"
> > > > +
> > > > +# remap qemuarm to qemuarma15 for the 5.2 kernel
> > > > +# KMACHINE_qemuarm ?= "qemuarma15"
> > > > +
> > > > +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
> > > > +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> > > > +
> > > > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > > +LINUX_VERSION ?= "5.2.10"
> > > > +
> > > > +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > > > +DEPENDS += "openssl-native util-linux-native"
> > > > +
> > > > +PV = "${LINUX_VERSION}+git${SRCPV}"
> > > > +
> > > > +KMETA = "kernel-meta"
> > > > +KCONF_BSP_AUDIT_LEVEL = "2"
> > > > +
> > > > +KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
> > > > +
> > > > +COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
> > > > +
> > > > +# Functionality flags
> > > > +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> > > > +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> > > > +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
> > > > +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > > +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> > > > +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> > > > +KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > > > --
> > > > 2.19.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

