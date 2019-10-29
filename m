Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 851167FB2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:45 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g24so1771064wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SwNNlwFHz5D2JXGbwm1rz/Uoh13JeczJ+qqmTHlQ9LY=;
	b=QQO1tGy5XMFxokczQztHO6pUS3EdQwMv58s/MN78juVtWQ2PzE9ajXwEfN4/evgB9T
	hgttaxL5TqSGS4USlNYlaWVS35ji/cv/gQB5B9iF2sk6UonC40helpcgS2D/J0/4S5DD
	DHtA6lMZAdiAtf3MmtDCdRsL6OeA085JOUlYxgAHDOflqIjYpFEgl8P8YFTwWCu7U16t
	/tMS7Yk+p9jGiRS/rnwL3GfU8G02Y+1rIWX+vUUvLTeLGXWVqRfkg/c8uw+anS6Jt8UP
	sWVH+ZOzu6EJ1Vi8wSRHWMspm6WZDZKhoFzGgNUGrQhRqUS4OL9w3nIaUuF+Eiibb0P8
	olyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SwNNlwFHz5D2JXGbwm1rz/Uoh13JeczJ+qqmTHlQ9LY=;
	b=iltj0jBdefBYzEg2h+omczsvBnInnZbMXG7YcdrE0+7zFMbMl5s4r/xTqk3RBe8cuK
	0KTB7dWf6ZXh141fo8gXx9n1Q9JE52FbG0fTKvum82XT86Nx+h5TbEgsM2DmC9oogioP
	j2CVhxqd7xk8cFGiVSE9NLn1cpghcVFQGZUpDlbX3hOZrDu+AaFRzbq5VJAtxnO4HPtF
	AvrMhXG/v6Scohl8p++7beKNCrDHzcsZMV6nImWXmZOYoeVhRTheuNatTmuE6vRILFUg
	87elnB+lV2v5+CdbrHT6pZr0zpIE5rClHZQkVuNQUMQP53cEgsx9792rAQu5l6Xew6em
	HTcA==
X-Gm-Message-State: APjAAAW5x3uWe4Gdjf/mVzYQ76otkArtvsP8jcrOKsLqaAcOjkx8MuKu
	NQiHZ/l4F3FLOWqVcp9Cm9OKuI0M1a8=
X-Google-Smtp-Source: APXvYqzbuusRt4Uh9y8gYlGJWstXTC5OH1WpawutnX/koa9XXqQQKmF4u2rHVKam5S/4OKUHGhktig==
X-Received: by 2002:a1c:a546:: with SMTP id o67mr3189451wme.57.1572342465359; 
	Tue, 29 Oct 2019 02:47:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:16 +0100
Message-Id: <3ca8697e96cac8cca59c6387930c4192e14f1c8d.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior 03/19] linux-yocto/5.0: bsp: add basic xilinx zynqmp support
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Zumeng Chen has added core/basic support for the zynqmp that is bootable
using the 5.0 and 5.2-rcX kernels. This makes the fragments available
for future refinement and factoring. A bootlog follows:

    ZynqMP> setenv bootargs console=ttyPS0,115200 root=/dev/mmcblk0p3 rw
    rootwait earlycon=cdns,mmio,0xFF000000 clk_ignore_unused ip=dhcp
    ZynqMP> tftpboot 0x10000000 Image; tftpboot 0x11800000 dtb; booti
    0x10000000 - 0x11800000
    Using ethernet@ff0e0000 device

    Filename 'Image'.
    Load address: 0x10000000
    Loading:
	      ###########
	      11.3 MiB/s
    done
    Bytes transferred = 16378368 (f9ea00 hex)
    Using ethernet@ff0e0000 device
    TFTP from server 128.224.162.211; our IP address is 128.224.162.99
    Filename 'dtb'.
    Load address: 0x11800000
    Loading: ##
	      4.7 MiB/s
    done
    Bytes transferred = 19746 (4d22 hex)
	Booting using the fdt blob at 0x11800000
	Loading Device Tree to 0000000007ff8000, end 0000000007fffd21 ... OK

    Starting kernel ...

    Booting Linux on physical CPU 0x0000000000 [0x410fd034]
    Linux version 5.2.0-rc3-yoctodev-standard (oe-user@oe-host) (gcc version
    9.1.0 (GCC)) #1 SMP PREEMPT Thu Jun 6 00:53:26 UTC 2019
    Machine model: ZynqMP ZCU102 Rev1.0
    earlycon: cdns0 at MMIO 0x00000000ff000000 (options '')
    printk: bootconsole [cdns0] enabled
    efi: Getting EFI parameters from FDT:
    efi: UEFI not found.
    cma: Reserved 16 MiB at 0x000000007ec00000
    psci: probing for conduit method from DT.
    psci: PSCIv1.1 detected in firmware.
    psci: Using standard PSCI v0.2 function IDs
    psci: MIGRATE_INFO_TYPE not supported.
    psci: SMC Calling Convention v1.1
    percpu: Embedded 30 pages/cpu s83416 r8192 d31272 u122880
    Detected VIPT I-cache on CPU0
    CPU features: detected: ARM erratum 845719
    Speculative Store Bypass Disable mitigation not required
    Built 1 zonelists, mobility grouping on.  Total pages: 1031940
    Kernel command line: console=ttyPS0,115200 root=/dev/mmcblk0p3 rw
    rootwait earlycon=cdns,mmio,0xFF000000 clk_ignore_unused ip=dhcp
    Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
    Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
    software IO TLB: mapped [mem 0x7ac00000-0x7ec00000] (64MB)
    Memory: 4013572K/4193280K available (10748K kernel code, 1210K rwdata,
    2764K rodata, 1216K init, 757K bss, 163324K reserved, 16384K
    cma-reserved)
    SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
    ftrace: allocating 36121 entries in 142 pages
    rcu: Preemptible hierarchical RCU implementation.
    rcu:    RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=4.
	     Tasks RCU enabled.
    rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
    rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
    NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
    GIC: Adjusting CPU interface base to 0x00000000f902f000
    GIC: Using split EOI/Deactivate mode
    random: get_random_bytes called from start_kernel+0x328/0x4c4 with
    crng_init=0
    arch_timer: cp15 timer(s) running at 99.99MHz (phys).
    clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles:
    0x170f8de2d3, max_idle_ns: 440795206112 ns
    sched_clock: 56 bits at 99MHz, resolution 10ns, wraps every
    4398046511101ns
    Console: colour dummy device 80x25
    Calibrating delay loop (skipped), value calculated using timer
    frequency.. 199.98 BogoMIPS (lpj=399960)
    pid_max: default: 32768 minimum: 301
    LSM: Security Framework initializing
    Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
    Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes)
    *** VALIDATE proc ***
    *** VALIDATE cgroup1 ***
    *** VALIDATE cgroup2 ***
    ASID allocator initialised with 32768 entries
    rcu: Hierarchical SRCU implementation.
    EFI services will not be available.
    smp: Bringing up secondary CPUs ...
    Detected VIPT I-cache on CPU1
    CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
    Detected VIPT I-cache on CPU2
    CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
    Detected VIPT I-cache on CPU3
    CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
    smp: Brought up 1 node, 4 CPUs
    SMP: Total of 4 processors activated.
    CPU features: detected: 32-bit EL0 Support
    CPU features: detected: CRC32 instructions
    CPU: All CPU(s) started at EL2
    alternatives: patching kernel code
    devtmpfs: initialized
    clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
    max_idle_ns: 7645041785100000 ns
    futex hash table entries: 1024 (order: 4, 65536 bytes)
    xor: measuring software checksum speed
	8regs     :  2360.000 MB/sec
	32regs    :  2706.000 MB/sec
	arm64_neon:  2018.000 MB/sec
    xor: using function: 32regs (2706.000 MB/sec)
    DMI not present or invalid.
    NET: Registered protocol family 16
    cpuidle: using governor ladder
    hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
    DMA: preallocated 256 KiB pool for atomic allocations
    ��ɥ��ѭ console [ttyPS0] enabled 0xff000000 (irq = 33, base_baud =
    6250000) is a xuartps
    printk: console [ttyPS0] enabled
    printk: bootconsole [cdns0] disabled
    printk: bootconsole [cdns0] disabled
    ff010000.serial: ttyPS1 at MMIO 0xff010000 (irq = 34, base_baud =
    6250000) is a xuartps
    HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
    HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
    HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
    HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
    raid6: neonx8   gen()  1518 MB/s
    raid6: neonx8   xor()  1442 MB/s
    raid6: neonx4   gen()  1471 MB/s
    raid6: neonx4   xor()  1409 MB/s
    raid6: neonx2   gen()  1128 MB/s
    raid6: neonx2   xor()  1175 MB/s
    raid6: neonx1   gen()   737 MB/s
    raid6: neonx1   xor()   887 MB/s
    raid6: int64x8  gen()  1166 MB/s
    raid6: int64x8  xor()   763 MB/s
    raid6: int64x4  gen()   983 MB/s
    raid6: int64x4  xor()   739 MB/s
    raid6: int64x2  gen()   683 MB/s
    raid6: int64x2  xor()   601 MB/s
    raid6: int64x1  gen()   452 MB/s
    raid6: int64x1  xor()   462 MB/s
    raid6: using algorithm neonx8 gen() 1518 MB/s
    raid6: .... xor() 1442 MB/s, rmw enabled
    raid6: using neon recovery algorithm
    vgaarb: loaded
    SCSI subsystem initialized
    usbcore: registered new interface driver usbfs
    usbcore: registered new interface driver hub
    usbcore: registered new device driver usb
    media: Linux media interface: v0.10
    videodev: Linux video capture interface: v2.00
    pps_core: LinuxPPS API ver. 1 registered
    pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti
    <giometti@linux.it>
    PTP clock support registered
    EDAC MC: Ver: 3.0.0
    FPGA manager framework
    clocksource: Switched to clocksource arch_sys_counter
    *** VALIDATE hugetlbfs ***
    NET: Registered protocol family 2
    tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768
    bytes)
    TCP established hash table entries: 32768 (order: 6, 262144 bytes)
    TCP bind hash table entries: 32768 (order: 7, 524288 bytes)
    TCP: Hash tables configured (established 32768 bind 32768)
    UDP hash table entries: 2048 (order: 4, 65536 bytes)
    UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
    NET: Registered protocol family 1
    RPC: Registered named UNIX socket transport module.
    RPC: Registered udp transport module.
    RPC: Registered tcp transport module.
    RPC: Registered tcp NFSv4.1 backchannel transport module.
    PCI: CLS 0 bytes, default 64
    hw perfevents: no interrupt-affinity property for /pmu, guessing.
    hw perfevents: enabled with armv8_pmuv3 PMU driver, 7 counters available
    kprobes: failed to populate blacklist: -22
    Please take care of using kprobes.
    workingset: timestamp_bits=46 max_order=20 bucket_order=0
    NFS: Registering the id_resolver key type
    Key type id_resolver registered
    Key type id_legacy registered
    jffs2: version 2.2. �© 2001-2006 Red Hat, Inc.
    Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
    io scheduler mq-deadline registered
    io scheduler kyber registered
    nwl-pcie fd0e0000.pcie: Link is DOWN
    nwl-pcie fd0e0000.pcie: host bridge /amba/pcie@fd0e0000 ranges:
    nwl-pcie fd0e0000.pcie:   MEM 0xe0000000..0xefffffff -> 0xe0000000
    nwl-pcie fd0e0000.pcie:   MEM 0x600000000..0x7ffffffff -> 0x600000000
    nwl-pcie fd0e0000.pcie: PCI host bridge to bus 0000:00
    pci_bus 0000:00: root bus resource [bus 00-ff]
    pci_bus 0000:00: root bus resource [mem 0xe0000000-0xefffffff]
    pci_bus 0000:00: root bus resource [mem 0x600000000-0x7ffffffff pref]
    pci 0000:00:00.0: [10ee:d021] type 01 class 0x060400
    pci 0000:00:00.0: PME# supported from D0 D1 D2 D3hot
    pci 0000:00:00.0: PCI bridge to [bus 01-0c]
    pcieport 0000:00:00.0: PME: Signaling with IRQ 37
    xilinx-zynqmp-dma fd500000.dma: ZynqMP DMA driver Probe success
    xilinx-zynqmp-dma fd510000.dma: ZynqMP DMA driver Probe success
    xilinx-zynqmp-dma fd520000.dma: ZynqMP DMA driver Probe success
    xilinx-zynqmp-dma fd530000.dma: ZynqMP DMA driver Probe success
    xilinx-zynqmp-dma fd540000.dma: ZynqMP DMA driver Probe success
    xilinx-zynqmp-dma fd550000.dma: ZynqMP DMA driver Probe success
    xilinx-zynqmp-dma fd560000.dma: ZynqMP DMA driver Probe success
    xilinx-zynqmp-dma fd570000.dma: ZynqMP DMA driver Probe success
    cacheinfo: Unable to detect cache hierarchy for CPU 0
    brd: module loaded
    loop: module loaded
    ahci-ceva fd0c0000.ahci: AHCI 0001.0301 32 slots 2 ports 6 Gbps 0x3 impl
    platform mode
    ahci-ceva fd0c0000.ahci: flags: 64bit ncq sntf pm clo only pmp fbs pio
    slum part ccc sds apst
    scsi host0: ahci-ceva
    scsi host1: ahci-ceva
    ata1: SATA max UDMA/133 mmio [mem 0xfd0c0000-0xfd0c1fff] port 0x100 irq
    31
    ata2: SATA max UDMA/133 mmio [mem 0xfd0c0000-0xfd0c1fff] port 0x180 irq
    31
    libphy: Fixed MDIO Bus: probed
    CAN device driver interface
    libphy: MACB_mii_bus: probed
    Generic PHY ff0e0000.ethernet-ffffffff:0c: attached PHY driver [Generic
    PHY] (mii_bus:phy_addr=ff0e0000.ethernet-ffffffff:0c, irq=POLL)
    macb ff0e0000.ethernet eth0: Cadence GEM rev 0x50070106 at 0xff0e0000
    irq 20 (00:0a:35:04:9a:86)
    dwc3 fe200000.usb: Failed to get clk 'ref': -2
    dwc3 fe200000.usb: Configuration mismatch. dr_mode forced to host
    xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
    xhci-hcd xhci-hcd.0.auto: hcc params 0x0238f625 hci version 0x100 quirks
    0x0000000002010010
    xhci-hcd xhci-hcd.0.auto: irq 35, io mem 0xfe200000
    hub 1-0:1.0: USB hub found
    hub 1-0:1.0: 1 port detected
    xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
    xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 2
    xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0  SuperSpeed
    usb usb2: We don't know the algorithms for LPM for this host, disabling
    LPM.
    hub 2-0:1.0: USB hub found
    hub 2-0:1.0: 1 port detected
    usbcore: registered new interface driver usb-storage
    rtc_zynqmp ffa60000.rtc: registered as rtc0
    pca953x 0-0020: 0-0020 supply vcc not found, using dummy regulator
    GPIO line 322 (sel0) hogged as output/low
    GPIO line 323 (sel1) hogged as output/high
    GPIO line 324 (sel2) hogged as output/high
    GPIO line 325 (sel3) hogged as output/high
    pca953x 0-0021: 0-0021 supply vcc not found, using dummy regulator
    cdns-i2c ff020000.i2c: 400 kHz mmio ff020000 irq 22
    cdns-i2c ff030000.i2c: 400 kHz mmio ff030000 irq 23
    i2c i2c-0: Added multiplexed i2c bus 2
    i2c i2c-0: Added multiplexed i2c bus 3
    i2c i2c-0: Added multiplexed i2c bus 4
    i2c i2c-0: Added multiplexed i2c bus 5
    pca954x 0-0075: registered 4 multiplexed busses for I2C mux pca9544
    at24 6-0054: 1024 byte 24c08 EEPROM, writable, 1 bytes/write
    i2c i2c-1: Added multiplexed i2c bus 6
    i2c i2c-7: of_i2c: modalias failure on
    /amba/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36
    i2c i2c-7: Failed to create I2C device for
    /amba/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36
    i2c i2c-1: Added multiplexed i2c bus 7
    si570 8-005d: registered, current frequency 300000000 Hz
    i2c i2c-1: Added multiplexed i2c bus 8
    si570 9-005d: clock registration failed
    si570: probe of 9-005d failed with error -17
    i2c i2c-1: Added multiplexed i2c bus 9
    i2c i2c-10: of_i2c: modalias failure on
    /amba/i2c@ff030000/i2c-mux@74/i2c@4/clock-generator@69
    i2c i2c-10: Failed to create I2C device for
    /amba/i2c@ff030000/i2c-mux@74/i2c@4/clock-generator@69
    i2c i2c-1: Added multiplexed i2c bus 10
    i2c i2c-1: Added multiplexed i2c bus 11
    i2c i2c-1: Added multiplexed i2c bus 12
    i2c i2c-1: Added multiplexed i2c bus 13
    pca954x 1-0074: registered 8 multiplexed busses for I2C switch pca9548
    i2c i2c-1: Added multiplexed i2c bus 14
    i2c i2c-1: Added multiplexed i2c bus 15
    i2c i2c-1: Added multiplexed i2c bus 16
    i2c i2c-1: Added multiplexed i2c bus 17
    i2c i2c-1: Added multiplexed i2c bus 18
    i2c i2c-1: Added multiplexed i2c bus 19
    i2c i2c-1: Added multiplexed i2c bus 20
    i2c i2c-1: Added multiplexed i2c bus 21
    pca954x 1-0075: registered 8 multiplexed busses for I2C switch pca9548
    ina2xx 2-0040: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 2-0041: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 2-0042: power monitor ina226 (Rshunt = 5000 uOhm)
    ata1: SATA link down (SStatus 0 SControl 330)
    ina2xx 2-0043: power monitor ina226 (Rshunt = 5000 uOhm)
    ata2: SATA link down (SStatus 0 SControl 330)
    ina2xx 2-0044: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 2-0045: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 2-0046: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 2-0047: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 2-004a: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 2-004b: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 3-0040: power monitor ina226 (Rshunt = 2000 uOhm)
    ina2xx 3-0041: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 3-0042: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 3-0043: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 3-0044: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 3-0045: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 3-0046: power monitor ina226 (Rshunt = 5000 uOhm)
    ina2xx 3-0047: power monitor ina226 (Rshunt = 5000 uOhm)
    cdns-wdt fd4d0000.watchdog: Xilinx Watchdog Timer at (____ptrval____)
    with timeout 10s
    device-mapper: ioctl: 4.40.0-ioctl (2019-01-18) initialised:
    dm-devel@redhat.com
    EDAC MC: ECC not enabled
    cpu cpu0: failed to get clock: -2
    cpufreq-dt: probe of cpufreq-dt failed with error -2
    sdhci: Secure Digital Host Controller Interface driver
    sdhci: Copyright(c) Pierre Ossman
    sdhci-pltfm: SDHCI platform and OF driver helper
    mmc0: SDHCI controller on ff170000.mmc [ff170000.mmc] using ADMA 64-bit
    usbcore: registered new interface driver usbhid
    usbhid: USB HID core driver
    u32 classifier
	 Actions configured
    NET: Registered protocol family 10
    Segment Routing with IPv6
    sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
    NET: Registered protocol family 17
    can: controller area network core (rev 20170425 abi 9)
    NET: Registered protocol family 29
    can: raw protocol (rev 20170425)
    can: broadcast manager protocol (rev 20170425 t)
    can: netlink gateway (rev 20170425) max_hops=1
    Key type dns_resolver registered
    registered taskstats version 1
    Btrfs loaded, crc32c=crc32c-generic
    Key type encrypted registered
    printk: console [netcon0] enabled
    netconsole: network logging started
    rtc_zynqmp ffa60000.rtc: setting system clock to 2019-06-06T03:39:58 UTC
    (1559792398)
    macb ff0e0000.ethernet eth0: link up (1000/Full)
    pps pps0: new PPS source ptp0
    macb ff0e0000.ethernet: gem-ptp-timer ptp clock registered.
    IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
    mmc0: Problem switching card into high-speed mode!
    mmc0: new SDHC card at address 0001
    mmcblk0: mmc0:0001 SD16G 14.5 GiB
    Sending DHCP requests .
      mmcblk0: p1 p2 p3
    , OK
    IP-Config: Complete:
	  device=eth0, hwaddr=00:0a:35:04:9a:86, ipaddr=xxxxx,
    mask=255.255.254.0
	  host=xxx, domain=corp.ad.wrs.com, nis-domain=swamp
	  bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=

    clk: Not disabling unused clocks
    md: Waiting for all devices to be available before autodetect
    md: If you don't use raid, use raid=noautodetect
    md: Autodetecting RAID arrays.
    md: autorun ...
    md: ... autorun DONE.
    EXT4-fs (mmcblk0p3): mounted filesystem with ordered data mode. Opts:
    (null)
    VFS: Mounted root (ext4 filesystem) on device 179:3.
    devtmpfs: mounted
    Freeing unused kernel memory: 1216K
    Run /sbin/init as init process
    random: fast init done
    systemd[1]: systemd 242-19-gdb2e367+ running in system mode. (+PAM
    -AUDIT -SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP
    -GCRYPT -GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -IDN2 -IDN
    -)
    systemd[1]: Detected architecture arm64.

    Welcome to Wind River Linux development 19.23 Update 0!

    systemd[1]: Set hostname to <xilinx-zynqmp>.
    random: systemd: uninitialized urandom read (16 bytes read)
    systemd[1]: Initializing machine ID from random generator.
    systemd[1]: Failed to bump fs.file-max, ignoring: Invalid argument
    systemd[1]: /lib/systemd/system/dbus.socket:4: ListenStream= references
    a path below legacy directory /var/run/, updating
    /var/run/dbus/system_bus_socket �→ /run/dbus/system_bus_socket; please
    update the unit f.
    systemd[1]: /lib/systemd/system/rpcbind.socket:4: ListenStream=
    references a path below legacy directory /var/run/, updating
    /var/run/rpcbind.sock �→ /run/rpcbind.sock; please update the unit file
    accordingly.
    random: systemd: uninitialized urandom read (16 bytes read)
    systemd[1]: Listening on Journal Socket (/dev/log).
    [  OK  ] Listening on Journal Socket (/dev/log).
    random: systemd: uninitialized urandom read (16 bytes read)
    systemd[1]: Listening on Syslog Socket.
    [  OK  ] Listening on Syslog Socket.
    systemd[1]: Listening on udev Kernel Socket.
    [  OK  ] Listening on udev Kernel Socket.
    [  OK  ] Listening on udev Control Socket.
    [  OK  ] Created slice User and Session Slice.
    [  OK  ] Listening on initctl Compatibility Named Pipe.
    [  OK  ] Reached target Swap.
    [  OK  ] Created slice system-serial\x2dgetty.slice.
    [  OK  ] Reached target Slices.
    [  OK  ] Listening on Journal Socket.
	      Starting udev Coldplug all Devices...
	      Mounting POSIX Message Queue File System...
	      Mounting Temporary Directory (/tmp)...
	      Starting Journal Service...
	      Starting Remount Root and Kernel File Systems...
	      Mounting Kernel Debug File System...
    EXT4-fs (mmcblk0p3): re-mounted. Opts: (null)
	      Starting Create list of re�…odes for the current kernel...
    [  OK  ] Started Forward Password R�…uests to Wall Directory Watch.
    [  OK  ] Reached target Remote File Systems.
    [  OK  ] Listening on Network Service Netlink Socket.
	      Starting Apply Kernel Variables...
    [  OK  ] Started Dispatch Password �…ts to Console Directory Watch.
    [  OK  ] Reached target Paths.
    [  OK  ] Created slice system-getty.slice.
	      Mounting Huge Pages File System...
    [  OK  ] Started Journal Service.
    [  OK  ] Mounted POSIX Message Queue File System.
    [  OK  ] Mounted Temporary Directory (/tmp).
    [  OK  ] Started Remount Root and Kernel File Systems.
    [  OK  ] Mounted Kernel Debug File System.
    [  OK  ] Started Create list of req�… nodes for the current kernel.
    [  OK  ] Started Apply Kernel Variables.
    [  OK  ] Mounted Huge Pages File System.
	      Starting Create System Users...
	      Starting Rebuild Hardware Database...
	      Starting Flush Journal to Persistent Storage...
    [  OK  ] Started udev Coldplug all Devices.
    systemd-journald[148]: Received request to flush runtime journal from
    PID 1
    [  OK  ] Started Flush Journal to Persistent Storage.
    [  OK  ] Started Create System Users.
	      Starting Create Static Device Nodes in /dev...
    [  OK  ] Started Create Static Device Nodes in /dev.
    [  OK  ] Reached target Local File Systems (Pre).
	      Mounting /var/volatile...
    [  OK  ] Mounted /var/volatile.
    [  OK  ] Reached target Local File Systems.
	      Starting Create Volatile Files and Directories...
	      Starting Load/Save Random Seed...
    [  OK  ] Started Load/Save Random Seed.
    [  OK  ] Started Create Volatile Files and Directories.
	      Starting Network Time Synchronization...
	      Starting Rebuild Journal Catalog...
	      Starting Update UTMP about System Boot/Shutdown...
	      Starting Run pending postinsts...
    [  OK  ] Started Update UTMP about System Boot/Shutdown.
    [  OK  ] Started Network Time Synchronization.
    [  OK  ] Reached target System Time Set.
    [  OK  ] Reached target System Time Synchronized.
    [  OK  ] Started Rebuild Journal Catalog.
    [  OK  ] Started Run pending postinsts.
    [  OK  ] Started Rebuild Hardware Database.
	      Starting udev Kernel Device Manager...
	      Starting Update is Completed...
    [  OK  ] Started Update is Completed.
    [  OK  ] Started udev Kernel Device Manager.
    [  OK  ] Reached target System Initialization.
	      Starting Console System Startup Logging...
    [  OK  ] Listening on RPCbind Server Activation Socket.
    [  OK  ] Listening on D-Bus System Message Bus Socket.
    [  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
    [  OK  ] Listening on dropbear.socket.
    [  OK  ] Reached target Sockets.
    [  OK  ] Reached target Basic System.
    [  OK  ] Started System Logging Service.
    [  OK  ] Started Dynamic Host Configuration Protocol (DHCP).
    [  OK  ] Started Kernel Logging Service.
	      Starting Login Service...
    [  OK  ] Started D-Bus System Message Bus.
    [  OK  ] Started Xserver startup without a display manager.
    [  OK  ] Started Daily Cleanup of Temporary Directories.
    [  OK  ] Reached target Timers.
	      Starting Telephony service...
	      Starting Network Service...
    [  OK  ] Started Console System Startup Logging.
    [  OK  ] Found device /dev/ttyPS0.
    [  OK  ] Listening on Load/Save RF �…itch Status /dev/rfkill Watch.
    [  OK  ] Started Network Service.
	      Starting Network Name Resolution...
    [  OK  ] Started Login Service.
    [  OK  ] Started Network Name Resolution.
    [  OK  ] Started Telephony service.
    [  OK  ] Reached target Network.
	      Starting Berkeley Internet Name Domain (DNS)...
	      Starting /etc/rc.local Compatibility...
	      Starting Permit User Sessions...
	      Starting Avahi mDNS/DNS-SD Stack...
    [  OK  ] Started /etc/rc.local Compatibility.
    [  OK  ] Started Permit User Sessions.
    [  OK  ] Started Getty on tty1.
    [  OK  ] Started Serial Getty on ttyPS0.
    [  OK  ] Started Avahi mDNS/DNS-SD Stack.
    [  OK  ] Started Berkeley Internet Name Domain (DNS).
    [  OK  ] Reached target Host and Network Name Lookups.

    Wind River Linux development 19.23 Update 0 xilinx-zynqmp ttyPS0

    xilinx-zynqmp login: root
    root@xilinx-zynqmp:~# uname 0a
    uname: extra operand '0a'
    Try 'uname --help' for more information.
    root@xilinx-zynqmp:~# uname -a
    Linux xilinx-zynqmp 5.2.0-rc3-yoctodev-standard #1 SMP PREEMPT Thu Jun 6
    00:53:26 UTC 2019 aarch64 aarch64 aarch64 GNU/Linux

(From OE-Core rev: b0dc58f535a27be6c649dcf336c7dc0cdb23d96b)

Signed-off-by: Zumeng Chen <zchen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 1fe28b1..aa1609c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
-SRCREV_meta ?= "31de88e51d100f2c3eefb7acb7390b0144bcfc69"
+SRCREV_meta ?= "97eac3146504a2348543b8b8859f44a7b8f0d590"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index a9c463c..603c0c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "31de88e51d100f2c3eefb7acb7390b0144bcfc69"
+SRCREV_meta ?= "97eac3146504a2348543b8b8859f44a7b8f0d590"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index da795d9..88eacc2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "31de88e51d100f2c3eefb7acb7390b0144bcfc69"
+SRCREV_meta ?= "97eac3146504a2348543b8b8859f44a7b8f0d590"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.7.4


