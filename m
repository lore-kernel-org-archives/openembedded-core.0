Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B5BE6FE3D
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 17:45:57 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.5014.1725644753779123131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 10:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QLkXzIl8;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a803a4f6dfso146722485a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725644753; x=1726249553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvsk5wgotP20S7PpHwR96644PU4c9asrx9mV6DDU9qU=;
        b=QLkXzIl8Ni4JO9F4FkxGhzsmlDEgHUJfYsI3whuI5NXfedpse92SO22A9kAqkARCIW
         rY669BYRYpxT/Dp6VeyaFskSDwG8xNJ5riSgK7ekt+XUGq7gDfZto7UgOgqouaOX+0ev
         6OTV3Yc9F7NaWEIwSeXgEFXVp/fTVQ0ckUdy/CtMQ0+xK6HAtw+W26ZA3iY9xKWd53+J
         Y0w5C95o3oHFU3fltCh6F82jY5QrX6DOe+UyD2QJYj7uCTdxk1QQltk9olAqLlgp4OpS
         9yzEtuumpUm28IXHmrc7ktXj+ikxWcwDtmvc0Y05F2P5OMJPpBHn8v+I2fckBPaasa2V
         9QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644753; x=1726249553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvsk5wgotP20S7PpHwR96644PU4c9asrx9mV6DDU9qU=;
        b=THghtP9tgmzXLpX/eqtE058jC3pPf+ZY9nbxnlLOZBUyKTJnCLZFq1sbrvrmGwF1Xe
         rYvigdeBEjCglGgLn3kpzKS9fNv6JGq4473Lxm61lnXvBfy0hRkiwIy6lN/MTfH81OgV
         Hr/nUNcvlsoPYBO6I7y+IjPXyDrdJ690k5EUnu2OWvZGquwCEsGh5nhSPc9BWF4UEstD
         2/bDA9CAhTaqD06biL4MMc08RwKlGDI6hUviVtiW+IbOrdn/eQ6+IGpr/Pf0UrIXwwcr
         9KC8haUnd2Cv3CoEnVhKRdooLu7vg1GbVHL/duYDXncbLQxhErkM27w7VTLxkrvgAcXB
         rNNA==
X-Gm-Message-State: AOJu0YwP6JxYHy6CYR7EWVjGB2ZrNOtbn7KBjRIXmMh+DlqvXOxD0Bxk
	jFVH8diPNcQliWz/apVPhuk0TAhfQrENFE2oob0k+qDdg9TBTHudf8v1RA==
X-Google-Smtp-Source: AGHT+IFJKeQP4ZrXkgrYRgNai2GKT5L6vLD8QrAuWYcrfK9yklfm770b4KQE3bbWVpOtE8q8sEvp0Q==
X-Received: by 2002:a05:620a:2698:b0:7a1:e4bf:276 with SMTP id af79cd13be357-7a8041ad092mr3091258485a.20.1725644752623;
        Fri, 06 Sep 2024 10:45:52 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98efea9c1sm188589385a.75.2024.09.06.10.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:45:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/6.10: update to v6.10.8
Date: Fri,  6 Sep 2024 13:45:43 -0400
Message-Id: <1fbf3cba5ab716b7e87ca8f8b1fa06e2819ba8fa.1725644584.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725644584.git.bruce.ashfield@gmail.com>
References: <cover.1725644584.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 17:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204285

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.10 to the latest korg -stable release that comprises
the following commits:

    560ed1386571 Linux 6.10.8
    1b46a871e980 nfsd: fix nfsd4_deleg_getattr_conflict in presence of third party lease
    dbec7640c80c apparmor: fix policy_unpack_test on big endian systems
    4b540ec7c004 scsi: aacraid: Fix double-free on probe failure
    c9bcc056ec11 firmware: microchip: fix incorrect error report of programming:timeout on success
    ac36a8178b6b arm64: dts: freescale: imx93-tqma9352-mba93xxla: fix typo
    823c2fe4bc31 arm64: dts: freescale: imx93-tqma9352: fix CMA alloc-ranges
    518581361fbb arm64: dts: imx93: update default value for snps,clk-csr
    ee0eb25a344e arm64: dts: imx8mp-beacon-kit: Fix Stereo Audio on WM8962
    954534c39b77 ARM: dts: omap3-n900: correct the accelerometer orientation
    610466d175c5 arm64: dts: qcom: ipq5332: Fix interrupt trigger type for usb
    095b0001aefd usb: typec: ucsi: Move unregister out of atomic section
    7b17e37345e8 usb: cdnsp: fix for Link TRB with TC
    c26d0f772cdb usb: cdnsp: fix incorrect index in cdnsp_get_hw_deq function
    f6ce7ffadd74 usb: core: sysfs: Unmerge @usb3_hardware_lpm_attr_group in remove_power_attributes()
    9b7fc7da7fac usb: dwc3: st: add missing depopulate in probe error path
    1de989668708 usb: dwc3: st: fix probed platform device ref count on probe error path
    e23f6ad8d110 usb: dwc3: core: Prevent USB core invalid event buffer address access
    839ab67f60e4 usb: dwc3: omap: add missing depopulate in probe error path
    e49fae2bfda2 usb: dwc3: xilinx: add missing depopulate in probe error path
    87670ba8d4ca usb: dwc3: ep0: Don't reset resource alloc flag (including ep0)
    8c92b0a18f8d ARM: dts: imx6dl-yapp43: Increase LED current to match the yapp4 HW design
    bed5a508bc89 arm64: dts: qcom: x1e80100: fix PCIe domain numbers
    f2b87c34d241 arm64: dts: qcom: x1e80100: add missing PCIe minimum OPP
    1d45e82ebc42 arm64: dts: qcom: x1e80100-qcp: fix PCIe4 PHY supply
    49e8a69a666d arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
    01129c2107ab usb: gadget: uvc: queue pump work in uvcg_video_enable()
    e0d580002310 USB: serial: option: add MeiG Smart SRM825L
    699ff210c23b dt-bindings: usb: microchip,usb2514: Fix reference USB device schema
    80eca665ca50 scsi: sd: Ignore command SYNCHRONIZE CACHE error if format in progress
    e40115c33c0d firmware: qcom: scm: Mark get_wq_ctx() as atomic call
    dcc5a83af7bb usb: typec: fsa4480: Relax CHIP_ID check
    695c0e840b79 cdc-acm: Add DISABLE_ECHO quirk for GE HealthCare UI Controller
    943b0e7cc646 soc: qcom: pmic_glink: Fix race during initialization
    bd8f8e7b2bce soc: qcom: pmic_glink: Actually communicate when remote goes down
    62c2d63605ca soc: qcom: cmd-db: Map shared memory as WC, not WB
    6bd8144e8f0f io_uring/kbuf: return correct iovec count from classic buffer peek
    7efb76914940 drm/xe/hwmon: Fix WRITE_I1 param from u32 to u16
    64513d0e546a nfc: pn533: Add poll mod list filling check
    12a366a5d14b net: busy-poll: use ktime_get_ns() instead of local_clock()
    49e1b214f323 drm/amd/display: avoid using null object of framebuffer
    1fa854f65aaf sctp: fix association labeling in the duplicate COOKIE-ECHO case
    1c2ea2326afa tcp: fix forever orphan socket caused by tcp_abort
    612edd35f2a3 gtp: fix a potential NULL pointer dereference
    56354b0a2c24 bonding: change ipsec_lock from spin lock to mutex
    59405f89f799 bonding: extract the use of real_device into local variable
    638dc40ddf0b bonding: implement xdo_dev_state_free and call it after deletion
    ffe237f5bab9 selftests: forwarding: local_termination: Down ports on cleanup
    a42343c88148 selftests: forwarding: no_forwarding: Down ports on cleanup
    2138d574c0a2 netfilter: nf_tables_ipv6: consider network offset in netdev/egress validation
    f0f1ee469399 net_sched: sch_fq: fix incorrect behavior for small weights
    1e9f22cd56a4 hwmon: (pt5161l) Fix invalid temperature reading
    1d6d9b5b1b95 ethtool: check device is present when getting link settings
    3c2f4db462df wifi: iwlwifi: mvm: allow 6 GHz channels in MLO scan
    654297925d0c wifi: iwlwifi: fw: fix wgds rev 3 exact size
    68a7894b00ca wifi: iwlwifi: mvm: take the mutex before running link selection
    ac746de60867 netfilter: nf_tables: restore IP sanity checks for netdev/egress
    fc94b79af387 iommu: Do not return 0 from map_pages if it doesn't do anything
    77812d9283fe Bluetooth: hci_core: Fix not handling hibernation actions
    29a1d9971e38 Bluetooth: btnxpuart: Fix random crash seen while removing driver
    fbdfeeb71fa9 Bluetooth: btnxpuart: Handle FW Download Abort scenario
    14abb139a6e5 cpufreq/amd-pstate-ut: Don't check for highest perf matching on prefcore
    5f5f7366dda8 pktgen: use cpus_read_lock() in pg_net_init()
    0d1064dc06be dmaengine: ti: omap-dma: Initialize sglen after allocation
    be76aa923195 dmaengine: dw: Add memory bus width verification
    93fafe96eaec dmaengine: dw: Add peripheral bus width verification
    b6c833cf1493 phy: xilinx: phy-zynqmp: Fix SGMII linkup failure on resume
    1ece4d9b98bb phy: qcom: qmp-pcie: Fix X1E80100 PCIe Gen4 PHY initialisation
    58fe9445704a dmaengine: dw-edma: Do not enable watermark interrupts for HDMA
    388abe4a1677 dmaengine: dw-edma: Fix unmasking STOP and ABORT interrupts for HDMA
    6fa78e9c4147 soundwire: stream: fix programming slave ports for non-continous port maps
    462678742842 phy: fsl-imx8mq-usb: fix tuning parameter name
    5a8ac1accf72 iommufd: Do not allow creating areas without READ or WRITE
    db8443078a8a cpufreq/amd-pstate: Use topology_logical_package_id() instead of logical_die_id()
    f71ec019257b selinux,smack: don't bypass permissions check in inode_setsecctx hook
    f12424ca2061 fs/nfsd: fix update of inode attrs in CB_GETATTR
    e0b66698a5ae nfsd: fix potential UAF in nfsd4_cb_getattr_release
    1ca0cfdec394 nfsd: hold reference to delegation when updating it for cb_getattr
    45eb9b1e91de cifs: Fix FALLOC_FL_PUNCH_HOLE support
    12a2d1a3dbe7 smb/client: remove unused rq_iter_size from struct smb_rqst
    adbaf41621f7 netfs: Fix interaction of streaming writes with zero-point tracker
    4931ce82f0a6 netfs: Fix missing iterator reset on retry of short read
    e2814004138a netfs: Fix trimming of streaming-write folios in netfs_inval_folio()
    c7c90666e43e netfs: Fix netfs_release_folio() to say no if folio dirty
    875458893425 afs: Fix post-setattr file edit to do truncation correctly
    f4ad910c4431 mm: Fix missing folio invalidation calls during truncation
    ba0b697de298 nfsd: prevent panic for nfsv4.0 closed files in nfs4_show_open
    3205c181b99e pinctrl: starfive: jh7110: Correct the level trigger configuration of iev register
    0197bf772f65 pinctrl: qcom: x1e80100: Fix special pin offsets
    5443bf58bb56 pinctrl: mediatek: common-v2: Fix broken bias-disable for PULL_PU_PD_RSEL_TYPE
    0790732a7482 backing-file: convert to using fops->splice_write
    dd65b324174a nfsd: ensure that nfsd4_fattr_args.context is zeroed out
    2aadeb966cda ASoC: cs-amp-lib: Ignore empty UEFI calibration entries
    7c9d049ba64d ASoC: cs-amp-lib-test: Force test calibration blob entries to be valid
    294e6490bf3a ALSA: hda: cs35l56: Don't use the device index as a calibration index
    40ef8748b68e ASoC: SOF: amd: Fix for acp init sequence
    a241d8ab8a4c ASoC: amd: acp: fix module autoloading
    833dc4e241a5 ASoC: SOF: amd: Fix for incorrect acp error register offsets
    cbcac50af040 ASoC: SOF: amd: move iram-dram fence register programming sequence
    60dec92867d8 pinctrl: qcom: x1e80100: Update PDC hwirq map
    e3e5fed7a3c6 drm/amdgpu: fix eGPU hotplug regression
    f7207c5961a0 drm/amdgpu: Do not wait for MP0_C2PMSG_33 IFWI init in SRIOV
    10081b0b0ed2 drm/xe: prevent UAF around preempt fence
    8831dcab3b6a drm/xe/exec_queue: Rename xe_exec_queue::compute to xe_exec_queue::lr
    97f519fdd70b drm/xe/vm: Simplify if condition
    c25458927f7d drm/xe/display: Make display suspend/resume work on discrete
    fcc9d8e21952 drm/xe: Prepare display for D3Cold
    17e78f43de0c video/aperture: optionally match the device in sysfb_disable()
    c45558414b8f drm/vmwgfx: Disable coherent dumb buffers without 3d
    5c12391ee1ab drm/vmwgfx: Fix prime with external buffers
    d5228d158e4c drm/vmwgfx: Prevent unmapping active read buffers
    e10d26003c16 drm/amdgpu/swsmu: always force a state reprogram on init
    306cf40125c7 drm/amdgpu: align pp_power_profile_mode with kernel docs
    c04665e707bb drm/i915/dp_mst: Fix MST state after a sink reset
    ad3840fc9679 drm/i915/dsi: Make Lenovo Yoga Tab 3 X90F DMI match less strict
    1e93467ef203 drm/v3d: Disable preemption while updating GPU stats
    c507da85e4f8 binfmt_elf_fdpic: fix AUXV size calculation when ELF_HWCAP2 is defined
    6297c575fbad selftests: mptcp: join: check re-re-adding ID 0 endp
    6d631530f49f selftests: mptcp: join: no extra msg if no counter
    71263ce6abfa selftests: mptcp: join: check removing ID 0 endpoint
    a1545eb4ead0 selftests: mptcp: join: cannot rm sf if closed
    a8496ca157fa mptcp: pm: ADD_ADDR 0 is not a new address
    e38f07c38375 mptcp: avoid duplicated SUB_CLOSED events
    119806ae4e46 mptcp: pm: fix ID 0 endp usage after multiple re-creations
    dc2af94eca4a mptcp: pm: do not remove already closed subflows
    7f73d3092354 mptcp: pm: fix RM_ADDR ID for the initial subflow
    42e7e0a752a3 mptcp: pm: send ACK on an active subflow
    3415a1a67a6a mptcp: pm: reset MPC endp ID when re-added
    8f71366795b8 mptcp: pm: skip connecting to already established sf
    69911409d203 mptcp: pm: reuse ID 0 after delete and re-add
    78de3c5ffaf2 mptcp: pr_debug: add missing \n at the end
    8ca5c96a007e mptcp: sched: check both backup in retrans
    2f3efdc9593f mptcp: close subflow when receiving TCP+FIN
    bdef76aab9f3 net: mana: Fix race of mana_hwc_post_rx_wqe and new hwc response
    5432afe3a59f wifi: mwifiex: duplicate static structs used in driver instances
    a177a7accaab wifi: wfx: repair open network AP mode
    4bf612bc3c63 netfs, ceph: Partially revert "netfs: Replace PG_fscache by setting folio->private and marking dirty"
    292151af6add pinctrl: single: fix potential NULL dereference in pcs_get_function()
    c3b47777c3ca pinctrl: rockchip: correct RK3328 iomux width flag for GPIO2-B pins
    b902fb78ab21 smb/client: avoid dereferencing rdata=NULL in smb2_new_read_req()
    ccedb44fc800 btrfs: run delayed iputs when flushing delalloc
    4a3b9e1a8e6c btrfs: fix a use-after-free when hitting errors inside btrfs_submit_chunk()
    408ed08408e7 tpm: ibmvtpm: Call tpm2_sessions_init() to initialize session support
    dd0533b7e151 LoongArch: Add ifdefs to fix LSX and LASX related warnings
    d844655a8210 LoongArch: Remove the unused dma-direct.h
    abcc6503bb4e ALSA: hda/realtek: support HP Pavilion Aero 13-bg0xxx Mute LED
    a914183edea0 ALSA: hda/realtek: Enable mute/micmute LEDs on HP Laptop 14-ey0xxx
    9b87ef20e4fc ALSA: seq: Skip event type filtering for UMP events
    49c0e0819980 erofs: fix out-of-bound access when z_erofs_gbuf_growsize() partially fails
    ed37550d7c51 drm/amdgpu/mes: fix mes ring buffer overflow
    c4386c5293aa drivers: gpu: drm: msm: registers: improve reproducibility
    915a386c7cff qemux86: add configuration symbol to select values
    62df91b21626 sched/isolation: really align nohz_full with rcu_nocbs
    afe643f5802b clear_warn_once: add a clear_warn_once= boot parameter
    7b016793edbf clear_warn_once: bind a timer to written reset value
    89a5c70f2000 clear_warn_once: expand debugfs to include read support
    8014704c527d tools: Remove some options from CLANG_CROSS_FLAGS
    e9ca44556936 libbpf: Fix build warning on ref_ctr_off
    32fe8c972c36 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    a372ac2b798d perf: x86-32: explicitly include <errno.h>
    a5cb41682777 perf: mips64: Convert __u64 to unsigned long long
    ed8ee9f3d1ae perf: fix bench numa compilation
    6dbb2915e8a7 perf: add SLANG_INC for slang.h
    57f78dddfd93 perf: add sgidefs.h to for mips builds
    130f0306cfba perf: change --root to --prefix for python install
    2520efe95341 perf: add 'libperl not found' warning
    45731b6ae676 perf: force include of <stdbool.h>
    ace10f8dec53 fat: Replace prandom_u32() with get_random_u32()
    64797bdca14e fat: don't use obsolete random32 call in namei_vfat
    2442bae1a645 FAT: Added FAT_NO_83NAME
    7561126bce00 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    5c51ab959876 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5869720658c9 aufs6: match exports to functions
    e125467cf228 aufs: adjust for v6.9+
    eebcdc6635bf aufs6: correct do_splice_from prototype
    4c5829036c45 aufs: update remove_page to remove_folio
    e8d889d0f434 aufs: i_op: Add handling for au_pin_hdir_set_owner with RT kernel
    3ecd9203de17 aufs: fix v6.7 kernel build compilation
    5e8ee028dbe2 aufs6: adapt to v6.6 i_op->ctime changes
    1132c330feed aufs6: adapt to v6.6
    d3e4ede69603 aufs6: core
    49ec9271f41d aufs6: standalone
    dcc0978da2dd aufs6: mmap
    80e1609b37e7 aufs6: base
    0dbb3f062420 aufs6: kbuild
    ad51078c5ebf yaffs: fix mtime/itime field access
    e5f1d35d6188 yaffs2: update VFS ctime operations to 6.6+
    dd374461adc7 yaffs2: v6.5 fixups
    f5908785d88d yaffs2: Fix miscalculation of devname buffer length
    d1403f0acfdf yaffs2: convert user_namespace to mnt_idmap
    7dae5463b54f yaffs2: replace bdevname call with sprintf
    92d30df4eb56 yaffs2: convert read_page -> readfolio
    6c895bffdf72 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    6801e7d90255 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    aff012190046 yaffs2: v5.12+ build fixups (not runtime tested)
    fb474842c16e yaffs: include blkdev.h
    fe7d745aac94 yaffs: fix misplaced variable declaration
    bee147b2e533 yaffs2: v5.6 build fixups
    22998f589ec2 yaffs2: fix memory leak when /proc/yaffs is read
    ce7d8084a976 yaffs: add strict check when call yaffs_internal_read_super
    adb7202fda95 yaffs: repair yaffs_get_mtd_device
    2852e5c15d4d yaffs: Fix build failure by handling inode i_version with proper atomic API
    1526802a8147 yaffs2: fix memory leak in mount/umount
    6c7827a16aaa yaffs: Avoid setting any ACL releated xattr
    fa3482815542 Yaffs:check oob size before auto selecting Yaffs1
    aaa4843b73ce fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    48e992af6531 yaffs2: adjust to proper location of MS_RDONLY
    f3af7160d8a0 yaffs2: import git revision b4ce1bb (jan, 2020)
    4add698ed6e8 initramfs: allow an optional wrapper script around initramfs generation
    b619a8d54336 vt/conmakehash: improve reproducibility
    c786186aeef3 tools: use basename to identify file in gen-mach-types
    aa3a8e7ceb6e iwlwifi: select MAC80211_LEDS conditionally
    325db54c4be9 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    23a87c6e13aa defconfigs: drop obselete options
    946e5b78ab94 linux-yocto: Handle /bin/awk issues
    9daee1dba585 uvesafb: provide option to specify timeout for task completion
    f68b8683441a uvesafb: print error message when task timeout occurs
    a1595c6b6017 compiler.h: Undef before redefining __attribute_const__
    8086839613c6 vmware: include jiffies.h
    32e79eb3c169 Resolve jiffies wrapping about arp
    f6fabf91b6f2 nfs: Allow default io size to be configured.
    ad2b29f801e9 check console device file on fs when booting
    5194785d545b mount_root: clarify error messages for when no rootfs found
    78b3498cb59a mconf: fix output of cflags and libraries
    9cc6870708d5 menuconfig,mconf-cfg: Allow specification of ncurses location
    f34088ed9c93 modpost: mask trivial warnings
    4784584582f5 kbuild: exclude meta directory from distclean processing
    73072b5fe25a powerpc: serialize image targets
    a120eb200320 arm: serialize build targets
    51d5719ac05b mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    5155f0bb36f0 cpu/amd: inhibit SMP check for qemux86
    e5a5996ee586 x86_64_defconfig: Fix warnings
    1359db75df0c mips: make current_cpu_data preempt safe
    385edf6090c3 mips: vdso: fix 'jalr $t9' crash in vdso code
    968266397319 mips: Kconfig: add QEMUMIPS64 option
    389ce854fde3 4kc cache tlb hazard: tlbp cache coherency
    9cab61199fa8 malta uhci quirks: make allowance for slow 4k(e)c
    80cae3bd9eea arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    41c82709900f drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    59ef4f151a5e arm64: defconfig: cleanup config options
    c5fb425762ed vexpress: Pass LOADADDR to Makefile
    07a8b544d4e9 arm: ARM EABI socketcall
    574f3ae3d2ca ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.10.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index 5d4f83f11a..925666de23 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "58d857542b4ba97fc3089d167f6351f792693ee0"
-SRCREV_meta ?= "a6ac8bcf5c43b9d0d245cc0f696eceb8a6f1f74d"
+SRCREV_machine ?= "b8e8a499763e5f192540d76dcbed6b545b7dafc5"
+SRCREV_meta ?= "4e1ceedd315bad5ebe5b8eb4df4238047ce2a894"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.10.7"
+LINUX_VERSION ?= "6.10.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index 9c39cb5fc2..b569c4dcf5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.10.inc
 
-LINUX_VERSION ?= "6.10.7"
+LINUX_VERSION ?= "6.10.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
-SRCREV_meta ?= "a6ac8bcf5c43b9d0d245cc0f696eceb8a6f1f74d"
+SRCREV_machine ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
+SRCREV_meta ?= "4e1ceedd315bad5ebe5b8eb4df4238047ce2a894"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index caa5623cdc..b00081b240 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.10/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.10/standard/base"
 KBRANCH:qemumips64 ?= "v6.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2b451aac57bb8b34e116d16c66b56176d8686767"
-SRCREV_machine:qemuarm64 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
-SRCREV_machine:qemuloongarch64 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
-SRCREV_machine:qemumips ?= "c9b841ee5d71bbaad7e70698fe18e8b14fe65f2c"
-SRCREV_machine:qemuppc ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
-SRCREV_machine:qemuriscv64 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
-SRCREV_machine:qemuriscv32 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
-SRCREV_machine:qemux86 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
-SRCREV_machine:qemux86-64 ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
-SRCREV_machine:qemumips64 ?= "53591dc9fd63616ba2b0b62fd9c6880ad03b1623"
-SRCREV_machine ?= "a4ab8f9b849730e47a6faa8bd31c9c76b6bbc133"
-SRCREV_meta ?= "a6ac8bcf5c43b9d0d245cc0f696eceb8a6f1f74d"
+SRCREV_machine:qemuarm ?= "8df31eb72735ccc31dd9c533b69be987bea50ee4"
+SRCREV_machine:qemuarm64 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
+SRCREV_machine:qemuloongarch64 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
+SRCREV_machine:qemumips ?= "95be5bc86ab306b47c92a91bace9737dff60c461"
+SRCREV_machine:qemuppc ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
+SRCREV_machine:qemuriscv64 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
+SRCREV_machine:qemuriscv32 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
+SRCREV_machine:qemux86 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
+SRCREV_machine:qemux86-64 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
+SRCREV_machine:qemumips64 ?= "5fdfe03b830e275d165d1bc655dd4a7b9072aecc"
+SRCREV_machine ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
+SRCREV_meta ?= "4e1ceedd315bad5ebe5b8eb4df4238047ce2a894"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "24873d2e5fe32f4635cf8406ff3b8d16f6e47505"
+SRCREV_machine:class-devupstream ?= "560ed1386571c54598065fb9e80ff54855e2236d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.10/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.10.7"
+LINUX_VERSION ?= "6.10.8"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


