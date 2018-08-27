Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id C42C3755C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:15:29 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id g197-v6so10708236qke.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 08:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lNIJcBlwHSuUY3CdzR+3Wo7zDiJXIosbrF56XLCJeug=;
	b=XjP9f0fze5CnJHfrrJbZsbVxqDZTJvI1IZJ6L/FYon91d5IIW6L/2afPsnCiF2zVVr
	1Uw3irwZooCIBUSIVgpSczGy2bFC/UK8Mv9uhEWlTleKyIw16hAr8XpS9hQVAiERRqmc
	8KH8T6+ifsrUOIiucI/KIUCrHRakKiLZrpUuP4qc0fywqXWJrN0IoAjGHQB9Ju4kM8hj
	XeYHwIliAN4eTP3KpBH/rkFE9Zl53pZThwJDIx+/Op6KVsNV/S1AwTx81Qu557EeJrPN
	cTvuO2Rf7tJKihlBb0gHg3oWqex3TZOTK9gJFAkmL3VVryfn8pMfeAGXxR4JtsAZcJCB
	Nf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lNIJcBlwHSuUY3CdzR+3Wo7zDiJXIosbrF56XLCJeug=;
	b=YQPOtLhjonsb6i4SXdEfuXKpcr620mLgzbuFlArkSMrJB8VCIUipfurbMMc2S4VIrh
	4JedKkd6rWiToOEfCAqguK0ZWBS1MRkdXVbNXZ+v88mxsE6DrREcRtm0jHuA2bhFeKKK
	Ua9Y3pV01qdZkiQUC+i4/2Q8OT2kf5hPiGSnWJejoOXZCGeOtaYgikZ2SaXXqVr1ChbZ
	2Bh8IsGhSVMfm5qVg+bbvuSwELghQTIQaFbtU3HNZie9kz5JGpkxuxbfSPeVZKWJhcQw
	4Ily2FT9HKoEvfPp72dmkaVDfUiBk8xS4ycGSQod6nZP87u9RxVTg4sH/2zIGvEnytaU
	4jrA==
X-Gm-Message-State: APzg51DNKkXEbJ9VYr43c2DnyG6V2NDJ61VR85YqREmtJX6un61kpKIV
	+MHBCzYmeTZfrkx/XOs/B2NfIGg1TO+WLYKLrBY=
X-Google-Smtp-Source: ANB0VdaAwa0cN3AAZ8ZagRpkGlSIVOdtXp84lOR3nqikS7L9+Xj3+3A44/n94vVhJrMhADOTNwyto4nVCzuaFE4PwGU=
X-Received: by 2002:a37:9904:: with SMTP id
	b4-v6mr14078161qke.102.1535382930382; 
	Mon, 27 Aug 2018 08:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
	<07f521eca58e783f87bd11793d76a93e099befdb.1535118570.git.bruce.ashfield@windriver.com>
	<CAMKF1so+yGob=_NhA9iovsF4dp5M_NspifripUz2OfpA4bgHNg@mail.gmail.com>
	<0f3dc332-5c92-8124-9826-5d793c9bb205@windriver.com>
	<CAMKF1sqj4dvC48FCGB+SmcPMutFC3tMsOHO4ZfiX+0u2y6P5xw@mail.gmail.com>
	<15d441ba-89ec-a9a4-89c4-62686b758e0c@windriver.com>
In-Reply-To: <15d441ba-89ec-a9a4-89c4-62686b758e0c@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2018 08:15:04 -0700
Message-ID: <CAMKF1sqzjEbxxmLBf_53F-02key8zA07_N6dwU2vTCNBso_b0Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/12] linux-yocto: introduce 4.18 recipes
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
X-List-Received-Date: Mon, 27 Aug 2018 15:15:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 27, 2018 at 7:43 AM Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
>
> Sweet. I just saw mine break as well.
>
> Were you going to do the uprev to meta-oe, or did you want me to
> send a patch ?
>

I have a local patch already.

> Bruce
>
> On 2018-08-27 10:20 AM, Khem Raj wrote:
> > uprev fixes it even on mips
> > On Mon, Aug 27, 2018 at 5:59 AM Bruce Ashfield
> > <bruce.ashfield@windriver.com> wrote:
> >>
> >> On 2018-08-27 2:58 AM, Khem Raj wrote:
> >>> There is one failure on meta-openembedded seen
> >>
> >> Not bad!
> >>
> >> I'll fire off a build and see what happens here. I'm guessing that
> >> an uprev is the answer .. but you never know with mips :D
> >>
> >> Bruce
> >>
> >>>
> >>> http://errors.yoctoproject.org/Errors/Details/187942/
> >>> On Fri, Aug 24, 2018 at 8:01 AM Bruce Ashfield
> >>> <bruce.ashfield@windriver.com> wrote:
> >>>>
> >>>> Introducing the 4.18 kernel as the 'newest' kernel for the oe core
> >>>> release.
> >>>>
> >>>> This update includes tweaked configs, carried forward BSPs, features
> >>>> (aufs, yaffs2, preempt-rt) and has been tested on all arches for boot
> >>>> and performance sanity.
> >>>>
> >>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >>>> ---
> >>>>    meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 43 +++++++++++++++++++
> >>>>    meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 29 +++++++++++++
> >>>>    meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 48 ++++++++++++++++++++++
> >>>>    3 files changed, 120 insertions(+)
> >>>>    create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
> >>>>    create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
> >>>>    create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.18.bb
> >>>>
> >>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
> >>>> new file mode 100644
> >>>> index 000000000000..f740b1dcd892
> >>>> --- /dev/null
> >>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
> >>>> @@ -0,0 +1,43 @@
> >>>> +KBRANCH ?= "v4.18/standard/preempt-rt/base"
> >>>> +
> >>>> +require recipes-kernel/linux/linux-yocto.inc
> >>>> +
> >>>> +# Skip processing of this recipe if it is not explicitly specified as the
> >>>> +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
> >>>> +# to build multiple virtual/kernel providers, e.g. as dependency of
> >>>> +# core-image-rt-sdk, core-image-rt.
> >>>> +python () {
> >>>> +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
> >>>> +        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >>>> +}
> >>>> +
> >>>> +SRCREV_machine ?= "8a990322beb7b3aa5a06d7bd630f819b70911587"
> >>>> +SRCREV_meta ?= "1f78e20cc98dd46637c0beb6007214fb3650992c"
> >>>> +
> >>>> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> >>>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
> >>>> +
> >>>> +LINUX_VERSION ?= "4.18.3"
> >>>> +
> >>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >>>> +
> >>>> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> >>>> +DEPENDS += "openssl-native util-linux-native"
> >>>> +
> >>>> +PV = "${LINUX_VERSION}+git${SRCPV}"
> >>>> +
> >>>> +KMETA = "kernel-meta"
> >>>> +KCONF_BSP_AUDIT_LEVEL = "2"
> >>>> +
> >>>> +LINUX_KERNEL_TYPE = "preempt-rt"
> >>>> +
> >>>> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
> >>>> +
> >>>> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> >>>> +
> >>>> +# Functionality flags
> >>>> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
> >>>> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> >>>> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
> >>>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> >>>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> >>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
> >>>> new file mode 100644
> >>>> index 000000000000..1f0b35ec25ec
> >>>> --- /dev/null
> >>>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
> >>>> @@ -0,0 +1,29 @@
> >>>> +KBRANCH ?= "v4.18/standard/tiny/common-pc"
> >>>> +LINUX_KERNEL_TYPE = "tiny"
> >>>> +KCONFIG_MODE = "--allnoconfig"
> >>>> +
> >>>> +require recipes-kernel/linux/linux-yocto.inc
> >>>> +
> >>>> +LINUX_VERSION ?= "4.18.3"
> >>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >>>> +
> >>>> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> >>>> +DEPENDS += "openssl-native util-linux-native"
> >>>> +
> >>>> +KMETA = "kernel-meta"
> >>>> +KCONF_BSP_AUDIT_LEVEL = "2"
> >>>> +
> >>>> +SRCREV_machine ?= "eba03655e8e436ef6090100423bcea43e4911478"
> >>>> +SRCREV_meta ?= "1f78e20cc98dd46637c0beb6007214fb3650992c"
> >>>> +
> >>>> +PV = "${LINUX_VERSION}+git${SRCPV}"
> >>>> +
> >>>> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> >>>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
> >>>> +
> >>>> +COMPATIBLE_MACHINE = "qemux86|qemux86-64"
> >>>> +
> >>>> +# Functionality flags
> >>>> +KERNEL_FEATURES = ""
> >>>> +
> >>>> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> >>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
> >>>> new file mode 100644
> >>>> index 000000000000..b42c124c87da
> >>>> --- /dev/null
> >>>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
> >>>> @@ -0,0 +1,48 @@
> >>>> +KBRANCH ?= "v4.18/standard/base"
> >>>> +
> >>>> +require recipes-kernel/linux/linux-yocto.inc
> >>>> +
> >>>> +# board specific branches
> >>>> +KBRANCH_qemuarm  ?= "v4.18/standard/arm-versatile-926ejs"
> >>>> +KBRANCH_qemuarm64 ?= "v4.18/standard/qemuarm64"
> >>>> +KBRANCH_qemumips ?= "v4.18/standard/mti-malta32"
> >>>> +KBRANCH_qemuppc  ?= "v4.18/standard/qemuppc"
> >>>> +KBRANCH_qemux86  ?= "v4.18/standard/base"
> >>>> +KBRANCH_qemux86-64 ?= "v4.18/standard/base"
> >>>> +KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
> >>>> +
> >>>> +SRCREV_machine_qemuarm ?= "1af7de788a0d28968bd48ff733696de130e0427d"
> >>>> +SRCREV_machine_qemuarm64 ?= "eba03655e8e436ef6090100423bcea43e4911478"
> >>>> +SRCREV_machine_qemumips ?= "f431f068f06041a60b29628c97b507391c6ad92c"
> >>>> +SRCREV_machine_qemuppc ?= "eba03655e8e436ef6090100423bcea43e4911478"
> >>>> +SRCREV_machine_qemux86 ?= "eba03655e8e436ef6090100423bcea43e4911478"
> >>>> +SRCREV_machine_qemux86-64 ?= "eba03655e8e436ef6090100423bcea43e4911478"
> >>>> +SRCREV_machine_qemumips64 ?= "a8e005cb6453c4d59f4c460b6f034bba69ce7807"
> >>>> +SRCREV_machine ?= "eba03655e8e436ef6090100423bcea43e4911478"
> >>>> +SRCREV_meta ?= "1f78e20cc98dd46637c0beb6007214fb3650992c"
> >>>> +
> >>>> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
> >>>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
> >>>> +
> >>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >>>> +LINUX_VERSION ?= "4.18.3"
> >>>> +
> >>>> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> >>>> +DEPENDS += "openssl-native util-linux-native"
> >>>> +
> >>>> +PV = "${LINUX_VERSION}+git${SRCPV}"
> >>>> +
> >>>> +KMETA = "kernel-meta"
> >>>> +KCONF_BSP_AUDIT_LEVEL = "2"
> >>>> +
> >>>> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> >>>> +
> >>>> +COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> >>>> +
> >>>> +# Functionality flags
> >>>> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> >>>> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
> >>>> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
> >>>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> >>>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> >>>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> >>>> --
> >>>> 2.5.0
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
>

