Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA26EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 22:07:03 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.2453.1687903622809355412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 15:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=j8eyGJ9V;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.51, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so2684081e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 15:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687903621; x=1690495621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAKbYQxys2FUbWpXkodwVMeufouplpPzc5qpecwAQb0=;
        b=j8eyGJ9V11OcOAwHPXItExKEKzbxDGoA5GazOoEUkqodor7FmeS4bVkEGv48wSPfdj
         h5TmbroobaiQ/E/qoIfxFrg3Gl1N6mFMH99YJ71oocgknWvy9x8B/UsXEolNua91Ldb3
         7Ay/eqR6wIoArr9P8zLTVrCkIAJcsUo5oL4WyIMcrj2zY73r/XPPKDNC02iPGgsZmTh6
         EsXlR/2rEYt4Em3LwNHEnln6ZT7NbD9NwFKIAEZyG3XuxdAE4aIRXlRzVwaERXLxfJLr
         0wjvripNYjhniQYVHNHQ78QxomjVgpRrzdWR+pwnGvBqD7wMlktVU+WLT7YReYqsA5xP
         siBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687903621; x=1690495621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAKbYQxys2FUbWpXkodwVMeufouplpPzc5qpecwAQb0=;
        b=MZP+JmDQ76gfGtrxUWjoI+NkRk94Y5tnyD6ugxRke4ytY04GBtdiS0E+/qCGFRsOjj
         4sy/qTxorLl3IVdp1wtFRF1N6E6mvFns1nq8YeuRkRFA0ilD0lWcjfGp9S0Xrfkxv+rJ
         h/j9XFkVpffJl4211TmTdqpXwEat+DyPmN3K0QQ4tFsl47n1tEbVOu1unxCg25MOuyq1
         8rtLCDyQAmeT3um20k8iRHuWVZadAEFvNQIKcMQmOwqsrdLyLrHQAF5hzR9lMFIxKuNL
         JYK8tsMb3O6yIDYe2rVjUlmCjN/DHeicvzsVFrI4mIFSckJQW/jo++5CSlDahLSb6Nj6
         BJFg==
X-Gm-Message-State: AC+VfDz2ZjMZdWoNG9Q5HtEJimxJh4n05YoKlN0WK2CuaUh//2xCJb9G
	MnNZ92XIDvQ7sjCJZt6fGuuSq/XtGlWk77vCfB+OEA==
X-Google-Smtp-Source: ACHHUZ67wO6oegbgxpKwPyEVb6Q4nWEEpT7ilqpbDsfVaKr/swGra55apll5FepvKufol45Y8SOXtuy/wqvUItgnaAk=
X-Received: by 2002:a19:6755:0:b0:4f8:58f4:b96e with SMTP id
 e21-20020a196755000000b004f858f4b96emr20002515lfj.37.1687903620669; Tue, 27
 Jun 2023 15:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230622231932.928672-1-bruce.ashfield@gmail.com> <20230622231932.928672-4-bruce.ashfield@gmail.com>
In-Reply-To: <20230622231932.928672-4-bruce.ashfield@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 27 Jun 2023 12:06:49 -1000
Message-ID: <CAOSpxda3KHG=rGu7vK9D8WCD7SL_87PgSEVs6=RgRV15kc2AZw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 4/4] linux-yocto/5.10: update to v5.10.185
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 22:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183505

Sigh, here we go again!

WARNING: linux-yocto-5.10.185+gitAUTOINC+697cb5ef3a_dafc025b03-r0
do_kernel_configcheck: [kernel config]: This BSP contains fragments
with warnings:

[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_DECNET

Steve

On Thu, Jun 22, 2023 at 1:19=E2=80=AFPM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating  to the latest korg -stable release that comprises
> the following commits:
>
>     ef0d5feb32ab Linux 5.10.185
>     ed2bf5cee6c6 um: Fix build w/o CONFIG_PM_SLEEP
>     f73ec12dc718 drm/i915/gen11+: Only load DRAM information from pcode
>     27458487c8f4 drm/i915/dg1: Wait for pcode/uncore handshake at startup
>     2d1c19597d1e media: dvb-core: Fix use-after-free due to race at dvb_r=
egister_device()
>     5c61c3945adf media: dvbdev: fix error logic at dvb_register_device()
>     a1b26dac8bc6 media: dvbdev: Fix memleak in dvb_register_device
>     a13dee47fa2a nilfs2: reject devices with insufficient block count
>     c374552b54d6 mm/memory_hotplug: extend offline_and_remove_memory() to=
 handle more than one memory block
>     e6dc6a9d0a76 mmc: block: ensure error propagation for non-blk
>     7ce0e8b28720 batman-adv: Switch to kstrtox.h for kstrtou64
>     e6104284c42f neighbour: delete neigh_lookup_nodev as not used
>     bf82668eb950 net: Remove DECnet leftovers from flow.h.
>     7d07fd03f50c net: Remove unused inline function dst_hold_and_use()
>     53076071fb92 neighbour: Remove unused inline function neigh_key_eq16(=
)
>     7230a9e599d3 rcu/kvfree: Avoid freeing new kfree_rcu() memory after o=
ld grace period
>     a26158962176 cgroup: always put cset in cgroup_css_set_put_fork
>     4c1084386332 afs: Fix vlserver probe RTT handling
>     49b6607dedc2 selftests/ptp: Fix timestamp printf format for PTP_SYS_O=
FFSET
>     08899e8d5a99 net: tipc: resize nlattr array to correct size
>     5fd696b404fb net: lapbether: only support ethernet devices
>     6ee3728ae87e net/sched: cls_api: Fix lockup on flushing explicitly cr=
eated chain
>     efed5b50f3b8 ext4: drop the call to ext4_error() from ext4_get_group_=
info()
>     6ab91d1adb5a drm/nouveau: add nv_encoder pointer check for NULL
>     5d43bb9b3e0c drm/nouveau/dp: check for NULL nv_connector->native_mode
>     edb970e03d65 drm/nouveau: don't detect DSM for non-NVIDIA device
>     8c3446ab5902 igb: fix nvm.ops.read() error handling
>     221281d60c46 sctp: fix an error code in sctp_sf_eat_auth()
>     5c47ed7f25d6 ipvlan: fix bound dev checking for IPv6 l3s mode
>     3c97f2c9ec29 IB/isert: Fix incorrect release of isert connection
>     da6ae4aab5a6 IB/isert: Fix possible list corruption in CMA handler
>     2b6f8817ca66 IB/isert: Fix dead lock in ib_isert
>     2f9d26345c6e IB/uverbs: Fix to consider event queue closing also upon=
 non-blocking mode
>     6cccdbc9f09c RDMA/cma: Always set static rate to 0 for RoCE
>     f49abbb27416 RDMA/mlx5: Initiate dropless RQ for RAW Ethernet functio=
ns
>     aa277d5cd4b2 octeontx2-af: fixed resource availability check
>     0fb48a2a6ad4 iavf: remove mask from iavf_irq_enable_queues()
>     079a9591ee18 RDMA/rxe: Fix the use-before-initialization error of res=
p_pkts
>     089a0e831f68 RDMA/rxe: Removed unused name from rxe_task struct
>     6205c0d9ff8b RDMA/rxe: Remove the unused variable obj
>     af6eaa57986e net/sched: cls_u32: Fix reference counter leak leading t=
o overflow
>     5852d17aaa8b ping6: Fix send to link-local addresses with VRF.
>     9e666a77f008 net: enetc: correct the indexes of highest and 2nd highe=
st TCs
>     1200af82cf0b netfilter: nfnetlink: skip error delivery on batch in ca=
se of ENOMEM
>     af42c4fd827c spi: fsl-dspi: avoid SCK glitches with continuous transf=
ers
>     cb6ec51ddd00 RDMA/rtrs: Fix the last iu->buf leak in err path
>     26293251ab64 usb: dwc3: gadget: Reset num TRBs before giving back the=
 request
>     f4bc41694289 serial: lantiq: add missing interrupt ack
>     0b6e65016c3c USB: serial: option: add Quectel EM061KGL series
>     1c004b379b03 Remove DECnet support from kernel
>     e9d384983fa9 ALSA: hda/realtek: Add a quirk for Compaq N14JP6
>     1148d4ca3029 net: usb: qmi_wwan: add support for Compal RXM-G1
>     d7acfd522560 RDMA/uverbs: Restrict usage of privileged QKEYs
>     96e14c91c530 nouveau: fix client work fence deletion race
>     f1f7117b2236 powerpc/purgatory: remove PGO flags
>     26c80741ceb6 x86/purgatory: remove PGO flags
>     f368aed4827b kexec: support purgatories with .text.hot sections
>     7e78b9142fdf nilfs2: fix possible out-of-bounds segment allocation in=
 resize ioctl
>     902fcec05295 nilfs2: fix incomplete buffer cleanup in nilfs_btnode_ab=
ort_change_key()
>     d59293f082dc nios2: dts: Fix tse_mac "max-frame-size" property
>     2847d9eed48b ocfs2: check new file size on fallocate call
>     e73b135f540c ocfs2: fix use-after-free when unmounting read-only file=
system
>     370f5d98ffe5 epoll: ep_autoremove_wake_function should use list_del_i=
nit_careful
>     4716c73b1885 io_uring: hold uring mutex around poll removal
>     93a68acc497b irqchip/gic: Correctly validate OF quirk descriptors
>     2a2641a842ea drm:amd:amdgpu: Fix missing buffer object unlock in fail=
ure path
>     7c0b17679b43 xen/blkfront: Only check REQ_FUA for writes
>     8e45fb70f4b5 ASoC: dwc: move DMA init to snd_soc_dai_driver probe()
>     d47b5a6d2331 mips: Move initrd_start check after initrd address sanit=
isation.
>     619672bf2d04 MIPS: Alchemy: fix dbdma2
>     0ca73b45b767 parisc: Flush gatt writes and adjust gatt mask in parisc=
_agp_mask_memory()
>     3f7625e08620 parisc: Improve cache flushing for PCXL in arch_sync_dma=
_for_cpu()
>     73102fdb5bf3 ASoC: soc-pcm: test if a BE can be prepared
>     3bc883132d03 btrfs: handle memory allocation failure in btrfs_csum_on=
e_bio
>     142fbad31405 btrfs: scrub: try harder to mark RAID56 block groups rea=
d-only
>     35d32d841592 power: supply: Fix logic checking if system is running f=
rom battery
>     8b7a2207ee40 irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices =
w/ firmware issues
>     dbf610997242 regulator: Fix error checking for debugfs_create_dir
>     37bcc48e7dd1 platform/x86: asus-wmi: Ignore WMI events with codes 0x7=
B, 0xC0
>     88d1c1365ff6 power: supply: Ratelimit no data debug output
>     6be7a4bef9dc tools: gpio: fix debounce_period_us output of lsgpio
>     39eb9eb9ea43 ARM: dts: vexpress: add missing cache properties
>     b2856c3cd3b2 power: supply: bq27xxx: Use mod_delayed_work() instead o=
f cancel() + schedule()
>     ce2b5f24caad power: supply: sc27xx: Fix external_power_changed race
>     9e9e150fa8a6 power: supply: ab8500: Fix external_power_changed race
>     539c387f0bb9 test_firmware: fix a memory leak with reqs buffer
>     af36f35074b1 test_firmware: prevent race conditions by a correct impl=
ementation of locking
>     682ca602515d test_firmware: Use kstrtobool() instead of strtobool()
>     6e2e551e39fd kernel.h: split out kstrtox() and simple_strtox() to a s=
eparate header
>     c2def5578b44 lib: cleanup kstrto*() usage
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
>  .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_5.10.bb
> index af4fede4e9..8e7b0b32a0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?=3D "2b0a7b0262d2a775fad7d9ca87de32dc88015b74"
> -SRCREV_meta ?=3D "e269c86d186e2727bdceab40e3a71ec45e0252d1"
> +SRCREV_machine ?=3D "46fb028ad9413cfa8d47a6dc8bf9a57d9d5edf8b"
> +SRCREV_meta ?=3D "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.10;destsuffix=3D${KMETA}"
>
> -LINUX_VERSION ?=3D "5.10.184"
> +LINUX_VERSION ?=3D "5.10.185"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_5.10.bb
> index f85fea070b..5c4eb9e990 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
> @@ -6,7 +6,7 @@ KCONFIG_MODE =3D "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?=3D "5.10.184"
> +LINUX_VERSION ?=3D "5.10.185"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> @@ -15,9 +15,9 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>
> -SRCREV_machine:qemuarm ?=3D "8cec679b919f74822063e03f38e5a1b5df6248bc"
> -SRCREV_machine ?=3D "962077eea8f30dbc431d66ea7a2cee33659854e2"
> -SRCREV_meta ?=3D "e269c86d186e2727bdceab40e3a71ec45e0252d1"
> +SRCREV_machine:qemuarm ?=3D "6e0299be775387485e22edcd57ac6099c08f4356"
> +SRCREV_machine ?=3D "772cf990473f73ebf34c1a1ef4f06eb3e297c4db"
> +SRCREV_meta ?=3D "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes=
-kernel/linux/linux-yocto_5.10.bb
> index 91ab6ea9b3..6e82782a38 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> @@ -13,23 +13,23 @@ KBRANCH:qemux86  ?=3D "v5.10/standard/base"
>  KBRANCH:qemux86-64 ?=3D "v5.10/standard/base"
>  KBRANCH:qemumips64 ?=3D "v5.10/standard/mti-malta64"
>
> -SRCREV_machine:qemuarm ?=3D "85c2e636ff0c1dc431de60f0113b1f5f89967ca4"
> -SRCREV_machine:qemuarm64 ?=3D "4afca6da69d97af944983918087728d5741df052"
> -SRCREV_machine:qemumips ?=3D "483a2f5f0bf0048b3e864b2a6a9cc1399d27bd1e"
> -SRCREV_machine:qemuppc ?=3D "9f99a56eda87f9de191f14668b488b3b24132c7a"
> -SRCREV_machine:qemuriscv64 ?=3D "e715b8acadb88331f3fc8c820e54e4d27b8c67d=
b"
> -SRCREV_machine:qemuriscv32 ?=3D "e715b8acadb88331f3fc8c820e54e4d27b8c67d=
b"
> -SRCREV_machine:qemux86 ?=3D "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
> -SRCREV_machine:qemux86-64 ?=3D "e715b8acadb88331f3fc8c820e54e4d27b8c67db=
"
> -SRCREV_machine:qemumips64 ?=3D "6bddecdb7271f2cbede46ade8701ce9d0c2bd0f2=
"
> -SRCREV_machine ?=3D "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
> -SRCREV_meta ?=3D "e269c86d186e2727bdceab40e3a71ec45e0252d1"
> +SRCREV_machine:qemuarm ?=3D "08e7e91e009a1d738962de06f48f9704075d3a56"
> +SRCREV_machine:qemuarm64 ?=3D "f23a4523287d5199b67a135e5d1cf3680fe58a3a"
> +SRCREV_machine:qemumips ?=3D "82bae5b9d4316474df162ca7e5a2dff35c4ede39"
> +SRCREV_machine:qemuppc ?=3D "8b5027212160436c9d466b80e0c385f265acfbdb"
> +SRCREV_machine:qemuriscv64 ?=3D "dafc025b033585311d1693255c80b60b690b0e5=
4"
> +SRCREV_machine:qemuriscv32 ?=3D "dafc025b033585311d1693255c80b60b690b0e5=
4"
> +SRCREV_machine:qemux86 ?=3D "dafc025b033585311d1693255c80b60b690b0e54"
> +SRCREV_machine:qemux86-64 ?=3D "dafc025b033585311d1693255c80b60b690b0e54=
"
> +SRCREV_machine:qemumips64 ?=3D "ee18c4343db52d5846a0f332cd6df26a6f72dd45=
"
> +SRCREV_machine ?=3D "dafc025b033585311d1693255c80b60b690b0e54"
> +SRCREV_meta ?=3D "697cb5ef3aff49be3fa29bf604598ca36ceb5dfd"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;b=
ranch=3D${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.10;destsuffix=3D${KMETA}"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> -LINUX_VERSION ?=3D "5.10.184"
> +LINUX_VERSION ?=3D "5.10.185"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
>  DEPENDS +=3D "openssl-native util-linux-native"
> --
> 2.34.1
>

