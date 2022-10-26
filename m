Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D829C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 22:25:25 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.21.1666823117534719335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 15:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=P1wybY2A;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id m15so43957512edb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 15:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hPexddYH3P22tlloRe6ZrlclFJVEOhWtWcQ0BB8hAwY=;
        b=P1wybY2AlF7U2THNHbRwUIZzFnOj5CFWfaVnAAS5hjZ3ImaJxybPZzRdxMIbC6/0PI
         Rx4Y7YoW1Rt2mw8/2MILM7n1xLpFx+F9qUU73GA/ej8IAanlS6Xt3OAQErfEqfGZTba5
         iWW9XPwhbIezECvKjISjie6HJ8qmuAInGF+zHQGary6szNHuHHT6O4TMmqkoIKFOBf1Q
         YSX7gZ0d0/92EfxF3RwT+IlxZqwy2LXHg2L0uhMYvp4NQfvUJxetWxiwDyY6XxKIh/cN
         P8J/DFzJHUxOeRt2cQ/4FM4xskc9SLVU9pJI0UFBbsxul+/UAhY8sLx0PoUZ9iDeCqSJ
         yd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPexddYH3P22tlloRe6ZrlclFJVEOhWtWcQ0BB8hAwY=;
        b=DL5kNXAQRa2q/f58m07DYtbS1IoHyuRIw2OR5gzHSzXG5Zd7qYsJmVq8wz/W/aXmub
         EbrDpwnLD9q9BLL10l89Wx5D34C8xNBrMOk2Nc4y8x93uTuDLFacGJwnDyc64+aFR2ng
         B5WzZLRHudYUCWv9SWH8IiorEWkTnmbZpgCkDu298vcTAmPpwXKK6CNHN0dLrTkIZbu2
         DjqsQGNKpBlWHcxZ22fmS/rRqnaDijSHcUo4uZHArohzZsGqEhLy+No3BEHUTgfnP3aR
         89byNMspL0HFxyb7Qm6zKezpGKB6oaTKSPn5shtigbr7xsHeHHuX2w+zf9cg1d13RXjc
         OpCg==
X-Gm-Message-State: ACrzQf2MMncSrI+jKsAD5TUjvVGagq6ymEq+8T1PSeHoyWuaUl6jsR1k
	LeD4BWeHpBWpbHw/YBZuVL6lztdGkK6NYkEdWKIjOw==
X-Google-Smtp-Source: AMsMyM5GxkN4Ih6vbbGGQHg0ElsHFGIuawzKRNvTh0IZARmk5fjLo3Pj4Nva2AkfYvCaVPO4Rqael2ZdMM0cR77w8fQ=
X-Received: by 2002:a05:6402:3645:b0:45f:e918:9f35 with SMTP id
 em5-20020a056402364500b0045fe9189f35mr33257157edb.118.1666823115647; Wed, 26
 Oct 2022 15:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221020143708.45894-1-bruce.ashfield@gmail.com>
 <20221020143708.45894-2-bruce.ashfield@gmail.com> <171FEA39E03B9F78.7711@lists.openembedded.org>
In-Reply-To: <171FEA39E03B9F78.7711@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 26 Oct 2022 12:25:04 -1000
Message-ID: <CAOSpxdYttYJ09y6TqO3k8N4ozoVoFeQLnCmZ+6tJCN4J30q3LA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2][kirkstone] linux-yocto/5.10: update to v5.10.149
To: steve@sakoman.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 22:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172176

On Thu, Oct 20, 2022 at 1:18 PM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Hi Bruce,
>
> Unfortunately I'm getting a ptest failure on the autobuilder with this change:
>
> AssertionError: Failed ptests:
> {'lttng-tools': ['kernel/test_callstack_11_-_Validate_userspace_callstack',
> 'kernel/test_userspace_probe_94_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_function',
> 'kernel/test_userspace_probe_95_-_Start_tracing_for_session_test_userprobe_elf_cxx_function',
> 'kernel/test_userspace_probe_96_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_function',
> 'kernel/test_userspace_probe_97_-_Validate_trace_for_event_userspace_probe_test_event',
> 'kernel/test_userspace_probe_100_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_method',
> 'kernel/test_userspace_probe_101_-_Start_tracing_for_session_test_userprobe_elf_cxx_method',
> 'kernel/test_userspace_probe_102_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_method',
> 'kernel/test_userspace_probe_103_-_Validate_trace_for_event_userspace_probe_test_event']}
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/4146/steps/13/logs/stdio

Actually I see now that this issue isn't due to the kernel version
bump, but to an lttng-tools version bump (2.13.4 -> 2.13.8)

I verified that the ptest fails with 2.13.8 both pre and post kernel
version bumps, and passes with 2.13.4 both pre and post kernel version
bumps.

So I've reverted the lttng-tools version bump until we can sort this out.

Steve


> On Thu, Oct 20, 2022 at 4:37 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating  to the latest korg -stable release that comprises
> > the following commits:
> >
> >     09be132bfe3a Linux 5.10.149
> >     31ce5da48a84 wifi: mac80211: fix MBSSID parsing use-after-free
> >     353b5c8d4bea wifi: mac80211: don't parse mbssid in assoc response
> >     66dacdbc2e83 mac80211: mlme: find auth challenge directly
> >     a07708a84355 Revert "fs: check FMODE_LSEEK to control internal pipe splicing"
> >     3783e64fee4a Linux 5.10.148
> >     0df206bdc620 misc: pci_endpoint_test: Fix pci_endpoint_test_{copy,write,read}() panic
> >     40a29e58f639 misc: pci_endpoint_test: Aggregate params checking for xfer
> >     9c13b1a044c9 Input: xpad - fix wireless 360 controller breaking after suspend
> >     19dba9c3b5a3 Input: xpad - add supported devices as contributed on github
> >     b2b9386667e6 wifi: cfg80211: update hidden BSSes to avoid WARN_ON
> >     58c0306d0bcd wifi: mac80211: fix crash in beacon protection for P2P-device
> >     3539e75abe3c wifi: mac80211_hwsim: avoid mac80211 warning on bad rate
> >     b0e5c5deb788 wifi: cfg80211: avoid nontransmitted BSS list corruption
> >     6b9448450313 wifi: cfg80211: fix BSS refcounting bugs
> >     6144c97f96f5 wifi: cfg80211: ensure length byte is present before access
> >     e7aa7fd10eba wifi: cfg80211/mac80211: reject bad MBSSID elements
> >     a6408e0b694c wifi: cfg80211: fix u8 overflow in cfg80211_update_notlisted_nontrans()
> >     b0c37581be9a random: use expired timer rather than wq for mixing fast pool
> >     c1a4423fd30f random: avoid reading two cache lines on irq randomness
> >     638f84a718d9 USB: serial: qcserial: add new usb-id for Dell branded EM7455
> >     36b33c63515a scsi: stex: Properly zero out the passthrough command structure
> >     438994b8cd6a efi: Correct Macmini DMI match in uefi cert quirk
> >     2fd1caa0c64b ALSA: hda: Fix position reporting on Poulsbo
> >     011399a3f926 random: clamp credited irq bits to maximum mixed
> >     fc87c413f272 random: restore O_NONBLOCK support
> >     c04b67c54472 Revert "clk: ti: Stop using legacy clkctrl names for omap4 and 5"
> >     0a49bfa8f82f rpmsg: qcom: glink: replace strncpy() with strscpy_pad()
> >     3451df3a514c USB: serial: ftdi_sio: fix 300 bps rate for SIO
> >     1b257f97fec4 usb: mon: make mmapped memory read only
> >     3ba555d8e12f mmc: core: Terminate infinite loop in SD-UHS voltage switch
> >     068465836652 mmc: core: Replace with already defined values for readability
> >     4f32f266b108 drm/amd/display: skip audio setup when audio stream is enabled
> >     a6fe179ba03f drm/amd/display: update gamut remap if plane has changed
> >     73e1b27b58a6 net: atlantic: fix potential memory leak in aq_ndev_close()
> >     3287f0d72710 arch: um: Mark the stack non-executable to fix a binutils warning
> >     aeb8315593a6 um: Cleanup compiler warning in arch/x86/um/tls_32.c
> >     6d4deaba063d um: Cleanup syscall_handler_t cast in syscalls_32.h
> >     6d7a47e84913 ALSA: hda/hdmi: Fix the converter reuse for the silent stream
> >     c1337f8ea861 net/ieee802154: fix uninit value bug in dgram_sendmsg
> >     034b30c31146 scsi: qedf: Fix a UAF bug in __qedf_probe()
> >     29461bbe2d7f ARM: dts: fix Moxa SDIO 'compatible', remove 'sdhci' misnomer
> >     dae0b77cb8b2 dmaengine: xilinx_dma: Report error in case of dma_set_mask_and_coherent API failure
> >     e0ca2998dfba dmaengine: xilinx_dma: cleanup for fetching xlnx,num-fstores property
> >     789e590cb8c4 dmaengine: xilinx_dma: Fix devm_platform_ioremap_resource error handling
> >     64e240934c31 firmware: arm_scmi: Add SCMI PM driver remove routine
> >     6df7c6d141ec compiler_attributes.h: move __compiletime_{error|warning}
> >     1e555c3ed1fc fs: fix UAF/GPF bug in nilfs_mdt_destroy
> >     acf05d61d39b powerpc/64s/radix: don't need to broadcast IPI for radix pmd collapse flush
> >     377c60dd32d3 mm: gup: fix the fast GUP race against THP collapse
> >     fce793a056c6 ALSA: pcm: oss: Fix race at SNDCTL_DSP_SYNC
> >     132590d776e2 xsk: Inherit need_wakeup flag for shared sockets
> >     beffc38dc6b2 perf tools: Fixup get_current_dir_name() compilation
> >     fb380f548c44 docs: update mediator information in CoC docs
> >     c7f4af575b1d Makefile.extrawarn: Move -Wcast-function-type-strict to W=1
> >     b23b0cd57e2c ceph: don't truncate file in atomic_open
> >     8a18fdc5ae8e nilfs2: replace WARN_ONs by nilfs_error for checkpoint acquisition failure
> >     aad4c997857f nilfs2: fix leak of nilfs_root in case of writer thread creation failure
> >     21ee3cffed8f nilfs2: fix use-after-free bug of struct nilfs_root
> >     3f840480e314 nilfs2: fix NULL pointer dereference at nilfs_bmap_lookup_at_level()
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
> >  .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
> >  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
> >  3 files changed, 19 insertions(+), 19 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> > index 1f8c5ac50f..f04f444f07 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> > @@ -11,13 +11,13 @@ python () {
> >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >  }
> >
> > -SRCREV_machine ?= "02eb724ea2893ad5e002f68a02137e738bcdbfa3"
> > -SRCREV_meta ?= "df3b69dd24f7d249da49c027e749cd757f9eb70e"
> > +SRCREV_machine ?= "2d7a731e45ade04ee2f2714f189c7c98e00b2238"
> > +SRCREV_meta ?= "47b7070aa771dec970b79cb84e7b8c9329a93678"
> >
> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
> >
> > -LINUX_VERSION ?= "5.10.147"
> > +LINUX_VERSION ?= "5.10.149"
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> > index 3d69571b42..e3cfd65a0d 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> > @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
> >
> >  require recipes-kernel/linux/linux-yocto.inc
> >
> > -LINUX_VERSION ?= "5.10.147"
> > +LINUX_VERSION ?= "5.10.149"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >
> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
> >  KMETA = "kernel-meta"
> >  KCONF_BSP_AUDIT_LEVEL = "2"
> >
> > -SRCREV_machine:qemuarm ?= "faa3a54d0b5f1b1538b6cb23a0f897571c3dbd63"
> > -SRCREV_machine ?= "ad1a2bb304ee3e96330c8b21b9257af12a636384"
> > -SRCREV_meta ?= "df3b69dd24f7d249da49c027e749cd757f9eb70e"
> > +SRCREV_machine:qemuarm ?= "bfcb0909af273bd7fb7ff1376637c9e23c344a0e"
> > +SRCREV_machine ?= "84e9465dec9a7dfe8790c70d44def5aaee8f9968"
> > +SRCREV_meta ?= "47b7070aa771dec970b79cb84e7b8c9329a93678"
> >
> >  PV = "${LINUX_VERSION}+git${SRCPV}"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> > index e192406649..81c96ae69c 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> > @@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
> >  KBRANCH:qemux86-64 ?= "v5.10/standard/base"
> >  KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
> >
> > -SRCREV_machine:qemuarm ?= "e2240e46237b37b9513c499b9fa3bcf48457739c"
> > -SRCREV_machine:qemuarm64 ?= "2d0288dbda90298b31ac96572fa618ec699c6c34"
> > -SRCREV_machine:qemumips ?= "32b951885ae1b49e5f7e2c9588f537241e4d3aa8"
> > -SRCREV_machine:qemuppc ?= "f02e31aa61cf6051aa674005b334f472316b9c80"
> > -SRCREV_machine:qemuriscv64 ?= "c4a8c9a7f92058d94d33cb0db8cecb73821bdcd0"
> > -SRCREV_machine:qemuriscv32 ?= "c4a8c9a7f92058d94d33cb0db8cecb73821bdcd0"
> > -SRCREV_machine:qemux86 ?= "c4a8c9a7f92058d94d33cb0db8cecb73821bdcd0"
> > -SRCREV_machine:qemux86-64 ?= "c4a8c9a7f92058d94d33cb0db8cecb73821bdcd0"
> > -SRCREV_machine:qemumips64 ?= "0ca215b63d2bf06eeeb4c69ceed8537fd68e3d2e"
> > -SRCREV_machine ?= "c4a8c9a7f92058d94d33cb0db8cecb73821bdcd0"
> > -SRCREV_meta ?= "df3b69dd24f7d249da49c027e749cd757f9eb70e"
> > +SRCREV_machine:qemuarm ?= "9b3a47c50c96c81ab492cc37023deef03718d36d"
> > +SRCREV_machine:qemuarm64 ?= "fc6a3081ecfda16e3c2a1b9f5f0b0fb561f72435"
> > +SRCREV_machine:qemumips ?= "fc97b0bf35ce6d3c17cf2037d2097654d16c643b"
> > +SRCREV_machine:qemuppc ?= "3a90218bbe8c5e71c9aa64dc3db41e16718ae8d3"
> > +SRCREV_machine:qemuriscv64 ?= "7abf3b31ec4e4fc9564b7a8db6844d9b4d71a1b2"
> > +SRCREV_machine:qemuriscv32 ?= "7abf3b31ec4e4fc9564b7a8db6844d9b4d71a1b2"
> > +SRCREV_machine:qemux86 ?= "7abf3b31ec4e4fc9564b7a8db6844d9b4d71a1b2"
> > +SRCREV_machine:qemux86-64 ?= "7abf3b31ec4e4fc9564b7a8db6844d9b4d71a1b2"
> > +SRCREV_machine:qemumips64 ?= "7b6dc74b768b8015bdd2cf88abdf0106a56de0f9"
> > +SRCREV_machine ?= "7abf3b31ec4e4fc9564b7a8db6844d9b4d71a1b2"
> > +SRCREV_meta ?= "47b7070aa771dec970b79cb84e7b8c9329a93678"
> >
> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> > -LINUX_VERSION ?= "5.10.147"
> > +LINUX_VERSION ?= "5.10.149"
> >
> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> >  DEPENDS += "openssl-native util-linux-native"
> > --
> > 2.19.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172008): https://lists.openembedded.org/g/openembedded-core/message/172008
> Mute This Topic: https://lists.openembedded.org/mt/94454599/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

