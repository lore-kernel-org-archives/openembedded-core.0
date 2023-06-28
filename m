Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD7BEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 16:29:48 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.21303.1687969783093637435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 09:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ie84i/h1;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51d9850ef09so4332682a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687969781; x=1690561781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LP+w5DOXyzoWk7CHMQR7diLVHQVS1VevLsJJvKgN64=;
        b=ie84i/h1OHMBfc4fr6nYCGeDTc6U/+qVf7sACfG3cxW4YxB40Y4m5+6A7oCPmUgI0N
         mk4xR0oEIcf7XeZlBd+EMIjuufEV2jCCO/rFJBtujWonELH69LSqZaTr+qT8IVpbUhim
         a3mI6O9Wqh/IRzZV8OGcYGvNZdSwZ/IFIV4oHXQHCWsyScYa9vhx66ofQqsmzC7cskzA
         NOtyIa37QX3PC1+KwJjzc/ZQSAQ+eiJvSq3xQVZK+dwCEmslS4CqIZGOdc4PePo8e5L6
         7gdLlJ8Jtwlm+uJQsomsmXZYWNi+wJo8lyDcr9kOkdimeoJpJZtWOK3Gz8b9UNpNupJQ
         uNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687969781; x=1690561781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LP+w5DOXyzoWk7CHMQR7diLVHQVS1VevLsJJvKgN64=;
        b=Adok7nwU12GktK+bRckvU5r1xfTrYjqGHKB1BU2v2Sm8ExBlk4fn0tLhoxUktLKC8z
         r/nzxl2uBaVZbJM/HIleYEfVkqhNZfgh027OpTiL1ISFeJjPekMg4YZtDuIkK1XuoFYX
         6jrfwRVx1p9AzXh33LkMmN+5NpdsWoz0b4kCaJhysm5RSBBuTPf3D4SK9IlStjMu8Dv8
         MjPgxtABym3i4vlkt4sjotlIqeyjLgXERyUKTm0EmHZMi+Zfa6D+Ugmr5wGwhZAuDp1W
         Yu3BPNKyHjgoVTOiUmFDaKqFL/aMLM18+DjKpkSUqbXZuUZd2gNZpXX0BLP+Q/Ob3jJl
         Py0Q==
X-Gm-Message-State: AC+VfDzTIx+7jKQidJfXpPBrM81nLCx8jcT5KCgBenosm0lW8laNiHzw
	fzdYBoF5yO8UikfvVZKKD2/d9/qKXlkZgRfce/huAQ==
X-Google-Smtp-Source: ACHHUZ4fJ7DvWY9Mm+RdGbpeHPYx9y1pZon8UBLt1b+0lg5Fn9E/OMiMfussDcGh6//csFgsC0TJAHzn1ipdMddxq7M=
X-Received: by 2002:a05:6402:2057:b0:51d:a73b:0 with SMTP id
 bc23-20020a056402205700b0051da73b0000mr5165493edb.10.1687969781280; Wed, 28
 Jun 2023 09:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230622232211.928913-1-bruce.ashfield@gmail.com> <20230622232211.928913-3-bruce.ashfield@gmail.com>
In-Reply-To: <20230622232211.928913-3-bruce.ashfield@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 28 Jun 2023 06:29:30 -1000
Message-ID: <CAOSpxdYjyGuqke4ByPwOOaOJ69PkmMC6w1HsbR1zNPqTiy=1ww@mail.gmail.com>
Subject: Re: [OE-core][dunfell 3/3] linux-yocto/5.4: update to v5.4.248
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 16:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183596

Sign, same issue here in dunfell :-(

WARNING: linux-yocto-5.4.248+gitAUTOINC+b6e41788ae_d18af0e8ac-r0
do_kernel_configcheck: [kernel config]: This BSP sets config options
that are not offered anywhere within this kernel:

CONFIG_DECNET

Steve

On Thu, Jun 22, 2023 at 1:22=E2=80=AFPM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating  to the latest korg -stable release that comprises
> the following commits:
>
>     f2b499c27a95 Linux 5.4.248
>     1cdc48aaff18 mmc: block: ensure error propagation for non-blk
>     de517032ee39 drm/nouveau/kms: Fix NULL pointer dereference in nouveau=
_connector_detect_depth
>     d3f7f557d8a2 neighbour: delete neigh_lookup_nodev as not used
>     a433b85d1750 net: Remove unused inline function dst_hold_and_use()
>     fbc0209ae3a7 neighbour: Remove unused inline function neigh_key_eq16(=
)
>     bc1ea55bf1cf afs: Fix vlserver probe RTT handling
>     98acd5f0ce10 selftests/ptp: Fix timestamp printf format for PTP_SYS_O=
FFSET
>     1140f8bc29c2 net: tipc: resize nlattr array to correct size
>     b83f86ba414c net: lapbether: only support ethernet devices
>     ec694ad393cc net/sched: cls_api: Fix lockup on flushing explicitly cr=
eated chain
>     0456f470fa02 drm/nouveau: add nv_encoder pointer check for NULL
>     b1d76d16af2a drm/nouveau/kms: Don't change EDID when it hasn't actual=
ly changed
>     f654b8a1325f drm/nouveau/dp: check for NULL nv_connector->native_mode
>     2ac7be7718a1 igb: fix nvm.ops.read() error handling
>     44008337f80e sctp: fix an error code in sctp_sf_eat_auth()
>     edd3d3dc4849 ipvlan: fix bound dev checking for IPv6 l3s mode
>     6718478c18a4 IB/isert: Fix incorrect release of isert connection
>     f8a91a024ab9 IB/isert: Fix possible list corruption in CMA handler
>     8a867ab71302 IB/isert: Fix dead lock in ib_isert
>     22125be516ef IB/uverbs: Fix to consider event queue closing also upon=
 non-blocking mode
>     ea4cf04d3f19 iavf: remove mask from iavf_irq_enable_queues()
>     19a500f530c2 RDMA/rxe: Fix the use-before-initialization error of res=
p_pkts
>     42ab73534583 RDMA/rxe: Removed unused name from rxe_task struct
>     f99b6de58b5e RDMA/rxe: Remove the unused variable obj
>     46305daf8064 net/sched: cls_u32: Fix reference counter leak leading t=
o overflow
>     88d6c1958bc0 ping6: Fix send to link-local addresses with VRF.
>     474e0adf29cf netfilter: nfnetlink: skip error delivery on batch in ca=
se of ENOMEM
>     67cafcd3e661 spi: fsl-dspi: avoid SCK glitches with continuous transf=
ers
>     8231594e21d1 spi: spi-fsl-dspi: Remove unused chip->void_write_data
>     9d8b388a24c6 usb: dwc3: gadget: Reset num TRBs before giving back the=
 request
>     94e52fac1519 serial: lantiq: add missing interrupt ack
>     b577b74f8f83 USB: serial: option: add Quectel EM061KGL series
>     6b1203ae83c3 Remove DECnet support from kernel
>     aad6addc17ae ALSA: hda/realtek: Add a quirk for Compaq N14JP6
>     def7e17c98f7 net: usb: qmi_wwan: add support for Compal RXM-G1
>     74bd53737372 RDMA/uverbs: Restrict usage of privileged QKEYs
>     a8997ffad359 nouveau: fix client work fence deletion race
>     01fd784b0762 powerpc/purgatory: remove PGO flags
>     b16bf76b3828 kexec: support purgatories with .text.hot sections
>     b27a5fbe3c87 nilfs2: fix possible out-of-bounds segment allocation in=
 resize ioctl
>     0dd2d8331eb4 nilfs2: fix incomplete buffer cleanup in nilfs_btnode_ab=
ort_change_key()
>     e1fb47f13970 nios2: dts: Fix tse_mac "max-frame-size" property
>     5e531f448e5a ocfs2: check new file size on fallocate call
>     f6878da39f47 ocfs2: fix use-after-free when unmounting read-only file=
system
>     82173fde61c7 drm:amd:amdgpu: Fix missing buffer object unlock in fail=
ure path
>     63afd766211b xen/blkfront: Only check REQ_FUA for writes
>     27447dada0b5 mips: Move initrd_start check after initrd address sanit=
isation.
>     a365600bba27 MIPS: Alchemy: fix dbdma2
>     6b39b06b8d5b parisc: Flush gatt writes and adjust gatt mask in parisc=
_agp_mask_memory()
>     de873bce06a8 parisc: Improve cache flushing for PCXL in arch_sync_dma=
_for_cpu()
>     28850d25a62c btrfs: handle memory allocation failure in btrfs_csum_on=
e_bio
>     b31586747bae power: supply: Fix logic checking if system is running f=
rom battery
>     dd8804117d4b irqchip/meson-gpio: Mark OF related data as maybe unused
>     30ade27dbe66 regulator: Fix error checking for debugfs_create_dir
>     a12155f0b1b6 platform/x86: asus-wmi: Ignore WMI events with codes 0x7=
B, 0xC0
>     d26edc403c0a power: supply: Ratelimit no data debug output
>     af44b2ddfc08 ARM: dts: vexpress: add missing cache properties
>     bd725832eb50 power: supply: bq27xxx: Use mod_delayed_work() instead o=
f cancel() + schedule()
>     82bfd14f1359 power: supply: sc27xx: Fix external_power_changed race
>     66d5882dcc9f power: supply: ab8500: Fix external_power_changed race
>     a8f286bfbc71 s390/dasd: Use correct lock while counting channel queue=
 length
>     d60be47f4357 dasd: refactor dasd_ioctl_information
>     7f3bb75a0484 KEYS: asymmetric: Copy sig and digest in public_key_veri=
fy_signature()
>     75d9e00f65cd test_firmware: fix a memory leak with reqs buffer
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
>  .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
>  3 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_5.4.bb
> index 8e0f7ae217..a98a64110a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?=3D "3ec10d880e38eb58af39c33094e455da59afd42b"
> -SRCREV_meta ?=3D "b09511ad6dbb6f38303add48d2da78906bab1380"
> +SRCREV_machine ?=3D "8472ed342e0ac3f529c10b474b12ef0e05995778"
> +SRCREV_meta ?=3D "5c912968f2cb938ad084d457dae99bf8eb16032d"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
>
> -LINUX_VERSION ?=3D "5.4.247"
> +LINUX_VERSION ?=3D "5.4.248"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-tiny_5.4.bb
> index 6a6787a091..46a8856963 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> @@ -6,7 +6,7 @@ KCONFIG_MODE =3D "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?=3D "5.4.247"
> +LINUX_VERSION ?=3D "5.4.248"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> @@ -15,9 +15,9 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>
> -SRCREV_machine_qemuarm ?=3D "5780bc7b75d300e9b90b78c9297ff4717a78a893"
> -SRCREV_machine ?=3D "45eaa635123abc1568c35d4abd0f31cc7c4f75a9"
> -SRCREV_meta ?=3D "b09511ad6dbb6f38303add48d2da78906bab1380"
> +SRCREV_machine_qemuarm ?=3D "ca5368c73bab4eb276a8e721df28c02ceb8f3eeb"
> +SRCREV_machine ?=3D "abb579170926348d1518bc1a2de8cb1cdf403808"
> +SRCREV_meta ?=3D "5c912968f2cb938ad084d457dae99bf8eb16032d"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-=
kernel/linux/linux-yocto_5.4.bb
> index 6c9cea6993..fae2de5c72 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?=3D "v5.4/standard/base"
>  KBRANCH_qemux86-64 ?=3D "v5.4/standard/base"
>  KBRANCH_qemumips64 ?=3D "v5.4/standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?=3D "5f8520357626b4a63278e222fa32b322f9811f34"
> -SRCREV_machine_qemuarm64 ?=3D "5aae64158e118c7c96b6b2db41aa0c565d733c47"
> -SRCREV_machine_qemumips ?=3D "50721182f0802cab035f92538c9fe60fa32e27a6"
> -SRCREV_machine_qemuppc ?=3D "032f6844ab616a7c3c96a27a9f7c19c56e4b37a5"
> -SRCREV_machine_qemuriscv64 ?=3D "2ded7ddaca7d93e0df26c4392b713dd7b016a40=
2"
> -SRCREV_machine_qemux86 ?=3D "2ded7ddaca7d93e0df26c4392b713dd7b016a402"
> -SRCREV_machine_qemux86-64 ?=3D "2ded7ddaca7d93e0df26c4392b713dd7b016a402=
"
> -SRCREV_machine_qemumips64 ?=3D "77a6c71bda43b4d11767ea3946385f6a5d2d24b6=
"
> -SRCREV_machine ?=3D "2ded7ddaca7d93e0df26c4392b713dd7b016a402"
> -SRCREV_meta ?=3D "b09511ad6dbb6f38303add48d2da78906bab1380"
> +SRCREV_machine_qemuarm ?=3D "68775a8671944b96c6a1ee795809f81149951f2d"
> +SRCREV_machine_qemuarm64 ?=3D "54bc3d459501d8df9baf093a34d8bb676c207a07"
> +SRCREV_machine_qemumips ?=3D "ba2d346cc66307fa6332b9fb86eb8ca66f30ebcd"
> +SRCREV_machine_qemuppc ?=3D "6703d4c7c75fab78e0c72227a98aba8071d5b1c3"
> +SRCREV_machine_qemuriscv64 ?=3D "d18af0e8acb7c4cb245739fa8165a44845ff2ba=
0"
> +SRCREV_machine_qemux86 ?=3D "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
> +SRCREV_machine_qemux86-64 ?=3D "d18af0e8acb7c4cb245739fa8165a44845ff2ba0=
"
> +SRCREV_machine_qemumips64 ?=3D "66cac7d41a43594760f6ac48e848d73315cc5dd3=
"
> +SRCREV_machine ?=3D "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
> +SRCREV_meta ?=3D "5c912968f2cb938ad084d457dae99bf8eb16032d"
>
>  # remap qemuarm to qemuarma15 for the 5.4 kernel
>  # KMACHINE_qemuarm ?=3D "qemuarma15"
> @@ -30,7 +30,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git=
;name=3Dmachine;branch=3D${KBRA
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
> -LINUX_VERSION ?=3D "5.4.247"
> +LINUX_VERSION ?=3D "5.4.248"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
>  DEPENDS +=3D "openssl-native util-linux-native"
> --
> 2.34.1
>

