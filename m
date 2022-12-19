Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982BAC10F1B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 17:41:57 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.28723.1671471710173905139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 09:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pHvVC0Pv;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id i12so6717778qvs.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 09:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5dmjF44WoMrLjA76e3hANUV2XFMctAyHo2C+6pyEWc=;
        b=pHvVC0PvuIGz8nnIkO+PmWozbOZTZMtyMFFyOGPr+BvZ8hAoWhY0Rmpipe9pxXZj5v
         fFQqfXh351ACzA7Wnud5IrNzNeywUbY6OTdxQL/pNGYcxkqt1RNUSBG4uDZKbcYuN5pF
         20UULlJ+HWpJ2AtH4O37tcFwpu2fG6xvuUvBnxXUkyzBplrSXRDO1LHW8c/AxLpjR8Ef
         C0MCXLdyK9on0SQKFIqcRz2oxa2dnyJr2kqtKhwqe1hkctZsJpjBT2ieN71wNQY4c4jC
         Lb9LBzWl4l5mdn9kpmivCAgRJD/4xAuORf6qJ9l+6HxqrXNOhkCiN2cmTQprI5O5WDBJ
         7YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5dmjF44WoMrLjA76e3hANUV2XFMctAyHo2C+6pyEWc=;
        b=1jPmEWlJsgUPksXuv9J5h+ErfZqc/wnsuSQUfN4RhDe3zEkPa/wGy/zjjAEogJyuoA
         OntJzynq7STjWX01yPhTS/dJd3bS5yS9LXdZrzQMu178acCQq4wLoiR70dh5dUGyehEo
         4efROsni4BRxDb2AeEwMY8pp0+u72TZdsdKloKC8LlSqy5s/MEld/3eD01K6Wi3CR3SP
         j1u+f992RMZUvJYpr5HGOKy8kNnsaUu5IJbt1v+xdPktjIKmFe2HISSqj/dhcTmWn1Po
         dCI8S/drXqeeCo8H/ORaQfcJ3AMiwAjBzu2J2Za57ZslnVCl8iaKpigYd4k/FdqQi6W7
         Wx5g==
X-Gm-Message-State: ANoB5pm5nRL0IX+CVqnW/sqqYwQIA7t9IGXb3WMAbXS6Jda3p/jkFYfL
	818eVbnQ/U+ExHEUJGBmwSMjG3AVbhs=
X-Google-Smtp-Source: AA0mqf69iVdO77nuxT5Zs2VLjQYgaf5WzFG/4hg2dW+hgde0IgidU5m6AB88H5D9EcyylTRDSUd3Tw==
X-Received: by 2002:a0c:d850:0:b0:4b4:a3d5:8cee with SMTP id i16-20020a0cd850000000b004b4a3d58ceemr50575774qvj.16.1671471708971;
        Mon, 19 Dec 2022 09:41:48 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id u7-20020a05620a430700b006fa31bf2f3dsm7477624qko.47.2022.12.19.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 09:41:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4][dunfell] linux-yocto/5.4: update to v5.4.224
Date: Mon, 19 Dec 2022 12:41:44 -0500
Message-Id: <20221219174146.64696-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20221219174146.64696-1-bruce.ashfield@gmail.com>
References: <20221219174146.64696-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 17:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174824

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    771a8acbb841 Linux 5.4.224
    3e0c1ab197eb ipc: remove memcg accounting for sops objects in do_semtimedop()
    a16415c8f156 wifi: brcmfmac: Fix potential buffer overflow in brcmf_fweh_event_worker()
    a24bf3c317b2 drm/i915/sdvo: Setup DDC fully before output init
    4dadd4b16178 drm/i915/sdvo: Filter out invalid outputs more sensibly
    57306fef4d10 drm/rockchip: dsi: Force synchronous probe
    e09ff743e30b mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times
    8b1174d05896 KVM: x86: emulator: update the emulation mode after CR0 write
    ac3bc06c9ac5 KVM: x86: emulator: introduce emulator_recalc_and_set_mode
    f159cd915d73 KVM: x86: emulator: em_sysexit should update ctxt->mode
    ef3094c4e9ee KVM: x86: Mask off reserved bits in CPUID.80000008H
    da1bf3732d0f KVM: x86: Mask off reserved bits in CPUID.8000001AH
    2fa24d0274fb ext4: fix BUG_ON() when directory entry has invalid rec_len
    72743d5598b9 ext4: fix warning in 'ext4_da_release_space'
    eed040fd35e9 parisc: Avoid printing the hardware path twice
    9e902284ee3e parisc: Export iosapic_serial_irq() symbol for serial port driver
    506ae301672e parisc: Make 8250_gsc driver dependend on CONFIG_PARISC
    c586068aad62 ALSA: usb-audio: Add quirks for MacroSilicon MS2100/MS2106 devices
    4e8ee3cf74e2 perf/x86/intel: Add Cooper Lake stepping to isolation_ucodes[]
    6ffa48150b9b perf/x86/intel: Fix pebs event constraints for ICL
    fee896d4534f efi: random: reduce seed size to 32 bytes
    0c7275743498 fuse: add file_modified() to fallocate
    0c3e6288da65 capabilities: fix potential memleak on error path from vfs_getxattr_alloc()
    4bc52ddf6347 tracing/histogram: Update document for KEYS_MAX size
    c8938263e640 tools/nolibc/string: Fix memcmp() implementation
    993bd0de8b53 kprobe: reverse kp->flags when arm_kprobe failed
    fe3da74428bf tcp/udp: Make early_demux back namespacified.
    4ae03c869c9a btrfs: fix type of parameter generation in btrfs_get_dentry
    27a594bc7a7c binder: fix UAF of alloc->vma in race with munmap()
    bad83d55134e memcg: enable accounting of ipc resources
    92aaa5e8fe90 tcp/udp: Fix memory leak in ipv6_renew_options().
    c494ae149858 block, bfq: protect 'bfqd->queued' by 'bfqd->lock'
    6949400ec9fe Bluetooth: L2CAP: Fix attempting to access uninitialized memory
    ad18f624e3da xfs: Add the missed xfs_perag_put() for xfs_ifree_cluster()
    0802130a4d0b xfs: don't fail unwritten extent conversion on writeback due to edquot
    fef141f9e4c1 xfs: group quota should return EDQUOT when prj quota enabled
    4267433dd3d3 xfs: gut error handling in xfs_trans_unreserve_and_mod_sb()
    24e7e3935309 xfs: use ordered buffers to initialize dquot buffers during quotacheck
    52802e9a035f xfs: don't fail verifier on empty attr3 leaf block
    71d487a82d2c i2c: xiic: Add platform module alias
    cdd19e559a72 HID: saitek: add madcatz variant of MMO7 mouse device ID
    efdcd1e32c0d scsi: core: Restrict legal sdev_state transitions via sysfs
    70119756311a media: meson: vdec: fix possible refcount leak in vdec_probe()
    bfa8ccf70597 media: dvb-frontends/drxk: initialize err to 0
    11c8f19e0f5a media: cros-ec-cec: limit msg.len to CEC_MAX_MSG_SIZE
    4a449430ecfb media: s5p_cec: limit msg.len to CEC_MAX_MSG_SIZE
    381453770f73 ipv6: fix WARNING in ip6_route_net_exit_late()
    b49f6b2f21f5 net, neigh: Fix null-ptr-deref in neigh_table_clear()
    4954b5359eb1 net: mdio: fix undefined behavior in bit shift for __mdiobus_register
    c1f594dddd9f Bluetooth: L2CAP: fix use-after-free in l2cap_conn_del()
    4cd094fd5d87 Bluetooth: L2CAP: Fix use-after-free caused by l2cap_reassemble_sdu
    5d1a47ebf845 btrfs: fix ulist leaks in error paths of qgroup self tests
    6a6731a0df8c btrfs: fix inode list leak during backref walking at find_parent_nodes()
    2c0329406bb2 btrfs: fix inode list leak during backref walking at resolve_indirect_refs()
    3d74329d8cff isdn: mISDN: netjet: fix wrong check of device registration
    2ff6b669523d mISDN: fix possible memory leak in mISDN_register_device()
    b13be5e852b0 rose: Fix NULL pointer dereference in rose_send_frame()
    8457a00c981f ipvs: fix WARNING in ip_vs_app_net_cleanup()
    7effc4ce3d14 ipvs: fix WARNING in __ip_vs_cleanup_batch()
    2cc523978f1c ipvs: use explicitly signed chars
    74fd58394670 netfilter: nf_tables: release flow rule object from commit path
    ca791952d42c net: tun: fix bugs for oversize packet when napi frags enabled
    52e042947197 net: sched: Fix use after free in red_enqueue()
    d605da3e5f74 ata: pata_legacy: fix pdc20230_set_piomode()
    704b92c51b64 net: fec: fix improper use of NETDEV_TX_BUSY
    f30060efcf18 nfc: nfcmrvl: Fix potential memory leak in nfcmrvl_i2c_nci_send()
    aef89b91c7d7 nfc: s3fwrn5: Fix potential memory leak in s3fwrn5_nci_send()
    875082ae8329 RDMA/qedr: clean up work queue on failure in qedr_alloc_resources()
    af8fb5a0600e RDMA/core: Fix null-ptr-deref in ib_core_cleanup()
    bbc5d7b46a72 net: dsa: Fix possible memory leaks in dsa_loop_init()
    925cb538bd58 nfs4: Fix kmemleak when allocate slot failed
    0bc335d0100e NFSv4.1: We must always send RECLAIM_COMPLETE after a reboot
    405309d86021 NFSv4.1: Handle RECLAIM_COMPLETE trunking errors
    25760a41e380 IB/hfi1: Correctly move list in sc_disable()
    6b5c87f9b3f8 RDMA/cma: Use output interface for net_dev check
    a0d938496721 Linux 5.4.223
    a0a2a4bdd101 can: rcar_canfd: rcar_canfd_handle_global_receive(): fix IRQ storm on global FIFO receive
    fc0eecb8b457 net: enetc: survive memory pressure without crashing
    69dd3ad406c4 net/mlx5: Fix possible use-after-free in async command interface
    827e36a031e4 net/mlx5e: Do not increment ESN when updating IPsec ESN state
    7dc6ce3ef20f nh: fix scope used to find saddr when adding non gw nh
    ba6ee85355ad net: ehea: fix possible memory leak in ehea_register_port()
    4175d6381f6f openvswitch: switch from WARN to pr_warn
    0667bb60000d ALSA: aoa: Fix I2S device accounting
    5bdea6745341 ALSA: aoa: i2sbus: fix possible memory leak in i2sbus_add_dev()
    2a47cc2a3d04 PM: domains: Fix handling of unavailable/disabled idle states
    a49e74cc7489 net: ksz884x: fix missing pci_disable_device() on error in pcidev_init()
    e46f699ac23d i40e: Fix flow-type by setting GL_HASH_INSET registers
    e88c2a1e28c5 i40e: Fix VF hang when reset is triggered on another VF
    28c47fd23c20 i40e: Fix ethtool rx-flow-hash setting for X722
    d303dabe7e03 media: videodev2.h: V4L2_DV_BT_BLANKING_HEIGHT should check 'interlaced'
    b4a3a01762ae media: v4l2-dv-timings: add sanity checks for blanking values
    d8f479c777b4 media: vivid: dev->bitmap_cap wasn't freed in all cases
    9d6870949c2c media: vivid: s_fbuf: add more sanity checks
    8e1592d41519 PM: hibernate: Allow hybrid sleep to work with s2idle
    77454bc744e2 can: mscan: mpc5xxx: mpc5xxx_can_probe(): add missing put_clock() in error path
    f79de6451eaf tcp: fix indefinite deferral of RTO with SACK reneging
    38e451696057 net: lantiq_etop: don't free skb when returning NETDEV_TX_BUSY
    97ad240fd9aa net: fix UAF issue in nfqnl_nf_hook_drop() when ops_init() failed
    663682cd3192 kcm: annotate data-races around kcm->rx_wait
    e94395e916b4 kcm: annotate data-races around kcm->rx_psock
    f85e54b4f3e5 amd-xgbe: add the bit rate quirk for Molex cables
    71ba2a95663a amd-xgbe: fix the SFP compliance codes check for DAC cables
    fe3fd27083db x86/unwind/orc: Fix unreliable stack dump with gcov
    fda2d07234a2 net: netsec: fix error handling in netsec_register_mdio()
    24b129aed873 tipc: fix a null-ptr-deref in tipc_topsrv_accept
    758dbcc6fbf2 ALSA: ac97: fix possible memory leak in snd_ac97_dev_register()
    ccaeef126ed1 arc: iounmap() arg is volatile
    fa434a64a4ea drm/msm: Fix return type of mdp4_lvds_connector_mode_valid
    29a6902eb076 media: v4l2: Fix v4l2_i2c_subdev_set_name function documentation
    6f3511eb8654 net: ieee802154: fix error return code in dgram_bind()
    11993652d0b4 mm,hugetlb: take hugetlb_lock before decrementing h->resv_huge_pages
    5a2d7c93d9b9 cgroup-v1: add disabled controller check in cgroup1_parse_param()
    3d056d81b93a xen/gntdev: Prevent leaking grants
    8f589b5c0e7b Xen/gntdev: don't ignore kernel unmapping error
    f45ee2038464 xfs: force the log after remapping a synchronous-writes file
    102de7717d63 xfs: clear XFS_DQ_FREEING if we can't lock the dquot buffer to flush
    03b449a880d1 xfs: finish dfops on every insert range shift iteration
    3d295076ba4e s390/pci: add missing EX_TABLE entries to __pcistg_mio_inuser()/__pcilg_mio_inuser()
    344e1cb0bafe s390/futex: add missing EX_TABLE entry to __futex_atomic_op()
    4f969d0753bd perf auxtrace: Fix address filter symbol name match for modules
    c78b0dc6fb7f kernfs: fix use-after-free in __kernfs_remove
    7a09c64b7da0 mmc: core: Fix kernel panic when remove non-standard SDIO card
    ed7f1ff87a4a drm/msm/hdmi: fix memory corruption with too many bridges
    f649ed0e1b7a drm/msm/dsi: fix memory corruption with too many bridges
    e7348308f668 mac802154: Fix LQI recording
    5385af2f89bc fbdev: smscufx: Fix several use-after-free bugs
    07ef3be6cae3 iio: light: tsl2583: Fix module unloading
    cb972e6d01ef tools: iio: iio_utils: fix digit calculation
    8f1cd9633d1f xhci: Remove device endpoints from bandwidth list when freeing the device
    914704e0d283 mtd: rawnand: marvell: Use correct logic for nand-keep-config
    5d36037b224d usb: xhci: add XHCI_SPURIOUS_SUCCESS to ASM1042 despite being a V0.96 controller
    7b7a0d54333c usb: bdc: change state when port disconnected
    6827b58a957d usb: dwc3: gadget: Don't set IMI for no_interrupt
    9aa025430346 usb: dwc3: gadget: Stop processing more requests on IMI
    035dda2bfd7f USB: add RESET_RESUME quirk for NVIDIA Jetson devices in RCM
    e4045fbcd98e ALSA: au88x0: use explicitly signed char
    d853b4380835 ALSA: Use del_timer_sync() before freeing timer
    caea5b20ef9b can: kvaser_usb: Fix possible completions during init_completion
    5437642f91fd can: j1939: transport: j1939_session_skb_drop_old(): spin_unlock_irqrestore() before kfree_skb()
    5282d4de783b Linux 5.4.222
    59f89518f510 once: fix section mismatch on clang builds

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 9a68f2680c..c748e9afdb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c6d759ae0dff9466208b68335bf502446253585f"
-SRCREV_meta ?= "c917f683a6394ae00f81139ae57ae0112d4b7528"
+SRCREV_machine ?= "cde409b485372556f74ca484023b9b29c9c4033b"
+SRCREV_meta ?= "a384efcff80a36817e159f5b3c3ce5d91de1831f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.221"
+LINUX_VERSION ?= "5.4.224"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 0860d27ed7..e4e45604c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.221"
+LINUX_VERSION ?= "5.4.224"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9f6cf5893f239082af0628843c64bf28712bc3a3"
-SRCREV_machine ?= "602bb6499410dea02c84839a318f9cedea1edbed"
-SRCREV_meta ?= "c917f683a6394ae00f81139ae57ae0112d4b7528"
+SRCREV_machine_qemuarm ?= "8023cf1d720eea113ca49b7876b25d767dac778c"
+SRCREV_machine ?= "61e75f4b3ca1a7c8ad179896ddd546a6f2f01cef"
+SRCREV_meta ?= "a384efcff80a36817e159f5b3c3ce5d91de1831f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index f9326e4686..3c83e3118b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d2e7e83b8c22f5e3ecc668837f3ae0201e042871"
-SRCREV_machine_qemuarm64 ?= "8238c28a0df87b72be92f0809a1dba6b3bc4a816"
-SRCREV_machine_qemumips ?= "5c3d5714e849f7844b82488e828eb00b49c86274"
-SRCREV_machine_qemuppc ?= "01887f1f1117db202e3b5ca06cde1261e7c2d296"
-SRCREV_machine_qemuriscv64 ?= "9b2a3ded50b3a704478170c57808fd76039f02a1"
-SRCREV_machine_qemux86 ?= "9b2a3ded50b3a704478170c57808fd76039f02a1"
-SRCREV_machine_qemux86-64 ?= "9b2a3ded50b3a704478170c57808fd76039f02a1"
-SRCREV_machine_qemumips64 ?= "35b0ae02eb9f6f989e54bd75adf7669f528ef5d9"
-SRCREV_machine ?= "9b2a3ded50b3a704478170c57808fd76039f02a1"
-SRCREV_meta ?= "c917f683a6394ae00f81139ae57ae0112d4b7528"
+SRCREV_machine_qemuarm ?= "5a025566942a9ace3426b926d87249fcb1f297f3"
+SRCREV_machine_qemuarm64 ?= "1ccea77e0b446db75d7fe886a1b74045e0e9a96e"
+SRCREV_machine_qemumips ?= "c22ce9aaf491340881366e151ac73450989e03a5"
+SRCREV_machine_qemuppc ?= "390f256c86e74503d285392b76ab1678f5f57697"
+SRCREV_machine_qemuriscv64 ?= "6abbe5044a60abdec4b84bd15381ac4d6a1e7742"
+SRCREV_machine_qemux86 ?= "6abbe5044a60abdec4b84bd15381ac4d6a1e7742"
+SRCREV_machine_qemux86-64 ?= "6abbe5044a60abdec4b84bd15381ac4d6a1e7742"
+SRCREV_machine_qemumips64 ?= "34cc9064800203ae6b1eb5c96d808e3ed3a359b8"
+SRCREV_machine ?= "6abbe5044a60abdec4b84bd15381ac4d6a1e7742"
+SRCREV_meta ?= "a384efcff80a36817e159f5b3c3ce5d91de1831f"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.221"
+LINUX_VERSION ?= "5.4.224"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


