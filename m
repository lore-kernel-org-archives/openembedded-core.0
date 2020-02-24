Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9F2E160685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 20:02:05 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id o28so9802457qkj.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 12:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hS8/yV4zRt6Q5dyNHZ/zfgbJyqeSm13AJwnlb4DHHdE=;
	b=cDc+FFCffMcHKzkEuAQBnweOCqe9x9pCznvIo3/TIEV8rNmGgUJaZNypSmZDJk9BI1
	QVYfF1NqXdphB9DT2GfZsCQsSu2RVcdRN3X+Qps4H9scXEkTx9DyDak7WK+6QgdwJYrA
	B9+ABwP01deVajW2hdYtuVZ2ZJnfAoH598JOnGOP1g6LqqYyGuv3CgLznDGDNburlFIU
	WDavqXRskYGEjS2bLuOtWWjzcYB9KR288lHzncZTwDMt2yRMnuzxwIRulyVeDx8yiBvU
	szelAMoyLAAIrroNsEegX25/epuirib3kwM7+5AEQsW6nhjMYqoLQDZ5S02J8wCw/ZWM
	kCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hS8/yV4zRt6Q5dyNHZ/zfgbJyqeSm13AJwnlb4DHHdE=;
	b=jJBHDq1kCR+cqJ0d+DlHcuOChrpmyCRD55FxN90Fdki/WTIHRfwnbd40dvIF0Cokfx
	VnUHSCTsDPYio9Kx2CjHuon5VMWF3VtHKyK2dcUqFS7+nFEAbFD2nG15A7MlRNzPofpv
	NmugZbpDzwklBg2O+mcBofPvofIhzJsE90pLDIhfQHnE2We3bf7KNy/lJeklNifX84jd
	HMn7o9r/RbpVSGKWEoPZjdAbk2gm3RvInfSYz5vVlgEX6qpZ0daqCzRqCC53wZQE4F4e
	ovTqCP3cHrzv+sIaqbZvUB2ipYh9QGUagByvcswCBNnVT6MD2EQ89GN7LKOkzqN7jeO2
	IEDg==
X-Gm-Message-State: APjAAAVbs7GfnLhTJhSvLnLlJB8UZead+AsYpjGIGNxFNnTBDpG4ujcD
	S1/GiZD/dardILvLv4DnQ1qpDbOKbtKsxQ==
X-Google-Smtp-Source: APXvYqxC4gilSQgiPw4nSfB+Q4FGy/rgxhLFL5j5ogMEB8d83B1rDjZpkzNCE9lmNIwG3GoMjuOSog==
X-Received: by 2002:a05:620a:6d4:: with SMTP id
	20mr51912891qky.81.1582574525708; 
	Mon, 24 Feb 2020 12:02:05 -0800 (PST)
Received: from localhost.localdomain
	(CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.255.134]) by smtp.gmail.com with ESMTPSA id
	c25sm6189322qkc.12.2020.02.24.12.02.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 12:02:04 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon, 24 Feb 2020 15:02:02 -0500
Message-Id: <20200224200202.61426-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.2: update to v5.2.32
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
X-List-Received-Date: Mon, 24 Feb 2020 20:02:05 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    ef3886a722c8 Linux 5.2.32
    ce5a5accc87e dm thin: fix use-after-free in metadata_pre_commit_callback
    9aafc6574336 cifs: Fix memory allocation in __smb2_handle_cancelled_cmd()
    e177f6d8471e drm/amd/display: add default clocks if not able to fetch them
    dba8b53f1ef4 drm/dp_mst: Correct the bug in drm_dp_update_payload_part1()
    bd427585578d drm/radeon: fix r1xx/r2xx register checker for POT textures
    b56603ead990 drm/i915/fbc: Disable fbc by default on all glk+
    5ce9d8bdf796 drm/nouveau/kms/nv50-: Limit MST BPC to 8
    86bdcc48feb0 drm/nouveau/kms/nv50-: Store the bpc we're using in nv50_head_atom
    b039a9b6d8f4 drm/nouveau/kms/nv50-: Call outp_atomic_check_view() before handling PBN
    03e122dbc136 scsi: qla2xxx: Fix incorrect SFUB length used for Secure Flash Update MB Cmd
    8bf5409573de scsi: qla2xxx: Correctly retrieve and interpret active flash region
    7af719a2ca84 scsi: qla2xxx: Change discovery state before PLOGI
    1fea09aa4b42 scsi: qla2xxx: Added support for MPI and PEP regions for ISP28XX
    30205f999d12 scsi: qla2xxx: Initialize free_work before flushing it
    39ec6bc75116 scsi: qla2xxx: Ignore NULL pointer in tcm_qla2xxx_free_mcmd
    1f08dd5fa5c5 scsi: iscsi: Fix a potential deadlock in the timeout handler
    42a2fbbc708f dm thin: Flush data device before committing metadata
    56d35c21552b dm thin metadata: Add support for a pre-commit callback
    d658f6349a2f dm btree: increase rebalance threshold in __rebalance2()
    3aca6fce0d4e dm mpath: remove harmful bio-based optimization
    2363f92cde9c drm: meson: venc: cvbs: fix CVBS mode matching
    2878bba5052a dma-buf: Fix memory leak in sync_file_merge()
    b10d7f86b5ca vfio/pci: call irq_bypass_unregister_producer() before freeing irq
    099085c85deb ARM: tegra: Fix FLOW_CTLR_HALT register clobbering by tegra_resume()
    674f30df2798 ARM: dts: s3c64xx: Fix init order of clock providers
    7fe7993bd757 cifs: Fix retrieval of DFS referrals in cifs_mount()
    6fef05311f57 CIFS: Fix NULL pointer dereference in mid callback
    42d37a87a332 CIFS: Do not miss cancelled OPEN responses
    ca8deb792b01 CIFS: Close open handle after interrupted close
    df192003fb6b CIFS: Respect O_SYNC and O_DIRECT flags during reconnect
    40ae22555ce3 cifs: Don't display RDMA transport on reconnect
    969925ff652b cifs: smbd: Return -ECONNABORTED when trasnport is not in connected state
    82fe0b779a89 cifs: smbd: Return -EINVAL when the number of iovs exceeds SMBDIRECT_MAX_SGE
    d88fc76297a7 cifs: smbd: Add messages on RDMA session destroy and reconnection
    f1bede222a44 cifs: smbd: Only queue work for error recovery on memory registration
    118c2599caf3 cifs: smbd: Return -EAGAIN when transport is reconnecting
    2c3c6e2691ff rpmsg: glink: Free pending deferred work on remove
    7286d52aa88c rpmsg: glink: Don't send pending rx_done during remove
    eed61c8c6667 rpmsg: glink: Fix rpmsg_register_device err handling
    00b748a63488 rpmsg: glink: Put an extra reference during cleanup
    ebb78ad8b431 rpmsg: glink: Fix use after free in open_ack TIMEOUT case
    b3f09043fc81 rpmsg: glink: Fix reuse intents memory leak issue
    5bfb2ef7a181 rpmsg: glink: Set tail pointer to 0 at end of FIFO
    63045fa07fba xtensa: fix syscall_set_return_value
    9247f95643ef xtensa: fix TLB sanity checker
    c848ea0969ce gfs2: fix glock reference problem in gfs2_trans_remove_revoke
    eb30a9e18f47 xtensa: use MEMBLOCK_ALLOC_ANYWHERE for KASAN shadow map
    adff286a3be5 PCI: Apply Cavium ACS quirk to ThunderX2 and ThunderX3
    f28f30c5255c PCI: rcar: Fix missing MACCTLR register setting in initialization sequence
    cb5cb799bf0b PCI: Do not use bus number zero from EA capability
    d291c94f8e57 PCI/MSI: Fix incorrect MSI-X masking on resume
    eb24be2871ad PCI: Fix Intel ACS quirk UPDCR register address
    06ad330304d2 PCI: pciehp: Avoid returning prematurely from sysfs requests
    5d558c8b1439 PCI/PM: Always return devices to D0 when thawing
    84dfe86a3851 PCI/switchtec: Read all 64 bits of part_event_bitmap
    0db244d3995f mmc: block: Add CMD13 polling for MMC IOCTLS with R1B response
    845b2cbece34 mmc: block: Make card_busy_detect() a bit more generic
    5db0e71cbee1 libertas: make lbs_ibss_join_existing() return error code on rates overflow
    36e460a8c861 libertas: don't exit from lbs_ibss_join_existing() with RCU read lock held
    2aabb3fcd7fe libertas: Fix two buffer overflows at parsing bss descriptor
    8866a53c5e7a Linux 5.2.31
    33a9ecf23bdb hsr: fix a NULL pointer dereference in hsr_dev_xmit()
    c5eba532e308 gre: refetch erspan header from skb->data after pskb_may_pull()
    8477c46262fa tcp: Protect accesses to .ts_recent_stamp with {READ,WRITE}_ONCE()
    d46e87f84fd4 tcp: tighten acceptance of ACKs not matching a child socket
    06b27e9e4496 tcp: fix rejected syncookies due to stale timestamps
    d3ce127be5c7 net: ipv6_stub: use ip6_dst_lookup_flow instead of ip6_dst_lookup
    31ecfe259fba net: ipv6: add net argument to ip6_dst_lookup_flow
    1a45655b78c5 net/mlx5e: Query global pause state before setting prio2buffer
    10ac0045c8a7 tipc: fix ordering of tipc module init and exit routine
    f8089e38f286 tcp: md5: fix potential overestimation of TCP option space
    c9b8428b8b42 openvswitch: support asymmetric conntrack
    ab45bc5d7c6f net/tls: Fix return values to avoid ENOTSUPP
    aaa20d4352a1 net: thunderx: start phy before starting autonegotiation
    aebf8e234674 net: sched: fix dump qlen for sch_mq/sch_mqprio with NOLOCK subqueues
    876e02c6b8de net: ethernet: ti: cpsw: fix extra rx interrupt
    75b099157e3b net: dsa: fix flow dissection on Tx path
    b8c2a07d7fc9 net: bridge: deny dev_set_mac_address() when unregistering
    ef141fca118c mqprio: Fix out-of-bounds access in mqprio_dump
    a0484dba9932 inet: protect against too small mtu values.
    7d923144ef6e net_sched: validate TCA_KIND attribute in tc_chain_tmplt_add()
    c0f777b6c28d SUNRPC: Fix another issue with MIC buffer space
    cce35a47eb7c raid5: need to set STRIPE_HANDLE for batch head
    2b15565d1a62 workqueue: Fix missing kfree(rescuer) in destroy_workqueue()
    2fb67c1da0c0 blk-mq: make sure that line break can be printed
    588d5a85b106 ext4: fix a bug in ext4_wait_for_tail_page_commit
    87b234005394 splice: only read in as much information as there is pipe buffer space
    de86c841c81b rtc: disable uie before setting time and enable after
    d4e7102cc326 mm/shmem.c: cast the type of unmap_start to u64
    922a48c3e94d s390/kaslr: store KASLR offset for early dumps
    3b7d69248f06 s390/smp,vdso: fix ASCE handling
    546e9a689d3e firmware: qcom: scm: Ensure 'a0' status code is treated as signed
    a9b6310e93a4 ext4: work around deleting a file with i_nlink == 0 safely
    609a4e56145d mm: memcg/slab: wait for !root kmem_cache refcnt killing on root kmem_cache destruction
    3d5c91034234 mfd: rk808: Fix RK818 ID template
    fbac2f7aa1c3 mm, memfd: fix COW issue on MAP_PRIVATE and F_SEAL_FUTURE_WRITE mappings
    118197756683 powerpc: Fix vDSO clock_getres()
    9ba5c6dcb3b7 powerpc: Avoid clang warnings around setjmp and longjmp
    7c36247732a2 omap: pdata-quirks: remove openpandora quirks for mmc3 and wl1251
    1eff30510478 omap: pdata-quirks: revert pandora specific gpiod additions
    5dbe853560e4 iio: ad7949: fix channels mixups
    7df6007288fd iio: ad7949: kill pointless "readback"-handling code
    109dbc91c5a8 iio: imu: st_lsm6dsx: fix ODR check in st_lsm6dsx_write_raw
    6305866e630c iio: imu: st_lsm6dsx: move odr_table in st_lsm6dsx_sensor_settings
    9073b0be6589 scsi: lpfc: Fix bad ndlp ptr in xri aborted handling
    13f83b3a2688 reiserfs: fix extended attributes on the root directory
    e026fc523a75 ext4: Fix credit estimate for final inode freeing
    b09b4d152aa2 quota: fix livelock in dquot_writeback_dquots
    513bcf5ee8e0 seccomp: avoid overflow in implicit constant conversion
    ae57738ec38a ext2: check err when partial != NULL
    b7c24d8c06b8 quota: Check that quota is not dirty before release
    42e495b46f80 video/hdmi: Fix AVI bar unpack
    6739872abdfd powerpc/xive: Skip ioremap() of ESB pages for LSI interrupts
    7d55c5e73263 powerpc: Allow flush_icache_range to work across ranges >4GB
    be0cd7e9b258 powerpc/xive: Prevent page fault issues in the machine crash handler
    99d2164e4865 powerpc: Allow 64bit VDSO __kernel_sync_dicache to work across ranges >4GB
    f0f08beb3fa0 stm class: Lose the protocol driver when dropping its reference
    c0919315b735 ppdev: fix PPGETTIME/PPSETTIME ioctls
    86de25118e9c RDMA/core: Fix ib_dma_max_seg_size()
    f5aae41d4eac ARM: dts: omap3-tao3530: Fix incorrect MMC card detection GPIO polarity
    5cc72ba36683 mmc: host: omap_hsmmc: add code for special init of wl1251 to get rid of pandora_wl1251_init_card
    f15fa36b9c6b pinctrl: samsung: Fix device node refcount leaks in S3C24xx wakeup controller init
    da352a4b5493 pinctrl: samsung: Fix device node refcount leaks in init code
    738e8de6b8d2 pinctrl: samsung: Fix device node refcount leaks in S3C64xx wakeup controller init
    53149343fc98 pinctrl: samsung: Fix device node refcount leaks in Exynos wakeup controller init
    43cb61f4878b pinctrl: samsung: Add of_node_put() before return in error path
    72f6c3180468 pinctrl: armada-37xx: Fix irq mask access in armada_37xx_irq_set_type()
    e264e3ae1165 pinctrl: rza2: Fix gpio name typos
    61a4f44dc075 ACPI: PM: Avoid attaching ACPI PM domain to certain devices
    0a041ba2564a ACPI: bus: Fix NULL pointer check in acpi_bus_get_private_data()
    b56eca6bf2e4 ACPI: OSL: only free map once in osl.c
    2ba38c34447d ACPI / hotplug / PCI: Allocate resources directly under the non-hotplug bridge
    0a4cab60dde2 ACPI: LPSS: Add dmi quirk for skipping _DEP check for some device-links
    487afadea2fd ACPI: LPSS: Add LNXVIDEO -> BYT I2C1 to lpss_device_links
    9af85668040a ACPI: LPSS: Add LNXVIDEO -> BYT I2C7 to lpss_device_links
    e055c1890429 ACPI / utils: Move acpi_dev_get_first_match_dev() under CONFIG_ACPI
    5eac1d4c2450 ALSA: oxfw: fix return value in error path of isochronous resources reservation
    33e6efad9334 cpufreq: powernv: fix stack bloat and hard limit on number of CPUs
    7240e6e25891 PM / devfreq: Lock devfreq in trans_stat_show
    92741be9a736 intel_th: pci: Add Tiger Lake CPU support
    69d1163cd0f4 intel_th: pci: Add Ice Lake CPU support
    5ac267cabcd9 intel_th: Fix a double put_device() in error path
    a3784ad079c6 powerpc/perf: Disable trace_imc pmu
    08ded9339d52 cpuidle: teo: Fix "early hits" handling for disabled idle states
    30b23caa5deb cpuidle: teo: Consider hits and misses metrics of disabled states
    0df48241b6ab cpuidle: teo: Rename local variable in teo_select()
    db302e3bb162 cpuidle: teo: Ignore disabled idle states that are too deep
    ade564919a0c cpuidle: Do not unset the driver if it is there already
    f2a7f16026f9 media: cec.h: CEC_OP_REC_FLAG_ values were swapped
    342c964a9895 media: radio: wl1273: fix interrupt masking on release
    780fe9f19c38 media: bdisp: fix memleak on release
    348cecf72f8e s390/mm: properly clear _PAGE_NOEXEC bit when it is not supported
    9ec8636ef00a ar5523: check NULL before memcpy() in ar5523_cmd()
    6fc971f1d831 wil6210: check len before memcpy() calls
    ba29035eb4bc cgroup: pids: use atomic64_t for pids->limit
    873f0623fcbe blk-mq: avoid sysfs buffer overflow with too many CPU cores
    758af427f60f md: improve handling of bio with REQ_PREFLUSH in md_flush_request()
    3882ad8fadb0 ASoC: fsl_audmix: Add spin lock to protect tdms
    141bba39e422 ASoC: Jack: Fix NULL pointer dereference in snd_soc_jack_report
    a99f0045c434 ASoC: rt5645: Fixed typo for buddy jack support.
    1ecdb55a6de6 ASoC: rt5645: Fixed buddy jack support.
    d78e1588f356 workqueue: Fix pwq ref leak in rescuer_thread()
    86226c42d8f7 workqueue: Fix spurious sanity check failures in destroy_workqueue()
    7b79872cb160 dm zoned: reduce overhead of backing device checks
    b7c4feffa872 dm writecache: handle REQ_FUA
    fa700de0abd2 hwrng: omap - Fix RNG wait loop timeout
    903867fe506a ovl: relax WARN_ON() on rename to self
    8b2e7fec9f26 ovl: fix corner case of non-unique st_dev;st_ino
    c73fe5396edf ovl: fix lookup failure on multi lower squashfs
    15fe8b7f7962 lib: raid6: fix awk build warnings
    b8f32a0e26fb rtlwifi: rtl8192de: Fix missing enable interrupt flag
    0917a96e2d3a rtlwifi: rtl8192de: Fix missing callback that tests for hw release of buffer
    32c6c1de1c05 rtlwifi: rtl8192de: Fix missing code to retrieve RX buffer address
    f1da748f078d btrfs: record all roots for rename exchange on a subvol
    017f00a09704 Btrfs: send, skip backreference walking for extents with many references
    f08e9d661548 btrfs: Remove btrfs_bio::flags member
    f01ca4344ffe btrfs: Avoid getting stuck during cyclic writebacks
    07383f0fced7 Btrfs: fix negative subv_writers counter and data space leak after buffered write
    69608bab8b1b Btrfs: fix metadata space leak on fixup worker failure to set range as delalloc
    6bab2f18b421 btrfs: use refcount_inc_not_zero in kill_all_nodes
    b703482bc2ec btrfs: check page->mapping when loading free space cache
    11b102bc593e iwlwifi: pcie: fix support for transmitting SKBs with fraglist
    7a569d85c92b usb: typec: fix use after free in typec_register_port()
    254d37011ab2 phy: renesas: rcar-gen3-usb2: Fix sysfs interface of "role"
    26593100f6a1 usb: dwc3: ep0: Clear started flag on completion
    d2e949f9d6c5 usb: dwc3: gadget: Clear started flag for non-IOC
    077399428186 usb: dwc3: gadget: Fix logical condition
    545da1614800 usb: dwc3: pci: add ID for the Intel Comet Lake -H variant
    393edc8f15ca virtio-balloon: fix managed page counts when migrating pages between zones
    15c579c3d104 virt_wifi: fix use-after-free in virt_wifi_newlink()
    3891c22e7b74 mtd: rawnand: Change calculating of position page containing BBM
    175a15f4c288 mtd: spear_smi: Fix Write Burst mode
    5738119a60ed brcmfmac: disable PCIe interrupts before bus reset
    ab35b8b9a235 EDAC/altera: Use fast register IO for S10 IRQs
    deda3f6b06dc tpm: add check after commands attribs tab allocation
    ebb7dae402e3 usb: mon: Fix a deadlock in usbmon between mmap and read
    650d955bc548 usb: core: urb: fix URB structure initialization function
    d54daa869ed5 USB: adutux: fix interface sanity check
    3e4a4cb54c04 usb: roles: fix a potential use after free
    14fa9bcb6a07 USB: serial: io_edgeport: fix epic endpoint lookup
    174f3783b4f0 USB: idmouse: fix interface sanity checks
    6facde75d1c8 USB: atm: ueagle-atm: add missing endpoint check
    b4972eba6831 iio: adc: ad7124: Enable internal reference
    b609ee0b3024 iio: adc: ad7606: fix reading unnecessary data from device
    bc27d17532dd iio: imu: inv_mpu6050: fix temperature reporting using bad unit
    edfeae1a5a70 iio: humidity: hdc100x: fix IIO_HUMIDITYRELATIVE channel reporting
    76a78a37799d iio: adis16480: Fix scales factors
    a8f0c5837cca iio: adis16480: Add debugfs_reg_access entry
    a02348d262b3 ARM: dts: pandora-common: define wl1251 as child node of mmc3
    43a05d85e421 interconnect: qcom: sdm845: Walk the list safely on node removal
    3ea35e60e8c8 xhci: make sure interrupts are restored to correct state
    0df691c29da9 xhci: handle some XHCI_TRUST_TX_LENGTH quirks cases as default behaviour.
    d10974513d17 xhci: Increase STS_HALT timeout in xhci_suspend()
    40ccc7fb3125 xhci: fix USB3 device initiated resume race with roothub autosuspend
    8f015d20b7d5 xhci: Fix memory leak in xhci_add_in_port()
    de53955ea0d3 usb: xhci: only set D3hot for pci device
    13d723a6c22c staging: gigaset: add endpoint-type sanity check
    ed9145e7d4a4 staging: gigaset: fix illegal free on probe errors
    a193faef6209 staging: gigaset: fix general protection fault on probe
    a48994561cab staging: vchiq: call unregister_chrdev_region() when driver registration fails
    38beaaec130c staging: rtl8712: fix interface sanity check
    238af85b081b staging: rtl8188eu: fix interface sanity check
    9517a9f133fd binder: fix incorrect calculation for num_valid
    a65c5b1d8762 usb: host: xhci-tegra: Correct phy enable sequence
    0da1ca92c578 usb: Allow USB device to be warm reset in suspended state
    fa74b02fa20f USB: documentation: flags on usb-storage versus UAS
    46f840a92233 USB: uas: heed CAPACITY_HEURISTICS
    9cc58d6fb42e USB: uas: honor flag to avoid CAPACITY16
    19ccc7083566 media: venus: remove invalid compat_ioctl32 handler
    6f4b7b312148 scsi: zfcp: trace channel log even for FCP command responses
    6975c6beb5f0 usb: gadget: pch_udc: fix use after free
    6f10fa4a113c rpmsg: char: release allocated memory
    f01eedaf4e09 mac80211: Do not send Layer 2 Update frame before authorization
    38b2d9bb7b57 libertas: fix a potential NULL pointer dereference
    2789290efc0b mwifiex: Fix heap overflow in mmwifiex_process_tdls_action_frame()
    fd820abb0696 Linux 5.2.30
    10f017c26642 spi: dw: Correct handling of native chipselect
    9e79f5ae512f spi: cadence: Correct handling of native chipselect
    db91ee312ada drm/sun4i: tcon: Set RGB DCLK min. divider based on hardware model
    9eeb986b4809 clk: samsung: exynos5420: Keep top G3D clocks enabled
    99232a68c619 block: fix "check bi_size overflow before merge"
    f54449c00a10 EDAC/ghes: Do not warn when incrementing refcount on 0
    4f18ed319605 ALSA: hda: Fix regression by strip mask fix
    a550c8d05657 io_uring: ensure req->submit is copied when req is deferred
    7b57a96cf3b7 Input: Fix memory leak in psxpad_spi_probe
    a006a5ae6b91 ALSA: hda: hdmi - fix pin setup on Tigerlake
    85435506e9e0 EDAC/ghes: Fix locking and memory barrier issues
    81a005d25b01 watchdog: aspeed: Fix clock behaviour for ast2600
    c3f6c163ac89 md/raid0: Fix an error message in raid0_make_request()
    e90488c1856c ALSA: hda - Fix pending unsol events at shutdown
    ac5a40962daf KVM: x86: fix out-of-bounds write in KVM_GET_EMULATED_CPUID (CVE-2019-19332)
    949540e93943 binder: Handle start==NULL in binder_update_page_range()
    75a11437a803 binder: Prevent repeated use of ->mmap() via NULL mapping
    e0a0299acecb binder: Fix race between mmap() and binder_alloc_print_pages()
    ba5d71130445 thermal: Fix deadlock in thermal thermal_zone_device_check
    cf162b1f1d6f iomap: Fix pipe page leakage during splicing
    1ede48d1d47e RDMA/qib: Validate ->show()/store() callbacks before calling them
    6df074625c15 can: ucan: fix non-atomic allocation in completion handler
    1233eadb99a9 spi: Fix NULL pointer when setting SPI_CS_HIGH for GPIO CS
    cad0ca361138 spi: Fix SPI_CS_HIGH setting when using native and GPIO CS
    25ac2d29646a spi: atmel: Fix CS high support
    efd56e6b1fbd spi: stm32-qspi: Fix kernel oops when unbinding driver
    dfbd2a22d8b1 spi: spi-fsl-qspi: Clear TDH bits in FLSHCR register
    d7e9115f21e0 spi: spi-fsl-qspi: change i.MX7D RX FIFO size
    76cde0d7ff39 crypto: ecdh - fix big endian bug in ECC library
    36759ce37925 crypto: ccp - fix uninitialized list head
    8ba8fa9fc2db crypto: geode-aes - switch to skcipher for cbc(aes) fallback
    86a44e8938be crypto: af_alg - cast ki_complete ternary op to int
    9ff009403999 crypto: atmel-aes - Fix IV handling when req->nbytes < ivsize
    2cbf74169383 crypto: crypto4xx - fix double-free in crypto4xx_destroy_sdr
    f6981b364dae KVM: x86: Grab KVM's srcu lock when setting nested state
    c08ddad72e7b KVM: x86: Remove a spurious export of a static function
    317fd0a0c93d KVM: x86: fix presentation of TSX feature in ARCH_CAPABILITIES
    7f70f6380882 KVM: x86: do not modify masked bits of shared MSRs
    6384ad0ab29b KVM: arm/arm64: vgic: Don't rely on the wrong pending table
    bdcecb6dd8e8 KVM: nVMX: Always write vmcs02.GUEST_CR3 during nested VM-Enter
    3600a4189d12 KVM: PPC: Book3S HV: XIVE: Set kvm->arch.xive when VPs are allocated
    34e8d4a0ef05 KVM: PPC: Book3S HV: XIVE: Fix potential page leak on error path
    4ebdbf4ff503 KVM: PPC: Book3S HV: XIVE: Free previous EQ page when setting up a new one
    cc73381579f9 arm64: dts: exynos: Revert "Remove unneeded address space mapping for soc node"
    1d19cc75f715 drm/i810: Prevent underflow in ioctl
    16f54bf33fce drm: damage_helper: Fix race checking plane->state->fb
    20a0047cdca4 drm/msm: fix memleak on release
    6c34f27046e3 jbd2: Fix possible overflow in jbd2_log_space_left()
    5b1ab9f1a2c0 kernfs: fix ino wrap-around detection
    910116ce4349 nfsd: restore NFSv3 ACL support
    6589961e5ec7 nfsd: Ensure CLONE persists data and metadata changes to the target file
    574498a02845 tty: vt: keyboard: reject invalid keycodes
    c75342d33dd5 CIFS: Fix SMB2 oplock break processing
    c8c867906145 CIFS: Fix NULL-pointer dereference in smb2_push_mandatory_locks
    2199093ff906 x86/PCI: Avoid AMD FCH XHCI USB PME# from D0 defect
    4d34c238f6ee x86/mm/32: Sync only to VMALLOC_END in vmalloc_sync_all()
    64a582385b92 media: rc: mark input device as pointing stick
    70fd4e1972e8 coresight: etm4x: Fix input validation for sysfs.
    55c0be64071e Input: goodix - add upside-down quirk for Teclast X89 tablet
    2405495a00f8 Input: synaptics-rmi4 - don't increment rmiaddr for SMBus transfers
    868c29a7efd0 Input: synaptics-rmi4 - re-enable IRQs in f34v7_do_reflash
    0e606e3626e6 Input: synaptics - switch another X1 Carbon 6 to RMI/SMbus
    94adc53b2c47 ALSA: hda: Modify stream stripe mask only when needed
    a527c3df9f54 ALSA: hda - Add mute led support for HP ProBook 645 G4
    accc2add3da3 ALSA: pcm: oss: Avoid potential buffer overflows
    55f6418b7ae3 ALSA: hda/realtek - Dell headphone has noise on unmute for ALC236
    bbad17075fe3 ALSA: hda/realtek - Enable the headset-mic on a Xiaomi's laptop
    fcfb4bce22aa ALSA: hda/realtek - Enable internal speaker of ASUS UX431FLC
    83753976cfae fuse: verify attributes
    a6f6439eb10f fuse: verify nlink
    31aa652b9a69 i2c: core: fix use after free in of_i2c_notify
    92084c0b356d net: ep93xx_eth: fix mismatch of request_mem_region in remove
    f75cb980f0ab afs: Fix race in commit bulk status fetch
    26167b5cf5df net: hns3: fix ETS bandwidth validation bug
    037e0cbe8863 net: hns3: reallocate SSU' buffer size when pfc_en changes
    423f97775629 ravb: implement MTU change while device is up
    ba49aa6bccbb rsxx: add missed destroy_workqueue calls in remove
    6dbf3b9cc169 selftests: kvm: fix build with glibc >= 2.30
    334204bdbd89 drm/sun4i: tcon: Set min division of TCON0_DCLK to 1.
    d2001cf2e8d3 x86/resctrl: Fix potential lockdep warning
    7bf14c3c120b ALSA: pcm: Fix stream lock usage in snd_pcm_period_elapsed()
    57dbe72b9638 perf/core: Consistently fail fork on allocation failures
    24a8ce6100ab sched/pelt: Fix update of blocked PELT ordering
    cadf46055b6f sched/core: Avoid spurious lock dependencies
    b8a654dde72b Input: cyttsp4_core - fix use after free bug
    9bcb8316e536 block: check bi_size overflow before merge
    f05d37196a77 xfrm: release device reference for invalid state
    e630f0eab8b3 NFC: nxp-nci: Fix NULL pointer dereference after I2C communication error
    14f8f24bfcbc ALSA: hda: Add Cometlake-S PCI ID
    85deda956139 ecryptfs: fix unlink and rmdir in face of underlying fs modifications
    7a7b13483234 audit_get_nd(): don't unlock parent too early
    6f26d186c431 exportfs_decode_fh(): negative pinned may become positive without the parent locked
    d5a9bd7dc9c2 cgroup: don't put ERR_PTR() into fc->root
    5490ae827b29 iwlwifi: pcie: don't consider IV len in A-MSDU
    5bc1282dfb21 RDMA/hns: Correct the value of srq_desc_size
    9b0df7c7e42c RDMA/hns: Correct the value of HNS_ROCE_HEM_CHUNK_LEN
    bf7d03571100 MIPS: SGI-IP27: fix exception handler replication
    b578c711e5e7 autofs: fix a leak in autofs_expire_indirect()
    81559b396efa aio: Fix io_pgetevents() struct __compat_aio_sigset layout
    03bd68a92f82 signal: simplify set_user_sigmask/restore_user_sigmask
    88300b370dbc serial: ifx6x60: add missed pm_runtime_disable
    06eb5d963912 serial: serial_core: Perform NULL checks for break_ctl ops
    c811b133b3e7 serial: pl011: Fix DMA ->flush_buffer()
    d451358ffe85 tty: serial: msm_serial: Fix flow control
    5b10978724e0 tty: serial: fsl_lpuart: use the sg count from dma_map_sg
    c38c3a52315f usb: gadget: u_serial: add missing port entry locking
    b30c295d649b time: Zero the upper 32-bits in __kernel_timespec on 32-bit
    9f06fb5da07e lp: fix sparc64 LPSETTIMEOUT ioctl
    068341cb7952 sparc64: implement ioremap_uc
    932b771c65b6 arm64: tegra: Fix 'active-low' warning for Jetson TX1 regulator
    edc3ff235784 net: fec: fix clock count mis-match
    ed9b79600a5d platform/x86: hp-wmi: Fix ACPI errors caused by passing 0 as input size
    952328f5193b platform/x86: hp-wmi: Fix ACPI errors caused by too small buffer
    da62cf911005 HID: core: check whether Usage Page item is after Usage ID items
    fb85a234fc39 tipc: fix link name length check
    0867e153690e selftests: bpf: test_sockmap: handle file creation failures gracefully
    cd73a77a2288 net/tls: use sg_next() to walk sg entries
    55c1ea6758d8 net/tls: remove the dead inplace_crypto code
    c824b8c9957b net: skmsg: fix TLS 1.3 crash with full sk_msg
    45c795cbee84 net: sockmap: use bitmap for copy info
    c1c89460bda2 net/tls: free the record on encryption error
    1468022cc8f2 net/tls: take into account that bpf_exec_tx_verdict() may free the record
    a3157970686f openvswitch: remove another BUG_ON()
    bacb11535532 openvswitch: drop unneeded BUG_ON() in ovs_flow_cmd_build_info()
    744916544dba sctp: cache netns in sctp_ep_common
    f4312b9ba27c sctp: Fix memory leak in sctp_sf_do_5_2_4_dupcook
    8d442143ccd4 openvswitch: fix flow command message size
    b834278b4d0a net: sched: fix `tc -s class show` no bstats on class with nolock subqueues
    2f47935914f8 net: psample: fix skb_over_panic
    8fc3ccb35fba net: macb: add missed tasklet_kill
    9243823cd73a net: dsa: sja1105: fix sja1105_parse_rgmii_delays()
    1e7ff496e195 mdio_bus: don't use managed reset-controller
    f458119c914d macvlan: schedule bc_work even if error
    442b4bac7514 xfrm: Fix memleak on xfrm state destroy
    d06561a292bf thunderbolt: Power cycle the router if NVM authentication fails
    97a4d0528c98 mei: me: add comet point V device id
    aa6a4bfabb1a mei: bus: prefix device names on bus with the bus name
    fb94cd58ee14 USB: serial: ftdi_sio: add device IDs for U-Blox C099-F9P
    33c6adbab912 staging: rtl8723bs: Add 024c:0525 to the list of SDIO device-ids
    34820fb849a8 staging: rtl8723bs: Drop ACPI device ids
    18ff3bb126fe staging: rtl8192e: fix potential use after free
    955068eb7918 staging: wilc1000: fix illegal memory access in wilc_parse_join_bss_param()
    afe6f4526509 usb: dwc2: use a longer core rest timeout in dwc2_core_reset()
    4b15bd43d8ed clk: at91: fix update bit maps on CFG_MOR write
    6ed6cd2d7f8a i40e: Fix for ethtool -m issue on X722 NIC
    ddcdd3cc96f1 i40e: Fix for missing "link modes" info in ethtool
    ae4d08f3a69b iavf: initialize ITRN registers with correct values
    12c0db2518f8 ice: fix potential infinite loop because loop counter being too small
    c105a4b2019d pwm: bcm-iproc: Prevent unloading the driver module while in use
    66f3f3c4da1e block: drbd: remove a stray unlock in __drbd_send_protocol()
    11748bed1eeb mac80211: fix station inactive_time shortly after boot
    2df48b15a9ca net/fq_impl: Switch to kvmalloc() for memory allocation
    1332a34432a5 ceph: return -EINVAL if given fsc mount option on kernel w/o support
    218333cf3e5b net: stmmac: xgmac: Disable Flow Control when 1 or more queues are in AV
    e8fec331b7e3 net: stmmac: xgmac: Fix TSA selection
    f7e0994188b2 net: stmmac: gmac4: bitrev32 returns u32
    d99d2e2d5c7d drm/amdgpu: add warning for GRBM 1-cycle delay issue in gfx9
    3db9d787fbbe net: mscc: ocelot: fix __ocelot_rmw_ix prototype
    23d1a942d638 net/mlx5e: Fix eswitch debug print of max fdb flow
    c26064b7eda5 drm/amdgpu: dont schedule jobs while in reset
    d61b5d11db4b net: bcmgenet: reapply manual settings to the PHY
    303f8e7b7d18 net: bcmgenet: use RGMII loopback for MAC reset
    82077751014a scripts/gdb: fix debugging modules compiled with hot/cold partitioning
    7b20840690f5 mm/gup_benchmark: fix MAP_HUGETLB case
    c7816d20058f ASoC: SOF: topology: Fix bytes control size checks
    1b3afeddab4a ARM: dts: stm32: Fix CAN RAM mapping on stm32mp157c
    4de26c8cbe50 ALSA: hda: hdmi - add Tigerlake support
    f43786eb3acb ASoC: stm32: sai: add restriction on mmap support
    36fa7d5299c2 watchdog: bd70528: Add MODULE_ALIAS to allow module auto loading
    f023dd202f6b watchdog: meson: Fix the wrong value of left time
    9054f01030f8 watchdog: pm8916_wdt: fix pretimeout registration flow
    2c25aa88640f nvme-multipath: fix crash in nvme_mpath_clear_ctrl_paths
    6fdb636145b0 nvme-rdma: fix a segmentation fault during module unload
    43bd0bf71860 can: mcp251x: mcp251x_restart_work_handler(): Fix potential force_quit race condition
    7091bcbccb6b perf scripting engines: Iterate on tep event arrays directly
    7371326920db x86/tsc: Respect tsc command line paraemeter for clocksource_tsc_early
    8efe12d76d7e can: flexcan: increase error counters if skb enqueueing via can_rx_offload_queue_sorted() fails
    4a3333ea25b1 can: rx-offload: can_rx_offload_irq_offload_fifo(): continue on error
    a26a27d53b40 can: rx-offload: can_rx_offload_irq_offload_timestamp(): continue on error
    39b89fc6625f can: rx-offload: can_rx_offload_offload_one(): use ERR_PTR() to propagate error value in case of errors
    f6b5da01db2f can: rx-offload: can_rx_offload_offload_one(): increment rx_fifo_errors on queue overflow or OOM
    acb9095493be can: rx-offload: can_rx_offload_offload_one(): do not increase the skb_queue beyond skb_queue_len_max
    189c1239632b can: rx-offload: can_rx_offload_queue_tail(): fix error handling, avoid skb mem leak
    7ac97e4ef4d9 can: c_can: D_CAN: c_can_chip_config(): perform a sofware reset on open
    1ac0d4885a34 can: peak_usb: report bus recovery as well
    b542266496fa stacktrace: Don't skip first entry on noncurrent tasks
    afe7ff5be406 bridge: ebtables: don't crash when using dnat target in output chains
    a19d86990335 netfilter: ipset: Fix nla_policies to fully support NL_VALIDATE_STRICT
    17db97a8e7d5 netfilter: ipset: Fix the last missing check of nla_parse_deprecated()
    5f4ada6390b6 net: fec: add missed clk_disable_unprepare in remove
    0b283b59a62f clk: ti: clkctrl: Fix failed to enable error with double udelay timeout
    b70eae1c4480 clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call
    aab6b68e53eb ASoC: hdac_hda: fix race in device removal
    b23f8d6ca25f fbdev: c2p: Fix link failure on non-inlining
    51c019bf2c42 arm64: dts: zii-ultra: fix ARM regulator GPIO handle
    819ee4651182 x86/resctrl: Prevent NULL pointer dereference when reading mondata
    4d71464d5830 idr: Fix idr_alloc_u32 on 32-bit systems
    9956dbb774e4 idr: Fix integer overflow in idr_for_each_entry
    a530ec599a8a idr: Fix idr_get_next_ul race with idr_remove
    6909ddf4276c powerpc/bpf: Fix tail call implementation
    957928006316 samples/bpf: fix build by setting HAVE_ATTR_TEST to zero
    d3a556320b11 bpf: Allow narrow loads of bpf_sysctl fields with offset > 0
    4fd976da64d7 ARM: dts: sun8i-a83t-tbs-a711: Fix WiFi resume from suspend
    1d6d86b21245 clk: sunxi-ng: a80: fix the zero'ing of bits 16 and 18
    440f439c1041 clk: sunxi: Fix operator precedence in sunxi_divs_clk_setup
    b4c8fc7dcab9 clk: at91: avoid sleeping early
    c42ce4122e86 ASoC: ti: sdma-pcm: Add back the flags parameter for non standard dma names
    32ea5f2ae3b6 arm64: dts: imx8mm: fix compatible string for sdma
    4071d8976ac5 reset: fix reset_control_ops kerneldoc comment
    b178a6e8f8f3 soc: imx: gpc: fix initialiser format
    0a751a005ded ARM: dts: imx6qdl-sabreauto: Fix storm of accelerometer interrupts
    946654641741 pinctrl: cherryview: Allocate IRQ chip dynamic
    66c7b484cae0 clk: samsung: exynos5420: Preserve PLL configuration during suspend/resume
    30c758e0a731 arm64: dts: ls1028a: fix a compatible issue
    ba3e13683df7 ASoC: kirkwood: fix device remove ordering
    d7ee3bbc1085 ASoC: kirkwood: fix external clock probe defer
    7a754f5e5751 clk: samsung: exynos542x: Move G3D subsystem clocks to its sub-CMU
    2361cffc9775 clk: samsung: exynos5433: Fix error paths
    e1fc074e8178 reset: Fix memory leak in reset_control_array_put()
    b01838b0ca64 ASoC: compress: fix unsigned integer overflow check
    41360b33fec2 ASoC: msm8916-wcd-analog: Fix RX1 selection in RDAC2 MUX
    e7fc8cc79377 soundwire: intel: fix intel_register_dai PDI offsets and numbers
    82b111a092b1 clocksource/drivers/mediatek: Fix error handling
    85c26d3b879d thunderbolt: Fix lockdep circular locking depedency warning
    a41faef2aef6 thunderbolt: Read DP IN adapter first two dwords in one go
    0b4d76ea32e5 clk: at91: sam9x60: fix programmable clock
    3ac5085a98ba clk: meson: gxbb: let sar_adc_clk_div set the parent clock rate
    922eddf892e2 XArray: Fix xas_next() with a single entry at 0

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Although 5.2 will be dropped soon, this update is worth sending for
backport to the -stable branches and to fix a couple of lingering
build issues with the last 5.2 SRCREV bump I sent.

Bruce

 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 79da8c14b3..441545f55e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e1abc7e80e4df82d180aecd09e0d80b579d79c34"
-SRCREV_meta ?= "9a13706c994275b544f78dbfc9ed8ff98cd94aef"
+SRCREV_machine ?= "b18bde6f0d8d1a5710cec9792372c03543cf0be9"
+SRCREV_meta ?= "bb2776d6beaae64b1a0fc902b64376f082085498"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.29"
+LINUX_VERSION ?= "5.2.32"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index d88cb5d742..6d49e00e21 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.29"
+LINUX_VERSION ?= "5.2.32"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "f5a3e7e2c94b9d35d1b1933c503ffdaf1e9abec8"
-SRCREV_machine ?= "6f93a47515b2008468437f2f655404906337c574"
-SRCREV_meta ?= "9a13706c994275b544f78dbfc9ed8ff98cd94aef"
+SRCREV_machine_qemuarm ?= "ed1c3b7ad8221ba4e20ce7e4e4f6a73afd5015d4"
+SRCREV_machine ?= "c926964d00caf714f42878535af8c7374452072d"
+SRCREV_meta ?= "bb2776d6beaae64b1a0fc902b64376f082085498"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 59cc08e9a3..44516dcacb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6080c11f80fbba3ae018518af53564a226e7efcf"
-SRCREV_machine_qemuarm64 ?= "6f93a47515b2008468437f2f655404906337c574"
-SRCREV_machine_qemumips ?= "078d960b86b2b6539e6823f1da884e85b07e50f3"
-SRCREV_machine_qemuppc ?= "6f93a47515b2008468437f2f655404906337c574"
-SRCREV_machine_qemuriscv64 ?= "6f93a47515b2008468437f2f655404906337c574"
-SRCREV_machine_qemux86 ?= "6f93a47515b2008468437f2f655404906337c574"
-SRCREV_machine_qemux86-64 ?= "6f93a47515b2008468437f2f655404906337c574"
-SRCREV_machine_qemumips64 ?= "ad3efcb4a297394ceb0ab2357737bd8be9846fec"
-SRCREV_machine ?= "6f93a47515b2008468437f2f655404906337c574"
-SRCREV_meta ?= "9a13706c994275b544f78dbfc9ed8ff98cd94aef"
+SRCREV_machine_qemuarm ?= "1ed2236e622e5b79d910fc1db37ec6eec5a94fdc"
+SRCREV_machine_qemuarm64 ?= "c926964d00caf714f42878535af8c7374452072d"
+SRCREV_machine_qemumips ?= "e669e4307d07072458904ac0fda56f7192e2880d"
+SRCREV_machine_qemuppc ?= "c926964d00caf714f42878535af8c7374452072d"
+SRCREV_machine_qemuriscv64 ?= "c926964d00caf714f42878535af8c7374452072d"
+SRCREV_machine_qemux86 ?= "c926964d00caf714f42878535af8c7374452072d"
+SRCREV_machine_qemux86-64 ?= "c926964d00caf714f42878535af8c7374452072d"
+SRCREV_machine_qemumips64 ?= "217cada95bbe7eb4c3a6d40ee141ea4cea3bc1b6"
+SRCREV_machine ?= "c926964d00caf714f42878535af8c7374452072d"
+SRCREV_meta ?= "bb2776d6beaae64b1a0fc902b64376f082085498"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.29"
+LINUX_VERSION ?= "5.2.32"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


