Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 93EBE61701
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:46:04 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id z19so2581970qkj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kkK4bACHVZ4Rsg21SUdw+Ui6f3/lfArayiwsbtPi/Ks=;
	b=UMs7GVGn/uhFnvKnPGR/1NskAtWtECUPQkkIx5QbGGEmjhKeiplIknYBqL4CyckNw1
	VlYrSP1BQh6k8FdpOLL7c5IJMSKDX60ZEGUa3XXWYFrzhgpGJrPI4gh/0Mi+KCHxkn/l
	zmgT1WUdl9NsyxuL7ep7TmNMUxU2iXD8oZc2UhuV0FLh+dvNrdOkg5uNhE0+I32CA3Gf
	UvQFRQFbLVb/wUoes4MJuViMrVlIUOMHbtpQlFWYUy6WLeuYQV/ZlwSuvpjGLPMmOa7s
	7Bnpo1CIEPoPHvhj6rQgkBAWtluJXq3aZ8rnOY+c+rtYLN3l65znj9xsbyoGrpgKMZPk
	XyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kkK4bACHVZ4Rsg21SUdw+Ui6f3/lfArayiwsbtPi/Ks=;
	b=VkAY8/xJOHv5AyZpWWteuwO1n8/D9005c30JUO+eT9C8ZRhfg4S4Ichmk4K+ms6p62
	FbdwfLjw1Qbqd/rgXhg3C+1Q2tm/0dPbbf1rU55htzMkxEU0ZczIuWQpa5zGY4beiWhj
	PAYu5zivv1Eu8MNZOZIw2ZkeSQ3sVZ2r6KBqaR2N7NhQ+Ea3rtA9BBDZ3A8LxFzSkAoY
	jR9p3YL/HRpIegDFyDF3hTg+6AHyMq1T5dRSxVOWxGUpHov2eihY7/QjJNM78fYzf4YA
	IEpG9C8JVsa0h+hiX+Qzp8q0nEBRCS2Yw1EuhUrTr2qyIz0XcQjO+lIHrmGgTokXoCug
	ZIIw==
X-Gm-Message-State: APjAAAXdcO08sA0NXf/sa+4PktixFBpYTmudKgWkr5jSsVuhAd+e0Di8
	hqwwkmyCscMV80IgW0V+s/QzkqU8cJ8/Lg==
X-Google-Smtp-Source: APXvYqxell3RKe3i0W3OVN4ebC4rF9vzBYwyfZEvGxBnfe/N4AsxwelYr+BYCWqEYQhb8VLxdpPJVw==
X-Received: by 2002:a05:620a:130b:: with SMTP id
	o11mr9069707qkj.444.1582307165231; 
	Fri, 21 Feb 2020 09:46:05 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	g17sm1855153qtq.29.2020.02.21.09.46.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 09:46:04 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 21 Feb 2020 12:45:53 -0500
Message-Id: <3ad4a6c58cd6215718ddf81ae7abe5a47b15a816.1582306887.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1582306887.git.bruce.ashfield@gmail.com>
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] linux-yocto/5.4: update to v5.4.18
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
X-List-Received-Date: Fri, 21 Feb 2020 17:46:05 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    58c72057f662 Linux 5.4.18
    3353852afe1e tracing/uprobe: Fix to make trace_uprobe_filter alignment safe
    5f9b8c5a4618 Revert "rsi: fix potential null dereference in rsi_probe()"
    09d4a9c83c68 ASoC: topology: fix soc_tplg_fe_link_create() - link->dobj initialization order
    52cf138f5cc1 mm/migrate.c: also overwrite error when it is bigger than zero
    20e1bbe5cfd7 perf report: Fix no libunwind compiled warning break s390 issue
    e16b302f691c dm thin: fix use-after-free in metadata_pre_commit_callback
    35511d9471be flow_dissector: Fix to use new variables for port ranges in bpf hook
    f42407a7906b cpuidle: teo: Avoid using "early hits" incorrectly
    c5e3c887dfc0 btrfs: do not zero f_bavail if we have available space
    420e4a521c0e net: Fix skb->csum update in inet_proto_csum_replace16().
    e853e3f9f9d4 netfilter: nf_tables_offload: fix check the chain offload flag
    17d56cef7f93 netfilter: conntrack: sctp: use distinct states for new SCTP connections
    b71636ee37fa l2t_seq_next should increase position index
    148a71a8ece8 seq_tab_next() should increase position index
    0c9a3ab865c3 net: fsl/fman: rename IF_MODE_XGMII to IF_MODE_10G
    e2c797b72e01 net/fsl: treat fsl,erratum-a011043
    1ce13ed0a5de powerpc/fsl/dts: add fsl,erratum-a011043
    6ee3feac65ea qlcnic: Fix CPU soft lockup while collecting firmware dump
    d693255105b6 ARM: dts: am43x-epos-evm: set data pin directions for spi0 and spi1
    06b5e1087103 r8152: disable DelayPhyPwrChg
    510818ae0f38 r8152: avoid the MCU to clear the lanwake
    3a128650b47a r8152: disable test IO for RTL8153B
    bc2ef2e9d142 r8152: Disable PLA MCU clock speed down
    b05091c3ae99 r8152: disable U2P3 for RTL8153B
    26a581fafceb r8152: get default setting of WOL before initializing
    281f32e34382 tee: optee: Fix compilation issue with nommu
    0703666b9658 led: max77650: add of_match table
    313151afdf4c ARM: 8955/1: virt: Relax arch timer version check during early boot
    edb6590b1b2c scsi: fnic: do not queue commands during fwreset
    3075e636b368 Input: max77650-onkey - add of_match table
    c3a49824165c xfrm: interface: do not confirm neighbor when do pmtu update
    b38dd235a4bd xfrm interface: fix packet tx through bpf_redirect()
    c8e04566db7f vti[6]: fix packet tx through bpf_redirect()
    5743a3a8a4c7 ARM: dts: am335x-boneblack-common: fix memory size
    c15ea8e4150d Input: evdev - convert kzalloc()/vzalloc() to kvzalloc()
    220ee13d017c iwlwifi: dbg: force stop the debug monitor HW
    27cf25a0b87a iwlwifi: Don't ignore the cap field upon mcc update
    4df1389ff7b5 iwlwifi: pcie: allocate smaller dev_cmd for TX headers
    08022255a9ee XArray: Fix xas_pause at ULONG_MAX
    b267caf5e51f riscv: delete temporary files
    8f2fa34a52c5 perf/x86/intel/uncore: Remove PCIe3 unit for SNR
    aae7d5784c53 perf/x86/intel/uncore: Add PCI ID of IMC for Xeon E3 V5 Family
    86982620f28b wireless: wext: avoid gcc -O3 warning
    b308d93dd5b3 mac80211: Fix TKIP replay protection immediately after key setup
    e233cbaf8ecc cfg80211: Fix radar event during another phy CAC
    01c2c23d3d5f wireless: fix enabling channel 12 for custom regulatory domain
    9e62f296dbae lkdtm/bugs: fix build error in lkdtm_UNSET_SMEP
    0b06c373db8a parisc: Use proper printk format for resource_size_t
    e1133c1796a1 qmi_wwan: Add support for Quectel RM500Q
    422566f37e37 ASoC: sti: fix possible sleep-in-atomic
    99ced2ecfe9e ASoC: hdac_hda: Fix error in driver removal after failed probe
    e43ab59fb1aa ASoC: SOF: Intel: fix HDA codec driver probe with multiple controllers
    70149813320f platform/x86: intel_pmc_core: update Comet Lake platform driver
    689233e8f998 platform/x86: GPD pocket fan: Allow somewhat lower/higher temperature limits
    7790a471e80c iavf: remove current MAC address filter on VF reset
    73613ce39d59 igb: Fix SGMII SFP module discovery for 100FX/LX.
    fd335ee1e9e2 ixgbe: Fix calculation of queue with VFs and flow director on interface flap
    5113ff357d81 ixgbevf: Remove limit of 10 entries for unicast filter list
    be87d4f313e3 i40e: Fix virtchnl_queue_select bitmap validation
    557fda798eab s390/zcrypt: move ap device reset from bus to driver code
    1a18f3a7dbbf ASoC: rt5640: Fix NULL dereference on module unload
    aab165d61cb4 clk: mmp2: Fix the order of timer mux parents
    8b4e524dc02b mac80211: mesh: restrict airtime metric to peered established plinks
    096837d4b495 clk: sunxi-ng: h6-r: Fix AR100/R_APB2 parent order
    e619af70d133 clk: sunxi-ng: sun8i-r: Fix divider on APB0 clock
    95c892061e90 rseq: Unregister rseq for clone CLONE_VM
    91f91139d32f tools lib traceevent: Fix memory leakage in filter_event
    22946b839768 soc: ti: wkup_m3_ipc: Fix race condition with rproc_boot
    adba4a2a5273 ARM: dts: beagle-x15-common: Model 5V0 regulator
    8a14c121d4e4 ARM: dts: am57xx-beagle-x15/am57xx-idk: Remove "gpios" for endpoint dt nodes
    b5cbe8ad1b60 ARM: dts: sun8i: a83t: Correct USB3503 GPIOs polarity
    e8b0d16e4c7f arm64: dts: meson-sm1-sei610: add gpio bluetooth interrupt
    f0a7b02147ad clk: sunxi-ng: v3s: Fix incorrect number of hw_clks.
    3ea87219a9c7 cgroup: Prevent double killing of css when enabling threaded cgroup
    07d00820bf98 Bluetooth: Fix race condition in hci_release_sock()
    f39406a925b0 ttyprintk: fix a potential deadlock in interrupt context issue
    99652ee9c516 tomoyo: Use atomic_t for statistics counter
    81b3fd0cb421 media: dvb-usb/dvb-usb-urb.c: initialize actlen to 0
    f416aac94c12 media: gspca: zero usb_buf
    d35ef79fbc97 media: vp7045: do not read uninitialized values if usb transfer fails
    0c7cc4c9c2bb media: af9005: uninitialized variable printked
    5b256eea1ae6 media: digitv: don't continue if remote control state can't be read
    761a10b67a11 reiserfs: Fix memory leak of journal device string
    9bcdb8ba5a3d mm/mempolicy.c: fix out of bounds write in mpol_parse_str()
    7965bc367e70 arm64: kbuild: remove compressed images on 'make ARCH=arm64 (dist)clean'
    e77625d1f8ff tools lib: Fix builds when glibc contains strlcpy()
    da1321fc1405 PM / devfreq: Add new name attribute for sysfs
    e9fac0046579 perf c2c: Fix return type for histogram sorting comparision functions
    73774def78ec gfs2: Another gfs2_find_jhead fix
    d635e7c4b34e e1000e: Revert "e1000e: Make watchdog use delayed work"
    21c613793972 e1000e: Drop unnecessary __E1000_DOWN bit twiddling
    5ca5637ec665 x86/resctrl: Fix use-after-free due to inaccurate refcount of rdtgroup
    40300f986e47 x86/resctrl: Fix use-after-free when deleting resource groups
    2dd2e4722922 x86/resctrl: Fix a deadlock due to inaccurate reference
    cd0826719560 cifs: fix soft mounts hanging in the reconnect code
    2c38e6140126 vfs: fix do_last() regression
    313c8460cf02 Linux 5.4.17
    831919b4c481 power/supply: ingenic-battery: Don't change scale if there's only one
    dd350f3918be Revert "um: Enable CONFIG_CONSTRUCTORS"
    a775f67b4b61 KVM: arm64: Write arch.mdcr_el2 changes since last vcpu_load on VHE
    00d58d0b58bc crypto: pcrypt - Fix user-after-free on module unload
    9f6d555f58f3 crypto: caam - do not reset pointer size from MCFGR register
    3b52ada5b82c crypto: vmx - reject xts inputs that are too short
    9d9b578ffef3 crypto: af_alg - Use bh_lock_sock in sk_destruct
    ac39443b7b49 rsi: fix non-atomic allocation in completion handler
    1f04209d19c5 rsi: fix memory leak on failed URB submission
    2d367468ecdf rsi: fix use-after-free on probe errors
    d8902b43745f rsi: fix use-after-free on failed probe and unbind
    99d9138295cb bus: ti-sysc: Fix missing force mstandby quirk handling
    58b09300ee1b Bluetooth: btbcm: Use the BDADDR_PROPERTY quirk
    d1e5f8c5156e Bluetooth: Allow combination of BDADDR_PROPERTY and INVALID_BDADDR quirks
    d273ee188a4a ALSA: hda/realtek - Move some alc236 pintbls to fallback table
    050072c0f798 usb-storage: Disable UAS on JMicron SATA enclosure
    a2e6217bd8ea bus: ti-sysc: Add module enable quirk for audio AESS
    0c101a22fec5 mmc: sdhci-pci: Add support for Intel JSL
    ac342e0a1f18 mmc: sdhci-pci: Quirk for AMD SDHC Device 0x7906
    142356a63872 ARM: OMAP2+: SmartReflex: add omap_sr_pdata definition
    f3020d789311 ARM: config: aspeed-g5: Enable 8250_DW quirks
    4f8f8f31c505 mfd: intel-lpss: Add Intel Comet Lake PCH-H PCI IDs
    81909bd070db perf/imx_ddr: Add enhanced AXI ID filter support
    b02b0a6bcc81 iommu/amd: Support multiple PCI DMA aliases in IRQ Remapping
    1f03a258f20f iommu/amd: Support multiple PCI DMA aliases in device table
    d7937ea02315 spi: pxa2xx: Add support for Intel Comet Lake-H
    c90ed6e66288 bus: ti-sysc: Use swsup quirks also for am335x musb
    48b038c9d54a bus: ti-sysc: Handle mstandby quirk and use it for musb
    6d34eacd8348 media: dvbsky: add support for eyeTV Geniatech T2 lite
    fef41f3a82ea PCI: Add DMA alias quirk for Intel VCA NTB
    f8aaefd5510a platform/x86: dell-laptop: disable kbd backlight on Inspiron 10xx
    21fd877300b0 staging: mt7621-pci: add quirks for 'E2' revision using 'soc_device_attribute'
    c9ddede0a9fc libbpf: Fix BTF-defined map's __type macro handling of arrays
    d40471b727e8 drm/amdgpu/SRIOV: add navi12 pci id for SRIOV (v2)
    791e3ec642ce ASoC: Intel: cht_bsw_rt5645: Add quirk for boards using pmc_plt_clk_0
    48617aa63951 extcon-intel-cht-wc: Don't reset USB data connection at probe
    de850e86d2e1 HID: steam: Fix input device disappearing
    b60d320dc363 atm: eni: fix uninitialized variable warning
    f4691c14d449 stmmac: debugfs entry name is not be changed when udev rename device name.
    9d54646059b2 drm/amd/display: Reduce HDMI pixel encoding if max clock is exceeded
    a347d66cbec7 iommu/dma: fix variable 'cookie' set but not used
    4fe14f9db5c9 gpio: max77620: Add missing dependency on GPIOLIB_IRQCHIP
    dfe190e77862 net: wan: sdla: Fix cast from pointer to integer of different size
    eea2b2bb502f drivers/net/b44: Change to non-atomic bit operations on pwol_mask
    c2ae3ce351be net: Google gve: Remove dma_wmb() before ringing doorbell
    7db4e6c728cb spi: spi-dw: Add lock protect dw_spi rx/tx to prevent concurrent calls
    db10c64764eb can: tcan4x5x: tcan4x5x_parse_config(): reset device before register access
    68d199fc8e66 usb: musb: jz4740: Silence error if code is -EPROBE_DEFER
    3ecda03a5c13 watchdog: orion: fix platform_get_irq() complaints
    b39f38f0ebed watchdog: rn5t618_wdt: fix module aliases
    27757bfb8c72 watchdog: max77620_wdt: fix potential build errors
    5399714dc2a1 HID: intel-ish-hid: ipc: Add Tiger Lake PCI device ID
    e5900bc22253 phy: cpcap-usb: Prevent USB line glitches from waking up modem
    98aedb893555 ASoC: topology: Prevent use-after-free in snd_soc_get_pcm_runtime()
    68b74847c8bc ASoC: fsl_audmix: add missed pm_runtime_disable
    a0636e211f8e phy: qcom-qmp: Increase PHY ready timeout
    b826ffe45a27 drivers/hid/hid-multitouch.c: fix a possible null pointer access.
    32a369776bd5 ASoC: SOF: Intel: hda: hda-dai: fix oops on hda_link .hw_free
    eedf205f0267 ASoC: SOF: fix fault at driver unload after failed probe
    8cc2de41a529 HID: wacom: Recognize new MobileStudio Pro PID
    b55f9e9760c8 HID: intel-ish-hid: ipc: add CMP device id
    22aa1db061d2 HID: Add quirk for incorrect input length on Lenovo Y720
    854f39866e2f HID: asus: Ignore Asus vendor-page usage-code 0xff events
    49de93b4018b HID: ite: Add USB id match for Acer SW5-012 keyboard dock
    05c33c23d0b6 HID: Add quirk for Xin-Mo Dual Controller
    ae9484c6fb60 arc: eznps: fix allmodconfig kconfig warning
    f5adacf21c6e HID: multitouch: Add LG MELF0410 I2C touchscreen support
    b576b27f7ba4 rxrpc: Fix use-after-free in rxrpc_receive_data()
    d3da5e90665a net: include struct nhmsg size in nh nlmsg size
    73226c74746d mlxsw: minimal: Fix an error handling path in 'mlxsw_m_port_create()'
    3c8c966cc718 udp: segment looped gso packets correctly
    87c681943725 net: socionext: fix xdp_result initialization in netsec_process_rx
    b7eda225ebc1 net: socionext: fix possible user-after-free in netsec_process_rx
    717abad86460 net_sched: walk through all child classes in tc_bind_tclass()
    55ec468d3093 net_sched: fix ops->bind_class() implementations
    2d0b854393af net_sched: ematch: reject invalid TCF_EM_SIMPLE
    79c13c063720 zd1211rw: fix storage endpoint lookup
    226ed25115b7 rtl8xxxu: fix interface sanity check
    670a39aeb07b brcmfmac: fix interface sanity check
    b896fe1da14f ath9k: fix storage endpoint lookup
    e08884197082 cifs: Fix memory allocation in __smb2_handle_cancelled_cmd()
    b396ec7241ed cifs: set correct max-buffer-size for smb2_ioctl_init()
    d65b067c2546 CIFS: Fix task struct use-after-free on reconnect
    4f753389bcdc crypto: chelsio - fix writing tfm flags to wrong place
    9ba7636fdb42 driver core: Fix test_async_driver_probe if NUMA is disabled
    3811bd2b93af iio: st_gyro: Correct data for LSM9DS0 gyro
    a6d19450c314 iio: adc: stm32-dfsdm: fix single conversion
    29795e4f6a36 mei: me: add comet point (lake) H device ids
    9272a0797833 mei: hdcp: bind only with i915 on the same PCH
    7d46883724e0 binder: fix log spam for existing debugfs file creation.
    3e832cf807e8 component: do not dereference opaque pointer in debugfs
    6826af9a5c3f debugfs: Return -EPERM when locked down
    3b16600e1fd4 serial: imx: fix a race condition in receive path
    f54b5d4a1abc serial: 8250_bcm2835aux: Fix line mismatch on driver unbind
    0710da067387 staging: vt6656: Fix false Tx excessive retries reporting.
    a56c0f7d5f15 staging: vt6656: use NULLFUCTION stack on mac80211
    1a80cc38db42 staging: vt6656: correct packet types for CTS protect, mode.
    3a5bff77f48c staging: wlan-ng: ensure error return is actually returned
    b5e5d81230ec staging: most: net: fix buffer overflow
    9ba5957e034d usb: typec: fusb302: fix "op-sink-microwatt" default that was in mW
    9bfa308e95b1 usb: typec: wcove: fix "op-sink-microwatt" default that was in mW
    445839bc7fa3 usb: dwc3: turn off VBUS when leaving host mode
    1fe175772b99 USB: serial: ir-usb: fix IrLAP framing
    c9b7dcee64c1 USB: serial: ir-usb: fix link-speed handling
    85eec8cf9d22 USB: serial: ir-usb: add missing endpoint sanity check
    380a352cd3e9 usb: host: xhci-tegra: set MODULE_FIRMWARE for tegra186
    f841bbcf8130 usb: dwc3: pci: add ID for the Intel Comet Lake -V variant
    566264c8b6e3 rsi_91x_usb: fix interface sanity check
    c48a89147160 orinoco_usb: fix interface sanity check
    619c458f8f39 Bluetooth: btusb: fix non-atomic allocation in completion handler
    60b6aa2b71ef Linux 5.4.16
    d8a11e0f4e26 net/x25: fix nonblocking connect
    ce75dd3abbc8 netfilter: nf_tables: autoload modules from the abort path
    07ac418120ae netfilter: nf_tables: add __nft_chain_type_get()
    ea52197c9c4b netfilter: ipset: use bitmap infrastructure completely
    d5fd8ac3fcc5 media: v4l2-ioctl.c: zero reserved fields for S/TRY_FMT
    40b1747b0368 libertas: Fix two buffer overflows at parsing bss descriptor
    74389183b671 net/sonic: Prevent tx watchdog timeout
    58c0c4b122b1 net/sonic: Fix CAM initialization
    079e7e775895 net/sonic: Fix command register usage
    4d391c40c295 net/sonic: Quiesce SONIC before re-initializing descriptor memory
    9f638adb9f1a net/sonic: Fix receive buffer replenishment
    3a0c502d4535 net/sonic: Improve receive descriptor status flag check
    3a2137846347 net/sonic: Avoid needless receive descriptor EOL flag updates
    f6ecc13bea2b net/sonic: Fix receive buffer handling
    e7092fbffc34 net/sonic: Fix interface error stats collection
    c5a85f05e462 net/sonic: Use MMIO accessors
    c463d5a17032 net/sonic: Clear interrupt flags immediately
    091c1715f9dd net/sonic: Add mutual exclusion for accessing shared state
    ab94448beeab readdir: be more conservative with directory entry names
    454759886d0b do_last(): fetch directory ->i_mode and ->i_uid before it's too late
    5d001c4f74e0 net, sk_msg: Don't check if sock is locked when tearing down psock
    b2e061912c3e xfrm: support output_mark for offload ESP packets
    4e1572b19c64 drm/i915/userptr: fix size calculation
    503b54ab9666 iwlwifi: mvm: fix potential SKB leak on TXQ TX
    1e3c082df320 iwlwifi: mvm: fix SKB leak on invalid queue
    68ee631ba110 tracing: xen: Ordered comparison of function pointers
    3c6a183d3108 scsi: RDMA/isert: Fix a recently introduced regression related to logout
    bbf0d37947f7 hwmon: (nct7802) Fix non-working alarm on voltages
    515b97c73447 hwmon: (nct7802) Fix voltage limits to wrong registers
    54b818246b03 hsr: Fix a compilation error
    5440678b5acb leds: gpio: Fix uninitialized gpio label for fwnode based probe
    376b860334d2 readdir: make user_access_begin() use the real access range
    16aab32ff8b3 iommu/amd: Fix IOMMU perf counter clobbering during init
    9f6216862a20 lib: Reduce user_access_begin() boundaries in strncpy_from_user() and strnlen_user()
    9e2e1a5abccd netfilter: nft_osf: add missing check for DREG attribute
    373ffce2337b Input: sun4i-ts - add a check for devm_thermal_zone_of_sensor_register
    21aa01da9dba Input: pegasus_notetaker - fix endpoint sanity check
    c65dfef27803 Input: aiptek - fix endpoint sanity check
    56ded4adf16e Input: gtco - fix endpoint sanity check
    3e629da150b5 Input: sur40 - fix interface sanity checks
    68c2bc4da098 Input: pm8xxx-vib - fix handling of separate enable register
    c3f6abfe2f11 net/tls: fix async operation
    c9cb4f2bea44 mlxsw: switchx2: Do not modify cloned SKBs during xmit
    77d323cc3783 mmc: sdhci_am654: Reset Command and Data line after tuning
    d5bb81660456 mmc: sdhci_am654: Remove Inverted Write Protect flag
    d8bc6ac2db28 mmc: sdhci: fix minimum clock rate for v3 controller
    723f200e19bd mmc: tegra: fix SDR50 tuning override
    bccb1568bae8 ARM: 8950/1: ftrace/recordmcount: filter relocation types
    ff847d466bdb Revert "Input: synaptics-rmi4 - don't increment rmiaddr for SMBus transfers"
    cec754961758 Input: keyspan-remote - fix control-message timeouts
    5d1973adcfff iommu/vt-d: Call __dmar_remove_one_dev_info with valid pointer
    d4616a9f8ee9 pinctrl: sunrisepoint: Add missing Interrupt Status register offset
    dd05cf12c72f XArray: Fix xas_find returning too many entries
    db38561288b7 XArray: Fix xa_find_after with multi-index entries
    a5135ca1f92a XArray: Fix infinite loop with entry at ULONG_MAX
    b8560e3d90af iwlwifi: mvm: don't send the IWL_MVM_RXQ_NSSN_SYNC notif to Rx queues
    4e7d8cd6a1a8 Revert "iwlwifi: mvm: fix scan config command size"
    7cf7a7d02587 powerpc/xive: Discard ESB load value when interrupt is invalid
    6145307fa693 powerpc/mm/hash: Fix sharing context ids between kernel & userspace
    bf470f051556 tracing: Fix histogram code when expression has same var as value
    07af0d03e8b2 tracing: Do not set trace clock if tracefs lockdown is in effect
    67551f958458 tracing/uprobe: Fix double perf_event linking on multiprobe uprobe
    44eebad10496 tracing: trigger: Replace unneeded RCU-list traversals
    b1302cbe530b PM: hibernate: fix crashes with init_on_free=1
    d63b777d8145 drm/i915: Align engine->uabi_class/instance with i915_drm.h
    3e041c27b990 drm/panfrost: Add the panfrost_gem_mapping concept
    8c40a8d7d384 PCI: Mark AMD Navi14 GPU rev 0xc5 ATS as broken
    fdd0f3b0e98b ceph: hold extra reference to r_parent over life of request
    19d0cd212742 hwmon: (core) Do not use device managed functions for memory allocations
    0387ee1b95d1 hwmon: (adt7475) Make volt2reg return same reg as reg2volt input
    2d00fec60c8d afs: Fix characters allowed into cell names
    b29d143a690a Revert "io_uring: only allow submit from owning task"
    29ce06b6b6d4 ipv4: Detect rollover in specific fib table dump
    9bd7ae7eab7c net/mlx5e: kTLS, Do not send decrypted-marked SKBs via non-accel path
    43eda24c6f75 net/mlx5e: kTLS, Remove redundant posts in TX resync flow
    384faad2ad5a net/mlx5e: kTLS, Fix corner-case checks in TX resync flow
    7ae31c620dcc net/mlx5: DR, use non preemptible call to get the current cpu number
    8a3b1a86d4f3 net/mlx5: E-Switch, Prevent ingress rate configuration of uplink rep
    b20f5fb7d473 net/mlx5: DR, Enable counter on non-fwd-dest objects
    ffc574c95e5b net/mlx5: Update the list of the PCI supported devices
    36940c4daad0 net/mlx5: Fix lowest FDB pool size
    d18d22ce8f62 net: Fix packet reordering caused by GRO and listified RX cooperation
    8bc302520616 fou: Fix IPv6 netlink policy
    e7b6ef675c46 mlxsw: spectrum_acl: Fix use-after-free during reload
    ef3c0a1660a7 airo: Add missing CAP_NET_ADMIN check in AIROOLDIOCTL/SIOCDEVPRIVATE
    9975b19b8d82 airo: Fix possible info leak in AIROOLDIOCTL/SIOCDEVPRIVATE
    a802ddbf41a3 tun: add mutex_unlock() call and napi.skb clearing in tun_get_user()
    69486bfa064e tcp: do not leave dangling pointers in tp->highest_sack
    562a7c35049c tcp_bbr: improve arithmetic division in bbr_update_bw()
    41c230ae2aa4 Revert "udp: do rmem bulk free even if the rx sk queue is empty"
    63635790a891 net: usb: lan78xx: Add .ndo_features_check
    d6f7ed61fa6e net-sysfs: Fix reference count leak
    9b60a32108e2 net_sched: use validated TCA_KIND attribute in tc_new_tfilter()
    b6a9a954b3fe net_sched: fix datalen for ematch
    888934af187c net: rtnetlink: validate IFLA_MTU attribute in rtnl_create_link()
    500869d71822 net, ip_tunnel: fix namespaces move
    ead0377f601e net, ip6_tunnel: fix namespaces move
    7943bb0f0636 net: ip6_gre: fix moving ip6gre between namespaces
    c6e524f4fad3 net: cxgb3_main: Add CAP_NET_ADMIN check to CHELSIO_GET_MEM
    32df8d0bf461 net: bcmgenet: Use netif_tx_napi_add() for TX NAPI
    e2bd33937c50 ipv6: sr: remove SKB_GSO_IPXIP6 on End.D* actions
    6cbb9683d743 gtp: make sure only SOCK_DGRAM UDP sockets are accepted
    80a4c81c6791 firestream: fix memory leaks
    34545cad8e04 can, slip: Protect tty->disc_data in write_wakeup and close with RCU

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 52f0e3b833..5901ba4c47 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5d5d4070c5f8b10a4c6bda37e77071ce37f102d5"
-SRCREV_meta ?= "a48522779fae4887c47268e5f650bf10c94a165c"
+SRCREV_machine ?= "d8831a265698a000bb7305e0234dcaa302cf25a5"
+SRCREV_meta ?= "6c39661411aaa83f23b5a0b35da193ae819e7428"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.15"
+LINUX_VERSION ?= "5.4.18"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index a028b37548..9a18c63c94 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.15"
+LINUX_VERSION ?= "5.4.18"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9eeafafc19278b5c5376ba1fd9eae26626730458"
-SRCREV_machine ?= "cdda35317561d2741b396efa623ace0bd2212c16"
-SRCREV_meta ?= "a48522779fae4887c47268e5f650bf10c94a165c"
+SRCREV_machine_qemuarm ?= "e144b0946f1a159a8b5770f1fcedaebf8eadac84"
+SRCREV_machine ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
+SRCREV_meta ?= "6c39661411aaa83f23b5a0b35da193ae819e7428"
 
 PV = "5.4.15"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 9fbc47d79e..eea4f2045b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "637086def651a00b1274a80cd3ca740e271eb0f9"
-SRCREV_machine_qemuarm64 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
-SRCREV_machine_qemumips ?= "bfe04753d00b0f36848bb8204020b69d0e78f02a"
-SRCREV_machine_qemuppc ?= "cdda35317561d2741b396efa623ace0bd2212c16"
-SRCREV_machine_qemuriscv64 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
-SRCREV_machine_qemux86 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
-SRCREV_machine_qemux86-64 ?= "cdda35317561d2741b396efa623ace0bd2212c16"
-SRCREV_machine_qemumips64 ?= "81cd255c72add4dcf06603250869f739bb4f05cb"
-SRCREV_machine ?= "cdda35317561d2741b396efa623ace0bd2212c16"
-SRCREV_meta ?= "a48522779fae4887c47268e5f650bf10c94a165c"
+SRCREV_machine_qemuarm ?= "ab36b8853718cf0c92d6c37a62568d34424234e8"
+SRCREV_machine_qemuarm64 ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
+SRCREV_machine_qemumips ?= "f9d6dd093282ef21a11d170660bb06ec81908836"
+SRCREV_machine_qemuppc ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
+SRCREV_machine_qemuriscv64 ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
+SRCREV_machine_qemux86 ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
+SRCREV_machine_qemux86-64 ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
+SRCREV_machine_qemumips64 ?= "8b16e493669ee19054a6407d331da75a32ed45b2"
+SRCREV_machine ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
+SRCREV_meta ?= "6c39661411aaa83f23b5a0b35da193ae819e7428"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.15"
+LINUX_VERSION ?= "5.4.18"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


