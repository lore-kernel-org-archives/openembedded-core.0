Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4869CEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 03:36:36 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.98.1689651391380545896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 20:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XcCF/rXe;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-cae0ad435b6so5491186276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 20:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689651390; x=1692243390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d86o8Dj4YZwhpWJ8uJx6wXc7ebPR0GYZ/2kDjfTVkrc=;
        b=XcCF/rXeRR5z5YpPG1xO4jT4QW/+YNc5cq61hzevW1P32y+rfN2w3yJ6Z7b7dtfV6a
         /grU1a9PvW+Iao8d5SrrliE1XDYKB7x2Ax8upcOzBxNNAGfr8GVOmkOKhkt/Mzn7Zq4E
         r+ehZlXoy5acM9W0yaoFpWOI1Lq8ciwatWF8NbQ0+8I3AkJIlypY+H1hYxiIQGWiPHWY
         QoSQjqBPyIMXNIEEE8TINshMgAAJVLIlIMlq0OopkmydTiCSlcruaml4iQMBFZUAyKmx
         pqoY3tz4pkFDbiOuhwmf8JjJqvh/jnh6zpt96jUHIYDA4EaEiQtXIRVUE9Z/c82sPhqL
         xScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689651390; x=1692243390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d86o8Dj4YZwhpWJ8uJx6wXc7ebPR0GYZ/2kDjfTVkrc=;
        b=X2g/iTJwgSuGwildKg4uvX7Wi49bVKTVaxJ+U2S2f39TVnxjNsbawt48Jie/C0YR/r
         5bezI0bthBoBC9da1I2B7nJL+TidAfcIXT6biHVnYIY+Avl1Bvs4J5ixDIbP3MQE0OMh
         D4kY+ez7MmWPnvrCTZIu8PMBtk3tGTizfwp07W2aJqyfcCzGD5sw4o3cmQ8vk/dQSpvn
         te8nb1ZkNzUyoaMG8t4mZN+95UvNVsr2OXfe6i4ECrhuQ6Y2sXyzM29mRr7uuCN5sDs6
         vOm5gdW3hsv2eQxHrRMzLzF0oaKcOIBm0X02tvokDfXYWLKBcVu4DXMxH324Ra9M+2QI
         6fwA==
X-Gm-Message-State: ABy/qLaVdPR5ixkJtpDikoErb3/2c9m/fPHqHEIdt9EFDFwVh+/6wBQ8
	7Lhrb75CPMNgpHF68Np3LTWyOp2hf4xKItKGaqo=
X-Google-Smtp-Source: APBJJlG84akVBU6/IHDlet0QncJOhOhDbl/dkyxfojV7sad0X/DhBtTDElxURMC5Rtw+gU9d+wDgBDh0otLhVm6oGVU=
X-Received: by 2002:a81:6556:0:b0:56d:2f0c:a516 with SMTP id
 z83-20020a816556000000b0056d2f0ca516mr14959018ywb.11.1689651390227; Mon, 17
 Jul 2023 20:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <1772D8923A94DDBE.2899@lists.openembedded.org>
In-Reply-To: <1772D8923A94DDBE.2899@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Jul 2023 23:36:30 -0400
Message-ID: <CADkTA4NE-87i1QFUjEE686gh8JX34jPTX7KAo19Jo_mff3PbCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2][mickledore] linux-yocto/5.15: update to v5.15.119
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184494

These will also fix the intermittent boot hang that Steve's been
seeing with 5.15.

Bruce

On Mon, Jul 17, 2023 at 11:28=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating  to the latest korg -stable release that comprises
> the following commits:
>
>     4af60700a60c Linux 5.15.119
>     10fbd2e04e40 act_mirred: remove unneded merge conflict markers
>     2230b3f874d9 i2c: imx-lpi2c: fix type char overflow issue when calcul=
ating the clock cycle
>     907a069ec38f x86/apic: Fix kernel panic when booting with intremap=3D=
off and x2apic_phys
>     7949f83f7ecc vhost_net: revert upend_idx only on retriable error
>     fdac0aa4a175 drm/radeon: fix race condition UAF in radeon_gem_set_dom=
ain_ioctl
>     f012d3037c15 drm/exynos: fix race condition UAF in exynos_g2d_exec_io=
ctl
>     a44b4230d2ba drm/exynos: vidi: fix a wrong error return
>     79b4125bce96 ARM: dts: Fix erroneous ADS touchscreen polarities
>     9684c4fdeeca s390/purgatory: disable branch profiling
>     3c4d87e9fa8a ASoC: nau8824: Add quirk to active-high jack-detect
>     d77eac1b14e0 soundwire: dmi-quirks: add new mapping for HP Spectre x3=
60
>     53ad4af4ec90 ASoC: simple-card: Add missing of_node_put() in case of =
error
>     bb45dc7b67c5 spi: lpspi: disable lpspi module irq in DMA mode
>     f8d9d8f1727d s390/cio: unregister device when the only path is gone
>     e10d15fdfced Input: soc_button_array - add invalid acpi_index DMI qui=
rk handling
>     26bde09a1512 nvme: double KA polling frequency to avoid KATO with TBK=
AS on
>     e3bbc148377d usb: gadget: udc: fix NULL dereference in remove()
>     cce681383d34 nfcsim.c: Fix error checking for debugfs_create_dir
>     8a5ddd1430d4 media: cec: core: don't set last_initiator if tx in prog=
ress
>     01cf989090da arm64: Add missing Set/Way CMO encodings
>     f97b16c0a538 HID: wacom: Add error check to wacom_parse_and_register(=
)
>     e8bdb1f88699 scsi: target: iscsi: Prevent login threads from racing b=
etween each other
>     1cc379d53b66 gpio: sifive: add missing check for platform_get_irq
>     497d40140865 gpiolib: Fix GPIO chip IRQ initialization restriction
>     7973c4b3b97d gpio: Allow per-parent interrupt data
>     c1a2b52d999e sch_netem: acquire qdisc lock in netem_change()
>     3138c85031e8 selftests: forwarding: Fix race condition in mirror inst=
allation
>     b7db41a86541 bpf/btf: Accept function names that contain dots
>     0f8d81254fd6 Revert "net: phy: dp83867: perform soft reset and retain=
 established link"
>     57130334da4e netfilter: nfnetlink_osf: fix module autoload
>     53defc6ecff4 netfilter: nf_tables: disallow updates of anonymous sets
>     2f2f9eaa6da1 netfilter: nf_tables: reject unbound chain set before co=
mmit phase
>     2938e7d582d7 netfilter: nf_tables: reject unbound anonymous set befor=
e commit phase
>     baa3ec1b31f5 netfilter: nf_tables: disallow element updates of bound =
anonymous sets
>     45eb6944d0f5 netfilter: nft_set_pipapo: .walk does not deal with gene=
rations
>     4004f12aaca8 netfilter: nf_tables: add NFT_TRANS_PREPARE_ERROR to dea=
l with bound set/chain
>     314a8697d080 netfilter: nf_tables: fix chain binding transaction logi=
c
>     1328e8d4c3ee be2net: Extend xmit workaround to BE3 chip
>     768f94c5f639 net: dsa: mt7530: fix handling of BPDUs on MT7530 switch
>     aa528e7d379f net: dsa: mt7530: fix trapping frames on non-MT7621 SoC =
MT7530 switch
>     efea112a87b6 ipvs: align inner_mac_header for encapsulation
>     24d7d9aee03d mmc: usdhi60rol0: fix deferred probing
>     d1e08bed0307 mmc: sh_mmcif: fix deferred probing
>     34c4906b9a06 mmc: sdhci-acpi: fix deferred probing
>     41f1e8dab08d mmc: owl: fix deferred probing
>     b86ca9e08ca9 mmc: omap_hsmmc: fix deferred probing
>     445a9568dec1 mmc: omap: fix deferred probing
>     840deb8d1418 mmc: mvsdio: fix deferred probing
>     92f73c4f927c mmc: mtk-sd: fix deferred probing
>     aedecd013d2c net: qca_spi: Avoid high load if QCA7000 is not availabl=
e
>     156dd06fb337 xfrm: Linearize the skb after offloading if needed.
>     d967bd7ea6cc selftests: net: fcnal-test: check if FIPS mode is enable=
d
>     964cfdfd4b4f xfrm: fix inbound ipv4/udp/esp packets to UDPv6 dualstac=
k sockets
>     25e89fa7b5a8 bpf: Fix verifier id tracking of scalars on spill
>     0b180495f6b0 bpf: track immediate values written to stack by BPF_ST i=
nstruction
>     3229a29e95f5 xfrm: Ensure policies always checked on XFRM-I input pat=
h
>     d055ee18cab8 xfrm: interface: rename xfrm_interface.c to xfrm_interfa=
ce_core.c
>     491ce3c1d98a xfrm: Treat already-verified secpath entries as optional
>     0ce3d0c068d9 ieee802154: hwsim: Fix possible memory leaks
>     29672dc47d99 mmc: meson-gx: fix deferred probing
>     9bac4a2b7326 memfd: check for non-NULL file_seals in memfd_create() s=
yscall
>     103734b429b9 x86/mm: Avoid using set_pgd() outside of real PGD pages
>     793d0224bb60 nilfs2: prevent general protection fault in nilfs_clear_=
dirty_page()
>     96987c383c2b io_uring/net: disable partial retries for recvmsg with c=
msg
>     25a543ca3005 io_uring/net: clear msg_controllen on partial sendmsg re=
try
>     34a7e5021a43 io_uring/net: save msghdr->msg_control for retries
>     b07bb2914ada writeback: fix dereferencing NULL mapping->host on write=
back_page_template
>     3c46a240ddba regmap: spi-avmm: Fix regmap_bus max_raw_write
>     4796d9b06917 regulator: pca9450: Fix LDO3OUT and LDO4OUT MASK
>     ba9952e2f50b ip_tunnels: allow VXLAN/GENEVE to inherit TOS/TTL from V=
LAN
>     acee272283f4 mmc: mmci: stm32: fix max busy timeout calculation
>     999173f295cc mmc: meson-gx: remove redundant mmc_request_done() call =
from irq context
>     00010b52c705 mmc: sdhci-msm: Disable broken 64-bit DMA on MSM8916
>     4a557910bbed cgroup: Do not corrupt task iteration when rebinding sub=
system
>     815b24401165 PCI: hv: Add a per-bus mutex state_lock
>     34e21b8ff3e6 PCI: hv: Fix a race condition in hv_irq_unmask() that ca=
n cause panic
>     7d852ca7af37 PCI: hv: Remove the useless hv_pcichild_state from struc=
t hv_pci_dev
>     5e0d33cc7813 Revert "PCI: hv: Fix a timing issue which causes kdump t=
o fail occasionally"
>     ac0df91c7d98 PCI: hv: Fix a race condition bug in hv_pci_query_relati=
ons()
>     80c5d97b4aa1 Drivers: hv: vmbus: Fix vmbus_wait_for_unload() to scan =
present CPUs
>     4d31eb2e266c Drivers: hv: vmbus: Call hv_synic_free() if hv_synic_all=
oc() fails
>     953dd7e2df81 KVM: Avoid illegal stage2 mapping on invalid memory slot
>     1d6c93206839 ACPI: sleep: Avoid breaking S3 wakeup due to might_sleep=
()
>     b12011cea56b nilfs2: fix buffer corruption due to concurrent device r=
eads
>     485f6be2549c selftests: mptcp: join: skip check if MIB counter not su=
pported
>     64cb73ea77ab selftests: mptcp: join: use 'iptables-legacy' if availab=
le
>     979a941d7ed3 selftests: mptcp: pm nl: remove hardcoded default limits
>     ac65930751c4 selftests/mount_setattr: fix redefine struct mount_attr =
build error
>     726d033133e7 selftests: mptcp: lib: skip if not below kernel version
>     b28fc26683b4 selftests: mptcp: lib: skip if missing symbol
>     024a24e5d4dd tick/common: Align tick period during sched_timer setup
>     3c1aa91b37f9 drm/amd/display: Add wrapper to call planes and stream u=
pdate
>     eea850c025b5 drm/amd/display: Use dc_update_planes_and_stream
>     fb7c68bbccad drm/amd/display: Add minimal pipe split transition state
>     b5f0e898f674 tpm, tpm_tis: Claim locality in interrupt handler
>     39e787253720 tracing: Add tracing_reset_all_online_cpus_unlocked() fu=
nction
>     5a24be76af79 drm/amd/display: fix the system hang while disable PSR
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
>  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_5.15.bb
> index 6ca7873910..a75eef5d8b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?=3D "b2a7dbd4edac7627c091c2ab14fec83726a4c79b"
> -SRCREV_meta ?=3D "b647d9611cb4936536e60a438292fc22df2fe000"
> +SRCREV_machine ?=3D "482797bf5730cf22143afe28d489363ca4bf44a2"
> +SRCREV_meta ?=3D "58ef8845366aea0e1719d00618444be34a765c15"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine;protocol=3Dhttps \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA};protocol=3Dhttps"
>
> -LINUX_VERSION ?=3D "5.15.118"
> +LINUX_VERSION ?=3D "5.15.119"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_5.15.bb
> index 616cc47202..6d7939ba83 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> @@ -5,7 +5,7 @@ KCONFIG_MODE =3D "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?=3D "5.15.118"
> +LINUX_VERSION ?=3D "5.15.119"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> @@ -14,8 +14,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>
> -SRCREV_machine ?=3D "b79e89ab973aeb8ec48e2cd987436ab52678e795"
> -SRCREV_meta ?=3D "b647d9611cb4936536e60a438292fc22df2fe000"
> +SRCREV_machine ?=3D "ded230a888ef81ccedf0044bd8c2236f3b809599"
> +SRCREV_meta ?=3D "58ef8845366aea0e1719d00618444be34a765c15"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes=
-kernel/linux/linux-yocto_5.15.bb
> index 4ae03f1cb4..dfe9171ddd 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> @@ -13,24 +13,24 @@ KBRANCH:qemux86  ?=3D "v5.15/standard/base"
>  KBRANCH:qemux86-64 ?=3D "v5.15/standard/base"
>  KBRANCH:qemumips64 ?=3D "v5.15/standard/mti-malta64"
>
> -SRCREV_machine:qemuarm ?=3D "2290ac7e8d7fbb8e13a34468b85066c398c7d1f3"
> -SRCREV_machine:qemuarm64 ?=3D "3f3f2067c3ee4d9dffaed9b757583d013671cf25"
> -SRCREV_machine:qemumips ?=3D "f61a3b045bdfc9aa7da440852e0a79fd8d9b4d69"
> -SRCREV_machine:qemuppc ?=3D "7a2773ad8fb4ae4eb0183ccda8ec133098d13ec9"
> -SRCREV_machine:qemuriscv64 ?=3D "079c88490578df99b38570c8968b836b8347ed4=
4"
> -SRCREV_machine:qemuriscv32 ?=3D "079c88490578df99b38570c8968b836b8347ed4=
4"
> -SRCREV_machine:qemux86 ?=3D "079c88490578df99b38570c8968b836b8347ed44"
> -SRCREV_machine:qemux86-64 ?=3D "079c88490578df99b38570c8968b836b8347ed44=
"
> -SRCREV_machine:qemumips64 ?=3D "47d334232ab28f0f8d5316e07e11f8f14c6aaecc=
"
> -SRCREV_machine ?=3D "079c88490578df99b38570c8968b836b8347ed44"
> -SRCREV_meta ?=3D "b647d9611cb4936536e60a438292fc22df2fe000"
> +SRCREV_machine:qemuarm ?=3D "9ae4c8018039201ce683ff26bde47a3e3e6664ef"
> +SRCREV_machine:qemuarm64 ?=3D "58394274da1b4fdf69ca780001bf25eebfd1950f"
> +SRCREV_machine:qemumips ?=3D "bacfb28c9349b36afe3041e57d98551aa723bbc2"
> +SRCREV_machine:qemuppc ?=3D "d9efae0cb3731ab62cb81778c2fa5689594d34b1"
> +SRCREV_machine:qemuriscv64 ?=3D "a05c1b953b7b7dbd195b7f826e8879d79587a4a=
3"
> +SRCREV_machine:qemuriscv32 ?=3D "a05c1b953b7b7dbd195b7f826e8879d79587a4a=
3"
> +SRCREV_machine:qemux86 ?=3D "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
> +SRCREV_machine:qemux86-64 ?=3D "a05c1b953b7b7dbd195b7f826e8879d79587a4a3=
"
> +SRCREV_machine:qemumips64 ?=3D "2ae09c410d8a5a0ec66d50368579dd3d3616072b=
"
> +SRCREV_machine ?=3D "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
> +SRCREV_meta ?=3D "58ef8845366aea0e1719d00618444be34a765c15"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the=
 same
>  # meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
>  # normal PREFERRED_VERSION settings.
>  BBCLASSEXTEND =3D "devupstream:target"
> -SRCREV_machine:class-devupstream ?=3D "f67653019430833d5003f16817d7fa852=
72a6a76"
> +SRCREV_machine:class-devupstream ?=3D "4af60700a60cc45ee4fb6d579cccf1b7b=
ca20c34"
>  PN:class-devupstream =3D "linux-yocto-upstream"
>  KBRANCH:class-devupstream =3D "v5.15/base"
>
> @@ -38,7 +38,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git=
;name=3Dmachine;branch=3D${KBRA
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA};protocol=3Dhttps"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> -LINUX_VERSION ?=3D "5.15.118"
> +LINUX_VERSION ?=3D "5.15.119"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
>  DEPENDS +=3D "openssl-native util-linux-native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184487): https://lists.openembedded.org/g/openembedde=
d-core/message/184487
> Mute This Topic: https://lists.openembedded.org/mt/100209411/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

