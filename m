Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCF577E4A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:13:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v85EDE7S003975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 5 Sep 2017 15:13:15 +0100
Message-ID: <1504620793.2175.85.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 05 Sep 2017 15:13:13 +0100
In-Reply-To: <0579b565-b8e0-9995-84d0-7a239a268e14@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
	<1504282084.2175.59.camel@linuxfoundation.org>
	<0579b565-b8e0-9995-84d0-7a239a268e14@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 05 Sep 2017 15:13:15 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] kernel-yocto: conslidated pull request
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
X-List-Received-Date: Tue, 05 Sep 2017 14:13:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Bruce,

We had a locked up qemuppc lsb image and I was able to find backtraces
from the serial console log (/home/pokybuild/yocto-autobuilder/yocto-
worker/nightly-ppc-lsb/build/build/tmp/work/qemuppc-poky-linux/core-
image-lsb/1.0-r0/target_logs/dmesg_output.log in case anyone ever needs
to find that). The log is below, this one is for the 4.9 kernel.

Failure as seen on the AB:
https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/buil
ds/1189/steps/Running%20Sanity%20Tests/logs/stdio

Not sure what it means, perhaps you can make more sense of it? :)

Cheers,

Richard



[    0.000000] Total memory = 256MB; using 512kB for hash table (at cff80000)
[    0.000000] Linux version 4.9.46-yocto-standard (oe-user@oe-host) (gcc version 7.2.0 (GCC) ) #1 PREEMPT Tue Sep 5 00:20:12 GMT 2017
[    0.000000] Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0x3124be0
[    0.000000] Mapped at 0xfdfc0000
[    0.000000] Found a Keylargo mac-io controller, rev: 0, mapped at 0xfdf40000
[    0.000000] Processor NAP mode on idle enabled.
[    0.000000] PowerMac motherboard: PowerMac G4 AGP Graphics
[    0.000000] Using PowerMac machine description
[    0.000000] bootconsole [udbg0] enabled
[    0.000000] -----------------------------------------------------
[    0.000000] Hash_size         = 0x80000
[    0.000000] phys_mem_size     = 0x10000000
[    0.000000] dcache_bsize      = 0x20
[    0.000000] icache_bsize      = 0x20
[    0.000000] cpu_features      = 0x000000000020047a
[    0.000000]   possible        = 0x0000000005a6fd7f
[    0.000000]   always          = 0x0000000000000000
[    0.000000] cpu_user_features = 0x9c000001 0x00000000
[    0.000000] mmu_features      = 0x00000001
[    0.000000] Hash              = 0xcff80000
[    0.000000] Hash_mask         = 0x1fff
[    0.000000] -----------------------------------------------------
[    0.000000] Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus number: 0->0
[    0.000000] PCI host bridge /pci@f2000000 (primary) ranges:
[    0.000000]   IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
[    0.000000]  MEM 0x0000000080000000..0x000000008fffffff -> 0x0000000080000000 
[    0.000000] Top of RAM: 0x10000000, Total RAM: 0x10000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000] On node 0 totalpages: 65536
[    0.000000] free_area_init_node: node 0, pgdat c0acf43c, node_mem_map cfd30000
[    0.000000]   DMA zone: 576 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 65536 pages, LIFO batch:15
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 64960
[    0.000000] Kernel command line: root=/dev/vda rw highres=off  mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0 console=tty console=ttyS0 console=tty1 console=ttyS0,115200n8 printk.time=1 qemurunner_pid=17112
[    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Sorting __ex_table...
[    0.000000] Memory: 247220K/262144K available (8164K kernel code, 548K rwdata, 1972K rodata, 440K init, 636K bss, 14924K reserved, 0K cma-reserved)
[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xfffdf000..0xfffff000  : fixmap
[    0.000000]   * 0xfd73b000..0xfe000000  : early ioremap
[    0.000000]   * 0xd1000000..0xfd73b000  : vmalloc & ioremap
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] 	Build-time adjustment of leaf fanout to 32.
[    0.000000] NR_IRQS:512 nr_irqs:512 16
[    0.000000] mpic: Resetting
[    0.000000] mpic: Setting up MPIC " MPIC 1   " version 1.3 at 80040000, max 1 CPUs
[    0.000000] mpic: ISU size: 48, shift: 6, mask: 3f
[    0.000000] mpic: Initializing for 48 sources
[    0.000000] time_init: decrementer frequency = 100.000000 MHz
[    0.000000] time_init: processor frequency   = 266.000000 MHz
[    0.000867] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x171024e7e0, max_idle_ns: 440795205315 ns
[    0.001204] clocksource: timebase mult[a000000] shift[24] registered
[    0.001562] clockevent: decrementer mult[1999999a] shift[32] cpu[0]
[    0.014375] Console: colour dummy device 80x25
[    0.030186] console [tty0] enabled
[    0.060271] console [ttyS0] enabled
[    0.061213] bootconsole [udbg0] disabled
[    0.062025] pid_max: default: 32768 minimum: 301
[    0.064889] Security Framework initialized
[    0.068548] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.068999] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.104116] ftrace: allocating 22145 entries in 65 pages
[    0.323145] devtmpfs: initialized
[    0.370895] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.375516] futex hash table entries: 256 (order: -1, 3072 bytes)
[    0.378532] xor: measuring software checksum speed
[    0.432575]    8regs     :   518.000 MB/sec
[    0.489299]    8regs_prefetch:   409.000 MB/sec
[    0.545544]    32regs    :   507.000 MB/sec
[    0.612729]    32regs_prefetch:   407.000 MB/sec
[    0.706286]    altivec   :  1854.000 MB/sec
[    0.706655] xor: using function: altivec (1854.000 MB/sec)
[    0.716165] NET: Registered protocol family 16
[    0.740060] PCI: Probing PCI hardware
[    0.743517] PCI host bridge to bus 0000:00
[    0.758540] pci_bus 0000:00: root bus resource [io  0x0000-0x7fffff]
[    0.758995] pci_bus 0000:00: root bus resource [mem 0x80000000-0x8fffffff]
[    0.759661] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.760273] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to ff
[    0.763081] pci 0000:00:0b.0: [106b:0020] type 00 class 0x060000
[    0.770861] pci 0000:00:0c.0: [106b:0022] type 00 class 0xff0000
[    0.773154] pci 0000:00:0c.0: reg 0x10: [mem 0x80000000-0x8007ffff]
[    0.785602] pci 0000:00:0d.0: [106b:003f] type 00 class 0x0c0310
[    0.787413] pci 0000:00:0d.0: reg 0x10: [mem 0x80080000-0x800800ff]
[    0.808536] pci 0000:00:0e.0: [1234:1111] type 00 class 0x030000
[    0.813314] pci 0000:00:0e.0: reg 0x10: [mem 0x81000000-0x81ffffff pref]
[    0.827532] pci 0000:00:0e.0: reg 0x18: [mem 0x82000000-0x82000fff]
[    0.871671] pci 0000:00:0e.0: reg 0x30: [mem 0x82010000-0x8201ffff pref]
[    0.872908] pci 0000:00:0f.0: [1af4:1000] type 00 class 0x020000
[    0.879910] pci 0000:00:0f.0: reg 0x10: [io  0x1000-0x101f]
[    0.903981] pci 0000:00:0f.0: reg 0x20: [mem 0x82020000-0x82023fff 64bit pref]
[    0.910127] pci 0000:00:0f.0: reg 0x30: [mem 0x82040000-0x8207ffff pref]
[    0.911217] pci 0000:00:10.0: [1af4:1005] type 00 class 0x00ff00
[    0.913808] pci 0000:00:10.0: reg 0x10: [io  0x1080-0x109f]
[    0.931684] pci 0000:00:10.0: reg 0x20: [mem 0x82080000-0x82083fff 64bit pref]
[    0.941231] pci 0000:00:11.0: [1af4:1001] type 00 class 0x010000
[    0.944078] pci 0000:00:11.0: reg 0x10: [io  0x1100-0x113f]
[    0.956735] pci 0000:00:11.0: reg 0x20: [mem 0x82090000-0x82093fff 64bit pref]
[    0.967289] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
[    0.974008] pci_bus 0000:00: resource 4 [io  0x0000-0x7fffff]
[    0.974081] pci_bus 0000:00: resource 5 [mem 0x80000000-0x8fffffff]
[    1.151073] raid6: altivecx1 gen()   206 MB/s
[    1.246767] raid6: altivecx2 gen()   251 MB/s
[    1.357724] raid6: altivecx4 gen()   244 MB/s
[    1.461651] raid6: altivecx8 gen()   243 MB/s
[    1.556676] raid6: int32x1  gen()   260 MB/s
[    1.651882] raid6: int32x1  xor()   195 MB/s
[    1.750660] raid6: int32x2  gen()   367 MB/s
[    1.844491] raid6: int32x2  xor()   254 MB/s
[    1.939874] raid6: int32x4  gen()   358 MB/s
[    2.038025] raid6: int32x4  xor()   280 MB/s
[    2.139667] raid6: int32x8  gen()   335 MB/s
[    2.234651] raid6: int32x8  xor()   257 MB/s
[    2.240178] raid6: using algorithm int32x2 gen() 367 MB/s
[    2.240472] raid6: .... xor() 254 MB/s, rmw enabled
[    2.240788] raid6: using intx1 recovery algorithm
[    2.260112] vgaarb: setting as boot device: PCI:0000:00:0e.0
[    2.263716] vgaarb: device added: PCI:0000:00:0e.0,decodes=io+mem,owns=io+mem,locks=none
[    2.264435] vgaarb: loaded
[    2.264643] vgaarb: bridge control possible 0000:00:0e.0
[    2.267735] usbcore: registered new interface driver usbfs
[    2.268788] usbcore: registered new interface driver hub
[    2.269605] usbcore: registered new device driver usb
[    2.288951] clocksource: Switched to clocksource timebase
[    2.687382] NET: Registered protocol family 2
[    2.717271] TCP established hash table entries: 2048 (order: 1, 8192 bytes)
[    2.727254] TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
[    2.728797] TCP: Hash tables configured (established 2048 bind 2048)
[    2.730815] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    2.731340] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    2.734473] NET: Registered protocol family 1
[    2.745334] RPC: Registered named UNIX socket transport module.
[    2.750163] RPC: Registered udp transport module.
[    2.750528] RPC: Registered tcp transport module.
[    2.750779] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    2.969523] PCI: CLS 0 bytes, default 32
[    3.007451] workingset: timestamp_bits=14 max_order=16 bucket_order=2
[    3.212146] NFS: Registering the id_resolver key type
[    3.217706] Key type id_resolver registered
[    3.221361] Key type id_legacy registered
[    3.264372] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    3.271639] io scheduler noop registered
[    3.271954] io scheduler deadline registered
[    3.273256] io scheduler cfq registered (default)
[    3.279525] Using unsupported 800x600 QEMU,VGA at 81000000, depth=32, pitch=3200
[    3.317467] Console: switching to colour frame buffer device 100x37
[    3.343240] fb0: Open Firmware frame buffer device on /pci@f2000000/QEMU,VGA@e
[    3.361666] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
[    3.480448] brd: module loaded
[    3.516275] MacIO PCI driver attached to Keylargo chipset
[    3.527452] 0.00013020:ch-a: ttyS0 at MMIO 0x80013020 (irq = 37, base_baud = 230400) is a Z85c30 ESCC - Serial port
[    3.531620] 0.00013000:ch-b: ttyS1 at MMIO 0x80013000 (irq = 36, base_baud = 230400) is a Z85c30 ESCC - Serial port
[    3.539668] Macintosh CUDA driver v0.5 for Unified ADB.
[    3.543260] Uniform Multi-Platform E-IDE driver
[    3.547029] adb: starting probe task...
[    3.644403] adb devices:
[    3.647754]  [2]: 2 1
[    3.673952]  [3]: 3 2

[    3.696968] ADB keyboard at 2, handler set to 3
[    3.711720] Detected ADB keyboard, type 
[    3.712281] ANSI.
[    3.727668] input: ADB keyboard as /devices/virtual/input/input0
[    3.750853] random: fast init done
[    3.805590] ADB mouse at 3, handler set to 2

[    3.819509] input: ADB mouse as /devices/virtual/input/input1
[    3.829063] adb: finished probe task...
[    4.588899] ide-pmac: Found Apple KeyLargo ATA-3 controller (macio), bus ID 0, irq 16
[    4.606409] Probing IDE interface ide0...
[    5.217882] ide0 at 0xd107c000-0xd107c070,0xd107c160 on irq 16
[    6.284831] ide-pmac: Found Apple KeyLargo ATA-3 controller (macio), bus ID 1, irq 18
[    6.298396] Probing IDE interface ide1...
[    6.729531] hdc: QEMU DVD-ROM, ATAPI CD/DVD-ROM drive
[    7.462162] hdc: host max PIO4 wanted PIO255(auto-tune) selected PIO0
[    7.464430] hdc: MWDMA2 mode selected
[    7.482565] ide1 at 0xd107e000-0xd107e070,0xd107e160 on irq 18
[    7.500938] ide-gd driver 1.18
[    7.535332] pcnet32: pcnet32.c:v1.35 21.Apr.2008 tsbogend@alpha.franken.de
[    7.563262] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    7.577886] ehci-pci: EHCI PCI platform driver
[    7.601267] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    7.619630] ohci-pci: OHCI PCI platform driver
[    7.641504] ohci-pci 0000:00:0d.0: OHCI PCI host controller
[    7.673481] ohci-pci 0000:00:0d.0: new USB bus registered, assigned bus number 1
[    7.694410] ohci-pci 0000:00:0d.0: irq 28, io mem 0x80080000
[    7.794076] hub 1-0:1.0: USB hub found
[    7.816895] hub 1-0:1.0: 3 ports detected
[    7.850374] uhci_hcd: USB Universal Host Controller Interface driver
[    7.878295] mousedev: PS/2 mouse device common for all mice
[    7.899615] md: linear personality registered for level -1
[    7.922860] md: raid0 personality registered for level 0
[    7.935308] md: raid1 personality registered for level 1
[    7.959702] md: raid10 personality registered for level 10
[    7.969181] md: multipath personality registered for level -4
[    7.995072] md: faulty personality registered for level -5
[    8.009341] device-mapper: ioctl: 4.35.0-ioctl (2016-06-23) initialised: dm-devel@redhat.com
[    8.046345] usbcore: registered new interface driver usbhid
[    8.075651] usbhid: USB HID core driver
[    8.095250] oprofile: using timer interrupt.
[    8.116830] u32 classifier
[    8.125570]     Actions configured
[    8.155615] NET: Registered protocol family 10
[    8.180096] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    8.205700] NET: Registered protocol family 17
[    8.233435] Key type dns_resolver registered
[    8.270133] Btrfs loaded, crc32c=crc32c-generic
[    8.301254] usb 1-1: new full-speed USB device number 2 using ohci-pci
[    8.346923] Key type encrypted registered
[    8.375761] console [netcon0] enabled
[    8.390093] netconsole: network logging started
[    8.469088] IP-Config: Complete:
[    8.490858]      device=eth0, hwaddr=52:54:00:12:34:02, ipaddr=192.168.7.2, mask=255.255.255.0, gw=192.168.7.1
[    8.519422]      host=192.168.7.2, domain=, nis-domain=(none)
[    8.538316]      bootserver=255.255.255.255, rootserver=255.255.255.255, rootpath=
[    8.623635] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:0d.0/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input2
[    8.659733] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:0d.0-1/input0
[    8.698987] md: Waiting for all devices to be available before autodetect
[    8.727947] md: If you don't use raid, use raid=noautodetect
[    8.748899] md: Autodetecting RAID arrays.
[    8.765651] md: Scanned 0 and added 0 devices.
[    8.775299] md: autorun ...
[    8.801958] md: ... autorun DONE.
[    8.835558] EXT4-fs (vda): couldn't mount as ext3 due to feature incompatibilities
[    8.850387] EXT4-fs (vda): couldn't mount as ext2 due to feature incompatibilities
[    8.944795] EXT4-fs (vda): mounted filesystem with ordered data mode. Opts: (null)
[    8.954932] VFS: Mounted root (ext4 filesystem) on device 253:0.
[    9.012302] devtmpfs: mounted
[    9.076752] Freeing unused kernel memory: 440K
[    9.102614] This architecture does not have kernel memory protection.
[   11.002792] random: crng init done
[   12.895348] udevd[109]: starting version 3.2.2
[   13.323972] udevd[110]: starting eudev-3.2.2
[   28.159641] EXT4-fs (vda): re-mounted. Opts: (null)
[   80.754157] bluetoothd[670]: unhandled signal 11 at 6c69627b nip 0fcd584c lr 0fcd5838 code 30001
[   82.498226] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[   83.191010] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
[   83.209140] NFSD: starting 90-second grace period (net c0ac4728)
[ 2519.362967] INFO: rcu_preempt self-detected stall on CPU
[ 2519.458273] 	0-...: (5250 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2519.474546] 	 (t=5250 jiffies g=84874 c=84873 q=53)
[ 2519.505200] rcu_preempt kthread starved for 5250 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x1
[ 2519.546178] rcu_preempt     S    0     7      2 0x00000800
[ 2519.569370] Call Trace:
[ 2519.599529] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2519.635843] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2519.668939] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2519.699436] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2519.723081] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2519.757931] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2519.792981] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2519.826252] Task dump for CPU 0:
[ 2519.853483] swapper         R  running task        0     0      0 0x00000004
[ 2519.878159] Call Trace:
[ 2519.903614] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2519.931710] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2519.953862] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2519.984461] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2520.015786] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2520.044767] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2520.066807] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2520.096014] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2520.125893] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2520.160139] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2520.172316] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2520.186787] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2520.205192] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2520.214268] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2520.234343] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2520.249673] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2520.280207] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2520.308617] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2520.324354] [c0ad7ff0] [00003444] 0x3444
[ 2520.630597] INFO: rcu_preempt self-detected stall on CPU
[ 2520.642865] 	0-...: (21003 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2520.680345] 	 (t=21003 jiffies g=84874 c=84873 q=53)
[ 2520.715456] rcu_preempt kthread starved for 21003 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2520.764111] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2520.802127] Call Trace:
[ 2520.828157] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2520.846921] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2520.878049] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2520.904027] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2520.923271] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2520.949466] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2520.974980] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2520.995655] Task dump for CPU 0:
[ 2521.023548] swapper         R  running task        0     0      0 0x00000004
[ 2521.052711] Call Trace:
[ 2521.065930] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2521.096878] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2521.129535] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2521.153729] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2521.188698] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2521.217713] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2521.248336] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2521.270873] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2521.294181] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2521.308470] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2521.323820] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2521.333677] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2521.341010] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2521.353510] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2521.361561] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2521.381920] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2521.396954] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2521.414661] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2521.424721] [c0ad7ff0] [00003444] 0x3444
[ 2521.650119] INFO: rcu_preempt self-detected stall on CPU
[ 2521.670362] 	0-...: (36756 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2521.678747] 	 (t=36756 jiffies g=84874 c=84873 q=53)
[ 2521.707581] rcu_preempt kthread starved for 36756 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2521.735371] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2521.758377] Call Trace:
[ 2521.775049] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2521.789210] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2521.806969] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2521.815905] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2521.834388] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2521.849359] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2521.865141] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2521.881569] Task dump for CPU 0:
[ 2521.888965] swapper         R  running task        0     0      0 0x00000004
[ 2521.901408] Call Trace:
[ 2521.919245] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2521.937061] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2521.960005] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2521.979566] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2521.999974] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2522.018596] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2522.040927] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2522.058008] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2522.077173] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2522.096068] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2522.117197] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2522.125497] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2522.145855] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2522.160565] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2522.168640] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2522.201140] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2522.209944] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2522.218286] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2522.231826] [c0ad7ff0] [00003444] 0x3444
[ 2522.441421] INFO: rcu_preempt self-detected stall on CPU
[ 2522.464415] 	0-...: (52509 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2522.472445] 	 (t=52509 jiffies g=84874 c=84873 q=53)
[ 2522.489583] rcu_preempt kthread starved for 52509 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2522.505859] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2522.525531] Call Trace:
[ 2522.538913] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2522.551944] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2522.561387] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2522.570462] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2522.583787] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2522.601972] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2522.624230] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2522.641417] Task dump for CPU 0:
[ 2522.653978] swapper         R  running task        0     0      0 0x00000004
[ 2522.668508] Call Trace:
[ 2522.680780] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2522.694855] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2522.703821] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2522.719408] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2522.728043] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2522.748308] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2522.759501] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2522.772773] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2522.781213] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2522.806102] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2522.814316] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2522.829109] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2522.837047] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2522.850730] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2522.858394] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2522.892819] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2522.925100] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2522.956808] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2522.990500] [c0ad7ff0] [00003444] 0x3444
[ 2523.257071] INFO: rcu_preempt self-detected stall on CPU
[ 2523.276484] 	0-...: (68262 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2523.305298] 	 (t=68262 jiffies g=84874 c=84873 q=53)
[ 2523.322579] rcu_preempt kthread starved for 68262 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2523.359300] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2523.388241] Call Trace:
[ 2523.396544] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2523.410444] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2523.432059] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2523.446323] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2523.458810] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2523.476223] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2523.484875] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2523.499569] Task dump for CPU 0:
[ 2523.514355] swapper         R  running task        0     0      0 0x00000004
[ 2523.522838] Call Trace:
[ 2523.541521] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2523.553802] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2523.567107] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2523.592341] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2523.600879] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2523.623160] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2523.635156] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2523.657877] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2523.673547] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2523.694602] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2523.719862] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2523.728446] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2523.758495] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2523.766373] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2523.784484] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2523.805626] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2523.819352] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2523.835884] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2523.849914] [c0ad7ff0] [00003444] 0x3444
[ 2524.111485] INFO: rcu_preempt self-detected stall on CPU
[ 2524.129183] 	0-...: (84015 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2524.138878] 	 (t=84015 jiffies g=84874 c=84873 q=53)
[ 2524.162350] rcu_preempt kthread starved for 84015 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2524.197885] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2524.241858] Call Trace:
[ 2524.266465] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2524.285810] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2524.315556] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2524.342249] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2524.367516] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2524.386166] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2524.408919] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2524.439783] Task dump for CPU 0:
[ 2524.461764] swapper         R  running task        0     0      0 0x00000004
[ 2524.477239] Call Trace:
[ 2524.501798] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2524.542536] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2524.579243] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2524.613205] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2524.646312] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2524.667801] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2524.698779] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2524.728287] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2524.735969] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2524.756576] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2524.769777] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2524.777342] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2524.784810] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2524.798566] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2524.806066] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2524.826492] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2524.841045] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2524.852950] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2524.889695] [c0ad7ff0] [00003444] 0x3444
[ 2525.107610] INFO: rcu_preempt self-detected stall on CPU
[ 2525.128900] 	0-...: (99768 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2525.148960] 	 (t=99768 jiffies g=84874 c=84873 q=53)
[ 2525.168350] rcu_preempt kthread starved for 99768 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2525.198464] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2525.219203] Call Trace:
[ 2525.225550] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2525.237420] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2525.262647] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2525.282699] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2525.296637] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2525.307627] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2525.323336] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2525.339458] Task dump for CPU 0:
[ 2525.347600] swapper         R  running task        0     0      0 0x00000004
[ 2525.361613] Call Trace:
[ 2525.373252] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2525.386345] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2525.394520] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2525.411600] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2525.421429] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2525.437678] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2525.447791] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2525.455604] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2525.473499] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2525.492909] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2525.507993] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2525.522387] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2525.530560] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2525.544621] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2525.561456] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2525.585436] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2525.600882] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2525.608840] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2525.621369] [c0ad7ff0] [00003444] 0x3444
[ 2525.914617] INFO: rcu_preempt self-detected stall on CPU
[ 2525.936783] 	0-...: (115521 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2525.969488] 	 (t=115521 jiffies g=84874 c=84873 q=53)
[ 2525.999453] rcu_preempt kthread starved for 115521 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2526.036243] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2526.065961] Call Trace:
[ 2526.079568] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2526.110141] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2526.145682] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2526.166969] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2526.201463] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2526.234407] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2526.264631] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2526.295299] Task dump for CPU 0:
[ 2526.310434] swapper         R  running task        0     0      0 0x00000004
[ 2526.344170] Call Trace:
[ 2526.359761] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2526.394540] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2526.428176] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2526.462701] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2526.502646] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2526.535507] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2526.559743] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2526.592592] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2526.621050] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2526.658876] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2526.679539] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2526.695154] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2526.703675] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2526.718919] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2526.736756] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2526.769278] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2526.791669] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2526.825242] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2526.855811] [c0ad7ff0] [00003444] 0x3444
[ 2527.169031] INFO: rcu_preempt self-detected stall on CPU
[ 2527.192803] 	0-...: (131274 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2527.226446] 	 (t=131274 jiffies g=84874 c=84873 q=53)
[ 2527.259538] rcu_preempt kthread starved for 131274 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2527.302568] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2527.339126] Call Trace:
[ 2527.353606] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2527.390878] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2527.428458] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2527.448592] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2527.481498] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2527.513975] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2527.552475] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2527.570898] Task dump for CPU 0:
[ 2527.600691] swapper         R  running task        0     0      0 0x00000004
[ 2527.632358] Call Trace:
[ 2527.646232] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2527.677062] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2527.707781] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2527.728064] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2527.745596] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2527.757999] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2527.772554] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2527.782789] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2527.796885] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2527.816761] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2527.835809] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2527.843742] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2527.859959] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2527.867446] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2527.880319] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2527.908304] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2527.921470] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2527.936299] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2527.953244] [c0ad7ff0] [00003444] 0x3444
[ 2528.257487] INFO: rcu_preempt self-detected stall on CPU
[ 2528.275620] 	0-...: (147027 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2528.283571] 	 (t=147027 jiffies g=84874 c=84873 q=53)
[ 2528.291621] rcu_preempt kthread starved for 147027 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2528.319123] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2528.336659] Call Trace:
[ 2528.351187] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2528.359772] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2528.371848] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2528.384171] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2528.395311] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2528.403561] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2528.416507] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2528.432921] Task dump for CPU 0:
[ 2528.440117] swapper         R  running task        0     0      0 0x00000004
[ 2528.457810] Call Trace:
[ 2528.470962] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2528.486293] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2528.507972] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2528.515754] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2528.535182] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2528.545537] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2528.558596] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2528.565733] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2528.584616] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2528.599784] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2528.624461] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2528.637932] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2528.649534] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2528.660291] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2528.676930] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2528.708595] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2528.720024] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2528.736317] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2528.755405] [c0ad7ff0] [00003444] 0x3444
[ 2529.015338] INFO: rcu_preempt self-detected stall on CPU
[ 2529.038255] 	0-...: (162780 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2529.058346] 	 (t=162780 jiffies g=84874 c=84873 q=53)
[ 2529.075268] rcu_preempt kthread starved for 162780 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2529.103535] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2529.115675] Call Trace:
[ 2529.138955] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2529.150605] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2529.181898] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2529.193412] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2529.220487] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2529.252047] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2529.273128] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2529.305069] Task dump for CPU 0:
[ 2529.332280] swapper         R  running task        0     0      0 0x00000004
[ 2529.356791] Call Trace:
[ 2529.380548] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2529.411811] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2529.433189] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2529.446876] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2529.454786] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2529.488007] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2529.518769] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2529.541993] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2529.574187] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2529.618986] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2529.640526] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2529.648083] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2529.664110] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2529.678845] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2529.686867] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2529.710635] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2529.725363] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2529.759801] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2529.796653] [c0ad7ff0] [00003444] 0x3444
[ 2530.116354] INFO: rcu_preempt self-detected stall on CPU
[ 2530.133710] 	0-...: (178533 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2530.143753] 	 (t=178533 jiffies g=84874 c=84873 q=53)
[ 2530.163665] rcu_preempt kthread starved for 178533 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2530.181959] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2530.190116] Call Trace:
[ 2530.201038] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2530.212812] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2530.225676] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2530.239465] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2530.247115] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2530.259440] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2530.281232] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2530.298775] Task dump for CPU 0:
[ 2530.318156] swapper         R  running task        0     0      0 0x00000004
[ 2530.326954] Call Trace:
[ 2530.340661] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2530.358341] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2530.371708] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2530.384260] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2530.394474] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2530.402289] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2530.419579] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2530.434750] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2530.450684] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2530.483728] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2530.506582] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2530.536758] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2530.556750] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2530.592280] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2530.617012] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2530.644207] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2530.654646] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2530.663028] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2530.688666] [c0ad7ff0] [00003444] 0x3444
[ 2531.013674] INFO: rcu_preempt self-detected stall on CPU
[ 2531.027363] 	0-...: (194286 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2531.037624] 	 (t=194286 jiffies g=84874 c=84873 q=53)
[ 2531.047267] rcu_preempt kthread starved for 194286 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2531.072135] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2531.083806] Call Trace:
[ 2531.093576] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2531.105771] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2531.120681] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2531.133393] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2531.147597] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2531.159951] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2531.172739] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2531.200601] Task dump for CPU 0:
[ 2531.216548] swapper         R  running task        0     0      0 0x00000004
[ 2531.230100] Call Trace:
[ 2531.249336] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2531.268922] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2531.287880] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2531.310234] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2531.331946] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2531.349628] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2531.371115] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2531.389271] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2531.409999] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2531.436113] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2531.449696] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2531.461933] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2531.474184] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2531.486646] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2531.494524] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2531.515130] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2531.532345] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2531.543987] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2531.573438] [c0ad7ff0] [00003444] 0x3444
[ 2531.836746] INFO: rcu_preempt self-detected stall on CPU
[ 2531.852968] 	0-...: (210039 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2531.860860] 	 (t=210039 jiffies g=84874 c=84873 q=53)
[ 2531.887095] rcu_preempt kthread starved for 210039 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2531.909295] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2531.940888] Call Trace:
[ 2531.959686] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2531.994629] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2532.004461] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2532.020619] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2532.030474] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2532.045757] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2532.060897] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2532.075143] Task dump for CPU 0:
[ 2532.088050] swapper         R  running task        0     0      0 0x00000004
[ 2532.105019] Call Trace:
[ 2532.114150] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2532.128494] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2532.160723] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2532.184851] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2532.207407] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2532.224837] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2532.260705] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2532.282864] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2532.302674] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2532.325954] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2532.350791] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2532.372823] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2532.380553] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2532.395722] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2532.412315] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2532.426931] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2532.454993] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2532.472456] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2532.495456] [c0ad7ff0] [00003444] 0x3444
[ 2532.725581] INFO: rcu_preempt self-detected stall on CPU
[ 2532.738187] 	0-...: (225792 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2532.749810] 	 (t=225792 jiffies g=84874 c=84873 q=53)
[ 2532.757036] rcu_preempt kthread starved for 225792 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2532.775936] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2532.794782] Call Trace:
[ 2532.802628] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2532.810697] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2532.827624] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2532.842307] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2532.850119] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2532.863431] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2532.870920] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2532.883644] Task dump for CPU 0:
[ 2532.903822] swapper         R  running task        0     0      0 0x00000004
[ 2532.918481] Call Trace:
[ 2532.941341] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2532.963033] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2532.981115] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2533.004725] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2533.018495] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2533.033120] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2533.055486] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2533.082978] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2533.111277] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2533.146550] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2533.177387] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2533.193048] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2533.213204] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2533.233285] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2533.251316] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2533.294707] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2533.302462] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2533.320246] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2533.334036] [c0ad7ff0] [00003444] 0x3444
[ 2533.616880] INFO: rcu_preempt self-detected stall on CPU
[ 2533.631495] 	0-...: (241545 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2533.642014] 	 (t=241545 jiffies g=84874 c=84873 q=53)
[ 2533.649548] rcu_preempt kthread starved for 241545 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2533.674804] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2533.694140] Call Trace:
[ 2533.713326] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2533.729362] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2533.744931] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2533.752692] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2533.765309] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2533.773010] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2533.791180] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2533.799680] Task dump for CPU 0:
[ 2533.824490] swapper         R  running task        0     0      0 0x00000004
[ 2533.832484] Call Trace:
[ 2533.846127] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2533.864181] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2533.872620] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2533.880612] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2533.902207] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2533.909916] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2533.925726] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2533.942666] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2533.955926] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2533.978994] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2533.993495] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2534.007815] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2534.014860] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2534.027120] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2534.043145] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2534.063194] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2534.077901] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2534.085431] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2534.097901] [c0ad7ff0] [00003444] 0x3444
[ 2534.342372] INFO: rcu_preempt self-detected stall on CPU
[ 2534.356272] 	0-...: (257298 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2534.364177] 	 (t=257298 jiffies g=84874 c=84873 q=53)
[ 2534.373931] rcu_preempt kthread starved for 257298 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2534.398853] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2534.409561] Call Trace:
[ 2534.420177] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2534.432668] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2534.440424] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2534.453942] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2534.463563] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2534.471046] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2534.482540] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2534.490014] Task dump for CPU 0:
[ 2534.503245] swapper         R  running task        0     0      0 0x00000004
[ 2534.510651] Call Trace:
[ 2534.521955] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2534.534737] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2534.545810] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2534.557191] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2534.574563] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2534.596608] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2534.611763] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2534.626817] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2534.635711] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2534.660228] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2534.668068] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2534.687100] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2534.694289] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2534.701349] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2534.714106] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2534.736693] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2534.745608] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2534.753989] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2534.768622] [c0ad7ff0] [00003444] 0x3444
[ 2535.005544] INFO: rcu_preempt self-detected stall on CPU
[ 2535.021776] 	0-...: (273051 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2535.029516] 	 (t=273051 jiffies g=84874 c=84873 q=53)
[ 2535.043423] rcu_preempt kthread starved for 273051 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2535.064464] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2535.081389] Call Trace:
[ 2535.095413] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2535.102987] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2535.118654] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2535.140548] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2535.173372] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2535.181244] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2535.193016] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2535.200466] Task dump for CPU 0:
[ 2535.216645] swapper         R  running task        0     0      0 0x00000004
[ 2535.223621] Call Trace:
[ 2535.235489] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2535.251428] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2535.259428] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2535.273882] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2535.295415] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2535.312193] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2535.335539] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2535.355441] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2535.377468] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2535.407577] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2535.418629] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2535.427405] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2535.450101] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2535.457633] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2535.475954] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2535.494682] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2535.506455] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2535.520149] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2535.527655] [c0ad7ff0] [00003444] 0x3444
[ 2535.736312] INFO: rcu_preempt self-detected stall on CPU
[ 2535.754797] 	0-...: (288804 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2535.783182] 	 (t=288804 jiffies g=84874 c=84873 q=53)
[ 2535.801856] rcu_preempt kthread starved for 288804 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2535.834694] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2535.863692] Call Trace:
[ 2535.871343] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2535.902066] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2535.928956] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2535.946558] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2535.975256] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2536.002108] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2536.019470] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2536.048279] Task dump for CPU 0:
[ 2536.061819] swapper         R  running task        0     0      0 0x00000004
[ 2536.093707] Call Trace:
[ 2536.115952] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2536.136392] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2536.163809] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2536.181976] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2536.209206] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2536.238044] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2536.257000] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2536.264903] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2536.277222] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2536.296838] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2536.311834] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2536.321607] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2536.330484] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2536.358375] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2536.387598] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2536.424400] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2536.446027] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2536.473234] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2536.503378] [c0ad7ff0] [00003444] 0x3444
[ 2536.837171] INFO: rcu_preempt self-detected stall on CPU
[ 2536.870838] 	0-...: (304557 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2536.890682] 	 (t=304557 jiffies g=84874 c=84873 q=53)
[ 2536.917435] rcu_preempt kthread starved for 304557 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2536.953631] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2536.983784] Call Trace:
[ 2536.997546] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2537.027683] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2537.047520] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2537.070607] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2537.078040] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2537.107279] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2537.126489] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2537.150249] Task dump for CPU 0:
[ 2537.164004] swapper         R  running task        0     0      0 0x00000004
[ 2537.193634] Call Trace:
[ 2537.214328] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2537.235216] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2537.263687] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2537.291642] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2537.312050] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2537.339939] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2537.357990] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2537.370597] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2537.379076] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2537.418564] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2537.432048] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2537.440312] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2537.451660] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2537.458951] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2537.488746] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2537.503498] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2537.528453] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2537.546996] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2537.567576] [c0ad7ff0] [00003444] 0x3444
[ 2537.860086] INFO: rcu_preempt self-detected stall on CPU
[ 2537.882016] 	0-...: (320310 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2537.911366] 	 (t=320310 jiffies g=84874 c=84873 q=53)
[ 2537.940073] rcu_preempt kthread starved for 320310 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2537.978949] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2538.001826] Call Trace:
[ 2538.029738] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2538.070722] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2538.100205] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2538.128827] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2538.150252] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2538.178587] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2538.208109] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2538.243430] Task dump for CPU 0:
[ 2538.260763] swapper         R  running task        0     0      0 0x00000004
[ 2538.295255] Call Trace:
[ 2538.319326] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2538.353329] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2538.365422] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2538.388785] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2538.407878] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2538.436512] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2538.463303] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2538.485313] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2538.520096] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2538.551696] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2538.564070] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2538.587497] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2538.595562] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2538.620194] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2538.631853] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2538.663556] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2538.678921] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2538.687238] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2538.706436] [c0ad7ff0] [00003444] 0x3444
[ 2538.951213] INFO: rcu_preempt self-detected stall on CPU
[ 2538.960442] 	0-...: (336063 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2538.968171] 	 (t=336063 jiffies g=84874 c=84873 q=53)
[ 2538.975724] rcu_preempt kthread starved for 336063 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2538.990561] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2539.004898] Call Trace:
[ 2539.014382] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2539.033396] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2539.042215] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2539.051097] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2539.060116] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2539.079468] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2539.088440] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2539.098476] Task dump for CPU 0:
[ 2539.117168] swapper         R  running task        0     0      0 0x00000004
[ 2539.127044] Call Trace:
[ 2539.135466] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2539.154839] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2539.170320] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2539.194940] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2539.208877] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2539.230751] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2539.239349] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2539.256826] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2539.280717] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2539.324003] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2539.340321] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2539.356428] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2539.372904] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2539.389709] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2539.403558] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2539.440241] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2539.470266] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2539.498239] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2539.518479] [c0ad7ff0] [00003444] 0x3444
[ 2539.760533] INFO: rcu_preempt self-detected stall on CPU
[ 2539.778809] 	0-...: (351816 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2539.798089] 	 (t=351816 jiffies g=84874 c=84873 q=53)
[ 2539.815592] rcu_preempt kthread starved for 351816 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2539.850189] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2539.883634] Call Trace:
[ 2539.896572] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2539.927581] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2539.957673] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2539.976327] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2540.004235] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2540.032012] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2540.049489] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2540.080698] Task dump for CPU 0:
[ 2540.103505] swapper         R  running task        0     0      0 0x00000004
[ 2540.119580] Call Trace:
[ 2540.128604] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2540.144756] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2540.152782] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2540.172105] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2540.188729] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2540.196671] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2540.218673] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2540.236930] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2540.263564] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2540.298205] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2540.328478] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2540.347617] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2540.368475] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2540.376351] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2540.383423] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2540.407878] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2540.436648] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2540.457147] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2540.484954] [c0ad7ff0] [00003444] 0x3444
[ 2540.760162] INFO: rcu_preempt self-detected stall on CPU
[ 2540.780333] 	0-...: (367569 ticks this GP) idle=7c3/2/0 softirq=119072/119072 fqs=0 
[ 2540.809632] 	 (t=367569 jiffies g=84874 c=84873 q=53)
[ 2540.839013] rcu_preempt kthread starved for 367569 jiffies! g84874 c84873 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x0
[ 2540.876893] rcu_preempt     R  running task        0     7      2 0x00000800
[ 2540.907570] Call Trace:
[ 2540.922399] [cf8bfcf0] [84000242] 0x84000242 (unreliable)
[ 2540.954627] [cf8bfdb0] [c07ea7c0] __schedule+0x2c4/0x83c
[ 2540.985532] [cf8bfe10] [c07ead78] schedule+0x40/0xb0
[ 2541.005708] [cf8bfe20] [c07ee728] schedule_timeout+0xa4/0x340
[ 2541.038839] [cf8bfe90] [c008d49c] rcu_gp_kthread+0x638/0xae8
[ 2541.074001] [cf8bfef0] [c0058038] kthread+0xf8/0xfc
[ 2541.104041] [cf8bff40] [c001337c] ret_from_kernel_thread+0x5c/0x64
[ 2541.125933] Task dump for CPU 0:
[ 2541.151605] swapper         R  running task        0     0      0 0x00000004
[ 2541.185891] Call Trace:
[ 2541.199601] [cff73da0] [c07f37b4] rcu_dump_cpu_stacks+0xbc/0x100 (unreliable)
[ 2541.233668] [cff73dc0] [c008e2f8] rcu_check_callbacks+0x5d8/0xa04
[ 2541.264656] [cff73e30] [c0094a40] update_process_times+0x40/0x74
[ 2541.296985] [cff73e40] [c00a7a80] tick_periodic+0xfc/0x124
[ 2541.330215] [cff73e50] [c00a7b78] tick_handle_periodic+0xd0/0x124
[ 2541.352252] [cff73e80] [c000ceac] __timer_interrupt+0xe0/0x310
[ 2541.378795] [cff73ea0] [c000d30c] timer_interrupt+0x84/0xf8
[ 2541.409014] [cff73ec0] [c001396c] ret_from_except+0x0/0x14
[ 2541.430389] --- interrupt: 901 at __do_softirq+0xf4/0x394
                   LR = __do_softirq+0xe0/0x394
[ 2541.470313] [cff73f80] [c07f290c] __do_softirq+0x9c/0x394 (unreliable)
[ 2541.500407] [cff73fe0] [c0039080] irq_exit+0xc8/0xd0
[ 2541.529840] [cff73ff0] [c0010f8c] call_do_irq+0x24/0x3c
[ 2541.559954] [c0ad7e90] [c00074b4] do_IRQ+0xb0/0x164
[ 2541.583389] [c0ad7ec0] [c001396c] ret_from_except+0x0/0x14
[ 2541.612771] --- interrupt: 501 at arch_cpu_idle+0x30/0x78
                   LR = arch_cpu_idle+0x30/0x78
[ 2541.656442] [c0ad7f80] [c07eb158] schedule_preempt_disabled+0x2c/0x3c (unreliable)
[ 2541.681584] [c0ad7f90] [c0070ff4] cpu_startup_entry+0xd4/0x170
[ 2541.707980] [c0ad7fb0] [c09ed0fc] start_kernel+0x380/0x3ac
[ 2541.720637] [c0ad7ff0] [00003444] 0x3444

