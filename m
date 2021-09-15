Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.9703.1631720290890093702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 08:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TCDrZ+iR;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id z94so5164807ede.8
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nLpavIr48HNSLtKiXeVftZ8mMd482ZM8KWSk4ZStt7I=;
        b=TCDrZ+iRfwEaY3jF0di6WvQiXd88feKwO+RqadYnYbBjmkRSgXwOCib8hXMsXbaku2
         UihxevhT8RT3ZNEbqYgBlUeOZtL7f3WbWFgM0uUZLL9+qeYaHwdjKuZgC4FXaMhjS5n4
         dTIABbjLgJfQSP6gLkMqsiRaIDl8BAq5Fu+zhVWaKef+0KseP7FDW+vNs71DFHUCs2mJ
         /IYiVt68Q0P64T89PA4POQSY5XnGffQBG0lDn8nSqTXZuuk2kljIP3w1QrNnh400sIty
         JsAi+wjII24sRfe4tkWnUcHKSumFQmwY314KzDFMNJ0C2hmzbWHt7y3fKpQKAQ1gwMA8
         vXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nLpavIr48HNSLtKiXeVftZ8mMd482ZM8KWSk4ZStt7I=;
        b=ogjuLVzHTu8gk1dZzSYKXJL2fmuBgX3Spezcz9iIyh6/jx4NL5VIFx1IaRPH6VDneH
         jk/+CZ1A6h3XikhReJi9cyMF5l/7TNeMxKq/G5vm9mmfcsKSBDXW/sThWKvxsLIYXMOy
         jmyoGp4HK6s4eWEp1c292abwc3t0P5i8cb/t9Ok0h4LfE7CUMvPAMgyjCE2b3VcQjF9Z
         Dm62lM9g7hUDqMoB5AUqHnxpHh2O1A4gxpn7rRnI03ED3+EHjfYIfKWaJ6P1R8GcA4ei
         XV11dgb3As0oYeYMNjSnZPDszV+8bbTxFawT6wS9GZTRz13pFxPIMYSOsqDSAjfV4XHi
         VIzA==
X-Gm-Message-State: AOAM5319HoAEiIScV3DDePt5GCFni0RwrD4eLJrb+CleI8Qme8TzWISz
	thp2N9wV4/v1oJ5tQg8phWaJM0SjhLx/3K04L4Y=
X-Google-Smtp-Source: ABdhPJw4QyM4Kwc9nB7t8bAYc74zONb3je9w2QHqqtkNakXRSRkcaAyCA/PGqbUKaZ8myrAilkDf86Ow9gq7nItgh6o=
X-Received: by 2002:a17:906:dbf0:: with SMTP id yd16mr582892ejb.445.1631720288249;
 Wed, 15 Sep 2021 08:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <16A508A932A7AEC6.13299@lists.openembedded.org>
In-Reply-To: <16A508A932A7AEC6.13299@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 15 Sep 2021 11:37:57 -0400
Message-ID: <CADkTA4N8PYvk3DiYfv=G7c7TpVJPj0LZ2FR9s2RT5QAjrswJwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] linux-yocto/5.4: update to v5.4.143
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Obviously these are for dunfell .. my script misfired and didn't put
the [dunfell] tag on the send!

Bruce

On Wed, Sep 15, 2021 at 11:32 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating linux-yocto/5.4 to the latest korg -stable release that comprises
> the following commits:
>
>     fd80923202c6 Linux 5.4.143
>     4bf194158102 netfilter: nft_exthdr: fix endianness of tcp option cast
>     e4fd994f02c5 fs: warn about impending deprecation of mandatory locks
>     41c7f46c89f6 mm: memcontrol: fix occasional OOMs due to proportional memory.low reclaim
>     1a3aa81444d3 mm, memcg: avoid stale protection values when cgroup is above protection
>     9c1c449dcca0 ASoC: intel: atom: Fix breakage for PCM buffer address setup
>     846ba58a7c06 PCI: Increase D3 delay for AMD Renoir/Cezanne XHCI
>     548b75f4905e btrfs: prevent rename2 from exchanging a subvol with a directory from different parents
>     0fc6a9c2025b ipack: tpci200: fix memory leak in the tpci200_register
>     280d66b31797 ipack: tpci200: fix many double free issues in tpci200_pci_probe
>     cb7aa5103146 slimbus: ngd: reset dma setup during runtime pm
>     abce32d0f7f4 slimbus: messaging: check for valid transaction id
>     0786d315f55c slimbus: messaging: start transaction ids from 1 instead of zero
>     20c2f141b1e5 tracing / histogram: Fix NULL pointer dereference on strcmp() on NULL event name
>     8fbfebe188c0 ALSA: hda - fix the 'Capture Switch' value change notifications
>     85e60614d1f6 mmc: dw_mmc: Fix hang on data CRC error
>     4f6c9caf7b6c ovl: add splice file read write helper
>     85813f1f9e86 iavf: Fix ping is lost after untrusted VF had tried to change MAC
>     a498115dcd9c i40e: Fix ATR queue selection
>     1b8a8fba7853 ovs: clear skb->tstamp in forwarding path
>     84dbbf5482e3 net: mdio-mux: Handle -EPROBE_DEFER correctly
>     453486e79ed2 net: mdio-mux: Don't ignore memory allocation errors
>     6b70c67849bb net: qlcnic: add missed unlock in qlcnic_83xx_flash_read32
>     da92ce364595 virtio-net: use NETIF_F_GRO_HW instead of NETIF_F_LRO
>     9aeadce8e33b virtio-net: support XDP when not more queues
>     3ed7cf8386c9 vrf: Reset skb conntrack connection on VRF rcv
>     447b16028956 bnxt_en: Add missing DMA memory barriers
>     c9566df334d0 ptp_pch: Restore dependency on PCI
>     a73b9aa14269 net: 6pack: fix slab-out-of-bounds in decode_data
>     2bc75713434b bnxt: disable napi before canceling DIM
>     a9fb0f155980 bnxt: don't lock the tx queue from napi poll
>     1fe038030cc8 bpf: Clear zext_dst of dead insns
>     73a45f75a07b vhost: Fix the calculation in vhost_overflow()
>     b9a59636c4bf virtio: Protect vqs list access
>     b264e37b3517 dccp: add do-while-0 stubs for dccp_pr_debug macros
>     9112ebc2990a cpufreq: armada-37xx: forbid cpufreq for 1.2 GHz variant
>     cb9a9d5fe636 iommu: Check if group is NULL before remove device
>     911a8141efdd Bluetooth: hidp: use correct wait queue when removing ctrl_wait
>     5b14c1f16e2d drm/amd/display: Fix Dynamic bpp issue with 8K30 with Navi 1X
>     f92dc3a89dd8 net: usb: lan78xx: don't modify phy_device state concurrently
>     be7043679967 ARM: dts: nomadik: Fix up interrupt controller node names
>     69aa1a1a569f scsi: core: Fix capacity set to zero after offlinining device
>     935de7ec7a4d scsi: core: Avoid printing an error if target_alloc() returns -ENXIO
>     7a721a1e1885 scsi: scsi_dh_rdac: Avoid crash during rdac_bus_attach()
>     9900e06ae6e6 scsi: megaraid_mm: Fix end of loop tests for list_for_each_entry()
>     e37cf26bd56d dmaengine: of-dma: router_xlate to return -EPROBE_DEFER if controller is not yet available
>     12d1322d93a6 ARM: dts: am43x-epos-evm: Reduce i2c0 bus speed for tps65218
>     11145efd295b dmaengine: usb-dmac: Fix PM reference leak in usb_dmac_probe()
>     9c97a0539288 dmaengine: xilinx_dma: Fix read-after-free bug when terminating transfers
>     fc566b5a21f5 USB: core: Avoid WARNings for 0-length descriptor requests
>     1bd505c814cc media: drivers/media/usb: fix memory leak in zr364xx_probe
>     705660a6d98d media: zr364xx: fix memory leaks in probe()
>     79dff2a3f41a media: zr364xx: propagate errors from zr364xx_start_readpipe()
>     7305d6d4078f mtd: cfi_cmdset_0002: fix crash when erasing/writing AMD cards
>     23f77ad13f81 ath9k: Postpone key cache entry deletion for TXQ frames reference it
>     c6feaf806da6 ath: Modify ath_key_delete() to not need full key entry
>     b7d593705eb4 ath: Export ath_hw_keysetmac()
>     add283e2517a ath9k: Clear key cache explicitly on disabling hardware
>     0c049ce432b3 ath: Use safer key clearing with key cache entries
>     172b91bbbb49 x86/fpu: Make init_fpstate correct with optimized XSAVE
>     81d152c8daf8 ext4: fix EXT4_MAX_LOGICAL_BLOCK macro
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
>  .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
>  3 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> index 69958c5631..d4add9b262 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "b872fc896dcc555149f26c5dd683f7e6394852d6"
> -SRCREV_meta ?= "719be4bd6c3c7575e7942dc016e3c3bb028f163d"
> +SRCREV_machine ?= "f4f6c136157b70468cf54389034aeaa41bbc5538"
> +SRCREV_meta ?= "70b2480497528245c948ec259c734d74ea4fa3f1"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
>
> -LINUX_VERSION ?= "5.4.142"
> +LINUX_VERSION ?= "5.4.143"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> index 0178d172f8..a2f212e2ef 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?= "5.4.142"
> +LINUX_VERSION ?= "5.4.143"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine_qemuarm ?= "4addf3f9e4f68bc7c03ea19ad95f2a4836ac9873"
> -SRCREV_machine ?= "964802684eb1495bd1c5f625307b6d41515a3e9a"
> -SRCREV_meta ?= "719be4bd6c3c7575e7942dc016e3c3bb028f163d"
> +SRCREV_machine_qemuarm ?= "83b75c59c277ba3f87759cf558f9f230c1ed3bf7"
> +SRCREV_machine ?= "1f981e60c9f6162337d2a65c891f2e29d8e1c862"
> +SRCREV_meta ?= "70b2480497528245c948ec259c734d74ea4fa3f1"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> index 7e35e082fb..93cf312954 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
>  KBRANCH_qemux86-64 ?= "v5.4/standard/base"
>  KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "9b1b66b01c88cf5035d148f37c70b8215c8fde15"
> -SRCREV_machine_qemuarm64 ?= "e91700bf8d8130226679954a8137c5f3fd54b81d"
> -SRCREV_machine_qemumips ?= "332bc089f06636156b9d5b2a04228c03c680c6d0"
> -SRCREV_machine_qemuppc ?= "1bf103767b96923aa6ca76e9e095b04c13ce93cd"
> -SRCREV_machine_qemuriscv64 ?= "108b8b822e7bbba492deafe60ee86839291c3250"
> -SRCREV_machine_qemux86 ?= "108b8b822e7bbba492deafe60ee86839291c3250"
> -SRCREV_machine_qemux86-64 ?= "108b8b822e7bbba492deafe60ee86839291c3250"
> -SRCREV_machine_qemumips64 ?= "7b31f99f9e245d029de7fb9e3480f7b00f846b8f"
> -SRCREV_machine ?= "108b8b822e7bbba492deafe60ee86839291c3250"
> -SRCREV_meta ?= "719be4bd6c3c7575e7942dc016e3c3bb028f163d"
> +SRCREV_machine_qemuarm ?= "a5fb40d66dcf9b95e82a06724fe8b33a03295af4"
> +SRCREV_machine_qemuarm64 ?= "bffde671f5262afb5139ef58b10be043de1d368a"
> +SRCREV_machine_qemumips ?= "ac8adae0a4a582e9593b527a14f3a7e407a22e6e"
> +SRCREV_machine_qemuppc ?= "022718ee2b3805d465613f05813fd6313cbb988f"
> +SRCREV_machine_qemuriscv64 ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
> +SRCREV_machine_qemux86 ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
> +SRCREV_machine_qemux86-64 ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
> +SRCREV_machine_qemumips64 ?= "46871b96c7f3f1658f4b9875d6645ff7996e98f1"
> +SRCREV_machine ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
> +SRCREV_meta ?= "70b2480497528245c948ec259c734d74ea4fa3f1"
>
>  # remap qemuarm to qemuarma15 for the 5.4 kernel
>  # KMACHINE_qemuarm ?= "qemuarma15"
> @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> -LINUX_VERSION ?= "5.4.142"
> +LINUX_VERSION ?= "5.4.143"
>
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>  DEPENDS += "openssl-native util-linux-native"
> --
> 2.19.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
