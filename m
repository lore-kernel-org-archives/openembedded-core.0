Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFEFEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 21:09:47 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.3728.1687813781093226687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 14:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=bvS9lbqT;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so8692446a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 14:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687813779; x=1690405779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IT3bxcEyfgg6yCfLM9LU8AXzQ9YZ4WV6ua0BjHQAdw0=;
        b=bvS9lbqTSkd9vz/NWpNAV864vmoFBYlm4QosLXbcLVvFPJ/Ocoic5ucyuLY/KMy2Oz
         aJmvWjXNv7P+IY956KwhOoaONfF6pf+7i37Gjm+101GyhozzOMas489AvNcNga625ivc
         Z/qLVepsJafceYi2NBVjPWHqwm4bfqEbMphJaoLy0eieinAUrjP9k7IhWgbT3uhd15l/
         rnZ6CWnwUqXgYVXdfq5+sih+xdPB6nrju4p43Nw9SW1ZdlCU/JBKk7eGyEJPc+wP5BsS
         JndUpkCrFTUL+vzMKZOxytXnQEkz8G6blJJYHnQV19sH22AJL1gXwUqNkZf8uzTv0dbd
         fBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687813779; x=1690405779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IT3bxcEyfgg6yCfLM9LU8AXzQ9YZ4WV6ua0BjHQAdw0=;
        b=S6vQTNalJmKY5KA/xmUGUD9duRSFRFOVuKng89lrvkVDHYRKF6ioskUnUx42txcIEi
         1TdpLMQVMruLxJizABGb0rDmY8ZFZ7wGLBTEtGWjIVeHQHVW3Lo3Vcakwml/KMNhvPvb
         fr1mTCv3RTQtn3P+tToiqqf+iXKNx+S0F4ZRkN4KEsxcZd77FBkf3mNINNm1PMlCjwh7
         /rdizZG3smDeAFda5zrt5UtDYCfMjduZ+nOnqWWdWrdkZ0RFPSKC+ikRgxmybmwUMT3t
         5qo8j1QdHNl4m3cnVe9Qpx6rDt1ncfm6+AjTNwlHVPi3tZhtR3Ado2pkYMjBlUFWFYi0
         4ISA==
X-Gm-Message-State: AC+VfDyf2bynxTeCek5t+Hnd1tgisoIt7WooGWb3nUxewbZiZPmBbMqC
	OGSrmHb6hAA76WsZ+7KH8U5zILwz6lmgL/PvNMvp/2mFxUi8QjZanRk=
X-Google-Smtp-Source: ACHHUZ7SRLJkSIn30ghR0aNYt4p1LyCOLJNVD2/ttrdht2QJ4brzTGreI4yyPY8SUtcgvf9LiKeZcoJRjPv6lpGSfJg=
X-Received: by 2002:aa7:ce15:0:b0:51b:ec90:cf0f with SMTP id
 d21-20020aa7ce15000000b0051bec90cf0fmr11959274edv.6.1687813779239; Mon, 26
 Jun 2023 14:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230622231457.928082-1-bruce.ashfield@gmail.com> <20230622231457.928082-5-bruce.ashfield@gmail.com>
In-Reply-To: <20230622231457.928082-5-bruce.ashfield@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 26 Jun 2023 11:09:28 -1000
Message-ID: <CAOSpxdYx3RBaK69nwF1S1iJPqm2+Z1CK1zchuhECLKOTnSQW9Q@mail.gmail.com>
Subject: Re: [OE-core][mickledore 5/5] linux-yocto/5.15: update to v5.15.118
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 21:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183428

Hi Bruce,

I'm getting a warning on the autobuilder with poky-altcfg:

WARNING: linux-yocto-5.15.118+gitAUTOINC+a6e18bacdd_079c884905-r0
do_kernel_configcheck: [kernel config]: This BSP contains fragments
with warnings:

[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_DECNET

Steve

On Thu, Jun 22, 2023 at 1:15=E2=80=AFPM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating  to the latest korg -stable release that comprises
> the following commits:
>
>     f67653019430 Linux 5.15.118
>     e5bf1f7d1fc8 nilfs2: reject devices with insufficient block count
>     2bc9231afc64 mmc: block: ensure error propagation for non-blk
>     4b7b50d4eb1a of: overlay: add entry to of_overlay_action_name[]
>     84770cc54eff neighbour: delete neigh_lookup_nodev as not used
>     41806518254c net: Remove DECnet leftovers from flow.h.
>     4c39a2414a23 net: Remove unused inline function dst_hold_and_use()
>     bb76281b6e61 neighbour: Remove unused inline function neigh_key_eq16(=
)
>     67866cad7624 rcu/kvfree: Avoid freeing new kfree_rcu() memory after o=
ld grace period
>     c91ed3a5c2ab cgroup: always put cset in cgroup_css_set_put_fork
>     33b801be2de1 afs: Fix vlserver probe RTT handling
>     f824bcc3e14b selftests/ptp: Fix timestamp printf format for PTP_SYS_O=
FFSET
>     2077c7dbfe29 net: tipc: resize nlattr array to correct size
>     f734e16ee17f dm: don't lock fs when the map is NULL during suspend or=
 resume
>     8a8179f6a345 net: lapbether: only support ethernet devices
>     052417e8b3ac net/sched: cls_api: Fix lockup on flushing explicitly cr=
eated chain
>     c0cb9d453fd1 ext4: drop the call to ext4_error() from ext4_get_group_=
info()
>     eb4ccc102d5f cifs: fix lease break oops in xfstest generic/098
>     1cb181271eab drm/nouveau: add nv_encoder pointer check for NULL
>     c79dccc263db drm/nouveau/dp: check for NULL nv_connector->native_mode
>     909b7f7497cc drm/nouveau: don't detect DSM for non-NVIDIA device
>     10e1e07bdea4 igb: fix nvm.ops.read() error handling
>     fe03fd373ca6 igc: Clean the TX buffer and TX descriptor ring
>     032b8cbeb19c sctp: fix an error code in sctp_sf_eat_auth()
>     981e78781a96 ipvlan: fix bound dev checking for IPv6 l3s mode
>     3e76522d1a6d net: ethtool: correct MAX attribute value for stats
>     18512de74454 IB/isert: Fix incorrect release of isert connection
>     63e9e7198374 IB/isert: Fix possible list corruption in CMA handler
>     29ff057c0a50 IB/isert: Fix dead lock in ib_isert
>     fced7aaaa38f IB/uverbs: Fix to consider event queue closing also upon=
 non-blocking mode
>     cd44977ecc94 RDMA/cma: Always set static rate to 0 for RoCE
>     5a9dee176b4b RDMA/mlx5: Initiate dropless RQ for RAW Ethernet functio=
ns
>     35828874aa9f octeontx2-af: fix lbk link credits on cn10k
>     7506e77357da octeontx2-af: fixed resource availability check
>     4dd914b9e2f9 iavf: remove mask from iavf_irq_enable_queues()
>     e6342cd13d39 RDMA/rxe: Fix the use-before-initialization error of res=
p_pkts
>     466f25fd2d9b RDMA/rxe: Removed unused name from rxe_task struct
>     13d087b3587b RDMA/rxe: Remove the unused variable obj
>     0e1098d72fa4 net/sched: cls_u32: Fix reference counter leak leading t=
o overflow
>     d56661cd8d55 net/sched: act_pedit: Parse L3 Header for L4 offset
>     17b330b78244 net/sched: act_pedit: remove extra check for key type
>     219b8e98387f net/sched: simplify tcf_pedit_act
>     688e6db59661 ping6: Fix send to link-local addresses with VRF.
>     471a4c08e30e net: enetc: correct the indexes of highest and 2nd highe=
st TCs
>     44ebe988cb38 netfilter: nf_tables: incorrect error path handling with=
 NFT_MSG_NEWRULE
>     133b73d85343 netfilter: nfnetlink: skip error delivery on batch in ca=
se of ENOMEM
>     e4188f8b8134 netfilter: nf_tables: integrate pipapo into commit proto=
col
>     4da9d4e74033 spi: fsl-dspi: avoid SCK glitches with continuous transf=
ers
>     08acd41bb15a RDMA/rxe: Fix packet length checks
>     01f6f867adc7 RDMA/rtrs: Fix rxe_dealloc_pd warning
>     01bbead3098b RDMA/rtrs: Fix the last iu->buf leak in err path
>     1938f080a183 usb: dwc3: gadget: Reset num TRBs before giving back the=
 request
>     ed0295504905 serial: lantiq: add missing interrupt ack
>     235845b576c5 USB: serial: option: add Quectel EM061KGL series
>     e05e9cca7797 thunderbolt: Mask ring interrupt on Intel hardware as we=
ll
>     0bd227610c83 thunderbolt: dma_test: Use correct value for absent ring=
s when creating paths
>     2a974abc0976 Remove DECnet support from kernel
>     28010d3a9a22 ALSA: hda/realtek: Add a quirk for Compaq N14JP6
>     203a01ae5732 drm/amdgpu: add missing radeon secondary PCI ID
>     b1b64a76b775 drm/amd/display: edp do not add non-edid timings
>     98c8c0f2b3a5 net: usb: qmi_wwan: add support for Compal RXM-G1
>     fd81222d1a69 RDMA/uverbs: Restrict usage of privileged QKEYs
>     14c30c2439dc nouveau: fix client work fence deletion race
>     f4c5eebb37a2 dm thin metadata: check fail_io before using data_sm
>     ee09c0b1b0f4 ALSA: usb-audio: Add quirk flag for HEM devices to enabl=
e native DSD playback
>     953cc0bf2d5b powerpc/purgatory: remove PGO flags
>     faf45f2c5e62 x86/purgatory: remove PGO flags
>     d38e051ec6fd kexec: support purgatories with .text.hot sections
>     4357336192ed nilfs2: fix possible out-of-bounds segment allocation in=
 resize ioctl
>     74ea184af91a nilfs2: fix incomplete buffer cleanup in nilfs_btnode_ab=
ort_change_key()
>     941e7452dfc8 nios2: dts: Fix tse_mac "max-frame-size" property
>     8a8efde4a735 ocfs2: check new file size on fallocate call
>     559b7a0d9f0d ocfs2: fix use-after-free when unmounting read-only file=
system
>     8262a9f3b801 epoll: ep_autoremove_wake_function should use list_del_i=
nit_careful
>     c0a242295569 wifi: cfg80211: fix double lock bug in reg_wdev_chan_val=
id()
>     1a65bac4edf9 wifi: cfg80211: fix locking in regulatory disconnect
>     0e388fce7aec io_uring: hold uring mutex around poll removal
>     27825a6da78b irqchip/gic: Correctly validate OF quirk descriptors
>     f50018e2dd87 NVMe: Add MAXIO 1602 to bogus nid list.
>     4204b539ca73 drm:amd:amdgpu: Fix missing buffer object unlock in fail=
ure path
>     7cb02d5dc2e2 xen/blkfront: Only check REQ_FUA for writes
>     a75928bb929a ASoC: dwc: move DMA init to snd_soc_dai_driver probe()
>     37f7864c1791 mips: Move initrd_start check after initrd address sanit=
isation.
>     0d6e6542946d MIPS: Alchemy: fix dbdma2
>     1907b6148f86 MIPS: unhide PATA_PLATFORM
>     8f50d247b5dc parisc: Flush gatt writes and adjust gatt mask in parisc=
_agp_mask_memory()
>     717368977b8e parisc: Improve cache flushing for PCXL in arch_sync_dma=
_for_cpu()
>     7e85809d2782 ASoC: soc-pcm: test if a BE can be prepared
>     68086376a1d2 btrfs: handle memory allocation failure in btrfs_csum_on=
e_bio
>     39ea94952625 btrfs: scrub: try harder to mark RAID56 block groups rea=
d-only
>     9df872ec4a22 power: supply: Fix logic checking if system is running f=
rom battery
>     42e6a4a1e085 irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices =
w/ firmware issues
>     2105f2fa5791 regulator: Fix error checking for debugfs_create_dir
>     91b3d6aa0722 platform/x86: asus-wmi: Ignore WMI events with codes 0x7=
B, 0xC0
>     c845ec79c3cf power: supply: Ratelimit no data debug output
>     19d09d31dae5 tools: gpio: fix debounce_period_us output of lsgpio
>     c11bb961ca4d ARM: dts: vexpress: add missing cache properties
>     36fdd1d5b40e power: supply: bq27xxx: Use mod_delayed_work() instead o=
f cancel() + schedule()
>     3b86c54e6ebe power: supply: sc27xx: Fix external_power_changed race
>     200d8ad44e04 power: supply: ab8500: Fix external_power_changed race
>     48992b928785 of: overlay: Fix missing of_node_put() in error case of =
init_overlay_changeset()
>     282f0c63cf53 of: overlay: rework overlay apply and remove kfree()s
>     5f306cbfa52b of: overlay: rename variables to be consistent
>     1cc40dccad76 drm/amdgpu: fix Null pointer dereference error in amdgpu=
_device_recover_vram
>     7cf3bf3cc033 ksmbd: fix slab-out-of-bounds read in smb2_handle_negoti=
ate
>     de091a6e1ff0 test_firmware: fix a memory leak with reqs buffer
>     bfb0b366e8ec test_firmware: prevent race conditions by a correct impl=
ementation of locking
>     4b5511aa0a5e test_firmware: Use kstrtobool() instead of strtobool()
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
> index 6da8887ae8..b16a2af875 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?=3D "23c35cbe4ce993fc3b566f733820bc46ef715972"
> -SRCREV_meta ?=3D "3fe1658766cb7c35799c501ff46b85d773bee417"
> +SRCREV_machine ?=3D "b2a7dbd4edac7627c091c2ab14fec83726a4c79b"
> +SRCREV_meta ?=3D "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine;protocol=3Dhttps \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA};protocol=3Dhttps"
>
> -LINUX_VERSION ?=3D "5.15.117"
> +LINUX_VERSION ?=3D "5.15.118"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_5.15.bb
> index 56567be1c9..20ec58fb85 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> @@ -5,7 +5,7 @@ KCONFIG_MODE =3D "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?=3D "5.15.117"
> +LINUX_VERSION ?=3D "5.15.118"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> @@ -14,8 +14,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>
> -SRCREV_machine ?=3D "9d2b9c97c40afeb83f842bc7b2759bb3a2d2a19d"
> -SRCREV_meta ?=3D "3fe1658766cb7c35799c501ff46b85d773bee417"
> +SRCREV_machine ?=3D "b79e89ab973aeb8ec48e2cd987436ab52678e795"
> +SRCREV_meta ?=3D "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes=
-kernel/linux/linux-yocto_5.15.bb
> index a7ec2a3a8a..c9dae7fa31 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> @@ -13,24 +13,24 @@ KBRANCH:qemux86  ?=3D "v5.15/standard/base"
>  KBRANCH:qemux86-64 ?=3D "v5.15/standard/base"
>  KBRANCH:qemumips64 ?=3D "v5.15/standard/mti-malta64"
>
> -SRCREV_machine:qemuarm ?=3D "1bf5d396bdb59d790e28ee0002d45fe974023e99"
> -SRCREV_machine:qemuarm64 ?=3D "96c8889c7cf3da5210f20f68efdd0a9ff35b1f19"
> -SRCREV_machine:qemumips ?=3D "3d65f1de77e2b0c0736503979fa9308d385d19f0"
> -SRCREV_machine:qemuppc ?=3D "c3ec0c3928575af062554bc94d49e1e582dc5416"
> -SRCREV_machine:qemuriscv64 ?=3D "7a7b177c86db237df76dd87e5515233aac96232=
b"
> -SRCREV_machine:qemuriscv32 ?=3D "7a7b177c86db237df76dd87e5515233aac96232=
b"
> -SRCREV_machine:qemux86 ?=3D "7a7b177c86db237df76dd87e5515233aac96232b"
> -SRCREV_machine:qemux86-64 ?=3D "7a7b177c86db237df76dd87e5515233aac96232b=
"
> -SRCREV_machine:qemumips64 ?=3D "58aa8e851acd14dec6c2769637d5e09d796315d9=
"
> -SRCREV_machine ?=3D "7a7b177c86db237df76dd87e5515233aac96232b"
> -SRCREV_meta ?=3D "3fe1658766cb7c35799c501ff46b85d773bee417"
> +SRCREV_machine:qemuarm ?=3D "2290ac7e8d7fbb8e13a34468b85066c398c7d1f3"
> +SRCREV_machine:qemuarm64 ?=3D "3f3f2067c3ee4d9dffaed9b757583d013671cf25"
> +SRCREV_machine:qemumips ?=3D "f61a3b045bdfc9aa7da440852e0a79fd8d9b4d69"
> +SRCREV_machine:qemuppc ?=3D "7a2773ad8fb4ae4eb0183ccda8ec133098d13ec9"
> +SRCREV_machine:qemuriscv64 ?=3D "079c88490578df99b38570c8968b836b8347ed4=
4"
> +SRCREV_machine:qemuriscv32 ?=3D "079c88490578df99b38570c8968b836b8347ed4=
4"
> +SRCREV_machine:qemux86 ?=3D "079c88490578df99b38570c8968b836b8347ed44"
> +SRCREV_machine:qemux86-64 ?=3D "079c88490578df99b38570c8968b836b8347ed44=
"
> +SRCREV_machine:qemumips64 ?=3D "47d334232ab28f0f8d5316e07e11f8f14c6aaecc=
"
> +SRCREV_machine ?=3D "079c88490578df99b38570c8968b836b8347ed44"
> +SRCREV_meta ?=3D "a6e18bacddf8ebca0c151e809c9996e17e08a7b0"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the=
 same
>  # meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
>  # normal PREFERRED_VERSION settings.
>  BBCLASSEXTEND =3D "devupstream:target"
> -SRCREV_machine:class-devupstream ?=3D "471e639e59d128f4bf58000a118b2ceca=
3893f98"
> +SRCREV_machine:class-devupstream ?=3D "f67653019430833d5003f16817d7fa852=
72a6a76"
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
> -LINUX_VERSION ?=3D "5.15.117"
> +LINUX_VERSION ?=3D "5.15.118"
>
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
>  DEPENDS +=3D "openssl-native util-linux-native"
> --
> 2.34.1
>

